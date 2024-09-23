@implementation BRCSyncContext

- (void)addForegroundClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BRCSyncContext *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v11;
  BRCSyncContext *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_isShared)
  {
    -[BRCAccountSessionFPFS syncContextProvider](self->_session, "syncContextProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sideCarSyncContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addForegroundClient:", v4);

  }
  v7 = self;
  objc_sync_enter(v7);
  v8 = -[NSMutableSet count](v7->_foregroundClients, "count");
  -[NSMutableSet addObject:](v7->_foregroundClients, "addObject:", v4);
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412802;
    v12 = v7;
    v13 = 2112;
    v14 = v4;
    v15 = 2112;
    v16 = v9;
    _os_log_debug_impl(&dword_230455000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - Added %@ as a foreground client%@", (uint8_t *)&v11, 0x20u);
  }

  if (!v8)
    -[BRCSyncContext _notifyContainerBeingNowForeground](v7, "_notifyContainerBeingNowForeground");
  objc_sync_exit(v7);

}

- (BOOL)isForeground
{
  BRCSyncContext *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_foregroundState
    || -[NSMutableSet count](v2->_foregroundClients, "count")
    || v2->_timerForGraceForegroundPeriod != 0;
  objc_sync_exit(v2);

  return v3;
}

+ (id)_contextIdentifierForMangledID:(id)a3 metadata:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v5 = a3;
  if (objc_msgSend(v5, "isShared"))
  {
    if (v4)
    {
      v6 = (id)*MEMORY[0x24BE17590];
    }
    else
    {
      objc_msgSend(v5, "aliasTargetContainerString");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_9;
  }
  if (!v4 || !objc_msgSend(v5, "isCloudDocsMangledID"))
  {
    objc_msgSend(v5, "appLibraryOrZoneName");
    v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v9 = v6;
    goto LABEL_10;
  }
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "appLibraryOrZoneName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@-metadata"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v9;
}

void __63__BRCSyncContext__armForegroundGraceTimerForClientDescription___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  int64_t v12;
  dispatch_time_t v13;
  NSObject *v14;
  _QWORD *v15;
  NSObject *v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  dispatch_block_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  float v26;
  _QWORD v27[4];
  id v28;
  _BYTE location[12];
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  double v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[7])
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __63__BRCSyncContext__armForegroundGraceTimerForClientDescription___block_invoke_cold_1();

    dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 56));
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;

    v2 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v2, "defaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "foregroundGracePeriod");
  v8 = v7;

  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v24 = *(_QWORD *)(a1 + 32);
    v25 = *(_QWORD *)(a1 + 40);
    v26 = v8;
    *(_DWORD *)location = 138413058;
    *(_QWORD *)&location[4] = v24;
    v30 = 2112;
    v31 = v25;
    v32 = 2048;
    v33 = v26;
    v34 = 2112;
    v35 = v9;
    _os_log_debug_impl(&dword_230455000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] beginning foreground grace period for %@ from %@ for %.1fs%@", location, 0x2Au);
  }

  v11 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 72));
  v12 = brc_interval_to_nsec();
  v13 = dispatch_time(0, v12);
  dispatch_source_set_timer(v11, v13, 0xFFFFFFFFFFFFFFFFLL, 0);
  objc_initWeak((id *)location, *(id *)(a1 + 32));
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __63__BRCSyncContext__armForegroundGraceTimerForClientDescription___block_invoke_73;
  v27[3] = &unk_24FE3F9C8;
  objc_copyWeak(&v28, (id *)location);
  v14 = v11;
  v15 = v27;
  v16 = v14;
  v17 = v15;
  v18 = v17;
  v19 = v17;
  if (*MEMORY[0x24BE17840])
  {
    ((void (*)(_QWORD *))*MEMORY[0x24BE17840])(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v20 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v19);
  dispatch_source_set_event_handler(v16, v20);

  v21 = *(_QWORD *)(a1 + 32);
  v22 = *(void **)(v21 + 56);
  *(_QWORD *)(v21 + 56) = v16;
  v23 = v16;

  dispatch_resume(v23);
  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)location);
}

void __52__BRCSyncContext__notifyContainerBeingNowForeground__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = (_QWORD *)(a1 + 32);
  v1 = *(_QWORD **)(a1 + 32);
  if (v1[7])
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __52__BRCSyncContext__notifyContainerBeingNowForeground__block_invoke_cold_1(v2);

    dispatch_source_cancel(*(dispatch_source_t *)(*v2 + 56));
    v5 = *(void **)(*v2 + 56);
    *(_QWORD *)(*v2 + 56) = 0;

    v1 = (_QWORD *)*v2;
  }
  v6 = v1;
  objc_sync_enter(v6);
  v7 = *(_QWORD *)(*v2 + 80);
  objc_sync_exit(v6);

  if (!v7)
  {
    objc_msgSend((id)*v2, "_notifyFrameworkContainersMonitorWithState:", 1);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*v2 + 120), "personaIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    BRPersonaSpecificName();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:userInfo:", v10, *v2, 0);

  }
}

