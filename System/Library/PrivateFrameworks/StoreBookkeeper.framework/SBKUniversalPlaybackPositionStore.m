@implementation SBKUniversalPlaybackPositionStore

- (void)deprecated_setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (SBKUniversalPlaybackPositionStore)initWithDomain:(id)a3 dataSource:(id)a4 automaticSynchronizeOptions:(unint64_t)a5 isActive:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  SBKUniversalPlaybackPositionStore *v14;

  v6 = a6;
  v10 = a4;
  v11 = a3;
  SBKStoreAccount();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SBKUniversalPlaybackPositionStore initWithDomain:dataSource:automaticSynchronizeOptions:accountIdentifier:isActive:](self, "initWithDomain:dataSource:automaticSynchronizeOptions:accountIdentifier:isActive:", v11, v10, a5, v13, v6);

  return v14;
}

- (SBKUniversalPlaybackPositionStore)initWithDomain:(id)a3 dataSource:(id)a4 automaticSynchronizeOptions:(unint64_t)a5 accountIdentifier:(id)a6 isActive:(BOOL)a7
{
  id v14;
  id v15;
  id v16;
  char *v17;
  dispatch_queue_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  id location;
  objc_super v40;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBKUniversalPlaybackPositionStore.m"), 100, CFSTR("Invalid paramter.  no domain specified"));

  }
  v40.receiver = self;
  v40.super_class = (Class)SBKUniversalPlaybackPositionStore;
  v17 = -[SBKUniversalPlaybackPositionStore init](&v40, sel_init);
  if (v17)
  {
    v18 = dispatch_queue_create("SBKUniversalPlaybackPositionStore.queue", 0);
    v19 = (void *)*((_QWORD *)v17 + 1);
    *((_QWORD *)v17 + 1) = v18;

    v17[16] = a7;
    objc_storeStrong((id *)v17 + 4, a3);
    objc_storeWeak((id *)v17 + 13, v15);
    objc_storeStrong((id *)v17 + 5, a6);
    *((_QWORD *)v17 + 6) = a5;
    *(int64x2_t *)(v17 + 56) = vdupq_n_s64(0x417E133800000000uLL);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)*((_QWORD *)v17 + 3);
    *((_QWORD *)v17 + 3) = v20;

    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDateToFireNextTimer:", v22);

    objc_msgSend(v17, "_updateAutorefreshRateSettingAndRestartTimer:", 0);
    if ((v17[48] & 1) != 0)
      objc_msgSend(v17, "_onQueueLoadBagContextWithCompletionHandler:", 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v17);
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *MEMORY[0x24BEB20F0];
    v26 = MEMORY[0x24BDAC760];
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __118__SBKUniversalPlaybackPositionStore_initWithDomain_dataSource_automaticSynchronizeOptions_accountIdentifier_isActive___block_invoke;
    v37[3] = &unk_24E2A7A18;
    objc_copyWeak(&v38, &location);
    objc_msgSend(v23, "addObserverForName:object:queue:usingBlock:", v25, 0, v24, v37);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)*((_QWORD *)v17 + 11);
    *((_QWORD *)v17 + 11) = v27;

    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v26;
    v35[1] = 3221225472;
    v35[2] = __118__SBKUniversalPlaybackPositionStore_initWithDomain_dataSource_automaticSynchronizeOptions_accountIdentifier_isActive___block_invoke_2;
    v35[3] = &unk_24E2A7A18;
    objc_copyWeak(&v36, &location);
    objc_msgSend(v23, "addObserverForName:object:queue:usingBlock:", CFSTR("SBKPreferencesDidChangeNotification"), 0, v29, v35);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)*((_QWORD *)v17 + 12);
    *((_QWORD *)v17 + 12) = v30;

    objc_destroyWeak(&v36);
    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);

    v16 = v34;
  }

  return (SBKUniversalPlaybackPositionStore *)v17;
}

- (SBKUniversalPlaybackPositionStore)init
{
  return -[SBKUniversalPlaybackPositionStore initWithInitialUpdateDelay:](self, "initWithInitialUpdateDelay:", -1.0);
}

- (SBKUniversalPlaybackPositionStore)initWithInitialUpdateDelay:(double)a3
{
  SBKUniversalPlaybackPositionStore *v4;
  SBKUniversalPlaybackPositionStore *v5;
  double v6;
  NSObject *queue;
  _QWORD block[4];
  SBKUniversalPlaybackPositionStore *v10;

  v4 = -[SBKUniversalPlaybackPositionStore init](self, "init");
  v5 = v4;
  if (v4)
  {
    if (a3 <= 0.0)
      v6 = 31536000.0;
    else
      v6 = a3;
    v4->_initialAutosyncInterval = v6;
    v4->_automaticSynchronizeOptions = 6;
    -[SBKUniversalPlaybackPositionStore _updateAutorefreshRateSettingAndRestartTimer:](v4, "_updateAutorefreshRateSettingAndRestartTimer:", 0);
    if (v5->_initialAutosyncInterval != 31536000.0)
    {
      queue = v5->_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __64__SBKUniversalPlaybackPositionStore_initWithInitialUpdateDelay___block_invoke;
      block[3] = &unk_24E2A8240;
      v10 = v5;
      dispatch_sync(queue, block);

    }
  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_accountsObserver);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self->_prefsObserver);

  -[SBKUniversalPlaybackPositionStore bagLookupTask](self, "bagLookupTask");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[SBKUniversalPlaybackPositionStore currentTask](self, "currentTask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[SBKUniversalPlaybackPositionStore lookupDomainVersionTask](self, "lookupDomainVersionTask");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");

  -[SBKUniversalPlaybackPositionStore timer](self, "timer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidate");

  -[SBKUniversalPlaybackPositionStore _onQueueSuspendTimer](self, "_onQueueSuspendTimer");
  v9.receiver = self;
  v9.super_class = (Class)SBKUniversalPlaybackPositionStore;
  -[SBKUniversalPlaybackPositionStore dealloc](&v9, sel_dealloc);
}

- (void)_onQueueUpdateTimerForActiveChanges
{
  double initialAutosyncInterval;

  if (self->_isActive && (self->_automaticSynchronizeOptions & 2) != 0)
  {
    if (-[SBKUniversalPlaybackPositionStore _automaticallySynchronizeOnBecomeActive](self, "_automaticallySynchronizeOnBecomeActive"))
    {
      initialAutosyncInterval = self->_initialAutosyncInterval;
      if (initialAutosyncInterval == 31536000.0)
        initialAutosyncInterval = 2.0;
      -[SBKUniversalPlaybackPositionStore _onQueueStartNewTimerWithTimeIntervalSinceNow:](self, "_onQueueStartNewTimerWithTimeIntervalSinceNow:", initialAutosyncInterval);
    }
    else
    {
      -[SBKUniversalPlaybackPositionStore _onQueueResumeTimer](self, "_onQueueResumeTimer");
    }
  }
  else
  {
    -[SBKUniversalPlaybackPositionStore _onQueueSuspendTimer](self, "_onQueueSuspendTimer");
  }
}

- (void)_onQueueUpdateTimerForAutomaticSyncOptionChanges
{
  if (self->_isActive && (self->_automaticSynchronizeOptions & 3) != 0)
    -[SBKUniversalPlaybackPositionStore _onQueueResumeTimer](self, "_onQueueResumeTimer");
  else
    -[SBKUniversalPlaybackPositionStore _onQueueSuspendTimer](self, "_onQueueSuspendTimer");
}

