@implementation PBUICachedSnapshotEffectProvider

- (id)snapshotSourceForObserver:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[PBUICachedSnapshotEffectProvider _effectConfigurationForObserver:]((uint64_t)self, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)-[PBUIBakedEffectSnapshotSource copy](self->_currentSource, "copy");
  objc_msgSend(v5, "setEffectConfiguration:", v4);
  -[PBUICachedSnapshotEffectProvider imageForConfiguration:]((id *)&self->super.isa, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSnapshot:", v6);

  return v5;
}

- (id)imageForConfiguration:(id *)a1
{
  double *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  double *v9;
  id v10;
  id location;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1[6], "snapshot");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PBUIFakeBlurAsset imageURL]((uint64_t)v3) && v4)
    {
      -[PBUICachedSnapshotEffectProvider cacheKeyForConfiguration:]((uint64_t)a1, v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, a1);
      v6 = a1[8];
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __58__PBUICachedSnapshotEffectProvider_imageForConfiguration___block_invoke;
      v8[3] = &unk_1E6B95AA8;
      objc_copyWeak(&v10, &location);
      v9 = v3;
      objc_msgSend(v6, "imageForKey:generatingIfNecessaryWithBlock:", v5, v8);
      a1 = (id *)objc_claimAutoreleasedReturnValue();

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);

    }
    else
    {
      a1 = v4;
    }

  }
  return a1;
}

- (id)cacheKeyForConfiguration:(uint64_t)a1
{
  void *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    -[PBUIWallpaperEffectConfiguration uniqueIdentifier](a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("CachedSnapshot-%@"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_effectConfigurationForObserver:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 48), "legibilitySettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEAB40], "currentTraitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceStyle");

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "traitCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      v10 = v8;
      if (v9)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v11 = v10;
        else
          v11 = 0;
      }
      else
      {
        v11 = 0;
      }
      v12 = v11;

      if (v12)
        v7 = objc_msgSend(v12, "userInterfaceStyle");

    }
    v13 = -[PBUIWallpaperEffectConfiguration initWithStyle:contentColor:userInterfaceStyle:]([PBUIWallpaperEffectConfiguration alloc], objc_msgSend(v3, "effectiveStyle"), v5, v7);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)initForSnapshotProvider:(id)a3 cacheIdentifier:(id)a4
{
  id v7;
  id v8;
  PBUICachedSnapshotEffectProvider *v9;
  PBUICachedSnapshotEffectProvider *v10;
  PBUIBackdropCompositor *v11;
  PBUIWallpaperEffectCompositor *backdropCompositor;
  PBUIMaterialCompositor *v13;
  PBUIWallpaperEffectCompositor *materialCompositor;
  void *v15;
  uint64_t v16;
  PUIManagedCacheIdentifying *cache;
  uint64_t v18;
  NSString *cacheIdentifier;
  PBUIReplicaSourceObserverBox *v20;
  uint64_t v21;
  PBUIReplicaSourceObserverBox *observers;
  _QWORD v24[4];
  id v25;
  id location;
  objc_super v27;

  v7 = a3;
  v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)PBUICachedSnapshotEffectProvider;
  v9 = -[PBUICachedSnapshotEffectProvider init](&v27, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_snapshotProvider, a3);
    v11 = objc_alloc_init(PBUIBackdropCompositor);
    backdropCompositor = v10->_backdropCompositor;
    v10->_backdropCompositor = (PBUIWallpaperEffectCompositor *)v11;

    v13 = objc_alloc_init(PBUIMaterialCompositor);
    materialCompositor = v10->_materialCompositor;
    v10->_materialCompositor = (PBUIWallpaperEffectCompositor *)v13;

    objc_msgSend(getPUIMappedImageCacheManagerClass(), "defaultCacheManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "checkoutImageCache:", v8);
    v16 = objc_claimAutoreleasedReturnValue();
    cache = v10->_cache;
    v10->_cache = (PUIManagedCacheIdentifying *)v16;

    v18 = objc_msgSend(v8, "copy");
    cacheIdentifier = v10->_cacheIdentifier;
    v10->_cacheIdentifier = (NSString *)v18;

    objc_initWeak(&location, v10);
    v20 = [PBUIReplicaSourceObserverBox alloc];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __76__PBUICachedSnapshotEffectProvider_initForSnapshotProvider_cacheIdentifier___block_invoke;
    v24[3] = &unk_1E6B95A80;
    objc_copyWeak(&v25, &location);
    v21 = -[PBUIReplicaSourceObserverBox initWithIdentifier:activeStateDidChangeHandler:](v20, "initWithIdentifier:activeStateDidChangeHandler:", &stru_1E6B97EB0, v24);
    observers = v10->_observers;
    v10->_observers = (PBUIReplicaSourceObserverBox *)v21;

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __76__PBUICachedSnapshotEffectProvider_initForSnapshotProvider_cacheIdentifier___block_invoke(uint64_t a1, int a2)
{
  id *WeakRetained;
  uint64_t v4;
  id v5;
  id v6;
  id *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    if (a2)
    {
      objc_msgSend(WeakRetained[2], "registerSnapshotSourceObserver:", WeakRetained);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = v7[1];
      v7[1] = (id)v4;

      objc_msgSend(v7, "setNeedsSourceUpdate");
    }
    else
    {
      objc_msgSend(WeakRetained[1], "invalidate");
      v6 = v7[1];
      v7[1] = 0;

    }
    WeakRetained = v7;
  }

}

