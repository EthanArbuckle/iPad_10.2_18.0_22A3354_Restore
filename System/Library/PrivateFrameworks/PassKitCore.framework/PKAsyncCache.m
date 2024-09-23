@implementation PKAsyncCache

- (void)retrieveItemForKey:(id)a3 synchronous:(BOOL)a4 retrievalBlock:(id)a5 deliveryBlock:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void (**v12)(id, void *);
  void *v13;
  uint64_t v14;
  id v15;
  PKAsyncCacheRetrievalInfo *v16;
  PKAsyncCacheRetrievalInfo *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v8 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, void *))a6;
  os_unfair_lock_lock(&self->_lock);
  -[NSCache objectForKey:](self->_itemByKey, "objectForKey:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    goto LABEL_4;
  -[NSMapTable objectForKey:](self->_weakItemByKey, "objectForKey:", v10);
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_outstandingRetrievals, "objectForKeyedSubscript:", v10);
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v17 = (PKAsyncCacheRetrievalInfo *)v23;
      os_unfair_lock_unlock(&self->_lock);
      v28 = 0;
      if (!v8)
        goto LABEL_27;
    }
    else
    {
      v17 = objc_alloc_init(PKAsyncCacheRetrievalInfo);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_outstandingRetrievals, "setObject:forKeyedSubscript:", v17, v10);
      os_unfair_lock_unlock(&self->_lock);
      v28 = 0;
      if (!v8)
      {
        -[PKAsyncCache _executeRetrievalBlock:forKey:](self, "_executeRetrievalBlock:forKey:", v11, v10);
LABEL_27:
        -[PKAsyncCacheRetrievalInfo addDeliveryBlock:](v17, "addDeliveryBlock:", v12);
        v16 = 0;
        v13 = 0;
        goto LABEL_16;
      }
    }
    -[PKAsyncCacheRetrievalInfo synchronouslyRetrieve:outDeliveryBlocks:](v17, "synchronouslyRetrieve:outDeliveryBlocks:", v11, &v28);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock(&self->_lock);
    if (v13)
    {
      -[NSCache setObject:forKey:](self->_itemByKey, "setObject:forKey:", v13, v10);
      -[NSMapTable setObject:forKey:](self->_weakItemByKey, "setObject:forKey:", v13, v10);
    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_outstandingRetrievals, "objectForKeyedSubscript:", v10);
    v16 = (PKAsyncCacheRetrievalInfo *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_outstandingRetrievals, "setObject:forKeyedSubscript:", 0, v10);
    if (v17 == v16)
    {

      v16 = 0;
    }
    os_unfair_lock_unlock(&self->_lock);
    v15 = v28;
    goto LABEL_5;
  }
  v13 = (void *)v14;
  -[NSCache setObject:forKey:](self->_itemByKey, "setObject:forKey:", v14, v10);
LABEL_4:
  os_unfair_lock_unlock(&self->_lock);
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v28 = 0;
LABEL_5:
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v18 = v15;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(v18);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v20);
  }

  if (v16)
    -[PKAsyncCacheRetrievalInfo deliverItem:](v16, "deliverItem:", v13, (_QWORD)v24);
  if (v12)
    v12[2](v12, v13);
LABEL_16:

}

- (PKAsyncCache)init
{
  id v3;
  PKAsyncCache *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v4 = -[PKAsyncCache initWithCache:](self, "initWithCache:", v3);

  return v4;
}

- (PKAsyncCache)initWithCache:(id)a3
{
  id v5;
  PKAsyncCache *v6;
  PKAsyncCache *v7;
  uint64_t v8;
  NSMapTable *weakItemByKey;
  NSMutableDictionary *v10;
  NSMutableDictionary *outstandingRetrievals;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKAsyncCache;
  v6 = -[PKAsyncCache init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_itemByKey, a3);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    weakItemByKey = v7->_weakItemByKey;
    v7->_weakItemByKey = (NSMapTable *)v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    outstandingRetrievals = v7->_outstandingRetrievals;
    v7->_outstandingRetrievals = v10;

  }
  return v7;
}

- (void)_executeRetrievalBlock:(id)a3 forKey:(id)a4
{
  id v6;
  void (*v7)(id, _QWORD *);
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__PKAsyncCache__executeRetrievalBlock_forKey___block_invoke;
  v9[3] = &unk_1E2AC3BD0;
  v9[4] = self;
  v10 = v6;
  v7 = (void (*)(id, _QWORD *))*((_QWORD *)a3 + 2);
  v8 = v6;
  v7(a3, v9);

}

void __46__PKAsyncCache__executeRetrievalBlock_forKey___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  if (v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", v4, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", v4, *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v3, "deliverItem:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outstandingRetrievals, 0);
  objc_storeStrong((id *)&self->_weakItemByKey, 0);
  objc_storeStrong((id *)&self->_itemByKey, 0);
}

@end
