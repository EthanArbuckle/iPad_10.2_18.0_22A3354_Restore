@implementation PXGMetalTextureAtlasManager

- (void)processPendingThumbnailRequestIDsWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[PXGMetalTextureAtlasManager layoutQueue](self, "layoutQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[PXGMetalTextureAtlasManager atlasTextures](self, "atlasTextures");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__PXGMetalTextureAtlasManager_processPendingThumbnailRequestIDsWithHandler___block_invoke;
  v8[3] = &unk_1E5135740;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

}

- (NSArray)atlasTextures
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSkipRenderSpriteIndexes:(id)a3
{
  NSIndexSet *v4;
  NSIndexSet *skipRenderSpriteIndexes;

  if (self->_skipRenderSpriteIndexes != a3)
  {
    v4 = (NSIndexSet *)objc_msgSend(a3, "copy");
    skipRenderSpriteIndexes = self->_skipRenderSpriteIndexes;
    self->_skipRenderSpriteIndexes = v4;

    -[PXGMetalTextureAtlasManager _updateAtlasSpriteIndexSkips](self, "_updateAtlasSpriteIndexSkips");
  }
}

- (void)pruneUnusedTextures
{
  NSObject *requestQueue;
  _QWORD block[5];

  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PXGMetalTextureAtlasManager_pruneUnusedTextures__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(requestQueue, block);
}

- (OS_dispatch_queue)layoutQueue
{
  return self->_layoutQueue;
}

- (void)_updateAtlasSpriteIndexSkips
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PXGMetalTextureAtlasManager atlasTextures](self, "atlasTextures", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        -[PXGMetalTextureAtlasManager skipRenderSpriteIndexes](self, "skipRenderSpriteIndexes");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setSkipRenderSpriteIndexes:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (NSIndexSet)skipRenderSpriteIndexes
{
  return self->_skipRenderSpriteIndexes;
}

void __76__PXGMetalTextureAtlasManager_processPendingThumbnailRequestIDsWithHandler___block_invoke(uint64_t a1, void *a2, int a3)
{
  void *v4;
  int v5;
  _QWORD v6[4];
  id v7;
  int v8;

  v4 = *(void **)(a1 + 40);
  v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36) * a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__PXGMetalTextureAtlasManager_processPendingThumbnailRequestIDsWithHandler___block_invoke_2;
  v6[3] = &unk_1E5135718;
  v8 = v5;
  v7 = v4;
  objc_msgSend(a2, "processPendingThumbnailRequestIDsWithHandler:", v6);

}

void __50__PXGMetalTextureAtlasManager_pruneUnusedTextures__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "atlasTextures");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUnused");

  if (v3)
  {
    v4 = (void *)objc_msgSend(v8, "mutableCopy");
    v5 = objc_msgSend(v8, "count");
    if (v5 - 1 >= 0)
    {
      v6 = v5;
      while (objc_msgSend(v8, "count"))
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", --v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v7, "isUnused"))
        {

          break;
        }
        objc_msgSend(v4, "removeObjectAtIndex:", v6);

        if (v6 <= 0)
          break;
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "setAtlasTextures:", v4);

  }
}

void __83__PXGMetalTextureAtlasManager__requestQueue_getNextAvailableAtlas_thumbnailOffset___block_invoke(_QWORD *a1, void *a2, int a3, _BYTE *a4)
{
  unsigned int v8;
  id v9;

  v9 = a2;
  v8 = objc_msgSend(v9, "count");
  if (v8 < objc_msgSend(v9, "capacity"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
    *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_DWORD *)(a1[4] + 36) * a3;
    *a4 = 1;
  }

}

- (void)addSpriteWithTextureRequestID:(int)a3 thumbnailData:(id)a4 size:(CGSize)a5 bytesPerRow:(unint64_t)a6 contentsRect:(CGRect)a7
{
  double height;
  double width;
  double y;
  double x;
  double v12;
  double v13;
  uint64_t v14;
  NSObject *requestQueue;
  id v17;
  id v18;
  id v19;
  int v20;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v12 = a5.height;
  v13 = a5.width;
  v14 = *(_QWORD *)&a3;
  requestQueue = self->_requestQueue;
  v17 = a4;
  dispatch_assert_queue_V2(requestQueue);
  v20 = 0;
  v19 = 0;
  -[PXGMetalTextureAtlasManager _requestQueue_getNextAvailableAtlas:thumbnailOffset:](self, "_requestQueue_getNextAvailableAtlas:thumbnailOffset:", &v19, &v20);
  v18 = v19;
  objc_msgSend(v18, "addSpriteWithTextureRequestID:thumbnailData:size:bytesPerRow:contentsRect:", v14, v17, a6, v13, v12, x, y, width, height);

}

