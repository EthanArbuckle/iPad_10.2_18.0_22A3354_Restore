@implementation RBProcessMonitorObserver

void __57__RBProcessMonitorObserver__lock_sendPendingStateUpdates__block_invoke_2(uint64_t a1)
{
  _BYTE *v2;
  id v3;

  v3 = *(id *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 40));
  v2 = *(_BYTE **)(a1 + 40);
  if (v2[98])
  {
    objc_msgSend(v2, "_lock_addAllConfiguredStatesToPending");
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 98) = 0;
    v2 = *(_BYTE **)(a1 + 40);
  }
  v2[96] = 0;
  objc_msgSend(*(id *)(a1 + 40), "_lock_sendPendingStateUpdates");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 40));

}

- (void)addConfiguration:(id)a3
{
  id v4;
  NSMutableDictionary *configurations;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  NSMutableDictionary *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (!-[NSMutableDictionary count](self->_configurations, "count"))
    -[RBProcessMonitoring addObserver:](self->_monitor, "addObserver:", self);
  configurations = self->_configurations;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](configurations, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  rbs_monitor_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v9)
    {
      v13 = 138543362;
      v14 = v4;
      v10 = "monitor changed to %{public}@";
LABEL_8:
      _os_log_impl(&dword_21A8B4000, v8, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v13, 0xCu);
    }
  }
  else if (v9)
  {
    v13 = 138543362;
    v14 = v4;
    v10 = "monitor established %{public}@";
    goto LABEL_8;
  }

  -[RBProcessMonitorObserver _lock_addConfigurationStatesToPending:](self, "_lock_addConfigurationStatesToPending:", v4);
  v11 = self->_configurations;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "identifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v4, v12);

  -[RBProcessMonitorObserver _lock_rebuildConfiguration](self, "_lock_rebuildConfiguration");
  -[RBProcessMonitorObserver _lock_sendPendingStateUpdates](self, "_lock_sendPendingStateUpdates");
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_lock_addConfigurationStatesToPending:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  RBProcessMap *pendingProcessState;
  void *v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD block[5];
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__6;
  v34 = __Block_byref_object_dispose__6;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__6;
  v28 = __Block_byref_object_dispose__6;
  v29 = 0;
  -[RBProcessMonitoring monitorSerializationQueue](self->_monitor, "monitorSerializationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__RBProcessMonitorObserver__lock_addConfigurationStatesToPending___block_invoke;
  block[3] = &unk_24DD475F0;
  v22 = &v30;
  block[4] = self;
  v6 = v4;
  v21 = v6;
  v23 = &v24;
  dispatch_sync(v5, block);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = (id)v31[5];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v36, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        pendingProcessState = self->_pendingProcessState;
        objc_msgSend(v11, "process", (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identity");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[RBProcessMap setValue:forIdentity:](pendingProcessState, "setValue:forIdentity:", v11, v14);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v36, 16);
    }
    while (v8);
  }

  if ((objc_msgSend(v6, "events") & 2) != 0)
    objc_storeStrong((id *)&self->_pendingPreventLaunchPredicates, (id)v25[5]);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

}

