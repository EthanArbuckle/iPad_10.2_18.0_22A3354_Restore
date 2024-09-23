@implementation PXGAssetImageCache

void __112__PXGAssetImageCache_getCachedImage_withOrientation_outIsDegraded_forAsset_targetSize_contentMode_forRequestID___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  _PXGAssetImageCacheEntry *v13;
  void *v14;
  void *v15;
  _PXGAssetImageCacheEntry *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v19;
LABEL_4:
      v6 = 0;
      while (1)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v6);
        objc_msgSend(v7, "asset", (_QWORD)v18);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isContentEqualTo:", *(_QWORD *)(a1 + 40));

        if (v9 == 2)
        {
          objc_msgSend(v7, "targetSize");
          PXSizeGetArea();
          v11 = v10;
          PXSizeGetArea();
          if (v11 / v12 <= 10.0)
            break;
        }
        if (v4 == ++v6)
        {
          v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v4)
            goto LABEL_4;
          goto LABEL_12;
        }
      }
      v13 = v7;

      if (v13)
        goto LABEL_18;
    }
    else
    {
LABEL_12:

    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "px_popLast", (_QWORD)v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    v16 = v14;
  else
    v16 = objc_alloc_init(_PXGAssetImageCacheEntry);
  v13 = v16;

  -[_PXGAssetImageCacheEntry setAsset:](v13, "setAsset:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", v13);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
LABEL_18:
  -[_PXGAssetImageCacheEntry requestIDs](v13, "requestIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addIndex:", *(int *)(a1 + 88));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addIndex:", *(int *)(a1 + 88));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -[_PXGAssetImageCacheEntry cgImage](v13, "cgImage");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = -[_PXGAssetImageCacheEntry imageOrientation](v13, "imageOrientation");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = -[_PXGAssetImageCacheEntry isDegraded](v13, "isDegraded");

}

void __81__PXGAssetImageCache__cacheImage_orientation_isDegraded_forRequestID_outCGImage___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "containsIndex:", *(int *)(a1 + 56)))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v18 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v7, "requestIDs", (_QWORD)v17);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "containsIndex:", *(int *)(a1 + 56));

          if (v9)
          {
            PXCGImageGetSizeWithOrientation();
            v11 = v10;
            v13 = v12;
            v14 = objc_msgSend(v7, "imageSize");
            if (MEMORY[0x1A85CD5B8](v14, v11, v13, v15, v16))
            {
              objc_msgSend(v7, "setCgImage:", *(_QWORD *)(a1 + 48));
              objc_msgSend(v7, "setImageOrientation:", *(unsigned int *)(a1 + 60));
              objc_msgSend(v7, "setIsDegraded:", *(unsigned __int8 *)(a1 + 64));
            }
            else
            {
              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v7, "cgImage");
            }
            goto LABEL_14;
          }
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_14:

  }
}

- (CGImage)cacheCGImage:(CGImage *)a3 orientation:(unsigned int)a4 isDegraded:(BOOL)a5 forRequestID:(int)a6
{
  CGImage *v7;

  v7 = 0;
  -[PXGAssetImageCache _cacheImage:orientation:isDegraded:forRequestID:outCGImage:](self, "_cacheImage:orientation:isDegraded:forRequestID:outCGImage:", a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6, &v7);
  return v7;
}

- (void)_cacheImage:(CGImage *)a3 orientation:(unsigned int)a4 isDegraded:(BOOL)a5 forRequestID:(int)a6 outCGImage:(CGImage *)a7
{
  NSObject *queue;
  _QWORD block[7];
  int v10;
  unsigned int v11;
  BOOL v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  CGImage *v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__PXGAssetImageCache__cacheImage_orientation_isDegraded_forRequestID_outCGImage___block_invoke;
  block[3] = &unk_1E5138608;
  block[5] = &v13;
  block[6] = a3;
  v10 = a6;
  v11 = a4;
  v12 = a5;
  block[4] = self;
  dispatch_sync(queue, block);
  if (a7)
    *a7 = (CGImage *)v14[3];
  _Block_object_dispose(&v13, 8);
}

