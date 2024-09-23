@implementation TVRUINetworkObserver

- (TVRUINetworkObserver)init
{
  TVRUINetworkObserver *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;
  uint8_t buf[4];
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)TVRUINetworkObserver;
  v2 = -[TVRUINetworkObserver init](&v7, sel_init);
  if (v2)
  {
    _TVRUINetworkObserverLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v9 = CFSTR("com.apple.tvremote.network_observer");
      _os_log_impl(&dword_21B042000, v3, OS_LOG_TYPE_DEFAULT, "Setting up %@ background queue", buf, 0xCu);
    }

    v4 = dispatch_queue_create((const char *)objc_msgSend(CFSTR("com.apple.tvremote.network_observer"), "UTF8String"), 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)dealloc
{
  WFWiFiStateMonitor *wifiStateMonitor;
  WFWiFiStateMonitor *v4;
  CBController *cbController;
  CBController *v6;
  objc_super v7;

  wifiStateMonitor = self->_wifiStateMonitor;
  if (wifiStateMonitor)
  {
    -[WFWiFiStateMonitor stopMonitoring](wifiStateMonitor, "stopMonitoring");
    v4 = self->_wifiStateMonitor;
    self->_wifiStateMonitor = 0;

  }
  cbController = self->_cbController;
  if (cbController)
  {
    -[CBController invalidate](cbController, "invalidate");
    v6 = self->_cbController;
    self->_cbController = 0;

  }
  v7.receiver = self;
  v7.super_class = (Class)TVRUINetworkObserver;
  -[TVRUINetworkObserver dealloc](&v7, sel_dealloc);
}

- (void)startObserving
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD block[4];
  id v16;
  id location;

  objc_initWeak(&location, self);
  -[TVRUINetworkObserver queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__TVRUINetworkObserver_startObserving__block_invoke;
  block[3] = &unk_24DE2C4F8;
  objc_copyWeak(&v16, &location);
  dispatch_async(v3, block);

  -[TVRUINetworkObserver cbController](self, "cbController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBB238]);
    -[TVRUINetworkObserver setCbController:](self, "setCbController:", v6);

    -[TVRUINetworkObserver queue](self, "queue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUINetworkObserver cbController](self, "cbController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDispatchQueue:", v7);

    -[TVRUINetworkObserver cbController](self, "cbController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v4;
    v13[1] = 3221225472;
    v13[2] = __38__TVRUINetworkObserver_startObserving__block_invoke_2;
    v13[3] = &unk_24DE2D298;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v9, "activateWithCompletion:", v13);

    objc_copyWeak(&v12, &location);
    -[TVRUINetworkObserver cbController](self, "cbController", v4, 3221225472, __38__TVRUINetworkObserver_startObserving__block_invoke_9, &unk_24DE2C4F8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBluetoothStateChangedHandler:", &v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
  }
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __38__TVRUINetworkObserver_startObserving__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _TVRUINetworkObserverLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B042000, v3, OS_LOG_TYPE_DEFAULT, "Observing Wi-Fi and Bluetooth changes", buf, 2u);
    }

    objc_msgSend(WeakRetained, "wifiClient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      if (objc_opt_class())
      {
        v5 = objc_alloc_init(MEMORY[0x24BEC28D0]);
        objc_msgSend(WeakRetained, "setWifiClient:", v5);
      }
      else
      {
        _TVRUINetworkObserverLog();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          __38__TVRUINetworkObserver_startObserving__block_invoke_cold_1(v5);
      }

    }
    objc_msgSend(WeakRetained, "wifiStateMonitor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      _TVRUINetworkObserverLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B042000, v7, OS_LOG_TYPE_DEFAULT, "Monitoring Wi-Fi state", buf, 2u);
      }

      v8 = objc_alloc(MEMORY[0x24BEC28F8]);
      objc_msgSend(WeakRetained, "wifiClient");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __38__TVRUINetworkObserver_startObserving__block_invoke_4;
      v11[3] = &unk_24DE2D270;
      objc_copyWeak(&v12, v1);
      v10 = (void *)objc_msgSend(v8, "initWithClient:handler:", v9, v11);
      objc_msgSend(WeakRetained, "setWifiStateMonitor:", v10);

      objc_destroyWeak(&v12);
    }
  }

}

