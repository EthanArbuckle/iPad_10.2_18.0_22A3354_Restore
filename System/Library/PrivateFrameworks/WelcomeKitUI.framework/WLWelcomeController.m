@implementation WLWelcomeController

- (WLWelcomeController)initWithWelcomeViewController:(id)a3 forceUITestMode:(BOOL)a4 forceUITestModeDownloadError:(BOOL)a5
{
  id v8;
  WLWelcomeController *v9;
  BOOL v10;
  BOOL v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *migrationControllerDelegateQueueTargetedAtMainQueue;
  objc_super v16;

  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WLWelcomeController;
  v9 = -[WLWelcomeController init](&v16, sel_init);
  if (v9)
  {
    v10 = a4 || objc_msgSend(MEMORY[0x24BEC2830], "BOOLForKey:", CFSTR("UITest")) == 1;
    v9->_uiTestMode = v10;
    v11 = a5 || objc_msgSend(MEMORY[0x24BEC2830], "BOOLForKey:", CFSTR("ForceDownloadError")) == 1;
    v9->_forceUITestModeDownloadError = v11;
    v9->_migrateUsingRetryPolicies = 0;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create_with_target_V2("com.apple.welcomekitui.migrationControllerDelegateSerialQueue", v12, MEMORY[0x24BDAC9B8]);
    migrationControllerDelegateQueueTargetedAtMainQueue = v9->_migrationControllerDelegateQueueTargetedAtMainQueue;
    v9->_migrationControllerDelegateQueueTargetedAtMainQueue = (OS_dispatch_queue *)v13;

    -[WLWelcomeController _configureWelcomeViewController:](v9, "_configureWelcomeViewController:", v8);
    -[WLWelcomeController run](v9, "run");
    -[WLWelcomeController downloadTips](v9, "downloadTips");
  }

  return v9;
}

- (void)dealloc
{
  objc_super v4;

  _WLLog();
  v4.receiver = self;
  v4.super_class = (Class)WLWelcomeController;
  -[WLWelcomeController dealloc](&v4, sel_dealloc, self);
}

- (void)_configureWelcomeViewController:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __55__WLWelcomeController__configureWelcomeViewController___block_invoke;
  v5[3] = &unk_24E1490E8;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "setContinueHandler:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __55__WLWelcomeController__configureWelcomeViewController___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
    __55__WLWelcomeController__configureWelcomeViewController___block_invoke_cold_1();
  v2 = WeakRetained;
  objc_msgSend(WeakRetained, "_startPairing");

}

- (void)_startPairing
{
  __assert_rtn("-[WLWelcomeController _startPairing]", "WLWelcomeController.m", 120, "_navigationController");
}

void __36__WLWelcomeController__startPairing__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, void *a7)
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  id v25;
  char v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void *)MEMORY[0x24BDD16E0];
  v16 = a7;
  objc_msgSend(v15, "numberWithBool:", a2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__WLWelcomeController__startPairing__block_invoke_2;
  block[3] = &unk_24E149110;
  objc_copyWeak(&v25, (id *)(a1 + 40));
  v22 = v14;
  v23 = v12;
  v24 = v13;
  v26 = a2;
  v17 = v13;
  v18 = v12;
  v19 = v14;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v25);
}

void __36__WLWelcomeController__startPairing__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "didStartWiFiAndDeviceDiscoveryWithCode:ssid:passphrase:started:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));

}

- (void)didStartWiFiAndDeviceDiscoveryWithCode:(id)a3 ssid:(id)a4 passphrase:(id)a5 started:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a6;
  v14 = a3;
  v10 = a4;
  v11 = a5;
  -[BFFNavigationController view](self->_navigationController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUserInteractionEnabled:", 1);

  if (v6)
    -[WLWelcomeController _showPairingCode:wifiPSK:ssid:](self, "_showPairingCode:wifiPSK:ssid:", v14, v11, v10);
  else
    -[WLWelcomeController showFailure:](self, "showFailure:", 0);

}

- (void)sourceDeviceController:(id)a3 didDiscoverCandidate:(id)a4
{
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v5 = a4;
  if (v5)
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __67__WLWelcomeController_sourceDeviceController_didDiscoverCandidate___block_invoke;
    block[3] = &unk_24E149238;
    objc_copyWeak(&v8, &location);
    v7 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __67__WLWelcomeController_sourceDeviceController_didDiscoverCandidate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "didDiscoverCandidate:", *(_QWORD *)(a1 + 32));

}

- (void)didDiscoverCandidate:(id)a3
{
  id v5;
  WLWaitingForDataTypeSelectionViewController *v6;
  id v7;

  v5 = a3;
  self->_dismissAfterSourceDevicePairingTimeout = 0;
  v7 = v5;
  if (objc_msgSend(v5, "useMigrationKit"))
  {
    _WLLog();
    -[WLWelcomeController setUseMigrationKitInAP:](self, "setUseMigrationKitInAP:", 1, self);
  }
  else
  {
    objc_storeStrong((id *)&self->_sourceDevice, a3);
    v6 = -[WLWaitingForDataTypeSelectionViewController initWithWelcomeController:]([WLWaitingForDataTypeSelectionViewController alloc], "initWithWelcomeController:", self);
    -[WLWelcomeController _pushViewController:andRemovePreviousTopmostViewControllerWithCompletion:](self, "_pushViewController:andRemovePreviousTopmostViewControllerWithCompletion:", v6, 0);

  }
}

- (void)sourceDeviceController:(id)a3 didDiscoverDevice:(id)a4
{
  id v5;
  uint64_t v6;
  WLSourceDevicesController *sourceDevicesController;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];
  _QWORD block[4];
  id v12;
  id location;

  v5 = a4;
  _WLLog();
  if (v5)
  {
    if (objc_msgSend(v5, "useMigrationKit", self, v5))
    {
      objc_initWeak(&location, self);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __64__WLWelcomeController_sourceDeviceController_didDiscoverDevice___block_invoke;
      block[3] = &unk_24E1490E8;
      objc_copyWeak(&v12, &location);
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
    else
    {
      _WLLog();
      v6 = MEMORY[0x24BDAC760];
      sourceDevicesController = self->_sourceDevicesController;
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __64__WLWelcomeController_sourceDeviceController_didDiscoverDevice___block_invoke_2;
      v10[3] = &unk_24E149260;
      v10[4] = self;
      -[WLSourceDevicesController stopDeviceDiscoveryWithCompletion:](sourceDevicesController, "stopDeviceDiscoveryWithCompletion:", v10, self);
      v8[0] = v6;
      v8[1] = 3221225472;
      v8[2] = __64__WLWelcomeController_sourceDeviceController_didDiscoverDevice___block_invoke_3;
      v8[3] = &unk_24E149288;
      v8[4] = self;
      v9 = v5;
      dispatch_async(MEMORY[0x24BDAC9B8], v8);

    }
  }

}

void __64__WLWelcomeController_sourceDeviceController_didDiscoverDevice___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _WLLog();
  objc_msgSend(WeakRetained, "setUseMigrationKitInAP:", 1, WeakRetained);

}

void __64__WLWelcomeController_sourceDeviceController_didDiscoverDevice___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithBool:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

}

uint64_t __64__WLWelcomeController_sourceDeviceController_didDiscoverDevice___block_invoke_3(uint64_t a1)
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_didPairWithSourceDevice:", *(_QWORD *)(a1 + 40));
}

- (void)wifiAndDeviceDiscoveryDidGetInterrupted
{
  _QWORD block[5];

  _WLLog();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__WLWelcomeController_wifiAndDeviceDiscoveryDidGetInterrupted__block_invoke;
  block[3] = &unk_24E1492B0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __62__WLWelcomeController_wifiAndDeviceDiscoveryDidGetInterrupted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeWithSuccess:", 0);
}

