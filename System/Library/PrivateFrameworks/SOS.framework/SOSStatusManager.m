@implementation SOSStatusManager

+ (SOSStatusManager)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SOSStatusManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_7 != -1)
    dispatch_once(&sharedInstance_onceToken_7, block);
  return (SOSStatusManager *)(id)sharedInstance_inst_1;
}

void __34__SOSStatusManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_inst_1;
  sharedInstance_inst_1 = (uint64_t)v1;

}

- (SOSStatusManager)init
{
  SOSStatusManager *v2;
  NSObject *v3;
  uint64_t v4;
  SOSCoreAnalyticsReporting *coreAnalyticsReporter;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SOSStatusManager;
  v2 = -[SOSStatusManager init](&v8, sel_init);
  if (v2)
  {
    sos_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "SOSStatusManager, init", v7, 2u);
    }

    +[SOSCoreAnalyticsReporter sharedInstance](SOSCoreAnalyticsReporter, "sharedInstance");
    v4 = objc_claimAutoreleasedReturnValue();
    coreAnalyticsReporter = v2->_coreAnalyticsReporter;
    v2->_coreAnalyticsReporter = (SOSCoreAnalyticsReporting *)v4;

  }
  return v2;
}

- (void)sosTriggeredWithUUID:(id)a3 trigger:(int64_t)a4 source:(int64_t)a5
{
  id v8;
  SOSStatus *v9;
  void *v10;
  SOSStatus *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  SOSStatus *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = [SOSStatus alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SOSStatus initWithUUID:trigger:timeOfDetection:](v9, "initWithUUID:trigger:timeOfDetection:", v8, a4, v10);

  -[SOSStatus setFlowState:](v11, "setFlowState:", 14);
  +[SOSUtilities setCurrentDeviceSOSStatus:](SOSUtilities, "setCurrentDeviceSOSStatus:", v11);
  -[SOSStatusManager setMostRecentTriggerSource:](self, "setMostRecentTriggerSource:", a5);
  sos_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v11;
    _os_log_impl(&dword_1AF4DC000, v12, OS_LOG_TYPE_DEFAULT, "SOSStatusManager, sosTriggeredWithUUID: %@", (uint8_t *)&v16, 0xCu);
  }

  -[SOSStatusManager flowStarted](self, "flowStarted");
  +[SOSCoordinator sharedInstance](SOSCoordinator, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[SOSUtilities currentDeviceSOSStatus](SOSUtilities, "currentDeviceSOSStatus");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "syncProgressionWithPairedDevice:sosStatus:", 1, v14);

  +[SOSEngine sharedInstance](SOSEngine, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "broadcastUpdatedSOSStatus:", v11);

  -[SOSStatusManager startCurrentDeviceClearStatusTimer](self, "startCurrentDeviceClearStatusTimer");
}

- (void)sosTriggerDisabledWithUUID:(id)a3 trigger:(int64_t)a4
{
  id v6;
  SOSStatus *v7;
  void *v8;
  void *v9;
  SOSStatus *v10;
  NSObject *v11;
  void *v12;
  int v13;
  SOSStatus *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = [SOSStatus alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SOSStatus initWithUUID:trigger:timeOfDetection:timeOfResolution:resolution:](v7, "initWithUUID:trigger:timeOfDetection:timeOfResolution:resolution:", v6, a4, v8, v9, 4);

  +[SOSUtilities setCurrentDeviceSOSStatus:](SOSUtilities, "setCurrentDeviceSOSStatus:", v10);
  sos_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v10;
    _os_log_impl(&dword_1AF4DC000, v11, OS_LOG_TYPE_DEFAULT, "SOSStatusManager, sosTriggerDisabledWithUUID: %@", (uint8_t *)&v13, 0xCu);
  }

  if (a4 == 7)
  {
    +[SOSEngine sharedInstance](SOSEngine, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleNotifyThirdPartyClientsWithSOSStatus:", v10);

  }
  -[SOSStatusManager _reportSOSEvent:callDuration:](self, "_reportSOSEvent:callDuration:", v10, 0);

}