- (void)becomeActive
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__SBKUniversalPlaybackPositionStore_becomeActive__block_invoke;
  block[3] = &unk_24E2A8240;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)resignActive
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__SBKUniversalPlaybackPositionStore_resignActive__block_invoke;
  block[3] = &unk_24E2A8240;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)setAutomaticSynchronizeOptions:(unint64_t)a3
{
  unint64_t automaticSynchronizeOptions;

  automaticSynchronizeOptions = self->_automaticSynchronizeOptions;
  if (automaticSynchronizeOptions != a3)
  {
    self->_automaticSynchronizeOptions = a3;
    if (((automaticSynchronizeOptions ^ a3) & 1) != 0)
      -[SBKUniversalPlaybackPositionStore _onQueueUpdateTimerForAutomaticSyncOptionChanges](self, "_onQueueUpdateTimerForAutomaticSyncOptionChanges");
  }
}

- (unint64_t)automaticSynchronizeOptions
{
  return self->_automaticSynchronizeOptions;
}

- (void)setHasLocalChangesToSync:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __62__SBKUniversalPlaybackPositionStore_setHasLocalChangesToSync___block_invoke;
  v4[3] = &unk_24E2A7A68;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(queue, v4);
}

- (BOOL)hasLocalChangesToSync
{
  return self->_hasLocalChangesToSync;
}

- (void)setAutomaticallySynchronizeLocalChangesOnResignActive:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[SBKUniversalPlaybackPositionStore automaticSynchronizeOptions](self, "automaticSynchronizeOptions") & 0xFFFFFFFFFFFFFFFBLL;
  v6 = 4;
  if (!v3)
    v6 = 0;
  -[SBKUniversalPlaybackPositionStore setAutomaticSynchronizeOptions:](self, "setAutomaticSynchronizeOptions:", v5 | v6);
}

- (BOOL)_automaticallySynchronizeLocalChangesOnResignActive
{
  return (-[SBKUniversalPlaybackPositionStore automaticSynchronizeOptions](self, "automaticSynchronizeOptions") >> 2) & 1;
}

- (void)setAutomaticallySynchronizeOnBecomeActive:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[SBKUniversalPlaybackPositionStore automaticSynchronizeOptions](self, "automaticSynchronizeOptions") & 0xFFFFFFFFFFFFFFFDLL;
  v6 = 2;
  if (!v3)
    v6 = 0;
  -[SBKUniversalPlaybackPositionStore setAutomaticSynchronizeOptions:](self, "setAutomaticSynchronizeOptions:", v5 | v6);
}

- (BOOL)_automaticallySynchronizeOnBecomeActive
{
  return (-[SBKUniversalPlaybackPositionStore automaticSynchronizeOptions](self, "automaticSynchronizeOptions") >> 1) & 1;
}

- (void)synchronizeImmediatelyWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__SBKUniversalPlaybackPositionStore_synchronizeImmediatelyWithCompletionHandler___block_invoke;
  block[3] = &unk_24E2A8178;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)pushMetadataItem:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__SBKUniversalPlaybackPositionStore_pushMetadataItem_completionBlock___block_invoke;
  block[3] = &unk_24E2A7A90;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

- (void)pullMetadataItemWithItemIdentifier:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __88__SBKUniversalPlaybackPositionStore_pullMetadataItemWithItemIdentifier_completionBlock___block_invoke;
  block[3] = &unk_24E2A7A90;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

- (void)synchronizeImmediatelyWithCompletionBlock:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSObject *queue;
  id v9;
  _QWORD block[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __79__SBKUniversalPlaybackPositionStore_synchronizeImmediatelyWithCompletionBlock___block_invoke;
  v12[3] = &unk_24E2A7AB8;
  v13 = v4;
  v6 = v4;
  v7 = (void *)MEMORY[0x2207AF7FC](v12);
  queue = self->_queue;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __79__SBKUniversalPlaybackPositionStore_synchronizeImmediatelyWithCompletionBlock___block_invoke_2;
  block[3] = &unk_24E2A8178;
  block[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_sync(queue, block);

}

- (void)checkForAvailabilityWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    queue = self->_queue;
    block[1] = 3221225472;
    block[2] = __77__SBKUniversalPlaybackPositionStore_checkForAvailabilityWithCompletionBlock___block_invoke;
    block[3] = &unk_24E2A8178;
    block[4] = self;
    v6 = v4;
    block[0] = MEMORY[0x24BDAC760];
    v8 = v4;
    dispatch_sync(queue, block);

    v4 = v6;
  }

}

- (void)loadRemoteDomainVersionWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    queue = self->_queue;
    block[1] = 3221225472;
    block[2] = __80__SBKUniversalPlaybackPositionStore_loadRemoteDomainVersionWithCompletionBlock___block_invoke;
    block[3] = &unk_24E2A8178;
    block[4] = self;
    v6 = v4;
    block[0] = MEMORY[0x24BDAC760];
    v8 = v4;
    dispatch_sync(queue, block);

    v4 = v6;
  }

}

- (void)loadBagContextWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    queue = self->_queue;
    block[1] = 3221225472;
    block[2] = __71__SBKUniversalPlaybackPositionStore_loadBagContextWithCompletionBlock___block_invoke;
    block[3] = &unk_24E2A8178;
    block[4] = self;
    v6 = v4;
    block[0] = MEMORY[0x24BDAC760];
    v8 = v4;
    dispatch_sync(queue, block);

    v4 = v6;
  }

}

- (void)_onQueueSynchronizeWithAutosynchronizeMask:(unint64_t)a3 withCompletionBlock:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __100__SBKUniversalPlaybackPositionStore__onQueueSynchronizeWithAutosynchronizeMask_withCompletionBlock___block_invoke;
  v7[3] = &unk_24E2A7AB8;
  v8 = v5;
  v6 = v5;
  -[SBKUniversalPlaybackPositionStore _onQueueSynchronizeImmediatelyWithCompletionHandler:](self, "_onQueueSynchronizeImmediatelyWithCompletionHandler:", v7);

}

- (void)_onQueueLoadRemoteDomainVersionWithCompletionBlock:(id)a3
{
  SBKAsynchronousTask *lookupDomainVersionTask;
  SBKUniversalPlaybackPositionStore *v5;
  NSObject *v6;
  _BOOL4 v7;
  SBKAsynchronousTask *v8;
  SBKAsynchronousTask *v9;
  SBKUniversalPlaybackPositionStore *v10;
  SBKAsynchronousTask *v11;
  uint64_t v12;
  _QWORD v13[5];
  _QWORD v14[4];
  SBKUniversalPlaybackPositionStore *v15;
  SBKUniversalPlaybackPositionStore *v16;
  __CFString *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  lookupDomainVersionTask = self->_lookupDomainVersionTask;
  v5 = (SBKUniversalPlaybackPositionStore *)a3;
  v6 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (lookupDomainVersionTask)
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[SBKUniversalPlaybackPositionStore _onQueueLoadRemoteDomainVersionWithCompletionBlock:]";
      v20 = 2112;
      v21 = CFSTR("domain version lookup");
      _os_log_impl(&dword_21E4FD000, v6, OS_LOG_TYPE_DEFAULT, "%s - %@ already in progress.  pending our completion block to be notified when it completes.", buf, 0x16u);
    }

    -[SBKAsynchronousTask addTaskCompletionBlock:](self->_lookupDomainVersionTask, "addTaskCompletionBlock:", v5);
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[SBKUniversalPlaybackPositionStore _onQueueLoadRemoteDomainVersionWithCompletionBlock:]";
      v20 = 2112;
      v21 = CFSTR("domain version lookup");
      _os_log_impl(&dword_21E4FD000, v6, OS_LOG_TYPE_DEFAULT, "%s - beginning %@...", buf, 0x16u);
    }

    v8 = -[SBKAsynchronousTask initWithHandlerQueue:timeout:debugDescription:]([SBKAsynchronousTask alloc], "initWithHandlerQueue:timeout:debugDescription:", self->_queue, CFSTR("SBKUPPStore LookupDomainVersion"), 20.0);
    v9 = self->_lookupDomainVersionTask;
    self->_lookupDomainVersionTask = v8;

    -[SBKAsynchronousTask addTaskCompletionBlock:](self->_lookupDomainVersionTask, "addTaskCompletionBlock:", v5);
    v10 = self;
    -[SBKAsynchronousTask setExpirationHandler:](self->_lookupDomainVersionTask, "setExpirationHandler:", &__block_literal_global_52);
    v11 = self->_lookupDomainVersionTask;
    v12 = MEMORY[0x24BDAC760];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __88__SBKUniversalPlaybackPositionStore__onQueueLoadRemoteDomainVersionWithCompletionBlock___block_invoke_2;
    v14[3] = &unk_24E2A80C8;
    v15 = v10;
    v16 = v10;
    v17 = CFSTR("domain version lookup");
    v5 = v10;
    -[SBKAsynchronousTask setFinishedHandler:](v11, "setFinishedHandler:", v14);
    v13[0] = v12;
    v13[1] = 3221225472;
    v13[2] = __88__SBKUniversalPlaybackPositionStore__onQueueLoadRemoteDomainVersionWithCompletionBlock___block_invoke_2_61;
    v13[3] = &unk_24E2A7BB8;
    v13[4] = v5;
    -[SBKUniversalPlaybackPositionStore _onQueueLoadBagContextWithCompletionHandler:](v5, "_onQueueLoadBagContextWithCompletionHandler:", v13);

  }
}

