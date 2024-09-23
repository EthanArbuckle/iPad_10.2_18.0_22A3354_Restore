@implementation SUCoreAnalyticsEventSubmitter

- (SUCoreAnalyticsEventSubmitter)init
{
  SUCoreAnalyticsEventSubmitter *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *events;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *stateQueue;
  uint64_t v8;
  SUCoreLog *eventSubmitterLogger;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SUCoreAnalyticsEventSubmitter;
  v2 = -[SUCoreAnalyticsEventSubmitter init](&v11, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    events = v2->_events;
    v2->_events = v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.SUCore.SUCoreAnalyticsEventSubmitterQueue", v5);
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DA8960]), "initWithCategory:", CFSTR("SUCoreAnalyticsEventSubmitter"));
    eventSubmitterLogger = v2->_eventSubmitterLogger;
    v2->_eventSubmitterLogger = (SUCoreLog *)v8;

  }
  return v2;
}

- (void)setEvent:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD block[4];
  id v8;
  SUCoreAnalyticsEventSubmitter *v9;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SUCoreAnalyticsEventSubmitter_setEvent___block_invoke;
  block[3] = &unk_1EA878A88;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(stateQueue, block);

}

void __42__SUCoreAnalyticsEventSubmitter_setEvent___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v1, "_queue_setEvent:");
  }
  else
  {
    objc_msgSend(v1, "eventSubmitterLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __42__SUCoreAnalyticsEventSubmitter_setEvent___block_invoke_cold_1();

  }
}

- (void)removeEvent:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD block[4];
  id v8;
  SUCoreAnalyticsEventSubmitter *v9;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SUCoreAnalyticsEventSubmitter_removeEvent___block_invoke;
  block[3] = &unk_1EA878A88;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(stateQueue, block);

}

void __45__SUCoreAnalyticsEventSubmitter_removeEvent___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v1, "_queue_removeEvent:");
  }
  else
  {
    objc_msgSend(v1, "eventSubmitterLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __45__SUCoreAnalyticsEventSubmitter_removeEvent___block_invoke_cold_1();

  }
}

- (void)removeEventsWithName:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD block[4];
  id v8;
  SUCoreAnalyticsEventSubmitter *v9;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SUCoreAnalyticsEventSubmitter_removeEventsWithName___block_invoke;
  block[3] = &unk_1EA878A88;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(stateQueue, block);

}

void __54__SUCoreAnalyticsEventSubmitter_removeEventsWithName___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v1, "_queue_removeEventsWithName:");
  }
  else
  {
    objc_msgSend(v1, "eventSubmitterLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __45__SUCoreAnalyticsEventSubmitter_removeEvent___block_invoke_cold_1();

  }
}

- (void)removeAllEvents
{
  NSObject *stateQueue;
  _QWORD block[5];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__SUCoreAnalyticsEventSubmitter_removeAllEvents__block_invoke;
  block[3] = &unk_1EA877EF8;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

uint64_t __48__SUCoreAnalyticsEventSubmitter_removeAllEvents__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeAllEvents");
}

- (void)submitEvent:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD block[4];
  id v8;
  SUCoreAnalyticsEventSubmitter *v9;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SUCoreAnalyticsEventSubmitter_submitEvent___block_invoke;
  block[3] = &unk_1EA878A88;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(stateQueue, block);

}

void __45__SUCoreAnalyticsEventSubmitter_submitEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;

  v2 = *(void **)(a1 + 32);
  if (v2 && (objc_msgSend(v2, "eventUUID"), v3 = (void *)objc_claimAutoreleasedReturnValue(), v3, v3))
  {
    objc_msgSend(*(id *)(a1 + 40), "_queue_submitEvent:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "eventSubmitterLogger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "oslog");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __45__SUCoreAnalyticsEventSubmitter_submitEvent___block_invoke_cold_1();

  }
}

