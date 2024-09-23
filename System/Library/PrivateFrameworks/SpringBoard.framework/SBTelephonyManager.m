@implementation SBTelephonyManager

- (BOOL)isInEmergencyCallbackMode
{
  int inEmergencyCallbackMode;
  unint64_t v4;

  inEmergencyCallbackMode = self->_inEmergencyCallbackMode;
  if (inEmergencyCallbackMode < 0)
  {
    CTTelephonyCenterGetDefault();
    v4 = _CTServerConnectionGetEmergencyCallBackMode();
    if (HIDWORD(v4))
      -[SBTelephonyManager _serverConnectionDidError:](self, "_serverConnectionDidError:", v4);
    else
      -[SBTelephonyManager _setIsInEmergencyCallbackMode:](self, "_setIsInEmergencyCallbackMode:", 0);
    inEmergencyCallbackMode = self->_inEmergencyCallbackMode;
  }
  return inEmergencyCallbackMode == 1;
}

- (BOOL)inCallUsingSpeakerOrReceiver
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  if (!-[SBTelephonyManager inCall](self, "inCall"))
    return 0;
  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "routeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pickedRoute");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isReceiver") & 1) != 0 || (objc_msgSend(v4, "isSpeaker") & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isBluetoothLE");

  return v5;
}

- (BOOL)inCall
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;

  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentCallCount");

  if (!v4)
    return 0;
  if (v4 != 1)
    return 1;
  -[SBTelephonyManager incomingCall](self, "incomingCall");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == 0;

  return v6;
}

- (void)preHeatDataLinkForDomains:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  _QWORD block[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[SBTelephonyManager telephonyStateProvider](self, "telephonyStateProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subscriptionInfoForSlot:", -[SBTelephonyManager _dataConnectedSubscriptionSlot](self, "_dataConnectedSubscriptionSlot"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)(objc_msgSend(v6, "dataConnectionType") - 2) <= 8)
    {
      v15 = v6;
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v7 = v4;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v18;
        v11 = MEMORY[0x1E0C809B0];
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v18 != v10)
              objc_enumerationMutation(v7);
            v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
            dispatch_get_global_queue(0, 0);
            v14 = objc_claimAutoreleasedReturnValue();
            block[0] = v11;
            block[1] = 3221225472;
            block[2] = __48__SBTelephonyManager_preHeatDataLinkForDomains___block_invoke;
            block[3] = &unk_1E8E9DED8;
            block[4] = v13;
            dispatch_async(v14, block);

            ++v12;
          }
          while (v9 != v12);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v9);
      }

      v6 = v15;
    }

  }
}

+ (id)sharedTelephonyManager
{
  return (id)objc_msgSend(a1, "sharedTelephonyManagerCreatingIfNecessary:", 1);
}

- (BOOL)hasNonCellularNetworkConnection
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[SBTelephonyManager wifiDomain](self, "wifiDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isWifiActive") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[SBTelephonyManager bluetoothController](self, "bluetoothController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "tetheringConnected") & 1) != 0)
      v5 = 1;
    else
      v5 = -[NWSystemPathMonitor isEthernetPrimary](self->_systemPathMonitor, "isEthernetPrimary");

  }
  return v5;
}

- (STWifiStatusDomain)wifiDomain
{
  return self->_wifiDomain;
}

+ (id)sharedTelephonyManagerCreatingIfNecessary:(BOOL)a3
{
  void *v4;
  BOOL v5;
  void *v7;
  void *v8;
  void *v9;
  SBTelephonyManager *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  void *v16;

  v4 = (void *)__sharedTelephonyManager;
  if (__sharedTelephonyManager)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    kdebug_trace();
    objc_msgSend((id)SBApp, "systemStatusServer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBTelephonyManager.m"), 201, CFSTR("SBTelephonyManager is being created before the system status server"));

    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB0A98]), "initWithServerHandle:", v7);
    objc_msgSend((id)SBApp, "telephonyStateProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBTelephonyManager.m"), 204, CFSTR("SBTelephonyManager is being created before the telephony state provider"));

    }
    v10 = [SBTelephonyManager alloc];
    +[SBBluetoothController sharedInstance](SBBluetoothController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SBTelephonyManager initWithStateProvider:wifiDomain:bluetoothController:](v10, "initWithStateProvider:wifiDomain:bluetoothController:", v9, v8, v11);
    v13 = (void *)__sharedTelephonyManager;
    __sharedTelephonyManager = v12;

    kdebug_trace();
    v4 = (void *)__sharedTelephonyManager;
  }
  return v4;
}

- (BOOL)isUsingSlowDataConnection
{
  BOOL v3;
  void *v4;
  void *v5;

  if (-[SBTelephonyManager hasNonCellularNetworkConnection](self, "hasNonCellularNetworkConnection"))
    return 0;
  -[SBTelephonyManager telephonyStateProvider](self, "telephonyStateProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscriptionInfoForSlot:", -[SBTelephonyManager _dataConnectedSubscriptionSlot](self, "_dataConnectedSubscriptionSlot"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = (unint64_t)(objc_msgSend(v5, "dataConnectionType") - 1) < 3;
  return v3;
}

- (unint64_t)dataConnectionAvailabilityWithCurrentCalls
{
  unint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (-[SBTelephonyManager hasNonCellularNetworkConnection](self, "hasNonCellularNetworkConnection"))
    return 0;
  -[SBTelephonyManager _callsForService:](self, "_callsForService:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "count"))
  {
    v3 = 0;
    goto LABEL_27;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v6)
  {
    v3 = 0;
    goto LABEL_26;
  }
  v7 = v6;
  v17 = v4;
  v8 = *(_QWORD *)v19;
LABEL_6:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v19 != v8)
      objc_enumerationMutation(v5);
    v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
    objc_msgSend(v10, "provider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isTelephonyProvider");

    if (!v12)
      goto LABEL_13;
    objc_msgSend(v10, "providerContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("kCallSubType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      if (!objc_msgSend(v14, "isEqualToString:", CFSTR("kCallSubTypeWifi")))
        break;
    }

LABEL_13:
    if (v7 == ++v9)
    {
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v7)
        goto LABEL_6;
      v3 = 0;
      v4 = v17;
      goto LABEL_26;
    }
  }
  -[SBTelephonyManager _subscriptionInfoForCall:](self, "_subscriptionInfoForCall:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v3 = 0;
    v4 = v17;
    goto LABEL_27;
  }
  v4 = v17;
  if (objc_msgSend(v15, "isProvidingDataConnection"))
  {
    v3 = (unint64_t)(objc_msgSend(v15, "dataConnectionType") - 15) < 0xFFFFFFFFFFFFFFF5;
  }
  else if (-[SBTelephonyManager isCellDataSwitchingEnabled](self, "isCellDataSwitchingEnabled"))
  {
    v3 = 1;
  }
  else
  {
    v3 = 2;
  }
  v5 = v15;
LABEL_26:

LABEL_27:
  return v3;
}

- (int64_t)_dataConnectedSubscriptionSlot
{
  int64_t v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = -[SBTelephonyManager _subscriptionSlotIfSIMPresent:](self, "_subscriptionSlotIfSIMPresent:", 2);
  -[SBTelephonyManager telephonyStateProvider](self, "telephonyStateProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscriptionInfoForSlot:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isProvidingDataConnection"))
    v6 = v3;
  else
    v6 = 1;

  return v6;
}

- (int64_t)_subscriptionSlotIfSIMPresent:(int64_t)a3
{
  void *v4;
  int v5;

  -[SBTelephonyManager telephonyStateProvider](self, "telephonyStateProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSIMPresentForSlot:", a3);

  if (v5)
    return a3;
  else
    return 0;
}

- (STTelephonyStateProvider)telephonyStateProvider
{
  return self->_telephonyStateProvider;
}

