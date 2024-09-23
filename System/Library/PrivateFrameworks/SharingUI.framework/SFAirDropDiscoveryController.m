@implementation SFAirDropDiscoveryController

- (SFAirDropDiscoveryController)init
{
  SFAirDropDiscoveryController *v2;
  SFAirDropDiscoveryController *v3;
  UIAlertController *alertController;
  SFWirelessSettingsController *v5;
  SFWirelessSettingsController *settingsController;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFAirDropDiscoveryController;
  v2 = -[SFAirDropDiscoveryController init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeWeak(&v2->_delegate, 0);
    v3->_isVisible = 1;
    *(_WORD *)&v3->_isLegacyModeEnabled = 0;
    alertController = v3->_alertController;
    v3->_alertController = 0;

    objc_storeWeak(&v3->_alertControllerDelegate, 0);
    v5 = (SFWirelessSettingsController *)objc_alloc_init(MEMORY[0x24BE901E0]);
    settingsController = v3->_settingsController;
    v3->_settingsController = v5;

    -[SFWirelessSettingsController setDelegate:](v3->_settingsController, "setDelegate:", v3);
    v3->_isLegacyDevice = SFDeviceSupportsAirDrop() ^ 1;
    v3->_discoverableMode = 0;
    v3->_controller = (__SFOperation *)SFOperationCreate();
    SFOperationSetClient();
    SFOperationSetDispatchQueue();
    SFOperationResume();
  }
  return v3;
}

- (void)handleOperationCallback:(__SFOperation *)a3 event:(int64_t)a4 withResults:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id WeakRetained;
  char v15;
  id v16;
  id v17;
  char v18;
  id v19;
  id v20;
  char v21;
  id v22;
  int v23;
  NSObject *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v8 = v7;
  if (a4 == 10)
  {
    airdrop_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SFAirDropDiscoveryController handleOperationCallback:event:withResults:].cold.2(v8, v12);
  }
  else if (a4 == 12)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE90450]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isLegacyDevice = objc_msgSend(v9, "BOOLValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE90458]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isLegacyModeEnabled = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE90460]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isLegacyModeSettable = objc_msgSend(v11, "BOOLValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE903F0]);
    v12 = objc_claimAutoreleasedReturnValue();
    airdrop_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138412290;
      v24 = v12;
      _os_log_impl(&dword_212728000, v13, OS_LOG_TYPE_DEFAULT, "Discoverable mode changed to %@", (uint8_t *)&v23, 0xCu);
    }

    if (v12)
    {
      self->_isVisible = -[NSObject isEqual:](v12, "isEqual:", *MEMORY[0x24BE903E0]) ^ 1;
      self->_discoverableMode = -[SFAirDropDiscoveryController operationDiscoverableModeToInteger:](self, "operationDiscoverableModeToInteger:", v12);
      WeakRetained = objc_loadWeakRetained(&self->_delegate);
      v15 = objc_opt_respondsToSelector();

      if ((v15 & 1) != 0)
      {
        v16 = objc_loadWeakRetained(&self->_delegate);
        objc_msgSend(v16, "discoveryControllerVisibilityDidChange:", self);

      }
      v17 = objc_loadWeakRetained(&self->_delegate);
      v18 = objc_opt_respondsToSelector();

      if ((v18 & 1) != 0)
      {
        v19 = objc_loadWeakRetained(&self->_delegate);
        objc_msgSend(v19, "discoveryControllerSettingsDidChange:", self);

      }
    }
    v20 = objc_loadWeakRetained(&self->_delegate);
    v21 = objc_opt_respondsToSelector();

    if ((v21 & 1) != 0)
    {
      v22 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v22, "discoveryControllerLegacyModePropertiesDidChange:", self);

    }
  }
  else
  {
    airdrop_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SFAirDropDiscoveryController handleOperationCallback:event:withResults:].cold.1(a4, (uint64_t)v8, v12);
  }

}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (BOOL)isLegacyDevice
{
  return self->_isLegacyDevice;
}

- (BOOL)isLegacyModeEnabled
{
  return self->_isLegacyModeEnabled;
}

- (void)setLegacyModeEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v4;
  uint64_t v5;

  if (self->_isLegacyModeEnabled != a3)
  {
    v3 = a3;
    airdrop_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[SFAirDropDiscoveryController setLegacyModeEnabled:].cold.1(v3, v4, v5);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    SFOperationSetProperty();
  }
}

