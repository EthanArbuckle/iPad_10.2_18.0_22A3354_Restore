@implementation SBHIconImageCache

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (id)imageForIcon:(id)a3
{
  return -[SBHIconImageCache imageForIcon:options:](self, "imageForIcon:options:", a3, 0);
}

- (void)beginObservingIconIfNecessary:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (!-[NSHashTable containsObject:](self->_observedIcons, "containsObject:", v4))
  {
    -[NSHashTable addObject:](self->_observedIcons, "addObject:", v4);
    objc_msgSend(v4, "addObserver:", self);
    SBLogIconImageCache();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[SBHIconImageCache beginObservingIconIfNecessary:].cold.1();

    -[SBHIconImageCache cachedImageForIcon:compatibleWithTraitCollection:options:](self, "cachedImageForIcon:compatibleWithTraitCollection:options:", v4, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      +[SBHIconImageAppearance lightAppearance](SBHIconImageAppearance, "lightAppearance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHIconImageCache notifyObserversOfUpdateForIcon:imageAppearance:requestStartTimestamp:elapsedTime:](self, "notifyObserversOfUpdateForIcon:imageAppearance:requestStartTimestamp:elapsedTime:", v4, v7, 0, 0.0);

    }
  }

}

- (CPMemoryPool)iconImagesMemoryPool
{
  return self->_iconImagesMemoryPool;
}

- (id)imageForIcon:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;
  void *v9;

  v6 = a3;
  BSDispatchQueueAssertMain();
  -[SBHIconImageCache realImageForIcon:compatibleWithTraitCollection:options:](self, "realImageForIcon:compatibleWithTraitCollection:options:", v6, 0, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (objc_msgSend((id)objc_opt_class(), "hasIconImage"))
    {
      v8 = -[SBHIconImageCache isCachingImageForIcon:](self, "isCachingImageForIcon:", v6);
      +[SBHIconImageAppearance defaultAppearance](SBHIconImageAppearance, "defaultAppearance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        -[SBHIconImageCache cachingPlaceholderImageWithImageAppearance:options:](self, "cachingPlaceholderImageWithImageAppearance:options:", v9, a4);
      else
        -[SBHIconImageCache genericImageWithImageAppearance:options:](self, "genericImageWithImageAppearance:options:", v9, a4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (void)addObserver:(id)a3
{
  NSHashTable *observers;
  NSHashTable *v5;
  NSHashTable *v6;
  id v7;

  v7 = a3;
  BSDispatchQueueAssertMain();
  observers = self->_observers;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v6 = self->_observers;
    self->_observers = v5;

    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v7);

}

- (void)removeObserver:(id)a3
{
  id v4;

  v4 = a3;
  BSDispatchQueueAssertMain();
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);

}

- (SBHIconImageCache)initWithName:(id)a3 iconImageInfo:(SBIconImageInfo *)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v13;
  SBHIconImageCache *v14;
  uint64_t v15;
  NSString *name;
  uint64_t v17;
  uint64_t v18;
  CPMemoryPool *iconImagesMemoryPool;
  SBHIconImageVariantCache *v20;
  SBHIconImageVariantCache *maskedCache;
  SBHIconImageVariantCache *v22;
  SBHIconImageVariantCache *v23;
  SBHIconImageVariantCache *unmaskedCache;
  SBHIconImageVariantCache *v25;
  uint64_t v26;
  NSHashTable *observedIcons;
  uint64_t v28;
  NSMapTable *iconImageGenerations;
  objc_super v31;

  v8 = v7;
  v9 = v6;
  v10 = v5;
  v11 = v4;
  v13 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SBHIconImageCache;
  v14 = -[SBHIconImageCache init](&v31, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v13, "copy");
    name = v14->_name;
    v14->_name = (NSString *)v15;

    v14->_iconImageInfo.size.width = v11;
    v14->_iconImageInfo.size.height = v10;
    v14->_iconImageInfo.scale = v9;
    v14->_iconImageInfo.continuousCornerRadius = v8;
    if (objc_msgSend((id)objc_opt_class(), "supportsMemoryPooling"))
    {
      v17 = objc_msgSend(MEMORY[0x1E0DC3870], "sbf_bytesNeededForSize:scale:withContextType:", 0, v11, v10, v9);
      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFA9A0]), "initWithLabel:slotLength:", objc_msgSend(objc_retainAutorelease(v13), "UTF8String"), v17);
      iconImagesMemoryPool = v14->_iconImagesMemoryPool;
      v14->_iconImagesMemoryPool = (CPMemoryPool *)v18;

    }
    v20 = (SBHIconImageVariantCache *)-[SBHIconImageVariantCache initWithVariant:iconImageInfo:]([SBHIconImageVariantCache alloc], 0, v11, v10, v9, v8);
    maskedCache = v14->_maskedCache;
    v14->_maskedCache = v20;

    v22 = v14->_maskedCache;
    if (v22)
      objc_storeWeak((id *)&v22->_iconImageCache, v14);
    v23 = (SBHIconImageVariantCache *)-[SBHIconImageVariantCache initWithVariant:iconImageInfo:]([SBHIconImageVariantCache alloc], 1, v11, v10, v9, v8);
    unmaskedCache = v14->_unmaskedCache;
    v14->_unmaskedCache = v23;

    v25 = v14->_unmaskedCache;
    if (v25)
      objc_storeWeak((id *)&v25->_iconImageCache, v14);
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v26 = objc_claimAutoreleasedReturnValue();
    observedIcons = v14->_observedIcons;
    v14->_observedIcons = (NSHashTable *)v26;

    v14->_purgesCachedImagesImmediatelyUponIconUpdate = 1;
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v28 = objc_claimAutoreleasedReturnValue();
    iconImageGenerations = v14->_iconImageGenerations;
    v14->_iconImageGenerations = (NSMapTable *)v28;

  }
  return v14;
}

- (BOOL)_canPoolImage
{
  int v3;
  unint64_t v4;

  v3 = objc_msgSend((id)objc_opt_class(), "supportsMemoryPooling");
  if (v3)
  {
    do
      v4 = __ldxr(&_canPoolImage___poolOptOutCount);
    while (__stxr(v4 + 1, &_canPoolImage___poolOptOutCount));
    LOBYTE(v3) = v4 >= -[SBHIconImageCache poolingBypassCount](self, "poolingBypassCount");
  }
  return v3;
}

+ (BOOL)supportsMemoryPooling
{
  return 1;
}

- (unint64_t)poolingBypassCount
{
  return self->_poolingBypassCount;
}

- (void)cacheImageForIcon:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHIconImageCache cacheImagesForIcons:options:completionHandler:](self, "cacheImagesForIcons:options:completionHandler:", v11, a4, v9, v12, v13);
}

- (void)cacheImagesForIcons:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__SBHIconImageCache_cacheImagesForIcons_options_completionHandler___block_invoke;
  v11[3] = &unk_1E8D84CE0;
  v12 = v8;
  v9 = v8;
  v10 = -[SBHIconImageCache cacheImagesForIcons:compatibleWithTraitCollections:options:completionHandler:](self, "cacheImagesForIcons:compatibleWithTraitCollections:options:completionHandler:", a3, MEMORY[0x1E0C9AA60], a4, v11);

}

