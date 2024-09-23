@implementation WFWiFiStateMonitor

void __46__WFWiFiStateMonitor__asyncGetCurrentNetwork___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "scanResult");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "matchingKnownNetworkProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

- (WFLinkQuality)linkQuality
{
  return self->_linkQuality;
}

void __46__WFWiFiStateMonitor__asyncGetCurrentNetwork___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__WFWiFiStateMonitor__asyncGetCurrentNetwork___block_invoke_3;
  v6[3] = &unk_24DC35468;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

- (void)setState:(int64_t)a3
{
  NSObject *internalQueue;
  _QWORD v4[6];

  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __31__WFWiFiStateMonitor_setState___block_invoke;
  v4[3] = &unk_24DC348D0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(internalQueue, v4);
}

- (void)setCurrentNetwork:(id)a3
{
  objc_storeStrong((id *)&self->_currentNetwork, a3);
}

- (void)setAssociatedToCarPlayOnly:(BOOL)a3
{
  self->_associatedToCarPlayOnly = a3;
}

- (CWFScanResult)currentNetwork
{
  return self->_currentNetwork;
}

- (void)startMonitoring
{
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  WFWiFiStateMonitor *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (-[WFWiFiStateMonitor monitoring](self, "monitoring"))
  {
    WFLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
    {
      *(_DWORD *)buf = 138412290;
      v16 = self;
      _os_log_impl(&dword_219FC8000, v3, v4, "%@: already monitoring", buf, 0xCu);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__powerStateDidChange_, CFSTR("WFClientPowerStateChangedNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__clientConnectionRestarted_, CFSTR("WFClientServerRestartedNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__interfaceBecameAvailable_, CFSTR("WFClientInterfaceAvailableNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__autoJoinStateChanged_, CFSTR("WFClientUserAutoJoinStateChangedNotification"), 0);

    -[WFWiFiStateMonitor client](self, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[WFWiFiStateMonitor client](self, "client");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "interface");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWiFiStateMonitor _registerInterfaceObserversForInterface:](self, "_registerInterfaceObserversForInterface:", v11);

      -[WFWiFiStateMonitor _updateState](self, "_updateState");
      -[WFWiFiStateMonitor setMonitoring:](self, "setMonitoring:", 1);
    }
    else
    {
      objc_initWeak((id *)buf, self);
      -[WFWiFiStateMonitor internalQueue](self, "internalQueue");
      v12 = objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __37__WFWiFiStateMonitor_startMonitoring__block_invoke;
      v13[3] = &unk_24DC34750;
      objc_copyWeak(&v14, (id *)buf);
      v13[4] = self;
      dispatch_async(v12, v13);

      objc_destroyWeak(&v14);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (void)_registerInterfaceObserversForInterface:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  os_log_type_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  WFWiFiStateMonitor *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    v16 = 138412546;
    v17 = self;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_219FC8000, v5, v6, "%@: using interface %@", (uint8_t *)&v16, 0x16u);
  }

  if (!v4)
  {
    WFLogForCategory(0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v7)
    {
      v9 = v7;
      if (os_log_type_enabled(v9, v8))
      {
        -[WFWiFiStateMonitor client](self, "client");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412546;
        v17 = self;
        v18 = 2112;
        v19 = v10;
        _os_log_impl(&dword_219FC8000, v9, v8, "%@: nil interface (client %@)", (uint8_t *)&v16, 0x16u);

      }
    }

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__hostAPStateChanged_, CFSTR("WFInterfaceHostAPStateChangeNotification"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", self, sel__linkDidChange_, CFSTR("WFInterfaceNetworkChangedNotification"), v4);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", self, sel__linkQualityDidChange_, CFSTR("WFInterfaceLinkQualityNotification"), v4);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__outrankStateDidChange_, CFSTR("WFClientCellularOutrankWiFiNotification"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObserver:selector:name:object:", self, sel__carPlayNetworkTypeDidChange_, CFSTR("WFInterfaceCarPlayNetworkTypeDidChangeNotification"), 0);

}

void __46__WFWiFiStateMonitor__asyncGetCurrentNetwork___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "interface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__WFWiFiStateMonitor__asyncGetCurrentNetwork___block_invoke_2;
  v4[3] = &unk_24DC35418;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "asyncCurrentNetwork:", v4);

}

void __37__WFWiFiStateMonitor_startMonitoring__block_invoke(uint64_t a1)
{
  id WeakRetained;
  WFClient *v3;
  void *v4;
  WFClient *v5;
  void *v6;
  os_log_type_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD block[5];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "_spawnManagerCallbackThread");
    v3 = [WFClient alloc];
    objc_msgSend(*(id *)(a1 + 32), "callbackRunLoop");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[WFClient initWithCallbackRunLoop:](v3, "initWithCallbackRunLoop:", v4);
    objc_msgSend(WeakRetained, "setClient:", v5);

    WFLogForCategory(0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v6)
    {
      v8 = v6;
      if (os_log_type_enabled(v8, v7))
      {
        v9 = *(void **)(a1 + 32);
        objc_msgSend(v9, "client");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v15 = v9;
        v16 = 2112;
        v17 = v10;
        _os_log_impl(&dword_219FC8000, v8, v7, "%@: client %@", buf, 0x16u);

      }
    }

    objc_msgSend(WeakRetained, "client");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "interface");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_registerInterfaceObserversForInterface:", v12);

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37__WFWiFiStateMonitor_startMonitoring__block_invoke_13;
    block[3] = &unk_24DC348F8;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

