@implementation WFDiagnosticsManager

- (WFDiagnosticsManager)init
{
  WFDiagnosticsManager *v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v7.receiver = self;
  v7.super_class = (Class)WFDiagnosticsManager;
  v2 = -[WFDiagnosticsManager init](&v7, sel_init);
  if (v2)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2050000000;
    v3 = (void *)getW5ClientClass_softClass_0;
    v12 = getW5ClientClass_softClass_0;
    if (!getW5ClientClass_softClass_0)
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __getW5ClientClass_block_invoke_0;
      v8[3] = &unk_24DC34710;
      v8[4] = &v9;
      __getW5ClientClass_block_invoke_0((uint64_t)v8);
      v3 = (void *)v10[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v9, 8);
    objc_msgSend(v4, "sharedClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDiagnosticsManager setClient:](v2, "setClient:", v5);

  }
  return v2;
}

- (WFDiagnosticsManager)initWithCustomTests:(id)a3
{
  id v4;
  WFDiagnosticsManager *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[WFDiagnosticsManager init](self, "init");
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(getW5DiagnosticsTestRequestClass(), "requestWithTestID:configuration:", (int)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "intValue", (_QWORD)v14), 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  -[WFDiagnosticsManager setCustomTestRequests:](v5, "setCustomTestRequests:", v6);
  return v5;
}