- (void)updateSOSFlowState:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  +[SOSUtilities currentDeviceSOSStatus](SOSUtilities, "currentDeviceSOSStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sos_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 67109120;
    LODWORD(v20) = objc_msgSend(v5, "flowState");
    _os_log_impl(&dword_1AF4DC000, v6, OS_LOG_TYPE_DEFAULT, "SOSStatusManager, previousState: %d", (uint8_t *)&v19, 8u);
  }

  sos_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 67109120;
    LODWORD(v20) = a3;
    _os_log_impl(&dword_1AF4DC000, v7, OS_LOG_TYPE_DEFAULT, "SOSStatusManager, updateSOSFlowState: %d", (uint8_t *)&v19, 8u);
  }

  v8 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v8, "setFlowState:", a3);
  if (objc_msgSend(v8, "isFlowActive") && !-[SOSStatusManager hasActiveSOSCall](self, "hasActiveSOSCall"))
    -[SOSStatusManager startCurrentDeviceClearStatusTimer](self, "startCurrentDeviceClearStatusTimer");
  else
    -[SOSStatusManager cancelCurrentDeviceClearStatusTimer](self, "cancelCurrentDeviceClearStatusTimer");
  if (!objc_msgSend(v8, "resolution"))
  {
    if (a3 != 6)
    {
      if (a3 != 4)
      {
        if (a3 == 3 || (v9 = objc_msgSend(v5, "isFlowActive"), a3 == 10) && (v9 & 1) != 0)
        {
          v10 = 2;
LABEL_19:
          objc_msgSend(v8, "setResolution:", v10);
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setTimeOfResolution:", v11);

LABEL_20:
          if (objc_msgSend(v8, "resolution") == 3)
            -[SOSStatusManager _reportSOSEvent:callDuration:](self, "_reportSOSEvent:callDuration:", v8, 0);
          goto LABEL_22;
        }
        if (a3)
          goto LABEL_20;
      }
      v10 = 1;
      goto LABEL_19;
    }
    v10 = 3;
    goto LABEL_19;
  }
LABEL_22:
  sos_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412290;
    v20 = v8;
    _os_log_impl(&dword_1AF4DC000, v12, OS_LOG_TYPE_DEFAULT, "SOSStatusManager, updating currentDeviceSOSStatus to %@", (uint8_t *)&v19, 0xCu);
  }

  +[SOSUtilities setCurrentDeviceSOSStatus:](SOSUtilities, "setCurrentDeviceSOSStatus:", v8);
  if (objc_msgSend(v8, "isFlowActive")
    && !-[SOSStatusManager inSOSFlowOnCurrentDevice](self, "inSOSFlowOnCurrentDevice"))
  {
    -[SOSStatusManager flowStarted](self, "flowStarted");
  }
  else if ((objc_msgSend(v8, "isFlowActive") & 1) == 0
         && -[SOSStatusManager inSOSFlowOnCurrentDevice](self, "inSOSFlowOnCurrentDevice"))
  {
    -[SOSStatusManager flowEnded](self, "flowEnded");
  }
  +[SOSCoordinator sharedInstance](SOSCoordinator, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[SOSUtilities currentDeviceSOSStatus](SOSUtilities, "currentDeviceSOSStatus");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "syncProgressionWithPairedDevice:sosStatus:", 3, v14);

  +[SOSEngine sharedInstance](SOSEngine, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[SOSUtilities currentDeviceSOSStatus](SOSUtilities, "currentDeviceSOSStatus");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "broadcastUpdatedSOSStatus:", v16);

  if (objc_msgSend(v8, "trigger") == 7
    && objc_msgSend(v5, "isFlowActiveAndNotResting")
    && (objc_msgSend(v8, "isFlowActiveAndNotResting") & 1) == 0)
  {
    +[SOSEngine sharedInstance](SOSEngine, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[SOSUtilities currentDeviceSOSStatus](SOSUtilities, "currentDeviceSOSStatus");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleNotifyThirdPartyClientsWithSOSStatus:", v18);

  }
}

- (void)handleSOSCallStatusChange:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  double v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = -[SOSStatusManager hasActiveSOSCall](self, "hasActiveSOSCall");
  if (!v4 || v5)
  {
    v7 = -[SOSStatusManager hasActiveSOSCall](self, "hasActiveSOSCall");
    if (!v4 && v7)
    {
      +[SOSUtilities currentDeviceSOSStatus](SOSUtilities, "currentDeviceSOSStatus");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SOSStatusManager activeSOSCall](self, "activeSOSCall");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "callDuration");
      -[SOSStatusManager _reportSOSEvent:callDuration:](self, "_reportSOSEvent:callDuration:", v8, (uint64_t)v10);

      sos_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1AF4DC000, v11, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,SOS call ended", v12, 2u);
      }

      -[SOSStatusManager setHasActiveSOSCall:](self, "setHasActiveSOSCall:", 0);
      -[SOSStatusManager startCurrentDeviceClearStatusTimer](self, "startCurrentDeviceClearStatusTimer");
      -[SOSStatusManager startPairedDeviceClearStatusTimer](self, "startPairedDeviceClearStatusTimer");
    }
  }
  else
  {
    sos_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF4DC000, v6, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,SOS call started", buf, 2u);
    }

    -[SOSStatusManager setHasActiveSOSCall:](self, "setHasActiveSOSCall:", 1);
    -[SOSStatusManager cancelCurrentDeviceClearStatusTimer](self, "cancelCurrentDeviceClearStatusTimer");
    -[SOSStatusManager cancelPairedDeviceClearStatusTimer](self, "cancelPairedDeviceClearStatusTimer");
  }
  -[SOSStatusManager setActiveSOSCall:](self, "setActiveSOSCall:", v4);

}

