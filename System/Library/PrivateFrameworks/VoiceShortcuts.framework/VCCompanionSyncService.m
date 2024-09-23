@implementation VCCompanionSyncService

- (VCCompanionSyncService)initWithSyncDataEndpoint:(id)a3
{
  id v5;
  VCCompanionSyncService *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  NSSet *currentDataHandlers;
  uint64_t v13;
  WFDebouncer *debouncer;
  void *v15;
  uint64_t v16;
  SYService *service;
  NSObject *v18;
  VCCompanionSyncService *v19;
  VCCompanionSyncService *v20;
  const char *v21;
  _QWORD block[4];
  VCCompanionSyncService *v24;
  objc_super v25;
  uint64_t v26;
  void *v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)VCCompanionSyncService;
  v6 = -[VCCompanionSyncService init](&v25, sel_init);
  if (v6)
  {
    if (objc_opt_class())
    {
      if (objc_opt_class())
      {
        dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v7 = objc_claimAutoreleasedReturnValue();
        dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INITIATED, 0);
        v8 = objc_claimAutoreleasedReturnValue();

        v9 = dispatch_queue_create("com.apple.shortcuts.VCCompanionSyncService", v8);
        queue = v6->_queue;
        v6->_queue = (OS_dispatch_queue *)v9;

        objc_storeStrong((id *)&v6->_syncDataEndpoint, a3);
        objc_msgSend(v5, "syncDataHandlers");
        v11 = objc_claimAutoreleasedReturnValue();
        currentDataHandlers = v6->_currentDataHandlers;
        v6->_currentDataHandlers = (NSSet *)v11;

        v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DD9D10]), "initWithDelay:maximumDelay:queue:", v6->_queue, 2.0, 10.0);
        debouncer = v6->_debouncer;
        v6->_debouncer = (WFDebouncer *)v13;

        -[WFDebouncer addTarget:action:](v6->_debouncer, "addTarget:action:", v6, sel_requestSyncImmediately);
        v26 = *MEMORY[0x1E0D133F0];
        v27 = &unk_1E7ABF690;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D133E0]), "initWithService:priority:asMasterStore:options:", CFSTR("com.apple.private.alloy.siri.voiceshortcuts"), 0, -[VCCompanionSyncService isRunningOnWatch](v6, "isRunningOnWatch") ^ 1, v15);
        service = v6->_service;
        v6->_service = (SYService *)v16;

        -[SYService setDelegate:queue:](v6->_service, "setDelegate:queue:", v6, v6->_queue);
        -[VCCompanionSyncService resumeServiceIfNecessary](v6, "resumeServiceIfNecessary");
        v18 = v6->_queue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __51__VCCompanionSyncService_initWithSyncDataEndpoint___block_invoke;
        block[3] = &unk_1E7AA8300;
        v19 = v6;
        v24 = v19;
        dispatch_async(v18, block);
        v20 = v19;

LABEL_12:
        goto LABEL_13;
      }
      getWFWatchSyncLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v29 = "-[VCCompanionSyncService initWithSyncDataEndpoint:]";
        v21 = "%s The NanoRegistry framework is not present on this device";
        goto LABEL_10;
      }
    }
    else
    {
      getWFWatchSyncLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v29 = "-[VCCompanionSyncService initWithSyncDataEndpoint:]";
        v21 = "%s The CompanionSync framework is not present on this device";
LABEL_10:
        _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_INFO, v21, buf, 0xCu);
      }
    }
    v20 = 0;
    goto LABEL_12;
  }
  v20 = 0;
LABEL_13:

  return v20;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[VCCompanionSyncService service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suspend");

  -[VCCompanionSyncService setCurrentSyncService:](self, "setCurrentSyncService:", 0);
  v4.receiver = self;
  v4.super_class = (Class)VCCompanionSyncService;
  -[VCCompanionSyncService dealloc](&v4, sel_dealloc);
}

- (BOOL)isRunningOnWatch
{
  return 0;
}

- (void)requestSync
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  getWFWatchSyncLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315138;
    v6 = "-[VCCompanionSyncService requestSync]";
    _os_log_impl(&dword_1C146A000, v3, OS_LOG_TYPE_DEBUG, "%s Poking the debouncer to request a sync", (uint8_t *)&v5, 0xCu);
  }

  -[VCCompanionSyncService debouncer](self, "debouncer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "poke");

}

