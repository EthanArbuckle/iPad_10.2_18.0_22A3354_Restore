@implementation PVInstructionGraphImageSourceNode

+ (void)purgeBitmapCache:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  objc_msgSend((id)sInputBitmapCacheLock, "lock");
  objc_msgSend((id)sInputBitmapCache, "purge:", v3);
  objc_msgSend((id)sInputBitmapCacheLock, "unlock");
  if (v3)
    objc_msgSend((id)sPixelBufferCache, "removeAllObjects");
}

- (void)enableHDRGainMap:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  LOBYTE(self->m_renderManager.m_Obj) = a3;
  if (a3)
  {
    -[PVInstructionGraphImageSourceNode key](self, "key");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingString:", CFSTR("_gainmap"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(void **)&self->_useHDRGainMap;
    *(_QWORD *)&self->_useHDRGainMap = v4;

  }
}

- (void)setHDRGainMapHeadroom:(float)a3
{
  double v3;
  float v4;

  v3 = a3;
  if (v3 < 0.0)
    v3 = 0.0;
  if (v3 >= 8.0)
    v3 = 8.0;
  v4 = v3;
  *((float *)&self->m_renderManager.m_Obj + 1) = v4;
}

- (PVInstructionGraphImageSourceNode)initWithURL:(id)a3 key:(id)a4 transform:(CGAffineTransform *)a5 isExporting:(BOOL)a6 imageDelegate:(id)a7 renderingIntent:(int)a8
{
  __int128 v8;
  uint64_t v10;
  _OWORD v11[3];

  v8 = *(_OWORD *)&a5->c;
  v11[0] = *(_OWORD *)&a5->a;
  v11[1] = v8;
  v11[2] = *(_OWORD *)&a5->tx;
  LODWORD(v10) = 1;
  return -[PVInstructionGraphImageSourceNode initWithURL:key:transform:isExporting:imageDelegate:renderingIntent:fillMode:](self, "initWithURL:key:transform:isExporting:imageDelegate:renderingIntent:fillMode:", a3, a4, v11, a6, a7, *(_QWORD *)&a8, v10);
}

- (PVInstructionGraphImageSourceNode)initWithURL:(id)a3 key:(id)a4 transform:(CGAffineTransform *)a5 isExporting:(BOOL)a6 imageDelegate:(id)a7 renderingIntent:(int)a8 fillMode:(int)a9
{
  uint64_t v9;
  id v15;
  id v16;
  id v17;
  PVInstructionGraphImageSourceNode *v18;
  PVInstructionGraphImageSourceNode *v19;
  __int128 v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  PVRenderManager *v25;
  HGSynchronizable *lock;
  HGSynchronizable *v27;
  HGSynchronizable *v29;
  _OWORD v30[3];
  objc_super v31;

  v9 = *(_QWORD *)&a8;
  v15 = a3;
  v16 = a4;
  v17 = a7;
  v31.receiver = self;
  v31.super_class = (Class)PVInstructionGraphImageSourceNode;
  v18 = -[PVInstructionGraphSourceNode init](&v31, sel_init);
  v19 = v18;
  if (!v18)
    goto LABEL_18;
  -[PVInstructionGraphImageSourceNode setUrl:](v18, "setUrl:", v15);
  -[PVInstructionGraphImageSourceNode setKey:](v19, "setKey:", v16);
  v20 = *(_OWORD *)&a5->c;
  v30[0] = *(_OWORD *)&a5->a;
  v30[1] = v20;
  v30[2] = *(_OWORD *)&a5->tx;
  -[PVInstructionGraphSourceNode setTransform:](v19, "setTransform:", v30);
  -[PVInstructionGraphImageSourceNode setImageDelegate:](v19, "setImageDelegate:", v17);
  -[PVInstructionGraphImageSourceNode setRenderingIntent:](v19, "setRenderingIntent:", v9);
  -[PVInstructionGraphImageSourceNode setUseAnimationInfo:](v19, "setUseAnimationInfo:", 0);
  -[PVInstructionGraphSourceNode setIsOverlayTrack:](v19, "setIsOverlayTrack:", 0);
  -[PVInstructionGraphImageSourceNode setFillMode:](v19, "setFillMode:", a9);
  LOBYTE(v19->m_renderManager.m_Obj) = 0;
  HIDWORD(v19->m_renderManager.m_Obj) = 1067576197;
  v21 = *(void **)&v19->_useHDRGainMap;
  *(_QWORD *)&v19->_useHDRGainMap = 0;

  if (-[PVInstructionGraphImageSourceNode initWithURL:key:transform:isExporting:imageDelegate:renderingIntent:fillMode:]::once != -1)
  {
    dispatch_once(&-[PVInstructionGraphImageSourceNode initWithURL:key:transform:isExporting:imageDelegate:renderingIntent:fillMode:]::once, &__block_literal_global_74);
    if (a6)
      goto LABEL_4;
LABEL_6:
    if (+[PVDeviceCharacteristics architectureType](PVDeviceCharacteristics, "architectureType") <= 2)
      v22 = 3;
    else
      v22 = 6;
    goto LABEL_9;
  }
  if (!a6)
    goto LABEL_6;
LABEL_4:
  v22 = 4;
LABEL_9:
  objc_msgSend((id)sInputBitmapCacheLock, "lock");
  objc_msgSend((id)sInputBitmapCache, "objectForKey:", v19->_url);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
    objc_msgSend(v23, "updateLastUsedTime");
  objc_msgSend((id)sInputBitmapCache, "setCountLimit:", v22);
  objc_msgSend((id)sInputBitmapCacheLock, "unlock");
  CachedImageInfo::SetSourceNode((CachedImageInfo *)&v19->super._transform.ty, v19);
  PVRenderManager::INSTANCE(v25, &v29);
  lock = v19->m_cachedImageInfo._lock;
  v27 = v29;
  if (lock == v29)
  {
    if (lock)
      (*((void (**)(HGSynchronizable *))lock->var0 + 3))(lock);
  }
  else
  {
    if (lock)
    {
      (*((void (**)(HGSynchronizable *))lock->var0 + 3))(lock);
      v27 = v29;
    }
    v19->m_cachedImageInfo._lock = v27;
  }

LABEL_18:
  return v19;
}

void __114__PVInstructionGraphImageSourceNode_initWithURL_key_transform_isExporting_imageDelegate_renderingIntent_fillMode___block_invoke()
{
  PVInputBitmapCache *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v0 = objc_alloc_init(PVInputBitmapCache);
  v1 = (void *)sInputBitmapCache;
  sInputBitmapCache = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v3 = (void *)sPixelBufferCache;
  sPixelBufferCache = (uint64_t)v2;

  v4 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v5 = (void *)sImageLoadLock;
  sImageLoadLock = (uint64_t)v4;

  v6 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v7 = (void *)sInputBitmapCacheLock;
  sInputBitmapCacheLock = (uint64_t)v6;

  v8 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v9 = (void *)sExportRenderAndLoadLock;
  sExportRenderAndLoadLock = (uint64_t)v8;

}

- (PVInstructionGraphImageSourceNode)initWithURL:(id)a3 animation:(id)a4 isExporting:(BOOL)a5 imageDelegate:(id)a6 renderingIntent:(int)a7
{
  return -[PVInstructionGraphImageSourceNode initWithURL:animation:isExporting:imageDelegate:renderingIntent:fillMode:](self, "initWithURL:animation:isExporting:imageDelegate:renderingIntent:fillMode:", a3, a4, a5, a6, *(_QWORD *)&a7, 1);
}