void __66__RBProcessMonitorObserver_processMonitor_didChangeProcessStates___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id WeakRetained;
  int v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "count"))
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = *(id *)(a1 + 40);
    v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
    if (v2)
    {
      v4 = v2;
      v5 = *(_QWORD *)v35;
      *(_QWORD *)&v3 = 134218498;
      v26 = v3;
      v27 = *(_QWORD *)v35;
      do
      {
        v6 = 0;
        v28 = v4;
        do
        {
          if (*(_QWORD *)v35 != v5)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v6);
          objc_msgSend(v7, "process", v26);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
          v10 = objc_msgSend(WeakRetained, "isEqual:", v8);

          if (v10)
          {
            v11 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
            objc_msgSend(v8, "identity");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = (id)objc_msgSend(v11, "setValue:forIdentity:", v7, v12);
          }
          else
          {
            v32 = 0u;
            v33 = 0u;
            v30 = 0u;
            v31 = 0u;
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "allValues");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
            if (v14)
            {
              v15 = v14;
              v16 = *(_QWORD *)v31;
              while (2)
              {
                for (i = 0; i != v15; ++i)
                {
                  if (*(_QWORD *)v31 != v16)
                    objc_enumerationMutation(v12);
                  v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
                  objc_msgSend(v18, "stateDescriptor");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v19 && objc_msgSend(v18, "matchesProcess:", v8))
                  {
                    rbs_monitor_log();
                    v20 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                    {
                      objc_msgSend(v8, "identity");
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
                      *(_DWORD *)buf = v26;
                      v39 = v7;
                      v40 = 2114;
                      v41 = v24;
                      v42 = 2114;
                      v43 = v25;
                      _os_log_debug_impl(&dword_21A8B4000, v20, OS_LOG_TYPE_DEBUG, "Sending state %p for %{public}@ to %{public}@", buf, 0x20u);

                    }
                    v21 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
                    objc_msgSend(v8, "identity");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    v23 = (id)objc_msgSend(v21, "setValue:forIdentity:", v7, v22);

                    objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 88), v8);
                    goto LABEL_22;
                  }
                }
                v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
                if (v15)
                  continue;
                break;
              }
LABEL_22:
              v5 = v27;
              v4 = v28;
            }
          }

          ++v6;
        }
        while (v6 != v4);
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
      }
      while (v4);
    }

    objc_msgSend(*(id *)(a1 + 32), "_lock_sendPendingStateUpdates");
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
}

- (void)_lock_sendPendingStateUpdates
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(*a1, "count");
  OUTLINED_FUNCTION_1_11();
  OUTLINED_FUNCTION_0_12(&dword_21A8B4000, v1, v2, "Sending %d pending exit events to %{public}@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

- (void)_lock_clearPendingNonterminalStates
{
  RBProcessMap *pendingProcessState;
  _QWORD v4[5];

  os_unfair_lock_assert_owner(&self->_lock);
  pendingProcessState = self->_pendingProcessState;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __63__RBProcessMonitorObserver__lock_clearPendingNonterminalStates__block_invoke;
  v4[3] = &unk_24DD47640;
  v4[4] = self;
  -[RBProcessMap enumerateWithBlock:](pendingProcessState, "enumerateWithBlock:", v4);
}

- (NSString)description
{
  os_unfair_lock_s *p_lock;
  id v4;
  void *v5;
  RBSProcessStateDescriptor *stateDescriptor;
  uint64_t qos;
  void *v8;
  void *v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  stateDescriptor = self->_stateDescriptor;
  qos = self->_qos;
  -[NSMutableDictionary entriesToStringWithIndent:debug:](self->_configurations, "entriesToStringWithIndent:debug:", 2, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("<%@| qos:%u qos:%@ configs:{\n%@\t}>"), v5, qos, stateDescriptor, v8);

  os_unfair_lock_unlock(p_lock);
  return (NSString *)v9;
}

- (void)_lock_rebuildConfiguration
{
  RBSProcessStateDescriptor *stateDescriptor;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unsigned int qos;
  unsigned int v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  RBSProcessStateDescriptor *v18;
  RBSProcessStateDescriptor *v19;
  RBSProcessStateDescriptor *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(&self->_lock);
  self->_qos = 9;
  objc_storeWeak((id *)&self->_lastMatchedHandle, 0);
  stateDescriptor = self->_stateDescriptor;
  self->_stateDescriptor = 0;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary allValues](self->_configurations, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        qos = self->_qos;
        v13 = objc_msgSend(v11, "serviceClass");
        if (qos <= v13)
          v14 = v13;
        else
          v14 = qos;
        self->_qos = v14;
        objc_msgSend(v11, "stateDescriptor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          objc_msgSend(v15, "endowmentNamespaces");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObjectsFromArray:", v17);

          v8 |= objc_msgSend(v16, "values");
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }
  v18 = (RBSProcessStateDescriptor *)objc_alloc_init(MEMORY[0x24BE80CF8]);
  v19 = self->_stateDescriptor;
  self->_stateDescriptor = v18;

  v20 = self->_stateDescriptor;
  objc_msgSend(v4, "allObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSProcessStateDescriptor setEndowmentNamespaces:](v20, "setEndowmentNamespaces:", v21);

  -[RBSProcessStateDescriptor setValues:](self->_stateDescriptor, "setValues:", v8);
}

- (void)processMonitor:(id)a3 didChangeProcessStates:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  RBSDispatchAsyncWithQoS();

}