- (void)_onQueueRunNextPendingTaskBlock
{
  void (**v3)(void);

  -[NSMutableArray firstObject](self->_pendingTaskBlocks, "firstObject");
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_pendingTaskBlocks, "removeObjectAtIndex:", 0);
    v3[2]();
  }

}

- (void)_onQueueRunTaskWithName:(id)a3 taskCompletionHandler:(id)a4 runTaskBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSMutableArray *pendingTaskBlocks;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  SBKAsynchronousTask *v19;
  SBKAsynchronousTask *currentTask;
  SBKAsynchronousTask **p_currentTask;
  SBKUniversalPlaybackPositionStore *v22;
  uint64_t v23;
  SBKAsynchronousTask *v24;
  SBKUniversalPlaybackPositionStore *v25;
  SBKAsynchronousTask *v26;
  SBKUniversalPlaybackPositionStore *v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[4];
  SBKUniversalPlaybackPositionStore *v31;
  id v32;
  _QWORD v33[4];
  SBKUniversalPlaybackPositionStore *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD block[4];
  id v41;
  id v42;
  id location[4];

  location[3] = *(id *)MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SBKUniversalPlaybackPositionStore _accountForSyncing](self, "_accountForSyncing");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (self->_currentTask)
    {
      objc_initWeak(location, self);
      pendingTaskBlocks = self->_pendingTaskBlocks;
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __96__SBKUniversalPlaybackPositionStore__onQueueRunTaskWithName_taskCompletionHandler_runTaskBlock___block_invoke_2;
      v35[3] = &unk_24E2A7BE0;
      objc_copyWeak(&v39, location);
      v36 = v8;
      v37 = v9;
      v38 = v10;
      v13 = (void *)MEMORY[0x2207AF7FC](v35);
      -[NSMutableArray addObject:](pendingTaskBlocks, "addObject:", v13);

      objc_destroyWeak(&v39);
      objc_destroyWeak(location);
    }
    else
    {
      self->_initialAutosyncInterval = 31536000.0;
      v18 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v8;
        _os_log_impl(&dword_21E4FD000, v18, OS_LOG_TYPE_DEFAULT, "_onQueueSync - beginning %@ operation...", (uint8_t *)location, 0xCu);
      }

      -[SBKUniversalPlaybackPositionStore _onQueueStopTimer](self, "_onQueueStopTimer");
      v19 = -[SBKAsynchronousTask initWithHandlerQueue:timeout:debugDescription:]([SBKAsynchronousTask alloc], "initWithHandlerQueue:timeout:debugDescription:", self->_queue, CFSTR("SBKUPPStore Synchronize"), 20.0);
      p_currentTask = &self->_currentTask;
      currentTask = self->_currentTask;
      self->_currentTask = v19;

      -[SBKAsynchronousTask addTaskCompletionBlock:](self->_currentTask, "addTaskCompletionBlock:", v9);
      v22 = self;
      v23 = MEMORY[0x24BDAC760];
      v24 = self->_currentTask;
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __96__SBKUniversalPlaybackPositionStore__onQueueRunTaskWithName_taskCompletionHandler_runTaskBlock___block_invoke_70;
      v33[3] = &unk_24E2A8240;
      v25 = v22;
      v34 = v25;
      -[SBKAsynchronousTask setExpirationHandler:](v24, "setExpirationHandler:", v33);
      v26 = *p_currentTask;
      v30[0] = v23;
      v30[1] = 3221225472;
      v30[2] = __96__SBKUniversalPlaybackPositionStore__onQueueRunTaskWithName_taskCompletionHandler_runTaskBlock___block_invoke_2_71;
      v30[3] = &unk_24E2A81C8;
      v31 = v25;
      v32 = v8;
      v27 = v25;
      -[SBKAsynchronousTask setFinishedHandler:](v26, "setFinishedHandler:", v30);
      v28[0] = v23;
      v28[1] = 3221225472;
      v28[2] = __96__SBKUniversalPlaybackPositionStore__onQueueRunTaskWithName_taskCompletionHandler_runTaskBlock___block_invoke_2_74;
      v28[3] = &unk_24E2A7B08;
      v28[4] = v27;
      v29 = v10;
      -[SBKUniversalPlaybackPositionStore _onQueueLoadBagContextWithCompletionHandler:](v27, "_onQueueLoadBagContextWithCompletionHandler:", v28);

    }
  }
  else
  {
    v14 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v8;
      _os_log_impl(&dword_21E4FD000, v14, OS_LOG_TYPE_DEFAULT, "_onQueueRunTaskWithName %@ - short circuiting. _accountForSyncing=nil", (uint8_t *)location, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SBKStoreErrorDomain"), -1001, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __96__SBKUniversalPlaybackPositionStore__onQueueRunTaskWithName_taskCompletionHandler_runTaskBlock___block_invoke;
    block[3] = &unk_24E2A8178;
    v41 = v15;
    v42 = v9;
    v17 = v15;
    dispatch_async(v16, block);

  }
}

- (void)_onQueueSynchronizeImmediatelyWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  if (self->_currentTask)
  {
    v4 = a3;
    v5 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E4FD000, v5, OS_LOG_TYPE_DEFAULT, "_onQueueSync - synchronize already in progress.  pending our completion block to be notified when it completes.", buf, 2u);
    }

    -[SBKAsynchronousTask addTaskCompletionBlock:](self->_currentTask, "addTaskCompletionBlock:", v4);
  }
  else
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __89__SBKUniversalPlaybackPositionStore__onQueueSynchronizeImmediatelyWithCompletionHandler___block_invoke;
    v6[3] = &unk_24E2A7CA0;
    v6[4] = self;
    v4 = a3;
    -[SBKUniversalPlaybackPositionStore _onQueueRunTaskWithName:taskCompletionHandler:runTaskBlock:](self, "_onQueueRunTaskWithName:taskCompletionHandler:runTaskBlock:", CFSTR("synchronize"), v4, v6);
  }

}

- (void)_onQueuePushMetadataItem:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  SBKUniversalPlaybackPositionStore *v14;
  _QWORD *v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;

  v6 = a3;
  v7 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__849;
  v19[4] = __Block_byref_object_dispose__850;
  v8 = MEMORY[0x24BDAC760];
  v20 = 0;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __78__SBKUniversalPlaybackPositionStore__onQueuePushMetadataItem_completionBlock___block_invoke;
  v16[3] = &unk_24E2A7CC8;
  v18 = v19;
  v9 = v7;
  v17 = v9;
  v10 = (void *)MEMORY[0x2207AF7FC](v16);
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __78__SBKUniversalPlaybackPositionStore__onQueuePushMetadataItem_completionBlock___block_invoke_2;
  v12[3] = &unk_24E2A7D18;
  v15 = v19;
  v11 = v6;
  v13 = v11;
  v14 = self;
  -[SBKUniversalPlaybackPositionStore _onQueueRunTaskWithName:taskCompletionHandler:runTaskBlock:](self, "_onQueueRunTaskWithName:taskCompletionHandler:runTaskBlock:", CFSTR("PUT value"), v10, v12);

  _Block_object_dispose(v19, 8);
}