- (void)_updateState:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  os_log_type_t v11;
  const char *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  WFWiFiStateMonitor *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 138412290;
    v17 = self;
    _os_log_impl(&dword_219FC8000, v5, v6, "%@: updating state", buf, 0xCu);
  }

  -[WFWiFiStateMonitor client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cInterface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[WFWiFiStateMonitor client](self, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (_os_feature_enabled_impl())
      {
        -[WFWiFiStateMonitor _updateWiFiUIState:](self, "_updateWiFiUIState:", v4);
      }
      else
      {
        -[WFWiFiStateMonitor client](self, "client");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __35__WFWiFiStateMonitor__updateState___block_invoke;
        v14[3] = &unk_24DC35AF0;
        v14[4] = self;
        v15 = v4;
        objc_msgSend(v13, "asyncPowered:", v14);

      }
      goto LABEL_21;
    }
    WFLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)buf = 138412290;
      v17 = self;
      v12 = "%@: client is unavailable";
      goto LABEL_17;
    }
  }
  else
  {
    WFLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)buf = 138412290;
      v17 = self;
      v12 = "%@: interface is unavailable";
LABEL_17:
      _os_log_impl(&dword_219FC8000, v10, v11, v12, buf, 0xCu);
    }
  }

  -[WFWiFiStateMonitor setState:](self, "setState:", 0);
  -[WFWiFiStateMonitor setAssociatedToCarPlayOnly:](self, "setAssociatedToCarPlayOnly:", 0);
  if (v4)
    (*((void (**)(id, int64_t))v4 + 2))(v4, -[WFWiFiStateMonitor state](self, "state"));
LABEL_21:

}

- (WFClient)client
{
  return self->_client;
}

void __51__WFWiFiStateMonitor__notifyStateChanged_newState___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  os_log_type_t v4;
  BOOL v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "handler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  WFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel())
    v5 = v3 == 0;
  else
    v5 = 1;
  v6 = !v5;
  if (v2)
  {
    if (v6 && os_log_type_enabled((os_log_t)v3, v4))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_219FC8000, (os_log_t)v3, v4, "%@: calling state changed handler", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "handler");
    v3 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else if (v6 && os_log_type_enabled((os_log_t)v3, v4))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_219FC8000, (os_log_t)v3, v4, "%@: handler is nil, can't call state changed handler", (uint8_t *)&v9, 0xCu);
  }

}

- (id)handler
{
  return objc_getProperty(self, a2, 24, 1);
}

void __35__WFWiFiStateMonitor__updateState___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) != 0)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__5;
    v15 = __Block_byref_object_dispose__5;
    v16 = 0;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __35__WFWiFiStateMonitor__updateState___block_invoke_38;
    v8[3] = &unk_24DC35B18;
    v3 = *(void **)(a1 + 40);
    v9 = *(id *)(a1 + 32);
    p_buf = &buf;
    v10 = v3;
    objc_msgSend(v9, "_asyncGetCurrentNetwork:", v8);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    WFLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
    {
      v6 = *(_QWORD *)(a1 + 32);
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_219FC8000, v4, v5, "%@: power is off", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
    objc_msgSend(*(id *)(a1 + 32), "setLinkQuality:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setAssociatedToCarPlayOnly:", 0);
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, objc_msgSend(*(id *)(a1 + 32), "state"));
  }
}

- (void)_asyncGetCurrentNetwork:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(21, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__WFWiFiStateMonitor__asyncGetCurrentNetwork___block_invoke;
  v7[3] = &unk_24DC35378;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_runManagerCallbackThread
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x220738720](self, a2);
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", CFSTR("WFWiFiStateMonitor callback thread"));

  self->_callbackRunLoop = (NSRunLoop *)(id)objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
  objc_msgSend(MEMORY[0x24BDBCEA8], "port");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheduleInRunLoop:forMode:", v6, *MEMORY[0x24BDBCB80]);

  objc_autoreleasePoolPop(v3);
  objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "run");

}

void __31__WFWiFiStateMonitor_setState___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  BOOL v6;
  int v7;
  uint64_t v8;
  unint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  unint64_t v12;
  const __CFString *v13;
  unint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel())
    v6 = v4 == 0;
  else
    v6 = 1;
  v7 = !v6;
  if (v2 == v3)
  {
    if (v7 && os_log_type_enabled(v4, v5))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(v8 + 16);
      if (v9 > 5)
        v10 = CFSTR("Unknown");
      else
        v10 = off_24DC35BB0[v9];
      v18 = 138412546;
      v19 = v8;
      v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_219FC8000, v4, v5, "%@: no change to state (%@)", (uint8_t *)&v18, 0x16u);
    }

  }
  else
  {
    if (v7 && os_log_type_enabled(v4, v5))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(v11 + 16);
      if (v12 > 5)
        v13 = CFSTR("Unknown");
      else
        v13 = off_24DC35BB0[v12];
      v14 = *(_QWORD *)(a1 + 40);
      if (v14 > 5)
        v15 = CFSTR("Unknown");
      else
        v15 = off_24DC35BB0[v14];
      v18 = 138412802;
      v19 = v11;
      v20 = 2112;
      v21 = v13;
      v22 = 2112;
      v23 = v15;
      _os_log_impl(&dword_219FC8000, v4, v5, "%@: old state %@ new state %@", (uint8_t *)&v18, 0x20u);
    }

    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(_QWORD *)(v16 + 16);
    *(_QWORD *)(v16 + 16) = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_notifyStateChanged:newState:", v17, *(_QWORD *)(a1 + 40));
  }
}

