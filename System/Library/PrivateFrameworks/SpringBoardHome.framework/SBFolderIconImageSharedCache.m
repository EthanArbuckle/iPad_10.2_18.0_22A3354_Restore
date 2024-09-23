@implementation SBFolderIconImageSharedCache

- (void)addObserver:(id)a3 forFolderIcon:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[NSMapTable objectForKey:](self->_folderIconObservers, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](self->_folderIconObservers, "setObject:forKey:", v7, v6);
    objc_msgSend(v6, "addObserver:", self);
    objc_msgSend(v6, "folder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addFolderObserver:", self);

  }
  objc_msgSend(v7, "addObject:", v9);

}

- (void)removeObserver:(id)a3 forFolderIcon:(id)a4
{
  NSMapTable *folderIconObservers;
  id v6;
  id v7;

  folderIconObservers = self->_folderIconObservers;
  v6 = a3;
  -[NSMapTable objectForKey:](folderIconObservers, "objectForKey:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v6);

}

- (SBFolderIconImageSharedCache)initWithListLayout:(id)a3
{
  id v5;
  SBFolderIconImageSharedCache *v6;
  SBFolderIconImageSharedCache *v7;
  uint64_t v8;
  NSMapTable *folderIconObservers;
  SBHIconImageAppearanceStore *v10;
  SBHIconImageAppearanceStore *cachedFolderImages;
  SBHIconImageAppearanceStore *v12;
  SBHIconImageAppearanceStore *cachedMiniGridImages;
  SBHIconImageAppearanceStore *v14;
  SBHIconImageAppearanceStore *cachedMiniGridImageGenerations;
  uint64_t v16;
  NSHashTable *cachedFolderIcons;
  uint64_t v18;
  NSHashTable *folderIconImageCaches;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  CPMemoryPool *pool;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  CPMemoryPool *miniGridImagePool;
  objc_super v42;
  char __str[100];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v42.receiver = self;
  v42.super_class = (Class)SBFolderIconImageSharedCache;
  v6 = -[SBFolderIconImageSharedCache init](&v42, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_listLayout, a3);
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    folderIconObservers = v7->_folderIconObservers;
    v7->_folderIconObservers = (NSMapTable *)v8;

    v10 = objc_alloc_init(SBHIconImageAppearanceStore);
    cachedFolderImages = v7->_cachedFolderImages;
    v7->_cachedFolderImages = v10;

    v12 = objc_alloc_init(SBHIconImageAppearanceStore);
    cachedMiniGridImages = v7->_cachedMiniGridImages;
    v7->_cachedMiniGridImages = v12;

    v14 = objc_alloc_init(SBHIconImageAppearanceStore);
    cachedMiniGridImageGenerations = v7->_cachedMiniGridImageGenerations;
    v7->_cachedMiniGridImageGenerations = v14;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v16 = objc_claimAutoreleasedReturnValue();
    cachedFolderIcons = v7->_cachedFolderIcons;
    v7->_cachedFolderIcons = (NSHashTable *)v16;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v18 = objc_claimAutoreleasedReturnValue();
    folderIconImageCaches = v7->_folderIconImageCaches;
    v7->_folderIconImageCaches = (NSHashTable *)v18;

    v7->_miniGridImageLoadingAsynchronous = objc_msgSend((id)objc_opt_class(), "isMiniGridImageLoadingAsynchronous");
    v20 = objc_msgSend(v5, "numberOfColumnsForOrientation:", 1);
    v21 = objc_msgSend(v5, "numberOfRowsForOrientation:", 1);
    +[SBIconGridImage sizeForLayout:](SBIconGridImage, "sizeForLayout:", v5);
    v23 = v22;
    v25 = v24;
    v26 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "scale");
    v29 = objc_msgSend(v26, "sbf_bytesNeededForSize:scale:withContextType:", 0, v23, v25, v28);

    snprintf(__str, 0x64uLL, "gridImages_%lux%lu", v20, v21);
    v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFA9A0]), "initWithLabel:slotLength:", __str, v29);
    pool = v7->_pool;
    v7->_pool = (CPMemoryPool *)v30;

    v32 = SBHIconListLayoutFolderIconGridCellSize(v5);
    v34 = v33;
    v35 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "scale");
    v38 = objc_msgSend(v35, "sbf_bytesNeededForSize:scale:withContextType:", 0, v32, v34, v37);

    snprintf(__str, 0x64uLL, "miniGridImages_%lux%lu", (unint64_t)v32, (unint64_t)v34);
    v39 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFA9A0]), "initWithLabel:slotLength:", __str, v38);
    miniGridImagePool = v7->_miniGridImagePool;
    v7->_miniGridImagePool = (CPMemoryPool *)v39;

  }
  return v7;
}

- (SBFolderIconImageSharedCache)init
{
  void *v3;
  SBFolderIconImageSharedCache *v4;

  +[SBFolderIconImageCache defaultListLayout](SBFolderIconImageCache, "defaultListLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBFolderIconImageSharedCache initWithListLayout:](self, "initWithListLayout:", v3);

  return v4;
}

- (void)setIconImageCache:(id)a3
{
  SBHIconImageCache *v5;
  SBHIconImageCache *iconImageCache;
  SBHIconImageCache *v7;

  v5 = (SBHIconImageCache *)a3;
  iconImageCache = self->_iconImageCache;
  if (iconImageCache != v5)
  {
    v7 = v5;
    -[SBHIconImageCache removeObserver:](iconImageCache, "removeObserver:", self);
    objc_storeStrong((id *)&self->_iconImageCache, a3);
    -[SBHIconImageCache addObserver:](self->_iconImageCache, "addObserver:", self);
    v5 = v7;
  }

}

- (void)registerFolderIconImageCache:(id)a3
{
  -[NSHashTable addObject:](self->_folderIconImageCaches, "addObject:", a3);
}

- (void)unregisterFolderIconImageCache:(id)a3
{
  -[NSHashTable removeObject:](self->_folderIconImageCaches, "removeObject:", a3);
}

- (void)folderIconImageCache:(id)a3 didAddObserverForFolderIcon:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(v5, "addObserver:", self);
  objc_msgSend(v5, "folder");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addFolderObserver:", self);
}

