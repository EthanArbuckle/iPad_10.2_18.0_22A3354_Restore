@implementation PSUIMiscOptionsGroup

- (PSUIMiscOptionsGroup)initWithHostController:(id)a3 cellularManagementCache:(id)a4 carrierSpaceManager:(id)a5 dataCache:(id)a6 carrierBundleCache:(id)a7 backupManagerWrapper:(id)a8 callHistoryManager:(id)a9 appleAccountStore:(id)a10 resetStatisticsDelegate:(id)a11
{
  id v17;
  id v18;
  PSUIMiscOptionsGroup *v19;
  PSUIMiscOptionsGroup *v20;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id obj;
  objc_super v29;

  obj = a3;
  v27 = a4;
  v26 = a5;
  v25 = a6;
  v24 = a7;
  v23 = a8;
  v22 = a9;
  v17 = a10;
  v18 = a11;
  v29.receiver = self;
  v29.super_class = (Class)PSUIMiscOptionsGroup;
  v19 = -[PSUIMiscOptionsGroup init](&v29, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_hostController, obj);
    objc_storeStrong((id *)&v20->_managementCache, a4);
    objc_storeStrong((id *)&v20->_carrierSpaceManager, a5);
    objc_storeStrong((id *)&v20->_dataCache, a6);
    objc_storeStrong((id *)&v20->_carrierBundleCache, a7);
    objc_storeStrong((id *)&v20->_backupManagerWrapper, a8);
    objc_storeStrong((id *)&v20->_callHistoryManager, a9);
    objc_storeStrong((id *)&v20->_accountStore, a10);
    objc_storeWeak((id *)&v20->_resetStatisticsDelegate, v18);
  }

  return v20;
}

- (id)specifiers
{
  id v3;
  void *v4;
  id v5;
  id WeakRetained;
  PSUICloudDriveCellularSwitchSpecifier *v7;
  void *v8;
  void *v9;
  PSUICloudBackupCellularSwitchSpecifier *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  PSUICallTimeGroup *callTimeGroup;
  PSUICallTimeGroup *v20;
  id v21;
  PSUICallTimeGroup *v22;
  PSUICallTimeGroup *v23;
  PSUIResetStatisticsGroup *resetStatisticsGroup;
  PSUIResetStatisticsGroup *v25;
  PSUICoreTelephonyDataCache *dataCache;
  CHManager *callHistoryManager;
  id v28;
  PSUIResetStatisticsGroup *v29;
  PSUIResetStatisticsGroup *v30;
  void *v31;
  _DWORD v33[2];
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (+[PSUIWiFiAssistSwitchSpecifier shouldShowWifiAssist:](PSUIWiFiAssistSwitchSpecifier, "shouldShowWifiAssist:", self->_carrierBundleCache))
  {
    +[PSUIWiFiAssistSwitchSpecifier wifiAssistGroupSpecifier](PSUIWiFiAssistSwitchSpecifier, "wifiAssistGroupSpecifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

    v5 = -[PSUIWiFiAssistSwitchSpecifier initDefault]([PSUIWiFiAssistSwitchSpecifier alloc], "initDefault");
    WeakRetained = objc_loadWeakRetained((id *)&self->_billingPeriodSource);
    objc_msgSend(v5, "setBillingPeriodSource:", WeakRetained);

    objc_msgSend(v3, "addObject:", v5);
  }
  v7 = -[PSUICloudDriveCellularSwitchSpecifier initWithAppleAccountStore:]([PSUICloudDriveCellularSwitchSpecifier alloc], "initWithAppleAccountStore:", self->_accountStore);
  if (-[PSUICloudDriveCellularSwitchSpecifier shouldShowCloudDrive](v7, "shouldShowCloudDrive"))
  {
    -[PSUICloudDriveCellularSwitchSpecifier cloudDriveGroupSpecifier](v7, "cloudDriveGroupSpecifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PSCellularManagementCache isGlobalDataModificationRestricted](self->_managementCache, "isGlobalDataModificationRestricted") ^ 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICloudDriveCellularSwitchSpecifier setProperty:forKey:](v7, "setProperty:forKey:", v9, *MEMORY[0x24BE75A18]);

    objc_msgSend(v3, "addObject:", v7);
  }
  v10 = -[PSUICloudBackupCellularSwitchSpecifier initWithAppleAccountStore:backupManagerWrapper:]([PSUICloudBackupCellularSwitchSpecifier alloc], "initWithAppleAccountStore:backupManagerWrapper:", self->_accountStore, self->_backupManagerWrapper);
  if (-[PSUICloudBackupCellularSwitchSpecifier shouldShowCloudBackupCarrier](v10, "shouldShowCloudBackupCarrier"))
  {
    -[PSUICloudBackupCellularSwitchSpecifier cloudBackupGroupSpecifier](v10, "cloudBackupGroupSpecifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

    objc_msgSend(v3, "addObject:", v10);
  }
  -[PSUICarrierSpaceManager capabilities](self->_carrierSpaceManager, "capabilities");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "supportsUsage"))
  {

    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "sf_isiPad");

  if ((v14 & 1) != 0)
  {
LABEL_10:
    -[PSUIMiscOptionsGroup getLogger](self, "getLogger");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[PSUICarrierSpaceManager capabilities](self->_carrierSpaceManager, "capabilities");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "supportsUsage");
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = 67109376;
      v33[1] = v17;
      v34 = 1024;
      v35 = objc_msgSend(v18, "sf_isiPad");
      _os_log_impl(&dword_2161C6000, v15, OS_LOG_TYPE_DEFAULT, "Not adding call time group because it isn't supported (%d) or we're an iPad (%d)", (uint8_t *)v33, 0xEu);

    }
    goto LABEL_15;
  }
  callTimeGroup = self->_callTimeGroup;
  if (!callTimeGroup)
  {
    v20 = [PSUICallTimeGroup alloc];
    v21 = objc_loadWeakRetained((id *)&self->_hostController);
    v22 = -[PSUICallTimeGroup initWithListController:](v20, "initWithListController:", v21);
    v23 = self->_callTimeGroup;
    self->_callTimeGroup = v22;

    callTimeGroup = self->_callTimeGroup;
  }
  -[PSUICallTimeGroup specifiers](callTimeGroup, "specifiers");
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v15);
LABEL_15:

  resetStatisticsGroup = self->_resetStatisticsGroup;
  if (!resetStatisticsGroup)
  {
    v25 = [PSUIResetStatisticsGroup alloc];
    dataCache = self->_dataCache;
    callHistoryManager = self->_callHistoryManager;
    v28 = objc_loadWeakRetained((id *)&self->_resetStatisticsDelegate);
    v29 = -[PSUIResetStatisticsGroup initWithDataCache:callHistoryManager:delegate:](v25, "initWithDataCache:callHistoryManager:delegate:", dataCache, callHistoryManager, v28);
    v30 = self->_resetStatisticsGroup;
    self->_resetStatisticsGroup = v29;

    resetStatisticsGroup = self->_resetStatisticsGroup;
  }
  -[PSUIResetStatisticsGroup specifiers](resetStatisticsGroup, "specifiers");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v31);

  return v3;
}

