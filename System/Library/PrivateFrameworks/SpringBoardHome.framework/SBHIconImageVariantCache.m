@implementation SBHIconImageVariantCache

- (id)_cacheKeyForIcon:(id)a3
{
  return (id)objc_msgSend(a3, "iconImageCacheIdentifier");
}

- (id)iconImagesMemoryPool
{
  id WeakRetained;
  void *v3;

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_iconImageCache);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "iconImagesMemoryPool");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (_QWORD)initWithVariant:(double)a3 iconImageInfo:(double)a4
{
  _QWORD *v11;
  _QWORD *v12;
  SBHIconImageAppearanceStore *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  SBHIconImageAppearanceStore *v19;
  void *v20;
  SBHIconImageAppearanceStore *v21;
  void *v22;
  id v23;
  void *v24;
  objc_super v26;

  if (!a1)
    return 0;
  v26.receiver = a1;
  v26.super_class = (Class)SBHIconImageVariantCache;
  v11 = objc_msgSendSuper2(&v26, sel_init);
  v12 = v11;
  if (v11)
  {
    v11[9] = a2;
    *((double *)v11 + 11) = a3;
    *((double *)v11 + 12) = a4;
    *((double *)v11 + 13) = a5;
    *((double *)v11 + 14) = a6;
    *((_DWORD *)v11 + 16) = 0;
    v13 = objc_alloc_init(SBHIconImageAppearanceStore);
    v14 = (void *)v12[1];
    v12[1] = v13;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v12[2];
    v12[2] = v15;

    v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v18 = (void *)v12[3];
    v12[3] = v17;

    v19 = objc_alloc_init(SBHIconImageAppearanceStore);
    v20 = (void *)v12[4];
    v12[4] = v19;

    v21 = objc_alloc_init(SBHIconImageAppearanceStore);
    v22 = (void *)v12[5];
    v12[5] = v21;

    v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v24 = (void *)v12[7];
    v12[7] = v23;

  }
  return v12;
}

- (id)pooledIconImageForMappedIconImage:(id)a3
{
  return -[SBHIconImageVariantCache _pooledIconImageForIconImage:allowingOptOut:](self, "_pooledIconImageForIconImage:allowingOptOut:", a3, 1);
}

- (id)_variantDescription
{
  id result;
  int64_t variant;
  const __CFString *v5;

  result = CFSTR("masked");
  if (self)
  {
    variant = self->_variant;
    v5 = CFSTR("unmasked");
    if (variant != 1)
      v5 = 0;
    if (variant)
      return (id)v5;
  }
  return result;
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
  if (v4 && !-[SBHIconImageVariantCache _canPoolImage](self, "_canPoolImage"))
    goto LABEL_8;
  -[SBHIconImageVariantCache iconImagesMemoryPool](self, "iconImagesMemoryPool");
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

- (BOOL)_canPoolImage
{
  id WeakRetained;
  char v3;

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_iconImageCache);
  else
    WeakRetained = 0;
  v3 = objc_msgSend(WeakRetained, "_canPoolImage");

  return v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_iconImageCache);
  objc_storeStrong((id *)&self->_iconsByIconCacheIdentifier, 0);
  objc_storeStrong((id *)&self->_genericImages, 0);
  objc_storeStrong((id *)&self->_fetchedImageGenerations, 0);
  objc_storeStrong((id *)&self->_storedImageGenerations, 0);
  objc_storeStrong((id *)&self->_cachingRequests, 0);
  objc_storeStrong((id *)&self->_failedIcons, 0);
  objc_storeStrong((id *)&self->_images, 0);
}

