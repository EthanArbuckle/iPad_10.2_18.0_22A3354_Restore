@implementation PXGMetalTextureCache

- (PXGMetalTextureCache)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGMetalTextureCache.m"), 32, CFSTR("%s is not available as initializer"), "-[PXGMetalTextureCache init]");

  abort();
}

- (PXGMetalTextureCache)initWithContext:(id)a3
{
  id v5;
  PXGMetalTextureCache *v6;
  PXGMetalTextureCache *v7;
  uint64_t v8;
  NSMutableArray *entries;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXGMetalTextureCache;
  v6 = -[PXGMetalTextureCache init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metalRenderContext, a3);
    v7->_capacity = 15;
    v7->_ageLimit = 0.05;
    v7->_sizeLimit = 262144000;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v7->_capacity);
    entries = v7->_entries;
    v7->_entries = (NSMutableArray *)v8;

    v10 = dispatch_queue_create("PXGMetalTextureCache", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

  }
  return v7;
}

- (id)description
{
  NSObject *queue;
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
  v9 = __Block_byref_object_copy__985;
  v10 = __Block_byref_object_dispose__986;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __35__PXGMetalTextureCache_description__block_invoke;
  v5[3] = &unk_251A6E628;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_description
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t capacity;
  double ageLimit;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_entries, "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = self->_entries;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v8), "description");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  v10 = (void *)MEMORY[0x24BDD17C8];
  v11 = objc_opt_class();
  v12 = -[NSMutableArray count](self->_entries, "count");
  capacity = self->_capacity;
  ageLimit = self->_ageLimit;
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n\t"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@:%p count: %lu/%lu limit: %0.3f s textures: \n\t%@\npeak: %lu textures, %0.1f MB>"), v11, self, v12, capacity, *(_QWORD *)&ageLimit, v15, self->_peakCount, (double)self->_peakMemory * 0.0009765625 * 0.0009765625, (_QWORD)v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (unint64_t)count
{
  NSObject *queue;
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
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __29__PXGMetalTextureCache_count__block_invoke;
  v5[3] = &unk_251A6E628;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)peakTextureCount
{
  NSObject *queue;
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
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__PXGMetalTextureCache_peakTextureCount__block_invoke;
  v5[3] = &unk_251A6E628;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)peakMemorySize
{
  NSObject *queue;
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
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__PXGMetalTextureCache_peakMemorySize__block_invoke;
  v5[3] = &unk_251A6E628;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)capacity
{
  NSObject *queue;
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
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __32__PXGMetalTextureCache_capacity__block_invoke;
  v5[3] = &unk_251A6E628;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setCapacity:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __36__PXGMetalTextureCache_setCapacity___block_invoke;
  v4[3] = &unk_251A6E650;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

- (double)ageLimit
{
  NSObject *queue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __32__PXGMetalTextureCache_ageLimit__block_invoke;
  v5[3] = &unk_251A6E628;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (double)(unint64_t)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setAgeLimit:(double)a3
{
  NSObject *queue;
  void *v7;
  _QWORD block[6];

  if (a3 < 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGMetalTextureCache.m"), 114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ageLimit >= 0.0"));

  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__PXGMetalTextureCache_setAgeLimit___block_invoke;
  block[3] = &unk_251A6E650;
  block[4] = self;
  *(double *)&block[5] = a3;
  dispatch_sync(queue, block);
}

- (unint64_t)sizeLimit
{
  NSObject *queue;
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
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __33__PXGMetalTextureCache_sizeLimit__block_invoke;
  v5[3] = &unk_251A6E628;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setSizeLimit:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37__PXGMetalTextureCache_setSizeLimit___block_invoke;
  v4[3] = &unk_251A6E650;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

- (id)textureWithSize:(CGSize)a3 pixelFormat:(unint64_t)a4
{
  double height;
  double width;
  NSObject *queue;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[10];
  _QWORD v18[4];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  height = a3.height;
  width = a3.width;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__985;
  v23 = __Block_byref_object_dispose__986;
  v24 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  queue = self->_queue;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __52__PXGMetalTextureCache_textureWithSize_pixelFormat___block_invoke;
  v17[3] = &unk_251A6E698;
  v17[8] = (unint64_t)a3.height;
  v17[9] = a4;
  v17[4] = self;
  v17[5] = &v19;
  v17[6] = v18;
  v17[7] = (unint64_t)a3.width;
  dispatch_sync(queue, v17);
  v9 = (void *)v20[5];
  if (v9)
  {
    objc_msgSend((id)v20[5], "allocatedSize");
    v10 = v9;
  }
  else
  {
    -[PXGMetalTextureCache metalRenderContext](self, "metalRenderContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _createMetal2DTextureWithPixelFormat(a4, v11, 1, width, height);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v20[5];
    v20[5] = v12;

    v14 = (void *)v20[5];
    objc_msgSend(v14, "allocatedSize");
    v10 = v14;
  }
  kdebug_trace();

  v15 = (id)v20[5];
  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v19, 8);

  return v15;
}

- (void)recycleTexture:(id)a3
{
  id v4;
  PXGMetalTextureCacheEntry *v5;
  NSObject *queue;
  PXGMetalTextureCacheEntry *v7;
  _QWORD block[5];
  PXGMetalTextureCacheEntry *v9;
  _QWORD *v10;
  _QWORD v11[4];

  v4 = a3;
  objc_msgSend(v4, "width");
  objc_msgSend(v4, "height");
  objc_msgSend(v4, "allocatedSize");
  kdebug_trace();
  v5 = -[PXGMetalTextureCacheEntry initWithTexture:]([PXGMetalTextureCacheEntry alloc], "initWithTexture:", v4);
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v11[3] = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__PXGMetalTextureCache_recycleTexture___block_invoke;
  block[3] = &unk_251A6E6C0;
  block[4] = self;
  v9 = v5;
  v10 = v11;
  v7 = v5;
  dispatch_sync(queue, block);

  _Block_object_dispose(v11, 8);
}

- (void)_enforceLimits
{
  NSMutableArray *i;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double ageLimit;
  unint64_t v18;
  unint64_t peakMemory;
  unint64_t v21;
  unint64_t peakCount;
  dispatch_time_t v23;
  NSObject *queue;
  _QWORD v25[4];
  id v26;
  id location;

  for (i = self->_entries; -[NSMutableArray count](i, "count") > self->_capacity; i = self->_entries)
    -[PXGMetalTextureCache _purgeOldestTexture](self, "_purgeOldestTexture");
  v4 = -[NSMutableArray count](self->_entries, "count");
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    while (1)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_entries, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "texture");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "allocatedSize");

      v11 = v10 + v6;
      if (v10 + v6 > self->_sizeLimit)
        break;
      ++v7;
      v6 += v10;
      if (v5 == v7)
        goto LABEL_13;
    }
    while (-[NSMutableArray count](self->_entries, "count") > v7)
      -[PXGMetalTextureCache _purgeOldestTexture](self, "_purgeOldestTexture");
    v11 = v6;
  }
  else
  {
    v11 = 0;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  while (-[NSMutableArray count](self->_entries, "count"))
  {
    -[NSMutableArray lastObject](self->_entries, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "time");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceDate:", v14);
    v16 = v15;
    ageLimit = self->_ageLimit;

    if (v16 <= ageLimit)
      break;
    -[PXGMetalTextureCache _purgeOldestTexture](self, "_purgeOldestTexture");
  }
  v18 = -[NSMutableArray count](self->_entries, "count");
  peakMemory = self->_peakMemory;
  if (v18 > self->_peakCount || v11 > peakMemory)
  {
    if (v11 > peakMemory)
      peakMemory = v11;
    self->_peakMemory = peakMemory;
    v21 = -[NSMutableArray count](self->_entries, "count");
    peakCount = self->_peakCount;
    if (v21 > peakCount)
      peakCount = v21;
    self->_peakCount = peakCount;
  }
  -[NSMutableArray count](self->_entries, "count");
  kdebug_trace();
  if (-[NSMutableArray count](self->_entries, "count"))
  {
    objc_initWeak(&location, self);
    v23 = dispatch_time(0, (uint64_t)(self->_ageLimit * 1000000000.0));
    queue = self->_queue;
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __38__PXGMetalTextureCache__enforceLimits__block_invoke;
    v25[3] = &unk_251A6E6E8;
    objc_copyWeak(&v26, &location);
    dispatch_after(v23, queue, v25);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

}

- (void)_purgeOldestTexture
{
  void *v3;
  id v4;

  -[NSMutableArray lastObject](self->_entries, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "texture");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "width");
  objc_msgSend(v4, "height");
  objc_msgSend(v4, "allocatedSize");
  kdebug_trace();
  -[NSMutableArray removeLastObject](self->_entries, "removeLastObject");

}

