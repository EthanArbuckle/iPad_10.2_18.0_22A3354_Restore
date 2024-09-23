@implementation PUIPosterSnapshotter

+ (id)completionQueue
{
  if (completionQueue_onceToken != -1)
    dispatch_once(&completionQueue_onceToken, &__block_literal_global_15);
  return (id)completionQueue_completionQueue;
}

void __39__PUIPosterSnapshotter_completionQueue__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE0BE18], "serial");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "serviceClass:relativePriority:", 33, 10);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "attributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = BSDispatchQueueCreateWithAttributes();
  v3 = (void *)completionQueue_completionQueue;
  completionQueue_completionQueue = v2;

}

- (void)dealloc
{
  objc_super v3;

  -[PUIPosterSnapshotter _teardownAllSnapshots](self, "_teardownAllSnapshots");
  -[PFPosterExtensionInstance removeInstanceObserver:](self->_extensionInstance, "removeInstanceObserver:", self);
  -[PUIPosterSnapshotter _assertionLock_invalidateSessionAssertions](self, "_assertionLock_invalidateSessionAssertions");
  v3.receiver = self;
  v3.super_class = (Class)PUIPosterSnapshotter;
  -[PUIPosterSnapshotter dealloc](&v3, sel_dealloc);
}

- (PUIPosterSnapshotter)initWithExtensionInstance:(id)a3
{
  id v5;
  void *v6;
  PUIPosterSnapshotter *v7;
  uint64_t v8;
  NSMutableArray *lock_enqueuedSnapshots;
  uint64_t v10;
  BSAtomicSignal *invalidationSignal;
  PUIPosterSnapshotter *result;
  void *v13;
  objc_super v14;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v14.receiver = self;
    v14.super_class = (Class)PUIPosterSnapshotter;
    v7 = -[PUIPosterSnapshotter init](&v14, sel_init);
    if (v7)
    {
      v8 = objc_opt_new();
      lock_enqueuedSnapshots = v7->_lock_enqueuedSnapshots;
      v7->_lock_enqueuedSnapshots = (NSMutableArray *)v8;

      v10 = objc_opt_new();
      invalidationSignal = v7->_invalidationSignal;
      v7->_invalidationSignal = (BSAtomicSignal *)v10;

      v7->_lock._os_unfair_lock_opaque = 0;
      objc_storeStrong((id *)&v7->_extensionInstance, a3);
      objc_msgSend(v6, "addInstanceObserver:", v7);
    }

    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("extensionInstance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIPosterSnapshotter initWithExtensionInstance:].cold.1();
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    result = (PUIPosterSnapshotter *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)extensionInfoString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PFPosterExtensionInstance extension](self->_extensionInstance, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFPosterExtensionInstance instanceIdentifier](self->_extensionInstance, "instanceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ id: %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIPosterSnapshotter extensionInfoString](self, "extensionInfoString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("extension"));

  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)enqueueSnapshotRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _PUIPosterEnqueuedSnapshot *v8;
  NSObject *v9;
  os_unfair_lock_s *p_lock;
  NSObject *v11;
  void *v12;
  NSMutableArray *lock_enqueuedSnapshots;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  PUIPosterSnapshotter *v18;
  void *v19;
  unint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  _QWORD block[4];
  id v25;
  uint8_t buf[4];
  PUIPosterSnapshotter *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  v8 = -[_PUIPosterEnqueuedSnapshot initWithRequest:completion:]([_PUIPosterEnqueuedSnapshot alloc], "initWithRequest:completion:", v7, v6);

  if (-[BSAtomicSignal hasBeenSignalled](self->_invalidationSignal, "hasBeenSignalled"))
  {
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "completionQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __58__PUIPosterSnapshotter_enqueueSnapshotRequest_completion___block_invoke;
      block[3] = &unk_25154C148;
      v25 = v6;
      dispatch_async(v9, block);

    }
  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    PUILogSnapshotter();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[_PUIPosterEnqueuedSnapshot logIdentifier](v8, "logIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = self;
      v28 = 2114;
      v29 = v12;
      _os_log_impl(&dword_24464E000, v11, OS_LOG_TYPE_DEFAULT, "(%{public}@) adding snapshot to queue: %{public}@", buf, 0x16u);

    }
    -[NSMutableArray addObject:](self->_lock_enqueuedSnapshots, "addObject:", v8);
    lock_enqueuedSnapshots = self->_lock_enqueuedSnapshots;
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("priority"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v14;
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("date"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray sortUsingDescriptors:](lock_enqueuedSnapshots, "sortUsingDescriptors:", v16);

    if (self->_lock_state)
    {
      PUILogSnapshotter();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        -[PUIPosterSnapshotter logIdentifier](self, "logIdentifier");
        v18 = (PUIPosterSnapshotter *)objc_claimAutoreleasedReturnValue();
        -[_PUIPosterEnqueuedSnapshot logIdentifier](v8, "logIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = self->_lock_state - 1;
        if (v20 > 2)
          v21 = CFSTR("Idle");
        else
          v21 = *(&off_25154C208 + v20);
        v22 = -[NSMutableArray count](self->_lock_enqueuedSnapshots, "count");
        -[PUIPosterSceneSnapshotter logIdentifier](self->_lock_sceneSnapshotter, "logIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v27 = v18;
        v28 = 2114;
        v29 = v19;
        v30 = 2114;
        v31 = v21;
        v32 = 2050;
        v33 = v22;
        v34 = 2114;
        v35 = v23;
        _os_log_impl(&dword_24464E000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: (%{public}@) Snapshot enqueued and waiting (state: %{public}@, queue length %{public}lu, current snapshot: %{public}@)", buf, 0x34u);

      }
      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      self->_lock_state = 1;
      os_unfair_lock_unlock(&self->_lock);
      BSDispatchMain();
    }
  }

}

void __58__PUIPosterSnapshotter_enqueueSnapshotRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "pui_errorWithCode:", 5);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __58__PUIPosterSnapshotter_enqueueSnapshotRequest_completion___block_invoke_25(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_executeNextSnapshotIfPossible");
}