- (id)imageForPageAtIndex:(unint64_t)a3 inFolderIcon:(id)a4 imageAppearance:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v21;
  uint8_t buf[4];
  SBFolderIconImageSharedCache *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "folder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "listCount");
  -[SBHIconImageAppearanceStore imageForIcon:appearance:](self->_cachedFolderImages, "imageForIcon:appearance:", v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12 && objc_msgSend(v12, "count") != v11)
  {
    objc_msgSend(v13, "setCount:", 0);
    objc_msgSend(v13, "setCount:", v11);
  }
  objc_msgSend(v13, "pointerAtIndex:", a3);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    if (!a3)
      SBFPreheatImageData();
  }
  else
  {
    -[SBFolderIconImageSharedCache listLayout](self, "listLayout");
    v16 = objc_claimAutoreleasedReturnValue();
    -[SBFolderIconImageSharedCache pool](self, "pool");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)v16;
    +[SBFolderIconImageCache imageForPageAtIndex:inFolderIcon:imageAppearance:listLayout:gridCellImageProvider:pool:](SBFolderIconImageCache, "imageForPageAtIndex:inFolderIcon:imageAppearance:listLayout:gridCellImageProvider:pool:", a3, v8, v9, v16, self, v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogFolderIconImageCache();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218754;
      v23 = self;
      v24 = 2112;
      v25 = v15;
      v26 = 2048;
      v27 = a3;
      v28 = 2112;
      v29 = v8;
      _os_log_debug_impl(&dword_1CFEF3000, v18, OS_LOG_TYPE_DEBUG, "%p caching image %@ at page %lu for icon: %@", buf, 0x2Au);
    }

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3868], "pointerArrayWithOptions:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setCount:", v11);
      -[SBHIconImageAppearanceStore setImage:forIcon:appearance:](self->_cachedFolderImages, "setImage:forIcon:appearance:", v13, v8, v9);
      -[NSHashTable addObject:](self->_cachedFolderIcons, "addObject:", v8);
    }
    objc_msgSend(v13, "replacePointerAtIndex:withPointer:", a3, v15);

  }
  objc_msgSend(v8, "addObserver:", self);
  objc_msgSend(v8, "folder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addFolderObserver:", self);

  return v15;
}

- (id)layerForPageAtIndex:(unint64_t)a3 inFolderIcon:(id)a4 imageAppearance:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;

  v8 = a5;
  objc_msgSend(a4, "folder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderIconImageSharedCache listLayout](self, "listLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__SBFolderIconImageSharedCache_layerForPageAtIndex_inFolderIcon_imageAppearance___block_invoke;
  v14[3] = &unk_1E8D88C10;
  v14[4] = self;
  v15 = v8;
  v11 = v8;
  objc_msgSend(v9, "layerForListIndex:listLayout:imageAppearance:cellProvider:", a3, v10, v11, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __81__SBFolderIconImageSharedCache_layerForPageAtIndex_inFolderIcon_imageAppearance___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "gridCellLayerForIcon:imageAppearance:", a2, *(_QWORD *)(a1 + 40));
}

+ (BOOL)isMiniGridImageLoadingAsynchronous
{
  return 1;
}

- (id)gridCellImageForIcon:(id)a3 imageAppearance:(id)a4
{
  return -[SBFolderIconImageSharedCache gridCellImageForIcon:imageAppearance:isLoading:](self, "gridCellImageForIcon:imageAppearance:isLoading:", a3, a4, 0);
}

