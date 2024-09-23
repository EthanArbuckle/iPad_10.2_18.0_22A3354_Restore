@implementation SKUIToggleStateCenter

- (SKUIToggleStateCenter)init
{
  SKUIToggleStateCenter *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v6;
  OS_dispatch_queue *observerQueue;
  NSMutableDictionary *v8;
  NSMutableDictionary *itemStates;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIToggleStateCenter init].cold.1();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIToggleStateCenter;
  v3 = -[SKUIToggleStateCenter init](&v14, sel_init);
  if (v3)
  {
    v4 = dispatch_queue_create("com.apple.StoreKitUI.SKUIToggleStateCenter", 0);
    accessQueue = v3->_accessQueue;
    v3->_accessQueue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_create("com.apple.StoreKitUI.SKUIToggleStateCenter.observers", 0);
    observerQueue = v3->_observerQueue;
    v3->_observerQueue = (OS_dispatch_queue *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    itemStates = v3->_itemStates;
    v3->_itemStates = v8;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0DAF718];
    objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v3, sel__accountStoreChangeNotification_, v11, v12);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DAF718];
  objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, v5);

  v6.receiver = self;
  v6.super_class = (Class)SKUIToggleStateCenter;
  -[SKUIToggleStateCenter dealloc](&v6, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__SKUIToggleStateCenter_addObserver___block_invoke;
  v7[3] = &unk_1E739FD10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

uint64_t __37__SKUIToggleStateCenter_addObserver___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (!v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 0);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)clearAll
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SKUIToggleStateCenter_clearAll__block_invoke;
  block[3] = &unk_1E739FD38;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

void __33__SKUIToggleStateCenter_clearAll__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfStateChanges:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

+ (id)defaultCenter
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__SKUIToggleStateCenter_defaultCenter__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultCenter_sOnce_0 != -1)
    dispatch_once(&defaultCenter_sOnce_0, block);
  return (id)defaultCenter_sCenter_0;
}

void __38__SKUIToggleStateCenter_defaultCenter__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)defaultCenter_sCenter_0;
  defaultCenter_sCenter_0 = (uint64_t)v1;

}

- (id)itemForIdentifier:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__49;
  v16 = __Block_byref_object_dispose__49;
  v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__SKUIToggleStateCenter_itemForIdentifier___block_invoke;
  block[3] = &unk_1E73A5CF0;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(accessQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __43__SKUIToggleStateCenter_itemForIdentifier___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  SKUIToggleStateItem *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", a1[5]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v12, "copy");
    v4 = *(_QWORD *)(a1[6] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v6 = v12;
  }
  else
  {
    v7 = objc_alloc_init(SKUIToggleStateItem);
    v8 = *(_QWORD *)(a1[6] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setItemIdentifier:", a1[5]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setToggled:", 0xFFFFFFFFLL);
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setCount:", -1);
    objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[5]);
    v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "copy");
    v11 = *(_QWORD *)(a1[6] + 8);
    v6 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;
  }

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__SKUIToggleStateCenter_removeObserver___block_invoke;
  block[3] = &unk_1E739FD10;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(accessQueue, block);

}

uint64_t __40__SKUIToggleStateCenter_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (BOOL)updateItem:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__SKUIToggleStateCenter_updateItem___block_invoke;
  block[3] = &unk_1E73A5CF0;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(accessQueue, block);
  LOBYTE(accessQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)accessQueue;
}

void __36__SKUIToggleStateCenter_updateItem___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  id v13;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "itemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v13;
  if (v13)
  {
    v5 = objc_msgSend(v13, "count");
    if (v5 != objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      objc_msgSend(v13, "setCount:", objc_msgSend(*(id *)(a1 + 40), "count"));
    }
    objc_msgSend(*(id *)(a1 + 40), "toggledString");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(*(id *)(a1 + 40), "toggledString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "toggledString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

      if ((v10 & 1) == 0)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
        objc_msgSend(*(id *)(a1 + 40), "toggledString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setToggledString:", v11);

      }
    }
    v12 = objc_msgSend(v13, "toggled");
    if (v12 != objc_msgSend(*(id *)(a1 + 40), "toggled"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      objc_msgSend(v13, "setToggled:", objc_msgSend(*(id *)(a1 + 40), "toggled"));
    }
    v4 = v13;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfStateChanges:", v13);
      v4 = v13;
    }
  }

}

- (void)_notifyObserversOfStateChanges:(id)a3
{
  id v4;
  void *v5;
  NSObject *observerQueue;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  SKUIToggleStateCenter *v11;
  id v12;

  v4 = a3;
  v5 = (void *)-[NSHashTable copy](self->_observers, "copy");
  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__SKUIToggleStateCenter__notifyObserversOfStateChanges___block_invoke;
  block[3] = &unk_1E73A02E8;
  v10 = v5;
  v11 = self;
  v12 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(observerQueue, block);

}

void __56__SKUIToggleStateCenter__notifyObserversOfStateChanges___block_invoke(uint64_t a1)
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

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "itemStateCenter:itemStateChanged:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_itemStates, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)init
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIToggleStateCenter init]";
}

@end
