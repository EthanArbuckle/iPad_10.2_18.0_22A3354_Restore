@implementation PFFrameCache

- (PFFrameCache)initWithImageSource:(CGImageSource *)a3
{
  return -[PFFrameCache initWithImageSource:cachingStrategy:](self, "initWithImageSource:cachingStrategy:", a3, 2);
}

- (PFFrameCache)initWithImageSource:(CGImageSource *)a3 cachingStrategy:(int64_t)a4
{
  return -[PFFrameCache initWithImageSource:cachingStrategy:useGlobalDecodeQueue:](self, "initWithImageSource:cachingStrategy:useGlobalDecodeQueue:", a3, a4, 0);
}

- (PFFrameCache)initWithImageSource:(CGImageSource *)a3 cachingStrategy:(int64_t)a4 useGlobalDecodeQueue:(BOOL)a5
{
  _BOOL4 v5;
  PFFrameCache *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *frameCache;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *cacheIsolationQueue;
  uint64_t v14;
  OS_dispatch_queue *frameGenerationQueue;
  uint64_t v16;
  NSMutableIndexSet *cachedIndexes;
  objc_super v19;

  v5 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PFFrameCache;
  v8 = -[PFFrameCache init](&v19, sel_init);
  if (v8)
  {
    v8->_gifSource = (CGImageSource *)CFRetain(a3);
    v8->_frameCount = CGImageSourceGetCount(a3);
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    frameCache = v8->_frameCache;
    v8->_frameCache = v9;

    v8->_fullCachingCost = pf_estimateFullAnimatedImageMemoryCost(a3);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.PFFrameCache.cacheIsolationQueue", v11);
    cacheIsolationQueue = v8->_cacheIsolationQueue;
    v8->_cacheIsolationQueue = (OS_dispatch_queue *)v12;

    if (v5)
    {
      objc_msgSend((id)objc_opt_class(), "sharedFrameGenerationQueue");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = (uint64_t)dispatch_queue_create("com.apple.PFFrameCache.frameGenerationQueue", v11);
    }
    frameGenerationQueue = v8->_frameGenerationQueue;
    v8->_frameGenerationQueue = (OS_dispatch_queue *)v14;

    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v16 = objc_claimAutoreleasedReturnValue();
    cachedIndexes = v8->_cachedIndexes;
    v8->_cachedIndexes = (NSMutableIndexSet *)v16;

    v8->_cacheStrategy = a4;
    -[PFFrameCache _updateIfNeeded](v8, "_updateIfNeeded");

  }
  return v8;
}

- (CGImage)frameAtIndex:(unint64_t)a3
{
  return -[PFFrameCache _frameAtIndex:allowLazy:](self, "_frameAtIndex:allowLazy:", a3, 0);
}

- (CGImage)frameAtIndexIfReady:(unint64_t)a3
{
  return -[PFFrameCache _frameAtIndex:allowLazy:](self, "_frameAtIndex:allowLazy:", a3, 1);
}

