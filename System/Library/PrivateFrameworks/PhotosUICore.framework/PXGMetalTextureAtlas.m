@implementation PXGMetalTextureAtlas

- (int64_t)renderPipelineIndex
{
  return self->_renderPipelineIndex;
}

- (void)setRenderPipelineIndex:(int64_t)a3
{
  self->_renderPipelineIndex = a3;
}

- (PXGColorProgram)colorProgram
{
  return self->_colorProgram;
}

- (unsigned)spriteCount
{
  void *v2;
  unsigned int v3;

  -[PXGMetalTextureAtlas renderedSpriteIndexes](self, "renderedSpriteIndexes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (NSIndexSet)renderedSpriteIndexes
{
  NSIndexSet *renderedSpriteIndexes;
  NSIndexSet *v4;
  void *v5;
  NSIndexSet *v6;

  renderedSpriteIndexes = self->_renderedSpriteIndexes;
  if (!renderedSpriteIndexes)
  {
    v4 = (NSIndexSet *)-[NSMutableIndexSet mutableCopy](self->_spriteIndexesUsedBySprites, "mutableCopy");
    -[PXGMetalTextureAtlas skipRenderSpriteIndexes](self, "skipRenderSpriteIndexes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSIndexSet removeIndexes:](v4, "removeIndexes:", v5);

    v6 = self->_renderedSpriteIndexes;
    self->_renderedSpriteIndexes = v4;

    renderedSpriteIndexes = self->_renderedSpriteIndexes;
  }
  return renderedSpriteIndexes;
}

- (void)_invalidateRenderedSpriteIndexes
{
  NSIndexSet *renderedSpriteIndexes;

  renderedSpriteIndexes = self->_renderedSpriteIndexes;
  self->_renderedSpriteIndexes = 0;

}

- (NSIndexSet)skipRenderSpriteIndexes
{
  return self->_skipRenderSpriteIndexes;
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

    -[PXGMetalTextureAtlas _invalidateRenderedSpriteIndexes](self, "_invalidateRenderedSpriteIndexes");
  }
}

- (MTLTexture)texture
{
  return self->_texture;
}

- (BOOL)isOpaque
{
  return 1;
}

- (int)shaderFlags
{
  return 0;
}

- (BOOL)isAtlas
{
  return 1;
}

- (void)getTextureInfos:(id *)a3 forSpriteIndexes:(const unsigned int *)a4 geometries:(id *)a5 spriteStyles:(id *)a6 spriteInfos:(id *)a7 screenScale:(double)a8 count:(unsigned int)a9
{
  $3BA783FF50B239963188BE194EBFFEBA *guarded_textureInfoByThumbnailIndex;
  unsigned int *spriteIndexByThumbnailIndex;
  NSMutableIndexSet *thumbnailIndexesUsedBySprites;
  void *v17;
  _QWORD v18[9];
  unsigned int v19;
  _QWORD v20[4];

  if (-[PXGMetalTextureAtlas spriteCount](self, "spriteCount", a3, a4, a5, a6, a7, a8) < a9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGMetalTextureAtlasManager.m"), 625, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("count <= self.spriteCount"));

  }
  guarded_textureInfoByThumbnailIndex = self->_guarded_textureInfoByThumbnailIndex;
  spriteIndexByThumbnailIndex = self->_spriteIndexByThumbnailIndex;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  thumbnailIndexesUsedBySprites = self->_thumbnailIndexesUsedBySprites;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __111__PXGMetalTextureAtlas_getTextureInfos_forSpriteIndexes_geometries_spriteStyles_spriteInfos_screenScale_count___block_invoke;
  v18[3] = &unk_1E5135828;
  v18[4] = v20;
  v18[5] = a4;
  v18[6] = spriteIndexByThumbnailIndex;
  v18[7] = a3;
  v18[8] = guarded_textureInfoByThumbnailIndex;
  v19 = a9;
  -[NSMutableIndexSet enumerateRangesUsingBlock:](thumbnailIndexesUsedBySprites, "enumerateRangesUsingBlock:", v18);
  _Block_object_dispose(v20, 8);
}

- (void)getSpriteIndexes:(unsigned int *)a3 maxSpriteCount:(unsigned int)a4
{
  unsigned int *spriteIndexByThumbnailIndex;
  void *v9;
  NSMutableIndexSet *thumbnailIndexesUsedBySprites;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  unsigned int *v16;
  unsigned int *v17;
  unsigned int v18;
  _QWORD v19[4];

  if (-[PXGMetalTextureAtlas spriteCount](self, "spriteCount") < a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGMetalTextureAtlasManager.m"), 595, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("maxSpriteCount <= self.spriteCount"));

  }
  spriteIndexByThumbnailIndex = self->_spriteIndexByThumbnailIndex;
  -[PXGMetalTextureAtlas renderedSpriteIndexes](self, "renderedSpriteIndexes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  thumbnailIndexesUsedBySprites = self->_thumbnailIndexesUsedBySprites;
  v19[3] = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__PXGMetalTextureAtlas_getSpriteIndexes_maxSpriteCount___block_invoke;
  v13[3] = &unk_1E51357D8;
  v16 = spriteIndexByThumbnailIndex;
  v11 = v9;
  v17 = a3;
  v14 = v11;
  v15 = v19;
  v18 = a4;
  -[NSMutableIndexSet enumerateRangesUsingBlock:](thumbnailIndexesUsedBySprites, "enumerateRangesUsingBlock:", v13);

  _Block_object_dispose(v19, 8);
}

- (MTLTexture)chromaTexture
{
  return 0;
}

uint64_t __41__PXGMetalTextureAtlas_prepareForRender___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 208);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, v4);

  return objc_msgSend(*(id *)(a1 + 32), "_syncQueue_retainThumbnailsAtIndexes:", *(_QWORD *)(a1 + 40));
}

