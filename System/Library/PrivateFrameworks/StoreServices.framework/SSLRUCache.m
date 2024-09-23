@implementation SSLRUCache

- (id)objectForKey:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int *v24;
  uint64_t v25;
  _QWORD block[5];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  int v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__50;
  v33 = __Block_byref_object_dispose__50;
  v34 = 0;
  -[SSLRUCache accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__SSLRUCache_objectForKey___block_invoke;
  block[3] = &unk_1E47B86D0;
  v28 = &v29;
  block[4] = self;
  v6 = v4;
  v27 = v6;
  dispatch_sync(v5, block);

  objc_msgSend((id)v30[5], "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[SSLRUCache logConfig](self, "logConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v8, "shouldLog");
    v10 = objc_msgSend(v8, "shouldLogToDisk");
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
      v9 |= 2u;
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      v9 &= 2u;
    if (v9)
    {
      v13 = (void *)objc_opt_class();
      v35 = 138412546;
      v36 = v13;
      v37 = 2112;
      v38 = v6;
      v14 = v13;
      LODWORD(v25) = 22;
      v24 = &v35;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_12:

        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v15, 4, &v35, v25);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      free(v15);
      SSFileLog(v8, CFSTR("%@"), v16, v17, v18, v19, v20, v21, (uint64_t)v12);
    }

    goto LABEL_12;
  }
LABEL_13:
  objc_msgSend(v7, "object", v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v29, 8);
  return v22;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[SSLRUCache accessQueue](self, "accessQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __31__SSLRUCache_setObject_forKey___block_invoke;
  v11[3] = &unk_1E47BAB90;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (SSLogConfig)logConfig
{
  return self->_logConfig;
}

- (SSLRUCache)init
{
  return -[SSLRUCache initWithMaxSize:](self, "initWithMaxSize:", 5);
}

- (SSLRUCache)initWithMaxSize:(unint64_t)a3
{
  SSLRUCache *v4;
  id v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *accessQueue;
  NSMutableDictionary *v8;
  NSMutableDictionary *backingDictionary;
  SSDoubleLinkedList *v10;
  SSDoubleLinkedList *backingList;
  SSMutableLogConfig *v12;
  uint64_t v13;
  SSLogConfig *logConfig;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SSLRUCache;
  v4 = -[SSLRUCache init](&v16, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.StoreServices.SSLRUCache.accessQueue.%p"), v4);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = dispatch_queue_create((const char *)objc_msgSend(v5, "UTF8String"), 0);
    accessQueue = v4->_accessQueue;
    v4->_accessQueue = (OS_dispatch_queue *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    backingDictionary = v4->_backingDictionary;
    v4->_backingDictionary = v8;

    v10 = objc_alloc_init(SSDoubleLinkedList);
    backingList = v4->_backingList;
    v4->_backingList = v10;

    v4->_maxSize = a3;
    v12 = objc_alloc_init(SSMutableLogConfig);
    -[SSLogConfig setCategory:](v12, "setCategory:", CFSTR("SSLRUCache"));
    -[SSLogConfig setSubsystem:](v12, "setSubsystem:", CFSTR("com.apple.StoreServices"));
    -[SSLogConfig setWriteToDisk:](v12, "setWriteToDisk:", 0);
    v13 = -[SSMutableLogConfig copy](v12, "copy");
    logConfig = v4->_logConfig;
    v4->_logConfig = (SSLogConfig *)v13;

  }
  return v4;
}

void __31__SSLRUCache_setObject_forKey___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = WeakRetained;
  if (v3)
    objc_msgSend(WeakRetained, "_addObject:forKey:", v3, v4);
  else
    objc_msgSend(WeakRetained, "_removeObjectForKey:", v4);

}

void __27__SSLRUCache_objectForKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "backingDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "backingList");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeNode:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

    objc_msgSend(*(id *)(a1 + 32), "backingList");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertNode:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

  }
}