- (void)didObserveProcessExit:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  RBSDispatchAsyncWithQoS();

}

void __50__RBProcessMonitorObserver_didObserveProcessExit___block_invoke(uint64_t a1)
{
  os_unfair_lock_s **v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = (os_unfair_lock_s **)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  if (objc_msgSend(*(id *)&(*v2)[18]._os_unfair_lock_opaque, "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "handle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "allValues", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v9, "events") && objc_msgSend(v9, "matchesProcess:", v3))
          {
            rbs_monitor_log();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
              __50__RBProcessMonitorObserver_didObserveProcessExit___block_invoke_cold_1(v3, (uint64_t)v2, v10);

            v11 = objc_alloc_init(MEMORY[0x24BE80C68]);
            objc_msgSend(v11, "setProcess:", v3);
            objc_msgSend(*(id *)(a1 + 40), "lastExitContext");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setContext:", v12);

            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "addObject:", v11);
            objc_msgSend(*(id *)(a1 + 32), "_lock_sendPendingStateUpdates");

            goto LABEL_15;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_15:

  }
  os_unfair_lock_unlock(*v2 + 10);
}

void __66__RBProcessMonitorObserver__lock_addConfigurationStatesToPending___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1[4] + 8), "statesMatchingConfiguration:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1[4] + 8), "preventLaunchPredicates");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[7] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (RBProcessMonitorObserver)initWithMonitor:(id)a3 forProcess:(id)a4 connection:(id)a5
{
  id v10;
  id v11;
  id v12;
  RBProcessMonitorObserver *v13;
  RBProcessMonitorObserver *v14;
  uint64_t v15;
  NSMutableDictionary *configurations;
  RBProcessMap *v17;
  RBProcessMap *pendingProcessState;
  uint64_t v19;
  NSMutableArray *pendingExitEvents;
  void *v21;
  void *v22;
  uint64_t v23;
  OS_dispatch_queue *calloutQueue;
  double v25;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBProcessMonitorObserver.m"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("process != nil"));

    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBProcessMonitorObserver.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("monitor != nil"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBProcessMonitorObserver.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection != nil"));

LABEL_4:
  v30.receiver = self;
  v30.super_class = (Class)RBProcessMonitorObserver;
  v13 = -[RBProcessMonitorObserver init](&v30, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_monitor, a3);
    objc_storeStrong((id *)&v14->_process, a4);
    objc_storeStrong((id *)&v14->_connection, a5);
    v14->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    configurations = v14->_configurations;
    v14->_configurations = (NSMutableDictionary *)v15;

    v17 = objc_alloc_init(RBProcessMap);
    pendingProcessState = v14->_pendingProcessState;
    v14->_pendingProcessState = v17;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v19 = objc_claimAutoreleasedReturnValue();
    pendingExitEvents = v14->_pendingExitEvents;
    v14->_pendingExitEvents = (NSMutableArray *)v19;

    v21 = (void *)MEMORY[0x24BE80D58];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RBProcessMonitorObserver:%@"), v14->_process);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "createBackgroundQueue:", v22);
    calloutQueue = v14->_calloutQueue;
    v14->_calloutQueue = (OS_dispatch_queue *)v23;

    RBSMachAbsoluteTime();
    v14->_lastSend = v25;
  }

  return v14;
}