void __38__TVRUINetworkObserver_startObserving__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_wifiStateUpdatedWithOldState:newState:", a2, a3);

}

void __38__TVRUINetworkObserver_startObserving__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  _TVRUINetworkObserverLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21B042000, v4, OS_LOG_TYPE_DEFAULT, "Monitoring Bluetooth state", v6, 2u);
  }

  if (v3)
  {
    _TVRUINetworkObserverLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __38__TVRUINetworkObserver_startObserving__block_invoke_2_cold_1((uint64_t)v3, v5);
  }
  else
  {
    v5 = objc_loadWeakRetained((id *)(a1 + 32));
    -[NSObject _updateBluetoothAvailability:](v5, "_updateBluetoothAvailability:", -[NSObject isBluetoothAvailable](v5, "isBluetoothAvailable"));

  }
}

void __38__TVRUINetworkObserver_startObserving__block_invoke_9(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "cbController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "bluetoothState");

    _TVRUINetworkObserverLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134217984;
      v7 = v4;
      _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "Bluetooth state = %ld", (uint8_t *)&v6, 0xCu);
    }

    if (v4 != 1)
      objc_msgSend(v2, "_updateBluetoothAvailability:", objc_msgSend(v2, "isBluetoothAvailable"));
  }

}

- (void)stopObserving
{
  NSObject *v3;
  _QWORD block[5];

  -[TVRUINetworkObserver queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__TVRUINetworkObserver_stopObserving__block_invoke;
  block[3] = &unk_24DE2C198;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __37__TVRUINetworkObserver_stopObserving__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v6[16];

  _TVRUINetworkObserverLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21B042000, v2, OS_LOG_TYPE_DEFAULT, "Stop observing Wi-Fi and Bluetooth changes", v6, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "wifiStateMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopMonitoring");

  objc_msgSend(*(id *)(a1 + 32), "setWifiStateMonitor:", 0);
  objc_msgSend(*(id *)(a1 + 32), "cbController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  return objc_msgSend(*(id *)(a1 + 32), "setCbController:", 0);
}

- (BOOL)isNetworkReachable
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  NSObject *v6;
  const __CFString *v7;
  NSObject *v8;
  const __CFString *v9;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[TVRUINetworkObserver wifiStateMonitor](self, "wifiStateMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[WFWiFiStateMonitor state](self->_wifiStateMonitor, "state");
    v5 = v4 == 4;
    _TVRUINetworkObserverLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CFSTR("not associated");
      if (v4 == 4)
        v7 = CFSTR("associated");
      v11 = 138412290;
      v12 = v7;
      _os_log_impl(&dword_21B042000, v6, OS_LOG_TYPE_DEFAULT, "Wi-Fi is %@", (uint8_t *)&v11, 0xCu);
    }

  }
  else
  {
    v5 = 0;
  }
  _TVRUINetworkObserverLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("unreachable");
    if (v5)
      v9 = CFSTR("reachable");
    v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_21B042000, v8, OS_LOG_TYPE_DEFAULT, "Network is %@", (uint8_t *)&v11, 0xCu);
  }

  return v5;
}

