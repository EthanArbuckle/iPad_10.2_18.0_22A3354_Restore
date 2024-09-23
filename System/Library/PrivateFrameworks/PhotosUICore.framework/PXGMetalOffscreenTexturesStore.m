@implementation PXGMetalOffscreenTexturesStore

- (void)willRenderFrameWithDevice:(id)a3 size:(id *)a4 sampleCount:(int64_t)a5 pixelFormat:(unint64_t)a6 preloadTexturesCount:(int64_t)a7
{
  id v13;
  NSObject *queue;
  id v15;
  void *v16;
  _QWORD block[5];
  id v18;
  __int128 v19;
  unint64_t var2;
  int64_t v21;
  unint64_t v22;
  int64_t v23;

  v13 = a3;
  if (a4->var2 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGMetalOffscreenTexturesStore.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("size.depth == 1"));

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __110__PXGMetalOffscreenTexturesStore_willRenderFrameWithDevice_size_sampleCount_pixelFormat_preloadTexturesCount___block_invoke;
  block[3] = &unk_1E513CEF0;
  block[4] = self;
  v18 = v13;
  v19 = *(_OWORD *)&a4->var0;
  var2 = a4->var2;
  v21 = a5;
  v22 = a6;
  v23 = a7;
  v15 = v13;
  dispatch_async(queue, block);

}

uint64_t __110__PXGMetalOffscreenTexturesStore_willRenderFrameWithDevice_size_sampleCount_pixelFormat_preloadTexturesCount___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 80);
  v4 = *(_QWORD *)(a1 + 88);
  v7 = *(_OWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 72);
  v8 = *(_QWORD *)(a1 + 64);
  return objc_msgSend(v2, "_queue_willRenderFrameWithDevice:size:sampleCount:pixelFormat:preloadTexturesCount:", v1, &v7, v5, v3, v4);
}

- (void)_queue_willRenderFrameWithDevice:(id)a3 size:(id *)a4 sampleCount:(int64_t)a5 pixelFormat:(unint64_t)a6 preloadTexturesCount:(int64_t)a7
{
  MTLDevice *v12;
  MTLDevice *v13;
  BOOL v14;
  BOOL v15;
  MTLDevice *queue_device;
  MTLDevice *v17;
  unint64_t var2;

  v12 = (MTLDevice *)a3;
  v13 = v12;
  if (self->_queue_device != v12
    || (self->_queue_size.width == a4->var0 ? (v14 = self->_queue_size.height == a4->var1) : (v14 = 0),
        v14 ? (v15 = self->_queue_size.depth == a4->var2) : (v15 = 0),
        !v15 || self->_queue_sampleCount != a5 || (queue_device = v12, self->_queue_pixelFormat != a6)))
  {
    -[PXGMetalOffscreenTexturesStore _queue_removeAllTextures](self, "_queue_removeAllTextures");
    queue_device = self->_queue_device;
  }
  self->_queue_device = v13;
  v17 = v13;

  var2 = a4->var2;
  *(_OWORD *)&self->_queue_size.width = *(_OWORD *)&a4->var0;
  self->_queue_size.depth = var2;
  self->_queue_sampleCount = a5;
  self->_queue_pixelFormat = a6;
  -[NSMutableSet removeAllObjects](self->_queue_usedTextures, "removeAllObjects");

  -[PXGMetalOffscreenTexturesStore _queue_preloadTexturesCount:](self, "_queue_preloadTexturesCount:", a7);
}

- (void)_queue_removeAllTextures
{
  -[NSMutableSet removeAllObjects](self->_queue_usedTextures, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_queue_loadedTextures, "removeAllObjects");
  -[NSHashTable removeAllObjects](self->_queue_aliveTextures, "removeAllObjects");
}

