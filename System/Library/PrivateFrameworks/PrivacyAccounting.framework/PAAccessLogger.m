@implementation PAAccessLogger

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_3);
  return (id)sharedInstance_instance_1;
}

- (void)lockedInvalidateState
{
  PAAccessLoggerState *v3;
  PAAccessLoggerState *v4;
  PAAccessLoggerState *state;
  _BOOL4 v6;

  os_unfair_lock_assert_owner(&self->_lock);
  v3 = self->_state;
  v4 = (PAAccessLoggerState *)objc_opt_new();
  state = self->_state;
  self->_state = v4;

  -[PAAccessLoggerState setTopAccessIntervalSlot:](self->_state, "setTopAccessIntervalSlot:", -[PAAccessLoggerState topAccessIntervalSlot](v3, "topAccessIntervalSlot"));
  -[PAAccessLoggerState setLoggingEnabled:](self->_state, "setLoggingEnabled:", 0);
  v6 = -[PAAccessLoggerState loggingEnabled](v3, "loggingEnabled");

  if (v6)
    -[PAAccessLogger lockedNotifyDidSetLoggingEnabled:](self, "lockedNotifyDidSetLoggingEnabled:", 0);
}

- (ResyncStateResult)resyncState
{
  uint64_t v5;
  PAAccessLoggerState *v6;
  PAAccessLoggerState *v7;
  PAAccessLoggerState *state;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  ResyncStateResult *result;
  ResyncStateResult *v26;
  os_unfair_lock_t lock;
  PAAccessLogger *v28;
  void *v29;
  void *v30;
  void *v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = retstr;
  v5 = -[PAAccessLogger maxRetryCount](self, "maxRetryCount");
  v6 = self->_state;
  v7 = (PAAccessLoggerState *)objc_opt_new();
  state = self->_state;
  self->_state = v7;

  -[PAAccessLoggerState setLoggingEnabled:](self->_state, "setLoggingEnabled:", -[PAAccessLoggerState loggingEnabled](v6, "loggingEnabled"));
  -[PAAccessLoggerState setTopAccessIntervalSlot:](self->_state, "setTopAccessIntervalSlot:", -[PAAccessLoggerState topAccessIntervalSlot](v6, "topAccessIntervalSlot"));
  v28 = self;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[PAAccessLoggerState ongoingAccessIntervals](v6, "ongoingAccessIntervals");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v34;
    obj = v9;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v12);
        -[PAAccessLoggerState ongoingAccessIntervals](v6, "ongoingAccessIntervals");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "setRetryCount:", objc_msgSend(v15, "retryCount") + 1);
        if (objc_msgSend(v15, "retryCount") <= v5)
        {
          objc_msgSend(v15, "access");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "asIntervalEndEventWithTimestampAdjustment:", 0.0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObject:", v20);

          objc_msgSend(v15, "access");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(v21, "copyWithNewIdentifier:", v22);

          objc_msgSend(v17, "asIntervalBeginEvent");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setObject:forKeyedSubscript:", v23, v13);

          objc_msgSend(v15, "setAccess:", v17);
          -[PAAccessLoggerState setOngoingAccessIntervalState:forSlot:](v28->_state, "setOngoingAccessIntervalState:forSlot:", v15, v13);
        }
        else
        {
          v16 = (id)logger_3;
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v15, "access");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v38 = v5;
            v39 = 2112;
            v40 = v24;
            _os_log_error_impl(&dword_1A5DE1000, v16, OS_LOG_TYPE_ERROR, "Dropping interval exceeding maximum retries=%ld for access=%@", buf, 0x16u);

          }
          objc_msgSend(v15, "access");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "asIntervalEndEventWithTimestampAdjustment:", 0.0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObject:", v18);

        }
        ++v12;
      }
      while (v10 != v12);
      v9 = obj;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v10);
  }

  v26->var0 = v29;
  v26->var1 = v31;
  v26->var2 = v30;

  os_unfair_lock_unlock(lock);
  return result;
}