- (void)checkSOSStatusOnLaunch
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[SOSUtilities pairedDeviceSOSStatus](SOSUtilities, "pairedDeviceSOSStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "isFlowActive"))
  {
    sos_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v4;
      _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,found active paired device flow on launch: %@", (uint8_t *)&v15, 0xCu);
    }

    -[SOSStatusManager updatePairedDeviceSOSStatus:](self, "updatePairedDeviceSOSStatus:", v4);
  }
  else
  {
    sos_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1AF4DC000, v6, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,paired device status not active on launch", (uint8_t *)&v15, 2u);
    }

  }
  +[SOSUtilities currentDeviceSOSStatus](SOSUtilities, "currentDeviceSOSStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    sos_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1AF4DC000, v10, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,current device status was nil on launch", (uint8_t *)&v15, 2u);
    }
    goto LABEL_16;
  }
  if (objc_msgSend(v7, "shouldRetriggerSOS"))
  {
    sos_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v8;
      _os_log_impl(&dword_1AF4DC000, v9, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,retriggering unresolved SOS event on launch: %@", (uint8_t *)&v15, 0xCu);
    }

    +[SOSEngine sharedInstance](SOSEngine, "sharedInstance");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject retriggerSOSWithUUID:trigger:](v10, "retriggerSOSWithUUID:trigger:", v11, objc_msgSend(v8, "trigger"));

LABEL_16:
    goto LABEL_17;
  }
  v12 = objc_msgSend(v8, "isFlowActive");
  sos_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      v15 = 138412290;
      v16 = v8;
      _os_log_impl(&dword_1AF4DC000, v13, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,found active current device flow on launch: %@", (uint8_t *)&v15, 0xCu);
    }

    -[SOSStatusManager updateSOSFlowState:](self, "updateSOSFlowState:", objc_msgSend(v8, "flowState"));
  }
  else
  {
    if (v14)
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1AF4DC000, v13, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,current device status not active on launch", (uint8_t *)&v15, 2u);
    }

  }
LABEL_17:

}

- (void)handleLostStatusReporterConnection
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[SOSUtilities currentDeviceSOSStatus](SOSUtilities, "currentDeviceSOSStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "shouldRetriggerSOS");
    sos_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        *(_DWORD *)buf = 138412290;
        v13 = v4;
        _os_log_impl(&dword_1AF4DC000, v6, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,retriggering unresolved SOS event due to lost status reporter connection: %@", buf, 0xCu);
      }

      v8 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __54__SOSStatusManager_handleLostStatusReporterConnection__block_invoke;
      block[3] = &unk_1E5F75E48;
      v11 = v4;
      dispatch_after(v8, MEMORY[0x1E0C80D38], block);

    }
    else
    {
      if (v7)
      {
        *(_DWORD *)buf = 138412290;
        v13 = v4;
        _os_log_impl(&dword_1AF4DC000, v6, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,no need to retrigger SOS event due to lost status reporter connection: %@", buf, 0xCu);
      }

      -[SOSStatusManager updateSOSFlowState:](self, "updateSOSFlowState:", 0);
    }
  }
  else
  {
    sos_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF4DC000, v9, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,nil status on lost status reporter connection", buf, 2u);
    }

  }
}

void __54__SOSStatusManager_handleLostStatusReporterConnection__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[SOSEngine sharedInstance](SOSEngine, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "retriggerSOSWithUUID:trigger:", v2, objc_msgSend(*(id *)(a1 + 32), "trigger"));

}

- (void)startCurrentDeviceClearStatusTimer
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SOSStatusManager_startCurrentDeviceClearStatusTimer__block_invoke;
  block[3] = &unk_1E5F75E48;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __54__SOSStatusManager_startCurrentDeviceClearStatusTimer__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cancelCurrentDeviceClearStatusTimer");
  +[SOSUtilities currentDeviceSOSStatus](SOSUtilities, "currentDeviceSOSStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2
    && objc_msgSend(v2, "isFlowActive")
    && !objc_msgSend(*(id *)(a1 + 32), "hasActiveSOSCall"))
  {
    sos_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v11 = 0x4044000000000000;
      _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,starting current device clear status timer: %.1f s", buf, 0xCu);
    }

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v6 = (void *)MEMORY[0x1E0C99E88];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__SOSStatusManager_startCurrentDeviceClearStatusTimer__block_invoke_194;
    v8[3] = &unk_1E5F764A0;
    objc_copyWeak(&v9, (id *)buf);
    objc_msgSend(v6, "scheduledTimerWithTimeInterval:repeats:block:", 0, v8, 40.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setCurrentDeviceStatusClearTimer:", v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    sos_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF4DC000, v4, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,not starting current device clear status timer", buf, 2u);
    }

  }
}

void __54__SOSStatusManager_startCurrentDeviceClearStatusTimer__block_invoke_194(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;

  sos_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __54__SOSStatusManager_startCurrentDeviceClearStatusTimer__block_invoke_194_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateSOSFlowState:", 0);

}