void __69__SBTelephonyManager_subscriptionInfoDidChangeForStateProvider_slot___block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2 > 1)
  {
    v9 = 0;
    v8 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "telephonyStateProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "subscriptionInfoForSlot:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "SIMStatus");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "cachedSlot1SIMStatus");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6 | v5 && (objc_msgSend((id)v6, "isEqualToString:", v5) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "setCachedSlot1SIMStatus:", v5);
      v8 = objc_msgSend((id)v5, "isEqualToString:", *MEMORY[0x1E0CA7818]);
    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(v4, "lastKnownNetworkCountryCode");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "cachedSlot1CountryCode");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11 | v10 && (objc_msgSend((id)v11, "isEqualToString:", v10) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "setCachedSlot1CountryCode:", v10);
      v9 = 1;
    }
    else
    {
      v9 = 0;
    }

  }
  if ((v2 | 2) == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "telephonyStateProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "subscriptionInfoForSlot:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "SIMStatus");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "cachedSlot2SIMStatus");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16 | v15 && (objc_msgSend((id)v16, "isEqualToString:", v15) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "setCachedSlot2SIMStatus:", v15);
      LOBYTE(v8) = objc_msgSend((id)v15, "isEqualToString:", *MEMORY[0x1E0CA7818]) | v8;
    }
    objc_msgSend(v14, "lastKnownNetworkCountryCode");
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "cachedSlot2CountryCode");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v19 | v18)
    {
      if ((objc_msgSend((id)v19, "isEqualToString:", v18) & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "setCachedSlot2CountryCode:", v18);
        v9 = 1;
      }
    }

    if ((v8 & 1) != 0)
    {
LABEL_20:
      objc_msgSend(*(id *)(a1 + 32), "updateLocale");
      if ((v9 & 1) == 0)
        return;
LABEL_24:
      objc_msgSend(*(id *)(a1 + 32), "_updateNetworkLocale");
      return;
    }
  }
  else if (v8)
  {
    goto LABEL_20;
  }
  if (v9)
    goto LABEL_24;
}

- (void)subscriptionInfoDidChangeForStateProvider:(id)a3 slot:(int64_t)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__SBTelephonyManager_subscriptionInfoDidChangeForStateProvider_slot___block_invoke;
  v4[3] = &unk_1E8E9DE88;
  v4[4] = self;
  v4[5] = a4;
  dispatch_async(MEMORY[0x1E0C80D38], v4);
}

- (NSString)cachedSlot1SIMStatus
{
  return self->_cachedSlot1SIMStatus;
}

- (NSString)cachedSlot1CountryCode
{
  return self->_cachedSlot1CountryCode;
}

+ (__CTServerConnection)defaultTelephonyCenter
{
  CFRunLoopGetMain();
  CTTelephonyCenterSetDefaultRunloop();
  return (__CTServerConnection *)CTTelephonyCenterGetDefault();
}

- (SBTelephonyManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTelephonyManager.m"), 212, CFSTR("Use initWithStateProvider:wifiDomain:bluetoothController:"));

  return -[SBTelephonyManager initWithStateProvider:wifiDomain:bluetoothController:](self, "initWithStateProvider:wifiDomain:bluetoothController:", 0, 0, 0);
}

- (SBTelephonyManager)initWithStateProvider:(id)a3 wifiDomain:(id)a4 bluetoothController:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBTelephonyManager *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  CoreTelephonyClient *coreTelephonyClient;
  NSObject *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t Serial;
  OS_dispatch_queue *wirelessModemDynamicStoreQueue;
  NSObject *v29;
  id *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  _QWORD block[4];
  id *v38;
  _QWORD v39[5];
  id v40;
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  id from;
  id location;
  objc_super v50;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v50.receiver = self;
  v50.super_class = (Class)SBTelephonyManager;
  v12 = -[SBTelephonyManager init](&v50, sel_init);
  objc_storeStrong((id *)&__sharedTelephonyManager, v12);
  if (v12)
  {
    objc_storeStrong((id *)&v12->_telephonyStateProvider, a3);
    objc_storeStrong((id *)&v12->_wifiDomain, a4);
    objc_storeStrong((id *)&v12->_bluetoothController, a5);
    v12->_containsCellularRadio = MGGetBoolAnswer();
    v12->_hasCellularTelephony = MGGetBoolAnswer();
    v12->_hasCellularData = MGGetBoolAnswer();
    v12->_inEmergencyCallbackMode = -1;
    +[SBTelephonyManager defaultTelephonyCenter](SBTelephonyManager, "defaultTelephonyCenter");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12->_containsCellularRadio)
    {
      CTTelephonyCenterAddObserver();
      CTTelephonyCenterAddObserver();
      CTTelephonyCenterAddObserver();
    }
    if (v12->_hasCellularTelephony)
      CTTelephonyCenterAddObserver();
    objc_msgSend(v13, "addObserver:selector:name:object:", v12, sel_callEventHandler_, *MEMORY[0x1E0DBD4A0], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v12, sel_callEventHandler_, *MEMORY[0x1E0DBD490], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v12, sel_handleCallControlFailure_, *MEMORY[0x1E0DBD4B8], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v12, sel_updateSpringBoard, *MEMORY[0x1E0DBD528], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v12, sel_telephonyAudioChangeHandler, *MEMORY[0x1E0DBD3D8], 0);
    v14 = objc_alloc(MEMORY[0x1E0CA6E38]);
    -[SBTelephonyManager _backgroundQueryQueue](v12, "_backgroundQueryQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithQueue:", v15);
    coreTelephonyClient = v12->_coreTelephonyClient;
    v12->_coreTelephonyClient = (CoreTelephonyClient *)v16;

    if (MGGetBoolAnswer())
    {
      CTTelephonyCenterAddObserver();
      CTTelephonyCenterAddObserver();
    }
    CTTelephonyCenterAddObserver();
    dispatch_get_global_queue(-2, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v18, &__block_literal_global_20);

    objc_msgSend(getRTTSettingsClass(), "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "registerUpdateBlock:forRetrieveSelector:withListener:", &__block_literal_global_50, sel_TTYSoftwareEnabled, v12);
    objc_msgSend(v19, "registerUpdateBlock:forRetrieveSelector:withListener:", &__block_literal_global_50, sel_TTYHardwareEnabled, v12);
    +[SBLockdownManager sharedInstance](SBLockdownManager, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "brickedDevice");

    if ((v21 & 1) == 0)
      -[SBTelephonyManager setNetworkRegistrationEnabled:](v12, "setNetworkRegistrationEnabled:", 1);
    -[STTelephonyStateProvider addObserver:](v12->_telephonyStateProvider, "addObserver:", v12);
    -[SBTelephonyManager _updateState](v12, "_updateState");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v22);

    objc_initWeak(&from, v12);
    v42 = 0;
    v43 = &v42;
    v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__3;
    v46 = __Block_byref_object_dispose__3;
    v47 = 0;
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __75__SBTelephonyManager_initWithStateProvider_wifiDomain_bluetoothController___block_invoke_57;
    v39[3] = &unk_1E8EA1628;
    objc_copyWeak(&v40, &from);
    objc_copyWeak(&v41, &location);
    v39[4] = &v42;
    objc_msgSend(v13, "addObserverForName:object:queue:usingBlock:", CFSTR("SBBootCompleteNotification"), 0, v23, v39);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v43[5];
    v43[5] = v25;

    Serial = BSDispatchQueueCreateSerial();
    wirelessModemDynamicStoreQueue = v12->_wirelessModemDynamicStoreQueue;
    v12->_wirelessModemDynamicStoreQueue = (OS_dispatch_queue *)Serial;

    v29 = v12->_wirelessModemDynamicStoreQueue;
    block[0] = v24;
    block[1] = 3221225472;
    block[2] = __75__SBTelephonyManager_initWithStateProvider_wifiDomain_bluetoothController___block_invoke_2_61;
    block[3] = &unk_1E8E9DED8;
    v30 = v12;
    v38 = v30;
    dispatch_async(v29, block);
    +[SBDefaults externalDefaults](SBDefaults, "externalDefaults");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "globalDefaults");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "removeFormattedPhoneNumberFromGlobalPreferences");

    objc_msgSend(MEMORY[0x1E0CCECC8], "sharedSystemPathMonitor");
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = v30[12];
    v30[12] = (id)v33;

    objc_msgSend(v30[12], "addObserver:forKeyPath:options:context:", v30, CFSTR("vpnActive"), 5, 0);
    _Block_object_dispose(&v42, 8);

    objc_destroyWeak(&v41);
    objc_destroyWeak(&v40);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
  v35 = (id)objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");

  return v12;
}

