@implementation SKUIMetricsFlushTimer

- (SKUIMetricsFlushTimer)init
{
  SKUIMetricsFlushTimer *v3;
  uint64_t v4;
  NSHashTable *metricsControllers;
  void *v6;
  objc_super v8;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIMetricsFlushTimer init].cold.1();
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUIMetricsFlushTimer;
  v3 = -[SKUIMetricsFlushTimer init](&v8, sel_init);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 514, 0);
    metricsControllers = v3->_metricsControllers;
    v3->_metricsControllers = (NSHashTable *)v4;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel__applicationDidEnterBackgroundNotification_, *MEMORY[0x1E0DC4768], 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel__applicationWillEnterForegroundNotification_, *MEMORY[0x1E0DC4860], 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  NSObject *timer;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4768], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4860], 0);
  timer = self->_timer;
  if (timer)
    dispatch_source_cancel(timer);

  v5.receiver = self;
  v5.super_class = (Class)SKUIMetricsFlushTimer;
  -[SKUIMetricsFlushTimer dealloc](&v5, sel_dealloc);
}

+ (id)sharedTimer
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)sharedTimer_sTimer;
  if (!sharedTimer_sTimer)
  {
    v4 = objc_alloc_init((Class)a1);
    v5 = (void *)sharedTimer_sTimer;
    sharedTimer_sTimer = (uint64_t)v4;

    v3 = (void *)sharedTimer_sTimer;
  }
  return v3;
}

- (void)addMetricsController:(id)a3
{
  -[NSHashTable addObject:](self->_metricsControllers, "addObject:", a3);
  -[SKUIMetricsFlushTimer reloadFlushInterval](self, "reloadFlushInterval");
}

- (void)reloadFlushInterval
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  double v9;
  NSObject *timer;
  dispatch_time_t v11;
  OS_dispatch_source *v12;
  OS_dispatch_source *v13;
  dispatch_time_t v14;
  NSObject *v15;
  dispatch_time_t v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id location;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!-[NSHashTable count](self->_metricsControllers, "count"))
  {
    -[SKUIMetricsFlushTimer _cancelFlushTimer](self, "_cancelFlushTimer");
    return;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = self->_metricsControllers;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v4)
  {

LABEL_17:
    -[SKUIMetricsFlushTimer _cancelFlushTimer](self, "_cancelFlushTimer");
    return;
  }
  v5 = v4;
  v6 = *(_QWORD *)v22;
  v7 = 0.0;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v22 != v6)
        objc_enumerationMutation(v3);
      objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "flushInterval");
      if (v7 < 1.0 || v9 < v7)
        v7 = v9;
    }
    v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  }
  while (v5);

  if (v7 < 1.0)
    goto LABEL_17;
  timer = self->_timer;
  if (timer)
  {
    v11 = dispatch_time(self->_timerStartTime, (uint64_t)(v7 * 1000000000.0));
    dispatch_source_set_timer(timer, v11, 0, 0);
  }
  else
  {
    v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
    v13 = self->_timer;
    self->_timer = v12;

    v14 = dispatch_walltime(0, 0);
    self->_timerStartTime = v14;
    v15 = self->_timer;
    v16 = dispatch_time(v14, (uint64_t)(v7 * 1000000000.0));
    dispatch_source_set_timer(v15, v16, 0, 0);
    objc_initWeak(&location, self);
    v17 = self->_timer;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __44__SKUIMetricsFlushTimer_reloadFlushInterval__block_invoke;
    v18[3] = &unk_1E739FF68;
    objc_copyWeak(&v19, &location);
    dispatch_source_set_event_handler(v17, v18);
    dispatch_resume((dispatch_object_t)self->_timer);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

void __44__SKUIMetricsFlushTimer_reloadFlushInterval__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_performFlush");

}

- (void)removeMetricsController:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSHashTable count](self->_metricsControllers, "count") == 1
    && -[NSHashTable containsObject:](self->_metricsControllers, "containsObject:", v4))
  {
    objc_msgSend(v4, "flushImmediately");
  }
  -[NSHashTable removeObject:](self->_metricsControllers, "removeObject:", v4);
  -[SKUIMetricsFlushTimer reloadFlushInterval](self, "reloadFlushInterval");

}

- (void)_applicationDidEnterBackgroundNotification:(id)a3
{
  id v4;

  -[NSHashTable anyObject](self->_metricsControllers, "anyObject", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flushImmediately");
  -[SKUIMetricsFlushTimer _cancelFlushTimer](self, "_cancelFlushTimer");

}

- (void)_cancelFlushTimer
{
  NSObject *timer;
  OS_dispatch_source *v4;

  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;

  }
}

- (void)_performFlush
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *timer;
  OS_dispatch_source *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_metricsControllers;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (v6)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "closeImpressionsSession", (_QWORD)v12);
          objc_msgSend(v9, "_waitUntilRecordingComplete");
        }
        else
        {
          v6 = v9;
        }
      }
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  objc_msgSend(v6, "flushImmediately");
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v11 = self->_timer;
    self->_timer = 0;

  }
  -[SKUIMetricsFlushTimer reloadFlushInterval](self, "reloadFlushInterval", (_QWORD)v12);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_metricsControllers, 0);
}

- (void)init
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIMetricsFlushTimer init]";
}

@end
