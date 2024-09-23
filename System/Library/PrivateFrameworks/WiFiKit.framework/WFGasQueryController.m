@implementation WFGasQueryController

- (WFGasQueryController)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("-[WFGasQueryController init] unavailable"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (WFGasQueryController)initWithInterface:(id)a3
{
  id v5;
  WFGasQueryController *v6;
  WFGasQueryController *v7;
  uint64_t v8;
  NSMapTable *gasResponseCache;
  NSMutableSet *v10;
  NSMutableSet *resolvedNetworks;
  NSObject *v13;
  os_log_type_t v14;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WFGasQueryController;
  v6 = -[WFGasQueryController init](&v15, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_5;
  if (!v5)
  {
    WFLogForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v13 && os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[WFGasQueryController initWithInterface:]";
      _os_log_impl(&dword_219FC8000, v13, v14, "%s: nil interface", buf, 0xCu);
    }

    goto LABEL_5;
  }
  objc_storeStrong((id *)&v6->_cInterface, a3);
  v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 5, 0, 0);
  gasResponseCache = v7->_gasResponseCache;
  v7->_gasResponseCache = (NSMapTable *)v8;

  if (!v7->_gasResponseCache
    || (v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]),
        resolvedNetworks = v7->_resolvedNetworks,
        v7->_resolvedNetworks = v10,
        resolvedNetworks,
        !v7->_resolvedNetworks))
  {
LABEL_5:

    v7 = 0;
  }

  return v7;
}

- (id)profileForNetwork:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WFGasQueryController gasResponseCache](self, "gasResponseCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)resolveProfilesForNetworks:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  NSObject *v12;
  os_log_type_t v13;
  BOOL v14;
  int v15;
  void *v16;
  void *v17;
  os_log_type_t v18;
  _QWORD v19[5];
  NSObject *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    v6 = objc_msgSend(v5, "mutableCopy");
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[WFGasQueryController resolvedNetworks](self, "resolvedNetworks");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v23;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v7);
          -[NSObject removeObject:](v6, "removeObject:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v8);
    }

    v11 = -[NSObject count](v6, "count") == 0;
    WFLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel())
      v14 = v12 == 0;
    else
      v14 = 1;
    v15 = !v14;
    if (v11)
    {
      if (v15 && os_log_type_enabled(v12, v13))
      {
        *(_DWORD *)buf = 136315138;
        v28 = "-[WFGasQueryController resolveProfilesForNetworks:]";
        _os_log_impl(&dword_219FC8000, v12, v13, "%s: no new HS20 networks to resolve", buf, 0xCu);
      }

    }
    else
    {
      if (v15 && os_log_type_enabled(v12, v13))
      {
        *(_DWORD *)buf = 138412290;
        v28 = (const char *)v6;
        _os_log_impl(&dword_219FC8000, v12, v13, "Starting GAS query for %@", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      -[WFGasQueryController _defaultANQPParameterForNetworks:](self, "_defaultANQPParameterForNetworks:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFGasQueryController cInterface](self, "cInterface");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __51__WFGasQueryController_resolveProfilesForNetworks___block_invoke;
      v19[3] = &unk_24DC35578;
      v19[4] = self;
      objc_copyWeak(&v21, (id *)buf);
      v6 = v6;
      v20 = v6;
      objc_msgSend(v17, "performANQPWithParameters:reply:", v16, v19);

      objc_destroyWeak(&v21);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    WFLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    v18 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v18))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[WFGasQueryController resolveProfilesForNetworks:]";
      _os_log_impl(&dword_219FC8000, v6, v18, "%s: nil networks", buf, 0xCu);
    }
  }

}

