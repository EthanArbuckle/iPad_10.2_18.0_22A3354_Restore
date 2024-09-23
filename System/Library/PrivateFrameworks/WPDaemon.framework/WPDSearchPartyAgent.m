@implementation WPDSearchPartyAgent

- (WPDSearchPartyAgent)initWithQueue:(id)a3 beaconChange:(id)a4 tokensChange:(id)a5
{
  id v8;
  id v9;
  id v10;
  WPDSearchPartyAgent *v11;
  WPDSearchPartyAgent *v12;
  NSData *beaconKey;
  NSData *spBeaconReserved;
  NSData *testBeaconReserved;
  NSArray *spBeaconKeys;
  NSArray *spNearbyTokens;
  NSDate *spNearbyTokensUpdated;
  NSDate *spBeaconKeysUpdated;
  NSArray *testNearbyTokens;
  NSArray *testBeaconKeys;
  NSDate *testNearbyTokensUpdated;
  NSDate *testBeaconKeysUpdated;
  id beaconStateChangedBlock;
  id beaconKeysChangedBlock;
  id beaconStatusChangedBlock;
  id nearbyTokensChangedBlock;
  uint64_t v28;
  id beaconChange;
  uint64_t v30;
  id tokensChange;
  WPDPendingCompletions *v32;
  WPDPendingCompletions *pendingKeyCompletions;
  WPDPendingCompletions *v34;
  WPDPendingCompletions *pendingTokenCompletions;
  NSObject *WeakRetained;
  _QWORD v38[4];
  id v39;
  id location;
  objc_super v41;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v41.receiver = self;
  v41.super_class = (Class)WPDSearchPartyAgent;
  v11 = -[WPDSearchPartyAgent init](&v41, sel_init);
  v12 = v11;
  if (v11)
  {
    beaconKey = v11->_beaconKey;
    v11->_beaconKey = 0;

    *(_DWORD *)&v12->_isTestMode = 0;
    spBeaconReserved = v12->_spBeaconReserved;
    v12->_spBeaconReserved = 0;

    *(_WORD *)&v12->_testBeaconState = 0;
    testBeaconReserved = v12->_testBeaconReserved;
    v12->_testBeaconReserved = 0;

    spBeaconKeys = v12->_spBeaconKeys;
    v12->_spBeaconKeys = 0;

    spNearbyTokens = v12->_spNearbyTokens;
    v12->_spNearbyTokens = 0;

    spNearbyTokensUpdated = v12->_spNearbyTokensUpdated;
    v12->_spNearbyTokensUpdated = 0;

    spBeaconKeysUpdated = v12->_spBeaconKeysUpdated;
    v12->_spBeaconKeysUpdated = 0;

    testNearbyTokens = v12->_testNearbyTokens;
    v12->_testNearbyTokens = 0;

    testBeaconKeys = v12->_testBeaconKeys;
    v12->_testBeaconKeys = 0;

    testNearbyTokensUpdated = v12->_testNearbyTokensUpdated;
    v12->_testNearbyTokensUpdated = 0;

    testBeaconKeysUpdated = v12->_testBeaconKeysUpdated;
    v12->_testBeaconKeysUpdated = 0;

    beaconStateChangedBlock = v12->_beaconStateChangedBlock;
    v12->_beaconStateChangedBlock = 0;

    beaconKeysChangedBlock = v12->_beaconKeysChangedBlock;
    v12->_beaconKeysChangedBlock = 0;

    beaconStatusChangedBlock = v12->_beaconStatusChangedBlock;
    v12->_beaconStatusChangedBlock = 0;

    nearbyTokensChangedBlock = v12->_nearbyTokensChangedBlock;
    v12->_nearbyTokensChangedBlock = 0;

    v12->_continueAdvOnFail = 0;
    objc_storeWeak((id *)&v12->_queue, v8);
    v28 = MEMORY[0x219A0F018](v9);
    beaconChange = v12->_beaconChange;
    v12->_beaconChange = (id)v28;

    v30 = MEMORY[0x219A0F018](v10);
    tokensChange = v12->_tokensChange;
    v12->_tokensChange = (id)v30;

    v32 = -[WPDPendingCompletions initWithName:]([WPDPendingCompletions alloc], "initWithName:", CFSTR("beaconing key"));
    pendingKeyCompletions = v12->_pendingKeyCompletions;
    v12->_pendingKeyCompletions = v32;

    v34 = -[WPDPendingCompletions initWithName:]([WPDPendingCompletions alloc], "initWithName:", CFSTR("near owner tokens"));
    pendingTokenCompletions = v12->_pendingTokenCompletions;
    v12->_pendingTokenCompletions = v34;

    location = 0;
    objc_initWeak(&location, v12);
    WeakRetained = objc_loadWeakRetained((id *)&v12->_queue);
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __63__WPDSearchPartyAgent_initWithQueue_beaconChange_tokensChange___block_invoke;
    v38[3] = &unk_24D7C1C00;
    objc_copyWeak(&v39, &location);
    dispatch_async(WeakRetained, v38);

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_129);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPDSearchPartyAgent initWithQueue:beaconChange:tokensChange:].cold.1();
    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __63__WPDSearchPartyAgent_initWithQueue_beaconChange_tokensChange___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "initSPObjects");
    WeakRetained = v2;
  }

}