- (id)joinFailureTestRequestsFor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(getW5DiagnosticsTestRequestClass(), "requestWithTestID:configuration:", 24, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v3, CFSTR("NetworkName"));
    objc_msgSend(getW5DiagnosticsTestRequestClass(), "requestWithTestID:configuration:", 24, v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  objc_msgSend(getW5DiagnosticsTestRequestClass(), "requestWithTestID:configuration:", 19, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  v10[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSArray)noInternetTestRequests
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("Timeout"));

  objc_msgSend(getW5DiagnosticsTestRequestClass(), "requestWithTestID:configuration:", 11, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (id)_joinFailureDiagnosticsResultFromW5Results:(id)a3
{
  id v3;
  WFDiagnosticsResultItemBT *v4;
  WFDiagnosticsResultItemBT *v5;
  WFDiagnosticsResultItemCongestion *v6;
  WFDiagnosticsResultItemCongestion *v7;
  WFDiagnosticsResultItemTestPass *v8;
  WFDiagnosticsResultItemTestPass *v9;

  v3 = a3;
  v4 = -[WFDiagnosticsResultItemBT initWithResults:]([WFDiagnosticsResultItemBT alloc], "initWithResults:", v3);
  v5 = v4;
  if (v4 && !-[WFDiagnosticsResultItemBT didPassTest](v4, "didPassTest"))
  {
    v9 = v5;
    v8 = v9;
  }
  else
  {
    v6 = -[WFDiagnosticsResultItemCongestion initWithResults:]([WFDiagnosticsResultItemCongestion alloc], "initWithResults:", v3);
    v7 = v6;
    if (v6 && !-[WFDiagnosticsResultItemCongestion didPassTest](v6, "didPassTest"))
    {
      v9 = v7;
      v8 = v9;
    }
    else
    {
      v8 = -[WFDiagnosticsResultItemTestPass initWithResults:]([WFDiagnosticsResultItemTestPass alloc], "initWithResults:", v3);
      v9 = 0;
    }

  }
  return v8;
}

- (id)_noInternetDiagnosticsResultFromW5Results:(id)a3
{
  id v3;
  WFDiagnosticsResultItemNoInternet *v4;

  v3 = a3;
  v4 = -[WFDiagnosticsResultItemNoInternet initWithResults:]([WFDiagnosticsResultItemNoInternet alloc], "initWithResults:", v3);

  return v4;
}

- (void)runCustomDiagnosticsFor:(id)a3 withUpdate:(id)a4 result:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _BOOL4 v12;
  NSObject *v13;
  os_log_type_t v14;
  BOOL v15;
  int v16;
  NSArray *customTestRequests;
  W5Client *client;
  uint64_t v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFDiagnosticsManager customTestRequests](self, "customTestRequests");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count") == 0;

  WFLogForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel())
    v15 = v13 == 0;
  else
    v15 = 1;
  v16 = !v15;
  if (v12)
  {
    if (v16 && os_log_type_enabled(v13, v14))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219FC8000, v13, v14, "No test requests to run.", buf, 2u);
    }

  }
  else
  {
    if (v16 && os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[WFDiagnosticsManager runCustomDiagnosticsFor:withUpdate:result:]";
      v29 = 2112;
      v30 = v8;
      _os_log_impl(&dword_219FC8000, v13, v14, "%s: Running a Custom test for %@", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    client = self->_client;
    customTestRequests = self->_customTestRequests;
    v19 = MEMORY[0x24BDAC760];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __66__WFDiagnosticsManager_runCustomDiagnosticsFor_withUpdate_result___block_invoke;
    v25[3] = &unk_24DC35BE8;
    v26 = v9;
    v21[0] = v19;
    v21[1] = 3221225472;
    v21[2] = __66__WFDiagnosticsManager_runCustomDiagnosticsFor_withUpdate_result___block_invoke_3;
    v21[3] = &unk_24DC35C38;
    v22 = v8;
    objc_copyWeak(&v24, (id *)buf);
    v23 = v10;
    v20 = (id)-[W5Client runDiagnostics:configuration:update:reply:](client, "runDiagnostics:configuration:update:reply:", customTestRequests, 0, v25, v21);

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }

}

void __66__WFDiagnosticsManager_runCustomDiagnosticsFor_withUpdate_result___block_invoke(uint64_t a1, void *a2)
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
  v6[2] = __66__WFDiagnosticsManager_runCustomDiagnosticsFor_withUpdate_result___block_invoke_2;
  v6[3] = &unk_24DC35468;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __66__WFDiagnosticsManager_runCustomDiagnosticsFor_withUpdate_result___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __66__WFDiagnosticsManager_runCustomDiagnosticsFor_withUpdate_result___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  os_log_type_t v8;
  NSObject *v9;
  NSObject *v10;
  id WeakRetained;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  WFDiagnosticsEvent *v17;
  uint64_t v18;
  void *v19;
  WFDiagnosticsEvent *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  NSObject *v30;
  os_log_type_t v31;
  NSObject *v32;
  os_log_type_t v33;
  id v34;
  _QWORD block[4];
  id v36;
  id v37;
  id v38;
  NSObject *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  NSObject *v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WFLogForCategory(0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7)
  {
    v9 = v7;
    if (os_log_type_enabled(v9, v8))
    {
      v10 = a1[4];
      *(_DWORD *)buf = 138412546;
      v46 = v10;
      v47 = 2048;
      v48 = objc_msgSend(v6, "count");
      _os_log_impl(&dword_219FC8000, v9, v8, "Custom test for %@ completed with %lu raw results", buf, 0x16u);
    }

  }
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "_joinFailureDiagnosticsResultFromW5Results:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12 || objc_msgSend(v12, "didPassTest"))
  {
    v13 = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(v13, "_noInternetDiagnosticsResultFromW5Results:", v6);
    v14 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v14;
  }
  v15 = objc_loadWeakRetained(a1 + 6);

  if (v15 && v12)
  {
    +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = [WFDiagnosticsEvent alloc];
    v18 = objc_msgSend(v12, "didPassTest");
    objc_msgSend(v12, "failedTests");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[WFDiagnosticsEvent initWithDiagnosticsEventType:didPassTest:failedTests:](v17, "initWithDiagnosticsEventType:didPassTest:failedTests:", 2, v18, v19);
    objc_msgSend(v16, "processEvent:", v20);

LABEL_33:
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __66__WFDiagnosticsManager_runCustomDiagnosticsFor_withUpdate_result___block_invoke_18;
    block[3] = &unk_24DC35C10;
    v39 = a1[5];
    v36 = v5;
    v37 = v12;
    v38 = a1[4];
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    v32 = v39;
    goto LABEL_34;
  }
  v21 = objc_loadWeakRetained(a1 + 6);

  if (v21)
  {
    if (v12)
      goto LABEL_33;
    v34 = v5;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v22 = v6;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v41;
      v26 = &stru_24DC36C30;
      do
      {
        v27 = 0;
        v28 = v26;
        do
        {
          if (*(_QWORD *)v41 != v25)
            objc_enumerationMutation(v22);
          -[NSObject stringByAppendingFormat:](v28, "stringByAppendingFormat:", CFSTR("\n%@"), *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v27));
          v26 = objc_claimAutoreleasedReturnValue();

          ++v27;
          v28 = v26;
        }
        while (v24 != v27);
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v24);
    }
    else
    {
      v26 = &stru_24DC36C30;
    }

    WFLogForCategory(0);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v30 && os_log_type_enabled(v30, v31))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v26;
      _os_log_impl(&dword_219FC8000, v30, v31, "Custom diagnostics result failed to generate from raw results: %@", buf, 0xCu);
    }

    v5 = v34;
  }
  else
  {
    WFLogForCategory(0);
    v26 = objc_claimAutoreleasedReturnValue();
    v29 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v26 && os_log_type_enabled(v26, v29))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219FC8000, v26, v29, "Test finished after WFDiagnosticsMananger deallocated!", buf, 2u);
    }
  }

  if (v12)
    goto LABEL_33;
  WFLogForCategory(0);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v32 && os_log_type_enabled(v32, v33))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219FC8000, v32, v33, "Empty custom diagnostics result, discarding result callback!", buf, 2u);
  }