- (BOOL)isLegacyModeSettable
{
  return self->_isLegacyModeSettable;
}

- (BOOL)isStoreDemoMode
{
  if (isStoreDemoMode_onceToken != -1)
    dispatch_once(&isStoreDemoMode_onceToken, &__block_literal_global_5);
  return isStoreDemoMode_result;
}

uint64_t __47__SFAirDropDiscoveryController_isStoreDemoMode__block_invoke()
{
  uint64_t result;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppBooleanValue(CFSTR("StoreDemoMode"), CFSTR("com.apple.demo-settings"), &keyExistsAndHasValidFormat);
  isStoreDemoMode_result = (_DWORD)result != 0;
  return result;
}

- (BOOL)isNearbySharingSupported
{
  void *v3;
  int v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  NSObject *v11;
  uint64_t v13;
  id v14;

  -[objc_class sharedHardwareManagerWithNoUI](getNFHardwareManagerClass(), "sharedHardwareManagerWithNoUI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v4 = objc_msgSend(v3, "areFeaturesSupported:outError:", 1, &v14);
  v5 = v14;

  if (v5)
  {
    airdrop_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SFAirDropDiscoveryController isNearbySharingSupported].cold.2();

    goto LABEL_10;
  }
  if (!v4)
  {
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  v13 = 0;
  -[objc_class sharedHardwareManagerWithNoUI](getNFHardwareManagerClass(), "sharedHardwareManagerWithNoUI");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getRadioEnabledState:", &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    airdrop_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SFAirDropDiscoveryController isNearbySharingSupported].cold.1();

    v10 = 0;
  }
  else
  {
    v10 = v13 == 1;
  }

LABEL_11:
  if (-[SFAirDropDiscoveryController isStoreDemoMode](self, "isStoreDemoMode", v13))
  {
    airdrop_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_212728000, v11, OS_LOG_TYPE_DEFAULT, "Nearby sharing not supported for store demo devices", (uint8_t *)&v13, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (BOOL)isNearbySharingEnabled
{
  return objc_msgSend(MEMORY[0x24BE900B8], "nearFieldSharingEnabled");
}

- (void)setNearbySharingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v3 = a3;
  v6 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(MEMORY[0x24BE900B8], "nearFieldSharingEnabled") != a3)
  {
    airdrop_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = v3;
      _os_log_impl(&dword_212728000, v4, OS_LOG_TYPE_DEFAULT, "Changing nearby sharing enabled to %d", (uint8_t *)v5, 8u);
    }

    objc_msgSend(MEMORY[0x24BE900B8], "setNearFieldSharingEnabled:", v3);
    notify_post((const char *)objc_msgSend((id)*MEMORY[0x24BE90330], "UTF8String"));
  }
}

- (void)startNFCMonitoring
{
  id v3;

  -[objc_class sharedHardwareManagerWithNoUI](getNFHardwareManagerClass(), "sharedHardwareManagerWithNoUI");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerEventListener:", self);

}

- (BOOL)isCellularUsageEnabled
{
  return objc_msgSend(MEMORY[0x24BE900B8], "cellularUsageEnabled");
}

- (void)setCellularUsageEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v3 = a3;
  v6 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(MEMORY[0x24BE900B8], "cellularUsageEnabled") != a3)
  {
    airdrop_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = v3;
      _os_log_impl(&dword_212728000, v4, OS_LOG_TYPE_DEFAULT, "Changing cellular usage enabled to %d", (uint8_t *)v5, 8u);
    }

    objc_msgSend(MEMORY[0x24BE900B8], "setCellularUsageEnabled:", v3);
    notify_post((const char *)objc_msgSend((id)*MEMORY[0x24BE90328], "UTF8String"));
  }
}