void __29__PAAccessLogger_log_reason___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  id v7;
  void *v8;
  int v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  int v17;
  id v18;
  void *v19;
  _BOOL8 v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
    goto LABEL_30;
  v5 = objc_msgSend(*(id *)(a1 + 32), "kind");
  if (v5 == 1 || v5 == 4)
  {
    v7 = v3;
    objc_msgSend(v7, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("PAErrorDomain"));

    if (!v9)
      goto LABEL_23;
    v10 = objc_msgSend(v7, "code");
    if (v10 > 0x10 || ((1 << v10) & 0x14060) == 0)
      goto LABEL_23;

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __29__PAAccessLogger_log_reason___block_invoke_4;
    v21[3] = &unk_1E4FA4F20;
    v22 = v7;
    v23 = *(id *)(a1 + 32);
    objc_msgSend(WeakRetained, "withLockedState:", v21);

    v11 = v22;
  }
  else
  {
    if (v5 != 2)
      goto LABEL_24;
    v7 = v3;
    objc_msgSend(v7, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("PAErrorDomain")) & 1) != 0)
    {
      if (objc_msgSend(v7, "code") == 2)
      {

LABEL_23:
        goto LABEL_24;
      }
      v13 = objc_msgSend(v7, "code");

      if (v13 == 9)
        goto LABEL_23;
    }
    else
    {

    }
    objc_msgSend(v7, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("PAErrorDomain"));

    if (!v15)
      goto LABEL_23;
    v16 = objc_msgSend(v7, "code");
    if (v16 == 3)
      goto LABEL_23;
    if (v16 == 12)
    {
      v17 = PAErrorBoolValueForUserInfoKey(v7, CFSTR("PASimulatedErrorShouldShouldDropOngoingIntervalState"));

      if (!v17)
        goto LABEL_24;
    }
    else
    {

    }
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __29__PAAccessLogger_log_reason___block_invoke_3;
    v24[3] = &unk_1E4FA4F20;
    v25 = *(id *)(a1 + 32);
    v26 = v7;
    objc_msgSend(WeakRetained, "withLockedState:", v24);

    v11 = v25;
  }

LABEL_24:
  v18 = v3;
  objc_msgSend(v18, "domain");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "isEqualToString:", CFSTR("PAErrorDomain")))
    v20 = objc_msgSend(v18, "code") != 2 && objc_msgSend(v18, "code") != 9;
  else
    v20 = 1;

  objc_msgSend(WeakRetained, "setLoggingEnabled:", v20);
  objc_msgSend(WeakRetained, "notifyDidLogAccess:failedWithError:", *(_QWORD *)(a1 + 32), v18);
LABEL_30:

}

- (void)setLoggingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PAAccessLogger ensureEnablementChangedNotificationRegistered](self, "ensureEnablementChangedNotificationRegistered");
  if (-[PAAccessLoggerState loggingEnabled](self->_state, "loggingEnabled") != v3)
  {
    if (v3)
    {
      -[PAAccessLoggerState setLoggingEnabled:](self->_state, "setLoggingEnabled:", 1);
      -[PAAccessLogger lockedNotifyDidSetLoggingEnabled:](self, "lockedNotifyDidSetLoggingEnabled:", 1);
    }
    else
    {
      -[PAAccessLogger lockedInvalidateState](self, "lockedInvalidateState");
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)maxRetryCount
{
  return self->_maxRetryCount;
}

- (void)handleConnectionInterrupted
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[8];
  id v34;
  id v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = logger_3;
  if (os_log_type_enabled((os_log_t)logger_3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A5DE1000, v3, OS_LOG_TYPE_INFO, "XPC connection interrupted", buf, 2u);
  }
  *(_QWORD *)buf = 0;
  v34 = 0;
  v35 = 0;
  -[PAAccessLogger resyncState](self, "resyncState");
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v4 = *(id *)buf;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v30;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v30 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)buf, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PAAccessLogger log:reason:](self, "log:reason:", v8, 1);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v5);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v34;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v26;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v12);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PAErrorDomain"), 10, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PAAccessLogger notifyDidLogAccess:failedWithError:](self, "notifyDidLogAccess:failedWithError:", v13, v14);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v10);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v15 = v35;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v36, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v15);
        v19 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v18);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PAErrorDomain"), 11, 0, (_QWORD)v21);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PAAccessLogger notifyDidLogAccess:failedWithError:](self, "notifyDidLogAccess:failedWithError:", v19, v20);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v36, 16);
    }
    while (v16);
  }

}