- (void)cacheImagesForIcons:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = -[SBHIconImageCache imageForIcon:](self, "imageForIcon:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (id)cachedImageForIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  BSDispatchQueueAssertMain();
  -[SBHIconImageCache cachedImageForIcon:compatibleWithTraitCollection:options:](self, "cachedImageForIcon:compatibleWithTraitCollection:options:", v4, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if ((__sb__runningInSpringBoard() & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHIconImageCache cachedImageForIcon:compatibleWithTraitCollection:options:](self, "cachedImageForIcon:compatibleWithTraitCollection:options:", v4, v6, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
        -[SBHIconImageCache lastCachedImageAppearance](self, "lastCachedImageAppearance");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          objc_msgSend(MEMORY[0x1E0DC3E88], "sbh_traitCollectionWithIconImageAppearance:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBHIconImageCache cachedImageForIcon:compatibleWithTraitCollection:options:](self, "cachedImageForIcon:compatibleWithTraitCollection:options:", v4, v8, 0);
          v5 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v5 = 0;
        }

      }
    }
  }

  return v5;
}

- (id)unmaskedImageForIcon:(id)a3 options:(unint64_t)a4
{
  id v6;
  SBHIconImageVariantCache *unmaskedCache;
  void *v8;
  void *v9;

  v6 = a3;
  BSDispatchQueueAssertMain();
  unmaskedCache = self->_unmaskedCache;
  +[SBHIconImageAppearance defaultAppearance](SBHIconImageAppearance, "defaultAppearance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconImageVariantCache realImageForIcon:imageAppearance:options:]((uint64_t)unmaskedCache, v6, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHIconImageCache beginObservingIconIfNecessary:](self, "beginObservingIconIfNecessary:", v6);
  return v9;
}

- (id)unmaskedImageForIcon:(id)a3
{
  return -[SBHIconImageCache unmaskedImageForIcon:options:](self, "unmaskedImageForIcon:options:", a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCachedImageAppearance, 0);
  objc_storeStrong((id *)&self->_iconImagesMemoryPool, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_iconImageGenerations, 0);
  objc_storeStrong((id *)&self->_performAfterCachingActivityBlocks, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observedIcons, 0);
  objc_storeStrong((id *)&self->_tintingBackgroundImage, 0);
  objc_storeStrong((id *)&self->_unmaskedOverlayImage, 0);
  objc_storeStrong((id *)&self->_overlayImage, 0);
  objc_storeStrong((id *)&self->_unmaskedCache, 0);
  objc_storeStrong((id *)&self->_maskedCache, 0);
}

uint64_t __67__SBHIconImageCache_cacheImagesForIcons_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (id)_workQueue
{
  if (_workQueue_onceToken != -1)
    dispatch_once(&_workQueue_onceToken, &__block_literal_global_0);
  return (id)_workQueue__workQueue;
}

void __31__SBHIconImageCache__workQueue__block_invoke()
{
  dispatch_workloop_t v0;
  void *v1;

  v0 = dispatch_workloop_create("com.SpringBoardHome.SBHIconImageCache.work");
  v1 = (void *)_workQueue__workQueue;
  _workQueue__workQueue = (uint64_t)v0;

}

- (id)imageForIcon:(id)a3 compatibleWithTraitCollection:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0DC3E88], "sbh_iconImageAppearanceFromTraitCollection:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHIconImageCache imageForIcon:imageAppearance:options:](self, "imageForIcon:imageAppearance:options:", v9, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)imageForIcon:(id)a3 imageAppearance:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;

  v8 = a3;
  v9 = a4;
  BSDispatchQueueAssertMain();
  -[SBHIconImageCache cachedImageForIcon:imageAppearance:options:](self, "cachedImageForIcon:imageAppearance:options:", v8, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((a5 & 4) != 0 || v10)
  {
    v15 = v10;
LABEL_12:
    v12 = v15;
    goto LABEL_13;
  }
  -[SBHIconImageCache realImageForIcon:imageAppearance:options:](self, "realImageForIcon:imageAppearance:options:", v8, v9, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v13 = objc_msgSend((id)objc_opt_class(), "canFallBackToLightImageForImageAppearance:", v9);
    if ((a5 & 0x10) != 0
      || !v13
      || (+[SBHIconImageAppearance defaultAppearance](SBHIconImageAppearance, "defaultAppearance"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          -[SBHIconImageCache cachedImageForIcon:imageAppearance:options:](self, "cachedImageForIcon:imageAppearance:options:", v8, v14, a5), v12 = (void *)objc_claimAutoreleasedReturnValue(), v14, !v12))
    {
      if (!objc_msgSend((id)objc_opt_class(), "hasIconImage"))
      {
        v12 = 0;
        goto LABEL_13;
      }
      if (-[SBHIconImageCache isCachingImageForIcon:](self, "isCachingImageForIcon:", v8))
        -[SBHIconImageCache cachingPlaceholderImageWithImageAppearance:options:](self, "cachingPlaceholderImageWithImageAppearance:options:", v9, a5);
      else
        -[SBHIconImageCache genericImageWithImageAppearance:options:](self, "genericImageWithImageAppearance:options:", v9, a5);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }
LABEL_13:

  return v12;
}

- (id)variantCacheForOptions:(unint64_t)a3
{
  uint64_t v3;

  v3 = 16;
  if ((a3 & 2) == 0)
    v3 = 8;
  return *(id *)((char *)&self->super.isa + v3);
}

- (id)realImageForIcon:(id)a3 compatibleWithTraitCollection:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0DC3E88], "sbh_iconImageAppearanceFromTraitCollection:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHIconImageCache realImageForIcon:imageAppearance:options:](self, "realImageForIcon:imageAppearance:options:", v9, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)realImageForIcon:(id)a3 imageAppearance:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  BSDispatchQueueAssertMain();
  -[SBHIconImageCache variantCacheForOptions:](self, "variantCacheForOptions:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconImageVariantCache realImageForIcon:imageAppearance:options:]((uint64_t)v10, v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconImageCache setLastCachedImageAppearance:](self, "setLastCachedImageAppearance:", v8);

  -[SBHIconImageCache beginObservingIconIfNecessary:](self, "beginObservingIconIfNecessary:", v9);
  return v11;
}

- (id)cachedImageForIcon:(id)a3 compatibleWithTraitCollection:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0DC3E88], "sbh_iconImageAppearanceFromTraitCollection:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHIconImageCache cachedImageForIcon:imageAppearance:options:](self, "cachedImageForIcon:imageAppearance:options:", v9, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)cachedImageForIcon:(id)a3 imageAppearance:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  BSDispatchQueueAssertMain();
  if ((a5 & 8) != 0)
  {
    v11 = 0;
  }
  else
  {
    -[SBHIconImageCache variantCacheForOptions:](self, "variantCacheForOptions:", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconImageVariantCache cachedImageForIcon:imageAppearance:options:]((uint64_t)v10, v8, v9, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (BOOL)hasCachedImagesForIcons:(id)a3 imageAppearances:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  BOOL v21;
  uint64_t v23;
  uint64_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend((id)objc_opt_class(), "retrievalOptionsForOptions:", a5);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v11 = v8;
  v24 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v24)
  {
    v12 = *(_QWORD *)v31;
    v25 = v9;
    v23 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(v11);
        v14 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v15 = v9;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v27;
          while (2)
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v27 != v18)
                objc_enumerationMutation(v15);
              -[SBHIconImageCache cachedImageForIcon:imageAppearance:options:](self, "cachedImageForIcon:imageAppearance:options:", v14, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j), v10);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v20)
              {

                v21 = 0;
                v9 = v25;
                goto LABEL_19;
              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            if (v17)
              continue;
            break;
          }
        }

        v9 = v25;
        v12 = v23;
      }
      v21 = 1;
      v24 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v24);
  }
  else
  {
    v21 = 1;
  }
LABEL_19:

  return v21;
}