- (BOOL)beaconState
{
  if (-[WPDSearchPartyAgent isTestMode](self, "isTestMode"))
    return -[WPDSearchPartyAgent testBeaconState](self, "testBeaconState");
  else
    return -[WPDSearchPartyAgent spBeaconState](self, "spBeaconState");
}

- (unsigned)beaconStatus
{
  if (-[WPDSearchPartyAgent isTestMode](self, "isTestMode"))
    return -[WPDSearchPartyAgent testBeaconStatus](self, "testBeaconStatus");
  else
    return -[WPDSearchPartyAgent spBeaconStatus](self, "spBeaconStatus");
}

- (NSData)beaconReserved
{
  if (-[WPDSearchPartyAgent isTestMode](self, "isTestMode"))
    -[WPDSearchPartyAgent testBeaconReserved](self, "testBeaconReserved");
  else
    -[WPDSearchPartyAgent spBeaconReserved](self, "spBeaconReserved");
  return (NSData *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)nearbyTokens
{
  if (-[WPDSearchPartyAgent isTestMode](self, "isTestMode"))
    -[WPDSearchPartyAgent testNearbyTokens](self, "testNearbyTokens");
  else
    -[WPDSearchPartyAgent spNearbyTokens](self, "spNearbyTokens");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSDate)nearbyTokensUpdated
{
  if (-[WPDSearchPartyAgent isTestMode](self, "isTestMode"))
    -[WPDSearchPartyAgent testNearbyTokensUpdated](self, "testNearbyTokensUpdated");
  else
    -[WPDSearchPartyAgent spNearbyTokensUpdated](self, "spNearbyTokensUpdated");
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)beaconKeys
{
  if (-[WPDSearchPartyAgent isTestMode](self, "isTestMode"))
    -[WPDSearchPartyAgent testBeaconKeys](self, "testBeaconKeys");
  else
    -[WPDSearchPartyAgent spBeaconKeys](self, "spBeaconKeys");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSDate)beaconKeysUpdated
{
  if (-[WPDSearchPartyAgent isTestMode](self, "isTestMode"))
    -[WPDSearchPartyAgent testBeaconKeysUpdated](self, "testBeaconKeysUpdated");
  else
    -[WPDSearchPartyAgent spBeaconKeysUpdated](self, "spBeaconKeysUpdated");
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)dealloc
{
  objc_super v3;

  -[WPDSearchPartyAgent setBeaconManager:](self, "setBeaconManager:", 0);
  -[WPDSearchPartyAgent setBeaconStateChangedBlock:](self, "setBeaconStateChangedBlock:", 0);
  -[WPDSearchPartyAgent setBeaconKeysChangedBlock:](self, "setBeaconKeysChangedBlock:", 0);
  -[WPDSearchPartyAgent setBeaconStatusChangedBlock:](self, "setBeaconStatusChangedBlock:", 0);
  -[WPDSearchPartyAgent setNearbyTokensChangedBlock:](self, "setNearbyTokensChangedBlock:", 0);
  -[WPDSearchPartyAgent setBeaconChange:](self, "setBeaconChange:", 0);
  -[WPDSearchPartyAgent setTokensChange:](self, "setTokensChange:", 0);
  objc_storeWeak((id *)&self->_queue, 0);
  -[WPDSearchPartyAgent setPendingKeyCompletions:](self, "setPendingKeyCompletions:", 0);
  -[WPDSearchPartyAgent setPendingTokenCompletions:](self, "setPendingTokenCompletions:", 0);
  v3.receiver = self;
  v3.super_class = (Class)WPDSearchPartyAgent;
  -[WPDSearchPartyAgent dealloc](&v3, sel_dealloc);
}

- (void)generateStateDump
{
  int *v2;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  const char *v11;
  NSObject *v12;
  const char *v13;
  _BOOL4 v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  uint64_t i;
  void *v35;
  BOOL v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  WPDSearchPartyAgent *obj;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[128];
  uint8_t buf[4];
  _BYTE v53[20];
  __int16 v54;
  void *v55;
  __int16 v56;
  int v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_132);
  v4 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    v6 = -[WPDSearchPartyAgent isTestMode](self, "isTestMode");
    v7 = "no";
    if (v6)
      v7 = "yes";
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v53 = v7;
    _os_log_impl(&dword_2175D1000, v5, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: testMode: %s", buf, 0xCu);

  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_136);
  v8 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = -[WPDSearchPartyAgent continueAdvOnFail](self, "continueAdvOnFail");
    v11 = "no";
    if (v10)
      v11 = "yes";
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v53 = v11;
    _os_log_impl(&dword_2175D1000, v9, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: continue adv on fail: %s", buf, 0xCu);

  }
  obj = self;
  objc_sync_enter(obj);
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_138);
  v12 = (id)WiProxLog;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (-[WPDSearchPartyAgent beaconState](obj, "beaconState"))
      v13 = "yes";
    else
      v13 = "no";
    v2 = (int *)-[WPDSearchPartyAgent spBeaconState](obj, "spBeaconState");
    v14 = -[WPDSearchPartyAgent isTestMode](obj, "isTestMode");
    -[WPDSearchPartyAgent beaconKey](obj, "beaconKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[WPDSearchPartyAgent beaconStatus](obj, "beaconStatus");
    -[WPDSearchPartyAgent beaconReserved](obj, "beaconReserved");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316418;
    *(_QWORD *)v53 = v13;
    *(_WORD *)&v53[8] = 1024;
    *(_DWORD *)&v53[10] = (_DWORD)v2;
    *(_WORD *)&v53[14] = 1024;
    *(_DWORD *)&v53[16] = v14;
    v54 = 2112;
    v55 = v15;
    v56 = 1024;
    v57 = v16;
    v58 = 2112;
    v59 = v17;
    _os_log_impl(&dword_2175D1000, v12, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: beaconing: %s (SP:%d || Test:%d) key %@ status: 0x%02x reserved: %@", buf, 0x32u);

  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_140);
  v18 = (id)WiProxLog;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    -[WPDSearchPartyAgent beaconKeys](obj, "beaconKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      -[WPDSearchPartyAgent beaconKeys](obj, "beaconKeys");
      v2 = (int *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v2, "count");
    }
    else
    {
      v20 = 0;
    }
    -[WPDSearchPartyAgent beaconKeysUpdated](obj, "beaconKeysUpdated");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v53 = v20;
    *(_WORD *)&v53[4] = 2112;
    *(_QWORD *)&v53[6] = v21;
    _os_log_impl(&dword_2175D1000, v18, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: beaconing keys (%d) updated: %@", buf, 0x12u);

    if (v19)
  }

  -[WPDSearchPartyAgent beaconKeys](obj, "beaconKeys");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    -[WPDSearchPartyAgent beaconKeys](obj, "beaconKeys");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v48;
      v2 = &dword_2175D1000;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v48 != v25)
            objc_enumerationMutation(v23);
          v27 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v26);
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_142);
          v28 = WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v53 = v27;
            _os_log_impl(&dword_2175D1000, v28, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump:     %@", buf, 0xCu);
          }
          ++v26;
        }
        while (v24 != v26);
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      }
      while (v24);
    }

  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_144);
  v29 = (id)WiProxLog;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    -[WPDSearchPartyAgent nearbyTokens](obj, "nearbyTokens");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      -[WPDSearchPartyAgent nearbyTokens](obj, "nearbyTokens");
      v2 = (int *)objc_claimAutoreleasedReturnValue();
      v31 = (unint64_t)objc_msgSend(v2, "count") >> 1;
    }
    else
    {
      LODWORD(v31) = 0;
    }
    -[WPDSearchPartyAgent nearbyTokensUpdated](obj, "nearbyTokensUpdated");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v53 = v31;
    *(_WORD *)&v53[4] = 2112;
    *(_QWORD *)&v53[6] = v32;
    _os_log_impl(&dword_2175D1000, v29, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: near owner tokens (%d) updated: %@", buf, 0x12u);

    if (v30)
  }

  -[WPDSearchPartyAgent nearbyTokens](obj, "nearbyTokens");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    for (i = 0; ; i += 2)
    {
      -[WPDSearchPartyAgent nearbyTokens](obj, "nearbyTokens");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "count") > (unint64_t)(i + 1);

      if (!v36)
        break;
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_146);
      v37 = (id)WiProxLog;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        -[WPDSearchPartyAgent nearbyTokens](obj, "nearbyTokens");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectAtIndexedSubscript:", i + 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[WPDSearchPartyAgent nearbyTokens](obj, "nearbyTokens");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "objectAtIndexedSubscript:", i);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v53 = v39;
        *(_WORD *)&v53[8] = 2112;
        *(_QWORD *)&v53[10] = v41;
        _os_log_impl(&dword_2175D1000, v37, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump:     token: %@ address: %@", buf, 0x16u);

      }
    }
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_148);
  v42 = (id)WiProxLog;
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    -[WPDSearchPartyAgent pendingTokenCompletions](obj, "pendingTokenCompletions");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v53 = v43;
    _os_log_impl(&dword_2175D1000, v42, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: %@", buf, 0xCu);

  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_150);
  v44 = (id)WiProxLog;
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    -[WPDSearchPartyAgent pendingKeyCompletions](obj, "pendingKeyCompletions");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v53 = v45;
    _os_log_impl(&dword_2175D1000, v44, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: %@", buf, 0xCu);

  }
  objc_sync_exit(obj);

}