void __43__PXGMetalTextureAtlas_cleanupAfterRender___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 208);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 208);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, v5);

  objc_msgSend(*(id *)(a1 + 32), "_syncQueue_releaseThumbnailsAtIndexes:", v6);
}

- (void)_syncQueue_releaseThumbnailsAtIndexes:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__PXGMetalTextureAtlas__syncQueue_releaseThumbnailsAtIndexes___block_invoke;
  v3[3] = &unk_1E5140880;
  v3[4] = self;
  objc_msgSend(a3, "enumerateRangesUsingBlock:", v3);
}

- (void)processPendingThumbnailRequestIDsWithHandler:(id)a3
{
  id v5;
  NSObject *syncQueue;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_layoutQueue);
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__PXGMetalTextureAtlas_processPendingThumbnailRequestIDsWithHandler___block_invoke;
  block[3] = &unk_1E5148F60;
  block[4] = self;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  dispatch_sync(syncQueue, block);

}

- (BOOL)isCaptureTexture
{
  return 0;
}

uint64_t __62__PXGMetalTextureAtlas__syncQueue_releaseThumbnailsAtIndexes___block_invoke(uint64_t result, unint64_t a2, uint64_t a3)
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
      result = objc_msgSend(*(id *)(v11 + 32), "_syncQueue_releaseThumbnailAtIndex:", v10++, v12, v13, v14, v15, v16, v17);
      --v9;
    }
    while (v9);
  }
  return result;
}

- (void)_syncQueue_releaseThumbnailAtIndex:(int64_t)a3
{
  signed __int16 *p_count;
  int v5;
  NSObject *layoutQueue;
  _QWORD v7[4];
  id v8;
  id location;

  if (!--self->_retainCountByThumbnailIndex[a3])
  {
    -[NSMutableIndexSet addIndex:](self->_syncQueue_availableThumbnailIndexes, "addIndex:");
    p_count = &self->_count;
    do
      v5 = __ldaxr((unsigned __int16 *)p_count);
    while (__stlxr(v5 - 1, (unsigned __int16 *)p_count));
    if (v5 == 1)
    {
      objc_initWeak(&location, self);
      layoutQueue = self->_layoutQueue;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __59__PXGMetalTextureAtlas__syncQueue_releaseThumbnailAtIndex___block_invoke;
      v7[3] = &unk_1E5148D30;
      objc_copyWeak(&v8, &location);
      dispatch_async(layoutQueue, v7);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

- (void)cleanupAfterRender:(int64_t)a3
{
  NSObject *syncQueue;
  _QWORD block[7];

  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PXGMetalTextureAtlas_cleanupAfterRender___block_invoke;
  block[3] = &unk_1E5149060;
  block[4] = self;
  block[5] = a3;
  block[6] = a2;
  dispatch_async(syncQueue, block);
}

- (BOOL)isUnused
{
  int v2;

  v2 = atomic_load((unsigned __int16 *)&self->_count);
  return v2 == 0;
}

- (unsigned)count
{
  return (__int16)atomic_load((unsigned __int16 *)&self->_count);
}

- (unsigned)capacity
{
  return self->_capacity;
}

double __98__PXGMetalTextureAtlas_addSpriteWithTextureRequestID_thumbnailData_size_bytesPerRow_contentsRect___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  unsigned int v7;
  double result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 224);
  *(_QWORD *)(v2 + 224) = v3 + 1;
  objc_msgSend(*(id *)(a1 + 32), "_syncQueue_resizeStorageIfNeeded");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216) + 20 * v3;
  v5 = *(_DWORD *)(a1 + 56);
  v6 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  do
    v7 = __ldaxr((unsigned int *)&PXGMakeNextTextureDeliveryOrderID::lastRequestID);
  while (__stlxr(v7 + 1, (unsigned int *)&PXGMakeNextTextureDeliveryOrderID::lastRequestID));
  result = *(double *)(a1 + 48);
  *(_DWORD *)v4 = v5;
  *(_DWORD *)(v4 + 4) = v6;
  *(_DWORD *)(v4 + 8) = v7;
  *(double *)(v4 + 12) = result;
  return result;
}