- (void)_showPairingCode:(id)a3 wifiPSK:(id)a4 ssid:(id)a5
{
  id v8;
  id v9;
  id v10;
  WLPairingCodeViewController *v11;
  uint64_t v12;
  void *v13;
  dispatch_time_t v14;
  void *v15;
  void *v16;
  _QWORD block[4];
  id v18;
  _QWORD v19[5];
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id location[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  self->_isPairingCanceled = 0;
  v11 = -[WLPairingCodeViewController initWithPairingCode:wifiPSK:ssid:welcomeController:]([WLPairingCodeViewController alloc], "initWithPairingCode:wifiPSK:ssid:welcomeController:", v8, v9, v10, self);
  -[WLPairingCodeViewController setGetLocalImportOptionsHandler:](v11, "setGetLocalImportOptionsHandler:", &__block_literal_global);
  objc_initWeak(location, self);
  v12 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_3;
  v28[3] = &unk_24E149340;
  objc_copyWeak(&v29, location);
  -[WLPairingCodeViewController setStashDataLocallyHandler:](v11, "setStashDataLocallyHandler:", v28);
  v26[0] = v12;
  v26[1] = 3221225472;
  v26[2] = __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_4;
  v26[3] = &unk_24E1490E8;
  objc_copyWeak(&v27, location);
  -[WLPairingCodeViewController setImportLocalContentHandler:](v11, "setImportLocalContentHandler:", v26);
  v24[0] = v12;
  v24[1] = 3221225472;
  v24[2] = __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_5;
  v24[3] = &unk_24E1490E8;
  objc_copyWeak(&v25, location);
  -[WLPairingCodeViewController setViewWillDisappearBlock:](v11, "setViewWillDisappearBlock:", v24);
  v16 = v9;
  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_7;
  v22[3] = &unk_24E149368;
  objc_copyWeak(&v23, location);
  -[WLPairingCodeViewController setCancellationBlock:](v11, "setCancellationBlock:", v22);
  v13 = v10;
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_8;
  v20[3] = &unk_24E1490E8;
  objc_copyWeak(&v21, location);
  -[WLPairingCodeViewController setViewWillDismissBlock:](v11, "setViewWillDismissBlock:", v20);
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_9;
  v19[3] = &unk_24E1492B0;
  v19[4] = self;
  -[WLWelcomeController _pushViewController:andRemovePreviousTopmostViewControllerWithCompletion:](self, "_pushViewController:andRemovePreviousTopmostViewControllerWithCompletion:", v11, v19);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_dismissAfterSourceDevicePairingTimeout);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  self->_dismissAfterSourceDevicePairingTimeout = 1;
  v14 = dispatch_time(0, 600000000000);
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_10;
  block[3] = &unk_24E1490E8;
  objc_copyWeak(&v18, location);
  dispatch_after(v14, MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);
  objc_destroyWeak(location);

}

void __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v2 = a2;
  objc_msgSend(MEMORY[0x24BEC27F0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_2;
  v5[3] = &unk_24E149318;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "getLocalImportOptionsWithCompletion:", v5);

}

uint64_t __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
    __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_3_cold_1();
  v4 = WeakRetained;
  objc_msgSend(WeakRetained, "_setStashDataLocally:", a2);

}

void __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
    __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_4_cold_1();
  v2 = WeakRetained;
  objc_msgSend(WeakRetained, "_importLocalContent");

}

void __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_5(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
    __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_5_cold_1();
  v2 = WeakRetained;
  if ((objc_msgSend(WeakRetained, "useMigrationKitInAP") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v2[32]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _WLLog();

    if (v2[32])
    {
      v2[32] = 0;
      _WLLog();
      v3 = (void *)*((_QWORD *)v2 + 3);
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_6;
      v5[3] = &unk_24E149260;
      v5[4] = v2;
      objc_msgSend(v3, "stopWiFiAndDeviceDiscoveryWithCompletion:", v5, v2, v4);
    }
  }

}

uint64_t __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_6()
{
  return _WLLog();
}

void __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_7(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "showCancellationAlert:", v3);

}

void __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_8(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
    __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_8_cold_1();
  _WLLog();
  WeakRetained[82] = 1;
  if ((objc_msgSend(WeakRetained, "useMigrationKit", WeakRetained) & 1) == 0
    && (objc_msgSend(WeakRetained, "useMigrationKitInAP") & 1) == 0)
  {
    objc_msgSend(WeakRetained, "cancel");
  }

}

uint64_t __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_9(uint64_t result)
{
  uint64_t v1;

  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 8))
  {
    v1 = result;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_9_cold_1();
    return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 24), "scheduleSurrogateDeviceDiscovery");
  }
  return result;
}

void __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_10(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _WLLog();
  objc_msgSend(WeakRetained, "_sourceDevicePairingPeriodDidEnd", WeakRetained);

}

- (void)_sourceDevicePairingPeriodDidEnd
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_dismissAfterSourceDevicePairingTimeout);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  if (self->_dismissAfterSourceDevicePairingTimeout)
  {
    objc_msgSend(MEMORY[0x24BEC2850], "sharedInstance", self, v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deviceDidFailWithTimeout");

    -[WLWelcomeController _completeWithSuccess:](self, "_completeWithSuccess:", 0);
  }
}

- (void)_setStashDataLocally:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  objc_msgSend(MEMORY[0x24BEC27F0], "sharedInstance", self, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStashDataLocally:", v3);

}

- (void)_importLocalContent
{
  WLSourceDevicesController *sourceDevicesController;
  _QWORD v5[5];

  _WLLog();
  sourceDevicesController = self->_sourceDevicesController;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__WLWelcomeController__importLocalContent__block_invoke;
  v5[3] = &unk_24E149260;
  v5[4] = self;
  -[WLSourceDevicesController stopWiFiAndDeviceDiscoveryWithCompletion:](sourceDevicesController, "stopWiFiAndDeviceDiscoveryWithCompletion:", v5, self);
}

void __42__WLWelcomeController__importLocalContent__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a3;
  objc_msgSend(v5, "numberWithBool:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  objc_msgSend(MEMORY[0x24BEC27F0], "sharedInstance", v4, v7, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "importLocalContent");

}

- (void)_didPairWithSourceDevice:(id)a3
{
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  v5 = a3;
  if (!self->_isPairingCanceled)
  {
    objc_storeStrong((id *)&self->_sourceDevice, a3);
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __48__WLWelcomeController__didPairWithSourceDevice___block_invoke;
    v6[3] = &unk_24E1490E8;
    objc_copyWeak(&v7, &location);
    -[WLWelcomeController _showPreparation:](self, "_showPreparation:", v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

}

void __48__WLWelcomeController__didPairWithSourceDevice___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_startMigration");

}

- (void)_showPreparation:(id)a3
{
  id v4;
  WLPreparationViewController *v5;
  WLPreparationViewController *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v4 = a3;
  if (!self->_isPairingCanceled)
  {
    v5 = -[WLPreparationViewController initWithWelcomeController:]([WLPreparationViewController alloc], "initWithWelcomeController:", self);
    v6 = v5;
    if (self->_useMigrationKit || self->_useMigrationKitInAP)
    {
      -[WLPreparationViewController setShowCancelButton:](v5, "setShowCancelButton:", 1);
      objc_initWeak(&location, self);
      v7 = MEMORY[0x24BDAC760];
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __40__WLWelcomeController__showPreparation___block_invoke;
      v10[3] = &unk_24E149368;
      objc_copyWeak(&v11, &location);
      -[WLPreparationViewController setCancellationBlock:](v6, "setCancellationBlock:", v10);
      v8[0] = v7;
      v8[1] = 3221225472;
      v8[2] = __40__WLWelcomeController__showPreparation___block_invoke_2;
      v8[3] = &unk_24E1490E8;
      objc_copyWeak(&v9, &location);
      -[WLPreparationViewController setViewWillDismissBlock:](v6, "setViewWillDismissBlock:", v8);
      objc_destroyWeak(&v9);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
    -[WLWelcomeController _pushViewController:andRemovePreviousTopmostViewControllerWithCompletion:](self, "_pushViewController:andRemovePreviousTopmostViewControllerWithCompletion:", v6, v4);

  }
}

void __40__WLWelcomeController__showPreparation___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "showCancellationAlert:", v3);

}