- (BOOL)getCachedImage:(CGImage *)a3 withOrientation:(unsigned int *)a4 outIsDegraded:(BOOL *)a5 forAsset:(id)a6 targetSize:(CGSize)a7 contentMode:(int64_t)a8 forRequestID:(int)a9
{
  CGFloat height;
  CGFloat width;
  id v16;
  NSObject *queue;
  id v18;
  uint64_t *v19;
  _QWORD v21[5];
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  CGFloat v26;
  CGFloat v27;
  int v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;

  height = a7.height;
  width = a7.width;
  v16 = a6;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  queue = self->_queue;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __112__PXGAssetImageCache_getCachedImage_withOrientation_outIsDegraded_forAsset_targetSize_contentMode_forRequestID___block_invoke;
  v21[3] = &unk_1E51385E0;
  v21[4] = self;
  v18 = v16;
  v26 = width;
  v27 = height;
  v28 = a9;
  v22 = v18;
  v23 = &v37;
  v24 = &v33;
  v25 = &v29;
  dispatch_sync(queue, v21);
  *a4 = *((_DWORD *)v34 + 6);
  *a5 = *((_BYTE *)v30 + 24);
  if (a3)
  {
    v19 = v38;
    *a3 = (CGImage *)v38[3];
    LOBYTE(a3) = v19[3] != 0;
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  return (char)a3;
}

- (PXGAssetImageCache)init
{
  PXGAssetImageCache *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSMutableIndexSet *v6;
  NSMutableIndexSet *activeRequestIDs;
  NSMutableSet *v8;
  NSMutableSet *activeAssets;
  NSMutableArray *v10;
  NSMutableArray *entries;
  NSMutableArray *v12;
  NSMutableArray *reusableEntries;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PXGAssetImageCache;
  v2 = -[PXGAssetImageCache init](&v15, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.photos.PXGAssetImageCache", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    activeRequestIDs = v2->_activeRequestIDs;
    v2->_activeRequestIDs = v6;

    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    activeAssets = v2->_activeAssets;
    v2->_activeAssets = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    entries = v2->_entries;
    v2->_entries = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    reusableEntries = v2->_reusableEntries;
    v2->_reusableEntries = v12;

  }
  return v2;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; ImageCount = %lu>"),
    v5,
    self,
    -[NSMutableArray count](self->_entries, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; ImageCount = %lu; Entries = %@>"),
    v5,
    self,
    -[NSMutableArray count](self->_entries, "count"),
    self->_entries);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)clearCachedImagesForRequestIDs:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  PXGAssetImageCache *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__PXGAssetImageCache_clearCachedImagesForRequestIDs___block_invoke;
  v7[3] = &unk_1E5148D08;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)clearAllCachedImages
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__PXGAssetImageCache_clearAllCachedImages__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reusableEntries, 0);
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_activeAssets, 0);
  objc_storeStrong((id *)&self->_activeRequestIDs, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __42__PXGAssetImageCache_clearAllCachedImages__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy", 0);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v12 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          objc_msgSend(v7, "requestIDs");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "removeIndexes:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
          if (!objc_msgSend(v8, "count"))
          {
            objc_msgSend(v7, "asset");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            if (v9)
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", v9);
            objc_msgSend(v7, "prepareForReuse");
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", v7);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", v7);

          }
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v4);
    }

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllIndexes");
}

void __53__PXGAssetImageCache_clearCachedImagesForRequestIDs___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "px_intersectionWithIndexSet:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "copy", 0);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          objc_msgSend(v8, "requestIDs");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "removeIndexes:", v2);
          if (!objc_msgSend(v9, "count"))
          {
            objc_msgSend(v8, "asset");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (v10)
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "removeObject:", v10);
            objc_msgSend(v8, "prepareForReuse");
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "addObject:", v8);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "removeObject:", v8);

          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v5);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "removeIndexes:", *(_QWORD *)(a1 + 32));

}

@end
