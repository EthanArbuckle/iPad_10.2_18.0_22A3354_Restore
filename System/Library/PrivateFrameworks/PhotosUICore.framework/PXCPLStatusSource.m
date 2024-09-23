@implementation PXCPLStatusSource

- (PXCPLStatusSource)initWithStatus:(id)a3
{
  id v6;
  PXCPLStatusSource *v7;
  PXCPLStatusSource *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCPLStatusSource.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("status"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PXCPLStatusSource;
  v7 = -[PXCPLStatusSource init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_status, a3);
    -[CPLStatus setDelegate:](v8->_status, "setDelegate:", v8);
    -[PXCPLStatusSource _updateStatus](v8, "_updateStatus");
  }

  return v8;
}

- (void)setExitDate:(id)a3
{
  NSDate *v4;
  char v5;
  NSDate *v6;
  NSDate *exitDate;
  NSDate *v8;

  v8 = (NSDate *)a3;
  v4 = self->_exitDate;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSDate isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSDate *)-[NSDate copy](v8, "copy");
      exitDate = self->_exitDate;
      self->_exitDate = v6;

      -[PXCPLStatusSource signalChange:](self, "signalChange:", 1);
    }
  }

}

- (void)setSyncDate:(id)a3
{
  NSDate *v4;
  char v5;
  NSDate *v6;
  NSDate *syncDate;
  NSDate *v8;

  v8 = (NSDate *)a3;
  v4 = self->_syncDate;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSDate isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSDate *)-[NSDate copy](v8, "copy");
      syncDate = self->_syncDate;
      self->_syncDate = v6;

      -[PXCPLStatusSource signalChange:](self, "signalChange:", 2);
    }
  }

}

- (void)setIsExceedingQuota:(BOOL)a3
{
  if (self->_isExceedingQuota != a3)
  {
    self->_isExceedingQuota = a3;
    -[PXCPLStatusSource signalChange:](self, "signalChange:", 4);
  }
}

- (void)setIsExceedingSharedLibraryQuota:(BOOL)a3
{
  if (self->_isExceedingSharedLibraryQuota != a3)
  {
    self->_isExceedingSharedLibraryQuota = a3;
    -[PXCPLStatusSource signalChange:](self, "signalChange:", 8);
  }
}

- (void)setIsClientVersionTooOld:(BOOL)a3
{
  if (self->_isClientVersionTooOld != a3)
  {
    self->_isClientVersionTooOld = a3;
    -[PXCPLStatusSource signalChange:](self, "signalChange:", 16);
  }
}

- (void)setIsClientNotAuthenticated:(BOOL)a3
{
  if (self->_isClientNotAuthenticated != a3)
  {
    self->_isClientNotAuthenticated = a3;
    -[PXCPLStatusSource signalChange:](self, "signalChange:", 32);
  }
}

- (void)setIsExceedingBatteryQuota:(BOOL)a3
{
  if (self->_isExceedingBatteryQuota != a3)
  {
    self->_isExceedingBatteryQuota = a3;
    -[PXCPLStatusSource signalChange:](self, "signalChange:", 64);
  }
}

- (void)setIsExceedingCellularQuota:(BOOL)a3
{
  if (self->_isExceedingCellularQuota != a3)
  {
    self->_isExceedingCellularQuota = a3;
    -[PXCPLStatusSource signalChange:](self, "signalChange:", 128);
  }
}

- (void)setIsCellularDataDisabled:(BOOL)a3
{
  if (self->_isCellularDataDisabled != a3)
  {
    self->_isCellularDataDisabled = a3;
    -[PXCPLStatusSource signalChange:](self, "signalChange:", 256);
  }
}

- (void)setIsInAirplaneMode:(BOOL)a3
{
  if (self->_isInAirplaneMode != a3)
  {
    self->_isInAirplaneMode = a3;
    -[PXCPLStatusSource signalChange:](self, "signalChange:", 512);
  }
}

