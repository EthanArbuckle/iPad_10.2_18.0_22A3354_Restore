@implementation SBLowPowerAlertItem

+ (void)setBatteryLevel:(unsigned int)a3
{
  uint64_t v3;
  unsigned int v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  SBLowPowerAlertItem *v19;
  id v20;
  SBLowPowerAlertItem *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, char);
  void *v37;
  SBLowPowerAlertItem *v38;
  BOOL v39;

  v3 = *(_QWORD *)&a3;
  if ((objc_msgSend(a1, "_shouldIgnoreChangeToBatteryLevel:") & 1) == 0)
  {
    v5 = objc_msgSend(a1, "_thresholdForLevel:", v3);
    v6 = __LastWarnThreshold;
    +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
    {
      objc_msgSend(v7, "alertItemsOfClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 && objc_msgSend(v8, "count"))
      {
        objc_msgSend(v8, "allObjects");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_opt_class();
        v12 = v10;
        if (v11)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v13 = v12;
          else
            v13 = 0;
        }
        else
        {
          v13 = 0;
        }
        v28 = v13;

        objc_msgSend(v28, "_existingSystemApertureElement");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = objc_opt_class();
        v31 = v29;
        if (v30)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v32 = v31;
          else
            v32 = 0;
        }
        else
        {
          v32 = 0;
        }
        v33 = v32;

        objc_msgSend(v33, "setBatteryPercentage:", (double)v3 / 100.0);
      }

      goto LABEL_29;
    }
    objc_msgSend(v7, "deactivateAlertItemsOfClass:", objc_opt_class());

    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "powerDefaults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "hideLowPowerAlerts");

    if (v5 <= 1 && v5 < __LastWarnThreshold)
    {
      if (__LastBatteryLevel == 100)
      {
        +[SBUIController sharedInstance](SBUIController, "sharedInstance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isBatteryCharging");

        if (((v18 | v16) & 1) != 0)
          goto LABEL_29;
LABEL_15:
        v19 = -[SBLowPowerAlertItem initWithLevel:]([SBLowPowerAlertItem alloc], "initWithLevel:", __WarnLevelThresholds[v5]);
        v20 = objc_alloc_init(MEMORY[0x1E0D898D8]);
        -[SBLowPowerAlertItem setBeaconManager:](v19, "setBeaconManager:", v20);
        v34 = MEMORY[0x1E0C809B0];
        v35 = 3221225472;
        v36 = __39__SBLowPowerAlertItem_setBatteryLevel___block_invoke;
        v37 = &unk_1E8EA52B0;
        v39 = v5 == 0;
        v21 = v19;
        v38 = v21;
        objc_msgSend(v20, "userHasAcknowledgeFindMyWithCompletion:", &v34);
        +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance", v34, v35, v36, v37);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "activateAlertItem:", v21);

        if (!v5)
        {
          +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "inCall");

          if (v24)
            AudioServicesPlaySystemSoundWithCompletion(0x3EEu, 0);
        }
        +[SBModelessSyncController sharedInstance](SBModelessSyncController, "sharedInstance");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "isSyncing");

        if (v26)
        {
          +[SBModelessSyncController sharedInstance](SBModelessSyncController, "sharedInstance");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "gotLowBatteryWarning");

        }
        goto LABEL_29;
      }
      if ((v16 & 1) == 0)
        goto LABEL_15;
    }
LABEL_29:
    __LastBatteryLevel = v3;
    __LastWarnThreshold = v5;
  }
}

+ (unsigned)_thresholdForLevel:(unsigned int)a3
{
  unsigned int result;

  result = 2;
  do
  {
    if (__WarnLevelThresholds[result - 1] < a3)
      break;
    --result;
  }
  while (result);
  return result;
}

+ (BOOL)_shouldIgnoreChangeToBatteryLevel:(unsigned int)a3
{
  void *v4;
  int v5;
  unsigned int v6;
  BOOL v7;
  void *v8;
  char v9;
  BOOL v11;
  unsigned int v12;

  +[SBUIController sharedInstance](SBUIController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isBatteryCharging");
  v6 = __LastBatteryLevel;

  if (v5)
    v7 = v6 > a3;
  else
    v7 = 0;
  if (v7)
  {
    v11 = __LastBatteryLevel - a3 >= 3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasGasGauge");

    if ((v9 & 1) != 0)
      return 0;
    v12 = __LastBatteryLevel - a3;
    if ((int)(__LastBatteryLevel - a3) < 0)
      v12 = a3 - __LastBatteryLevel;
    v11 = v12 >= 2;
  }
  return !v11;
}

- (SBLowPowerAlertItem)init
{
  SBLowPowerAlertItem *v2;
  SBLowPowerAlertItem *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBLowPowerAlertItem;
  v2 = -[SBAlertItem init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SBAlertItem setAllowInSetup:](v2, "setAllowInSetup:", 1);
    -[SBAlertItem setAllowInCar:](v3, "setAllowInCar:", 1);
    -[SBAlertItem setAllowMessageInCar:](v3, "setAllowMessageInCar:", 0);
  }
  return v3;
}