void __40__WLWelcomeController__showPreparation___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _WLLog();
  objc_msgSend(WeakRetained, "cancel", WeakRetained);

}

- (void)_startMigration
{
  WLDataMigrationController *v3;
  WLDataMigrationController *migrationController;

  +[WLRecord startRecording](WLRecord, "startRecording");
  self->_migrationState = 0;
  *(_WORD *)&self->_migrationControllerIsRestartable = 0;
  if (self->_uiTestMode)
    v3 = (WLDataMigrationController *)objc_msgSend(objc_alloc(MEMORY[0x24BEC2800]), "initWithDelegate:forceDownloadError:", self, self->_forceUITestModeDownloadError);
  else
    v3 = (WLDataMigrationController *)objc_msgSend(objc_alloc(MEMORY[0x24BEC27F8]), "initWithDelegate:", self);
  migrationController = self->_migrationController;
  self->_migrationController = v3;

  -[WLDataMigrationController startMigrationUsingRetryPolicies:](self->_migrationController, "startMigrationUsingRetryPolicies:", self->_migrateUsingRetryPolicies);
}

- (void)dataMigratorDidGetInterrupted
{
  NSObject *migrationControllerDelegateQueueTargetedAtMainQueue;
  _QWORD block[4];
  id v5;
  id location;

  _WLLog();
  objc_initWeak(&location, self);
  migrationControllerDelegateQueueTargetedAtMainQueue = self->_migrationControllerDelegateQueueTargetedAtMainQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__WLWelcomeController_dataMigratorDidGetInterrupted__block_invoke;
  block[3] = &unk_24E1490E8;
  objc_copyWeak(&v5, &location);
  dispatch_async(migrationControllerDelegateQueueTargetedAtMainQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __52__WLWelcomeController_dataMigratorDidGetInterrupted__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "controllerDidGetInterrupted");

}

- (void)controllerDidGetInterrupted
{
  if (self->_migrationState && !self->_useMigrationKit)
  {
    if (!self->_migrationConcluded)
    {
      if (self->_migrationControllerIsRestartable)
      {
        self->_migrationControllerIsRestartable = 0;
        -[WLDataMigrationController startMigrationUsingRetryPolicies:](self->_migrationController, "startMigrationUsingRetryPolicies:", self->_migrateUsingRetryPolicies);
      }
      else
      {
        -[WLWelcomeController dataMigrator:didFailWithError:](self, "dataMigrator:didFailWithError:", 0, 0);
      }
    }
  }
  else
  {
    -[WLWelcomeController daemonDidGetInterrupted](self, "daemonDidGetInterrupted");
  }
}

- (void)dataMigratorDidBecomeRestartable:(id)a3
{
  NSObject *migrationControllerDelegateQueueTargetedAtMainQueue;
  _QWORD block[5];

  _WLLog();
  migrationControllerDelegateQueueTargetedAtMainQueue = self->_migrationControllerDelegateQueueTargetedAtMainQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__WLWelcomeController_dataMigratorDidBecomeRestartable___block_invoke;
  block[3] = &unk_24E1492B0;
  block[4] = self;
  dispatch_async(migrationControllerDelegateQueueTargetedAtMainQueue, block);
}

uint64_t __56__WLWelcomeController_dataMigratorDidBecomeRestartable___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 80) = 1;
  return result;
}

- (void)dataMigratorDidFinish:(id)a3 withImportErrors:(BOOL)a4 context:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *migrationControllerDelegateQueueTargetedAtMainQueue;
  id v15;
  void *v16;
  _QWORD block[5];
  id v18;
  BOOL v19;
  _QWORD v20[5];
  id v21;

  v5 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x24BDD16E0];
  v10 = a3;
  objc_msgSend(v9, "numberWithBool:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  v11 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __70__WLWelcomeController_dataMigratorDidFinish_withImportErrors_context___block_invoke;
  v20[3] = &unk_24E149288;
  v20[4] = self;
  v21 = v8;
  v12 = v8;
  v13 = (void *)MEMORY[0x220797310](v20);
  migrationControllerDelegateQueueTargetedAtMainQueue = self->_migrationControllerDelegateQueueTargetedAtMainQueue;
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __70__WLWelcomeController_dataMigratorDidFinish_withImportErrors_context___block_invoke_3;
  block[3] = &unk_24E1493B8;
  v19 = v5;
  block[4] = self;
  v18 = v13;
  v15 = v13;
  dispatch_async(migrationControllerDelegateQueueTargetedAtMainQueue, block);

}

void __70__WLWelcomeController_dataMigratorDidFinish_withImportErrors_context___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v2 = dispatch_time(0, 250000000);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __70__WLWelcomeController_dataMigratorDidFinish_withImportErrors_context___block_invoke_2;
  v4[3] = &unk_24E149288;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_after(v2, MEMORY[0x24BDAC9B8], v4);

}

uint64_t __70__WLWelcomeController_dataMigratorDidFinish_withImportErrors_context___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didCompleteMigrationWithSuccess:retry:context:", 1, 0, *(_QWORD *)(a1 + 40));
}

void __70__WLWelcomeController_dataMigratorDidFinish_withImportErrors_context___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 81) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 80) = 0;
  if (*(_BYTE *)(a1 + 48) && objc_msgSend(MEMORY[0x24BEC2810], "isInternal"))
  {
    objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Incomplete Import"), CFSTR("(Internal Message Only) Migration succeeded, but some data did not import. Write a bug and attach a sysdiagnose as well as everything in:\n/var/mobile/Library/WelcomeKit/ and /var/mobile/Library/MigrationKit"), 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x24BDF67E8];
    WLLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __70__WLWelcomeController_dataMigratorDidFinish_withImportErrors_context___block_invoke_4;
    v7[3] = &unk_24E149390;
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v3, "actionWithTitle:style:handler:", v4, 0, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addAction:", v5);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "topViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentViewController:animated:completion:", v2, 1, 0);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __70__WLWelcomeController_dataMigratorDidFinish_withImportErrors_context___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dataMigrator:(id)a3 didFailWithError:(id)a4
{
  NSObject *migrationControllerDelegateQueueTargetedAtMainQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v9;

  v7 = a4;
  _WLLog();
  migrationControllerDelegateQueueTargetedAtMainQueue = self->_migrationControllerDelegateQueueTargetedAtMainQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__WLWelcomeController_dataMigrator_didFailWithError___block_invoke;
  block[3] = &unk_24E149288;
  block[4] = self;
  v9 = v7;
  v6 = v7;
  dispatch_async(migrationControllerDelegateQueueTargetedAtMainQueue, block);

}

void __53__WLWelcomeController_dataMigrator_didFailWithError___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 81) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 80) = 0;
  objc_msgSend(*(id *)(a1 + 40), "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BEC2878]);

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BEC2888]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = objc_msgSend(v5, "BOOLValue");

      if (v6)
      {
        objc_msgSend(*(id *)(a1 + 32), "_didCompleteMigrationWithSuccess:retry:context:", 0, 1, 0);
        return;
      }
    }
    else
    {

    }
  }
  v7 = (void *)MEMORY[0x24BDF67F0];
  WLLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WLLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", v8, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDF67E8];
  WLLocalizedString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __53__WLWelcomeController_dataMigrator_didFailWithError___block_invoke_2;
  v15[3] = &unk_24E149070;
  v15[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v13);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "topViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "presentViewController:animated:completion:", v10, 1, 0);

}