- (void)dealloc
{
  objc_super v3;

  -[SFAirDropDiscoveryController invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SFAirDropDiscoveryController;
  -[SFAirDropDiscoveryController dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  id v3;

  if (self->_controller)
  {
    SFOperationCancel();
    CFRelease(self->_controller);
    self->_controller = 0;
  }
  -[SFWirelessSettingsController setDelegate:](self->_settingsController, "setDelegate:", 0);
  -[SFWirelessSettingsController invalidate](self->_settingsController, "invalidate");
  -[objc_class sharedHardwareManagerWithNoUI](getNFHardwareManagerClass(), "sharedHardwareManagerWithNoUI");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterEventListener:", self);

}

- (void)updateAlertControllerTitle
{
  int v3;
  int v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (-[SFWirelessSettingsController deviceSupportsWAPI](self->_settingsController, "deviceSupportsWAPI"))
  {
    v3 = -[SFWirelessSettingsController isWifiEnabled](self->_settingsController, "isWifiEnabled");
    v4 = -[SFWirelessSettingsController isBluetoothEnabled](self->_settingsController, "isBluetoothEnabled");
    SFLocalizedStringForKey();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v3)
      v5 = v4 == 0;
    else
      v5 = 1;
    if (v5)
    {
      SFLocalizedStringForKey();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BDD17C8];
      SFLocalizedStringForKey();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", v8, v10, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIAlertController setTitle:](self->_alertController, "setTitle:", v9);
    }
    else
    {
      -[UIAlertController setTitle:](self->_alertController, "setTitle:", v10);
    }

  }
}

- (id)discoverableModeAlertController
{
  UIAlertController *alertController;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  UIAlertController *v10;
  UIAlertController *v11;
  uint64_t v12;
  void *v13;
  UIAlertController *v14;
  void *v15;
  id v16;
  void *v17;
  UIAlertController *v18;
  void *v19;
  id v20;
  void *v21;
  UIAlertController *v22;
  void *v23;
  void *v24;
  UIAlertController *v25;
  void *v26;
  id v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  _QWORD *v35;
  _QWORD v36[4];
  id v37;
  _QWORD *v38;
  _QWORD v39[4];
  id v40;
  _QWORD *v41;
  _QWORD v42[4];
  id v43;
  _QWORD aBlock[6];
  _QWORD v45[5];
  UIAlertController *v46;
  _QWORD v47[5];
  SFAirDropDiscoveryController *v48;

  alertController = self->_alertController;
  if (!alertController)
  {
    -[objc_class sharedManager](getUMUserManagerClass(), "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v4;
    if (objc_msgSend(v4, "isMultiUser"))
    {
      objc_msgSend(v4, "currentUser");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "userType") == 1;

    }
    else
    {
      v6 = 0;
    }
    SFLocalizedStringForKey();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    SFLocalizedStringForKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SFLocalizedStringForKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SFLocalizedStringForKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SFLocalizedStringForKey();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:");
    v10 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
    v11 = self->_alertController;
    self->_alertController = v10;

    -[SFAirDropDiscoveryController updateAlertControllerTitle](self, "updateAlertControllerTitle");
    v47[0] = 0;
    v47[1] = v47;
    v47[2] = 0x3032000000;
    v47[3] = __Block_byref_object_copy_;
    v47[4] = __Block_byref_object_dispose_;
    v48 = 0;
    v48 = self;
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x3032000000;
    v45[3] = __Block_byref_object_copy_;
    v45[4] = __Block_byref_object_dispose_;
    v46 = 0;
    v46 = self->_alertController;
    v12 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__SFAirDropDiscoveryController_discoverableModeAlertController__block_invoke;
    aBlock[3] = &unk_24CE0F580;
    aBlock[4] = v47;
    aBlock[5] = v45;
    v13 = _Block_copy(aBlock);
    v14 = self->_alertController;
    v15 = (void *)MEMORY[0x24BEBD3A8];
    v42[0] = v12;
    v42[1] = 3221225472;
    v42[2] = __63__SFAirDropDiscoveryController_discoverableModeAlertController__block_invoke_2;
    v42[3] = &unk_24CE0F5A8;
    v16 = v13;
    v43 = v16;
    objc_msgSend(v15, "actionWithTitle:style:handler:", v7, 1, v42);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAlertController addAction:](v14, "addAction:", v17);

    v18 = self->_alertController;
    v19 = (void *)MEMORY[0x24BEBD3A8];
    v39[0] = v12;
    v39[1] = 3221225472;
    v39[2] = __63__SFAirDropDiscoveryController_discoverableModeAlertController__block_invoke_3;
    v39[3] = &unk_24CE0F5D0;
    v41 = v47;
    v20 = v16;
    v40 = v20;
    objc_msgSend(v19, "actionWithTitle:style:handler:", v32, 0, v39);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAlertController addAction:](v18, "addAction:", v21);

    if (!v6)
    {
      v22 = self->_alertController;
      v23 = (void *)MEMORY[0x24BEBD3A8];
      v36[0] = v12;
      v36[1] = 3221225472;
      v36[2] = __63__SFAirDropDiscoveryController_discoverableModeAlertController__block_invoke_4;
      v36[3] = &unk_24CE0F5D0;
      v38 = v47;
      v37 = v20;
      objc_msgSend(v23, "actionWithTitle:style:handler:", v9, 0, v36);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIAlertController addAction:](v22, "addAction:", v24);

    }
    v25 = self->_alertController;
    v26 = (void *)MEMORY[0x24BEBD3A8];
    v33[0] = v12;
    v33[1] = 3221225472;
    v33[2] = __63__SFAirDropDiscoveryController_discoverableModeAlertController__block_invoke_5;
    v33[3] = &unk_24CE0F5D0;
    v35 = v47;
    v27 = v20;
    v34 = v27;
    objc_msgSend(v26, "actionWithTitle:style:handler:", v8, 0, v33);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAlertController addAction:](v25, "addAction:", v28);

    _Block_object_dispose(v45, 8);
    _Block_object_dispose(v47, 8);

    alertController = self->_alertController;
  }
  return alertController;
}