- (SBLowPowerAlertItem)initWithLevel:(unsigned int)a3
{
  SBLowPowerAlertItem *v4;
  SBLowPowerAlertItem *v5;

  v4 = -[SBLowPowerAlertItem init](self, "init");
  v5 = v4;
  if (v4)
  {
    v4->_talkLevel = a3;
    -[SBLowPowerAlertItem setShowFindMyAlert:](v4, "setShowFindMyAlert:", 0);
  }
  return v5;
}

+ (void)initialize
{
  uint64_t v2;
  unint64_t v3;

  v2 = objc_msgSend(MEMORY[0x1E0CEA9E8], "lowBatteryLevel");
  if (v2 >= 0)
    v3 = v2;
  else
    v3 = v2 + 1;
  __WarnLevelThresholds[0] = v3 >> 1;
  *(_DWORD *)algn_1ED930384 = v2;
}

void __39__SBLowPowerAlertItem_setBatteryLevel___block_invoke(uint64_t a1, char a2)
{
  char v2;
  _QWORD v3[4];
  id v4;
  char v5;

  if (*(_BYTE *)(a1 + 40))
    v2 = a2 ^ 1;
  else
    v2 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__SBLowPowerAlertItem_setBatteryLevel___block_invoke_2;
  v3[3] = &unk_1E8E9F508;
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __39__SBLowPowerAlertItem_setBatteryLevel___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBeaconManager:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setShowFindMyAlert:", *(unsigned __int8 *)(a1 + 40));
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  int v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  _QWORD v32[5];

  -[SBAlertItem alertController](self, "alertController", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLowPowerAlertItem _lowBatteryTitle](self, "_lowBatteryTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v7);

  -[SBLowPowerAlertItem _batteryPercentageString](self, "_batteryPercentageString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("LOW_BATT_MSG_LEVEL"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBModelessSyncController sharedInstance](SBModelessSyncController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isSyncing"))
  {
    if (objc_msgSend(v13, "isWirelessSyncing"))
    {
      if (objc_msgSend(v13, "isAutoSyncing"))
        v14 = CFSTR("AUTO_%@_SYNC_LOW_POWER");
      else
        v14 = CFSTR("%@_SYNC_LOW_POWER");
    }
    else
    {
      v14 = CFSTR("SYNC_LOW_POWER");
    }
    v15 = MGGetBoolAnswer();
    v16 = CFSTR("WIFI");
    if (v15)
      v16 = CFSTR("WLAN");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v14, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", v17, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingFormat:", CFSTR(" %@"), v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v20;
  }
  objc_msgSend(v6, "setMessage:", v12);
  if (!a3)
  {
    v21 = -[SBLowPowerAlertItem _supportsLowPowerMode](self, "_supportsLowPowerMode");
    v22 = MEMORY[0x1E0C809B0];
    if (v21 && !-[SBLowPowerAlertItem _isLowPowerModeEnabled](self, "_isLowPowerModeEnabled"))
    {
      v24 = (void *)MEMORY[0x1E0CEA2E0];
      -[SBLowPowerAlertItem _enableLowPowerModeActionTitle](self, "_enableLowPowerModeActionTitle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v22;
      v32[1] = 3221225472;
      v32[2] = __59__SBLowPowerAlertItem_configure_requirePasscodeForActions___block_invoke;
      v32[3] = &unk_1E8E9DCB0;
      v32[4] = self;
      objc_msgSend(v24, "actionWithTitle:style:handler:", v25, 0, v32);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addAction:", v26);

      v23 = 1;
    }
    else
    {
      v23 = 0;
    }
    -[SBLowPowerAlertItem setHasEnableLowPowerModeAction:](self, "setHasEnableLowPowerModeAction:", v23);
    v27 = (void *)MEMORY[0x1E0CEA2E0];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("CLOSE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v22;
    v31[1] = 3221225472;
    v31[2] = __59__SBLowPowerAlertItem_configure_requirePasscodeForActions___block_invoke_2;
    v31[3] = &unk_1E8E9DCB0;
    v31[4] = self;
    objc_msgSend(v27, "actionWithTitle:style:handler:", v29, v23, v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v30);

  }
}

uint64_t __59__SBLowPowerAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enableLowPowerModeActionTriggered");
}

uint64_t __59__SBLowPowerAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
  return objc_msgSend(*(id *)(a1 + 32), "_didDeactivateForDismissAction");
}

- (void)didDeactivateForReason:(int)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBLowPowerAlertItem;
  -[SBAlertItem didDeactivateForReason:](&v5, sel_didDeactivateForReason_);
  if (a3 != 3)
    -[SBLowPowerAlertItem _didDeactivateForDismissAction](self, "_didDeactivateForDismissAction");
}

