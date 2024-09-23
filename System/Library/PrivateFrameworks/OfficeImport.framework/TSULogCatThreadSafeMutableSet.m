@implementation TSULogCatThreadSafeMutableSet

- (TSULogCatThreadSafeMutableSet)initWithArray:(id)a3
{
  id v4;
  TSULogCatThreadSafeMutableSet *v5;
  uint64_t v6;
  NSMutableSet *objects;
  dispatch_queue_t v8;
  OS_dispatch_queue *logCatQueue;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TSULogCatThreadSafeMutableSet;
  v5 = -[TSULogCatThreadSafeMutableSet init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithArray:", v4);
    objects = v5->_objects;
    v5->_objects = (NSMutableSet *)v6;

    v8 = dispatch_queue_create("TSULogCatQueue", 0);
    logCatQueue = v5->_logCatQueue;
    v5->_logCatQueue = (OS_dispatch_queue *)v8;

  }
  return v5;
}

- (TSULogCatThreadSafeMutableSet)init
{
  void *v3;
  TSULogCatThreadSafeMutableSet *v4;

  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TSULogCatThreadSafeMutableSet initWithArray:](self, "initWithArray:", v3);

  return v4;
}

- (BOOL)containsObject:(id)a3
{
  id v4;
  NSObject *logCatQueue;
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
  logCatQueue = self->_logCatQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__TSULogCatThreadSafeMutableSet_containsObject___block_invoke;
  block[3] = &unk_24F39B4B0;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(logCatQueue, block);
  LOBYTE(logCatQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)logCatQueue;
}

uint64_t __48__TSULogCatThreadSafeMutableSet_containsObject___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 8), "containsObject:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (unint64_t)count
{
  NSObject *logCatQueue;
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
  logCatQueue = self->_logCatQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__TSULogCatThreadSafeMutableSet_count__block_invoke;
  v5[3] = &unk_24F39B4D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(logCatQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__TSULogCatThreadSafeMutableSet_count__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)allObjects
{
  NSObject *logCatQueue;
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
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  logCatQueue = self->_logCatQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__TSULogCatThreadSafeMutableSet_allObjects__block_invoke;
  v5[3] = &unk_24F39B4D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(logCatQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __43__TSULogCatThreadSafeMutableSet_allObjects__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)immutableSet
{
  NSObject *logCatQueue;
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
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  logCatQueue = self->_logCatQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__TSULogCatThreadSafeMutableSet_immutableSet__block_invoke;
  v5[3] = &unk_24F39B4D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(logCatQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __45__TSULogCatThreadSafeMutableSet_immutableSet__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)addObject:(id)a3
{
  id v4;
  NSObject *logCatQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  logCatQueue = self->_logCatQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__TSULogCatThreadSafeMutableSet_addObject___block_invoke;
  v7[3] = &unk_24F39B500;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(logCatQueue, v7);

}

uint64_t __43__TSULogCatThreadSafeMutableSet_addObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeObject:(id)a3
{
  id v4;
  NSObject *logCatQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  logCatQueue = self->_logCatQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__TSULogCatThreadSafeMutableSet_removeObject___block_invoke;
  v7[3] = &unk_24F39B500;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(logCatQueue, v7);

}

uint64_t __46__TSULogCatThreadSafeMutableSet_removeObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (id)description
{
  NSObject *logCatQueue;
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
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  logCatQueue = self->_logCatQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__TSULogCatThreadSafeMutableSet_description__block_invoke;
  v5[3] = &unk_24F39B4D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(logCatQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __44__TSULogCatThreadSafeMutableSet_description__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "description");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logCatQueue, 0);
  objc_storeStrong((id *)&self->_objects, 0);
}

@end