- (void)cancelCurrentDeviceClearStatusTimer
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[SOSStatusManager currentDeviceStatusClearTimer](self, "currentDeviceStatusClearTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    sos_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1AF4DC000, v4, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,canceling current device clear status timer", v6, 2u);
    }

    -[SOSStatusManager currentDeviceStatusClearTimer](self, "currentDeviceStatusClearTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    -[SOSStatusManager setCurrentDeviceStatusClearTimer:](self, "setCurrentDeviceStatusClearTimer:", 0);
  }
}

- (void)flowStarted
{
  void *v3;
  id v4;

  +[SOSUtilities currentDeviceSOSStatus](SOSUtilities, "currentDeviceSOSStatus");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[SOSUtilities pairedDeviceSOSStatus](SOSUtilities, "pairedDeviceSOSStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isFlowActive") & 1) != 0 || objc_msgSend(v3, "isFlowActive"))
    -[SOSStatusManager flowStartedOnEitherDevice](self, "flowStartedOnEitherDevice");
  if (objc_msgSend(v4, "isFlowActive"))
    -[SOSStatusManager flowStartedOnCurrentDevice](self, "flowStartedOnCurrentDevice");

}

- (void)flowStartedOnEitherDevice
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[8];
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (!-[SOSStatusManager inSOSFlow](self, "inSOSFlow"))
  {
    -[SOSStatusManager setInSOSFlow:](self, "setInSOSFlow:", 1);
    sos_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,flowStartedOnEitherDevice", v6, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("SOSHasActiveTriggerValueKey");
    v8[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("SOSHasActiveTriggerChangedNotification"), 0, v5);

    objc_msgSend(MEMORY[0x1E0DC8660], "requestPhraseSpotterBypassing:timeout:", 1, 20.0);
    -[SOSStatusManager startAudioSession](self, "startAudioSession");
  }
}

- (void)flowStartedOnCurrentDevice
{
  NSObject *v3;
  uint8_t v4[16];

  if (!-[SOSStatusManager inSOSFlowOnCurrentDevice](self, "inSOSFlowOnCurrentDevice"))
  {
    -[SOSStatusManager setInSOSFlowOnCurrentDevice:](self, "setInSOSFlowOnCurrentDevice:", 1);
    sos_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,flowStartedOnCurrentDevice", v4, 2u);
    }

  }
}

- (void)flowEnded
{
  void *v3;
  id v4;

  +[SOSUtilities currentDeviceSOSStatus](SOSUtilities, "currentDeviceSOSStatus");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[SOSUtilities pairedDeviceSOSStatus](SOSUtilities, "pairedDeviceSOSStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isFlowActive") & 1) == 0)
    -[SOSStatusManager flowEndedOnCurrentDevice](self, "flowEndedOnCurrentDevice");
  if ((objc_msgSend(v4, "isFlowActive") & 1) == 0 && (objc_msgSend(v3, "isFlowActive") & 1) == 0)
    -[SOSStatusManager flowEndedOnBothDevices](self, "flowEndedOnBothDevices");

}

- (void)flowEndedOnBothDevices
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[8];
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (-[SOSStatusManager inSOSFlow](self, "inSOSFlow"))
  {
    -[SOSStatusManager setInSOSFlow:](self, "setInSOSFlow:", 0);
    sos_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,flowEndedOnBothDevices", v6, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("SOSHasActiveTriggerValueKey");
    v8[0] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("SOSHasActiveTriggerChangedNotification"), 0, v5);

    objc_msgSend(MEMORY[0x1E0DC8660], "requestPhraseSpotterBypassing:timeout:", 0, 0.0);
    -[SOSStatusManager endAudioSession](self, "endAudioSession");
  }
}

- (void)flowEndedOnCurrentDevice
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[SOSStatusManager inSOSFlowOnCurrentDevice](self, "inSOSFlowOnCurrentDevice"))
  {
    -[SOSStatusManager setInSOSFlowOnCurrentDevice:](self, "setInSOSFlowOnCurrentDevice:", 0);
    sos_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,flowEndedOnCurrentDevice", v4, 2u);
    }

  }
}