- (void)resumeServiceIfNecessary
{
  void *v2;
  int v3;
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[VCCompanionSyncService service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v3 = objc_msgSend(v2, "resume:", &v13);
  v4 = v13;

  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D133E8]))
  {
    v6 = objc_msgSend(v4, "code");

    if (v6 == 2002)
    {
      getWFWatchSyncLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[VCCompanionSyncService resumeServiceIfNecessary]";
        v8 = "%s SYService is already running";
LABEL_9:
        v10 = v7;
        v11 = OS_LOG_TYPE_INFO;
        v12 = 12;
LABEL_12:
        _os_log_impl(&dword_1C146A000, v10, v11, v8, buf, v12);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  else
  {

  }
  getWFWatchSyncLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  v7 = v9;
  if (v3)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[VCCompanionSyncService resumeServiceIfNecessary]";
      v8 = "%s Successfully resumed SYService";
      goto LABEL_9;
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[VCCompanionSyncService resumeServiceIfNecessary]";
    v16 = 2114;
    v17 = v4;
    v8 = "%s Error resuming SYService: %{public}@";
    v10 = v7;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 22;
    goto LABEL_12;
  }
LABEL_13:

}

- (void)requestSyncImmediately
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  getWFWatchSyncLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315138;
    v6 = "-[VCCompanionSyncService requestSyncImmediately]";
    _os_log_impl(&dword_1C146A000, v3, OS_LOG_TYPE_DEBUG, "%s Requesting a sync", (uint8_t *)&v5, 0xCu);
  }

  -[VCCompanionSyncService resumeServiceIfNecessary](self, "resumeServiceIfNecessary");
  -[VCCompanionSyncService service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHasChangesAvailable");

}

- (void)requestFullResync
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  getWFWatchSyncLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315138;
    v6 = "-[VCCompanionSyncService requestFullResync]";
    _os_log_impl(&dword_1C146A000, v3, OS_LOG_TYPE_DEBUG, "%s Requesting a full resync", (uint8_t *)&v5, 0xCu);
  }

  -[VCCompanionSyncService resumeServiceIfNecessary](self, "resumeServiceIfNecessary");
  -[VCCompanionSyncService service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsResetSync");

}

- (void)resetSession
{
  void *v3;

  -[VCCompanionSyncService currentSession](self, "currentSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  -[VCCompanionSyncService setCurrentSession:](self, "setCurrentSession:", 0);
}

- (void)updateSyncDataHandlers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[VCCompanionSyncService currentDataHandlers](self, "currentDataHandlers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCCompanionSyncService syncDataEndpoint](self, "syncDataEndpoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "syncDataHandlers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[VCCompanionSyncService currentSyncService](self, "currentSyncService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v7, "minusSet:", v3);
    v8 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v8, "minusSet:", v5);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v24;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v13++), "registerSyncService:", v6);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v11);
    }

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v14 = v8;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "deregisterSyncService:", v6, (_QWORD)v19);
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v16);
    }

  }
  -[VCCompanionSyncService setCurrentDataHandlers:](self, "setCurrentDataHandlers:", v5, (_QWORD)v19);

}

- (void)updateCurrentSyncServiceIfNecessary
{
  void *v3;
  void *v4;
  VCNRDeviceSyncService *v5;
  id v6;

  -[VCCompanionSyncService currentSyncService](self, "currentSyncService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0D51840], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getActivePairedDevice");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v5 = -[VCNRDeviceSyncService initWithCompanionSyncService:device:]([VCNRDeviceSyncService alloc], "initWithCompanionSyncService:device:", self, v6);
      -[VCCompanionSyncService setCurrentSyncService:](self, "setCurrentSyncService:", v5);

    }
  }
}