- (void)cacheImage:(id)a3 forIcon:(id)a4 imageAppearance:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v10 = a4;
  v9 = a3;
  BSDispatchQueueAssertMain();
  -[SBHIconImageVariantCache cacheImage:forIcon:imageAppearance:]((id *)&self->_maskedCache->super.isa, v9, v10, v8);

  -[SBHIconImageCache beginObservingIconIfNecessary:](self, "beginObservingIconIfNecessary:", v10);
}

- (id)cachedUnmaskedImageForIcon:(id)a3
{
  return -[SBHIconImageCache cachedImageForIcon:compatibleWithTraitCollection:options:](self, "cachedImageForIcon:compatibleWithTraitCollection:options:", a3, 0, 2);
}

- (id)cacheImageForIcon:(id)a3 compatibleWithTraitCollection:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v10 = (void *)MEMORY[0x1E0C99D20];
  v11 = a6;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "arrayWithObjects:count:", &v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHIconImageCache cacheImagesForIcons:compatibleWithTraitCollection:options:completionHandler:](self, "cacheImagesForIcons:compatibleWithTraitCollection:options:completionHandler:", v14, v12, a5, v11, v17, v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)cacheImageForIcon:(id)a3 imageAppearance:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v10 = (void *)MEMORY[0x1E0C99D20];
  v11 = a6;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "arrayWithObjects:count:", &v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHIconImageCache cacheImagesForIcons:imageAppearance:options:completionHandler:](self, "cacheImagesForIcons:imageAppearance:options:completionHandler:", v14, v12, a5, v11, v17, v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)cacheImageForIcon:(id)a3 imageAppearance:(id)a4 reason:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v12 = (void *)MEMORY[0x1E0C99D20];
  v13 = a7;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v12, "arrayWithObjects:count:", &v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHIconImageCache cacheImagesForIcons:imageAppearance:reason:options:completionHandler:](self, "cacheImagesForIcons:imageAppearance:reason:options:completionHandler:", v17, v15, v14, a6, v13, v20, v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)cacheImageForIcon:(id)a3 imageAppearance:(id)a4 priority:(int64_t)a5 reason:(id)a6 options:(unint64_t)a7 completionHandler:(id)a8
{
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v14 = (void *)MEMORY[0x1E0C99D20];
  v15 = a8;
  v16 = a6;
  v17 = a4;
  v18 = a3;
  objc_msgSend(v14, "arrayWithObjects:count:", &v22, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHIconImageCache cacheImagesForIcons:imageAppearance:priority:reason:options:completionHandler:](self, "cacheImagesForIcons:imageAppearance:priority:reason:options:completionHandler:", v19, v17, a5, v16, a7, v15, v22, v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)cacheImagesForIcons:(id)a3 compatibleWithTraitCollection:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  if (a4)
  {
    v17 = a4;
    v12 = (void *)MEMORY[0x1E0C99D20];
    v13 = a4;
    objc_msgSend(v12, "arrayWithObjects:count:", &v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C9AA60];
  }
  -[SBHIconImageCache cacheImagesForIcons:compatibleWithTraitCollections:options:completionHandler:](self, "cacheImagesForIcons:compatibleWithTraitCollections:options:completionHandler:", v10, v14, a5, v11, v17, v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)cacheImagesForIcons:(id)a3 imageAppearance:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v17 = a4;
  v10 = (void *)MEMORY[0x1E0C99D20];
  v11 = a6;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "arrayWithObjects:count:", &v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHIconImageCache cacheImagesForIcons:imageAppearances:options:completionHandler:](self, "cacheImagesForIcons:imageAppearances:options:completionHandler:", v13, v14, a5, v11, v17, v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)cacheImagesForIcons:(id)a3 imageAppearance:(id)a4 reason:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v20 = a4;
  v12 = (void *)MEMORY[0x1E0C99D20];
  v13 = a7;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v12, "arrayWithObjects:count:", &v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHIconImageCache cacheImagesForIcons:imageAppearances:reason:options:completionHandler:](self, "cacheImagesForIcons:imageAppearances:reason:options:completionHandler:", v16, v17, v14, a6, v13, v20, v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)cacheImagesForIcons:(id)a3 imageAppearance:(id)a4 priority:(int64_t)a5 reason:(id)a6 options:(unint64_t)a7 completionHandler:(id)a8
{
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v22 = a4;
  v14 = (void *)MEMORY[0x1E0C99D20];
  v15 = a8;
  v16 = a6;
  v17 = a4;
  v18 = a3;
  objc_msgSend(v14, "arrayWithObjects:count:", &v22, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHIconImageCache cacheImagesForIcons:imageAppearances:priority:reason:options:completionHandler:](self, "cacheImagesForIcons:imageAppearances:priority:reason:options:completionHandler:", v18, v19, a5, v16, a7, v15, v22, v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)cacheImagesForIcons:(id)a3 compatibleWithTraitCollections:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  return -[SBHIconImageCache cacheImagesForIcons:compatibleWithTraitCollections:reason:options:completionHandler:](self, "cacheImagesForIcons:compatibleWithTraitCollections:reason:options:completionHandler:", a3, a4, 0, a5, a6);
}

- (id)cacheImagesForIcons:(id)a3 compatibleWithTraitCollections:(id)a4 reason:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a7;
  objc_msgSend(a4, "bs_mapNoNulls:", &__block_literal_global_11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "count"))
  {
    +[SBHIconImageAppearance defaultAppearance](SBHIconImageAppearance, "defaultAppearance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v15 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v15;
  }
  -[SBHIconImageCache cacheImagesForIcons:imageAppearances:options:completionHandler:](self, "cacheImagesForIcons:imageAppearances:options:completionHandler:", v11, v13, a6, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

uint64_t __105__SBHIconImageCache_cacheImagesForIcons_compatibleWithTraitCollections_reason_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sbh_iconImageAppearance");
}

- (id)cacheImagesForIcons:(id)a3 imageAppearances:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  return -[SBHIconImageCache cacheImagesForIcons:imageAppearances:reason:options:completionHandler:](self, "cacheImagesForIcons:imageAppearances:reason:options:completionHandler:", a3, a4, &stru_1E8D8E958, a5, a6);
}

- (id)cacheImagesForIcons:(id)a3 imageAppearances:(id)a4 reason:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[SBHIconImageCache cacheImagesForIcons:imageAppearances:priority:reason:options:completionHandler:](self, "cacheImagesForIcons:imageAppearances:priority:reason:options:completionHandler:", v15, v14, objc_msgSend((id)objc_opt_class(), "defaultPriority"), v13, a6, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)cacheImagesForIcons:(id)a3 imageAppearances:(id)a4 priority:(int64_t)a5 reason:(id)a6 options:(unint64_t)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  SBHIconImageCacheCancellation *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v32;
  id v33;
  id v34;
  id obj;
  uint64_t v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD block[4];
  id v47;
  id v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a8;
  BSDispatchQueueAssertMain();
  v37 = v15;
  if (!-[SBHIconImageCache hasCachedImagesForIcons:imageAppearances:options:](self, "hasCachedImagesForIcons:imageAppearances:options:", v14, v15, a7))
  {
    v32 = v17;
    v33 = v16;
    -[SBHIconImageCache buildCacheRequestWithReason:](self, "buildCacheRequestWithReason:", v16);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v34 = v14;
    obj = v14;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (v22)
    {
      v23 = v22;
      v36 = *(_QWORD *)v43;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v43 != v36)
            objc_enumerationMutation(obj);
          v25 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v24);
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v26 = v37;
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v39;
            do
            {
              v30 = 0;
              do
              {
                if (*(_QWORD *)v39 != v29)
                  objc_enumerationMutation(v26);
                objc_msgSend(v21, "addIcon:imageAppearance:priority:options:", v25, *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v30++), a5, a7);
              }
              while (v28 != v30);
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
            }
            while (v28);
          }

          ++v24;
        }
        while (v24 != v23);
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      }
      while (v23);
    }

    v17 = v32;
    objc_msgSend(v21, "finalizeRequestWithCompletionHandler:", v32);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v33;
    v14 = v34;
    goto LABEL_19;
  }
  v18 = objc_alloc_init(SBHIconImageCacheCancellation);
  v19 = v18;
  if (v17)
  {
    -[SBHIconImageCacheCancellation identifier](v18, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __100__SBHIconImageCache_cacheImagesForIcons_imageAppearances_priority_reason_options_completionHandler___block_invoke;
    block[3] = &unk_1E8D84D28;
    v47 = v20;
    v48 = v17;
    v21 = v20;
    dispatch_async(MEMORY[0x1E0C80D38], block);

LABEL_19:
  }

  return v19;
}