- (void)_addObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  SSLRUCacheItem *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  int v17;
  int v18;
  NSObject *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    v7 = a3;
    -[SSLRUCache backingDictionary](self, "backingDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[SSLRUCache backingList](self, "backingList");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeNode:", v9);

    }
    v11 = -[SSLRUCacheItem initWithKey:object:]([SSLRUCacheItem alloc], "initWithKey:object:", v6, v7);

    -[SSLRUCache backingList](self, "backingList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "insertObject:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[SSLRUCache backingDictionary](self, "backingDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v13, v6);

    v15 = -[SSLRUCache _count](self, "_count");
    if (v15 <= -[SSLRUCache maxSize](self, "maxSize"))
      goto LABEL_17;
    -[SSLRUCache logConfig](self, "logConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v17 = objc_msgSend(v16, "shouldLog");
    if (objc_msgSend(v16, "shouldLogToDisk"))
      v18 = v17 | 2;
    else
      v18 = v17;
    objc_msgSend(v16, "OSLogObject");
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      v18 &= 2u;
    if (v18)
    {
      LODWORD(v33) = 138412290;
      *(_QWORD *)((char *)&v33 + 4) = objc_opt_class();
      v20 = *(id *)((char *)&v33 + 4);
      LODWORD(v32) = 12;
      v21 = (void *)_os_log_send_and_compose_impl();

      if (!v21)
      {
LABEL_16:

        -[SSLRUCache backingList](self, "backingList");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "tail");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v29, "object");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "key");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSLRUCache _removeObjectForKey:](self, "_removeObjectForKey:", v31);

LABEL_17:
        goto LABEL_18;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v21, 4, &v33, v32, v33);
      v19 = objc_claimAutoreleasedReturnValue();
      free(v21);
      SSFileLog(v16, CFSTR("%@"), v22, v23, v24, v25, v26, v27, (uint64_t)v19);
    }

    goto LABEL_16;
  }
LABEL_18:

}

- (NSMutableDictionary)backingDictionary
{
  return self->_backingDictionary;
}

- (unint64_t)maxSize
{
  return self->_maxSize;
}

- (SSDoubleLinkedList)backingList
{
  return self->_backingList;
}

- (unint64_t)_count
{
  void *v2;
  unint64_t v3;

  -[SSLRUCache backingDictionary](self, "backingDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)count
{
  NSObject *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[SSLRUCache accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __19__SSLRUCache_count__block_invoke;
  v6[3] = &unk_1E47B8680;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __19__SSLRUCache_count__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)allObjectsAndKeys
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[SSLRUCache accessQueue](self, "accessQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __31__SSLRUCache_allObjectsAndKeys__block_invoke;
  v9[3] = &unk_1E47B8768;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_sync(v4, v9);

  v6 = v10;
  v7 = v5;

  return v7;
}

void __31__SSLRUCache_allObjectsAndKeys__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "backingDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31__SSLRUCache_allObjectsAndKeys__block_invoke_2;
  v3[3] = &unk_1E47BE720;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);

}

void __31__SSLRUCache_allObjectsAndKeys__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "object");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v9);

  }
}

- (void)removeAllObjects
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SSLRUCache accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __30__SSLRUCache_removeAllObjects__block_invoke;
  v4[3] = &unk_1E47BA068;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __30__SSLRUCache_removeAllObjects__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "backingDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

  objc_msgSend(WeakRetained, "backingList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllNodes");

}

- (id)description
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  SSLRUCache *v14;
  id v15;
  objc_super v16;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v16.receiver = self;
  v16.super_class = (Class)SSLRUCache;
  -[SSLRUCache description](&v16, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(v3, "appendString:", CFSTR(" {"));
  -[SSLRUCache accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __25__SSLRUCache_description__block_invoke;
  v13 = &unk_1E47B8768;
  v14 = self;
  v6 = v3;
  v15 = v6;
  dispatch_sync(v5, &v10);

  objc_msgSend(v6, "appendString:", CFSTR("\n}"), v10, v11, v12, v13, v14);
  v7 = v15;
  v8 = v6;

  return v8;
}

void __25__SSLRUCache_description__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "backingList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v7), "object");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          v10 = *(void **)(a1 + 40);
          objc_msgSend(v8, "key");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "object");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "appendFormat:", CFSTR("\n%@: %@,"), v11, v12);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

}

- (void)_removeObjectForKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SSLRUCache backingDictionary](self, "backingDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SSLRUCache backingList](self, "backingList");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeNode:", v5);

    -[SSLRUCache backingDictionary](self, "backingDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v8);

  }
}

- (void)setAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessQueue, a3);
}

- (void)setBackingDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_backingDictionary, a3);
}

- (void)setBackingList:(id)a3
{
  objc_storeStrong((id *)&self->_backingList, a3);
}

- (void)setLogConfig:(id)a3
{
  objc_storeStrong((id *)&self->_logConfig, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logConfig, 0);
  objc_storeStrong((id *)&self->_backingList, 0);
  objc_storeStrong((id *)&self->_backingDictionary, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