- (void)removeConfigurationWithIdentifier:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *configurations;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  configurations = self->_configurations;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](configurations, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = self->_configurations;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", 0, v10);

    -[RBProcessMonitorObserver _lock_rebuildConfiguration](self, "_lock_rebuildConfiguration");
    if (!-[NSMutableDictionary count](self->_configurations, "count"))
      -[RBProcessMonitoring removeObserver:](self->_monitor, "removeObserver:", self);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  RBProcessMonitorObserverConnection *connection;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[NSMutableDictionary count](self->_configurations, "count"))
    -[RBProcessMonitoring removeObserver:](self->_monitor, "removeObserver:", self);
  -[NSMutableDictionary removeAllObjects](self->_configurations, "removeAllObjects");
  -[RBProcessMap removeAllObjects](self->_pendingProcessState, "removeAllObjects");
  objc_storeWeak((id *)&self->_lastMatchedHandle, 0);
  connection = self->_connection;
  self->_connection = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  if (self->_connection)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[RBProcessMonitorObserver dealloc]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("RBProcessMonitorObserver.m"), 115, CFSTR("must be invalidated before releasing"));

  }
  v5.receiver = self;
  v5.super_class = (Class)RBProcessMonitorObserver;
  -[RBProcessMonitorObserver dealloc](&v5, sel_dealloc);
}

- (void)_lock_addAllConfiguredStatesToPending
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(&self->_lock);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[NSMutableDictionary allValues](self->_configurations, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[RBProcessMonitorObserver _lock_addConfigurationStatesToPending:](self, "_lock_addConfigurationStatesToPending:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lastMatchedHandle);
  objc_storeStrong((id *)&self->_stateDescriptor, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_pendingPreventLaunchPredicates, 0);
  objc_storeStrong((id *)&self->_pendingExitEvents, 0);
  objc_storeStrong((id *)&self->_pendingProcessState, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

- (void)didResolvePreventLaunchPredicates:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  RBSDispatchAsyncWithQoS();

}

void __62__RBProcessMonitorObserver_didResolvePreventLaunchPredicates___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  NSObject *v8;
  void *v9;
  _QWORD *v10;
  id v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  if (objc_msgSend(*((id *)*v2 + 9), "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(*((id *)*v2 + 9), "allValues", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v15 != v6)
            objc_enumerationMutation(v3);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "events"))
          {
            rbs_monitor_log();
            v8 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
              __62__RBProcessMonitorObserver_didResolvePreventLaunchPredicates___block_invoke_cold_1((uint64_t)v2, v8);

            v9 = *(void **)(a1 + 40);
            if (v9)
            {
              v10 = *v2;
              v11 = v9;
              v12 = (void *)v10[8];
              v10[8] = v11;
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDBCF20], "set");
              v13 = objc_claimAutoreleasedReturnValue();
              v12 = (void *)*((_QWORD *)*v2 + 8);
              *((_QWORD *)*v2 + 8) = v13;
            }

            objc_msgSend(*v2, "_lock_sendPendingStateUpdates");
            goto LABEL_17;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_17:

  }
  os_unfair_lock_unlock((os_unfair_lock_t)*v2 + 10);
}