id __75__SBTelephonyManager_initWithStateProvider_wifiDomain_bluetoothController___block_invoke()
{
  return (id)objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
}

void __75__SBTelephonyManager_initWithStateProvider_wifiDomain_bluetoothController___block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:userInfo:", CFSTR("SBTTYChangedNotification"), 0, 0);

}

void __75__SBTelephonyManager_initWithStateProvider_wifiDomain_bluetoothController___block_invoke_57(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "updateCalls");

  v3 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v3, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

}

void __75__SBTelephonyManager_initWithStateProvider_wifiDomain_bluetoothController___block_invoke_2_61(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  NSObject *v4;
  uint64_t v5;
  const __SCDynamicStore *v6;
  uint8_t v7[8];
  uint64_t v8;
  char cStr[16];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (_NETRBClientCreate())
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    *(_OWORD *)cStr = 0u;
    v10 = 0u;
    if (_NETRBClientGetDynamicStoreKey())
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], cStr, 0x8000100u);
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
      {
LABEL_13:
        _NETRBClientDestroy();
        goto LABEL_14;
      }
      SBLogCommon();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        v3 = "_NETRBClientGetDynamicStoreKey failed to convert to CFStringRef";
LABEL_11:
        _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, v3, v7, 2u);
      }
    }
    else
    {
      SBLogCommon();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        v3 = "_NETRBClientGetDynamicStoreKey failed";
        goto LABEL_11;
      }
    }

    goto LABEL_13;
  }
  SBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)cStr = 0;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "_NETRBClientCreate failed", (uint8_t *)cStr, 2u);
  }

LABEL_14:
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = SCDynamicStoreCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("com.apple.springboard"), (SCDynamicStoreCallBack)_WirelessModemDynamicStoreCallBack, 0);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(const __SCDynamicStore **)(v5 + 32);
    v8 = *(_QWORD *)(v5 + 40);
    SCDynamicStoreSetNotificationKeys(v6, (CFArrayRef)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1), 0);
    SCDynamicStoreSetDispatchQueue(*(SCDynamicStoreRef *)(*(_QWORD *)(a1 + 32) + 32), *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(*(id *)(a1 + 32), "_queue_noteWirelessModemDynamicStoreChanged");
  }
}

- (id)_backgroundQueryQueue
{
  if (_backgroundQueryQueue_onceToken != -1)
    dispatch_once(&_backgroundQueryQueue_onceToken, &__block_literal_global_70);
  return (id)_backgroundQueryQueue___queryQueue;
}

void __43__SBTelephonyManager__backgroundQueryQueue__block_invoke()
{
  uint64_t Serial;
  void *v1;

  Serial = BSDispatchQueueCreateSerial();
  v1 = (void *)_backgroundQueryQueue___queryQueue;
  _backgroundQueryQueue___queryQueue = Serial;

}

- (void)_performQueryInBackground:(id)a3 withMainQueueResultHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  _QWORD v15[5];

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__SBTelephonyManager__performQueryInBackground_withMainQueueResultHandler___block_invoke;
  v15[3] = &unk_1E8E9DED8;
  v15[4] = self;
  if (_performQueryInBackground_withMainQueueResultHandler__onceToken != -1)
    dispatch_once(&_performQueryInBackground_withMainQueueResultHandler__onceToken, v15);
  -[SBTelephonyManager _backgroundQueryQueue](self, "_backgroundQueryQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __75__SBTelephonyManager__performQueryInBackground_withMainQueueResultHandler___block_invoke_2;
  block[3] = &unk_1E8EA06E0;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __75__SBTelephonyManager__performQueryInBackground_withMainQueueResultHandler___block_invoke(uint64_t a1)
{
  void *v2;

  _performQueryInBackground_withMainQueueResultHandler____queryServerConnection = _CTServerConnectionCreateWithIdentifier();
  objc_msgSend(*(id *)(a1 + 32), "_backgroundQueryQueue", 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _CTServerConnectionSetTargetQueue();

}

void __75__SBTelephonyManager__performQueryInBackground_withMainQueueResultHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _QWORD block[4];
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, _performQueryInBackground_withMainQueueResultHandler____queryServerConnection);
  if (*(_QWORD *)(a1 + 40))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__SBTelephonyManager__performQueryInBackground_withMainQueueResultHandler___block_invoke_3;
    block[3] = &unk_1E8E9E8D0;
    v4 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __75__SBTelephonyManager__performQueryInBackground_withMainQueueResultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (__CTServerConnection)_serverConnection
{
  __CTServerConnection *result;
  NSObject *v4;

  result = self->_serverConnection;
  if (!result)
  {
    result = (__CTServerConnection *)_CTServerConnectionCreateWithIdentifier();
    self->_serverConnection = result;
    if (!result)
    {
      SBLogCommon();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        -[SBTelephonyManager _serverConnection].cold.1(v4);

      return self->_serverConnection;
    }
  }
  return result;
}

- (void)_avSystemControllerDidError:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  SBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[SBTelephonyManager _avSystemControllerDidError:].cold.1(v3, v4);

}

- (void)_serverConnectionDidError:(id)a3
{
  NSObject *v5;
  void *v6;

  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[SBTelephonyManager _serverConnectionDidError:].cold.1(*(_QWORD *)&a3, v5);

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__handleTelephonyDaemonRestart, 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *MEMORY[0x1E0C99860]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTelephonyManager performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel__handleTelephonyDaemonRestart, 0, v6, 1.0);

}

- (void)_handleTelephonyDaemonRestart
{
  __CTServerConnection *serverConnection;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__handleTelephonyDaemonRestart, 0);
  serverConnection = self->_serverConnection;
  if (serverConnection)
  {
    CFRelease(serverConnection);
    self->_serverConnection = 0;
  }
  -[SBTelephonyManager _serverConnection](self, "_serverConnection");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__SBTelephonyManager__handleTelephonyDaemonRestart__block_invoke;
  v7[3] = &unk_1E8EA1670;
  v7[4] = self;
  -[SBTelephonyManager _performQueryInBackground:withMainQueueResultHandler:](self, "_performQueryInBackground:withMainQueueResultHandler:", v7, 0);
  -[SBTelephonyManager handleCallControlFailure:](self, "handleCallControlFailure:", 0);
  -[SBTelephonyManager _updateState](self, "_updateState");
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdleModeText:", 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", *MEMORY[0x1E0DAC390], 0);

}

_QWORD *__51__SBTelephonyManager__handleTelephonyDaemonRestart__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[11])
  {
    objc_msgSend(result, "queue_setFastDormancySuspended:withConnection:", 0, a2);
    return (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "queue_setFastDormancySuspended:withConnection:", 1, a2);
  }
  return result;
}

- (BOOL)containsCellularRadio
{
  return self->_containsCellularRadio;
}