void __63__SFAirDropDiscoveryController_discoverableModeAlertController__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "alertControllerDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "alertControllerDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "discoveryController:alertControllerDidDismiss:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  }
}

uint64_t __63__SFAirDropDiscoveryController_discoverableModeAlertController__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __63__SFAirDropDiscoveryController_discoverableModeAlertController__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setDiscoverableMode:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __63__SFAirDropDiscoveryController_discoverableModeAlertController__block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setDiscoverableMode:", 1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __63__SFAirDropDiscoveryController_discoverableModeAlertController__block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setDiscoverableMode:", 2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setDiscoverableMode:(int64_t)a3
{
  NSObject *v5;

  airdrop_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SFAirDropDiscoveryController setDiscoverableMode:].cold.1(self, a3, v5);

  -[SFAirDropDiscoveryController discoverableModeToString:](self, "discoverableModeToString:", a3);
  SFOperationSetProperty();
}

- (int64_t)discoverableMode
{
  return self->_discoverableMode;
}

- (int64_t)operationDiscoverableModeToInteger:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE903F8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE903E0]) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE903D8]) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE903E8]))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)discoverableModeToString:(int64_t)a3
{
  if ((unint64_t)a3 <= 2)
    self = (SFAirDropDiscoveryController *)**((id **)&unk_24CE0F6A8 + a3);
  return self;
}

- (void)didChangeRadioState:(BOOL)a3
{
  id *p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained(p_delegate);
    objc_msgSend(v7, "discoveryControllerSettingsDidChange:", self);

  }
}

- (SFAirDropDiscoveryControllerDelegate)delegate
{
  return (SFAirDropDiscoveryControllerDelegate *)objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (SFAirDropDiscoveryAlertControllerDelegate)alertControllerDelegate
{
  return (SFAirDropDiscoveryAlertControllerDelegate *)objc_loadWeakRetained(&self->_alertControllerDelegate);
}

- (void)setAlertControllerDelegate:(id)a3
{
  objc_storeWeak(&self->_alertControllerDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsController, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_destroyWeak(&self->_alertControllerDelegate);
  objc_destroyWeak(&self->_delegate);
}

- (void)handleOperationCallback:(uint64_t)a1 event:(uint64_t)a2 withResults:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v5;
  uint8_t v6[12];
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a1;
  v11 = *MEMORY[0x24BDAC8D0];
  SFOperationEventToString(a1);
  OUTLINED_FUNCTION_1_0();
  v7 = 1024;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_212728000, a3, OS_LOG_TYPE_ERROR, "SFAirDropDiscoveryController UNHANDLED EVENT %@ [%d] %@", v6, 0x1Cu);
}

- (void)handleOperationCallback:(void *)a1 event:(NSObject *)a2 withResults:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x24BE90400]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_212728000, a2, v4, "SFAirDropDiscoveryController %@", v5);

  OUTLINED_FUNCTION_1();
}

- (void)setLegacyModeEnabled:(uint64_t)a3 .cold.1(char a1, NSObject *a2, uint64_t a3)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("Off");
  if ((a1 & 1) != 0)
    v3 = CFSTR("On");
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_0(&dword_212728000, a2, a3, "Turning AirDrop Legacy Mode %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2_0();
}

- (void)isNearbySharingSupported
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_212728000, v0, v1, "Failed to get NFC reader mode supported: %@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)setDiscoverableMode:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "discoverableModeToString:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_212728000, a3, v5, "Changing discoverable mode to %@", v6);

  OUTLINED_FUNCTION_1();
}

@end