- (void)_mainQueue_executeNextSnapshotIfPossible
{
  int v3;
  int v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = *(unsigned __int8 *)(a2 + 65);
  v5 = 136315650;
  v6 = "-[PUIPosterSnapshotter _mainQueue_executeNextSnapshotIfPossible]";
  v7 = 1024;
  v8 = v3;
  v9 = 1024;
  v10 = v4;
  _os_log_error_impl(&dword_24464E000, log, OS_LOG_TYPE_ERROR, "Snapshotter state error: shouldn't call %s while waiting: for retry? %d; for extension? %d",
    (uint8_t *)&v5,
    0x18u);
  OUTLINED_FUNCTION_6();
}

- (void)_lock_retryStartupLater
{
  dispatch_time_t v2;
  _QWORD v3[4];
  id v4;
  id location;

  if (!self->_lock_waitingForRetry)
  {
    self->_lock_waitingForRetry = 1;
    objc_initWeak(&location, self);
    v2 = dispatch_time(0, 2000000000);
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __47__PUIPosterSnapshotter__lock_retryStartupLater__block_invoke;
    v3[3] = &unk_25154C170;
    objc_copyWeak(&v4, &location);
    dispatch_after(v2, MEMORY[0x24BDAC9B8], v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __47__PUIPosterSnapshotter__lock_retryStartupLater__block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v3;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained + 8;
    v3 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 8);
    LOBYTE(v3[16]._os_unfair_lock_opaque) = 0;
    os_unfair_lock_unlock(v2);
    -[os_unfair_lock_s _mainQueue_executeNextSnapshotIfPossible](v3, "_mainQueue_executeNextSnapshotIfPossible");
    WeakRetained = v3;
  }

}