- (void)submitEventsWithName:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD block[4];
  id v8;
  SUCoreAnalyticsEventSubmitter *v9;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SUCoreAnalyticsEventSubmitter_submitEventsWithName___block_invoke;
  block[3] = &unk_1EA878A88;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(stateQueue, block);

}

void __54__SUCoreAnalyticsEventSubmitter_submitEventsWithName___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v1, "_queue_submitEventsWithName:");
  }
  else
  {
    objc_msgSend(v1, "eventSubmitterLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __54__SUCoreAnalyticsEventSubmitter_submitEventsWithName___block_invoke_cold_1();

  }
}

- (void)submitAllEvents
{
  NSObject *stateQueue;
  _QWORD block[5];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__SUCoreAnalyticsEventSubmitter_submitAllEvents__block_invoke;
  block[3] = &unk_1EA877EF8;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

uint64_t __48__SUCoreAnalyticsEventSubmitter_submitAllEvents__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_submitAllEvents");
}

- (NSDictionary)events
{
  NSObject *stateQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__SUCoreAnalyticsEventSubmitter_events__block_invoke;
  v6[3] = &unk_1EA877F20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __39__SUCoreAnalyticsEventSubmitter_events__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_queue_setEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSMutableDictionary *events;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (v4 && (objc_msgSend(v4, "eventUUID"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    -[SUCoreAnalyticsEventSubmitter eventSubmitterLogger](self, "eventSubmitterLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = v4;
      _os_log_impl(&dword_1DDFDD000, v7, OS_LOG_TYPE_DEFAULT, "SET_EVENT: Adding CoreAnalytics event to submission queue: %{public}@", (uint8_t *)&v11, 0xCu);
    }

    events = self->_events;
    objc_msgSend(v4, "eventUUID");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setSafeObject:forKey:](events, "setSafeObject:forKey:", v4, v9);
  }
  else
  {
    -[SUCoreAnalyticsEventSubmitter eventSubmitterLogger](self, "eventSubmitterLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __42__SUCoreAnalyticsEventSubmitter_setEvent___block_invoke_cold_1();
  }

}

- (void)_queue_removeEvent:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *events;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSMutableDictionary *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (v4 && (objc_msgSend(v4, "eventUUID"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    events = self->_events;
    objc_msgSend(v4, "eventUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](events, "objectForKey:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    -[SUCoreAnalyticsEventSubmitter eventSubmitterLogger](self, "eventSubmitterLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v11)
      {
        v14 = 138543362;
        v15 = v4;
        _os_log_impl(&dword_1DDFDD000, v10, OS_LOG_TYPE_DEFAULT, "REMOVE_EVENT: Successfully removed event %{public}@ from queue", (uint8_t *)&v14, 0xCu);
      }

      v12 = self->_events;
      -[NSObject eventUUID](v8, "eventUUID");
      v10 = objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](v12, "removeObjectForKey:", v10);
    }
    else if (v11)
    {
      v14 = 138543362;
      v15 = v4;
      _os_log_impl(&dword_1DDFDD000, v10, OS_LOG_TYPE_DEFAULT, "REMOVE_EVENT: Event %{public}@ does not exist. Nothing to do", (uint8_t *)&v14, 0xCu);
    }

  }
  else
  {
    -[SUCoreAnalyticsEventSubmitter eventSubmitterLogger](self, "eventSubmitterLogger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __45__SUCoreAnalyticsEventSubmitter_removeEvent___block_invoke_cold_1();
  }

}

- (void)_queue_removeEventsWithName:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  NSMutableDictionary *events;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (v4)
  {
    -[NSMutableDictionary allValues](self->_events, "allValues");
    v5 = objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v21;
      *(_QWORD *)&v7 = 138543362;
      v19 = v7;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v11, "eventName", v19);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", v4);

          if (v13)
          {
            -[SUCoreAnalyticsEventSubmitter eventSubmitterLogger](self, "eventSubmitterLogger");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "oslog");
            v15 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v19;
              v25 = v11;
              _os_log_impl(&dword_1DDFDD000, v15, OS_LOG_TYPE_DEFAULT, "REMOVE_EVENTS_WITH_NAME: Removing %{public}@", buf, 0xCu);
            }

            events = self->_events;
            objc_msgSend(v11, "eventUUID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary removeObjectForKey:](events, "removeObjectForKey:", v17);

          }
        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v8);
    }
  }
  else
  {
    -[SUCoreAnalyticsEventSubmitter eventSubmitterLogger](self, "eventSubmitterLogger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "oslog");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SUCoreAnalyticsEventSubmitter _queue_removeEventsWithName:].cold.1();
  }

}