- (void)setCurrentSyncService:(id)a3
{
  id v5;
  VCNRDeviceSyncService **p_currentSyncService;
  BOOL v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  char v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_currentSyncService = &self->_currentSyncService;
  v7 = -[VCNRDeviceSyncService isEqual:](self->_currentSyncService, "isEqual:", v5);
  if (!v7 && *p_currentSyncService)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[VCCompanionSyncService currentDataHandlers](self, "currentDataHandlers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "deregisterSyncService:", *p_currentSyncService);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v10);
    }

  }
  objc_storeStrong((id *)&self->_currentSyncService, a3);
  if (v5)
    v13 = v7;
  else
    v13 = 1;
  if ((v13 & 1) == 0)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[VCCompanionSyncService currentDataHandlers](self, "currentDataHandlers", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "registerSyncService:", v5);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v16);
    }

  }
}

- (void)configureReasonForUnderlyingSession:(id)a3 withSession:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[VCCompanionSyncService delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "companionSyncService:typeForSession:", self, v6);

  if (v8 == 1)
  {
    v9 = (_QWORD *)MEMORY[0x1E0D133F8];
    goto LABEL_5;
  }
  if (v8 == 2)
  {
    v9 = (_QWORD *)MEMORY[0x1E0D13400];
LABEL_5:
    objc_msgSend(v10, "setReason:", *v9);
  }

}

- (BOOL)service:(id)a3 startSession:(id)a4 error:(id *)a5
{
  id v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  char v13;
  VCCompanionSyncIncomingSession *v14;
  void *v15;
  VCCompanionSyncIncomingSession *v16;
  void *v17;
  void *v18;
  BOOL v19;
  _BOOL4 v20;
  _BOOL4 v21;
  const char *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  char v34;
  id v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  NSObject *v48;
  objc_class *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  uint64_t v55;
  VCCompanionSyncOutgoingSession *v56;
  void *v57;
  void *v58;
  VCCompanionSyncOutgoingSession *v59;
  void *v60;
  id v61;
  NSObject *v62;
  NSObject *v63;
  const char *v64;
  NSObject *v65;
  os_log_type_t v66;
  uint32_t v67;
  void *v68;
  SEL v69;
  id *v70;
  id v71;
  VCCompanionSyncService *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint8_t buf[4];
  const char *v88;
  __int16 v89;
  uint64_t v90;
  __int16 v91;
  void *v92;
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[VCCompanionSyncService resetSession](self, "resetSession");
  v9 = -[VCCompanionSyncService isRunningOnWatch](self, "isRunningOnWatch");
  if (v9 == objc_msgSend(v8, "isSending"))
  {
    v20 = -[VCCompanionSyncService isRunningOnWatch](self, "isRunningOnWatch");
    getWFWatchSyncLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v20)
    {
      if (v21)
      {
        *(_DWORD *)buf = 136315138;
        v88 = "-[VCCompanionSyncService service:startSession:error:]";
        v22 = "%s Ignoring sending session from watch; we have nothing to send";
LABEL_11:
        _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_DEFAULT, v22, buf, 0xCu);
      }
    }
    else if (v21)
    {
      *(_DWORD *)buf = 136315138;
      v88 = "-[VCCompanionSyncService service:startSession:error:]";
      v22 = "%s Ignoring receiving session from phone; we have nothing to receive";
      goto LABEL_11;
    }
