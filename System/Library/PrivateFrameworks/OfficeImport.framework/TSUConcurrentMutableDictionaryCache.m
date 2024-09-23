@implementation TSUConcurrentMutableDictionaryCache

- (TSUConcurrentMutableDictionaryCache)init
{
  return -[TSUConcurrentMutableDictionaryCache initWithName:](self, "initWithName:", CFSTR("Unnamed TSUConcurrentMutableDictionaryCache"));
}

- (TSUConcurrentMutableDictionaryCache)initWithName:(id)a3
{
  id v4;
  TSUConcurrentMutableDictionaryCache *v5;
  uint64_t v6;
  NSString *name;
  OITSUReadWriteQueue *v8;
  void *v9;
  uint64_t v10;
  OITSUReadWriteQueue *readWriteQueue;
  NSMutableDictionary *v12;
  NSMutableDictionary *cache;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TSUConcurrentMutableDictionaryCache;
  v5 = -[TSUConcurrentMutableDictionaryCache init](&v20, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = [OITSUReadWriteQueue alloc];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("TSUConcurrentMutableDictionaryCache:%@"), v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[OITSUReadWriteQueue initWithIdentifier:](v8, "initWithIdentifier:", v9);
    readWriteQueue = v5->_readWriteQueue;
    v5->_readWriteQueue = (OITSUReadWriteQueue *)v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    cache = v5->_cache;
    v5->_cache = v12;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x24BDF7538];
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v5, sel_p_didReceiveMemoryWarning_, v15, v16);

    v17 = *MEMORY[0x24BDF7528];
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v5, sel_p_didEnterBackground_, v17, v18);

  }
  return v5;
}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TSUConcurrentMutableDictionaryCache readWriteQueue](self, "readWriteQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__TSUConcurrentMutableDictionaryCache_removeObjectForKey___block_invoke;
  v7[3] = &unk_24F39B500;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performAsyncWrite:", v7);

}

uint64_t __58__TSUConcurrentMutableDictionaryCache_removeObjectForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[TSUConcurrentMutableDictionaryCache readWriteQueue](self, "readWriteQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __56__TSUConcurrentMutableDictionaryCache_setObject_forKey___block_invoke;
  v11[3] = &unk_24F39CA08;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performAsyncWrite:", v11);

}

uint64_t __56__TSUConcurrentMutableDictionaryCache_setObject_forKey___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKey:", a1[5], a1[6]);
}

- (void)addEntriesFromDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TSUConcurrentMutableDictionaryCache readWriteQueue](self, "readWriteQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__TSUConcurrentMutableDictionaryCache_addEntriesFromDictionary___block_invoke;
  v7[3] = &unk_24F39B500;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performAsyncWrite:", v7);

}

uint64_t __64__TSUConcurrentMutableDictionaryCache_addEntriesFromDictionary___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addEntriesFromDictionary:", *(_QWORD *)(a1 + 40));
}

- (void)removeAllObjects
{
  void *v3;
  _QWORD v4[5];

  -[TSUConcurrentMutableDictionaryCache readWriteQueue](self, "readWriteQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__TSUConcurrentMutableDictionaryCache_removeAllObjects__block_invoke;
  v4[3] = &unk_24F39B528;
  v4[4] = self;
  objc_msgSend(v3, "performAsyncWrite:", v4);

}

uint64_t __55__TSUConcurrentMutableDictionaryCache_removeAllObjects__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeAllObjects");
}

- (void)removeObjectsForKeys:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TSUConcurrentMutableDictionaryCache readWriteQueue](self, "readWriteQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__TSUConcurrentMutableDictionaryCache_removeObjectsForKeys___block_invoke;
  v7[3] = &unk_24F39B500;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performAsyncWrite:", v7);

}

uint64_t __60__TSUConcurrentMutableDictionaryCache_removeObjectsForKeys___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectsForKeys:", *(_QWORD *)(a1 + 40));
}

- (void)removeObjectForKey:(id)a3 andWait:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  TSUConcurrentMutableDictionaryCache *v14;
  id v15;

  v4 = a4;
  v6 = a3;
  -[TSUConcurrentMutableDictionaryCache readWriteQueue](self, "readWriteQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __66__TSUConcurrentMutableDictionaryCache_removeObjectForKey_andWait___block_invoke;
  v13 = &unk_24F39B500;
  v14 = self;
  v15 = v6;
  v8 = v6;
  objc_msgSend(v7, "performAsyncWrite:", &v10);

  if (v4)
  {
    -[TSUConcurrentMutableDictionaryCache readWriteQueue](self, "readWriteQueue", v10, v11, v12, v13, v14, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "waitOnInFlightWriters");

  }
}

uint64_t __66__TSUConcurrentMutableDictionaryCache_removeObjectForKey_andWait___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (id)description
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__21;
  v11 = __Block_byref_object_dispose__21;
  v12 = 0;
  -[TSUConcurrentMutableDictionaryCache readWriteQueue](self, "readWriteQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__TSUConcurrentMutableDictionaryCache_description__block_invoke;
  v6[3] = &unk_24F39B4D8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performSyncRead:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __50__TSUConcurrentMutableDictionaryCache_description__block_invoke(uint64_t a1)
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

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
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
  v15 = __Block_byref_object_copy__21;
  v16 = __Block_byref_object_dispose__21;
  v17 = 0;
  -[TSUConcurrentMutableDictionaryCache readWriteQueue](self, "readWriteQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __52__TSUConcurrentMutableDictionaryCache_objectForKey___block_invoke;
  v9[3] = &unk_24F39B4B0;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "performSyncRead:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __52__TSUConcurrentMutableDictionaryCache_objectForKey___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)objectsForKeys:(id)a3 notFoundMarker:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__21;
  v21 = __Block_byref_object_dispose__21;
  v22 = 0;
  -[TSUConcurrentMutableDictionaryCache readWriteQueue](self, "readWriteQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __69__TSUConcurrentMutableDictionaryCache_objectsForKeys_notFoundMarker___block_invoke;
  v13[3] = &unk_24F39CA30;
  v16 = &v17;
  v13[4] = self;
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  objc_msgSend(v8, "performSyncRead:", v13);

  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __69__TSUConcurrentMutableDictionaryCache_objectsForKeys_notFoundMarker___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 8), "objectsForKeys:notFoundMarker:", a1[5], a1[6]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TSUConcurrentMutableDictionaryCache readWriteQueue](self, "readWriteQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__TSUConcurrentMutableDictionaryCache_enumerateKeysAndObjectsUsingBlock___block_invoke;
  v7[3] = &unk_24F39BDD0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performSyncRead:", v7);

}

uint64_t __73__TSUConcurrentMutableDictionaryCache_enumerateKeysAndObjectsUsingBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "enumerateKeysAndObjectsUsingBlock:", *(_QWORD *)(a1 + 40));
}

- (void)performSyncWriteWithUnderlyingDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TSUConcurrentMutableDictionaryCache readWriteQueue](self, "readWriteQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __80__TSUConcurrentMutableDictionaryCache_performSyncWriteWithUnderlyingDictionary___block_invoke;
  v7[3] = &unk_24F39BAB0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performSyncWrite:", v7);

}

uint64_t __80__TSUConcurrentMutableDictionaryCache_performSyncWriteWithUnderlyingDictionary___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

- (OITSUReadWriteQueue)readWriteQueue
{
  return self->_readWriteQueue;
}

- (unint64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_readWriteQueue, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