- (void)_teardownAllSnapshots
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v17;
  PUIPosterSceneSnapshotter *lock_sceneSnapshotter;
  os_unfair_lock_t lock;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PUIPosterSnapshotter logIdentifier](self, "logIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PUILogSnapshotter();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[NSMutableArray count](self->_lock_enqueuedSnapshots, "count");
    *(_DWORD *)buf = 138543618;
    v32 = v3;
    v33 = 2048;
    v34 = v5;
    _os_log_impl(&dword_24464E000, v4, OS_LOG_TYPE_DEFAULT, "(%{public}@) Tearing down %lu enqueued snapshots", buf, 0x16u);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = self->_lock_enqueuedSnapshots;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  v8 = MEMORY[0x24BDAC760];
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v27;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v11);
        objc_msgSend((id)objc_opt_class(), "completionQueue");
        v13 = objc_claimAutoreleasedReturnValue();
        block[0] = v8;
        block[1] = 3221225472;
        block[2] = __45__PUIPosterSnapshotter__teardownAllSnapshots__block_invoke;
        block[3] = &unk_25154BFC0;
        v24 = v3;
        v25 = v12;
        dispatch_async(v13, block);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v9);
  }

  -[NSMutableArray removeAllObjects](self->_lock_enqueuedSnapshots, "removeAllObjects");
  if (self->_lock_sceneSnapshotter)
  {
    PUILogSnapshotter();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v32 = v3;
      _os_log_impl(&dword_24464E000, v14, OS_LOG_TYPE_DEFAULT, "(%{public}@) Tearing down active scene snapshotter", buf, 0xCu);
    }

    -[PUIPosterSceneSnapshotter setDelegate:](self->_lock_sceneSnapshotter, "setDelegate:", 0);
    -[PUIPosterSceneSnapshotter snapshotInfo](self->_lock_sceneSnapshotter, "snapshotInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "completionQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    v20[0] = v8;
    v20[1] = 3221225472;
    v20[2] = __45__PUIPosterSnapshotter__teardownAllSnapshots__block_invoke_27;
    v20[3] = &unk_25154BFC0;
    v21 = v3;
    v22 = v15;
    v17 = v15;
    dispatch_async(v16, v20);

    -[PUIPosterSceneSnapshotter invalidate](self->_lock_sceneSnapshotter, "invalidate");
    lock_sceneSnapshotter = self->_lock_sceneSnapshotter;
    self->_lock_sceneSnapshotter = 0;

  }
  os_unfair_lock_unlock(lock);

}

void __45__PUIPosterSnapshotter__teardownAllSnapshots__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  PUILogSnapshotter();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "logIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v3;
    v9 = 2114;
    v10 = v4;
    _os_log_impl(&dword_24464E000, v2, OS_LOG_TYPE_DEFAULT, "(%{public}@) Invalidated on queue: %{public}@", (uint8_t *)&v7, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "completion");
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "pui_errorWithCode:", 5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v5)[2](v5, 0, v6);

  }
  objc_msgSend(*(id *)(a1 + 40), "invalidate");

}

void __45__PUIPosterSnapshotter__teardownAllSnapshots__block_invoke_27(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  PUILogSnapshotter();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "logIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v3;
    v9 = 2114;
    v10 = v4;
    _os_log_impl(&dword_24464E000, v2, OS_LOG_TYPE_DEFAULT, "(%{public}@) Invalidated active scene snapshotter for: %{public}@", (uint8_t *)&v7, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "completion");
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "pui_errorWithCode:", 5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v5)[2](v5, 0, v6);

  }
  objc_msgSend(*(id *)(a1 + 40), "invalidate");

}