LABEL_18:
    v19 = 0;
    goto LABEL_19;
  }
  -[VCCompanionSyncService updateCurrentSyncServiceIfNecessary](self, "updateCurrentSyncServiceIfNecessary");
  -[VCCompanionSyncService updateSyncDataHandlers](self, "updateSyncDataHandlers");
  -[VCCompanionSyncService currentSyncService](self, "currentSyncService");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    getWFWatchSyncLogObject();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v88 = "-[VCCompanionSyncService service:startSession:error:]";
      _os_log_impl(&dword_1C146A000, v23, OS_LOG_TYPE_FAULT, "%s Not starting sync because the target device is unknown", buf, 0xCu);
    }

    v11 = 0;
    goto LABEL_18;
  }
  v11 = v10;
  -[VCCompanionSyncService delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "companionSyncServiceShouldStartSession:", self);

  if ((v13 & 1) == 0)
  {
    getWFWatchSyncLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      -[VCCompanionSyncService delegate](self, "delegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v88 = "-[VCCompanionSyncService service:startSession:error:]";
      v89 = 2114;
      v90 = (uint64_t)v25;
      _os_log_impl(&dword_1C146A000, v24, OS_LOG_TYPE_INFO, "%s Not starting sync the %{public}@ returned NO", buf, 0x16u);

    }
    goto LABEL_18;
  }
  if (!-[VCCompanionSyncService isRunningOnWatch](self, "isRunningOnWatch"))
  {
    v69 = a2;
    v70 = a5;
    v71 = v8;
    v72 = self;
    if (objc_msgSend(v8, "isResetSync"))
    {
      getWFWatchSyncLogObject();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v88 = "-[VCCompanionSyncService service:startSession:error:]";
        v89 = 2114;
        v90 = (uint64_t)v11;
        _os_log_impl(&dword_1C146A000, v27, OS_LOG_TYPE_DEFAULT, "%s Clearing sync state for service %{public}@", buf, 0x16u);
      }

      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      -[VCCompanionSyncService currentDataHandlers](self, "currentDataHandlers");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v84;
        do
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v84 != v31)
              objc_enumerationMutation(v28);
            v33 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
            v82 = 0;
            v34 = objc_msgSend(v33, "resetSyncStateForService:error:", v11, &v82);
            v35 = v82;
            if ((v34 & 1) == 0)
            {
              getWFWatchSyncLogObject();
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 136315394;
                v88 = "-[VCCompanionSyncService service:startSession:error:]";
                v89 = 2112;
                v90 = (uint64_t)v35;
                _os_log_impl(&dword_1C146A000, v36, OS_LOG_TYPE_FAULT, "%s Error removing sync state: %@", buf, 0x16u);
              }

            }
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
        }
        while (v30);
      }

    }
    v74 = (void *)objc_opt_new();
    v75 = (void *)objc_opt_new();
    v73 = (void *)objc_opt_new();
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    -[VCCompanionSyncService currentDataHandlers](self, "currentDataHandlers");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v78, v93, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v79;
      do
      {
        v41 = 0;
        do
        {
          if (*(_QWORD *)v79 != v40)
            objc_enumerationMutation(v37);
          v42 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v41);
          v76 = 0;
          v77 = 0;
          objc_msgSend(v42, "unsyncedChangesForSyncService:metadata:error:", v11, &v77, &v76);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v77;
          v45 = v76;
          v46 = v45;
          if (v44)
          {
            if ((objc_msgSend(MEMORY[0x1E0CB38B0], "propertyList:isValidForFormat:", v44, 200) & 1) != 0)
            {
              if (!v46)
                goto LABEL_43;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", v69, v72, CFSTR("VCCompanionSyncService.m"), 244, CFSTR("Metadata dictionary must be serializable to a property list file"));

              if (!v46)
              {
LABEL_43:
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_opt_class(), "messageType"));
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v74, "setObject:forKey:", v44, v47);

LABEL_48:
                if (v43)
                  objc_msgSend(v73, "addObjectsFromArray:", v43);
                goto LABEL_50;
              }
            }
          }
          else if (!v45)
          {
            goto LABEL_48;
          }
          getWFWatchSyncLogObject();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
          {
            v49 = (objc_class *)objc_opt_class();
            NSStringFromClass(v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v88 = "-[VCCompanionSyncService service:startSession:error:]";
            v89 = 2114;
            v90 = (uint64_t)v50;
            v91 = 2112;
            v92 = v46;
            _os_log_impl(&dword_1C146A000, v48, OS_LOG_TYPE_FAULT, "%s Error getting unsynced changes from %{public}@: %@", buf, 0x20u);

          }
          objc_msgSend(v75, "addObject:", v46);
LABEL_50:

          ++v41;
        }
        while (v39 != v41);
        v52 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v78, v93, 16);
        v39 = v52;
      }
      while (v52);
    }

    v53 = objc_msgSend(v73, "count");
    v19 = v53 != 0;
    if (v53)
    {
      getWFWatchSyncLogObject();
      v54 = objc_claimAutoreleasedReturnValue();
      v8 = v71;
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        v55 = objc_msgSend(v73, "count");
        *(_DWORD *)buf = 136315394;
        v88 = "-[VCCompanionSyncService service:startSession:error:]";
        v89 = 2048;
        v90 = v55;
        _os_log_impl(&dword_1C146A000, v54, OS_LOG_TYPE_DEFAULT, "%s Got %lu changes to send", buf, 0x16u);
      }

      v56 = [VCCompanionSyncOutgoingSession alloc];
      -[VCCompanionSyncService currentDataHandlers](v72, "currentDataHandlers");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v74;
      v59 = -[VCCompanionSyncOutgoingSession initWithSYSession:service:syncDataHandlers:changeSet:metadata:](v56, "initWithSYSession:service:syncDataHandlers:changeSet:metadata:", v71, v11, v57, v73, v74);
      -[VCCompanionSyncService setCurrentSession:](v72, "setCurrentSession:", v59);

      -[VCCompanionSyncService currentSession](v72, "currentSession");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "setDelegate:", v72);

      -[VCCompanionSyncService currentSession](v72, "currentSession");
      v61 = (id)objc_claimAutoreleasedReturnValue();
      -[VCCompanionSyncService configureReasonForUnderlyingSession:withSession:](v72, "configureReasonForUnderlyingSession:withSession:", v71, v61);