- (id)realImageForIcon:(void *)a3 imageAppearance:(uint64_t)a4 options:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id WeakRetained;
  char v13;
  SBHIconImageCacheRequest *v14;
  id v15;
  id v16;
  id v17;
  id *v18;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  char v27;

  v7 = a2;
  v8 = a3;
  if (a1)
  {
    BSDispatchQueueAssertMain();
    -[SBHIconImageVariantCache cachedImageForIcon:imageAppearance:options:](a1, v7, v8, a4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend((id)a1, "iconImagesMemoryPool");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        SBFPreheatImageData();

      v11 = v9;
    }
    else if ((a4 & 4) != 0 || (objc_msgSend(*(id *)(a1 + 16), "containsObject:", v7) & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
      v22 = (void *)objc_msgSend((id)a1, "currentImageGenerationForIcon:", v7);
      v13 = *(_QWORD *)(a1 + 72) == 0;
      v21 = (void *)objc_msgSend((id)objc_opt_class(), "optionsForRetrievalOptions:", a4);
      v20 = (void *)objc_msgSend((id)objc_opt_class(), "defaultPriority");
      v14 = [SBHIconImageCacheRequest alloc];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __69__SBHIconImageVariantCache_realImageForIcon_imageAppearance_options___block_invoke;
      v23[3] = &unk_1E8D84EA0;
      v27 = v13;
      v24 = WeakRetained;
      v15 = v7;
      v25 = v15;
      v16 = v8;
      v26 = v16;
      v17 = WeakRetained;
      v18 = -[SBHIconImageCacheRequest initWithIcon:imageAppearance:priority:reason:imageGeneration:masked:options:sharedCancellation:completionHandler:]((id *)&v14->super.isa, v15, v16, v20, CFSTR("realImageForIcon"), v22, v13, v21, 0, v23);
      -[SBHIconImageVariantCache submitRequest:]((id *)a1, v18);
      -[SBHIconImageVariantCache cachedImageForIcon:imageAppearance:options:](a1, v15, v16, a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)cachedImageForIcon:(void *)a3 imageAppearance:(char)a4 options:
{
  id v7;
  id v8;
  void *v9;

  v7 = a2;
  v8 = a3;
  if (!a1 || (BSDispatchQueueAssertMain(), (a4 & 8) != 0))
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 8), "imageForIcon:appearance:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)cacheImage:(void *)a3 forIcon:(void *)a4 imageAppearance:
{
  id v7;
  id v8;
  id v9;

  if (a1)
  {
    v7 = a4;
    v9 = a3;
    v8 = a2;
    BSDispatchQueueAssertMain();
    objc_msgSend(a1[1], "setImage:forIcon:appearance:", v8, v9, v7);

    objc_msgSend(a1[2], "removeObject:", v9);
    objc_msgSend(a1, "setStoredImageGeneration:forIcon:imageAppearance:", objc_msgSend(a1, "currentImageGenerationForIcon:", v9), v9, v7);

  }
}

- (void)submitRequest:(id *)a1
{
  id *v3;
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  _QWORD v9[5];
  id *v10;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (v3)
    {
      v5 = v3[4];
      if (((_BYTE)v4[11] & 8) != 0)
        goto LABEL_9;
      v6 = v4[9];
    }
    else
    {
      v5 = 0;
      v6 = 0;
    }
    if ((objc_msgSend(v5, "canGenerateIconsInBackground") & 1) != 0)
    {
      objc_msgSend(a1[3], "addObject:", v4);
      WeakRetained = objc_loadWeakRetained(a1 + 10);
      if (!WeakRetained)
        NSLog(CFSTR("missing icon image cache"));
      v8 = objc_msgSend(a1, "effectivePriorityForPriority:", v6);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __42__SBHIconImageVariantCache_submitRequest___block_invoke;
      v9[3] = &unk_1E8D84EF0;
      v9[4] = a1;
      v10 = v4;
      objc_msgSend(WeakRetained, "performBackgroundCachingActivityUsingPriority:block:", v8, v9);

      goto LABEL_10;
    }
LABEL_9:
    objc_msgSend(a1, "performSynchronousCacheRequest:", v4);
LABEL_10:

  }
}

- (void)recacheImagesForIcon:(void *)a3 completionGroup:
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;

  v7 = a2;
  v5 = a3;
  if (a1)
  {
    BSDispatchQueueAssertMain();
    v6 = *(void **)(a1 + 8);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__SBHIconImageVariantCache_recacheImagesForIcon_completionGroup___block_invoke;
    v8[3] = &unk_1E8D84F90;
    v9 = v5;
    v10 = a1;
    v11 = v7;
    objc_msgSend(v6, "enumerateImagesForIcon:usingBlock:", v11, v8);

  }
}

- (void)purgeCachedImagesForIcons:(id *)a1
{
  id v3;
  id v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  id obj;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    BSDispatchQueueAssertMain();
    objc_msgSend(a1, "_variantDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v15 = v3;
    obj = v3;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    if (v19)
    {
      v18 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(obj);
          v6 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(a1, "_cacheKeyForIcon:", v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[1], "removeAllImagesForIcon:", v6);
          objc_msgSend(a1[2], "removeObject:", v6);
          objc_msgSend(a1, "removeCachedIcon:", v6);
          v22 = 0u;
          v23 = 0u;
          v20 = 0u;
          v21 = 0u;
          v8 = a1[3];
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v21;
            do
            {
              for (j = 0; j != v10; ++j)
              {
                if (*(_QWORD *)v21 != v11)
                  objc_enumerationMutation(v8);
                v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
                if (-[SBHIconImageCacheRequest matchesIcon:]((uint64_t)v13))
                {
                  objc_msgSend(v13, "cancel");
                  objc_msgSend(v4, "addObject:", v13);
                }
              }
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
            }
            while (v10);
          }

          SBLogIconImageCache();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543618;
            v29 = v16;
            v30 = 2112;
            v31 = v7;
            _os_log_debug_impl(&dword_1CFEF3000, v14, OS_LOG_TYPE_DEBUG, "Purging cached %{public}@ image for icon with key: %@", buf, 0x16u);
          }

        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      }
      while (v19);
    }

    objc_msgSend(a1[3], "removeObjectsInArray:", v4);
    objc_msgSend(a1, "removeStoredImageGenerationForIcons:", obj);

    v3 = v15;
  }

}

- (void)purgeAllCachedImages
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1CFEF3000, v0, v1, "Purging all cached icon %{public}@ images", v2);
  OUTLINED_FUNCTION_3();
}

- (void)purgeAllCachedImagesForAppearancesOtherThanAppearances:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a2;
  if (a1)
  {
    BSDispatchQueueAssertMain();
    objc_msgSend((id)a1, "_variantDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogIconImageCache();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[SBHIconImageVariantCache purgeAllCachedImagesForAppearancesOtherThanAppearances:].cold.1();

    objc_msgSend(*(id *)(a1 + 8), "removeAllImagesForAppearancesOtherThanAppearances:", v3);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    objc_msgSend(*(id *)(a1 + 32), "removeAllImagesForAppearancesOtherThanAppearances:", v3);
    objc_msgSend(*(id *)(a1 + 40), "removeAllImagesForAppearancesOtherThanAppearances:", v3);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));

  }
}

- (uint64_t)cancelAllCachingRequests
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    BSDispatchQueueAssertMain();
    SBLogIconImageCache();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      -[SBHIconImageVariantCache cancelAllCachingRequests].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = *(id *)(v1 + 24);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "cancel", (_QWORD)v15);
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }

    return objc_msgSend(*(id *)(v1 + 24), "removeAllObjects");
  }
  return result;
}

- (uint64_t)isCachingImageForIcon:(id *)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    BSDispatchQueueAssertMain();
    objc_msgSend(a1, "_cacheKeyForIcon:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v5 = a1[3];
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v11;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v11 != v7)
              objc_enumerationMutation(v5);
            if ((-[SBHIconImageCacheRequest matchesIcon:](*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)) & 1) != 0)
            {
              v6 = 1;
              goto LABEL_13;
            }
          }
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
          if (v6)
            continue;
          break;
        }
      }
LABEL_13:

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)hasCachingRequestsStillDoingInitialWork
{
  void *v1;
  _BOOL8 v2;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 24), "indexesOfObjectsPassingTest:", &__block_literal_global_329);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count") != 0;

  return v2;
}