- (BOOL)hasCellularTelephony
{
  return self->_hasCellularTelephony;
}

- (BOOL)hasCellularData
{
  return self->_hasCellularData;
}

- (BOOL)emergencyCallSupported
{
  unint64_t v3;
  BOOL v4;
  int v5;
  BOOL v6;

  v3 = -[SBTelephonyManager callCount](self, "callCount");
  v4 = -[SBTelephonyManager isEmergencyCallActive](self, "isEmergencyCallActive");
  v5 = MGGetBoolAnswer();
  if (v3)
    v6 = v4;
  else
    v6 = 1;
  return v5 && v6;
}

- (double)inCallDuration
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayedCallFromCalls:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -1.0;
  if (v3 && objc_msgSend(v3, "status") != 3)
  {
    objc_msgSend(v3, "callDuration");
    v4 = v5;
  }

  return v4;
}

- (void)updateSpringBoard
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayedCallFromCalls:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBLockScreenManager sharedInstanceIfExists](SBLockScreenManager, "sharedInstanceIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isUILocked");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("SBLockScreenTelephoneCallUINeedsUpdateNotification"), 0);

  }
  if (!v3)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allApplications");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "setHasDisplayedLaunchAlert:forType:", 0, 1);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
  +[SBIdleTimerGlobalCoordinator sharedInstance](SBIdleTimerGlobalCoordinator, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resetIdleTimerForReason:", CFSTR("TelephonyManager:UpdateSB"));

}

- (id)_phoneApp
{
  void *v2;
  void *v3;

  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mobilePhone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)queue_setFastDormancySuspended:(BOOL)a3 withConnection:(__CTServerConnection *)a4
{
  void *queue_fastDormancySuspendAssertion;
  void **p_queue_fastDormancySuspendAssertion;
  unint64_t v6;
  unint64_t v7;
  int v8;
  NSObject *v9;

  p_queue_fastDormancySuspendAssertion = &self->_queue_fastDormancySuspendAssertion;
  queue_fastDormancySuspendAssertion = self->_queue_fastDormancySuspendAssertion;
  if (a3)
  {
    if (a4)
    {
      if (!queue_fastDormancySuspendAssertion)
      {
        v6 = _CTServerConnectionDormancySuspendAssertionCreate();
        v7 = HIDWORD(v6);
        if (HIDWORD(v6))
        {
          v8 = v6;
          SBLogCommon();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            -[SBTelephonyManager queue_setFastDormancySuspended:withConnection:].cold.1(v8, v7, v9);

        }
      }
    }
  }
  else if (queue_fastDormancySuspendAssertion)
  {
    CFRelease(queue_fastDormancySuspendAssertion);
    *p_queue_fastDormancySuspendAssertion = 0;
  }
}

- (void)setFastDormancySuspended:(BOOL)a3
{
  void *v5;
  void *v6;
  _QWORD v7[5];
  BOOL v8;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBTelephonyManager setFastDormancySuspended:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("SBTelephonyManager.m"), 501, CFSTR("this call must be made on the main thread"));

  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__SBTelephonyManager_setFastDormancySuspended___block_invoke;
  v7[3] = &unk_1E8EA1698;
  v7[4] = self;
  v8 = a3;
  -[SBTelephonyManager _performQueryInBackground:withMainQueueResultHandler:](self, "_performQueryInBackground:withMainQueueResultHandler:", v7, 0);
}

uint64_t __47__SBTelephonyManager_setFastDormancySuspended___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_setFastDormancySuspended:withConnection:", *(unsigned __int8 *)(a1 + 40), a2);
}

- (void)updateCalls
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[SBTelephonyManager setIncomingCall:](self, "setIncomingCall:", 0);
  -[SBTelephonyManager setActiveCall:](self, "setActiveCall:", 0);
  -[SBTelephonyManager setHeldCall:](self, "setHeldCall:", 0);
  -[SBTelephonyManager setOutgoingCall:](self, "setOutgoingCall:", 0);
  v3 = 0x1E0DBD000uLL;
  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "currentCallCount");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentCalls");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v21;
      v13 = *MEMORY[0x1E0DBD4A0];
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v8);
          v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          switch(objc_msgSend(v15, "status", (_QWORD)v20))
          {
            case 1u:
              -[SBTelephonyManager activeCall](self, "activeCall");
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v16)
                -[SBTelephonyManager setActiveCall:](self, "setActiveCall:", v15);
              break;
            case 2u:
              -[SBTelephonyManager heldCall](self, "heldCall");
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v17)
                -[SBTelephonyManager setHeldCall:](self, "setHeldCall:", v15);
              break;
            case 3u:
              -[SBTelephonyManager setOutgoingCall:](self, "setOutgoingCall:", v15);
              break;
            case 4u:
              objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", v13, v15);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[SBTelephonyManager callEventHandler:](self, "callEventHandler:", v18);

              v11 = 1;
              break;
            default:
              continue;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);

      v3 = 0x1E0DBD000;
      if ((v11 & 1) != 0)
        goto LABEL_20;
    }
    else
    {

    }
    sInTelephonyCall = 1;
    SBUpdateCallState();
LABEL_20:

  }
  objc_msgSend(*(id *)(v3 + 448), "sharedInstance", (_QWORD)v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  __LastUpdatedCallCount = objc_msgSend(v19, "currentCallCount");

  -[SBTelephonyManager updateSpringBoard](self, "updateSpringBoard");
}

- (void)_updateState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[SBTelephonyManager telephonyStateProvider](self, "telephonyStateProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subscriptionInfoForSlot:", 1);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[SBTelephonyManager telephonyStateProvider](self, "telephonyStateProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscriptionInfoForSlot:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "lastKnownNetworkCountryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTelephonyManager setCachedSlot1CountryCode:](self, "setCachedSlot1CountryCode:", v6);

  objc_msgSend(v11, "SIMStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTelephonyManager setCachedSlot1SIMStatus:](self, "setCachedSlot1SIMStatus:", v7);

  objc_msgSend(v5, "lastKnownNetworkCountryCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTelephonyManager setCachedSlot2CountryCode:](self, "setCachedSlot2CountryCode:", v8);

  objc_msgSend(v5, "SIMStatus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTelephonyManager setCachedSlot2SIMStatus:](self, "setCachedSlot2SIMStatus:", v9);

  -[SBTelephonyManager updateLocale](self, "updateLocale");
  -[SBTelephonyManager _updateNetworkLocale](self, "_updateNetworkLocale");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("SBTTYChangedNotification"), 0, 0);

}

- (BOOL)updateLocale
{
  NSObject *v2;
  _QWORD v4[6];
  _QWORD v5[5];
  uint8_t buf[8];
  uint8_t *v7;
  uint64_t v8;
  char v9;

  if (self->_hasCellularData)
  {
    *(_QWORD *)buf = 0;
    v7 = buf;
    v8 = 0x2020000000;
    v9 = 0;
    v4[5] = buf;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __34__SBTelephonyManager_updateLocale__block_invoke;
    v5[3] = &unk_1E8EA16C0;
    v5[4] = buf;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __34__SBTelephonyManager_updateLocale__block_invoke_3;
    v4[3] = &unk_1E8E9DFA0;
    v4[4] = self;
    _updateLocale(self, v5, &__block_literal_global_94, v4);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    SBLogStatusBarish();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "[SBTelephonyManager] updateLocale: clearing country code info for non-cellular device", buf, 2u);
    }

    CPPhoneNumberSetActiveCountryCode();
    CPPhoneNumberSetHomeCountryCode();
    CPPhoneNumberSetNetworkCountryCode();
  }
  return 0;
}

uint64_t __34__SBTelephonyManager_updateLocale__block_invoke()
{
  return _CTServerConnectionCopyMobileSubscriberHomeCountryList();
}