- (void)_syncQueue_resizeStorageIfNeeded
{
  unint64_t syncQueue_pendingThumbnailRequestInfoCount;
  unint64_t syncQueue_pendingThumbnailRequestInfoCapacity;
  BOOL v4;

  syncQueue_pendingThumbnailRequestInfoCount = self->_syncQueue_pendingThumbnailRequestInfoCount;
  syncQueue_pendingThumbnailRequestInfoCapacity = self->_syncQueue_pendingThumbnailRequestInfoCapacity;
  if (syncQueue_pendingThumbnailRequestInfoCount > syncQueue_pendingThumbnailRequestInfoCapacity)
  {
    if (!syncQueue_pendingThumbnailRequestInfoCapacity)
    {
      syncQueue_pendingThumbnailRequestInfoCapacity = 10;
      self->_syncQueue_pendingThumbnailRequestInfoCapacity = 10;
      syncQueue_pendingThumbnailRequestInfoCount = self->_syncQueue_pendingThumbnailRequestInfoCount;
    }
    if (syncQueue_pendingThumbnailRequestInfoCount > syncQueue_pendingThumbnailRequestInfoCapacity)
    {
      do
      {
        self->_syncQueue_pendingThumbnailRequestInfoCapacity = 2 * syncQueue_pendingThumbnailRequestInfoCapacity;
        v4 = self->_syncQueue_pendingThumbnailRequestInfoCount > 2 * syncQueue_pendingThumbnailRequestInfoCapacity;
        syncQueue_pendingThumbnailRequestInfoCapacity *= 2;
      }
      while (v4);
    }
    _PXGArrayResize();
  }
}

- (void)addSpriteWithTextureRequestID:(int)a3 thumbnailData:(id)a4 size:(CGSize)a5 bytesPerRow:(unint64_t)a6 contentsRect:(CGRect)a7
{
  double y;
  double x;
  double v9;
  double v10;
  id v12;
  float v13;
  float v14;
  NSObject *syncQueue;
  double v16;
  double v17;
  uint64_t v18;
  int64_t cols;
  unint64_t v20;
  unint64_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float v24;
  float32x2_t v25;
  float32x2_t v26;
  __int128 v27;
  $3BA783FF50B239963188BE194EBFFEBA *v28;
  float v29;
  int64_t v30;
  uint64_t v31;
  PXGMetalRenderContext *metalRenderContext;
  id v33;
  uint64_t v34;
  MTLTexture *texture;
  uint64_t v36;
  int64x2_t v37;
  NSObject *v38;
  CGFloat height;
  CGFloat width;
  CGSize thumbnailSize;
  _QWORD v44[7];
  int v45;
  uint64x2_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  _QWORD block[6];
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  int v55;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v9 = a5.height;
  v10 = a5.width;
  v12 = a4;
  -[PXGMetalTextureAtlas thumbnailCropIn](self, "thumbnailCropIn");
  v14 = v13;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 0;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__PXGMetalTextureAtlas_addSpriteWithTextureRequestID_thumbnailData_size_bytesPerRow_contentsRect___block_invoke;
  block[3] = &unk_1E5148AA8;
  block[4] = self;
  block[5] = &v52;
  dispatch_sync(syncQueue, block);
  v16 = self->_thumbnailSize.width;
  v17 = self->_thumbnailSize.height;
  v18 = *((unsigned int *)v53 + 6);
  cols = self->_cols;
  v20 = -[MTLTexture width](self->_texture, "width");
  v21 = -[MTLTexture height](self->_texture, "height");
  -[PXGMetalTextureAtlas alpha](self, "alpha");
  v22.f64[0] = width;
  v22.f64[1] = height;
  v23 = vsubq_f64(v22, (float64x2_t)vdupq_lane_s64(COERCE__INT64((float)(v14 + v14)), 0));
  *(float *)v22.f64 = v16;
  v24 = v17;
  *(float *)v22.f64 = *(float *)v22.f64 * (float)(v18 % cols);
  *((float *)v22.f64 + 1) = v24 * (float)(v18 / cols);
  v25 = vcvt_f32_f64(v23);
  v26.f32[0] = x + v14;
  *(float *)v23.f64 = y + v14;
  v26.i32[1] = LODWORD(v23.f64[0]);
  *(float32x2_t *)&v23.f64[0] = vadd_f32(v26, *(float32x2_t *)&v22.f64[0]);
  v27 = *(_OWORD *)off_1E50B83E0;
  v26.f32[0] = (float)v20;
  v26.f32[1] = (float)v21;
  v28 = &self->_guarded_textureInfoByThumbnailIndex[16 * (unint64_t)*((unsigned int *)v53 + 6)];
  *(float64_t *)&v28->var0 = v23.f64[0];
  *(float32x2_t *)&v28[2].var0 = v25;
  *(float32x2_t *)&v28[4].var0 = v26;
  *(_QWORD *)&v28[6].var0 = 0;
  *(_OWORD *)&v28[8].var0 = v27;
  v28[12].var0 = v29;
  *(_QWORD *)&v28[13].var0 = 0;
  v28[15].var0 = 0.0;
  v30 = self->_cols;
  v31 = *((unsigned int *)v53 + 6);
  thumbnailSize = self->_thumbnailSize;
  metalRenderContext = self->_metalRenderContext;
  v33 = objc_retainAutorelease(v12);
  v34 = objc_msgSend(v33, "bytes");
  texture = self->_texture;
  v36 = objc_msgSend(v33, "length");
  v37.i64[0] = v31 % v30;
  v37.i64[1] = v31 / v30;
  v46 = vcvtq_u64_f64(vmulq_f64((float64x2_t)thumbnailSize, vcvtq_f64_s64(v37)));
  v47 = 0;
  v48 = (unint64_t)v10;
  v49 = (unint64_t)v9;
  v50 = 1;
  -[PXGMetalRenderContext fastCopyBytes:toTexture:inRegion:length:bytesPerRow:bytesPerImage:](metalRenderContext, "fastCopyBytes:toTexture:inRegion:length:bytesPerRow:bytesPerImage:", v34, texture, &v46, v36, a6, 0);
  v38 = self->_syncQueue;
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __98__PXGMetalTextureAtlas_addSpriteWithTextureRequestID_thumbnailData_size_bytesPerRow_contentsRect___block_invoke_2;
  v44[3] = &unk_1E5135790;
  v45 = a3;
  v44[4] = self;
  v44[5] = &v52;
  v44[6] = v25;
  dispatch_sync(v38, v44);
  _Block_object_dispose(&v52, 8);

}