- (int64_t)state
{
  return self->_state;
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

- (void)setLinkQuality:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (void)setCallbackThread:(id)a3
{
  objc_storeStrong((id *)&self->_callbackThread, a3);
}

- (BOOL)monitoring
{
  return self->_monitoring;
}

- (OS_dispatch_queue)internalQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (WFWiFiStateMonitor)initWithClient:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  WFWiFiStateMonitor *v9;
  void *v10;
  __CFString *v11;
  WFMobileWiFiStateMonitor *v12;
  dispatch_queue_t v13;
  void *v14;
  dispatch_queue_t v15;
  void *v16;
  void *v17;
  void *v18;
  WFWiFiStateMonitor *v19;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)WFWiFiStateMonitor;
  v9 = -[WFWiFiStateMonitor init](&v21, sel_init);
  v10 = v9;
  if (!v9)
  {
    v11 = 0;
    goto LABEL_10;
  }
  objc_storeStrong((id *)&v9->_client, a3);
  v11 = (__CFString *)WFCopyProcessIdentifier();
  if (!-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("com.apple.TVRemote")))
  {
    v13 = dispatch_queue_create("WFWiFiStateMonitor-Queue", 0);
    v14 = (void *)*((_QWORD *)v10 + 6);
    *((_QWORD *)v10 + 6) = v13;

    if (*((_QWORD *)v10 + 6))
    {
      v15 = dispatch_queue_create("WiFiUIStateFlags-Queue", 0);
      v16 = (void *)*((_QWORD *)v10 + 7);
      *((_QWORD *)v10 + 7) = v15;

      if (*((_QWORD *)v10 + 7))
      {
        objc_storeStrong((id *)v10 + 12, v11);
        *((_QWORD *)v10 + 2) = 0;
        v17 = _Block_copy(v8);
        v18 = (void *)*((_QWORD *)v10 + 3);
        *((_QWORD *)v10 + 3) = v17;

        objc_msgSend(v10, "startMonitoring");
LABEL_7:
        v12 = v10;
        v10 = v12;
        goto LABEL_8;
      }
    }
LABEL_10:

    v10 = 0;
    goto LABEL_7;
  }
  v12 = -[WFMobileWiFiStateMonitor initWithHandler:]([WFMobileWiFiStateMonitor alloc], "initWithHandler:", v8);
LABEL_8:
  v19 = (WFWiFiStateMonitor *)v12;

  return v19;
}

- (NSRunLoop)callbackRunLoop
{
  return self->_callbackRunLoop;
}

- (void)_updateState
{
  -[WFWiFiStateMonitor _updateState:](self, "_updateState:", 0);
}

- (void)_spawnManagerCallbackThread
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17F0]), "initWithTarget:selector:object:", self, sel__runManagerCallbackThread, 0);
  objc_msgSend(v3, "start");
  -[WFWiFiStateMonitor setCallbackThread:](self, "setCallbackThread:", v3);
  -[WFWiFiStateMonitor performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", sel_class, v3, 0, 1);

}

- (void)_notifyStateChanged:(int64_t)a3 newState:(int64_t)a4
{
  void *v7;
  NSObject *v8;
  os_log_type_t v9;
  _QWORD block[7];
  uint8_t buf[4];
  WFWiFiStateMonitor *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[WFWiFiStateMonitor handler](self, "handler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__WFWiFiStateMonitor__notifyStateChanged_newState___block_invoke;
    block[3] = &unk_24DC35B68;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    WFLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v9))
    {
      *(_DWORD *)buf = 138412290;
      v12 = self;
      _os_log_impl(&dword_219FC8000, v8, v9, "%@: handler is nil, can't call state changed handler", buf, 0xCu);
    }

  }
}

- (void)_linkDidChange:(id)a3
{
  NSObject *v4;
  os_log_type_t v5;
  int v6;
  WFWiFiStateMonitor *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    v6 = 138412290;
    v7 = self;
    _os_log_impl(&dword_219FC8000, v4, v5, "%@: link change", (uint8_t *)&v6, 0xCu);
  }

  -[WFWiFiStateMonitor _updateState](self, "_updateState");
}

- (WFWiFiStateMonitor)init
{
  return -[WFWiFiStateMonitor initWithClient:handler:](self, "initWithClient:handler:", 0, 0);
}

uint64_t __37__WFWiFiStateMonitor_startMonitoring__block_invoke_13(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateState");
  return objc_msgSend(*(id *)(a1 + 32), "setMonitoring:", 1);
}