uint64_t __53__WLWelcomeController_dataMigrator_didFailWithError___block_invoke_2(uint64_t a1)
{
  _WLLog();
  return objc_msgSend(*(id *)(a1 + 32), "_didCompleteMigrationWithSuccess:retry:context:", 0, 0, 0);
}

- (void)dataMigrator:(id)a3 didUpdateMigrationState:(unint64_t)a4
{
  void *v6;
  id v7;
  NSObject *migrationControllerDelegateQueueTargetedAtMainQueue;
  void *v9;
  _QWORD block[6];

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a3;
  objc_msgSend(v6, "numberWithUnsignedInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  migrationControllerDelegateQueueTargetedAtMainQueue = self->_migrationControllerDelegateQueueTargetedAtMainQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__WLWelcomeController_dataMigrator_didUpdateMigrationState___block_invoke;
  block[3] = &unk_24E1493E0;
  block[4] = self;
  block[5] = a4;
  dispatch_async(migrationControllerDelegateQueueTargetedAtMainQueue, block);
}

uint64_t __60__WLWelcomeController_dataMigrator_didUpdateMigrationState___block_invoke(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)(result + 32) + 56) = *(_QWORD *)(result + 40);
  v1 = *(_QWORD *)(result + 40);
  switch(v1)
  {
    case 4:
      return objc_msgSend(*(id *)(result + 32), "_updateTransferringForImport");
    case 3:
      return objc_msgSend(*(id *)(result + 32), "_showTransferring");
    case 2:
      return objc_msgSend(*(id *)(result + 32), "_showWaitingForDataTypeSelection");
  }
  return result;
}

- (void)dataMigrator:(id)a3 didUpdateProgressPercentage:(float)a4
{
  NSObject *migrationControllerDelegateQueueTargetedAtMainQueue;
  _QWORD block[5];
  float v8;

  _WLLog();
  migrationControllerDelegateQueueTargetedAtMainQueue = self->_migrationControllerDelegateQueueTargetedAtMainQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__WLWelcomeController_dataMigrator_didUpdateProgressPercentage___block_invoke;
  block[3] = &unk_24E149408;
  block[4] = self;
  v8 = a4;
  dispatch_async(migrationControllerDelegateQueueTargetedAtMainQueue, block);
}

void __64__WLWelcomeController_dataMigrator_didUpdateProgressPercentage___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "topViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v2, "setProgress:", *(float *)(a1 + 40));
  }

}

- (void)dataMigrator:(id)a3 didUpdateRemainingDownloadTime:(double)a4
{
  NSObject *migrationControllerDelegateQueueTargetedAtMainQueue;
  _QWORD block[6];

  _WLLog();
  migrationControllerDelegateQueueTargetedAtMainQueue = self->_migrationControllerDelegateQueueTargetedAtMainQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__WLWelcomeController_dataMigrator_didUpdateRemainingDownloadTime___block_invoke;
  block[3] = &unk_24E1493E0;
  block[4] = self;
  *(double *)&block[5] = a4;
  dispatch_async(migrationControllerDelegateQueueTargetedAtMainQueue, block);
}

void __67__WLWelcomeController_dataMigrator_didUpdateRemainingDownloadTime___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "topViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v2, "setRemainingDownloadTime:", *(double *)(a1 + 40));
  }

}

- (void)_didCompleteMigrationWithSuccess:(BOOL)a3 retry:(BOOL)a4 context:(id)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  WLDataMigrationController *migrationController;
  WLSourceDevice *sourceDevice;
  WLWelcomeController *v10;
  id v11;
  void *v12;
  id v13;

  v5 = a4;
  v6 = a3;
  v13 = a5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  +[WLRecord stopRecording](WLRecord, "stopRecording", self, v12, v13);
  -[WLDataMigrationController invalidateDaemonConnection](self->_migrationController, "invalidateDaemonConnection");
  -[WLMigrationKitController setInterruptionHandler:](self->_migrationKitController, "setInterruptionHandler:", 0);
  -[WLMigrationKitController invalidateDaemonConnection](self->_migrationKitController, "invalidateDaemonConnection");
  migrationController = self->_migrationController;
  self->_migrationController = 0;

  sourceDevice = self->_sourceDevice;
  self->_sourceDevice = 0;

  if (v6)
  {
    -[WLWelcomeController _showCompleted:](self, "_showCompleted:", v13);
  }
  else if (v5)
  {
    switch(self->_migrationState)
    {
      case 6uLL:
        v10 = self;
        v11 = 0;
        goto LABEL_9;
      case 7uLL:
      case 8uLL:
        v10 = self;
        v11 = v13;
LABEL_9:
        -[WLWelcomeController showCancellation:](v10, "showCancellation:", v11);
        break;
      case 9uLL:
        -[WLWelcomeController showReject](self, "showReject");
        break;
      case 0xAuLL:
        -[WLWelcomeController showFailure:](self, "showFailure:", v13);
        break;
      default:
        -[WLWelcomeController _showRetry](self, "_showRetry");
        break;
    }
  }
  else
  {
    -[WLWelcomeController _completeWithSuccess:](self, "_completeWithSuccess:", 0);
  }

}

- (void)_showWaitingForDataTypeSelection
{
  WLSourceDevice *v3;
  WLUIClient *client;
  id v5;
  void *v6;
  WLWaitingForDataTypeSelectionViewController *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v3 = self->_sourceDevice;
  client = self->_client;
  if (client)
  {
    v5 = objc_alloc_init(MEMORY[0x24BEC2838]);

    -[WLUIClient name](self->_client, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setName:", v6);

    v3 = (WLSourceDevice *)v5;
  }
  v7 = -[WLWaitingForDataTypeSelectionViewController initWithWelcomeController:]([WLWaitingForDataTypeSelectionViewController alloc], "initWithWelcomeController:", self);
  -[WLWaitingForDataTypeSelectionViewController setShowCancelButton:](v7, "setShowCancelButton:", client != 0);
  if (client)
  {
    objc_initWeak(&location, self);
    v8 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __55__WLWelcomeController__showWaitingForDataTypeSelection__block_invoke;
    v11[3] = &unk_24E149368;
    objc_copyWeak(&v12, &location);
    -[WLWaitingForDataTypeSelectionViewController setCancellationBlock:](v7, "setCancellationBlock:", v11);
    v9[0] = v8;
    v9[1] = 3221225472;
    v9[2] = __55__WLWelcomeController__showWaitingForDataTypeSelection__block_invoke_2;
    v9[3] = &unk_24E1490E8;
    objc_copyWeak(&v10, &location);
    -[WLWaitingForDataTypeSelectionViewController setViewWillDismissBlock:](v7, "setViewWillDismissBlock:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  -[WLWelcomeController _pushViewController:andRemovePreviousTopmostViewControllerWithCompletion:](self, "_pushViewController:andRemovePreviousTopmostViewControllerWithCompletion:", v7, 0);

}

void __55__WLWelcomeController__showWaitingForDataTypeSelection__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "showCancellationAlert:", v3);

}

void __55__WLWelcomeController__showWaitingForDataTypeSelection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _WLLog();
  objc_msgSend(WeakRetained, "cancel", WeakRetained);

}