- (void)removeForegroundClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BRCSyncContext *v8;
  void *v9;
  NSObject *v10;
  int v11;
  BRCSyncContext *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_isShared)
  {
    -[BRCAccountSessionFPFS syncContextProvider](self->_session, "syncContextProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sideCarSyncContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeForegroundClient:", v4);

  }
  v8 = self;
  objc_sync_enter(v8);
  if ((-[NSMutableSet containsObject:](v8->_foregroundClients, "containsObject:", v4) & 1) != 0)
  {
    -[NSMutableSet removeObject:](v8->_foregroundClients, "removeObject:", v4);
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = 138412802;
      v12 = v8;
      v13 = 2112;
      v14 = v4;
      v15 = 2112;
      v16 = v9;
      _os_log_debug_impl(&dword_230455000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - Removed %@ as a foreground client%@", (uint8_t *)&v11, 0x20u);
    }

    if (!(v8->_foregroundState | -[NSMutableSet count](v8->_foregroundClients, "count")))
      -[BRCSyncContext _armForegroundGraceTimerForClientDescription:](v8, "_armForegroundGraceTimerForClientDescription:", v5);
  }
  objc_sync_exit(v8);

}

- (BOOL)isShared
{
  return self->_isShared;
}

- (BRCUserDefaults)defaults
{
  void *v2;
  void *v3;

  if (self->_isShared)
  {
    +[BRCUserDefaults defaultsForSharedZone](BRCUserDefaults, "defaultsForSharedZone");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE17640]), "initWithAppLibraryName:", self->_contextIdentifier);
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (BRCUserDefaults *)v2;
}

- (NSString)contextIdentifier
{
  return self->_contextIdentifier;
}

- (void)_notifyFrameworkContainersMonitorWithState:(BOOL)a3
{
  void *v4;
  BRCSyncContext *v5;
  NSString *v6;

  v6 = self->_contextIdentifier;
  BRNotifyNameForForegroundChangeWithContainerID();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_notifyTokenForFramework != -1
    || (objc_msgSend(objc_retainAutorelease(v4), "UTF8String"), !brc_notify_register_check()))
  {
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    brc_notify_set_state_and_post();
  }
  objc_sync_exit(v5);

}

- (void)_notifyContainerBeingNowForeground
{
  OS_dispatch_queue *foregroundStateQueue;
  _QWORD v3[5];

  foregroundStateQueue = self->_foregroundStateQueue;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __52__BRCSyncContext__notifyContainerBeingNowForeground__block_invoke;
  v3[3] = &unk_24FE3FA18;
  v3[4] = self;
  dispatch_async_with_logs_12(foregroundStateQueue, v3);
}

- (void)_armForegroundGraceTimerForClientDescription:(id)a3
{
  id v5;
  BRCSyncContext *v6;
  uint64_t v7;
  NSDate *dateWhenLastForegroundClientLeft;
  OS_dispatch_queue *foregroundStateQueue;
  id v10;
  _QWORD v11[5];
  id v12;

  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  objc_storeStrong((id *)&v6->_lastForegroundClientDescription, a3);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = objc_claimAutoreleasedReturnValue();
  dateWhenLastForegroundClientLeft = v6->_dateWhenLastForegroundClientLeft;
  v6->_dateWhenLastForegroundClientLeft = (NSDate *)v7;

  foregroundStateQueue = v6->_foregroundStateQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __63__BRCSyncContext__armForegroundGraceTimerForClientDescription___block_invoke;
  v11[3] = &unk_24FE3FA40;
  v11[4] = v6;
  v10 = v5;
  v12 = v10;
  dispatch_async_with_logs_12(foregroundStateQueue, v11);

  objc_sync_exit(v6);
}

- (BRCSessionContext)sessionContext
{
  return (BRCSessionContext *)self->_session;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSString *contextIdentifier;
  _BOOL4 v6;
  const __CFString *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  contextIdentifier = self->_contextIdentifier;
  v6 = -[BRCSyncContext isForeground](self, "isForeground");
  v7 = CFSTR("background");
  if (v6)
    v7 = CFSTR("foreground");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %@ %p %@>"), v4, contextIdentifier, self, v7);
}