void __51__WFGasQueryController_resolveProfilesForNetworks___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  id WeakRetained;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v17 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __51__WFGasQueryController_resolveProfilesForNetworks___block_invoke_3;
  v11[3] = &unk_24DC35550;
  v11[4] = *(_QWORD *)(a1 + 32);
  v11[5] = &v12;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v11);
  WFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
  {
    v9 = v13[5];
    *(_DWORD *)buf = 136315650;
    v19 = "-[WFGasQueryController resolveProfilesForNetworks:]_block_invoke_2";
    v20 = 2112;
    v21 = v9;
    v22 = 2112;
    v23 = v5;
    _os_log_impl(&dword_219FC8000, v7, v8, "%s: responses %@ error %@", buf, 0x20u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_processANQPResults:scanRecords:error:", v13[5], *(_QWORD *)(a1 + 40), v5);

  _Block_object_dispose(&v12, 8);
}

void __51__WFGasQueryController_resolveProfilesForNetworks___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  WFANQPQueryResponse *v4;
  void *v5;
  WFANQPQueryResponse *v6;

  v3 = a2;
  v4 = [WFANQPQueryResponse alloc];
  objc_msgSend(*(id *)(a1 + 32), "_ANQPDictionaryFromScanResult:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFANQPQueryResponse initWithScanResult:ANQPResponse:](v4, "initWithScanResult:ANQPResponse:", v3, v5);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v6);
}

- (id)_ANQPDictionaryFromScanResult:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (objc_class *)MEMORY[0x24BDBCED8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "cellularNetworkInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v6, CFSTR("ANQP_CELL_NETWORK_INFO"));

  objc_msgSend(v4, "roamingConsortiumList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v7, CFSTR("ANQP_ROAMING_CONSORTIUM_OI_LIST"));

  objc_msgSend(v4, "domainNameList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v8, CFSTR("ANQP_DOMAIN_NAME_LIST"));

  objc_msgSend(v4, "BSSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v9, CFSTR("BSSID"));

  objc_msgSend(v4, "operatorFriendlyNameList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v11, CFSTR("ANQP_OPERATOR_NAME"));

  return v5;
}

- (id)_defaultANQPParameterForNetworks:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BE29EF8]);
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__3;
  v12 = __Block_byref_object_dispose__3;
  v13 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__WFGasQueryController__defaultANQPParameterForNetworks___block_invoke;
  v7[3] = &unk_24DC355A0;
  v7[4] = &v8;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);
  objc_msgSend((id)v9[5], "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScanResults:", v5);

  objc_msgSend(v4, "setANQPElementIDList:", &unk_24DC5DB70);
  objc_msgSend(v4, "setMaximumCacheAge:", 0);
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __57__WFGasQueryController__defaultANQPParameterForNetworks___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id CoreWiFiScanResult;

  objc_msgSend(a2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  WiFiNetworkCreate();

  CoreWiFiScanResult = (id)WiFiNetworkCreateCoreWiFiScanResult();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", CoreWiFiScanResult);

}

- (void)resolveProfileForNetwork:(id)a3 handler:(id)a4 force:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  os_log_type_t v15;
  NSObject *v16;
  os_log_type_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (a5)
  {
    WFLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[WFGasQueryController resolveProfileForNetwork:handler:force:]";
      _os_log_impl(&dword_219FC8000, v10, v11, "%s: skipping cache, forcing resolution", buf, 0xCu);
    }

    goto LABEL_14;
  }
  -[WFGasQueryController gasResponseCache](self, "gasResponseCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
LABEL_14:
    WFLogForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v16 && os_log_type_enabled(v16, v17))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[WFGasQueryController resolveProfileForNetwork:handler:force:]";
      v27 = 2112;
      v28 = v8;
      _os_log_impl(&dword_219FC8000, v16, v17, "%s: resolving profile for %@", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFGasQueryController _defaultANQPParameterForNetworks:](self, "_defaultANQPParameterForNetworks:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFGasQueryController cInterface](self, "cInterface");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __63__WFGasQueryController_resolveProfileForNetwork_handler_force___block_invoke;
    v21[3] = &unk_24DC355F0;
    v21[4] = self;
    objc_copyWeak(&v24, (id *)buf);
    v22 = v8;
    v23 = v9;
    objc_msgSend(v20, "performANQPWithParameters:reply:", v19, v21);

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
    v13 = 0;
    goto LABEL_19;
  }
  WFLogForCategory(0);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v15))
  {
    *(_DWORD *)buf = 136315650;
    v26 = "-[WFGasQueryController resolveProfileForNetwork:handler:force:]";
    v27 = 2112;
    v28 = v13;
    v29 = 2112;
    v30 = v8;
    _os_log_impl(&dword_219FC8000, v14, v15, "%s: found cached profile %@ for %@", buf, 0x20u);
  }

  if (v9)
    (*((void (**)(id, void *, _QWORD))v9 + 2))(v9, v13, 0);