- (void)sceneSnapshotterDidFinish:(id)a3 result:(id)a4 error:(id)a5
{
  PUIPosterSceneSnapshotter *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  PUIPosterSceneSnapshotter *lock_sceneSnapshotter;
  uint64_t v20;
  _QWORD v21[5];
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  PUIPosterSnapshotter *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = (PUIPosterSceneSnapshotter *)a3;
  v9 = a4;
  v10 = a5;
  BSDispatchQueueAssertMain();
  os_unfair_lock_lock(&self->_lock);
  -[PUIPosterSceneSnapshotter snapshotInfo](v8, "snapshotInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIPosterSceneSnapshotter setDelegate:](v8, "setDelegate:", 0);
  if (v9
    || (-[BSAtomicSignal hasBeenSignalled](self->_invalidationSignal, "hasBeenSignalled") & 1) != 0
    || (int)objc_msgSend(v11, "retryCount") < 1)
  {
    PUILogSnapshotter();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "logIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = self;
      v28 = 2114;
      v29 = v15;
      _os_log_impl(&dword_24464E000, v14, OS_LOG_TYPE_DEFAULT, "(%{public}@) scene snapshotter finished for: %{public}@", buf, 0x16u);

    }
    objc_msgSend(v11, "completion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend((id)objc_opt_class(), "completionQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __63__PUIPosterSnapshotter_sceneSnapshotterDidFinish_result_error___block_invoke;
      block[3] = &unk_25154BD20;
      v25 = v16;
      v23 = v9;
      v24 = v10;
      dispatch_async(v17, block);

    }
  }
  else
  {
    PUILogSnapshotter();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "logIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = self;
      v28 = 2114;
      v29 = v13;
      _os_log_impl(&dword_24464E000, v12, OS_LOG_TYPE_DEFAULT, "(%{public}@) Retrying scene snapshotter for: %{public}@", buf, 0x16u);

    }
    objc_msgSend(v11, "setRetryCount:", objc_msgSend(v11, "retryCount") - 1);
    -[NSMutableArray insertObject:atIndex:](self->_lock_enqueuedSnapshots, "insertObject:atIndex:", v11, 0);
  }
  if (self->_lock_sceneSnapshotter == v8)
  {
    PUILogSnapshotter();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v27 = self;
      _os_log_impl(&dword_24464E000, v18, OS_LOG_TYPE_DEFAULT, "(%{public}@) next in line!", buf, 0xCu);
    }

    lock_sceneSnapshotter = self->_lock_sceneSnapshotter;
    self->_lock_sceneSnapshotter = 0;

    v20 = MEMORY[0x24BDAC760];
    self->_lock_state = 3;
    v21[0] = v20;
    v21[1] = 3221225472;
    v21[2] = __63__PUIPosterSnapshotter_sceneSnapshotterDidFinish_result_error___block_invoke_28;
    v21[3] = &unk_25154BB88;
    v21[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], v21);
  }
  -[PUIPosterSceneSnapshotter invalidate](v8, "invalidate");
  os_unfair_lock_unlock(&self->_lock);

}

uint64_t __63__PUIPosterSnapshotter_sceneSnapshotterDidFinish_result_error___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __63__PUIPosterSnapshotter_sceneSnapshotterDidFinish_result_error___block_invoke_28(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_executeNextSnapshotIfPossible");
}

- (void)_mainQueue_lock_startExtension
{
  _EXExtensionProcess *lock_mainQueue_process;
  NSObject *v4;
  _QWORD block[5];

  if (!self->_lock_waitingForStartExtension)
  {
    self->_lock_waitingForStartExtension = 1;
    lock_mainQueue_process = self->_lock_mainQueue_process;
    self->_lock_mainQueue_process = 0;

    objc_msgSend(MEMORY[0x24BE74D38], "sharedWorkloop");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__PUIPosterSnapshotter__mainQueue_lock_startExtension__block_invoke;
    block[3] = &unk_25154BB88;
    block[4] = self;
    dispatch_async(v4, block);

  }
}