- (void)ensureEnablementChangedNotificationRegistered
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138543618;
  v5 = v3;
  v6 = 1024;
  v7 = a2;
  _os_log_error_impl(&dword_1A5DE1000, log, OS_LOG_TYPE_ERROR, "Failed to register for %{public}@ notifications with code=%u", (uint8_t *)&v4, 0x12u);
  OUTLINED_FUNCTION_4();
}

void __41__PAAccessLogger_beginIntervalForAccess___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  PAOngoingAccessIntervalState *v18;
  PAAccessInterval *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v3 = a2;
  if ((objc_msgSend(v3, "loggingEnabled") & 1) == 0)
  {
    v22 = logger_3;
    if (os_log_type_enabled((os_log_t)logger_3, OS_LOG_TYPE_DEBUG))
      __41__PAAccessLogger_beginIntervalForAccess___block_invoke_cold_2((uint64_t)a1, v22, v23);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PAErrorDomain"), 2, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = *(_QWORD *)(a1[6] + 8);
    v9 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = v24;
    goto LABEL_10;
  }
  objc_msgSend(v3, "negativeAccessCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PAAccessMatcher negativeAccessCacheMatcherForAccess:](PAAccessMatcher, "negativeAccessCacheMatcherForAccess:", a1[4]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    objc_msgSend(v3, "takeOngoingAccessIntervalStateForAccess:", a1[4]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = logger_3;
      if (os_log_type_enabled((os_log_t)logger_3, OS_LOG_TYPE_ERROR))
        __41__PAAccessLogger_beginIntervalForAccess___block_invoke_cold_1((uint64_t)(a1 + 4), v10, v11, v12, v13, v14, v15, v16);
    }
    objc_msgSend(v3, "setTopAccessIntervalSlot:", objc_msgSend(v3, "topAccessIntervalSlot") + 1);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "topAccessIntervalSlot"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[PAOngoingAccessIntervalState initWithAccess:]([PAOngoingAccessIntervalState alloc], "initWithAccess:", a1[4]);
    objc_msgSend(v3, "setOngoingAccessIntervalState:forSlot:", v18, v17);

    v19 = -[PAAccessInterval initWithLogger:slot:]([PAAccessInterval alloc], "initWithLogger:slot:", a1[5], v17);
    v20 = *(_QWORD *)(a1[7] + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

LABEL_10:
  }

}

- (void)lockedNotifyDidSetLoggingEnabled:(BOOL)a3
{
  void *v5;
  char v6;
  NSObject *queue;
  _QWORD block[4];
  id v9;
  BOOL v10;
  id location;

  os_unfair_lock_assert_owner(&self->_lock);
  -[PAAccessLogger delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__PAAccessLogger_lockedNotifyDidSetLoggingEnabled___block_invoke;
    block[3] = &unk_1E4FA4F70;
    objc_copyWeak(&v9, &location);
    v10 = a3;
    dispatch_async(queue, block);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)recordAssetIdentifiers:(id)a3 withVisibilityState:(int64_t)a4 accessEventCount:(unint64_t)a5 forSlot:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v10 = a3;
  v11 = a6;
  if (objc_msgSend(v11, "integerValue") >= 1 && objc_msgSend(v10, "count"))
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__0;
    v33 = __Block_byref_object_dispose__0;
    v34 = 0;
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __86__PAAccessLogger_recordAssetIdentifiers_withVisibilityState_accessEventCount_forSlot___block_invoke;
    v26 = &unk_1E4FA4E58;
    v28 = &v29;
    v12 = v11;
    v27 = v12;
    -[PAAccessLogger withLockedState:](self, "withLockedState:", &v23);
    if (v30[5])
    {
      if (objc_msgSend(v10, "count", v23, v24, v25, v26)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || (objc_msgSend((id)v30[5], "tccService"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v14 = objc_msgSend(v13, "isEqual:", *MEMORY[0x1E0DB1158]),
            v13,
            (v14 & 1) == 0))
      {
        objc_msgSend((id)v30[5], "asIntervalEventWithAssetIdentifiers:visibilityState:accessEventCount:", v10, a4, a5);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[PAAccessLogger log:reason:](self, "log:reason:", v15, 0);

      }
    }
    else
    {
      v16 = logger_3;
      if (os_log_type_enabled((os_log_t)logger_3, OS_LOG_TYPE_ERROR))
        -[PAAccessLogger recordAssetIdentifiers:withVisibilityState:accessEventCount:forSlot:].cold.1((uint64_t)v12, v16, v17, v18, v19, v20, v21, v22);
    }

    _Block_object_dispose(&v29, 8);
  }

}

