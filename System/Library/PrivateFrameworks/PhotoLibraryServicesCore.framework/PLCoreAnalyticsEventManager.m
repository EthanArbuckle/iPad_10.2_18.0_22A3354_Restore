@implementation PLCoreAnalyticsEventManager

- (PLCoreAnalyticsEventManager)init
{
  PLCoreAnalyticsEventManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *eventMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLCoreAnalyticsEventManager;
  v2 = -[PLCoreAnalyticsEventManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    eventMap = v2->_eventMap;
    v2->_eventMap = v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLCoreAnalyticsEventManager;
  -[PLCoreAnalyticsEventManager description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" Events: %@"), self->_eventMap);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionForEventName:(id)a3
{
  void *v3;
  void *v4;

  -[PLCoreAnalyticsEventManager _eventForEventName:](self, "_eventForEventName:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_eventForEventName:(id)a3
{
  id v4;
  PLCoreAnalyticsEvent *v5;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_eventMap, "objectForKeyedSubscript:", v4);
  v5 = (PLCoreAnalyticsEvent *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[PLCoreAnalyticsEvent initWithEvent:payload:]([PLCoreAnalyticsEvent alloc], "initWithEvent:payload:", v4, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_eventMap, "setObject:forKeyedSubscript:", v5, v4);
  }

  return v5;
}

- (id)valueForKey:(id)a3 onEventWithName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __59__PLCoreAnalyticsEventManager_valueForKey_onEventWithName___block_invoke;
    v12[3] = &unk_1E3769838;
    v12[4] = self;
    v13 = v7;
    v14 = v6;
    PLResultWithUnfairLock(&self->_lock, v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PLBackendGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v16 = v8;
      v17 = 2114;
      v18 = v6;
      _os_log_impl(&dword_199DF7000, v10, OS_LOG_TYPE_ERROR, "CoreAnalyticsEventManager: invalid parameter for event name: %{public}@ key: %{public}@", buf, 0x16u);
    }

    v9 = 0;
  }

  return v9;
}

- (void)_setPayloadValue:(id)a3 forKey:(id)a4 onEventWithName:(id)a5 eventBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (!v11 || !v12)
  {
    PLBackendGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_8:

      goto LABEL_9;
    }
    *(_DWORD *)buf = 138543874;
    v24 = v12;
    v25 = 2114;
    v26 = v11;
    v27 = 2114;
    v28 = v10;
    v16 = "CoreAnalyticsEventManager: invalid parameter for event name: %{public}@ key: %{public}@ value: %{public}@";
    v17 = v15;
    v18 = 32;
LABEL_7:
    _os_log_impl(&dword_199DF7000, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
    goto LABEL_8;
  }
  if (!v10)
  {
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("error")) & 1) != 0)
      goto LABEL_9;
    PLBackendGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    *(_DWORD *)buf = 138543618;
    v24 = v12;
    v25 = 2114;
    v26 = v11;
    v16 = "CoreAnalyticsEventManager: invalid value for event name: %{public}@ key: %{public}@";
    v17 = v15;
    v18 = 22;
    goto LABEL_7;
  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __82__PLCoreAnalyticsEventManager__setPayloadValue_forKey_onEventWithName_eventBlock___block_invoke;
  v19[3] = &unk_1E3769860;
  v22 = v13;
  v19[4] = self;
  v20 = v10;
  v21 = v11;
  PLRunWithUnfairLock(&self->_lock, v19);

LABEL_9:
}

- (void)setPayloadValue:(id)a3 forKey:(id)a4 onEventWithName:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__PLCoreAnalyticsEventManager_setPayloadValue_forKey_onEventWithName___block_invoke;
  v10[3] = &unk_1E3769888;
  v11 = v8;
  v9 = v8;
  -[PLCoreAnalyticsEventManager _setPayloadValue:forKey:onEventWithName:eventBlock:](self, "_setPayloadValue:forKey:onEventWithName:eventBlock:", a3, a4, v9, v10);

}