- (float)alpha
{
  return 1.0;
}

- (float)thumbnailCropIn
{
  return self->_thumbnailCropIn;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXGMetalTextureAtlas)initWithThumbnailSize:(CGSize)a3 pixelFormat:(unint64_t)a4 capacity:(unsigned int)a5 mipmapped:(BOOL)a6 colorProgram:(id)a7 context:(id)a8 layoutQueue:(id)a9
{
  _BOOL4 v12;
  double height;
  double width;
  id v19;
  id v20;
  PXGMetalTextureAtlas *v21;
  void *v22;
  double v23;
  double v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *syncQueue;
  NSMutableDictionary *v27;
  NSMutableDictionary *syncQueue_thumbnailsInUseByRenderPass;
  double v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  MTLTexture *texture;
  uint64_t v35;
  uint64_t v36;
  NSMutableIndexSet *thumbnailIndexesUsedBySprites;
  uint64_t v38;
  NSMutableIndexSet *spriteIndexesUsedBySprites;
  uint64_t v40;
  NSMutableIndexSet *dirtySpriteIndexes;
  uint64_t v42;
  NSIndexSet *skipRenderSpriteIndexes;
  uint64_t v44;
  NSMutableIndexSet *thumbnailIndexesPendingCheckin;
  uint64_t v46;
  NSMutableIndexSet *thumbnailIndexesBeingCheckedIn;
  uint64_t v48;
  NSMutableIndexSet *syncQueue_availableThumbnailIndexes;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  objc_super v59;
  CGSize v60;

  v12 = a6;
  height = a3.height;
  width = a3.width;
  v19 = a7;
  v20 = a8;
  v58 = a9;
  v59.receiver = self;
  v59.super_class = (Class)PXGMetalTextureAtlas;
  v21 = -[PXGImageTexture init](&v59, sel_init);
  if (v21)
  {
    v57 = v19;
    if (!a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, v21, CFSTR("PXGMetalTextureAtlasManager.m"), 297, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("capacity > 0"));

    }
    objc_msgSend(v20, "device");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, v21, CFSTR("PXGMetalTextureAtlasManager.m"), 298, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context.device != nil"));

    }
    if (width > 4096.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, v21, CFSTR("PXGMetalTextureAtlasManager.m"), 299, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("thumbnailSize.width <= kMaxTextureWidth"));

    }
    if (height > 4096.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", a2, v21, CFSTR("PXGMetalTextureAtlasManager.m"), 300, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("thumbnailSize.height <= kMaxTextureHeight"));

    }
    PXSizeRoundToPixel();
    if (v24 != width || v23 != height)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v60.width = width;
      v60.height = height;
      NSStringFromCGSize(v60);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", a2, v21, CFSTR("PXGMetalTextureAtlasManager.m"), 301, CFSTR("thumbnailSize cannot have fractional pixels:%@"), v56);

    }
    objc_storeStrong((id *)&v21->_layoutQueue, a9);
    objc_storeStrong((id *)&v21->_metalRenderContext, a8);
    objc_storeStrong((id *)&v21->_colorProgram, a7);
    v21->_capacity = a5;
    v21->_mipmapped = v12;
    v21->_pixelFormat = a4;
    v21->_thumbnailSize.width = width;
    v21->_thumbnailSize.height = height;
    v21->_thumbnailCropIn = 0.5;
    v25 = dispatch_queue_create("com.apple.photos.atlas-texture.sync", 0);
    syncQueue = v21->_syncQueue;
    v21->_syncQueue = (OS_dispatch_queue *)v25;

    v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    syncQueue_thumbnailsInUseByRenderPass = v21->_syncQueue_thumbnailsInUseByRenderPass;
    v21->_syncQueue_thumbnailsInUseByRenderPass = v27;

    v29 = 4096.0 / width;
    if (4096.0 / width > (double)a5)
      v29 = (double)a5;
    v30 = (uint64_t)v29;
    objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", a4, (uint64_t)(width * (double)(uint64_t)v29), (uint64_t)(height * (double)(uint64_t)ceil((double)a5 / (double)(uint64_t)v29)), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v20, "device");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "newTextureWithDescriptor:", v31);
      texture = v21->_texture;
      v21->_texture = (MTLTexture *)v33;

    }
    else
    {
      v35 = objc_msgSend(v20, "newTextureWithDescriptor:", v31);
      v32 = v21->_texture;
      v21->_texture = (MTLTexture *)v35;
    }

    v21->_cols = v30;
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v36 = objc_claimAutoreleasedReturnValue();
    thumbnailIndexesUsedBySprites = v21->_thumbnailIndexesUsedBySprites;
    v21->_thumbnailIndexesUsedBySprites = (NSMutableIndexSet *)v36;

    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v38 = objc_claimAutoreleasedReturnValue();
    spriteIndexesUsedBySprites = v21->_spriteIndexesUsedBySprites;
    v21->_spriteIndexesUsedBySprites = (NSMutableIndexSet *)v38;

    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v40 = objc_claimAutoreleasedReturnValue();
    dirtySpriteIndexes = v21->_dirtySpriteIndexes;
    v21->_dirtySpriteIndexes = (NSMutableIndexSet *)v40;

    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v42 = objc_claimAutoreleasedReturnValue();
    skipRenderSpriteIndexes = v21->_skipRenderSpriteIndexes;
    v21->_skipRenderSpriteIndexes = (NSIndexSet *)v42;

    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v44 = objc_claimAutoreleasedReturnValue();
    thumbnailIndexesPendingCheckin = v21->_thumbnailIndexesPendingCheckin;
    v21->_thumbnailIndexesPendingCheckin = (NSMutableIndexSet *)v44;

    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v46 = objc_claimAutoreleasedReturnValue();
    thumbnailIndexesBeingCheckedIn = v21->_thumbnailIndexesBeingCheckedIn;
    v21->_thumbnailIndexesBeingCheckedIn = (NSMutableIndexSet *)v46;

    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v48 = objc_claimAutoreleasedReturnValue();
    syncQueue_availableThumbnailIndexes = v21->_syncQueue_availableThumbnailIndexes;
    v21->_syncQueue_availableThumbnailIndexes = (NSMutableIndexSet *)v48;

    -[NSMutableIndexSet addIndexesInRange:](v21->_syncQueue_availableThumbnailIndexes, "addIndexesInRange:", 0, a5);
    _PXGArrayResize();
    _PXGArrayResize();
    _PXGArrayResize();
    bzero(v21->_retainCountByThumbnailIndex, a5);

    v19 = v57;
  }

  return v21;
}