uint64_t __54__PUIPosterSnapshotter__mainQueue_lock_startExtension__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[5];
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  PUILogSnapshotter();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v9 = v3;
    _os_log_impl(&dword_24464E000, v2, OS_LOG_TYPE_DEFAULT, "(%{public}@) Booting extension (if necessary)", buf, 0xCu);
  }

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 88);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__PUIPosterSnapshotter__mainQueue_lock_startExtension__block_invoke_30;
  v7[3] = &unk_25154C1C0;
  v7[4] = v4;
  return objc_msgSend(v5, "bootupExtensionInstance:", v7);
}

void __54__PUIPosterSnapshotter__mainQueue_lock_startExtension__block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  PUILogSnapshotter();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v15 = v8;
    _os_log_impl(&dword_24464E000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@) Booted extension", buf, 0xCu);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__PUIPosterSnapshotter__mainQueue_lock_startExtension__block_invoke_31;
  block[3] = &unk_25154C198;
  block[4] = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __54__PUIPosterSnapshotter__mainQueue_lock_startExtension__block_invoke_31(id *a1)
{
  uint64_t *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;

  v2 = (uint64_t *)(a1 + 4);
  if ((objc_msgSend(*((id *)a1[4] + 9), "hasBeenSignalled") & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)a1[4] + 8);
    *((_BYTE *)a1[4] + 65) = 0;
    v3 = a1[5];
    if (v3)
    {
      if ((objc_msgSend(v3, "isValid") & 1) == 0)
      {
        PUILogSnapshotter();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
          __54__PUIPosterSnapshotter__mainQueue_lock_startExtension__block_invoke_31_cold_2((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);

      }
      objc_storeStrong((id *)a1[4] + 6, a1[5]);
      os_unfair_lock_unlock((os_unfair_lock_t)a1[4] + 8);
      objc_msgSend(a1[4], "_mainQueue_executeNextSnapshotIfPossible");
    }
    else
    {
      PUILogSnapshotter();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __54__PUIPosterSnapshotter__mainQueue_lock_startExtension__block_invoke_31_cold_1(v2, (uint64_t)a1, v11);

      objc_msgSend(a1[6], "domain");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BE74D80]))
      {
        v13 = objc_msgSend(a1[6], "code");

        if (v13 == 2)
        {
          os_unfair_lock_unlock((os_unfair_lock_t)(*v2 + 32));
          objc_msgSend((id)*v2, "invalidate");
          return;
        }
      }
      else
      {

      }
      objc_msgSend((id)*v2, "_lock_retryStartupLater");
      os_unfair_lock_unlock((os_unfair_lock_t)(*v2 + 32));
    }
  }
}

- (void)extensionInstanceProcessDidInterrupt:(id)a3
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __61__PUIPosterSnapshotter_extensionInstanceProcessDidInterrupt___block_invoke;
  v3[3] = &unk_25154C170;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __61__PUIPosterSnapshotter_extensionInstanceProcessDidInterrupt___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_mainQueue_extensionProcessDidInterrupt");

}

- (void)_mainQueue_extensionProcessDidInterrupt
{
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "logIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "logIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v4;
  v9 = 2114;
  v10 = v5;
  OUTLINED_FUNCTION_7(&dword_24464E000, a2, v6, "(%{public}@) Extension process interrupted while snapshotting: %{public}@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_10();
}

- (void)extensionInstanceDidInvalidate:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  uint8_t buf[4];
  PUIPosterSnapshotter *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PUILogSnapshotter();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v9 = self;
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_24464E000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@) PFPosterExtensionInstance did invalidate: %{public}@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__PUIPosterSnapshotter_extensionInstanceDidInvalidate___block_invoke;
  block[3] = &unk_25154C170;
  objc_copyWeak(&v7, (id *)buf);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);

}

void __55__PUIPosterSnapshotter_extensionInstanceDidInvalidate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

