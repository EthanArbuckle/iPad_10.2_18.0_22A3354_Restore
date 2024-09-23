@implementation TSUConcurrentCache

- (TSUConcurrentCache)initWithName:(id)a3
{
  TSUConcurrentCache *v4;
  TSUReadWriteQueue *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSUConcurrentCache;
  v4 = -[TSUCache initWithName:](&v7, sel_initWithName_);
  if (v4)
  {
    v5 = [TSUReadWriteQueue alloc];
    v4->mReadWriteQueue = -[TSUReadWriteQueue initWithIdentifier:](v5, "initWithIdentifier:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("TSUConcurrentCache:%@"), a3));
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->mReadWriteQueue = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSUConcurrentCache;
  -[TSUCache dealloc](&v3, sel_dealloc);
}

- (void)unload
{
  TSUReadWriteQueue *mReadWriteQueue;
  _QWORD v3[5];

  mReadWriteQueue = self->mReadWriteQueue;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __28__TSUConcurrentCache_unload__block_invoke;
  v3[3] = &unk_24D61AB38;
  v3[4] = self;
  -[TSUReadWriteQueue performAsyncWrite:](mReadWriteQueue, "performAsyncWrite:", v3);
}

id __28__TSUConcurrentCache_unload__block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)TSUConcurrentCache;
  return objc_msgSendSuper2(&v2, sel_unload);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  TSUReadWriteQueue *mReadWriteQueue;
  _QWORD v5[7];

  mReadWriteQueue = self->mReadWriteQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__TSUConcurrentCache_setObject_forKey___block_invoke;
  v5[3] = &unk_24D61B228;
  v5[4] = a3;
  v5[5] = a4;
  v5[6] = self;
  -[TSUReadWriteQueue performAsyncWrite:](mReadWriteQueue, "performAsyncWrite:", v5);
}

id __39__TSUConcurrentCache_setObject_forKey___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  objc_super v4;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v4.receiver = *(id *)(a1 + 48);
  v4.super_class = (Class)TSUConcurrentCache;
  return objc_msgSendSuper2(&v4, sel_setObject_forKey_, v2, v1);
}

- (id)objectForKey:(id)a3
{
  TSUReadWriteQueue *mReadWriteQueue;
  void *v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  mReadWriteQueue = self->mReadWriteQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __35__TSUConcurrentCache_objectForKey___block_invoke;
  v6[3] = &unk_24D61B250;
  v6[5] = self;
  v6[6] = &v7;
  v6[4] = a3;
  -[TSUReadWriteQueue performSyncRead:](mReadWriteQueue, "performSyncRead:", v6);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __35__TSUConcurrentCache_objectForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id result;
  objc_super v4;

  v2 = *(_QWORD *)(a1 + 32);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)TSUConcurrentCache;
  result = objc_msgSendSuper2(&v4, sel_p_objectForKey_, v2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  return result;
}

- (void)removeObjectForKey:(id)a3 andWait:(BOOL)a4
{
  _BOOL4 v4;
  TSUReadWriteQueue *mReadWriteQueue;
  _QWORD v7[6];

  v4 = a4;
  mReadWriteQueue = self->mReadWriteQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__TSUConcurrentCache_removeObjectForKey_andWait___block_invoke;
  v7[3] = &unk_24D61AE28;
  v7[4] = a3;
  v7[5] = self;
  -[TSUReadWriteQueue performAsyncWrite:](mReadWriteQueue, "performAsyncWrite:", v7);
  if (v4)
    -[TSUReadWriteQueue waitOnInFlightWriters](self->mReadWriteQueue, "waitOnInFlightWriters");
}

id __49__TSUConcurrentCache_removeObjectForKey_andWait___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)TSUConcurrentCache;
  return objc_msgSendSuper2(&v3, sel_removeObjectForKey_, v1);
}

- (void)removeObjectForKey:(id)a3
{
  -[TSUConcurrentCache removeObjectForKey:andWait:](self, "removeObjectForKey:andWait:", a3, 0);
}

- (void)removeAllObjects
{
  TSUReadWriteQueue *mReadWriteQueue;
  _QWORD v3[5];

  mReadWriteQueue = self->mReadWriteQueue;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __38__TSUConcurrentCache_removeAllObjects__block_invoke;
  v3[3] = &unk_24D61AB38;
  v3[4] = self;
  -[TSUReadWriteQueue performAsyncWrite:](mReadWriteQueue, "performAsyncWrite:", v3);
}

id __38__TSUConcurrentCache_removeAllObjects__block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)TSUConcurrentCache;
  return objc_msgSendSuper2(&v2, sel_removeAllObjects);
}

- (unint64_t)count
{
  TSUReadWriteQueue *mReadWriteQueue;
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
  mReadWriteQueue = self->mReadWriteQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __27__TSUConcurrentCache_count__block_invoke;
  v5[3] = &unk_24D61B278;
  v5[4] = self;
  v5[5] = &v6;
  -[TSUReadWriteQueue performSyncRead:](mReadWriteQueue, "performSyncRead:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __27__TSUConcurrentCache_count__block_invoke(uint64_t a1)
{
  id result;
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)TSUConcurrentCache;
  result = objc_msgSendSuper2(&v3, sel_count);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)hasFlushableContent
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSUConcurrentCache;
  return -[TSUCache hasFlushableContent](&v3, sel_hasFlushableContent);
}

- (void)addEntriesFromDictionary:(id)a3
{
  id v5;
  TSUReadWriteQueue *mReadWriteQueue;
  _QWORD v7[6];

  v5 = a3;
  mReadWriteQueue = self->mReadWriteQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__TSUConcurrentCache_addEntriesFromDictionary___block_invoke;
  v7[3] = &unk_24D61AE28;
  v7[4] = a3;
  v7[5] = self;
  -[TSUReadWriteQueue performAsyncWrite:](mReadWriteQueue, "performAsyncWrite:", v7);
}

void __47__TSUConcurrentCache_addEntriesFromDictionary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  objc_super v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)TSUConcurrentCache;
  objc_msgSendSuper2(&v3, sel_p_addEntriesFromDictionary_, v2);

}

- (id)objectsForKeys:(id)a3 notFoundMarker:(id)a4
{
  id v7;
  TSUReadWriteQueue *mReadWriteQueue;
  void *v9;
  _QWORD v11[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;

  v7 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  mReadWriteQueue = self->mReadWriteQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__TSUConcurrentCache_objectsForKeys_notFoundMarker___block_invoke;
  v11[3] = &unk_24D61B2A0;
  v11[4] = a3;
  v11[5] = a4;
  v11[6] = self;
  v11[7] = &v12;
  -[TSUReadWriteQueue performSyncRead:](mReadWriteQueue, "performSyncRead:", v11);

  v9 = (void *)v13[5];
  _Block_object_dispose(&v12, 8);
  return v9;
}

id __52__TSUConcurrentCache_objectsForKeys_notFoundMarker___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id result;
  objc_super v5;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 32);
  v5.receiver = *(id *)(a1 + 48);
  v5.super_class = (Class)TSUConcurrentCache;
  result = objc_msgSendSuper2(&v5, sel_p_objectsForKeys_notFoundMarker_, v3, v2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = result;
  return result;
}

- (TSUReadWriteQueue)readWriteQueue
{
  return self->mReadWriteQueue;
}

@end