- (void)initSPObjects
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2175D1000, v0, v1, "WPDSearchPartyAgent failed to instantiate SPBeaconManager", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __36__WPDSearchPartyAgent_initSPObjects__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  const char *v8;
  id v9;
  void *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_151);
    v7 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v8 = "NO";
      if ((_DWORD)a2)
        v8 = "YES";
      v11 = 136315138;
      v12 = v8;
      _os_log_impl(&dword_2175D1000, v7, OS_LOG_TYPE_DEFAULT, "WPDSearchPartyAgent beaconManager state changed to %s", (uint8_t *)&v11, 0xCu);
    }
    v9 = WeakRetained;
    objc_sync_enter(v9);
    objc_msgSend(v9, "setSpBeaconState:", a2);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSpBeaconKeysUpdated:", v10);

    objc_sync_exit(v9);
    if ((objc_msgSend(v9, "isTestMode") & 1) == 0)
      objc_msgSend(v9, "rollKeys_async_completion:", v5);
  }

}

void __36__WPDSearchPartyAgent_initSPObjects__block_invoke_156(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_158);
    v8 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      v12 = 134217984;
      v13 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_2175D1000, v9, OS_LOG_TYPE_DEFAULT, "WPDSearchPartyAgent beaconManager keys updated: %lu keys", (uint8_t *)&v12, 0xCu);

    }
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_160);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      __36__WPDSearchPartyAgent_initSPObjects__block_invoke_156_cold_1();
    v10 = WeakRetained;
    objc_sync_enter(v10);
    objc_msgSend(v10, "setSpBeaconKeys:", v5);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSpBeaconKeysUpdated:", v11);

    objc_sync_exit(v10);
    if ((objc_msgSend(v10, "isTestMode") & 1) == 0)
      objc_msgSend(v10, "rollKeys_async_completion:", v6);
  }

}