- (void)_requestQueue_getNextAvailableAtlas:(id *)a3 thumbnailOffset:(unsigned int *)a4
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  _QWORD v14[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__203845;
  v23 = __Block_byref_object_dispose__203846;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[PXGMetalTextureAtlasManager atlasTextures](self, "atlasTextures");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __83__PXGMetalTextureAtlasManager__requestQueue_getNextAvailableAtlas_thumbnailOffset___block_invoke;
  v14[3] = &unk_1E5135768;
  v14[5] = &v19;
  v14[6] = &v15;
  v14[4] = self;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v14);
  -[PXGMetalTextureAtlasManager textureConverter](self, "textureConverter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)v20[5];
  if (!v9 && v8)
  {
    objc_msgSend(v8, "createAtlasForTextureAtlasManager:", self);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v20[5];
    v20[5] = v10;

    objc_msgSend((id)v20[5], "setDelegate:", self);
    v12 = objc_msgSend(v7, "count");
    *((_DWORD *)v16 + 6) = self->_capacityPerAtlas * v12;
    objc_msgSend(v7, "arrayByAddingObject:", v20[5]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGMetalTextureAtlasManager setAtlasTextures:](self, "setAtlasTextures:", v13);

    v9 = (void *)v20[5];
  }
  *a3 = objc_retainAutorelease(v9);
  *a4 = *((_DWORD *)v16 + 6);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

}

- (PXGTextureConverter)textureConverter
{
  return (PXGTextureConverter *)objc_loadWeakRetained((id *)&self->_textureConverter);
}

- (CGSize)thumbnailSize
{
  double width;
  double height;
  CGSize result;

  width = self->_thumbnailSize.width;
  height = self->_thumbnailSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setTextureConverter:(id)a3
{
  objc_storeWeak((id *)&self->_textureConverter, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setAtlasTextures:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (BOOL)mipmapped
{
  return self->_mipmapped;
}

- (PXGMetalTextureAtlasManager)initWithThumbnailSize:(CGSize)a3 pixelFormat:(unint64_t)a4 capacityPerAtlas:(unsigned int)a5 mipmapped:(BOOL)a6 requestQueue:(id)a7 layoutQueue:(id)a8 colorProgram:(id)a9 context:(id)a10
{
  double height;
  double width;
  id v17;
  id v18;
  id v19;
  id v20;
  PXGMetalTextureAtlasManager *v21;
  double v22;
  unsigned int v23;
  void *v24;
  double v25;
  double v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *syncQueue;
  uint64_t v29;
  NSIndexSet *skipRenderSpriteIndexes;
  NSArray *atlasTextures;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v38;
  objc_super v41;
  CGSize v42;

  height = a3.height;
  width = a3.width;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  v41.receiver = self;
  v41.super_class = (Class)PXGMetalTextureAtlasManager;
  v21 = -[PXGMetalTextureAtlasManager init](&v41, sel_init);
  if (v21)
  {
    v38 = v17;
    v22 = 4096.0 / width;
    if (4096.0 / width > (double)a5)
      v22 = (double)a5;
    v23 = vcvtpd_s64_f64((double)a5 / (double)(uint64_t)v22) * (uint64_t)v22;
    if (!v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, v21, CFSTR("PXGMetalTextureAtlasManager.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("capacityPerAtlas > 0"));

    }
    objc_msgSend(v20, "device");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, v21, CFSTR("PXGMetalTextureAtlasManager.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context.device != nil"));

    }
    PXSizeRoundToPixel();
    if (v26 != width || v25 != height)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v42.width = width;
      v42.height = height;
      NSStringFromCGSize(v42);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, v21, CFSTR("PXGMetalTextureAtlasManager.m"), 65, CFSTR("thumbnailSize cannot have fractional pixels:%@"), v36);

    }
    objc_storeStrong((id *)&v21->_metalRenderContext, a10);
    objc_storeStrong((id *)&v21->_colorProgram, a9);
    objc_storeStrong((id *)&v21->_layoutQueue, a8);
    objc_storeStrong((id *)&v21->_requestQueue, a7);
    v27 = dispatch_queue_create("com.apple.photos.atlas-manager.sync", 0);
    syncQueue = v21->_syncQueue;
    v21->_syncQueue = (OS_dispatch_queue *)v27;

    v21->_pixelFormat = a4;
    v21->_thumbnailSize.width = width;
    v21->_thumbnailSize.height = height;
    v21->_capacityPerAtlas = v23;
    v21->_mipmapped = a6;
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v29 = objc_claimAutoreleasedReturnValue();
    skipRenderSpriteIndexes = v21->_skipRenderSpriteIndexes;
    v21->_skipRenderSpriteIndexes = (NSIndexSet *)v29;

    atlasTextures = v21->_atlasTextures;
    v21->_atlasTextures = (NSArray *)MEMORY[0x1E0C9AA60];

    v17 = v38;
  }

  return v21;
}