void __22__PAAccessLogger_log___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__0;
    v18 = __Block_byref_object_dispose__0;
    v19 = 0;
    v4 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __22__PAAccessLogger_log___block_invoke_16;
    v11[3] = &unk_1E4FA4E58;
    v13 = &v14;
    v12 = *(id *)(a1 + 32);
    objc_msgSend(WeakRetained, "withLockedState:", v11);
    if (v15[5])
    {
      objc_msgSend(WeakRetained, "notifyDidLogAccess:failedWithError:", *(_QWORD *)(a1 + 32));
    }
    else
    {
      objc_msgSend(WeakRetained, "coalescingIntervalTracker");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(WeakRetained, "coalescingIntervalTracker");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "coalesce:", *(_QWORD *)(a1 + 32));

      }
      else
      {
        v9[0] = v4;
        v9[1] = 3221225472;
        v9[2] = __22__PAAccessLogger_log___block_invoke_2;
        v9[3] = &unk_1E4FA4E80;
        v9[4] = WeakRetained;
        v10 = *(id *)(a1 + 32);
        _os_activity_initiate(&dword_1A5DE1000, "PAAccessLogger -log:", OS_ACTIVITY_FLAG_DEFAULT, v9);

      }
    }

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PAErrorDomain"), 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "notifyDidLogAccess:failedWithError:", v5, v6);

  }
}

- (void)withLockedState:(id)a3
{
  void (**v4)(id, PAAccessLoggerState *);

  v4 = (void (**)(id, PAAccessLoggerState *))a3;
  os_unfair_lock_lock(&self->_lock);
  v4[2](v4, self->_state);
  os_unfair_lock_unlock(&self->_lock);

}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (BOOL)loggingEnabled
{
  PAAccessLogger *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[PAAccessLoggerState loggingEnabled](v2->_state, "loggingEnabled");
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)log:(id)a3
{
  id v4;
  id v5;
  dispatch_block_t v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__PAAccessLogger_log___block_invoke;
  block[3] = &unk_1E4FA4EA8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v5 = v4;
  v6 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, block);
  dispatch_async((dispatch_queue_t)self->_queue, v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)notifyDidLogAccess:(id)a3 failedWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  unint64_t v12;
  os_log_type_t v13;
  uint64_t v14;
  void *v15;
  char v16;
  NSObject *queue;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = logger_3;
  if (v7)
  {
    v9 = (id)logger_3;
    objc_msgSend(v7, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("PAErrorDomain"));

    if (v11 && (v12 = objc_msgSend(v7, "code") - 1, v12 <= 0xF))
      v13 = byte_1A5E02060[v12];
    else
      v13 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v9, v13))
    {
      *(_DWORD *)buf = 138412546;
      v23 = v6;
      v24 = 2114;
      v25 = v7;
      _os_log_impl(&dword_1A5DE1000, v9, v13, "Failed to log access with error: access=%@, error=%{public}@", buf, 0x16u);
    }

  }
  else if (os_log_type_enabled((os_log_t)logger_3, OS_LOG_TYPE_DEBUG))
  {
    -[PAAccessLogger notifyDidLogAccess:failedWithError:].cold.1((uint64_t)v6, v8, v14);
  }
  -[PAAccessLogger delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__PAAccessLogger_notifyDidLogAccess_failedWithError___block_invoke;
    block[3] = &unk_1E4FA4F98;
    objc_copyWeak(&v21, (id *)buf);
    v19 = v6;
    v20 = v7;
    dispatch_async(queue, block);

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }

}