LABEL_34:

}

uint64_t __66__WFDiagnosticsManager_runCustomDiagnosticsFor_withUpdate_result___block_invoke_18(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)runJoinFailureDiagnosticsFor:(id)a3 withUpdate:(id)a4 result:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id location;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFDiagnosticsManager joinFailureTestRequestsFor:](self, "joinFailureTestRequestsFor:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  WFLogForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v12 && os_log_type_enabled(v12, v13))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[WFDiagnosticsManager runJoinFailureDiagnosticsFor:withUpdate:result:]";
    v29 = 2112;
    v30 = v8;
    _os_log_impl(&dword_219FC8000, v12, v13, "%s: Running a Join Failure test for %@", buf, 0x16u);
  }

  -[WFDiagnosticsManager client](self, "client");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __71__WFDiagnosticsManager_runJoinFailureDiagnosticsFor_withUpdate_result___block_invoke;
  v24[3] = &unk_24DC35BE8;
  v16 = v9;
  v25 = v16;
  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __71__WFDiagnosticsManager_runJoinFailureDiagnosticsFor_withUpdate_result___block_invoke_3;
  v20[3] = &unk_24DC35C38;
  v17 = v8;
  v21 = v17;
  objc_copyWeak(&v23, &location);
  v18 = v10;
  v22 = v18;
  v19 = (id)objc_msgSend(v14, "runDiagnostics:configuration:update:reply:", v11, 0, v24, v20);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

