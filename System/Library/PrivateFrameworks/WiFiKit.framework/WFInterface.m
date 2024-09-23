@implementation WFInterface

void __29__WFInterface_currentNetwork__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "coreWiFiCurrentNetwork");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (WFNetworkScanRecord)coreWiFiCurrentNetwork
{
  return self->_coreWiFiCurrentNetwork;
}

uint64_t __35__WFInterface_asyncCurrentNetwork___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCoreWiFiCurrentNetwork:", *(_QWORD *)(a1 + 40));
}

- (void)setCoreWiFiCurrentNetwork:(id)a3
{
  objc_storeStrong((id *)&self->_coreWiFiCurrentNetwork, a3);
}

void __35__WFInterface_asyncCurrentNetwork___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  NSObject *v7;
  os_log_type_t v8;
  NSObject *v9;
  WFCurrentNetworkScanRecord *v10;
  void *v11;
  void *v12;
  WFCurrentNetworkScanRecord *v13;
  char v14;
  WFCurrentNetworkScanRecord *v15;
  NSObject *v16;
  WFCurrentNetworkScanRecord *v17;
  uint64_t v18;
  void *v19;
  int v20;
  _BOOL4 v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  WFCurrentNetworkScanRecord *v32;
  uint64_t v33;
  _QWORD v34[7];
  _QWORD v35[5];
  WFCurrentNetworkScanRecord *v36;
  _QWORD block[6];
  uint8_t v38[4];
  const char *v39;
  __int16 v40;
  WFCurrentNetworkScanRecord *v41;
  __int16 v42;
  uint64_t v43;
  _BYTE buf[24];
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "cInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentScanResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "irInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentScanResult");
  v6 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();

  WFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[WFInterface asyncCurrentNetwork:]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 2112;
    v45 = v6;
    _os_log_impl(&dword_219FC8000, v7, v8, "%s: infraScanResult='%@' nanScanResult='%@'", buf, 0x20u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v45 = __Block_byref_object_copy__0;
  v46 = __Block_byref_object_dispose__0;
  v47 = 0;
  v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__WFInterface_asyncCurrentNetwork___block_invoke_45;
  block[3] = &unk_24DC353A0;
  block[4] = WeakRetained;
  block[5] = buf;
  dispatch_sync(v9, block);
  if (v4)
  {
    v10 = [WFCurrentNetworkScanRecord alloc];
    objc_msgSend(WeakRetained, "cInterface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentKnownNetworkProfile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[WFCurrentNetworkScanRecord initWithScanResult:knownNetworkProfile:](v10, "initWithScanResult:knownNetworkProfile:", v4, v12);
    v14 = 0;
  }
  else
  {
    if (!v6)
    {
      v13 = 0;
      goto LABEL_10;
    }
    v15 = [WFCurrentNetworkScanRecord alloc];
    objc_msgSend(WeakRetained, "irInterface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentKnownNetworkProfile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[WFCurrentNetworkScanRecord initWithScanResult:knownNetworkProfile:](v15, "initWithScanResult:knownNetworkProfile:", v6, v12);
    v14 = 1;
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 13) = v14;
LABEL_10:
  v16 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __35__WFInterface_asyncCurrentNetwork___block_invoke_2;
  v35[3] = &unk_24DC34BE8;
  v35[4] = WeakRetained;
  v17 = v13;
  v36 = v17;
  dispatch_sync(v16, v35);
  v18 = *(_QWORD *)&buf[8];
  v19 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (!v19 || !v17)
  {
    v21 = v19 == 0;
    if (!v19 || v17)
      goto LABEL_17;
LABEL_16:
    v22 = 1;
    goto LABEL_20;
  }
  v20 = objc_msgSend(v19, "isEqual:", v17);
  v18 = *(_QWORD *)&buf[8];
  if (!v20)
    goto LABEL_16;
  v21 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40) == 0;
LABEL_17:
  if (v17)
    v22 = v21;
  else
    v22 = 0;
LABEL_20:
  objc_msgSend(*(id *)(v18 + 40), "matchingKnownNetworkProfile");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isStandalone6G");
  -[WFNetworkScanRecord matchingKnownNetworkProfile](v17, "matchingKnownNetworkProfile");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isStandalone6G");

  if (v22 | v24 ^ v26)
  {
    WFLogForCategory(0);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v27 && os_log_type_enabled(v27, v28))
    {
      v29 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      *(_DWORD *)v38 = 136315650;
      v39 = "-[WFInterface asyncCurrentNetwork:]_block_invoke_3";
      v40 = 2112;
      v41 = v17;
      v42 = 2112;
      v43 = v29;
      _os_log_impl(&dword_219FC8000, v27, v28, "%s: network changed to: '%@' from: '%@'", v38, 0x20u);
    }

    objc_msgSend(WeakRetained, "_resetCurrentNetworkStates");
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __35__WFInterface_asyncCurrentNetwork___block_invoke_48;
    v34[3] = &unk_24DC353C8;
    v34[4] = WeakRetained;
    v34[5] = buf;
    v34[6] = 0;
    dispatch_async(MEMORY[0x24BDAC9B8], v34);
  }
  else
  {
    WFLogForCategory(0);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v30 && os_log_type_enabled(v30, v31))
    {
      v32 = *(WFCurrentNetworkScanRecord **)(*(_QWORD *)&buf[8] + 40);
      *(_DWORD *)v38 = 136315394;
      v39 = "-[WFInterface asyncCurrentNetwork:]_block_invoke_2";
      v40 = 2112;
      v41 = v32;
      _os_log_impl(&dword_219FC8000, v30, v31, "%s: no change to network '%@'", v38, 0x16u);
    }

  }
  v33 = *(_QWORD *)(a1 + 40);
  if (v33)
    (*(void (**)(uint64_t, WFCurrentNetworkScanRecord *))(v33 + 16))(v33, v17);

  _Block_object_dispose(buf, 8);
}

- (CWFInterface)cInterface
{
  return self->_cInterface;
}

- (WFNetworkScanRecord)currentNetwork
{
  NSObject *currentNetworkQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  currentNetworkQueue = self->_currentNetworkQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __29__WFInterface_currentNetwork__block_invoke;
  v5[3] = &unk_24DC353A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(currentNetworkQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (WFNetworkScanRecord *)v3;
}

- (CWFInterface)irInterface
{
  return self->_irInterface;
}

- (void)asyncCurrentNetwork:(id)a3
{
  id v4;
  NSObject *networkProcessingQueue;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  networkProcessingQueue = self->_networkProcessingQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__WFInterface_asyncCurrentNetwork___block_invoke;
  v7[3] = &unk_24DC353F0;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(networkProcessingQueue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

uint64_t __34__WFInterface__initCurrentNetwork__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_currentNetworkDidChangeWithReason:previousNetwork:", 0, 0);
}

void __34__WFInterface__initCurrentNetwork__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __34__WFInterface__initCurrentNetwork__block_invoke_2(uint64_t a1)
{
  WFCurrentNetworkScanRecord *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = [WFCurrentNetworkScanRecord alloc];
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "cInterface");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentKnownNetworkProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WFCurrentNetworkScanRecord initWithScanResult:knownNetworkProfile:](v2, "initWithScanResult:knownNetworkProfile:", v3, v4);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v5;

}

void __34__WFInterface__initCurrentNetwork__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  _QWORD v17[5];
  _QWORD v18[5];
  uint64_t v19;
  id v20;
  _QWORD v21[5];
  _QWORD v22[6];
  _QWORD v23[5];
  void *v24;
  _QWORD block[5];
  _QWORD v26[2];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "currentScanResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "currentScanResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "currentKnownNetworkProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(NSObject **)(v7 + 80);
    v9 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __34__WFInterface__initCurrentNetwork__block_invoke_2;
    block[3] = &unk_24DC34BC0;
    block[4] = v7;
    v10 = (id *)v26;
    v26[0] = v3;
    v26[1] = WeakRetained;
    dispatch_sync(v8, block);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 13) = 0;
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x3032000000;
    v23[3] = __Block_byref_object_copy__0;
    v23[4] = __Block_byref_object_dispose__0;
    v24 = 0;
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(NSObject **)(v11 + 80);
    v22[0] = v9;
    v22[1] = 3221225472;
    v22[2] = __34__WFInterface__initCurrentNetwork__block_invoke_3;
    v22[3] = &unk_24DC353A0;
    v22[4] = v11;
    v22[5] = v23;
    dispatch_sync(v12, v22);
    v21[0] = v9;
    v21[1] = 3221225472;
    v21[2] = __34__WFInterface__initCurrentNetwork__block_invoke_4;
    v21[3] = &unk_24DC348F8;
    v21[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], v21);
    _Block_object_dispose(v23, 8);
    v13 = v24;