- (PAAccessLoggerDelegate)delegate
{
  return (PAAccessLoggerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PACoalescingIntervalTracker)coalescingIntervalTracker
{
  return (PACoalescingIntervalTracker *)objc_getProperty(self, a2, 72, 1);
}

void __86__PAAccessLogger_recordAssetIdentifiers_withVisibilityState_accessEventCount_forSlot___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "lookupCurrentAccessForSlot:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)notifyDidCoalesceAccess:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *queue;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  -[PAAccessLogger delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__PAAccessLogger_notifyDidCoalesceAccess___block_invoke;
    block[3] = &unk_1E4FA4EA8;
    objc_copyWeak(&v10, &location);
    v9 = v4;
    dispatch_async(queue, block);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

- (void)log:(id)a3 reason:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSXPCConnection *connection;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;

  v6 = a3;
  v7 = v6;
  if (!a4)
  {
    objc_msgSend(v6, "JSONObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v8, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)logger_3;
    if (os_log_type_enabled((os_log_t)logger_3, OS_LOG_TYPE_DEBUG))
      -[PAAccessLogger log:reason:].cold.1(v10, v9);

  }
  objc_initWeak(&location, self);
  connection = self->_connection;
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __29__PAAccessLogger_log_reason___block_invoke;
  v19[3] = &unk_1E4FA4EF8;
  objc_copyWeak(&v21, &location);
  v13 = v7;
  v20 = v13;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __29__PAAccessLogger_log_reason___block_invoke_2;
  v16[3] = &unk_1E4FA4EF8;
  objc_copyWeak(&v18, &location);
  v15 = v13;
  v17 = v15;
  objc_msgSend(v14, "log:reason:reply:", v15, a4, v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

- (id)beginIntervalForAccess:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  PAAccessLogger *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  PAAccessLogger *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _BYTE v37[24];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_connection)
  {
    objc_msgSend(v4, "asIntervalBeginEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__0;
    v35 = __Block_byref_object_dispose__0;
    v36 = 0;
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__0;
    v29 = __Block_byref_object_dispose__0;
    v30 = 0;
    v7 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __41__PAAccessLogger_beginIntervalForAccess___block_invoke;
    v20[3] = &unk_1E4FA4ED0;
    v8 = v6;
    v23 = &v31;
    v24 = &v25;
    v21 = v8;
    v22 = self;
    -[PAAccessLogger withLockedState:](self, "withLockedState:", v20);
    if (v32[5])
    {
      -[PAAccessLogger notifyDidLogAccess:failedWithError:](self, "notifyDidLogAccess:failedWithError:", v8);
      +[PAAccessInterval placeholderAccessInterval](PAAccessInterval, "placeholderAccessInterval");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = v7;
      v15 = 3221225472;
      v16 = __41__PAAccessLogger_beginIntervalForAccess___block_invoke_22;
      v17 = &unk_1E4FA4E80;
      v18 = self;
      v19 = v8;
      _os_activity_initiate(&dword_1A5DE1000, "PAAccessLogger -beginIntervalForAccess:", OS_ACTIVITY_FLAG_DEFAULT, &v14);

      v11 = (id)logger_3;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)v26[5], "slot", v14, v15, v16, v17, v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PAAccessLogger beginIntervalForAccess:].cold.1(v12, (uint64_t)v37, v11);
      }

      v9 = (id)v26[5];
    }
    v10 = v9;

    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(&v31, 8);

  }
  else
  {
    +[PAAccessInterval placeholderAccessInterval](PAAccessInterval, "placeholderAccessInterval");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

void __32__PAAccessLogger_sharedInstance__block_invoke()
{
  PAAccessLogger *v0;
  void *v1;

  v0 = -[PAAccessLogger initWithQueue:]([PAAccessLogger alloc], "initWithQueue:", 0);
  v1 = (void *)sharedInstance_instance_1;
  sharedInstance_instance_1 = (uint64_t)v0;

}

- (PAAccessLogger)initWithQueue:(id)a3
{
  return -[PAAccessLogger initWithConnection:queue:](self, "initWithConnection:queue:", 0, a3);
}

- (PAAccessLogger)initWithConnection:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  PAAccessLogger *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[PAAccessLogger initWithConnection:queue:enablementChangedNotificationName:options:](self, "initWithConnection:queue:enablementChangedNotificationName:options:", v7, v6, CFSTR("com.apple.PrivacyAccounting.toggled"), +[PALoggingOptionsFactory defaultLoggingOptions](PALoggingOptionsFactory, "defaultLoggingOptions"));

  return v8;
}