- (id)genericImageWithImageAppearance:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SBHIconImageAppearanceStore *v8;
  void *v9;
  void *v10;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    +[SBHIconImageAppearanceStore defaultIcon](SBHIconImageAppearanceStore, "defaultIcon");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageForIcon:appearance:", v5, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      +[SBHIconImageCache genericImageWithInfo:imageAppearance:options:](SBHIconImageCache, "genericImageWithInfo:imageAppearance:options:", v3, objc_msgSend((id)a1, "imageRetrievalOptions"), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(a1 + 48);
      if (!v7)
      {
        v8 = objc_alloc_init(SBHIconImageAppearanceStore);
        v9 = *(void **)(a1 + 48);
        *(_QWORD *)(a1 + 48) = v8;

        v7 = *(void **)(a1 + 48);
      }
      +[SBHIconImageAppearanceStore defaultIcon](SBHIconImageAppearanceStore, "defaultIcon");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setImage:forIcon:appearance:", v6, v10, v3);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)cachingPlaceholderImageWithImageAppearance:(void *)a1
{
  if (a1)
  {
    -[SBHIconImageVariantCache genericImageWithImageAppearance:]((uint64_t)a1, a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)cancelCachingRequestsForIcon:(uint64_t)a1
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    BSDispatchQueueAssertMain();
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = *(id *)(a1 + 24);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (-[SBHIconImageCacheRequest matchesIcon:]((uint64_t)v11))
          {
            objc_msgSend(v11, "cancel", (_QWORD)v13);
            objc_msgSend(v4, "addObject:", v11);
            -[SBHIconImageCacheRequest callCompletionHandlersWithResult:]((uint64_t)v11, 0);
            v8 = 1;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }
    else
    {
      v8 = 0;
    }

    objc_msgSend(*(id *)(a1 + 24), "removeObjectsInArray:", v4);
  }
  else
  {
    v8 = 0;
  }

  return v8 & 1;
}

- (void)resetFailedStatusForIcon:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    BSDispatchQueueAssertMain();
    objc_msgSend(*(id *)(a1 + 16), "removeObject:", v3);

  }
}

uint64_t __69__SBHIconImageVariantCache_realImageForIcon_imageAppearance_options___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3 && a2 == 2)
  {
    if (*(_BYTE *)(result + 56))
      return objc_msgSend(*(id *)(result + 32), "finishedAsynchronousLoadOfIcon:imageAppearance:requestStartTimestamp:elapsedTime:", *(_QWORD *)(result + 40), *(_QWORD *)(result + 48), a3);
  }
  return result;
}