- (void)startAudioSession
{
  OUTLINED_FUNCTION_1(&dword_1AF4DC000, a2, a3, "SOSStatusManager,error when setting category for audio session,%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)endAudioSession
{
  OUTLINED_FUNCTION_1(&dword_1AF4DC000, a2, a3, "SOSStatusManager,failed to deactivate audio session with error,%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_reportSOSEvent:(id)a3 callDuration:(int64_t)a4
{
  id v6;
  _BOOL8 v7;
  id v8;

  v6 = a3;
  v7 = -[SOSStatusManager mostRecentTriggerSource](self, "mostRecentTriggerSource") == 1;
  -[SOSStatusManager coreAnalyticsReporter](self, "coreAnalyticsReporter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reportSOSEvent:callDuration:isHandoffTrigger:onWristState:", v6, a4, v7, 0);

}

- (void)pairedDeviceSOSStatusDidUpdate:(id)a3 progression:(int64_t)a4 shouldHandleThirdParty:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  _DWORD v13[2];
  uint64_t v14;

  v5 = a5;
  v14 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  sos_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13[0]) = 0;
    _os_log_impl(&dword_1AF4DC000, v9, OS_LOG_TYPE_DEFAULT, "SOSStatusManager, pairedDeviceSOSStatusDidUpdate", (uint8_t *)v13, 2u);
  }

  if (!v8)
  {
    sos_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SOSStatusManager pairedDeviceSOSStatusDidUpdate:progression:shouldHandleThirdParty:].cold.1();
LABEL_12:

    goto LABEL_14;
  }
  objc_msgSend(v8, "setIsPairedDeviceStatus:", 1);
  switch(a4)
  {
    case 3:
      -[SOSStatusManager updatePairedDeviceSOSStatus:](self, "updatePairedDeviceSOSStatus:", v8);
      break;
    case 2:
      if (v5)
      {
        if (objc_msgSend(v8, "trigger") != 7)
          break;
        +[SOSEngine sharedInstance](SOSEngine, "sharedInstance");
        v12 = objc_claimAutoreleasedReturnValue();
        -[NSObject handleNotifyThirdPartyClientsWithSOSStatus:](v12, "handleNotifyThirdPartyClientsWithSOSStatus:", v8);
      }
      else
      {
        sos_default_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v13[0]) = 0;
          _os_log_impl(&dword_1AF4DC000, v12, OS_LOG_TYPE_DEFAULT, "SOSStatusManager, third party handoff message missing info, notify failed", (uint8_t *)v13, 2u);
        }
      }
      goto LABEL_12;
    case 1:
      sos_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = objc_msgSend(v8, "trigger");
        v13[0] = 67109120;
        v13[1] = v11;
        _os_log_impl(&dword_1AF4DC000, v10, OS_LOG_TYPE_DEFAULT, "SOSStatusManager, received message with SOSProgressionSOSTriggered, trigger: %d", (uint8_t *)v13, 8u);
      }

      -[SOSStatusManager sosTriggeredOnPairedDevice:](self, "sosTriggeredOnPairedDevice:", v8);
      break;
  }
LABEL_14:

}

- (void)sosTriggeredOnPairedDevice:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    sos_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,sosTriggeredOnPairedDevice: %@", (uint8_t *)&v7, 0xCu);
    }

    +[SOSUtilities setPairedDeviceSOSStatus:](SOSUtilities, "setPairedDeviceSOSStatus:", v4);
    -[SOSStatusManager checkHandoffFallback](self, "checkHandoffFallback");
    -[SOSStatusManager flowStarted](self, "flowStarted");
    +[SOSEngine sharedInstance](SOSEngine, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "broadcastUpdatedSOSStatus:", v4);

    -[SOSStatusManager startPairedDeviceClearStatusTimer](self, "startPairedDeviceClearStatusTimer");
  }

}

- (void)updatePairedDeviceSOSStatus:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    sos_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,updatePairedDeviceSOSStatus: %@", (uint8_t *)&v7, 0xCu);
    }

    +[SOSUtilities setPairedDeviceSOSStatus:](SOSUtilities, "setPairedDeviceSOSStatus:", v4);
    -[SOSStatusManager checkHandoffFallback](self, "checkHandoffFallback");
    if (objc_msgSend(v4, "isFlowActive")
      && !-[SOSStatusManager hasActiveSOSCall](self, "hasActiveSOSCall"))
    {
      -[SOSStatusManager startPairedDeviceClearStatusTimer](self, "startPairedDeviceClearStatusTimer");
    }
    else
    {
      -[SOSStatusManager cancelPairedDeviceClearStatusTimer](self, "cancelPairedDeviceClearStatusTimer");
    }
    if (objc_msgSend(v4, "isFlowActive") && !-[SOSStatusManager inSOSFlow](self, "inSOSFlow"))
    {
      -[SOSStatusManager flowStarted](self, "flowStarted");
    }
    else if ((objc_msgSend(v4, "isFlowActive") & 1) == 0 && -[SOSStatusManager inSOSFlow](self, "inSOSFlow"))
    {
      -[SOSStatusManager flowEnded](self, "flowEnded");
    }
    +[SOSEngine sharedInstance](SOSEngine, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "broadcastUpdatedSOSStatus:", v4);

  }
}

- (void)startPairedDeviceClearStatusTimer
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__SOSStatusManager_startPairedDeviceClearStatusTimer__block_invoke;
  block[3] = &unk_1E5F75E48;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __53__SOSStatusManager_startPairedDeviceClearStatusTimer__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cancelPairedDeviceClearStatusTimer");
  +[SOSUtilities pairedDeviceSOSStatus](SOSUtilities, "pairedDeviceSOSStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2
    && objc_msgSend(v2, "isFlowActive")
    && !objc_msgSend(*(id *)(a1 + 32), "hasActiveSOSCall"))
  {
    sos_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v11 = 0x4044000000000000;
      _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,starting paired device clear status timer: %.1f s", buf, 0xCu);
    }

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v6 = (void *)MEMORY[0x1E0C99E88];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __53__SOSStatusManager_startPairedDeviceClearStatusTimer__block_invoke_200;
    v8[3] = &unk_1E5F764A0;
    objc_copyWeak(&v9, (id *)buf);
    objc_msgSend(v6, "scheduledTimerWithTimeInterval:repeats:block:", 0, v8, 40.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setPairedDeviceStatusClearTimer:", v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    sos_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF4DC000, v4, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,not starting paired device clear status timer", buf, 2u);
    }

  }
}