+ (unsigned)maxCapacityForThumbnailSize:(CGSize)a3 pixelFormat:(unint64_t)a4
{
  double height;
  double width;
  double v8;
  double v9;
  void *v12;
  void *v13;
  CGSize v14;

  height = a3.height;
  width = a3.width;
  PXSizeRoundToPixel();
  if (v9 != width || v8 != height)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14.width = width;
    v14.height = height;
    NSStringFromCGSize(v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXGMetalTextureAtlasManager.m"), 287, CFSTR("thumbnailSize cannot have fractional pixels:%@"), v13);

  }
  return (uint64_t)(4096.0 / width) * (uint64_t)(4096.0 / height);
}

uint64_t __61__PXGMetalTextureAtlas__syncQueue_retainThumbnailsAtIndexes___block_invoke(uint64_t result, unint64_t a2, uint64_t a3)
{
  if (a2 < a2 + a3)
  {
    do
    {
      ++*(_BYTE *)(*(_QWORD *)(result + 32) + a2++);
      --a3;
    }
    while (a3);
  }
  return result;
}

- (void)prepareForRender:(int64_t)a3
{
  void *v6;
  NSObject *syncQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  int64_t v11;
  SEL v12;

  -[PXGMetalTextureAtlas thumbnailIndexesUsedBySprites](self, "thumbnailIndexesUsedBySprites");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  syncQueue = self->_syncQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__PXGMetalTextureAtlas_prepareForRender___block_invoke;
  v9[3] = &unk_1E5144B50;
  v11 = a3;
  v12 = a2;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(syncQueue, v9);

}

- (NSIndexSet)thumbnailIndexesUsedBySprites
{
  return (NSIndexSet *)(id)-[NSMutableIndexSet copy](self->_thumbnailIndexesUsedBySprites, "copy");
}

uint64_t __69__PXGMetalTextureAtlas_processPendingThumbnailRequestIDsWithHandler___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  id *v8;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(v1 + 224);
  if (v2 >= 1)
  {
    v3 = result;
    v4 = 0;
    do
    {
      v5 = *(_QWORD *)(*(_QWORD *)(v3 + 32) + 216) + v4;
      v6 = *(unsigned int *)(v5 + 4);
      v7 = (*(uint64_t (**)(double))(*(_QWORD *)(v3 + 40) + 16))(*(double *)(v5 + 12));
      v8 = *(id **)(v3 + 32);
      if (v7 == -1)
      {
        objc_msgSend(v8, "_syncQueue_checkinThumbnailIndex:", v6);
      }
      else
      {
        objc_msgSend(v8[15], "addIndex:", v7);
        objc_msgSend(*(id *)(*(_QWORD *)(v3 + 32) + 128), "addIndex:", v7);
        objc_msgSend(*(id *)(*(_QWORD *)(v3 + 32) + 112), "addIndex:", v6);
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 136) + 4 * v6) = v7;
      }
      v4 += 20;
      --v2;
    }
    while (v2);
    result = objc_msgSend(*(id *)(v3 + 32), "_invalidateRenderedSpriteIndexes");
    v1 = *(_QWORD *)(v3 + 32);
  }
  *(_QWORD *)(v1 + 224) = 0;
  return result;
}