LABEL_5:

    goto LABEL_6;
  }
  if (v4)
  {
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(NSObject **)(v14 + 80);
    v16 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __34__WFInterface__initCurrentNetwork__block_invoke_5;
    v18[3] = &unk_24DC34BC0;
    v10 = (id *)&v19;
    v18[4] = v14;
    v19 = 0;
    v20 = v5;
    dispatch_sync(v15, v18);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 13) = 1;
    v17[0] = v16;
    v17[1] = 3221225472;
    v17[2] = __34__WFInterface__initCurrentNetwork__block_invoke_6;
    v17[3] = &unk_24DC348F8;
    v17[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], v17);
    v13 = v20;
    goto LABEL_5;
  }
LABEL_6:

}

- (void)setWifiClient:(id)a3
{
  objc_storeWeak((id *)&self->_wifiClient, a3);
}

- (void)setMonitoringEvents:(BOOL)a3
{
  self->_monitoringEvents = a3;
}

- (void)setDevice:(__WiFiDeviceClient *)a3
{
  __WiFiDeviceClient *device;

  device = self->_device;
  if (device)
    CFRelease(device);
  self->_device = a3;
  if (a3)
    CFRetain(a3);
}

- (BOOL)monitoringEvents
{
  return self->_monitoringEvents;
}

- (WFInterface)initWithDevice:(__WiFiDeviceClient *)a3 coreWiFiInterface:(id)a4
{
  return -[WFInterface initWithDevice:coreWiFiInterface:interfaceName:](self, "initWithDevice:coreWiFiInterface:interfaceName:", a3, a4, 0);
}

- (void)createNANInterface
{
  void *v3;
  CWFInterface *v4;
  CWFInterface *irInterface;
  NSObject *v6;
  os_log_type_t v7;
  CWFInterface *v8;
  int v9;
  const char *v10;
  __int16 v11;
  CWFInterface *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[WFInterface cInterface](self, "cInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "NANData");
  v4 = (CWFInterface *)objc_claimAutoreleasedReturnValue();
  irInterface = self->_irInterface;
  self->_irInterface = v4;

  self->_associatedOnIRInterface = 0;
  WFLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
  {
    v8 = self->_irInterface;
    v9 = 136315394;
    v10 = "-[WFInterface createNANInterface]";
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_219FC8000, v6, v7, "%s: NAN interface: %@", (uint8_t *)&v9, 0x16u);
  }

}

- (void)_startMonitoringWiFiEvents
{
  NSObject *v3;
  os_log_type_t v4;
  id v5;
  uint8_t buf[16];

  if (-[WFInterface monitoringEvents](self, "monitoringEvents"))
  {
    WFLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = OSLogForWFLogLevel(2uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 2 && v3 && os_log_type_enabled(v3, v4))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219FC8000, v3, v4, "Already monitoring wifi events.", buf, 2u);
    }

  }
  else
  {
    -[WFInterface setMonitoringEvents:](self, "setMonitoringEvents:", 1);
    WiFiDeviceClientRegisterHostApStateChangedCallback();
    WiFiDeviceClientRegisterCarPlayNetworkTypeChangeCallback();
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__wifiManagerRestarted_, CFSTR("WFClientServerRestartedNotification"), 0);

  }
}

- (void)_initCurrentNetwork
{
  NSObject *networkProcessingQueue;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  networkProcessingQueue = self->_networkProcessingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__WFInterface__initCurrentNetwork__block_invoke;
  block[3] = &unk_24DC34750;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(networkProcessingQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)isReadyForConnectionVelocityTest
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint64_t v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  os_log_type_t v15;
  _DWORD v16[2];
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[WFInterface cInterface](self, "cInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFInterface cInterface](self, "cInterface");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "IPv4RouterAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = 1;
    }
    else
    {
      -[WFInterface cInterface](self, "cInterface");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "IPv6RouterAddress");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v11 != 0;

    }
    -[WFInterface cInterface](self, "cInterface");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "DHCPLeaseStartedAt");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    WFLogForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v14 && os_log_type_enabled(v14, v15))
    {
      v16[0] = 67109376;
      v16[1] = v6;
      v17 = 1024;
      v18 = v13 != 0;
      _os_log_impl(&dword_219FC8000, v14, v15, "network has valid IP: %d, network has DHCP Lease: %d", (uint8_t *)v16, 0xEu);
    }

    return v13 && v6;
  }
  else
  {
    WFLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, (os_log_type_t)v8))
    {
      LOWORD(v16[0]) = 0;
      _os_log_impl(&dword_219FC8000, v7, (os_log_type_t)v8, "Unable to get core wifi interface!", (uint8_t *)v16, 2u);
    }

    return 0;
  }
}

- (WFInterface)initWithDevice:(__WiFiDeviceClient *)a3
{
  return -[WFInterface initWithDevice:coreWiFiInterface:](self, "initWithDevice:coreWiFiInterface:", a3, 0);
}

- (WFInterface)initWithDevice:(__WiFiDeviceClient *)a3 coreWiFiInterface:(id)a4 interfaceName:(id)a5
{
  id v9;
  NSString *v10;
  WFInterface *v11;
  NSString *v12;
  NSString *interfaceName;
  NSString *v14;
  NSObject *v15;
  os_log_type_t v16;
  BOOL v17;
  int v18;
  OS_dispatch_queue *v19;
  OS_dispatch_queue *currentNetworkQueue;
  OS_dispatch_queue *v21;
  OS_dispatch_queue *networkProcessingQueue;
  NSOperationQueue *v23;
  NSOperationQueue *joinQueue;
  NSOperationQueue *v25;
  WFIPMonitor *v26;
  WFIPMonitor *ipMonitor;
  NSObject *v28;
  os_log_type_t v29;
  os_log_type_t v31;
  const char *v32;
  NSObject *v33;
  os_log_type_t v34;
  __WiFiDeviceClient *device;
  objc_super v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  NSString *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = (NSString *)a5;
  if (!a3)
  {
    WFLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    v31 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v15 || !os_log_type_enabled(v15, v31))
      goto LABEL_37;
    *(_DWORD *)buf = 136315138;
    v38 = "-[WFInterface initWithDevice:coreWiFiInterface:interfaceName:]";
    v32 = "%s: nil WiFiDeviceClientRef";
    v33 = v15;
    v34 = v31;
    goto LABEL_36;
  }
  v36.receiver = self;
  v36.super_class = (Class)WFInterface;
  v11 = -[WFInterface init](&v36, sel_init);
  self = v11;
  if (!v11)
    goto LABEL_38;
  -[WFInterface setDevice:](v11, "setDevice:", a3);
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(v9, "interfaceName");
    v12 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v12;
  interfaceName = self->_interfaceName;
  self->_interfaceName = v12;

  v14 = self->_interfaceName;
  WFLogForCategory(0);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel())
    v17 = v15 == 0;
  else
    v17 = 1;
  v18 = !v17;
  if (!v14)
  {
    if (!v18 || !os_log_type_enabled(v15, v16))
      goto LABEL_37;
    *(_DWORD *)buf = 136315138;
    v38 = "-[WFInterface initWithDevice:coreWiFiInterface:interfaceName:]";
    v32 = "%s: nil interface name";
    v33 = v15;
    v34 = v16;
LABEL_36:
    _os_log_impl(&dword_219FC8000, v33, v34, v32, buf, 0xCu);
LABEL_37:

    goto LABEL_38;
  }
  if (v18 && os_log_type_enabled(v15, v16))
  {
    *(_DWORD *)buf = 136315394;
    v38 = "-[WFInterface initWithDevice:coreWiFiInterface:interfaceName:]";
    v39 = 2112;
    v40 = v10;
    _os_log_impl(&dword_219FC8000, v15, v16, "%s: interface name %@", buf, 0x16u);
  }

  v19 = (OS_dispatch_queue *)dispatch_queue_create(0, 0);
  currentNetworkQueue = self->_currentNetworkQueue;
  self->_currentNetworkQueue = v19;

  if (self->_currentNetworkQueue)
  {
    v21 = (OS_dispatch_queue *)dispatch_queue_create(0, MEMORY[0x24BDAC9C0]);
    networkProcessingQueue = self->_networkProcessingQueue;
    self->_networkProcessingQueue = v21;

    if (self->_networkProcessingQueue)
    {
      v23 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
      joinQueue = self->_joinQueue;
      self->_joinQueue = v23;

      v25 = self->_joinQueue;
      if (v25)
      {
        -[NSOperationQueue setQualityOfService:](v25, "setQualityOfService:", 25);
        v26 = -[WFIPMonitor initWithInterfaceName:]([WFIPMonitor alloc], "initWithInterfaceName:", self->_interfaceName);
        ipMonitor = self->_ipMonitor;
        self->_ipMonitor = v26;

        if (self->_ipMonitor)
        {
          objc_storeStrong((id *)&self->_cInterface, a4);
          if (v9)
          {
            -[WFInterface createNANInterface](self, "createNANInterface");
          }
          else
          {
            WFLogForCategory(0);
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v28 && os_log_type_enabled(v28, v29))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_219FC8000, v28, v29, "CoreWiFi Interface is Missing while initializing WFInterface", buf, 2u);
            }

          }
          -[WFInterface _startMonitoringWiFiEvents](self, "_startMonitoringWiFiEvents");
          -[WFInterface _initCurrentNetwork](self, "_initCurrentNetwork");
          goto LABEL_28;
        }
      }
    }
  }