uint64_t __34__SBTelephonyManager_updateLocale__block_invoke_2()
{
  return CPPhoneNumberSetActiveCountryCode();
}

void __34__SBTelephonyManager_updateLocale__block_invoke_3(uint64_t a1)
{
  void *active;
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    active = (void *)CPPhoneNumberCopyActiveCountryCodeNoDefault();

    if (active)
    {
      SBLogStatusBarish();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "[SBTelephonyManager] updateLocale: clearing active country code for eSIM with none/many country codes", v6, 2u);
      }

      CPPhoneNumberSetActiveCountryCode();
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_primaryCarrierBundleInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeCountryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    v5 = (void *)CPPhoneNumberCopyActiveCountryCode();
  CPPhoneNumberSetHomeCountryCode();

}

- (void)_updateNetworkLocale
{
  _updateLocale(self, &__block_literal_global_95, &__block_literal_global_96, 0);
}

uint64_t __42__SBTelephonyManager__updateNetworkLocale__block_invoke()
{
  return _CTServerConnectionCopyMobileCountryCode();
}

uint64_t __42__SBTelephonyManager__updateNetworkLocale__block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogStatusBarish();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = a2;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "[SBTelephonyManager] _updateNetworkLocale: got updated country code: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return CPPhoneNumberSetNetworkCountryCode();
}

- (void)handleCallControlFailure:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBTelephonyManager handleCallControlFailure:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("SBTelephonyManager.m"), 683, CFSTR("this call must be made on the main thread"));

  }
  -[SBTelephonyManager updateCalls](self, "updateCalls");
  -[SBTelephonyManager activeCall](self, "activeCall");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    sInTelephonyCall = 1;
    SBUpdateCallState();
  }
  else
  {
    -[SBTelephonyManager outgoingCall](self, "outgoingCall");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sInTelephonyCall = v5 != 0;
    SBUpdateCallState();

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("SBCallCountChangedNotification"), 0, 0);

}

- (void)callEventHandler:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  unint64_t v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  unint64_t v42;
  id v43;

  v43 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBTelephonyManager callEventHandler:]");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, CFSTR("SBTelephonyManager.m"), 695, CFSTR("this call must be made on the main thread"));

  }
  objc_msgSend(v43, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "status");
  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "currentCallCount");

  -[SBTelephonyManager incomingCall](self, "incomingCall");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SBTelephonyManager incomingCall](self, "incomingCall");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTelephonyManager incomingCall](self, "incomingCall");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "status");

    if (v10 != 4)
      -[SBTelephonyManager setIncomingCall:](self, "setIncomingCall:", 0);
  }
  v11 = 0;
  v42 = v7;
  v12 = 0;
  v13 = 0;
  switch(v5)
  {
    case 1:
      -[SBTelephonyManager setActiveCall:](self, "setActiveCall:", v4);
      v12 = 0;
      v13 = 0;
      v41 = 1;
      v11 = 1;
      goto LABEL_31;
    case 2:
      -[SBTelephonyManager setHeldCall:](self, "setHeldCall:", v4);
      v11 = 0;
      goto LABEL_9;
    case 3:
      -[SBTelephonyManager outgoingCall](self, "outgoingCall");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
        goto LABEL_13;
      -[SBTelephonyManager outgoingCall](self, "outgoingCall");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqual:", v4);

      v17 = v8;
      if ((v16 & 1) != 0)
        goto LABEL_53;
      -[SBTelephonyManager setOutgoingCall:](self, "setOutgoingCall:", 0);
LABEL_13:
      -[SBTelephonyManager setOutgoingCall:](self, "setOutgoingCall:", v4);
      v11 = 1;
LABEL_14:
      v12 = 0;
      v13 = v7 == 1 && v5 == 3;
LABEL_27:
      -[SBTelephonyManager activeCall](self, "activeCall");
      v19 = objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v20 = (void *)v19;
        -[SBTelephonyManager activeCall](self, "activeCall");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqual:", v4);

        if (v22)
        {
          objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "callWithStatus:", 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBTelephonyManager setActiveCall:](self, "setActiveCall:", v24);

        }
      }
      v41 = 0;
      if (v5 == 2)
        goto LABEL_35;
LABEL_31:
      -[SBTelephonyManager heldCall](self, "heldCall");
      v25 = objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v26 = (void *)v25;
        -[SBTelephonyManager heldCall](self, "heldCall");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "isEqual:", v4);

        if (v28)
        {
          objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "callWithStatus:", 2);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBTelephonyManager setHeldCall:](self, "setHeldCall:", v30);

        }
      }
      if (v5 != 3)
      {
LABEL_35:
        -[SBTelephonyManager outgoingCall](self, "outgoingCall");
        v31 = objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          v32 = (void *)v31;
          -[SBTelephonyManager outgoingCall](self, "outgoingCall");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "isEqual:", v4);

          if (v34)
            -[SBTelephonyManager setOutgoingCall:](self, "setOutgoingCall:", 0);
        }
      }
      v17 = v8;
      if (v8 && objc_msgSend(v4, "isEqual:", v8))
      {
        v35 = v42;
        if (v5 != 4)
        {
          v36 = v41;
          if (v42 != 1)
            v36 = 0;
          v13 |= v36;
        }
      }
      else
      {
        v35 = v42;
        if (v5 == 4)
        {
          -[SBTelephonyManager setIncomingCall:](self, "setIncomingCall:", v4);
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "postNotificationName:object:", *MEMORY[0x1E0DAC340], v4);

        }
      }
      if ((v12 | v13) == 1)
      {
        sInTelephonyCall = v13;
        SBUpdateCallState();
      }
      if (__LastUpdatedCallCount != v35)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "postNotificationName:object:userInfo:", CFSTR("SBCallCountChangedNotification"), 0, 0);

      }
      if (v11)
        -[SBTelephonyManager updateSpringBoard](self, "updateSpringBoard");
      __LastUpdatedCallCount = (int)v35;
LABEL_53:

      return;
    case 4:
      goto LABEL_14;
    case 5:
      goto LABEL_27;
    case 6:
      if (!v8 && !v7)
        goto LABEL_25;
      v12 = 0;
      v11 = 1;
      v13 = 0;
      if (v7 <= 1 && v8)
      {
        if ((objc_msgSend(v4, "isEqual:", v8) & 1) != 0)
        {
LABEL_9:
          v12 = 0;
          v13 = 0;
        }
        else
        {
LABEL_25:
          v13 = 0;
          v11 = 1;
          v12 = 1;
        }
      }
      goto LABEL_27;
    default:
      v12 = 0;
      v13 = 0;
      goto LABEL_27;
  }
}

- (unint64_t)callCount
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentCallCount");

  return v3;
}

- (void)telephonyAudioChangeHandler
{
  id v2;

  if (-[SBTelephonyManager inCall](self, "inCall"))
  {
    +[SBIdleTimerGlobalCoordinator sharedInstance](SBIdleTimerGlobalCoordinator, "sharedInstance");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "resetIdleTimerForReason:", CFSTR("TelephonyManager:AudioChange"));

  }
}

