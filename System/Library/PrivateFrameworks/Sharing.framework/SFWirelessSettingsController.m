@implementation SFWirelessSettingsController

- (SFWirelessSettingsController)init
{
  char *v2;
  char *v3;
  _QWORD *v4;
  __int128 v6[2];
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFWirelessSettingsController;
  v2 = -[SFWirelessSettingsController init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    *((_QWORD *)v2 + 6) = 0;
    *((_DWORD *)v2 + 4) = 65537;
    *(_WORD *)(v2 + 33) = 0;
    v4 = SFOperationCreate(0, CFSTR("Information"));
    *((_QWORD *)v3 + 5) = v4;
    *(_QWORD *)&v6[0] = 0;
    v6[1] = 0u;
    v7 = 0;
    *((_QWORD *)&v6[0] + 1) = v3;
    SFOperationSetClient((uint64_t)v4, (uint64_t)operationCallBack_0, v6);
    SFOperationSetDispatchQueue(*((_QWORD *)v3 + 5), MEMORY[0x1E0C80D38]);
    SFOperationResume(*((_QWORD *)v3 + 5));
  }
  return (SFWirelessSettingsController *)v3;
}

- (void)handleOperationCallback:(__SFOperation *)a3 event:(int64_t)a4 withResults:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD block[5];

  v7 = a5;
  v8 = v7;
  if (a4 == 10)
  {
    airdrop_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SFWirelessSettingsController handleOperationCallback:event:withResults:].cold.2(v8, v16);
    goto LABEL_8;
  }
  if (a4 != 12)
  {
    airdrop_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SFWirelessSettingsController handleOperationCallback:event:withResults:].cold.1(a4, (uint64_t)v8, v16);
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("WirelessEnabled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  self->_wifiEnabled = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BluetoothEnabled"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  self->_bluetoothEnabled = objc_msgSend(v10, "BOOLValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AirplaneModeEnabled"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  self->_airplaneModeEnabled = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("UltraWideBandEnabled"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  self->_ultraWideBandStatus = (int)objc_msgSend(v12, "intValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DeviceSupportsWAPI"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  self->_deviceSupportsWAPI = objc_msgSend(v13, "BOOLValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("WirelessCarPlay"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  self->_wirelessCarPlayEnabled = objc_msgSend(v14, "BOOLValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("WirelessAccessPoint"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  self->_wirelessAccessPointEnabled = objc_msgSend(v15, "BOOLValue");

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__SFWirelessSettingsController_handleOperationCallback_event_withResults___block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
LABEL_9:

}

void __74__SFWirelessSettingsController_handleOperationCallback_event_withResults___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "wirelessSettingsDidChange:", *(_QWORD *)(a1 + 32));

}

- (void)setWifiEnabled:(BOOL)a3
{
  __SFOperation *information;
  const void **v4;

  information = self->_information;
  v4 = (const void **)MEMORY[0x1E0C9AE50];
  if (!a3)
    v4 = (const void **)MEMORY[0x1E0C9AE40];
  SFOperationSetProperty((pthread_mutex_t *)information, CFSTR("WirelessEnabled"), *v4);
}

- (BOOL)isWifiEnabled
{
  return self->_wifiEnabled;
}

- (void)setBluetoothEnabled:(BOOL)a3
{
  __SFOperation *information;
  const void **v4;

  information = self->_information;
  v4 = (const void **)MEMORY[0x1E0C9AE50];
  if (!a3)
    v4 = (const void **)MEMORY[0x1E0C9AE40];
  SFOperationSetProperty((pthread_mutex_t *)information, CFSTR("BluetoothEnabled"), *v4);
}

- (BOOL)isBluetoothEnabled
{
  return self->_bluetoothEnabled;
}

- (BOOL)isAirplaneModeEnabled
{
  return self->_airplaneModeEnabled;
}

- (void)setAirplaneModeEnabled:(BOOL)a3
{
  __SFOperation *information;
  const void **v4;

  information = self->_information;
  v4 = (const void **)MEMORY[0x1E0C9AE50];
  if (!a3)
    v4 = (const void **)MEMORY[0x1E0C9AE40];
  SFOperationSetProperty((pthread_mutex_t *)information, CFSTR("AirplaneModeEnabled"), *v4);
}

- (BOOL)deviceSupportsWAPI
{
  return self->_deviceSupportsWAPI;
}

- (BOOL)isWirelessAccessPointEnabled
{
  return self->_wirelessAccessPointEnabled;
}

- (void)setWirelessAccessPointEnabled:(BOOL)a3
{
  __SFOperation *information;
  const void **v4;

  information = self->_information;
  v4 = (const void **)MEMORY[0x1E0C9AE50];
  if (!a3)
    v4 = (const void **)MEMORY[0x1E0C9AE40];
  SFOperationSetProperty((pthread_mutex_t *)information, CFSTR("WirelessAccessPoint"), *v4);
}

- (BOOL)isWirelessCarPlayEnabled
{
  return self->_wirelessCarPlayEnabled;
}

- (void)dealloc
{
  objc_super v3;

  -[SFWirelessSettingsController invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SFWirelessSettingsController;
  -[SFWirelessSettingsController dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  __SFOperation *information;

  information = self->_information;
  if (information)
  {
    SFOperationCancel((uint64_t)information);
    CFRelease(self->_information);
    self->_information = 0;
  }
}

- (SFWirelessSettingsControllerDelegate)delegate
{
  return (SFWirelessSettingsControllerDelegate *)objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (unint64_t)ultraWideBandStatus
{
  return self->_ultraWideBandStatus;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate);
}

- (void)handleOperationCallback:(uint64_t)a1 event:(uint64_t)a2 withResults:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a1;
  v12 = *MEMORY[0x1E0C80C00];
  v6 = 138412802;
  v7 = SFOperationEventToString_0(a1);
  v8 = 1024;
  v9 = v5;
  v10 = 2112;
  v11 = a2;
  _os_log_error_impl(&dword_1A2830000, a3, OS_LOG_TYPE_ERROR, "SFWirelessSettingsController UNHANDLED EVENT %@ [%d] %@", (uint8_t *)&v6, 0x1Cu);
}

- (void)handleOperationCallback:(void *)a1 event:(NSObject *)a2 withResults:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("Error"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1A2830000, a2, OS_LOG_TYPE_ERROR, "SFWirelessSettingsController %@", (uint8_t *)&v4, 0xCu);

}

@end
