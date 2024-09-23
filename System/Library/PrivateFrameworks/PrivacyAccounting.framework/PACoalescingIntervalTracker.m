@implementation PACoalescingIntervalTracker

- (PACoalescingIntervalTracker)initWithLogger:(id)a3
{
  id v4;
  PACoalescingIntervalTracker *v5;
  PACoalescingIntervalTracker *v6;
  uint64_t v7;
  NSMutableDictionary *coalescingIntervals;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PACoalescingIntervalTracker;
  v5 = -[PACoalescingIntervalTracker init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_logger, v4);
    v6->_intervalEndTime = 60.0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    coalescingIntervals = v6->_coalescingIntervals;
    v6->_coalescingIntervals = (NSMutableDictionary *)v7;

    v6->_collectAssetIdentifiers = _os_feature_enabled_impl();
    v6->_loggingOptions = objc_msgSend(v4, "options");
  }

  return v6;
}

- (void)coalesce:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  PACoalescingIntervalState *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  PACoalescingIntervalState *v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  +[PAAccessMatcher coalescingMatcherForAccess:](PAAccessMatcher, "coalescingMatcherForAccess:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_coalescingIntervals, "objectForKeyedSubscript:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  if ((self->_loggingOptions & 1) != 0)
    v7 = objc_msgSend(v4, "supportsSameMinuteAccessCountLogging");
  else
    v7 = 0;
  objc_msgSend(v4, "assetIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl() && !objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &self->_injectedIdentifier, 8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ++self->_injectedIdentifier;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }
  v11 = (PACoalescingIntervalState *)v6;
  if (!v6)
  {
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "components:fromDate:", 128, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_msgSend(v14, "second");
      -[PACoalescingIntervalTracker logger](self, "logger");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "beginIntervalForAccess:", v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = -[PACoalescingIntervalState initWithInterval:matcher:tracker:expiry:]([PACoalescingIntervalState alloc], "initWithInterval:matcher:tracker:expiry:", v17, v5, self, 59.0 - (double)v15);
    }
    else
    {
      -[PACoalescingIntervalTracker logger](self, "logger");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "beginIntervalForAccess:", v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = -[PACoalescingIntervalState initWithInterval:matcher:tracker:]([PACoalescingIntervalState alloc], "initWithInterval:matcher:tracker:", v14, v5, self);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_coalescingIntervals, "setObject:forKeyedSubscript:", v11, v5);
  }
  logger_1();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v23 = v4;
    v24 = 2112;
    v25 = v11;
    v26 = 1024;
    v27 = v6 == 0;
    _os_log_debug_impl(&dword_1A5DE1000, v19, OS_LOG_TYPE_DEBUG, "Coalescing access=%@ into interval=%@ isNew=%d", buf, 0x1Cu);
  }

  if (self->_collectAssetIdentifiers)
  {
    -[PACoalescingIntervalState interval](v11, "interval");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "recordAccessToAssetIdentifiers:withVisibilityState:accessEventCount:", v8, 0, 1);

  }
  if ((v7 & 1) != 0)
    -[PACoalescingIntervalState setAccessCount:](v11, "setAccessCount:", -[PACoalescingIntervalState accessCount](v11, "accessCount") + 1);
  else
    -[PACoalescingIntervalState touch](v11, "touch");
  -[PACoalescingIntervalTracker logger](self, "logger");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "notifyDidCoalesceAccess:", v4);

  os_unfair_lock_unlock(&self->_lock);
}

- (PAAccessLogger)logger
{
  return (PAAccessLogger *)objc_loadWeakRetained((id *)&self->_logger);
}

- (double)intervalEndTime
{
  return self->_intervalEndTime;
}

- (void)expireIntervalWithMatcher:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  void *v9;
  NSObject *v10;
  void *v11;
  double v12;

  v6 = a3;
  v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_coalescingIntervals, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  logger_1();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[PACoalescingIntervalTracker expireIntervalWithMatcher:state:].cold.1((uint64_t)v9, v10);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_coalescingIntervals, "setObject:forKeyedSubscript:", 0, v6);
  objc_msgSend(v9, "interval");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timestampAdjustment");
  objc_msgSend(v11, "endWithTimestampAdjustment:accessCount:", objc_msgSend(v9, "accessCount"), v12);

  os_unfair_lock_unlock(p_lock);
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSMutableDictionary *coalescingIntervals;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_coalescingIntervals;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_coalescingIntervals, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7), (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "invalidate");

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  coalescingIntervals = self->_coalescingIntervals;
  self->_coalescingIntervals = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  objc_super v3;

  -[PACoalescingIntervalTracker invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PACoalescingIntervalTracker;
  -[PACoalescingIntervalTracker dealloc](&v3, sel_dealloc);
}

- (void)setIntervalEndTime:(double)a3
{
  self->_intervalEndTime = a3;
}

- (BOOL)collectAssetIdentifiers
{
  return self->_collectAssetIdentifiers;
}

- (void)setCollectAssetIdentifiers:(BOOL)a3
{
  self->_collectAssetIdentifiers = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_logger);
  objc_storeStrong((id *)&self->_coalescingIntervals, 0);
}

- (void)expireIntervalWithMatcher:(uint64_t)a1 state:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1A5DE1000, a2, OS_LOG_TYPE_DEBUG, "Ending idle coalescing interval=%@", (uint8_t *)&v2, 0xCu);
}

@end