- (id)displayedCall
{
  void *v3;

  -[SBTelephonyManager incomingCall](self, "incomingCall");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[SBTelephonyManager outgoingCall](self, "outgoingCall");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[SBTelephonyManager activeCall](self, "activeCall");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (BOOL)activeCallExists
{
  void *v2;
  BOOL v3;

  -[SBTelephonyManager activeCall](self, "activeCall");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)heldCallExists
{
  void *v2;
  BOOL v3;

  -[SBTelephonyManager heldCall](self, "heldCall");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)incomingCallExists
{
  void *v2;
  BOOL v3;

  -[SBTelephonyManager incomingCall](self, "incomingCall");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)outgoingCallExists
{
  void *v2;
  BOOL v3;

  -[SBTelephonyManager outgoingCall](self, "outgoingCall");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)multipleCallsExist
{
  void *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentCallCount");

  if (v3 < 2)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentCalls");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v6);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "isConferenced", (_QWORD)v11))
          {
            LOBYTE(v7) = 1;
            goto LABEL_13;
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v7;
}

- (BOOL)isCellDataSwitchingEnabled
{
  void *v2;
  char v3;

  -[SBTelephonyManager coreTelephonyClient](self, "coreTelephonyClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getSupportDynamicDataSimSwitchOnBBCallSync:", 0);

  return v3;
}

- (void)setCellDataSwitchingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;

  v3 = a3;
  -[SBTelephonyManager coreTelephonyClient](self, "coreTelephonyClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v5, "setSupportDynamicDataSimSwitchOnBBCall:", v3);

}

- (id)_subscriptionInfoForCall:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;

  objc_msgSend(a3, "localSenderIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBTelephonyManager telephonyStateProvider](self, "telephonyStateProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isSIMPresentForSlot:", 1))
  {
    objc_msgSend(v7, "subscriptionInfoForSlot:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", v6);

    if ((v10 & 1) != 0)
      goto LABEL_8;

  }
  if (!objc_msgSend(v7, "isSIMPresentForSlot:", 2))
  {
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v7, "subscriptionInfoForSlot:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", v6);

  if ((v12 & 1) == 0)
  {

    goto LABEL_7;
  }
LABEL_8:

  return v8;
}

- (id)_callsForService:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  int v13;

  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentCalls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __39__SBTelephonyManager__callsForService___block_invoke;
  v12[3] = &__block_descriptor_36_e23_B32__0__TUCall_8Q16_B24l;
  v13 = a3;
  objc_msgSend(v5, "indexesOfObjectsPassingTest:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectsAtIndexes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  v10 = v9;

  return v10;
}

BOOL __39__SBTelephonyManager__callsForService___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "service") == *(_DWORD *)(a1 + 32);
}

- (unint64_t)_callCountForService:(int)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentCalls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "service") == a3)
          ++v8;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)telephonyCallCount
{
  return -[SBTelephonyManager _callCountForService:](self, "_callCountForService:", 1);
}

- (unint64_t)faceTimeAudioCallCount
{
  return -[SBTelephonyManager _callCountForService:](self, "_callCountForService:", 2);
}

- (BOOL)inBargeCall
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bargeCalls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (BOOL)toggleBargeCallState
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frontmostBargeCall");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "handleWiredHeadsetFlashButtonForBargeCalls");
  else
    v5 = 0;

  return v5;
}

- (BOOL)isEndpointOnCurrentDevice
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "anyCallIsEndpointOnCurrentDevice");

  return v3;
}

- (void)disconnectIncomingCall
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBTelephonyManager incomingCall](self, "incomingCall");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "disconnectCall:", v3);

}

- (void)disconnectDisplayedCall
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBTelephonyManager displayedCall](self, "displayedCall");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "disconnectCall:", v3);

}

- (void)swapCalls
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[SBTelephonyManager heldCall](self, "heldCall");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[SBTelephonyManager activeCall](self, "activeCall");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[SBTelephonyManager heldCall](self, "heldCall");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "unholdCall:", v6);

    }
  }
}

- (void)disconnectAllCalls
{
  id v2;

  if (-[SBTelephonyManager inCall](self, "inCall"))
  {
    objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "disconnectAllCalls");

  }
}

- (void)disconnectCallAndActivateHeld
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disconnectCurrentCallAndActivateHeld");

}

- (void)dumpBasebandState:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SBTelephonyManager _serverConnection](self, "_serverConnection"))
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Dumping baseband state: %@", (uint8_t *)&v7, 0xCu);
    }

    v6 = _CTServerConnectionDumpBasebandState();
    if (HIDWORD(v6))
      -[SBTelephonyManager _serverConnectionDidError:](self, "_serverConnectionDidError:", v6);
  }

}

- (BOOL)isNetworkRegistrationEnabled
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSHomeDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("SBNetworkRegistrationCookie"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "fileExistsAtPath:", v4) ^ 1;

  return v5;
}

- (void)setNetworkRegistrationEnabled:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSHomeDirectory();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("SBNetworkRegistrationCookie"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeItemAtPath:error:", v6, 0);

    if (!-[SBTelephonyManager _serverConnection](self, "_serverConnection"))
      return;
    v7 = _CTServerConnectionEnableRegistration();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSHomeDirectory();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("SBNetworkRegistrationCookie"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeToFile:options:error:", v10, 0x10000000, 0);

    if (!-[SBTelephonyManager _serverConnection](self, "_serverConnection"))
      return;
    v7 = _CTServerConnectionDisableRegistration();
  }
  if (HIDWORD(v7))
    -[SBTelephonyManager _serverConnectionDidError:](self, "_serverConnectionDidError:", v7);
}

- (BOOL)isTTYEnabled
{
  void *v2;
  char v3;

  objc_msgSend(getRTTSettingsClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "TTYSoftwareEnabled") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "TTYHardwareEnabled");

  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  char v8;
  _QWORD v9[5];
  char v10;

  objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CB2CB8], a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__SBTelephonyManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v9[3] = &unk_1E8E9F508;
  v9[4] = self;
  v10 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v9);
}

void __69__SBTelephonyManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "isUsingVPNConnection");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 19) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 19) & 0xFE | v3;
    SBLogStatusBarish();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "isUsingVPNConnection");
      NSStringFromBOOL();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "SBTelephonyManager updated usingVPN to %{public}@", (uint8_t *)&v7, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("SBVPNConnectionChangedNotification"), 0, 0);

  }
}

- (BOOL)isUsingVPNConnection
{
  void *v4;
  void *v5;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBTelephonyManager isUsingVPNConnection]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("SBTelephonyManager.m"), 1113, CFSTR("this call must be made on the main thread"));

  }
  return *((_BYTE *)self + 19) & 1;
}

- (void)_setCurrentActivationAlertItem:(id)a3
{
  SBAlertItem *v5;
  SBAlertItem *v6;
  SBAlertItem **p_activationAlertItem;
  SBAlertItem *activationAlertItem;
  void *v9;
  void *v10;
  SBAlertItem *v11;

  v5 = (SBAlertItem *)a3;
  activationAlertItem = self->_activationAlertItem;
  p_activationAlertItem = &self->_activationAlertItem;
  v6 = activationAlertItem;
  v11 = v5;
  if (activationAlertItem != v5)
  {
    if (v6)
    {
      +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "deactivateAlertItem:", *p_activationAlertItem);

    }
    objc_storeStrong((id *)p_activationAlertItem, a3);
    if (*p_activationAlertItem)
    {
      -[SBAlertItem setSuppressForKeynote:](*p_activationAlertItem, "setSuppressForKeynote:", 1);
      +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "activateAlertItem:", *p_activationAlertItem);

    }
  }

}