LABEL_19:

}

void __63__WFGasQueryController_resolveProfileForNetwork_handler_force___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63__WFGasQueryController_resolveProfileForNetwork_handler_force___block_invoke_2;
  v10[3] = &unk_24DC355C8;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v13 = v5;
  v8 = v5;
  v9 = v6;
  objc_copyWeak(&v16, (id *)(a1 + 56));
  v14 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x24BDAC9B8], v10);

  objc_destroyWeak(&v16);
}

void __63__WFGasQueryController_resolveProfileForNetwork_handler_force___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  os_log_type_t v4;
  WFHotspotProfile *v5;
  void *v6;
  WFHotspotProfile *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  WFNetworkProfile *v13;
  id WeakRetained;
  void *v15;
  NSObject *v16;
  os_log_type_t v17;
  void *v18;
  uint64_t v19;
  os_log_type_t v20;
  WFHotspotProfile *v21;
  void *v22;
  _QWORD v23[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  WFHotspotProfile *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__3;
  v28 = __Block_byref_object_dispose__3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __63__WFGasQueryController_resolveProfileForNetwork_handler_force___block_invoke_3;
  v23[3] = &unk_24DC35550;
  v2 = *(void **)(a1 + 32);
  v23[4] = *(_QWORD *)(a1 + 40);
  v23[5] = &v24;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v23);
  WFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    v5 = (WFHotspotProfile *)v25[5];
    v6 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 136315650;
    v31 = "-[WFGasQueryController resolveProfileForNetwork:handler:force:]_block_invoke_2";
    v32 = 2112;
    v33 = v5;
    v34 = 2112;
    v35 = v6;
    _os_log_impl(&dword_219FC8000, v3, v4, "%s: responses %@ error %@", buf, 0x20u);
  }

  if (objc_msgSend((id)v25[5], "count") && !*(_QWORD *)(a1 + 48))
  {
    objc_msgSend((id)v25[5], "anyObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scanResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "matchingKnownNetworkProfile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      goto LABEL_10;
    objc_msgSend(*(id *)(a1 + 40), "cInterface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scanResult");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "knownNetworkProfileMatchingScanResult:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
LABEL_10:
      v13 = -[WFNetworkProfile initWithCoreWiFiProfile:]([WFNetworkProfile alloc], "initWithCoreWiFiProfile:", v10);
      v7 = -[WFHotspotProfile initWithProfile:anqpResponse:]([WFHotspotProfile alloc], "initWithProfile:anqpResponse:", v13, v8);
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
      objc_msgSend(WeakRetained, "gasResponseCache");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v7, *(_QWORD *)(a1 + 56));

    }
    else
    {
      WFLogForCategory(0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = OSLogForWFLogLevel(1uLL);
      v7 = 0;
      if (!WFCurrentLogLevel() || !v10)
        goto LABEL_12;
      v13 = v10;
      if (os_log_type_enabled(&v13->super, v20))
      {
        v21 = *(WFHotspotProfile **)(a1 + 56);
        objc_msgSend(v8, "ssid");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v31 = "-[WFGasQueryController resolveProfileForNetwork:handler:force:]_block_invoke";
        v32 = 2112;
        v33 = v21;
        v34 = 2112;
        v35 = v22;
        _os_log_impl(&dword_219FC8000, &v13->super, v20, "%s: no existing profile for network %@ (response %@)", buf, 0x20u);

      }
      v7 = 0;
      v10 = v13;
    }

LABEL_12:
    goto LABEL_13;
  }
  v7 = 0;
LABEL_13:
  WFLogForCategory(0);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v16 && os_log_type_enabled(v16, v17))
  {
    v18 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 136315650;
    v31 = "-[WFGasQueryController resolveProfileForNetwork:handler:force:]_block_invoke";
    v32 = 2112;
    v33 = v7;
    v34 = 2112;
    v35 = v18;
    _os_log_impl(&dword_219FC8000, v16, v17, "%s: profile %@ error %@", buf, 0x20u);
  }

  v19 = *(_QWORD *)(a1 + 64);
  if (v19)
    (*(void (**)(uint64_t, WFHotspotProfile *, _QWORD))(v19 + 16))(v19, v7, *(_QWORD *)(a1 + 48));
  _Block_object_dispose(&v24, 8);

}