void __100__SBHIconImageCache_cacheImagesForIcons_imageAppearances_priority_reason_options_completionHandler___block_invoke(uint64_t a1)
{
  SBHIconImageCacheResult *v2;

  v2 = -[SBHIconImageCacheResult initWithRequestIdentifier:]([SBHIconImageCacheResult alloc], "initWithRequestIdentifier:", *(_QWORD *)(a1 + 32));
  -[SBHIconImageCacheResult calculateElapsedTime](v2, "calculateElapsedTime");
  -[SBHIconImageCacheResult setFinished:](v2, "setFinished:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)cacheImagesForIcons:(id)a3 prioritizedImageAppearances:(id)a4 reason:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  SBHIconImageCacheCancellation *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v29;
  id v30;
  id v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  uint64_t v35;
  unint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD block[4];
  id v42;
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  BSDispatchQueueAssertMain();
  v32 = v13;
  objc_msgSend(v13, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[SBHIconImageCache hasCachedImagesForIcons:imageAppearances:options:](self, "hasCachedImagesForIcons:imageAppearances:options:", v12, v16, a6))
  {
    v29 = v16;
    v30 = v15;
    v31 = v14;
    -[SBHIconImageCache buildCacheRequestWithReason:](self, "buildCacheRequestWithReason:", v14);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v21 = v12;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v38;
      v25 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v38 != v24)
            objc_enumerationMutation(v21);
          v27 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
          v33[0] = v25;
          v33[1] = 3221225472;
          v33[2] = __102__SBHIconImageCache_cacheImagesForIcons_prioritizedImageAppearances_reason_options_completionHandler___block_invoke_2;
          v33[3] = &unk_1E8D84D50;
          v34 = v20;
          v35 = v27;
          v36 = a6;
          objc_msgSend(v32, "enumerateKeysAndObjectsUsingBlock:", v33);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
      }
      while (v23);
    }

    v15 = v30;
    objc_msgSend(v20, "finalizeRequestWithCompletionHandler:", v30);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v31;
    v16 = v29;
    goto LABEL_12;
  }
  v17 = objc_alloc_init(SBHIconImageCacheCancellation);
  v18 = v17;
  if (v15)
  {
    -[SBHIconImageCacheCancellation identifier](v17, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __102__SBHIconImageCache_cacheImagesForIcons_prioritizedImageAppearances_reason_options_completionHandler___block_invoke;
    block[3] = &unk_1E8D84D28;
    v42 = v19;
    v43 = v15;
    v20 = v19;
    dispatch_async(MEMORY[0x1E0C80D38], block);

LABEL_12:
  }

  return v18;
}

void __102__SBHIconImageCache_cacheImagesForIcons_prioritizedImageAppearances_reason_options_completionHandler___block_invoke(uint64_t a1)
{
  SBHIconImageCacheResult *v2;

  v2 = -[SBHIconImageCacheResult initWithRequestIdentifier:]([SBHIconImageCacheResult alloc], "initWithRequestIdentifier:", *(_QWORD *)(a1 + 32));
  -[SBHIconImageCacheResult calculateElapsedTime](v2, "calculateElapsedTime");
  -[SBHIconImageCacheResult setFinished:](v2, "setFinished:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __102__SBHIconImageCache_cacheImagesForIcons_prioritizedImageAppearances_reason_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addIcon:imageAppearance:priority:options:", *(_QWORD *)(a1 + 40), v5, objc_msgSend(a3, "integerValue"), *(_QWORD *)(a1 + 48));

}

- (id)buildCacheRequestWithReason:(id)a3
{
  id v4;
  SBHIconImageCacheCancellation *v5;
  id *v6;

  v4 = a3;
  v5 = objc_alloc_init(SBHIconImageCacheCancellation);
  v6 = -[SBHIconImageCacheRequestBuilder initWithIconImageCache:sharedCancellation:reason:]((id *)[SBHIconImageCacheRequestBuilder alloc], self, v5, v4);

  return v6;
}

- (id)finalizeRequestBuilder:(id)a3 completionHandler:(id)a4
{
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  SBHIconImageCacheResult *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  _QWORD block[4];
  id v23;
  SBHIconImageCache *v24;
  id v25;
  SBHIconImageCacheResult *v26;
  id v27;

  v6 = a3;
  v7 = a4;
  if (v6)
    v8 = (void *)v6[4];
  else
    v8 = 0;
  v9 = v8;
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SBHIconImageCacheResult initWithRequestIdentifier:]([SBHIconImageCacheResult alloc], "initWithRequestIdentifier:", v10);
  if (v6)
    v12 = (void *)v6[1];
  else
    v12 = 0;
  v13 = v12;
  objc_msgSend(v13, "firstObject");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = *(void **)(v14 + 56);
  else
    v16 = 0;
  v17 = v16;
  -[SBHIconImageCache submitRequests:](self, "submitRequests:", v13);
  if (v7)
  {
    if (v6)
      v18 = (void *)v6[6];
    else
      v18 = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__SBHIconImageCache_finalizeRequestBuilder_completionHandler___block_invoke;
    block[3] = &unk_1E8D84D78;
    v23 = v9;
    v24 = self;
    v25 = v17;
    v26 = v11;
    v27 = v7;
    v19 = v18;
    dispatch_group_notify(v19, MEMORY[0x1E0C80D38], block);

  }
  v20 = v9;

  return v20;
}