void __29__PAAccessLogger_log_reason___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "notifyDidLogAccess:failedWithError:", *(_QWORD *)(a1 + 32), v4);

}

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.PrivacyAccounting", "PAAccessLogger");
    v3 = (void *)logger_3;
    logger_3 = (uint64_t)v2;

  }
}

void __22__PAAccessLogger_log___block_invoke_16(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  if ((objc_msgSend(v10, "loggingEnabled") & 1) != 0)
  {
    objc_msgSend(v10, "negativeAccessCache");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[PAAccessMatcher negativeAccessCacheMatcherForAccess:](PAAccessMatcher, "negativeAccessCacheMatcherForAccess:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PAErrorDomain"), 2, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v3 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;
  }

}

uint64_t __22__PAAccessLogger_log___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "log:reason:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __41__PAAccessLogger_beginIntervalForAccess___block_invoke_22(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "log:reason:", *(_QWORD *)(a1 + 40), 0);
}

- (PAAccessLogger)initWithConnection:(id)a3 queue:(id)a4 enablementChangedNotificationName:(id)a5 options:(unint64_t)a6
{
  id v10;
  dispatch_queue_t v11;
  id v12;
  PAAccessLogger *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  PAAccessLoggerState *state;
  PACoalescingIntervalTracker *v19;
  PACoalescingIntervalTracker *coalescingIntervalTracker;
  NSObject *v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id location;
  objc_super v28;

  v10 = a3;
  v11 = (dispatch_queue_t)a4;
  v12 = a5;
  v28.receiver = self;
  v28.super_class = (Class)PAAccessLogger;
  v13 = -[PAAccessLogger init](&v28, sel_init);
  if (v13)
  {
    if (!v10)
    {
      if (_os_feature_enabled_impl())
        v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.privacyaccountingd"), 4096);
      else
        v10 = 0;
    }
    PARegisterUserInfoValueProviderForPAErrorDomain();
    if (!v11)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v14 = objc_claimAutoreleasedReturnValue();
      v11 = dispatch_queue_create("com.apple.privacyaccounting.PAAccessLogger", v14);

    }
    objc_storeStrong((id *)&v13->_queue, v11);
    objc_msgSend(v10, "_setQueue:", v13->_queue);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE80FD48);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRemoteObjectInterface:", v15);
    objc_initWeak(&location, v13);
    v16 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __85__PAAccessLogger_initWithConnection_queue_enablementChangedNotificationName_options___block_invoke;
    v25[3] = &unk_1E4FA4C50;
    objc_copyWeak(&v26, &location);
    objc_msgSend(v10, "setInterruptionHandler:", v25);
    v23[0] = v16;
    v23[1] = 3221225472;
    v23[2] = __85__PAAccessLogger_initWithConnection_queue_enablementChangedNotificationName_options___block_invoke_2;
    v23[3] = &unk_1E4FA4C50;
    objc_copyWeak(&v24, &location);
    objc_msgSend(v10, "setInvalidationHandler:", v23);
    objc_storeStrong((id *)&v13->_connection, v10);
    v13->_options = a6;
    v13->_lock._os_unfair_lock_opaque = 0;
    v17 = objc_opt_new();
    state = v13->_state;
    v13->_state = (PAAccessLoggerState *)v17;

    objc_storeStrong((id *)&v13->_enablementChangedNotificationName, a5);
    v13->_enablementChangedNotificationToken = -1;
    v13->_maxRetryCount = 5;
    v19 = -[PACoalescingIntervalTracker initWithLogger:]([PACoalescingIntervalTracker alloc], "initWithLogger:", v13);
    coalescingIntervalTracker = v13->_coalescingIntervalTracker;
    v13->_coalescingIntervalTracker = v19;

    objc_msgSend(v10, "resume");
    v21 = logger_3;
    if (os_log_type_enabled((os_log_t)logger_3, OS_LOG_TYPE_DEBUG))
      -[PAAccessLogger initWithConnection:queue:enablementChangedNotificationName:options:].cold.1((uint64_t)v10, (uint64_t)v11, v21);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);

  }
  return v13;
}

void __85__PAAccessLogger_initWithConnection_queue_enablementChangedNotificationName_options___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleConnectionInterrupted");

}

