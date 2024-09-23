@implementation TVRCSiriRemoteFindingManager

- (TVRCSiriRemoteFindingManager)initWithCompanionLinkClientWrapper:(id)a3
{
  id v4;
  TVRCSiriRemoteFindingManager *v5;
  TVRCSiriRemoteFindingManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TVRCSiriRemoteFindingManager;
  v5 = -[TVRCSiriRemoteFindingManager init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_wrapper, v4);
    -[TVRCSiriRemoteFindingManager _fetchPairedRemoteInfoAndStartMonitoring](v6, "_fetchPairedRemoteInfoAndStartMonitoring");
  }

  return v6;
}

- (void)enableFindingSession:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  const __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  NSObject *v17;
  TVRCSiriRemoteConnectionManager *v18;
  TVRCSiriRemoteConnectionManager *connectionManager;
  TVRCSiriRemoteConnectionManager *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  BOOL v29;
  id location;
  const __CFString *v31;
  __CFString *v32;
  uint8_t buf[4];
  const __CFString *v34;
  uint64_t v35;

  v3 = a3;
  v35 = *MEMORY[0x24BDAC8D0];
  -[TVRCSiriRemoteFindingManager pairedRemoteInfo](self, "pairedRemoteInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_initWeak(&location, self);
    -[TVRCSiriRemoteFindingManager pairedRemoteInfo](self, "pairedRemoteInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "connected");

    if (v7)
    {
      _TVRCRapportLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = CFSTR("stop");
        if (v3)
          v9 = CFSTR("start");
        *(_DWORD *)buf = 138412290;
        v34 = v9;
        _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "Remote is connected. Informing TV to %@ finding session", buf, 0xCu);
      }

      v10 = CFSTR("NO");
      if (v3)
        v10 = CFSTR("YES");
      v11 = v10;
      -[TVRCSiriRemoteFindingManager wrapper](self, "wrapper");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("FindingModeEnabledKey");
      v32 = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __53__TVRCSiriRemoteFindingManager_enableFindingSession___block_invoke;
      v27[3] = &unk_24DCD7CA0;
      v29 = v3;
      objc_copyWeak(&v28, &location);
      objc_msgSend(v12, "sendEvent:options:response:", CFSTR("ToggleFindingMode"), v13, v27);

      objc_destroyWeak(&v28);
    }
    else
    {
      -[TVRCSiriRemoteFindingManager pairedRemoteInfo](self, "pairedRemoteInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "connected");

      if ((v16 & 1) == 0)
      {
        _TVRCRapportLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21A51B000, v17, OS_LOG_TYPE_DEFAULT, "Remote is disconnected. Using BLE Connection Manager", buf, 2u);
        }

        +[TVRCSiriRemoteConnectionManager sharedInstance](TVRCSiriRemoteConnectionManager, "sharedInstance");
        v18 = (TVRCSiriRemoteConnectionManager *)objc_claimAutoreleasedReturnValue();
        connectionManager = self->_connectionManager;
        self->_connectionManager = v18;

        v22 = MEMORY[0x24BDAC760];
        v23 = 3221225472;
        v24 = __53__TVRCSiriRemoteFindingManager_enableFindingSession___block_invoke_13;
        v25 = &unk_24DCD7078;
        objc_copyWeak(&v26, &location);
        -[TVRCSiriRemoteConnectionManager setFindingSessionStateChangedHandler:](self->_connectionManager, "setFindingSessionStateChangedHandler:", &v22);
        v20 = self->_connectionManager;
        -[TVRCSiriRemoteFindingManager pairedRemoteInfo](self, "pairedRemoteInfo", v22, v23, v24, v25);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVRCSiriRemoteConnectionManager enableFastFindMy:forRemoteWithInfo:](v20, "enableFastFindMy:forRemoteWithInfo:", v3, v21);

        objc_destroyWeak(&v26);
      }
    }
    if (v3)
      -[TVRCSiriRemoteFindingManager _startHeartbeatTimer](self, "_startHeartbeatTimer");
    else
      -[TVRCSiriRemoteFindingManager _stopHeartbeatTimer](self, "_stopHeartbeatTimer");
    objc_destroyWeak(&location);
  }
  else
  {
    _TVRCRapportLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[TVRCSiriRemoteFindingManager enableFindingSession:].cold.1(v14);

  }
}

void __53__TVRCSiriRemoteFindingManager_enableFindingSession___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  int v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _TVRCRapportLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __53__TVRCSiriRemoteFindingManager_enableFindingSession___block_invoke_cold_1(a1, (uint64_t)v5, v7);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "wrapper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = 3;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(a1 + 40))
        v12 = CFSTR("started");
      else
        v12 = CFSTR("stopped");
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "Successfully %{public}@ finding session", (uint8_t *)&v13, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "wrapper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = 1;
  }
  objc_msgSend(v9, "_updateSiriRemoteFindingState:", v11);

}

void __53__TVRCSiriRemoteFindingManager_enableFindingSession___block_invoke_13(uint64_t a1, uint64_t a2)
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "wrapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_updateSiriRemoteFindingState:", a2);

}