- (PVInstructionGraphImageSourceNode)initWithURL:(id)a3 animation:(id)a4 isExporting:(BOOL)a5 imageDelegate:(id)a6 renderingIntent:(int)a7 fillMode:(int)a8
{
  uint64_t v8;
  uint64_t v9;
  id v14;
  id v15;
  id v16;
  PVInstructionGraphImageSourceNode *v17;
  PVInstructionGraphImageSourceNode *v18;
  __int128 v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  PVRenderManager *v27;
  HGSynchronizable *lock;
  HGSynchronizable *v29;
  HGSynchronizable *v31;
  _OWORD v32[3];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;

  v8 = *(_QWORD *)&a8;
  v9 = *(_QWORD *)&a7;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v36.receiver = self;
  v36.super_class = (Class)PVInstructionGraphImageSourceNode;
  v17 = -[PVInstructionGraphSourceNode init](&v36, sel_init);
  v18 = v17;
  if (!v17)
    goto LABEL_18;
  v19 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v33 = *MEMORY[0x1E0C9BAA8];
  v34 = v19;
  v35 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[PVInstructionGraphImageSourceNode setUrl:](v17, "setUrl:", v14);
  objc_msgSend(v14, "path");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringByAppendingFormat:", CFSTR("_ri%d"), v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVInstructionGraphImageSourceNode setKey:](v18, "setKey:", v21);

  v32[0] = v33;
  v32[1] = v34;
  v32[2] = v35;
  -[PVInstructionGraphSourceNode setTransform:](v18, "setTransform:", v32);
  -[PVInstructionGraphSourceNode setTransformAnimation:](v18, "setTransformAnimation:", v15);
  -[PVInstructionGraphImageSourceNode setImageDelegate:](v18, "setImageDelegate:", v16);
  -[PVInstructionGraphImageSourceNode setRenderingIntent:](v18, "setRenderingIntent:", v9);
  -[PVInstructionGraphImageSourceNode setUseAnimationInfo:](v18, "setUseAnimationInfo:", 1);
  -[PVInstructionGraphSourceNode setIsOverlayTrack:](v18, "setIsOverlayTrack:", 0);
  -[PVInstructionGraphImageSourceNode setFillMode:](v18, "setFillMode:", v8);
  LOBYTE(v18->m_renderManager.m_Obj) = 0;
  HIDWORD(v18->m_renderManager.m_Obj) = 1067576197;
  v22 = *(void **)&v18->_useHDRGainMap;
  *(_QWORD *)&v18->_useHDRGainMap = 0;

  if (-[PVInstructionGraphImageSourceNode initWithURL:animation:isExporting:imageDelegate:renderingIntent:fillMode:]::once != -1)
  {
    dispatch_once(&-[PVInstructionGraphImageSourceNode initWithURL:animation:isExporting:imageDelegate:renderingIntent:fillMode:]::once, &__block_literal_global_81_0);
    if (a5)
      goto LABEL_4;
LABEL_6:
    if (+[PVDeviceCharacteristics architectureType](PVDeviceCharacteristics, "architectureType") <= 2)
      v23 = 3;
    else
      v23 = 6;
    goto LABEL_9;
  }
  if (!a5)
    goto LABEL_6;
LABEL_4:
  v23 = 4;
LABEL_9:
  objc_msgSend((id)sInputBitmapCacheLock, "lock");
  v24 = (void *)sInputBitmapCache;
  -[PVInstructionGraphImageSourceNode key](v18, "key");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKey:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
    objc_msgSend(v26, "updateLastUsedTime");
  objc_msgSend((id)sInputBitmapCache, "setCountLimit:", v23);
  objc_msgSend((id)sInputBitmapCacheLock, "unlock");
  CachedImageInfo::SetSourceNode((CachedImageInfo *)&v18->super._transform.ty, v18);
  PVRenderManager::INSTANCE(v27, &v31);
  lock = v18->m_cachedImageInfo._lock;
  v29 = v31;
  if (lock == v31)
  {
    if (lock)
      (*((void (**)(HGSynchronizable *))lock->var0 + 3))(lock);
  }
  else
  {
    if (lock)
    {
      (*((void (**)(HGSynchronizable *))lock->var0 + 3))(lock);
      v29 = v31;
    }
    v18->m_cachedImageInfo._lock = v29;
  }

LABEL_18:
  return v18;
}

void __110__PVInstructionGraphImageSourceNode_initWithURL_animation_isExporting_imageDelegate_renderingIntent_fillMode___block_invoke()
{
  PVInputBitmapCache *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v0 = objc_alloc_init(PVInputBitmapCache);
  v1 = (void *)sInputBitmapCache;
  sInputBitmapCache = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v3 = (void *)sPixelBufferCache;
  sPixelBufferCache = (uint64_t)v2;

  v4 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v5 = (void *)sImageLoadLock;
  sImageLoadLock = (uint64_t)v4;

  v6 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v7 = (void *)sInputBitmapCacheLock;
  sInputBitmapCacheLock = (uint64_t)v6;

  v8 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v9 = (void *)sExportRenderAndLoadLock;
  sExportRenderAndLoadLock = (uint64_t)v8;

}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PVInstructionGraphImageSourceNode;
  -[PVInstructionGraphImageSourceNode dealloc](&v2, sel_dealloc);
}

- (void)loadIGNode:(HGRef<PVInstructionGraphContext>)a3 returnLoadedEffects:(id)a4
{
  id v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  unsigned __int8 v14;
  uint64_t v15;
  const char *v16;
  char *v17;
  void *v18;
  id v19;
  unsigned __int8 v20;
  uint64_t v21;
  const char *v22;
  char *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  CGSize v29;

  v6 = a4;
  -[PVInstructionGraphImageSourceNode key](self, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (HIDWORD(self->_keyHDRGainMap) == 1)
    objc_msgSend((id)sExportRenderAndLoadLock, "lock");
  v8 = *MEMORY[0x1E0C9D820];
  v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  objc_msgSend((id)sInputBitmapCacheLock, "lock");
  objc_msgSend((id)sInputBitmapCache, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sInputBitmapCacheLock, "unlock");
  if (!v10)
  {
    objc_msgSend((id)sImageLoadLock, "lock");
    objc_msgSend((id)sInputBitmapCacheLock, "lock");
    objc_msgSend((id)sInputBitmapCache, "objectForKey:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)sInputBitmapCacheLock, "unlock");
    if (v11)
    {
      LOBYTE(v12) = 0;
      goto LABEL_24;
    }
    objc_msgSend((id)sPixelBufferCache, "objectForKey:", v7);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v13 = *(_QWORD *)a3.m_Obj;
      v28 = v13;
      if (v13)
        (*(void (**)(uint64_t))(*(_QWORD *)v13 + 16))(v13);
      v12 = -[PVInstructionGraphImageSourceNode newCVPixelBufferCacheItemForImage:](self, "newCVPixelBufferCacheItemForImage:", &v28);
      if (v28)
        (*(void (**)(uint64_t))(*(_QWORD *)v28 + 24))(v28);
      if (v7)
      {
        if (v12)
        {
          objc_msgSend((id)sPixelBufferCache, "setObject:forKey:", v12, v7);
          v14 = atomic_load(HGLogger::_enabled);
          if ((v14 & 1) != 0)
          {
            v15 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
            HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)2, (HGLogger *)"PVIGImageSourceNode (%p): loadIGNode: Created CVPixel Buffer for key: %s\n", v16, v17, self, v15);
          }
        }
      }
      if (LOBYTE(self->m_renderManager.m_Obj) && *(_QWORD *)&self->_useHDRGainMap && v12)
      {
        objc_msgSend(v12, "colorSpace");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[PVInstructionGraphImageSourceNode newCVPixelBufferCacheItemForGainMapWithColorSpace:](self, "newCVPixelBufferCacheItemForGainMapWithColorSpace:", v18);

        if (v19)
        {
          objc_msgSend((id)sPixelBufferCache, "setObject:forKey:", v19, *(_QWORD *)&self->_useHDRGainMap);
          v20 = atomic_load(HGLogger::_enabled);
          if ((v20 & 1) != 0)
          {
            v21 = objc_msgSend(*(id *)&self->_useHDRGainMap, "UTF8String");
            HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)2, (HGLogger *)"PVIGImageSourceNode (%p): loadIGNode: Created GainMap CVPixelBuffer for key: %s\n", v22, v23, self, v21);
          }
        }

      }
      else if (!v12)
      {
        goto LABEL_24;
      }
    }
    objc_msgSend(v12, "fullSize");
    v8 = v24;
    v9 = v25;

    LOBYTE(v12) = 1;
LABEL_24:
    objc_msgSend((id)sImageLoadLock, "unlock");
    v10 = v11;
    if (!v11)
      goto LABEL_26;
  }
  objc_msgSend(v10, "fullSize");
  v8 = v26;
  v9 = v27;
  LOBYTE(v12) = 1;
  v11 = v10;
LABEL_26:
  v29.width = v8;
  v29.height = v9;
  CachedImageInfo::Init((CachedImageInfo *)&self->super._transform.ty, (BOOL)v12, v29);
  if (HIDWORD(self->_keyHDRGainMap) == 1)
    objc_msgSend((id)sExportRenderAndLoadLock, "unlock");

}

- (HGRef<HGNode>)applyGainMapToGraph:(HGRef<HGNode>)a3 gainMap:(HGRef<HGBitmap>)a4 withHeadroom:(float)a5
{
  _QWORD *v5;
  _QWORD *v7;
  HGBitmap *v8;
  PVInstructionGraphImageSourceNode *v11;
  HGBitmapLoader *v12;
  double v13;
  double width;
  _OWORD *v15;
  float v16;
  float v17;

  v7 = v5;
  v8 = *(HGBitmap **)a4.m_Obj;
  if (*(_QWORD *)a4.m_Obj)
  {
    v11 = self;
    v12 = (HGBitmapLoader *)HGObject::operator new(0x1F0uLL);
    HGBitmapLoader::HGBitmapLoader(v12, v8);
    v13 = *(double *)&v11->m_cachedImageInfo.cached;
    width = v11->m_cachedImageInfo.size.width;
    v15 = HGObject::operator new(0x1D0uLL);
    v15[27] = 0u;
    v15[28] = 0u;
    v15[25] = 0u;
    v15[26] = 0u;
    v15[23] = 0u;
    v15[24] = 0u;
    v15[21] = 0u;
    v15[22] = 0u;
    v15[19] = 0u;
    v15[20] = 0u;
    v15[17] = 0u;
    v15[18] = 0u;
    v15[15] = 0u;
    v15[16] = 0u;
    v15[13] = 0u;
    v15[14] = 0u;
    v15[11] = 0u;
    v15[12] = 0u;
    v15[9] = 0u;
    v15[10] = 0u;
    v15[7] = 0u;
    v15[8] = 0u;
    v15[5] = 0u;
    v15[6] = 0u;
    v15[3] = 0u;
    v15[4] = 0u;
    v15[1] = 0u;
    v15[2] = 0u;
    *v15 = 0u;
    HGNode::HGNode((HGNode *)v15);
    *(_QWORD *)v15 = off_1E65EC860;
    *((_QWORD *)v15 + 51) = 0;
    *((_DWORD *)v15 + 104) = 1065353216;
    *(_OWORD *)((char *)v15 + 424) = 0u;
    *(_OWORD *)((char *)v15 + 440) = 0u;
    HGNode::SetInput((HGNode *)v15, 0, *(HGNode **)a3.var0);
    (*(void (**)(_OWORD *, uint64_t, HGBitmapLoader *))(*(_QWORD *)v15 + 120))(v15, 1, v12);
    (*(void (**)(_OWORD *, _QWORD, float, float, float, float))(*(_QWORD *)v15 + 96))(v15, 0, a5, 0.0, 0.0, 0.0);
    v16 = v13;
    v17 = width;
    (*(void (**)(_OWORD *, uint64_t, float, float, float, float))(*(_QWORD *)v15 + 96))(v15, 1, v16, v17, 0.0, 0.0);
    self = (PVInstructionGraphImageSourceNode *)(*(uint64_t (**)(_OWORD *, uint64_t, float, float, float, float))(*(_QWORD *)v15 + 96))(v15, 2, (float)(*(_DWORD *)(*(_QWORD *)a4.m_Obj + 28)- *(_DWORD *)(*(_QWORD *)a4.m_Obj + 20)), (float)(*(_DWORD *)(*(_QWORD *)a4.m_Obj + 32)- *(_DWORD *)(*(_QWORD *)a4.m_Obj + 24)), 0.0, 0.0);
    *v7 = v15;
    if (v12)
      return (HGRef<HGNode>)(*(uint64_t (**)(HGBitmapLoader *))(*(_QWORD *)v12 + 24))(v12);
  }
  else
  {
    *v5 = *(_QWORD *)a3.var0;
    *(_QWORD *)a3.var0 = 0;
  }
  return (HGRef<HGNode>)self;
}

