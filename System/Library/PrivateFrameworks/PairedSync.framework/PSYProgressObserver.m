@implementation PSYProgressObserver

- (PSYProgressObserver)init
{
  return -[PSYProgressObserver initWithQueue:](self, "initWithQueue:", 0);
}

- (PSYProgressObserver)initWithQueue:(id)a3
{
  id v4;
  PSYProgressObserver *v5;
  id v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *internalQueue;
  PSYSyncSessionObserver *v10;
  PSYSyncSessionObserver *syncSessionObserver;
  NSObject *v12;
  _QWORD block[4];
  PSYProgressObserver *v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PSYProgressObserver;
  v5 = -[PSYProgressObserver init](&v16, sel_init);
  if (v5)
  {
    if (!v4)
    {
      v4 = (id)MEMORY[0x24BDAC9B8];
      v6 = MEMORY[0x24BDAC9B8];
    }
    objc_storeStrong((id *)&v5->_delegateQueue, v4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.pairedsync.progressobserver", v7);
    internalQueue = v5->_internalQueue;
    v5->_internalQueue = (OS_dispatch_queue *)v8;

    v10 = objc_alloc_init(PSYSyncSessionObserver);
    syncSessionObserver = v5->_syncSessionObserver;
    v5->_syncSessionObserver = v10;

    v12 = v5->_internalQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37__PSYProgressObserver_initWithQueue___block_invoke;
    block[3] = &unk_24C5E4FC8;
    v15 = v5;
    dispatch_async(v12, block);

  }
  return v5;
}

uint64_t __37__PSYProgressObserver_initWithQueue___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setDelegate:");
  return objc_msgSend(*(id *)(a1 + 32), "_updateState");
}

- (NSDictionary)activityErrors
{
  return 0;
}

- (double)totalProgress
{
  NSObject *internalQueue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__PSYProgressObserver_totalProgress__block_invoke;
  v5[3] = &unk_24C5E5018;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__PSYProgressObserver_totalProgress__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "sessionProgress");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)activityProgress
{
  NSObject *internalQueue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__PSYProgressObserver_activityProgress__block_invoke;
  v5[3] = &unk_24C5E5660;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __39__PSYProgressObserver_activityProgress__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "firstIncompleteActivity");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activityProgress");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2;

}

- (NSString)activityLabel
{
  NSObject *internalQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__PSYProgressObserver_activityLabel__block_invoke;
  v5[3] = &unk_24C5E5660;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __36__PSYProgressObserver_activityLabel__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "firstIncompleteActivity");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activityInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "label");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)_updateState
{
  PSYSyncSessionObserver *syncSessionObserver;
  _QWORD v3[5];

  syncSessionObserver = self->_syncSessionObserver;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __35__PSYProgressObserver__updateState__block_invoke;
  v3[3] = &unk_24C5E56B0;
  v3[4] = self;
  -[PSYSyncSessionObserver startObservingSyncSessionsWithCompletion:](syncSessionObserver, "startObservingSyncSessionsWithCompletion:", v3);
}

void __35__PSYProgressObserver__updateState__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  id v13;

  v7 = a2;
  v8 = a3;
  if (!a4)
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(NSObject **)(v9 + 24);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __35__PSYProgressObserver__updateState__block_invoke_2;
    block[3] = &unk_24C5E5688;
    block[4] = v9;
    v12 = v7;
    v13 = v8;
    dispatch_async(v10, block);

  }
}

void __35__PSYProgressObserver__updateState__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[5];

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
  v2 = objc_msgSend(*(id *)(a1 + 48), "mutableCopy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__PSYProgressObserver__updateState__block_invoke_3;
  block[3] = &unk_24C5E4FC8;
  block[4] = v5;
  dispatch_async(v6, block);
}

void __35__PSYProgressObserver__updateState__block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "progressObserverDidChangeState:", *(_QWORD *)(a1 + 32));

}