uint64_t __62__SBHIconImageCache_finalizeRequestBuilder_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && (*(_BYTE *)(v2 + 8) & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setLastCachedImageAppearance:", *(_QWORD *)(a1 + 48));
    v3 = 1;
  }
  objc_msgSend(*(id *)(a1 + 56), "calculateElapsedTime");
  objc_msgSend(*(id *)(a1 + 56), "setFinished:", v3);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)submitRequests:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[SBHIconImageCache submitRequest:](self, "submitRequest:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)submitRequest:(id)a3
{
  _BYTE *v4;
  void *v5;
  id v6;
  SBHIconImageVariantCache *maskedCache;
  _BYTE *v8;

  v4 = a3;
  v8 = v4;
  if (v4)
    v5 = (void *)*((_QWORD *)v4 + 4);
  else
    v5 = 0;
  v6 = v5;
  -[SBHIconImageCache beginObservingIconIfNecessary:](self, "beginObservingIconIfNecessary:", v6);
  if (v8 && v8[16])
    maskedCache = self->_maskedCache;
  else
    maskedCache = self->_unmaskedCache;
  -[SBHIconImageVariantCache submitRequest:]((id *)&maskedCache->super.isa, v8);

}

- (void)cacheUnmaskedImagesForIcons:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = -[SBHIconImageCache unmaskedImageForIcon:](self, "unmaskedImageForIcon:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

+ (unint64_t)retrievalOptionsForOptions:(unint64_t)a3
{
  return 2 * (a3 & 1);
}

+ (unint64_t)optionsForRetrievalOptions:(unint64_t)a3
{
  uint64_t v3;

  v3 = ~(8 * (_BYTE)a3) & 8;
  if ((a3 & 2) != 0)
    v3 |= 3uLL;
  return v3 | (a3 >> 1) & 4;
}

- (void)recacheImagesForIcon:(id)a3 completionHandler:(id)a4
{
  id v6;
  dispatch_group_t v7;
  dispatch_block_t block;

  block = a4;
  v6 = a3;
  BSDispatchQueueAssertMain();
  v7 = dispatch_group_create();
  -[SBHIconImageVariantCache recacheImagesForIcon:completionGroup:]((uint64_t)self->_maskedCache, v6, v7);
  -[SBHIconImageVariantCache recacheImagesForIcon:completionGroup:]((uint64_t)self->_unmaskedCache, v6, v7);

  if (block)
    dispatch_group_notify(v7, MEMORY[0x1E0C80D38], block);

}

- (void)purgeCachedImagesForIcons:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[4];
  id v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __47__SBHIconImageCache_purgeCachedImagesForIcons___block_invoke;
  v15[3] = &unk_1E8D84DA0;
  v5 = v4;
  v16 = v5;
  -[SBHIconImageCache enumerateVariantCachesUsingBlock:](self, "enumerateVariantCachesUsingBlock:", v15);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[SBHIconImageCache endObservingIcon:](self, "endObservingIcon:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v8);
  }

}

void __47__SBHIconImageCache_purgeCachedImagesForIcons___block_invoke(uint64_t a1, id *a2)
{
  -[SBHIconImageVariantCache purgeCachedImagesForIcons:](a2, *(void **)(a1 + 32));
}

- (void)purgeAllCachedImages
{
  BSDispatchQueueAssertMain();
  -[SBHIconImageCache enumerateVariantCachesUsingBlock:](self, "enumerateVariantCachesUsingBlock:", &__block_literal_global_18);
  -[SBHIconImageCache endObservingAllIcons](self, "endObservingAllIcons");
}

void __41__SBHIconImageCache_purgeAllCachedImages__block_invoke(uint64_t a1, id *a2)
{
  -[SBHIconImageVariantCache purgeAllCachedImages](a2);
}

- (void)purgeAllCachedImagesForAppearancesOtherThanAppearances:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  BSDispatchQueueAssertMain();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__SBHIconImageCache_purgeAllCachedImagesForAppearancesOtherThanAppearances___block_invoke;
  v6[3] = &unk_1E8D84DA0;
  v7 = v4;
  v5 = v4;
  -[SBHIconImageCache enumerateVariantCachesUsingBlock:](self, "enumerateVariantCachesUsingBlock:", v6);

}

void __76__SBHIconImageCache_purgeAllCachedImagesForAppearancesOtherThanAppearances___block_invoke(uint64_t a1, uint64_t a2)
{
  -[SBHIconImageVariantCache purgeAllCachedImagesForAppearancesOtherThanAppearances:](a2, *(void **)(a1 + 32));
}

- (void)cancelAllCachingRequests
{
  BSDispatchQueueAssertMain();
  -[SBHIconImageCache enumerateVariantCachesUsingBlock:](self, "enumerateVariantCachesUsingBlock:", &__block_literal_global_19);
}

uint64_t __45__SBHIconImageCache_cancelAllCachingRequests__block_invoke(uint64_t a1, uint64_t a2)
{
  return -[SBHIconImageVariantCache cancelAllCachingRequests](a2);
}

- (BOOL)isCachingImageForIcon:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  BSDispatchQueueAssertMain();
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__SBHIconImageCache_isCachingImageForIcon___block_invoke;
  v7[3] = &unk_1E8D84DE8;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[SBHIconImageCache enumerateVariantCachesUsingBlock:](self, "enumerateVariantCachesUsingBlock:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __43__SBHIconImageCache_isCachingImageForIcon___block_invoke(uint64_t a1, id *a2, _BYTE *a3)
{
  uint64_t result;

  result = -[SBHIconImageVariantCache isCachingImageForIcon:](a2, *(void **)(a1 + 32));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (BOOL)hasCachingRequests
{
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  BSDispatchQueueAssertMain();
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__SBHIconImageCache_hasCachingRequests__block_invoke;
  v4[3] = &unk_1E8D84E10;
  v4[4] = &v5;
  -[SBHIconImageCache enumerateVariantCachesUsingBlock:](self, "enumerateVariantCachesUsingBlock:", v4);
  LOBYTE(self) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)self;
}

void __39__SBHIconImageCache_hasCachingRequests__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id *v5;
  id *v6;
  uint64_t v7;
  id *v8;

  v5 = a2;
  v6 = v5;
  if (v5)
  {
    v8 = v5;
    v7 = objc_msgSend(v5[3], "count");
    v6 = v8;
    if (v7)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a3 = 1;
    }
  }

}

- (BOOL)hasCachingRequestsStillDoingInitialWork
{
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  BSDispatchQueueAssertMain();
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__SBHIconImageCache_hasCachingRequestsStillDoingInitialWork__block_invoke;
  v4[3] = &unk_1E8D84E10;
  v4[4] = &v5;
  -[SBHIconImageCache enumerateVariantCachesUsingBlock:](self, "enumerateVariantCachesUsingBlock:", v4);
  LOBYTE(self) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)self;
}

BOOL __60__SBHIconImageCache_hasCachingRequestsStillDoingInitialWork__block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  _BOOL8 result;

  result = -[SBHIconImageVariantCache hasCachingRequestsStillDoingInitialWork](a2);
  if (result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (void)performWhenCachingActivityCompletesUsingBlock:(id)a3
{
  NSMutableArray *performAfterCachingActivityBlocks;
  NSMutableArray *v5;
  NSMutableArray *v6;
  void *v7;
  void *v8;
  void (**v9)(void);

  v9 = (void (**)(void))a3;
  if (-[SBHIconImageCache hasCachingRequestsStillDoingInitialWork](self, "hasCachingRequestsStillDoingInitialWork"))
  {
    performAfterCachingActivityBlocks = self->_performAfterCachingActivityBlocks;
    if (!performAfterCachingActivityBlocks)
    {
      v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = self->_performAfterCachingActivityBlocks;
      self->_performAfterCachingActivityBlocks = v5;

      performAfterCachingActivityBlocks = self->_performAfterCachingActivityBlocks;
    }
    v7 = (void *)objc_msgSend(v9, "copy");
    v8 = _Block_copy(v7);
    -[NSMutableArray addObject:](performAfterCachingActivityBlocks, "addObject:", v8);

  }
  else
  {
    v9[2]();
  }

}

- (void)checkIfCachingActivityHasCompleted
{
  NSMutableArray *v3;
  NSMutableArray *performAfterCachingActivityBlocks;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!-[SBHIconImageCache hasCachingRequestsStillDoingInitialWork](self, "hasCachingRequestsStillDoingInitialWork"))
  {
    v3 = self->_performAfterCachingActivityBlocks;
    performAfterCachingActivityBlocks = self->_performAfterCachingActivityBlocks;
    self->_performAfterCachingActivityBlocks = 0;

    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = v3;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

+ (void)pauseCaching
{
  NSObject *v2;

  objc_msgSend(a1, "_workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_suspend(v2);

}

+ (void)resumeCaching
{
  NSObject *v2;

  objc_msgSend(a1, "_workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v2);

}

+ (BOOL)canFallBackToLightImageForImageAppearance:(id)a3
{
  return objc_msgSend(a3, "appearanceType") != 0;
}

- (void)notifyObserversOfUpdateForIcon:(id)a3 imageAppearance:(id)a4 requestStartTimestamp:(unint64_t)a5 elapsedTime:(double)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  BSDispatchQueueAssertMain();
  self->_currentRequestStartTimestamp = a5;
  self->_currentRequestElapsedTime = a6;
  SBLogIconImageCache();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[SBHIconImageCache notifyObserversOfUpdateForIcon:imageAppearance:requestStartTimestamp:elapsedTime:].cold.1(v10, v12, a6);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = (void *)-[NSHashTable copy](self->_observers, "copy");
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v18, "iconImageCache:didUpdateImageForIcon:imageAppearance:", self, v10, v11);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v15);
  }

  self->_currentRequestStartTimestamp = 0;
  self->_currentRequestElapsedTime = 0.0;

}