- (id)newCVPixelBufferCacheItemForGainMapWithColorSpace:(id)a3
{
  id v4;
  CGImage *v5;
  CGImage *v6;
  size_t Width;
  size_t Height;
  void *v9;
  uint64_t v11;
  int v12;
  uint64_t v13;

  v4 = a3;
  if (self->_key
    && (objc_opt_respondsToSelector() & 1) != 0
    && (v5 = (CGImage *)-[NSString hdrGainMapImageForURL:renderingIntent:](self->_key, "hdrGainMapImageForURL:renderingIntent:", *(_QWORD *)&self->_fillMode, HIDWORD(self->_keyHDRGainMap)), (v6 = v5) != 0))
  {
    Width = CGImageGetWidth(v5);
    Height = CGImageGetHeight(v6);
    v13 = objc_msgSend(v4, "cgColorSpace");
    v11 = 0x842475241;
    v12 = 8194;
    -[PVInstructionGraphImageSourceNode loadImageTiles:size:colorSpace:imageProperties:](self, "loadImageTiles:size:colorSpace:imageProperties:", v6, v4, &v11, (double)Width, (double)Height);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v6);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)newCVPixelBufferCacheItemForImage:(HGRef<PVInstructionGraphContext>)a3
{
  CGImage *Height;
  CGImage *v5;
  size_t Width;
  double v7;
  double v8;
  CGColorSpace *ColorSpace;
  uint64_t v10;
  PVColorSpace *v11;
  CGImage *CopyWithColorSpace;
  void *v13;
  PVColorSpace *v14;
  void *v15;
  void *v16;
  PVColorSpace *v17;
  _QWORD v19[3];
  CGSize v20;

  Height = (CGImage *)-[NSString imageForURL:renderingIntent:](self->_key, "imageForURL:renderingIntent:", *(_QWORD *)&self->_fillMode, HIDWORD(self->_keyHDRGainMap));
  v5 = Height;
  if (Height)
  {
    Width = CGImageGetWidth(Height);
    Height = (CGImage *)CGImageGetHeight(v5);
  }
  else
  {
    Width = 0;
  }
  v7 = (double)Width;
  v8 = (double)(unint64_t)Height;
  v20.width = (double)Width;
  v20.height = (double)(unint64_t)Height;
  CachedImageInfo::Init((CachedImageInfo *)&self->super._transform.ty, v5 != 0, v20);
  if (!v5)
    return 0;
  ColorSpace = CGImageGetColorSpace(v5);
  +[PVColorSpace pvColorSpaceFromCGColorSpace:](PVColorSpace, "pvColorSpaceFromCGColorSpace:", ColorSpace);
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (PVColorSpace *)v10;
  }
  else
  {
    if (ColorSpace && CGColorSpaceIsWideGamutRGB(ColorSpace))
    {
      +[PVColorSpace p3d65GammaColorSpace](PVColorSpace, "p3d65GammaColorSpace");
      v14 = (PVColorSpace *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[PVColorSpace sRGBColorSpace](PVColorSpace, "sRGBColorSpace");
      v14 = (PVColorSpace *)objc_claimAutoreleasedReturnValue();
    }
    v11 = v14;
    CopyWithColorSpace = CGImageCreateCopyWithColorSpace(v5, -[PVColorSpace cgColorSpace](v14, "cgColorSpace"));
    if (CopyWithColorSpace)
    {
      CGImageRelease(v5);
      ColorSpace = CGImageGetColorSpace(CopyWithColorSpace);
      goto LABEL_15;
    }
  }
  CopyWithColorSpace = v5;
LABEL_15:
  if (-[PVColorSpace isExtendedSRGBColorSpace](v11, "isExtendedSRGBColorSpace"))
  {
    +[PVColorSpace pvColorSpaceFromCGColorSpace:](PVColorSpace, "pvColorSpaceFromCGColorSpace:", ColorSpace);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15
      && ((objc_msgSend(v15, "isSRGBColorSpace") & 1) != 0 || objc_msgSend(v16, "isRec709GammaColorSpace")))
    {
      v17 = v16;

      v11 = v17;
    }

  }
  memset(v19, 0, sizeof(v19));
  PVImagePropertiesForColorSpace(v11, 1, (uint64_t)v19);
  -[PVInstructionGraphImageSourceNode loadImageTiles:size:colorSpace:imageProperties:](self, "loadImageTiles:size:colorSpace:imageProperties:", CopyWithColorSpace, v11, v19, v7, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(CopyWithColorSpace);

  return v13;
}

- (id)loadImageTiles:(CGImage *)a3 size:(CGSize)a4 colorSpace:(id)a5 imageProperties:(PVImageProperties *)a6
{
  double height;
  double width;
  unint64_t v9;
  const __CFAllocator *v10;
  size_t v11;
  int v12;
  unint64_t v13;
  size_t v14;
  const __CFDictionary *v15;
  void *BaseAddress;
  size_t var1;
  size_t BytesPerRow;
  CGContext *v19;
  CGImage *v20;
  const char *v21;
  char *v22;
  unsigned __int8 v23;
  void *v24;
  CVPixelBufferCacheItem *v25;
  int v27;
  id v30;
  PVColorSpace *v31;
  id v32;
  CVPixelBufferRef pixelBufferOut;
  CGRect v34;
  CGRect v35;

  height = a4.height;
  width = a4.width;
  v31 = (PVColorSpace *)a5;
  v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = (unint64_t)height;
  if ((unint64_t)height)
  {
    v27 = 0;
    v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    while (1)
    {
      v11 = v9 >= 0x1000 ? 4096 : v9;
      if ((unint64_t)width)
        break;
LABEL_15:
      v27 += 4096;
      v9 -= v11;
      if (!v9)
        goto LABEL_16;
    }
    v12 = 0;
    v13 = (unint64_t)width;
    while (1)
    {
      v14 = v13 >= 0x1000 ? 4096 : v13;
      PVPixelBufferCreationOptions();
      v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      pixelBufferOut = 0;
      CVPixelBufferCreate(v10, v14, v11, a6->var0, v15, &pixelBufferOut);
      if (!pixelBufferOut)
        break;
      CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
      BaseAddress = CVPixelBufferGetBaseAddress(pixelBufferOut);
      var1 = a6->var1;
      BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
      v19 = CGBitmapContextCreate(BaseAddress, v14, v11, var1, BytesPerRow, a6->var3, a6->var2);
      v34.origin.x = (double)v12;
      v34.origin.y = (double)v27;
      v34.size.width = (double)v14;
      v34.size.height = (double)v11;
      v20 = CGImageCreateWithImageInRect(a3, v34);
      v35.origin.x = 0.0;
      v35.origin.y = 0.0;
      v35.size.width = (double)v14;
      v35.size.height = (double)v11;
      CGContextDrawImage(v19, v35, v20);
      CGImageRelease(v20);
      CGContextRelease(v19);
      CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
      v23 = atomic_load(HGLogger::_enabled);
      if ((v23 & 1) != 0)
        HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)2, (HGLogger *)"PVIGImageSourceNode (%p): createCVPixelBuffer for image. w=%zu, h=%zu, size=%lu\n", v21, v22, self, v13, v9, ((v13 * v9) >> 18) & 0x1FFFFFFFFFFLL);
      objc_msgSend(v32, "addObject:", pixelBufferOut);
      CVPixelBufferRelease(pixelBufferOut);
      PVAddColorSpaceAttributesToCVPixelBuffer(pixelBufferOut, v31);
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", (double)v12, (double)v27, (double)v14, (double)v11);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addObject:", v24);

      v13 -= v14;
      v12 += 4096;
      if (!v13)
        goto LABEL_15;
    }

    v25 = 0;
  }
  else
  {
LABEL_16:
    v25 = -[CVPixelBufferCacheItem initWithCVPixelBuffers:DODs:fullSize:colorSpace:]([CVPixelBufferCacheItem alloc], "initWithCVPixelBuffers:DODs:fullSize:colorSpace:", v32, v30, v31, width, height);
  }

  return v25;
}

