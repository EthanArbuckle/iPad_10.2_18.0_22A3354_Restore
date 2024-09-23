@implementation WLKCache

- (WLKCache)init
{
  WLKCache *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  uint64_t v5;
  NSMutableArray *stack;
  uint64_t v7;
  NSMutableDictionary *dictionary;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WLKCache;
  v2 = -[WLKCache init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.WatchListKit.WLKCache", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v2->_countLimit = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    stack = v2->_stack;
    v2->_stack = (NSMutableArray *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    dictionary = v2->_dictionary;
    v2->_dictionary = (NSMutableDictionary *)v7;

  }
  return v2;
}

- (void)setCountLimit:(unint64_t)a3
{
  NSObject *accessQueue;
  _QWORD v4[6];

  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __26__WLKCache_setCountLimit___block_invoke;
  v4[3] = &unk_1E68A84A8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(accessQueue, v4);
}

void __26__WLKCache_setCountLimit___block_invoke(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  v3 = *(_QWORD *)(a1 + 40);
  v4 = v2 - v3;
  if (v2 > v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "subarrayWithRange:", 0, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectsForKeys:", v5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectsInRange:", 0, v4);

    v3 = *(_QWORD *)(a1 + 40);
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = v3;
}

- (unint64_t)countLimit
{
  NSObject *accessQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __22__WLKCache_countLimit__block_invoke;
  v5[3] = &unk_1E68A84D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __22__WLKCache_countLimit__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

- (id)objectForKey:(id)a3
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
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__WLKCache_objectForKey___block_invoke;
  block[3] = &unk_1E68A84F8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(accessQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __25__WLKCache_objectForKey___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *accessQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (!v6)
    -[WLKCache setObject:forKey:].cold.1();
  v8 = v7;
  if (!v7)
    -[WLKCache setObject:forKey:].cold.2();
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__WLKCache_setObject_forKey___block_invoke;
  block[3] = &unk_1E68A8520;
  block[4] = self;
  v13 = v7;
  v14 = v6;
  v10 = v6;
  v11 = v8;
  dispatch_sync(accessQueue, block);

}

void __29__WLKCache_setObject_forKey___block_invoke(uint64_t a1)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(a1 + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 48));
  if (!v6)
  {
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
    v4 = *(_QWORD *)(a1 + 32);
    if (v3 != *(_QWORD *)(v4 + 32))
    {
LABEL_8:
      objc_msgSend(*(id *)(v4 + 16), "addObject:", *(_QWORD *)(a1 + 40));
      goto LABEL_9;
    }
    objc_msgSend(*(id *)(v4 + 16), "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_onQueueRemoveObjectForKey:", v5);

LABEL_7:
    v4 = *(_QWORD *)(a1 + 32);
    goto LABEL_8;
  }
  if ((v2 & 1) == 0)
  {
    if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count") < 2)
    {
LABEL_9:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
      goto LABEL_10;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
    goto LABEL_7;
  }
LABEL_10:

}

- (void)removeObjectForKey:(id)a3
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
  block[2] = __31__WLKCache_removeObjectForKey___block_invoke;
  block[3] = &unk_1E68A79C0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(accessQueue, block);

}

uint64_t __31__WLKCache_removeObjectForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueueRemoveObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void)removeAllObjects
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__WLKCache_removeAllObjects__block_invoke;
  block[3] = &unk_1E68A80F8;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

uint64_t __28__WLKCache_removeAllObjects__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
}

- (void)_onQueueRemoveObjectForKey:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableArray removeObject:](self->_stack, "removeObject:", v5);
    -[NSMutableDictionary removeObjectForKey:](self->_dictionary, "removeObjectForKey:", v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)setObject:forKey:.cold.1()
{
  __assert_rtn("-[WLKCache setObject:forKey:]", "WLKCache.m", 70, "obj != nil");
}

- (void)setObject:forKey:.cold.2()
{
  __assert_rtn("-[WLKCache setObject:forKey:]", "WLKCache.m", 71, "key != nil");
}

@end