- (PXGMetalRenderContext)metalRenderContext
{
  return self->_metalRenderContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalRenderContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_entries, 0);
}

void __38__PXGMetalTextureCache__enforceLimits__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_enforceLimits");

}

uint64_t __39__PXGMetalTextureCache_recycleTexture___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "insertObject:atIndex:", *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(*(id *)(a1 + 32), "_enforceLimits");
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __52__PXGMetalTextureCache_textureWithSize_pixelFormat___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t result;
  _QWORD v10[4];
  __int128 v11;
  uint64_t v12;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __52__PXGMetalTextureCache_textureWithSize_pixelFormat___block_invoke_2;
  v10[3] = &__block_descriptor_56_e42_B32__0__PXGMetalTextureCacheEntry_8Q16_B24l;
  v11 = *(_OWORD *)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 72);
  v3 = objc_msgSend(v2, "indexOfObjectPassingTest:", v10);
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = v3;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectAtIndexedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "texture");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectAtIndex:", v4);
  }
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

BOOL __52__PXGMetalTextureCache_textureWithSize_pixelFormat___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "texture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "width") == a1[4]
    && objc_msgSend(v3, "height") == a1[5]
    && objc_msgSend(v3, "pixelFormat") == a1[6];

  return v4;
}

uint64_t __37__PXGMetalTextureCache_setSizeLimit___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = *(_QWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_enforceLimits");
}

uint64_t __33__PXGMetalTextureCache_sizeLimit__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

uint64_t __36__PXGMetalTextureCache_setAgeLimit___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = *(_QWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_enforceLimits");
}

double __32__PXGMetalTextureCache_ageLimit__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 24);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (unint64_t)result;
  return result;
}

uint64_t __36__PXGMetalTextureCache_setCapacity___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = *(_QWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_enforceLimits");
}

uint64_t __32__PXGMetalTextureCache_capacity__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

uint64_t __38__PXGMetalTextureCache_peakMemorySize__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 48);
  return result;
}

uint64_t __40__PXGMetalTextureCache_peakTextureCount__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 40);
  return result;
}

uint64_t __29__PXGMetalTextureCache_count__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __35__PXGMetalTextureCache_description__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_description");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