void __53__SOSStatusManager_startPairedDeviceClearStatusTimer__block_invoke_200(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;

  sos_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __53__SOSStatusManager_startPairedDeviceClearStatusTimer__block_invoke_200_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[SOSUtilities pairedDeviceSOSStatus](SOSUtilities, "pairedDeviceSOSStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFlowState:", 0);
  objc_msgSend(WeakRetained, "updatePairedDeviceSOSStatus:", v4);

}

- (void)cancelPairedDeviceClearStatusTimer
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[SOSStatusManager pairedDeviceStatusClearTimer](self, "pairedDeviceStatusClearTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    sos_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1AF4DC000, v4, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,canceling paired device clear status timer", v6, 2u);
    }

    -[SOSStatusManager pairedDeviceStatusClearTimer](self, "pairedDeviceStatusClearTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    -[SOSStatusManager setPairedDeviceStatusClearTimer:](self, "setPairedDeviceStatusClearTimer:", 0);
  }
}

- (void)sosTriggerPushedToPairedDeviceWithUUID:(id)a3 trigger:(int64_t)a4
{
  NSObject *v6;

  if (a3)
  {
    -[SOSStatusManager setHandoffTriggerUUID:](self, "setHandoffTriggerUUID:");
    -[SOSStatusManager setHandoffTrigger:](self, "setHandoffTrigger:", a4);
    -[SOSStatusManager startHandoffFallbackTimer](self, "startHandoffFallbackTimer");
    -[SOSStatusManager checkHandoffFallback](self, "checkHandoffFallback");
  }
  else
  {
    sos_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SOSStatusManager sosTriggerPushedToPairedDeviceWithUUID:trigger:].cold.1();

  }
}

- (void)startHandoffFallbackTimer
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SOSStatusManager_startHandoffFallbackTimer__block_invoke;
  block[3] = &unk_1E5F75E48;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __45__SOSStatusManager_startHandoffFallbackTimer__block_invoke(uint64_t a1)
{
  void *v2;
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cancelHandoffFallbackTimer");
  objc_msgSend(*(id *)(a1 + 32), "handoffTriggerUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  sos_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF4DC000, v4, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,not starting handoff fallback timer", buf, 2u);
    }

  }
  else
  {
    if (v5)
    {
      *(_DWORD *)buf = 134217984;
      v11 = 0x4024000000000000;
      _os_log_impl(&dword_1AF4DC000, v4, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,starting handoff fallback timer: %.1f s", buf, 0xCu);
    }

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v6 = (void *)MEMORY[0x1E0C99E88];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __45__SOSStatusManager_startHandoffFallbackTimer__block_invoke_201;
    v8[3] = &unk_1E5F764A0;
    objc_copyWeak(&v9, (id *)buf);
    objc_msgSend(v6, "scheduledTimerWithTimeInterval:repeats:block:", 0, v8, 10.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setHandoffFallbackTimer:", v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
}

void __45__SOSStatusManager_startHandoffFallbackTimer__block_invoke_201(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;

  sos_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __45__SOSStatusManager_startHandoffFallbackTimer__block_invoke_201_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "triggerHandoffFallback");

}

- (void)cancelHandoffFallbackTimer
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[SOSStatusManager handoffFallbackTimer](self, "handoffFallbackTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    sos_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1AF4DC000, v4, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,canceling handoff fallback timer", v6, 2u);
    }

    -[SOSStatusManager handoffFallbackTimer](self, "handoffFallbackTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    -[SOSStatusManager setHandoffFallbackTimer:](self, "setHandoffFallbackTimer:", 0);
  }
}

- (void)triggerHandoffFallback
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "handoffTriggerUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SOSStringForSOSTriggerMechanism(objc_msgSend(a1, "handoffTrigger"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1AF4DC000, a2, OS_LOG_TYPE_ERROR, "SOSStatusManager,triggering handoff fallback,UUID,%@,trigger,%@", (uint8_t *)&v6, 0x16u);

}