+ (id)transferContextForServerZone:(id)a3 appLibrary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isSharedZone") & 1) != 0)
  {
    objc_msgSend(v5, "asSharedZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transferSyncContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "transferSyncContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BRCSyncContext)initWithSession:(id)a3 contextIdentifier:(id)a4 isShared:(BOOL)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  BRCSyncContext *v19;
  BRCSyncContext *v20;
  id *p_session;
  void *v22;
  BRCThrottleBase *v23;
  void *v24;
  uint64_t v25;
  BRCThrottleBase *readerThrottle;
  BRCThrottleBase *v27;
  void *v28;
  uint64_t v29;
  BRCThrottleBase *applyThrottle;
  BRCThrottleBase *v31;
  void *v32;
  uint64_t v33;
  BRCThrottleBase *downloadThrottle;
  BRCThrottleBase *v35;
  void *v36;
  uint64_t v37;
  BRCThrottleBase *uploadThrottle;
  BRCThrottleBase *v39;
  void *v40;
  uint64_t v41;
  BRCThrottleBase *uploadFileModifiedThrottle;
  BRCThrottleBase *v43;
  void *v44;
  uint64_t v45;
  BRCThrottleBase *perItemSyncUpThrottle;
  NSOperationQueue *v47;
  NSOperationQueue *discretionaryRecursiveListOperationQueue;
  NSOperationQueue *v49;
  NSOperationQueue *nonDiscretionaryRecursiveListOperationQueue;
  void *v51;
  BRCTransferStream *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  BRCTransferStream *uploadStream;
  uint64_t v57;
  id v58;
  id v59;
  void *v60;
  BRCTransferStream *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  BRCTransferStream *downloadStream;
  id v66;
  NSMutableSet *v67;
  NSMutableSet *foregroundClients;
  NSObject *v69;
  NSObject *v70;
  dispatch_queue_t v71;
  OS_dispatch_queue *foregroundStateQueue;
  uint64_t v73;
  NSHashTable *nonDiscretionaryModifyOperations;
  uint64_t v75;
  NSHashTable *discretionaryModifyOperations;
  _QWORD v78[4];
  id v79;
  id v80;
  id v81;
  _QWORD v82[4];
  id v83;
  id v84;
  id v85;
  id location;
  objc_super v87;

  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "fsUploader");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uploadsDeadlineScheduler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[BRCSyncContext initWithSession:contextIdentifier:isShared:].cold.2(v9);

  }
  objc_msgSend(v9, "fsDownloader");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "downloadsDeadlineScheduler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[BRCSyncContext initWithSession:contextIdentifier:isShared:].cold.1(v9);

  }
  v87.receiver = self;
  v87.super_class = (Class)BRCSyncContext;
  v19 = -[BRCSyncContext init](&v87, sel_init);
  v20 = v19;
  if (v19)
  {
    p_session = (id *)&v19->_session;
    objc_storeStrong((id *)&v19->_session, a3);
    objc_storeStrong((id *)&v20->_contextIdentifier, a4);
    v20->_isShared = a5;
    -[BRCSyncContext defaults](v20, "defaults");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = [BRCThrottleBase alloc];
    objc_msgSend(v22, "readerThrottleParams");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[BRCThrottleBase initWithName:andParameters:](v23, "initWithName:andParameters:", CFSTR("fsreader.coordination.throttle"), v24);
    readerThrottle = v20->_readerThrottle;
    v20->_readerThrottle = (BRCThrottleBase *)v25;

    v27 = [BRCThrottleBase alloc];
    objc_msgSend(v22, "applyThrottleParams");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[BRCThrottleBase initWithName:andParameters:](v27, "initWithName:andParameters:", CFSTR("fswriter.apply.throttle"), v28);
    applyThrottle = v20->_applyThrottle;
    v20->_applyThrottle = (BRCThrottleBase *)v29;

    v31 = [BRCThrottleBase alloc];
    objc_msgSend(v22, "downloadThrottleParams");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[BRCThrottleBase initWithName:andParameters:](v31, "initWithName:andParameters:", CFSTR("transfer.download.throttle"), v32);
    downloadThrottle = v20->_downloadThrottle;
    v20->_downloadThrottle = (BRCThrottleBase *)v33;

    v35 = [BRCThrottleBase alloc];
    objc_msgSend(v22, "uploadThrottleParams");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[BRCThrottleBase initWithName:andParameters:](v35, "initWithName:andParameters:", CFSTR("transfer.upload.throttle"), v36);
    uploadThrottle = v20->_uploadThrottle;
    v20->_uploadThrottle = (BRCThrottleBase *)v37;

    v39 = [BRCThrottleBase alloc];
    objc_msgSend(v22, "uploadFileModifiedThrottleParams");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[BRCThrottleBase initWithName:andParameters:](v39, "initWithName:andParameters:", CFSTR("transfer.upload.file-modified.throttle"), v40);
    uploadFileModifiedThrottle = v20->_uploadFileModifiedThrottle;
    v20->_uploadFileModifiedThrottle = (BRCThrottleBase *)v41;

    v43 = [BRCThrottleBase alloc];
    objc_msgSend(v22, "perItemSyncUpThrottleParams");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = -[BRCThrottleBase initWithName:andParameters:](v43, "initWithName:andParameters:", CFSTR("transfer.upload.throttle"), v44);
    perItemSyncUpThrottle = v20->_perItemSyncUpThrottle;
    v20->_perItemSyncUpThrottle = (BRCThrottleBase *)v45;

    v47 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    discretionaryRecursiveListOperationQueue = v20->_discretionaryRecursiveListOperationQueue;
    v20->_discretionaryRecursiveListOperationQueue = v47;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v20->_discretionaryRecursiveListOperationQueue, "setMaxConcurrentOperationCount:", (int)objc_msgSend(v22, "discretionaryRecursiveListMaxOperationCount"));
    v49 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    nonDiscretionaryRecursiveListOperationQueue = v20->_nonDiscretionaryRecursiveListOperationQueue;
    v20->_nonDiscretionaryRecursiveListOperationQueue = v49;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v20->_nonDiscretionaryRecursiveListOperationQueue, "setMaxConcurrentOperationCount:", (int)objc_msgSend(v22, "nonDiscretionaryRecursiveListMaxOperationCount"));
    objc_initWeak(&location, v20);
    -[NSString stringByAppendingPathComponent:](v20->_contextIdentifier, "stringByAppendingPathComponent:", CFSTR("uploader"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = [BRCTransferStream alloc];
    objc_msgSend(*p_session, "fsUploader");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "uploadsDeadlineScheduler");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = -[BRCTransferStream initWithSyncContext:name:scheduler:maxCountOfBatchesInFlight:](v52, "initWithSyncContext:name:scheduler:maxCountOfBatchesInFlight:", v20, v51, v54, objc_msgSend(v22, "uploadBatchCount"));
    uploadStream = v20->_uploadStream;
    v20->_uploadStream = (BRCTransferStream *)v55;

    v57 = MEMORY[0x24BDAC760];
    v82[0] = MEMORY[0x24BDAC760];
    v82[1] = 3221225472;
    v82[2] = __61__BRCSyncContext_initWithSession_contextIdentifier_isShared___block_invoke;
    v82[3] = &unk_24FE49158;
    objc_copyWeak(&v85, &location);
    v58 = v22;
    v83 = v58;
    v59 = v9;
    v84 = v59;
    -[BRCTransferStream setStreamDidBecomeReadyToTransferRecords:](v20->_uploadStream, "setStreamDidBecomeReadyToTransferRecords:", v82);
    -[NSString stringByAppendingPathComponent:](v20->_contextIdentifier, "stringByAppendingPathComponent:", CFSTR("downloader"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    v61 = [BRCTransferStream alloc];
    objc_msgSend(*p_session, "fsDownloader");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "downloadsDeadlineScheduler");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = -[BRCTransferStream initWithSyncContext:name:scheduler:maxCountOfBatchesInFlight:](v61, "initWithSyncContext:name:scheduler:maxCountOfBatchesInFlight:", v20, v60, v63, objc_msgSend(v58, "downloadBatchCount"));
    downloadStream = v20->_downloadStream;
    v20->_downloadStream = (BRCTransferStream *)v64;

    v78[0] = v57;
    v78[1] = 3221225472;
    v78[2] = __61__BRCSyncContext_initWithSession_contextIdentifier_isShared___block_invoke_30;
    v78[3] = &unk_24FE49158;
    objc_copyWeak(&v81, &location);
    v66 = v58;
    v79 = v66;
    v80 = v59;
    -[BRCTransferStream setStreamDidBecomeReadyToTransferRecords:](v20->_downloadStream, "setStreamDidBecomeReadyToTransferRecords:", v78);
    v20->_notifyTokenForFramework = -1;
    v67 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    foregroundClients = v20->_foregroundClients;
    v20->_foregroundClients = v67;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v69 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v69, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v70 = objc_claimAutoreleasedReturnValue();
    v71 = dispatch_queue_create("com.apple.bird.foreground.state", v70);

    foregroundStateQueue = v20->_foregroundStateQueue;
    v20->_foregroundStateQueue = (OS_dispatch_queue *)v71;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v73 = objc_claimAutoreleasedReturnValue();
    nonDiscretionaryModifyOperations = v20->_nonDiscretionaryModifyOperations;
    v20->_nonDiscretionaryModifyOperations = (NSHashTable *)v73;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v75 = objc_claimAutoreleasedReturnValue();
    discretionaryModifyOperations = v20->_discretionaryModifyOperations;
    v20->_discretionaryModifyOperations = (NSHashTable *)v75;

    objc_destroyWeak(&v81);
    objc_destroyWeak(&v85);
    objc_destroyWeak(&location);

  }
  return v20;
}