LABEL_38:
  device = self->_device;
  if (device)
  {
    CFRelease(device);
    self->_device = 0;
  }

  self = 0;
LABEL_28:

  return self;
}

- (void)dealloc
{
  __WiFiDeviceClient *device;
  objc_super v4;

  if (self->_device)
  {
    WiFiDeviceClientRegisterHostApStateChangedCallback();
    WiFiDeviceClientRegisterCarPlayNetworkTypeChangeCallback();
    device = self->_device;
    if (device)
    {
      CFRelease(device);
      self->_device = 0;
    }
  }
  -[WFInterface _stopMonitoringWiFiEvents](self, "_stopMonitoringWiFiEvents");
  v4.receiver = self;
  v4.super_class = (Class)WFInterface;
  -[WFInterface dealloc](&v4, sel_dealloc);
}

- (void)_stopMonitoringWiFiEvents
{
  NSObject *v3;
  os_log_type_t v4;
  id v5;
  uint8_t buf[16];

  if (-[WFInterface monitoringEvents](self, "monitoringEvents"))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:", self);

  }
  else
  {
    WFLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = OSLogForWFLogLevel(2uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 2 && v3 && os_log_type_enabled(v3, v4))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219FC8000, v3, v4, "Unable to stop monitoring wifi events, currently not monitoring.", buf, 2u);
    }

  }
}

- (void)_wifiManagerRestarted:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  dispatch_get_global_queue(21, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__WFInterface__wifiManagerRestarted___block_invoke;
  block[3] = &unk_24DC348F8;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __37__WFInterface__wifiManagerRestarted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCurrentNetworkWithNetwork:callback:", 0, 0);
}

- (void)asyncHS20Supported:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    dispatch_get_global_queue(21, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __34__WFInterface_asyncHS20Supported___block_invoke;
    v6[3] = &unk_24DC35378;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

void __34__WFInterface_asyncHS20Supported___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  os_log_type_t v6;
  _QWORD v7[4];
  id v8;
  char v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 12);
  v2 = (void *)WiFiDeviceClientCopyProperty();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 45);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[WFInterface asyncHS20Supported:]_block_invoke";
    v12 = 1024;
    v13 = v4;
    _os_log_impl(&dword_219FC8000, v5, v6, "%s: _deviceSupportsHS20 %d", buf, 0x12u);
  }

  if (v2)
    CFRelease(v2);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34__WFInterface_asyncHS20Supported___block_invoke_35;
  v7[3] = &unk_24DC35350;
  v8 = *(id *)(a1 + 40);
  v9 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __34__WFInterface_asyncHS20Supported___block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (NSString)interfaceName
{
  void *v2;
  NSString *v3;

  if (self->_associatedOnIRInterface)
  {
    -[WFInterface irInterface](self, "irInterface");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "interfaceName");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = self->_interfaceName;
  }
  return v3;
}

- (void)_linkChangedWithInfo:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_219FC8000, v5, v6, "Link change with info %@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(v4, "objectForKey:", CFSTR("LINK_CHANGED_NETWORK"));
  -[WFInterface _updateCurrentNetworkWithNetwork:forceUpdateNetwork:callback:userInfo:](self, "_updateCurrentNetworkWithNetwork:forceUpdateNetwork:callback:userInfo:", objc_claimAutoreleasedReturnValue(), 0, 0, v4);

}

- (void)_linkQualityChanged:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  BOOL v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  WFLinkQuality *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int ipState;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  NSObject *v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel())
    v7 = v5 == 0;
  else
    v7 = 1;
  v8 = !v7;
  if (v4)
  {
    if (v8)
    {
      v9 = v5;
      if (os_log_type_enabled(v9, v6))
      {
        -[WFInterface _debugLQMString:](self, "_debugLQMString:", v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v31 = "-[WFInterface _linkQualityChanged:]";
        v32 = 2112;
        v33 = v10;
        _os_log_impl(&dword_219FC8000, v9, v6, "%s %@", buf, 0x16u);

      }
    }

    -[WFInterface currentNetwork](self, "currentNetwork");
    v5 = objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_26;
    objc_msgSend(v4, "objectForKey:", CFSTR("RSSI"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("SCALED_RSSI"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v5 = 0;
    if (v11 && v12)
    {
      -[WFInterface currentNetwork](self, "currentNetwork");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "matchingKnownNetworkProfile");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "displayFriendlyName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        -[WFInterface currentNetwork](self, "currentNetwork");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "ssid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v18 = [WFLinkQuality alloc];
      v19 = objc_msgSend(v11, "integerValue");
      objc_msgSend(v13, "floatValue");
      v5 = -[WFLinkQuality initWithSSID:rssi:scaledRSSI:](v18, "initWithSSID:rssi:scaledRSSI:", v16, v19);

    }
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE67DB0]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      ipState = self->_ipState;
      if (ipState != objc_msgSend(v20, "intValue"))
      {
        v23 = objc_msgSend(v21, "intValue");
        self->_ipState = v23;
        self->_ipv4SelfAssigned = v23 == 1;
      }
    }
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE67DA0]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24 && self->_hasNoGatewayIP != objc_msgSend(v24, "BOOLValue"))
      self->_hasNoGatewayIP = objc_msgSend(v25, "BOOLValue");

    if (v5)
    {
      v28 = CFSTR("WFInterfaceLinkQualityKey");
      v29 = v5;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_26:
      v26 = 0;
    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "postNotificationName:object:userInfo:", CFSTR("WFInterfaceLinkQualityNotification"), self, v26);

  }
  else if (v8 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "-[WFInterface _linkQualityChanged:]";
    _os_log_impl(&dword_219FC8000, v5, v6, "%s: linkQualityChanged is nil", buf, 0xCu);
  }

}

- (void)_currentNetworkDidChangeWithReason:(unint64_t)a3 previousNetwork:(id)a4
{
  unint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  void *v14;
  os_log_type_t v15;
  int v16;
  WFInterface *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = (unint64_t)a4;
  -[WFInterface currentNetwork](self, "currentNetwork");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "copy");

  if (v6 | v8)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
      -[NSObject setObject:forKey:](v9, "setObject:forKey:", v8, CFSTR("WFInterfaceNetworkKey"));
    if (v6)
      -[NSObject setObject:forKey:](v10, "setObject:forKey:", v6, CFSTR("WFInterfacePreviousNetworkKey"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v10, "setObject:forKey:", v11, CFSTR("WFInterfaceNetworkChangeReason"));

    WFLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v12 && os_log_type_enabled(v12, v13))
    {
      v16 = 138412802;
      v17 = self;
      v18 = 2112;
      v19 = v8;
      v20 = 2048;
      v21 = a3;
      _os_log_impl(&dword_219FC8000, v12, v13, "%@: Current network changed, %@ (reason %lu)", (uint8_t *)&v16, 0x20u);
    }

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("WFInterfaceNetworkChangedNotification"), self, v10);

  }
  else
  {
    WFLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    v15 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, v15))
    {
      v16 = 136315138;
      v17 = (WFInterface *)"-[WFInterface _currentNetworkDidChangeWithReason:previousNetwork:]";
      _os_log_impl(&dword_219FC8000, v10, v15, "%s: current/previous network are both nil", (uint8_t *)&v16, 0xCu);
    }
  }

}

