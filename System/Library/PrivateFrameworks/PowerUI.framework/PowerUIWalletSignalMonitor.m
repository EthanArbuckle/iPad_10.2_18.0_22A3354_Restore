@implementation PowerUIWalletSignalMonitor

+ (id)wallet
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)wallet_wallet;
  if (!wallet_wallet)
  {
    v3 = objc_alloc_init(MEMORY[0x24BE6EC00]);
    v4 = (void *)wallet_wallet;
    wallet_wallet = (uint64_t)v3;

    v2 = (void *)wallet_wallet;
  }
  return v2;
}

- (PowerUIWalletSignalMonitor)initWithDelegate:(id)a3
{
  id v5;
  PowerUIWalletSignalMonitor *v6;
  PowerUIWalletSignalMonitor *v7;
  os_log_t v8;
  OS_os_log *log;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PowerUIWalletSignalMonitor;
  v6 = -[PowerUIWalletSignalMonitor init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_delegate, a3);
    v8 = os_log_create("com.apple.powerui.smartcharging", "signals");
    log = v7->_log;
    v7->_log = (OS_os_log *)v8;

  }
  return v7;
}

+ (PowerUIWalletSignalMonitor)monitorWithDelegate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDelegate:", v4);

  return (PowerUIWalletSignalMonitor *)v5;
}

- (unint64_t)signalID
{
  return 5;
}

- (void)startMonitoring
{
  id v3;
  id v4;

  v3 = +[PowerUIWalletSignalMonitor wallet](PowerUIWalletSignalMonitor, "wallet");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_sourceInformationChangedNotification_, *MEMORY[0x24BE6F588], 0);

}

- (void)sourceInformationChangedNotification:(id)a3
{
  id v4;
  NSObject *log;
  PowerUISignalMonitorDelegate *delegate;
  NSObject *v7;
  OS_dispatch_queue *v8;
  OS_dispatch_queue *queue;
  NSObject *waitForFinalChangeTimer;
  OS_dispatch_source *v11;
  OS_dispatch_source *v12;
  NSObject *v13;
  dispatch_time_t v14;
  _QWORD handler[5];
  uint8_t buf[4];
  PowerUISignalMonitorDelegate *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    delegate = self->_delegate;
    *(_DWORD *)buf = 138412290;
    v17 = delegate;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Boarding pass has changed, set timer for %@", buf, 0xCu);
  }
  if (!self->_queue)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.powerui.walletMonitorQueue", v7);
    queue = self->_queue;
    self->_queue = v8;

  }
  waitForFinalChangeTimer = self->_waitForFinalChangeTimer;
  if (!waitForFinalChangeTimer)
  {
    v11 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_queue);
    v12 = self->_waitForFinalChangeTimer;
    self->_waitForFinalChangeTimer = v11;

    v13 = self->_waitForFinalChangeTimer;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __67__PowerUIWalletSignalMonitor_sourceInformationChangedNotification___block_invoke;
    handler[3] = &unk_24D3FB7B0;
    handler[4] = self;
    dispatch_source_set_event_handler(v13, handler);
    waitForFinalChangeTimer = self->_waitForFinalChangeTimer;
  }
  v14 = dispatch_walltime(0, 5000000000);
  dispatch_source_set_timer(waitForFinalChangeTimer, v14, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_activate((dispatch_object_t)self->_waitForFinalChangeTimer);

}

void __67__PowerUIWalletSignalMonitor_sourceInformationChangedNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_215A71000, v2, OS_LOG_TYPE_DEFAULT, "Timer ran out, suggest new deadline for %@.", (uint8_t *)&v5, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "requiredFullChargeDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "monitor:maySuggestNewFullChargeDeadline:", *(_QWORD *)(a1 + 32), v4);

}

- (void)stopMonitoring
{
  NSObject *waitForFinalChangeTimer;
  id v4;

  waitForFinalChangeTimer = self->_waitForFinalChangeTimer;
  if (waitForFinalChangeTimer)
    dispatch_source_set_timer(waitForFinalChangeTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BE6F588], 0);

}