- (BOOL)_assertionLock_mainQueue_updateAssertionsForExtension
{
  BOOL v3;
  _EXExtensionProcess *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  RBSAssertion *assertionLock_memoryAssertion;
  NSObject *v17;
  char v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  RBSAssertion *v22;
  NSObject *v23;
  void *v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  RBSAssertion *assertionLock_runtimeAssertion;
  char v33;
  NSObject *v34;
  RBSAssertion *v35;
  id v37;
  id v38;
  _OWORD v39[2];
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  if ((-[BSAtomicSignal hasBeenSignalled](self->_invalidationSignal, "hasBeenSignalled") & 1) == 0)
  {
    v4 = self->_lock_mainQueue_process;
    v5 = (void *)MEMORY[0x24BE80D38];
    -[PFPosterExtensionInstance hostConfiguration](self->_extensionInstance, "hostConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rbsProcessIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "targetWithProcessIdentity:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x24BE0BDB8];
    if (v4)
      -[_EXExtensionProcess auditToken](v4, "auditToken");
    else
      memset(v39, 0, sizeof(v39));
    objc_msgSend(v9, "tokenFromAuditToken:", v39);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFPosterExtensionInstance extension](self->_extensionInstance, "extension");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "posterExtensionBundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUIPosterSnapshotter logIdentifier](self, "logIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      PUILogSnapshotter();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[PUIPosterSnapshotter _assertionLock_mainQueue_updateAssertionsForExtension].cold.1((uint64_t)v13, v17, v26, v27, v28, v29, v30, v31);
      goto LABEL_27;
    }
    if (!-[RBSAssertion isValid](self->_assertionLock_memoryAssertion, "isValid")
      || (-[RBSAssertion target](self->_assertionLock_memoryAssertion, "target"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "isEqual:", v8),
          v14,
          (v15 & 1) == 0))
    {
      -[RBSAssertion invalidate](self->_assertionLock_memoryAssertion, "invalidate");
      assertionLock_memoryAssertion = self->_assertionLock_memoryAssertion;
      self->_assertionLock_memoryAssertion = 0;

      objc_msgSend(MEMORY[0x24BE80B10], "pf_posterUpdateRuntimeAssertionForTarget:explanation:", v8, v13);
      v17 = objc_claimAutoreleasedReturnValue();
      v38 = 0;
      v18 = -[NSObject acquireWithError:](v17, "acquireWithError:", &v38);
      v19 = v38;
      PUILogSnapshotter();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if ((v18 & 1) == 0)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[PUIPosterSnapshotter _assertionLock_mainQueue_updateAssertionsForExtension].cold.3();
LABEL_26:

LABEL_27:
        v3 = 0;
LABEL_28:

        goto LABEL_29;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v41 = v13;
        _os_log_impl(&dword_24464E000, v21, OS_LOG_TYPE_DEFAULT, "(%{public}@) Snapshot acquired memory assertion", buf, 0xCu);
      }

      v22 = self->_assertionLock_memoryAssertion;
      self->_assertionLock_memoryAssertion = (RBSAssertion *)v17;
      v23 = v17;

    }
    if (-[RBSAssertion isValid](self->_assertionLock_runtimeAssertion, "isValid"))
    {
      -[RBSAssertion target](self->_assertionLock_runtimeAssertion, "target");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isEqual:", v8);

      if ((v25 & 1) != 0)
      {
        v3 = 1;
LABEL_29:

        return v3;
      }
    }
    -[RBSAssertion invalidate](self->_assertionLock_runtimeAssertion, "invalidate");
    assertionLock_runtimeAssertion = self->_assertionLock_runtimeAssertion;
    self->_assertionLock_runtimeAssertion = 0;

    objc_msgSend(MEMORY[0x24BE80B10], "pui_posterRuntimeAssertionForTarget:explanation:sceneType:auditToken:posterProviderBundleIdentifier:", v8, v13, CFSTR("PosterKit.rendering"), v10, v12);
    v17 = objc_claimAutoreleasedReturnValue();
    v37 = 0;
    v33 = -[NSObject acquireWithError:](v17, "acquireWithError:", &v37);
    v19 = v37;
    PUILogSnapshotter();
    v34 = objc_claimAutoreleasedReturnValue();
    v21 = v34;
    if ((v33 & 1) != 0)
    {
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v41 = v13;
        _os_log_impl(&dword_24464E000, v21, OS_LOG_TYPE_DEFAULT, "(%{public}@) Snapshot acquired runtime assertion", buf, 0xCu);
      }

      v35 = self->_assertionLock_runtimeAssertion;
      self->_assertionLock_runtimeAssertion = (RBSAssertion *)v17;
      v17 = v17;

      v3 = 1;
      goto LABEL_28;
    }
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[PUIPosterSnapshotter _assertionLock_mainQueue_updateAssertionsForExtension].cold.2();
    goto LABEL_26;
  }
  return 0;
}

