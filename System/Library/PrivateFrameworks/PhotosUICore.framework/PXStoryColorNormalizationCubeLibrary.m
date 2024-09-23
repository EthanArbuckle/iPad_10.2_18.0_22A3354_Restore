@implementation PXStoryColorNormalizationCubeLibrary

- (PXStoryColorNormalizationCubeLibrary)initWithColorSpace:(CGColorSpace *)a3
{
  PXStoryColorNormalizationCubeLibrary *v4;
  PXStoryColorNormalizationCubeLibrary *v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  NSMutableIndexSet *v10;
  NSMutableIndexSet *lock_activeRequests;
  NSCache *v12;
  NSCache *lock_cubeByAssetNormalization;
  uint64_t v14;
  NSMapTable *lock_aliveCubesByAssetNormalization;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PXStoryColorNormalizationCubeLibrary;
  v4 = -[PXStoryColorNormalizationCubeLibrary init](&v18, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_DEFAULT, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.photos.color-normalization-cube-library", v7);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    v10 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    lock_activeRequests = v5->_lock_activeRequests;
    v5->_lock_activeRequests = v10;

    v12 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    lock_cubeByAssetNormalization = v5->_lock_cubeByAssetNormalization;
    v5->_lock_cubeByAssetNormalization = v12;

    -[NSCache setCountLimit:](v5->_lock_cubeByAssetNormalization, "setCountLimit:", 150);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v14 = objc_claimAutoreleasedReturnValue();
    lock_aliveCubesByAssetNormalization = v5->_lock_aliveCubesByAssetNormalization;
    v5->_lock_aliveCubesByAssetNormalization = (NSMapTable *)v14;

    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_cubeEdgeSize = objc_msgSend(v16, "colorNormalizationCubeEdgeSize");

    v5->_colorspace = CGColorSpaceRetain(a3);
  }
  return v5;
}

- (PXStoryColorNormalizationCubeLibrary)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryColorNormalizationCubeLibrary.m"), 78, CFSTR("%s is not available as initializer"), "-[PXStoryColorNormalizationCubeLibrary init]");

  abort();
}

- (void)dealloc
{
  objc_super v3;

  CGColorSpaceRelease(self->_colorspace);
  v3.receiver = self;
  v3.super_class = (Class)PXStoryColorNormalizationCubeLibrary;
  -[PXStoryColorNormalizationCubeLibrary dealloc](&v3, sel_dealloc);
}

- (void)cancelRequest:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableIndexSet removeIndex:](self->_lock_activeRequests, "removeIndex:", a3);
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)requestColorCubeForAssetNormalization:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, uint64_t, int64_t);
  signed int v8;
  int64_t v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  NSObject *queue;
  _QWORD block[4];
  id v16;
  void (**v17)(id, void *, uint64_t, int64_t);
  id v18[2];
  id location;

  v6 = a3;
  v7 = (void (**)(id, void *, uint64_t, int64_t))a4;
  os_unfair_lock_lock(&self->_lock);
  do
    v8 = __ldaxr(_makeNextTextureRequestID_lastRequestID);
  while (__stlxr(v8 + 1, _makeNextTextureRequestID_lastRequestID));
  v9 = v8;
  -[NSMutableIndexSet addIndex:](self->_lock_activeRequests, "addIndex:", v8);
  if (v6)
  {
    -[NSCache objectForKey:](self->_lock_cubeByAssetNormalization, "objectForKey:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      -[NSMapTable objectForKey:](self->_lock_aliveCubesByAssetNormalization, "objectForKey:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        -[NSCache setObject:forKey:](self->_lock_cubeByAssetNormalization, "setObject:forKey:", v10, v6);
    }
  }
  else
  {
    v10 = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
  if (v6)
    v11 = v10 == 0;
  else
    v11 = 0;
  v12 = !v11;
  v7[2](v7, v10, v12, v9);
  if ((v12 & 1) == 0)
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __96__PXStoryColorNormalizationCubeLibrary_requestColorCubeForAssetNormalization_completionHandler___block_invoke;
    block[3] = &unk_1E513C468;
    objc_copyWeak(v18, &location);
    v18[1] = (id)v9;
    v16 = v6;
    v17 = v7;
    dispatch_async(queue, block);

    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (BOOL)_isRequestActive:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(a3) = -[NSMutableIndexSet containsIndex:](self->_lock_activeRequests, "containsIndex:", a3);
  os_unfair_lock_unlock(p_lock);
  return a3;
}

- (void)_cacheColorCube:(id)a3 forAssetNormalization:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMapTable setObject:forKey:](self->_lock_aliveCubesByAssetNormalization, "setObject:forKey:", v8, v7);
  -[NSCache setObject:forKey:](self->_lock_cubeByAssetNormalization, "setObject:forKey:", v8, v7);

  os_unfair_lock_unlock(p_lock);
}

- (void)_queue_performRequestWithID:(int64_t)a3 forAssetNormalization:(id)a4 completionHandler:(id)a5
{
  void (**v9)(id, void *, uint64_t, int64_t);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  v9 = (void (**)(id, void *, uint64_t, int64_t))a5;
  if (-[PXStoryColorNormalizationCubeLibrary _isRequestActive:](self, "_isRequestActive:", a3))
  {
    +[PXStoryColorNormalizationAdjustment colorCubeForNormalization:targetColorSpace:](PXStoryColorNormalizationAdjustment, "colorCubeForNormalization:targetColorSpace:", v15, self->_colorspace);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryColorNormalizationCubeLibrary.m"), 150, CFSTR("Unable to create colorCubeData for assetNormalization:%@"), v15);

    }
    v11 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B2D78), "initWithData:edgeSize:pixelFormat:", v10, self->_cubeEdgeSize, 70);
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryColorNormalizationCubeLibrary _queue_performRequestWithID:forAssetNormalization:completionHandler:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXStoryColorNormalizationCubeLibrary.m"), 153, CFSTR("Unable to create cube for %@ data:%@"), v15, v10);

    }
    -[PXStoryColorNormalizationCubeLibrary _cacheColorCube:forAssetNormalization:](self, "_cacheColorCube:forAssetNormalization:", v11, v15);
    v9[2](v9, v11, 2, a3);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_aliveCubesByAssetNormalization, 0);
  objc_storeStrong((id *)&self->_lock_cubeByAssetNormalization, 0);
  objc_storeStrong((id *)&self->_lock_activeRequests, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __96__PXStoryColorNormalizationCubeLibrary_requestColorCubeForAssetNormalization_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_queue_performRequestWithID:forAssetNormalization:completionHandler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

+ (PXStoryColorNormalizationCubeLibrary)sharedInstance
{
  if (sharedInstance_onceToken_241609 != -1)
    dispatch_once(&sharedInstance_onceToken_241609, &__block_literal_global_241610);
  return (PXStoryColorNormalizationCubeLibrary *)(id)sharedInstance_sharedInstance_241611;
}

void __54__PXStoryColorNormalizationCubeLibrary_sharedInstance__block_invoke()
{
  uint64_t v0;
  PXStoryColorNormalizationCubeLibrary *v1;
  void *v2;

  if (PXGDeviceIsKnownToHaveExtendedColorDisplay())
    v0 = 11;
  else
    v0 = 12;
  v1 = -[PXStoryColorNormalizationCubeLibrary initWithColorSpace:]([PXStoryColorNormalizationCubeLibrary alloc], "initWithColorSpace:", MEMORY[0x1A85CCEEC](v0));
  v2 = (void *)sharedInstance_sharedInstance_241611;
  sharedInstance_sharedInstance_241611 = (uint64_t)v1;

}

@end