void __36__WPDSearchPartyAgent_initSPObjects__block_invoke_162(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  id v8;
  void *v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_164);
    v7 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109120;
      v10[1] = a2;
      _os_log_impl(&dword_2175D1000, v7, OS_LOG_TYPE_DEFAULT, "WPDSearchPartyAgent beaconManager status changed to 0x%02x", (uint8_t *)v10, 8u);
    }
    v8 = WeakRetained;
    objc_sync_enter(v8);
    objc_msgSend(v8, "setSpBeaconStatus:", a2);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSpBeaconKeysUpdated:", v9);

    objc_sync_exit(v8);
    if ((objc_msgSend(v8, "isTestMode") & 1) == 0)
      objc_msgSend(v8, "rollKeys_async_completion:", v5);
  }

}

void __36__WPDSearchPartyAgent_initSPObjects__block_invoke_166(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_168);
    v8 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      *(_DWORD *)buf = 134217984;
      v20 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_2175D1000, v9, OS_LOG_TYPE_DEFAULT, "WPDSearchPartyAgent beaconManager nearbyTokensChangeBlock with %lu tokens", buf, 0xCu);

    }
    v10 = (void *)MEMORY[0x219A0EE8C]();
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2 * objc_msgSend(v5, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __36__WPDSearchPartyAgent_initSPObjects__block_invoke_169;
      v17[3] = &unk_24D7C1E80;
      v12 = v11;
      v18 = v12;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v17);
      v13 = WeakRetained;
      objc_sync_enter(v13);
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_sync_exit(v13);

    }
    else
    {
      v14 = 0;
    }
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_174);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      __36__WPDSearchPartyAgent_initSPObjects__block_invoke_166_cold_1();
    v15 = WeakRetained;
    objc_sync_enter(v15);
    objc_msgSend(v15, "setSpNearbyTokens:", v14);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSpNearbyTokensUpdated:", v16);

    objc_sync_exit(v15);
    objc_autoreleasePoolPop(v10);
    if ((objc_msgSend(v15, "isTestMode") & 1) == 0)
      objc_msgSend(v15, "rollTokens_async_completion:", v6);
  }

}