- (void)setPayloadValue:(id)a3 forKey:(id)a4 onlyOnExistingEventWithName:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__PLCoreAnalyticsEventManager_setPayloadValue_forKey_onlyOnExistingEventWithName___block_invoke;
  v10[3] = &unk_1E3769888;
  v11 = v8;
  v9 = v8;
  -[PLCoreAnalyticsEventManager _setPayloadValue:forKey:onEventWithName:eventBlock:](self, "_setPayloadValue:forKey:onEventWithName:eventBlock:", a3, a4, v9, v10);

}

- (void)mergePayload:(id)a3 onEventWithName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __60__PLCoreAnalyticsEventManager_mergePayload_onEventWithName___block_invoke;
    v10[3] = &unk_1E376BBE8;
    v10[4] = self;
    v11 = v7;
    v12 = v6;
    PLRunWithUnfairLock(&self->_lock, v10);

  }
  else
  {
    PLBackendGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v14 = v8;
      v15 = 2114;
      v16 = v6;
      _os_log_impl(&dword_199DF7000, v9, OS_LOG_TYPE_ERROR, "CoreAnalyticsEventManager: invalid parameter for event name: %{public}@ payload: %{public}@", buf, 0x16u);
    }

  }
}

- (void)removePayloadValueForKey:(id)a3 onEventWithName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __72__PLCoreAnalyticsEventManager_removePayloadValueForKey_onEventWithName___block_invoke;
    v10[3] = &unk_1E376BBE8;
    v10[4] = self;
    v11 = v7;
    v12 = v6;
    PLRunWithUnfairLock(&self->_lock, v10);

  }
  else
  {
    PLBackendGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v14 = v8;
      v15 = 2114;
      v16 = v6;
      _os_log_impl(&dword_199DF7000, v9, OS_LOG_TYPE_ERROR, "CoreAnalyticsEventManager: invalid parameter for event name: %{public}@ key: %{public}@", buf, 0x16u);
    }

  }
}

- (BOOL)hasEventWithName:(id)a3
{
  void *v3;
  BOOL v4;
  NSObject *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[PLCoreAnalyticsEventManager rawEventForEventName:](self, "rawEventForEventName:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 != 0;

  }
  else
  {
    PLBackendGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 138543362;
      v8 = 0;
      _os_log_impl(&dword_199DF7000, v5, OS_LOG_TYPE_ERROR, "CoreAnalyticsEventManager: invalid parameter for event name: %{public}@", (uint8_t *)&v7, 0xCu);
    }

    return 0;
  }
  return v4;
}

- (void)removeEventWithName:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__PLCoreAnalyticsEventManager_removeEventWithName___block_invoke;
    v7[3] = &unk_1E376C718;
    v7[4] = self;
    v8 = v4;
    PLRunWithUnfairLock(&self->_lock, v7);

  }
  else
  {
    PLBackendGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v10 = 0;
      _os_log_impl(&dword_199DF7000, v6, OS_LOG_TYPE_ERROR, "CoreAnalyticsEventManager: invalid parameter for event name: %{public}@", buf, 0xCu);
    }

  }
}

- (id)rawEventForEventName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v5 = v4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3258;
  v16 = __Block_byref_object_dispose__3259;
  v17 = 0;
  if (v4)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52__PLCoreAnalyticsEventManager_rawEventForEventName___block_invoke;
    v9[3] = &unk_1E37698D8;
    v11 = &v12;
    v9[4] = self;
    v10 = v4;
    PLRunWithUnfairLock(&self->_lock, v9);

    v6 = (void *)v13[5];
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)stopRecordingTimedEventWithToken:(double)a3 forKey:(id)a4 onEventWithName:(id)a5
{
  id v8;
  double Current;
  void *v10;
  id v11;

  v11 = a4;
  v8 = a5;
  Current = CFAbsoluteTimeGetCurrent();
  if (a3 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", Current - a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCoreAnalyticsEventManager setPayloadValue:forKey:onEventWithName:](self, "setPayloadValue:forKey:onEventWithName:", v10, v11, v8);

  }
}

