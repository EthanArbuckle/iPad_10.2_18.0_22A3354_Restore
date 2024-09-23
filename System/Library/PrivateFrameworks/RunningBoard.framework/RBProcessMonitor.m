@implementation RBProcessMonitor

- (void)suppressUpdatesForIdentity:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__RBProcessMonitor_suppressUpdatesForIdentity___block_invoke;
  v7[3] = &unk_24DD45FF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (OS_dispatch_queue)monitorSerializationQueue
{
  return self->_queue;
}

- (id)statesMatchingConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "stateDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[RBProcessMap allValue](self->_stateMap, "allValue", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v5 = 0;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v11, "process");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v4, "matchesProcess:", v12))
          {
            if (!v5)
            {
              objc_msgSend(MEMORY[0x24BDBCEB8], "array");
              v5 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v5, "addObject:", v11);
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (id)statesMatchingPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[RBProcessMap allValue](self->_stateMap, "allValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v12, "process", (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "matchesProcess:", v13))
          objc_msgSend(v6, "addObject:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v6;
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_observersLock;
  id v5;

  p_observersLock = &self->_observersLock;
  v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  -[NSMutableSet addObject:](self->_observers, "addObject:", v5);
  -[RBHistoricalStatisticsMaintaining notifyMonitorCount:](self->_historicalStatistics, "notifyMonitorCount:", -[NSMutableSet count](self->_observers, "count"));
  os_unfair_lock_unlock(p_observersLock);
  -[RBStateCaptureManaging addItem:](self->_stateCaptureManager, "addItem:", v5);

}

void __49__RBProcessMonitor_unsuppressUpdatesForIdentity___block_invoke(uint64_t a1)
{
  -[RBProcessMonitor _queue_unsuppressUpdatesForIdentity:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

void __47__RBProcessMonitor_suppressUpdatesForIdentity___block_invoke(uint64_t a1)
{
  -[RBProcessMonitor _queue_suppressUpdatesForIdentity:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

void __43__RBProcessMonitor_didUpdateProcessStates___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v7, "identity", (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "processForIdentity:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v7, "updatedState");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[RBProcessMonitor _queue_updateServerState:forProcess:force:](v10, v11, v9, 0);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

- (void)didUpdateProcessStates:(id)a3
{
  id v4;
  NSObject *queue;
  _QWORD v6[4];
  id v7;
  RBProcessMonitor *v8;

  v4 = a3;
  if (objc_msgSend(v4, "hasChanges"))
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __43__RBProcessMonitor_didUpdateProcessStates___block_invoke;
    v6[3] = &unk_24DD45FF0;
    v7 = v4;
    v8 = self;
    dispatch_async(queue, v6);

  }
}

- (void)_queue_updateServerState:(void *)a3 forProcess:(char)a4 force:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  id v27;
  dispatch_time_t v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *context;
  _QWORD block[5];
  id v37;
  char v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  if (a1)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_updateServerState_forProcess_force_, a1, CFSTR("RBProcessMonitor.m"), 238, CFSTR("serverState can not be nil"));

    }
    context = (void *)MEMORY[0x22074BD78]();
    objc_msgSend(v8, "identity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(v7, "identity");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

    objc_msgSend(*(id *)(a1 + 16), "valueForIdentity:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[RBProcessMonitor _clientStateForServerState:process:]((uint64_t)RBProcessMonitor, v7, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v38 = 0;
    if ((a4 & 1) != 0 || objc_msgSend(v14, "isDifferentFromState:significantly:", v13, &v38))
    {
      if (objc_msgSend(v8, "isReported"))
      {
        rbs_monitor_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v12, "shortDescription");
          v34 = v13;
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "taskState");
          NSStringFromRBSTaskState();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "role");
          NSStringFromRBSRole();
          v33 = a4;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "endowmentInfos");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v40 = v17;
          v41 = 2114;
          v42 = v18;
          v43 = 2114;
          v44 = v19;
          v45 = 2112;
          v46 = v20;
          _os_log_impl(&dword_21A8B4000, v16, OS_LOG_TYPE_DEFAULT, "Calculated state for %{public}@: %{public}@ (role: %{public}@) (endowments: %@) ", buf, 0x2Au);

          a4 = v33;
          v13 = v34;
        }

      }
      v21 = objc_msgSend(v15, "isEmptyState");
      v22 = *(void **)(a1 + 16);
      if ((v21 & 1) != 0)
        v23 = (id)objc_msgSend(v22, "removeValueForIdentity:", v12);
      else
        v24 = (id)objc_msgSend(v22, "setValue:forIdentity:", v15, v12);
      v25 = (id)objc_msgSend(*(id *)(a1 + 24), "removeValueForIdentity:", v12);
      if ((a4 & 1) != 0 || v38 || (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v12) & 1) == 0)
      {
        -[RBProcessMonitor _queue_publishState:forIdentity:](a1, v15, v12);
        -[RBProcessMonitor _queue_suppressUpdatesForIdentity:](a1, v12);
        v28 = dispatch_time(0, 100000000);
        v29 = *(NSObject **)(a1 + 88);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __62__RBProcessMonitor__queue_updateServerState_forProcess_force___block_invoke;
        block[3] = &unk_24DD45FF0;
        block[4] = a1;
        v37 = v12;
        dispatch_after(v28, v29, block);

      }
      else
      {
        rbs_monitor_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          -[RBProcessMonitor _queue_updateServerState:forProcess:force:].cold.1();

        v27 = (id)objc_msgSend(*(id *)(a1 + 24), "setValue:forIdentity:", v15, v12);
      }
    }
    else
    {
      rbs_monitor_log();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v12, "shortDescription");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v40 = v31;
        _os_log_impl(&dword_21A8B4000, v30, OS_LOG_TYPE_INFO, "Ignoring insignificant state update for %{public}@", buf, 0xCu);

      }
    }

    objc_autoreleasePoolPop(context);
  }

}