- (void)setBillingPeriodSource:(id)a3
{
  objc_storeWeak((id *)&self->_billingPeriodSource, a3);
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("PSUIMiscOptionsGroup"));
}

- (PSListController)hostController
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_hostController);
}

- (void)setHostController:(id)a3
{
  objc_storeWeak((id *)&self->_hostController, a3);
}

- (PSCellularManagementCache)managementCache
{
  return self->_managementCache;
}

- (void)setManagementCache:(id)a3
{
  objc_storeStrong((id *)&self->_managementCache, a3);
}

- (PSUICarrierSpaceManager)carrierSpaceManager
{
  return self->_carrierSpaceManager;
}

- (void)setCarrierSpaceManager:(id)a3
{
  objc_storeStrong((id *)&self->_carrierSpaceManager, a3);
}

- (PSUICallTimeGroup)callTimeGroup
{
  return self->_callTimeGroup;
}

- (void)setCallTimeGroup:(id)a3
{
  objc_storeStrong((id *)&self->_callTimeGroup, a3);
}

- (PSUIResetStatisticsGroup)resetStatisticsGroup
{
  return self->_resetStatisticsGroup;
}

- (void)setResetStatisticsGroup:(id)a3
{
  objc_storeStrong((id *)&self->_resetStatisticsGroup, a3);
}

- (PSUICoreTelephonyDataCache)dataCache
{
  return self->_dataCache;
}

- (void)setDataCache:(id)a3
{
  objc_storeStrong((id *)&self->_dataCache, a3);
}

- (PSUICoreTelephonyCarrierBundleCache)carrierBundleCache
{
  return self->_carrierBundleCache;
}

- (void)setCarrierBundleCache:(id)a3
{
  objc_storeStrong((id *)&self->_carrierBundleCache, a3);
}

- (PSUIMBManagerWrapper)backupManagerWrapper
{
  return self->_backupManagerWrapper;
}

- (void)setBackupManagerWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_backupManagerWrapper, a3);
}

- (CHManager)callHistoryManager
{
  return self->_callHistoryManager;
}

- (void)setCallHistoryManager:(id)a3
{
  objc_storeStrong((id *)&self->_callHistoryManager, a3);
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (PSUIResetStatisticsGroupDelegate)resetStatisticsDelegate
{
  return (PSUIResetStatisticsGroupDelegate *)objc_loadWeakRetained((id *)&self->_resetStatisticsDelegate);
}

- (void)setResetStatisticsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_resetStatisticsDelegate, a3);
}

- (PSBillingPeriodSource)billingPeriodSource
{
  return (PSBillingPeriodSource *)objc_loadWeakRetained((id *)&self->_billingPeriodSource);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_billingPeriodSource);
  objc_destroyWeak((id *)&self->_resetStatisticsDelegate);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_callHistoryManager, 0);
  objc_storeStrong((id *)&self->_backupManagerWrapper, 0);
  objc_storeStrong((id *)&self->_carrierBundleCache, 0);
  objc_storeStrong((id *)&self->_dataCache, 0);
  objc_storeStrong((id *)&self->_resetStatisticsGroup, 0);
  objc_storeStrong((id *)&self->_callTimeGroup, 0);
  objc_storeStrong((id *)&self->_carrierSpaceManager, 0);
  objc_storeStrong((id *)&self->_managementCache, 0);
  objc_destroyWeak((id *)&self->_hostController);
}

@end