void __36__WPDSearchPartyAgent_initSPObjects__block_invoke_169(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = (void *)MEMORY[0x24BDBCE50];
  v6 = a2;
  objc_msgSend(v6, "address");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataWithData:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v8, 2 * a3);

  v9 = (void *)MEMORY[0x24BDBCE50];
  objc_msgSend(v6, "nearbyToken");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "dataWithData:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v10, (2 * a3) | 1);

}

- (void)completedKeyRequestID:(unint64_t)a3 success:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[WPDSearchPartyAgent pendingKeyCompletions](self, "pendingKeyCompletions");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "completeID:success:", a3, v4);

}

- (void)completedTokenRequestID:(unint64_t)a3 success:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[WPDSearchPartyAgent pendingTokenCompletions](self, "pendingTokenCompletions");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "completeID:success:", a3, v4);

}

- (void)rollKeys_async_completion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = 0;
  objc_initWeak(&location, self);
  -[WPDSearchPartyAgent queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__WPDSearchPartyAgent_rollKeys_async_completion___block_invoke;
  block[3] = &unk_24D7C1F08;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __49__WPDSearchPartyAgent_rollKeys_async_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "pendingKeyCompletions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x219A0F018](*(_QWORD *)(a1 + 32));
    objc_msgSend(v5, "rollKeysWithRequestID:", objc_msgSend(v3, "addCompletion:", v4));

    WeakRetained = v5;
  }

}

- (void)rollKeys_async
{
  -[WPDSearchPartyAgent rollKeys_async_completion:](self, "rollKeys_async_completion:", 0);
}

- (void)rollKeysWithRequestID:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD);
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, uint64_t, _BYTE *);
  void *v23;
  id v24;
  uint8_t *v25;
  uint8_t v26[8];
  uint8_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (-[WPDSearchPartyAgent beaconState](self, "beaconState"))
  {
    *(_QWORD *)v26 = 0;
    v27 = v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy_;
    v30 = __Block_byref_object_dispose_;
    v31 = 0;
    v5 = (void *)objc_opt_new();
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_180);
    v6 = (id)WiProxLog;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      -[WPDSearchPartyAgent beaconKeys](self, "beaconKeys");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");
      *(_DWORD *)buf = 134217984;
      v33 = v19;
      _os_log_debug_impl(&dword_2175D1000, v6, OS_LOG_TYPE_DEBUG, "WPDSearchPartyAgent has %lu beacon keys", buf, 0xCu);

    }
    -[WPDSearchPartyAgent beaconKeys](self, "beaconKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x24BDAC760];
    v21 = 3221225472;
    v22 = __45__WPDSearchPartyAgent_rollKeysWithRequestID___block_invoke_181;
    v23 = &unk_24D7C1F90;
    v8 = v5;
    v24 = v8;
    v25 = v26;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v20);

    if (*((_QWORD *)v27 + 5))
    {
      -[WPDSearchPartyAgent beaconKey](self, "beaconKey", v20, v21, v22, v23);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9
        || (v10 = (void *)*((_QWORD *)v27 + 5),
            -[WPDSearchPartyAgent beaconKey](self, "beaconKey"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            LOBYTE(v10) = objc_msgSend(v10, "isEqualToData:", v11),
            v11,
            v9,
            (v10 & 1) == 0))
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", *((_QWORD *)v27 + 5));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[WPDSearchPartyAgent setBeaconKey:](self, "setBeaconKey:", v12);

        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_187);
        v13 = (id)WiProxLog;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          -[WPDSearchPartyAgent beaconKey](self, "beaconKey");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v33 = (uint64_t)v14;
          _os_log_impl(&dword_2175D1000, v13, OS_LOG_TYPE_DEFAULT, "WPDSearchPartyAgent beacon key updated to %{public}@", buf, 0xCu);

        }
      }
    }
    else if (-[WPDSearchPartyAgent continueAdvOnFail](self, "continueAdvOnFail", v20, v21, v22, v23))
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_189);
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPDSearchPartyAgent rollKeysWithRequestID:].cold.1();
    }
    else
    {
      -[WPDSearchPartyAgent setBeaconKey:](self, "setBeaconKey:", 0);
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_191);
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPDSearchPartyAgent rollKeysWithRequestID:].cold.2();
    }

    _Block_object_dispose(v26, 8);
  }
  else
  {
    -[WPDSearchPartyAgent setBeaconKey:](self, "setBeaconKey:", 0);
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_193);
    v15 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_2175D1000, v15, OS_LOG_TYPE_DEFAULT, "WPDSearchPartyAgent beaconing was turned off", v26, 2u);
    }
  }
  -[WPDSearchPartyAgent beaconChange](self, "beaconChange");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[WPDSearchPartyAgent beaconChange](self, "beaconChange");
    v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v17[2](v17, a3);

  }
}