- (void)stopMonitoring
{
  void *v3;
  NSObject *v4;
  os_log_type_t v5;
  int v6;
  WFWiFiStateMonitor *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (-[WFWiFiStateMonitor monitoring](self, "monitoring"))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self);

    self->_state = 0;
    -[WFWiFiStateMonitor setMonitoring:](self, "setMonitoring:", 0);
  }
  else
  {
    WFLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
    {
      v6 = 138412290;
      v7 = self;
      _os_log_impl(&dword_219FC8000, v4, v5, "%@: not monitoring", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[WFWiFiStateMonitor stopMonitoring](self, "stopMonitoring");
  -[WFWiFiStateMonitor callbackThread](self, "callbackThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)WFWiFiStateMonitor;
  -[WFWiFiStateMonitor dealloc](&v4, sel_dealloc);
}

void __35__WFWiFiStateMonitor__updateState___block_invoke_38(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  os_log_type_t v14;
  void *v15;
  void *v16;
  void *v17;
  os_log_type_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  os_log_type_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  os_log_type_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  WFLinkQuality *v41;
  double v42;
  WFLinkQuality *v43;
  void *v44;
  int v45;
  void *v46;
  os_log_type_t v47;
  NSObject *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  void *v58;
  os_log_type_t v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  os_log_type_t v67;
  NSObject *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  _QWORD v72[5];
  id v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  id v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "currentNetwork");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  WFLogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
  {
    v11 = *(void **)(a1 + 32);
    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    *(_DWORD *)buf = 138412802;
    v75 = v11;
    v76 = 2112;
    v77 = v12;
    v78 = 2112;
    v79 = v7;
    _os_log_impl(&dword_219FC8000, v9, v10, "%@: network %@ profile %@", buf, 0x20u);
  }

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    if (objc_msgSend(v7, "carPlayNetworkType") == 1)
    {
      WFLogForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v13 && os_log_type_enabled(v13, v14))
      {
        v15 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v75 = v15;
        _os_log_impl(&dword_219FC8000, v13, v14, "%@: associated to CarPlay only network", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "setState:", 2);
      objc_msgSend(*(id *)(a1 + 32), "setAssociatedToCarPlayOnly:", 1);
      objc_msgSend(*(id *)(a1 + 32), "linkQuality");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        WFLogForCategory(0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v17)
        {
          v19 = v17;
          if (os_log_type_enabled(v19, v18))
          {
            v20 = *(void **)(a1 + 32);
            objc_msgSend(v20, "linkQuality");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v75 = v20;
            v76 = 2112;
            v77 = v21;
            _os_log_impl(&dword_219FC8000, v19, v18, "%@: clearing out link quality='%@' due to CarPlay only network", buf, 0x16u);

          }
        }

        objc_msgSend(*(id *)(a1 + 32), "setLinkQuality:", 0);
      }
      goto LABEL_63;
    }
    objc_msgSend(*(id *)(a1 + 32), "setAssociatedToCarPlayOnly:", 0);
    objc_msgSend(*(id *)(a1 + 32), "linkQuality");
    v29 = objc_claimAutoreleasedReturnValue();
    if (!v29)
      goto LABEL_26;
    v30 = (void *)v29;
    objc_msgSend(*(id *)(a1 + 32), "linkQuality");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "ssid");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "networkName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v32, "isEqualToString:", v33);

    if ((v34 & 1) == 0)
    {
LABEL_26:
      WFLogForCategory(0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v35)
      {
        v37 = v35;
        if (os_log_type_enabled(v37, v36))
        {
          v38 = *(void **)(a1 + 32);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "networkName");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v75 = v38;
          v76 = 2112;
          v77 = v39;
          _os_log_impl(&dword_219FC8000, v37, v36, "%@: creating link quality for network %@", buf, 0x16u);

        }
      }

      objc_msgSend(v7, "displayFriendlyName");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v40)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "networkName");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v41 = [WFLinkQuality alloc];
      LODWORD(v42) = 1.0;
      v43 = -[WFLinkQuality initWithSSID:rssi:scaledRSSI:](v41, "initWithSSID:rssi:scaledRSSI:", v40, 0, v42);
      objc_msgSend(*(id *)(a1 + 32), "setLinkQuality:", v43);

    }
    objc_msgSend(*(id *)(a1 + 32), "client");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "isCellularOutrankingWiFi");

    if (v45)
    {
      WFLogForCategory(0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v46)
      {
        v48 = v46;
        if (os_log_type_enabled(v48, v47))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "networkName");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v75 = v49;
          _os_log_impl(&dword_219FC8000, v48, v47, "associated to '%@' but cellular is outranking WiFi", buf, 0xCu);

        }
      }

      objc_msgSend(*(id *)(a1 + 32), "setState:", 2);
      goto LABEL_63;
    }
    objc_msgSend(*(id *)(a1 + 32), "setState:", 4);
    v50 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v50 && v8)
    {
      objc_msgSend(v50, "networkName");
      v51 = objc_claimAutoreleasedReturnValue();
      if (!v51)
        goto LABEL_62;
      v52 = (void *)v51;
      objc_msgSend(v8, "networkName");
      v53 = objc_claimAutoreleasedReturnValue();
      if (!v53)
      {

        goto LABEL_62;
      }
      v54 = (void *)v53;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "networkName");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "networkName");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v55, "isEqual:", v56);

      if ((v57 & 1) != 0)
      {
LABEL_62:
        objc_msgSend(*(id *)(a1 + 32), "setCurrentNetwork:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
LABEL_63:
        v71 = *(_QWORD *)(a1 + 40);
        if (v71)
          (*(void (**)(uint64_t, uint64_t))(v71 + 16))(v71, objc_msgSend(*(id *)(a1 + 32), "state"));
        goto LABEL_65;
      }
      WFLogForCategory(0);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v58)
      {
        v60 = v58;
        if (os_log_type_enabled(v60, v59))
        {
          v61 = *(void **)(a1 + 32);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "networkName");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "networkName");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v75 = v61;
          v76 = 2112;
          v77 = v62;
          v78 = 2112;
          v79 = v63;
          _os_log_impl(&dword_219FC8000, v60, v59, "%@: network changed (was %@, is %@), calling state change handler", buf, 0x20u);

        }
      }

      v64 = *(void **)(a1 + 32);
      v65 = 4;
    }
    else
    {
      if (!v50 || v8)
        goto LABEL_62;
      WFLogForCategory(0);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v66)
      {
        v68 = v66;
        if (os_log_type_enabled(v68, v67))
        {
          v69 = *(void **)(a1 + 32);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "networkName");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v75 = v69;
          v76 = 2112;
          v77 = v70;
          _os_log_impl(&dword_219FC8000, v68, v67, "%@: network changed to %@, calling state change handler", buf, 0x16u);

        }
      }

      v64 = *(void **)(a1 + 32);
      v65 = 3;
    }
    objc_msgSend(v64, "_notifyStateChanged:newState:", v65, 4);
    goto LABEL_62;
  }
  objc_msgSend(*(id *)(a1 + 32), "setAssociatedToCarPlayOnly:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setCurrentNetwork:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setLinkQuality:", 0);
  WFLogForCategory(0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v22)
  {
    v24 = v22;
    if (os_log_type_enabled(v24, v23))
    {
      v25 = *(void **)(a1 + 32);
      objc_msgSend(v25, "linkQuality");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v75 = v25;
      v76 = 2112;
      v77 = v26;
      _os_log_impl(&dword_219FC8000, v24, v23, "%@: no network, cleared out link quality %@", buf, 0x16u);

    }
  }

  objc_msgSend(*(id *)(a1 + 32), "client");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = MEMORY[0x24BDAC760];
  v72[1] = 3221225472;
  v72[2] = __35__WFWiFiStateMonitor__updateState___block_invoke_40;
  v72[3] = &unk_24DC35AF0;
  v28 = *(void **)(a1 + 40);
  v72[4] = *(_QWORD *)(a1 + 32);
  v73 = v28;
  objc_msgSend(v27, "asyncMISState:", v72);