- (void)_onQueuePullMetadataItemWithItemIdentifier:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  SBKUniversalPlaybackPositionStore *v14;
  _QWORD *v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;

  v6 = a3;
  v7 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__849;
  v19[4] = __Block_byref_object_dispose__850;
  v8 = MEMORY[0x24BDAC760];
  v20 = 0;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __96__SBKUniversalPlaybackPositionStore__onQueuePullMetadataItemWithItemIdentifier_completionBlock___block_invoke;
  v16[3] = &unk_24E2A7CC8;
  v18 = v19;
  v9 = v7;
  v17 = v9;
  v10 = (void *)MEMORY[0x2207AF7FC](v16);
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __96__SBKUniversalPlaybackPositionStore__onQueuePullMetadataItemWithItemIdentifier_completionBlock___block_invoke_2;
  v12[3] = &unk_24E2A7D18;
  v15 = v19;
  v11 = v6;
  v13 = v11;
  v14 = self;
  -[SBKUniversalPlaybackPositionStore _onQueueRunTaskWithName:taskCompletionHandler:runTaskBlock:](self, "_onQueueRunTaskWithName:taskCompletionHandler:runTaskBlock:", CFSTR("GET value"), v10, v12);

  _Block_object_dispose(v19, 8);
}

- (id)_accountForSyncing
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountWithUniqueIdentifier:", self->_accountIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_updateSettingsFromLoadedBagContext:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __73__SBKUniversalPlaybackPositionStore__updateSettingsFromLoadedBagContext___block_invoke;
  v6[3] = &unk_24E2A81C8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

- (void)_onQueueLoadBagContextWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSNumber *accountIdentifier;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  SBKAsynchronousTask *v15;
  SBKAsynchronousTask *bagLookupTask;
  SBKUniversalPlaybackPositionStore *v17;
  SBKAsynchronousTask *v18;
  SBKUniversalPlaybackPositionStore *v19;
  SBKAsynchronousTask *v20;
  SBKUniversalPlaybackPositionStore *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSString *domain;
  void *v27;
  SBKAsynchronousTask *v28;
  _QWORD v29[4];
  SBKUniversalPlaybackPositionStore *v30;
  _QWORD v31[4];
  SBKUniversalPlaybackPositionStore *v32;
  _QWORD v33[4];
  SBKUniversalPlaybackPositionStore *v34;
  _QWORD block[4];
  id v36;
  id v37;
  _QWORD v38[5];
  id v39;
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __81__SBKUniversalPlaybackPositionStore__onQueueLoadBagContextWithCompletionHandler___block_invoke;
  v38[3] = &unk_24E2A7B08;
  v38[4] = self;
  v6 = v4;
  v39 = v6;
  v7 = (void *)MEMORY[0x2207AF7FC](v38);
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier && !-[NSNumber isEqual:](accountIdentifier, "isEqual:", &unk_24E2AFF30))
  {
    if (self->_bagLookupTask)
    {
      v14 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E4FD000, v14, OS_LOG_TYPE_DEFAULT, "_onQueueLoadBag - load bag already in progress.  pending our completion block to be notified when it completes.", buf, 2u);
      }

      -[SBKAsynchronousTask addTaskCompletionBlock:](self->_bagLookupTask, "addTaskCompletionBlock:", v7);
    }
    else
    {
      v15 = -[SBKAsynchronousTask initWithHandlerQueue:timeout:debugDescription:]([SBKAsynchronousTask alloc], "initWithHandlerQueue:timeout:debugDescription:", self->_queue, CFSTR("SBKUPPStore Load Bag"), 20.0);
      bagLookupTask = self->_bagLookupTask;
      self->_bagLookupTask = v15;

      -[SBKAsynchronousTask addTaskCompletionBlock:](self->_bagLookupTask, "addTaskCompletionBlock:", v7);
      v17 = self;
      v18 = self->_bagLookupTask;
      v33[0] = v5;
      v33[1] = 3221225472;
      v33[2] = __81__SBKUniversalPlaybackPositionStore__onQueueLoadBagContextWithCompletionHandler___block_invoke_95;
      v33[3] = &unk_24E2A8240;
      v19 = v17;
      v34 = v19;
      -[SBKAsynchronousTask setExpirationHandler:](v18, "setExpirationHandler:", v33);
      v20 = self->_bagLookupTask;
      v31[0] = v5;
      v31[1] = 3221225472;
      v31[2] = __81__SBKUniversalPlaybackPositionStore__onQueueLoadBagContextWithCompletionHandler___block_invoke_2;
      v31[3] = &unk_24E2A8240;
      v21 = v19;
      v32 = v21;
      -[SBKAsynchronousTask setFinishedHandler:](v20, "setFinishedHandler:", v31);
      -[SBKAsynchronousTask beginTaskOperation](self->_bagLookupTask, "beginTaskOperation");
      v22 = (void *)MEMORY[0x24BEB1FF0];
      objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "URLBagForContext:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        v25 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21E4FD000, v25, OS_LOG_TYPE_DEFAULT, "_onQueueLoadBag - load bag operation beginning...", buf, 2u);
        }

        domain = v21->_domain;
        v29[0] = v5;
        v29[1] = 3221225472;
        v29[2] = __81__SBKUniversalPlaybackPositionStore__onQueueLoadBagContextWithCompletionHandler___block_invoke_102;
        v29[3] = &unk_24E2A7BB8;
        v30 = v21;
        +[SBKStoreURLBagContext loadBagContextFromURLBag:domain:completionBlock:](SBKStoreURLBagContext, "loadBagContextFromURLBag:domain:completionBlock:", v24, domain, v29);
        v27 = v30;
      }
      else
      {
        v28 = self->_bagLookupTask;
        +[SBKStoreError keyValueStoreDisabledErrorWithTransaction:underlyingError:](SBKStoreError, "keyValueStoreDisabledErrorWithTransaction:underlyingError:", 0, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBKAsynchronousTask finishTaskOperationWithResult:error:](v28, "finishTaskOperationWithResult:error:", 0, v27);
      }

    }
  }
  else
  {
    v9 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[NSNumber description](self->_accountIdentifier, "description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v41 = v10;
      _os_log_impl(&dword_21E4FD000, v9, OS_LOG_TYPE_DEFAULT, "_onQueueLoadBag - skipping bag load: _accountIdentifier=%@ [no valid account identifier]", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SBKStoreErrorDomain"), -1001, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __81__SBKUniversalPlaybackPositionStore__onQueueLoadBagContextWithCompletionHandler___block_invoke_92;
    block[3] = &unk_24E2A8178;
    v36 = v11;
    v37 = v7;
    v13 = v11;
    dispatch_async(v12, block);

  }
}

- (void)_updateForStoreAccountsChange
{
  void *v3;
  NSObject *queue;
  uint64_t (*v5)(uint64_t);
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  -[SBKUniversalPlaybackPositionStore _accountForSyncing](self, "_accountForSyncing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  queue = self->_queue;
  if (v3)
  {
    v8 = MEMORY[0x24BDAC760];
    v5 = __66__SBKUniversalPlaybackPositionStore__updateForStoreAccountsChange__block_invoke;
    v6 = &v8;
  }
  else
  {
    v7 = MEMORY[0x24BDAC760];
    v5 = __66__SBKUniversalPlaybackPositionStore__updateForStoreAccountsChange__block_invoke_2;
    v6 = &v7;
  }
  v6[1] = 3221225472;
  v6[2] = (uint64_t)v5;
  v6[3] = (uint64_t)&unk_24E2A8240;
  v6[4] = (uint64_t)self;
  dispatch_async(queue, v6);
}

- (double)_effectiveAutorefreshRate
{
  double result;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  double v9;

  if ((self->_automaticSynchronizeOptions & 1) == 0)
    return 31536000.0;
  v4 = self->_pollingLimitFromBag / 60.0;
  +[SBKPreferences storeBookkeeperPreferences](SBKPreferences, "storeBookkeeperPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_pollingLimitFromBag);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:withDefaultValue:", CFSTR("AutoSyncRateInMinutes"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  if (v4 != v9)
    return v9 * 60.0;
  result = self->_pollingLimitFromBag;
  if (result == 31536000.0 || result <= 0.00000011920929)
    return 31536000.0;
  return result;
}

- (void)_updateAutorefreshRateSettingAndRestartTimer:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __82__SBKUniversalPlaybackPositionStore__updateAutorefreshRateSettingAndRestartTimer___block_invoke;
  v4[3] = &unk_24E2A7A68;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(queue, v4);
}

- (void)_timerFired:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__SBKUniversalPlaybackPositionStore__timerFired___block_invoke;
  block[3] = &unk_24E2A8240;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)_timerIsStopped
{
  void *v2;
  void *v3;
  char v4;

  -[SBKUniversalPlaybackPositionStore dateToFireNextTimer](self, "dateToFireNextTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToDate:", v3);

  return v4;
}

- (void)_onQueueScheduleTimer
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[6];

  if (!self->_refreshTimerActive)
  {
    self->_refreshTimerActive = 1;
    -[SBKUniversalPlaybackPositionStore dateToFireNextTimer](self, "dateToFireNextTimer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceNow");
    v5 = v4;

    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __58__SBKUniversalPlaybackPositionStore__onQueueScheduleTimer__block_invoke;
    v6[3] = &unk_24E2A7D60;
    v6[5] = v5;
    v6[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], v6);
  }
}