LABEL_67:

      goto LABEL_19;
    }
    objc_msgSend(v75, "firstObject");
    v61 = (id)objc_claimAutoreleasedReturnValue();
    getWFWatchSyncLogObject();
    v62 = objc_claimAutoreleasedReturnValue();
    v63 = v62;
    v8 = v71;
    if (v61)
    {
      if (!os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
        goto LABEL_65;
      *(_DWORD *)buf = 136315394;
      v88 = "-[VCCompanionSyncService service:startSession:error:]";
      v89 = 2112;
      v90 = (uint64_t)v61;
      v64 = "%s Error getting any changes to sync: %@";
      v65 = v63;
      v66 = OS_LOG_TYPE_FAULT;
      v67 = 22;
    }
    else
    {
      if (!os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        goto LABEL_65;
      *(_DWORD *)buf = 136315138;
      v88 = "-[VCCompanionSyncService service:startSession:error:]";
      v64 = "%s No changes to sync";
      v65 = v63;
      v66 = OS_LOG_TYPE_DEFAULT;
      v67 = 12;
    }
    _os_log_impl(&dword_1C146A000, v65, v66, v64, buf, v67);
LABEL_65:

    -[VCCompanionSyncService delegate](v72, "delegate");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "companionSyncService:didRejectSessionWithError:", v72, v61);

    v58 = v74;
    if (v70)
    {
      v61 = objc_retainAutorelease(v61);
      *v70 = v61;
    }
    goto LABEL_67;
  }
  v14 = [VCCompanionSyncIncomingSession alloc];
  -[VCCompanionSyncService currentDataHandlers](self, "currentDataHandlers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[VCCompanionSyncSession initWithSYSession:service:syncDataHandlers:](v14, "initWithSYSession:service:syncDataHandlers:", v8, v11, v15);
  -[VCCompanionSyncService setCurrentSession:](self, "setCurrentSession:", v16);

  -[VCCompanionSyncService currentSession](self, "currentSession");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDelegate:", self);

  -[VCCompanionSyncService currentSession](self, "currentSession");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCCompanionSyncService configureReasonForUnderlyingSession:withSession:](self, "configureReasonForUnderlyingSession:withSession:", v8, v18);

  v19 = 1;
LABEL_19:

  return v19;
}

- (void)service:(id)a3 encounteredError:(id)a4 context:(id)a5
{
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  getWFWatchSyncLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = 136315394;
    v8 = "-[VCCompanionSyncService service:encounteredError:context:]";
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_ERROR, "%s CompanionSync service encountered error: %{public}@", (uint8_t *)&v7, 0x16u);
  }

}

- (void)service:(id)a3 willSwitchFromPairingID:(id)a4 toPairingID:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  getWFWatchSyncLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = 136315650;
    v11 = "-[VCCompanionSyncService service:willSwitchFromPairingID:toPairingID:]";
    v12 = 2114;
    v13 = v7;
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_INFO, "%s CompanionSync will switch from %{public}@ to %{public}@", (uint8_t *)&v10, 0x20u);
  }

  -[VCCompanionSyncService resetSession](self, "resetSession");
}