- (void)_showTransferring
{
  WLSourceDevice *v3;
  WLUIClient *client;
  id v5;
  void *v6;
  WLWelcomeController *v7;
  _BOOL8 v8;
  WLTransferringViewController *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  v3 = self->_sourceDevice;
  client = self->_client;
  if (client)
  {
    v5 = objc_alloc_init(MEMORY[0x24BEC2838]);

    -[WLUIClient name](self->_client, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setName:", v6);

    v3 = (WLSourceDevice *)v5;
  }
  v7 = self;
  objc_sync_enter(v7);
  v8 = v7->_hasTips && v7->_useMigrationKit;
  objc_sync_exit(v7);

  v9 = -[WLTransferringViewController initWithSourceDevice:welcomeController:showsTips:]([WLTransferringViewController alloc], "initWithSourceDevice:welcomeController:showsTips:", v3, v7, v8);
  -[WLTransferringViewController setShowCancelButton:](v9, "setShowCancelButton:", client != 0);
  if (client)
  {
    objc_initWeak(&location, v7);
    v10 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __40__WLWelcomeController__showTransferring__block_invoke;
    v13[3] = &unk_24E149368;
    objc_copyWeak(&v14, &location);
    -[WLTransferringViewController setCancellationBlock:](v9, "setCancellationBlock:", v13);
    v11[0] = v10;
    v11[1] = 3221225472;
    v11[2] = __40__WLWelcomeController__showTransferring__block_invoke_2;
    v11[3] = &unk_24E1490E8;
    objc_copyWeak(&v12, &location);
    -[WLTransferringViewController setViewWillDismissBlock:](v9, "setViewWillDismissBlock:", v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  -[WLWelcomeController setTransferringViewController:](v7, "setTransferringViewController:", v9);
  -[WLWelcomeController _pushViewController:andRemovePreviousTopmostViewControllerWithCompletion:](v7, "_pushViewController:andRemovePreviousTopmostViewControllerWithCompletion:", v9, 0);

}

void __40__WLWelcomeController__showTransferring__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "showCancellationAlert:", v3);

}

void __40__WLWelcomeController__showTransferring__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _WLLog();
  objc_msgSend(WeakRetained, "cancel", WeakRetained);

}

- (void)_updateTransferringForImport
{
  __assert_rtn("-[WLWelcomeController _updateTransferringForImport]", "WLWelcomeController.m", 576, "[topViewController isKindOfClass:[WLTransferringViewController class]]");
}

- (void)retry
{
  self->_migrateUsingRetryPolicies = 1;
  -[WLWelcomeController _startPairing](self, "_startPairing");
}

- (void)_showRetry
{
  WLRetryViewController *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  v3 = -[WLRetryViewController initWithWelcomeController:]([WLRetryViewController alloc], "initWithWelcomeController:", self);
  objc_initWeak(&location, self);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__WLWelcomeController__showRetry__block_invoke;
  v7[3] = &unk_24E1490E8;
  objc_copyWeak(&v8, &location);
  -[WLRetryViewController setRetryBlock:](v3, "setRetryBlock:", v7);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __33__WLWelcomeController__showRetry__block_invoke_2;
  v5[3] = &unk_24E1490E8;
  objc_copyWeak(&v6, &location);
  -[WLWelcomeController _pushViewController:andRemovePreviousTopmostViewControllerWithCompletion:](self, "_pushViewController:andRemovePreviousTopmostViewControllerWithCompletion:", v3, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __33__WLWelcomeController__showRetry__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "retry");

}

void __33__WLWelcomeController__showRetry__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "run");

}

- (void)_showCompleted:(id)a3
{
  id v4;
  id WeakRetained;
  _BOOL8 v6;
  WLCompletedViewController *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_importViewController);
  v6 = WeakRetained != 0;

  v7 = -[WLCompletedViewController initWithWelcomeController:context:imported:]([WLCompletedViewController alloc], "initWithWelcomeController:context:imported:", self, v4, v6);
  objc_initWeak(&location, self);
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __38__WLWelcomeController__showCompleted___block_invoke;
  v11 = &unk_24E1490E8;
  objc_copyWeak(&v12, &location);
  -[WLCompletedViewController setContinueHandler:](v7, "setContinueHandler:", &v8);
  -[WLWelcomeController _pushViewController:andRemovePreviousTopmostViewControllerWithCompletion:](self, "_pushViewController:andRemovePreviousTopmostViewControllerWithCompletion:", v7, 0, v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __38__WLWelcomeController__showCompleted___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
    __38__WLWelcomeController__showCompleted___block_invoke_cold_1();
  v2 = WeakRetained;
  objc_msgSend(WeakRetained, "_completeWithSuccess:", 1);

}

- (void)_completeWithSuccess:(BOOL)a3
{
  id v5;
  void *v6;
  WLSettings *v7;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  if (!a3)
    v5 = (id)-[BFFNavigationController popViewControllerAnimated:](self->_navigationController, "popViewControllerAnimated:", 1, self, v6);
  if (self->_completionHandler)
  {
    _WLLog();
    v7 = objc_alloc_init(WLSettings);
    _WLLog();
    (*((void (**)(void))self->_completionHandler + 2))();

  }
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (void)_pushViewController:(id)a3 andRemovePreviousTopmostViewControllerWithCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BFFNavigationController *navigationController;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_suspend((dispatch_object_t)self->_migrationControllerDelegateQueueTargetedAtMainQueue);
  -[BFFNavigationController topViewController](self->_navigationController, "topViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v19 = v6;
    WeakRetained = objc_loadWeakRetained((id *)&self->_transferringViewController);
    objc_msgSend(WeakRetained, "removeProgressBar");

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[BFFNavigationController viewControllers](self->_navigationController, "viewControllers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
LABEL_5:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(v9, "addObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v15), v19);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        if (v13 == ++v15)
        {
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v13)
            goto LABEL_5;
          break;
        }
      }
    }

    v6 = v19;
  }
  else
  {
    objc_msgSend(v9, "addObject:", v8);
  }
  navigationController = self->_navigationController;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __96__WLWelcomeController__pushViewController_andRemovePreviousTopmostViewControllerWithCompletion___block_invoke;
  v20[3] = &unk_24E149430;
  v20[4] = self;
  v21 = v9;
  v22 = v7;
  v17 = v7;
  v18 = v9;
  -[BFFNavigationController pushViewController:completion:](navigationController, "pushViewController:completion:", v6, v20);

}

void __96__WLWelcomeController__pushViewController_andRemovePreviousTopmostViewControllerWithCompletion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1[4] + 16), "viewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v4, "removeObjectsInArray:", a1[5]);
  objc_msgSend(*(id *)(a1[4] + 16), "setViewControllers:", v4);
  dispatch_resume(*(dispatch_object_t *)(a1[4] + 72));
  v3 = a1[6];
  if (v3)
    (*(void (**)(void))(v3 + 16))();

}

- (void)deleteMessages
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BEC27F8]);
  objc_msgSend(v2, "deleteMessages");

}

- (void)lookupAppDataContainer:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x24BEC27F8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "lookupAppDataContainer:", v4);

}

- (void)popViewController
{
  id v2;

  v2 = (id)-[BFFNavigationController popViewControllerAnimated:](self->_navigationController, "popViewControllerAnimated:", 1);
}