- (void)checkHandoffFallback
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  uint8_t v16[16];
  uint8_t v17[16];
  uint8_t buf[16];

  -[SOSStatusManager handoffTriggerUUID](self, "handoffTriggerUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[SOSStatusManager cancelHandoffFallbackTimer](self, "cancelHandoffFallbackTimer");
    return;
  }
  +[SOSUtilities pairedDeviceSOSStatus](SOSUtilities, "pairedDeviceSOSStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SOSStatusManager handoffTriggerUUID](self, "handoffTriggerUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqualToString:", v9);

    if (v10)
    {
      if (!objc_msgSend(v5, "isFlowActive"))
      {
        v12 = objc_msgSend(v5, "flowState");
        sos_default_log();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        if (!v12)
        {
          if (v14)
          {
            *(_WORD *)v16 = 0;
            _os_log_impl(&dword_1AF4DC000, v13, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,handoff flow not running", v16, 2u);
          }

          -[SOSStatusManager handoffFallbackTimer](self, "handoffFallbackTimer");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v15)
            -[SOSStatusManager startHandoffFallbackTimer](self, "startHandoffFallbackTimer");
          goto LABEL_15;
        }
        if (v14)
        {
          *(_WORD *)v17 = 0;
          _os_log_impl(&dword_1AF4DC000, v13, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,handoff flow ended", v17, 2u);
        }

        -[SOSStatusManager cancelHandoffFallbackTimer](self, "cancelHandoffFallbackTimer");
        goto LABEL_14;
      }
      -[SOSStatusManager cancelHandoffFallbackTimer](self, "cancelHandoffFallbackTimer");
      if ((objc_msgSend(v5, "isPreCall") & 1) == 0)
      {
        sos_default_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AF4DC000, v11, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,handoff flow progressed to call", buf, 2u);
        }

LABEL_14:
        -[SOSStatusManager clearHandoffFallbackState](self, "clearHandoffFallbackState");
      }
    }
  }
LABEL_15:

}

- (void)clearHandoffFallbackState
{
  -[SOSStatusManager setHandoffTriggerUUID:](self, "setHandoffTriggerUUID:", 0);
  -[SOSStatusManager setHandoffTrigger:](self, "setHandoffTrigger:", 0);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  BOOL v14;
  id v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  _BYTE v21[18];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  sos_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF4DC000, v6, OS_LOG_TYPE_DEFAULT, "SOSStatusManager, shouldAcceptNewConnection", buf, 2u);
  }

  objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.sos.trigger"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((v8 & 1) == 0)
  {
    sos_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v21 = v5;
      *(_WORD *)&v21[8] = 2112;
      *(_QWORD *)&v21[10] = CFSTR("com.apple.sos.trigger");
      v11 = "[WARN] SOSStatusManager,New connection %@ missing entitlement: %@";
      v12 = v10;
      v13 = 22;
      goto LABEL_9;
    }
LABEL_10:

    v14 = 0;
    goto LABEL_11;
  }
  -[SOSStatusManager clientConnection](self, "clientConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    sos_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v21 = v5;
      v11 = "[WARN] SOSStatusManager,Cannot accept new connection %@ because of existing client connection";
      v12 = v10;
      v13 = 12;
LABEL_9:
      _os_log_impl(&dword_1AF4DC000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __55__SOSStatusManager_listener_shouldAcceptNewConnection___block_invoke;
  v18[3] = &unk_1E5F76A08;
  v18[4] = self;
  v16 = v5;
  v19 = v16;
  dispatch_async(MEMORY[0x1E0C80D38], v18);
  sos_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v21 = 1;
    *(_WORD *)&v21[4] = 2112;
    *(_QWORD *)&v21[6] = v16;
    _os_log_impl(&dword_1AF4DC000, v17, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,shouldAcceptNewConnection: %d for connection: %@", buf, 0x12u);
  }

  v14 = 1;
LABEL_11:

  return v14;
}

void __55__SOSStatusManager_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id from;
  _QWORD v9[4];
  id v10;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "setClientConnection:", *(_QWORD *)(a1 + 40));
  SOSStatusManagerClientInterface();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setRemoteObjectInterface:", v2);

  SOSStatusManagerServerInterface();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setExportedInterface:", v3);

  objc_msgSend(*(id *)(a1 + 40), "setExportedObject:", *(_QWORD *)(a1 + 32));
  objc_initWeak(&location, *(id *)(a1 + 40));
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__SOSStatusManager_listener_shouldAcceptNewConnection___block_invoke_2;
  v9[3] = &unk_1E5F76638;
  objc_copyWeak(&v10, &location);
  objc_msgSend(*(id *)(a1 + 40), "setInterruptionHandler:", v9);
  objc_initWeak(&from, *(id *)(a1 + 32));
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __55__SOSStatusManager_listener_shouldAcceptNewConnection___block_invoke_202;
  v5[3] = &unk_1E5F769E0;
  objc_copyWeak(&v6, &location);
  objc_copyWeak(&v7, &from);
  objc_msgSend(*(id *)(a1 + 40), "setInvalidationHandler:", v5);
  objc_msgSend(*(id *)(a1 + 40), "resume");
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&from);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __55__SOSStatusManager_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id v3;
  id to;
  uint8_t buf[16];

  sos_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF4DC000, v2, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,SOS client connection interrupted", buf, 2u);
  }

  objc_copyWeak(&to, (id *)(a1 + 32));
  v3 = objc_loadWeakRetained(&to);
  objc_msgSend(v3, "invalidate");

  objc_destroyWeak(&to);
}

