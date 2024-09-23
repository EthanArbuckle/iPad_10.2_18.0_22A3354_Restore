@implementation SBUILegibilityCache

- (id)cachedStrengthForImage:(id)a3 strength:(double)a4 generator:(id)a5
{
  id v8;
  void (**v9)(id, id, double);
  void *v10;
  os_unfair_lock_s *p_unfairLock;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, id, double))a5;
  -[SBUILegibilityCache engine](self, "engine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock(&self->_unfairLock);
  -[NSMapTable objectForKey:](self->_strengthForImageLookupMap, "objectForKey:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    SBLogLegibility();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v19 = 138412802;
      v20 = v10;
      v21 = 2112;
      v22 = v8;
      v23 = 2048;
      v24 = a4;
      v16 = "(%@) Skipped drawing strength for image %@ / %f";
LABEL_11:
      _os_log_debug_impl(&dword_1A471F000, v15, OS_LOG_TYPE_DEBUG, v16, (uint8_t *)&v19, 0x20u);
    }
  }
  else
  {
    v9[2](v9, v8, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      if (!v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable setObject:forKey:](self->_strengthForImageLookupMap, "setObject:forKey:", v12, v8);
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v14, v17);

    }
    SBLogLegibility();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v19 = 138412802;
      v20 = v10;
      v21 = 2112;
      v22 = v8;
      v23 = 2048;
      v24 = a4;
      v16 = "(%@) Drawing strength for image %@ / %f";
      goto LABEL_11;
    }
  }

  os_unfair_lock_unlock(p_unfairLock);
  return v14;
}

- (id)templateImageForSettings:(id)a3 matchingSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  os_unfair_lock_s *p_unfairLock;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  double v19;
  double v20;
  double v21;
  uint64_t v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  height = a4.height;
  width = a4.width;
  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock(&self->_unfairLock);
  -[NSMapTable objectForKey:](self->_templateImagesBySizeForSettings, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_sortedTemplateImageKeysBySizeForSettings, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v9, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_36);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMapTable setObject:forKey:](self->_sortedTemplateImageKeysBySizeForSettings, "setObject:forKey:", v10, v7);
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (!v13)
  {

LABEL_22:
    objc_msgSend(v12, "lastObject", (_QWORD)v27);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_23;
  }
  v14 = v13;
  v15 = 0;
  v16 = *(_QWORD *)v28;
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v28 != v16)
        objc_enumerationMutation(v12);
      v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
      objc_msgSend(v18, "CGSizeValue", (_QWORD)v27);
      v21 = vabdd_f64(v19, width);
      if ((vabdd_f64(v20, height) >= 5.0 || v21 >= 5.0) && (v20 < height || v19 < width))
        continue;
      objc_msgSend(v9, "objectForKey:", v18);
      v24 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v24;
    }
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  }
  while (v14);

  if (!v15)
    goto LABEL_22;
LABEL_23:
  os_unfair_lock_unlock(p_unfairLock);

  return v15;
}

- (SBUILegibilityEngine)engine
{
  return (SBUILegibilityEngine *)objc_loadWeakRetained((id *)&self->_engine);
}

- (id)memoryPoolForGraphicsContextType:(int64_t)a3 matchingSize:(CGSize)a4 scale:(double)a5
{
  double height;
  double width;
  os_unfair_lock_s *p_memoryPoolLock;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v17;
  id v18;
  _QWORD v19[5];

  height = a4.height;
  width = a4.width;
  p_memoryPoolLock = &self->_memoryPoolLock;
  os_unfair_lock_lock(&self->_memoryPoolLock);
  v11 = objc_msgSend(MEMORY[0x1E0CEA638], "sbf_bytesNeededForSize:scale:withContextType:", a3, width, height, a5);
  -[NSMutableDictionary allKeys](self->_memoryPoolLock_memoryPoolsBySlotSize, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __75__SBUILegibilityCache_memoryPoolForGraphicsContextType_matchingSize_scale___block_invoke;
  v19[3] = &__block_descriptor_40_e18_B16__0__NSNumber_8l;
  v19[4] = v11;
  objc_msgSend(v12, "bs_firstObjectPassingTest:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[NSMutableDictionary objectForKey:](self->_memoryPoolLock_memoryPoolsBySlotSize, "objectForKey:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_memoryPoolLock_memoryPoolsBySlotSize, "objectForKey:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      v17 = objc_alloc(MEMORY[0x1E0CFA9A0]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LegibilityMemoryPool-%zu"), v11);
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v15 = (void *)objc_msgSend(v17, "initWithLabel:slotLength:", objc_msgSend(v18, "UTF8String"), v11);

      -[NSMutableDictionary setObject:forKey:](self->_memoryPoolLock_memoryPoolsBySlotSize, "setObject:forKey:", v15, v13);
      goto LABEL_5;
    }
  }
  v15 = (void *)v14;
LABEL_5:
  os_unfair_lock_unlock(p_memoryPoolLock);

  return v15;
}

BOOL __75__SBUILegibilityCache_memoryPoolForGraphicsContextType_matchingSize_scale___block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)objc_msgSend(a2, "unsignedIntegerValue") >= *(_QWORD *)(a1 + 32);
}