void __85__PAAccessLogger_initWithConnection_queue_enablementChangedNotificationName_options___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleConnectionInvalidated");

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  -[PACoalescingIntervalTracker invalidate](self->_coalescingIntervalTracker, "invalidate");
  notify_cancel(self->_enablementChangedNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)PAAccessLogger;
  -[PAAccessLogger dealloc](&v3, sel_dealloc);
}

void __29__PAAccessLogger_log_reason___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  int v6;
  unint64_t v7;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = (id)objc_msgSend(v11, "takeOngoingAccessIntervalStateForAccess:", *(_QWORD *)(a1 + 32));
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("PAErrorDomain"));

  if (v6)
  {
    v7 = objc_msgSend(v4, "code");
    if (v7 <= 0x10 && ((1 << v7) & 0x14060) != 0)
    {

      objc_msgSend(v11, "negativeAccessCache");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      +[PAAccessMatcher negativeAccessCacheMatcherForAccess:](PAAccessMatcher, "negativeAccessCacheMatcherForAccess:", *(_QWORD *)(a1 + 32));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v9, v10);

    }
  }

}

void __29__PAAccessLogger_log_reason___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "negativeAccessCache");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  +[PAAccessMatcher negativeAccessCacheMatcherForAccess:](PAAccessMatcher, "negativeAccessCacheMatcherForAccess:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v3, v4);

}

- (void)endIntervalWithSlot:(id)a3 timestampAdjustment:(double)a4 accessCount:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v8 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  v21 = 0;
  if (objc_msgSend(v8, "integerValue") >= 1)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __70__PAAccessLogger_endIntervalWithSlot_timestampAdjustment_accessCount___block_invoke;
    v13[3] = &unk_1E4FA4F48;
    v14 = v8;
    v15 = &v16;
    -[PAAccessLogger withLockedState:](self, "withLockedState:", v13);

  }
  v9 = (void *)v17[5];
  if (v9)
  {
    objc_msgSend(v9, "asIntervalEndEventWithTimestampAdjustment:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessCount:", a5);
    -[PAAccessLogger log:reason:](self, "log:reason:", v10, 0);

  }
  else
  {
    v11 = logger_3;
    if (os_log_type_enabled((os_log_t)logger_3, OS_LOG_TYPE_DEBUG))
      -[PAAccessLogger endIntervalWithSlot:timestampAdjustment:accessCount:].cold.1((uint64_t)v8, v11, v12);
  }
  _Block_object_dispose(&v16, 8);

}

void __70__PAAccessLogger_endIntervalWithSlot_timestampAdjustment_accessCount___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "takeOngoingAccessIntervalStateForSlot:", *(_QWORD *)(a1 + 32));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "access");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)handleConnectionInvalidated
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = logger_3;
  if (os_log_type_enabled((os_log_t)logger_3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A5DE1000, v3, OS_LOG_TYPE_INFO, "XPC connection invalidated", v4, 2u);
  }
  os_unfair_lock_lock(&self->_lock);
  -[PAAccessLogger lockedInvalidateState](self, "lockedInvalidateState");
  os_unfair_lock_unlock(&self->_lock);
}

void __51__PAAccessLogger_lockedNotifyDidSetLoggingEnabled___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logger:didSetLoggingEnabled:", WeakRetained, *(unsigned __int8 *)(a1 + 40));

}

void __53__PAAccessLogger_notifyDidLogAccess_failedWithError___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logger:didLogAccess:failedWithError:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __42__PAAccessLogger_notifyDidCoalesceAccess___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logger:didCoalesceAccess:", WeakRetained, *(_QWORD *)(a1 + 32));

}