- (void)_assertionLock_invalidateSessionAssertions
{
  RBSAssertion *assertionLock_memoryAssertion;
  RBSAssertion *assertionLock_runtimeAssertion;

  -[RBSAssertion invalidate](self->_assertionLock_memoryAssertion, "invalidate");
  assertionLock_memoryAssertion = self->_assertionLock_memoryAssertion;
  self->_assertionLock_memoryAssertion = 0;

  -[RBSAssertion invalidate](self->_assertionLock_runtimeAssertion, "invalidate");
  assertionLock_runtimeAssertion = self->_assertionLock_runtimeAssertion;
  self->_assertionLock_runtimeAssertion = 0;

}

- (BOOL)isValid
{
  return -[BSAtomicSignal hasBeenSignalled](self->_invalidationSignal, "hasBeenSignalled") ^ 1;
}

- (void)invalidate
{
  NSObject *v3;
  PFPosterExtensionInstance *extensionInstance;
  int v5;
  PUIPosterSnapshotter *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (-[BSAtomicSignal signal](self->_invalidationSignal, "signal"))
  {
    PUILogSnapshotter();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = self;
      _os_log_impl(&dword_24464E000, v3, OS_LOG_TYPE_DEFAULT, "PUIPosterSnapshotter invalidate: %{public}@", (uint8_t *)&v5, 0xCu);
    }

    -[PUIPosterSnapshotter _teardownAllSnapshots](self, "_teardownAllSnapshots");
    -[PFPosterExtensionInstance removeInstanceObserver:](self->_extensionInstance, "removeInstanceObserver:", self);
    extensionInstance = self->_extensionInstance;
    self->_extensionInstance = 0;

    os_unfair_lock_lock(&self->_assertionLock);
    -[PUIPosterSnapshotter _assertionLock_invalidateSessionAssertions](self, "_assertionLock_invalidateSessionAssertions");
    os_unfair_lock_unlock(&self->_assertionLock);
  }
}