void __35__WFInterface_asyncCurrentNetwork___block_invoke_45(uint64_t a1)
{
  void *v1;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "coreWiFiCurrentNetwork");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "coreWiFiCurrentNetwork");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v1, "copy");
  }
  else
  {
    v3 = 0;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
  if (v4)
  {

  }
}

uint64_t __35__WFInterface_asyncCurrentNetwork___block_invoke_48(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_currentNetworkDidChangeWithReason:previousNetwork:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)asyncCurrentScanResult:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38__WFInterface_asyncCurrentScanResult___block_invoke;
  v6[3] = &unk_24DC35418;
  v7 = v4;
  v5 = v4;
  -[WFInterface asyncCurrentNetwork:](self, "asyncCurrentNetwork:", v6);

}

void __38__WFInterface_asyncCurrentScanResult___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(a2, "scanResult");
    a2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_updateCurrentNetworkWithNetwork:(__WiFiNetwork *)a3 forceUpdateNetwork:(BOOL)a4 callback:(id)a5 userInfo:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFData *v15;
  __CFString *v16;
  id v17;
  _BOOL4 v18;
  void *v19;
  NSObject *v20;
  os_log_type_t v21;
  void *v22;
  void *v23;
  void *v24;
  WFNetworkScanRecord *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _BOOL4 IsEqualToNetwork;
  int v30;
  NSObject *v31;
  os_log_type_t v32;
  void *v33;
  BOOL v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  char *v38;
  _QWORD v39[4];
  WFNetworkScanRecord *v40;
  id v41;
  _QWORD block[5];
  id v43;
  uint64_t v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  __CFString *v48;
  __int16 v49;
  _BOOL4 v50;
  uint64_t v51;

  v7 = a4;
  v51 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  if (!a3 && v7)
  {
    a3 = (__WiFiNetwork *)WiFiDeviceClientCopyCurrentNetwork();
    if (a3)
    {
      v12 = (void *)WiFiNetworkCopyRecord();
      WiFiNetworkGetSSID();
      v38 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", CFSTR("PRIVATE_MAC_ADDRESS"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        v15 = (const __CFData *)objc_msgSend(v13, "objectForKey:", CFSTR("PRIVATE_MAC_ADDRESS_VALUE"));
        if (v15)
        {
          WFConvertEthernetNetworkAddressToString(v15);
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = &stru_24DC36C30;
        }
        v17 = v11;
        objc_msgSend(v14, "objectForKey:", CFSTR("PRIVATE_MAC_ADDRESS_TYPE"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (objc_msgSend(v19, "intValue") & 0xFFFFFFFE) == 2;

      }
      else
      {
        v17 = v11;
        v18 = 0;
        v16 = &stru_24DC36C30;
      }
      WFLogForCategory(0);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v20 && os_log_type_enabled(v20, v21))
      {
        *(_DWORD *)buf = 138412802;
        v46 = v38;
        v47 = 2112;
        v48 = v16;
        v49 = 1024;
        v50 = v18;
        _os_log_impl(&dword_219FC8000, v20, v21, "RANDOM DICT FROM copyCurrentNetwork: SSID: %@, random address: %@, enabled :%d", buf, 0x1Cu);
      }

      v11 = v17;
    }
  }
  -[WFInterface currentNetwork](self, "currentNetwork");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    -[WFInterface currentNetwork](self, "currentNetwork");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "copy");

  }
  else
  {
    v24 = 0;
  }

  if (a3)
    v25 = -[WFNetworkScanRecord initWithNetworkRef:]([WFNetworkScanRecord alloc], "initWithNetworkRef:", a3);
  else
    v25 = 0;
  -[WFInterface currentNetwork](self, "currentNetwork");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  if (!a3 || v26)
  {
    -[WFInterface currentNetwork](self, "currentNetwork");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    IsEqualToNetwork = NetworkRefIsEqualToNetwork(a3, v28);

    if (!a3 || IsEqualToNetwork)
    {
      -[WFInterface currentNetwork](self, "currentNetwork");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (a3)
        v34 = 1;
      else
        v34 = v33 == 0;
      v30 = !v34;
      goto LABEL_38;
    }
  }
  if (v25)
  {
    v30 = 1;
LABEL_38:
    WFLogForCategory(0);
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v35 && os_log_type_enabled(v35, v36))
    {
      *(_DWORD *)buf = 136315394;
      v46 = "-[WFInterface _updateCurrentNetworkWithNetwork:forceUpdateNetwork:callback:userInfo:]";
      v47 = 1024;
      LODWORD(v48) = v30;
      _os_log_impl(&dword_219FC8000, v35, v36, "%s: network change %d", buf, 0x12u);
    }

    v37 = MEMORY[0x24BDAC760];
    if (v30)
    {
      -[WFInterface _resetCurrentNetworkStates](self, "_resetCurrentNetworkStates");
      block[0] = v37;
      block[1] = 3221225472;
      block[2] = __85__WFInterface__updateCurrentNetworkWithNetwork_forceUpdateNetwork_callback_userInfo___block_invoke;
      block[3] = &unk_24DC34F48;
      block[4] = self;
      v44 = 0;
      v43 = v24;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
    if (v10)
    {
      v39[0] = v37;
      v39[1] = 3221225472;
      v39[2] = __85__WFInterface__updateCurrentNetworkWithNetwork_forceUpdateNetwork_callback_userInfo___block_invoke_2;
      v39[3] = &unk_24DC35378;
      v40 = v25;
      v41 = v10;
      dispatch_async(MEMORY[0x24BDAC9B8], v39);

    }
    if (a3)
      CFRelease(a3);
    goto LABEL_48;
  }
  WFLogForCategory(0);
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v31 && os_log_type_enabled(v31, v32))
  {
    *(_DWORD *)buf = 136315138;
    v46 = "-[WFInterface _updateCurrentNetworkWithNetwork:forceUpdateNetwork:callback:userInfo:]";
    _os_log_impl(&dword_219FC8000, v31, v32, "%s: failed to create network", buf, 0xCu);
  }

LABEL_48:
}

uint64_t __85__WFInterface__updateCurrentNetworkWithNetwork_forceUpdateNetwork_callback_userInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_currentNetworkDidChangeWithReason:previousNetwork:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __85__WFInterface__updateCurrentNetworkWithNetwork_forceUpdateNetwork_callback_userInfo___block_invoke_2(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_updateCurrentNetworkWithNetwork:(__WiFiNetwork *)a3 callback:(id)a4
{
  void (**v5)(id, _QWORD);
  NSObject *currentNetworkQueue;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  WFNetworkScanRecord *coreWiFiCurrentNetwork;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;
  int v20;
  NSObject *v21;
  os_log_type_t v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[6];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;
  _QWORD block[6];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, _QWORD))a4;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__0;
  v43 = __Block_byref_object_dispose__0;
  v44 = 0;
  currentNetworkQueue = self->_currentNetworkQueue;
  v7 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__WFInterface__updateCurrentNetworkWithNetwork_callback___block_invoke;
  block[3] = &unk_24DC353A0;
  block[4] = self;
  block[5] = &v39;
  dispatch_sync(currentNetworkQueue, block);
  -[WFInterface cInterface](self, "cInterface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentScanResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFInterface irInterface](self, "irInterface");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentScanResult");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  coreWiFiCurrentNetwork = self->_coreWiFiCurrentNetwork;
  self->_coreWiFiCurrentNetwork = 0;

  if (v9)
  {
    v13 = self->_currentNetworkQueue;
    v36[0] = v7;
    v36[1] = 3221225472;
    v36[2] = __57__WFInterface__updateCurrentNetworkWithNetwork_callback___block_invoke_2;
    v36[3] = &unk_24DC34BE8;
    v36[4] = self;
    v37 = v9;
    dispatch_sync(v13, v36);
    self->_associatedOnIRInterface = 0;

  }
  else if (v11)
  {
    v14 = self->_currentNetworkQueue;
    v34[0] = v7;
    v34[1] = 3221225472;
    v34[2] = __57__WFInterface__updateCurrentNetworkWithNetwork_callback___block_invoke_3;
    v34[3] = &unk_24DC34BE8;
    v34[4] = self;
    v35 = v11;
    dispatch_sync(v14, v34);
    self->_associatedOnIRInterface = 1;

  }
  else
  {
    self->_associatedOnIRInterface = 0;
  }
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__0;
  v32 = __Block_byref_object_dispose__0;
  v33 = 0;
  v15 = self->_currentNetworkQueue;
  v27[0] = v7;
  v27[1] = 3221225472;
  v27[2] = __57__WFInterface__updateCurrentNetworkWithNetwork_callback___block_invoke_4;
  v27[3] = &unk_24DC353A0;
  v27[4] = self;
  v27[5] = &v28;
  dispatch_sync(v15, v27);
  v16 = (void *)v40[5];
  v17 = v29;
  if (v16)
  {
    if (!v29[5])
      goto LABEL_10;
    if (!objc_msgSend(v16, "isEqual:"))
      goto LABEL_16;
    v17 = v29;
    if (v40[5])
    {
LABEL_10:
      v18 = v17[5];
      if (v18)
      {
        v19 = 0;
        goto LABEL_13;
      }
LABEL_16:
      v20 = 1;
      goto LABEL_17;
    }
  }
  v18 = v17[5];
  v19 = 1;