void __45__WPDSearchPartyAgent_rollKeysWithRequestID___block_invoke_181(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v6 = a2;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_182);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    __45__WPDSearchPartyAgent_rollKeysWithRequestID___block_invoke_181_cold_2();
  objc_msgSend(v6, "dateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsDate:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_184);
    v9 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      __45__WPDSearchPartyAgent_rollKeysWithRequestID___block_invoke_181_cold_1(v9, v6);
    objc_msgSend(v6, "key");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    *a4 = 1;
  }

}

- (void)rollTokens_async_completion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = 0;
  objc_initWeak(&location, self);
  -[WPDSearchPartyAgent queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__WPDSearchPartyAgent_rollTokens_async_completion___block_invoke;
  block[3] = &unk_24D7C1F08;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __51__WPDSearchPartyAgent_rollTokens_async_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "pendingTokenCompletions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x219A0F018](*(_QWORD *)(a1 + 32));
    objc_msgSend(v5, "rollTokensWithRequestID:", objc_msgSend(v3, "addCompletion:", v4));

    WeakRetained = v5;
  }

}

- (void)rollTokens_async
{
  -[WPDSearchPartyAgent rollTokens_async_completion:](self, "rollTokens_async_completion:", 0);
}

- (void)rollTokensWithRequestID:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_194);
  v5 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[WPDSearchPartyAgent nearbyTokens](self, "nearbyTokens");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 134217984;
    v12 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_2175D1000, v6, OS_LOG_TYPE_DEFAULT, "WPDSearchPartyAgent has %lu nearby tokens", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDSearchPartyAgent setSpNearbyTokensUpdated:](self, "setSpNearbyTokensUpdated:", v8);

  -[WPDSearchPartyAgent tokensChange](self, "tokensChange");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[WPDSearchPartyAgent tokensChange](self, "tokensChange");
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v10[2](v10, a3);

  }
}

- (void)startTest
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2175D1000, v0, v1, "WPDSearchPartyAgent test mode started", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)stopTest
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2175D1000, v0, v1, "WPDSearchPartyAgent test mode stopped", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)updateTestNearOwnerTokens:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)MEMORY[0x219A0EE8C]();
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_198);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDSearchPartyAgent updateTestNearOwnerTokens:].cold.1();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDSearchPartyAgent setTestNearbyTokens:](self, "setTestNearbyTokens:", v6);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDSearchPartyAgent setTestNearbyTokensUpdated:](self, "setTestNearbyTokensUpdated:", v7);

  objc_autoreleasePoolPop(v5);
  -[WPDSearchPartyAgent rollTokens_async](self, "rollTokens_async");

}

- (void)updateTestBeaconKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x219A0EE8C]();
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_199);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDSearchPartyAgent updateTestBeaconKeys:].cold.1();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __44__WPDSearchPartyAgent_updateTestBeaconKeys___block_invoke_200;
  v10[3] = &unk_24D7C20D8;
  v11 = v6;
  v7 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v10);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDSearchPartyAgent setTestBeaconKeys:](self, "setTestBeaconKeys:", v8);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDSearchPartyAgent setTestBeaconKeysUpdated:](self, "setTestBeaconKeysUpdated:", v9);

  objc_autoreleasePoolPop(v5);
  -[WPDSearchPartyAgent rollKeys_async](self, "rollKeys_async");

}

void __44__WPDSearchPartyAgent_updateTestBeaconKeys___block_invoke_200(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;

  +[WPDSearchPartyAgent spBeaconKeyFromTestKey:](WPDSearchPartyAgent, "spBeaconKeyFromTestKey:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v5, a3);

}

- (void)updateTestBeaconStatus:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)MEMORY[0x219A0EE8C]();
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_203);
  v6 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDSearchPartyAgent updateTestBeaconStatus:].cold.1(v6, v4);
  -[WPDSearchPartyAgent setTestBeaconStatus:](self, "setTestBeaconStatus:", objc_msgSend(v4, "unsignedCharValue"));
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDSearchPartyAgent setTestBeaconKeysUpdated:](self, "setTestBeaconKeysUpdated:", v7);

  objc_autoreleasePoolPop(v5);
  -[WPDSearchPartyAgent rollKeys_async](self, "rollKeys_async");

}

