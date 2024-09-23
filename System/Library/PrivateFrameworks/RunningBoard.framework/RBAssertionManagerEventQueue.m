@implementation RBAssertionManagerEventQueue

- (void)updateEventsForAssertions:(id)a3
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
  v7[2] = __58__RBAssertionManagerEventQueue_updateEventsForAssertions___block_invoke;
  v7[3] = &unk_24DD45FF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_queue_enqueueWarningEventForAssertion:(double)a3 startTime:
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  RBEventQueueEvent *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  uint64_t v17;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    objc_msgSend(v5, "warningDuration");
    v8 = v7;
    if (objc_msgSend(v6, "isActive"))
    {
      if (objc_msgSend(v6, "isValid") && v8 > 0.0)
      {
        objc_msgSend(v6, "invalidationDuration");
        v10 = fmax(v9 - v8, 0.0) + a3;
        v11 = objc_alloc_init(RBEventQueueEvent);
        -[RBEventQueueEvent setContext:](v11, "setContext:", v6);
        -[RBEventQueueEvent setEventTime:](v11, "setEventTime:", v10);
        v12 = MEMORY[0x24BDAC760];
        v13 = 3221225472;
        v14 = __81__RBAssertionManagerEventQueue__queue_enqueueWarningEventForAssertion_startTime___block_invoke;
        v15 = &unk_24DD46040;
        v16 = v6;
        v17 = a1;
        -[RBEventQueueEvent setAction:](v11, "setAction:", &v12);
        objc_msgSend(*(id *)(a1 + 24), "addEvent:", v11, v12, v13, v14, v15);

      }
    }
  }

}

- (void)_queue_enqueueInvalidationEventForAssertion:(double)a3 startTime:
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  RBEventQueueEvent *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  uint64_t v16;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    if (objc_msgSend(v5, "isActive"))
    {
      if (objc_msgSend(v6, "isValid"))
      {
        objc_msgSend(v6, "invalidationDuration");
        if (v7 > 0.0)
        {
          if (objc_msgSend(v6, "endPolicy"))
          {
            objc_msgSend(v6, "invalidationDuration");
            v9 = fmax(v8 + a3, 0.0);
            v10 = objc_alloc_init(RBEventQueueEvent);
            -[RBEventQueueEvent setContext:](v10, "setContext:", v6);
            -[RBEventQueueEvent setEventTime:](v10, "setEventTime:", v9);
            v11 = MEMORY[0x24BDAC760];
            v12 = 3221225472;
            v13 = __86__RBAssertionManagerEventQueue__queue_enqueueInvalidationEventForAssertion_startTime___block_invoke;
            v14 = &unk_24DD46040;
            v15 = v6;
            v16 = a1;
            -[RBEventQueueEvent setAction:](v10, "setAction:", &v11);
            objc_msgSend(*(id *)(a1 + 24), "addEvent:", v10, v11, v12, v13, v14);

          }
        }
      }
    }
  }

}

void __58__RBAssertionManagerEventQueue_updateEventsForAssertions___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__RBAssertionManagerEventQueue_updateEventsForAssertions___block_invoke_2;
  v6[3] = &unk_24DD45FF0;
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "batchModify:", v6);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));

}

void __58__RBAssertionManagerEventQueue_updateEventsForAssertions___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "target", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identity");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
          objc_msgSend(v2, "addObject:", v10);
        -[RBAssertionManagerEventQueue _queue_updateEventsForAssertion:](*(_QWORD *)(a1 + 40), v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  -[RBAssertionManagerEventQueue _queue_enqueueProcessExpirationEventsForProcesses:](*(id **)(a1 + 40), v2);
}

- (void)_queue_updateEventsForAssertion:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  if (a1)
  {
    rbs_assertion_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[RBAssertionManagerEventQueue _queue_updateEventsForAssertion:].cold.1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

    -[RBAssertionManagerEventQueue _queue_removeEventsForContext:](a1, v3);
    -[RBAssertionManagerEventQueue _queue_enqueueEventsForAssertion:](a1, v3);
  }

}