void __63__WFGasQueryController_resolveProfileForNetwork_handler_force___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  WFANQPQueryResponse *v4;
  void *v5;
  WFANQPQueryResponse *v6;

  v3 = a2;
  v4 = [WFANQPQueryResponse alloc];
  objc_msgSend(*(id *)(a1 + 32), "_ANQPDictionaryFromScanResult:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFANQPQueryResponse initWithScanResult:ANQPResponse:](v4, "initWithScanResult:ANQPResponse:", v3, v5);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v6);
}

- (void)_processANQPResults:(id)a3 scanRecords:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  os_log_type_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  os_log_type_t v25;
  WFNetworkProfile *v26;
  WFHotspotProfile *v27;
  void *v28;
  void *v29;
  os_log_type_t v30;
  os_log_type_t v31;
  NSObject *v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id obj;
  void *v38;
  void *v39;
  _QWORD block[5];
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  NSObject *v50;
  __int16 v51;
  NSObject *v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v8, "count");
  if (!a5 && v10)
  {
    v39 = (void *)objc_opt_new();
    v38 = (void *)objc_opt_new();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v36 = v8;
    obj = v8;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v44;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v44 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v14);
          objc_msgSend(v15, "ssid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "scanRecordWithSSID:", v16);
          v17 = objc_claimAutoreleasedReturnValue();

          WFLogForCategory(0);
          v18 = objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v19 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v18 && os_log_type_enabled(v18, v19))
            {
              *(_DWORD *)buf = 136315394;
              v48 = "-[WFGasQueryController _processANQPResults:scanRecords:error:]";
              v49 = 2112;
              v50 = v17;
              _os_log_impl(&dword_219FC8000, v18, v19, "%s: resolved %@", buf, 0x16u);
            }

            -[WFGasQueryController resolvedNetworks](self, "resolvedNetworks");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObject:", v17);

            objc_msgSend(v15, "scanResult");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "matchingKnownNetworkProfile");
            v18 = objc_claimAutoreleasedReturnValue();

            if (v18)
              goto LABEL_15;
            -[WFGasQueryController cInterface](self, "cInterface");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "scanResult");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "knownNetworkProfileMatchingScanResult:", v23);
            v18 = objc_claimAutoreleasedReturnValue();

            if (v18)
            {
LABEL_15:
              WFLogForCategory(0);
              v24 = objc_claimAutoreleasedReturnValue();
              v25 = OSLogForWFLogLevel(1uLL);
              if (WFCurrentLogLevel() && v24 && os_log_type_enabled(v24, v25))
              {
                *(_DWORD *)buf = 136315650;
                v48 = "-[WFGasQueryController _processANQPResults:scanRecords:error:]";
                v49 = 2112;
                v50 = v18;
                v51 = 2112;
                v52 = v17;
                _os_log_impl(&dword_219FC8000, v24, v25, "%s: resolved profile %@ for %@", buf, 0x20u);
              }

              v26 = -[WFNetworkProfile initWithCoreWiFiProfile:]([WFNetworkProfile alloc], "initWithCoreWiFiProfile:", v18);
              v27 = -[WFHotspotProfile initWithProfile:anqpResponse:]([WFHotspotProfile alloc], "initWithProfile:anqpResponse:", v26, v15);
              -[WFGasQueryController gasResponseCache](self, "gasResponseCache");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "setObject:forKey:", v27, v17);

              objc_msgSend(v39, "addObject:", v18);
              -[NSObject ssid](v17, "ssid");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "addObject:", v29);

            }
            else
            {
              WFLogForCategory(0);
              v18 = objc_claimAutoreleasedReturnValue();
              v31 = OSLogForWFLogLevel(1uLL);
              if (WFCurrentLogLevel() && v18)
              {
                v18 = v18;
                if (os_log_type_enabled(v18, v31))
                {
                  objc_msgSend(v15, "ssid");
                  v32 = objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 136315650;
                  v48 = "-[WFGasQueryController _processANQPResults:scanRecords:error:]";
                  v49 = 2112;
                  v50 = v17;
                  v51 = 2112;
                  v52 = v32;
                  _os_log_impl(&dword_219FC8000, v18, v31, "%s: no existing profile for network %@ (response %@)", buf, 0x20u);

                }
              }
            }
          }
          else
          {
            v30 = OSLogForWFLogLevel(2uLL);
            if ((unint64_t)WFCurrentLogLevel() >= 2 && v18 && os_log_type_enabled(v18, v30))
            {
              *(_DWORD *)buf = 138412290;
              v48 = (const char *)v15;
              _os_log_impl(&dword_219FC8000, v18, v30, "Missing scanRecord for ANQP response %@", buf, 0xCu);
            }
          }

          ++v14;
        }
        while (v12 != v14);
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
        v12 = v33;
      }
      while (v33);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__WFGasQueryController__processANQPResults_scanRecords_error___block_invoke;
    block[3] = &unk_24DC34BC0;
    block[4] = self;
    v41 = v39;
    v42 = v38;
    v34 = v38;
    v35 = v39;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    v8 = v36;
  }

}

