@implementation WFHealthManager

- (WFHealthManager)initWithInterface:(id)a3
{
  id v5;
  WFHealthManager *v6;
  WFHealthManager *v7;
  WFInterface *interface;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NWPathEvaluator *evaluator;
  NWPathEvaluator *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *diagnosticsQueue;
  WFDiagnosticsManager *v20;
  WFDiagnosticsManager *diagnosticsManager;
  void *v22;
  void *v23;
  objc_super v25;

  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)WFHealthManager;
  v6 = -[WFHealthManager init](&v25, sel_init);
  v7 = v6;
  if (!v6)
  {
    v11 = 0;
    v23 = 0;
    goto LABEL_7;
  }
  objc_storeStrong((id *)&v6->_interface, a3);
  interface = v7->_interface;
  if (!interface)
  {
    v11 = 0;
LABEL_10:
    v23 = v7;
    v7 = 0;
    goto LABEL_7;
  }
  -[WFInterface currentNetwork](interface, "currentNetwork");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scanResult");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHealthManager setNetwork:](v7, "setNetwork:", v10);

  v11 = objc_alloc_init(MEMORY[0x24BDE07E0]);
  if (!v11)
    goto LABEL_10;
  v12 = objc_alloc(MEMORY[0x24BDE07D8]);
  -[WFInterface interfaceName](v7->_interface, "interfaceName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithInterfaceName:", v13);
  objc_msgSend(v11, "setRequiredInterface:", v14);

  v15 = objc_msgSend(objc_alloc(MEMORY[0x24BDE07E8]), "initWithEndpoint:parameters:", 0, v11);
  evaluator = v7->_evaluator;
  v7->_evaluator = (NWPathEvaluator *)v15;

  v17 = v7->_evaluator;
  if (!v17)
    goto LABEL_10;
  -[NWPathEvaluator addObserver:forKeyPath:options:context:](v17, "addObserver:forKeyPath:options:context:", v7, CFSTR("path"), 3, kWFHealthManagerContext);
  v18 = dispatch_queue_create(0, 0);
  diagnosticsQueue = v7->_diagnosticsQueue;
  v7->_diagnosticsQueue = (OS_dispatch_queue *)v18;

  if (!v7->_diagnosticsQueue)
    goto LABEL_10;
  v7->_completedVelocityTestTimes = 0;
  v20 = objc_alloc_init(WFDiagnosticsManager);
  diagnosticsManager = v7->_diagnosticsManager;
  v7->_diagnosticsManager = v20;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObserver:selector:name:object:", v7, sel_currentNetworkDidChange_, CFSTR("WFInterfaceNetworkChangedNotification"), v7->_interface);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObserver:selector:name:object:", v7, sel_linkQualityDidChange_, CFSTR("WFInterfaceLinkQualityNotification"), v7->_interface);
LABEL_7:

  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[WFHealthManager evaluator](self, "evaluator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("path"));

  v5.receiver = self;
  v5.super_class = (Class)WFHealthManager;
  -[WFHealthManager dealloc](&v5, sel_dealloc);
}

- (void)setNetwork:(id)a3
{
  id v5;
  int v6;
  NSObject *v7;
  os_log_type_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  NSSet *currentNetworkIssues;
  NSArray *failedTestsIDs;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_msgSend(v5, "isEqual:", self->_network);
  WFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v8 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v7)
    {
      v9 = v7;
      if (os_log_type_enabled(v9, v8))
      {
        objc_msgSend(v5, "networkName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 136315394;
        v15 = "-[WFHealthManager setNetwork:]";
        v16 = 2112;
        v17 = v10;
        _os_log_impl(&dword_219FC8000, v9, v8, "%s-No change to network, current network: %@", (uint8_t *)&v14, 0x16u);

      }
    }

  }
  else
  {
    v11 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, (os_log_type_t)v11))
    {
      v14 = 136315394;
      v15 = "-[WFHealthManager setNetwork:]";
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_219FC8000, v7, (os_log_type_t)v11, "%s- %@", (uint8_t *)&v14, 0x16u);
    }

    -[WFHealthManager setFailNoInternetDiagnosticsTests:](self, "setFailNoInternetDiagnosticsTests:", 0);
    objc_storeStrong((id *)&self->_network, a3);
    self->_failNoInternetDiagnosticsTests = 0;
    currentNetworkIssues = self->_currentNetworkIssues;
    self->_currentNetworkIssues = 0;

    failedTestsIDs = self->_failedTestsIDs;
    self->_failedTestsIDs = (NSArray *)MEMORY[0x24BDBD1A8];

    -[WFHealthManager _updateCurrentNetworkIssues](self, "_updateCurrentNetworkIssues");
  }

}