- (HGRef<HGNode>)internalHGNodeForTime:(id *)a3 trackInputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  HGSolidColor **v6;
  unsigned __int8 v7;
  uint64_t v8;
  const char *v9;
  char *v10;
  HGInputBitmapCacheItem *v11;
  HGInputBitmapCacheItem *v12;
  HGInputBitmapCacheItem *v13;
  void *v14;
  uint64_t v15;
  unsigned __int8 v16;
  uint64_t v17;
  const char *v18;
  char *v19;
  void *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __CVBuffer *v26;
  HGCV *PixelFormatType;
  char *v28;
  int v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  float v40;
  float v41;
  float v42;
  float v43;
  uint64_t v44;
  uint64_t v45;
  CGFloat a;
  uint64_t v47;
  CGFloat b;
  CGFloat v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  char *v53;
  CGFloat *v54;
  void *v55;
  HGCVPixelBuffer *v56;
  HGCV *v57;
  char *v58;
  int v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  float v70;
  float v71;
  float v72;
  float v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  HGInputBitmapCacheItem *v78;
  double v79;
  double v80;
  double v81;
  double v82;
  void *v83;
  unsigned __int8 v84;
  uint64_t v85;
  const char *v86;
  char *v87;
  char v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  CGFloat v92;
  HGBitmap *v93;
  HGBitmap **v94;
  HGBitmap **v95;
  uint64_t v96;
  HGBitmap *v97;
  HGBitmapLoader *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  id v102;
  void *v103;
  void *v104;
  int v105;
  void *v106;
  void *v107;
  double *v108;
  __int128 v109;
  __int128 v110;
  double v111;
  CGFloat v112;
  double v113;
  double v114;
  PVInstructionGraphContext *m_Obj;
  double v116;
  float v117;
  double v118;
  double v119;
  float v120;
  uint64_t v121;
  uint64_t v122;
  double v123;
  double v124;
  double v125;
  double v126;
  int v127;
  HGSolidColor *v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double width;
  double v134;
  char v135;
  double v136;
  CGFloat v137;
  double v138;
  void *v139;
  void *v140;
  CGFloat v141;
  double v142;
  HGSolidColor *v143;
  void *v144;
  double v145;
  void *v146;
  _BOOL4 v147;
  double v148;
  float v149;
  float v150;
  float v151;
  float v152;
  float v153;
  float v154;
  double v155;
  double v156;
  CGFloat tx;
  CGFloat ty;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  int v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  CGFloat v170;
  CGFloat v171;
  float v172;
  float v173;
  int v174;
  HGRef<HGNode> v175;
  double v176;
  float v177;
  id v178;
  CGFloat v179;
  float v181;
  HGLogger *v182;
  HGSolidColor **v183;
  id v185;
  id v187;
  double v188;
  _OWORD v189[2];
  double v190;
  double v191;
  CGFloat v192;
  CGAffineTransform v193;
  CGAffineTransform v194;
  CGAffineTransform v195;
  CGAffineTransform v196;
  CGAffineTransform v197;
  CGAffineTransform v198;
  CGAffineTransform v199;
  CGAffineTransform v200;
  CGAffineTransform v201;
  CGAffineTransform v202;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v205;
  CGAffineTransform v206;
  __int128 v207;
  int64_t var3;
  __int128 v209;
  __int128 v210;
  double v211;
  double v212;
  double v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  id v218;
  CGFloat v219;
  uint64_t v220;
  CGFloat v221;
  uint64_t v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  uint64_t v227;
  _BYTE v228[16];
  _BYTE v229[128];
  uint64_t v230;

  v183 = v6;
  v230 = *MEMORY[0x1E0C80C00];
  -[PVInstructionGraphImageSourceNode key](self, "key", a3, a4, a5);
  v185 = (id)objc_claimAutoreleasedReturnValue();
  HGTraceGuard::HGTraceGuard((HGTraceGuard *)v228, "kPVInstructionGraphToHeliumGraphLogContext", 1, "-[PVInstructionGraphImageSourceNode hgNodeForTime:...]");
  v7 = atomic_load(HGLogger::_enabled);
  if ((v7 & 1) != 0)
  {
    v8 = objc_msgSend(objc_retainAutorelease(v185), "UTF8String");
    HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Image Key: %s\n", v9, v10, v8);
  }
  if (HIDWORD(self->_keyHDRGainMap) == 1)
    objc_msgSend((id)sExportRenderAndLoadLock, "lock");
  objc_msgSend((id)sInputBitmapCacheLock, "lock");
  objc_msgSend((id)sInputBitmapCache, "objectForKey:", v185);
  v11 = (HGInputBitmapCacheItem *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    -[HGInputBitmapCacheItem updateLastUsedTime](v11, "updateLastUsedTime");
  objc_msgSend((id)sInputBitmapCacheLock, "unlock");
  if (v12)
    goto LABEL_63;
  objc_msgSend((id)sImageLoadLock, "lock");
  objc_msgSend((id)sInputBitmapCacheLock, "lock");
  objc_msgSend((id)sInputBitmapCache, "objectForKey:", v185);
  v13 = (HGInputBitmapCacheItem *)objc_claimAutoreleasedReturnValue();
  v12 = v13;
  if (v13)
    -[HGInputBitmapCacheItem updateLastUsedTime](v13, "updateLastUsedTime");
  objc_msgSend((id)sInputBitmapCacheLock, "unlock");
  if (!v12)
  {
    objc_msgSend((id)sPixelBufferCache, "objectForKey:", v185);
    v187 = (id)objc_claimAutoreleasedReturnValue();
    if (!v187)
    {
      v15 = *(_QWORD *)a6.m_Obj;
      v227 = v15;
      if (v15)
        (*(void (**)(uint64_t))(*(_QWORD *)v15 + 16))(v15);
      v187 = -[PVInstructionGraphImageSourceNode newCVPixelBufferCacheItemForImage:](self, "newCVPixelBufferCacheItemForImage:", &v227);
      if (v227)
        (*(void (**)(uint64_t))(*(_QWORD *)v227 + 24))(v227);
      if (!v187)
      {
        objc_msgSend((id)sImageLoadLock, "unlock");
        if (HIDWORD(self->_keyHDRGainMap) == 1)
          objc_msgSend((id)sExportRenderAndLoadLock, "unlock");
        v143 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
        HGSolidColor::HGSolidColor(v143);
        (*(void (**)(HGSolidColor *, _QWORD, float, float, float, float))(*(_QWORD *)v143 + 96))(v143, 0, 0.0, 0.0, 0.0, 1.0);
        v12 = 0;
        *v183 = v143;
        goto LABEL_213;
      }
      v16 = atomic_load(HGLogger::_enabled);
      if ((v16 & 1) != 0)
      {
        v17 = objc_msgSend(objc_retainAutorelease(v185), "UTF8String");
        HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)2, (HGLogger *)"PVIGImageSourceNode (%p): hgNodeForTime: Created CVPixel Buffer for key: %s\n", v18, v19, self, v17);
      }
    }
    if (LOBYTE(self->m_renderManager.m_Obj))
    {
      objc_msgSend((id)sPixelBufferCache, "objectForKey:", *(_QWORD *)&self->_useHDRGainMap);
      v178 = (id)objc_claimAutoreleasedReturnValue();
      if (!v178)
      {
        objc_msgSend(v187, "colorSpace");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v178 = -[PVInstructionGraphImageSourceNode newCVPixelBufferCacheItemForGainMapWithColorSpace:](self, "newCVPixelBufferCacheItemForGainMapWithColorSpace:", v14);

      }
    }
    else
    {
      v178 = 0;
    }
    objc_msgSend((id)sInputBitmapCacheLock, "lock");
    memset(&v206, 0, 24);
    v223 = 0u;
    v224 = 0u;
    v225 = 0u;
    v226 = 0u;
    objc_msgSend(v187, "buffers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v223, v229, 16);
    if (v21)
    {
      v22 = 0;
      v23 = *(_QWORD *)v224;
      do
      {
        v24 = 0;
        v25 = v22;
        do
        {
          if (*(_QWORD *)v224 != v23)
            objc_enumerationMutation(v20);
          v26 = *(__CVBuffer **)(*((_QWORD *)&v223 + 1) + 8 * v24);
          PixelFormatType = (HGCV *)CVPixelBufferGetPixelFormatType(v26);
          v29 = HGCV::HGFormatForCVPixelFormat(PixelFormatType, 0, v28);
          HGCVBitmap::create((HGCVPixelBuffer *)v26, v29, 0, &v205);
          objc_msgSend(v187, "DODs");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectAtIndex:", v25 + v24);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "CGRectValue");
          v33 = v32;
          v35 = v34;
          v37 = v36;
          v39 = v38;

          v40 = v33;
          v41 = v35;
          v42 = v33 + v37;
          v43 = v35 + v39;
          v45 = HGRectMake4f(v44, v40, v41, v42, v43);
          a = v205.a;
          *(_QWORD *)(*(_QWORD *)&v205.a + 20) = v45;
          *(_QWORD *)(*(_QWORD *)&a + 28) = v47;
          (*(void (**)(CGFloat))(**(_QWORD **)&a + 16))(COERCE_CGFLOAT(*(_QWORD *)&a));
          b = v206.b;
          if (*(_QWORD *)&v206.b >= *(_QWORD *)&v206.c)
          {
            v50 = (uint64_t)(*(_QWORD *)&v206.b - *(_QWORD *)&v206.a) >> 3;
            if ((unint64_t)(v50 + 1) >> 61)
              std::vector<double>::__throw_length_error[abi:ne180100]();
            v51 = (uint64_t)(*(_QWORD *)&v206.c - *(_QWORD *)&v206.a) >> 2;
            if (v51 <= v50 + 1)
              v51 = v50 + 1;
            if (*(_QWORD *)&v206.c - *(_QWORD *)&v206.a >= 0x7FFFFFFFFFFFFFF8uLL)
              v52 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v52 = v51;
            v211 = COERCE_DOUBLE((CGAffineTransform *)&v206.c);
            if (v52)
              v53 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v206.c, v52);
            else
              v53 = 0;
            v54 = (CGFloat *)&v53[8 * v50];
            *(_QWORD *)&v209 = v53;
            *((_QWORD *)&v209 + 1) = v54;
            *((_QWORD *)&v210 + 1) = &v53[8 * v52];
            *v54 = a;
            *(_QWORD *)&v210 = v54 + 1;
            std::vector<HGRef<HGBitmap>>::__swap_out_circular_buffer((uint64_t *)&v206, &v209);
            v49 = v206.b;
            std::__split_buffer<HGRef<HGBitmap>>::~__split_buffer((void **)&v209);
          }
          else
          {
            **(CGFloat **)&v206.b = a;
            *(_QWORD *)&v49 = *(_QWORD *)&b + 8;
          }
          v206.b = v49;
          if (*(_QWORD *)&v205.a)
            (*(void (**)(_QWORD))(**(_QWORD **)&v205.a + 24))(*(_QWORD *)&v205.a);
          ++v24;
        }
        while (v21 != v24);
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v223, v229, 16);
        v22 = v25 + v24;
      }
      while (v21);
    }

    if (v178)
    {
      objc_msgSend(v178, "buffers");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "objectAtIndexedSubscript:", 0);
      v56 = (HGCVPixelBuffer *)objc_claimAutoreleasedReturnValue();

      v57 = (HGCV *)CVPixelBufferGetPixelFormatType((CVPixelBufferRef)v56);
      v59 = HGCV::HGFormatForCVPixelFormat(v57, 0, v58);
      HGCVBitmap::create(v56, v59, 0, &v209);
      objc_msgSend(v178, "DODs");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "objectAtIndex:", 0);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "CGRectValue");
      v63 = v62;
      v65 = v64;
      v67 = v66;
      v69 = v68;

      v70 = v63;
      v71 = v65;
      v72 = v63 + v67;
      v73 = v65 + v69;
      v75 = HGRectMake4f(v74, v70, v71, v72, v73);
      v76 = v209;
      *(_QWORD *)(v209 + 20) = v75;
      *(_QWORD *)(v76 + 28) = v77;
      (*(void (**)(uint64_t))(*(_QWORD *)v76 + 16))(v76);
      if ((_QWORD)v209)
        (*(void (**)(_QWORD))(*(_QWORD *)v209 + 24))(v209);
    }
    else
    {
      v76 = 0;
    }
    v78 = [HGInputBitmapCacheItem alloc];
    objc_msgSend(v187, "fullSize");
    v80 = v79;
    v82 = v81;
    objc_msgSend(v187, "colorSpace");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v222 = v76;
    if (v76)
      (*(void (**)(uint64_t))(*(_QWORD *)v76 + 16))(v76);
    v12 = -[HGInputBitmapCacheItem initWithHGBitmap:fullSize:colorSpace:gainMap:](v78, "initWithHGBitmap:fullSize:colorSpace:gainMap:", &v206, v83, &v222, v80, v82);
    if (v222)
      (*(void (**)(uint64_t))(*(_QWORD *)v222 + 24))(v222);

    if (v185 && v12)
    {
      objc_msgSend((id)sInputBitmapCache, "setObject:forKey:", v12, v185);
      -[HGInputBitmapCacheItem updateLastUsedTime](v12, "updateLastUsedTime");
    }
    objc_msgSend((id)sInputBitmapCacheLock, "unlock");
    v84 = atomic_load(HGLogger::_enabled);
    if ((v84 & 1) != 0)
    {
      v85 = objc_msgSend(objc_retainAutorelease(v185), "UTF8String");
      HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)2, (HGLogger *)"PVIGImageSourceNode (%p): Cached Texture for key: %s\n", v86, v87, self, v85);
    }
    objc_msgSend((id)sPixelBufferCache, "removeObjectForKey:", v185);
    if (v178)
      objc_msgSend((id)sPixelBufferCache, "removeObjectForKey:", *(_QWORD *)&self->_useHDRGainMap);
    if (v76)
      (*(void (**)(uint64_t))(*(_QWORD *)v76 + 24))(v76);
    *(_QWORD *)&v209 = &v206;
    std::vector<HGRef<HGBitmap>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v209);

  }
  objc_msgSend((id)sImageLoadLock, "unlock");
  if (v12)
  {
LABEL_63:
    -[HGInputBitmapCacheItem bitmaps](v12, "bitmaps");
    v88 = 0;
    v89 = *((_QWORD *)&v209 + 1);
    v90 = v209;
  }
  else
  {
    v90 = 0;
    v89 = 0;
    v209 = 0uLL;
    v88 = 1;
    *(_QWORD *)&v210 = 0;
  }
  v91 = v89 - v90;
  *(_QWORD *)&v206.a = &v209;
  std::vector<HGRef<HGBitmap>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v206);
  if (v91 < 9)
  {
    -[HGInputBitmapCacheItem bitmaps](v12, "bitmaps");
    v93 = *(HGBitmap **)v209;
    v92 = COERCE_DOUBLE(HGObject::operator new(0x1F0uLL));
    HGBitmapLoader::HGBitmapLoader(*(HGBitmapLoader **)&v92, v93);
    *(_QWORD *)&v206.a = &v209;
    std::vector<HGRef<HGBitmap>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v206);
    goto LABEL_80;
  }
  v92 = COERCE_DOUBLE(HGObject::operator new(0x1A0uLL));
  HGOverwrite::HGOverwrite(*(HGOverwrite **)&v92);
  if ((v88 & 1) != 0)
  {
    v209 = 0uLL;
    *(_QWORD *)&v210 = 0;
    goto LABEL_78;
  }
  -[HGInputBitmapCacheItem bitmaps](v12, "bitmaps");
  v95 = (HGBitmap **)*((_QWORD *)&v209 + 1);
  v94 = (HGBitmap **)v209;
  if ((_QWORD)v209 == *((_QWORD *)&v209 + 1))
  {
LABEL_78:
    *(_QWORD *)&v206.a = &v209;
    std::vector<HGRef<HGBitmap>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v206);
    if (v92 == 0.0)
      goto LABEL_80;
    goto LABEL_79;
  }
  v96 = 0;
  do
  {
    v97 = *v94;
    if (*v94)
      (*(void (**)(HGBitmap *))(*(_QWORD *)v97 + 16))(*v94);
    v98 = (HGBitmapLoader *)HGObject::operator new(0x1F0uLL);
    HGBitmapLoader::HGBitmapLoader(v98, v97);
    (*(void (**)(CGFloat, uint64_t, HGBitmapLoader *))(**(_QWORD **)&v92 + 120))(COERCE_CGFLOAT(*(_QWORD *)&v92), v96, v98);
    if (v98)
      (*(void (**)(HGBitmapLoader *))(*(_QWORD *)v98 + 24))(v98);
    if (v97)
      (*(void (**)(HGBitmap *))(*(_QWORD *)v97 + 24))(v97);
    ++v94;
    v96 = (v96 + 1);
  }
  while (v94 != v95);
  *(_QWORD *)&v206.a = &v209;
  std::vector<HGRef<HGBitmap>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v206);