- (void)service:(id)a3 didSwitchFromPairingID:(id)a4 toPairingID:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  VCNRDeviceSyncService *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  getWFWatchSyncLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v13 = 136315650;
    v14 = "-[VCCompanionSyncService service:didSwitchFromPairingID:toPairingID:]";
    v15 = 2114;
    v16 = v7;
    v17 = 2114;
    v18 = v8;
    _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_INFO, "%s CompanionSync did switch from %{public}@ to %{public}@", (uint8_t *)&v13, 0x20u);
  }

  if (v8
    && (objc_msgSend(MEMORY[0x1E0D51840], "sharedInstance"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "deviceForPairingID:", v8),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v11))
  {
    v12 = -[VCNRDeviceSyncService initWithCompanionSyncService:device:]([VCNRDeviceSyncService alloc], "initWithCompanionSyncService:device:", self, v11);
    -[VCCompanionSyncService setCurrentSyncService:](self, "setCurrentSyncService:", v12);

  }
  else
  {
    -[VCCompanionSyncService setCurrentSyncService:](self, "setCurrentSyncService:", 0);
  }
  -[VCCompanionSyncService requestSyncImmediately](self, "requestSyncImmediately");

}

- (void)companionSyncSession:(id)a3 didFinishWithError:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  NSObject *v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  __CFString *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend((id)objc_opt_class(), "direction");
  v9 = CFSTR("Outgoing");
  if (v8 == 1)
    v9 = CFSTR("Incoming");
  v10 = v9;
  getWFWatchSyncLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v7)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v24 = "-[VCCompanionSyncService companionSyncSession:didFinishWithError:]";
      v25 = 2114;
      v26 = v10;
      v27 = 2114;
      v28 = v6;
      v29 = 2114;
      v30 = v7;
      v13 = "%s %{public}@ session=%{public}@ finished with error: %{public}@";
      v14 = v12;
      v15 = OS_LOG_TYPE_ERROR;
      v16 = 42;
LABEL_8:
      _os_log_impl(&dword_1C146A000, v14, v15, v13, buf, v16);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v24 = "-[VCCompanionSyncService companionSyncSession:didFinishWithError:]";
    v25 = 2114;
    v26 = v10;
    v27 = 2114;
    v28 = v6;
    v13 = "%s %{public}@ session=%{public}@ finished successfully";
    v14 = v12;
    v15 = OS_LOG_TYPE_DEBUG;
    v16 = 32;
    goto LABEL_8;
  }

  -[VCCompanionSyncService queue](self, "queue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__VCCompanionSyncService_companionSyncSession_didFinishWithError___block_invoke;
  block[3] = &unk_1E7AA82B0;
  block[4] = self;
  v21 = v6;
  v22 = v7;
  v18 = v7;
  v19 = v6;
  dispatch_async(v17, block);

}

- (void)companionSyncSessionDidFinishSendingChanges:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VCCompanionSyncService delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "companionSyncService:outgoingSyncSessionDidFinishSendingChanges:", self, v4);

}

- (void)companionSyncSession:(id)a3 didUpdateProgress:(double)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[VCCompanionSyncService delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "companionSyncService:outgoingSyncSession:didUpdateProgress:", self, v6, a4);

}

- (VCCompanionSyncServiceDelegate)delegate
{
  return (VCCompanionSyncServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SYService)service
{
  return self->_service;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (VCSyncDataEndpoint)syncDataEndpoint
{
  return self->_syncDataEndpoint;
}

- (WFDebouncer)debouncer
{
  return self->_debouncer;
}

- (NSSet)currentDataHandlers
{
  return self->_currentDataHandlers;
}

- (void)setCurrentDataHandlers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (VCCompanionSyncSession)currentSession
{
  return self->_currentSession;
}

- (void)setCurrentSession:(id)a3
{
  objc_storeStrong((id *)&self->_currentSession, a3);
}

- (VCNRDeviceSyncService)currentSyncService
{
  return self->_currentSyncService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSyncService, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_currentDataHandlers, 0);
  objc_storeStrong((id *)&self->_debouncer, 0);
  objc_storeStrong((id *)&self->_syncDataEndpoint, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __66__VCCompanionSyncService_companionSyncSession_didFinishWithError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "resetSession");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "companionSyncService:didFinishSyncSession:withError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __51__VCCompanionSyncService_initWithSyncDataEndpoint___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateCurrentSyncServiceIfNecessary");
}

@end