- (id)gridCellImageForIcon:(id)a3 imageAppearance:(id)a4 isLoading:(BOOL *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  unint64_t v15;
  BOOL v16;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  NSObject *v27;
  void *v28;
  void *v29;
  int v30;
  NSObject *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  SBHIconImageAppearanceStore *cachedMiniGridImageGenerations;
  void *v38;
  int v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[SBHIconImageAppearanceStore imageForIcon:appearance:](self->_cachedMiniGridImages, "imageForIcon:appearance:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderIconImageSharedCache iconImageCache](self, "iconImageCache");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10)
    v13 = v11 == 0;
  else
    v13 = 1;
  if (!v13)
  {
    -[SBHIconImageAppearanceStore imageForIcon:appearance:](self->_cachedMiniGridImageGenerations, "imageForIcon:appearance:", v8, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedIntegerValue");
    if (objc_msgSend(v12, "currentImageGenerationForIcon:", v8) > v15)
    {

      v10 = 0;
    }

  }
  if (!v10)
  {
    -[SBFolderIconImageSharedCache listLayout](self, "listLayout");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "iconImageInfo");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    SBLogFolderIconImageCache();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      -[SBFolderIconImageSharedCache gridCellImageForIcon:imageAppearance:isLoading:].cold.1();

    if (v12)
    {
      if (-[SBFolderIconImageSharedCache isMiniGridImageLoadingAsynchronous](self, "isMiniGridImageLoadingAsynchronous"))
      {
        objc_msgSend(v12, "imageForIcon:imageAppearance:options:", v8, v9, 1);
      }
      else
      {
        objc_msgSend(v12, "realImageForIcon:imageAppearance:options:", v8, v9, 0);
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
LABEL_25:
        +[SBFolderIconImageCache gridCellImageOfSize:forIconImage:](SBFolderIconImageCache, "gridCellImageOfSize:forIconImage:", v29, SBHIconListLayoutFolderIconGridCellSize(v18));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          -[SBFolderIconImageSharedCache miniGridImagePool](self, "miniGridImagePool");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "sbf_memoryMappedImageWithPool:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (v34)
          {
            v35 = v34;

            v10 = v35;
          }
          -[SBHIconImageAppearanceStore setImage:forIcon:appearance:](self->_cachedMiniGridImages, "setImage:forIcon:appearance:", v10, v8, v9);
          v36 = objc_msgSend(v12, "currentImageGenerationForIcon:", v8);
          cachedMiniGridImageGenerations = self->_cachedMiniGridImageGenerations;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBHIconImageAppearanceStore setImage:forIcon:appearance:](cachedMiniGridImageGenerations, "setImage:forIcon:appearance:", v38, v8, v9);

        }
LABEL_29:
        v16 = 0;
        goto LABEL_31;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3E88], "sbh_traitCollectionWithIconImageAppearance:", v9);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "makeIconImageWithInfo:traitCollection:options:", v28, 1, v20, v22, v24, v26);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
        goto LABEL_25;
    }
    if (objc_msgSend((id)objc_opt_class(), "hasIconImage"))
    {
      v30 = objc_msgSend(v12, "isCachingImageForIcon:", v8);
      SBLogFolderIconImageCache();
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = os_log_type_enabled(v31, OS_LOG_TYPE_INFO);
      if (!v30)
      {
        if (v32)
        {
          v39 = 138412290;
          v40 = v8;
          _os_log_impl(&dword_1CFEF3000, v31, OS_LOG_TYPE_INFO, "Could not get grid cell image for icon %@", (uint8_t *)&v39, 0xCu);
        }

        -[SBFolderIconImageSharedCache genericMiniGridImageWithImageAppearance:](self, "genericMiniGridImageWithImageAppearance:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      }
      if (v32)
      {
        v39 = 138412290;
        v40 = v8;
        _os_log_impl(&dword_1CFEF3000, v31, OS_LOG_TYPE_INFO, "icon image cache is still caching image for icon %@", (uint8_t *)&v39, 0xCu);
      }

      -[SBFolderIconImageSharedCache cachingPlaceholderMiniGridImageWithImageAppearance:](self, "cachingPlaceholderMiniGridImageWithImageAppearance:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 1;
    }
    else
    {
      v16 = 0;
      v10 = 0;
    }
LABEL_31:

    if (!a5)
      goto LABEL_11;
    goto LABEL_10;
  }
  v16 = 0;
  if (a5)
LABEL_10:
    *a5 = v16;
LABEL_11:

  return v10;
}

- (id)gridCellLayerForIcon:(id)a3 imageAppearance:(id)a4
{
  return -[SBFolderIconImageSharedCache gridCellLayerForIcon:imageAppearance:isLoading:](self, "gridCellLayerForIcon:imageAppearance:isLoading:", a3, a4, 0);
}

- (id)gridCellLayerForIcon:(id)a3 imageAppearance:(id)a4 isLoading:(BOOL *)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  id v16;
  SBHIconImageAppearanceStore *v17;
  void *v18;

  v8 = a3;
  v9 = a4;
  -[SBFolderIconImageSharedCache gridCellImageForIcon:imageAppearance:isLoading:](self, "gridCellImageForIcon:imageAppearance:isLoading:", v8, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "size");
  v12 = v11;
  v14 = v13;
  v15 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
  objc_msgSend(v15, "setBounds:", 0.0, 0.0, v12, v14);
  v16 = objc_retainAutorelease(v10);
  objc_msgSend(v15, "setContents:", objc_msgSend(v16, "CGImage"));
  -[SBFolderIconImageSharedCache miniGridImageLayers](self, "miniGridImageLayers");
  v17 = (SBHIconImageAppearanceStore *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v17 = objc_alloc_init(SBHIconImageAppearanceStore);
    -[SBFolderIconImageSharedCache setMiniGridImageLayers:](self, "setMiniGridImageLayers:", v17);
  }
  -[SBHIconImageAppearanceStore imageForIcon:appearance:](v17, "imageForIcon:appearance:", v8, v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconImageAppearanceStore setImage:forIcon:appearance:](v17, "setImage:forIcon:appearance:", v18, v8, v9);
  }
  objc_msgSend(v18, "addObject:", v15);

  return v15;
}

- (void)rebuildImagesForFolderIcon:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  SBLogFolderIconImageCache();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBFolderIconImageCache rebuildImagesForFolderIcon:].cold.1();

  -[SBHIconImageAppearanceStore removeAllImagesForIcon:](self->_cachedFolderImages, "removeAllImagesForIcon:", v4);
  -[NSHashTable removeAllObjects](self->_cachedFolderIcons, "removeAllObjects");
  -[SBFolderIconImageSharedCache informObserversOfUpdateForFolderIcon:](self, "informObserversOfUpdateForFolderIcon:", v4);

}