- (void)updateTestBeaconExtended:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)MEMORY[0x219A0EE8C]();
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_204);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDSearchPartyAgent updateTestBeaconExtended:].cold.1();
  -[WPDSearchPartyAgent setTestBeaconReserved:](self, "setTestBeaconReserved:", v4);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDSearchPartyAgent setTestBeaconKeysUpdated:](self, "setTestBeaconKeysUpdated:", v6);

  objc_autoreleasePoolPop(v5);
  -[WPDSearchPartyAgent rollKeys_async](self, "rollKeys_async");

}

- (void)updateTestBeaconState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)MEMORY[0x219A0EE8C]();
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_205);
  v6 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDSearchPartyAgent updateTestBeaconState:].cold.1(v6, v4);
  -[WPDSearchPartyAgent setTestBeaconState:](self, "setTestBeaconState:", objc_msgSend(v4, "BOOLValue"));
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDSearchPartyAgent setTestBeaconKeysUpdated:](self, "setTestBeaconKeysUpdated:", v7);

  objc_autoreleasePoolPop(v5);
  -[WPDSearchPartyAgent rollKeys_async](self, "rollKeys_async");

}

+ (id)spBeaconKeyFromTestKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a3;
  v4 = (void *)MEMORY[0x219A0EE8C]();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kStartTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kEndTime"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kBeaconKey"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5 && v6 && v7)
  {
    objc_msgSend(v5, "doubleValue");
    v10 = v9;
    objc_msgSend(v6, "doubleValue");
    v12 = v11;
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:duration:", v13, v12 - v10);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE82BD8]), "initWithDateInterval:key:", v14, v8);
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_218);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      +[WPDSearchPartyAgent spBeaconKeyFromTestKey:].cold.2();

  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_214);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      +[WPDSearchPartyAgent spBeaconKeyFromTestKey:].cold.1();
    v15 = 0;
  }

  objc_autoreleasePoolPop(v4);
  return v15;
}

- (BOOL)isTestMode
{
  return self->_isTestMode;
}

- (void)setIsTestMode:(BOOL)a3
{
  self->_isTestMode = a3;
}

- (NSData)beaconKey
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBeaconKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_loadWeakRetained((id *)&self->_queue);
}

- (BOOL)disableScans
{
  return self->_disableScans;
}

- (void)setDisableScans:(BOOL)a3
{
  self->_disableScans = a3;
}

- (BOOL)spBeaconState
{
  return self->_spBeaconState;
}

- (void)setSpBeaconState:(BOOL)a3
{
  self->_spBeaconState = a3;
}

- (unsigned)spBeaconStatus
{
  return self->_spBeaconStatus;
}

- (void)setSpBeaconStatus:(unsigned __int8)a3
{
  self->_spBeaconStatus = a3;
}

- (NSData)spBeaconReserved
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)testBeaconState
{
  return self->_testBeaconState;
}

- (void)setTestBeaconState:(BOOL)a3
{
  self->_testBeaconState = a3;
}

- (unsigned)testBeaconStatus
{
  return self->_testBeaconStatus;
}

- (void)setTestBeaconStatus:(unsigned __int8)a3
{
  self->_testBeaconStatus = a3;
}

- (NSData)testBeaconReserved
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTestBeaconReserved:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (SPBeaconManager)beaconManager
{
  return (SPBeaconManager *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBeaconManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (id)beaconChange
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setBeaconChange:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSArray)spBeaconKeys
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSpBeaconKeys:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSDate)spBeaconKeysUpdated
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSpBeaconKeysUpdated:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (id)beaconStateChangedBlock
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setBeaconStateChangedBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (id)beaconKeysChangedBlock
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setBeaconKeysChangedBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (id)beaconStatusChangedBlock
{
  return objc_getProperty(self, a2, 96, 1);
}

- (void)setBeaconStatusChangedBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (id)nearbyTokensChangedBlock
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setNearbyTokensChangedBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (id)tokensChange
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setTokensChange:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (NSArray)spNearbyTokens
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setSpNearbyTokens:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSDate)spNearbyTokensUpdated
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSpNearbyTokensUpdated:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSArray)testNearbyTokens
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (void)setTestNearbyTokens:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSArray)testBeaconKeys
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (void)setTestBeaconKeys:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSDate)testNearbyTokensUpdated
{
  return (NSDate *)objc_getProperty(self, a2, 152, 1);
}

- (void)setTestNearbyTokensUpdated:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSDate)testBeaconKeysUpdated
{
  return (NSDate *)objc_getProperty(self, a2, 160, 1);
}

- (void)setTestBeaconKeysUpdated:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (BOOL)continueAdvOnFail
{
  return self->_continueAdvOnFail;
}

- (void)setContinueAdvOnFail:(BOOL)a3
{
  self->_continueAdvOnFail = a3;
}