- (CGImage)_frameAtIndex:(unint64_t)a3 allowLazy:(BOOL)a4
{
  NSObject *cacheIsolationQueue;
  CGImage *v6;
  _QWORD v8[7];
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  cacheIsolationQueue = self->_cacheIsolationQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__PFFrameCache__frameAtIndex_allowLazy___block_invoke;
  v8[3] = &unk_1E45A2E18;
  v8[5] = &v10;
  v8[6] = a3;
  v8[4] = self;
  v9 = a4;
  dispatch_sync(cacheIsolationQueue, v8);
  -[PFFrameCache _updateFrameCache](self, "_updateFrameCache");
  v6 = (CGImage *)v11[3];
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (int64_t)cacheStrategy
{
  NSObject *cacheIsolationQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 2;
  cacheIsolationQueue = self->_cacheIsolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__PFFrameCache_cacheStrategy__block_invoke;
  v5[3] = &unk_1E45A4B68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(cacheIsolationQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setCacheStrategy:(int64_t)a3
{
  NSObject *cacheIsolationQueue;
  _QWORD v5[6];

  cacheIsolationQueue = self->_cacheIsolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__PFFrameCache_setCacheStrategy___block_invoke;
  v5[3] = &unk_1E45A2E40;
  v5[4] = self;
  v5[5] = a3;
  dispatch_sync(cacheIsolationQueue, v5);
  -[PFFrameCache _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)_invalidateCacheSize
{
  self->_isValid.cacheSize = 0;
}

- (void)_invalidateCache
{
  self->_isValid.frameCache = 0;
}

- (void)_updateIfNeeded
{
  -[PFFrameCache _updateDesiredCacheSize](self, "_updateDesiredCacheSize");
  -[PFFrameCache _updateFrameCache](self, "_updateFrameCache");
}

- (void)_updateDesiredCacheSize
{
  NSObject *cacheIsolationQueue;
  _QWORD block[5];

  cacheIsolationQueue = self->_cacheIsolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PFFrameCache__updateDesiredCacheSize__block_invoke;
  block[3] = &unk_1E45A4AC8;
  block[4] = self;
  dispatch_sync(cacheIsolationQueue, block);
}

- (void)_updateFrameCache
{
  NSObject *frameGenerationQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  frameGenerationQueue = self->_frameGenerationQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__PFFrameCache__updateFrameCache__block_invoke;
  v4[3] = &unk_1E45A2F10;
  objc_copyWeak(&v5, &location);
  dispatch_async(frameGenerationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  CGImageSource *gifSource;
  objc_super v4;

  gifSource = self->_gifSource;
  if (gifSource)
    CFRelease(gifSource);
  v4.receiver = self;
  v4.super_class = (Class)PFFrameCache;
  -[PFFrameCache dealloc](&v4, sel_dealloc);
}

- (void)_frameGenerationQueue_cacheFrameAtIndex:(unint64_t)a3
{
  const __CFDictionary *v5;
  CGImageRef ImageAtIndex;
  CGImage *v7;
  CGImage *v8;
  CGImage *v9;
  NSObject *cacheIsolationQueue;
  _QWORD block[7];
  uint8_t buf[4];
  unint64_t v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v14 = *MEMORY[0x1E0CBD240];
  v15[0] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  ImageAtIndex = CGImageSourceCreateImageAtIndex(self->_gifSource, a3, v5);
  if (ImageAtIndex)
  {
    v7 = ImageAtIndex;
    v8 = -[PFFrameCache _createPredrawnImage:](self, "_createPredrawnImage:", ImageAtIndex);
    if (v8)
    {
      v9 = v8;
      CGImageRelease(v7);
      v7 = v9;
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v13 = a3;
      _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "PFFrameCache: Predrawing failed for image at index %lu", buf, 0xCu);
    }
    cacheIsolationQueue = self->_cacheIsolationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__PFFrameCache__frameGenerationQueue_cacheFrameAtIndex___block_invoke;
    block[3] = &unk_1E45A43C0;
    block[4] = self;
    block[5] = a3;
    block[6] = v7;
    dispatch_sync(cacheIsolationQueue, block);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v13 = a3;
    _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "PFFrameCache: Unable to create image for index %lu", buf, 0xCu);
  }

}

- (void)_frameGenerationQueue_updateFrameCache
{
  NSObject *cacheIsolationQueue;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  _QWORD block[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__4526;
  v24 = __Block_byref_object_dispose__4527;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3010000000;
  v18 = 0;
  v19 = 0;
  v17 = &unk_1A17D2676;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3010000000;
  v12 = 0;
  v13 = 0;
  v11 = &unk_1A17D2676;
  cacheIsolationQueue = self->_cacheIsolationQueue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__PFFrameCache__frameGenerationQueue_updateFrameCache__block_invoke;
  block[3] = &unk_1E45A2E90;
  block[4] = self;
  block[5] = &v20;
  block[6] = &v14;
  block[7] = &v8;
  dispatch_sync(cacheIsolationQueue, block);
  if (objc_msgSend((id)v21[5], "count"))
  {
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __54__PFFrameCache__frameGenerationQueue_updateFrameCache__block_invoke_3;
    v6[3] = &unk_1E45A2EB8;
    v6[4] = self;
    v5 = (void *)MEMORY[0x1A1B0CFA4](v6);
    objc_msgSend((id)v21[5], "enumerateRangesInRange:options:usingBlock:", v15[4], v15[5], 0, v5);
    objc_msgSend((id)v21[5], "enumerateRangesInRange:options:usingBlock:", v9[4], v9[5], 0, v5);

  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

}

- (CGImage)_createPredrawnImage:(CGImage *)a3
{
  unint64_t Width;
  unint64_t Height;
  size_t BitsPerComponent;
  size_t BytesPerRow;
  CGColorSpace *ColorSpace;
  CGImageAlphaInfo AlphaInfo;
  uint32_t v10;
  CGContext *v11;
  CGContext *v12;
  CGImage *Image;
  uint8_t v15[16];
  CGRect v16;

  Width = CGImageGetWidth(a3);
  Height = CGImageGetHeight(a3);
  BitsPerComponent = CGImageGetBitsPerComponent(a3);
  BytesPerRow = CGImageGetBytesPerRow(a3);
  ColorSpace = CGImageGetColorSpace(a3);
  AlphaInfo = CGImageGetAlphaInfo(a3);
  v10 = AlphaInfo;
  if (AlphaInfo <= kCGImageAlphaOnly && ((0x99u >> AlphaInfo) & 1) != 0)
    v10 = dword_1A17B706C[AlphaInfo];
  v11 = CGBitmapContextCreate(0, Width, Height, BitsPerComponent, BytesPerRow, ColorSpace, v10);
  if (v11)
  {
    v12 = v11;
    v16.size.width = (double)Width;
    v16.size.height = (double)Height;
    v16.origin.x = 0.0;
    v16.origin.y = 0.0;
    CGContextDrawImage(v11, v16, a3);
    Image = CGBitmapContextCreateImage(v12);
    CGContextRelease(v12);
    return Image;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "PFFrameCache: Failed to create pre-drawing context", v15, 2u);
    }
    return 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedIndexes, 0);
  objc_storeStrong((id *)&self->_frameCache, 0);
  objc_storeStrong((id *)&self->_cacheIsolationQueue, 0);
  objc_storeStrong((id *)&self->_frameGenerationQueue, 0);
}

void __54__PFFrameCache__frameGenerationQueue_updateFrameCache__block_invoke(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id obj;
  id obja;
  _QWORD v18[5];

  v1 = a1[4];
  if (!*(_BYTE *)(v1 + 81))
  {
    *(_BYTE *)(v1 + 81) = 1;
    v3 = (_QWORD *)a1[4];
    v4 = v3[2];
    if (v4 >= v3[6])
      v5 = v3[6];
    else
      v5 = v3[2];
    v6 = v3[8];
    v7 = v4 - v6;
    if (v5 >= v4 - v6)
      v8 = v4 - v6;
    else
      v8 = v5;
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:");
    obj = (id)objc_claimAutoreleasedReturnValue();
    if (v5 > v7)
      objc_msgSend(obj, "addIndexesInRange:", 0, v5 - v8);
    if ((objc_msgSend(*(id *)(a1[4] + 72), "isEqualToIndexSet:", obj, obj) & 1) == 0)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexSet:", *(_QWORD *)(a1[4] + 72));
      objc_msgSend(v9, "removeIndexes:", obja);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __54__PFFrameCache__frameGenerationQueue_updateFrameCache__block_invoke_2;
      v18[3] = &unk_1E45A2E68;
      v18[4] = a1[4];
      objc_msgSend(v9, "enumerateIndexesUsingBlock:", v18);
      objc_msgSend(*(id *)(a1[4] + 72), "removeIndexes:", v9);
      objc_msgSend(obja, "removeIndexes:", *(_QWORD *)(a1[4] + 72));
      objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), obja);
      v10 = a1[4];
      v11 = *(_QWORD *)(v10 + 64);
      v12 = *(_QWORD *)(v10 + 16) - v11;
      v13 = *(_QWORD *)(a1[6] + 8);
      *(_QWORD *)(v13 + 32) = v11;
      *(_QWORD *)(v13 + 40) = v12;
      v14 = *(_QWORD *)(a1[4] + 64);
      v15 = *(_QWORD *)(a1[7] + 8);
      *(_QWORD *)(v15 + 32) = 0;
      *(_QWORD *)(v15 + 40) = v14;

    }
  }
}