- (void)_provisioningUpdateWithStatus:(int)a3 slot:(int64_t)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  SBDismissOnlyAlertItem *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  SBActivationFailedAlertItem *v20;
  void *v21;
  SBDismissOnlyAlertItem *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  id v27;

  -[SBTelephonyManager telephonyStateProvider](self, "telephonyStateProvider");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "subscriptionInfoForSlot:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "SIMStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0CA7818];
  v10 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CA7818]);

  objc_msgSend(v27, "subscriptionInfoForSlot:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "SIMStatus");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", v9);

  v14 = MGGetBoolAnswer();
  if (a3 == 2)
  {
    ++self->_numActivationFailures;
    if (self->_hasCellularTelephony)
    {
      v20 = -[SBActivationFailedAlertItem initWithFailureCount:slot:]([SBActivationFailedAlertItem alloc], "initWithFailureCount:slot:", self->_numActivationFailures, a4);
      goto LABEL_13;
    }
LABEL_15:
    v20 = 0;
LABEL_16:
    -[SBTelephonyManager _setCurrentActivationAlertItem:](self, "_setCurrentActivationAlertItem:", v20);
LABEL_17:

    goto LABEL_18;
  }
  if (a3 == 1)
  {
    if (self->_hasCellularTelephony)
    {
      v22 = [SBDismissOnlyAlertItem alloc];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("PHONE_ACTIVATED"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[SBDismissOnlyAlertItem initWithTitle:body:](v22, "initWithTitle:body:", v24, 0);

LABEL_13:
      +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isInSetupMode");

      if (v26)
        -[SBAlertItem setPendInSetupIfNotAllowed:](v20, "setPendInSetupIfNotAllowed:", 0);
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if (!a3 && (*((_BYTE *)self + 56) & 1) == 0 && v14 ^ 1 | v10 | v13)
  {
    if (self->_hasCellularTelephony)
    {
      v15 = [SBDismissOnlyAlertItem alloc];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("WAITING_FOR_ACTIVATION_TITLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("WAITING_FOR_ACTIVATION_BODY"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[SBDismissOnlyAlertItem initWithTitle:body:](v15, "initWithTitle:body:", v17, v19);

      +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v19) = objc_msgSend(v21, "isInSetupMode");

      if ((_DWORD)v19)
        -[SBAlertItem setPendInSetupIfNotAllowed:](v20, "setPendInSetupIfNotAllowed:", 0);
    }
    else
    {
      v20 = 0;
    }
    -[SBTelephonyManager _setCurrentActivationAlertItem:](self, "_setCurrentActivationAlertItem:", v20);
    *((_BYTE *)self + 56) |= 1u;
    goto LABEL_17;
  }
LABEL_18:

}

- (BOOL)isEmergencyCallActive
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentCalls");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "isEmergency", (_QWORD)v8) & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)_setIsInEmergencyCallbackMode:(unsigned __int8)a3
{
  uint64_t inEmergencyCallbackMode;
  int v4;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  inEmergencyCallbackMode = self->_inEmergencyCallbackMode;
  v4 = a3 != 0;
  self->_inEmergencyCallbackMode = v4;
  if ((_DWORD)inEmergencyCallbackMode != v4)
  {
    SBLogStatusBarish();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      SBTMCachedBooleanDebugName(inEmergencyCallbackMode);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      SBTMCachedBooleanDebugName(self->_inEmergencyCallbackMode);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v7;
      v12 = 2114;
      v13 = v8;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[SBTelephonyManager] _setIsInEmergencyCallbackMode: status changed from %{public}@ to %{public}@", (uint8_t *)&v10, 0x16u);

    }
  }
  +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setForceAlertsToPend:forReason:", objc_msgSend((id)__sharedTelephonyManager, "isInEmergencyCallbackMode"), CFSTR("isInEmergencyCallbackMode"));

}

- (id)_primarySubscriptionInfo
{
  int64_t v3;
  void *v4;
  void *v5;

  v3 = -[SBTelephonyManager _primarySubscriptionSlot](self, "_primarySubscriptionSlot");
  -[SBTelephonyManager telephonyStateProvider](self, "telephonyStateProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscriptionInfoForSlot:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_primaryCarrierBundleInfo
{
  int64_t v3;
  void *v4;
  void *v5;

  v3 = -[SBTelephonyManager _primarySubscriptionSlot](self, "_primarySubscriptionSlot");
  -[SBTelephonyManager telephonyStateProvider](self, "telephonyStateProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "carrierBundleInfoForSlot:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_primaryMobileEquipmentInfo
{
  int64_t v3;
  void *v4;
  void *v5;

  v3 = -[SBTelephonyManager _primarySubscriptionSlot](self, "_primarySubscriptionSlot");
  -[SBTelephonyManager telephonyStateProvider](self, "telephonyStateProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mobileEquipmentInfoForSlot:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_secondarySubscriptionInfo
{
  int64_t v3;
  void *v4;
  void *v5;

  v3 = -[SBTelephonyManager _secondarySubscriptionSlot](self, "_secondarySubscriptionSlot");
  -[SBTelephonyManager telephonyStateProvider](self, "telephonyStateProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscriptionInfoForSlot:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_secondaryCarrierBundleInfo
{
  int64_t v3;
  void *v4;
  void *v5;

  v3 = -[SBTelephonyManager _secondarySubscriptionSlot](self, "_secondarySubscriptionSlot");
  -[SBTelephonyManager telephonyStateProvider](self, "telephonyStateProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "carrierBundleInfoForSlot:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_secondaryMobileEquipmentInfo
{
  int64_t v3;
  void *v4;
  void *v5;

  v3 = -[SBTelephonyManager _secondarySubscriptionSlot](self, "_secondarySubscriptionSlot");
  -[SBTelephonyManager telephonyStateProvider](self, "telephonyStateProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mobileEquipmentInfoForSlot:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)_primarySubscriptionSlot
{
  int64_t result;

  if (!self->_containsCellularRadio)
    return 1;
  result = -[SBTelephonyManager _dataPreferredSubscriptionSlotIfSIMPresent](self, "_dataPreferredSubscriptionSlotIfSIMPresent");
  if (!result)
  {
    result = -[SBTelephonyManager _anySubscriptionSlotWithSIMPresent](self, "_anySubscriptionSlotWithSIMPresent");
    if ((unint64_t)result <= 1)
      return 1;
  }
  return result;
}

- (int64_t)_secondarySubscriptionSlot
{
  void *v3;
  int v4;

  if (self->_containsCellularRadio
    && (-[SBTelephonyManager telephonyStateProvider](self, "telephonyStateProvider"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "isDualSIMEnabled"),
        v3,
        v4))
  {
    return -[SBTelephonyManager _otherSubscriptionSlotIfSIMPresent:](self, "_otherSubscriptionSlotIfSIMPresent:", -[SBTelephonyManager _primarySubscriptionSlot](self, "_primarySubscriptionSlot"));
  }
  else
  {
    return 0;
  }
}

- (int64_t)_otherSubscriptionSlotIfSIMPresent:(int64_t)a3
{
  uint64_t v3;

  if (a3 == 1)
    v3 = 2;
  else
    v3 = 1;
  return -[SBTelephonyManager _subscriptionSlotIfSIMPresent:](self, "_subscriptionSlotIfSIMPresent:", v3);
}

- (int64_t)_dataPreferredSubscriptionSlotIfSIMPresent
{
  int64_t v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = -[SBTelephonyManager _subscriptionSlotIfSIMPresent:](self, "_subscriptionSlotIfSIMPresent:", 2);
  -[SBTelephonyManager telephonyStateProvider](self, "telephonyStateProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscriptionInfoForSlot:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isPreferredForDataConnections"))
    v6 = v3;
  else
    v6 = 1;

  return v6;
}

- (int64_t)_anySubscriptionSlotWithSIMPresent
{
  int64_t result;

  result = -[SBTelephonyManager _subscriptionSlotIfSIMPresent:](self, "_subscriptionSlotIfSIMPresent:", 1);
  if (!result)
    return -[SBTelephonyManager _subscriptionSlotIfSIMPresent:](self, "_subscriptionSlotIfSIMPresent:", 2);
  return result;
}

- (void)carrierBundleInfoDidChangeForStateProvider:(id)a3 slot:(int64_t)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__SBTelephonyManager_carrierBundleInfoDidChangeForStateProvider_slot___block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __70__SBTelephonyManager_carrierBundleInfoDidChangeForStateProvider_slot___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateLocale");
}

- (id)carrierDisabledApplicationIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[SBTelephonyManager _primaryCarrierBundleInfo](self, "_primaryCarrierBundleInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "disabledApplicationIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "addObjectsFromArray:", v4);
  -[SBTelephonyManager _secondaryCarrierBundleInfo](self, "_secondaryCarrierBundleInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "disabledApplicationIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v6, "addObjectsFromArray:", v8);

  return v6;
}

- (void)_queue_noteWirelessModemDynamicStoreChanged
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "Wireless modem data: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

BOOL __65__SBTelephonyManager__queue_noteWirelessModemDynamicStoreChanged__block_invoke(uint64_t a1, const __CFString *a2)
{
  const __CFAllocator *v4;
  const __CFString *v5;
  const __CFString *ValueAtIndex;
  const __CFString *NetworkInterfaceEntity;
  const __CFString *v8;
  CFPropertyListRef v9;
  _BOOL8 v10;

  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v5 = (const __CFString *)*MEMORY[0x1E0CE8B30];
  ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 40), 0);
  NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(v4, v5, ValueAtIndex, a2);
  if (!NetworkInterfaceEntity)
    return 0;
  v8 = NetworkInterfaceEntity;
  v9 = SCDynamicStoreCopyValue(*(SCDynamicStoreRef *)(*(_QWORD *)(a1 + 32) + 32), NetworkInterfaceEntity);
  v10 = v9 != 0;
  if (v9)
    CFRelease(v9);
  CFRelease(v8);
  return v10;
}

uint64_t __65__SBTelephonyManager__queue_noteWirelessModemDynamicStoreChanged__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v3;
  const __CFString *v4;
  int v6;
  const __CFString *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  SBLogStatusBarish();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_DWORD *)(a1 + 40);
    if (*(_BYTE *)(a1 + 44))
      v4 = CFSTR("ON");
    else
      v4 = CFSTR("OFF");
    v6 = 138543618;
    v7 = v4;
    v8 = 1024;
    v9 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "Received notification that wireless modem state changed. Tethering is currently %{public}@ with %d devices connected.", (uint8_t *)&v6, 0x12u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_setIsNetworkTethering:withNumberOfDevices:", *(unsigned __int8 *)(a1 + 44), *(unsigned int *)(a1 + 40));
}

- (BOOL)isNetworkTethering
{
  return self->_isNetworkTethering;
}

- (int)numberOfNetworkTetheredDevices
{
  return self->_numberOfNetworkTetheredDevices;
}

- (void)_setIsNetworkTethering:(BOOL)a3 withNumberOfDevices:(int)a4
{
  _BOOL4 v5;
  NSObject *v7;
  const __CFString *v8;
  int numberOfNetworkTetheredDevices;
  const __CFString *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v5 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  if (self->_isNetworkTethering != a3 || self->_numberOfNetworkTetheredDevices != a4)
  {
    SBLogStatusBarish();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = CFSTR("ON");
      numberOfNetworkTetheredDevices = self->_numberOfNetworkTetheredDevices;
      if (self->_isNetworkTethering)
        v10 = CFSTR("ON");
      else
        v10 = CFSTR("OFF");
      v12 = 138413058;
      if (!v5)
        v8 = CFSTR("OFF");
      v13 = v10;
      v14 = 1024;
      v15 = numberOfNetworkTetheredDevices;
      v16 = 2114;
      v17 = v8;
      v18 = 1024;
      v19 = a4;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Previous tethering state was %@ with %d devices connected; new state is %{public}@ with %d devices connected; updating UI.",
        (uint8_t *)&v12,
        0x22u);
    }

    self->_isNetworkTethering = v5;
    self->_numberOfNetworkTetheredDevices = a4;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:", *MEMORY[0x1E0DAC360], 0);

  }
}

void __48__SBTelephonyManager_preHeatDataLinkForDomains___block_invoke(uint64_t a1)
{
  const char *v1;
  addrinfo *v2;

  v1 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
  if (v1)
  {
    v2 = 0;
    getaddrinfo(v1, 0, 0, &v2);
    if (v2)
      freeaddrinfo(v2);
  }
}

- (TUCall)incomingCall
{
  return self->_incomingCall;
}

- (void)setIncomingCall:(id)a3
{
  objc_storeStrong((id *)&self->_incomingCall, a3);
}

- (TUCall)activeCall
{
  return self->_activeCall;
}

- (void)setActiveCall:(id)a3
{
  objc_storeStrong((id *)&self->_activeCall, a3);
}

- (TUCall)heldCall
{
  return self->_heldCall;
}

- (void)setHeldCall:(id)a3
{
  objc_storeStrong((id *)&self->_heldCall, a3);
}

- (TUCall)outgoingCall
{
  return self->_outgoingCall;
}

- (void)setOutgoingCall:(id)a3
{
  objc_storeStrong((id *)&self->_outgoingCall, a3);
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
  objc_storeStrong((id *)&self->_coreTelephonyClient, a3);
}

- (SBBluetoothController)bluetoothController
{
  return self->_bluetoothController;
}

- (void)setCachedSlot1CountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)cachedSlot2CountryCode
{
  return self->_cachedSlot2CountryCode;
}

- (void)setCachedSlot2CountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void)setCachedSlot1SIMStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSString)cachedSlot2SIMStatus
{
  return self->_cachedSlot2SIMStatus;
}

- (void)setCachedSlot2SIMStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSlot2SIMStatus, 0);
  objc_storeStrong((id *)&self->_cachedSlot1SIMStatus, 0);
  objc_storeStrong((id *)&self->_cachedSlot2CountryCode, 0);
  objc_storeStrong((id *)&self->_cachedSlot1CountryCode, 0);
  objc_storeStrong((id *)&self->_bluetoothController, 0);
  objc_storeStrong((id *)&self->_wifiDomain, 0);
  objc_storeStrong((id *)&self->_telephonyStateProvider, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_outgoingCall, 0);
  objc_storeStrong((id *)&self->_heldCall, 0);
  objc_storeStrong((id *)&self->_activeCall, 0);
  objc_storeStrong((id *)&self->_incomingCall, 0);
  objc_storeStrong((id *)&self->_systemPathMonitor, 0);
  objc_storeStrong((id *)&self->_activationAlertItem, 0);
  objc_storeStrong((id *)&self->_wirelessModemDynamicStoreQueue, 0);
}