LABEL_65:
}

void __35__WFWiFiStateMonitor__updateState___block_invoke_40(uint64_t a1, int a2)
{
  void *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v3, "setState:", 5);
    WFLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_impl(&dword_219FC8000, v4, v5, "%@: not associated, MIS=1", buf, 0xCu);
    }

    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, objc_msgSend(*(id *)(a1 + 32), "state"));
  }
  else
  {
    objc_msgSend(v3, "client");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __35__WFWiFiStateMonitor__updateState___block_invoke_41;
    v10[3] = &unk_24DC35AF0;
    v9 = *(void **)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v9;
    objc_msgSend(v8, "asyncUserAutoJoinState:", v10);

  }
}

void __35__WFWiFiStateMonitor__updateState___block_invoke_41(uint64_t a1, int a2)
{
  void *v4;
  BOOL v5;
  uint64_t v6;
  void *v7;
  void *v8;
  os_log_type_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  os_log_type_t v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "currentNetwork");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = a2 == 0;
  else
    v5 = 1;
  if (v5)
  {
    if (a2)
      v6 = 3;
    else
      v6 = 2;
    v7 = *(void **)(a1 + 32);
  }
  else
  {
    WFLogForCategory(0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v8)
    {
      v10 = v8;
      if (os_log_type_enabled(v10, v9))
      {
        v11 = *(void **)(a1 + 32);
        objc_msgSend(v11, "currentNetwork");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412546;
        v18 = v11;
        v19 = 2112;
        v20 = v12;
        _os_log_impl(&dword_219FC8000, v10, v9, "%@: became associated during _updateState, self.currentNetwork is not nil %@", (uint8_t *)&v17, 0x16u);

      }
    }

    v7 = *(void **)(a1 + 32);
    v6 = 4;
  }
  objc_msgSend(v7, "setState:", v6);
  WFLogForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v13 && os_log_type_enabled(v13, v14))
  {
    v15 = *(void **)(a1 + 32);
    v17 = 138412546;
    v18 = v15;
    v19 = 1024;
    LODWORD(v20) = a2;
    _os_log_impl(&dword_219FC8000, v13, v14, "%@: not associated, userAutoJoin state=%d", (uint8_t *)&v17, 0x12u);
  }

  v16 = *(_QWORD *)(a1 + 40);
  if (v16)
    (*(void (**)(uint64_t, uint64_t))(v16 + 16))(v16, objc_msgSend(*(id *)(a1 + 32), "state"));
}

- (void)_updateWiFiUIState:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t (*v12)(uint64_t);
  uint64_t *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  __int128 *p_buf;
  uint64_t *v19;
  uint64_t v20;
  _QWORD block[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 buf;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  -[WFWiFiStateMonitor wifiUIStateFlagsQueue](self, "wifiUIStateFlagsQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__WFWiFiStateMonitor__updateWiFiUIState___block_invoke;
  block[3] = &unk_24DC353A0;
  block[4] = self;
  block[5] = &v22;
  dispatch_sync(v5, block);

  v7 = v23[3];
  if (v7)
  {
    if ((v7 & 2) != 0)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v27 = 0x3032000000;
      v28 = __Block_byref_object_copy__5;
      v29 = __Block_byref_object_dispose__5;
      v30 = 0;
      v16[0] = v6;
      v16[1] = 3221225472;
      v16[2] = __41__WFWiFiStateMonitor__updateWiFiUIState___block_invoke_45;
      v16[3] = &unk_24DC35B40;
      v16[4] = self;
      p_buf = &buf;
      v17 = v4;
      v19 = &v22;
      -[WFWiFiStateMonitor _asyncGetCurrentNetwork:](self, "_asyncGetCurrentNetwork:", v16);

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      WFLogForCategory(0);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v9))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = self;
        _os_log_impl(&dword_219FC8000, v8, v9, "%@: power is off", (uint8_t *)&buf, 0xCu);
      }

      -[WFWiFiStateMonitor setState:](self, "setState:", 1);
      -[WFWiFiStateMonitor setLinkQuality:](self, "setLinkQuality:", 0);
      -[WFWiFiStateMonitor setAssociatedToCarPlayOnly:](self, "setAssociatedToCarPlayOnly:", 0);
    }
    v15 = v6;
    v12 = __41__WFWiFiStateMonitor__updateWiFiUIState___block_invoke_48;
    v13 = &v15;
  }
  else
  {
    WFLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, v11))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_219FC8000, v10, v11, "%@: wifi UI status is unavailable", (uint8_t *)&buf, 0xCu);
    }

    -[WFWiFiStateMonitor setState:](self, "setState:", 0);
    -[WFWiFiStateMonitor setAssociatedToCarPlayOnly:](self, "setAssociatedToCarPlayOnly:", 0);
    v20 = v6;
    v12 = __41__WFWiFiStateMonitor__updateWiFiUIState___block_invoke_44;
    v13 = &v20;
  }
  v13[1] = 3221225472;
  v13[2] = (uint64_t)v12;
  v13[3] = (uint64_t)&unk_24DC35468;
  v13[4] = (uint64_t)self;
  v13[5] = (uint64_t)v4;
  v14 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v13);

  _Block_object_dispose(&v22, 8);
}