void __62__WFGasQueryController__processANQPResults_scanRecords_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gasQueryController:didUpdateProfiles:networkNames:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)removeProfileForNetwork:(id)a3
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
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    v13 = 136315394;
    v14 = "-[WFGasQueryController removeProfileForNetwork:]";
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_219FC8000, v5, v6, "%s: removing profile for network %@", (uint8_t *)&v13, 0x16u);
  }

  if (v4)
  {
    -[WFGasQueryController resolvedNetworks](self, "resolvedNetworks");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v4);

    -[WFGasQueryController gasResponseCache](self, "gasResponseCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[WFGasQueryController gasResponseCache](self, "gasResponseCache");
      v10 = objc_claimAutoreleasedReturnValue();
      -[NSObject removeObjectForKey:](v10, "removeObjectForKey:", v4);
      goto LABEL_8;
    }
    WFLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, v11))
    {
      v13 = 136315138;
      v14 = "-[WFGasQueryController removeProfileForNetwork:]";
      v12 = "%s: no existing profile for network";
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
      v13 = 136315138;
      v14 = "-[WFGasQueryController removeProfileForNetwork:]";
      v12 = "%s: nil network";
LABEL_17:
      _os_log_impl(&dword_219FC8000, v10, v11, v12, (uint8_t *)&v13, 0xCu);
    }
  }
LABEL_8:

}

- (void)removeAllProfiles
{
  void *v3;
  os_log_type_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3)
  {
    v5 = v3;
    if (os_log_type_enabled(v5, v4))
    {
      -[WFGasQueryController gasResponseCache](self, "gasResponseCache");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 136315394;
      v10 = "-[WFGasQueryController removeAllProfiles]";
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_219FC8000, v5, v4, "%s: removing profiles %@", (uint8_t *)&v9, 0x16u);

    }
  }

  -[WFGasQueryController gasResponseCache](self, "gasResponseCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  -[WFGasQueryController resolvedNetworks](self, "resolvedNetworks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

}

- (WFGasQueryControllerDelegate)delegate
{
  return (WFGasQueryControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSSet)profiles
{
  return self->_profiles;
}

- (NSMapTable)gasResponseCache
{
  return self->_gasResponseCache;
}

- (void)setGasResponseCache:(id)a3
{
  objc_storeStrong((id *)&self->_gasResponseCache, a3);
}

- (NSMutableSet)resolvedNetworks
{
  return self->_resolvedNetworks;
}

- (void)setResolvedNetworks:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedNetworks, a3);
}

- (WFInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
  objc_storeStrong((id *)&self->_interface, a3);
}

- (CWFInterface)cInterface
{
  return self->_cInterface;
}

- (void)setCInterface:(id)a3
{
  objc_storeStrong((id *)&self->_cInterface, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cInterface, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_resolvedNetworks, 0);
  objc_storeStrong((id *)&self->_gasResponseCache, 0);
  objc_storeStrong((id *)&self->_profiles, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