- (void)_onQueueSuspendTimer
{
  NSObject *v3;
  uint8_t v4[16];

  if (self->_refreshTimerActive)
  {
    v3 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_21E4FD000, v3, OS_LOG_TYPE_DEFAULT, "suspending update timer", v4, 2u);
    }

    -[NSTimer invalidate](self->_timer, "invalidate");
    -[SBKUniversalPlaybackPositionStore setTimer:](self, "setTimer:", 0);
    self->_refreshTimerActive = 0;
  }
}

- (void)_onQueueResumeTimer
{
  if (self->_isActive
    && !self->_refreshTimerActive
    && !-[SBKUniversalPlaybackPositionStore _timerIsStopped](self, "_timerIsStopped"))
  {
    -[SBKUniversalPlaybackPositionStore _onQueueScheduleTimer](self, "_onQueueScheduleTimer");
  }
}

- (void)_onQueueStopTimer
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBKUniversalPlaybackPositionStore setDateToFireNextTimer:](self, "setDateToFireNextTimer:", v3);

  -[SBKUniversalPlaybackPositionStore _onQueueSuspendTimer](self, "_onQueueSuspendTimer");
}

- (void)_onQueueStartNewTimer
{
  -[SBKUniversalPlaybackPositionStore _onQueueStartNewTimerWithTimeIntervalSinceNow:](self, "_onQueueStartNewTimerWithTimeIntervalSinceNow:");
}

- (void)_onQueueStartNewTimerWithTimeIntervalSinceNow:(double)a3
{
  void *v5;
  id v6;

  -[SBKUniversalPlaybackPositionStore _onQueueStopTimer](self, "_onQueueStopTimer");
  if (a3 >= 31536000.0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[SBKUniversalPlaybackPositionStore setDateToFireNextTimer:](self, "setDateToFireNextTimer:", v6);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBKUniversalPlaybackPositionStore setDateToFireNextTimer:](self, "setDateToFireNextTimer:", v5);

    -[SBKUniversalPlaybackPositionStore _onQueueResumeTimer](self, "_onQueueResumeTimer");
  }
}

- (SBKUniversalPlaybackPositionDataSource)dataSource
{
  return (SBKUniversalPlaybackPositionDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (SBKAsynchronousTask)currentTask
{
  return self->_currentTask;
}

- (void)setCurrentTask:(id)a3
{
  objc_storeStrong((id *)&self->_currentTask, a3);
}

- (SBKAsynchronousTask)lookupDomainVersionTask
{
  return self->_lookupDomainVersionTask;
}

- (void)setLookupDomainVersionTask:(id)a3
{
  objc_storeStrong((id *)&self->_lookupDomainVersionTask, a3);
}

- (SBKAsynchronousTask)bagLookupTask
{
  return self->_bagLookupTask;
}

- (void)setBagLookupTask:(id)a3
{
  objc_storeStrong((id *)&self->_bagLookupTask, a3);
}

- (SBKRequestHandler)currentTaskRequestHandler
{
  return self->_currentTaskRequestHandler;
}

- (void)setCurrentTaskRequestHandler:(id)a3
{
  objc_storeStrong((id *)&self->_currentTaskRequestHandler, a3);
}

- (NSDate)dateToFireNextTimer
{
  return self->_dateToFireNextTimer;
}

- (void)setDateToFireNextTimer:(id)a3
{
  objc_storeStrong((id *)&self->_dateToFireNextTimer, a3);
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_dateToFireNextTimer, 0);
  objc_storeStrong((id *)&self->_currentTaskRequestHandler, 0);
  objc_storeStrong((id *)&self->_bagLookupTask, 0);
  objc_storeStrong((id *)&self->_lookupDomainVersionTask, 0);
  objc_storeStrong((id *)&self->_currentTask, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong(&self->_prefsObserver, 0);
  objc_storeStrong(&self->_accountsObserver, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_pendingTaskBlocks, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __58__SBKUniversalPlaybackPositionStore__onQueueScheduleTimer__block_invoke(uint64_t a1)
{
  double v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = *(double *)(a1 + 40);
  if (v2 >= 0.0)
  {
    if (v2 < 31536000.0)
    {
      v4 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", *(double *)(a1 + 40));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "timeIntervalSinceNow");
        v8 = v7;
        objc_msgSend(v6, "timeIntervalSinceNow");
        v10 = v8 - v9;
        if (v10 <= 60.0)
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f seconds"), *(_QWORD *)&v10, v16);
        else
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lld minutes, %lld seconds"), (uint64_t)v10 / 60, (uint64_t)v10 % 60);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ (%@ from now)"), v5, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138412290;
        v18 = v12;
        _os_log_impl(&dword_21E4FD000, v4, OS_LOG_TYPE_DEFAULT, "scheduling next timer update at %@", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 32), sel__timerFired_, 0, 0, *(double *)(a1 + 40));
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(v14 + 152);
      *(_QWORD *)(v14 + 152) = v13;

    }
  }
  else
  {
    v3 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E4FD000, v3, OS_LOG_TYPE_DEFAULT, "scheduled timer date already passed.  Firing immediately", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_timerFired:", 0);
  }
}

uint64_t __49__SBKUniversalPlaybackPositionStore__timerFired___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueueSynchronizeWithAutosynchronizeMask:withCompletionBlock:", 3, 0);
}

uint64_t __82__SBKUniversalPlaybackPositionStore__updateAutorefreshRateSettingAndRestartTimer___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "_effectiveAutorefreshRate");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = v3;
  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "_onQueueStartNewTimer");
  return result;
}

uint64_t __66__SBKUniversalPlaybackPositionStore__updateForStoreAccountsChange__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueueSuspendTimer");
}

uint64_t __66__SBKUniversalPlaybackPositionStore__updateForStoreAccountsChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueueResumeTimer");
}