- (void)_syncQueue_retainThumbnailsAtIndexes:(id)a3
{
  char *retainCountByThumbnailIndex;
  _QWORD v4[5];

  retainCountByThumbnailIndex = self->_retainCountByThumbnailIndex;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__PXGMetalTextureAtlas__syncQueue_retainThumbnailsAtIndexes___block_invoke;
  v4[3] = &__block_descriptor_40_e24_v32__0__NSRange_QQ_8_B24l;
  v4[4] = retainCountByThumbnailIndex;
  objc_msgSend(a3, "enumerateRangesUsingBlock:", v4);
}

uint64_t __111__PXGMetalTextureAtlas_getTextureInfos_forSpriteIndexes_geometries_spriteStyles_spriteInfos_screenScale_count___block_invoke(uint64_t result, unint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  _OWORD *v8;
  __int128 *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  if (a2 < a2 + a3)
  {
    v4 = *(_QWORD *)(result + 32);
    v5 = a2 << 6;
    for (i = 4 * a2; ; i += 4)
    {
      v7 = *(_QWORD *)(*(_QWORD *)(v4 + 8) + 24);
      if (*(_DWORD *)(*(_QWORD *)(result + 48) + i) == *(_DWORD *)(*(_QWORD *)(result + 40) + 4 * v7))
      {
        v8 = (_OWORD *)(*(_QWORD *)(result + 56) + (v7 << 6));
        v9 = (__int128 *)(*(_QWORD *)(result + 64) + v5);
        v10 = *v9;
        v11 = v9[1];
        v12 = v9[3];
        v8[2] = v9[2];
        v8[3] = v12;
        *v8 = v10;
        v8[1] = v11;
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
        v4 = *(_QWORD *)(result + 32);
        if (*(_QWORD *)(*(_QWORD *)(v4 + 8) + 24) == *(_DWORD *)(result + 72))
          break;
      }
      v5 += 64;
      if (!--a3)
        return result;
    }
    *a4 = 1;
  }
  return result;
}

uint64_t __98__PXGMetalTextureAtlas_addSpriteWithTextureRequestID_thumbnailData_size_bytesPerRow_contentsRect___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_syncQueue_checkoutNextThumbnailIndex");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unsigned)_syncQueue_checkoutNextThumbnailIndex
{
  signed __int16 *p_count;
  unsigned __int16 v4;
  unsigned int v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  p_count = &self->_count;
  do
    v4 = __ldaxr((unsigned __int16 *)p_count);
  while (__stlxr(v4 + 1, (unsigned __int16 *)p_count));
  v5 = -[NSMutableIndexSet firstIndex](self->_syncQueue_availableThumbnailIndexes, "firstIndex");
  -[NSMutableIndexSet removeIndex:](self->_syncQueue_availableThumbnailIndexes, "removeIndex:", v5);
  -[PXGMetalTextureAtlas _syncQueue_retainThumbnailAtIndex:](self, "_syncQueue_retainThumbnailAtIndex:", v5);
  return v5;
}

- (void)_syncQueue_retainThumbnailAtIndex:(int64_t)a3
{
  ++self->_retainCountByThumbnailIndex[a3];
}

uint64_t __56__PXGMetalTextureAtlas_getSpriteIndexes_maxSpriteCount___block_invoke(uint64_t result, unint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  if (a2 < a2 + a3)
  {
    v17 = v9;
    v18 = v8;
    v19 = v7;
    v20 = v6;
    v21 = v5;
    v22 = v4;
    v23 = v10;
    v24 = v11;
    v13 = a3;
    v14 = result;
    for (i = 4 * a2; ; i += 4)
    {
      v16 = *(_DWORD *)(*(_QWORD *)(v14 + 48) + i);
      result = objc_msgSend(*(id *)(v14 + 32), "containsIndex:", v16, v17, v18, v19, v20, v21, v22, v23, v24);
      if ((_DWORD)result)
      {
        *(_DWORD *)(*(_QWORD *)(v14 + 56) + 4 * (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v14 + 40) + 8) + 24))++) = v16;
        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v14 + 40) + 8) + 24) == *(_DWORD *)(v14 + 64))
          break;
      }
      if (!--v13)
        return result;
    }
    *a4 = 1;
  }
  return result;
}

- (PXGMetalTextureAtlas)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGMetalTextureAtlasManager.m"), 358, CFSTR("%s is not available as initializer"), "-[PXGMetalTextureAtlas init]");

  abort();
}