- (void)setIsOffline:(BOOL)a3
{
  if (self->_isOffline != a3)
  {
    self->_isOffline = a3;
    -[PXCPLStatusSource signalChange:](self, "signalChange:", 1024);
  }
}

- (void)setIsInLowDataMode:(BOOL)a3
{
  if (self->_isInLowDataMode != a3)
  {
    self->_isInLowDataMode = a3;
    -[PXCPLStatusSource signalChange:](self, "signalChange:", 2048);
  }
}

- (void)setIsInLowPowerMode:(BOOL)a3
{
  if (self->_isInLowPowerMode != a3)
  {
    self->_isInLowPowerMode = a3;
    -[PXCPLStatusSource signalChange:](self, "signalChange:", 4096);
  }
}

- (void)setIsLowDiskSpace:(BOOL)a3
{
  if (self->_isLowDiskSpace != a3)
  {
    self->_isLowDiskSpace = a3;
    -[PXCPLStatusSource signalChange:](self, "signalChange:", 0x2000);
  }
}

- (void)setIsVeryLowDiskSpace:(BOOL)a3
{
  if (self->_isVeryLowDiskSpace != a3)
  {
    self->_isVeryLowDiskSpace = a3;
    -[PXCPLStatusSource signalChange:](self, "signalChange:", 0x4000);
  }
}

- (void)setSharedLibraryExitingWithNumberOfAssetsRemaining:(unint64_t)a3
{
  if (self->_sharedLibraryExitingWithNumberOfAssetsRemaining != a3)
  {
    self->_sharedLibraryExitingWithNumberOfAssetsRemaining = a3;
    -[PXCPLStatusSource signalChange:](self, "signalChange:", 0x8000);
  }
}

- (void)setIsCapturingSnapshot:(BOOL)a3
{
  if (self->_isCapturingSnapshot != a3)
  {
    self->_isCapturingSnapshot = a3;
    -[PXCPLStatusSource signalChange:](self, "signalChange:", 0x10000);
  }
}

- (void)setIsOptimizingSystemPerformance:(BOOL)a3
{
  if (self->_isOptimizingSystemPerformance != a3)
  {
    self->_isOptimizingSystemPerformance = a3;
    -[PXCPLStatusSource signalChange:](self, "signalChange:", 0x20000);
  }
}

- (void)setIsInPoorNetworkConnection:(BOOL)a3
{
  if (self->_isInPoorNetworkConnection != a3)
  {
    self->_isInPoorNetworkConnection = a3;
    -[PXCPLStatusSource signalChange:](self, "signalChange:", 0x40000);
  }
}

- (void)setIsInModerateThermalPressure:(BOOL)a3
{
  if (self->_isInModerateThermalPressure != a3)
  {
    self->_isInModerateThermalPressure = a3;
    -[PXCPLStatusSource signalChange:](self, "signalChange:", 0x80000);
  }
}

- (void)setIsInHeavyThermalPressure:(BOOL)a3
{
  if (self->_isInHeavyThermalPressure != a3)
  {
    self->_isInHeavyThermalPressure = a3;
    -[PXCPLStatusSource signalChange:](self, "signalChange:", 0x100000);
  }
}

- (void)setIsInLowBattery:(BOOL)a3
{
  if (self->_isInLowBattery != a3)
  {
    self->_isInLowBattery = a3;
    -[PXCPLStatusSource signalChange:](self, "signalChange:", 0x200000);
  }
}

- (void)setIsUpgradeSuggestedToAccessAllPhotos:(BOOL)a3
{
  if (self->_isUpgradeSuggestedToAccessAllPhotos != a3)
  {
    self->_isUpgradeSuggestedToAccessAllPhotos = a3;
    -[PXCPLStatusSource signalChange:](self, "signalChange:", 0x400000);
  }
}

- (void)setNumberOfPhotoAssets:(unint64_t)a3
{
  if (self->_numberOfPhotoAssets != a3)
  {
    self->_numberOfPhotoAssets = a3;
    -[PXCPLStatusSource signalChange:](self, "signalChange:", 0x800000);
  }
}