LABEL_13:
  if (v18)
    v20 = v19;
  else
    v20 = 0;
LABEL_17:
  WFLogForCategory(0);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v21 && os_log_type_enabled(v21, v22))
  {
    *(_DWORD *)buf = 136315906;
    v46 = "-[WFInterface _updateCurrentNetworkWithNetwork:callback:]";
    v47 = 1024;
    v48 = v20;
    v49 = 2112;
    v50 = v9;
    v51 = 2112;
    v52 = v11;
    _os_log_impl(&dword_219FC8000, v21, v22, "%s: network change=%d, infraScanResult='%@' nanScanResult='%@'", buf, 0x26u);
  }

  if (v20)
  {
    -[WFInterface _resetCurrentNetworkStates](self, "_resetCurrentNetworkStates");
    v23 = (void *)objc_msgSend((id)v40[5], "copy");
    v25[0] = v7;
    v25[1] = 3221225472;
    v25[2] = __57__WFInterface__updateCurrentNetworkWithNetwork_callback___block_invoke_60;
    v25[3] = &unk_24DC34BE8;
    v25[4] = self;
    v26 = v23;
    v24 = v23;
    dispatch_async(MEMORY[0x24BDAC9B8], v25);

  }
  if (v5)
    v5[2](v5, v29[5]);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v39, 8);
}

void __57__WFInterface__updateCurrentNetworkWithNetwork_callback___block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "coreWiFiCurrentNetwork");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "coreWiFiCurrentNetwork");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v1, "copy");
  }
  else
  {
    v3 = 0;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
  if (v4)
  {

  }
}

void __57__WFInterface__updateCurrentNetworkWithNetwork_callback___block_invoke_2(uint64_t a1)
{
  WFCurrentNetworkScanRecord *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = [WFCurrentNetworkScanRecord alloc];
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "cInterface");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentKnownNetworkProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WFCurrentNetworkScanRecord initWithScanResult:knownNetworkProfile:](v2, "initWithScanResult:knownNetworkProfile:", v3, v4);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v5;

}

void __57__WFInterface__updateCurrentNetworkWithNetwork_callback___block_invoke_3(uint64_t a1)
{
  WFCurrentNetworkScanRecord *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = [WFCurrentNetworkScanRecord alloc];
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "irInterface");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentKnownNetworkProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WFCurrentNetworkScanRecord initWithScanResult:knownNetworkProfile:](v2, "initWithScanResult:knownNetworkProfile:", v3, v4);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v5;

}

void __57__WFInterface__updateCurrentNetworkWithNetwork_callback___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "coreWiFiCurrentNetwork");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __57__WFInterface__updateCurrentNetworkWithNetwork_callback___block_invoke_60(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_currentNetworkDidChangeWithReason:previousNetwork:", 0, *(_QWORD *)(a1 + 40));
}

- (void)_resetCurrentNetworkStates
{
  NSSet *currentNetworkIssues;

  self->_ipState = 0;
  *(_WORD *)&self->_ipv4SelfAssigned = 0;
  currentNetworkIssues = self->_currentNetworkIssues;
  self->_currentNetworkIssues = 0;

}

void __34__WFInterface__initCurrentNetwork__block_invoke_5(_QWORD *a1)
{
  WFCurrentNetworkScanRecord *v2;
  uint64_t v3;
  void *v4;

  v2 = -[WFCurrentNetworkScanRecord initWithScanResult:knownNetworkProfile:]([WFCurrentNetworkScanRecord alloc], "initWithScanResult:knownNetworkProfile:", a1[5], a1[6]);
  v3 = a1[4];
  v4 = *(void **)(v3 + 72);
  *(_QWORD *)(v3 + 72) = v2;

}

uint64_t __34__WFInterface__initCurrentNetwork__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_currentNetworkDidChangeWithReason:previousNetwork:", 0, 0);
}

- (id)currentKnownNetworkProfile
{
  NSObject *v3;
  os_log_type_t v4;
  NSObject *v5;
  void *v6;
  void *v8;
  os_log_type_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (self->_associatedOnIRInterface)
  {
    WFLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
    {
      v10 = 136315394;
      v11 = "-[WFInterface currentKnownNetworkProfile]";
      v12 = 2112;
      v13 = 0;
      _os_log_impl(&dword_219FC8000, v3, v4, "%s: using ir0 profile='%@'", (uint8_t *)&v10, 0x16u);
    }

    -[WFInterface irInterface](self, "irInterface");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject currentKnownNetworkProfile](v5, "currentKnownNetworkProfile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WFInterface cInterface](self, "cInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentKnownNetworkProfile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    WFLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    v9 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v9))
    {
      v10 = 136315394;
      v11 = "-[WFInterface currentKnownNetworkProfile]";
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_219FC8000, v5, v9, "%s: using en0 profile='%@'", (uint8_t *)&v10, 0x16u);
    }
  }

  return v6;
}

- (void)asyncScanRequest:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  os_log_type_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  WFLogForCategory(6uLL);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v8)
  {
    v10 = v8;
    if (os_log_type_enabled(v10, v9))
    {
      objc_msgSend(v6, "cScanParameters");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v11;
      _os_log_impl(&dword_219FC8000, v10, v9, "starting wifi scan with parameters: %@", buf, 0xCu);

    }
  }

  -[WFInterface cInterface](self, "cInterface");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cScanParameters");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __38__WFInterface_asyncScanRequest_reply___block_invoke;
  v15[3] = &unk_24DC35440;
  v16 = v7;
  v14 = v7;
  objc_msgSend(v12, "performScanWithParameters:reply:", v13, v15);

}

void __38__WFInterface_asyncScanRequest_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  WFNetworkScanRecord *v12;
  NSObject *v13;
  os_log_type_t v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v16 = a2;
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v12 = -[WFNetworkScanRecord initWithScanResults:]([WFNetworkScanRecord alloc], "initWithScanResults:", v11);
        if (v12)
        {
          objc_msgSend(v5, "addObject:", v12);
        }
        else
        {
          WFLogForCategory(0);
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v13 && os_log_type_enabled(v13, v14))
          {
            *(_DWORD *)buf = 136315394;
            v22 = "-[WFInterface asyncScanRequest:reply:]_block_invoke";
            v23 = 2112;
            v24 = v11;
            _os_log_impl(&dword_219FC8000, v13, v14, "%s: failed to convert CWFScanResult (%@) to WFNetworkScanRecord", buf, 0x16u);
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v8);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSArray)deviceScanChannels
{
  WFInterface *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  _UNKNOWN **v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _UNKNOWN **v17;
  const __CFString *v18;
  const __CFString *v19;
  NSObject *v20;
  os_log_type_t v21;
  NSArray *deviceScanChannels;
  NSObject *v24;
  os_log_type_t v25;
  const char *v26;
  WFInterface *v27;
  uint64_t v28;
  id obj;
  NSArray *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v2 = self;
  v40 = *MEMORY[0x24BDAC8D0];
  if (self->_deviceScanChannels)
    return v2->_deviceScanChannels;
  if (!self->_device)
  {
    WFLogForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v24 || !os_log_type_enabled(v24, v25))
      goto LABEL_29;
    *(_WORD *)buf = 0;
    v26 = "failed to get WiFiDeviceClientRef";
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 254);
  v3 = WiFiDeviceClientCopyProperty();
  if (!v3)
  {
    WFLogForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v24 || !os_log_type_enabled(v24, v25))
      goto LABEL_29;
    *(_WORD *)buf = 0;
    v26 = "Failed to get support IOC channels from WiFiDeviceClient";
LABEL_28:
    _os_log_impl(&dword_219FC8000, v24, v25, v26, buf, 2u);