void __41__WFWiFiStateMonitor__updateWiFiUIState___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "wifiUIStateFlags");

}

uint64_t __41__WFWiFiStateMonitor__updateWiFiUIState___block_invoke_44(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 40);
  if (v1)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(v1, objc_msgSend(*(id *)(result + 32), "state"));
  return result;
}

void __41__WFWiFiStateMonitor__updateWiFiUIState___block_invoke_45(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  os_log_type_t v14;
  void *v15;
  void *v16;
  void *v17;
  os_log_type_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  os_log_type_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  os_log_type_t v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  WFLinkQuality *v43;
  double v44;
  WFLinkQuality *v45;
  void *v46;
  int v47;
  void *v48;
  os_log_type_t v49;
  NSObject *v50;
  void *v51;
  id v52;
  NSObject *v53;
  os_log_type_t v54;
  void *v55;
  const char *v56;
  NSObject *v57;
  os_log_type_t v58;
  uint32_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  char v67;
  void *v68;
  os_log_type_t v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  os_log_type_t v74;
  void *v75;
  _BOOL4 v76;
  _QWORD v77[5];
  id v78;
  _QWORD block[5];
  id v80;
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  id v86;
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "currentNetwork");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  WFLogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
  {
    v11 = *(void **)(a1 + 32);
    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    *(_DWORD *)buf = 138412802;
    v82 = v11;
    v83 = 2112;
    v84 = v12;
    v85 = 2112;
    v86 = v7;
    _os_log_impl(&dword_219FC8000, v9, v10, "%@: network %@ profile %@", buf, 0x20u);
  }

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "setAssociatedToCarPlayOnly:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setCurrentNetwork:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setLinkQuality:", 0);
    WFLogForCategory(0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v24)
    {
      v26 = v24;
      if (os_log_type_enabled(v26, v25))
      {
        v27 = *(void **)(a1 + 32);
        objc_msgSend(v27, "linkQuality");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v82 = v27;
        v83 = 2112;
        v84 = v28;
        _os_log_impl(&dword_219FC8000, v26, v25, "%@: no network, cleared out link quality %@", buf, 0x16u);

      }
    }

    v29 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    if ((v29 & 8) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "setState:", 5);
      WFLogForCategory(0);
      v53 = objc_claimAutoreleasedReturnValue();
      v54 = OSLogForWFLogLevel(1uLL);
      if (!WFCurrentLogLevel() || !v53 || !os_log_type_enabled(v53, v54))
        goto LABEL_65;
      v55 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v82 = v55;
      v56 = "%@: not associated, MIS=1";
      v57 = v53;
      v58 = v54;
      v59 = 12;
    }
    else
    {
      v30 = *(void **)(a1 + 32);
      if ((v29 & 1) == 0)
      {
        objc_msgSend(v30, "setState:", 3);
        goto LABEL_68;
      }
      objc_msgSend(v30, "setState:", 2);
      WFLogForCategory(0);
      v53 = objc_claimAutoreleasedReturnValue();
      v74 = OSLogForWFLogLevel(1uLL);
      if (!WFCurrentLogLevel() || !v53 || !os_log_type_enabled(v53, v74))
      {
LABEL_65:

        goto LABEL_68;
      }
      v75 = *(void **)(a1 + 32);
      v76 = (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) & 1) == 0;
      *(_DWORD *)buf = 138412546;
      v82 = v75;
      v83 = 1024;
      LODWORD(v84) = v76;
      v56 = "%@: not associated, userAutoJoin state=%d";
      v57 = v53;
      v58 = v74;
      v59 = 18;
    }
    _os_log_impl(&dword_219FC8000, v57, v58, v56, buf, v59);
    goto LABEL_65;
  }
  if (objc_msgSend(v7, "carPlayNetworkType") == 1)
  {
    WFLogForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v13 && os_log_type_enabled(v13, v14))
    {
      v15 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v82 = v15;
      _os_log_impl(&dword_219FC8000, v13, v14, "%@: associated to CarPlay only network", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setState:", 2);
    objc_msgSend(*(id *)(a1 + 32), "setAssociatedToCarPlayOnly:", 1);
    objc_msgSend(*(id *)(a1 + 32), "linkQuality");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      WFLogForCategory(0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v17)
      {
        v19 = v17;
        if (os_log_type_enabled(v19, v18))
        {
          v20 = *(void **)(a1 + 32);
          objc_msgSend(v20, "linkQuality");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v82 = v20;
          v83 = 2112;
          v84 = v21;
          _os_log_impl(&dword_219FC8000, v19, v18, "%@: clearing out link quality='%@' due to CarPlay only network", buf, 0x16u);

        }
      }

      objc_msgSend(*(id *)(a1 + 32), "setLinkQuality:", 0);
    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __41__WFWiFiStateMonitor__updateWiFiUIState___block_invoke_46;
    block[3] = &unk_24DC35468;
    v22 = *(id *)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v80 = v22;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    v23 = v80;
LABEL_44:

    goto LABEL_68;
  }
  objc_msgSend(*(id *)(a1 + 32), "setAssociatedToCarPlayOnly:", 0);
  objc_msgSend(*(id *)(a1 + 32), "linkQuality");
  v31 = objc_claimAutoreleasedReturnValue();
  if (!v31)
    goto LABEL_29;
  v32 = (void *)v31;
  objc_msgSend(*(id *)(a1 + 32), "linkQuality");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "ssid");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "networkName");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v34, "isEqualToString:", v35);

  if ((v36 & 1) == 0)
  {
LABEL_29:
    WFLogForCategory(0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v37)
    {
      v39 = v37;
      if (os_log_type_enabled(v39, v38))
      {
        v40 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "networkName");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v82 = v40;
        v83 = 2112;
        v84 = v41;
        _os_log_impl(&dword_219FC8000, v39, v38, "%@: creating link quality for network %@", buf, 0x16u);

      }
    }

    objc_msgSend(v7, "displayFriendlyName");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v42)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "networkName");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v43 = [WFLinkQuality alloc];
    LODWORD(v44) = 1.0;
    v45 = -[WFLinkQuality initWithSSID:rssi:scaledRSSI:](v43, "initWithSSID:rssi:scaledRSSI:", v42, 0, v44);
    objc_msgSend(*(id *)(a1 + 32), "setLinkQuality:", v45);

  }
  objc_msgSend(*(id *)(a1 + 32), "client");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "isCellularOutrankingWiFi");

  if (v47)
  {
    WFLogForCategory(0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v48)
    {
      v50 = v48;
      if (os_log_type_enabled(v50, v49))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "networkName");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v82 = v51;
        _os_log_impl(&dword_219FC8000, v50, v49, "associated to '%@' but cellular is outranking WiFi", buf, 0xCu);

      }
    }

    objc_msgSend(*(id *)(a1 + 32), "setState:", 2);
    v77[0] = MEMORY[0x24BDAC760];
    v77[1] = 3221225472;
    v77[2] = __41__WFWiFiStateMonitor__updateWiFiUIState___block_invoke_47;
    v77[3] = &unk_24DC35468;
    v52 = *(id *)(a1 + 40);
    v77[4] = *(_QWORD *)(a1 + 32);
    v78 = v52;
    dispatch_async(MEMORY[0x24BDAC9B8], v77);
    v23 = v78;
    goto LABEL_44;
  }
  objc_msgSend(*(id *)(a1 + 32), "setState:", 4);
  v60 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v60)
  {
    if (v8)
    {
      objc_msgSend(v60, "networkName");
      v61 = objc_claimAutoreleasedReturnValue();
      if (v61)
      {
        v62 = (void *)v61;
        objc_msgSend(v8, "networkName");
        v63 = objc_claimAutoreleasedReturnValue();
        if (v63)
        {
          v64 = (void *)v63;
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "networkName");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "networkName");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = objc_msgSend(v65, "isEqual:", v66);

          if ((v67 & 1) == 0)
          {
            WFLogForCategory(0);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v68)
            {
              v70 = v68;
              if (os_log_type_enabled(v70, v69))
              {
                v71 = *(void **)(a1 + 32);
                objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "networkName");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "networkName");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v82 = v71;
                v83 = 2112;
                v84 = v72;
                v85 = 2112;
                v86 = v73;
                _os_log_impl(&dword_219FC8000, v70, v69, "%@: network changed (was %@, is %@), calling state change handler", buf, 0x20u);

              }
            }

            objc_msgSend(*(id *)(a1 + 32), "_notifyStateChanged:newState:", 4, 4);
          }
        }
        else
        {

        }
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setCurrentNetwork:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
LABEL_68:

}

