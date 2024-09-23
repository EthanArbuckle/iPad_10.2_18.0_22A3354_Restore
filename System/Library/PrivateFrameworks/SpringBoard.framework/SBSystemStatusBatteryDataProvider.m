@implementation SBSystemStatusBatteryDataProvider

- (SBSystemStatusBatteryDataProvider)init
{
  SBSystemStatusBatteryDataProvider *v2;
  id v3;
  void *v4;
  uint64_t v5;
  STBatteryStatusDomainPublisher *batteryDataPublisher;
  BCBatteryDeviceController *v7;
  BCBatteryDeviceController *batteryDeviceController;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBSystemStatusBatteryDataProvider;
  v2 = -[SBSystemStatusBatteryDataProvider init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0DB08A0]);
    objc_msgSend((id)SBApp, "systemStatusServer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithServerHandle:", v4);
    batteryDataPublisher = v2->_batteryDataPublisher;
    v2->_batteryDataPublisher = (STBatteryStatusDomainPublisher *)v5;

    v7 = (BCBatteryDeviceController *)objc_alloc_init(MEMORY[0x1E0D01B20]);
    batteryDeviceController = v2->_batteryDeviceController;
    v2->_batteryDeviceController = v7;

    -[BCBatteryDeviceController addBatteryDeviceObserver:queue:](v2->_batteryDeviceController, "addBatteryDeviceObserver:queue:", v2, MEMORY[0x1E0C80D38]);
    -[SBSystemStatusBatteryDataProvider _registerForNotifications](v2, "_registerForNotifications");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[SBSystemStatusBatteryDataProvider invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBSystemStatusBatteryDataProvider;
  -[SBSystemStatusBatteryDataProvider dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  void *v3;

  -[STBatteryStatusDomainPublisher invalidate](self->_batteryDataPublisher, "invalidate");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[BCBatteryDeviceController removeBatteryDeviceObserver:](self->_batteryDeviceController, "removeBatteryDeviceObserver:", self);
}

- (void)connectedDevicesDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8), "isInternal"))
          -[SBSystemStatusBatteryDataProvider _updateData](self, "_updateData");
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_registerForNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateData, CFSTR("SBBootCompleteNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateData, CFSTR("SBCurrentLocaleDidChangeNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateData, CFSTR("SBBatterySaverModeDidChangeNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__noteNotChargingStatusChanged, CFSTR("SBUIBatteryNotChargingStatusChangedNotification"), 0);

}

- (void)_updateData
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  -[BCBatteryDeviceController sb_deviceInternalBattery](self->_batteryDeviceController, "sb_deviceInternalBattery");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SBSystemStatusBatteryDataProvider batteryDataPublisher](self, "batteryDataPublisher");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __48__SBSystemStatusBatteryDataProvider__updateData__block_invoke;
    v5[3] = &unk_1E8EAA680;
    v5[4] = self;
    v6 = v4;
    objc_msgSend(v3, "updateDataWithBlock:", v5);

  }
}

void __48__SBSystemStatusBatteryDataProvider__updateData__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "shouldExposeNotChargingState");
  v6 = objc_msgSend((id)SBApp, "isBatterySaverModeActive");
  v7 = objc_msgSend(*(id *)(a1 + 40), "percentCharge");
  if (v7 <= 1)
    v8 = 1;
  else
    v8 = v7;
  if ((objc_msgSend(*(id *)(a1 + 40), "isCharging") & 1) == 0)
  {
    v11 = objc_msgSend(*(id *)(a1 + 40), "powerSourceState");
    v12 = 2;
    if (v5)
      v12 = 0;
    if (v11 == 2)
      v9 = v12;
    else
      v9 = 0;
    if (!v5)
      goto LABEL_6;
LABEL_13:
    v10 = 2;
    UIStatusBarLocalizedNotChargingString();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v9 = 1;
  if (v5)
    goto LABEL_13;
LABEL_6:
  objc_msgSend(MEMORY[0x1E0D01B18], "localizedBatteryDetailTextForBatteryLevel:", (double)v8);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v10 = 1;
LABEL_14:
  objc_msgSend(v4, "setChargingState:", v9);
  objc_msgSend(v4, "setPercentCharge:", v8);
  objc_msgSend(v4, "setBatterySaverModeActive:", v6);
  objc_msgSend(v4, "setChargingDescription:", v13);
  objc_msgSend(v4, "setChargingDescriptionType:", v10);

}

- (void)_noteNotChargingStatusChanged
{
  double v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (-[SBSystemStatusBatteryDataProvider _isInNotChargingState](self, "_isInNotChargingState"))
    v3 = 0.6;
  else
    v3 = 0.0;
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__updateShouldExposeNotChargingState, 0);
  v5[0] = *MEMORY[0x1E0C99860];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemStatusBatteryDataProvider performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel__updateShouldExposeNotChargingState, 0, v4, v3);

}

- (void)_updateShouldExposeNotChargingState
{
  _BOOL8 v3;

  v3 = -[SBSystemStatusBatteryDataProvider _isInNotChargingState](self, "_isInNotChargingState");
  if (v3 != -[SBSystemStatusBatteryDataProvider shouldExposeNotChargingState](self, "shouldExposeNotChargingState"))
  {
    -[SBSystemStatusBatteryDataProvider setShouldExposeNotChargingState:](self, "setShouldExposeNotChargingState:", v3);
    -[SBSystemStatusBatteryDataProvider _updateData](self, "_updateData");
  }
}

- (BOOL)_isInNotChargingState
{
  void *v2;
  int v3;
  char v4;
  int v5;
  void *v6;
  void *v7;

  v3 = __sb__runningInSpringBoard();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "userInterfaceIdiom") != 1)
    {
      LOBYTE(v5) = 0;
      goto LABEL_10;
    }
LABEL_5:
    +[SBUIController sharedInstance](SBUIController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isConnectedToChargeIncapablePowerSource"))
    {
      +[SBUIController sharedInstance](SBUIController, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "isFullyCharged") ^ 1;

      if ((v4 & 1) != 0)
        return v5;
    }
    else
    {

      LOBYTE(v5) = 0;
      if ((v4 & 1) != 0)
        return v5;
    }
LABEL_10:

    return v5;
  }
  if (SBFEffectiveDeviceClass() == 2)
    goto LABEL_5;
  LOBYTE(v5) = 0;
  return v5;
}

- (STBatteryStatusDomainPublisher)batteryDataPublisher
{
  return self->_batteryDataPublisher;
}

- (BCBatteryDeviceController)batteryDeviceController
{
  return self->_batteryDeviceController;
}

- (BOOL)shouldExposeNotChargingState
{
  return self->_shouldExposeNotChargingState;
}

- (void)setShouldExposeNotChargingState:(BOOL)a3
{
  self->_shouldExposeNotChargingState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryDeviceController, 0);
  objc_storeStrong((id *)&self->_batteryDataPublisher, 0);
}

@end