LABEL_29:

    return v2->_deviceScanChannels;
  }
  v4 = (void *)v3;
  v27 = v2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v32;
    v8 = CFSTR("SUP_CHANNEL");
    v9 = CFSTR("SUP_CHANNEL_FLAGS");
    v10 = &off_24DC33000;
    do
    {
      v11 = 0;
      v28 = v6;
      do
      {
        if (*(_QWORD *)v32 != v7)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v11);
        objc_msgSend(v12, "objectForKey:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(objc_alloc((Class)v10[215]), "initWithChannel:flags:", objc_msgSend(v13, "integerValue"), objc_msgSend(v14, "integerValue"));
        if (v15)
        {
          -[NSArray addObject:](v30, "addObject:", v15);
        }
        else
        {
          v16 = v7;
          v17 = v10;
          v18 = v9;
          v19 = v8;
          WFLogForCategory(0);
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v20 && os_log_type_enabled(v20, v21))
          {
            *(_DWORD *)buf = 138412546;
            v36 = v13;
            v37 = 2112;
            v38 = v14;
            _os_log_impl(&dword_219FC8000, v20, v21, "Unable to create scan channel for channel %@ flags %@", buf, 0x16u);
          }

          v8 = v19;
          v9 = v18;
          v10 = v17;
          v7 = v16;
          v6 = v28;
        }

        ++v11;
      }
      while (v6 != v11);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v6);
  }

  v2 = v27;
  deviceScanChannels = v27->_deviceScanChannels;
  v27->_deviceScanChannels = v30;

  CFRelease(obj);
  return v2->_deviceScanChannels;
}

- (void)updateDeviceScanChannelsPerCurLocale
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  _UNKNOWN **v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _UNKNOWN **v17;
  const __CFString *v18;
  const __CFString *v19;
  NSObject *v20;
  os_log_type_t v21;
  NSArray *deviceScanChannelsPerCurLocale;
  NSObject *v23;
  os_log_type_t v24;
  const char *v25;
  WFInterface *v26;
  uint64_t v27;
  id obj;
  NSArray *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  if (!self->_device)
  {
    WFLogForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v23 || !os_log_type_enabled(v23, v24))
      goto LABEL_27;
    *(_DWORD *)buf = 136315138;
    v35 = "-[WFInterface updateDeviceScanChannelsPerCurLocale]";
    v25 = "%s: Failed to get WiFiDeviceClientRef";
    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 27);
  v3 = WiFiDeviceClientCopyProperty();
  if (!v3)
  {
    WFLogForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v23 || !os_log_type_enabled(v23, v24))
      goto LABEL_27;
    *(_DWORD *)buf = 136315138;
    v35 = "-[WFInterface updateDeviceScanChannelsPerCurLocale]";
    v25 = "%s: Failed to get IOC supported channels from WiFiDeviceClient";
LABEL_26:
    _os_log_impl(&dword_219FC8000, v23, v24, v25, buf, 0xCu);
LABEL_27:

    return;
  }
  v4 = (void *)v3;
  v26 = self;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v29 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v31;
    v8 = CFSTR("SUP_CHANNEL");
    v9 = CFSTR("SUP_CHANNEL_FLAGS");
    v10 = &off_24DC33000;
    do
    {
      v11 = 0;
      v27 = v6;
      do
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v11);
        objc_msgSend(v12, "objectForKey:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(objc_alloc((Class)v10[215]), "initWithChannel:flags:", objc_msgSend(v13, "integerValue"), objc_msgSend(v14, "integerValue"));
        if (v15)
        {
          -[NSArray addObject:](v29, "addObject:", v15);
        }
        else
        {
          v16 = v7;
          v17 = v10;
          v18 = v9;
          v19 = v8;
          WFLogForCategory(0);
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v20 && os_log_type_enabled(v20, v21))
          {
            *(_DWORD *)buf = 138412546;
            v35 = (const char *)v13;
            v36 = 2112;
            v37 = v14;
            _os_log_impl(&dword_219FC8000, v20, v21, "Unable to create scan channel for channel %@ flags %@", buf, 0x16u);
          }

          v8 = v19;
          v9 = v18;
          v10 = v17;
          v7 = v16;
          v6 = v27;
        }

        ++v11;
      }
      while (v6 != v11);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v6);
  }

  deviceScanChannelsPerCurLocale = v26->_deviceScanChannelsPerCurLocale;
  v26->_deviceScanChannelsPerCurLocale = v29;

  CFRelease(obj);
}

- (NSArray)deviceScanChannelsPerCurLocale
{
  NSArray *deviceScanChannelsPerCurLocale;

  deviceScanChannelsPerCurLocale = self->_deviceScanChannelsPerCurLocale;
  if (!deviceScanChannelsPerCurLocale)
  {
    -[WFInterface updateDeviceScanChannelsPerCurLocale](self, "updateDeviceScanChannelsPerCurLocale");
    deviceScanChannelsPerCurLocale = self->_deviceScanChannelsPerCurLocale;
  }
  return deviceScanChannelsPerCurLocale;
}

- (void)asyncAssociateToNetwork:(id)a3 password:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  WFMutableNetworkProfile *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[WFMutableNetworkProfile initWithNetwork:]([WFMutableNetworkProfile alloc], "initWithNetwork:", v10);
  -[WFMutableNetworkProfile setPassword:](v11, "setPassword:", v9);
  -[WFInterface asyncAssociateToNetwork:password:reply:](self, "asyncAssociateToNetwork:password:reply:", v10, v9, v8);

}

- (void)asyncAssociateToNetwork:(id)a3 profile:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  os_log_type_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  NSObject *v18;
  os_log_type_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(id *);
  void *v30;
  id v31;
  id v32;
  id v33;
  id location;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  _BYTE v38[10];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v8, "requiresPassword"))
    goto LABEL_13;
  if (objc_msgSend(v8, "isEnterprise"))
  {
    WFLogForCategory(5uLL);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v11)
    {
      v13 = v11;
      if (os_log_type_enabled(v13, v12))
      {
        *(_DWORD *)buf = 136315650;
        v36 = "-[WFInterface asyncAssociateToNetwork:profile:reply:]";
        v37 = 1024;
        *(_DWORD *)v38 = objc_msgSend(v9, "canAttemptJoin");
        *(_WORD *)&v38[4] = 1024;
        *(_DWORD *)&v38[6] = objc_msgSend(v9, "isHS20Network");
        _os_log_impl(&dword_219FC8000, v13, v12, "%s: enterprise and requires password (canAttemptJoin %d, hs20Network %d)", buf, 0x18u);
      }

    }
    if ((objc_msgSend(v9, "canAttemptJoin") & 1) != 0 || (objc_msgSend(v9, "isHS20Network") & 1) != 0)
      goto LABEL_13;
  }
  objc_msgSend(v8, "matchingKnownNetworkProfile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {

    goto LABEL_13;
  }
  objc_msgSend(v9, "password");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 == 0;

  if (!v16)
  {
LABEL_13:
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x24BE29F00], "associationParametersFromScanRecord:profile:", v8, v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    WFLogForCategory(5uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v18 && os_log_type_enabled(v18, v19))
    {
      *(_DWORD *)buf = 136315650;
      v36 = "-[WFInterface asyncAssociateToNetwork:profile:reply:]";
      v37 = 2112;
      *(_QWORD *)v38 = v8;
      *(_WORD *)&v38[8] = 2112;
      v39 = v17;
      _os_log_impl(&dword_219FC8000, v18, v19, "%s: associating to %@ with params %@", buf, 0x20u);
    }

    objc_msgSend(v8, "isEnterprise");
    v20 = objc_alloc((Class)objc_opt_class());
    -[WFInterface cInterface](self, "cInterface");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithAssocParameters:interface:", v17, v21);

    objc_initWeak((id *)buf, v22);
    v27 = MEMORY[0x24BDAC760];
    v28 = 3221225472;
    v29 = __53__WFInterface_asyncAssociateToNetwork_profile_reply___block_invoke;
    v30 = &unk_24DC35490;
    objc_copyWeak(&v32, &location);
    objc_copyWeak(&v33, (id *)buf);
    v31 = v10;
    objc_msgSend(v22, "setCompletionBlock:", &v27);
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue", v27, v28, v29, v30);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addOperation:", v22);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&v32);
    objc_destroyWeak((id *)buf);

    objc_destroyWeak(&location);
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "associationErrorWithReason:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  WFLogForCategory(5uLL);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v25 && os_log_type_enabled(v25, v26))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219FC8000, v25, v26, "unable to find password in keychain", buf, 2u);
  }

  (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v24);
LABEL_18:

}