void __81__SBKUniversalPlaybackPositionStore__onQueueLoadBagContextWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_updateSettingsFromLoadedBagContext:", v12);
  if (*(_QWORD *)(a1 + 40))
  {
    if (v12)
    {
      if (!objc_msgSend(v12, "domainDisabled"))
      {
LABEL_7:
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        goto LABEL_8;
      }
      v6 = (void *)MEMORY[0x24BDD1540];
      ErrorInfoWithUnderlyingError_848(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = -2007;
    }
    else
    {
      v10 = (void *)MEMORY[0x24BDD1540];
      ErrorInfoWithUnderlyingError_848(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v10;
      v9 = -2008;
    }
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("SBKStoreErrorDomain"), v9, v7);
    v11 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v11;
    goto LABEL_7;
  }
LABEL_8:

}

uint64_t __81__SBKUniversalPlaybackPositionStore__onQueueLoadBagContextWithCompletionHandler___block_invoke_92(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __81__SBKUniversalPlaybackPositionStore__onQueueLoadBagContextWithCompletionHandler___block_invoke_95(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "finishTaskOperationWithResult:error:", 0, 0);
}

void __81__SBKUniversalPlaybackPositionStore__onQueueLoadBagContextWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  uint8_t buf[4];
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 128);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 128);
  *(_QWORD *)(v3 + 128) = 0;

  v5 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v2, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v2, "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR(" ERROR = '%@'."), v9);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v12 = v10;
      _os_log_impl(&dword_21E4FD000, v5, OS_LOG_TYPE_DEFAULT, "_onQueueLoadBag - load bag completed.%@", buf, 0xCu);

    }
    else
    {
      *(_DWORD *)buf = 138412290;
      v12 = &stru_24E2A84D0;
      _os_log_impl(&dword_21E4FD000, v5, OS_LOG_TYPE_DEFAULT, "_onQueueLoadBag - load bag completed.%@", buf, 0xCu);
    }

  }
  objc_msgSend(v2, "invokeTaskCompletionBlocksWithBlock:", &__block_literal_global_97);

}

void __81__SBKUniversalPlaybackPositionStore__onQueueLoadBagContextWithCompletionHandler___block_invoke_102(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  _QWORD *v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD **)(a1 + 32);
  v8 = v7[1];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__SBKUniversalPlaybackPositionStore__onQueueLoadBagContextWithCompletionHandler___block_invoke_2_103;
  block[3] = &unk_24E2A80C8;
  v12 = v7;
  v13 = v5;
  v14 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __81__SBKUniversalPlaybackPositionStore__onQueueLoadBagContextWithCompletionHandler___block_invoke_2_103(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 128), "finishTaskOperationWithResult:error:", a1[5], a1[6]);
}

void __81__SBKUniversalPlaybackPositionStore__onQueueLoadBagContextWithCompletionHandler___block_invoke_96(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void (**v8)(id, id, id);

  v6 = a4;
  v7 = a3;
  v8 = (void (**)(id, id, id))MEMORY[0x2207AF7FC](a2);
  v8[2](v8, v7, v6);

}

uint64_t __73__SBKUniversalPlaybackPositionStore__updateSettingsFromLoadedBagContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double *v4;
  _BOOL8 v5;

  objc_msgSend(*(id *)(a1 + 40), "pollingIntervalInSeconds");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = v2;
  objc_msgSend(*(id *)(a1 + 32), "_effectiveAutorefreshRate");
  v4 = *(double **)(a1 + 32);
  v5 = v4[7] == 31536000.0 && v3 != v4[9];
  return objc_msgSend(v4, "_updateAutorefreshRateSettingAndRestartTimer:", v5);
}

void __96__SBKUniversalPlaybackPositionStore__onQueuePullMetadataItemWithItemIdentifier_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v5 = a3;
  objc_msgSend(v4, "resultItemPayloadPair");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "kvsKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "resultItemPayloadPair");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "kvsPayload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBKUniversalPlaybackPositionMetadata metadataWithItemIdentifier:keyValueStorePayload:](SBKUniversalPlaybackPositionMetadata, "metadataWithItemIdentifier:keyValueStorePayload:", v7, v9);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "resultItemVersionAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "resultDomainVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __96__SBKUniversalPlaybackPositionStore__onQueuePullMetadataItemWithItemIdentifier_completionBlock___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  SBKPullValueTransaction *v7;
  uint64_t v8;
  void *v9;
  SBKSimpleTransactionRequestHandler *v10;
  uint64_t v11;
  void *v12;
  SBKSimpleTransactionRequestHandler *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[16];

  v5 = a3;
  v6 = a2;
  v7 = -[SBKPullValueTransaction initWithStoreBagContext:requestedKey:clientItemPayloadPair:clientItemVersionAnchor:]([SBKPullValueTransaction alloc], "initWithStoreBagContext:requestedKey:clientItemPayloadPair:clientItemVersionAnchor:", v6, a1[4], 0, 0);
  v8 = *(_QWORD *)(a1[6] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v10 = -[SBKSimpleTransactionRequestHandler initWithBagContext:]([SBKSimpleTransactionRequestHandler alloc], "initWithBagContext:", v6);
  v11 = a1[5];
  v12 = *(void **)(v11 + 136);
  *(_QWORD *)(v11 + 136) = v10;
  v13 = v10;

  v14 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E4FD000, v14, OS_LOG_TYPE_DEFAULT, "_onQueueSync - pull value operation beginning...", buf, 2u);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __96__SBKUniversalPlaybackPositionStore__onQueuePullMetadataItemWithItemIdentifier_completionBlock___block_invoke_90;
  v17[3] = &unk_24E2A7CF0;
  v18 = v5;
  v16 = v5;
  -[SBKSimpleTransactionRequestHandler scheduleTransaction:finishedBlock:](v13, "scheduleTransaction:finishedBlock:", v15, v17);

}

uint64_t __96__SBKUniversalPlaybackPositionStore__onQueuePullMetadataItemWithItemIdentifier_completionBlock___block_invoke_90(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78__SBKUniversalPlaybackPositionStore__onQueuePushMetadataItem_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v5 = a3;
  objc_msgSend(v4, "resultItemPayloadPair");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "kvsKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "resultItemPayloadPair");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "kvsPayload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBKUniversalPlaybackPositionMetadata metadataWithItemIdentifier:keyValueStorePayload:](SBKUniversalPlaybackPositionMetadata, "metadataWithItemIdentifier:keyValueStorePayload:", v7, v9);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "resultItemVersionAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "resultDomainVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __78__SBKUniversalPlaybackPositionStore__onQueuePushMetadataItem_completionBlock___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  SBKPushValueTransaction *v7;
  uint64_t v8;
  void *v9;
  SBKSimpleTransactionRequestHandler *v10;
  uint64_t v11;
  void *v12;
  SBKSimpleTransactionRequestHandler *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[16];

  v5 = a3;
  v6 = a2;
  v7 = -[SBKPushValueTransaction initWithStoreBagContext:clientItemPayloadPair:clientItemVersionAnchor:]([SBKPushValueTransaction alloc], "initWithStoreBagContext:clientItemPayloadPair:clientItemVersionAnchor:", v6, a1[4], 0);
  v8 = *(_QWORD *)(a1[6] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v10 = -[SBKSimpleTransactionRequestHandler initWithBagContext:]([SBKSimpleTransactionRequestHandler alloc], "initWithBagContext:", v6);
  v11 = a1[5];
  v12 = *(void **)(v11 + 136);
  *(_QWORD *)(v11 + 136) = v10;
  v13 = v10;

  v14 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E4FD000, v14, OS_LOG_TYPE_DEFAULT, "_onQueueSync - push value operation beginning...", buf, 2u);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __78__SBKUniversalPlaybackPositionStore__onQueuePushMetadataItem_completionBlock___block_invoke_85;
  v17[3] = &unk_24E2A7CF0;
  v18 = v5;
  v16 = v5;
  -[SBKSimpleTransactionRequestHandler scheduleTransaction:finishedBlock:](v13, "scheduleTransaction:finishedBlock:", v15, v17);

}