- (void)rebuildAllCachedFolderImages
{
  NSObject *v3;
  void *v4;
  id v5;
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
  SBLogFolderIconImageCache();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[SBFolderIconImageCache rebuildAllCachedFolderImages].cold.1();

  v4 = (void *)-[NSHashTable copy](self->_cachedFolderIcons, "copy");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        -[SBFolderIconImageSharedCache rebuildImagesForFolderIcon:](self, "rebuildImagesForFolderIcon:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)purgeAllCachedFolderImages
{
  NSObject *v3;

  SBLogFolderIconImageCache();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[SBFolderIconImageCache purgeAllCachedFolderImages].cold.1();

  -[SBHIconImageAppearanceStore removeAllImages](self->_cachedFolderImages, "removeAllImages");
  -[NSHashTable removeAllObjects](self->_cachedFolderIcons, "removeAllObjects");
}

- (void)rebuildImagesForFolderIcon:(id)a3 appearance:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a3;
  v7 = a4;
  SBLogFolderIconImageCache();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SBFolderIconImageSharedCache rebuildImagesForFolderIcon:appearance:].cold.1();

  -[SBHIconImageAppearanceStore removeAllImagesForIcon:appearance:](self->_cachedFolderImages, "removeAllImagesForIcon:appearance:", v6, v7);
  -[NSHashTable removeObject:](self->_cachedFolderIcons, "removeObject:", v6);
  -[SBFolderIconImageSharedCache informObserversOfUpdateForFolderIcon:](self, "informObserversOfUpdateForFolderIcon:", v6);

}

- (void)informObserversOfUpdateForFolderIcon:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSHashTable *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMapTable objectForKey:](self->_folderIconObservers, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v9++), "folderIconImageSharedCache:didUpdateImagesForFolderIcon:", self, v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_folderIconImageCaches;
  v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "folderIconImageSharedCache:didUpdateImagesForFolderIcon:", self, v4, (_QWORD)v15);
      }
      while (v12 != v14);
      v12 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (id)genericMiniGridImageWithImageAppearance:(id)a3
{
  id v4;
  SBHIconImageAppearanceStore *genericMiniGridImages;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SBHIconImageAppearanceStore *v11;
  SBHIconImageAppearanceStore *v12;
  SBHIconImageAppearanceStore *v13;
  void *v14;

  v4 = a3;
  genericMiniGridImages = self->_genericMiniGridImages;
  +[SBHIconImageAppearanceStore defaultIcon](SBHIconImageAppearanceStore, "defaultIcon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconImageAppearanceStore imageForIcon:appearance:](genericMiniGridImages, "imageForIcon:appearance:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[SBFolderIconImageSharedCache iconImageCache](self, "iconImageCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFolderIconImageSharedCache listLayout](self, "listLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "iconImageInfo");
    if (v8)
      objc_msgSend(v8, "genericImageWithImageAppearance:options:", v4, 0);
    else
      +[SBHIconImageCache genericImageWithInfo:imageAppearance:options:](SBHIconImageCache, "genericImageWithInfo:imageAppearance:options:", v4, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBFolderIconImageCache gridCellImageOfSize:forIconImage:](SBFolderIconImageCache, "gridCellImageOfSize:forIconImage:", v10, SBHIconListLayoutFolderIconGridCellSize(v9));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = self->_genericMiniGridImages;
    if (!v11)
    {
      v12 = objc_alloc_init(SBHIconImageAppearanceStore);
      v13 = self->_genericMiniGridImages;
      self->_genericMiniGridImages = v12;

      v11 = self->_genericMiniGridImages;
    }
    +[SBHIconImageAppearanceStore defaultIcon](SBHIconImageAppearanceStore, "defaultIcon");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconImageAppearanceStore setImage:forIcon:appearance:](v11, "setImage:forIcon:appearance:", v7, v14, v4);

  }
  return v7;
}

