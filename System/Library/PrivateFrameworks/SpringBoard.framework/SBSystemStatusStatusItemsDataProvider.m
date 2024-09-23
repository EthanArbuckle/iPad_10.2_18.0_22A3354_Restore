@implementation SBSystemStatusStatusItemsDataProvider

- (SBSystemStatusStatusItemsDataProvider)initWithMainDisplayWindowScene:(id)a3
{
  id v5;
  SBSystemStatusStatusItemsDataProvider *v6;
  void *v7;
  uint64_t Serial;
  OS_dispatch_queue *publishingQueue;
  uint64_t v10;
  STStatusItemsStatusDomainPublisher *statusItemsPublisher;
  uint64_t v12;
  STTelephonyStatusDomain *telephonyStatusDomain;
  uint64_t v14;
  STWifiStatusDomain *wifiStatusDomain;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  STActivityAttribution *attribution;
  void *v22;
  SBSystemStatusStatusItemsDataProvider *v23;
  objc_super v24[2];
  objc_super v25;

  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SBSystemStatusStatusItemsDataProvider;
  v6 = -[SBSystemStatusStatusItemsDataProvider init](&v25, sel_init);
  if (v6)
  {
    objc_msgSend((id)SBApp, "systemStatusServer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SBSystemStatusStatusItemsDataProvider.m"), 55, CFSTR("don't initialize %@ before the server handle exists!"), objc_opt_class());

    }
    Serial = BSDispatchQueueCreateSerial();
    publishingQueue = v6->_publishingQueue;
    v6->_publishingQueue = (OS_dispatch_queue *)Serial;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DB0A50]), "initWithServerHandle:", v7);
    statusItemsPublisher = v6->_statusItemsPublisher;
    v6->_statusItemsPublisher = (STStatusItemsStatusDomainPublisher *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DB0A80]), "initWithServerHandle:", v7);
    telephonyStatusDomain = v6->_telephonyStatusDomain;
    v6->_telephonyStatusDomain = (STTelephonyStatusDomain *)v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0DB0A98]), "initWithServerHandle:", v7);
    wifiStatusDomain = v6->_wifiStatusDomain;
    v6->_wifiStatusDomain = (STWifiStatusDomain *)v14;

    objc_storeWeak((id *)&v6->_mainDisplayWindowScene, v5);
    v16 = (void *)MEMORY[0x1E0DB0858];
    objc_msgSend(MEMORY[0x1E0D016E0], "tokenForCurrentProcess");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
      objc_msgSend(v17, "realToken");
    else
      memset(v24, 0, sizeof(v24));
    objc_msgSend(v16, "attributionWithAuditToken:", v24);
    v19 = objc_claimAutoreleasedReturnValue();
    attribution = v6->_attribution;
    v6->_attribution = (STActivityAttribution *)v19;

    -[SBSystemStatusStatusItemsDataProvider _registerForNotifications](v6, "_registerForNotifications");
    v23 = v6;
    BSDispatchMain();

  }
  return v6;
}

uint64_t __72__SBSystemStatusStatusItemsDataProvider_initWithMainDisplayWindowScene___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAllData");
}