uint64_t __78__SBKUniversalPlaybackPositionStore__onQueuePushMetadataItem_completionBlock___block_invoke_85(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __89__SBKUniversalPlaybackPositionStore__onQueueSynchronizeImmediatelyWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  SBKPlaybackPositionSyncRequestHandler *v7;
  id WeakRetained;
  SBKPlaybackPositionSyncRequestHandler *v9;
  uint64_t v10;
  void *v11;
  SBKPlaybackPositionSyncRequestHandler *v12;
  NSObject *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[16];

  v5 = a3;
  v6 = a2;
  v7 = [SBKPlaybackPositionSyncRequestHandler alloc];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 104));
  v9 = -[SBKPlaybackPositionSyncRequestHandler initWithDataSource:bagContext:accountIdentifier:](v7, "initWithDataSource:bagContext:accountIdentifier:", WeakRetained, v6, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));

  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 136);
  *(_QWORD *)(v10 + 136) = v9;
  v12 = v9;

  v13 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E4FD000, v13, OS_LOG_TYPE_DEFAULT, "_onQueueSync - synchronize operation beginning...", buf, 2u);
  }

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __89__SBKUniversalPlaybackPositionStore__onQueueSynchronizeImmediatelyWithCompletionHandler___block_invoke_79;
  v15[3] = &unk_24E2A7AB8;
  v16 = v5;
  v14 = v5;
  -[SBKPlaybackPositionSyncRequestHandler synchronizeWithCompletionHandler:](v12, "synchronizeWithCompletionHandler:", v15);

}

uint64_t __89__SBKUniversalPlaybackPositionStore__onQueueSynchronizeImmediatelyWithCompletionHandler___block_invoke_79(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __96__SBKUniversalPlaybackPositionStore__onQueueRunTaskWithName_taskCompletionHandler_runTaskBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __96__SBKUniversalPlaybackPositionStore__onQueueRunTaskWithName_taskCompletionHandler_runTaskBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_onQueueRunTaskWithName:taskCompletionHandler:runTaskBlock:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __96__SBKUniversalPlaybackPositionStore__onQueueRunTaskWithName_taskCompletionHandler_runTaskBlock___block_invoke_70(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "cancelType");
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  if (v2 == 2)
    return objc_msgSend(v3, "timeout");
  else
    return objc_msgSend(v3, "cancel");
}

uint64_t __96__SBKUniversalPlaybackPositionStore__onQueueRunTaskWithName_taskCompletionHandler_runTaskBlock___block_invoke_2_71(uint64_t a1)
{
  void *v1;
  void *v2;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 112);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v7 + 17))
  {
    objc_msgSend(v4, "result");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 17) = objc_msgSend(v8, "BOOLValue") ^ 1;

  }
  else
  {
    *(_BYTE *)(v7 + 17) = 0;
  }
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 136);
  *(_QWORD *)(v9 + 136) = 0;

  v11 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v4, "error");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "localizedDescription");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR(" ERROR = '%@'."), v2);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = &stru_24E2A84D0;
    }
    *(_DWORD *)buf = 138412546;
    v19 = v12;
    v20 = 2112;
    v21 = v15;
    _os_log_impl(&dword_21E4FD000, v11, OS_LOG_TYPE_DEFAULT, "_onQueueSync - %@ completed. %@", buf, 0x16u);
    if (v13)
    {

    }
  }

  objc_msgSend(v4, "invokeTaskCompletionBlocksWithBlock:", &__block_literal_global_73);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "postNotificationName:object:", CFSTR("SBKUniversalPlaybackPositionStoreDidSynchronizeNotification"), *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "_onQueueStartNewTimer");
  return objc_msgSend(*(id *)(a1 + 32), "_onQueueRunNextPendingTaskBlock");
}

void __96__SBKUniversalPlaybackPositionStore__onQueueRunTaskWithName_taskCompletionHandler_runTaskBlock___block_invoke_2_74(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 8);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __96__SBKUniversalPlaybackPositionStore__onQueueRunTaskWithName_taskCompletionHandler_runTaskBlock___block_invoke_3;
  v12[3] = &unk_24E2A7C78;
  v13 = v6;
  v14 = v5;
  v15 = v7;
  v16 = v8;
  v10 = v5;
  v11 = v6;
  dispatch_async(v9, v12);

}

void __96__SBKUniversalPlaybackPositionStore__onQueueRunTaskWithName_taskCompletionHandler_runTaskBlock___block_invoke_3(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  v2 = *(id *)(a1 + 32);
  if (v2)
    goto LABEL_2;
  v5 = *(void **)(a1 + 40);
  if (!v5)
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    ErrorInfoWithUnderlyingError_848(*(void **)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("SBKStoreErrorDomain"), -2008, v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v2 = v10;
    if (v10)
    {
LABEL_2:
      v3 = *(void **)(*(_QWORD *)(a1 + 48) + 112);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0, v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "finishTaskOperationWithResult:error:", v4, v11);

      return;
    }
    v5 = *(void **)(a1 + 40);
  }
  if (objc_msgSend(v5, "domainDisabled", v10))
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    ErrorInfoWithUnderlyingError_848(*(void **)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("SBKStoreErrorDomain"), -2007, v7);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v2 = v12;
    if (v12)
      goto LABEL_2;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 112), "beginTaskOperation", v12);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __96__SBKUniversalPlaybackPositionStore__onQueueRunTaskWithName_taskCompletionHandler_runTaskBlock___block_invoke_4(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  char v11;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __96__SBKUniversalPlaybackPositionStore__onQueueRunTaskWithName_taskCompletionHandler_runTaskBlock___block_invoke_5;
  block[3] = &unk_24E2A7C28;
  v11 = a2;
  block[4] = v6;
  v10 = v5;
  v8 = v5;
  dispatch_async(v7, block);

}

void __96__SBKUniversalPlaybackPositionStore__onQueueRunTaskWithName_taskCompletionHandler_runTaskBlock___block_invoke_5(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishTaskOperationWithResult:error:", v3, *(_QWORD *)(a1 + 40));

}

void __96__SBKUniversalPlaybackPositionStore__onQueueRunTaskWithName_taskCompletionHandler_runTaskBlock___block_invoke_72(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  void (**v6)(id, BOOL, id);

  v5 = a4;
  v6 = (void (**)(id, BOOL, id))MEMORY[0x2207AF7FC](a2);
  v6[2](v6, v5 == 0, v5);

}

void __88__SBKUniversalPlaybackPositionStore__onQueueLoadRemoteDomainVersionWithCompletionBlock___block_invoke_2(_QWORD *a1)
{
  void *v1;
  void *v2;
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __CFString *v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = *(id *)(a1[4] + 120);
  v5 = a1[5];
  v6 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = 0;

  objc_msgSend(v4, "setFinishedHandler:", 0);
  v7 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = a1[6];
    objc_msgSend(v4, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v4, "error");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "localizedDescription");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR(" ERROR = '%@'."), v2);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = &stru_24E2A84D0;
    }
    *(_DWORD *)buf = 138412546;
    v13 = v8;
    v14 = 2112;
    v15 = v11;
    _os_log_impl(&dword_21E4FD000, v7, OS_LOG_TYPE_DEFAULT, "_onQueueSync - %@ completed. %@", buf, 0x16u);
    if (v9)
    {

    }
  }

  objc_msgSend(v4, "invokeTaskCompletionBlocksWithBlock:", &__block_literal_global_60);
}