- (id)cachingPlaceholderMiniGridImageWithImageAppearance:(id)a3
{
  id v4;
  SBHIconImageAppearanceStore *cachingPlaceholderMiniGridImages;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SBHIconImageAppearanceStore *v11;
  SBHIconImageAppearanceStore *v12;
  SBHIconImageAppearanceStore *v13;
  void *v14;

  v4 = a3;
  if (+[SBHIconImageCache hasUniqueCachingPlaceholderImage](SBHIconImageCache, "hasUniqueCachingPlaceholderImage"))
  {
    cachingPlaceholderMiniGridImages = self->_cachingPlaceholderMiniGridImages;
    +[SBHIconImageAppearanceStore defaultIcon](SBHIconImageAppearanceStore, "defaultIcon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconImageAppearanceStore imageForIcon:appearance:](cachingPlaceholderMiniGridImages, "imageForIcon:appearance:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[SBFolderIconImageSharedCache iconImageCache](self, "iconImageCache");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFolderIconImageSharedCache listLayout](self, "listLayout");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "iconImageInfo");
      if (v8)
        objc_msgSend(v8, "cachingPlaceholderImageWithImageAppearance:options:", v4, 0);
      else
        +[SBHIconImageCache cachingPlaceholderImageWithInfo:imageAppearance:options:](SBHIconImageCache, "cachingPlaceholderImageWithInfo:imageAppearance:options:", v4, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBFolderIconImageCache gridCellImageOfSize:forIconImage:](SBFolderIconImageCache, "gridCellImageOfSize:forIconImage:", v10, SBHIconListLayoutFolderIconGridCellSize(v9));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = self->_cachingPlaceholderMiniGridImages;
      if (!v11)
      {
        v12 = objc_alloc_init(SBHIconImageAppearanceStore);
        v13 = self->_cachingPlaceholderMiniGridImages;
        self->_cachingPlaceholderMiniGridImages = v12;

        v11 = self->_cachingPlaceholderMiniGridImages;
      }
      +[SBHIconImageAppearanceStore defaultIcon](SBHIconImageAppearanceStore, "defaultIcon");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHIconImageAppearanceStore setImage:forIcon:appearance:](v11, "setImage:forIcon:appearance:", v7, v14, v4);

    }
  }
  else
  {
    -[SBFolderIconImageSharedCache genericMiniGridImageWithImageAppearance:](self, "genericMiniGridImageWithImageAppearance:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)updateCachedImagesForFolderIcon:(id)a3 afterChangeToContainedForIcon:(id)a4 imageAppearance:(id)a5 updateType:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  SBHIconImageAppearanceStore *cachedMiniGridImages;
  SBHIconImageAppearanceStore *cachedFolderImages;
  id v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  SBFolderIconImageSharedCache *v21;
  uint64_t *v22;
  uint64_t *v23;
  int64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (!a6)
    {
      cachedMiniGridImages = self->_cachedMiniGridImages;
      if (v12)
      {
        -[SBHIconImageAppearanceStore removeAllImagesForIcon:appearance:](cachedMiniGridImages, "removeAllImagesForIcon:appearance:", v11, v12);
        -[SBHIconImageAppearanceStore removeAllImagesForIcon:appearance:](self->_cachedMiniGridImageGenerations, "removeAllImagesForIcon:appearance:", v11, v12);
      }
      else
      {
        -[SBHIconImageAppearanceStore removeAllImagesForIcon:](cachedMiniGridImages, "removeAllImagesForIcon:", v11);
        -[SBHIconImageAppearanceStore removeAllImagesForIcon:](self->_cachedMiniGridImageGenerations, "removeAllImagesForIcon:", v11);
      }
    }
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0;
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 0;
    cachedFolderImages = self->_cachedFolderImages;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __121__SBFolderIconImageSharedCache_updateCachedImagesForFolderIcon_afterChangeToContainedForIcon_imageAppearance_updateType___block_invoke;
    v17[3] = &unk_1E8D88C60;
    v18 = v12;
    v15 = v10;
    v19 = v15;
    v23 = &v29;
    v24 = a6;
    v21 = self;
    v22 = &v25;
    v20 = v11;
    -[SBHIconImageAppearanceStore enumerateImagesForIcon:usingBlock:](cachedFolderImages, "enumerateImagesForIcon:usingBlock:", v15, v17);
    if (a6 == 2 || *((_BYTE *)v26 + 24))
    {
      if (!*((_BYTE *)v30 + 24))
      {
LABEL_13:

        _Block_object_dispose(&v25, 8);
        _Block_object_dispose(&v29, 8);
        goto LABEL_14;
      }
    }
    else
    {
      SBLogFolderIconImageCache();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[SBFolderIconImageSharedCache updateCachedImagesForFolderIcon:afterChangeToContainedForIcon:imageAppearance:updateType:].cold.1();

      *((_BYTE *)v30 + 24) = 1;
    }
    -[SBFolderIconImageSharedCache informObserversOfUpdateForFolderIcon:](self, "informObserversOfUpdateForFolderIcon:", v15);
    goto LABEL_13;
  }
LABEL_14:

}