- (void)_queue_preloadTexturesCount:(int64_t)a3
{
  $E8CF8C4D35898297CF58D66FCEA3D064 *p_queue_size;
  void *v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  dispatch_time_t v11;
  NSObject *queue;
  id v13;
  unint64_t queue_pixelFormat;
  void *v15;
  __int128 v16;
  unint64_t depth;
  _QWORD block[4];
  id v19;

  p_queue_size = &self->_queue_size;
  if (*(_OWORD *)&self->_queue_size.width != 0)
  {
    objc_msgSend(off_1E50B5CD0, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "offscreenTextureMaximumLifeTime");
    v8 = v7;

    if (-[NSMutableSet count](self->_queue_loadedTextures, "count") > (unint64_t)a3)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99D38]);
      while (-[NSMutableSet count](self->_queue_loadedTextures, "count") > (unint64_t)a3)
      {
        -[NSMutableSet anyObject](self->_queue_loadedTextures, "anyObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet removeObject:](self->_queue_loadedTextures, "removeObject:", v10);
        objc_msgSend(v9, "setObject:forKey:", v10, v10);

      }
      v11 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __62__PXGMetalOffscreenTexturesStore__queue_preloadTexturesCount___block_invoke;
      block[3] = &unk_1E5149198;
      v19 = v9;
      v13 = v9;
      dispatch_after(v11, queue, block);

    }
    do
    {
      if (-[NSMutableSet count](self->_queue_loadedTextures, "count") >= (unint64_t)a3)
        break;
      queue_pixelFormat = self->_queue_pixelFormat;
      v16 = *(_OWORD *)&p_queue_size->width;
      depth = p_queue_size->depth;
      -[PXGMetalOffscreenTexturesStore _queue_loadTextureWithSize:pixelFormat:](self, "_queue_loadTextureWithSize:pixelFormat:", &v16, queue_pixelFormat);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    while (v15);
  }
}

- (PXGMetalOffscreenTexturesStore)init
{
  PXGMetalOffscreenTexturesStore *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  NSMutableSet *v7;
  NSMutableSet *queue_loadedTextures;
  NSMutableSet *v9;
  NSMutableSet *queue_usedTextures;
  uint64_t v11;
  NSHashTable *queue_aliveTextures;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PXGMetalOffscreenTexturesStore;
  v2 = -[PXGMetalOffscreenTexturesStore init](&v14, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("com.apple.photos.metalrenderer-offscreenCache", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    queue_loadedTextures = v2->_queue_loadedTextures;
    v2->_queue_loadedTextures = v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    queue_usedTextures = v2->_queue_usedTextures;
    v2->_queue_usedTextures = v9;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v11 = objc_claimAutoreleasedReturnValue();
    queue_aliveTextures = v2->_queue_aliveTextures;
    v2->_queue_aliveTextures = (NSHashTable *)v11;

  }
  return v2;
}

- (id)checkoutOffscreenTextureWithSize:(id *)a3 pixelFormat:(unint64_t)a4
{
  NSObject *queue;
  id v8;
  void *v11;
  _QWORD block[6];
  __int128 v13;
  unint64_t var2;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  if (a3->var2 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGMetalOffscreenTexturesStore.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("size.depth == 1"));

  }
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__244374;
  v20 = __Block_byref_object_dispose__244375;
  v21 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__PXGMetalOffscreenTexturesStore_checkoutOffscreenTextureWithSize_pixelFormat___block_invoke;
  block[3] = &unk_1E513F868;
  block[4] = self;
  block[5] = &v16;
  v13 = *(_OWORD *)&a3->var0;
  var2 = a3->var2;
  v15 = a4;
  dispatch_sync(queue, block);
  v8 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v8;
}