- (void)runNoInternetDiagnosticsAfter:(int64_t)a3
{
  dispatch_time_t v5;
  NSObject *diagnosticsQueue;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  -[WFHealthManager forceUpdateNetworkIssues](self, "forceUpdateNetworkIssues");
  v5 = dispatch_time(0, 1000000000 * a3);
  diagnosticsQueue = self->_diagnosticsQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__WFHealthManager_runNoInternetDiagnosticsAfter___block_invoke;
  v7[3] = &unk_24DC347A0;
  objc_copyWeak(&v8, &location);
  dispatch_after(v5, diagnosticsQueue, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __49__WFHealthManager_runNoInternetDiagnosticsAfter___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "runNoInternetDiagnostics");

}

- (void)runNoInternetDiagnostics
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  NSObject *v14;
  os_log_type_t v15;
  _QWORD v16[5];
  id v17;
  id location[2];

  -[WFHealthManager interface](self, "interface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isReadyForConnectionVelocityTest");

  if ((v4 & 1) != 0)
  {
    -[WFHealthManager interface](self, "interface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentNetwork");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ssid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[WFHealthManager network](self, "network");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "networkName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[WFHealthManager setFailNoInternetDiagnosticsTests:](self, "setFailNoInternetDiagnosticsTests:", 0);
    -[WFHealthManager network](self, "network");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isCarPlay");

    if ((v10 & 1) == 0)
    {
      if (v7)
      {
        objc_initWeak(location, self);
        -[WFHealthManager diagnosticsManager](self, "diagnosticsManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __43__WFHealthManager_runNoInternetDiagnostics__block_invoke_17;
        v16[3] = &unk_24DC357E0;
        objc_copyWeak(&v17, location);
        v16[4] = self;
        objc_msgSend(v11, "runNoInternetDiagnosticsFor:withUpdate:result:", v7, &__block_literal_global_4, v16);

        objc_destroyWeak(&v17);
        objc_destroyWeak(location);
      }
      else
      {
        WFLogForCategory(0);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v15))
        {
          LOWORD(location[0]) = 0;
          _os_log_impl(&dword_219FC8000, v14, v15, "Not running no internet test because ssid is nil!", (uint8_t *)location, 2u);
        }

        -[WFHealthManager forceUpdateNetworkIssues](self, "forceUpdateNetworkIssues");
      }
    }

  }
  else
  {
    WFLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v12 && os_log_type_enabled(v12, v13))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_219FC8000, v12, v13, "Not ready for velocity test, updating other health issues.", (uint8_t *)location, 2u);
    }

    -[WFHealthManager forceUpdateNetworkIssues](self, "forceUpdateNetworkIssues");
  }
}

void __43__WFHealthManager_runNoInternetDiagnostics__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  os_log_type_t v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  WFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_impl(&dword_219FC8000, v3, v4, "Diagnostics event received: %@", (uint8_t *)&v5, 0xCu);
  }

}

