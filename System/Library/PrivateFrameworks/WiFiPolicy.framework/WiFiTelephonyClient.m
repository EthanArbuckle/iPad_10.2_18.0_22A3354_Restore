@implementation WiFiTelephonyClient

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_11);
  return (id)sharedInstance_sharedClient;
}

void __37__WiFiTelephonyClient_sharedInstance__block_invoke()
{
  WiFiTelephonyClient *v0;
  void *v1;

  v0 = objc_alloc_init(WiFiTelephonyClient);
  v1 = (void *)sharedInstance_sharedClient;
  sharedInstance_sharedClient = (uint64_t)v0;

}

- (WiFiTelephonyClient)init
{
  WiFiTelephonyClient *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *internalQueue;
  uint64_t v6;
  CoreTelephonyClient *coreTelephonyClient;
  NSObject *v8;
  WiFiTelephonyClient *v9;
  _QWORD block[4];
  WiFiTelephonyClient *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WiFiTelephonyClient;
  v2 = -[WiFiTelephonyClient init](&v13, sel_init);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("com.apple.wifi.telephony-client", v3);
  internalQueue = v2->_internalQueue;
  v2->_internalQueue = (OS_dispatch_queue *)v4;

  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E40]), "initWithQueue:", v2->_internalQueue);
  coreTelephonyClient = v2->_coreTelephonyClient;
  v2->_coreTelephonyClient = (CoreTelephonyClient *)v6;

  -[CoreTelephonyClient setDelegate:](v2->_coreTelephonyClient, "setDelegate:", v2);
  v8 = v2->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__WiFiTelephonyClient_init__block_invoke;
  block[3] = &unk_1E881C8E8;
  v9 = v2;
  v12 = v9;
  dispatch_async(v8, block);

  return v9;
}

void __27__WiFiTelephonyClient_init__block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "_updateCellularMEIAndDataStatus");
  objc_msgSend(*(id *)(a1 + 32), "cellularDataStatusChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "cellularDataStatusChangedHandler");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

- (id)_getCurrentDataServiceContext
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  int v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[WiFiTelephonyClient coreTelephonyClient](self, "coreTelephonyClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WiFiTelephonyClient coreTelephonyClient](self, "coreTelephonyClient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    objc_msgSend(v4, "getSubscriptionInfoWithError:", &v31);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v31;
    objc_msgSend(v5, "subscriptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[WiFiTelephonyClient coreTelephonyClient](self, "coreTelephonyClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v6;
    objc_msgSend(v8, "getCurrentDataSubscriptionContextSync:", &v30);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v30;

    if (!v9)
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v11 = v7;
      v9 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      if (v9)
      {
        v12 = *(_QWORD *)v27;
        while (2)
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(_QWORD *)v27 != v12)
              objc_enumerationMutation(v11);
            v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v14, "userDataPreferred", (_QWORD)v26);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "intValue");

            if (v16)
            {
              v9 = v14;
              goto LABEL_16;
            }
          }
          v9 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
          if (v9)
            continue;
          break;
        }
      }
LABEL_16:

    }
    return v9;
  }
  else
  {
    v17 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v17)
      -[WiFiTelephonyClient _getCurrentDataServiceContext].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);
    return 0;
  }
}