- (void)addRecordingTimedEventSnippetWithToken:(double)a3 forKey:(id)a4 onEventWithName:(id)a5
{
  id v8;
  double Current;
  double v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  double v17;
  double v18;

  v13 = a4;
  v8 = a5;
  Current = CFAbsoluteTimeGetCurrent();
  if (a3 > 0.0 && v13 != 0 && v8 != 0)
  {
    v12 = Current;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __93__PLCoreAnalyticsEventManager_addRecordingTimedEventSnippetWithToken_forKey_onEventWithName___block_invoke;
    v14[3] = &unk_1E37698B0;
    v14[4] = self;
    v15 = v8;
    v16 = v13;
    v17 = v12;
    v18 = a3;
    PLRunWithUnfairLock(&self->_lock, v14);

  }
}

- (void)publishEventWithName:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__3258;
    v13 = __Block_byref_object_dispose__3259;
    v14 = 0;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __52__PLCoreAnalyticsEventManager_publishEventWithName___block_invoke;
    v6[3] = &unk_1E37698D8;
    v6[4] = self;
    v8 = &v9;
    v7 = v4;
    PLRunWithUnfairLock(&self->_lock, v6);
    objc_msgSend((id)v10[5], "publish");

    _Block_object_dispose(&v9, 8);
  }

}

- (void)publishAllEvents
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD v14[4];
  id v15;
  PLCoreAnalyticsEventManager *v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[NSMutableDictionary count](self->_eventMap, "count"));
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __47__PLCoreAnalyticsEventManager_publishAllEvents__block_invoke;
  v14[3] = &unk_1E376C718;
  v4 = v3;
  v15 = v4;
  v16 = self;
  PLRunWithUnfairLock(&self->_lock, v14);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "publish", (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v17, 16);
    }
    while (v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventMap, 0);
}

uint64_t __47__PLCoreAnalyticsEventManager_publishAllEvents__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "removeAllObjects");
}

uint64_t __52__PLCoreAnalyticsEventManager_publishEventWithName___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  if (result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_eventForEventName:", *(_QWORD *)(a1 + 40));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  }
  return result;
}

void __93__PLCoreAnalyticsEventManager_addRecordingTimedEventSnippetWithToken_forKey_onEventWithName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_eventForEventName:", *(_QWORD *)(a1 + 40));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "payload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  v6 = v5 + *(double *)(a1 + 56) - *(double *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addKey:value:", v7, v8);

}

void __52__PLCoreAnalyticsEventManager_rawEventForEventName___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __51__PLCoreAnalyticsEventManager_removeEventWithName___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

void __72__PLCoreAnalyticsEventManager_removePayloadValueForKey_onEventWithName___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_eventForEventName:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeKey:", *(_QWORD *)(a1 + 48));

}

void __60__PLCoreAnalyticsEventManager_mergePayload_onEventWithName___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_eventForEventName:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mergePayload:", *(_QWORD *)(a1 + 48));

}

id __82__PLCoreAnalyticsEventManager_setPayloadValue_forKey_onlyOnExistingEventWithName___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;

  v3 = a2;
  objc_msgSend(v3[1], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __70__PLCoreAnalyticsEventManager_setPayloadValue_forKey_onEventWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  objc_msgSend(v3, "_eventForEventName:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __82__PLCoreAnalyticsEventManager__setPayloadValue_forKey_onEventWithName_eventBlock___block_invoke(uint64_t a1)
{
  void *v2;
  char isKindOfClass;
  uint64_t v4;
  void *v5;
  id v6;

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v6 = v2;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v4 = *(_QWORD *)(a1 + 48);
    if ((isKindOfClass & 1) != 0)
    {
      build_error_event_string(*(void **)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addKey:value:", v4, v5);

    }
    else
    {
      objc_msgSend(v6, "addKey:value:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    }
    v2 = v6;
  }

}

id __59__PLCoreAnalyticsEventManager_valueForKey_onEventWithName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_eventForEventName:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