void __61__BRCSyncContext_initWithSession_contextIdentifier_isShared___block_invoke(id *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15[3];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v9 = objc_msgSend(a1[4], "uploadBatchRecordsCount");
  memset(v15, 0, sizeof(v15));
  __brc_create_section(0, (uint64_t)"-[BRCSyncContext initWithSession:contextIdentifier:isShared:]_block_invoke", 185, v15);
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v13 = v15[0];
    +[BRCDumpContext stringFromByteCount:context:](BRCDumpContext, "stringFromByteCount:context:", a2, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219266;
    v17 = v13;
    v18 = 2112;
    v19 = WeakRetained;
    v20 = 2048;
    v21 = v9;
    v22 = 2112;
    v23 = v14;
    v24 = 2048;
    v25 = a3;
    v26 = 2112;
    v27 = v10;
    _os_log_debug_impl(&dword_230455000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Uploader: preparing next batch for %@ (max-count:%ld size:%@ priority:%ld)%@", buf, 0x3Eu);

  }
  objc_msgSend(a1[5], "fsUploader");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transferStreamOfSyncContext:didBecomeReadyWithMaxRecordsCount:sizeHint:priority:completionBlock:", WeakRetained, v9, a2, a3, v7);

  __brc_leave_section(v15);
}

void __61__BRCSyncContext_initWithSession_contextIdentifier_isShared___block_invoke_30(id *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15[3];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v9 = objc_msgSend(a1[4], "downloadBatchRecordsCount");
  memset(v15, 0, sizeof(v15));
  __brc_create_section(0, (uint64_t)"-[BRCSyncContext initWithSession:contextIdentifier:isShared:]_block_invoke", 201, v15);
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v13 = v15[0];
    +[BRCDumpContext stringFromByteCount:context:](BRCDumpContext, "stringFromByteCount:context:", a2, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219266;
    v17 = v13;
    v18 = 2112;
    v19 = WeakRetained;
    v20 = 2048;
    v21 = v9;
    v22 = 2112;
    v23 = v14;
    v24 = 2048;
    v25 = a3;
    v26 = 2112;
    v27 = v10;
    _os_log_debug_impl(&dword_230455000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Downloader: preparing next batch for %@ (max-count:%ld size:%@ priority:%ld)%@", buf, 0x3Eu);

  }
  objc_msgSend(a1[5], "fsDownloader");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transferStreamOfSyncContext:didBecomeReadyWithMaxRecordsCount:sizeHint:priority:completionBlock:", WeakRetained, v9, a2, a3, v7);

  __brc_leave_section(v15);
}

- (void)dealloc
{
  int notifyTokenForFramework;
  objc_super v4;

  notifyTokenForFramework = self->_notifyTokenForFramework;
  if (notifyTokenForFramework != -1)
    notify_cancel(notifyTokenForFramework);
  v4.receiver = self;
  v4.super_class = (Class)BRCSyncContext;
  -[BRCSyncContext dealloc](&v4, sel_dealloc);
}

+ (id)_createCKContainerForAccountID:(id)a3 contextIdentifier:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = (objc_class *)MEMORY[0x24BDB9038];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  v9 = 1;
  v10 = (void *)objc_msgSend(v8, "initWithContainerIdentifier:environment:", *MEMORY[0x24BE17530], 1);
  v11 = (void *)objc_opt_new();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB8FF8]), "initWithAccountID:", v7);

  objc_msgSend(v11, "setAccountOverrideInfo:", v12);
  v13 = (void *)objc_opt_new();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "supportsEnhancedDrivePrivacy");

  if (v15)
  {
    v16 = objc_alloc(MEMORY[0x24BDB9078]);
    v17 = (void *)objc_msgSend(v16, "initWithLevel:name:value:", 2, *MEMORY[0x24BE17390], *MEMORY[0x24BE17398]);
    objc_msgSend(v13, "addObject:", v17);

    v9 = 3;
  }
  objc_msgSend(v11, "setMmcsEncryptionSupport:", v9);
  objc_msgSend(v11, "setSupportedDeviceCapabilities:", v13);
  +[BRCDaemonFPFS daemon](BRCDaemonFPFS, "daemon");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v18, "containerClass")), "initWithContainerID:options:", v10, v11);

  objc_msgSend(v19, "options");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCaptureResponseHTTPHeaders:", 1);

  objc_msgSend(v19, "setSourceApplicationBundleIdentifier:", v6);
  objc_msgSend(v19, "setSourceApplicationSecondaryIdentifier:", *MEMORY[0x24BE17360]);

  return v19;
}