- (void)dealloc
{
  objc_super v3;

  -[SBSystemStatusStatusItemsDataProvider invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBSystemStatusStatusItemsDataProvider;
  -[SBSystemStatusStatusItemsDataProvider dealloc](&v3, sel_dealloc);
}

- (void)setAlarmEnabled:(BOOL)a3
{
  if (self->_alarmEnabled != a3)
  {
    self->_alarmEnabled = a3;
    -[SBSystemStatusStatusItemsDataProvider _updateDataForAlarm](self, "_updateDataForAlarm");
  }
}

- (void)invalidate
{
  id v3;

  -[STStatusItemsStatusDomainPublisher invalidate](self->_statusItemsPublisher, "invalidate");
  -[STTelephonyStatusDomain invalidate](self->_telephonyStatusDomain, "invalidate");
  -[STWifiStatusDomain invalidate](self->_wifiStatusDomain, "invalidate");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)_registerForNotifications
{
  void *v3;
  SBTelephonyManager *v4;
  SBTelephonyManager *telephonyManager;
  SBDisplayReferenceModeMonitor *v6;
  void *v7;
  void *v8;
  void *v9;
  SBDisplayReferenceModeMonitor *displayReferenceModeMonitor;
  SBDisplayReferenceModeMonitor *v11;
  void *v12;
  _QWORD v13[5];

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateDataForRotationLock, *MEMORY[0x1E0DAC368], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateDataForAirplaneMode, *MEMORY[0x1E0DAC2B8], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateDataForTTY, CFSTR("SBTTYChangedNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateDataForVPN, CFSTR("SBVPNConnectionChangedNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateDataForLiquidDetection, CFSTR("SBLiquidDetectionManagerStateDidChange"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateDataForAirPlay, CFSTR("SBAirPlayScreenSharingStatusChangedNotificationName"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateDataForCarPlay, CFSTR("SBNotificationCarPlayDestinationAvailabilityDidChange"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateDataForAlarm, CFSTR("SBTTYChangedNotification"), 0);
  +[SBTelephonyManager sharedTelephonyManagerCreatingIfNecessary:](SBTelephonyManager, "sharedTelephonyManagerCreatingIfNecessary:", 0);
  v4 = (SBTelephonyManager *)objc_claimAutoreleasedReturnValue();
  telephonyManager = self->_telephonyManager;
  self->_telephonyManager = v4;

  v6 = objc_alloc_init(SBDisplayReferenceModeMonitor);
  -[SBSystemStatusStatusItemsDataProvider mainDisplayWindowScene](self, "mainDisplayWindowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "screen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDisplayReferenceModeMonitor addReferenceModeStatusObserver:forDisplayWithConfiguration:](v6, "addReferenceModeStatusObserver:forDisplayWithConfiguration:", self, v9);
  displayReferenceModeMonitor = self->_displayReferenceModeMonitor;
  self->_displayReferenceModeMonitor = v6;
  v11 = v6;

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__SBSystemStatusStatusItemsDataProvider__registerForNotifications__block_invoke;
  v13[3] = &unk_1E8EA5E60;
  v13[4] = self;
  v12 = (void *)MEMORY[0x1D17E5550](v13);
  -[STTelephonyStatusDomain observeDataWithBlock:](self->_telephonyStatusDomain, "observeDataWithBlock:", v12);
  -[STWifiStatusDomain observeDataWithBlock:](self->_wifiStatusDomain, "observeDataWithBlock:", v12);

}

uint64_t __66__SBSystemStatusStatusItemsDataProvider__registerForNotifications__block_invoke()
{
  return BSDispatchMain();
}

uint64_t __66__SBSystemStatusStatusItemsDataProvider__registerForNotifications__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateDataForVPN");
}

- (BOOL)_isDisplayWarningItemEnabled
{
  SBSystemStatusStatusItemsDataProvider *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = self;
  -[SBSystemStatusStatusItemsDataProvider mainDisplayWindowScene](self, "mainDisplayWindowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[SBDisplayReferenceModeMonitor referenceModeStatusForDisplayWithConfiguration:](v2->_displayReferenceModeMonitor, "referenceModeStatusForDisplayWithConfiguration:", v5) == 2;

  return (char)v2;
}

- (BOOL)_isVPNItemEnabled
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  _BOOL4 v7;

  BSDispatchQueueAssertMain();
  if (!self->_telephonyManager)
    return 0;
  -[SBSystemStatusStatusItemsDataProvider telephonyStatusDomain](self, "telephonyStatusDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primarySIMInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isProvidingDataConnection");

  v7 = -[SBTelephonyManager hasNonCellularNetworkConnection](self->_telephonyManager, "hasNonCellularNetworkConnection");
  return ((v6 & 1) != 0 || v7)
      && -[SBTelephonyManager isUsingVPNConnection](self->_telephonyManager, "isUsingVPNConnection");
}

- (BOOL)_wantsAttributionForStatusItemWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL alarmEnabled;
  BOOL v9;

  v4 = a3;
  if (objc_msgSend((id)*MEMORY[0x1E0DB0E88], "isEqualToString:", v4))
  {
    +[SBOrientationLockManager sharedInstance](SBOrientationLockManager, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isUserLocked");
LABEL_7:
    alarmEnabled = v6;

    goto LABEL_8;
  }
  if (objc_msgSend((id)*MEMORY[0x1E0DB0E58], "isEqualToString:", v4))
  {
    +[SBAirplaneModeController sharedInstance](SBAirplaneModeController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isInAirplaneMode");
    goto LABEL_7;
  }
  if (objc_msgSend((id)*MEMORY[0x1E0DB0E98], "isEqualToString:", v4))
  {
    +[SBTelephonyManager sharedTelephonyManagerCreatingIfNecessary:](SBTelephonyManager, "sharedTelephonyManagerCreatingIfNecessary:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isTTYEnabled");
    goto LABEL_7;
  }
  if (objc_msgSend((id)*MEMORY[0x1E0DB0EA0], "isEqualToString:", v4))
  {
    v9 = -[SBSystemStatusStatusItemsDataProvider _isVPNItemEnabled](self, "_isVPNItemEnabled");
LABEL_15:
    alarmEnabled = v9;
    goto LABEL_8;
  }
  if (objc_msgSend((id)*MEMORY[0x1E0DB0E80], "isEqualToString:", v4))
  {
    v9 = +[SBLiquidDetectionManager showStatusBarIcon](SBLiquidDetectionManager, "showStatusBarIcon");
    goto LABEL_15;
  }
  if (objc_msgSend((id)*MEMORY[0x1E0DB0E78], "isEqualToString:", v4))
  {
    v9 = -[SBSystemStatusStatusItemsDataProvider _isDisplayWarningItemEnabled](self, "_isDisplayWarningItemEnabled");
    goto LABEL_15;
  }
  if (objc_msgSend((id)*MEMORY[0x1E0DB0E50], "isEqualToString:", v4))
  {
    +[SBVideoOutController sharedInstanceIfExists](SBVideoOutController, "sharedInstanceIfExists");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isScreenSharing");
    goto LABEL_7;
  }
  if (objc_msgSend((id)*MEMORY[0x1E0DB0E68], "isEqualToString:", v4))
  {
    objc_msgSend((id)SBApp, "notificationDispatcher");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isCarDestinationActive");
    goto LABEL_7;
  }
  if (objc_msgSend((id)*MEMORY[0x1E0DB0E60], "isEqualToString:", v4))
    alarmEnabled = self->_alarmEnabled;
  else
    alarmEnabled = 0;
LABEL_8:

  return alarmEnabled;
}

- (BOOL)_queue_hasAttributionForStatusItemWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  BSDispatchQueueAssert();
  -[NSDictionary objectForKey:](self->_statusItemAttributionsByIdentifier, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5 != 0;
}

- (id)_identifiersForSupportedStatusItems
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[10];

  v10[9] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = *MEMORY[0x1E0DB0E58];
  v10[0] = *MEMORY[0x1E0DB0E88];
  v10[1] = v3;
  v4 = *MEMORY[0x1E0DB0EA0];
  v10[2] = *MEMORY[0x1E0DB0E98];
  v10[3] = v4;
  v5 = *MEMORY[0x1E0DB0E78];
  v10[4] = *MEMORY[0x1E0DB0E80];
  v10[5] = v5;
  v6 = *MEMORY[0x1E0DB0E68];
  v10[6] = *MEMORY[0x1E0DB0E50];
  v10[7] = v6;
  v10[8] = *MEMORY[0x1E0DB0E60];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_updateDataForStatusItemsWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  NSObject *publishingQueue;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (-[SBSystemStatusStatusItemsDataProvider _wantsAttributionForStatusItemWithIdentifier:](self, "_wantsAttributionForStatusItemWithIdentifier:", v12))
        {
          v13 = v5;
        }
        else
        {
          v13 = v6;
        }
        objc_msgSend(v13, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  publishingQueue = self->_publishingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__SBSystemStatusStatusItemsDataProvider__updateDataForStatusItemsWithIdentifiers___block_invoke;
  block[3] = &unk_1E8E9E270;
  block[4] = self;
  v18 = v5;
  v19 = v6;
  v15 = v6;
  v16 = v5;
  dispatch_async(publishingQueue, block);

}

uint64_t __82__SBSystemStatusStatusItemsDataProvider__updateDataForStatusItemsWithIdentifiers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_publishUpdateForWantedStatusItemIdentifers:andUnwantedIdentifiers:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_queue_publishUpdateForWantedStatusItemIdentifers:(id)a3 andUnwantedIdentifiers:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  BSDispatchQueueAssert();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v8;
  if (objc_msgSend(v7, "intersectsSet:", v8))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemStatusStatusItemsDataProvider.m"), 227, CFSTR("you can't add and remove the same identifier!"));

  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v36 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        if (!-[SBSystemStatusStatusItemsDataProvider _queue_hasAttributionForStatusItemWithIdentifier:](self, "_queue_hasAttributionForStatusItemWithIdentifier:", v16))
        {
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB0A58]), "initWithStatusItemIdentifier:activityAttribution:", v16, self->_attribution);
          objc_msgSend(v10, "addObject:", v17);

          SBLogStatusBarish();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            STStatusItemIdentifierDescription();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v41 = v19;
            _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, "SBSystemStatusStatusItemsDataProvider will add attribution for %{public}@", buf, 0xCu);

          }
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
    }
    while (v13);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v20 = v30;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v32 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
        if (-[SBSystemStatusStatusItemsDataProvider _queue_hasAttributionForStatusItemWithIdentifier:](self, "_queue_hasAttributionForStatusItemWithIdentifier:", v25))
        {
          -[NSDictionary objectForKey:](self->_statusItemAttributionsByIdentifier, "objectForKey:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v26);

          SBLogStatusBarish();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            STStatusItemIdentifierDescription();
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v41 = v28;
            _os_log_impl(&dword_1D0540000, v27, OS_LOG_TYPE_DEFAULT, "SBSystemStatusStatusItemsDataProvider will remove attribution for %{public}@", buf, 0xCu);

          }
        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v22);
  }

  -[SBSystemStatusStatusItemsDataProvider _queue_publishUpdateByAddingAttributions:andRemovingAttributions:](self, "_queue_publishUpdateByAddingAttributions:andRemovingAttributions:", v10, v9);
}