uint64_t __41__WFWiFiStateMonitor__updateWiFiUIState___block_invoke_46(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 40);
  if (v1)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(v1, objc_msgSend(*(id *)(result + 32), "state"));
  return result;
}

uint64_t __41__WFWiFiStateMonitor__updateWiFiUIState___block_invoke_47(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 40);
  if (v1)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(v1, objc_msgSend(*(id *)(result + 32), "state"));
  return result;
}

uint64_t __41__WFWiFiStateMonitor__updateWiFiUIState___block_invoke_48(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 40);
  if (v1)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(v1, objc_msgSend(*(id *)(result + 32), "state"));
  return result;
}

- (void)_powerStateDidChange:(id)a3
{
  id v4;
  void *v5;
  os_log_type_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  WFWiFiStateMonitor *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5)
  {
    v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      objc_msgSend(v4, "object");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = self;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_219FC8000, v7, v6, "%@: (sender: %@) power state changed", (uint8_t *)&v9, 0x16u);

    }
  }

  -[WFWiFiStateMonitor _updateState](self, "_updateState");
}

- (void)_linkQualityDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WFLinkQuality *v9;
  WFLinkQuality *linkQuality;
  void *v11;
  os_log_type_t v12;
  NSObject *v13;
  void *v14;
  unint64_t v15;
  const __CFString *v16;
  int v17;
  WFWiFiStateMonitor *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWiFiStateMonitor callbackThread](self, "callbackThread");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    objc_msgSend(v4, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("WFInterfaceLinkQualityKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (WFLinkQuality *)objc_msgSend(v8, "copy");
    linkQuality = self->_linkQuality;
    self->_linkQuality = v9;

    WFLogForCategory(0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v11)
    {
      v13 = v11;
      if (os_log_type_enabled(v13, v12))
      {
        -[WFWiFiStateMonitor linkQuality](self, "linkQuality");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[WFWiFiStateMonitor state](self, "state");
        if (v15 > 5)
          v16 = CFSTR("Unknown");
        else
          v16 = off_24DC35BB0[v15];
        v17 = 138412802;
        v18 = self;
        v19 = 2112;
        v20 = v14;
        v21 = 2112;
        v22 = v16;
        _os_log_impl(&dword_219FC8000, v13, v12, "%@: link quality changed %@ (current state %@)", (uint8_t *)&v17, 0x20u);

      }
    }

  }
}