LABEL_79:
  (*(void (**)(CGFloat))(**(_QWORD **)&v92 + 16))(COERCE_CGFLOAT(*(_QWORD *)&v92));
  (*(void (**)(CGFloat))(**(_QWORD **)&v92 + 24))(COERCE_CGFLOAT(*(_QWORD *)&v92));
LABEL_80:
  if (v12)
  {
    -[HGInputBitmapCacheItem fullSize](v12, "fullSize");
  }
  else
  {
    v99 = *MEMORY[0x1E0C9D820];
    v100 = *(_QWORD *)(MEMORY[0x1E0C9D820] + 8);
  }
  CachedImageInfo::Init((CachedImageInfo *)&self->super._transform.ty, v12 != 0, *(CGSize *)&v99);
  if (!LOBYTE(self->m_renderManager.m_Obj)
    || (v88 & 1) != 0
    || (-[HGInputBitmapCacheItem gainMap](v12, "gainMap"), !(_QWORD)v209))
  {
    v219 = v92;
    if (v92 != 0.0)
      (*(void (**)(CGFloat))(**(_QWORD **)&v92 + 16))(COERCE_CGFLOAT(*(_QWORD *)&v92));
    -[HGInputBitmapCacheItem colorSpace](v12, "colorSpace");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    PVInstructionGraphContext::WorkingColorSpace(*(PVInstructionGraphContext **)a6.m_Obj);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = PVInstructionGraphContext::WorkingColorSpaceConformIntent(*(PVInstructionGraphContext **)a6.m_Obj);
    v218 = 0;
    ColorConformInput((HGColorClamp **)&v219, v103, v104, v105, &v218, (HGColorConform **)&v209);
    v102 = v218;
    if (*(_QWORD *)&v92 == (_QWORD)v209)
    {
      if (v92 != 0.0)
        (*(void (**)(CGFloat))(**(_QWORD **)&v92 + 24))(COERCE_CGFLOAT(*(_QWORD *)&v92));
    }
    else
    {
      if (v92 != 0.0)
        (*(void (**)(CGFloat))(**(_QWORD **)&v92 + 24))(COERCE_CGFLOAT(*(_QWORD *)&v92));
      v92 = *(double *)&v209;
      *(_QWORD *)&v209 = 0;
    }

    if (v219 != 0.0)
      (*(void (**)(CGFloat))(**(_QWORD **)&v219 + 24))(COERCE_CGFLOAT(*(_QWORD *)&v219));
    if (v102)
    {
      -[HGInputBitmapCacheItem colorSpace](v12, "colorSpace");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      PVInstructionGraphContext::WorkingColorSpace(*(PVInstructionGraphContext **)a6.m_Obj);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Error in color conforming image source from %@ to %@"), v106, v107);

    }
    goto LABEL_102;
  }
  (*(void (**)(_QWORD))(*(_QWORD *)v209 + 24))(v209);
  -[HGInputBitmapCacheItem colorSpace](v12, "colorSpace");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "nclcTriplet");
  v102 = (id)objc_claimAutoreleasedReturnValue();

  PVCreateColorConform(objc_msgSend(v102, "hgColorPrimary"), objc_msgSend(v102, "hgTransferFunction"), 0, 3, 8, 0, (HGColorConform **)&v209);
  (*(void (**)(_QWORD, _QWORD, CGFloat))(*(_QWORD *)v209 + 120))(v209, 0, COERCE_CGFLOAT(*(_QWORD *)&v92));
  if (*(_QWORD *)&v92 == (_QWORD)v209)
  {
    v221 = v92;
    if (v92 != 0.0)
      goto LABEL_119;
  }
  else
  {
    if (v92 == 0.0)
    {
      v92 = *(double *)&v209;
      if ((_QWORD)v209)
        goto LABEL_89;
    }
    else
    {
      (*(void (**)(CGFloat))(**(_QWORD **)&v92 + 24))(COERCE_CGFLOAT(*(_QWORD *)&v92));
      v92 = *(double *)&v209;
      if ((_QWORD)v209)
      {
LABEL_89:
        (*(void (**)(CGFloat))(**(_QWORD **)&v92 + 16))(COERCE_CGFLOAT(*(_QWORD *)&v92));
        v221 = v92;
LABEL_119:
        (*(void (**)(CGFloat))(**(_QWORD **)&v92 + 16))(COERCE_CGFLOAT(*(_QWORD *)&v92));
        v135 = 0;
        goto LABEL_123;
      }
    }
    v221 = 0.0;
  }
  v135 = 1;