- (void)run
{
  WLSourceDevice *sourceDevice;
  WLMigrationKitController *migrationKitController;
  id v5;

  _WLLog();
  -[WLWelcomeController setUseMigrationKit:](self, "setUseMigrationKit:", 0, self);
  -[WLWelcomeController setUseMigrationKitInAP:](self, "setUseMigrationKitInAP:", 0);
  self->_dismissAfterSourceDevicePairingTimeout = 0;
  -[WLWelcomeController setClient:](self, "setClient:", 0);
  sourceDevice = self->_sourceDevice;
  self->_sourceDevice = 0;

  -[WLMigrationKitController cancel](self->_migrationKitController, "cancel");
  migrationKitController = self->_migrationKitController;
  if (!migrationKitController)
  {
    v5 = objc_alloc_init(MEMORY[0x24BEC2820]);
    -[WLWelcomeController setMigrationKitController:](self, "setMigrationKitController:", v5);

    migrationKitController = self->_migrationKitController;
  }
  -[WLMigrationKitController run:](migrationKitController, "run:", self);
}

- (void)stop
{
  _WLLog();
  -[WLMigrationKitController cancel](self->_migrationKitController, "cancel", self);
  -[WLWelcomeController setClient:](self, "setClient:", 0);
  -[WLWelcomeController setUseMigrationKit:](self, "setUseMigrationKit:", 0);
}

- (void)cancel
{
  _WLLog();
  -[WLMigrationKitController cancel](self->_migrationKitController, "cancel", self);
  -[WLSourceDevicesController stopWiFiAndDeviceDiscoveryWithCompletion:](self->_sourceDevicesController, "stopWiFiAndDeviceDiscoveryWithCompletion:", 0);
}

- (void)showCancellationAlert:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  WLLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF69C8], "modelSpecificLocalizedStringKeyForKey:", CFSTR("ALERT_CANCELLATION_MESSAGE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WLLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDF67E8];
  WLLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 1, &__block_literal_global_136);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v11);

  v12 = (void *)MEMORY[0x24BDF67E8];
  WLLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __45__WLWelcomeController_showCancellationAlert___block_invoke_2;
  v17[3] = &unk_24E149498;
  v14 = v4;
  v18 = v14;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 0, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v15);

  -[BFFNavigationController topViewController](self->_navigationController, "topViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "presentViewController:animated:completion:", v8, 1, 0);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __45__WLWelcomeController_showCancellationAlert___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD *WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(void))(v3 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
    __45__WLWelcomeController_showCancellationAlert___block_invoke_2_cold_1();
  v5 = WeakRetained;
  v6 = WeakRetained[7];
  v7 = 6;
  if (v6 == 4)
    v7 = 8;
  v8 = v6 == 3;
  v9 = 7;
  if (!v8)
    v9 = v7;
  WeakRetained[7] = v9;
  objc_msgSend(WeakRetained, "cancel");

}

- (void)showCancellation:(id)a3
{
  id v4;
  unint64_t migrationState;
  uint64_t v6;
  WLImportCancellationViewController *v7;
  id *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  migrationState = self->_migrationState;
  v6 = MEMORY[0x24BDAC760];
  if (migrationState == 8)
  {
    v7 = -[WLTransferCancellationViewController initWithWelcomeController:context:]([WLImportCancellationViewController alloc], "initWithWelcomeController:context:", self, v4);
    v15[0] = v6;
    v15[1] = 3221225472;
    v15[2] = __40__WLWelcomeController_showCancellation___block_invoke_2;
    v15[3] = &unk_24E1490E8;
    v8 = &v16;
    objc_copyWeak(&v16, &location);
    -[WLTransferCancellationViewController setResetBlock:](v7, "setResetBlock:", v15);
  }
  else if (migrationState == 7)
  {
    v7 = -[WLTransferCancellationViewController initWithWelcomeController:context:]([WLTransferCancellationViewController alloc], "initWithWelcomeController:context:", self, v4);
    v17[0] = v6;
    v17[1] = 3221225472;
    v17[2] = __40__WLWelcomeController_showCancellation___block_invoke;
    v17[3] = &unk_24E1490E8;
    v8 = &v18;
    objc_copyWeak(&v18, &location);
    -[WLTransferCancellationViewController setResetBlock:](v7, "setResetBlock:", v17);
  }
  else
  {
    v7 = -[WLCancellationViewController initWithWelcomeController:]([WLCancellationViewController alloc], "initWithWelcomeController:", self);
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __40__WLWelcomeController_showCancellation___block_invoke_3;
    v13[3] = &unk_24E1490E8;
    v8 = &v14;
    objc_copyWeak(&v14, &location);
    -[WLImportCancellationViewController setContinueBlock:](v7, "setContinueBlock:", v13);
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __40__WLWelcomeController_showCancellation___block_invoke_4;
    v11[3] = &unk_24E1490E8;
    objc_copyWeak(&v12, &location);
    -[WLImportCancellationViewController setRetryBlock:](v7, "setRetryBlock:", v11);
    objc_destroyWeak(&v12);
  }
  objc_destroyWeak(v8);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __40__WLWelcomeController_showCancellation___block_invoke_5;
  v9[3] = &unk_24E1490E8;
  objc_copyWeak(&v10, &location);
  -[WLWelcomeController _pushViewController:andRemovePreviousTopmostViewControllerWithCompletion:](self, "_pushViewController:andRemovePreviousTopmostViewControllerWithCompletion:", v7, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __40__WLWelcomeController_showCancellation___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reset");

}

void __40__WLWelcomeController_showCancellation___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reset");

}

void __40__WLWelcomeController_showCancellation___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_completeWithSuccess:", 1);

}

void __40__WLWelcomeController_showCancellation___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "retry");

}

void __40__WLWelcomeController_showCancellation___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "run");

}

- (void)showFailure:(id)a3
{
  id v4;
  WLFailureViewController *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a3;
  v5 = -[WLFailureViewController initWithWelcomeController:context:]([WLFailureViewController alloc], "initWithWelcomeController:context:", self, v4);
  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __35__WLWelcomeController_showFailure___block_invoke;
  v9[3] = &unk_24E1490E8;
  objc_copyWeak(&v10, &location);
  -[WLFailureViewController setResetBlock:](v5, "setResetBlock:", v9);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __35__WLWelcomeController_showFailure___block_invoke_2;
  v7[3] = &unk_24E1490E8;
  objc_copyWeak(&v8, &location);
  -[WLWelcomeController _pushViewController:andRemovePreviousTopmostViewControllerWithCompletion:](self, "_pushViewController:andRemovePreviousTopmostViewControllerWithCompletion:", v5, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __35__WLWelcomeController_showFailure___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reset");

}

void __35__WLWelcomeController_showFailure___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "run");

}

- (void)stopAP
{
  _WLLog();
  self->_dismissAfterSourceDevicePairingTimeout = 0;
  if (!self->_useMigrationKitInAP)
    -[WLSourceDevicesController stopWiFiAndDeviceDiscoveryWithCompletion:](self->_sourceDevicesController, "stopWiFiAndDeviceDiscoveryWithCompletion:", 0);
}

- (void)authenticate
{
  WLSourceDevice *sourceDevice;
  _BOOL8 useMigrationKitInAP;

  sourceDevice = self->_sourceDevice;
  useMigrationKitInAP = self->_useMigrationKitInAP;
  _WLLog();
  if (self->_sourceDevice && !self->_useMigrationKitInAP)
  {
    -[WLWelcomeController stop](self, "stop");
  }
  else
  {
    -[WLWelcomeController setUseMigrationKit:](self, "setUseMigrationKit:", 1, self, sourceDevice, useMigrationKitInAP);
    -[WLWelcomeController stopAP](self, "stopAP");
    -[WLWelcomeController _showPreparation:](self, "_showPreparation:", 0);
  }
}