void __71__WFDiagnosticsManager_runJoinFailureDiagnosticsFor_withUpdate_result___block_invoke(uint64_t a1, void *a2)
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
  v6[2] = __71__WFDiagnosticsManager_runJoinFailureDiagnosticsFor_withUpdate_result___block_invoke_2;
  v6[3] = &unk_24DC35468;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __71__WFDiagnosticsManager_runJoinFailureDiagnosticsFor_withUpdate_result___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __71__WFDiagnosticsManager_runJoinFailureDiagnosticsFor_withUpdate_result___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  os_log_type_t v8;
  NSObject *v9;
  NSObject *v10;
  id WeakRetained;
  void *v12;
  id v13;
  void *v14;
  WFDiagnosticsEvent *v15;
  uint64_t v16;
  void *v17;
  WFDiagnosticsEvent *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  NSObject *v28;
  os_log_type_t v29;
  NSObject *v30;
  os_log_type_t v31;
  id v32;
  _QWORD block[4];
  id v34;
  id v35;
  id v36;
  NSObject *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  NSObject *v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WFLogForCategory(0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7)
  {
    v9 = v7;
    if (os_log_type_enabled(v9, v8))
    {
      v10 = a1[4];
      *(_DWORD *)buf = 138412546;
      v44 = v10;
      v45 = 2048;
      v46 = objc_msgSend(v6, "count");
      _os_log_impl(&dword_219FC8000, v9, v8, "Join Failure test for %@ completed with %lu raw results", buf, 0x16u);
    }

  }
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "_joinFailureDiagnosticsResultFromW5Results:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_loadWeakRetained(a1 + 6);
  if (v13 && v12)
  {
    +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = [WFDiagnosticsEvent alloc];
    v16 = objc_msgSend(v12, "didPassTest");
    objc_msgSend(v12, "failedTests");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[WFDiagnosticsEvent initWithDiagnosticsEventType:didPassTest:failedTests:](v15, "initWithDiagnosticsEventType:didPassTest:failedTests:", 0, v16, v17);
    objc_msgSend(v14, "processEvent:", v18);

LABEL_30:
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __71__WFDiagnosticsManager_runJoinFailureDiagnosticsFor_withUpdate_result___block_invoke_20;
    block[3] = &unk_24DC35C10;
    v37 = a1[5];
    v34 = v5;
    v35 = v12;
    v36 = a1[4];
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    v30 = v37;
    goto LABEL_31;
  }
  v19 = objc_loadWeakRetained(a1 + 6);

  if (v19)
  {
    if (v12)
      goto LABEL_30;
    v32 = v5;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v20 = v6;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v39;
      v24 = &stru_24DC36C30;
      do
      {
        v25 = 0;
        v26 = v24;
        do
        {
          if (*(_QWORD *)v39 != v23)
            objc_enumerationMutation(v20);
          -[NSObject stringByAppendingFormat:](v26, "stringByAppendingFormat:", CFSTR("\n%@"), *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v25));
          v24 = objc_claimAutoreleasedReturnValue();

          ++v25;
          v26 = v24;
        }
        while (v22 != v25);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v22);
    }
    else
    {
      v24 = &stru_24DC36C30;
    }

    WFLogForCategory(0);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v28 && os_log_type_enabled(v28, v29))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v24;
      _os_log_impl(&dword_219FC8000, v28, v29, "Join Failure diagnostics result failed to generate from raw results: %@", buf, 0xCu);
    }

    v5 = v32;
  }
  else
  {
    WFLogForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    v27 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v24 && os_log_type_enabled(v24, v27))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219FC8000, v24, v27, "Test finished after WFDiagnosticsMananger deallocated!", buf, 2u);
    }
  }

  if (v12)
    goto LABEL_30;
  WFLogForCategory(0);
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v30 && os_log_type_enabled(v30, v31))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219FC8000, v30, v31, "Empty join failure diagnostics result, discarding result callback!", buf, 2u);
  }
LABEL_31:

}

uint64_t __71__WFDiagnosticsManager_runJoinFailureDiagnosticsFor_withUpdate_result___block_invoke_20(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)runNoInternetDiagnosticsFor:(id)a3 withUpdate:(id)a4 result:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id location;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  WFLogForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v11 && os_log_type_enabled(v11, v12))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[WFDiagnosticsManager runNoInternetDiagnosticsFor:withUpdate:result:]";
    v29 = 2112;
    v30 = v8;
    _os_log_impl(&dword_219FC8000, v11, v12, "%s: Running a No Internet test for %@", buf, 0x16u);
  }

  -[WFDiagnosticsManager client](self, "client");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDiagnosticsManager noInternetTestRequests](self, "noInternetTestRequests");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __70__WFDiagnosticsManager_runNoInternetDiagnosticsFor_withUpdate_result___block_invoke;
  v24[3] = &unk_24DC35BE8;
  v16 = v9;
  v25 = v16;
  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __70__WFDiagnosticsManager_runNoInternetDiagnosticsFor_withUpdate_result___block_invoke_3;
  v20[3] = &unk_24DC35C38;
  v17 = v8;
  v21 = v17;
  objc_copyWeak(&v23, &location);
  v18 = v10;
  v22 = v18;
  v19 = (id)objc_msgSend(v13, "runDiagnostics:configuration:update:reply:", v14, 0, v24, v20);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