uint64_t __54__PFFrameCache__frameGenerationQueue_updateFrameCache__block_invoke_3(uint64_t result, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (a2 < a2 + a3)
  {
    v12 = v6;
    v13 = v5;
    v14 = v4;
    v15 = v3;
    v16 = v7;
    v17 = v8;
    v9 = a3;
    v10 = a2;
    v11 = result;
    do
    {
      result = objc_msgSend(*(id *)(v11 + 32), "_frameGenerationQueue_cacheFrameAtIndex:", v10++, v12, v13, v14, v15, v16, v17);
      --v9;
    }
    while (v9);
  }
  return result;
}

void __54__PFFrameCache__frameGenerationQueue_updateFrameCache__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

}

void __56__PFFrameCache__frameGenerationQueue_cacheFrameAtIndex___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    CGImageRelease(*(CGImageRef *)(a1 + 48));
  }
  else
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    v6 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, v7);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "addIndex:", *(_QWORD *)(a1 + 40));
  }
}

void __33__PFFrameCache__updateFrameCache__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_frameGenerationQueue_updateFrameCache");

}

uint64_t __39__PFFrameCache__updateDesiredCacheSize__block_invoke(uint64_t result)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 80))
  {
    *(_BYTE *)(v1 + 80) = 1;
    v2 = *(_QWORD **)(result + 32);
    v3 = v2[11];
    v4 = 5;
    if (v3 != 2)
      v4 = 1;
    if (v3 == 1)
      v4 = 2;
    if (v2[3] >> 22 <= 4uLL && v3 != 0)
      v4 = v2[2];
    if (v2[6] != v4)
    {
      v2[6] = v4;
      return objc_msgSend(*(id *)(result + 32), "_invalidateCacheSize");
    }
  }
  return result;
}