LABEL_123:
  -[HGInputBitmapCacheItem gainMap](v12, "gainMap");
  LODWORD(v136) = HIDWORD(self->m_renderManager.m_Obj);
  -[PVInstructionGraphImageSourceNode applyGainMapToGraph:gainMap:withHeadroom:](self, "applyGainMapToGraph:gainMap:withHeadroom:", &v221, &v220, v136);
  v137 = v206.a;
  if (*(_QWORD *)&v92 == *(_QWORD *)&v206.a)
  {
    if (v92 != 0.0)
      (*(void (**)(CGFloat))(**(_QWORD **)&v92 + 24))(COERCE_CGFLOAT(*(_QWORD *)&v92));
  }
  else
  {
    if ((v135 & 1) == 0)
    {
      (*(void (**)(CGFloat))(**(_QWORD **)&v92 + 24))(COERCE_CGFLOAT(*(_QWORD *)&v92));
      v137 = v206.a;
    }
    v206.a = 0.0;
    v92 = v137;
  }
  if (v220)
    (*(void (**)(uint64_t))(*(_QWORD *)v220 + 24))(v220);
  if (v221 != 0.0)
    (*(void (**)(CGFloat))(**(_QWORD **)&v221 + 24))(COERCE_CGFLOAT(*(_QWORD *)&v221));
  PVCreateColorConform(3, 8, 0, 3, 1, 0, (HGColorConform **)&v206);
  (*(void (**)(_QWORD, _QWORD, CGFloat))(**(_QWORD **)&v206.a + 120))(*(_QWORD *)&v206.a, 0, COERCE_CGFLOAT(*(_QWORD *)&v92));
  if (*(_QWORD *)&v92 != *(_QWORD *)&v206.a)
  {
    if (v92 == 0.0)
    {
      v92 = v206.a;
      if (!*(_QWORD *)&v206.a)
        goto LABEL_139;
    }
    else
    {
      (*(void (**)(CGFloat))(**(_QWORD **)&v92 + 24))(COERCE_CGFLOAT(*(_QWORD *)&v92));
      v92 = v206.a;
      if (!*(_QWORD *)&v206.a)
        goto LABEL_139;
    }
    (*(void (**)(CGFloat))(**(_QWORD **)&v92 + 16))(COERCE_CGFLOAT(*(_QWORD *)&v92));
  }
LABEL_139:
  v138 = COERCE_DOUBLE(HGObject::operator new(0x1B0uLL));
  HGHLG::SDRToHLG::SDRToHLG(*(uint64_t *)&v138, 2, 1);
  (*(void (**)(double, _QWORD, CGFloat))(**(_QWORD **)&v138 + 120))(COERCE_DOUBLE(*(_QWORD *)&v138), 0, COERCE_CGFLOAT(*(_QWORD *)&v92));
  if (*(_QWORD *)&v92 != *(_QWORD *)&v138)
  {
    if (v92 != 0.0)
      (*(void (**)(CGFloat))(**(_QWORD **)&v92 + 24))(COERCE_CGFLOAT(*(_QWORD *)&v92));
    v92 = v138;
    (*(void (**)(double))(**(_QWORD **)&v138 + 16))(COERCE_DOUBLE(*(_QWORD *)&v138));
  }
  PVInstructionGraphContext::WorkingColorSpace(*(PVInstructionGraphContext **)a6.m_Obj);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "nclcTriplet");
  v140 = (void *)objc_claimAutoreleasedReturnValue();

  PVCreateColorConform(3, 8, 0, objc_msgSend(v140, "hgColorPrimary"), objc_msgSend(v140, "hgTransferFunction"), 0, (HGColorConform **)&v205);
  (*(void (**)(_QWORD, _QWORD, CGFloat))(**(_QWORD **)&v205.a + 120))(*(_QWORD *)&v205.a, 0, COERCE_CGFLOAT(*(_QWORD *)&v92));
  if (*(_QWORD *)&v92 == *(_QWORD *)&v205.a)
  {
    v141 = v92;
    if (v92 == 0.0)
      goto LABEL_152;
    goto LABEL_151;
  }
  if (v92 == 0.0)
  {
    v92 = v205.a;
    if (!*(_QWORD *)&v205.a)
      goto LABEL_152;
  }
  else
  {
    (*(void (**)(CGFloat))(**(_QWORD **)&v92 + 24))(COERCE_CGFLOAT(*(_QWORD *)&v92));
    v92 = v205.a;
    if (!*(_QWORD *)&v205.a)
      goto LABEL_152;
  }
  (*(void (**)(CGFloat))(**(_QWORD **)&v92 + 16))(COERCE_CGFLOAT(*(_QWORD *)&v92));
  v141 = v205.a;
  if (*(_QWORD *)&v205.a)
LABEL_151:
    (*(void (**)(CGFloat))(**(_QWORD **)&v141 + 24))(COERCE_CGFLOAT(*(_QWORD *)&v141));
LABEL_152:

  (*(void (**)(double))(**(_QWORD **)&v138 + 24))(COERCE_DOUBLE(*(_QWORD *)&v138));
  if (*(_QWORD *)&v206.a)
    (*(void (**)(_QWORD))(**(_QWORD **)&v206.a + 24))(*(_QWORD *)&v206.a);
  if ((_QWORD)v209)
    (*(void (**)(_QWORD))(*(_QWORD *)v209 + 24))(v209);
