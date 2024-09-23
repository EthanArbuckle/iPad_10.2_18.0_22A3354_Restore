@implementation SKUIMediaQueryEvaluator

- (SKUIMediaQueryEvaluator)init
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SKUIMediaQueryEvaluator *v11;
  uint64_t v12;
  NSMapTable *cachedFeatureResults;
  NSMutableSet *v14;
  NSMutableSet *observedNotificationNames;
  objc_super v17;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIMediaQueryEvaluator init].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUIMediaQueryEvaluator;
  v11 = -[SKUIMediaQueryEvaluator init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    cachedFeatureResults = v11->_cachedFeatureResults;
    v11->_cachedFeatureResults = (NSMapTable *)v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    observedNotificationNames = v11->_observedNotificationNames;
    v11->_observedNotificationNames = v14;

  }
  return v11;
}

- (void)dealloc
{
  void *v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *reloadTimer;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_observedNotificationNames;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "removeObserver:name:object:", self, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8++), 0);
      }
      while (v6 != v8);
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  reloadTimer = self->_reloadTimer;
  if (reloadTimer)
    dispatch_source_cancel(reloadTimer);

  v10.receiver = self;
  v10.super_class = (Class)SKUIMediaQueryEvaluator;
  -[SKUIMediaQueryEvaluator dealloc](&v10, sel_dealloc);
}

+ (void)registerFeatureClass:(Class)a3
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)sClassSet;
  if (!sClassSet)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v6 = (void *)sClassSet;
    sClassSet = (uint64_t)v5;

    v4 = (void *)sClassSet;
  }
  objc_msgSend(v4, "addObject:", a3);
}

- (BOOL)evaluateMediaQuery:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  SKUIMediaQueryEvaluator *v11;
  id v12;
  void *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  NSMapTable *cachedFeatureResults;
  void *v22;
  id v24;
  id v25;
  id v26;
  id v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  id v35;
  SKUIMediaQueryEvaluator *v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "featureValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __46__SKUIMediaQueryEvaluator_evaluateMediaQuery___block_invoke;
  v33[3] = &unk_1E739FF40;
  v9 = v5;
  v34 = v9;
  v10 = v6;
  v35 = v10;
  v36 = self;
  v11 = self;
  v12 = v7;
  v37 = v12;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v33);

  if (objc_msgSend(v9, "count"))
  {
    if (objc_msgSend(v10, "count"))
    {
      -[SKUIMediaQueryEvaluator _delegateValuesForKeys:](v11, "_delegateValuesForKeys:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    v24 = v12;
    v25 = v10;
    v26 = v9;
    v27 = v4;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = v9;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v30;
      v14 = 1;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v30 != v17)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v20 = objc_msgSend(v19, "evaluateWithValues:", v13);
          cachedFeatureResults = v11->_cachedFeatureResults;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMapTable setObject:forKey:](cachedFeatureResults, "setObject:forKey:", v22, v19);

          v14 &= v20;
        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      }
      while (v16);
    }
    else
    {
      v14 = 1;
    }

    v9 = v26;
    v4 = v27;
    v12 = v24;
    v10 = v25;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __46__SKUIMediaQueryEvaluator_evaluateMediaQuery___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = (id)sClassSet;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(objc_class **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (-[objc_class supportsFeatureName:](v12, "supportsFeatureName:", v5))
        {
          v13 = (void *)objc_msgSend([v12 alloc], "initWithFeatureName:value:", v5, v6);
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v13);
          objc_msgSend(v13, "requiredKeys");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v14);
          objc_msgSend(v13, "notificationNames");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v17[0] = MEMORY[0x1E0C809B0];
          v17[1] = 3221225472;
          v17[2] = __46__SKUIMediaQueryEvaluator_evaluateMediaQuery___block_invoke_2;
          v17[3] = &unk_1E739FF18;
          v16 = *(void **)(a1 + 56);
          v17[4] = *(_QWORD *)(a1 + 48);
          v18 = v16;
          objc_msgSend(v15, "enumerateObjectsUsingBlock:", v17);

          goto LABEL_13;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_13:

}