uint64_t __33__PFFrameCache_setCacheStrategy___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(result + 40);
  if (*(_QWORD *)(v1 + 88) != v2)
  {
    *(_QWORD *)(v1 + 88) = v2;
    return objc_msgSend(*(id *)(result + 32), "_invalidateCacheSize");
  }
  return result;
}

uint64_t __29__PFFrameCache_cacheStrategy__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 88);
  return result;
}

void __40__PFFrameCache__frameAtIndex_allowLazy___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const __CFDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 64);
  v4 = *(_QWORD *)(a1 + 48);
  if (v3 != v4)
  {
    *(_QWORD *)(v2 + 64) = v4;
    objc_msgSend(*(id *)(a1 + 32), "_invalidateCache");
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 48);
  }
  v5 = *(void **)(v2 + 56);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v5, "objectForKey:", v6);

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (*(_BYTE *)(a1 + 56))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v7 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 134217984;
        v17 = v7;
        _os_log_debug_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "PFFrameCache: Requested unavailable frame at index %lu (ahead of ourselves!!)", buf, 0xCu);
      }
    }
    else
    {
      v14 = *MEMORY[0x1E0CBD240];
      v15 = MEMORY[0x1E0C9AAA0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
      v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CGImageSourceCreateImageAtIndex(*(CGImageSourceRef *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 48), v8);
      v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      if (v9)
      {
        v10 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v9, v11);

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "addIndex:", *(_QWORD *)(a1 + 48));
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          v12 = *(_QWORD *)(a1 + 48);
          *(_DWORD *)buf = 134217984;
          v17 = v12;
          _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "PFFrameCache: Returning undrawn frame at index %lu", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v13 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 134217984;
        v17 = v13;
        _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "PFFrameCache: Failed to create image for undrawn frame at index %lu", buf, 0xCu);
      }

    }
  }
}

+ (id)sharedFrameGenerationQueue
{
  if (sharedFrameGenerationQueue_onceToken != -1)
    dispatch_once(&sharedFrameGenerationQueue_onceToken, &__block_literal_global_4549);
  return (id)sharedFrameGenerationQueue__sharedQueue;
}

void __42__PFFrameCache_sharedFrameGenerationQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.PFFrameCache.frameGenerationQueue", v2);
  v1 = (void *)sharedFrameGenerationQueue__sharedQueue;
  sharedFrameGenerationQueue__sharedQueue = (uint64_t)v0;

}

@end