- (void)_queue_suppressUpdatesForIdentity:(uint64_t)a1
{
  id v3;
  id *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;

  v3 = a2;
  if (a1)
  {
    v5 = *(void **)(a1 + 40);
    v4 = (id *)(a1 + 40);
    objc_msgSend(v5, "addObject:", v3);
    if (objc_msgSend(*v4, "countForObject:", v3) == 1)
    {
      rbs_monitor_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[RBProcessMonitor _queue_suppressUpdatesForIdentity:].cold.2((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);

    }
    rbs_monitor_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[RBProcessMonitor _queue_suppressUpdatesForIdentity:].cold.1(v4, (uint64_t)v3, v13);

  }
}

- (void)_queue_unsuppressUpdatesForIdentity:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v3 = a2;
  if (a1)
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "countForObject:", v3);
    if (v4)
    {
      v5 = v4;
      rbs_monitor_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[RBProcessMonitor _queue_unsuppressUpdatesForIdentity:].cold.2(v5, (uint64_t)v3, v6);

      objc_msgSend(*(id *)(a1 + 40), "removeObject:", v3);
      if (v5 == 1)
      {
        rbs_monitor_log();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          -[RBProcessMonitor _queue_unsuppressUpdatesForIdentity:].cold.1((uint64_t)v3, v7, v8, v9, v10, v11, v12, v13);

        objc_msgSend(*(id *)(a1 + 24), "valueForIdentity:", v3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          -[RBProcessMonitor _queue_publishState:forIdentity:](a1, v14, v3);
        objc_msgSend(*(id *)(a1 + 24), "removeIdentity:", v3);

      }
    }
  }

}