- (int64_t)progressObserverState
{
  NSObject *internalQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__PSYProgressObserver_progressObserverState__block_invoke;
  v5[3] = &unk_24C5E5660;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __44__PSYProgressObserver_progressObserverState__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;

  +[PSYRegistrySingleton registry](PSYRegistrySingleton, "registry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairingID");
  v8 = objc_claimAutoreleasedReturnValue();

  v3 = (void *)v8;
  if (v8)
  {
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "containsObject:", v8);
    v3 = (void *)v8;
    if ((v4 & 1) != 0)
    {
      v5 = 4;
LABEL_7:
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
      goto LABEL_8;
    }
  }
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (v6)
  {
    v7 = objc_msgSend(v6, "syncSessionState");
    v3 = (void *)v8;
    if (v7 <= 2)
    {
      v5 = qword_20CFF66F8[v7];
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (BOOL)_shouldHandleSyncSession:(id)a3
{
  return objc_msgSend(a3, "syncSessionType") == 0;
}

- (void)syncSessionObserver:(id)a3 didReceiveUpdate:(id)a4
{
  id v5;
  void *v6;
  _BOOL4 v7;
  NSObject *internalQueue;
  _QWORD v9[5];
  id v10;

  v5 = a4;
  objc_msgSend(v5, "updatedSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PSYProgressObserver _shouldHandleSyncSession:](self, "_shouldHandleSyncSession:", v6);

  if (v7)
  {
    internalQueue = self->_internalQueue;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __60__PSYProgressObserver_syncSessionObserver_didReceiveUpdate___block_invoke;
    v9[3] = &unk_24C5E4FF0;
    v9[4] = self;
    v10 = v5;
    dispatch_async(internalQueue, v9);

  }
}

void __60__PSYProgressObserver_syncSessionObserver_didReceiveUpdate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 40), "updatedSession");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  objc_msgSend(*(id *)(a1 + 40), "originalSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionProgress");
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 40), "updatedSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sessionProgress");
  v10 = vabdd_f64(v7, v9);

  v11 = MEMORY[0x24BDAC760];
  if (v10 > 0.00000011920929)
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(NSObject **)(v12 + 32);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__PSYProgressObserver_syncSessionObserver_didReceiveUpdate___block_invoke_2;
    block[3] = &unk_24C5E4FC8;
    block[4] = v12;
    dispatch_async(v13, block);
  }
  v28[0] = v11;
  v28[1] = 3221225472;
  v28[2] = __60__PSYProgressObserver_syncSessionObserver_didReceiveUpdate___block_invoke_3;
  v28[3] = &unk_24C5E56D8;
  v14 = *(void **)(a1 + 40);
  v28[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v14, "enumerateNewlyCompletedActivitiesWithBlock:", v28);
  objc_msgSend(*(id *)(a1 + 40), "originalSession");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "syncSessionState");
  objc_msgSend(*(id *)(a1 + 40), "updatedSession");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "syncSessionState");

  if (v16 != v18)
  {
    v19 = *(_QWORD *)(a1 + 32);
    v20 = *(NSObject **)(v19 + 32);
    v27[0] = v11;
    v27[1] = 3221225472;
    v27[2] = __60__PSYProgressObserver_syncSessionObserver_didReceiveUpdate___block_invoke_5;
    v27[3] = &unk_24C5E4FC8;
    v27[4] = v19;
    dispatch_async(v20, v27);
  }
  objc_msgSend(*(id *)(a1 + 40), "updatedSession");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "syncSessionState");

  if (v22 == 2)
  {
    v23 = *(void **)(a1 + 40);
    v24 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    objc_msgSend(v23, "updatedSession");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "pairingIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v26);

  }
}

void __60__PSYProgressObserver_syncSessionObserver_didReceiveUpdate___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "progressObserverDidChangeProgress:", *(_QWORD *)(a1 + 32));

}

void __60__PSYProgressObserver_syncSessionObserver_didReceiveUpdate___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 32);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __60__PSYProgressObserver_syncSessionObserver_didReceiveUpdate___block_invoke_4;
  v8[3] = &unk_24C5E4FF0;
  v8[4] = v5;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __60__PSYProgressObserver_syncSessionObserver_didReceiveUpdate___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "activityInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "progressObserver:didFinishActivity:withError:", v2, v4, v5);

}

void __60__PSYProgressObserver_syncSessionObserver_didReceiveUpdate___block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "progressObserverDidChangeState:", *(_QWORD *)(a1 + 32));

}

- (void)syncSessionObserver:(id)a3 receivedSyncSession:(id)a4
{
  id v5;
  NSObject *internalQueue;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  if (-[PSYProgressObserver _shouldHandleSyncSession:](self, "_shouldHandleSyncSession:", v5))
  {
    internalQueue = self->_internalQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __63__PSYProgressObserver_syncSessionObserver_receivedSyncSession___block_invoke;
    v7[3] = &unk_24C5E4FF0;
    v7[4] = self;
    v8 = v5;
    dispatch_async(internalQueue, v7);

  }
}

void __63__PSYProgressObserver_syncSessionObserver_receivedSyncSession___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__PSYProgressObserver_syncSessionObserver_receivedSyncSession___block_invoke_2;
  block[3] = &unk_24C5E4FC8;
  block[4] = v2;
  dispatch_async(v3, block);
}

void __63__PSYProgressObserver_syncSessionObserver_receivedSyncSession___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "progressObserverDidChangeState:", *(_QWORD *)(a1 + 32));

}

- (PSYProgressObserverDelegate)delegate
{
  return (PSYProgressObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_completedInitialSyncPairingIDs, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_currentSyncSession, 0);
  objc_storeStrong((id *)&self->_syncSessionObserver, 0);
}

@end