- (id)requiredFullChargeDate
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *log;
  void *v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  uint64_t v42;
  NSObject *v43;
  NSObject *v45;
  void *v46;
  void *v47;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  PowerUIWalletSignalMonitor *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t buf[4];
  uint64_t v68;
  __int16 v69;
  void *v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)os_transaction_create();
  +[PowerUISmartChargeUtilities dateForPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "dateForPreferenceKey:inDomain:", CFSTR("WMQDisabledUntil"), CFSTR("com.apple.smartcharging.topoffprotection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "timeIntervalSinceNow");
    if (v6 >= 0.0)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "wallet monitor currently disabled", buf, 2u);
      }
      objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_49;
    }
    objc_msgSend(v5, "timeIntervalSinceNow");
    if (v7 < 0.0)
    {
      v8 = self->_log;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215A71000, v8, OS_LOG_TYPE_DEFAULT, "reset wallet monitor disablement", buf, 2u);
      }
      +[PowerUISmartChargeUtilities setNumber:forPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "setNumber:forPreferenceKey:inDomain:", 0, CFSTR("WMQAttempts"), CFSTR("com.apple.smartcharging.topoffprotection"));
      +[PowerUISmartChargeUtilities setNumber:forPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "setNumber:forPreferenceKey:inDomain:", 0, CFSTR("WMQSuccesses"), CFSTR("com.apple.smartcharging.topoffprotection"));
      +[PowerUISmartChargeUtilities setDate:forPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "setDate:forPreferenceKey:inDomain:", 0, CFSTR("WMQDisabledUntil"), CFSTR("com.apple.smartcharging.topoffprotection"));
    }
  }
  +[PowerUISmartChargeUtilities numberForPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "numberForPreferenceKey:inDomain:", CFSTR("WMQAttempts"), CFSTR("com.apple.smartcharging.topoffprotection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = v9;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v9, "unsignedIntValue") + 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = &unk_24D443C30;
  }
  +[PowerUISmartChargeUtilities setNumber:forPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "setNumber:forPreferenceKey:inDomain:", v11, CFSTR("WMQAttempts"), CFSTR("com.apple.smartcharging.topoffprotection"));
  +[PowerUISmartChargeUtilities numberForPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "numberForPreferenceKey:inDomain:", CFSTR("WMQSuccesses"), CFSTR("com.apple.smartcharging.topoffprotection"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v11, "unsignedIntValue");
  if (v14)
    v16 = objc_msgSend(v14, "unsignedIntValue");
  else
    v16 = 0;
  if ((v15 - v16) < 5)
  {
    v56 = v11;
    v57 = v5;
    v58 = v3;
    +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:](PowerUISmartChargeUtilities, "logMemoryUsageInternalForEvent:", CFSTR("Begining of walletMonitor requiredFullChargeDate"));
    +[PowerUIWalletSignalMonitor wallet](PowerUIWalletSignalMonitor, "wallet");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "passesOfStyles:", 16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = self;
    v21 = self->_log;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      v23 = objc_msgSend(v20, "count");
      *(_DWORD *)buf = 134217984;
      v68 = v23;
      _os_log_impl(&dword_215A71000, v22, OS_LOG_TYPE_DEFAULT, "Found %lu passes", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dateByAddingTimeInterval:", -10800.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v24;
    objc_msgSend(v24, "dateByAddingTimeInterval:", 86400.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v27 = v20;
    v51 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
    if (v51)
    {
      v28 = *(_QWORD *)v64;
      v53 = v27;
      v54 = v14;
      v49 = *(_QWORD *)v64;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v64 != v28)
            objc_enumerationMutation(v27);
          v30 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v29);
          v59 = 0u;
          v60 = 0u;
          v61 = 0u;
          v62 = 0u;
          v50 = v30;
          objc_msgSend(v30, "relevantDates", v49);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
          if (v32)
          {
            v33 = v32;
            v34 = *(_QWORD *)v60;
            while (2)
            {
              for (i = 0; i != v33; ++i)
              {
                if (*(_QWORD *)v60 != v34)
                  objc_enumerationMutation(v31);
                v36 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
                objc_msgSend(v36, "date");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "timeIntervalSinceDate:", v25);
                if (v38 < 0.0)
                {

                }
                else
                {
                  objc_msgSend(v36, "date");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "timeIntervalSinceDate:", v26);
                  v41 = v40;

                  if (v41 <= 0.0)
                  {
                    v43 = v52->_log;
                    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                    {
                      v45 = v43;
                      objc_msgSend(v50, "localizedName");
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v36, "date");
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412546;
                      v68 = (uint64_t)v46;
                      v69 = 2112;
                      v70 = v47;
                      _os_log_impl(&dword_215A71000, v45, OS_LOG_TYPE_DEFAULT, "Found pass, forcing immediate charge: %@, %@", buf, 0x16u);

                    }
                    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
                    v13 = (void *)objc_claimAutoreleasedReturnValue();

                    v27 = v53;
                    v14 = v54;
                    goto LABEL_47;
                  }
                }
              }
              v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
              if (v33)
                continue;
              break;
            }
          }

          ++v29;
          v27 = v53;
          v14 = v54;
          v28 = v49;
        }
        while (v29 != v51);
        v51 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
      }
      while (v51);
    }

    +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:](PowerUISmartChargeUtilities, "logMemoryUsageInternalForEvent:", CFSTR("End of walletMonitor requiredFullChargeDate"));
    if (v14)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v14, "intValue") + 1);
      v42 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v42;
    }
    else
    {
      v14 = &unk_24D443C30;
    }
    +[PowerUISmartChargeUtilities setNumber:forPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "setNumber:forPreferenceKey:inDomain:", v14, CFSTR("WMQSuccesses"), CFSTR("com.apple.smartcharging.topoffprotection"));
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_47:

    v5 = v57;
    v3 = v58;
    v11 = v56;
  }
  else
  {
    v17 = self->_log;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215A71000, v17, OS_LOG_TYPE_DEFAULT, "too many WMQ failures, temp disable", buf, 2u);
    }
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 604800.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[PowerUISmartChargeUtilities setDate:forPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "setDate:forPreferenceKey:inDomain:", v18, CFSTR("WMQDisabledUntil"), CFSTR("com.apple.smartcharging.topoffprotection"));

    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_49:
  return v13;
}

- (id)detectedSignals
{
  void *v2;
  void *v3;
  int v4;
  void *v5;

  -[PowerUIWalletSignalMonitor requiredFullChargeDate](self, "requiredFullChargeDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToDate:", v3);

  if (v4)
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
  else
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PowerUISignalMonitorDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_source)waitForFinalChangeTimer
{
  return self->_waitForFinalChangeTimer;
}

- (void)setWaitForFinalChangeTimer:(id)a3
{
  objc_storeStrong((id *)&self->_waitForFinalChangeTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitForFinalChangeTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