- (void)_queue_removeEventsForContext:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    rbs_assertion_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[RBAssertionManagerEventQueue _queue_removeEventsForContext:].cold.1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(*(id *)(a1 + 24), "events", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v17, "context");
          v18 = (id)objc_claimAutoreleasedReturnValue();

          if (v18 == v3)
            objc_msgSend(v11, "addObject:", v17);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v14);
    }

    if (objc_msgSend(v11, "count"))
      objc_msgSend(*(id *)(a1 + 24), "removeEvents:", v11);

  }
}

- (void)_queue_enqueueEventsForAssertion:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  id v14;

  v3 = a2;
  v4 = v3;
  if (a1 && objc_msgSend(v3, "isActive") && objc_msgSend(v4, "isValid"))
  {
    rbs_assertion_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[RBAssertionManagerEventQueue _queue_enqueueEventsForAssertion:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

    v12 = *(void **)(a1 + 24);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __65__RBAssertionManagerEventQueue__queue_enqueueEventsForAssertion___block_invoke;
    v13[3] = &unk_24DD45FF0;
    v13[4] = a1;
    v14 = v4;
    objc_msgSend(v12, "batchModify:", v13);

  }
}

- (void)_queue_enqueueProcessExpirationEventsForProcesses:(id *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id WeakRetained;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  id v20;
  id v21;
  void *v22;
  __int128 v23;
  _QWORD v24[7];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  double v32;
  __int16 v33;
  double v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
    if (v5)
    {
      v7 = v5;
      v8 = *(_QWORD *)v26;
      *(_QWORD *)&v6 = 138543874;
      v23 = v6;
      v9 = 0x24DD44000uLL;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v26 != v8)
            objc_enumerationMutation(v4);
          v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(a1[4], "removeValueForIdentity:", v11, v23);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(a1[3], "removeEvent:", v12);
          WeakRetained = objc_loadWeakRetained(a1 + 6);
          objc_msgSend(WeakRetained, "eventQueue:remainingRuntimeForProcessIdentity:", a1, v11);
          v15 = v14;

          if (v15 <= 0.5)
          {
            objc_msgSend(a1[4], "removeIdentity:", v11);
          }
          else
          {
            objc_msgSend(a1[5], "currentTime");
            v17 = fmax(v15 + -5.0, 0.0) + v16;
            v18 = v15 + v16;
            rbs_assertion_log();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v11, "shortDescription");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v23;
              v30 = v22;
              v31 = 2048;
              v32 = v17;
              v33 = 2048;
              v34 = v18;
              _os_log_debug_impl(&dword_21A8B4000, v19, OS_LOG_TYPE_DEBUG, "%{public}@ - New process assertions warning time: %f expiration time: %f.", buf, 0x20u);

              v9 = 0x24DD44000;
            }

            v20 = objc_alloc_init(*(Class *)(v9 + 3992));
            objc_msgSend(v20, "setContext:", v11);
            objc_msgSend(v20, "setEventTime:", v17);
            v24[0] = MEMORY[0x24BDAC760];
            v24[1] = 3221225472;
            v24[2] = __82__RBAssertionManagerEventQueue__queue_enqueueProcessExpirationEventsForProcesses___block_invoke;
            v24[3] = &unk_24DD46068;
            v24[4] = a1;
            v24[5] = v11;
            *(double *)&v24[6] = v18;
            objc_msgSend(v20, "setAction:", v24);
            v21 = (id)objc_msgSend(a1[4], "setValue:forIdentity:", v20, v11);
            objc_msgSend(a1[3], "addEvent:", v20);

          }
        }
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
      }
      while (v7);
    }
  }

}

void __65__RBAssertionManagerEventQueue__queue_enqueueEventsForAssertion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  double v3;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(WeakRetained, "eventQueue:startTimeForAssertion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v4 = v3;

  -[RBAssertionManagerEventQueue _queue_enqueueWarningEventForAssertion:startTime:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), v4);
  -[RBAssertionManagerEventQueue _queue_enqueueInvalidationEventForAssertion:startTime:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), v4);
}