+ (id)genericImageWithInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v12;
  void *v13;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  +[SBHIconImageAppearance defaultAppearance](SBHIconImageAppearance, "defaultAppearance", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "genericImageWithInfo:imageAppearance:options:", v12, 0, v10, v9, v8, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)genericImageWithInfo:(SBIconImageInfo *)a3 imageAppearance:(id)a4 options:(unint64_t)a5
{
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  SBIconImageInfo *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  CGColorSpace *v23;
  void *v24;
  _QWORD v26[9];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v10 = v8;
  v11 = v7;
  v12 = v6;
  v13 = v5;
  v33 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  objc_msgSend(MEMORY[0x1E0D3A820], "genericApplicationIcon");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", v13, v12, v11);
  SBHModifyImageDescriptorWithImageAppearance(v16, v14, (a4 & 2) != 0);
  objc_msgSend(v15, "prepareImageForDescriptor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17
    || (v19 = (void *)MEMORY[0x1E0DC3870],
        v20 = objc_msgSend(v17, "CGImage"),
        objc_msgSend(v18, "scale"),
        objc_msgSend(v19, "imageWithCGImage:scale:orientation:", v20, 0),
        (v21 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    SBLogIconImageCache();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v28 = v18;
      v29 = 2112;
      v30 = v15;
      v31 = 2112;
      v32 = v16;
      _os_log_error_impl(&dword_1CFEF3000, v22, OS_LOG_TYPE_ERROR, "Could not create generic application icon via IconServices. isImage=%@, genericIcon=%@, imageDescriptor=%@", buf, 0x20u);
    }

    v23 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __66__SBHIconImageCache_genericImageWithInfo_imageAppearance_options___block_invoke;
    v26[3] = &__block_descriptor_72_e5_v8__0l;
    v26[4] = a4;
    *(double *)&v26[5] = v13;
    *(double *)&v26[6] = v12;
    *(double *)&v26[7] = v11;
    v26[8] = v10;
    objc_msgSend(MEMORY[0x1E0DC3870], "sbf_imageFromBGRAContextWithSize:scale:colorSpace:withAlpha:pool:drawing:encapsulation:", v23, 1, 0, v26, 0, v13, v12, v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    CGColorSpaceRelease(v23);
  }
  SBHIconServicesAddDebugImageOverlayWithImageAppearance(v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

void __66__SBHIconImageCache_genericImageWithInfo_imageAppearance_options___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  CGRect v4;

  if ((*(_BYTE *)(a1 + 32) & 2) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 64));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addClip");

  }
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "set");

  v4.size.width = *(CGFloat *)(a1 + 40);
  v4.size.height = *(CGFloat *)(a1 + 48);
  v4.origin.x = 0.0;
  v4.origin.y = 0.0;
  UIRectFill(v4);
}

- (UIImage)genericImage
{
  void *v3;
  void *v4;

  +[SBHIconImageAppearance defaultAppearance](SBHIconImageAppearance, "defaultAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconImageCache genericImageWithImageAppearance:options:](self, "genericImageWithImageAppearance:options:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v4;
}

- (id)genericImageWithImageAppearance:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[SBHIconImageCache variantCacheForOptions:](self, "variantCacheForOptions:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconImageVariantCache genericImageWithImageAppearance:]((uint64_t)v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)tintingBackgroundImageWithInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  size_t v9;
  CGColorSpace *DeviceRGB;
  CGContext *v11;
  CGImage *Image;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[2];

  v6 = v5;
  v7 = v4;
  v8 = v3;
  v22[1] = *MEMORY[0x1E0C80C00];
  v9 = (unint64_t)(v3 * v5);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v11 = CGBitmapContextCreate(0, v9, v9, 8uLL, v9, DeviceRGB, 1u);
  CGColorSpaceRelease(DeviceRGB);
  CGContextClear();
  Image = CGBitmapContextCreateImage(v11);
  CGContextRelease(v11);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7C0]), "initWithCGImage:scale:", Image, v6);
  CGImageRelease(Image);
  v14 = objc_alloc(MEMORY[0x1E0D3A820]);
  v22[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithImages:", v15);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", v8, v7, v6);
  objc_msgSend(v17, "setAppearance:", 2);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithSystemColor:", 12);
  objc_msgSend(v17, "setTintColor:", v18);

  objc_msgSend(v16, "prepareImageForDescriptor:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:scale:orientation:", objc_msgSend(v19, "CGImage"), 0, v6);

  return v20;
}

- (UIImage)tintingBackgroundImage
{
  UIImage *tintingBackgroundImage;
  double v4;
  double v5;
  double v6;
  double v7;
  UIImage *v8;
  UIImage *v9;

  tintingBackgroundImage = self->_tintingBackgroundImage;
  if (!tintingBackgroundImage)
  {
    -[SBHIconImageCache iconImageInfo](self, "iconImageInfo");
    objc_msgSend((id)objc_opt_class(), "tintingBackgroundImageWithInfo:", v4, v5, v6, v7);
    v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v9 = self->_tintingBackgroundImage;
    self->_tintingBackgroundImage = v8;

    tintingBackgroundImage = self->_tintingBackgroundImage;
  }
  return tintingBackgroundImage;
}

- (id)cachingPlaceholderImageWithImageAppearance:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[SBHIconImageCache variantCacheForOptions:](self, "variantCacheForOptions:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconImageVariantCache cachingPlaceholderImageWithImageAppearance:](v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)hasUniqueCachingPlaceholderImage
{
  return 0;
}

+ (id)overlayImageWithInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;

  v6 = v5;
  v7 = v4;
  v8 = v3;
  v9 = objc_alloc(MEMORY[0x1E0D3A820]);
  v10 = (void *)objc_msgSend(v9, "initWithImages:", MEMORY[0x1E0C9AA60]);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", v8, v7, v6);
  objc_msgSend(v10, "prepareImageForDescriptor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x1E0DC3870]);
  v14 = objc_msgSend(v12, "CGImage");
  objc_msgSend(v12, "scale");
  v15 = (void *)objc_msgSend(v13, "initWithCGImage:scale:orientation:", v14, 0);

  return v15;
}

- (UIImage)overlayImage
{
  UIImage *overlayImage;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  UIImage *v18;
  UIImage *v19;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;

  overlayImage = self->_overlayImage;
  if (!overlayImage)
  {
    -[SBHIconImageCache iconImageInfo](self, "iconImageInfo");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v10 = objc_alloc(MEMORY[0x1E0D3A820]);
    v11 = (void *)objc_msgSend(v10, "initWithImages:", MEMORY[0x1E0C9AA60]);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", v5, v7, v9);
    objc_msgSend(v11, "prepareImageForDescriptor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc(MEMORY[0x1E0DC3870]);
    v15 = objc_msgSend(v13, "CGImage");
    objc_msgSend(v13, "scale");
    v16 = (void *)objc_msgSend(v14, "initWithCGImage:scale:orientation:", v15, 0);
    v24 = 0;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __33__SBHIconImageCache_overlayImage__block_invoke;
    v21[3] = &unk_1E8D84E58;
    v22 = v16;
    v23 = 0;
    v25 = v5;
    v26 = v7;
    v17 = v16;
    -[SBHIconImageCache memoryMappedIconImageOfSize:scale:withDrawing:](self, "memoryMappedIconImageOfSize:scale:withDrawing:", v21, v5, v7, v9);
    v18 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v19 = self->_overlayImage;
    self->_overlayImage = v18;

    overlayImage = self->_overlayImage;
  }
  return overlayImage;
}

uint64_t __33__SBHIconImageCache_overlayImage__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:blendMode:alpha:", 17, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), 1.0);
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:blendMode:alpha:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), 0.75);
}