- (void)_queue_removeAllEvents
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  -[SUCoreAnalyticsEventSubmitter eventSubmitterLogger](self, "eventSubmitterLogger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "oslog");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DDFDD000, v4, OS_LOG_TYPE_DEFAULT, "REMOVE_ALL_EVENTS: Removing all events from submission queue", v5, 2u);
  }

  -[NSMutableDictionary removeAllObjects](self->_events, "removeAllObjects");
}

- (void)_queue_submitEvent:(id)a3
{
  NSObject *v4;
  void *v5;
  NSMutableDictionary *events;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  int v13;
  NSObject *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (v4
    && (-[NSObject eventUUID](v4, "eventUUID"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    events = self->_events;
    -[NSObject eventUUID](v4, "eventUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](events, "objectForKey:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    -[SUCoreAnalyticsEventSubmitter eventSubmitterLogger](self, "eventSubmitterLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v11)
      {
        v13 = 138543362;
        v14 = v8;
        _os_log_impl(&dword_1DDFDD000, v10, OS_LOG_TYPE_DEFAULT, "SUBMIT: Found event %{public}@. Sending", (uint8_t *)&v13, 0xCu);
      }

      -[SUCoreAnalyticsEventSubmitter _queue_registerSendEvent:](self, "_queue_registerSendEvent:", v8);
      -[SUCoreAnalyticsEventSubmitter _queue_removeEvent:](self, "_queue_removeEvent:", v8);
    }
    else
    {
      if (v11)
      {
        v13 = 138543362;
        v14 = v4;
        _os_log_impl(&dword_1DDFDD000, v10, OS_LOG_TYPE_DEFAULT, "SUBMIT: No event found matching %{public}@. Skipping", (uint8_t *)&v13, 0xCu);
      }

    }
  }
  else
  {
    -[SUCoreAnalyticsEventSubmitter eventSubmitterLogger](self, "eventSubmitterLogger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SUCoreAnalyticsEventSubmitter _queue_submitEvent:].cold.1();
  }

}

- (void)_queue_submitEventsWithName:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (v4)
  {
    -[NSMutableDictionary allValues](self->_events, "allValues");
    v5 = objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v19;
      *(_QWORD *)&v7 = 138543362;
      v17 = v7;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v11, "eventName", v17);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", v4);

          if (v13)
          {
            -[SUCoreAnalyticsEventSubmitter eventSubmitterLogger](self, "eventSubmitterLogger");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "oslog");
            v15 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v17;
              v23 = v11;
              _os_log_impl(&dword_1DDFDD000, v15, OS_LOG_TYPE_DEFAULT, "SUBMIT_EVENTS_WITH_NAME: Submitting %{public}@", buf, 0xCu);
            }

            -[SUCoreAnalyticsEventSubmitter _queue_registerSendEvent:](self, "_queue_registerSendEvent:", v11);
            -[SUCoreAnalyticsEventSubmitter _queue_removeEvent:](self, "_queue_removeEvent:", v11);
          }
        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v8);
    }
  }
  else
  {
    -[SUCoreAnalyticsEventSubmitter eventSubmitterLogger](self, "eventSubmitterLogger");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "oslog");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SUCoreAnalyticsEventSubmitter _queue_submitEventsWithName:].cold.1();
  }

}

