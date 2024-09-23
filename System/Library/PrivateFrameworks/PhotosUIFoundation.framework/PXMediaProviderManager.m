@implementation PXMediaProviderManager

- (PXMediaProviderManager)init
{
  PXMediaProviderManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *isolationQueue;
  uint64_t v6;
  NSMapTable *imageProviderByClass;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXMediaProviderManager;
  v2 = -[PXMediaProviderManager init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.photos.PXMediaProviderManager", v3);
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v6 = objc_claimAutoreleasedReturnValue();
    imageProviderByClass = v2->_imageProviderByClass;
    v2->_imageProviderByClass = (NSMapTable *)v6;

  }
  return v2;
}

- (id)imageProviderForAsset:(id)a3
{
  id v4;
  NSObject *isolationQueue;
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
  v15 = __Block_byref_object_copy__2712;
  v16 = __Block_byref_object_dispose__2713;
  v17 = 0;
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__PXMediaProviderManager_imageProviderForAsset___block_invoke;
  block[3] = &unk_2514CF8C8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(isolationQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageProviderByClass, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

void __48__PXMediaProviderManager_imageProviderForAsset___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", objc_opt_class());
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v5 = objc_alloc_init((Class)objc_msgSend(*(id *)(a1 + 40), "defaultImageProviderClass"));
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), objc_opt_class());
  }
}

+ (PXMediaProviderManager)defaultManager
{
  if (defaultManager_onceToken != -1)
    dispatch_once(&defaultManager_onceToken, &__block_literal_global_2721);
  return (PXMediaProviderManager *)(id)defaultManager_defaultManager;
}

void __40__PXMediaProviderManager_defaultManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)defaultManager_defaultManager;
  defaultManager_defaultManager = v0;

}

@end