LABEL_102:

  v108 = (double *)MEMORY[0x1E0C9BAA8];
  v109 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v216 = *MEMORY[0x1E0C9BAA8];
  v217 = v109;
  if (LOBYTE(self->m_cachedImageInfo.size.height))
  {
    if (!-[PVInstructionGraphImageSourceNode useAnimationInfo](self, "useAnimationInfo"))
    {
      -[PVInstructionGraphSourceNode transform](self, "transform");
      v216 = v209;
      v217 = v210;
      v129 = v211;
      v130 = v212;
      if (!-[PVInstructionGraphSourceNode isOverlayTrack](self, "isOverlayTrack"))
      {
        v131 = *(double *)&self->m_cachedImageInfo.cached;
        v132 = (*(double (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 40))(*(_QWORD *)a6.m_Obj);
        width = self->m_cachedImageInfo.size.width;
        (*(void (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 40))(*(_QWORD *)a6.m_Obj);
        v129 = v129 * (v131 / v132);
        v130 = v130 * (width / v134);
      }
      goto LABEL_200;
    }
    v110 = *((_OWORD *)v108 + 1);
    v214 = *(_OWORD *)v108;
    v215 = v110;
    v111 = v108[4];
    v112 = v108[5];
    v114 = *(double *)&self->m_cachedImageInfo.cached;
    v113 = self->m_cachedImageInfo.size.width;
    m_Obj = a6.m_Obj;
    v116 = (*(double (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 40))(*(_QWORD *)a6.m_Obj);
    v117 = (*(float (**)(_QWORD))(**(_QWORD **)m_Obj + 48))(*(_QWORD *)m_Obj);
    (*(void (**)(_QWORD))(**(_QWORD **)m_Obj + 40))(*(_QWORD *)m_Obj);
    v119 = v118;
    v120 = (*(float (**)(_QWORD))(**(_QWORD **)m_Obj + 48))(*(_QWORD *)m_Obj);
    v179 = v111;
    v121 = -[PVInstructionGraphSourceNode transformAnimationContentMode](self, "transformAnimationContentMode");
    v122 = v121;
    v123 = v116 * v117;
    v124 = v119 * v120;
    v125 = v124;
    v126 = v123;
    if (!(_DWORD)v121 || (v125 = v124, v126 = v123, (_DWORD)v121 == 3))
    {
LABEL_168:
      -[PVInstructionGraphSourceNode transformAnimation](self, "transformAnimation");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      v207 = *(_OWORD *)&a3->var0;
      var3 = a3->var3;
      v147 = +[PVTransformAnimation getTransformInfoFromAnimation:atTime:renderSize:contentMode:invertY:outInfo:](PVTransformAnimation, "getTransformInfoFromAnimation:atTime:renderSize:contentMode:invertY:outInfo:", v146, &v207, v122, 0, &v209, v126, v125);

      v188 = v113;
      v148 = v123;
      *(double *)&v182 = v124;
      if (v147)
      {
        v149 = v212;
        v150 = *((double *)&v210 + 1);
        v177 = v150;
        v151 = v211;
        v181 = v151;
        v152 = v213;
      }
      else
      {
        v177 = 0.0;
        v149 = 1.0;
        v181 = 0.0;
        v152 = 0.0;
      }
      v153 = v114 * -0.5;
      v154 = v188 * -0.5;
      memset(&v206, 0, sizeof(v206));
      v155 = v153;
      v156 = v154;
      CGAffineTransformMakeTranslation(&v206, v153, v154);
      *(_OWORD *)&t1.a = v214;
      *(_OWORD *)&t1.c = v215;
      t1.tx = v179;
      t1.ty = v112;
      t2 = v206;
      CGAffineTransformConcat(&v205, &t1, &t2);
      v214 = *(_OWORD *)&v205.a;
      v215 = *(_OWORD *)&v205.c;
      tx = v205.tx;
      ty = v205.ty;
      v159 = *((_OWORD *)v108 + 1);
      *(_OWORD *)&v205.a = *(_OWORD *)v108;
      *(_OWORD *)&v205.c = v159;
      *(_OWORD *)&v205.tx = *((_OWORD *)v108 + 2);
      if (v152 != 0.0)
      {
        v160 = *((_OWORD *)v108 + 1);
        *(_OWORD *)&v202.a = *(_OWORD *)v108;
        *(_OWORD *)&v202.c = v160;
        *(_OWORD *)&v202.tx = *((_OWORD *)v108 + 2);
        CGAffineTransformRotate(&v205, &v202, v152 * 3.14159265 / 180.0);
      }
      v161 = *((_OWORD *)v108 + 1);
      *(_OWORD *)&v200.a = *(_OWORD *)v108;
      *(_OWORD *)&v200.c = v161;
      *(_OWORD *)&v200.tx = *((_OWORD *)v108 + 2);
      CGAffineTransformTranslate(&v201, &v200, v155, v156);
      v162 = *(_DWORD *)&self->_useAnimationInfo;
      if (v162)
      {
        v163 = fabs(v114 * v201.b + v188 * v201.d);
        v164 = fabs(v114 * v201.a + v188 * v201.c);
        if (v162 <= 2)
        {
          if (v162 == 1)
          {
            if (v148 <= *(double *)&v182)
            {
              v169 = *(double *)&v182 / v163;
              if (v164 * (*(double *)&v182 / v163) < v148)
                v169 = v148 / v164;
            }
            else
            {
              v169 = v148 / v164;
              if (v163 * (v148 / v164) < *(double *)&v182)
                v169 = *(double *)&v182 / v163;
            }
            v165 = v164 * v169;
            goto LABEL_196;
          }
          if (v162 == 2)
          {
            v167 = v163 * (v148 / v164);
            v168 = *(double *)&v182 / v163;
            if (v167 <= *(double *)&v182)
              v168 = v148 / v164;
            v165 = v164 * v168;
            goto LABEL_196;
          }
          goto LABEL_189;
        }
        v165 = v148;
        if (v162 == 3)
        {
LABEL_196:
          v166 = v165 / v164;
          goto LABEL_197;
        }
        if (v162 != 13)
        {
          if (v162 == 14)
          {
            v165 = *(double *)&v182 * (v164 / v163);
            goto LABEL_196;
          }
LABEL_189:
          v165 = v164;
          goto LABEL_196;
        }
        v166 = v148 / (v164 / v163) / v163;
      }
      else
      {
        v166 = 1.0;
      }
LABEL_197:
      memset(&v201, 0, sizeof(v201));
      CGAffineTransformMakeScale(&v201, v166 * v149, v166 * v149);
      if (v152 != 0.0)
      {
        *(_OWORD *)&v198.a = v214;
        *(_OWORD *)&v198.c = v215;
        v198.tx = tx;
        v198.ty = ty;
        v197 = v205;
        CGAffineTransformConcat(&v199, &v198, &v197);
        v214 = *(_OWORD *)&v199.a;
        v215 = *(_OWORD *)&v199.c;
        tx = v199.tx;
        ty = v199.ty;
      }
      *(_OWORD *)&v196.a = v214;
      *(_OWORD *)&v196.c = v215;
      v196.tx = tx;
      v196.ty = ty;
      v195 = v201;
      CGAffineTransformConcat(&v199, &v196, &v195);
      v214 = *(_OWORD *)&v199.a;
      v215 = *(_OWORD *)&v199.c;
      v170 = v199.tx;
      v171 = v199.ty;
      v172 = v114 * 0.5 + floor(v148 - v114) * 0.5 + v177;
      v173 = v188 * 0.5 + floor(*(double *)&v182 - v188) * 0.5 + v181;
      CGAffineTransformMakeTranslation(&v199, v172, v173);
      v206 = v199;
      *(_OWORD *)&v194.a = v214;
      *(_OWORD *)&v194.c = v215;
      v194.tx = v170;
      v194.ty = v171;
      v193 = v199;
      CGAffineTransformConcat(&v199, &v194, &v193);
      v214 = *(_OWORD *)&v199.a;
      v215 = *(_OWORD *)&v199.c;
      v129 = v199.tx;
      v130 = v199.ty;
      v216 = *(_OWORD *)&v199.a;
      v217 = *(_OWORD *)&v199.c;
LABEL_200:
      v192 = v92;
      if (v92 != 0.0)
        (*(void (**)(CGFloat))(**(_QWORD **)&v92 + 16))(COERCE_CGFLOAT(*(_QWORD *)&v92));
      v189[0] = v216;
      v189[1] = v217;
      v190 = v129;
      v191 = v130;
      v174 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 64))(*(_QWORD *)a6.m_Obj);
      HGXFormForCGAffineTransform((HGXForm **)&v192, v189, v174, (HGXForm **)&v209);
      if (*(_QWORD *)&v92 == (_QWORD)v209)
      {
        if (v92 != 0.0)
          (*(void (**)(CGFloat))(**(_QWORD **)&v92 + 24))(COERCE_CGFLOAT(*(_QWORD *)&v92));
      }
      else
      {
        if (v92 != 0.0)
          (*(void (**)(CGFloat))(**(_QWORD **)&v92 + 24))(COERCE_CGFLOAT(*(_QWORD *)&v92));
        v92 = *(double *)&v209;
        *(_QWORD *)&v209 = 0;
      }
      if (v192 != 0.0)
        (*(void (**)(CGFloat))(**(_QWORD **)&v192 + 24))(COERCE_CGFLOAT(*(_QWORD *)&v192));
      if (HIDWORD(self->_keyHDRGainMap) == 1)
        objc_msgSend((id)sExportRenderAndLoadLock, "unlock");
      *(CGFloat *)v183 = v92;
      goto LABEL_213;
    }
    v127 = *(_DWORD *)&self->_useAnimationInfo;
    if (v127 > 2)
    {
      v126 = v123;
      v125 = v124;
      if (v127 != 3)
      {
        if (v127 == 13)
        {
          v125 = v123 / (v114 / v113);
          v126 = v123;
        }
        else
        {
          v126 = v114;
          v125 = v113;
          if (v127 == 14)
          {
            v126 = v114 / v113 * v124;
            v125 = v124;
          }
        }
      }
      goto LABEL_165;
    }
    if (v127 == 1)
    {
      if (v123 <= v124)
      {
        v142 = v124 / v113;
        if (v114 * (v124 / v113) < v123)
          v142 = v123 / v114;
      }
      else
      {
        v142 = v123 / v114;
        if (v113 * (v123 / v114) < v124)
          v142 = v124 / v113;
      }
    }
    else
    {
      v126 = v114;
      v125 = v113;
      if (v127 != 2)
      {
LABEL_165:
        -[PVInstructionGraphSourceNode transformAnimation](self, "transformAnimation");
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v144, "aspectRatio");
        switch(*(_DWORD *)&self->_useAnimationInfo)
        {
          case 1:
            if (v126 / v145 <= v125)
              v125 = v126 / v145;
            v126 = v145 * v125;
            break;
          case 2:
            if (v126 <= v125)
            {
              v176 = v125;
              if (v125 * v145 < v126)
                v176 = v126 / v145;
            }
            else
            {
              v176 = v126 / v145;
              if (v126 / v145 < v125)
                v176 = v125;
            }
            v126 = v145 * v176;
            v125 = v176;
            break;
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
          case 0xA:
          case 0xB:
          case 0xC:
            v125 = 1.0;
            v126 = v145;
            break;
          case 0xD:
            v125 = v126 / v145;
            break;
          case 0xE:
            v126 = v125 * v145;
            break;
          default:
            break;
        }

        goto LABEL_168;
      }
      v142 = v123 / v114;
      if (v113 * (v123 / v114) > v124)
        v142 = v124 / v113;
    }
    v126 = v114 * v142;
    v125 = v113 * v142;
    goto LABEL_165;
  }
  if (HIDWORD(self->_keyHDRGainMap) == 1)
    objc_msgSend((id)sExportRenderAndLoadLock, "unlock");
  v128 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
  HGSolidColor::HGSolidColor(v128);
  (*(void (**)(HGSolidColor *, _QWORD, float, float, float, float))(*(_QWORD *)v128 + 96))(v128, 0, 0.0, 0.0, 0.0, 1.0);
  *v183 = v128;
  if (v92 != 0.0)
    (*(void (**)(CGFloat))(**(_QWORD **)&v92 + 24))(COERCE_CGFLOAT(*(_QWORD *)&v92));