- (void)removeAllTextures
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__PXGMetalOffscreenTexturesStore_removeAllTextures__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)_queue_checkoutOffscreenTextureWithSize:(id *)a3 pixelFormat:(unint64_t)a4
{
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v15;
  unint64_t var2;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = self->_queue_loadedTextures;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
      v15 = *(_OWORD *)&a3->var0;
      var2 = a3->var2;
      if (_textureMatchesSize(v12, &v15, a4)
        && !-[NSMutableSet containsObject:](self->_queue_usedTextures, "containsObject:", v12))
      {
        break;
      }
      if (v9 == ++v11)
      {
        v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    v13 = v12;

    if (v13)
      goto LABEL_13;
  }
  else
  {
LABEL_10:

  }
  v15 = *(_OWORD *)&a3->var0;
  var2 = a3->var2;
  -[PXGMetalOffscreenTexturesStore _queue_loadTextureWithSize:pixelFormat:](self, "_queue_loadTextureWithSize:pixelFormat:", &v15, a4);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13)
LABEL_13:
    -[NSMutableSet addObject:](self->_queue_usedTextures, "addObject:", v13);
  return v13;
}

- (id)_queue_loadTextureWithSize:(id *)a3 pixelFormat:(unint64_t)a4
{
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  unint64_t var0;
  NSObject *v15;
  uint64_t v16;
  id v17;
  NSObject *v19;
  MTLDevice *queue_device;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE buf[24];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = self->_queue_aliveTextures;
  v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (v12)
        {
          *(_OWORD *)buf = *(_OWORD *)&a3->var0;
          *(_QWORD *)&buf[16] = a3->var2;
          if (_textureMatchesSize(v12, buf, a4)
            && (-[NSMutableSet containsObject:](self->_queue_loadedTextures, "containsObject:", v12, (_QWORD)v21) & 1) == 0
            && !-[NSMutableSet containsObject:](self->_queue_usedTextures, "containsObject:", v12))
          {
            v17 = v12;
            goto LABEL_25;
          }
        }
      }
      v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v9)
        continue;
      break;
    }
  }

  v13 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  var0 = a3->var0;
  if (v13
    && var0 == self->_queue_size.width
    && a3->var1 == self->_queue_size.height
    && a3->var2 == self->_queue_size.depth)
  {
    PXGTungstenGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEFAULT, "Warning, allocating offscreen texture on the main thread.", buf, 2u);
    }

    var0 = a3->var0;
  }
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", a4, var0, a3->var1, 0, (_QWORD)v21);
  v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
  -[NSHashTable setSampleCount:](v7, "setSampleCount:", self->_queue_sampleCount);
  if (self->_queue_sampleCount >= 2)
    v16 = 4;
  else
    v16 = 2;
  -[NSHashTable setTextureType:](v7, "setTextureType:", v16);
  -[NSHashTable setStorageMode:](v7, "setStorageMode:", 2);
  -[NSHashTable setUsage:](v7, "setUsage:", 7);
  v17 = (id)-[MTLDevice newTextureWithDescriptor:](self->_queue_device, "newTextureWithDescriptor:", v7);
  objc_msgSend(v17, "setLabel:", CFSTR("PXGMetalRenderer Offscreen"));
  if (v17)
  {
    -[NSHashTable addObject:](self->_queue_aliveTextures, "addObject:", v17);
LABEL_25:

    -[NSMutableSet addObject:](self->_queue_loadedTextures, "addObject:", v17);
    return v17;
  }
  else
  {
    PXGTungstenGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      queue_device = self->_queue_device;
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = queue_device;
      _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_ERROR, "Failed to allocate texture, descriptor:%@ device:%@", buf, 0x16u);
    }

    return 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_device, 0);
  objc_storeStrong((id *)&self->_queue_aliveTextures, 0);
  objc_storeStrong((id *)&self->_queue_usedTextures, 0);
  objc_storeStrong((id *)&self->_queue_loadedTextures, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __62__PXGMetalOffscreenTexturesStore__queue_preloadTexturesCount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "countLimit");
}

uint64_t __51__PXGMetalOffscreenTexturesStore_removeAllTextures__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeAllTextures");
}

void __79__PXGMetalOffscreenTexturesStore_checkoutOffscreenTextureWithSize_pixelFormat___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v7 = *(_OWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 72);
  v8 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v2, "_queue_checkoutOffscreenTextureWithSize:pixelFormat:", &v7, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

@end