void __53__WFInterface_asyncAssociateToNetwork_profile_reply___block_invoke(id *a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v3 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    WFLogForCategory(5uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[WFInterface asyncAssociateToNetwork:profile:reply:]_block_invoke";
      _os_log_impl(&dword_219FC8000, v5, v6, "%s: forcing network update for successful association", buf, 0xCu);
    }

    objc_msgSend(WeakRetained, "_updateCurrentNetworkWithNetwork:callback:", 0, 0);
  }
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __53__WFInterface_asyncAssociateToNetwork_profile_reply___block_invoke_73;
  v9[3] = &unk_24DC35468;
  v7 = a1[4];
  v10 = v4;
  v11 = v7;
  v8 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

}

uint64_t __53__WFInterface_asyncAssociateToNetwork_profile_reply___block_invoke_73(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32) == 0);
}

- (void)disassociateFromCurrentNetwork
{
  -[WFInterface disassociateFromCurrentNetworkWithCompletion:](self, "disassociateFromCurrentNetworkWithCompletion:", 0);
}

- (void)disassociateFromCurrentNetworkWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  NSObject *v7;
  os_log_type_t v8;
  BOOL v9;
  int v10;
  void *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  -[WFInterface wifiClient](self, "wifiClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  WFLogForCategory(5uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel())
    v9 = v7 == 0;
  else
    v9 = 1;
  v10 = !v9;
  if (v6)
  {
    if (v10 && os_log_type_enabled(v7, v8))
    {
      v12 = 136315138;
      v13 = "-[WFInterface disassociateFromCurrentNetworkWithCompletion:]";
      _os_log_impl(&dword_219FC8000, v7, v8, "%s: disassociating from current network", (uint8_t *)&v12, 0xCu);
    }

    -[WFInterface wifiClient](self, "wifiClient");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject cInterface](v7, "cInterface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "disassociateWithReason:", 2);

  }
  else if (v10 && os_log_type_enabled(v7, v8))
  {
    v12 = 136315138;
    v13 = "-[WFInterface disassociateFromCurrentNetworkWithCompletion:]";
    _os_log_impl(&dword_219FC8000, v7, v8, "%s: failed to get CWFInterface", (uint8_t *)&v12, 0xCu);
  }

  if (v4)
    v4[2](v4);

}

- (void)disassociateFromCarPlayUserConfiguredNetwork
{
  uint64_t v3;
  id v4;

  -[WFInterface currentNetwork](self, "currentNetwork");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "carPlayType") == 2)
  {
    v3 = WiFiDeviceClientCopyCurrentNetwork();
    WiFiNetworkSetAssociationDate();
    -[WFInterface _updateCurrentNetworkWithNetwork:callback:](self, "_updateCurrentNetworkWithNetwork:callback:", v3, 0);
  }

}

- (id)_debugLQMString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  void *v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("RSSI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("SCALED_RSSI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("RSSI %@, Scaled RSSI: %@"), v5, v6);

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BE67DB0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BE67DA0]);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (!v10)
    objc_msgSend(v4, "appendFormat:", CFSTR(", ipState: %@, noGatewayIP: %@"), v7, v8);
  objc_msgSend(v3, "objectForKey:", CFSTR("DIRECTED_NETWORK"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    objc_msgSend(v4, "appendFormat:", CFSTR(", directed %@"), v11);

  return v4;
}

- (id)_currentInterface
{
  CWFInterface *v3;
  _BOOL4 associatedOnIRInterface;
  NSObject *v5;
  os_log_type_t v6;
  BOOL v7;
  int v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[WFInterface cInterface](self, "cInterface");
  v3 = (CWFInterface *)objc_claimAutoreleasedReturnValue();
  associatedOnIRInterface = self->_associatedOnIRInterface;
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel())
    v7 = v5 == 0;
  else
    v7 = 1;
  v8 = !v7;
  if (associatedOnIRInterface)
  {
    if (v8 && os_log_type_enabled(v5, v6))
    {
      v10 = 136315138;
      v11 = "-[WFInterface _currentInterface]";
      _os_log_impl(&dword_219FC8000, v5, v6, "%s: querying current network's IP from ir0.", (uint8_t *)&v10, 0xCu);
    }

    v5 = v3;
    v3 = self->_irInterface;
  }
  else if (v8 && os_log_type_enabled(v5, v6))
  {
    v10 = 136315138;
    v11 = "-[WFInterface _currentInterface]";
    _os_log_impl(&dword_219FC8000, v5, v6, "%s: querying current network's IP from en0.", (uint8_t *)&v10, 0xCu);
  }

  return v3;
}

- (id)IPv4Addresses
{
  void *v2;
  void *v3;
  NSObject *v4;
  os_log_type_t v5;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[WFInterface _currentInterface](self, "_currentInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "IPv4Addresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v4 && os_log_type_enabled(v4, v5))
  {
    v7 = 136315394;
    v8 = "-[WFInterface IPv4Addresses]";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_219FC8000, v4, v5, "%s: addresses='%@'", (uint8_t *)&v7, 0x16u);
  }

  return v3;
}

- (id)IPv4ARPResolvedIPAddress
{
  void *v2;
  void *v3;
  NSObject *v4;
  os_log_type_t v5;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[WFInterface _currentInterface](self, "_currentInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "IPv4ARPResolvedIPAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v4 && os_log_type_enabled(v4, v5))
  {
    v7 = 136315394;
    v8 = "-[WFInterface IPv4ARPResolvedIPAddress]";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_219FC8000, v4, v5, "%s: addresses='%@'", (uint8_t *)&v7, 0x16u);
  }

  return v3;
}

- (id)IPv4SubnetMasks
{
  void *v2;
  void *v3;
  NSObject *v4;
  os_log_type_t v5;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[WFInterface _currentInterface](self, "_currentInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "IPv4SubnetMasks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v4 && os_log_type_enabled(v4, v5))
  {
    v7 = 136315394;
    v8 = "-[WFInterface IPv4SubnetMasks]";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_219FC8000, v4, v5, "%s: subnetMasks='%@'", (uint8_t *)&v7, 0x16u);
  }

  return v3;
}

- (id)IPv4RouterAddress
{
  void *v2;
  void *v3;
  NSObject *v4;
  os_log_type_t v5;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[WFInterface _currentInterface](self, "_currentInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "IPv4RouterAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v4 && os_log_type_enabled(v4, v5))
  {
    v7 = 136315394;
    v8 = "-[WFInterface IPv4RouterAddress]";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_219FC8000, v4, v5, "%s: address='%@'", (uint8_t *)&v7, 0x16u);
  }

  return v3;
}

- (id)IPv6Addresses
{
  void *v2;
  void *v3;
  NSObject *v4;
  os_log_type_t v5;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[WFInterface _currentInterface](self, "_currentInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "IPv6Addresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v4 && os_log_type_enabled(v4, v5))
  {
    v7 = 136315394;
    v8 = "-[WFInterface IPv6Addresses]";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_219FC8000, v4, v5, "%s: addresses='%@'", (uint8_t *)&v7, 0x16u);
  }

  return v3;
}

- (id)IPv6RouterAddress
{
  void *v2;
  void *v3;
  NSObject *v4;
  os_log_type_t v5;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[WFInterface _currentInterface](self, "_currentInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "IPv6RouterAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v4 && os_log_type_enabled(v4, v5))
  {
    v7 = 136315394;
    v8 = "-[WFInterface IPv6RouterAddress]";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_219FC8000, v4, v5, "%s: address='%@'", (uint8_t *)&v7, 0x16u);
  }

  return v3;
}

- (BOOL)hasValidIPAddress
{
  void *v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  BOOL v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  os_log_type_t v19;
  void *v20;
  int v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[WFInterface ipMonitor](self, "ipMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "ipv4ConfigMethod") == 4)
  {
    -[WFInterface IPv4RouterAddress](self, "IPv4RouterAddress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      WFLogForCategory(0);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = OSLogForWFLogLevel(4uLL);
      v7 = 1;
      if ((unint64_t)WFCurrentLogLevel() < 4 || !v5 || !os_log_type_enabled(v5, v6))
        goto LABEL_29;
      v22 = 136315138;
      v23 = "-[WFInterface hasValidIPAddress]";
      v8 = "%s: manual config with valid router address";
      goto LABEL_22;
    }
  }
  else
  {

  }
  -[WFInterface IPv4Addresses](self, "IPv4Addresses");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[WFInterface IPv4RouterAddress](self, "IPv4RouterAddress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {

      goto LABEL_12;
    }
    -[WFInterface IPv4ARPResolvedIPAddress](self, "IPv4ARPResolvedIPAddress");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
LABEL_12:
      WFLogForCategory(0);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = OSLogForWFLogLevel(4uLL);
      v7 = 1;
      if ((unint64_t)WFCurrentLogLevel() < 4 || !v5 || !os_log_type_enabled(v5, v6))
        goto LABEL_29;
      v22 = 136315138;
      v23 = "-[WFInterface hasValidIPAddress]";
      v8 = "%s: valid client and router IPv4 address";
      goto LABEL_22;
    }
  }
  -[WFInterface IPv6Addresses](self, "IPv6Addresses");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[WFInterface IPv6RouterAddress](self, "IPv6RouterAddress");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      WFLogForCategory(0);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = OSLogForWFLogLevel(4uLL);
      v7 = 1;
      if ((unint64_t)WFCurrentLogLevel() < 4 || !v5 || !os_log_type_enabled(v5, v6))
        goto LABEL_29;
      v22 = 136315138;
      v23 = "-[WFInterface hasValidIPAddress]";
      v8 = "%s: valid client and router IPv6 address";
