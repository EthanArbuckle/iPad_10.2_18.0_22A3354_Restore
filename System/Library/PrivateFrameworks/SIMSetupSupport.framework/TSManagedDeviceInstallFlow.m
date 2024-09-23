@implementation TSManagedDeviceInstallFlow

- (TSManagedDeviceInstallFlow)initWith:(BOOL)a3 fallbackToActivationCode:(BOOL)a4 ignoreTransport:(BOOL)a5
{
  TSManagedDeviceInstallFlow *v8;
  TSManagedDeviceInstallFlow *v9;
  id firstViewCompletion;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TSManagedDeviceInstallFlow;
  v8 = -[TSSIMSetupFlow init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_waitForService = a3;
    v8->_fallbackToActivationCode = a4;
    v8->_ignoreTransport = a5;
    firstViewCompletion = v8->_firstViewCompletion;
    v8->_firstViewCompletion = 0;

    v9->_startMonitoringConnection = 0;
  }
  return v9;
}

- (id)firstViewController
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  _TSLogDomain();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    -[TSManagedDeviceInstallFlow firstViewController].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);

  return 0;
}

- (void)firstViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id firstViewCompletion;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id location;

  v4 = a3;
  if (v4)
  {
    if ((_os_feature_enabled_impl() & 1) != 0)
    {
      +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setDelegate:", self);

      v6 = (void *)MEMORY[0x220765A70](v4);
      firstViewCompletion = self->_firstViewCompletion;
      self->_firstViewCompletion = v6;

      objc_initWeak(&location, self);
      +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __50__TSManagedDeviceInstallFlow_firstViewController___block_invoke;
      v17[3] = &unk_24DEF3380;
      objc_copyWeak(&v19, &location);
      v17[4] = self;
      v18 = v4;
      objc_msgSend(v8, "planItemsWithCompletion:", v17);

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
    else
    {
      _TSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[TSManagedDeviceInstallFlow firstViewController:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
    }
  }

}

void __50__TSManagedDeviceInstallFlow_firstViewController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *WeakRetained;
  id v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  _QWORD v39[5];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  const char *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    _TSLogDomain();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      __50__TSManagedDeviceInstallFlow_firstViewController___block_invoke_cold_1(v20, v21, v22, v23, v24, v25, v26, v27);
    goto LABEL_21;
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v6)
  {
    v7 = v6;
    v38 = v3;
    v8 = 0;
    v9 = *(_QWORD *)v41;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v41 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isInstalling", v38) & 1) != 0
          || (objc_msgSend(v11, "plan"),
              v12 = (void *)objc_claimAutoreleasedReturnValue(),
              v13 = objc_msgSend(v12, "status"),
              v12,
              v13 == 14))
        {
          _TSLogDomain();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v45 = "-[TSManagedDeviceInstallFlow firstViewController:]_block_invoke";
            _os_log_impl(&dword_21B647000, v16, OS_LOG_TYPE_DEFAULT, "Skip since one plan is installing... @%s", buf, 0xCu);
          }

          WeakRetained[91] = 1;
          if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104))
          {
            objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 120.0);
            v17 = objc_claimAutoreleasedReturnValue();
            v18 = *(_QWORD *)(a1 + 32);
            v19 = *(void **)(v18 + 104);
            *(_QWORD *)(v18 + 104) = v17;

          }
          v3 = v38;
          goto LABEL_24;
        }
        objc_msgSend(v11, "plan");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "status") == 0;

        v8 |= v15;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      if (v7)
        continue;
      break;
    }

    v3 = v38;
    if (!WeakRetained[90])
    {
      if ((v8 & 1) == 0)
        goto LABEL_25;
      goto LABEL_26;
    }
LABEL_23:
    +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __50__TSManagedDeviceInstallFlow_firstViewController___block_invoke_18;
    v39[3] = &unk_24DEF3358;
    v39[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v28, "pendingInstallItemsWithCompletion:", v39);

    goto LABEL_24;
  }

  if (WeakRetained[90])
    goto LABEL_23;
LABEL_25:
  if (!+[TSUtilities isWifiAvailable](TSUtilities, "isWifiAvailable"))
  {
    +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "usingBootstrapDataService");

    if ((v30 & 1) == 0)
    {
      _TSLogDomain();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        __50__TSManagedDeviceInstallFlow_firstViewController___block_invoke_cold_2(v20, v31, v32, v33, v34, v35, v36, v37);
      goto LABEL_21;
    }
    goto LABEL_23;
  }