void __46__SKUIMediaQueryEvaluator_evaluateMediaQuery___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containsObject:") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__featureDidChangeNotification_, v3, 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", v3);
  }

}

- (void)reloadData
{
  void *v3;
  NSObject *reloadTimer;
  OS_dispatch_source *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  uint64_t v14;
  id WeakRetained;
  uint64_t v16;
  SKUIMediaQueryEvaluator *v17;
  char v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  NSMapTable *cachedFeatureResults;
  void *v26;
  id v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMapTable copy](self->_cachedFeatureResults, "copy");
  -[NSMapTable removeAllObjects](self->_cachedFeatureResults, "removeAllObjects");
  reloadTimer = self->_reloadTimer;
  if (reloadTimer)
  {
    dispatch_source_cancel(reloadTimer);
    v5 = self->_reloadTimer;
    self->_reloadTimer = 0;

  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "requiredKeys");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v6, "addObjectsFromArray:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v6, "count"))
  {
    -[SKUIMediaQueryEvaluator _delegateValuesForKeys:](self, "_delegateValuesForKeys:", v6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = 0;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  WeakRetained = v13;
  if (!v14)
    goto LABEL_25;
  v16 = v14;
  v27 = v6;
  v17 = self;
  v18 = 0;
  v19 = *(_QWORD *)v30;
  do
  {
    for (j = 0; j != v16; ++j)
    {
      if (*(_QWORD *)v30 != v19)
        objc_enumerationMutation(v13);
      v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
      v22 = objc_msgSend(v21, "evaluateWithValues:", v28, v27);
      objc_msgSend(v13, "objectForKey:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v22 ^ objc_msgSend(v23, "BOOLValue");

      v18 |= v24;
      cachedFeatureResults = v17->_cachedFeatureResults;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v22);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](cachedFeatureResults, "setObject:forKey:", v26, v21);

    }
    v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  }
  while (v16);

  v6 = v27;
  if ((v18 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v17->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "mediaQueryEvaluatorDidChange:", v17);
LABEL_25:

  }
}

- (void)_featureDidChangeNotification:(id)a3
{
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  NSObject *v7;

  v4 = MEMORY[0x1E0C80D38];
  v5 = MEMORY[0x1E0C80D38];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__SKUIMediaQueryEvaluator__featureDidChangeNotification___block_invoke;
  v6[3] = &unk_1E739FD10;
  v6[4] = self;
  v7 = v4;
  dispatch_async(v4, v6);

}

void __57__SKUIMediaQueryEvaluator__featureDidChangeNotification___block_invoke(uint64_t a1)
{
  dispatch_source_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
    v2 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(a1 + 40));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = v2;

    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    v6 = dispatch_time(0, 3000000000);
    dispatch_source_set_timer(v5, v6, 0, 0);
    objc_initWeak(&location, *(id *)(a1 + 32));
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__SKUIMediaQueryEvaluator__featureDidChangeNotification___block_invoke_2;
    v8[3] = &unk_1E739FF68;
    objc_copyWeak(&v9, &location);
    dispatch_source_set_event_handler(v7, v8);
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 32));
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __57__SKUIMediaQueryEvaluator__featureDidChangeNotification___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reloadData");

}

- (id)_delegateValuesForKeys:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = v4;
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
          v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(WeakRetained, "mediaQueryEvaluator:valueForKey:", self, v12, (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v5, "setObject:forKey:", v13, v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
  return v5;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(a1, "registerFeatureClass:", objc_opt_class());
    objc_msgSend(a1, "registerFeatureClass:", objc_opt_class());
  }
}

- (SKUIMediaQueryDelegate)delegate
{
  return (SKUIMediaQueryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reloadTimer, 0);
  objc_storeStrong((id *)&self->_observedNotificationNames, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cachedFeatureResults, 0);
}

- (void)init
{
}

@end