void __43__WFHealthManager_runNoInternetDiagnostics__block_invoke_17(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  os_log_type_t v16;
  dispatch_time_t v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  os_log_type_t v21;
  const char *v22;
  _QWORD block[4];
  id v24;
  id buf[2];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11 = WeakRetained;
  if (!v9)
  {
    WFLogForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v20 || !os_log_type_enabled(v20, v21))
      goto LABEL_20;
    LOWORD(buf[0]) = 0;
    v22 = "Not connected to a network, canceling following tests...";
    goto LABEL_19;
  }
  objc_msgSend(WeakRetained, "network");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "networkName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v9, "isEqualToString:", v13);

  if ((v14 & 1) == 0)
  {
    WFLogForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v20 || !os_log_type_enabled(v20, v21))
      goto LABEL_20;
    LOWORD(buf[0]) = 0;
    v22 = "Network has changed before no internet test result comes back! Discarding test results...";
LABEL_19:
    _os_log_impl(&dword_219FC8000, v20, v21, v22, (uint8_t *)buf, 2u);
LABEL_20:

    goto LABEL_21;
  }
  if (v8 && (objc_msgSend(v8, "didPassTest") & 1) == 0)
  {
    objc_msgSend(v11, "setFailNoInternetDiagnosticsTests:", 1);
    WFLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v15 && os_log_type_enabled(v15, v16))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_219FC8000, v15, v16, "Velocity no internet failed, reschedule another one after 10 second!", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, v11);
    v17 = dispatch_time(0, 10000000000);
    v18 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __43__WFHealthManager_runNoInternetDiagnostics__block_invoke_18;
    block[3] = &unk_24DC347A0;
    objc_copyWeak(&v24, buf);
    dispatch_after(v17, v18, block);
    objc_msgSend(v11, "setCompletedVelocityTestTimes:", objc_msgSend(v11, "completedVelocityTestTimes") + 1);
    objc_msgSend(v11, "setShouldFileNewMetrics:", 1);
    objc_msgSend(v8, "failedTests");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFailedTestsIDs:", v19);

    objc_destroyWeak(&v24);
    objc_destroyWeak(buf);
  }
  objc_msgSend(v11, "_updateCurrentNetworkIssues");
LABEL_21:

}

void __43__WFHealthManager_runNoInternetDiagnostics__block_invoke_18(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "runNoInternetDiagnostics");

}

- (void)currentNetworkDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[WFHealthManager interface](self, "interface", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentNetwork");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scanResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHealthManager setNetwork:](self, "setNetwork:", v5);

}