void __70__WFDiagnosticsManager_runNoInternetDiagnosticsFor_withUpdate_result___block_invoke(uint64_t a1, void *a2)
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
  v6[2] = __70__WFDiagnosticsManager_runNoInternetDiagnosticsFor_withUpdate_result___block_invoke_2;
  v6[3] = &unk_24DC35468;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __70__WFDiagnosticsManager_runNoInternetDiagnosticsFor_withUpdate_result___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __70__WFDiagnosticsManager_runNoInternetDiagnosticsFor_withUpdate_result___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  os_log_type_t v8;
  NSObject *v9;
  NSObject *v10;
  id WeakRetained;
  void *v12;
  id v13;
  void *v14;
  WFDiagnosticsEvent *v15;
  uint64_t v16;
  void *v17;
  WFDiagnosticsEvent *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  NSObject *v28;
  os_log_type_t v29;
  NSObject *v30;
  os_log_type_t v31;
  id v32;
  _QWORD block[4];
  id v34;
  id v35;
  id v36;
  NSObject *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  NSObject *v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WFLogForCategory(0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7)
  {
    v9 = v7;
    if (os_log_type_enabled(v9, v8))
    {
      v10 = a1[4];
      *(_DWORD *)buf = 138412546;
      v44 = v10;
      v45 = 2048;
      v46 = objc_msgSend(v6, "count");
      _os_log_impl(&dword_219FC8000, v9, v8, "No Internet test for %@ completed with %lu raw results", buf, 0x16u);
    }

  }
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "_noInternetDiagnosticsResultFromW5Results:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_loadWeakRetained(a1 + 6);
  if (v13 && v12)
  {
    +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = [WFDiagnosticsEvent alloc];
    v16 = objc_msgSend(v12, "didPassTest");
    objc_msgSend(v12, "failedTests");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[WFDiagnosticsEvent initWithDiagnosticsEventType:didPassTest:failedTests:](v15, "initWithDiagnosticsEventType:didPassTest:failedTests:", 1, v16, v17);
    objc_msgSend(v14, "processEvent:", v18);

LABEL_30:
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__WFDiagnosticsManager_runNoInternetDiagnosticsFor_withUpdate_result___block_invoke_21;
    block[3] = &unk_24DC35C10;
    v37 = a1[5];
    v34 = v5;
    v35 = v12;
    v36 = a1[4];
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    v30 = v37;
    goto LABEL_31;
  }
  v19 = objc_loadWeakRetained(a1 + 6);

  if (v19)
  {
    if (v12)
      goto LABEL_30;
    v32 = v5;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v20 = v6;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v39;
      v24 = &stru_24DC36C30;
      do
      {
        v25 = 0;
        v26 = v24;
        do
        {
          if (*(_QWORD *)v39 != v23)
            objc_enumerationMutation(v20);
          -[NSObject stringByAppendingFormat:](v26, "stringByAppendingFormat:", CFSTR("\n%@"), *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v25));
          v24 = objc_claimAutoreleasedReturnValue();

          ++v25;
          v26 = v24;
        }
        while (v22 != v25);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v22);
    }
    else
    {
      v24 = &stru_24DC36C30;
    }

    WFLogForCategory(0);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v28 && os_log_type_enabled(v28, v29))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v24;
      _os_log_impl(&dword_219FC8000, v28, v29, "No Internet diagnostics result failed to generate from raw results: %@", buf, 0xCu);
    }

    v5 = v32;
  }
  else
  {
    WFLogForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    v27 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v24 && os_log_type_enabled(v24, v27))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219FC8000, v24, v27, "Test finished after WFDiagnosticsMananger deallocated!", buf, 2u);
    }
  }

  if (v12)
    goto LABEL_30;
  WFLogForCategory(0);
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v30 && os_log_type_enabled(v30, v31))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219FC8000, v30, v31, "Empty no internet diagnostics result, discarding result callback!", buf, 2u);
  }
LABEL_31:

}

uint64_t __70__WFDiagnosticsManager_runNoInternetDiagnosticsFor_withUpdate_result___block_invoke_21(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (W5Client)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (NSArray)customTestRequests
{
  return self->_customTestRequests;
}

- (void)setCustomTestRequests:(id)a3
{
  objc_storeStrong((id *)&self->_customTestRequests, a3);
}

- (void)setNoInternetTestRequests:(id)a3
{
  objc_storeStrong((id *)&self->_noInternetTestRequests, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noInternetTestRequests, 0);
  objc_storeStrong((id *)&self->_customTestRequests, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end