- (void)_serverConnection
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "Unable to create CFServerConnection. Telephony state may be incorrect.", v1, 2u);
}

- (void)_avSystemControllerDidError:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "code");
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackReturnAddresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412802;
  v8 = v4;
  v9 = 2048;
  v10 = v5;
  v11 = 2114;
  v12 = v6;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "AVSystemController returned error: (%@, %li). Destroying connection. (Callstack: %{public}@)", (uint8_t *)&v7, 0x20u);

}

- (void)_serverConnectionDidError:(unint64_t)a1 .cold.1(unint64_t a1, NSObject *a2)
{
  int v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v3 = a1;
  v12 = *MEMORY[0x1E0C80C00];
  v4 = HIDWORD(a1);
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackReturnAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 67109634;
  v7[1] = v3;
  v8 = 1024;
  v9 = v4;
  v10 = 2114;
  v11 = v5;
  OUTLINED_FUNCTION_1_2(&dword_1D0540000, a2, v6, "CTServerConnection returned error: (%i, %i). Destroying connection. (Callstack: %{public}@)", (uint8_t *)v7);

}

- (void)queue_setFastDormancySuspended:(os_log_t)log withConnection:.cold.1(int a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "CTServerConnection failed to acquire fastDormancySuspend assertion: (%i, %i)", (uint8_t *)v3, 0xEu);
  OUTLINED_FUNCTION_2_0();
}

@end