- (void)cacheImageForIcon:(void *)a3 imageAppearance:(void *)a4 priority:(void *)a5 reason:(void *)a6 options:(void *)a7 cancellation:(void *)a8 completionHandler:
{
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  SBHIconImageCacheRequest *v24;
  id *p_isa;
  id *v26;
  void *v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  char v33;

  v15 = a2;
  v16 = a3;
  v17 = a5;
  v28 = a7;
  v18 = a8;
  if (a1)
  {
    BSDispatchQueueAssertMain();
    if ((a6 & 4) != 0
      || (-[SBHIconImageVariantCache cachedImageForIcon:imageAppearance:options:]((uint64_t)a1, v15, v16, 0),
          (v19 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v27 = (void *)objc_msgSend(a1, "currentImageGenerationForIcon:", v15);
      v21 = a4;
      v22 = a1[9] == 0;
      v23 = v17;
      v24 = [SBHIconImageCacheRequest alloc];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __117__SBHIconImageVariantCache_cacheImageForIcon_imageAppearance_priority_reason_options_cancellation_completionHandler___block_invoke;
      v29[3] = &unk_1E8D84EC8;
      v33 = v22;
      v32 = v18;
      v29[4] = a1;
      v30 = v15;
      v31 = v16;
      p_isa = (id *)&v24->super.isa;
      v17 = v23;
      v26 = -[SBHIconImageCacheRequest initWithIcon:imageAppearance:priority:reason:imageGeneration:masked:options:sharedCancellation:completionHandler:](p_isa, v30, v31, v21, v23, v27, v22, a6, v28, v29);
      -[SBHIconImageVariantCache submitRequest:]((id *)a1, v26);

      v20 = 0;
    }
    else
    {
      v20 = (void *)v19;
      if (v18)
        (*((void (**)(id, uint64_t))v18 + 2))(v18, 1);
    }

  }
}

void __117__SBHIconImageVariantCache_cacheImageForIcon_imageAppearance_priority_reason_options_cancellation_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;
  id v11;

  v8 = *(_QWORD *)(a1 + 56);
  if (v8)
    (*(void (**)(uint64_t, BOOL))(v8 + 16))(v8, a2 != 0);
  if (a2 == 2 && *(_BYTE *)(a1 + 64))
  {
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      WeakRetained = objc_loadWeakRetained((id *)(v9 + 80));
    else
      WeakRetained = 0;
    v11 = WeakRetained;
    objc_msgSend(WeakRetained, "finishedAsynchronousLoadOfIcon:imageAppearance:requestStartTimestamp:elapsedTime:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a3, a4);

  }
}

uint64_t __42__SBHIconImageVariantCache_submitRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performBackgroundCacheWorkForCachingRequest:", *(_QWORD *)(a1 + 40));
}

- (int64_t)effectivePriorityForPriority:(int64_t)a3
{
  int64_t v3;

  if (self)
  {
    if (a3 >= 1)
      v3 = 1;
    else
      v3 = a3;
    if (self->_variant == 1)
      return v3;
  }
  return a3;
}

- (void)performBackgroundCacheWorkForCachingRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id WeakRetained;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD block[5];
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  unint64_t v33;
  __int16 v34;
  unint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[SBHIconImageCache _workQueue](SBHIconImageCache, "_workQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert();

  -[SBHIconImageVariantCache _variantDescription](self, "_variantDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBHIconImageCacheRequest isCancelled]((uint64_t)v4))
  {
    SBLogIconImageCache();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v31 = v6;
      _os_log_impl(&dword_1CFEF3000, v7, OS_LOG_TYPE_DEFAULT, "Stopping %{public}@ caching operation because user cancelled", buf, 0xCu);
    }

    if (v4)
      *((_BYTE *)v4 + 18) = 1;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__SBHIconImageVariantCache_performBackgroundCacheWorkForCachingRequest___block_invoke;
    block[3] = &unk_1E8D84EF0;
    block[4] = self;
    v29 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    if (v4)
    {
      v8 = *((id *)v4 + 4);
      v9 = *((id *)v4 + 7);
      v10 = *((_QWORD *)v4 + 8);
    }
    else
    {
      v9 = 0;
      v8 = 0;
      v10 = 0;
    }
    v11 = -[SBHIconImageVariantCache fetchedImageGenerationForIcon:imageAppearance:](self, "fetchedImageGenerationForIcon:imageAppearance:", v8, v9);
    if (v11 && (v12 = v11, v11 >= v10))
    {
      SBLogIconImageCache();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v31 = v6;
        v32 = 2048;
        v33 = v10;
        v34 = 2048;
        v35 = v12;
        _os_log_impl(&dword_1CFEF3000, v13, OS_LOG_TYPE_DEFAULT, "Stopping %{public}@ caching operation because the fetched image generation (%lu) is already stored (%lu)", buf, 0x20u);
      }

      if (v4)
        *((_BYTE *)v4 + 18) = 1;
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __72__SBHIconImageVariantCache_performBackgroundCacheWorkForCachingRequest___block_invoke_322;
      v26[3] = &unk_1E8D84EF0;
      v26[4] = self;
      v27 = v4;
      dispatch_async(MEMORY[0x1E0C80D38], v26);

    }
    else
    {
      if (v4)
        v14 = *((_QWORD *)v4 + 11);
      else
        v14 = 0;
      -[SBHIconImageVariantCache _variantImageForIcon:imageAppearance:options:](self, "_variantImageForIcon:imageAppearance:options:", v8, v9, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        -[SBHIconImageVariantCache setFetchedImageGeneration:forIcon:imageAppearance:](self, "setFetchedImageGeneration:forIcon:imageAppearance:", v10, v8, v9);
      if (v4)
        *((_BYTE *)v4 + 18) = 1;
      v16 = MEMORY[0x1E0C809B0];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __72__SBHIconImageVariantCache_performBackgroundCacheWorkForCachingRequest___block_invoke_2;
      v23[3] = &unk_1E8D84F18;
      v23[4] = self;
      v17 = v4;
      v24 = v17;
      v18 = v15;
      v25 = v18;
      dispatch_async(MEMORY[0x1E0C80D38], v23);
      if (v15)
      {
        if (self)
          WeakRetained = objc_loadWeakRetained((id *)&self->_iconImageCache);
        else
          WeakRetained = 0;
        v20[0] = v16;
        v20[1] = 3221225472;
        v20[2] = __72__SBHIconImageVariantCache_performBackgroundCacheWorkForCachingRequest___block_invoke_3;
        v20[3] = &unk_1E8D84F18;
        v20[4] = self;
        v21 = v17;
        v22 = v18;
        objc_msgSend(WeakRetained, "performBackgroundFileActivityUsingBlock:", v20);

      }
    }

  }
}

uint64_t __72__SBHIconImageVariantCache_performBackgroundCacheWorkForCachingRequest___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectIdenticalTo:", *(_QWORD *)(a1 + 40));
  return -[SBHIconImageCacheRequest callCompletionHandlersWithResult:](*(_QWORD *)(a1 + 40), 0);
}

uint64_t __72__SBHIconImageVariantCache_performBackgroundCacheWorkForCachingRequest___block_invoke_322(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectIdenticalTo:", *(_QWORD *)(a1 + 40));
  return -[SBHIconImageCacheRequest callCompletionHandlersWithResult:](*(_QWORD *)(a1 + 40), 1);
}