void __63__PAAccessLogger_ensureEnablementChangedNotificationRegistered__block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  id WeakRetained;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = logger_3;
  if (os_log_type_enabled((os_log_t)logger_3, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_1A5DE1000, v4, OS_LOG_TYPE_INFO, "Received enablement changed notification with token=%d", (uint8_t *)v6, 8u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setLoggingEnabled:", 1);

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setMaxRetryCount:(int64_t)a3
{
  self->_maxRetryCount = a3;
}

- (void)setCoalescingIntervalTracker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescingIntervalTracker, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_enablementChangedNotificationName, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

- (PAAccessLogger)initWithConnection:(id)a3 queue:(id)a4 forcingOptions:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  PAAccessLogger *v12;
  dispatch_semaphore_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  dispatch_time_t v19;
  PAAccessLogger *v20;
  uint64_t *v21;
  void *v22;
  PAAccessLogger *v23;
  _QWORD v25[4];
  NSObject *v26;
  uint64_t *v27;
  _QWORD v28[4];
  NSObject *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v10 = a3;
  v11 = a4;
  v12 = -[PAAccessLogger initWithConnection:queue:enablementChangedNotificationName:options:](self, "initWithConnection:queue:enablementChangedNotificationName:options:", v10, v11, CFSTR("com.apple.PrivacyAccounting.toggled"), a5);
  if (v12)
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__0;
    v35 = __Block_byref_object_dispose__0;
    v36 = 0;
    v13 = dispatch_semaphore_create(0);
    -[PAAccessLogger connection](v12, "connection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __73__PAAccessLogger_Testing__initWithConnection_queue_forcingOptions_error___block_invoke;
    v28[3] = &unk_1E4FA4FE8;
    v30 = &v31;
    v16 = v13;
    v29 = v16;
    objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v28);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v15;
    v25[1] = 3221225472;
    v25[2] = __73__PAAccessLogger_Testing__initWithConnection_queue_forcingOptions_error___block_invoke_2;
    v25[3] = &unk_1E4FA4FE8;
    v27 = &v31;
    v18 = v16;
    v26 = v18;
    objc_msgSend(v17, "changeTestingSettings:reply:", 0, a5, v25);

    v19 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v18, v19))
    {
      if (a6)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PAErrorDomain"), 20, 0);
        v20 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = 0;
      }
    }
    else
    {
      v21 = v32;
      if (a6)
      {
        v22 = (void *)v32[5];
        if (v22)
        {
          *a6 = objc_retainAutorelease(v22);
          v21 = v32;
        }
      }
      if (v21[5])
        v23 = 0;
      else
        v23 = v12;
      v20 = v23;
    }

    _Block_object_dispose(&v31, 8);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

void __73__PAAccessLogger_Testing__initWithConnection_queue_forcingOptions_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __73__PAAccessLogger_Testing__initWithConnection_queue_forcingOptions_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)beginIntervalForAccess:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_0(&dword_1A5DE1000, a3, (uint64_t)a3, "Began interval with slot=%{public}@", (uint8_t *)a2);

}

void __41__PAAccessLogger_beginIntervalForAccess___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1A5DE1000, a2, a3, "Trying to begin new interval for access=%@ already associated with ongoing interval", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __41__PAAccessLogger_beginIntervalForAccess___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_0(&dword_1A5DE1000, a2, a3, "Logging disabled; returning placeholder interval for access=%@",
    (uint8_t *)&v4);
  OUTLINED_FUNCTION_4();
}

- (void)initWithConnection:(os_log_t)log queue:enablementChangedNotificationName:options:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136315650;
  v4 = "-[PAAccessLogger initWithConnection:queue:enablementChangedNotificationName:options:]";
  v5 = 2112;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  _os_log_debug_impl(&dword_1A5DE1000, log, OS_LOG_TYPE_DEBUG, "%s: connection=%@, queue=%@", (uint8_t *)&v3, 0x20u);
}

- (void)log:(void *)a1 reason:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4[0] = 68157954;
  v4[1] = objc_msgSend(a2, "length");
  v5 = 2080;
  v6 = objc_msgSend(objc_retainAutorelease(a2), "bytes");
  _os_log_debug_impl(&dword_1A5DE1000, v3, OS_LOG_TYPE_DEBUG, "#QA #PAAccess %.*s", (uint8_t *)v4, 0x12u);

}

- (void)recordAssetIdentifiers:(uint64_t)a3 withVisibilityState:(uint64_t)a4 accessEventCount:(uint64_t)a5 forSlot:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1A5DE1000, a2, a3, "Tried to record asset identifiers for a closed interval.  Slot=%{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)endIntervalWithSlot:(uint64_t)a1 timestampAdjustment:(NSObject *)a2 accessCount:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_1A5DE1000, a2, a3, "Tried to end interval with unknown slot=%{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_4();
}

- (void)notifyDidLogAccess:(uint64_t)a3 failedWithError:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_1A5DE1000, a2, a3, "Logged access: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_4();
}

@end