- (WPDPendingCompletions)pendingKeyCompletions
{
  return (WPDPendingCompletions *)objc_getProperty(self, a2, 168, 1);
}

- (void)setPendingKeyCompletions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (WPDPendingCompletions)pendingTokenCompletions
{
  return (WPDPendingCompletions *)objc_getProperty(self, a2, 176, 1);
}

- (void)setPendingTokenCompletions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingTokenCompletions, 0);
  objc_storeStrong((id *)&self->_pendingKeyCompletions, 0);
  objc_storeStrong((id *)&self->_testBeaconKeysUpdated, 0);
  objc_storeStrong((id *)&self->_testNearbyTokensUpdated, 0);
  objc_storeStrong((id *)&self->_testBeaconKeys, 0);
  objc_storeStrong((id *)&self->_testNearbyTokens, 0);
  objc_storeStrong((id *)&self->_spNearbyTokensUpdated, 0);
  objc_storeStrong((id *)&self->_spNearbyTokens, 0);
  objc_storeStrong(&self->_tokensChange, 0);
  objc_storeStrong(&self->_nearbyTokensChangedBlock, 0);
  objc_storeStrong(&self->_beaconStatusChangedBlock, 0);
  objc_storeStrong(&self->_beaconKeysChangedBlock, 0);
  objc_storeStrong(&self->_beaconStateChangedBlock, 0);
  objc_storeStrong((id *)&self->_spBeaconKeysUpdated, 0);
  objc_storeStrong((id *)&self->_spBeaconKeys, 0);
  objc_storeStrong(&self->_beaconChange, 0);
  objc_storeStrong((id *)&self->_beaconManager, 0);
  objc_storeStrong((id *)&self->_testBeaconReserved, 0);
  objc_storeStrong((id *)&self->_spBeaconReserved, 0);
  objc_destroyWeak((id *)&self->_queue);
  objc_storeStrong((id *)&self->_beaconKey, 0);
}

- (void)initWithQueue:beaconChange:tokensChange:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2175D1000, v0, v1, "WPDSearchPartyAgent initialized", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __36__WPDSearchPartyAgent_initSPObjects__block_invoke_156_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_2175D1000, v0, v1, "WPDSearchPartyAgent beaconManager keys updated: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __36__WPDSearchPartyAgent_initSPObjects__block_invoke_166_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_2175D1000, v0, v1, "WPDSearchPartyAgent beaconManager updated nearby tokens:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)rollKeysWithRequestID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2175D1000, v0, v1, "WPDSearchPartyAgent failed to roll new key. Continue beaconing using old key", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)rollKeysWithRequestID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2175D1000, v0, v1, "WPDSearchPartyAgent ran out of beacon keys. Beaconing is disabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __45__WPDSearchPartyAgent_rollKeysWithRequestID___block_invoke_181_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "dateInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_2175D1000, v3, v5, "WPDSearchPartyAgent current beacon key for (%@)", v6);

  OUTLINED_FUNCTION_8();
}

void __45__WPDSearchPartyAgent_rollKeysWithRequestID___block_invoke_181_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_2175D1000, v0, v1, "WPDSearchPartyAgent processing beacon key %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)updateTestNearOwnerTokens:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2175D1000, v0, v1, "WPDSearchPartyAgent test nearby tokens updated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)updateTestBeaconKeys:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2175D1000, v0, v1, "WPDSearchPartyAgent test beacon keys updated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)updateTestBeaconStatus:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4[0] = 67109120;
  v4[1] = objc_msgSend(a2, "unsignedCharValue");
  _os_log_debug_impl(&dword_2175D1000, v3, OS_LOG_TYPE_DEBUG, "WPDSearchPartyAgent test beacon status updated 0x%02x", (uint8_t *)v4, 8u);

  OUTLINED_FUNCTION_0();
}

- (void)updateTestBeaconExtended:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2175D1000, v0, v1, "WPDSearchPartyAgent test beacon extended updated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)updateTestBeaconState:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  const char *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = objc_msgSend(a2, "BOOLValue");
  v6 = "OFF";
  if (v4)
    v6 = "ON";
  v7 = 136315138;
  v8 = v6;
  OUTLINED_FUNCTION_2(&dword_2175D1000, v3, v5, "WPDSearchPartyAgent test beacon state updated %s", (uint8_t *)&v7);

  OUTLINED_FUNCTION_8();
}

+ (void)spBeaconKeyFromTestKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_2175D1000, v0, v1, "WPDSearchPartyAgent - bad test beacon key %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)spBeaconKeyFromTestKey:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_2175D1000, v0, v1, "WPDSearchPartyAgent - new test beacon key %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