void __88__SBKUniversalPlaybackPositionStore__onQueueLoadRemoteDomainVersionWithCompletionBlock___block_invoke_2_61(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __88__SBKUniversalPlaybackPositionStore__onQueueLoadRemoteDomainVersionWithCompletionBlock___block_invoke_3;
  block[3] = &unk_24E2A80C8;
  v12 = v6;
  v13 = v7;
  v14 = v5;
  v9 = v5;
  v10 = v6;
  dispatch_async(v8, block);

}

void __88__SBKUniversalPlaybackPositionStore__onQueueLoadRemoteDomainVersionWithCompletionBlock___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  SBKLoadDomainVersionRequestHandler *v5;
  SBKLoadDomainVersionRequestHandler *v6;
  _QWORD v7[5];
  SBKLoadDomainVersionRequestHandler *v8;
  uint8_t buf[16];

  v2 = a1[4];
  v3 = *(void **)(a1[5] + 120);
  if (v2)
  {
    objc_msgSend(v3, "finishTaskOperationWithResult:error:", &unk_24E2AFF30);
  }
  else
  {
    objc_msgSend(v3, "beginTaskOperation");
    v4 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E4FD000, v4, OS_LOG_TYPE_DEFAULT, "_onQueueSync - synchronize operation beginning...", buf, 2u);
    }

    v5 = -[SBKSyncRequestHandler initWithBagContext:]([SBKLoadDomainVersionRequestHandler alloc], "initWithBagContext:", a1[6]);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __88__SBKUniversalPlaybackPositionStore__onQueueLoadRemoteDomainVersionWithCompletionBlock___block_invoke_64;
    v7[3] = &unk_24E2A7B90;
    v7[4] = a1[5];
    v8 = v5;
    v6 = v5;
    -[SBKLoadDomainVersionRequestHandler runWithCompletionHandler:](v6, "runWithCompletionHandler:", v7);

  }
}

void __88__SBKUniversalPlaybackPositionStore__onQueueLoadRemoteDomainVersionWithCompletionBlock___block_invoke_64(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __88__SBKUniversalPlaybackPositionStore__onQueueLoadRemoteDomainVersionWithCompletionBlock___block_invoke_2_65;
  block[3] = &unk_24E2A80C8;
  block[4] = v4;
  v9 = v5;
  v10 = v3;
  v7 = v3;
  dispatch_async(v6, block);

}

void __88__SBKUniversalPlaybackPositionStore__onQueueLoadRemoteDomainVersionWithCompletionBlock___block_invoke_2_65(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  objc_msgSend(*(id *)(a1 + 40), "responseDomainVersion");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishTaskOperationWithResult:error:", v3, *(_QWORD *)(a1 + 48));

}

void __88__SBKUniversalPlaybackPositionStore__onQueueLoadRemoteDomainVersionWithCompletionBlock___block_invoke_58(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void (**v8)(id, id, id);

  v6 = a4;
  v7 = a3;
  v8 = (void (**)(id, id, id))MEMORY[0x2207AF7FC](a2);
  v8[2](v8, v7, v6);

}

uint64_t __100__SBKUniversalPlaybackPositionStore__onQueueSynchronizeWithAutosynchronizeMask_withCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __71__SBKUniversalPlaybackPositionStore_loadBagContextWithCompletionBlock___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __71__SBKUniversalPlaybackPositionStore_loadBagContextWithCompletionBlock___block_invoke_2;
  v2[3] = &unk_24E2A7B08;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_onQueueLoadBagContextWithCompletionHandler:", v2);

}

void __71__SBKUniversalPlaybackPositionStore_loadBagContextWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (v6 && (objc_msgSend(v6, "domainDisabled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_accountForSyncing");

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __80__SBKUniversalPlaybackPositionStore_loadRemoteDomainVersionWithCompletionBlock___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __80__SBKUniversalPlaybackPositionStore_loadRemoteDomainVersionWithCompletionBlock___block_invoke_2;
  v2[3] = &unk_24E2A7AE0;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_onQueueLoadRemoteDomainVersionWithCompletionBlock:", v2);

}

uint64_t __80__SBKUniversalPlaybackPositionStore_loadRemoteDomainVersionWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__SBKUniversalPlaybackPositionStore_checkForAvailabilityWithCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __77__SBKUniversalPlaybackPositionStore_checkForAvailabilityWithCompletionBlock___block_invoke_2;
  v4[3] = &unk_24E2A7B08;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "_onQueueLoadBagContextWithCompletionHandler:", v4);

}

void __77__SBKUniversalPlaybackPositionStore_checkForAvailabilityWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  if (v8 && !objc_msgSend(v8, "domainDisabled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_accountForSyncing");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, BOOL))(v6 + 16))(v6, v7 != 0);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
  }

}

uint64_t __79__SBKUniversalPlaybackPositionStore_synchronizeImmediatelyWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __79__SBKUniversalPlaybackPositionStore_synchronizeImmediatelyWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueueSynchronizeImmediatelyWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

uint64_t __88__SBKUniversalPlaybackPositionStore_pullMetadataItemWithItemIdentifier_completionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueuePullMetadataItemWithItemIdentifier:completionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __70__SBKUniversalPlaybackPositionStore_pushMetadataItem_completionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueuePushMetadataItem:completionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __81__SBKUniversalPlaybackPositionStore_synchronizeImmediatelyWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueueSynchronizeImmediatelyWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

uint64_t __62__SBKUniversalPlaybackPositionStore_setHasLocalChangesToSync___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 17) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __49__SBKUniversalPlaybackPositionStore_resignActive__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 16))
  {
    v2 = result;
    *(_BYTE *)(v1 + 16) = 0;
    objc_msgSend(*(id *)(result + 32), "_onQueueUpdateTimerForActiveChanges");
    result = *(_QWORD *)(v2 + 32);
    if (*(_BYTE *)(result + 17))
    {
      result = objc_msgSend((id)result, "_automaticallySynchronizeLocalChangesOnResignActive");
      if ((_DWORD)result)
      {
        v3 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v4 = 0;
          _os_log_impl(&dword_21E4FD000, v3, OS_LOG_TYPE_DEFAULT, "starting synchronizing changes for resignActive", v4, 2u);
        }

        return objc_msgSend(*(id *)(v2 + 32), "_onQueueSynchronizeWithAutosynchronizeMask:withCompletionBlock:", 4, &__block_literal_global_867);
      }
    }
  }
  return result;
}

void __49__SBKUniversalPlaybackPositionStore_resignActive__block_invoke_43()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_21E4FD000, v0, OS_LOG_TYPE_DEFAULT, "finished synchronizing changes for resignActive", v1, 2u);
  }

}

uint64_t __49__SBKUniversalPlaybackPositionStore_becomeActive__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 16))
  {
    *(_BYTE *)(v1 + 16) = 1;
    return objc_msgSend(*(id *)(result + 32), "_onQueueUpdateTimerForActiveChanges");
  }
  return result;
}

uint64_t __64__SBKUniversalPlaybackPositionStore_initWithInitialUpdateDelay___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onQueueStopTimer");
  return objc_msgSend(*(id *)(a1 + 32), "_onQueueStartNewTimerWithTimeIntervalSinceNow:", *(double *)(*(_QWORD *)(a1 + 32) + 56));
}

void __118__SBKUniversalPlaybackPositionStore_initWithDomain_dataSource_automaticSynchronizeOptions_accountIdentifier_isActive___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateForStoreAccountsChange");
    WeakRetained = v2;
  }

}

void __118__SBKUniversalPlaybackPositionStore_initWithDomain_dataSource_automaticSynchronizeOptions_accountIdentifier_isActive___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateAutorefreshRateSettingAndRestartTimer:", 1);
    WeakRetained = v2;
  }

}

+ (id)keyValueStoreItemIdentifierForItem:(id)a3
{
  return +[SBKUniversalPlaybackPositionMetadata keyValueStoreItemIdentifierForItem:](SBKUniversalPlaybackPositionMetadata, "keyValueStoreItemIdentifierForItem:", a3);
}

@end
