@implementation TSDTileStorage

- (TSDTileStorage)init
{
  TSDTileStorage *v2;
  NSCache *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDTileStorage;
  v2 = -[TSDTileStorage init](&v5, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    v2->mCache = v3;
    -[NSCache setDelegate:](v3, "setDelegate:", v2);
    v2->mReverseCacheKeys = (TSUPointerKeyDictionary *)objc_alloc_init(MEMORY[0x24BEB3CE0]);
    v2->mReverseCacheKeysLock = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
    v2->mCacheKeysByBucket = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v2->mCacheKeysQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.iwork.TSDTileStorage.cache-keys", 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->mCacheKeysQueue);
  dispatch_release((dispatch_object_t)self->mReverseCacheKeysLock);

  v3.receiver = self;
  v3.super_class = (Class)TSDTileStorage;
  -[TSDTileStorage dealloc](&v3, sel_dealloc);
}

- (void)storeContents:(id)a3 inRect:(CGRect)a4 contentsScale:(double)a5 forTileAtLocation:(id)a6 inBucket:(id)a7
{
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *mCacheKeysQueue;
  _QWORD block[9];

  v10 = -[TSDTileStorage p_cacheKeyForImageInRect:contentsScale:tileLocation:](self, "p_cacheKeyForImageInRect:contentsScale:tileLocation:", a6.var0, a6.var1, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5);
  if (!v10)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTileStorage storeContents:inRect:contentsScale:forTileAtLocation:inBucket:]");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTileStorage.m"), 61, CFSTR("invalid nil value for '%s'"), "imageKey");
  }
  v13 = objc_msgSend(a7, "stringByAppendingPathComponent:", v10);
  mCacheKeysQueue = self->mCacheKeysQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__TSDTileStorage_storeContents_inRect_contentsScale_forTileAtLocation_inBucket___block_invoke;
  block[3] = &unk_24D82CA80;
  block[4] = self;
  block[5] = a3;
  block[6] = v13;
  block[7] = a7;
  block[8] = v10;
  dispatch_async(mCacheKeysQueue, block);
}

uint64_t __80__TSDTileStorage_storeContents_inRect_contentsScale_forTileAtLocation_inBucket___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1[4] + 24), 0xFFFFFFFFFFFFFFFFLL);
  v2 = objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", a1[5]);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1[4] + 24));
  if (v2)
    objc_msgSend(*(id *)(a1[4] + 8), "removeObjectForKey:", v2);
  objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKey:", a1[5], a1[6]);
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1[4] + 24), 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKey:", a1[6], a1[5]);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1[4] + 24));
  v3 = (void *)objc_msgSend(*(id *)(a1[4] + 40), "objectForKey:", a1[7]);
  if (!v3)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    objc_msgSend(*(id *)(a1[4] + 40), "setObject:forKey:", v3, a1[7]);
  }
  return objc_msgSend(v3, "addObject:", a1[8]);
}

- (id)contentsInRect:(CGRect)a3 contentsScale:(double)a4 forTileAtLocation:(id)a5 inBucket:(id)a6
{
  id v8;
  void *v9;
  uint64_t v10;

  v8 = -[TSDTileStorage p_cacheKeyForImageInRect:contentsScale:tileLocation:](self, "p_cacheKeyForImageInRect:contentsScale:tileLocation:", a5.var0, a5.var1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
  if (!v8)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTileStorage contentsInRect:contentsScale:forTileAtLocation:inBucket:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTileStorage.m"), 97, CFSTR("invalid nil value for '%s'"), "imageFileName");
  }
  return -[NSCache objectForKey:](self->mCache, "objectForKey:", objc_msgSend(a6, "stringByAppendingPathComponent:", v8));
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->mReverseCacheKeysLock, 0xFFFFFFFFFFFFFFFFLL);
  -[TSUPointerKeyDictionary removeObjectForKey:](self->mReverseCacheKeys, "removeObjectForKey:", a4);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->mReverseCacheKeysLock);
}

- (void)removeImagesInBucket:(id)a3
{
  NSObject *mCacheKeysQueue;
  _QWORD v4[6];

  mCacheKeysQueue = self->mCacheKeysQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __39__TSDTileStorage_removeImagesInBucket___block_invoke;
  v4[3] = &unk_24D82A5C8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(mCacheKeysQueue, v4);
}

uint64_t __39__TSDTileStorage_removeImagesInBucket___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", *(_QWORD *)(a1 + 40));
  if (v2)
  {
    v3 = v2;
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", objc_msgSend(*(id *)(a1 + 40), "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++)));
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void)removeAllContents
{
  NSObject *mCacheKeysQueue;
  _QWORD block[5];

  mCacheKeysQueue = self->mCacheKeysQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__TSDTileStorage_removeAllContents__block_invoke;
  block[3] = &unk_24D829278;
  block[4] = self;
  dispatch_sync(mCacheKeysQueue, block);
}

uint64_t __35__TSDTileStorage_removeAllContents__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeAllObjects");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects");
}

- (id)p_cacheKeyForImageInRect:(CGRect)a3 contentsScale:(double)a4 tileLocation:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu_%lu"), a5.var0, a5.var1);
  v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld_%ld_%ld_%ld"), (uint64_t)x, (uint64_t)y, (uint64_t)width, (uint64_t)height);
  v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), (uint64_t)a4);
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@-%@"), v10, v11, v12);
}

@end