- (void)_queue_submitAllEvents
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  -[NSMutableDictionary allValues](self->_events, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreAnalyticsEventSubmitter eventSubmitterLogger](self, "eventSubmitterLogger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "oslog");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    v23 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1DDFDD000, v5, OS_LOG_TYPE_DEFAULT, "[CoreAnalytics]: SUBMIT_ALL_EVENTS: Will submit %{public}lu total events", buf, 0xCu);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v18;
    *(_QWORD *)&v8 = 138543362;
    v16 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
        -[SUCoreAnalyticsEventSubmitter eventSubmitterLogger](self, "eventSubmitterLogger", v16, (_QWORD)v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "oslog");
        v14 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v12, "eventName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v16;
          v23 = (uint64_t)v15;
          _os_log_impl(&dword_1DDFDD000, v14, OS_LOG_TYPE_DEFAULT, "[CoreAnalytics]: SUBMIT_ALL_EVENT: Sending event %{public}@", buf, 0xCu);

        }
        -[SUCoreAnalyticsEventSubmitter _queue_registerSendEvent:](self, "_queue_registerSendEvent:", v12);
        -[SUCoreAnalyticsEventSubmitter _queue_removeEvent:](self, "_queue_removeEvent:", v12);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

}

- (void)_queue_registerSendEvent:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  -[SUCoreAnalyticsEventSubmitter eventSubmitterLogger](self, "eventSubmitterLogger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "oslog");
  v6 = objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v10 = v4;
      _os_log_impl(&dword_1DDFDD000, v6, OS_LOG_TYPE_DEFAULT, "[CoreAnalytics] SUBMIT: Calling SendEventLazy for %{public}@", buf, 0xCu);
    }

    objc_msgSend(v4, "eventName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v4;
    AnalyticsSendEventLazy();

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SUCoreAnalyticsEventSubmitter _queue_registerSendEvent:].cold.1();

  }
}

id __58__SUCoreAnalyticsEventSubmitter__queue_registerSendEvent___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "eventSubmitterLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1DDFDD000, v3, OS_LOG_TYPE_DEFAULT, "[CoreAnalytics] SUBMIT: Submitting CoreAnalytics event: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "eventPayload");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (SUCoreLog)eventSubmitterLogger
{
  return self->_eventSubmitterLogger;
}

- (void)setEventSubmitterLogger:(id)a3
{
  objc_storeStrong((id *)&self->_eventSubmitterLogger, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventSubmitterLogger, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

void __42__SUCoreAnalyticsEventSubmitter_setEvent___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DDFDD000, v0, v1, "SET_EVENT: Nil event passed to setEvent", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void __45__SUCoreAnalyticsEventSubmitter_removeEvent___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DDFDD000, v0, v1, "REMOVE_EVENT: Nil event name passed to removeEvent", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void __45__SUCoreAnalyticsEventSubmitter_submitEvent___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DDFDD000, v0, v1, "SUBMIT_EVENT: Nil/invalid event passed to submit", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void __54__SUCoreAnalyticsEventSubmitter_submitEventsWithName___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DDFDD000, v0, v1, "SUBMIT_EVENTS_WITH_NAME: Nil event name passed to submitEvent", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

- (void)_queue_removeEventsWithName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DDFDD000, v0, v1, "REMOVE_EVENTS_WITH_NAME: Nil event name passed to removeEvent", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

- (void)_queue_submitEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DDFDD000, v0, v1, "SUBMIT: nil event/uuid passed to submit", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

- (void)_queue_submitEventsWithName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DDFDD000, v0, v1, "SUBMIT_EVENTS_WITH_NAME: nil event name passed to submitEvent", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

- (void)_queue_registerSendEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DDFDD000, v0, v1, "[CoreAnalytics] SUBMIT: Unable to register sending null CoreAnalytics event", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

@end