- (void)showReject
{
  WLRejectViewController *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  v3 = -[WLRejectViewController initWithWelcomeController:]([WLRejectViewController alloc], "initWithWelcomeController:", self);
  objc_initWeak(&location, self);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__WLWelcomeController_showReject__block_invoke;
  v7[3] = &unk_24E1490E8;
  objc_copyWeak(&v8, &location);
  -[WLRejectViewController setRetryBlock:](v3, "setRetryBlock:", v7);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __33__WLWelcomeController_showReject__block_invoke_2;
  v5[3] = &unk_24E1490E8;
  objc_copyWeak(&v6, &location);
  -[WLWelcomeController _pushViewController:andRemovePreviousTopmostViewControllerWithCompletion:](self, "_pushViewController:andRemovePreviousTopmostViewControllerWithCompletion:", v3, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __33__WLWelcomeController_showReject__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "retry");

}

void __33__WLWelcomeController_showReject__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "run");

}

- (void)reject
{
  _WLLog();
  if (self->_migrationState != 9)
  {
    self->_migrationState = 9;
    -[WLWelcomeController cancel](self, "cancel", self);
    -[WLWelcomeController _didCompleteMigrationWithSuccess:retry:context:](self, "_didCompleteMigrationWithSuccess:retry:context:", 0, 1, 0);
  }
}

- (void)setClient:(id)a3 brand:(id)a4 model:(id)a5 name:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  WLUIClient *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  _WLLog();
  +[WLRecord startRecording](WLRecord, "startRecording", self);
  v14 = -[WLUIClient initWithHostname:brand:model:name:]([WLUIClient alloc], "initWithHostname:brand:model:name:", v13, v12, v11, v10);

  -[WLWelcomeController setClient:](self, "setClient:", v14);
  -[WLWelcomeController _showWaitingForDataTypeSelection](self, "_showWaitingForDataTypeSelection");
}

- (void)updateProgress:(float)a3 remainingTime:(unint64_t)a4 completedOperationCount:(unint64_t)a5 totalOperationCount:(unint64_t)a6
{
  double v11;
  unint64_t migrationState;
  WLWelcomeController *v13;
  uint64_t v14;
  uint64_t v15;
  WLTransferringViewController **p_transferringViewController;
  id v17;
  id v18;
  id WeakRetained;
  double v21;
  id v25;

  v11 = a3;
  v21 = a3;
  _WLLog();
  migrationState = self->_migrationState;
  if (migrationState == 5)
    return;
  if (a3 >= 1.0)
  {
    self->_migrationState = 5;
    -[WLWelcomeController cancel](self, "cancel", self, *(_QWORD *)&v21, a4, a5, a6);
    v13 = self;
    v14 = 1;
    v15 = 0;
    goto LABEL_7;
  }
  if (a3 < 0.0)
  {
    self->_migrationState = 10;
    -[WLWelcomeController cancel](self, "cancel", self, *(_QWORD *)&v21, a4, a5, a6);
    v13 = self;
    v14 = 0;
    v15 = 1;
LABEL_7:
    -[WLWelcomeController _didCompleteMigrationWithSuccess:retry:context:](v13, "_didCompleteMigrationWithSuccess:retry:context:", v14, v15, 0);
    return;
  }
  if (migrationState - 3 > 1)
  {
    self->_migrationState = 3;
    -[WLWelcomeController _showTransferring](self, "_showTransferring", self, *(_QWORD *)&v21, a4, a5, a6);
    WeakRetained = objc_loadWeakRetained((id *)&self->_transferringViewController);
    objc_msgSend(WeakRetained, "setProgress:", v11);

    if (a3 <= 0.0 || !a4)
      return;
    v25 = objc_loadWeakRetained((id *)&self->_transferringViewController);
    objc_msgSend(v25, "setRemainingDownloadTime:", (double)a4);
LABEL_17:

    return;
  }
  p_transferringViewController = &self->_transferringViewController;
  v17 = objc_loadWeakRetained((id *)p_transferringViewController);
  objc_msgSend(v17, "setProgress:", v11, self, *(_QWORD *)&v21, a4, a5, a6);

  if (a3 > 0.0)
  {
    if (a4)
    {
      v18 = objc_loadWeakRetained((id *)p_transferringViewController);
      objc_msgSend(v18, "setRemainingDownloadTime:", (double)a4);

    }
  }
  if (a5)
  {
    v25 = objc_loadWeakRetained((id *)p_transferringViewController);
    objc_msgSend(v25, "setCompletedOperationCount:totalOperationCount:", a5, a6);
    goto LABEL_17;
  }
}

- (void)showImport
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_transferringViewController);
  objc_msgSend(WeakRetained, "setIsImporting:", 1);

}

- (void)import
{
  unint64_t v3;
  unint64_t migrationState;

  migrationState = self->_migrationState;
  _WLLog();
  v3 = self->_migrationState;
  if (v3 == 3)
  {
    self->_migrationState = 4;
  }
  else
  {
    if (v3)
      return;
    self->_migrationState = 4;
    -[WLWelcomeController _showTransferring](self, "_showTransferring", self, migrationState);
  }
  -[WLWelcomeController showImport](self, "showImport");
}

- (void)complete:(id)a3
{
  id v4;

  v4 = a3;
  _WLLog();
  if (self->_migrationState != 5)
  {
    self->_migrationState = 5;
    -[WLWelcomeController cancel](self, "cancel", self, v4);
    -[WLWelcomeController _didCompleteMigrationWithSuccess:retry:context:](self, "_didCompleteMigrationWithSuccess:retry:context:", 1, 0, v4);
  }

}

- (void)change:(int64_t)a3 context:(id)a4
{
  id v6;
  unint64_t migrationState;
  unint64_t v8;
  id v9;
  id v10;

  v6 = a4;
  if (a3 == 3)
  {
    if (self->_migrationState - 3 >= 2)
    {

      v6 = 0;
    }
    v9 = v6;
    v8 = 10;
    goto LABEL_10;
  }
  if (a3 == 2)
  {
    migrationState = self->_migrationState;
    if (migrationState - 7 < 2)
    {
LABEL_12:
      v10 = v6;
      -[WLWelcomeController _didCompleteMigrationWithSuccess:retry:context:](self, "_didCompleteMigrationWithSuccess:retry:context:", 0, 1, v6);
      v6 = v10;
      goto LABEL_13;
    }
    if (migrationState == 4)
    {
      v9 = v6;
      v8 = 8;
    }
    else
    {
      if (migrationState != 3)
      {
        self->_migrationState = 6;

        v9 = 0;
        goto LABEL_11;
      }
      v9 = v6;
      v8 = 7;
    }
LABEL_10:
    self->_migrationState = v8;
LABEL_11:
    -[WLWelcomeController cancel](self, "cancel");
    v6 = v9;
    goto LABEL_12;
  }
LABEL_13:

}

- (void)reset
{
  if (self->_resetHandler)
  {
    _WLLog();
    (*((void (**)(id))self->_resetHandler + 2))(self->_resetHandler);
  }
  _WLLog();
}

- (void)daemon:(id)a3 didCreateCode:(id)a4
{
  _WLLog();
}

- (void)daemonDidAuthenticateClient:(id)a3
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __51__WLWelcomeController_daemonDidAuthenticateClient___block_invoke;
  v3[3] = &unk_24E1490E8;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __51__WLWelcomeController_daemonDidAuthenticateClient___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "authenticate");

}