- (void)setupIfNeeded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: [[[UMUserManager sharedManager] br_currentPersonaID] isEqualToString:_session.personaIdentifier]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (CKContainer)ckContainer
{
  -[BRCSyncContext setupIfNeeded](self, "setupIfNeeded");
  return self->_ckContainer;
}

- (CKContainerID)ckContainerID
{
  return (CKContainerID *)-[CKContainer containerID](self->_ckContainer, "containerID");
}

- (id)_database
{
  _BOOL4 isShared;
  CKContainer *ckContainer;

  isShared = self->_isShared;
  ckContainer = self->_ckContainer;
  if (isShared)
    -[CKContainer sharedCloudDatabase](ckContainer, "sharedCloudDatabase");
  else
    -[CKContainer privateCloudDatabase](ckContainer, "privateCloudDatabase");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_preventConcurrentModifyRecordsOperations:(id)a3 nonDiscretionary:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int v8;
  id *p_nonDiscretionaryModifyOperations;
  NSHashTable *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  NSObject *v23;
  NSHashTable *obj;
  id obja;
  BRCSyncContext *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v4 = a4;
  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v26 = self;
  -[BRCSyncContext defaults](self, "defaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "preventConcurrentModifyRecordsOperations");

  if (v8)
  {
    p_nonDiscretionaryModifyOperations = (id *)&v26->_nonDiscretionaryModifyOperations;
    obj = v26->_nonDiscretionaryModifyOperations;
    objc_sync_enter(obj);
    if (v4)
    {
      v33 = 0uLL;
      v34 = 0uLL;
      v31 = 0uLL;
      v32 = 0uLL;
      v10 = v26->_discretionaryModifyOperations;
      v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v32 != v12)
              objc_enumerationMutation(v10);
            v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            if ((objc_msgSend(v14, "isFinished", obj) & 1) == 0)
            {
              brc_bread_crumbs();
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412802;
                v37 = v14;
                v38 = 2112;
                v39 = v6;
                v40 = 2112;
                v41 = v15;
                _os_log_debug_impl(&dword_230455000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] Cancelling discretionary operation %@ to make room for a non discretionary operation %@%@", buf, 0x20u);
              }

              objc_msgSend(v14, "cancel");
              objc_msgSend(v6, "addDependency:", v14);
            }
          }
          v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
        }
        while (v11);
      }

    }
    else
    {
      v29 = 0uLL;
      v30 = 0uLL;
      v27 = 0uLL;
      v28 = 0uLL;
      v17 = *p_nonDiscretionaryModifyOperations;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v28;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v28 != v19)
              objc_enumerationMutation(v17);
            v21 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
            brc_bread_crumbs();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              v37 = v6;
              v38 = 2112;
              v39 = v21;
              v40 = 2112;
              v41 = v22;
              _os_log_debug_impl(&dword_230455000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] Blocking discretionary op %@ on %@%@", buf, 0x20u);
            }

            if ((objc_msgSend(v21, "isFinished") & 1) == 0)
              objc_msgSend(v6, "addDependency:", v21);
          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        }
        while (v18);
      }

      p_nonDiscretionaryModifyOperations = (id *)&v26->_discretionaryModifyOperations;
    }
    objc_msgSend(*p_nonDiscretionaryModifyOperations, "addObject:", v6, obj);
    objc_sync_exit(obja);

  }
}

- (BOOL)allowsCellularAccess
{
  void *v2;
  char v3;

  +[BRCContainerCellularSettings containerCellularSettings](BRCContainerCellularSettings, "containerCellularSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCellularEnabled");

  return v3;
}

- (void)addOperation:(id)a3
{
  -[BRCSyncContext addOperation:allowsCellularAccess:nonDiscretionary:](self, "addOperation:allowsCellularAccess:nonDiscretionary:", a3, 0, 0);
}

- (void)addOperation:(id)a3 allowsCellularAccess:(id)a4
{
  -[BRCSyncContext addOperation:allowsCellularAccess:nonDiscretionary:](self, "addOperation:allowsCellularAccess:nonDiscretionary:", a3, a4, 0);
}

