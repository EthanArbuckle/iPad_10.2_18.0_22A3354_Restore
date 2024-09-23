@implementation PXGCGImageTextureProvider

uint64_t __44__PXGCGImageTextureProvider_invalidateCache__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "removeAllObjects");
}

- (PXGCGImageTextureProvider)init
{
  PXGCGImageTextureProvider *v2;
  NSCache *v3;
  NSCache *imageCache;
  uint64_t v5;
  NSMapTable *aliveImagesCache;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGCGImageTextureProvider;
  v2 = -[PXGTextureProvider init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    imageCache = v2->_imageCache;
    v2->_imageCache = v3;

    -[NSCache setTotalCostLimit:](v2->_imageCache, "setTotalCostLimit:", 15728640);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    aliveImagesCache = v2->_aliveImagesCache;
    v2->_aliveImagesCache = (NSMapTable *)v5;

    -[PXGCGImageTextureProvider _updateCacheLimit](v2, "_updateCacheLimit");
  }
  return v2;
}

- (void)_updateCacheLimit
{
  uint64_t v3;

  if (-[PXGTextureProvider lowMemoryMode](self, "lowMemoryMode"))
    v3 = 5242880;
  else
    v3 = 15728640;
  -[NSCache setTotalCostLimit:](self->_imageCache, "setTotalCostLimit:", v3);
}

- (void)requestCGImageAndAdditionalInfoWithCacheKey:(id)a3 imageProvider:(id)a4 resultHandler:(id)a5
{
  uint64_t (**v9)(_QWORD);
  void (**v10)(id, id, void *);
  NSObject *v11;
  id v12;
  void *v13;
  CGImage *v14;
  size_t Width;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a3;
  v9 = (uint64_t (**)(_QWORD))a4;
  v10 = (void (**)(id, id, void *))a5;
  -[PXGCGImageTextureProvider workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v12 = -[NSCache objectForKey:](self->_imageCache, "objectForKey:", v18);
  -[NSCache objectForKey:](self->_additionalInfoCache, "objectForKey:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v10[2](v10, v12, v13);
  }
  else
  {
    kdebug_trace();
    v14 = (CGImage *)v9[2](v9);
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGCGImageTextureProvider.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("imageRef != nil"));

    }
    CGImageGetWidth(v14);
    CGImageGetHeight(v14);
    kdebug_trace();
    Width = CGImageGetWidth(v14);
    -[NSCache setObject:forKey:cost:](self->_imageCache, "setObject:forKey:cost:", v14, v18, 4 * Width * CGImageGetHeight(v14));
    -[NSCache objectForKey:](self->_additionalInfoCache, "objectForKey:", v18);
    v16 = objc_claimAutoreleasedReturnValue();

    v10[2](v10, v14, (void *)v16);
    CGImageRelease(v14);
    v13 = (void *)v16;
  }

}

- (void)invalidateCache
{
  NSObject *v3;
  _QWORD block[5];

  -[PXGCGImageTextureProvider _clearStrongCaches](self, "_clearStrongCaches");
  -[PXGCGImageTextureProvider workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PXGCGImageTextureProvider_invalidateCache__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_clearStrongCaches
{
  -[NSCache removeAllObjects](self->_imageCache, "removeAllObjects");
  -[NSCache removeAllObjects](self->_additionalInfoCache, "removeAllObjects");
}

- (void)cacheAdditionalInfo:(id)a3 withKey:(id)a4
{
  id v6;
  NSObject *v7;
  NSCache *additionalInfoCache;
  NSCache *v9;
  NSCache *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[PXGCGImageTextureProvider workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  additionalInfoCache = self->_additionalInfoCache;
  if (!additionalInfoCache)
  {
    v9 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    v10 = self->_additionalInfoCache;
    self->_additionalInfoCache = v9;

    additionalInfoCache = self->_additionalInfoCache;
  }
  -[NSCache setObject:forKey:](additionalInfoCache, "setObject:forKey:", v11, v6);

}

- (void)requestCGImageWithCacheKey:(id)a3 imageProvider:(id)a4 resultHandler:(id)a5
{
  uint64_t (**v9)(_QWORD);
  void (**v10)(id, id);
  NSObject *v11;
  id v12;
  CGImage *v13;
  size_t Width;
  size_t Height;
  void *v16;
  id v17;

  v17 = a3;
  v9 = (uint64_t (**)(_QWORD))a4;
  v10 = (void (**)(id, id))a5;
  -[PXGCGImageTextureProvider workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v12 = -[NSCache objectForKey:](self->_imageCache, "objectForKey:", v17);
  if (v12 || (v12 = -[NSMapTable objectForKey:](self->_aliveImagesCache, "objectForKey:", v17)) != 0)
  {
    v10[2](v10, v12);
  }
  else
  {
    kdebug_trace();
    v13 = (CGImage *)v9[2](v9);
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGCGImageTextureProvider.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("imageRef != nil"));

    }
    Width = CGImageGetWidth(v13);
    Height = CGImageGetHeight(v13);
    kdebug_trace();
    -[NSCache setObject:forKey:cost:](self->_imageCache, "setObject:forKey:cost:", v13, v17, 4 * Width * Height);
    -[NSMapTable setObject:forKey:](self->_aliveImagesCache, "setObject:forKey:", v13, v17);
    v10[2](v10, v13);
    CGImageRelease(v13);
  }

}

- (void)lowMemoryModeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGCGImageTextureProvider;
  -[PXGTextureProvider lowMemoryModeDidChange](&v3, sel_lowMemoryModeDidChange);
  -[PXGCGImageTextureProvider _updateCacheLimit](self, "_updateCacheLimit");
}

- (void)releaseCachedResources
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGCGImageTextureProvider;
  -[PXGTextureProvider releaseCachedResources](&v3, sel_releaseCachedResources);
  -[PXGCGImageTextureProvider _clearStrongCaches](self, "_clearStrongCaches");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aliveImagesCache, 0);
  objc_storeStrong((id *)&self->_additionalInfoCache, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
}

@end