- (id)_createSystemApertureElement
{
  _BOOL8 v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  SBPowerAlertElement *v8;
  unint64_t v9;
  SBPowerAlertElement *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  v3 = -[SBLowPowerAlertItem _isLowPowerModeEnabled](self, "_isLowPowerModeEnabled");
  v4 = -[SBLowPowerAlertItem _supportsLowPowerMode](self, "_supportsLowPowerMode") & !v3;
  if ((_DWORD)v4 == 1)
  {
    objc_initWeak(&location, self);
    v5 = (void *)MEMORY[0x1E0CEA2A8];
    -[SBLowPowerAlertItem _enableLowPowerModeActionTitle](self, "_enableLowPowerModeActionTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __51__SBLowPowerAlertItem__createSystemApertureElement__block_invoke;
    v15 = &unk_1E8EA3C88;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v6, 0, 0, &v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    v7 = 0;
  }
  -[SBLowPowerAlertItem setHasEnableLowPowerModeAction:](self, "setHasEnableLowPowerModeAction:", v4, v12, v13, v14, v15);
  v8 = [SBPowerAlertElement alloc];
  LODWORD(v9) = self->_talkLevel;
  v10 = -[SBPowerAlertElement initWithIdentifier:style:batteryPercentage:lowPowerModeEnabled:action:](v8, "initWithIdentifier:style:batteryPercentage:lowPowerModeEnabled:action:", self, 1, v3, v7, (double)v9 / 100.0);

  return v10;
}

void __51__SBLowPowerAlertItem__createSystemApertureElement__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_enableLowPowerModeActionTriggered");

}

- (void)_enableLowPowerModeActionTriggered
{
  ADClientAddValueForScalarKey();
  -[SBLowPowerAlertItem _enableLowPowerMode](self, "_enableLowPowerMode");
  -[SBAlertItem deactivateForButton](self, "deactivateForButton");
  if (-[SBLowPowerAlertItem showFindMyAlert](self, "showFindMyAlert"))
    +[SBLowPowerFindMyAlertItem showFindMyAlert](SBLowPowerFindMyAlertItem, "showFindMyAlert");
}

- (void)_didDeactivateForDismissAction
{
  if (-[SBLowPowerAlertItem hasEnableLowPowerModeAction](self, "hasEnableLowPowerModeAction"))
    ADClientAddValueForScalarKey();
  if (-[SBLowPowerAlertItem showFindMyAlert](self, "showFindMyAlert"))
    +[SBLowPowerFindMyAlertItem showFindMyAlert](SBLowPowerFindMyAlertItem, "showFindMyAlert");
}

- (void)_enableLowPowerMode
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  uint8_t buf[16];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__14;
  v11 = __Block_byref_object_dispose__14;
  objc_msgSend(MEMORY[0x1E0D44738], "sharedInstance");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  SBLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "Enabling low power mode", buf, 2u);
  }

  v3 = (void *)v8[5];
  v4 = *MEMORY[0x1E0D44748];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__SBLowPowerAlertItem__enableLowPowerMode__block_invoke;
  v5[3] = &unk_1E8EA52D8;
  v5[4] = &v7;
  objc_msgSend(v3, "setPowerMode:fromSource:withCompletion:", 1, v4, v5);
  _Block_object_dispose(&v7, 8);

}

void __42__SBLowPowerAlertItem__enableLowPowerMode__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SBLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109378;
    v9[1] = a2;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "Switch to LPM complete. Success=%d error: %@", (uint8_t *)v9, 0x12u);
  }

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

}

- (BOOL)shouldShowInLockScreen
{
  void *v2;
  char v3;

  objc_msgSend((id)SBApp, "notificationDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCarDestinationActive");

  return v3;
}

- (BOOL)shouldShowInEmergencyCall
{
  return 1;
}

- (id)_lowBatteryTitle
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  objc_msgSend((id)SBApp, "notificationDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCarDestinationActive");

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("PHONE_LOW_BATT_TITLE");
  else
    v6 = CFSTR("LOW_BATT_TITLE");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_batteryPercentageString
{
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)SBApp;
  LODWORD(v2) = self->_talkLevel;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v2 / 100.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formattedPercentStringForNumber:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_supportsLowPowerMode
{
  return MGGetBoolAnswer();
}

- (BOOL)_isLowPowerModeEnabled
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0D44738], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getPowerMode") == 1;

  return v3;
}

- (id)_enableLowPowerModeActionTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ENABLE_LOW_POWER"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)showFindMyAlert
{
  return self->_showFindMyAlert;
}

- (void)setShowFindMyAlert:(BOOL)a3
{
  self->_showFindMyAlert = a3;
}

- (BOOL)hasEnableLowPowerModeAction
{
  return self->_hasEnableLowPowerModeAction;
}

- (void)setHasEnableLowPowerModeAction:(BOOL)a3
{
  self->_hasEnableLowPowerModeAction = a3;
}

- (SPBeaconManager)beaconManager
{
  return self->_beaconManager;
}

- (void)setBeaconManager:(id)a3
{
  objc_storeStrong((id *)&self->_beaconManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beaconManager, 0);
}

@end