LABEL_213:

  HGTraceGuard::~HGTraceGuard((HGTraceGuard *)v228);
  return v175;
}

- (PCRect<double>)inputSizeForPVEffect:(id)a3 igContext:(HGRef<PVInstructionGraphContext>)a4
{
  uint64_t v4;
  uint64_t v6;
  CGFloat *p_ty;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  PCRect<double> result;

  v6 = v4;
  v22 = a3;
  *(_QWORD *)v6 = 0;
  *(_QWORD *)(v6 + 8) = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)(v6 + 16) = _Q0;
  p_ty = &self->super._transform.ty;
  CachedImageInfo::Init((CachedImageInfo *)p_ty);
  if (*((_BYTE *)p_ty + 24))
  {
    v14 = p_ty[1];
    v13 = p_ty[2];
    objc_msgSend(v22, "outputSize");
    if (v13 >= v14)
      v17 = v13 / v16;
    else
      v17 = v14 / v15;
    *(float64x2_t *)(v6 + 16) = vdivq_f64(*(float64x2_t *)(p_ty + 1), (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v17, 0));
  }

  result.var3 = v21;
  result.var2 = v20;
  result.var1 = v19;
  result.var0 = v18;
  return result;
}

- (PCMatrix44Tmpl<double>)pixelTransformForPVEffect:(SEL)a3 igContext:(id)a4
{
  double v8;
  double v9;
  double v10;
  float v11;
  double v12;
  double v13;
  float v14;
  float v15;
  float v16;
  float v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double width;
  double v25;
  double v26;
  double v27;
  float64x2_t v28;
  double v29;
  double v30;
  PCMatrix44Tmpl<double> *result;
  id v32;

  v32 = a4;
  retstr->var0[3][3] = 1.0;
  retstr->var0[2][2] = 1.0;
  retstr->var0[1][1] = 1.0;
  retstr->var0[0][0] = 1.0;
  *(_OWORD *)&retstr->var0[0][1] = 0u;
  *(_OWORD *)&retstr->var0[0][3] = 0u;
  *(_OWORD *)&retstr->var0[1][2] = 0u;
  *(_OWORD *)&retstr->var0[2][0] = 0u;
  *(_OWORD *)&retstr->var0[2][3] = 0u;
  *(_OWORD *)&retstr->var0[3][1] = 0u;
  CachedImageInfo::Init((CachedImageInfo *)&self->super._transform.ty);
  if (LOBYTE(self->m_cachedImageInfo.size.height))
  {
    if (-[PVInstructionGraphImageSourceNode useAnimationInfo](self, "useAnimationInfo")
      || -[PVInstructionGraphSourceNode isOverlayTrack](self, "isOverlayTrack"))
    {
      v8 = (*(double (**)(_QWORD))(**(_QWORD **)a5.m_Obj + 40))(*(_QWORD *)a5.m_Obj);
      v10 = v9;
      v11 = 1.0;
      if (!-[PVInstructionGraphSourceNode isOverlayTrack](self, "isOverlayTrack"))
        v11 = (*(float (**)(_QWORD))(**(_QWORD **)a5.m_Obj + 48))(*(_QWORD *)a5.m_Obj);
      objc_msgSend(v32, "outputSize");
      v13 = v12;
      objc_msgSend(v32, "outputSize");
      v14 = v8;
      v15 = v10;
      v16 = v11 * v14;
      v17 = v11 * v15;
      v19 = v13 / v18;
      v20 = (float)(v14 / v15);
      if (vabdd_f64(v19, v20) >= 0.0000001)
      {
        if (v19 > v20)
        {
LABEL_10:
          objc_msgSend(v32, "outputSize");
          v22 = v17 / v21;
LABEL_15:
          v28 = PCMatrix44Tmpl<double>::leftScale((float64x2_t *)retstr, v22, -v22, 1.0);
          v28.f64[0] = v16;
          v29 = v17;
LABEL_19:
          v28.f64[0] = v28.f64[0] * 0.5;
          PCMatrix44Tmpl<double>::leftTranslate((float64x2_t *)retstr, v28, v29 * 0.5, 0.0);
          goto LABEL_20;
        }
      }
      else if (v17 > v16)
      {
        goto LABEL_10;
      }
      objc_msgSend(v32, "outputSize");
      v22 = v16 / v27;
      goto LABEL_15;
    }
    if ((objc_msgSend(v32, "conformToInputAspect") & 1) != 0)
    {
      v23 = *(double *)&self->m_cachedImageInfo.cached;
      width = self->m_cachedImageInfo.size.width;
      if (width >= v23)
      {
        objc_msgSend(v32, "outputSize");
        v26 = width / v25;
LABEL_18:
        v28 = PCMatrix44Tmpl<double>::leftScale((float64x2_t *)retstr, v26, -v26, 1.0);
        v28.f64[0] = *(float64_t *)&self->m_cachedImageInfo.cached;
        v29 = self->m_cachedImageInfo.size.width;
        goto LABEL_19;
      }
    }
    else
    {
      v23 = *(double *)&self->m_cachedImageInfo.cached;
    }
    objc_msgSend(v32, "outputSize");
    v26 = v23 / v30;
    goto LABEL_18;
  }
LABEL_20:

  return result;
}

- (id)dotTreeLabel:(HGRef<PVInstructionGraphContext>)a3
{
  void *v4;
  void *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *(_QWORD *)a3.m_Obj;
  if (v8)
    (*(void (**)(uint64_t, SEL))(*(_QWORD *)v8 + 16))(v8, a2);
  v7.receiver = self;
  v7.super_class = (Class)PVInstructionGraphImageSourceNode;
  -[PVInstructionGraphNode dotTreeLabel:](&v7, sel_dotTreeLabel_, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 24))(v8);
  objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(" [%.0f, %.0f]"), *(_QWORD *)&self->m_cachedImageInfo.cached, *(_QWORD *)&self->m_cachedImageInfo.size.width);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)instructionGraphNodeDescription
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PVInstructionGraphImageSourceNode;
  -[PVInstructionGraphSourceNode instructionGraphNodeDescription](&v12, sel_instructionGraphNodeDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("class"));

  objc_msgSend(*(id *)&self->_fillMode, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(*(id *)&self->_fillMode, "absoluteString");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("unable to get url.path as string");
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("imageURL"));
  if (v7)

  -[PVInstructionGraphImageSourceNode key](self, "key");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("imageKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIDWORD(self->_keyHDRGainMap));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("renderingIntent"));

  return v4;
}

- (NSURL)url
{
  return *(NSURL **)&self->_fillMode;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_fillMode, a3);
}

- (NSString)key
{
  return (NSString *)&self->_url->super.isa;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (PVImageDelegate)imageDelegate
{
  return (PVImageDelegate *)self->_key;
}

- (void)setImageDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (int)renderingIntent
{
  return HIDWORD(self->_keyHDRGainMap);
}

- (void)setRenderingIntent:(int)a3
{
  HIDWORD(self->_keyHDRGainMap) = a3;
}

- (BOOL)useAnimationInfo
{
  return (BOOL)self->_keyHDRGainMap;
}

- (void)setUseAnimationInfo:(BOOL)a3
{
  LOBYTE(self->_keyHDRGainMap) = a3;
}

- (int)fillMode
{
  return *(_DWORD *)&self->_useAnimationInfo;
}

- (void)setFillMode:(int)a3
{
  *(_DWORD *)&self->_useAnimationInfo = a3;
}

- (void).cxx_destruct
{
  HGSynchronizable *lock;
  CGFloat *p_ty;
  uint64_t v5;

  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_fillMode, 0);
  objc_storeStrong((id *)&self->_useHDRGainMap, 0);
  lock = self->m_cachedImageInfo._lock;
  if (lock)
    (*((void (**)(HGSynchronizable *))lock->var0 + 3))(lock);
  p_ty = &self->super._transform.ty;
  v5 = *((_QWORD *)p_ty + 5);
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  objc_destroyWeak((id *)p_ty + 4);
}

- (id).cxx_construct
{
  CachedImageInfo::CachedImageInfo((CachedImageInfo *)&self->super._transform.ty);
  self->m_cachedImageInfo._lock = 0;
  return self;
}

@end