- (void)_updateCurrentNetworkIssues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  NSSet *currentNetworkIssues;
  NSObject *v50;
  os_log_type_t v51;
  NSSet *v52;
  NSSet *v53;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  -[WFHealthManager interface](self, "interface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentNetwork");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchingKnownNetworkProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFHealthManager network](self, "network");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_43:
    v9 = 0;
    currentNetworkIssues = self->_currentNetworkIssues;
    if (!currentNetworkIssues)
      goto LABEL_52;
    goto LABEL_44;
  }
  -[WFHealthManager network](self, "network");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "supportsWiFiHealth");

  if (!v8)
  {
    if (objc_msgSend(0, "count"))
      goto LABEL_43;
    v9 = 0;
    goto LABEL_42;
  }
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHealthManager network](self, "network");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configurationIssues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v12);

  }
  if (-[WFHealthManager currentNetworkHasNoInternetConnection](self, "currentNetworkHasNoInternetConnection"))
  {
    objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v13);

  }
  objc_msgSend(v5, "acceptedEAPTypes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count") == 1)
  {
    objc_msgSend(v5, "acceptedEAPTypes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "containsObject:", &unk_24DC5D4F8);

  }
  else
  {
    v16 = 0;
  }

  -[WFHealthManager network](self, "network");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "isEAP") || !v5 || objc_msgSend(v5, "addReason") != 10)
    goto LABEL_18;

  if (v16)
  {
    objc_msgSend(v5, "TLSTrustedServerNames");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", 0x40000);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v17);
LABEL_18:

    }
  }
  -[WFHealthManager interface](self, "interface");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "currentNetwork");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "matchingKnownNetworkProfile");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isStandalone6G");

  if (v22)
  {
    if (-[WFHealthManager isChinaDevice](self, "isChinaDevice"))
      objc_msgSend(MEMORY[0x24BEC2968], "limitedNetwork_CH");
    else
      objc_msgSend(MEMORY[0x24BEC2968], "limitedNetwork");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v23);

  }
  -[WFHealthManager interface](self, "interface");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "currentNetworkIsDirected"))
  {

    goto LABEL_29;
  }
  -[WFHealthManager network](self, "network");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isHidden");

  if ((v26 & 1) != 0)
    goto LABEL_29;
  -[WFHealthManager interface](self, "interface");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "currentNetwork");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "matchingKnownNetworkProfile");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[WFHealthManager interface](self, "interface");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "currentNetwork");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "matchingKnownNetworkProfile");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "hiddenState");

    if (v33 == 1)
    {
LABEL_29:
      objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", 8);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v9, "containsObject:", v34);

      if (v35)
      {
        objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", 128);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v36);

        v37 = (void *)MEMORY[0x24BEC2958];
        v38 = 8;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", 2);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v9, "containsObject:", v39);

        if (v40)
        {
          objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", 512);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v41);

          v37 = (void *)MEMORY[0x24BEC2958];
          v38 = 2;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", 4);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v9, "containsObject:", v42);

          if (v43)
          {
            objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", 256);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v44);

            v37 = (void *)MEMORY[0x24BEC2958];
            v38 = 4;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", 4096);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v9, "containsObject:", v45);

            if (!v46)
            {
              objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", 64);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "addObject:", v48);
              goto LABEL_38;
            }
            objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", 0x2000);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v47);

            v37 = (void *)MEMORY[0x24BEC2958];
            v38 = 4096;
          }
        }
      }
      objc_msgSend(v37, "issueWithType:", v38);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObject:", v48);
LABEL_38:

    }
  }

  if (!objc_msgSend(v9, "count"))
  {
LABEL_42:

    goto LABEL_43;
  }
  if (!v9)
    goto LABEL_43;
  currentNetworkIssues = self->_currentNetworkIssues;
LABEL_44:
  if ((objc_msgSend(v9, "isEqualToSet:", currentNetworkIssues) & 1) == 0)
  {
    WFLogForCategory(0);
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v50 && os_log_type_enabled(v50, v51))
    {
      *(_DWORD *)buf = 136315394;
      v56 = "-[WFHealthManager _updateCurrentNetworkIssues]";
      v57 = 2112;
      v58 = v9;
      _os_log_impl(&dword_219FC8000, v50, v51, "%s- change to health issues %@", buf, 0x16u);
    }

    v52 = (NSSet *)objc_msgSend(v9, "count");
    if (v52)
      v52 = v9;
    v53 = self->_currentNetworkIssues;
    self->_currentNetworkIssues = v52;

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__WFHealthManager__updateCurrentNetworkIssues__block_invoke;
    block[3] = &unk_24DC348F8;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
LABEL_52:

}