- (void)_queue_publishUpdateByAddingAttributions:(id)a3 andRemovingAttributions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  BSDispatchQueueAssert();
  if (objc_msgSend(v7, "count") || objc_msgSend(v6, "count"))
  {
    objc_initWeak(&location, self);
    -[SBSystemStatusStatusItemsDataProvider statusItemsPublisher](self, "statusItemsPublisher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __106__SBSystemStatusStatusItemsDataProvider__queue_publishUpdateByAddingAttributions_andRemovingAttributions___block_invoke;
    v16[3] = &unk_1E8EA5E88;
    v10 = v7;
    v17 = v10;
    v11 = v6;
    v18 = v11;
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __106__SBSystemStatusStatusItemsDataProvider__queue_publishUpdateByAddingAttributions_andRemovingAttributions___block_invoke_2;
    v12[3] = &unk_1E8EA5ED8;
    v12[4] = self;
    objc_copyWeak(&v15, &location);
    v13 = v11;
    v14 = v10;
    objc_msgSend(v8, "updateVolatileDataWithBlock:completion:", v16, v12);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

}

void __106__SBSystemStatusStatusItemsDataProvider__queue_publishUpdateByAddingAttributions_andRemovingAttributions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "removeAttribution:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v6);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = *(id *)(a1 + 40);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v3, "addAttribution:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v11);
  }

}