- (RBAssertionManagerEventQueue)initWithTimeProvider:(id)a3
{
  id v5;
  RBAssertionManagerEventQueue *v6;
  RBAssertionManagerEventQueue *v7;
  uint64_t v8;
  OS_dispatch_queue *queue;
  RBProcessMap *v10;
  RBProcessMap *expirationWarningEvents;
  RBEventQueue *v12;
  RBEventQueue *eventQueue;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RBAssertionManagerEventQueue;
  v6 = -[RBAssertionManagerEventQueue init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    v8 = objc_msgSend(MEMORY[0x24BE80D58], "createSyncingQueue:", CFSTR("RBAssertionManagerEventQueue"));
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    v10 = objc_alloc_init(RBProcessMap);
    expirationWarningEvents = v7->_expirationWarningEvents;
    v7->_expirationWarningEvents = v10;

    objc_storeStrong((id *)&v7->_timeProvider, a3);
    v12 = -[RBEventQueue initWithQueue:timeProvider:]([RBEventQueue alloc], "initWithQueue:timeProvider:", v7->_queue, v5);
    eventQueue = v7->_eventQueue;
    v7->_eventQueue = v12;

  }
  return v7;
}

- (unint64_t)count
{
  NSObject *queue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__RBAssertionManagerEventQueue_count__block_invoke;
  v5[3] = &unk_24DD46018;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __37__RBAssertionManagerEventQueue_count__block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

- (id)description
{
  NSObject *queue;
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
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__RBAssertionManagerEventQueue_description__block_invoke;
  v5[3] = &unk_24DD46018;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __43__RBAssertionManagerEventQueue_description__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "initWithFormat:", CFSTR("<%@| eventCount:%lu eventQueue:%@>"), v3, v4, v5);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

void __81__RBAssertionManagerEventQueue__queue_enqueueWarningEventForAssertion_startTime___block_invoke(uint64_t a1)
{
  char v2;
  NSObject *WeakRetained;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "isActive");
  rbs_assertion_log();
  WeakRetained = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(WeakRetained, OS_LOG_TYPE_INFO);
  if ((v2 & 1) != 0)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 32);
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_21A8B4000, WeakRetained, OS_LOG_TYPE_INFO, "Assertion warning event: %{public}@", (uint8_t *)&v7, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 48));
    -[NSObject eventQueue:handleWarningEventForAssertion:](WeakRetained, "eventQueue:handleWarningEventForAssertion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  }
  else if (v4)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_21A8B4000, WeakRetained, OS_LOG_TYPE_INFO, "Ignoring assertion warning event fired for inactive assertion: %{public}@", (uint8_t *)&v7, 0xCu);
  }

}

void __86__RBAssertionManagerEventQueue__queue_enqueueInvalidationEventForAssertion_startTime___block_invoke(uint64_t a1)
{
  char v2;
  NSObject *v3;
  NSObject *WeakRetained;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "isActive");
  rbs_assertion_log();
  v3 = objc_claimAutoreleasedReturnValue();
  WeakRetained = v3;
  if ((v2 & 1) != 0)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_21A8B4000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Assertion did invalidate due to timeout: %{public}@", (uint8_t *)&v7, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 48));
    -[NSObject eventQueue:handleInvalidationEventForAssertion:](WeakRetained, "eventQueue:handleInvalidationEventForAssertion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_21A8B4000, WeakRetained, OS_LOG_TYPE_INFO, "Ignoring assertion timeout event fired for inactive assertion: %{public}@", (uint8_t *)&v7, 0xCu);
  }

}

void __82__RBAssertionManagerEventQueue__queue_enqueueProcessExpirationEventsForProcesses___block_invoke(uint64_t a1)
{
  id WeakRetained;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeIdentity:", *(_QWORD *)(a1 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(WeakRetained, "eventQueue:handleAssertionsExpirationWarningEventForProcessIdentity:expirationTime:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));

}

- (RBAssertionManagerQueueDelegate)delegate
{
  return (RBAssertionManagerQueueDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timeProvider, 0);
  objc_storeStrong((id *)&self->_expirationWarningEvents, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_queue_updateEventsForAssertion:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_21A8B4000, a2, a3, "Updating events for assertion: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

- (void)_queue_removeEventsForContext:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_21A8B4000, a2, a3, "Removing events for context: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

- (void)_queue_enqueueEventsForAssertion:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_21A8B4000, a2, a3, "Enqueueing events for assertion: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

@end