- (void)dealloc
{
  objc_super v3;

  free(self->_spriteIndexByThumbnailIndex);
  free(self->_retainCountByThumbnailIndex);
  free(self->_guarded_textureInfoByThumbnailIndex);
  free(self->_syncQueue_pendingThumbnailRequestInfo);
  v3.receiver = self;
  v3.super_class = (Class)PXGMetalTextureAtlas;
  -[PXGImageTexture dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_super v15;
  CGSize v16;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v15.receiver = self;
  v15.super_class = (Class)PXGMetalTextureAtlas;
  -[PXGBaseTexture description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGMetalTextureAtlas thumbnailSize](self, "thumbnailSize");
  NSStringFromCGSize(v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXGMetalTextureAtlas pixelFormat](self, "pixelFormat");
  v7 = -[PXGMetalTextureAtlas capacity](self, "capacity");
  v8 = -[PXGMetalTextureAtlas count](self, "count");
  v9 = -[NSMutableIndexSet count](self->_thumbnailIndexesUsedBySprites, "count");
  v10 = -[PXGMetalTextureAtlas count](self, "count");
  v11 = v10 - -[PXGMetalTextureAtlas spriteCount](self, "spriteCount");
  -[PXGMetalTextureAtlas texture](self, "texture");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ thumbnailSize:%@ pixelFormat:%lu capacity:%d count:%d usedBySprites:%lu justRetained:%lu memory:%.2fMB>"), v4, v5, v6, v7, v8, v9, v11, (double)(unint64_t)objc_msgSend(v12, "allocatedSize") * 0.0009765625 * 0.0009765625);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (id)getAndClearDirtySpriteIndexesIntersectingSet:(id)a3
{
  NSObject *layoutQueue;
  id v5;
  void *v6;

  layoutQueue = self->_layoutQueue;
  v5 = a3;
  dispatch_assert_queue_V2(layoutQueue);
  -[NSMutableIndexSet px_intersectionWithIndexSet:](self->_dirtySpriteIndexes, "px_intersectionWithIndexSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableIndexSet removeIndexes:](self->_dirtySpriteIndexes, "removeIndexes:", v6);
  return v6;
}

- (void)removeSpriteIndex:(unsigned int)a3 atThumbnailIndex:(unsigned int)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_layoutQueue);
  -[NSMutableIndexSet removeIndex:](self->_spriteIndexesUsedBySprites, "removeIndex:", a3);
  -[NSMutableIndexSet removeIndex:](self->_dirtySpriteIndexes, "removeIndex:", a3);
  -[NSMutableIndexSet removeIndex:](self->_thumbnailIndexesUsedBySprites, "removeIndex:", a4);
  -[PXGMetalTextureAtlas _invalidateRenderedSpriteIndexes](self, "_invalidateRenderedSpriteIndexes");
  -[NSMutableIndexSet addIndex:](self->_thumbnailIndexesPendingCheckin, "addIndex:", a4);
  -[PXGMetalTextureAtlas _checkinPendingThumbnailIndexesIfNeeded](self, "_checkinPendingThumbnailIndexesIfNeeded");
}

- (void)_checkinPendingThumbnailIndexesIfNeeded
{
  unsigned __int8 *p_isPerformingThumbnailCheckin;
  int v4;
  NSMutableIndexSet *v5;
  NSMutableIndexSet *thumbnailIndexesPendingCheckin;
  NSMutableIndexSet *v7;
  NSObject *syncQueue;
  _QWORD block[5];

  if (-[NSMutableIndexSet count](self->_thumbnailIndexesPendingCheckin, "count"))
  {
    p_isPerformingThumbnailCheckin = &self->_isPerformingThumbnailCheckin;
    do
      v4 = __ldaxr(p_isPerformingThumbnailCheckin);
    while (__stlxr(v4 | 1, p_isPerformingThumbnailCheckin));
    if (!v4)
    {
      v5 = self->_thumbnailIndexesBeingCheckedIn;
      objc_storeStrong((id *)&self->_thumbnailIndexesBeingCheckedIn, self->_thumbnailIndexesPendingCheckin);
      thumbnailIndexesPendingCheckin = self->_thumbnailIndexesPendingCheckin;
      self->_thumbnailIndexesPendingCheckin = v5;
      v7 = v5;

      syncQueue = self->_syncQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __63__PXGMetalTextureAtlas__checkinPendingThumbnailIndexesIfNeeded__block_invoke;
      block[3] = &unk_1E5149198;
      block[4] = self;
      dispatch_async(syncQueue, block);

    }
  }
}

- (void)applyChangeDetails:(id)a3
{
  NSObject *layoutQueue;
  id v5;
  void *v6;
  NSMutableIndexSet *v7;
  NSMutableIndexSet *spriteIndexesUsedBySprites;
  void *v9;
  NSMutableIndexSet *v10;
  NSMutableIndexSet *dirtySpriteIndexes;
  void *v12;

  layoutQueue = self->_layoutQueue;
  v5 = a3;
  dispatch_assert_queue_V2(layoutQueue);
  objc_msgSend(v5, "applyToSpriteIndexes:atIndexes:", self->_spriteIndexByThumbnailIndex, self->_thumbnailIndexesUsedBySprites);
  objc_msgSend(v5, "indexSetAfterApplyingChangeDetails:", self->_spriteIndexesUsedBySprites);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (NSMutableIndexSet *)objc_msgSend(v6, "mutableCopy");
  spriteIndexesUsedBySprites = self->_spriteIndexesUsedBySprites;
  self->_spriteIndexesUsedBySprites = v7;

  objc_msgSend(v5, "indexSetAfterApplyingChangeDetails:", self->_dirtySpriteIndexes);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (NSMutableIndexSet *)objc_msgSend(v9, "mutableCopy");
  dirtySpriteIndexes = self->_dirtySpriteIndexes;
  self->_dirtySpriteIndexes = v10;

  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGMetalTextureAtlas setSkipRenderSpriteIndexes:](self, "setSkipRenderSpriteIndexes:", v12);

  -[PXGMetalTextureAtlas _invalidateRenderedSpriteIndexes](self, "_invalidateRenderedSpriteIndexes");
}

- (void)enumerateSpriteIndexes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[PXGMetalTextureAtlas renderedSpriteIndexes](self, "renderedSpriteIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__PXGMetalTextureAtlas_enumerateSpriteIndexes___block_invoke;
  v7[3] = &unk_1E5135800;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v7);

}