- (void)_clientConnectionRestarted:(id)a3
{
  NSObject *v4;
  os_log_type_t v5;
  int64_t v6;
  _QWORD v7[6];
  uint8_t buf[4];
  WFWiFiStateMonitor *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    *(_DWORD *)buf = 138412290;
    v9 = self;
    _os_log_impl(&dword_219FC8000, v4, v5, "%@: client connection restarted", buf, 0xCu);
  }

  v6 = -[WFWiFiStateMonitor state](self, "state");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__WFWiFiStateMonitor__clientConnectionRestarted___block_invoke;
  v7[3] = &unk_24DC35B90;
  v7[4] = self;
  v7[5] = v6;
  -[WFWiFiStateMonitor _updateState:](self, "_updateState:", v7);
}

uint64_t __49__WFWiFiStateMonitor__clientConnectionRestarted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyStateChanged:newState:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "state"));
}

- (void)_hostAPStateChanged:(id)a3
{
  NSObject *v4;
  os_log_type_t v5;
  int v6;
  WFWiFiStateMonitor *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    v6 = 138412290;
    v7 = self;
    _os_log_impl(&dword_219FC8000, v4, v5, "%@: host ap state change", (uint8_t *)&v6, 0xCu);
  }

  -[WFWiFiStateMonitor _updateState](self, "_updateState");
}

- (void)_interfaceBecameAvailable:(id)a3
{
  NSObject *v4;
  os_log_type_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[6];
  uint8_t buf[4];
  WFWiFiStateMonitor *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    *(_DWORD *)buf = 138412290;
    v11 = self;
    _os_log_impl(&dword_219FC8000, v4, v5, "%@: interface became available", buf, 0xCu);
  }

  v6 = -[WFWiFiStateMonitor state](self, "state");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__WFWiFiStateMonitor__interfaceBecameAvailable___block_invoke;
  v9[3] = &unk_24DC35B90;
  v9[4] = self;
  v9[5] = v6;
  -[WFWiFiStateMonitor _updateState:](self, "_updateState:", v9);
  -[WFWiFiStateMonitor client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "interface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWiFiStateMonitor _registerInterfaceObserversForInterface:](self, "_registerInterfaceObserversForInterface:", v8);

}

uint64_t __48__WFWiFiStateMonitor__interfaceBecameAvailable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyStateChanged:newState:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "state"));
}

- (void)_autoJoinStateChanged:(id)a3
{
  NSObject *v4;
  os_log_type_t v5;
  int v6;
  WFWiFiStateMonitor *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    v6 = 138412290;
    v7 = self;
    _os_log_impl(&dword_219FC8000, v4, v5, "%@: auto join state changed", (uint8_t *)&v6, 0xCu);
  }

  -[WFWiFiStateMonitor _updateState](self, "_updateState");
}

- (void)_outrankStateDidChange:(id)a3
{
  NSObject *v4;
  os_log_type_t v5;
  int v6;
  WFWiFiStateMonitor *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    v6 = 138412290;
    v7 = self;
    _os_log_impl(&dword_219FC8000, v4, v5, "%@: cellular outrank state changed", (uint8_t *)&v6, 0xCu);
  }

  -[WFWiFiStateMonitor _updateState](self, "_updateState");
}

- (void)_carPlayNetworkTypeDidChange:(id)a3
{
  NSObject *v4;
  os_log_type_t v5;
  int v6;
  WFWiFiStateMonitor *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    v6 = 138412290;
    v7 = self;
    _os_log_impl(&dword_219FC8000, v4, v5, "%@: car play network type did change", (uint8_t *)&v6, 0xCu);
  }

  -[WFWiFiStateMonitor _updateState](self, "_updateState");
}

- (NSString)identifier
{
  NSString *identifier;
  __CFString *v3;
  void *v5;

  identifier = self->_identifier;
  if (identifier)
  {
    v3 = identifier;
  }
  else
  {
    -[WFWiFiStateMonitor bundleIdentifier](self, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[WFWiFiStateMonitor bundleIdentifier](self, "bundleIdentifier");
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = CFSTR("UNKNOWN");
    }
  }
  return (NSString *)v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWiFiStateMonitor identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFWiFiStateMonitor state](self, "state");
  if (v7 > 5)
    v8 = CFSTR("Unknown");
  else
    v8 = off_24DC35BB0[v7];
  -[WFWiFiStateMonitor currentNetwork](self, "currentNetwork");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "networkName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[WFWiFiStateMonitor currentNetwork](self, "currentNetwork");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "networkName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ : %p identifier='%@' state='%@' network='%@'>"), v5, self, v6, v8, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ : %p identifier='%@' state='%@' network='%@'>"), v5, self, v6, v8, &stru_24DC36C30);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setInternalQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (OS_dispatch_queue)wifiUIStateFlagsQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setWifiUIStateFlagsQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)associatedToCarPlayOnly
{
  return self->_associatedToCarPlayOnly;
}

- (void)setCallbackRunLoop:(id)a3
{
  self->_callbackRunLoop = (NSRunLoop *)a3;
}

- (NSThread)callbackThread
{
  return self->_callbackThread;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_callbackThread, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_currentNetwork, 0);
  objc_storeStrong((id *)&self->_wifiUIStateFlagsQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_linkQuality, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end