void __121__SBFolderIconImageSharedCache_updateCachedImagesForFolderIcon_afterChangeToContainedForIcon_imageAppearance_updateType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  char v19;
  char v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  NSObject *v27;
  int8x16_t v28;
  _QWORD v29[4];
  int8x16_t v30;
  id v31;
  uint64_t v32;
  uint8_t buf[4];
  unint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (!v7 || objc_msgSend(v7, "isEqual:", v6))
  {
    objc_msgSend(*(id *)(a1 + 40), "folder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "listCount");
    v10 = objc_msgSend(v5, "count");
    v11 = objc_msgSend(*(id *)(a1 + 40), "listIndexForContainedIcon:", *(_QWORD *)(a1 + 48));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    if (v11 >= v10)
    {
LABEL_24:

      goto LABEL_25;
    }
    if (v10 != v9)
    {
      SBLogFolderIconImageCache();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        v34 = v10;
        v35 = 2048;
        v36 = v9;
        v37 = 2112;
        v38 = v8;
        _os_log_debug_impl(&dword_1CFEF3000, v21, OS_LOG_TYPE_DEBUG, "purging image for folder after contained icon image updated because list counts differed (%lu vs. %lu): %@", buf, 0x20u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 16), "removeAllImagesForIcon:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 40), "removeObject:", *(_QWORD *)(a1 + 40));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
      goto LABEL_24;
    }
    v12 = v11;
    objc_msgSend(v8, "listAtIndex:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "indexForIcon:", *(_QWORD *)(a1 + 48));

    v15 = objc_msgSend(*(id *)(a1 + 40), "gridCellIndexForIconIndex:", v14);
    objc_msgSend(v5, "pointerAtIndex:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = *(_QWORD *)(a1 + 80);
      if (v18 == 1)
      {
LABEL_14:
        SBLogFolderIconImageCache();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          __121__SBFolderIconImageSharedCache_updateCachedImagesForFolderIcon_afterChangeToContainedForIcon_imageAppearance_updateType___block_invoke_cold_1();

        objc_msgSend(v5, "replacePointerAtIndex:withPointer:", v12, 0);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
        goto LABEL_23;
      }
      if (v18 != 2)
      {
LABEL_18:
        v23 = *(id *)(a1 + 32);
        if (!v23)
        {
          objc_msgSend(v17, "imageAppearance");
          v23 = (id)objc_claimAutoreleasedReturnValue();
        }
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __121__SBFolderIconImageSharedCache_updateCachedImagesForFolderIcon_afterChangeToContainedForIcon_imageAppearance_updateType___block_invoke_139;
        v29[3] = &unk_1E8D88C38;
        v32 = v15;
        v28 = *(int8x16_t *)(a1 + 48);
        v24 = (id)v28.i64[0];
        v30 = vextq_s8(v28, v28, 8uLL);
        v25 = v23;
        v31 = v25;
        objc_msgSend(v17, "gridImageByPatchingCellAtIndex:cellImageProviderBlock:", v15, v29);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        SBLogFolderIconImageCache();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          __121__SBFolderIconImageSharedCache_updateCachedImagesForFolderIcon_afterChangeToContainedForIcon_imageAppearance_updateType___block_invoke_cold_2();

        objc_msgSend(v5, "replacePointerAtIndex:withPointer:", v12, v26);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;

        goto LABEL_23;
      }
      v19 = objc_msgSend(v16, "isIconImageTreatedAtIndex:", v15);
      v20 = v19 ^ +[SBFolderIconImageCache needsTreatmentForIcon:](SBFolderIconImageCache, "needsTreatmentForIcon:", *(_QWORD *)(a1 + 48)) ^ 1;
    }
    else
    {
      v20 = 1;
    }
    if (*(_QWORD *)(a1 + 80) == 1)
      goto LABEL_14;
    if ((v20 & 1) != 0)
    {
LABEL_23:

      goto LABEL_24;
    }
    goto LABEL_18;
  }
LABEL_25:

}

BOOL __121__SBFolderIconImageSharedCache_updateCachedImagesForFolderIcon_afterChangeToContainedForIcon_imageAppearance_updateType___block_invoke_139(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, uint64_t a7, BOOL *a8)
{
  void *v14;
  void *v15;
  _BOOL8 v16;
  BOOL v17;

  if (*(_QWORD *)(a1 + 56) != a2)
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "gridCellImageForIcon:imageAppearance:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v16 = v14 != 0;
  if (v14)
  {
    objc_msgSend(v14, "drawInRect:", a3, a4, a5, a6);
    v17 = +[SBFolderIconImageCache drawTreatmentForIcon:inRect:](SBFolderIconImageCache, "drawTreatmentForIcon:inRect:", *(_QWORD *)(a1 + 40), a3, a4, a5, a6);
    if (a8)
      *a8 = v17;
  }

  return v16;
}

- (unint64_t)numberOfCachedImages
{
  return -[SBHIconImageAppearanceStore numberOfCachedImages](self->_cachedFolderImages, "numberOfCachedImages");
}

- (unint64_t)numberOfCacheHits
{
  return 0;
}

- (unint64_t)numberOfCacheMisses
{
  return 0;
}

- (id)gridCellImageOfSize:(CGSize)a3 forIcon:(id)a4 iconImageInfo:(SBIconImageInfo *)a5 compatibleWithTraitCollection:(id)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;
  double height;
  double width;
  void *v18;
  id v19;
  void *v20;
  void *v21;

  v11 = v9;
  v12 = v8;
  v13 = v7;
  v14 = v6;
  height = a3.height;
  width = a3.width;
  v18 = (void *)MEMORY[0x1E0DC3E88];
  v19 = a4;
  objc_msgSend(v18, "sbh_iconImageAppearanceFromTraitCollection:", a5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderIconImageSharedCache gridCellImageOfSize:forIcon:iconImageInfo:imageAppearance:](self, "gridCellImageOfSize:forIcon:iconImageInfo:imageAppearance:", v19, v20, width, height, v14, v13, v12, v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (void)folderIcon:(id)a3 containedIconImageDidUpdate:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[SBFolderIconImageSharedCache iconImageCache](self, "iconImageCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    -[SBFolderIconImageSharedCache updateCachedImagesForFolderIcon:afterChangeToContainedForIcon:imageAppearance:updateType:](self, "updateCachedImagesForFolderIcon:afterChangeToContainedForIcon:imageAppearance:updateType:", v8, v6, 0, 0);

}

- (void)folderIcon:(id)a3 containedIconAccessoriesDidUpdate:(id)a4
{
  -[SBFolderIconImageSharedCache updateCachedImagesForFolderIcon:afterChangeToContainedForIcon:imageAppearance:updateType:](self, "updateCachedImagesForFolderIcon:afterChangeToContainedForIcon:imageAppearance:updateType:", a3, a4, 0, 2);
}

- (void)folderIcon:(id)a3 containedIconLaunchEnabledDidChange:(id)a4
{
  -[SBFolderIconImageSharedCache updateCachedImagesForFolderIcon:afterChangeToContainedForIcon:imageAppearance:updateType:](self, "updateCachedImagesForFolderIcon:afterChangeToContainedForIcon:imageAppearance:updateType:", a3, a4, 0, 2);
}

- (void)iconImageCache:(id)a3 didUpdateImageForIcon:(id)a4 imageAppearance:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  SBLogFolderIconImageCache();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[SBFolderIconImageSharedCache iconImageCache:didUpdateImageForIcon:imageAppearance:].cold.1(v7, v9);

  -[SBHIconImageAppearanceStore removeAllImagesForIcon:appearance:](self->_cachedMiniGridImages, "removeAllImagesForIcon:appearance:", v7, v8);
  -[SBHIconImageAppearanceStore removeAllImagesForIcon:appearance:](self->_cachedMiniGridImageGenerations, "removeAllImagesForIcon:appearance:", v7, v8);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = (void *)-[NSHashTable copy](self->_cachedFolderIcons, "copy");
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v15, "folder");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "containsIcon:", v7))
          -[SBFolderIconImageSharedCache updateCachedImagesForFolderIcon:afterChangeToContainedForIcon:imageAppearance:updateType:](self, "updateCachedImagesForFolderIcon:afterChangeToContainedForIcon:imageAppearance:updateType:", v15, v7, v8, 0);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v12);
  }

  -[SBFolderIconImageSharedCache gridCellImageForIcon:imageAppearance:](self, "gridCellImageForIcon:imageAppearance:", v7, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderIconImageSharedCache miniGridImageLayers](self, "miniGridImageLayers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "imageForIcon:appearance:", v7, v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "setContents:", objc_msgSend(objc_retainAutorelease(v17), "CGImage"));
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v21);
  }

}