LABEL_22:
      _os_log_impl(&dword_219FC8000, v5, v6, v8, (uint8_t *)&v22, 0xCu);
      goto LABEL_29;
    }
  }
  -[WFInterface currentNetwork](self, "currentNetwork");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isAdhoc");

  if (!v17)
    return 0;
  WFLogForCategory(0);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v18 && os_log_type_enabled(v18, v19))
  {
    v22 = 136315138;
    v23 = "-[WFInterface hasValidIPAddress]";
    _os_log_impl(&dword_219FC8000, v18, v19, "%s: adhoc network", (uint8_t *)&v22, 0xCu);
  }

  -[WFInterface currentNetwork](self, "currentNetwork");
  v5 = objc_claimAutoreleasedReturnValue();
  -[NSObject matchingKnownNetworkProfile](v5, "matchingKnownNetworkProfile");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v20 != 0;

LABEL_29:
  return v7;
}

- (void)notifyNoNetworksFound
{
  id v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  const char *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("APPLE80211KEY_SOFT_ERROR_EVENT_TYPE"));

  if (!v3)
  {
    WFLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v5 || !os_log_type_enabled(v5, v6))
      goto LABEL_9;
    v8 = 136315138;
    v9 = "-[WFInterface notifyNoNetworksFound]";
    v7 = "%s: paramDictionary alloc failed!";
    goto LABEL_8;
  }
  if (!self->_device)
  {
    WFLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v5 || !os_log_type_enabled(v5, v6))
      goto LABEL_9;
    v8 = 136315138;
    v9 = "-[WFInterface notifyNoNetworksFound]";
    v7 = "%s- Failed to get WiFiDeviceClientRef";
LABEL_8:
    _os_log_impl(&dword_219FC8000, v5, v6, v7, (uint8_t *)&v8, 0xCu);
LABEL_9:

    goto LABEL_10;
  }
  WiFiDeviceClientNotifySoftError();
LABEL_10:

}

- (void)_hostAPStateDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    v11 = 136315394;
    v12 = "-[WFInterface _hostAPStateDidChange:]";
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_219FC8000, v5, v6, "%s: eventData %@", (uint8_t *)&v11, 0x16u);
  }

  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("HostApEnabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    WFLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v9))
    {
      v11 = 136315394;
      v12 = "-[WFInterface _hostAPStateDidChange:]";
      v13 = 1024;
      LODWORD(v14) = v7 != 0;
      _os_log_impl(&dword_219FC8000, v8, v9, "%s: host ap state is %d", (uint8_t *)&v11, 0x12u);
    }

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("WFInterfaceHostAPStateChangeNotification"), self, 0);

}

- (void)_carPlayNetworkTypeChangedCallback:(int)a3
{
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    v8 = 136315394;
    v9 = "-[WFInterface _carPlayNetworkTypeChangedCallback:]";
    v10 = 1024;
    v11 = a3;
    _os_log_impl(&dword_219FC8000, v5, v6, "%s: networkType: %d", (uint8_t *)&v8, 0x12u);
  }

  if ((a3 - 1) <= 1)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("WFInterfaceCarPlayNetworkTypeDidChangeNotification"), self, 0);

  }
}

- (void)setInterfaceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setCurrentNetwork:(id)a3
{
  objc_storeStrong((id *)&self->_currentNetwork, a3);
}

- (WFIPMonitor)ipMonitor
{
  return self->_ipMonitor;
}

- (void)setIpMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_ipMonitor, a3);
}

- (void)setDeviceScanChannels:(id)a3
{
  objc_storeStrong((id *)&self->_deviceScanChannels, a3);
}

- (void)setDeviceScanChannelsPerCurLocale:(id)a3
{
  objc_storeStrong((id *)&self->_deviceScanChannelsPerCurLocale, a3);
}

- (NSSet)currentNetworkIssues
{
  return self->_currentNetworkIssues;
}

- (void)setCurrentNetworkIssues:(id)a3
{
  objc_storeStrong((id *)&self->_currentNetworkIssues, a3);
}

- (OS_dispatch_queue)currentNetworkQueue
{
  return self->_currentNetworkQueue;
}

- (void)setCurrentNetworkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_currentNetworkQueue, a3);
}

- (OS_dispatch_queue)networkProcessingQueue
{
  return self->_networkProcessingQueue;
}

- (void)setNetworkProcessingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_networkProcessingQueue, a3);
}

- (__WiFiDeviceClient)device
{
  return self->_device;
}

- (NSOperationQueue)joinQueue
{
  return self->_joinQueue;
}

- (void)setJoinQueue:(id)a3
{
  objc_storeStrong((id *)&self->_joinQueue, a3);
}

- (int)ipState
{
  return self->_ipState;
}

- (void)setIpState:(int)a3
{
  self->_ipState = a3;
}

- (BOOL)ipv4SelfAssigned
{
  return self->_ipv4SelfAssigned;
}

- (void)setIpv4SelfAssigned:(BOOL)a3
{
  self->_ipv4SelfAssigned = a3;
}

- (BOOL)hasNoGatewayIP
{
  return self->_hasNoGatewayIP;
}

- (void)setHasNoGatewayIP:(BOOL)a3
{
  self->_hasNoGatewayIP = a3;
}

- (BOOL)currentNetworkIsDirected
{
  return self->_currentNetworkIsDirected;
}

- (void)setCurrentNetworkIsDirected:(BOOL)a3
{
  self->_currentNetworkIsDirected = a3;
}

- (NSThread)callbackThread
{
  return self->_callbackThread;
}

- (void)setCallbackThread:(id)a3
{
  objc_storeStrong((id *)&self->_callbackThread, a3);
}

- (NSRunLoop)callbackRunLoop
{
  return self->_callbackRunLoop;
}

- (void)setCallbackRunLoop:(id)a3
{
  objc_storeStrong((id *)&self->_callbackRunLoop, a3);
}

- (BOOL)scanning
{
  return self->_scanning;
}

- (void)setScanning:(BOOL)a3
{
  self->_scanning = a3;
}

- (WFClient)wifiClient
{
  return (WFClient *)objc_loadWeakRetained((id *)&self->_wifiClient);
}

- (void)setCInterface:(id)a3
{
  objc_storeStrong((id *)&self->_cInterface, a3);
}

- (void)setIrInterface:(id)a3
{
  objc_storeStrong((id *)&self->_irInterface, a3);
}

- (BOOL)associatedOnIRInterface
{
  return self->_associatedOnIRInterface;
}

- (void)setAssociatedOnIRInterface:(BOOL)a3
{
  self->_associatedOnIRInterface = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_irInterface, 0);
  objc_storeStrong((id *)&self->_cInterface, 0);
  objc_destroyWeak((id *)&self->_wifiClient);
  objc_storeStrong((id *)&self->_callbackRunLoop, 0);
  objc_storeStrong((id *)&self->_callbackThread, 0);
  objc_storeStrong((id *)&self->_joinQueue, 0);
  objc_storeStrong((id *)&self->_networkProcessingQueue, 0);
  objc_storeStrong((id *)&self->_currentNetworkQueue, 0);
  objc_storeStrong((id *)&self->_coreWiFiCurrentNetwork, 0);
  objc_storeStrong((id *)&self->_currentNetworkIssues, 0);
  objc_storeStrong((id *)&self->_deviceScanChannelsPerCurLocale, 0);
  objc_storeStrong((id *)&self->_deviceScanChannels, 0);
  objc_storeStrong((id *)&self->_ipMonitor, 0);
  objc_storeStrong((id *)&self->_currentNetwork, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
}

@end