- (NSString)stateCaptureTitle
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBProcess description](self->_process, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)_checkForBadActorWithPendingStates:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  id v6;
  id v7;
  NSObject *v8;
  RBProcess *v9;
  unint64_t v10;
  double v11;
  double v12;
  double lastSend;
  unint64_t v14;
  double v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  unint64_t v20;
  id v21;
  void *v22;
  RBProcess *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  int v31;
  RBProcess *v32;
  uint64_t v33;
  RBProcess *v34;
  RBProcess *process;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  uint64_t *v42;
  uint64_t *v43;
  _QWORD *v44;
  _QWORD v45[5];
  __CFString *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint8_t buf[4];
  RBProcess *v58;
  __int16 v59;
  unint64_t v60;
  __int16 v61;
  int v62;
  __int16 v63;
  double v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  unint64_t v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = objc_alloc_init(MEMORY[0x24BDD14E0]);
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__6;
  v51 = __Block_byref_object_dispose__6;
  v52 = 0;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = __Block_byref_object_copy__6;
  v45[4] = __Block_byref_object_dispose__6;
  v46 = &stru_24DD48378;
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = __63__RBProcessMonitorObserver__checkForBadActorWithPendingStates___block_invoke;
  v40[3] = &unk_24DD47618;
  v7 = v6;
  v41 = v7;
  v42 = &v53;
  v43 = &v47;
  v44 = v45;
  v39 = v4;
  objc_msgSend(v4, "enumerateWithBlock:", v40);
  rbs_monitor_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (RBProcess *)v54[3];
    v10 = v48[5];
    *(_DWORD *)buf = 134218242;
    v58 = v9;
    v59 = 2114;
    v60 = v10;
    _os_log_impl(&dword_21A8B4000, v8, OS_LOG_TYPE_DEFAULT, "checkForBadActor: %lu instances of '%{public}@' have been terminated since last update read", buf, 0x16u);
  }

  RBSMachAbsoluteTime();
  v12 = v11;
  lastSend = self->_lastSend;
  v14 = -[RBProcessMap count](self->_pendingProcessState, "count");
  if (_RBMaxPendingProcessStates_onceToken != -1)
    dispatch_once(&_RBMaxPendingProcessStates_onceToken, &__block_literal_global_19);
  if (v14 <= _RBMaxPendingProcessStates_maxPendingProcessStates || (v15 = v12 - lastSend, v15 <= 2.0))
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v16 = llround(v15);
    if (v16 >= 0x7FFFFF)
      v17 = 0x7FFFFFLL;
    else
      v17 = v16;
    v18 = v54[3];
    rbs_process_log();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v18 & 0x1FF | (v17 << 9) | 0xB10CCA1100000000;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      process = self->_process;
      v36 = -[RBProcessMap count](self->_pendingProcessState, "count");
      if (_RBMaxPendingProcessStates_onceToken != -1)
        dispatch_once(&_RBMaxPendingProcessStates_onceToken, &__block_literal_global_19);
      v37 = v54[3];
      v38 = v48[5];
      *(_DWORD *)buf = 138544898;
      v58 = process;
      v59 = 2048;
      v60 = v36;
      v61 = 1024;
      v62 = _RBMaxPendingProcessStates_maxPendingProcessStates;
      v63 = 2048;
      v64 = v15;
      v65 = 2048;
      v66 = v37;
      v67 = 2114;
      v68 = v38;
      v69 = 2048;
      v70 = v20;
      _os_log_error_impl(&dword_21A8B4000, v19, OS_LOG_TYPE_ERROR, "%{public}@ is over the maximum number of pending updates:%lu vs. %u.\nLast unread update sent %f seconds ago.\n%lu of those updates were for terminated '%{public}@' processes.\nExceptionCode %llx", buf, 0x44u);
    }

    v21 = objc_alloc(MEMORY[0x24BE80D40]);
    v22 = (void *)MEMORY[0x24BDD17C8];
    v23 = self->_process;
    v24 = -[RBProcessMap count](self->_pendingProcessState, "count");
    if (_RBMaxPendingProcessStates_onceToken != -1)
      dispatch_once(&_RBMaxPendingProcessStates_onceToken, &__block_literal_global_19);
    objc_msgSend(v22, "stringWithFormat:", CFSTR("%@ is over the maximum number of pending updates:%lu vs. %u. Last unread update sent %f seconds ago. %lu of those updates were for terminated '%@' processes."), v23, v24, _RBMaxPendingProcessStates_maxPendingProcessStates, *(_QWORD *)&v15, v54[3], v48[5]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v21, "initWithExplanation:", v25);

    objc_msgSend(v26, "setExceptionCode:", v20);
    objc_msgSend(v26, "setExceptionDomain:", 15);
    objc_msgSend(v26, "setMaximumTerminationResistance:", 50);
    objc_msgSend(v26, "setReportType:", 1);
    -[RBProcess identity](self->_process, "identity");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    rbs_sp_telemetry_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v28))
    {
      objc_msgSend(v27, "embeddedApplicationIdentifier");
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = (void *)v29;
      if (v29)
      {
        v31 = 0;
        v32 = (RBProcess *)v29;
      }
      else
      {
        objc_msgSend(v27, "xpcServiceIdentifier");
        v33 = objc_claimAutoreleasedReturnValue();
        if (v33)
        {
          v31 = 0;
          v23 = (RBProcess *)v33;
          v32 = (RBProcess *)v33;
        }
        else
        {
          objc_msgSend(v27, "consistentLaunchdJobLabel");
          v32 = (RBProcess *)objc_claimAutoreleasedReturnValue();
          v23 = 0;
          v31 = 1;
        }
      }
      *(_DWORD *)buf = 138543362;
      v58 = v32;
      _os_signpost_emit_with_name_impl(&dword_21A8B4000, v28, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RBProcessStatesMaxCountReached_ProcessTerminated", "BundleIdOverride=%{public, signpost.description:attribute}@ enableTelemetry=YES ", buf, 0xCu);
      if (v31)

      if (!v30)
    }

    v34 = self->_process;
    os_unfair_lock_unlock(p_lock);
    -[RBProcess terminateWithContext:](v34, "terminateWithContext:", v26);

  }
  _Block_object_dispose(v45, 8);

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

}