void __46__WFHealthManager__updateCurrentNetworkIssues__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("WFHealthManagerHealthIssuesDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

- (BOOL)currentNetworkHasNoInternetConnection
{
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  NSObject *v14;
  os_log_type_t v15;
  const char *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  void *v25;
  int64_t v26;
  void *v27;
  void *v28;
  void *v29;
  os_log_type_t v30;
  os_log_type_t v31;
  int v33;
  const char *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  if (-[WFHealthManager failNoInternetDiagnosticsTests](self, "failNoInternetDiagnosticsTests"))
  {
    WFLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
    {
      LOWORD(v33) = 0;
      _os_log_impl(&dword_219FC8000, v3, v4, "No internet warning generated becuase Velocity tests failed!", (uint8_t *)&v33, 2u);
    }

    if (-[WFHealthManager shouldFileNewMetrics](self, "shouldFileNewMetrics"))
    {
      +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[WFHealthManager completedVelocityTestTimes](self, "completedVelocityTestTimes");
      -[WFHealthManager failedTestsIDs](self, "failedTestsIDs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFHealthManager network](self, "network");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "networkName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFHealthUIEvent noInternetEventWithTestTimes:didPassTest:failedVelocityTests:ssid:](WFHealthUIEvent, "noInternetEventWithTestTimes:didPassTest:failedVelocityTests:ssid:", v6, 0, v7, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "processEvent:", v10);

    }
    -[WFHealthManager setShouldFileNewMetrics:](self, "setShouldFileNewMetrics:", 0);
    LOBYTE(v11) = 1;
  }
  else
  {
    -[WFHealthManager interface](self, "interface");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "ipv4SelfAssigned") & 1) != 0)
    {
      v11 = 1;
    }
    else
    {
      -[WFHealthManager interface](self, "interface");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v13, "hasNoGatewayIP");

    }
    WFLogForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v14 && os_log_type_enabled(v14, v15))
    {
      v16 = "yes";
      if (v11)
        v16 = "no";
      v33 = 136315394;
      v34 = "-[WFHealthManager currentNetworkHasNoInternetConnection]";
      v35 = 2080;
      v36 = (uint64_t)v16;
      _os_log_impl(&dword_219FC8000, v14, v15, "%s using ipv4 state internet connection -> %s", (uint8_t *)&v33, 0x16u);
    }

    if ((v11 & 1) != 0
      || (-[WFHealthManager network](self, "network"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend(v17, "carPlayNetworkType"),
          v17,
          v18 == 2))
    {
      -[WFHealthManager evaluator](self, "evaluator");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = objc_msgSend(v20, "status");
      if (v21 == 2)
      {
        +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[WFHealthManager completedVelocityTestTimes](self, "completedVelocityTestTimes");
        -[WFHealthManager network](self, "network");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "networkName");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v11) = 1;
        +[WFHealthUIEvent noInternetEventWithTestTimes:didPassTest:failedVelocityTests:ssid:](WFHealthUIEvent, "noInternetEventWithTestTimes:didPassTest:failedVelocityTests:ssid:", v26, 1, MEMORY[0x24BDBD1A8], v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "processEvent:", v29);

        WFLogForCategory(0);
        v23 = objc_claimAutoreleasedReturnValue();
        v30 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v23)
        {
          if (os_log_type_enabled(v23, v30))
          {
            v33 = 136315650;
            v34 = "-[WFHealthManager currentNetworkHasNoInternetConnection]";
            v35 = 2048;
            v36 = 2;
            v37 = 2112;
            v38 = v20;
            _os_log_impl(&dword_219FC8000, v23, v30, "%s NWPathEvalutaor state unsatisfied - %lu (path: %@)", (uint8_t *)&v33, 0x20u);
          }
          LOBYTE(v11) = 1;
        }
      }
      else
      {
        v22 = v21;
        if (v21 == 1)
        {
          WFLogForCategory(0);
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = OSLogForWFLogLevel(1uLL);
          LOBYTE(v11) = 0;
          if (WFCurrentLogLevel() && v23)
          {
            if (os_log_type_enabled(v23, v24))
            {
              v33 = 136315138;
              v34 = "-[WFHealthManager currentNetworkHasNoInternetConnection]";
              _os_log_impl(&dword_219FC8000, v23, v24, "%s falling back to NWPathEvaluator for internet connection -> YES", (uint8_t *)&v33, 0xCu);
            }
            LOBYTE(v11) = 0;
          }
        }
        else
        {
          WFLogForCategory(0);
          v23 = objc_claimAutoreleasedReturnValue();
          v31 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v23 && os_log_type_enabled(v23, v31))
          {
            v33 = 136315650;
            v34 = "-[WFHealthManager currentNetworkHasNoInternetConnection]";
            v35 = 2048;
            v36 = v22;
            v37 = 2112;
            v38 = v20;
            _os_log_impl(&dword_219FC8000, v23, v31, "%s NWPathEvalutaor state invalid - %lu (path: %@)", (uint8_t *)&v33, 0x20u);
          }
        }
      }

    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }
  return v11;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  os_log_type_t v15;
  NSObject *v16;
  _QWORD block[5];
  objc_super v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  if (a6 == &kWFHealthManagerContext)
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("path")))
    {
      objc_msgSend(v10, "valueForKey:", *MEMORY[0x24BDD0E80]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "valueForKey:", *MEMORY[0x24BDD0E70]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "status");
      if (v13 != objc_msgSend(v12, "status"))
      {
        WFLogForCategory(0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v14)
        {
          v16 = v14;
          if (os_log_type_enabled(v16, v15))
          {
            *(_DWORD *)buf = 134218240;
            v20 = objc_msgSend(v11, "status");
            v21 = 2048;
            v22 = objc_msgSend(v12, "status");
            _os_log_impl(&dword_219FC8000, v16, v15, "Network Evaluator Path Changed: oldValue.status %ld, newValue.status %ld", buf, 0x16u);
          }

        }
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __66__WFHealthManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
        block[3] = &unk_24DC348F8;
        block[4] = self;
        dispatch_async(MEMORY[0x24BDAC9B8], block);
      }

    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)WFHealthManager;
    -[WFHealthManager observeValueForKeyPath:ofObject:change:context:](&v18, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, v10, a6);
  }

}