- (void)setNumberOfVideoAssets:(unint64_t)a3
{
  if (self->_numberOfVideoAssets != a3)
  {
    self->_numberOfVideoAssets = a3;
    -[PXCPLStatusSource signalChange:](self, "signalChange:", 0x1000000);
  }
}

- (void)setNumberOfOtherAssets:(unint64_t)a3
{
  if (self->_numberOfOtherAssets != a3)
  {
    self->_numberOfOtherAssets = a3;
    -[PXCPLStatusSource signalChange:](self, "signalChange:", 0x2000000);
  }
}

- (void)_updateStatus
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __34__PXCPLStatusSource__updateStatus__block_invoke;
  v2[3] = &unk_1E5117860;
  v2[4] = self;
  -[PXCPLStatusSource performChanges:](self, "performChanges:", v2);
}

- (void)statusDidChange:(id)a3
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__PXCPLStatusSource_statusDidChange___block_invoke;
  v3[3] = &unk_1E5148D30;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (NSDate)exitDate
{
  return self->_exitDate;
}

- (NSDate)syncDate
{
  return self->_syncDate;
}

- (BOOL)isExceedingQuota
{
  return self->_isExceedingQuota;
}

- (BOOL)isExceedingSharedLibraryQuota
{
  return self->_isExceedingSharedLibraryQuota;
}

- (BOOL)isClientVersionTooOld
{
  return self->_isClientVersionTooOld;
}

- (BOOL)isClientNotAuthenticated
{
  return self->_isClientNotAuthenticated;
}

- (BOOL)isExceedingBatteryQuota
{
  return self->_isExceedingBatteryQuota;
}

- (BOOL)isExceedingCellularQuota
{
  return self->_isExceedingCellularQuota;
}

- (BOOL)isCellularDataDisabled
{
  return self->_isCellularDataDisabled;
}

- (BOOL)isInAirplaneMode
{
  return self->_isInAirplaneMode;
}

- (BOOL)isOffline
{
  return self->_isOffline;
}

- (BOOL)isInLowDataMode
{
  return self->_isInLowDataMode;
}

- (BOOL)isInLowPowerMode
{
  return self->_isInLowPowerMode;
}

- (BOOL)isLowDiskSpace
{
  return self->_isLowDiskSpace;
}

- (BOOL)isVeryLowDiskSpace
{
  return self->_isVeryLowDiskSpace;
}

- (unint64_t)sharedLibraryExitingWithNumberOfAssetsRemaining
{
  return self->_sharedLibraryExitingWithNumberOfAssetsRemaining;
}

- (BOOL)isCapturingSnapshot
{
  return self->_isCapturingSnapshot;
}

- (BOOL)isOptimizingSystemPerformance
{
  return self->_isOptimizingSystemPerformance;
}

- (BOOL)isInPoorNetworkConnection
{
  return self->_isInPoorNetworkConnection;
}

- (BOOL)isInModerateThermalPressure
{
  return self->_isInModerateThermalPressure;
}

- (BOOL)isInHeavyThermalPressure
{
  return self->_isInHeavyThermalPressure;
}

- (BOOL)isInLowBattery
{
  return self->_isInLowBattery;
}

- (BOOL)isUpgradeSuggestedToAccessAllPhotos
{
  return self->_isUpgradeSuggestedToAccessAllPhotos;
}

- (unint64_t)numberOfPhotoAssets
{
  return self->_numberOfPhotoAssets;
}

- (unint64_t)numberOfVideoAssets
{
  return self->_numberOfVideoAssets;
}

- (unint64_t)numberOfOtherAssets
{
  return self->_numberOfOtherAssets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncDate, 0);
  objc_storeStrong((id *)&self->_exitDate, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

void __37__PXCPLStatusSource_statusDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateStatus");

}