uint64_t __72__SBHIconImageVariantCache_performBackgroundCacheWorkForCachingRequest___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishInitialBackgroundCacheWorkForCachingRequest:fetchedDirtyImage:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __72__SBHIconImageVariantCache_performBackgroundCacheWorkForCachingRequest___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performBackgroundFileWorkForCachingRequest:fetchedDirtyImage:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)finishInitialBackgroundCacheWorkForCachingRequest:(id)a3 fetchedDirtyImage:(id)a4
{
  id *v6;
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  int v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id WeakRetained;
  int v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  _QWORD block[4];
  id *v28;
  id v29;
  uint8_t buf[4];
  unint64_t v31;
  __int16 v32;
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = (id *)a3;
  v7 = a4;
  BSDispatchQueueAssertMain();
  if (v6)
  {
    v8 = v6[4];
    v9 = v6[7];
    v10 = (unint64_t)v6[8];
    v11 = (*((unsigned __int8 *)v6 + 88) >> 2) & 1;
  }
  else
  {
    v10 = 0;
    v8 = 0;
    v9 = 0;
    v11 = 0;
  }
  -[SBHIconImageVariantCache _cacheKeyForIcon:](self, "_cacheKeyForIcon:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconImageVariantCache _variantDescription](self, "_variantDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconImageAppearanceStore imageForIcon:appearance:](self->_images, "imageForIcon:appearance:", v8, v9);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SBHIconImageVariantCache storedImageGenerationForIcon:imageAppearance:](self, "storedImageGenerationForIcon:imageAppearance:", v8, v9);
  if (v14)
  {
    v15 = v14;
    if (v14 >= v10)
    {
      v25 = v7;
      v16 = v12;
      SBLogIconImageCache();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v26)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          v31 = v10;
          v32 = 2048;
          v33 = v15;
          _os_log_impl(&dword_1CFEF3000, v18, OS_LOG_TYPE_DEFAULT, "Stopping caching operation because the image generation (%lu) is already stored (%lu)", buf, 0x16u);
        }

        -[NSMutableArray removeObjectIdenticalTo:](self->_cachingRequests, "removeObjectIdenticalTo:", v6);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __96__SBHIconImageVariantCache_finishInitialBackgroundCacheWorkForCachingRequest_fetchedDirtyImage___block_invoke;
        block[3] = &unk_1E8D84C50;
        v28 = v6;
        dispatch_async(MEMORY[0x1E0C80D38], block);
        WeakRetained = v28;
        v12 = v16;
        v7 = v25;
        goto LABEL_30;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[SBHIconImageVariantCache finishInitialBackgroundCacheWorkForCachingRequest:fetchedDirtyImage:].cold.3();

      -[SBHIconImageVariantCache removeStoredImageGenerationForIcon:imageAppearance:](self, "removeStoredImageGenerationForIcon:imageAppearance:", v8, v9);
      v12 = v16;
      v7 = v25;
    }
  }
  if (v7)
  {
    if (v26)
      v20 = v11;
    else
      v20 = 1;
    if (v20 == 1)
    {
      SBLogIconImageCache();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[SBHIconImageVariantCache finishInitialBackgroundCacheWorkForCachingRequest:fetchedDirtyImage:].cold.2();

      -[SBHIconImageAppearanceStore setImage:forIcon:appearance:](self->_images, "setImage:forIcon:appearance:", v7, v8, v9);
      -[SBHIconImageVariantCache setStoredImageGeneration:forIcon:imageAppearance:](self, "setStoredImageGeneration:forIcon:imageAppearance:", v10, v8, v9);
      -[SBHIconImageVariantCache addCachedIcon:](self, "addCachedIcon:", v8);
      v22 = 2;
    }
    else if (-[SBHIconImageVariantCache hasOtherCachedIconsForIcon:](self, "hasOtherCachedIconsForIcon:", v8))
    {
      v22 = 2;
    }
    else
    {
      v22 = 1;
    }
    -[NSHashTable removeObject:](self->_failedIcons, "removeObject:", v8, v25);
  }
  else
  {
    SBLogIconImageCache();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[SBHIconImageVariantCache finishInitialBackgroundCacheWorkForCachingRequest:fetchedDirtyImage:].cold.1();

    -[NSMutableArray removeObjectIdenticalTo:](self->_cachingRequests, "removeObjectIdenticalTo:", v6);
    -[SBHIconImageAppearanceStore removeAllImagesForIcon:](self->_images, "removeAllImagesForIcon:", v8);
    -[NSHashTable addObject:](self->_failedIcons, "addObject:", v8);
    v29 = v8;
    v22 = 1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconImageVariantCache removeStoredImageGenerationForIcons:](self, "removeStoredImageGenerationForIcons:", v24);

    -[SBHIconImageVariantCache removeCachedIcon:](self, "removeCachedIcon:", v8);
  }
  if (v6)
    *((_BYTE *)v6 + 19) = 1;
  -[SBHIconImageCacheRequest callCompletionHandlersWithResult:]((uint64_t)v6, v22);
  WeakRetained = objc_loadWeakRetained((id *)&self->_iconImageCache);
  objc_msgSend(WeakRetained, "checkIfCachingActivityHasCompleted");
LABEL_30:

}

uint64_t __96__SBHIconImageVariantCache_finishInitialBackgroundCacheWorkForCachingRequest_fetchedDirtyImage___block_invoke(uint64_t a1)
{
  return -[SBHIconImageCacheRequest callCompletionHandlersWithResult:](*(_QWORD *)(a1 + 32), 1);
}

- (void)performBackgroundFileWorkForCachingRequest:(id)a3 fetchedDirtyImage:(id)a4
{
  id *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  SBHIconImageVariantCache *v26;
  id *v27;
  _QWORD block[5];
  id *v29;
  uint8_t buf[4];
  unint64_t v31;
  __int16 v32;
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = (id *)a3;
  v7 = a4;
  +[SBHIconImageCache _workQueue](SBHIconImageCache, "_workQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert();

  if (v6)
  {
    v9 = v6[4];
    v10 = v6[7];
    v11 = (unint64_t)v6[8];
  }
  else
  {
    v10 = 0;
    v9 = 0;
    v11 = 0;
  }
  v12 = -[SBHIconImageVariantCache storedImageGenerationForIcon:imageAppearance:](self, "storedImageGenerationForIcon:imageAppearance:", v9, v10);
  if (v12 && (v13 = v12, v12 > v11))
  {
    SBLogIconImageCache();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v31 = v11;
      v32 = 2048;
      v33 = v13;
      _os_log_impl(&dword_1CFEF3000, v14, OS_LOG_TYPE_DEFAULT, "Stopping file pooling background operation because the image generation (%lu) is already superceded (%lu)", buf, 0x16u);
    }

    if (v6)
      *((_BYTE *)v6 + 20) = 1;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __89__SBHIconImageVariantCache_performBackgroundFileWorkForCachingRequest_fetchedDirtyImage___block_invoke;
    block[3] = &unk_1E8D84EF0;
    block[4] = self;
    v29 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    -[SBHIconImageVariantCache _cacheKeyForIcon:](self, "_cacheKeyForIcon:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconImageVariantCache _variantDescription](self, "_variantDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogIconImageCache();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[SBHIconImageVariantCache performBackgroundFileWorkForCachingRequest:fetchedDirtyImage:].cold.1();

    -[SBHIconImageVariantCache pooledIconImageForMappedIconImage:](self, "pooledIconImageForMappedIconImage:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __89__SBHIconImageVariantCache_performBackgroundFileWorkForCachingRequest_fetchedDirtyImage___block_invoke_323;
    v22[3] = &unk_1E8D84F40;
    v23 = v18;
    v24 = v16;
    v25 = v15;
    v26 = self;
    v27 = v6;
    v19 = v15;
    v20 = v16;
    v21 = v18;
    dispatch_async(MEMORY[0x1E0C80D38], v22);

  }
}

uint64_t __89__SBHIconImageVariantCache_performBackgroundFileWorkForCachingRequest_fetchedDirtyImage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectIdenticalTo:", *(_QWORD *)(a1 + 40));
}

uint64_t __89__SBHIconImageVariantCache_performBackgroundFileWorkForCachingRequest_fetchedDirtyImage___block_invoke_323(uint64_t a1)
{
  NSObject *v3;
  uint64_t v4;

  if (*(_QWORD *)(a1 + 32))
    return objc_msgSend(*(id *)(a1 + 56), "finishFinalBackgroundCacheWorkForCachingRequest:pooledIconImage:", *(_QWORD *)(a1 + 64));
  SBLogIconImageCache();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __89__SBHIconImageVariantCache_performBackgroundFileWorkForCachingRequest_fetchedDirtyImage___block_invoke_323_cold_1(a1, v3, v4);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 24), "removeObjectIdenticalTo:", *(_QWORD *)(a1 + 64));
}