+ (id)unmaskedOverlayImageWithInfo:(SBIconImageInfo *)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC3870], "sbf_imageFromContextWithSize:scale:type:pool:drawing:", 0, 0, &__block_literal_global_29, 1.0, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sbf_imageByTilingCenterPixel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __50__SBHIconImageCache_unmaskedOverlayImageWithInfo___block_invoke()
{
  void *v0;
  CGRect v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setFill");

  v1.origin.x = 0.0;
  v1.origin.y = 0.0;
  v1.size.width = 1.0;
  v1.size.height = 1.0;
  UIRectFill(v1);
}

- (UIImage)unmaskedOverlayImage
{
  UIImage *unmaskedOverlayImage;
  void *v4;
  UIImage *v5;
  UIImage *v6;

  unmaskedOverlayImage = self->_unmaskedOverlayImage;
  if (!unmaskedOverlayImage)
  {
    -[SBHIconImageCache iconImageInfo](self, "iconImageInfo");
    -[SBHIconImageCache memoryMappedIconImageOfSize:scale:withDrawing:](self, "memoryMappedIconImageOfSize:scale:withDrawing:", &__block_literal_global_30, 1.0, 1.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sbf_imageByTilingCenterPixel");
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v6 = self->_unmaskedOverlayImage;
    self->_unmaskedOverlayImage = v5;

    unmaskedOverlayImage = self->_unmaskedOverlayImage;
  }
  return unmaskedOverlayImage;
}

void __41__SBHIconImageCache_unmaskedOverlayImage__block_invoke()
{
  void *v0;
  CGRect v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setFill");

  v1.origin.x = 0.0;
  v1.origin.y = 0.0;
  v1.size.width = 1.0;
  v1.size.height = 1.0;
  UIRectFill(v1);
}

- (unint64_t)numberOfCachedImages
{
  SBHIconImageVariantCache *maskedCache;

  maskedCache = self->_maskedCache;
  if (maskedCache)
    return -[SBHIconImageAppearanceStore numberOfCachedImages](maskedCache->_images, "numberOfCachedImages");
  else
    return 0;
}

- (unint64_t)numberOfCacheHits
{
  return 0;
}

- (unint64_t)numberOfCacheMisses
{
  return 0;
}

- (unint64_t)numberOfMainThreadImageLoads
{
  return 0;
}

- (unint64_t)numberOfUnmaskedCachedImages
{
  SBHIconImageVariantCache *unmaskedCache;

  unmaskedCache = self->_unmaskedCache;
  if (unmaskedCache)
    return -[SBHIconImageAppearanceStore numberOfCachedImages](unmaskedCache->_images, "numberOfCachedImages");
  else
    return 0;
}

- (unint64_t)numberOfUnmaskedCacheHits
{
  return 0;
}

- (unint64_t)numberOfUnmaskedCacheMisses
{
  return 0;
}

- (unint64_t)numberOfCachedImagesForAppearance:(id)a3 options:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  v6 = a3;
  -[SBHIconImageCache variantCacheForOptions:](self, "variantCacheForOptions:", a4);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = objc_msgSend(*(id *)(v7 + 8), "numberOfCachedImagesForAppearance:", v6);
  else
    v9 = 0;

  return v9;
}

- (unint64_t)numberOfCachedImagesForAppearanceType:(int64_t)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v6;
  unint64_t v7;

  -[SBHIconImageCache variantCacheForOptions:](self, "variantCacheForOptions:", a4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = objc_msgSend(*(id *)(v5 + 8), "numberOfCachedImagesForAppearanceType:", a3);
  else
    v7 = 0;

  return v7;
}

- (unint64_t)cachingRequestCount
{
  SBHIconImageVariantCache *maskedCache;
  uint64_t v4;
  SBHIconImageVariantCache *unmaskedCache;
  uint64_t v6;

  maskedCache = self->_maskedCache;
  if (maskedCache)
    v4 = -[NSMutableArray count](maskedCache->_cachingRequests, "count");
  else
    v4 = 0;
  unmaskedCache = self->_unmaskedCache;
  if (unmaskedCache)
    v6 = -[NSMutableArray count](unmaskedCache->_cachingRequests, "count");
  else
    v6 = 0;
  return v6 + v4;
}

- (id)_cacheKeyForIcon:(id)a3
{
  return (id)objc_msgSend(a3, "iconImageCacheIdentifier");
}

- (id)_iconImageOfSize:(CGSize)a3 scale:(double)a4 failGracefully:(BOOL)a5 drawing:(id)a6
{
  _BOOL4 v6;
  double height;
  double width;
  id v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  double v21;
  uint64_t v22;
  CGSize v23;

  v6 = a5;
  height = a3.height;
  width = a3.width;
  v22 = *MEMORY[0x1E0C80C00];
  v11 = a6;
  -[SBHIconImageCache iconImagesMemoryPool](self, "iconImagesMemoryPool");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && (v13 = objc_msgSend(MEMORY[0x1E0DC3870], "sbf_bytesNeededForSize:scale:withContextType:", 0, width, height, a4),
        v13 > objc_msgSend(v12, "slotLength")))
  {
    SBLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v23.width = width;
      v23.height = height;
      NSStringFromCGSize(v23);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v15;
      v20 = 2048;
      v21 = a4;
      _os_log_impl(&dword_1CFEF3000, v14, OS_LOG_TYPE_DEFAULT, "color context with dimensions %{public}@ @%fx does not fit in 'iconImages' memory pool - returning nil", (uint8_t *)&v18, 0x16u);

    }
    v16 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "sbf_imageFromContextWithSize:scale:type:pool:drawing:", 0, v12, v11, width, height, a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (id)_pooledIconImageForIconImage:(id)a3 allowingOptOut:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v4 = a4;
  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    v8 = 0;
    goto LABEL_10;
  }
  if (v4 && !-[SBHIconImageCache _canPoolImage](self, "_canPoolImage"))
    goto LABEL_8;
  -[SBHIconImageCache iconImagesMemoryPool](self, "iconImagesMemoryPool");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sbf_memoryMappedImageWithPool:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    SBLogIconImageCache();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = 134217984;
      v12 = v6;
      _os_log_impl(&dword_1CFEF3000, v9, OS_LOG_TYPE_INFO, "Icon image %p could not be pooled as BGRA without color clamping, returning original image instead", (uint8_t *)&v11, 0xCu);
    }

LABEL_8:
    v8 = v6;
  }
LABEL_10:

  return v8;
}

- (id)pooledIconImageForMappedIconImage:(id)a3
{
  return -[SBHIconImageCache _pooledIconImageForIconImage:allowingOptOut:](self, "_pooledIconImageForIconImage:allowingOptOut:", a3, 1);
}

