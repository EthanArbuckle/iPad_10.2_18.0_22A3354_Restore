@implementation WFTemperatureUnitProvider

- (WFTemperatureUnitProvider)init
{
  WFTemperatureUnitProvider *v2;
  dispatch_queue_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFTemperatureUnitProvider;
  v2 = -[WFTemperatureUnitProvider init](&v5, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.WeatherFoundation.TemperatureUnitProviderSerialQueue", 0);
    -[WFTemperatureUnitProvider setProviderQueue:](v2, "setProviderQueue:", v3);

  }
  return v2;
}

- (void)fetchTemperatureUnitWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[WFTemperatureUnitProvider providerQueue](self, "providerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__WFTemperatureUnitProvider_fetchTemperatureUnitWithCompletionHandler___block_invoke;
  block[3] = &unk_24CCA2890;
  v8 = v4;
  v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __71__WFTemperatureUnitProvider_fetchTemperatureUnitWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(uint64_t, uint64_t))(v1 + 16))(v1, objc_msgSend(WeakRetained, "_providerQueue_readUnit"));

}

- (int)userTemperatureUnit
{
  NSObject *v3;
  _QWORD block[5];
  id v6;
  id location;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 2;
  objc_initWeak(&location, self);
  -[WFTemperatureUnitProvider providerQueue](self, "providerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__WFTemperatureUnitProvider_userTemperatureUnit__block_invoke;
  block[3] = &unk_24CCA28B8;
  block[4] = &v8;
  objc_copyWeak(&v6, &location);
  dispatch_sync(v3, block);

  LODWORD(v3) = *((_DWORD *)v9 + 6);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v8, 8);
  return (int)v3;
}

void __48__WFTemperatureUnitProvider_userTemperatureUnit__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(WeakRetained, "_providerQueue_readUnit");

}

- (void)replaceUnit:(int)a3
{
  NSObject *v5;
  _QWORD block[4];
  id v7;
  int v8;
  id location;

  objc_initWeak(&location, self);
  -[WFTemperatureUnitProvider providerQueue](self, "providerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__WFTemperatureUnitProvider_replaceUnit___block_invoke;
  block[3] = &unk_24CCA28E0;
  objc_copyWeak(&v7, &location);
  v8 = a3;
  dispatch_async(v5, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __41__WFTemperatureUnitProvider_replaceUnit___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_providerQueue_changeUnit:", *(unsigned int *)(a1 + 40));

}

- (void)replaceUnit:(int)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  int v12;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  -[WFTemperatureUnitProvider providerQueue](self, "providerQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __59__WFTemperatureUnitProvider_replaceUnit_completionHandler___block_invoke;
  v9[3] = &unk_24CCA2908;
  objc_copyWeak(&v11, &location);
  v12 = a3;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

uint64_t __59__WFTemperatureUnitProvider_replaceUnit_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_providerQueue_changeUnit:", *(unsigned int *)(a1 + 48));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int)_providerQueue_readUnit
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wf_temperatureUnit");

  return v3;
}

- (int)_providerQueue_changeUnit:(int)a3
{
  uint64_t v3;
  int v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v3 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v5 = -[WFTemperatureUnitProvider _providerQueue_readUnit](self, "_providerQueue_readUnit");
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWf_temperatureUnit:", v3);
  CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x24BDBD568]);
  -[WFTemperatureUnitProvider _postDidChangeUnitDefaultsPreference](self, "_postDidChangeUnitDefaultsPreference");
  WFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSLocaleTemperatureUnitFromWFTemperatureUnit(v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSLocaleTemperatureUnitFromWFTemperatureUnit(-[WFTemperatureUnitProvider _providerQueue_readUnit](self, "_providerQueue_readUnit"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_21189A000, v7, OS_LOG_TYPE_DEFAULT, "Temperature unit was changed from %@ to %@", (uint8_t *)&v12, 0x16u);

  }
  v10 = -[WFTemperatureUnitProvider _providerQueue_readUnit](self, "_providerQueue_readUnit");

  return v10;
}

- (void)_postDidChangeUnitDefaultsPreference
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.weather.temperatureUnitsChangedNotification"), 0, 0, 1u);
}

- (OS_dispatch_queue)providerQueue
{
  return self->_providerQueue;
}

- (void)setProviderQueue:(id)a3
{
  objc_storeStrong((id *)&self->_providerQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerQueue, 0);
}

@end