- (void)finishFinalBackgroundCacheWorkForCachingRequest:(id)a3 pooledIconImage:(id)a4
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id WeakRetained;

  v6 = (id *)a3;
  v7 = a4;
  BSDispatchQueueAssertMain();
  if (v6)
  {
    v8 = v6[4];
    v9 = v6[7];
    v10 = v6[8];
  }
  else
  {
    v9 = 0;
    v8 = 0;
    v10 = 0;
  }
  -[SBHIconImageVariantCache _cacheKeyForIcon:](self, "_cacheKeyForIcon:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconImageVariantCache _variantDescription](self, "_variantDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((id)-[SBHIconImageVariantCache storedImageGenerationForIcon:imageAppearance:](self, "storedImageGenerationForIcon:imageAppearance:", v8, v9) == v10)
  {
    SBLogIconImageCache();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[SBHIconImageVariantCache finishFinalBackgroundCacheWorkForCachingRequest:pooledIconImage:].cold.1();

    -[SBHIconImageAppearanceStore setImage:forIcon:appearance:](self->_images, "setImage:forIcon:appearance:", v7, v8, v9);
    WeakRetained = objc_loadWeakRetained((id *)&self->_iconImageCache);
    objc_msgSend(WeakRetained, "finishedAsynchronousLoadOfIcon:imageAppearance:requestStartTimestamp:elapsedTime:", v8, v9, 0, 0.0);

  }
  if (v6)
    *((_BYTE *)v6 + 20) = 1;

}

- (void)performSynchronousCacheRequest:(id)a3
{
  id *v4;
  id *v5;
  id v6;
  id v7;
  void (**v8)(id, uint64_t, _QWORD, double);
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4[4];
    v7 = v5[7];
    v8 = (void (**)(id, uint64_t, _QWORD, double))v5[12];
    v9 = v5[11];
    v10 = v5[8];
  }
  else
  {
    v9 = 0;
    v7 = 0;
    v6 = 0;
    v8 = 0;
    v10 = 0;
  }
  -[SBHIconImageVariantCache _cacheKeyForIcon:](self, "_cacheKeyForIcon:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconImageVariantCache _variantDescription](self, "_variantDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconImageVariantCache _variantImageForIcon:imageAppearance:options:](self, "_variantImageForIcon:imageAppearance:options:", v6, v7, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v20 = v12;
    v14 = v11;
    -[SBHIconImageVariantCache pooledIconImageForMappedIconImage:](self, "pooledIconImageForMappedIconImage:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogIconImageCache();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[SBHIconImageVariantCache performSynchronousCacheRequest:].cold.1();

      -[SBHIconImageAppearanceStore setImage:forIcon:appearance:](self->_images, "setImage:forIcon:appearance:", v15, v6, v7);
      -[SBHIconImageVariantCache setStoredImageGeneration:forIcon:imageAppearance:](self, "setStoredImageGeneration:forIcon:imageAppearance:", v10, v6, v7);
      -[SBHIconImageVariantCache addCachedIcon:](self, "addCachedIcon:", v6);

    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v23 = v20;
        v24 = 2112;
        v25 = v14;
        _os_log_impl(&dword_1CFEF3000, v17, OS_LOG_TYPE_INFO, "Could not pool %{public}@ image for icon in foreground with key: %@", buf, 0x16u);
      }

    }
    v11 = v14;
    v12 = v20;
  }
  else if (objc_msgSend((id)objc_opt_class(), "hasIconImage"))
  {
    SBLogIconImageCache();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v23 = v12;
      v24 = 2112;
      v25 = v11;
      _os_log_impl(&dword_1CFEF3000, v18, OS_LOG_TYPE_INFO, "Could not make %{public}@ image for icon in foreground with key: %@", buf, 0x16u);
    }

    -[SBHIconImageAppearanceStore removeAllImagesForIcon:](self->_images, "removeAllImagesForIcon:", v6);
    -[NSHashTable addObject:](self->_failedIcons, "addObject:", v6);
    v21 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconImageVariantCache removeStoredImageGenerationForIcons:](self, "removeStoredImageGenerationForIcons:", v19);

    -[SBHIconImageVariantCache removeCachedIcon:](self, "removeCachedIcon:", v6);
  }
  if (v8)
    v8[2](v8, 2, 0, 0.0);

}

void __65__SBHIconImageVariantCache_recacheImagesForIcon_completionGroup___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v4;
  id v5;
  void *v6;
  _QWORD *v7;
  _QWORD v8[4];
  id v9;

  v4 = *(NSObject **)(a1 + 32);
  v5 = a3;
  dispatch_group_enter(v4);
  v7 = *(_QWORD **)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__SBHIconImageVariantCache_recacheImagesForIcon_completionGroup___block_invoke_2;
  v8[3] = &unk_1E8D84F68;
  v9 = *(id *)(a1 + 32);
  -[SBHIconImageVariantCache cacheImageForIcon:imageAppearance:priority:reason:options:cancellation:completionHandler:](v7, v6, v5, (void *)1, CFSTR("recacheImagesForIcon"), (void *)4, 0, v8);

}