- (SBUILegibilityCache)initWithEngine:(id)a3
{
  id v5;
  SBUILegibilityCache *v6;
  SBUILegibilityCache *v7;
  uint64_t v8;
  NSMapTable *templateImagesBySizeForSettings;
  uint64_t v10;
  NSHashTable *cachedTemplatedImages;
  uint64_t v12;
  NSMapTable *strengthForImageLookupMap;
  uint64_t v14;
  NSMapTable *sortedTemplateImageKeysBySizeForSettings;
  uint64_t v16;
  NSMutableDictionary *memoryPoolLock_memoryPoolsBySlotSize;
  void *v19;
  objc_super v20;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUILegibilityCache.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("engine"));

  }
  v20.receiver = self;
  v20.super_class = (Class)SBUILegibilityCache;
  v6 = -[SBUILegibilityCache init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_engine, v5);
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    templateImagesBySizeForSettings = v7->_templateImagesBySizeForSettings;
    v7->_templateImagesBySizeForSettings = (NSMapTable *)v8;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v10 = objc_claimAutoreleasedReturnValue();
    cachedTemplatedImages = v7->_cachedTemplatedImages;
    v7->_cachedTemplatedImages = (NSHashTable *)v10;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v12 = objc_claimAutoreleasedReturnValue();
    strengthForImageLookupMap = v7->_strengthForImageLookupMap;
    v7->_strengthForImageLookupMap = (NSMapTable *)v12;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v14 = objc_claimAutoreleasedReturnValue();
    sortedTemplateImageKeysBySizeForSettings = v7->_sortedTemplateImageKeysBySizeForSettings;
    v7->_sortedTemplateImageKeysBySizeForSettings = (NSMapTable *)v14;

    v7->_unfairLock._os_unfair_lock_opaque = 0;
    v7->_memoryPoolLock._os_unfair_lock_opaque = 0;
    v16 = objc_opt_new();
    memoryPoolLock_memoryPoolsBySlotSize = v7->_memoryPoolLock_memoryPoolsBySlotSize;
    v7->_memoryPoolLock_memoryPoolsBySlotSize = (NSMutableDictionary *)v16;

  }
  return v7;
}

- (void)cacheTemplateShadowImage:(id)a3 settings:(id)a4 maxSize:(CGSize)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a3;
  os_unfair_lock_lock(&self->_unfairLock);
  -[NSMapTable objectForKey:](self->_templateImagesBySizeForSettings, "objectForKey:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = (void *)objc_opt_new();
    -[NSMapTable setObject:forKey:](self->_templateImagesBySizeForSettings, "setObject:forKey:", v8, v11);
  }
  v9 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(v7, "size");
  objc_msgSend(v9, "valueWithCGSize:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v10);
  -[NSHashTable addObject:](self->_cachedTemplatedImages, "addObject:", v7);

  -[NSMapTable removeObjectForKey:](self->_sortedTemplateImageKeysBySizeForSettings, "removeObjectForKey:", v11);
  os_unfair_lock_unlock(&self->_unfairLock);

}

- (BOOL)containsTemplateForSettings:(id)a3
{
  os_unfair_lock_s *p_unfairLock;
  id v5;
  void *v6;

  p_unfairLock = &self->_unfairLock;
  v5 = a3;
  os_unfair_lock_lock(p_unfairLock);
  -[NSMapTable objectForKey:](self->_templateImagesBySizeForSettings, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_unfairLock);
  return v6 != 0;
}

- (BOOL)isCachedTemplateImage:(id)a3
{
  SBUILegibilityCache *v3;
  os_unfair_lock_s *p_unfairLock;
  id v5;

  v3 = self;
  p_unfairLock = &self->_unfairLock;
  v5 = a3;
  os_unfair_lock_lock(p_unfairLock);
  LOBYTE(v3) = -[NSHashTable containsObject:](v3->_cachedTemplatedImages, "containsObject:", v5);

  os_unfair_lock_unlock(p_unfairLock);
  return (char)v3;
}

uint64_t __61__SBUILegibilityCache_templateImageForSettings_matchingSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(a2, "CGSizeValue");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "CGSizeValue");
  v10 = v9;
  v12 = v11;

  if (v6 * v8 >= v10 * v12)
    v13 = 0;
  else
    v13 = -1;
  if (v6 * v8 > v10 * v12)
    return 1;
  else
    return v13;
}

- (void)removeAllObjects
{
  os_unfair_lock_s *p_unfairLock;

  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock(&self->_unfairLock);
  -[NSMapTable removeAllObjects](self->_strengthForImageLookupMap, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_templateImagesBySizeForSettings, "removeAllObjects");
  -[NSHashTable removeAllObjects](self->_cachedTemplatedImages, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_sortedTemplateImageKeysBySizeForSettings, "removeAllObjects");
  os_unfair_lock_unlock(p_unfairLock);
  -[SBUILegibilityCache _teardownMemoryPools](self, "_teardownMemoryPools");
}

- (void)_teardownMemoryPools
{
  os_unfair_lock_s *p_memoryPoolLock;

  p_memoryPoolLock = &self->_memoryPoolLock;
  os_unfair_lock_lock(&self->_memoryPoolLock);
  -[NSMutableDictionary removeAllObjects](self->_memoryPoolLock_memoryPoolsBySlotSize, "removeAllObjects");
  os_unfair_lock_unlock(p_memoryPoolLock);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_engine);
  objc_storeStrong((id *)&self->_memoryPoolLock_memoryPoolsBySlotSize, 0);
  objc_storeStrong((id *)&self->_cachedTemplatedImages, 0);
  objc_storeStrong((id *)&self->_strengthForImageLookupMap, 0);
  objc_storeStrong((id *)&self->_sortedTemplateImageKeysBySizeForSettings, 0);
  objc_storeStrong((id *)&self->_templateImagesBySizeForSettings, 0);
}

@end