- (BOOL)containsSpriteIndex:(unsigned int)a3
{
  void *v4;

  -[PXGMetalTextureAtlas renderedSpriteIndexes](self, "renderedSpriteIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "containsIndex:", a3);

  return a3;
}

- (void)addSpriteWithTextureRequestID:(int)a3 deliveryOrder:(unsigned int)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", *(_QWORD *)&a3, *(_QWORD *)&a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGMetalTextureAtlasManager.m"), 655, CFSTR("%@ is not available on %@, use the thumbnail variant"), v7, self);

  abort();
}

- (void)processPendingTextureRequestIDsWithHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGMetalTextureAtlasManager.m"), 659, CFSTR("%@ is not available on %@, use the thumbnail variant"), v7, self);

  abort();
}

- (void)removeSpriteIndex:(unsigned int)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", *(_QWORD *)&a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGMetalTextureAtlasManager.m"), 663, CFSTR("%@ is not available on %@, use the thumbnail variant"), v6, self);

  abort();
}

- (int64_t)estimatedByteSize
{
  return -[MTLTexture allocatedSize](self->_texture, "allocatedSize");
}

- (unsigned)presentationType
{
  return 0;
}

- (CGImage)imageRepresentation
{
  return 0;
}

- (CGSize)pixelSize
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  v3 = (double)(unint64_t)-[MTLTexture width](self->_texture, "width");
  v4 = (double)(unint64_t)-[MTLTexture height](self->_texture, "height");
  v5 = v3;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)_syncQueue_checkinThumbnailIndex:(unsigned int)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  -[PXGMetalTextureAtlas _syncQueue_releaseThumbnailAtIndex:](self, "_syncQueue_releaseThumbnailAtIndex:", a3);
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
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

- (BOOL)mipmapped
{
  return self->_mipmapped;
}

- (BOOL)mipmapsDirty
{
  return self->_mipmapsDirty;
}

- (void)setMipmapsDirty:(BOOL)a3
{
  self->_mipmapsDirty = a3;
}

- (PXGMetalTextureAtlasDelegate)delegate
{
  return (PXGMetalTextureAtlasDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_skipRenderSpriteIndexes, 0);
  objc_storeStrong((id *)&self->_colorProgram, 0);
  objc_storeStrong((id *)&self->_texture, 0);
  objc_storeStrong((id *)&self->_syncQueue_thumbnailsInUseByRenderPass, 0);
  objc_storeStrong((id *)&self->_syncQueue_availableThumbnailIndexes, 0);
  objc_storeStrong((id *)&self->_thumbnailIndexesBeingCheckedIn, 0);
  objc_storeStrong((id *)&self->_thumbnailIndexesPendingCheckin, 0);
  objc_storeStrong((id *)&self->_renderedSpriteIndexes, 0);
  objc_storeStrong((id *)&self->_dirtySpriteIndexes, 0);
  objc_storeStrong((id *)&self->_spriteIndexesUsedBySprites, 0);
  objc_storeStrong((id *)&self->_thumbnailIndexesUsedBySprites, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_layoutQueue, 0);
  objc_storeStrong((id *)&self->_metalRenderContext, 0);
}

uint64_t __47__PXGMetalTextureAtlas_enumerateSpriteIndexes___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59__PXGMetalTextureAtlas__syncQueue_releaseThumbnailAtIndex___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  int v3;
  void *v4;
  id v5;
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "isUnused");

  if (v3)
  {
    v6 = objc_loadWeakRetained(v1);
    objc_msgSend(v6, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_loadWeakRetained(v1);
    objc_msgSend(v4, "textureAtlasDidBecomeUnused:", v5);

  }
}

void __63__PXGMetalTextureAtlas__checkinPendingThumbnailIndexesIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  dispatch_time_t v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 168);
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__PXGMetalTextureAtlas__checkinPendingThumbnailIndexesIfNeeded__block_invoke_2;
  v9[3] = &unk_1E5148928;
  v9[4] = v2;
  objc_msgSend(v3, "enumerateIndexesUsingBlock:", v9);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "removeAllIndexes");
  v5 = dispatch_time(0, 5000000);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 96);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __63__PXGMetalTextureAtlas__checkinPendingThumbnailIndexesIfNeeded__block_invoke_3;
  v8[3] = &unk_1E5149198;
  v8[4] = v6;
  dispatch_after(v5, v7, v8);
}

uint64_t __63__PXGMetalTextureAtlas__checkinPendingThumbnailIndexesIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_syncQueue_checkinThumbnailIndex:", a2);
}

void __63__PXGMetalTextureAtlas__checkinPendingThumbnailIndexesIfNeeded__block_invoke_3(uint64_t a1)
{
  unsigned __int8 *v1;
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  v1 = (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 176);
  do
    __ldaxr(v1);
  while (__stlxr(0, v1));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 88);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PXGMetalTextureAtlas__checkinPendingThumbnailIndexesIfNeeded__block_invoke_4;
  block[3] = &unk_1E5149198;
  block[4] = v2;
  dispatch_async(v3, block);
}

uint64_t __63__PXGMetalTextureAtlas__checkinPendingThumbnailIndexesIfNeeded__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkinPendingThumbnailIndexesIfNeeded");
}

@end