void __55__SOSStatusManager_listener_shouldAcceptNewConnection___block_invoke_202(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[8];
  id to;

  objc_copyWeak(&to, (id *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = objc_loadWeakRetained(&to);

  if (v3)
    objc_msgSend(WeakRetained, "setClientConnection:", 0);
  sos_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AF4DC000, v4, OS_LOG_TYPE_DEFAULT, "SOSStatusManager,SOS client connection invalidated", v6, 2u);
  }

  +[SOSEngine sharedInstance](SOSEngine, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateCurrentSOSInitiationState:", 0);

  objc_msgSend(WeakRetained, "handleLostStatusReporterConnection");
  objc_destroyWeak(&to);
}

- (NSXPCConnection)clientConnection
{
  return self->_clientConnection;
}

- (void)setClientConnection:(id)a3
{
  objc_storeStrong((id *)&self->_clientConnection, a3);
}

- (BOOL)inSOSFlow
{
  return self->_inSOSFlow;
}

- (void)setInSOSFlow:(BOOL)a3
{
  self->_inSOSFlow = a3;
}

- (BOOL)inSOSFlowOnCurrentDevice
{
  return self->_inSOSFlowOnCurrentDevice;
}

- (void)setInSOSFlowOnCurrentDevice:(BOOL)a3
{
  self->_inSOSFlowOnCurrentDevice = a3;
}

- (TUCall)activeSOSCall
{
  return self->_activeSOSCall;
}

- (void)setActiveSOSCall:(id)a3
{
  objc_storeStrong((id *)&self->_activeSOSCall, a3);
}

- (BOOL)hasActiveSOSCall
{
  return self->_hasActiveSOSCall;
}

- (void)setHasActiveSOSCall:(BOOL)a3
{
  self->_hasActiveSOSCall = a3;
}

- (NSTimer)currentDeviceStatusClearTimer
{
  return self->_currentDeviceStatusClearTimer;
}

- (void)setCurrentDeviceStatusClearTimer:(id)a3
{
  objc_storeStrong((id *)&self->_currentDeviceStatusClearTimer, a3);
}

- (NSTimer)pairedDeviceStatusClearTimer
{
  return self->_pairedDeviceStatusClearTimer;
}

- (void)setPairedDeviceStatusClearTimer:(id)a3
{
  objc_storeStrong((id *)&self->_pairedDeviceStatusClearTimer, a3);
}

- (int64_t)mostRecentTriggerSource
{
  return self->_mostRecentTriggerSource;
}

- (void)setMostRecentTriggerSource:(int64_t)a3
{
  self->_mostRecentTriggerSource = a3;
}

- (SOSCoreAnalyticsReporting)coreAnalyticsReporter
{
  return self->_coreAnalyticsReporter;
}

- (void)setCoreAnalyticsReporter:(id)a3
{
  objc_storeStrong((id *)&self->_coreAnalyticsReporter, a3);
}

- (NSUUID)handoffTriggerUUID
{
  return self->_handoffTriggerUUID;
}

- (void)setHandoffTriggerUUID:(id)a3
{
  objc_storeStrong((id *)&self->_handoffTriggerUUID, a3);
}

- (int64_t)handoffTrigger
{
  return self->_handoffTrigger;
}

- (void)setHandoffTrigger:(int64_t)a3
{
  self->_handoffTrigger = a3;
}

- (NSTimer)handoffFallbackTimer
{
  return self->_handoffFallbackTimer;
}

- (void)setHandoffFallbackTimer:(id)a3
{
  objc_storeStrong((id *)&self->_handoffFallbackTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handoffFallbackTimer, 0);
  objc_storeStrong((id *)&self->_handoffTriggerUUID, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsReporter, 0);
  objc_storeStrong((id *)&self->_pairedDeviceStatusClearTimer, 0);
  objc_storeStrong((id *)&self->_currentDeviceStatusClearTimer, 0);
  objc_storeStrong((id *)&self->_activeSOSCall, 0);
  objc_storeStrong((id *)&self->_clientConnection, 0);
}

void __54__SOSStatusManager_startCurrentDeviceClearStatusTimer__block_invoke_194_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_1AF4DC000, v0, v1, "SOSStatusManager,current device clear status timer fired", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)pairedDeviceSOSStatusDidUpdate:progression:shouldHandleThirdParty:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_1AF4DC000, v0, v1, "SOSStatusManager,paired device update received without SOSStatus", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __53__SOSStatusManager_startPairedDeviceClearStatusTimer__block_invoke_200_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_1AF4DC000, v0, v1, "SOSStatusManager,paired device clear status timer fired", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)sosTriggerPushedToPairedDeviceWithUUID:trigger:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_1AF4DC000, v0, v1, "SOSStatusManager,no UUID for trigger pushed to paired device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __45__SOSStatusManager_startHandoffFallbackTimer__block_invoke_201_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_1AF4DC000, v0, v1, "SOSStatusManager,handoff fallback timer fired", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