void __63__RBProcessMonitorObserver__checkForBadActorWithPendingStates___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "isEmbeddedApplication"))
  {
    objc_msgSend(v8, "embeddedApplicationIdentifier");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v8, "isXPCService"))
  {
    objc_msgSend(v8, "xpcServiceIdentifier");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v8, "hasConsistentLaunchdJob"))
    {
      v5 = 0;
      goto LABEL_11;
    }
    objc_msgSend(v8, "consistentLaunchdJobLabel");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
    v6 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", v5);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (v6 > *(_QWORD *)(v7 + 24))
    {
      *(_QWORD *)(v7 + 24) = v6;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v5);
    }
  }
LABEL_11:

}

void __63__RBProcessMonitorObserver__lock_clearPendingNonterminalStates__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "isRunning"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeIdentity:", v5);

}

uint64_t __57__RBProcessMonitorObserver__lock_sendPendingStateUpdates__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkForBadActorWithPendingStates:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __57__RBProcessMonitorObserver__lock_sendPendingStateUpdates__block_invoke_97(uint64_t a1)
{
  NSObject *v2;
  id v3;
  _BYTE *v4;

  rbs_monitor_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __57__RBProcessMonitorObserver__lock_sendPendingStateUpdates__block_invoke_97_cold_1(a1);

  v3 = *(id *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 40));
  v4 = *(_BYTE **)(a1 + 40);
  if (v4[98])
  {
    objc_msgSend(v4, "_lock_addAllConfiguredStatesToPending");
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 98) = 0;
    v4 = *(_BYTE **)(a1 + 40);
  }
  v4[97] = 0;
  objc_msgSend(*(id *)(a1 + 40), "_lock_sendPendingStateUpdates");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 40));

}

void __57__RBProcessMonitorObserver__lock_sendPendingStateUpdates__block_invoke_100(uint64_t a1)
{
  NSObject *v2;
  id v3;
  _BYTE *v4;

  rbs_monitor_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __57__RBProcessMonitorObserver__lock_sendPendingStateUpdates__block_invoke_97_cold_1(a1);

  v3 = *(id *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 40));
  v4 = *(_BYTE **)(a1 + 40);
  if (v4[98])
  {
    objc_msgSend(v4, "_lock_addAllConfiguredStatesToPending");
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 98) = 0;
    v4 = *(_BYTE **)(a1 + 40);
  }
  v4[97] = 0;
  objc_msgSend(*(id *)(a1 + 40), "_lock_sendPendingStateUpdates");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 40));

}

void __50__RBProcessMonitorObserver_didObserveProcessExit___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)a2 + 16);
  v7 = 138543618;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  _os_log_debug_impl(&dword_21A8B4000, a3, OS_LOG_TYPE_DEBUG, "Sending exit event for %{public}@ to %{public}@", (uint8_t *)&v7, 0x16u);

}

void __62__RBProcessMonitorObserver_didResolvePreventLaunchPredicates___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  v3 = 138543362;
  v4 = v2;
  _os_log_debug_impl(&dword_21A8B4000, a2, OS_LOG_TYPE_DEBUG, "Sending prevent launch update to %{public}@", (uint8_t *)&v3, 0xCu);
}

void __57__RBProcessMonitorObserver__lock_sendPendingStateUpdates__block_invoke_97_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_3_3(a1);
  OUTLINED_FUNCTION_1_11();
  OUTLINED_FUNCTION_0_12(&dword_21A8B4000, v1, v2, "Sent %d pending exit events to %{public}@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

@end