- (id)memoryMappedIconImageForIconImage:(id)a3
{
  return -[SBHIconImageCache _pooledIconImageForIconImage:allowingOptOut:](self, "_pooledIconImageForIconImage:allowingOptOut:", a3, 0);
}

- (id)memoryMappedIconImageOfSize:(CGSize)a3 scale:(double)a4 withDrawing:(id)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  height = a3.height;
  width = a3.width;
  v9 = a5;
  -[SBHIconImageCache _iconImageOfSize:scale:failGracefully:drawing:](self, "_iconImageOfSize:scale:failGracefully:drawing:", 1, v9, width, height, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "sbf_imageFromContextWithSize:scale:type:pool:drawing:", 0, 0, v9, width, height, a4);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  return v13;
}

- (void)endObservingIcon:(id)a3
{
  NSHashTable *observedIcons;
  id v5;

  observedIcons = self->_observedIcons;
  v5 = a3;
  -[NSHashTable removeObject:](observedIcons, "removeObject:", v5);
  objc_msgSend(v5, "removeObserver:", self);

}

- (void)endObservingAllIcons
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_observedIcons;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "removeObserver:", self, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSHashTable removeAllObjects](self->_observedIcons, "removeAllObjects");
}

- (void)enumerateVariantCachesUsingBlock:(id)a3
{
  void (**v4)(id, SBHIconImageVariantCache *, _BYTE *);
  char v5;

  v4 = (void (**)(id, SBHIconImageVariantCache *, _BYTE *))a3;
  v5 = 0;
  v4[2](v4, self->_maskedCache, &v5);
  if (!v5)
    v4[2](v4, self->_unmaskedCache, &v5);

}

- (void)performBackgroundCachingActivityUsingPriority:(int64_t)a3 block:(id)a4
{
  id v6;

  v6 = a4;
  -[SBHIconImageCache performBackgroundCachingActivityUsingQOSClass:block:](self, "performBackgroundCachingActivityUsingQOSClass:block:", objc_msgSend((id)objc_opt_class(), "qosClassForPriority:", a3), v6);

}

- (void)performBackgroundCachingActivityUsingQOSClass:(unsigned int)a3 block:(id)a4
{
  NSObject *v4;
  dispatch_block_t block;

  block = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a3, 0, a4);
  objc_msgSend((id)objc_opt_class(), "_workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v4, block);

}

- (void)performBackgroundFileActivityUsingBlock:(id)a3
{
  -[SBHIconImageCache performBackgroundCachingActivityUsingQOSClass:block:](self, "performBackgroundCachingActivityUsingQOSClass:block:", 9, a3);
}

+ (unsigned)qosClassForPriority:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 0;
  else
    return dword_1D0190850[a3];
}

+ (int64_t)defaultPriority
{
  return 2;
}

- (unint64_t)currentImageGenerationForIcon:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[NSMapTable objectForKey:](self->_iconImageGenerations, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v5 = 1;

  return v5;
}

- (void)incrementImageGenerationForIcon:(id)a3
{
  id v4;
  unint64_t v5;
  NSMapTable *iconImageGenerations;
  id v7;

  v4 = a3;
  BSDispatchQueueAssertMain();
  v5 = -[SBHIconImageCache currentImageGenerationForIcon:](self, "currentImageGenerationForIcon:", v4);
  iconImageGenerations = self->_iconImageGenerations;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5 + 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](iconImageGenerations, "setObject:forKey:", v7, v4);

}

- (void)iconImageDidUpdate:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  SBLogIconImageCache();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBHIconImageCache iconImageDidUpdate:].cold.1(v4, v5);

  -[SBHIconImageCache updateImageForIcon:](self, "updateImageForIcon:", v4);
}

- (void)updateImageForIcon:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SBHIconImageCache purgesCachedImagesImmediatelyUponIconUpdate](self, "purgesCachedImagesImmediatelyUponIconUpdate"))
  {
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconImageCache purgeCachedImagesForIcons:](self, "purgeCachedImagesForIcons:", v5);

  }
  -[SBHIconImageCache incrementImageGenerationForIcon:](self, "incrementImageGenerationForIcon:", v4);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__SBHIconImageCache_updateImageForIcon___block_invoke;
  v7[3] = &unk_1E8D84DA0;
  v8 = v4;
  v6 = v4;
  -[SBHIconImageCache enumerateVariantCachesUsingBlock:](self, "enumerateVariantCachesUsingBlock:", v7);
  -[SBHIconImageCache beginObservingIconIfNecessary:](self, "beginObservingIconIfNecessary:", v6);
  -[SBHIconImageCache recacheImagesForIcon:completionHandler:](self, "recacheImagesForIcon:completionHandler:", v6, 0);

}

void __40__SBHIconImageCache_updateImageForIcon___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  -[SBHIconImageVariantCache cancelCachingRequestsForIcon:]((uint64_t)v4, v3);
  -[SBHIconImageVariantCache resetFailedStatusForIcon:]((uint64_t)v4, *(void **)(a1 + 32));

}

- (NSString)description
{
  return (NSString *)-[SBHIconImageCache descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHIconImageCache succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBHIconImageCache descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  id v9;
  id v10;
  id v11;
  id v12;
  SBHIconImageVariantCache *maskedCache;
  uint64_t v14;
  id v15;

  -[SBHIconImageCache succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconImageCache name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("name"));

  -[SBHIconImageCache iconImageInfo](self, "iconImageInfo");
  v8 = v7;
  v9 = (id)objc_msgSend(v4, "appendSize:withName:", CFSTR("imageSize"));
  v10 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("imageScale"), v8);
  v11 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[SBHIconImageCache numberOfCachedImages](self, "numberOfCachedImages"), CFSTR("cachedImageCount"));
  v12 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[SBHIconImageCache numberOfUnmaskedCachedImages](self, "numberOfUnmaskedCachedImages"), CFSTR("cachedUnmaskedImageCount"));
  maskedCache = self->_maskedCache;
  if (maskedCache)
    v14 = -[NSHashTable count](maskedCache->_failedIcons, "count");
  else
    v14 = 0;
  v15 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", v14, CFSTR("failedIconsCount"));
  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (void)setPoolingBypassCount:(unint64_t)a3
{
  self->_poolingBypassCount = a3;
}

- (SBHIconImageAppearance)lastCachedImageAppearance
{
  return self->_lastCachedImageAppearance;
}

- (void)setLastCachedImageAppearance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)purgesCachedImagesImmediatelyUponIconUpdate
{
  return self->_purgesCachedImagesImmediatelyUponIconUpdate;
}

- (void)setPurgesCachedImagesImmediatelyUponIconUpdate:(BOOL)a3
{
  self->_purgesCachedImagesImmediatelyUponIconUpdate = a3;
}

- (unint64_t)currentRequestStartTimestamp
{
  return self->_currentRequestStartTimestamp;
}

- (double)currentRequestElapsedTime
{
  return self->_currentRequestElapsedTime;
}

- (void)notifyObserversOfUpdateForIcon:(double)a3 imageAppearance:requestStartTimestamp:elapsedTime:.cold.1(void *a1, NSObject *a2, double a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[12];
  __int16 v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  v8 = 2048;
  v9 = a3;
  OUTLINED_FUNCTION_2(&dword_1CFEF3000, a2, v6, "notifying observers of update to icon %@. requested elapsed time: %f", v7);

}

- (void)beginObservingIconIfNecessary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1CFEF3000, v0, v1, "began observing icon %@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)iconImageDidUpdate:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1CFEF3000, a2, v4, "observed update to icon %@", v5);

}

@end
