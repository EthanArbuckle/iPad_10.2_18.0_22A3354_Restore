@implementation SOPublisherCache

- (SOPublisherCache)init
{
  SOPublisherCache *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *cache;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SOPublisherCache;
  v2 = -[SOPublisherCache init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    cache = v2->_cache;
    v2->_cache = v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("SOPublisherCache", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    v8 = (void *)objc_opt_new();
    -[SOPublisherCache setPublisher:forSnapshotType:](v2, "setPublisher:forSnapshotType:", v8, objc_opt_class());

  }
  return v2;
}

- (id)publisherForSnapshotType:(Class)a3
{
  NSObject *queue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__SOPublisherCache_publisherForSnapshotType___block_invoke;
  block[3] = &unk_24CE76190;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(queue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)setPublisher:(id)a3 forSnapshotType:(Class)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  Class v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__SOPublisherCache_setPublisher_forSnapshotType___block_invoke;
  block[3] = &unk_24CE761B8;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_sync(queue, block);

}

- (void)removePublisherForSnapshotType:(Class)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__SOPublisherCache_removePublisherForSnapshotType___block_invoke;
  v4[3] = &unk_24CE761E0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

uint64_t __51__SOPublisherCache_removePublisherForSnapshotType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

uint64_t __49__SOPublisherCache_setPublisher_forSnapshotType___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKey:", a1[5], a1[6]);
}

void __45__SOPublisherCache_publisherForSnapshotType___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", a1[6]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (SOPublisherCache)sharedInstance
{
  if (sharedInstance_token != -1)
    dispatch_once(&sharedInstance_token, &__block_literal_global_1005);
  return (SOPublisherCache *)(id)sharedInstance_sharedInstance;
}

void __34__SOPublisherCache_sharedInstance__block_invoke()
{
  SOPublisherCache *v0;
  void *v1;

  v0 = objc_alloc_init(SOPublisherCache);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

@end
