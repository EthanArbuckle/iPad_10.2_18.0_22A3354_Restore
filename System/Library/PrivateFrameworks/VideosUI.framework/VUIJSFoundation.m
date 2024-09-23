@implementation VUIJSFoundation

- (VUIJSFoundation)initWithAppContext:(id)a3
{
  id v4;
  VUIJSFoundation *v5;
  VUIJSFoundation *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *jsTimers;
  NSMutableDictionary *v9;
  NSMutableDictionary *dateFormatterCache;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VUIJSFoundation;
  v5 = -[VUIJSFoundation init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_appContext, v4);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    jsTimers = v6->_jsTimers;
    v6->_jsTimers = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dateFormatterCache = v6->_dateFormatterCache;
    v6->_dateFormatterCache = v9;

  }
  return v6;
}

- (id)setInterval:(id)a3 time:(int64_t)a4
{
  return -[VUIJSFoundation _startTimer:time:repeating:](self, "_startTimer:time:repeating:", a3, a4, 1);
}

- (id)setTimeout:(id)a3 time:(int64_t)a4
{
  return -[VUIJSFoundation _startTimer:time:repeating:](self, "_startTimer:time:repeating:", a3, a4, 0);
}

- (void)stopTimers
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD block[4];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[VUIJSFoundation jsTimers](self, "jsTimers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "valueForKey:", CFSTR("timer"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10++), "removeManagedReferences");
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __29__VUIJSFoundation_stopTimers__block_invoke;
    block[3] = &unk_1E9F98DF0;
    v14 = v5;
    v11 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  -[VUIJSFoundation jsTimers](self, "jsTimers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

}

void __29__VUIJSFoundation_stopTimers__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "invalidate", (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (id)_startTimer:(id)a3 time:(int64_t)a4 repeating:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  int64_t v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  VUIJSTimerContext *v16;
  void *v17;
  void *v18;
  VUIJSTimerContext *v19;
  void *v20;
  id v21;
  _QWORD block[4];
  id v24;

  v5 = a5;
  v8 = a3;
  -[VUIJSFoundation appContext](self, "appContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isObject") & 1) == 0)
  {
    v11 = CFSTR("starting timer with empty handler");
    goto LABEL_9;
  }
  if (a4 >= 1)
    v10 = a4;
  else
    v10 = 0;
  if (a4 <= 0 && v5)
  {
    v11 = CFSTR("starting timer with invalid timeout");
LABEL_9:
    objc_msgSend(v9, "setException:withErrorMessage:", 0, v11);
    v12 = 0;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CBE0F0], "currentArguments");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v13, "count") < 3)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(v13, "subarrayWithRange:", 2, objc_msgSend(v13, "count") - 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__jsTimerFired_, 0, v5, (float)((float)v10 / 1000.0));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = [VUIJSTimerContext alloc];
  objc_msgSend(v9, "jsContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("App"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[VUIJSTimerContext initWithCallback:callbackArgs:repeating:ownerObject:timer:](v16, "initWithCallback:callbackArgs:repeating:ownerObject:timer:", v8, v14, v5, v18, v15);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIJSFoundation jsTimers](self, "jsTimers");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKey:", v19, v12);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__VUIJSFoundation__startTimer_time_repeating___block_invoke;
  block[3] = &unk_1E9F98DF0;
  v24 = v15;
  v21 = v15;
  dispatch_async(MEMORY[0x1E0C80D38], block);

LABEL_14:
  return v12;
}

void __46__VUIJSFoundation__startTimer_time_repeating___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addTimer:forMode:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0C99860]);

}

- (void)_clearTimer:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD block[4];
  id v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "length"))
  {
    -[VUIJSFoundation jsTimers](self, "jsTimers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[NSObject timer](v6, "timer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject removeManagedReferences](v6, "removeManagedReferences");
      -[VUIJSFoundation jsTimers](self, "jsTimers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObjectForKey:", v4);

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __31__VUIJSFoundation__clearTimer___block_invoke;
      block[3] = &unk_1E9F98DF0;
      v11 = v7;
      v9 = v7;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }
  else
  {
    VUIDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[VUIJSFoundation _clearTimer:].cold.1((uint64_t)v4, v6);
  }

}

uint64_t __31__VUIJSFoundation__clearTimer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)_jsTimerFired:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[VUIJSFoundation appContext](self, "appContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __33__VUIJSFoundation__jsTimerFired___block_invoke;
  v8[3] = &unk_1E9F9CBA8;
  objc_copyWeak(&v10, &location);
  v7 = v5;
  v9 = v7;
  objc_msgSend(v6, "evaluate:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __33__VUIJSFoundation__jsTimerFired___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v13 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "jsTimers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "managedCallback");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "managedArgs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "jsValuesWithContext:", v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)objc_msgSend(v8, "callWithArguments:", v10);

      if ((objc_msgSend(v6, "isRepeating") & 1) == 0)
      {
        objc_msgSend(v6, "removeManagedReferences");
        objc_msgSend(v4, "jsTimers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

      }
    }

  }
}

- (VUIAppContext)appContext
{
  return (VUIAppContext *)objc_loadWeakRetained((id *)&self->_appContext);
}

- (void)setAppContext:(id)a3
{
  objc_storeWeak((id *)&self->_appContext, a3);
}

- (NSMutableDictionary)jsTimers
{
  return self->_jsTimers;
}

- (void)setJsTimers:(id)a3
{
  objc_storeStrong((id *)&self->_jsTimers, a3);
}

- (NSMutableDictionary)dateFormatterCache
{
  return self->_dateFormatterCache;
}

- (void)setDateFormatterCache:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatterCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatterCache, 0);
  objc_storeStrong((id *)&self->_jsTimers, 0);
  objc_destroyWeak((id *)&self->_appContext);
}

- (void)_clearTimer:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D96EE000, a2, OS_LOG_TYPE_ERROR, "Unknown timer: %@", (uint8_t *)&v2, 0xCu);
}

@end