- (void)setCacheIdentifier:(uint64_t)a1
{
  id v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  if (a1)
  {
    v12 = v3;
    v4 = BSEqualStrings();
    v3 = v12;
    if ((v4 & 1) == 0)
    {
      objc_msgSend(getPUIMappedImageCacheManagerClass(), "defaultCacheManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v12)
      {
        objc_msgSend(v5, "checkoutImageCache:");
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = *(void **)(a1 + 64);
        *(_QWORD *)(a1 + 64) = v7;

        v9 = objc_msgSend(v12, "copy");
      }
      else
      {
        v10 = *(void **)(a1 + 64);
        *(_QWORD *)(a1 + 64) = 0;

        v9 = 0;
      }
      v11 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v9;

      v3 = v12;
    }
  }

}

- (void)setSnapshotProvider:(id)a3
{
  PBUIPosterReplicaSnapshotProviding *v5;
  PBUIPosterReplicaSnapshotProviding *v6;

  v5 = (PBUIPosterReplicaSnapshotProviding *)a3;
  if (self->_snapshotProvider != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_snapshotProvider, a3);
    -[PBUICachedSnapshotEffectProvider setNeedsSourceUpdate](self, "setNeedsSourceUpdate");
    v5 = v6;
  }

}

- (void)dealloc
{
  objc_super v3;

  -[PBUICachedSnapshotEffectProvider invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PBUICachedSnapshotEffectProvider;
  -[PBUICachedSnapshotEffectProvider dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  PUIManagedCacheIdentifying *cache;
  NSString *cacheIdentifier;

  -[BSInvalidatable invalidate](self->_snapshotSubscription, "invalidate");
  -[PBUIReplicaSourceObserverBox invalidate](self->_observers, "invalidate");
  cache = self->_cache;
  self->_cache = 0;

  cacheIdentifier = self->_cacheIdentifier;
  self->_cacheIdentifier = 0;

}

- (int64_t)effectiveStyle
{
  return 0;
}

- (void)setNeedsSourceUpdate
{
  PBUIBakedEffectSnapshotSource *v3;
  void *v4;
  void *v5;
  char v6;
  PBUIBakedEffectSnapshotSource *currentSource;
  PBUIBakedEffectSnapshotSource *v8;
  id v9;

  -[PBUIPosterReplicaSnapshotProviding snapshotSourceForObserver:](self->_snapshotProvider, "snapshotSourceForObserver:", self);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PBUICachedSnapshotEffectProvider makeBakedEffectSourceFrom:]((uint64_t)self, v9);
  v3 = (PBUIBakedEffectSnapshotSource *)objc_claimAutoreleasedReturnValue();
  -[PBUIBakedEffectSnapshotSource cacheIdentifier](self->_currentSource, "cacheIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cacheIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = BSEqualObjects();

  if ((v6 & 1) == 0)
    -[PUIManagedCacheIdentifying removeAllImagesWithCompletion:](self->_cache, "removeAllImagesWithCompletion:", 0);
  currentSource = self->_currentSource;
  self->_currentSource = v3;
  v8 = v3;

  -[PBUIReplicaSourceObserverBox setNeedsSourceUpdate](self->_observers, "setNeedsSourceUpdate");
}

- (PBUIBakedEffectSnapshotSource)makeBakedEffectSourceFrom:(uint64_t)a1
{
  id v2;
  PBUIBakedEffectSnapshotSource *v3;

  if (a1)
  {
    v2 = a2;
    v3 = -[PBUIBakedEffectSnapshotSource initWithSnapshotSource:]([PBUIBakedEffectSnapshotSource alloc], "initWithSnapshotSource:", v2);

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)registerSnapshotSourceObserver:(id)a3
{
  return -[PBUIReplicaSourceObserverBox registerSourceObserver:](self->_observers, "registerSourceObserver:", a3);
}

id __58__PBUICachedSnapshotEffectProvider_imageForConfiguration___block_invoke(uint64_t a1, _QWORD *a2)
{
  int v4;
  uint64_t v5;
  id *WeakRetained;
  void *v7;
  void *v8;

  v4 = MGGetBoolAnswer();
  v5 = 4;
  if (!v4)
    v5 = 0;
  *a2 |= v5;
  if (MGGetBoolAnswer())
    *a2 |= 2uLL;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained[6], "snapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUICachedSnapshotEffectProvider compositeImage:effectConfiguration:]((uint64_t)WeakRetained, v7, *(void **)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)compositeImage:(void *)a3 effectConfiguration:
{
  void *v3;
  id v6;
  id v7;
  _BOOL4 v8;
  uint64_t v9;
  id v10;

  v3 = 0;
  if (a1 && a2)
  {
    v6 = a3;
    v7 = a2;
    v8 = -[PBUIWallpaperEffectConfiguration requiresMaterialKitRendering]((_BOOL8)v6);
    v9 = 32;
    if (v8)
      v9 = 40;
    v10 = *(id *)(a1 + v9);
    objc_msgSend(v10, "applyEffect:toImage:", v6, v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (uint64_t)cacheIdentifier
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

- (uint64_t)cache
{
  if (result)
    return *(_QWORD *)(result + 64);
  return result;
}

- (void)setCache:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 64), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_cacheIdentifier, 0);
  objc_storeStrong((id *)&self->_currentSource, 0);
  objc_storeStrong((id *)&self->_materialCompositor, 0);
  objc_storeStrong((id *)&self->_backdropCompositor, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_snapshotProvider, 0);
  objc_storeStrong((id *)&self->_snapshotSubscription, 0);
}

@end