LABEL_26:
  _TSLogDomain();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v45 = "-[TSManagedDeviceInstallFlow firstViewController:]_block_invoke";
    _os_log_impl(&dword_21B647000, v20, OS_LOG_TYPE_DEFAULT, "Skip since having data connection @%s", buf, 0xCu);
  }
LABEL_21:

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_24:

}

void __50__TSManagedDeviceInstallFlow_firstViewController___block_invoke_18(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id location;

  v3 = a2;
  v4 = v3;
  if (v3
    && (objc_msgSend(v3, "plans"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6))
  {
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 32), sel_handleProvisioningWatchdogExpiry, 0, 0, 120.0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 104);
    *(_QWORD *)(v8 + 104) = v7;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 91) = 1;
    objc_initWeak(&location, *(id *)(a1 + 32));
    +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "plans");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "plan");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __50__TSManagedDeviceInstallFlow_firstViewController___block_invoke_2;
    v14[3] = &unk_24DEF2EA0;
    objc_copyWeak(&v15, &location);
    v14[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v10, "installPendingPlan:completion:", v13, v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "invokeCompletionWithPlanInstallResult:", 1);
  }

}

void __50__TSManagedDeviceInstallFlow_firstViewController___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[5];
  id v6;
  id v7;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__TSManagedDeviceInstallFlow_firstViewController___block_invoke_3;
  block[3] = &unk_24DEF2E28;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  block[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v7);
}

void __50__TSManagedDeviceInstallFlow_firstViewController___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*((_BYTE *)WeakRetained + 88))
    {
      v4 = *(void **)(a1 + 32);
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __50__TSManagedDeviceInstallFlow_firstViewController___block_invoke_4;
      v8[3] = &unk_24DEF30F8;
      v8[4] = v3;
      objc_msgSend(v4, "hasCellularConnection:", v8);
    }
    v6 = *(_QWORD *)(a1 + 40);
    v5 = (uint64_t *)(a1 + 40);
    if (v6)
    {
      _TSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __50__TSManagedDeviceInstallFlow_firstViewController___block_invoke_3_cold_1(v5, v7);

      objc_msgSend(v3, "invokeCompletionWithPlanInstallResult:", 1);
    }
  }

}

uint64_t __50__TSManagedDeviceInstallFlow_firstViewController___block_invoke_4(uint64_t a1, int a2)
{
  uint64_t result;

  result = +[TSUtilities isWifiAvailable](TSUtilities, "isWifiAvailable");
  if ((result & 1) != 0 || a2)
    return objc_msgSend(*(id *)(a1 + 32), "invokeCompletionWithPlanInstallResult:", 4);
  return result;
}

- (void)handleProvisioningWatchdogExpiry
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[TSManagedDeviceInstallFlow handleProvisioningWatchdogExpiry]";
    _os_log_impl(&dword_21B647000, v3, OS_LOG_TYPE_DEFAULT, "handle 2 min provisioning watchdog timer expired @%s", (uint8_t *)&v4, 0xCu);
  }

  -[TSManagedDeviceInstallFlow invokeCompletionWithPlanInstallResult:](self, "invokeCompletionWithPlanInstallResult:", 1);
}

- (void)invokeCompletionWithPlanInstallResult:(unint64_t)a3
{
  NSObject *v5;
  void (**firstViewCompletion)(id, _QWORD);
  NSTimer *provisioningWatchDogTimer;
  id v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134218242;
    v10 = a3;
    v11 = 2080;
    v12 = "-[TSManagedDeviceInstallFlow invokeCompletionWithPlanInstallResult:]";
    _os_log_impl(&dword_21B647000, v5, OS_LOG_TYPE_DEFAULT, "handle plan install result: %lu @%s", (uint8_t *)&v9, 0x16u);
  }

  -[NSTimer invalidate](self->_provisioningWatchDogTimer, "invalidate");
  firstViewCompletion = (void (**)(id, _QWORD))self->_firstViewCompletion;
  if (firstViewCompletion)
    firstViewCompletion[2](firstViewCompletion, 0);
  self->_startMonitoringConnection = 0;
  provisioningWatchDogTimer = self->_provisioningWatchDogTimer;
  self->_provisioningWatchDogTimer = 0;

  v8 = self->_firstViewCompletion;
  self->_firstViewCompletion = 0;

}