void __106__SBSystemStatusStatusItemsDataProvider__queue_publishUpdateByAddingAttributions_andRemovingAttributions___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;
  id v5;
  id v6;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__SBSystemStatusStatusItemsDataProvider__queue_publishUpdateByAddingAttributions_andRemovingAttributions___block_invoke_3;
  block[3] = &unk_1E8EA5EB0;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

  objc_destroyWeak(&v6);
}

void __106__SBSystemStatusStatusItemsDataProvider__queue_publishUpdateByAddingAttributions_andRemovingAttributions___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_queue_didPublishUpdateAddingAttributions:andRemovingAttributions:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_queue_didPublishUpdateAddingAttributions:(id)a3 andRemovingAttributions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSDictionary *v10;
  NSDictionary *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  NSDictionary *statusItemAttributionsByIdentifier;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  BSDispatchQueueAssert();
  v8 = (void *)-[NSDictionary mutableCopy](self->_statusItemAttributionsByIdentifier, "mutableCopy");
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v31 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "statusItemIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary removeObjectForKey:](v11, "removeObjectForKey:", v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v14);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v18 = v6;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
        objc_msgSend(v23, "statusItemIdentifier", (_QWORD)v26);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKey:](v11, "setObject:forKey:", v23, v24);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v20);
  }

  statusItemAttributionsByIdentifier = self->_statusItemAttributionsByIdentifier;
  self->_statusItemAttributionsByIdentifier = v11;

}

