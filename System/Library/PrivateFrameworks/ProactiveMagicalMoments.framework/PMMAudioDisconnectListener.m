@implementation PMMAudioDisconnectListener

void __59__PMMAudioDisconnectListener__setupAudioDisconnectListener__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  uint64_t v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __atxlog_handle_pmm();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_2188D0000, v5, OS_LOG_TYPE_DEFAULT, "audio disconnect listener called, %@", (uint8_t *)&v7, 0xCu);
  }

  if (WeakRetained)
  {
    v6 = WeakRetained[1];
    if (v6)
      (*(void (**)(void))(v6 + 16))();
  }

}

+ (BOOL)bluetoothDeviceTypeIsAudio:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "integerValue");
  return (v3 < 0x30) & (0x800000FB0008uLL >> v3);
}

- (PMMAudioDisconnectListener)initWithHandler:(id)a3
{
  id v5;
  PMMAudioDisconnectListener *v6;
  uint64_t v7;
  id disconnectHandler;
  PMMAudioDisconnectListener *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (v5)
  {
    v12.receiver = self;
    v12.super_class = (Class)PMMAudioDisconnectListener;
    v6 = -[PMMAudioDisconnectListener init](&v12, sel_init);
    if (v6)
    {
      v7 = objc_msgSend(v5, "copy");
      disconnectHandler = v6->_disconnectHandler;
      v6->_disconnectHandler = (id)v7;

      -[PMMAudioDisconnectListener _setupAudioDisconnectListener](v6, "_setupAudioDisconnectListener");
      -[PMMAudioDisconnectListener _setupBluetoothDisconnectListener](v6, "_setupBluetoothDisconnectListener");
    }
    self = v6;
    v9 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMMAudioDisconnectListener.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

    v9 = 0;
  }

  return v9;
}

- (void)_setupAudioDisconnectListener
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__PMMAudioDisconnectListener__setupAudioDisconnectListener__block_invoke;
  v8[3] = &unk_24D972648;
  objc_copyWeak(&v9, &location);
  v2 = (void *)MEMORY[0x219A1C784](v8);
  __atxlog_handle_pmm();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2188D0000, v3, OS_LOG_TYPE_DEFAULT, "registering for audio disconnect callbacks", v7, 2u);
  }

  objc_msgSend(MEMORY[0x24BE1B180], "predicateForAudioOutputStatus:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B190], "localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:", CFSTR("com.apple.duetexpertd.mm.audiodisconnect"), v4, CFSTR("com.apple.duetexpertd.cdidentifier"), v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PMMContextHelper sharedInstance](PMMContextHelper, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerForNotifications:", v5);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_setupBluetoothDisconnectListener
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __63__PMMAudioDisconnectListener__setupBluetoothDisconnectListener__block_invoke;
  v8[3] = &unk_24D972648;
  objc_copyWeak(&v9, &location);
  v2 = (void *)MEMORY[0x219A1C784](v8);
  __atxlog_handle_pmm();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2188D0000, v3, OS_LOG_TYPE_DEFAULT, "registering for bluetooth disconnect callbacks", v7, 2u);
  }

  objc_msgSend(MEMORY[0x24BE1B180], "predicateForBluetoothConnectionStatus:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B190], "localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:", CFSTR("com.apple.duetexpertd.mm.bluetoothdisconnect"), v4, CFSTR("com.apple.duetexpertd.cdidentifier"), v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PMMContextHelper sharedInstance](PMMContextHelper, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerForNotifications:", v5);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __63__PMMAudioDisconnectListener__setupBluetoothDisconnectListener__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __atxlog_handle_pmm();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v3;
    _os_log_impl(&dword_2188D0000, v5, OS_LOG_TYPE_DEFAULT, "bluetooth disconnect listener called, %@", (uint8_t *)&v12, 0xCu);
  }

  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BE1B180], "keyPathForBluetoothDataDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PMMContextHelper sharedInstance](PMMContextHelper, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchDataDictionaryForKeyPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x24BE1B180], "bluetoothDeviceTypeKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        if (+[PMMAudioDisconnectListener bluetoothDeviceTypeIsAudio:](PMMAudioDisconnectListener, "bluetoothDeviceTypeIsAudio:", v10))
        {
          v11 = WeakRetained[1];
          if (v11)
            (*(void (**)(void))(v11 + 16))();
        }
      }

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_disconnectHandler, 0);
}

@end