- (void)hasCellularConnection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__TSManagedDeviceInstallFlow_hasCellularConnection___block_invoke;
  v7[3] = &unk_24DEF33A8;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "planItemsWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __52__TSManagedDeviceInstallFlow_hasCellularConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "plan", (_QWORD)v20);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "status");

          if (!v11)
          {
            (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    _TSLogDomain();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __52__TSManagedDeviceInstallFlow_hasCellularConnection___block_invoke_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)planItemsUpdated:(id)a3 planListError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSError *planInstallError;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  NSObject *v20;
  NSError *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  NSError *v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_planInstallError)
  {
    _TSLogDomain();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      planInstallError = self->_planInstallError;
      *(_DWORD *)buf = 138412546;
      v29 = planInstallError;
      v30 = 2080;
      v31 = "-[TSManagedDeviceInstallFlow planItemsUpdated:planListError:]";
      _os_log_impl(&dword_21B647000, v9, OS_LOG_TYPE_DEFAULT, "received error already : %@ @%s", buf, 0x16u);
    }

  }
  else if (v7)
  {
    objc_storeStrong((id *)&self->_planInstallError, a4);
    -[TSManagedDeviceInstallFlow invokeCompletionWithPlanInstallResult:](self, "invokeCompletionWithPlanInstallResult:", 1);
  }
  else if (v6 && self->_startMonitoringConnection)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = v6;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (self->_startMonitoringConnection)
          {
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "isInstalling") & 1) != 0
              || (objc_msgSend(v15, "plan"),
                  v16 = (void *)objc_claimAutoreleasedReturnValue(),
                  v17 = objc_msgSend(v16, "status"),
                  v16,
                  v17 == 14))
            {
              _TSLogDomain();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v15, "plan");
                v21 = (NSError *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v29 = v21;
                v30 = 2080;
                v31 = "-[TSManagedDeviceInstallFlow planItemsUpdated:planListError:]";
                _os_log_impl(&dword_21B647000, v20, OS_LOG_TYPE_DEFAULT, "One plan is installing or in monitor mode, continue waiting: %@ @%s", buf, 0x16u);

              }
              goto LABEL_26;
            }
          }
          objc_msgSend(v15, "plan");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "status");

          if (!v19)
          {
            -[TSManagedDeviceInstallFlow invokeCompletionWithPlanInstallResult:](self, "invokeCompletionWithPlanInstallResult:", 4);
            goto LABEL_26;
          }
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_26:

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  id v11;
  _BOOL4 v12;
  NSObject *v13;
  const char *v14;
  int v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (self->_startMonitoringConnection)
  {
    v12 = +[TSUtilities isWifiAvailable](TSUtilities, "isWifiAvailable");
    _TSLogDomain();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = "OFF";
      if (v12)
        v14 = "ON";
      v15 = 136315394;
      v16 = v14;
      v17 = 2080;
      v18 = "-[TSManagedDeviceInstallFlow observeValueForKeyPath:ofObject:change:context:]";
      _os_log_impl(&dword_21B647000, v13, OS_LOG_TYPE_DEFAULT, "WiFi : %s @%s", (uint8_t *)&v15, 0x16u);
    }

    if (v12)
      -[TSManagedDeviceInstallFlow invokeCompletionWithPlanInstallResult:](self, "invokeCompletionWithPlanInstallResult:", 4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_firstViewCompletion, 0);
  objc_storeStrong((id *)&self->_provisioningWatchDogTimer, 0);
  objc_storeStrong((id *)&self->_planInstallError, 0);
}

- (void)firstViewController
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E](UIViewController *)firstViewController is deprecated, please use (void)firstViewController:(void (^)(UIViewController *))completion @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)firstViewController:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Failed - MDMOverBootstrap not set @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __50__TSManagedDeviceInstallFlow_firstViewController___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]invalid self @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __50__TSManagedDeviceInstallFlow_firstViewController___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]no data connection at all @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __50__TSManagedDeviceInstallFlow_firstViewController___block_invoke_3_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138412546;
  v4 = v2;
  v5 = 2080;
  v6 = "-[TSManagedDeviceInstallFlow firstViewController:]_block_invoke_3";
  _os_log_error_impl(&dword_21B647000, a2, OS_LOG_TYPE_ERROR, "[E]Failed - plan item install failed with error: %@ @%s", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

void __52__TSManagedDeviceInstallFlow_hasCellularConnection___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]invalid self @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