- (void)_updateAllData
{
  id v3;

  -[SBSystemStatusStatusItemsDataProvider _identifiersForSupportedStatusItems](self, "_identifiersForSupportedStatusItems");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSystemStatusStatusItemsDataProvider _updateDataForStatusItemsWithIdentifiers:](self, "_updateDataForStatusItemsWithIdentifiers:", v3);

}

- (void)_updateDataForRotationLock
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0DB0E88]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSystemStatusStatusItemsDataProvider _updateDataForStatusItemsWithIdentifiers:](self, "_updateDataForStatusItemsWithIdentifiers:", v3);

}

- (void)_updateDataForAirplaneMode
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0DB0E58]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSystemStatusStatusItemsDataProvider _updateDataForStatusItemsWithIdentifiers:](self, "_updateDataForStatusItemsWithIdentifiers:", v3);

}

- (void)_updateDataForTTY
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0DB0E98]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSystemStatusStatusItemsDataProvider _updateDataForStatusItemsWithIdentifiers:](self, "_updateDataForStatusItemsWithIdentifiers:", v3);

}

- (void)_updateDataForVPN
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0DB0EA0]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSystemStatusStatusItemsDataProvider _updateDataForStatusItemsWithIdentifiers:](self, "_updateDataForStatusItemsWithIdentifiers:", v3);

}

- (void)_updateDataForLiquidDetection
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0DB0E80]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSystemStatusStatusItemsDataProvider _updateDataForStatusItemsWithIdentifiers:](self, "_updateDataForStatusItemsWithIdentifiers:", v3);

}

- (void)_updateDataForAirPlay
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0DB0E50]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSystemStatusStatusItemsDataProvider _updateDataForStatusItemsWithIdentifiers:](self, "_updateDataForStatusItemsWithIdentifiers:", v3);

}

- (void)_updateDataForDisplayWarning
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0DB0E78]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSystemStatusStatusItemsDataProvider _updateDataForStatusItemsWithIdentifiers:](self, "_updateDataForStatusItemsWithIdentifiers:", v3);

}

- (void)_updateDataForCarPlay
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0DB0E68]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSystemStatusStatusItemsDataProvider _updateDataForStatusItemsWithIdentifiers:](self, "_updateDataForStatusItemsWithIdentifiers:", v3);

}

- (void)_updateDataForAlarm
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0DB0E60]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSystemStatusStatusItemsDataProvider _updateDataForStatusItemsWithIdentifiers:](self, "_updateDataForStatusItemsWithIdentifiers:", v3);

}

- (BOOL)isAlarmEnabled
{
  return self->_alarmEnabled;
}

- (STStatusItemsStatusDomainPublisher)statusItemsPublisher
{
  return self->_statusItemsPublisher;
}

- (NSDictionary)statusItemAttributionsByIdentifier
{
  return self->_statusItemAttributionsByIdentifier;
}

- (SBDisplayReferenceModeMonitor)displayReferenceModeMonitor
{
  return self->_displayReferenceModeMonitor;
}

- (SBTelephonyManager)telephonyManager
{
  return self->_telephonyManager;
}

- (STTelephonyStatusDomain)telephonyStatusDomain
{
  return self->_telephonyStatusDomain;
}

- (STWifiStatusDomain)wifiStatusDomain
{
  return self->_wifiStatusDomain;
}

- (SBWindowScene)mainDisplayWindowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_mainDisplayWindowScene);
}

- (void)setMainDisplayWindowScene:(id)a3
{
  objc_storeWeak((id *)&self->_mainDisplayWindowScene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mainDisplayWindowScene);
  objc_storeStrong((id *)&self->_wifiStatusDomain, 0);
  objc_storeStrong((id *)&self->_telephonyStatusDomain, 0);
  objc_storeStrong((id *)&self->_telephonyManager, 0);
  objc_storeStrong((id *)&self->_displayReferenceModeMonitor, 0);
  objc_storeStrong((id *)&self->_statusItemAttributionsByIdentifier, 0);
  objc_storeStrong((id *)&self->_statusItemsPublisher, 0);
  objc_storeStrong((id *)&self->_publishingQueue, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
}

@end