- (void)installRequestAsActive:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD block[5];
  id v15;
  id v16;
  SEL v17;

  v7 = a3;
  v8 = a4;
  if ((MEMORY[0x249514E6C]("-[PUIPosterSnapshotter installRequestAsActive:completion:]") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_BSIsInternalInstall(__PRETTY_FUNCTION__)"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIPosterSnapshotter installRequestAsActive:completion:].cold.4();
LABEL_17:
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244672C14);
  }
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("request"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIPosterSnapshotter installRequestAsActive:completion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244672C78);
  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("completion"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIPosterSnapshotter installRequestAsActive:completion:].cold.2();
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244672CDCLL);
  }
  if (!self->_extensionInstance)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_extensionInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIPosterSnapshotter installRequestAsActive:completion:].cold.3();
    goto LABEL_17;
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__PUIPosterSnapshotter_installRequestAsActive_completion___block_invoke;
  block[3] = &unk_25154C1E8;
  block[4] = self;
  v15 = v7;
  v16 = v8;
  v17 = a2;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __58__PUIPosterSnapshotter_installRequestAsActive_completion___block_invoke(_QWORD *a1)
{
  PUIPosterSceneSnapshotter *v2;
  uint64_t v3;
  void *v4;
  PUIPosterSceneSnapshotter *v5;
  void *v6;
  _PUIPosterEnqueuedSnapshot *v7;

  if (*(_QWORD *)(a1[4] + 40))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("self->_lock_sceneSnapshotter == nil"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __58__PUIPosterSnapshotter_installRequestAsActive_completion___block_invoke_cold_1();
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    v7 = -[_PUIPosterEnqueuedSnapshot initWithRequest:completion:]([_PUIPosterEnqueuedSnapshot alloc], "initWithRequest:completion:", a1[5], a1[6]);
    -[_PUIPosterEnqueuedSnapshot setRetryCount:](v7, "setRetryCount:", 0);
    v2 = -[PUIPosterSceneSnapshotter initWithExtensionInstance:snapshotInfo:]([PUIPosterSceneSnapshotter alloc], "initWithExtensionInstance:snapshotInfo:", *(_QWORD *)(a1[4] + 88), v7);
    -[PUIPosterSceneSnapshotter setDelegate:](v2, "setDelegate:", a1[4]);
    os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 32));
    v3 = a1[4];
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;
    v5 = v2;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 32));
  }
}

- (void)fireSceneDeactivationErrorForTesting:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if ((MEMORY[0x249514E6C]("-[PUIPosterSnapshotter fireSceneDeactivationErrorForTesting:]") & 1) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__PUIPosterSnapshotter_fireSceneDeactivationErrorForTesting___block_invoke;
    block[3] = &unk_25154BFC0;
    block[4] = self;
    v8 = v4;
    v5 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_BSIsInternalInstall(__PRETTY_FUNCTION__)"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIPosterSnapshotter fireSceneDeactivationErrorForTesting:].cold.1();
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

void __61__PUIPosterSnapshotter_fireSceneDeactivationErrorForTesting___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "fireSceneDeactivationErrorForTesting:", *(_QWORD *)(a1 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
}

- (PFPosterExtensionInstance)extensionInstance
{
  return self->_extensionInstance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionInstance, 0);
  objc_storeStrong((id *)&self->_providerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_invalidationSignal, 0);
  objc_storeStrong((id *)&self->_lock_mainQueue_process, 0);
  objc_storeStrong((id *)&self->_lock_sceneSnapshotter, 0);
  objc_storeStrong((id *)&self->_assertionLock_memoryAssertion, 0);
  objc_storeStrong((id *)&self->_assertionLock_runtimeAssertion, 0);
  objc_storeStrong((id *)&self->_lock_enqueuedSnapshots, 0);
}

- (void)initWithExtensionInstance:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

void __54__PUIPosterSnapshotter__mainQueue_lock_startExtension__block_invoke_31_cold_1(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = *(_QWORD *)(a2 + 48);
  v5 = 138543618;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  OUTLINED_FUNCTION_7(&dword_24464E000, a3, (uint64_t)a3, "(%{public}@) Error booting extension process:'%@'", (uint8_t *)&v5);
  OUTLINED_FUNCTION_6();
}

void __54__PUIPosterSnapshotter__mainQueue_lock_startExtension__block_invoke_31_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_24464E000, a2, a3, "(%{public}@) Booted extension process is invalid but there was no error!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)_assertionLock_mainQueue_updateAssertionsForExtension
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_24464E000, v0, (uint64_t)v0, "(%{public}@) Snapshot could not acquire memory assertion: %{public}@", v1);
  OUTLINED_FUNCTION_6();
}

- (void)installRequestAsActive:completion:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)installRequestAsActive:completion:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)installRequestAsActive:completion:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)installRequestAsActive:completion:.cold.4()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

void __58__PUIPosterSnapshotter_installRequestAsActive_completion___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(*(SEL *)(v0 + 56));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)fireSceneDeactivationErrorForTesting:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

@end