- (void)addOperation:(id)a3 nonDiscretionary:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a4;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a3;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[BRCSyncContext addOperation:allowsCellularAccess:nonDiscretionary:](self, "addOperation:allowsCellularAccess:nonDiscretionary:", v7, 0, v8);

}

- (void)addOperation:(id)a3 allowsCellularAccess:(id)a4 nonDiscretionary:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  CKContainer *ckContainer;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSString *contextIdentifier;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  NSObject *v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  NSObject *v41;
  id v42;
  void *v43;
  int v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  id v52;
  uint8_t buf[4];
  id v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v52 = a5;
  -[BRCSyncContext setupIfNeeded](self, "setupIfNeeded");
  -[BRCSyncContext _database](self, "_database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    brc_bread_crumbs();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
      -[BRCSyncContext addOperation:allowsCellularAccess:nonDiscretionary:].cold.3();

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v8;
    objc_msgSend(v11, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 == 0;

    if (v13)
    {
      v14 = (void *)objc_opt_new();
      objc_msgSend(v11, "setConfiguration:", v14);

    }
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "nsurlsessiondEnabled"))
    {
      v16 = objc_msgSend(v52, "BOOLValue");

      if ((v16 & 1) == 0)
        goto LABEL_10;
    }
    else
    {

    }
    objc_msgSend(v11, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDiscretionaryNetworkBehavior:", 0);

    objc_msgSend(v11, "configuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAutomaticallyRetryNetworkFailures:", 0);

LABEL_10:
    ckContainer = self->_ckContainer;
    objc_msgSend(v11, "configuration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setContainer:", ckContainer);

    if (v9)
      v21 = objc_msgSend(v9, "BOOLValue");
    else
      v21 = -[BRCSyncContext allowsCellularAccess](self, "allowsCellularAccess");
    v22 = v21;
    objc_msgSend(v11, "configuration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAllowsCellularAccess:", v22);

    objc_msgSend(v11, "configuration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v23) = objc_msgSend(v24, "discretionaryNetworkBehavior") == 0;

    if ((_DWORD)v23)
    {
      objc_msgSend(v11, "configuration");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setSourceApplicationBundleIdentifier:", *MEMORY[0x24BE17360]);
    }
    else
    {
      contextIdentifier = self->_contextIdentifier;
      objc_msgSend(v11, "configuration");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setSourceApplicationBundleIdentifier:", contextIdentifier);

      objc_msgSend(v11, "configuration");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setSourceApplicationSecondaryIdentifier:", *MEMORY[0x24BE17360]);

      objc_msgSend(v11, "configuration");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setDiscretionaryNetworkBehavior:", 1);

      objc_msgSend(v11, "configuration");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setAutomaticallyRetryNetworkFailures:", 1);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = v8;
    objc_msgSend(v30, "configuration");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCSyncContext _preventConcurrentModifyRecordsOperations:nonDiscretionary:](self, "_preventConcurrentModifyRecordsOperations:nonDiscretionary:", v30, objc_msgSend(v31, "discretionaryNetworkBehavior") == 0);

  }
  if (self->_isCancelled)
    objc_msgSend(v8, "cancel");
  brc_bread_crumbs();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    -[CKContainer options](self->_ckContainer, "options");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "accountOverrideInfo");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "accountID");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v54 = v8;
    v55 = 2112;
    v56 = v10;
    v57 = 2112;
    v58 = v49;
    v59 = 2112;
    v60 = v32;
    _os_log_debug_impl(&dword_230455000, v33, OS_LOG_TYPE_DEBUG, "[DEBUG] scheduling %@ on %@ (account %@)%@", buf, 0x2Au);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "group");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34 == 0;

    if (v35)
    {
      brc_bread_crumbs();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
        -[BRCSyncContext addOperation:allowsCellularAccess:nonDiscretionary:].cold.1((uint64_t)v8);

    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "group");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38 == 0;

    if (v39)
    {
      brc_bread_crumbs();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
        -[BRCSyncContext addOperation:allowsCellularAccess:nonDiscretionary:].cold.1((uint64_t)v8);

    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v42 = v8;
    -[BRCAccountSessionFPFS accountWaitOperation](self->_session, "accountWaitOperation");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
      objc_msgSend(v42, "addDependency:", v43);
    objc_msgSend(v10, "addOperation:", v42);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v44 = objc_msgSend(v8, "nonDiscretionary");
      v45 = 112;
      if (v44)
        v45 = 104;
      objc_msgSend(*(id *)((char *)&self->super.isa + v45), "addOperation:", v8);
    }
    else
    {
      objc_msgSend(v10, "operationQueue");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addOperation:", v8);

    }
  }

}

- (void)resume
{
  void *v3;
  void *v4;
  int v5;

  -[BRCSyncContext contextIdentifier](self, "contextIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE17498]))
  {

LABEL_4:
    self->_foregroundState = 2;
    -[BRCSyncContext _notifyFrameworkContainersMonitorWithState:](self, "_notifyFrameworkContainersMonitorWithState:", 1);
    goto LABEL_5;
  }
  -[BRCSyncContext contextIdentifier](self, "contextIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE17540]);

  if (v5)
    goto LABEL_4;
LABEL_5:
  -[BRCTransferStream resume](self->_uploadStream, "resume");
  -[BRCTransferStream resume](self->_downloadStream, "resume");
}

- (void)cancel
{
  void *v3;
  id v4;

  self->_isCancelled = 1;
  -[BRCTransferStream cancel](self->_downloadStream, "cancel");
  -[BRCTransferStream cancel](self->_uploadStream, "cancel");
  -[BRCSyncContext _database](self, "_database");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAllOperations");

}

- (void)close
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _isCancelled%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __23__BRCSyncContext_close__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 56);
  if (v3)
  {
    dispatch_source_cancel(v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 56);
    *(_QWORD *)(v4 + 56) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  v6 = *(NSObject **)(v2 + 64);
  if (v6)
  {
    dispatch_source_cancel(v6);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 64);
    *(_QWORD *)(v7 + 64) = 0;

  }
}