- (void)folder:(id)a3 didAddList:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  SBHIconImageAppearanceStore *cachedFolderImages;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  SBFolderIconImageSharedCache *v17;
  id v18;

  v6 = a3;
  v7 = a4;
  SBLogFolderIconImageCache();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SBFolderIconImageSharedCache folder:didAddList:].cold.1();

  objc_msgSend(v6, "icon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  cachedFolderImages = self->_cachedFolderImages;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __50__SBFolderIconImageSharedCache_folder_didAddList___block_invoke;
  v14[3] = &unk_1E8D88C88;
  v15 = v6;
  v16 = v7;
  v17 = self;
  v18 = v9;
  v11 = v9;
  v12 = v7;
  v13 = v6;
  -[SBHIconImageAppearanceStore enumerateImagesForIcon:usingBlock:](cachedFolderImages, "enumerateImagesForIcon:usingBlock:", v11, v14);

}

void __50__SBFolderIconImageSharedCache_folder_didAddList___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = objc_msgSend(*(id *)(a1 + 32), "indexOfList:", *(_QWORD *)(a1 + 40));
  if (v8
    && v6 != 0x7FFFFFFFFFFFFFFFLL
    && (v7 = objc_msgSend(v8, "count") + 1, v7 == objc_msgSend(*(id *)(a1 + 32), "listCount")))
  {
    objc_msgSend(v8, "insertPointer:atIndex:", 0, v6);
    objc_msgSend(*(id *)(a1 + 48), "informObserversOfUpdateForFolderIcon:", *(_QWORD *)(a1 + 56));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "rebuildImagesForFolderIcon:appearance:", *(_QWORD *)(a1 + 56), v5);
  }

}

- (void)folder:(id)a3 didRemoveLists:(id)a4 atIndexes:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  SBHIconImageAppearanceStore *cachedFolderImages;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  SBFolderIconImageSharedCache *v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  SBLogFolderIconImageCache();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[SBFolderIconImageSharedCache folder:didRemoveLists:atIndexes:].cold.1();

  objc_msgSend(v8, "icon");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  cachedFolderImages = self->_cachedFolderImages;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__SBFolderIconImageSharedCache_folder_didRemoveLists_atIndexes___block_invoke;
  v17[3] = &unk_1E8D88CD8;
  v22 = &v23;
  v14 = v8;
  v18 = v14;
  v15 = v10;
  v19 = v15;
  v20 = self;
  v16 = v12;
  v21 = v16;
  -[SBHIconImageAppearanceStore enumerateImagesForIcon:usingBlock:](cachedFolderImages, "enumerateImagesForIcon:usingBlock:", v16, v17);
  if (!*((_BYTE *)v24 + 24))
    -[SBFolderIconImageSharedCache informObserversOfUpdateForFolderIcon:](self, "informObserversOfUpdateForFolderIcon:", v16);

  _Block_object_dispose(&v23, 8);
}

void __64__SBFolderIconImageSharedCache_folder_didRemoveLists_atIndexes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v9 = a2;
  v5 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  v6 = objc_msgSend(*(id *)(a1 + 32), "listCount");
  v7 = objc_msgSend(*(id *)(a1 + 40), "count") + v6;
  if (v7 == objc_msgSend(v9, "count"))
  {
    v8 = *(void **)(a1 + 40);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __64__SBFolderIconImageSharedCache_folder_didRemoveLists_atIndexes___block_invoke_2;
    v10[3] = &unk_1E8D88CB0;
    v11 = v9;
    objc_msgSend(v8, "enumerateIndexesWithOptions:usingBlock:", 2, v10);
    objc_msgSend(*(id *)(a1 + 48), "informObserversOfUpdateForFolderIcon:", *(_QWORD *)(a1 + 56));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "rebuildImagesForFolderIcon:appearance:", *(_QWORD *)(a1 + 56), v5);
  }

}

uint64_t __64__SBFolderIconImageSharedCache_folder_didRemoveLists_atIndexes___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removePointerAtIndex:", a2);
}

- (void)folder:(id)a3 didMoveList:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  SBHIconImageAppearanceStore *cachedFolderImages;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  id v21;
  SBFolderIconImageSharedCache *v22;
  id v23;
  uint64_t *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v10 = a3;
  v11 = a4;
  SBLogFolderIconImageCache();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[SBFolderIconImageSharedCache folder:didMoveList:fromIndex:toIndex:].cold.1();

  objc_msgSend(v10, "icon");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  cachedFolderImages = self->_cachedFolderImages;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __69__SBFolderIconImageSharedCache_folder_didMoveList_fromIndex_toIndex___block_invoke;
  v20 = &unk_1E8D88D00;
  v24 = &v27;
  v15 = v10;
  v25 = a5;
  v26 = a6;
  v21 = v15;
  v22 = self;
  v16 = v13;
  v23 = v16;
  -[SBHIconImageAppearanceStore enumerateImagesForIcon:usingBlock:](cachedFolderImages, "enumerateImagesForIcon:usingBlock:", v16, &v17);
  if (!*((_BYTE *)v28 + 24))
    -[SBFolderIconImageSharedCache informObserversOfUpdateForFolderIcon:](self, "informObserversOfUpdateForFolderIcon:", v16, v17, v18, v19, v20, v21, v22);

  _Block_object_dispose(&v27, 8);
}