- (void)daemonDidRejectClient:(id)a3
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __45__WLWelcomeController_daemonDidRejectClient___block_invoke;
  v3[3] = &unk_24E1490E8;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __45__WLWelcomeController_daemonDidRejectClient___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reject");

}

- (void)daemon:(id)a3 didReceiveClient:(id)a4 brand:(id)a5 model:(id)a6 name:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id location;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __64__WLWelcomeController_daemon_didReceiveClient_brand_model_name___block_invoke;
  v19[3] = &unk_24E1494C0;
  objc_copyWeak(&v24, &location);
  v20 = v11;
  v21 = v12;
  v22 = v13;
  v23 = v14;
  v15 = v14;
  v16 = v13;
  v17 = v12;
  v18 = v11;
  dispatch_async(MEMORY[0x24BDAC9B8], v19);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __64__WLWelcomeController_daemon_didReceiveClient_brand_model_name___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "setClient:brand:model:name:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)daemon:(id)a3 didUpdateProgress:(float)a4 remainingTime:(unint64_t)a5 completedOperationCount:(unint64_t)a6 totalOperationCount:(unint64_t)a7
{
  _QWORD v11[4];
  id v12[4];
  float v13;
  id location;

  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __106__WLWelcomeController_daemon_didUpdateProgress_remainingTime_completedOperationCount_totalOperationCount___block_invoke;
  v11[3] = &unk_24E1494E8;
  objc_copyWeak(v12, &location);
  v13 = a4;
  v12[1] = (id)a5;
  v12[2] = (id)a6;
  v12[3] = (id)a7;
  dispatch_async(MEMORY[0x24BDAC9B8], v11);
  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __106__WLWelcomeController_daemon_didUpdateProgress_remainingTime_completedOperationCount_totalOperationCount___block_invoke(uint64_t a1)
{
  double v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  LODWORD(v2) = *(_DWORD *)(a1 + 64);
  objc_msgSend(WeakRetained, "updateProgress:remainingTime:completedOperationCount:totalOperationCount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v2);

}

- (void)daemonWillImport:(id)a3
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __40__WLWelcomeController_daemonWillImport___block_invoke;
  v3[3] = &unk_24E1490E8;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __40__WLWelcomeController_daemonWillImport___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "import");

}

- (void)daemon:(id)a3 didImportWithContext:(id)a4
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v5 = a4;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__WLWelcomeController_daemon_didImportWithContext___block_invoke;
  block[3] = &unk_24E149238;
  objc_copyWeak(&v9, &location);
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __51__WLWelcomeController_daemon_didImportWithContext___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "complete:", *(_QWORD *)(a1 + 32));

}

- (void)daemon:(id)a3 didChangeState:(int64_t)a4 withContext:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  v7 = a5;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__WLWelcomeController_daemon_didChangeState_withContext___block_invoke;
  v9[3] = &unk_24E149510;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a4;
  v10 = v7;
  v8 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __57__WLWelcomeController_daemon_didChangeState_withContext___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "change:context:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

- (void)daemonDidGetInterrupted
{
  unint64_t migrationState;
  BOOL v3;
  uint64_t v4;
  id v6;

  migrationState = self->_migrationState;
  v3 = migrationState > 4;
  v4 = (1 << migrationState) & 0x19;
  if (!v3 && v4 != 0)
  {
    -[WLWelcomeController change:context:](self, "change:context:", 3, 0);
    objc_msgSend(MEMORY[0x24BEC2850], "sharedInstance");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "daemonDidGetInterrupted");

  }
}

- (void)downloadTips
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __35__WLWelcomeController_downloadTips__block_invoke;
  v3[3] = &unk_24E1490E8;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __35__WLWelcomeController_downloadTips__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "downloadTipsInBackground");

}

- (void)downloadTipsInBackground
{
  BOOL v3;
  WLWelcomeController *obj;

  v3 = +[WLTips download](WLTips, "download");
  obj = self;
  objc_sync_enter(obj);
  obj->_hasTips = v3;
  objc_sync_exit(obj);

}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)resetHandler
{
  return self->_resetHandler;
}

- (void)setResetHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)useMigrationKit
{
  return self->_useMigrationKit;
}

- (void)setUseMigrationKit:(BOOL)a3
{
  self->_useMigrationKit = a3;
}

- (BOOL)useMigrationKitInAP
{
  return self->_useMigrationKitInAP;
}

- (void)setUseMigrationKitInAP:(BOOL)a3
{
  self->_useMigrationKitInAP = a3;
}

- (WLTransferringViewController)transferringViewController
{
  return (WLTransferringViewController *)objc_loadWeakRetained((id *)&self->_transferringViewController);
}

- (void)setTransferringViewController:(id)a3
{
  objc_storeWeak((id *)&self->_transferringViewController, a3);
}

- (WLImportViewController)importViewController
{
  return (WLImportViewController *)objc_loadWeakRetained((id *)&self->_importViewController);
}

- (void)setImportViewController:(id)a3
{
  objc_storeWeak((id *)&self->_importViewController, a3);
}

- (WLUIClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (WLMigrationKitController)migrationKitController
{
  return self->_migrationKitController;
}

- (void)setMigrationKitController:(id)a3
{
  objc_storeStrong((id *)&self->_migrationKitController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationKitController, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_importViewController);
  objc_destroyWeak((id *)&self->_transferringViewController);
  objc_storeStrong(&self->_resetHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_migrationControllerDelegateQueueTargetedAtMainQueue, 0);
  objc_storeStrong((id *)&self->_migrationController, 0);
  objc_storeStrong((id *)&self->_sourceDevice, 0);
  objc_storeStrong((id *)&self->_sourceDevicesController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

void __55__WLWelcomeController__configureWelcomeViewController___block_invoke_cold_1()
{
  __assert_rtn("-[WLWelcomeController _configureWelcomeViewController:]_block_invoke", "WLWelcomeController.m", 103, "strongSelf");
}

void __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_3_cold_1()
{
  __assert_rtn("-[WLWelcomeController _showPairingCode:wifiPSK:ssid:]_block_invoke_3", "WLWelcomeController.m", 215, "strongSelf");
}

void __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_4_cold_1()
{
  __assert_rtn("-[WLWelcomeController _showPairingCode:wifiPSK:ssid:]_block_invoke_4", "WLWelcomeController.m", 220, "strongSelf");
}

void __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_5_cold_1()
{
  __assert_rtn("-[WLWelcomeController _showPairingCode:wifiPSK:ssid:]_block_invoke_5", "WLWelcomeController.m", 226, "strongSelf");
}

void __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_8_cold_1()
{
  __assert_rtn("-[WLWelcomeController _showPairingCode:wifiPSK:ssid:]_block_invoke_8", "WLWelcomeController.m", 244, "strongSelf");
}

void __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_9_cold_1()
{
  __assert_rtn("-[WLWelcomeController _showPairingCode:wifiPSK:ssid:]_block_invoke_9", "WLWelcomeController.m", 255, "[self->_sourceDevicesController isKindOfClass:[WLSourceDevicesControllerSurrogate class]]");
}

void __38__WLWelcomeController__showCompleted___block_invoke_cold_1()
{
  __assert_rtn("-[WLWelcomeController _showCompleted:]_block_invoke", "WLWelcomeController.m", 611, "strongSelf");
}

void __45__WLWelcomeController_showCancellationAlert___block_invoke_2_cold_1()
{
  __assert_rtn("-[WLWelcomeController showCancellationAlert:]_block_invoke_2", "WLWelcomeController.m", 734, "strongSelf");
}

@end