void __65__SBHIconImageVariantCache_recacheImagesForIcon_completionGroup___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

BOOL __67__SBHIconImageVariantCache_hasCachingRequestsStillDoingInitialWork__block_invoke(uint64_t a1, uint64_t a2)
{
  return !a2 || (*(_BYTE *)(a2 + 19) & 1) == 0;
}

- (unint64_t)currentImageGenerationForIcon:(id)a3
{
  id v4;
  unint64_t v5;

  v4 = a3;
  if (self)
    self = (SBHIconImageVariantCache *)objc_loadWeakRetained((id *)&self->_iconImageCache);
  v5 = -[SBHIconImageVariantCache currentImageGenerationForIcon:](self, "currentImageGenerationForIcon:", v4);

  return v5;
}

- (void)setStoredImageGeneration:(unint64_t)a3 forIcon:(id)a4 imageAppearance:(id)a5
{
  os_unfair_lock_s *p_lock;
  id v9;
  id v10;
  SBHIconImageAppearanceStore *storedImageGenerations;
  void *v12;

  p_lock = &self->_lock;
  v9 = a5;
  v10 = a4;
  os_unfair_lock_lock(p_lock);
  storedImageGenerations = self->_storedImageGenerations;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconImageAppearanceStore setImage:forIcon:appearance:](storedImageGenerations, "setImage:forIcon:appearance:", v12, v10, v9);

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)storedImageGenerationForIcon:(id)a3 imageAppearance:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;
  void *v9;
  unint64_t v10;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_lock);
  -[SBHIconImageAppearanceStore imageForIcon:appearance:](self->_storedImageGenerations, "imageForIcon:appearance:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  return v10;
}

- (void)setFetchedImageGeneration:(unint64_t)a3 forIcon:(id)a4 imageAppearance:(id)a5
{
  os_unfair_lock_s *p_lock;
  id v9;
  id v10;
  SBHIconImageAppearanceStore *fetchedImageGenerations;
  void *v12;

  p_lock = &self->_lock;
  v9 = a5;
  v10 = a4;
  os_unfair_lock_lock(p_lock);
  fetchedImageGenerations = self->_fetchedImageGenerations;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconImageAppearanceStore setImage:forIcon:appearance:](fetchedImageGenerations, "setImage:forIcon:appearance:", v12, v10, v9);

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)fetchedImageGenerationForIcon:(id)a3 imageAppearance:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;
  void *v9;
  unint64_t v10;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_lock);
  -[SBHIconImageAppearanceStore imageForIcon:appearance:](self->_fetchedImageGenerations, "imageForIcon:appearance:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  return v10;
}

- (void)removeStoredImageGenerationForIcon:(id)a3 imageAppearance:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_lock);
  -[SBHIconImageAppearanceStore removeImageForIcon:appearance:](self->_storedImageGenerations, "removeImageForIcon:appearance:", v8, v7);
  -[SBHIconImageAppearanceStore removeImageForIcon:appearance:](self->_fetchedImageGenerations, "removeImageForIcon:appearance:", v8, v7);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeStoredImageGenerationForIcons:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[SBHIconImageAppearanceStore removeAllImagesForIcons:](self->_storedImageGenerations, "removeAllImagesForIcons:", v5);
  -[SBHIconImageAppearanceStore removeAllImagesForIcons:](self->_fetchedImageGenerations, "removeAllImagesForIcons:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeAllStoredImageGenerations
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[SBHIconImageAppearanceStore removeAllImages](self->_storedImageGenerations, "removeAllImages");
  -[SBHIconImageAppearanceStore removeAllImages](self->_fetchedImageGenerations, "removeAllImages");
  os_unfair_lock_unlock(p_lock);
}

- (void)addCachedIcon:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SBHIconImageVariantCache _cacheKeyForIcon:](self, "_cacheKeyForIcon:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_iconsByIconCacheIdentifier, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_iconsByIconCacheIdentifier, "setObject:forKey:", v5, v4);
  }
  objc_msgSend(v5, "addObject:", v6);

}

- (BOOL)hasOtherCachedIconsForIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;

  v4 = a3;
  -[SBHIconImageVariantCache _cacheKeyForIcon:](self, "_cacheKeyForIcon:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_iconsByIconCacheIdentifier, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  v8 = objc_msgSend(v6, "containsObject:", v4);

  return v7 != v8;
}

- (void)removeCachedIcon:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SBHIconImageVariantCache _cacheKeyForIcon:](self, "_cacheKeyForIcon:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_iconsByIconCacheIdentifier, "objectForKey:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)removeAllCachedIcons
{
  -[NSMutableDictionary removeAllObjects](self->_iconsByIconCacheIdentifier, "removeAllObjects");
}

- (BOOL)hasCachedTintableImageForIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[SBHIconImageAppearance tintableAppearance](SBHIconImageAppearance, "tintableAppearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconImageAppearanceStore imageForIcon:appearance:](self->_images, "imageForIcon:appearance:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (unint64_t)iconImageOptions
{
  return !self || !self->_variant;
}

- (unint64_t)imageRetrievalOptions
{
  if (self)
    return 2 * (*(_QWORD *)(self + 72) == 1);
  return self;
}

- (id)_variantImageForIcon:(id)a3 imageAppearance:(id)a4 options:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  double height;
  double width;
  double scale;
  double continuousCornerRadius;
  unint64_t v15;
  double v16;
  double v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "appearanceType") != 2
    || !-[SBHIconImageVariantCache hasCachedTintableImageForIcon:](self, "hasCachedTintableImageForIcon:", v7)
    || (-[SBHIconImageVariantCache _tintedImageFromTintableImageForIcon:imageAppearance:](self, "_tintedImageFromTintableImageForIcon:imageAppearance:", v7, v8), (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "sbh_traitCollectionWithIconImageAppearance:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
    {
      width = self->_iconImageInfo.size.width;
      height = self->_iconImageInfo.size.height;
      scale = self->_iconImageInfo.scale;
      continuousCornerRadius = self->_iconImageInfo.continuousCornerRadius;
    }
    else
    {
      height = 0.0;
      scale = 0.0;
      continuousCornerRadius = 0.0;
      width = 0.0;
    }
    v15 = -[SBHIconImageVariantCache iconImageOptions](self, "iconImageOptions");
    mach_continuous_time();
    objc_msgSend(v7, "iconImageWithInfo:traitCollection:options:", v10, v15, width, height, scale, continuousCornerRadius);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    mach_continuous_time();
    BSTimeDifferenceFromMachTimeToMachTime();
    v17 = v16;
    SBLogIconImageCache();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[SBHIconImageVariantCache _variantImageForIcon:imageAppearance:options:].cold.1(v18, v17, v19, v20);

  }
  return v9;
}

