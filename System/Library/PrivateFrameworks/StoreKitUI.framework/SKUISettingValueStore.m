@implementation SKUISettingValueStore

- (SKUISettingValueStore)init
{
  SKUISettingValueStore *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *mutexQueue;
  objc_super v7;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUISettingValueStore init].cold.1();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUISettingValueStore;
  v3 = -[SKUISettingValueStore init](&v7, sel_init);
  if (v3)
  {
    v4 = dispatch_queue_create("com.apple.StoreKitUI.SKUISettingValueStore", 0);
    mutexQueue = v3->_mutexQueue;
    v3->_mutexQueue = (OS_dispatch_queue *)v4;

  }
  return v3;
}

- (void)clearValueForKey:(id)a3
{
  id v4;
  NSObject *mutexQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SKUISettingValueStore_clearValueForKey___block_invoke;
  block[3] = &unk_1E739FD10;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(mutexQueue, block);

}

void *__42__SKUISettingValueStore_clearValueForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  if (v3)
  {
    objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    v2 = *(_QWORD *)(a1 + 32);
  }
  result = *(void **)(v2 + 24);
  if (result)
    return (void *)objc_msgSend(result, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)commitChanges
{
  NSObject *mutexQueue;
  _QWORD block[5];

  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__SKUISettingValueStore_commitChanges__block_invoke;
  block[3] = &unk_1E739FD38;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

void __38__SKUISettingValueStore_commitChanges__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  if (v3)
  {
    if (!*(_QWORD *)(v2 + 16))
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 16);
      *(_QWORD *)(v5 + 16) = v4;

      v2 = *(_QWORD *)(a1 + 32);
      v3 = *(void **)(v2 + 24);
    }
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __38__SKUISettingValueStore_commitChanges__block_invoke_2;
    v9[3] = &unk_1E73A3B88;
    v9[4] = v2;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v9);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 24);
    *(_QWORD *)(v7 + 24) = 0;

  }
}

uint64_t __38__SKUISettingValueStore_commitChanges__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", a3, a2);
}

- (void)discardChanges
{
  NSObject *mutexQueue;
  _QWORD block[5];

  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SKUISettingValueStore_discardChanges__block_invoke;
  block[3] = &unk_1E739FD38;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

void __39__SKUISettingValueStore_discardChanges__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  *(_QWORD *)(v1 + 24) = 0;

}

- (BOOL)hasChanges
{
  NSObject *mutexQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__SKUISettingValueStore_hasChanges__block_invoke;
  v5[3] = &unk_1E73A0270;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__SKUISettingValueStore_hasChanges__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 24) != 0;
  return result;
}

- (id)modifiedKeys
{
  NSObject *mutexQueue;
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
  v9 = __Block_byref_object_copy__25;
  v10 = __Block_byref_object_dispose__25;
  v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__SKUISettingValueStore_modifiedKeys__block_invoke;
  v5[3] = &unk_1E73A15A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __37__SKUISettingValueStore_modifiedKeys__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
  {
    objc_msgSend(v2, "allKeys");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

- (id)originalValueForKey:(id)a3
{
  id v4;
  NSObject *mutexQueue;
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
  v15 = __Block_byref_object_copy__25;
  v16 = __Block_byref_object_dispose__25;
  v17 = 0;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SKUISettingValueStore_originalValueForKey___block_invoke;
  block[3] = &unk_1E73A3BB0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(mutexQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __45__SKUISettingValueStore_originalValueForKey___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(a1[4] + 16);
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", a1[5]);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1[6] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

- (id)resolvedValueForKey:(id)a3
{
  id v4;
  NSObject *mutexQueue;
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
  v15 = __Block_byref_object_copy__25;
  v16 = __Block_byref_object_dispose__25;
  v17 = 0;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SKUISettingValueStore_resolvedValueForKey___block_invoke;
  block[3] = &unk_1E73A3BB0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(mutexQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __45__SKUISettingValueStore_resolvedValueForKey___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = *(void **)(a1[4] + 24);
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", a1[5]);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1[6] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v6 = *(void **)(a1[4] + 16);
    if (v6)
    {
      objc_msgSend(v6, "objectForKey:", a1[5]);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1[6] + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

    }
  }
}

- (void)setModifiedValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *mutexQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SKUISettingValueStore_setModifiedValue_forKey___block_invoke;
  block[3] = &unk_1E73A02E8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(mutexQueue, block);

}

uint64_t __49__SKUISettingValueStore_setModifiedValue_forKey___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (!*(_QWORD *)(a1[4] + 24))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3 = a1[4];
    v4 = *(void **)(v3 + 24);
    *(_QWORD *)(v3 + 24) = v2;

  }
  v5 = a1[5];
  v6 = *(void **)(a1[4] + 24);
  if (v5)
    return objc_msgSend(v6, "setObject:forKey:", v5, a1[6]);
  else
    return objc_msgSend(v6, "removeObjectForKey:", a1[6]);
}

- (void)setOriginalValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *mutexQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SKUISettingValueStore_setOriginalValue_forKey___block_invoke;
  block[3] = &unk_1E73A02E8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(mutexQueue, block);

}

uint64_t __49__SKUISettingValueStore_setOriginalValue_forKey___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (!*(_QWORD *)(a1[4] + 16))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3 = a1[4];
    v4 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = v2;

  }
  v5 = a1[5];
  v6 = *(void **)(a1[4] + 16);
  if (v5)
    return objc_msgSend(v6, "setObject:forKey:", v5, a1[6]);
  else
    return objc_msgSend(v6, "removeObjectForKey:", a1[6]);
}

- (id)valueForKey:(id)a3
{
  return 0;
}

- (id)valueForKeyPath:(id)a3
{
  return 0;
}

- (id)valueForUndefinedKey:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedValues, 0);
  objc_storeStrong((id *)&self->_originalValues, 0);
  objc_storeStrong((id *)&self->_mutexQueue, 0);
}

- (void)init
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUISettingValueStore init]";
}

@end