- (void)_startHeartbeatTimer
{
  NSTimer *heartbeatTimer;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSTimer *v10;
  NSTimer *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  heartbeatTimer = self->_heartbeatTimer;
  _TVRCRapportLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (heartbeatTimer)
  {
    if (v5)
    {
      -[TVRCSiriRemoteFindingManager pairedRemoteInfo](self, "pairedRemoteInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v7;
      _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "Skipping. Timer already exists for remote: %{public}@", buf, 0xCu);

    }
  }
  else
  {
    if (v5)
    {
      -[TVRCSiriRemoteFindingManager pairedRemoteInfo](self, "pairedRemoteInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v9;
      _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "Starting heartbeat timer for remote: %{public}@", buf, 0xCu);

    }
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __52__TVRCSiriRemoteFindingManager__startHeartbeatTimer__block_invoke;
    v12[3] = &unk_24DCD7CC8;
    v12[4] = self;
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:repeats:block:", 1, v12, 540.0);
    v10 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    v11 = self->_heartbeatTimer;
    self->_heartbeatTimer = v10;

  }
}

uint64_t __52__TVRCSiriRemoteFindingManager__startHeartbeatTimer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _TVRCRapportLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "pairedRemoteInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_21A51B000, v2, OS_LOG_TYPE_DEFAULT, "Heartbeat timer fired for remote: %{public}@", (uint8_t *)&v6, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "enableFindingSession:", 1);
}

- (void)_stopHeartbeatTimer
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSTimer *heartbeatTimer;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  _TVRCRapportLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[TVRCSiriRemoteFindingManager pairedRemoteInfo](self, "pairedRemoteInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRCSiriRemoteFindingManager pairedRemoteInfo](self, "pairedRemoteInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tvName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "Stopping heartbeat timer for remote: %{public}@ tv: %{public}@", (uint8_t *)&v9, 0x16u);

  }
  -[NSTimer invalidate](self->_heartbeatTimer, "invalidate");
  heartbeatTimer = self->_heartbeatTimer;
  self->_heartbeatTimer = 0;

}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSTimer *heartbeatTimer;
  objc_super v8;
  uint8_t buf[16];

  _TVRCRapportLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "Stopped monitoring PairedRemoteInfo", buf, 2u);
  }

  -[TVRCSiriRemoteFindingManager connectionManager](self, "connectionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "teardown");

  -[TVRCSiriRemoteFindingManager wrapper](self, "wrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deregisterEvent:", CFSTR("PushSiriRemoteInfo"));

  -[TVRCSiriRemoteFindingManager heartbeatTimer](self, "heartbeatTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  heartbeatTimer = self->_heartbeatTimer;
  self->_heartbeatTimer = 0;

  v8.receiver = self;
  v8.super_class = (Class)TVRCSiriRemoteFindingManager;
  -[TVRCSiriRemoteFindingManager dealloc](&v8, sel_dealloc);
}

- (void)setPairedRemoteInfo:(id)a3
{
  TVRCSiriRemoteInfo *v5;
  TVRCSiriRemoteInfo *v6;

  v5 = (TVRCSiriRemoteInfo *)a3;
  if (self->_pairedRemoteInfo != v5)
  {
    v6 = v5;
    -[TVRCSiriRemoteFindingManager willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("pairedRemoteInfo"));
    objc_storeStrong((id *)&self->_pairedRemoteInfo, a3);
    -[TVRCSiriRemoteFindingManager didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("pairedRemoteInfo"));
    v5 = v6;
  }

}

- (void)_fetchPairedRemoteInfoAndStartMonitoring
{
  NSObject *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _TVRCRapportLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[TVRCSiriRemoteFindingManager _fetchPairedRemoteInfoAndStartMonitoring]";
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[TVRCSiriRemoteFindingManager wrapper](self, "wrapper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __72__TVRCSiriRemoteFindingManager__fetchPairedRemoteInfoAndStartMonitoring__block_invoke;
  v5[3] = &unk_24DCD7CF0;
  objc_copyWeak(&v6, (id *)buf);
  objc_msgSend(v4, "sendEvent:options:response:", CFSTR("FetchSiriRemoteInfo"), MEMORY[0x24BDBD1B8], v5);

  -[TVRCSiriRemoteFindingManager _startMonitoringPairedRemoteInfo](self, "_startMonitoringPairedRemoteInfo");
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __72__TVRCSiriRemoteFindingManager__fetchPairedRemoteInfoAndStartMonitoring__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_updatePairedRemoteInfo:", v5);

}

- (void)_startMonitoringPairedRemoteInfo
{
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id buf;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  _TVRCRapportLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "Start monitoring PairedRemoteInfo", (uint8_t *)&buf, 2u);
  }

  v9 = *MEMORY[0x24BE7CCB0];
  v10[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&buf, self);
  -[TVRCSiriRemoteFindingManager wrapper](self, "wrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __64__TVRCSiriRemoteFindingManager__startMonitoringPairedRemoteInfo__block_invoke;
  v6[3] = &unk_24DCD7D18;
  objc_copyWeak(&v7, &buf);
  objc_msgSend(v5, "registerEvent:options:handler:", CFSTR("PushSiriRemoteInfo"), v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&buf);

}

void __64__TVRCSiriRemoteFindingManager__startMonitoringPairedRemoteInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _TVRCRapportLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = v5;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "Received event response: %{public}@, options %{public}@", (uint8_t *)&v10, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_updatePairedRemoteInfo:", v5);

}

- (id)_cachedRemoteInfoForRPDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v10[16];

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (objc_msgSend(v3, "idsDeviceIdentifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "dataForKey:", v7),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6))
  {
    _TVRCRapportLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "Found cached remote info", v10, 2u);
    }
  }
  else
  {
    _TVRCRapportLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[TVRCSiriRemoteFindingManager _cachedRemoteInfoForRPDevice:].cold.1(v8);
    v6 = 0;
  }

  return v6;
}

- (void)_updatePairedRemoteInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TVRCRapportLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v4;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Remote info dict: %{public}@", buf, 0xCu);
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SiriRemoteInfoKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    _TVRCRapportLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A51B000, v12, OS_LOG_TYPE_DEFAULT, "No paired remote found", buf, 2u);
    }

    if (-[TVRCSiriRemoteFindingManager shouldLoadCachedRemoteInfo](self, "shouldLoadCachedRemoteInfo"))
    {
      -[TVRCSiriRemoteFindingManager wrapper](self, "wrapper");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "device");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRCSiriRemoteFindingManager _cachedRemoteInfoForRPDevice:](self, "_cachedRemoteInfoForRPDevice:", v14);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        goto LABEL_4;
      _TVRCRapportLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[TVRCSiriRemoteFindingManager _updatePairedRemoteInfo:].cold.1(self, v15);

    }
    v6 = 0;
    v7 = 0;
    goto LABEL_16;
  }
LABEL_4:
  v17 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  if (v8)
  {
    v9 = v8;
    _TVRCRapportLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[TVRCSiriRemoteFindingManager _updatePairedRemoteInfo:].cold.2((uint64_t)v9, v10, v11);

    goto LABEL_19;
  }
LABEL_16:
  _TVRCRapportLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v7;
    _os_log_impl(&dword_21A51B000, v16, OS_LOG_TYPE_DEFAULT, "Updated connected remote info: %{public}@", buf, 0xCu);
  }

  -[TVRCSiriRemoteFindingManager setPairedRemoteInfo:](self, "setPairedRemoteInfo:", v7);
  -[TVRCSiriRemoteFindingManager _saveRemoteInfoToUserDefaultsIfNeeded](self, "_saveRemoteInfoToUserDefaultsIfNeeded");
LABEL_19:

}

- (void)_saveRemoteInfoToUserDefaultsIfNeeded
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_21A51B000, a2, a3, "Failed to archive remoteInfo %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

- (TVRCSiriRemoteInfo)pairedRemoteInfo
{
  return self->_pairedRemoteInfo;
}

- (TVRCRPCompanionLinkClientWrapper)wrapper
{
  return (TVRCRPCompanionLinkClientWrapper *)objc_loadWeakRetained((id *)&self->_wrapper);
}

- (void)setWrapper:(id)a3
{
  objc_storeWeak((id *)&self->_wrapper, a3);
}

- (TVRCSiriRemoteConnectionManager)connectionManager
{
  return self->_connectionManager;
}

- (void)setConnectionManager:(id)a3
{
  objc_storeStrong((id *)&self->_connectionManager, a3);
}

- (BOOL)shouldLoadCachedRemoteInfo
{
  return self->_shouldLoadCachedRemoteInfo;
}

- (void)setShouldLoadCachedRemoteInfo:(BOOL)a3
{
  self->_shouldLoadCachedRemoteInfo = a3;
}

- (NSTimer)heartbeatTimer
{
  return self->_heartbeatTimer;
}

- (void)setHeartbeatTimer:(id)a3
{
  objc_storeStrong((id *)&self->_heartbeatTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartbeatTimer, 0);
  objc_storeStrong((id *)&self->_connectionManager, 0);
  objc_destroyWeak((id *)&self->_wrapper);
  objc_storeStrong((id *)&self->_pairedRemoteInfo, 0);
}

- (void)enableFindingSession:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_21A51B000, log, OS_LOG_TYPE_FAULT, "Failed to find paired remote info", v1, 2u);
}

void __53__TVRCSiriRemoteFindingManager_enableFindingSession___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("started");
  if (!*(_BYTE *)(a1 + 40))
    v3 = CFSTR("stopped");
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_21A51B000, log, OS_LOG_TYPE_ERROR, "Failed to %{public}@ finding mode: %{public}@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)_cachedRemoteInfoForRPDevice:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21A51B000, log, OS_LOG_TYPE_ERROR, "Cannot find cached remote info", v1, 2u);
}

- (void)_updatePairedRemoteInfo:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "wrapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543362;
  v7 = v4;
  OUTLINED_FUNCTION_0_1(&dword_21A51B000, a2, v5, "Could not find paired remote for device: %{public}@", (uint8_t *)&v6);

}

- (void)_updatePairedRemoteInfo:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_21A51B000, a2, a3, "%{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

@end