+ (id)_clientStateForServerState:(void *)a3 process:
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  v6 = objc_opt_self();
  if (!v4)
  {
    v9 = v6;
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel__clientStateForServerState_process_, v9, CFSTR("RBProcessMonitor.m"), 204, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serverState != nil"));

  }
  objc_msgSend(v4, "clientStateForProcess:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_queue_publishState:(void *)a3 forIdentity:
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _QWORD v25[3];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    rbs_monitor_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[RBProcessMonitor _queue_publishState:forIdentity:].cold.1();

    objc_msgSend(*(id *)(a1 + 32), "valueForIdentity:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "encodeWithPreviousState:", v8);
    v25[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = *(id *)(a1 + 56);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v14++), "processMonitor:didChangeProcessStates:", a1, v9, (_QWORD)v20);
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v12);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    v15 = objc_msgSend(v5, "isEmptyState");
    v16 = *(void **)(a1 + 32);
    if ((v15 & 1) != 0)
    {
      v17 = (id)objc_msgSend(v16, "removeValueForIdentity:", v6);
      v18 = (id)objc_msgSend(*(id *)(a1 + 16), "removeValueForIdentity:", v6);
    }
    else
    {
      v19 = (id)objc_msgSend(v16, "setValue:forIdentity:", v5, v6);
    }

  }
}

void __62__RBProcessMonitor__queue_updateServerState_forProcess_force___block_invoke(uint64_t a1)
{
  -[RBProcessMonitor _queue_unsuppressUpdatesForIdentity:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

uint64_t __49__RBProcessMonitor_trackStateForProcessIdentity___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addIdentity:", *(_QWORD *)(a1 + 40));
}

void __44__RBProcessMonitor_didAddProcess_withState___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addProcess:", *(_QWORD *)(a1 + 40));
  -[RBProcessMonitor _queue_updateServerState:forProcess:force:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 48), *(void **)(a1 + 40), 1);
}

- (id)preventLaunchPredicates
{
  NSSet *preventLaunchPredicates;
  NSSet *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  preventLaunchPredicates = self->_preventLaunchPredicates;
  if (preventLaunchPredicates)
  {
    v4 = preventLaunchPredicates;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)unsuppressUpdatesForIdentity:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__RBProcessMonitor_unsuppressUpdatesForIdentity___block_invoke;
  v7[3] = &unk_24DD45FF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)trackStateForProcessIdentity:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__RBProcessMonitor_trackStateForProcessIdentity___block_invoke;
  v7[3] = &unk_24DD45FF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)didAddProcess:(id)a3 withState:(id)a4
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
  block[2] = __44__RBProcessMonitor_didAddProcess_withState___block_invoke;
  block[3] = &unk_24DD45E60;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)removeObserver:(id)a3
{
  RBStateCaptureManaging *stateCaptureManager;
  id v5;

  stateCaptureManager = self->_stateCaptureManager;
  v5 = a3;
  -[RBStateCaptureManaging removeItem:](stateCaptureManager, "removeItem:", v5);
  os_unfair_lock_lock(&self->_observersLock);
  -[NSMutableSet removeObject:](self->_observers, "removeObject:", v5);

  -[RBHistoricalStatisticsMaintaining notifyMonitorCount:](self->_historicalStatistics, "notifyMonitorCount:", -[NSMutableSet count](self->_observers, "count"));
  os_unfair_lock_unlock(&self->_observersLock);
}

uint64_t __50__RBProcessMonitor_removeStateForProcessIdentity___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeIdentity:", *(_QWORD *)(a1 + 40));
}

uint64_t __47__RBProcessMonitor_didRemoveProcess_withState___block_invoke(uint64_t a1)
{
  -[RBProcessMonitor _queue_updateServerState:forProcess:force:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), 1);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeProcess:", *(_QWORD *)(a1 + 48));
}

- (void)removeStateForProcessIdentity:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__RBProcessMonitor_removeStateForProcessIdentity___block_invoke;
  v7[3] = &unk_24DD45FF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)didRemoveProcess:(id)a3 withState:(id)a4
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
  block[2] = __47__RBProcessMonitor_didRemoveProcess_withState___block_invoke;
  block[3] = &unk_24DD45E60;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