- (void)_updateCellularMEIAndDataStatus
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_8(&dword_1CC44E000, MEMORY[0x1E0C81028], v0, "%s: getMobileEquipmentInfo with subscription failed: %{public}@", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __54__WiFiTelephonyClient__updateCellularMEIAndDataStatus__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "internalQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__WiFiTelephonyClient__updateCellularMEIAndDataStatus__block_invoke_2;
  v7[3] = &unk_1E881C8C0;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __54__WiFiTelephonyClient__updateCellularMEIAndDataStatus__block_invoke_2(uint64_t a1)
{
  _BOOL8 v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isRegistered")
    && objc_msgSend(*(id *)(a1 + 32), "contextType") == 1;
  return objc_msgSend(*(id *)(a1 + 40), "setImsRegistrationActiveAndOnWiFi:", v2);
}

- (void)reliableNetworkFallbackChanged:(BOOL)a3 userEnabled:(BOOL)a4
{
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;

  -[WiFiTelephonyClient internalQueue](self, "internalQueue", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__WiFiTelephonyClient_reliableNetworkFallbackChanged_userEnabled___block_invoke;
  v7[3] = &unk_1E881C960;
  v7[4] = self;
  v8 = a4;
  dispatch_async(v6, v7);

}

void __66__WiFiTelephonyClient_reliableNetworkFallbackChanged_userEnabled___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "setCellularFallbackEnabled:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "cellularFallbackStatusChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "cellularFallbackStatusChangedHandler");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

- (void)imsRegistrationChanged:(id)a3 info:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  WiFiTelephonyClient *v10;

  v5 = a4;
  -[WiFiTelephonyClient internalQueue](self, "internalQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__WiFiTelephonyClient_imsRegistrationChanged_info___block_invoke;
  v8[3] = &unk_1E881C8C0;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __51__WiFiTelephonyClient_imsRegistrationChanged_info___block_invoke(uint64_t a1)
{
  _BOOL8 v2;
  void *v3;
  void (**v4)(void);

  v2 = objc_msgSend(*(id *)(a1 + 32), "isRegistered")
    && objc_msgSend(*(id *)(a1 + 32), "contextType") == 1;
  objc_msgSend(*(id *)(a1 + 40), "setImsRegistrationActiveAndOnWiFi:", v2);
  objc_msgSend(*(id *)(a1 + 40), "imsRegistrationStatusChangedHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "imsRegistrationStatusChangedHandler");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5
{
  NSObject *v6;
  _QWORD block[5];

  -[WiFiTelephonyClient internalQueue](self, "internalQueue", a3, *(_QWORD *)&a4, a5);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__WiFiTelephonyClient_connectionStateChanged_connection_dataConnectionStatusInfo___block_invoke;
  block[3] = &unk_1E881C8E8;
  block[4] = self;
  dispatch_async(v6, block);

}

void __82__WiFiTelephonyClient_connectionStateChanged_connection_dataConnectionStatusInfo___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "_updateCellularMEIAndDataStatus");
  objc_msgSend(*(id *)(a1 + 32), "cellularDataStatusChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "cellularDataStatusChangedHandler");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

- (void)displayStatusChanged:(id)a3 status:(id)a4
{
  NSObject *v5;
  _QWORD block[5];

  -[WiFiTelephonyClient internalQueue](self, "internalQueue", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__WiFiTelephonyClient_displayStatusChanged_status___block_invoke;
  block[3] = &unk_1E881C8E8;
  block[4] = self;
  dispatch_async(v5, block);

}

void __51__WiFiTelephonyClient_displayStatusChanged_status___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "_updateCellularMEIAndDataStatus");
  objc_msgSend(*(id *)(a1 + 32), "cellularDataStatusChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "cellularDataStatusChangedHandler");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

- (void)carrierBundleChange:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[WiFiTelephonyClient internalQueue](self, "internalQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__WiFiTelephonyClient_carrierBundleChange___block_invoke;
  block[3] = &unk_1E881C8E8;
  block[4] = self;
  dispatch_async(v4, block);

}

void __43__WiFiTelephonyClient_carrierBundleChange___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "_updateCellularMEIAndDataStatus");
  objc_msgSend(*(id *)(a1 + 32), "cellularDataStatusChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "cellularDataStatusChangedHandler");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

- (id)_dataIndicatorToString:(int)a3
{
  if (a3 > 0x12)
    return CFSTR("unknown");
  else
    return off_1E881E2B0[a3];
}

- (BOOL)isCellular5GActive
{
  void *v2;

  -[WiFiTelephonyClient dataStatus](self, "dataStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indicator");

  return 0;
}

- (BOOL)isCellularLTEActive
{
  void *v2;
  void *v3;
  BOOL v4;

  -[WiFiTelephonyClient dataStatus](self, "dataStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "indicator") > 6;
  else
    v4 = 1;

  return v4;
}

- (BOOL)isCellularDataInRoaming
{
  void *v2;
  char v3;

  -[WiFiTelephonyClient registrationStatus](self, "registrationStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CA77A8]);

  return v3;
}

- (NSString)cellularICCID
{
  void *v2;
  void *v3;

  -[WiFiTelephonyClient mobileEquipmentInfo](self, "mobileEquipmentInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ICCID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)cellularInterfaceName
{
  void *v2;
  void *v3;

  -[WiFiTelephonyClient connectionStatus](self, "connectionStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "interfaceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)cellularDataIndicator
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  NSString *v6;

  -[WiFiTelephonyClient dataStatus](self, "dataStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiTelephonyClient _dataIndicatorToString:](self, "_dataIndicatorToString:", objc_msgSend(v3, "indicator"));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = v4;
  else
    v5 = CFSTR("undefined");
  v6 = v5;

  return v6;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WiFiTelephonyClient cellularDataIndicator](self, "cellularDataIndicator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("Indicator:%@ "), v7);

  -[WiFiTelephonyClient radioAccessTechnology](self, "radioAccessTechnology");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("RAT:%@ "), v8);

  -[WiFiTelephonyClient registrationStatus](self, "registrationStatus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("Reg:%@ "), v9);

  -[WiFiTelephonyClient cellularInterfaceName](self, "cellularInterfaceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("IfName:%@ "), v10);

  -[WiFiTelephonyClient carrierName](self, "carrierName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("Carrier:%@ "), v11);

  if (-[WiFiTelephonyClient isCellular5GSupported](self, "isCellular5GSupported"))
    v12 = CFSTR("Y");
  else
    v12 = CFSTR("N");
  objc_msgSend(v6, "appendFormat:", CFSTR("5GSupported:%@ "), v12);
  if (-[WiFiTelephonyClient isCellularFallbackEnabled](self, "isCellularFallbackEnabled"))
    v13 = CFSTR("Y");
  else
    v13 = CFSTR("N");
  objc_msgSend(v6, "appendFormat:", CFSTR("RNFEnabled:%@ "), v13);
  if (-[WiFiTelephonyClient isIMSRegistrationActiveAndOnWiFi](self, "isIMSRegistrationActiveAndOnWiFi"))
    v14 = CFSTR("Y");
  else
    v14 = CFSTR("N");
  objc_msgSend(v6, "appendFormat:", CFSTR("IMSOnWiFi:%@"), v14);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return (NSString *)v6;
}

- (id)cellularFallbackStatusChangedHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setCellularFallbackStatusChangedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (id)imsRegistrationStatusChangedHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setImsRegistrationStatusChangedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (id)cellularDataStatusChangedHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setCellularDataStatusChangedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (BOOL)isCellularFallbackEnabled
{
  return self->_cellularFallbackEnabled;
}

- (BOOL)isIMSRegistrationActiveAndOnWiFi
{
  return self->_imsRegistrationActiveAndOnWiFi;
}

- (BOOL)isCellular5GSupported
{
  return self->_cellular5GSupported;
}

- (OS_dispatch_queue)internalQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInternalQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCoreTelephonyClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (CTMobileEquipmentInfo)mobileEquipmentInfo
{
  return (CTMobileEquipmentInfo *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMobileEquipmentInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (CTDataStatus)dataStatus
{
  return (CTDataStatus *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDataStatus:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (CTDataConnectionStatus)connectionStatus
{
  return (CTDataConnectionStatus *)objc_getProperty(self, a2, 72, 1);
}

- (void)setConnectionStatus:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)radioAccessTechnology
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setRadioAccessTechnology:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)registrationStatus
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRegistrationStatus:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)carrierName
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCarrierName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void)setCellular5GSupported:(BOOL)a3
{
  self->_cellular5GSupported = a3;
}

- (void)setCellularFallbackEnabled:(BOOL)a3
{
  self->_cellularFallbackEnabled = a3;
}

- (void)setImsRegistrationActiveAndOnWiFi:(BOOL)a3
{
  self->_imsRegistrationActiveAndOnWiFi = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_registrationStatus, 0);
  objc_storeStrong((id *)&self->_radioAccessTechnology, 0);
  objc_storeStrong((id *)&self->_connectionStatus, 0);
  objc_storeStrong((id *)&self->_dataStatus, 0);
  objc_storeStrong((id *)&self->_mobileEquipmentInfo, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong(&self->_cellularDataStatusChangedHandler, 0);
  objc_storeStrong(&self->_imsRegistrationStatusChangedHandler, 0);
  objc_storeStrong(&self->_cellularFallbackStatusChangedHandler, 0);
}

- (void)_getCurrentDataServiceContext
{
  OUTLINED_FUNCTION_4(&dword_1CC44E000, MEMORY[0x1E0C81028], a3, "%s: nil coreTelephonyClient", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