void __34__PXCPLStatusSource__updateStatus__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[7];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "exitDeleteTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExitDate:", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "initialSyncDate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "lastSuccessfulSyncDate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "initialSyncDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "lastSuccessfulSyncDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "laterDate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSyncDate:", v10);

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "initialSyncDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSyncDate:", v8);
  }

  v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "isExceedingQuota");
  v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "isExceedingSharedLibraryQuota");
  objc_msgSend(v3, "setIsExceedingQuota:", v11 & (v12 ^ 1));
  objc_msgSend(v3, "setIsExceedingSharedLibraryQuota:", v12);
  objc_msgSend(v3, "setIsClientVersionTooOld:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "iCloudLibraryClientVersionTooOld"));
  objc_msgSend(v3, "setIsClientNotAuthenticated:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "iCloudLibraryClientIsNotAuthenticated"));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "hasValidSystemBudget"))
  {
    objc_msgSend(v3, "setIsExceedingBatteryQuota:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "hasBatteryBudget") ^ 1);
    v13 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "hasCellularBudget") ^ 1;
  }
  else
  {
    objc_msgSend(v3, "setIsExceedingBatteryQuota:", 0);
    v13 = 0;
  }
  objc_msgSend(v3, "setIsExceedingCellularQuota:", v13);
  objc_msgSend(v3, "setIsCellularDataDisabled:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "isCellularRestricted"));
  objc_msgSend(v3, "setIsInAirplaneMode:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "isInAirplaneMode"));
  objc_msgSend(v3, "setIsOffline:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "isConnectedToNetwork") ^ 1);
  objc_msgSend(v3, "setIsInLowDataMode:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "isConstrainedNetwork"));
  objc_msgSend(v3, "setIsInLowPowerMode:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "isBlockedByLowPowerMode"));
  objc_msgSend(v3, "setIsLowDiskSpace:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "lowDiskSpace"));
  objc_msgSend(v3, "setIsVeryLowDiskSpace:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "veryLowDiskSpace"));
  objc_msgSend(v3, "setSharedLibraryExitingWithNumberOfAssetsRemaining:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "estimatedCountOfRemainingRecordsDuringSharedLibraryExit"));
  objc_msgSend(v3, "setIsCapturingSnapshot:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "isBlockedBySnapshot"));
  objc_msgSend(v3, "setIsOptimizingSystemPerformance:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "hasHeavyResourceUsage") | objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "hasPoorSystemConditions"));
  objc_msgSend(v3, "setIsInPoorNetworkConnection:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "hasPoorNetworkQuality"));
  objc_msgSend(v3, "setIsInModerateThermalPressure:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "hasModerateThermalPressure"));
  objc_msgSend(v3, "setIsInHeavyThermalPressure:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "hasThermalPressure"));
  objc_msgSend(v3, "setIsInLowBattery:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "hasLowBatteryLevel"));
  objc_msgSend(v3, "setIsUpgradeSuggestedToAccessAllPhotos:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "clientFeatureCompatibleVersion") < objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "serverFeatureCompatibleVersion"));
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "cloudAssetCountPerType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __34__PXCPLStatusSource__updateStatus__block_invoke_2;
  v15[3] = &unk_1E5117838;
  v15[4] = &v24;
  v15[5] = &v20;
  v15[6] = &v16;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v15);
  objc_msgSend(v3, "setNumberOfPhotoAssets:", v25[3]);
  objc_msgSend(v3, "setNumberOfVideoAssets:", v21[3]);
  objc_msgSend(v3, "setNumberOfOtherAssets:", v17[3]);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

}

void __34__PXCPLStatusSource__updateStatus__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;

  v11 = a2;
  v5 = objc_msgSend(a3, "unsignedIntegerValue");
  objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v11, "isEqualToString:", v6);

  if (v7)
  {
    v8 = a1 + 32;
  }
  else
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC568], "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "isEqualToString:", v9);

    if (v10)
      v8 = a1 + 40;
    else
      v8 = a1 + 48;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v8 + 8) + 24) += v5;

}

@end