- (PXGColorProgram)colorProgram
{
  return self->_colorProgram;
}

- (unsigned)capacityPerAtlas
{
  return self->_capacityPerAtlas;
}

uint64_t __76__PXGMetalTextureAtlasManager_processPendingThumbnailRequestIDsWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (PXGMetalTextureAtlasManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGMetalTextureAtlasManager.m"), 84, CFSTR("%s is not available as initializer"), "-[PXGMetalTextureAtlasManager init]");

  abort();
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  objc_super v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  CGSize v27;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[PXGMetalTextureAtlasManager atlasTextures](self, "atlasTextures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v7 += objc_msgSend(v10, "count");
        objc_msgSend(v10, "texture");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v6 += objc_msgSend(v11, "allocatedSize");

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
    v12 = (double)v6 * 0.0009765625 * 0.0009765625;
  }
  else
  {
    v7 = 0;
    v12 = 0.0;
  }

  v13 = (void *)MEMORY[0x1E0CB3940];
  v20.receiver = self;
  v20.super_class = (Class)PXGMetalTextureAtlasManager;
  -[PXGMetalTextureAtlasManager description](&v20, sel_description);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGMetalTextureAtlasManager thumbnailSize](self, "thumbnailSize");
  NSStringFromCGSize(v27);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PXGMetalTextureAtlasManager pixelFormat](self, "pixelFormat");
  -[PXGMetalTextureAtlasManager atlasTextures](self, "atlasTextures");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@ thumbnailSize:%@ pixelFormat:%lu count:%ld memory:%.2fMB textureAtlases:%@>"), v14, v15, v16, v7, *(_QWORD *)&v12, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v18;
}

- (void)removeSpriteIndex:(unsigned int)a3 atThumbnailIndex:(unsigned int)a4
{
  uint64_t v4;
  id v5;
  id v6;
  unsigned int v7;

  v4 = *(_QWORD *)&a3;
  v7 = 0;
  v6 = 0;
  -[PXGMetalTextureAtlasManager _getAtlas:localThumbnailIndex:forGlobalThumbnailIndex:](self, "_getAtlas:localThumbnailIndex:forGlobalThumbnailIndex:", &v6, &v7, *(_QWORD *)&a4);
  v5 = v6;
  objc_msgSend(v5, "removeSpriteIndex:atThumbnailIndex:", v4, v7);

}

- (void)applyChangeDetails:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PXGMetalTextureAtlasManager atlasTextures](self, "atlasTextures", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "applyChangeDetails:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGMetalTextureAtlasManager setSkipRenderSpriteIndexes:](self, "setSkipRenderSpriteIndexes:", v10);

}

- (void)_getAtlas:(id *)a3 localThumbnailIndex:(unsigned int *)a4 forGlobalThumbnailIndex:(unsigned int)a5
{
  void *v10;
  unint64_t v11;
  unsigned int capacityPerAtlas;
  uint64_t v13;
  unsigned int v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;

  -[PXGMetalTextureAtlasManager atlasTextures](self, "atlasTextures");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count") * self->_capacityPerAtlas;

  if (v11 <= a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGMetalTextureAtlasManager.m"), 211, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("globalThumbnailIndex < self.atlasTextures.count * _capacityPerAtlas"));

  }
  capacityPerAtlas = self->_capacityPerAtlas;
  v13 = a5 / capacityPerAtlas;
  v14 = a5 % capacityPerAtlas;
  -[PXGMetalTextureAtlasManager atlasTextures](self, "atlasTextures");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_retainAutorelease(v16);
  *a3 = v17;
  *a4 = v14;

}

- (void)textureAtlasDidBecomeUnused:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;

  -[PXGMetalTextureAtlasManager delegate](self, "delegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4
    || (v5 = (void *)v4,
        -[PXGMetalTextureAtlasManager delegate](self, "delegate"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "textureAtlasManagerShouldPruneUnusedTextures:", self),
        v6,
        v5,
        v7))
  {
    -[PXGMetalTextureAtlasManager pruneUnusedTextures](self, "pruneUnusedTextures");
  }
}

- (PXGTextureAtlasManagerDelegate)delegate
{
  return (PXGTextureAtlasManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setMipmapped:(BOOL)a3
{
  self->_mipmapped = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_atlasTextures, 0);
  objc_storeStrong((id *)&self->_layoutQueue, 0);
  objc_storeStrong((id *)&self->_colorProgram, 0);
  objc_destroyWeak((id *)&self->_textureConverter);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_skipRenderSpriteIndexes, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_metalRenderContext, 0);
}

@end