uint64_t __66__WFHealthManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCurrentNetworkIssues");
}

- (NSSet)currentNetworkIssues
{
  return self->_currentNetworkIssues;
}

- (void)setCurrentNetworkIssues:(id)a3
{
  objc_storeStrong((id *)&self->_currentNetworkIssues, a3);
}

- (BOOL)isChinaDevice
{
  return self->_isChinaDevice;
}

- (void)setIsChinaDevice:(BOOL)a3
{
  self->_isChinaDevice = a3;
}

- (WFInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
  objc_storeStrong((id *)&self->_interface, a3);
}

- (NWPathEvaluator)evaluator
{
  return self->_evaluator;
}

- (void)setEvaluator:(id)a3
{
  objc_storeStrong((id *)&self->_evaluator, a3);
}

- (CWFScanResult)network
{
  return self->_network;
}

- (OS_dispatch_queue)diagnosticsQueue
{
  return self->_diagnosticsQueue;
}

- (void)setDiagnosticsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticsQueue, a3);
}

- (WFDiagnosticsManager)diagnosticsManager
{
  return self->_diagnosticsManager;
}

- (void)setDiagnosticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticsManager, a3);
}

- (BOOL)failNoInternetDiagnosticsTests
{
  return self->_failNoInternetDiagnosticsTests;
}

- (void)setFailNoInternetDiagnosticsTests:(BOOL)a3
{
  self->_failNoInternetDiagnosticsTests = a3;
}

- (int64_t)completedVelocityTestTimes
{
  return self->_completedVelocityTestTimes;
}

- (void)setCompletedVelocityTestTimes:(int64_t)a3
{
  self->_completedVelocityTestTimes = a3;
}

- (BOOL)shouldFileNewMetrics
{
  return self->_shouldFileNewMetrics;
}

- (void)setShouldFileNewMetrics:(BOOL)a3
{
  self->_shouldFileNewMetrics = a3;
}

- (NSArray)failedTestsIDs
{
  return self->_failedTestsIDs;
}

- (void)setFailedTestsIDs:(id)a3
{
  objc_storeStrong((id *)&self->_failedTestsIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedTestsIDs, 0);
  objc_storeStrong((id *)&self->_diagnosticsManager, 0);
  objc_storeStrong((id *)&self->_diagnosticsQueue, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_evaluator, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_currentNetworkIssues, 0);
}

@end