void __69__SBFolderIconImageSharedCache_folder_didMoveList_fromIndex_toIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  v6 = objc_msgSend(*(id *)(a1 + 32), "listCount");
  if (v6 == objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "pointerAtIndex:", *(_QWORD *)(a1 + 64));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removePointerAtIndex:", *(_QWORD *)(a1 + 64));
    objc_msgSend(v8, "insertPointer:atIndex:", v7, *(_QWORD *)(a1 + 72));
    objc_msgSend(*(id *)(a1 + 40), "informObserversOfUpdateForFolderIcon:", *(_QWORD *)(a1 + 48));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "rebuildImagesForFolderIcon:appearance:", *(_QWORD *)(a1 + 48), v5);
  }

}

- (void)folder:(id)a3 didAddIcons:(id)a4 removedIcons:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;

  v6 = a3;
  SBLogFolderIconImageCache();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[SBFolderIconImageSharedCache folder:didAddIcons:removedIcons:].cold.1();

  objc_msgSend(v6, "icon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderIconImageSharedCache rebuildImagesForFolderIcon:](self, "rebuildImagesForFolderIcon:", v8);

}

- (void)folder:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  SBLogFolderIconImageCache();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v9, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412802;
    v16 = v8;
    v17 = 2112;
    v18 = v13;
    v19 = 2112;
    v20 = v14;
    _os_log_debug_impl(&dword_1CFEF3000, v11, OS_LOG_TYPE_DEBUG, "observed folder '%@' replaced '%@' with '%@'", (uint8_t *)&v15, 0x20u);

  }
  objc_msgSend(v8, "icon");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderIconImageSharedCache updateCachedImagesForFolderIcon:afterChangeToContainedForIcon:imageAppearance:updateType:](self, "updateCachedImagesForFolderIcon:afterChangeToContainedForIcon:imageAppearance:updateType:", v12, v10, 0, 1);

}

- (void)folder:(id)a3 didMoveIcon:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  SBLogFolderIconImageCache();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SBFolderIconImageSharedCache folder:didMoveIcon:].cold.1((uint64_t)v6, v7, v8);

  objc_msgSend(v6, "icon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderIconImageSharedCache rebuildImagesForFolderIcon:](self, "rebuildImagesForFolderIcon:", v9);

}

- (BOOL)isMiniGridImageLoadingAsynchronous
{
  return self->_miniGridImageLoadingAsynchronous;
}

- (void)setMiniGridImageLoadingAsynchronous:(BOOL)a3
{
  self->_miniGridImageLoadingAsynchronous = a3;
}

- (SBIconListLayout)listLayout
{
  return self->_listLayout;
}

- (SBHIconImageCache)iconImageCache
{
  return self->_iconImageCache;
}

- (CPMemoryPool)pool
{
  return self->_pool;
}

- (CPMemoryPool)miniGridImagePool
{
  return self->_miniGridImagePool;
}

- (SBHIconImageAppearanceStore)miniGridImageLayers
{
  return self->_miniGridImageLayers;
}

- (void)setMiniGridImageLayers:(id)a3
{
  objc_storeStrong((id *)&self->_miniGridImageLayers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_miniGridImageLayers, 0);
  objc_storeStrong((id *)&self->_miniGridImagePool, 0);
  objc_storeStrong((id *)&self->_pool, 0);
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_storeStrong((id *)&self->_listLayout, 0);
  objc_storeStrong((id *)&self->_cachingPlaceholderMiniGridImages, 0);
  objc_storeStrong((id *)&self->_genericMiniGridImages, 0);
  objc_storeStrong((id *)&self->_folderIconImageCaches, 0);
  objc_storeStrong((id *)&self->_cachedFolderIcons, 0);
  objc_storeStrong((id *)&self->_cachedMiniGridImageGenerations, 0);
  objc_storeStrong((id *)&self->_cachedMiniGridImages, 0);
  objc_storeStrong((id *)&self->_cachedFolderImages, 0);
  objc_storeStrong((id *)&self->_folderIconObservers, 0);
}

- (void)gridCellImageForIcon:imageAppearance:isLoading:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1CFEF3000, v0, (uint64_t)v0, "making new grid cell image for icon %@ (using cache: %@)", v1);
  OUTLINED_FUNCTION_3();
}

- (void)rebuildImagesForFolderIcon:appearance:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1CFEF3000, v0, (uint64_t)v0, "rebuilding image for icon: %@, appearance: %@", v1);
  OUTLINED_FUNCTION_3();
}

- (void)updateCachedImagesForFolderIcon:afterChangeToContainedForIcon:imageAppearance:updateType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1CFEF3000, v0, v1, "no internal update needed to cached images but will inform observers of update", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __121__SBFolderIconImageSharedCache_updateCachedImagesForFolderIcon_afterChangeToContainedForIcon_imageAppearance_updateType___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1CFEF3000, v0, v1, "purging image for list %lu after contents of page changed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __121__SBFolderIconImageSharedCache_updateCachedImagesForFolderIcon_afterChangeToContainedForIcon_imageAppearance_updateType___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1CFEF3000, v0, v1, "updating image for folder after contained icon image updated %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)iconImageCache:(void *)a1 didUpdateImageForIcon:(NSObject *)a2 imageAppearance:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_1CFEF3000, a2, OS_LOG_TYPE_DEBUG, "observed updated icon from icon cache: %@", v4, 0xCu);

}

- (void)folder:didAddList:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1CFEF3000, v0, v1, "observed folder added list: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)folder:didRemoveLists:atIndexes:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1CFEF3000, v0, v1, "observed folder removed list: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)folder:didMoveList:fromIndex:toIndex:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1CFEF3000, v0, v1, "observed folder moved list: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)folder:didAddIcons:removedIcons:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1CFEF3000, v0, v1, "observed folder added or removed icons: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)folder:(NSObject *)a3 didMoveIcon:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_2(&dword_1CFEF3000, a3, v6, "observed folder '%@' moved '%@'", (uint8_t *)&v7);

}

@end