- (void)dumpToContext:(id)a3
{
  id v4;
  BRCSyncContext *v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSDate *dateWhenLastForegroundClientLeft;
  NSString *lastForegroundClientDescription;
  double v14;
  unint64_t foregroundState;
  const __CFString *v16;
  BRCSyncContext *obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  obj = v5;
  if (-[NSMutableSet count](v5->_foregroundClients, "count") || v5->_dateWhenLastForegroundClientLeft)
  {
    objc_msgSend(v4, "writeLineWithFormat:", CFSTR("+ foreground clients:"));
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = v5->_foregroundClients;
    v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v10, "identifier");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "writeLineWithFormat:", CFSTR("   o %@ [zone]"), v11);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v10, "identifier");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "writeLineWithFormat:", CFSTR("   o %@ [appLib]"), v11);
            }
            else
            {
              objc_msgSend(v10, "identifier");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "writeLineWithFormat:", CFSTR("   o %@"), v11);
            }
          }

        }
        v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }

    dateWhenLastForegroundClientLeft = v5->_dateWhenLastForegroundClientLeft;
    if (dateWhenLastForegroundClientLeft)
    {
      lastForegroundClientDescription = v5->_lastForegroundClientDescription;
      -[NSDate timeIntervalSinceNow](dateWhenLastForegroundClientLeft, "timeIntervalSinceNow");
      objc_msgSend(v4, "writeLineWithFormat:", CFSTR("   o %@ [grace period] disconnected %.1fs ago"), lastForegroundClientDescription, -v14);
    }
  }
  foregroundState = obj->_foregroundState;
  if (foregroundState == 1)
  {
    v16 = CFSTR("   o forced foreground");
    goto LABEL_21;
  }
  if (foregroundState == 2)
  {
    v16 = CFSTR("   o always foreground");
LABEL_21:
    objc_msgSend(v4, "writeLineWithFormat:", v16);
  }
  objc_sync_exit(obj);

}

- (void)forceContainerForegroundForDuration:(double)a3
{
  NSObject *foregroundStateQueue;
  _QWORD v4[6];

  foregroundStateQueue = self->_foregroundStateQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__BRCSyncContext_forceContainerForegroundForDuration___block_invoke;
  v4[3] = &unk_24FE41740;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(foregroundStateQueue, v4);
}

void __54__BRCSyncContext_forceContainerForegroundForDuration___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int64_t v9;
  dispatch_time_t v10;
  NSObject *v11;
  _QWORD *v12;
  NSObject *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  dispatch_block_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  float v22;
  _QWORD v23[5];
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  double v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v3 + 80) <= 1uLL)
  {
    if (*(_QWORD *)(v3 + 64))
    {
      dispatch_source_cancel(*(dispatch_source_t *)(v3 + 64));
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 64);
      *(_QWORD *)(v4 + 64) = 0;

      v3 = *(_QWORD *)(a1 + 32);
    }
    if ((objc_msgSend((id)v3, "isForeground") & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "_notifyFrameworkContainersMonitorWithState:", 1);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = 1;
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v21 = *(_QWORD *)(a1 + 32);
      v22 = *(double *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v25 = v21;
      v26 = 2048;
      v27 = v22;
      v28 = 2112;
      v29 = v6;
      _os_log_debug_impl(&dword_230455000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] beginning forced foreground for %@ for %.1fs%@", buf, 0x20u);
    }

    v8 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 72));
    v9 = brc_interval_to_nsec();
    v10 = dispatch_time(0, v9);
    dispatch_source_set_timer(v8, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __54__BRCSyncContext_forceContainerForegroundForDuration___block_invoke_69;
    v23[3] = &unk_24FE3FA18;
    v23[4] = *(_QWORD *)(a1 + 32);
    v11 = v8;
    v12 = v23;
    v13 = v11;
    v14 = v12;
    v15 = v14;
    v16 = v14;
    if (*MEMORY[0x24BE17840])
    {
      ((void (*)(_QWORD *))*MEMORY[0x24BE17840])(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v17 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v16);
    dispatch_source_set_event_handler(v13, v17);

    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(void **)(v18 + 64);
    *(_QWORD *)(v18 + 64) = v13;
    v20 = v13;

    dispatch_resume(v20);
  }
  objc_sync_exit(v2);

}

void __54__BRCSyncContext_forceContainerForegroundForDuration___block_invoke_69(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __54__BRCSyncContext_forceContainerForegroundForDuration___block_invoke_69_cold_2(a1);

  v4 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v4 + 80) != 1)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      __54__BRCSyncContext_forceContainerForegroundForDuration___block_invoke_69_cold_1();

    v4 = *(_QWORD *)(a1 + 32);
  }
  *(_QWORD *)(v4 + 80) = 0;
  if ((objc_msgSend(*(id *)(a1 + 32), "isForeground") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_notifyFrameworkContainersMonitorWithState:", 0);
  dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 64));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = 0;

}