- (RBProcessMonitor)initWithStateCaptureManager:(id)a3 historialStatistics:(id)a4
{
  id v7;
  id v8;
  RBProcessMonitor *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  RBProcessIndex *v13;
  RBProcessIndex *processIndex;
  RBProcessMap *v15;
  RBProcessMap *stateMap;
  RBProcessMap *v17;
  RBProcessMap *suppressedState;
  RBProcessMap *v19;
  RBProcessMap *publishedState;
  NSCountedSet *v21;
  NSCountedSet *suppressedIdentities;
  NSMutableSet *v23;
  NSMutableSet *observers;
  objc_super v26;

  v7 = a3;
  v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)RBProcessMonitor;
  v9 = -[RBProcessMonitor init](&v26, sel_init);
  if (v9)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("RBProcessMonitor", v10);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;

    v13 = objc_alloc_init(RBProcessIndex);
    processIndex = v9->_processIndex;
    v9->_processIndex = v13;

    v15 = objc_alloc_init(RBProcessMap);
    stateMap = v9->_stateMap;
    v9->_stateMap = v15;

    v17 = objc_alloc_init(RBProcessMap);
    suppressedState = v9->_suppressedState;
    v9->_suppressedState = v17;

    v19 = objc_alloc_init(RBProcessMap);
    publishedState = v9->_publishedState;
    v9->_publishedState = v19;

    v21 = (NSCountedSet *)objc_alloc_init(MEMORY[0x24BDD14E0]);
    suppressedIdentities = v9->_suppressedIdentities;
    v9->_suppressedIdentities = v21;

    v9->_observersLock._os_unfair_lock_opaque = 0;
    v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    observers = v9->_observers;
    v9->_observers = v23;

    objc_storeStrong((id *)&v9->_stateCaptureManager, a3);
    objc_storeStrong((id *)&v9->_historicalStatistics, a4);
  }

  return v9;
}

- (void)didResolvePreventLaunchPredicates:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__RBProcessMonitor_didResolvePreventLaunchPredicates___block_invoke;
  v7[3] = &unk_24DD45FF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __54__RBProcessMonitor_didResolvePreventLaunchPredicates___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), *(id *)(a1 + 40));
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 48));
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "didResolvePreventLaunchPredicates:", *(_QWORD *)(a1 + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 48));
}

- (NSString)stateCaptureTitle
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)description
{
  os_unfair_lock_s *p_observersLock;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  v4 = (void *)-[NSMutableSet copy](self->_observers, "copy");
  os_unfair_lock_unlock(p_observersLock);
  v5 = objc_msgSend(v4, "count");
  v6 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(",\n\t"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("<%@| count:%lu observers:{\n\t%@\n\t}>"), v7, v5, v9);

  return (NSString *)v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_historicalStatistics, 0);
  objc_storeStrong((id *)&self->_preventLaunchPredicates, 0);
  objc_storeStrong((id *)&self->_stateCaptureManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_suppressedIdentities, 0);
  objc_storeStrong((id *)&self->_publishedState, 0);
  objc_storeStrong((id *)&self->_suppressedState, 0);
  objc_storeStrong((id *)&self->_stateMap, 0);
  objc_storeStrong((id *)&self->_processIndex, 0);
}

- (void)_queue_updateServerState:forProcess:force:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1(&dword_21A8B4000, v0, v1, "SUPPRESSING state update for %{public}@: %{public}@");
  OUTLINED_FUNCTION_1_1();
}

- (void)_queue_suppressUpdatesForIdentity:(NSObject *)a3 .cold.1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(*a1, "countForObject:", a2);
  v6 = 134218242;
  v7 = v5;
  v8 = 2114;
  v9 = a2;
  _os_log_debug_impl(&dword_21A8B4000, a3, OS_LOG_TYPE_DEBUG, "Incrementing suppression state to %lu for %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)_queue_suppressUpdatesForIdentity:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_21A8B4000, a2, a3, "BEGIN suppressing state updates for %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

- (void)_queue_unsuppressUpdatesForIdentity:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_21A8B4000, a2, a3, "END suppressing state updates for %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

- (void)_queue_unsuppressUpdatesForIdentity:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = a1 - 1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_3_1(&dword_21A8B4000, a2, a3, "Decrementing suppression state to %lu for %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1_1();
}

- (void)_queue_publishState:forIdentity:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1(&dword_21A8B4000, v0, v1, "Sending state update for %{public}@: %{public}@");
  OUTLINED_FUNCTION_1_1();
}

@end