- (BOOL)isBluetoothAvailable
{
  void *v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v7;
  NSObject *v8;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[TVRUINetworkObserver cbController](self, "cbController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TVRUINetworkObserver cbController](self, "cbController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "bluetoothState");

    v7 = v5 == 5 || v5 == 10;
    _TVRUINetworkObserverLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109120;
      v10[1] = v7;
      _os_log_impl(&dword_21B042000, v8, OS_LOG_TYPE_DEFAULT, "Bluetooth available = %d", (uint8_t *)v10, 8u);
    }

  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)_wifiStateUpdatedWithOldState:(int64_t)a3 newState:(int64_t)a4
{
  NSObject *v7;
  _QWORD block[7];

  -[TVRUINetworkObserver queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__TVRUINetworkObserver__wifiStateUpdatedWithOldState_newState___block_invoke;
  block[3] = &unk_24DE2D2E8;
  block[5] = a4;
  block[6] = a3;
  block[4] = self;
  dispatch_async(v7, block);

}

void __63__TVRUINetworkObserver__wifiStateUpdatedWithOldState_newState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 40) != *(_QWORD *)(a1 + 48))
  {
    _TVRUINetworkObserverLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      WFWiFiStateMonitorStringForState();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      WFWiFiStateMonitorStringForState();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v10 = v3;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_21B042000, v2, OS_LOG_TYPE_DEFAULT, "Wi-Fi %@ -> %@", buf, 0x16u);

    }
    v5 = *(_QWORD *)(a1 + 40) - 2;
    if (v5 > 3)
      v6 = 0;
    else
      v6 = qword_21B0F7AC8[v5];
    objc_msgSend(*(id *)(a1 + 32), "wifiStateUpdatedHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __63__TVRUINetworkObserver__wifiStateUpdatedWithOldState_newState___block_invoke_18;
      v8[3] = &unk_24DE2D2C0;
      v8[4] = *(_QWORD *)(a1 + 32);
      v8[5] = v6;
      dispatch_async(MEMORY[0x24BDAC9B8], v8);
    }
  }
}

void __63__TVRUINetworkObserver__wifiStateUpdatedWithOldState_newState___block_invoke_18(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "wifiStateUpdatedHandler");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

- (void)_updateBluetoothAvailability:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  const __CFString *v7;
  _QWORD v8[5];
  BOOL v9;
  uint8_t buf[4];
  const __CFString *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  -[TVRUINetworkObserver bluetoothAvailabilityDidUpdate](self, "bluetoothAvailabilityDidUpdate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    _TVRUINetworkObserverLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CFSTR("unavailable");
      if (v3)
        v7 = CFSTR("available");
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_impl(&dword_21B042000, v6, OS_LOG_TYPE_DEFAULT, "Bluetooth availability changed to %@", buf, 0xCu);
    }

    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __53__TVRUINetworkObserver__updateBluetoothAvailability___block_invoke;
    v8[3] = &unk_24DE2D248;
    v8[4] = self;
    v9 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], v8);
  }
}

void __53__TVRUINetworkObserver__updateBluetoothAvailability___block_invoke(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "bluetoothAvailabilityDidUpdate");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(unsigned __int8 *)(a1 + 40));

}

- (id)wifiStateUpdatedHandler
{
  return self->_wifiStateUpdatedHandler;
}

- (void)setWifiStateUpdatedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)bluetoothAvailabilityDidUpdate
{
  return self->_bluetoothAvailabilityDidUpdate;
}

- (void)setBluetoothAvailabilityDidUpdate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CBController)cbController
{
  return self->_cbController;
}

- (void)setCbController:(id)a3
{
  objc_storeStrong((id *)&self->_cbController, a3);
}

- (WFWiFiStateMonitor)wifiStateMonitor
{
  return self->_wifiStateMonitor;
}

- (void)setWifiStateMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_wifiStateMonitor, a3);
}

- (WFClient)wifiClient
{
  return self->_wifiClient;
}

- (void)setWifiClient:(id)a3
{
  objc_storeStrong((id *)&self->_wifiClient, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_wifiClient, 0);
  objc_storeStrong((id *)&self->_wifiStateMonitor, 0);
  objc_storeStrong((id *)&self->_cbController, 0);
  objc_storeStrong(&self->_bluetoothAvailabilityDidUpdate, 0);
  objc_storeStrong(&self->_wifiStateUpdatedHandler, 0);
}

void __38__TVRUINetworkObserver_startObserving__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21B042000, log, OS_LOG_TYPE_ERROR, "WiFIKit not available", v1, 2u);
}

void __38__TVRUINetworkObserver_startObserving__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_21B042000, a2, OS_LOG_TYPE_ERROR, "Failed to activate BLE Controller: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