- (id)foregroundClients
{
  BRCSyncContext *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableSet copy](v2->_foregroundClients, "copy");
  objc_sync_exit(v2);

  return v3;
}

- (void)didReceiveHandoffRequest
{
  BRCSyncContext *obj;

  obj = self;
  objc_sync_enter(obj);
  if (!-[NSMutableSet count](obj->_foregroundClients, "count"))
  {
    -[BRCSyncContext _notifyContainerBeingNowForeground](obj, "_notifyContainerBeingNowForeground");
    -[BRCSyncContext _armForegroundGraceTimerForClientDescription:](obj, "_armForegroundGraceTimerForClientDescription:", CFSTR("Handoff request"));
  }
  objc_sync_exit(obj);

}

void __63__BRCSyncContext__armForegroundGraceTimerForClientDescription___block_invoke_73(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  id *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    brc_bread_crumbs();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __63__BRCSyncContext__armForegroundGraceTimerForClientDescription___block_invoke_73_cold_1();

    v4 = (id *)WeakRetained;
    objc_sync_enter(v4);
    v5 = v4[5];
    v4[5] = 0;

    v6 = v4[6];
    v4[6] = 0;

    v7 = v4[7];
    v4[7] = 0;

    v8 = v4[10];
    objc_sync_exit(v4);

    if (!v8)
    {
      objc_msgSend(v4, "_notifyFrameworkContainersMonitorWithState:", 0);
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4[15], "personaIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      BRPersonaSpecificName();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:userInfo:", v11, v4, 0);

    }
  }

}

- (BRCAccountSessionFPFS)session
{
  return self->_session;
}

- (BRCThrottleBase)readerThrottle
{
  return self->_readerThrottle;
}

- (BRCThrottleBase)applyThrottle
{
  return self->_applyThrottle;
}

- (BRCThrottleBase)downloadThrottle
{
  return self->_downloadThrottle;
}

- (BRCThrottleBase)uploadThrottle
{
  return self->_uploadThrottle;
}

- (BRCThrottleBase)uploadFileModifiedThrottle
{
  return self->_uploadFileModifiedThrottle;
}

- (BRCThrottleBase)perItemSyncUpThrottle
{
  return self->_perItemSyncUpThrottle;
}

- (BRCTransferStream)uploadStream
{
  return self->_uploadStream;
}

- (BRCTransferStream)downloadStream
{
  return self->_downloadStream;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadStream, 0);
  objc_storeStrong((id *)&self->_uploadStream, 0);
  objc_storeStrong((id *)&self->_perItemSyncUpThrottle, 0);
  objc_storeStrong((id *)&self->_uploadFileModifiedThrottle, 0);
  objc_storeStrong((id *)&self->_uploadThrottle, 0);
  objc_storeStrong((id *)&self->_downloadThrottle, 0);
  objc_storeStrong((id *)&self->_applyThrottle, 0);
  objc_storeStrong((id *)&self->_readerThrottle, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_discretionaryRecursiveListOperationQueue, 0);
  objc_storeStrong((id *)&self->_nonDiscretionaryRecursiveListOperationQueue, 0);
  objc_storeStrong((id *)&self->_discretionaryModifyOperations, 0);
  objc_storeStrong((id *)&self->_nonDiscretionaryModifyOperations, 0);
  objc_storeStrong((id *)&self->_foregroundStateQueue, 0);
  objc_storeStrong((id *)&self->_timerForForcedForegroundPeriod, 0);
  objc_storeStrong((id *)&self->_timerForGraceForegroundPeriod, 0);
  objc_storeStrong((id *)&self->_dateWhenLastForegroundClientLeft, 0);
  objc_storeStrong((id *)&self->_lastForegroundClientDescription, 0);
  objc_storeStrong((id *)&self->_foregroundClients, 0);
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
  objc_storeStrong((id *)&self->_ckContainer, 0);
}

- (void)initWithSession:(void *)a1 contextIdentifier:isShared:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "isOpen");
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_2(&dword_230455000, v1, v2, "[CRIT] UNREACHABLE: Trying to create a sync context while downloadsDeadlineScheduler still missing. Session open: %d%@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_20();
}

- (void)initWithSession:(void *)a1 contextIdentifier:isShared:.cold.2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "isOpen");
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_2(&dword_230455000, v1, v2, "[CRIT] UNREACHABLE: Trying to create a sync context while uploadsDeadlineScheduler still missing. Session open: %d%@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_20();
}

- (void)addOperation:(uint64_t)a1 allowsCellularAccess:nonDiscretionary:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v1, v2, "[CRIT] UNREACHABLE: missing group for %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)addOperation:allowsCellularAccess:nonDiscretionary:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: database%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __54__BRCSyncContext_forceContainerForegroundForDuration___block_invoke_69_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: self->_foregroundState == BRCContainerForegroundStateForcedForeground%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __54__BRCSyncContext_forceContainerForegroundForDuration___block_invoke_69_cold_2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] forced foreground grace period over for %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __63__BRCSyncContext__armForegroundGraceTimerForClientDescription___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: there should be no timer created%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __63__BRCSyncContext__armForegroundGraceTimerForClientDescription___block_invoke_73_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  v4 = 2112;
  v5 = v0;
  v6 = 2112;
  v7 = v1;
  _os_log_debug_impl(&dword_230455000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] grace period over for %@ %@%@", v3, 0x20u);
  OUTLINED_FUNCTION_20();
}

void __52__BRCSyncContext__notifyContainerBeingNowForeground__block_invoke_cold_1(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] Cancelling foreground grace timer for %@ because we're now foreground again%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

@end