- (id)_tintedImageFromTintableImageForIcon:(id)a3 imageAppearance:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  +[SBHIconImageAppearance tintableAppearance](SBHIconImageAppearance, "tintableAppearance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconImageAppearanceStore imageForIcon:appearance:](self->_images, "imageForIcon:appearance:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "tintColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SBHTintedImageFromTintableImage(v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
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
  -[SBHIconImageVariantCache iconImagesMemoryPool](self, "iconImagesMemoryPool");
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

- (id)memoryMappedIconImageForIconImage:(id)a3
{
  return -[SBHIconImageVariantCache _pooledIconImageForIconImage:allowingOptOut:](self, "_pooledIconImageForIconImage:allowingOptOut:", a3, 0);
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
  -[SBHIconImageVariantCache _iconImageOfSize:scale:failGracefully:drawing:](self, "_iconImageOfSize:scale:failGracefully:drawing:", 1, v9, width, height, a4);
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

- (NSString)description
{
  return (NSString *)-[SBHIconImageVariantCache descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHIconImageVariantCache succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBHIconImageVariantCache descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  double scale;
  id v8;
  id v9;
  id v10;
  NSUInteger v11;
  id v12;
  id v14;
  id v15;
  id v16;

  -[SBHIconImageVariantCache succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconImageVariantCache _variantDescription](self, "_variantDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("variant"));

  if (self)
  {
    scale = self->_iconImageInfo.scale;
    v8 = (id)objc_msgSend(v4, "appendSize:withName:", CFSTR("imageSize"), self->_iconImageInfo.size.width, self->_iconImageInfo.size.height);
    v9 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("imageScale"), scale);
    v10 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[SBHIconImageAppearanceStore numberOfCachedImages](self->_images, "numberOfCachedImages"), CFSTR("cachedImageCount"));
    v11 = -[NSHashTable count](self->_failedIcons, "count");
  }
  else
  {
    v14 = (id)objc_msgSend(v4, "appendSize:withName:", CFSTR("imageSize"), 0.0, 0.0);
    v15 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("imageScale"), 0.0);
    v16 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", 0, CFSTR("cachedImageCount"));
    v11 = 0;
  }
  v12 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", v11, CFSTR("failedIconsCount"));
  return v4;
}

- (void)purgeAllCachedImagesForAppearancesOtherThanAppearances:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CFEF3000, v0, v1, "Purging all cached icon %{public}@ images for appearances other than %@");
  OUTLINED_FUNCTION_3();
}

- (void)cancelAllCachingRequests
{
  OUTLINED_FUNCTION_5(&dword_1CFEF3000, a1, a3, "Canceling all caching requests", a5, a6, a7, a8, 0);
}

- (void)finishInitialBackgroundCacheWorkForCachingRequest:fetchedDirtyImage:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CFEF3000, v0, v1, "Failed to generate %{public}@ image in background for icon with key: %@");
  OUTLINED_FUNCTION_3();
}

- (void)finishInitialBackgroundCacheWorkForCachingRequest:fetchedDirtyImage:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CFEF3000, v0, v1, "Caching %{public}@ image for icon with key: %@");
  OUTLINED_FUNCTION_3();
}

- (void)finishInitialBackgroundCacheWorkForCachingRequest:fetchedDirtyImage:.cold.3()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_1CFEF3000, v0, OS_LOG_TYPE_ERROR, "We think we stored image generation %lu but no image found", v1, 0xCu);
  OUTLINED_FUNCTION_3();
}

- (void)performBackgroundFileWorkForCachingRequest:fetchedDirtyImage:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CFEF3000, v0, v1, "Pooling dirty %{public}@ image in background for icon with key: %@");
  OUTLINED_FUNCTION_3();
}

void __89__SBHIconImageVariantCache_performBackgroundFileWorkForCachingRequest_fetchedDirtyImage___block_invoke_323_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = 138543618;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  OUTLINED_FUNCTION_2(&dword_1CFEF3000, a2, a3, "Failed to pool dirty %{public}@ image in background for icon with key: %@", (uint8_t *)&v5);
  OUTLINED_FUNCTION_3();
}

- (void)finishFinalBackgroundCacheWorkForCachingRequest:pooledIconImage:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CFEF3000, v0, v1, "Caching pooled %{public}@ image for icon with key: %@");
  OUTLINED_FUNCTION_3();
}

- (void)performSynchronousCacheRequest:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CFEF3000, v0, v1, "Caching %{public}@ image for icon in foreground with key: %@");
  OUTLINED_FUNCTION_3();
}

- (void)_variantImageForIcon:(uint64_t)a3 imageAppearance:(uint64_t)a4 options:.cold.1(NSObject *a1, double a2, uint64_t a3, uint64_t a4)
{
  int v4;
  double v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 134217984;
  v5 = a2;
  OUTLINED_FUNCTION_4(&dword_1CFEF3000, a1, a4, "Fetched image from icon in %fs", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3();
}

@end
