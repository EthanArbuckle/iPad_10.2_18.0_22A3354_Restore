@implementation _UIFocusMapSnapshot

- (id)debugQuickLookObject
{
  void *v2;
  void *v3;

  -[_UIFocusMapSnapshot _debugInfo](self, "_debugInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (_UIFocusMapSnapshotDebugInfo)_debugInfo
{
  _UIFocusMapSnapshotDebugInfo *v3;

  objc_getAssociatedObject(self, sel__debugInfo);
  v3 = (_UIFocusMapSnapshotDebugInfo *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = -[_UIFocusMapSnapshotDebugInfo initWithSnapshot:focusMapSearchInfo:]([_UIFocusMapSnapshotDebugInfo alloc], "initWithSnapshot:focusMapSearchInfo:", self, 0);
    objc_setAssociatedObject(self, sel__debugInfo, v3, (void *)1);
  }
  return v3;
}

- (id)_debugInfoWithFocusMapSearchInfo:(id)a3
{
  id v4;
  _UIFocusMapSnapshotDebugInfo *v5;

  v4 = a3;
  v5 = -[_UIFocusMapSnapshotDebugInfo initWithSnapshot:focusMapSearchInfo:]([_UIFocusMapSnapshotDebugInfo alloc], "initWithSnapshot:focusMapSearchInfo:", self, v4);

  return v5;
}

- (_UIFocusMapSnapshot)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusMapSnapshot.m"), 149, CFSTR("-init is not a valid initializer for this class."));

  return 0;
}

- (id)_initWithSnapshotter:(id)a3 mapArea:(id)a4 searchArea:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _UIFocusMapSnapshot *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _UIFocusRegion *focusedRegion;
  void *v19;
  char v20;
  char v21;
  uint64_t v22;
  _UIFocusSearchInfo *searchInfo;
  uint64_t v24;
  _UIFocusMovementInfo *movementInfo;
  uint64_t v26;
  NSHashTable *visitedRegionContainers;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusMapSnapshot.m"), 156, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mapArea"));

    if (v11)
      goto LABEL_4;
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusMapSnapshot.m"), 155, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("snapshotter"));

  if (!v10)
    goto LABEL_16;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusMapSnapshot.m"), 157, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchArea"));

LABEL_4:
  objc_msgSend(v10, "coordinateSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "coordinateSpace");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 != v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusMapSnapshot.m"), 158, CFSTR("The focus map snapshot's map area and search area must be expressed in the same coordinate space."));

  }
  v33.receiver = self;
  v33.super_class = (Class)_UIFocusMapSnapshot;
  v14 = -[_UIFocusMapSnapshot init](&v33, sel_init);
  if (v14)
  {
    objc_msgSend(v9, "focusSystem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v14->_focusSystem, v15);

    objc_msgSend(v9, "rootContainer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v14->_rootContainer, v16);

    objc_msgSend(v9, "focusedRegion");
    v17 = objc_claimAutoreleasedReturnValue();
    focusedRegion = v14->_focusedRegion;
    v14->_focusedRegion = (_UIFocusRegion *)v17;

    objc_msgSend(v9, "regionsContainer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v14->_regionsContainer, v19);

    if (objc_msgSend(v9, "clipToSnapshotRect"))
      v20 = 4;
    else
      v20 = 0;
    *(_BYTE *)&v14->_flags = *(_BYTE *)&v14->_flags & 0xFB | v20;
    if (objc_msgSend(v9, "ignoresRootContainerClippingRect"))
      v21 = 8;
    else
      v21 = 0;
    *(_BYTE *)&v14->_flags = *(_BYTE *)&v14->_flags & 0xF7 | v21;
    objc_msgSend(v9, "searchInfo");
    v22 = objc_claimAutoreleasedReturnValue();
    searchInfo = v14->_searchInfo;
    v14->_searchInfo = (_UIFocusSearchInfo *)v22;

    objc_msgSend(v9, "movementInfo");
    v24 = objc_claimAutoreleasedReturnValue();
    movementInfo = v14->_movementInfo;
    v14->_movementInfo = (_UIFocusMovementInfo *)v24;

    objc_storeStrong((id *)&v14->_mapArea, a4);
    objc_storeStrong((id *)&v14->_searchArea, a5);
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 514);
    v26 = objc_claimAutoreleasedReturnValue();
    visitedRegionContainers = v14->_visitedRegionContainers;
    v14->_visitedRegionContainers = (NSHashTable *)v26;

    -[_UIFocusMapSnapshot _capture](v14, "_capture");
  }

  return v14;
}

- (void)dealloc
{
  __CFDictionary *subregionToRegionMap;
  __CFDictionary *regionToOccludingRegionsMap;
  __CFDictionary *regionToFocusItemCache;
  __CFDictionary *regionFrameCache;
  objc_super v7;

  subregionToRegionMap = self->_subregionToRegionMap;
  if (subregionToRegionMap)
  {
    CFRelease(subregionToRegionMap);
    self->_subregionToRegionMap = 0;
  }
  regionToOccludingRegionsMap = self->_regionToOccludingRegionsMap;
  if (regionToOccludingRegionsMap)
  {
    CFRelease(regionToOccludingRegionsMap);
    self->_regionToOccludingRegionsMap = 0;
  }
  regionToFocusItemCache = self->_regionToFocusItemCache;
  if (regionToFocusItemCache)
  {
    CFRelease(regionToFocusItemCache);
    self->_regionToFocusItemCache = 0;
  }
  regionFrameCache = self->_regionFrameCache;
  if (regionFrameCache)
  {
    CFRelease(regionFrameCache);
    self->_regionFrameCache = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)_UIFocusMapSnapshot;
  -[_UIFocusMapSnapshot dealloc](&v7, sel_dealloc);
}

- (NSArray)regions
{
  NSArray *regions;
  NSHashTable *filteredOriginalRegions;
  NSMutableArray *mutableUnoccludedRegions;
  id WeakRetained;
  NSHashTable *v8;
  _UIFocusMapSnapshot *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  NSArray *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    return (NSArray *)MEMORY[0x1E0C9AA60];
  regions = self->_regions;
  if (!regions)
  {
    mutableUnoccludedRegions = self->_mutableUnoccludedRegions;
    filteredOriginalRegions = self->_filteredOriginalRegions;
    WeakRetained = objc_loadWeakRetained((id *)&self->_regionsContainer);
    v8 = filteredOriginalRegions;
    v9 = self;
    +[_UIFocusRegionEvaluator regionsByEvaluatingOcclusionsForRegions:inSnapshot:](_UIFocusRegionEvaluator, "regionsByEvaluatingOcclusionsForRegions:inSnapshot:", mutableUnoccludedRegions, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (WeakRetained)
    {
      v22 = WeakRetained;
      v12 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v21 = v11;
      v13 = v11;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v24 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
            -[_UIFocusMapSnapshot originalRegionForRegion:](v9, "originalRegionForRegion:", v18, v21);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[NSHashTable containsObject:](v8, "containsObject:", v19))
              -[NSArray addObject:](v12, "addObject:", v18);

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v15);
      }

      v11 = v21;
      WeakRetained = v22;
    }
    else
    {
      v12 = v10;
    }

    v20 = self->_regions;
    self->_regions = v12;

    regions = self->_regions;
  }
  return regions;
}

- (NSArray)originalRegions
{
  void *v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    return (NSArray *)MEMORY[0x1E0C9AA60];
  -[_UIFocusMapSnapshot regionsContainer](self, "regionsContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NSHashTable allObjects](self->_filteredOriginalRegions, "allObjects");
    return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 512);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = self->_mutableUnoccludedRegions;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          -[_UIFocusMapSnapshot originalRegionForRegion:](self, "originalRegionForRegion:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    objc_msgSend(v5, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSArray *)v12;
  }
}

- (id)regionsForOriginalRegion:(id)a3
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  id v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusMapSnapshot.m"), 257, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("originalRegion"));

  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[_UIFocusMapSnapshot regions](self, "regions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[_UIFocusMapSnapshot originalRegionForRegion:](self, "originalRegionForRegion:", v12);
        v13 = (id)objc_claimAutoreleasedReturnValue();

        if (v13 == v5)
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  v14 = (void *)objc_msgSend(v6, "copy");
  return v14;
}

- (void)_trackSubregion:(id)a3 forRegion:(id)a4
{
  id v7;
  const void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id key;

  key = a3;
  v7 = a4;
  v8 = key;
  v9 = v7;
  if (key)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusMapSnapshot.m"), 275, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("subregion"));

    v8 = 0;
    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusMapSnapshot.m"), 276, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("originalRegion"));

  v8 = key;
LABEL_3:
  if (v8 == v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusMapSnapshot.m"), 277, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("subregion != originalRegion"));

    v8 = key;
  }
  CFDictionarySetValue(self->_subregionToRegionMap, v8, v9);

}

- (id)originalRegionForRegion:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusMapSnapshot.m"), 284, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("region"));

  }
  v6 = v5;
  CFDictionaryGetValue(self->_subregionToRegionMap, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (v7)
  {
    v9 = v6;
    do
    {
      v8 = v7;

      CFDictionaryGetValue(self->_subregionToRegionMap, v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v8;
    }
    while (v7);
  }

  return v8;
}

- (void)_trackOccludingRegion:(id)a3 forRegion:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_UIFocusMapSnapshot originalRegionForRegion:](self, "originalRegionForRegion:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CFDictionaryGetValue(self->_regionToOccludingRegionsMap, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, "addObject:", v9);
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v9, 0);
    CFDictionarySetValue(self->_regionToOccludingRegionsMap, v6, v8);
  }

}

- (id)occludingRegionsForRegion:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusMapSnapshot.m"), 310, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("region"));

  }
  -[_UIFocusMapSnapshot originalRegionForRegion:](self, "originalRegionForRegion:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CFDictionaryGetValue(self->_regionToOccludingRegionsMap, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = (void *)objc_msgSend(v7, "copy");
  else
    v9 = (void *)MEMORY[0x1E0C9AA60];

  return v9;
}

- (void)consumeRegionInformationForRegions:(id)a3 fromSnapshot:(id)a4
{
  CFDictionaryRef *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v7 = (CFDictionaryRef *)a4;
  -[CFDictionaryRef coordinateSpace](v7, "coordinateSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusMapSnapshot coordinateSpace](self, "coordinateSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 != v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusMapSnapshot.m"), 320, CFSTR("Unable to consume regions from a snapshot with a different coordinate system."));

  }
  v10 = (void *)objc_msgSend(v16, "mutableCopy");
  if (objc_msgSend(v10, "count"))
  {
    v11 = 0;
    do
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      CFDictionaryGetValue(v7[3], v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        CFDictionarySetValue(self->_subregionToRegionMap, v12, v13);
        objc_msgSend(v10, "addObject:", v13);
      }
      CFDictionaryGetValue(v7[4], v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        CFDictionarySetValue(self->_regionToOccludingRegionsMap, v12, v14);

      ++v11;
    }
    while (v11 < objc_msgSend(v10, "count"));
  }

}

- (id)_cachedNextFocusedItemForRegion:(id)a3 withFocusMovementRequest:(id)a4 inMap:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  os_signpost_id_t v16;
  os_signpost_id_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p_%p_%p"), v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CFDictionaryGetValue(self->_regionToFocusItemCache, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    v14 = _cachedNextFocusedItemForRegion_withFocusMovementRequest_inMap____s_category;
    if (!_cachedNextFocusedItemForRegion_withFocusMovementRequest_inMap____s_category)
    {
      v14 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v14, (unint64_t *)&_cachedNextFocusedItemForRegion_withFocusMovementRequest_inMap____s_category);
    }
    v15 = *(id *)(v14 + 8);
    v16 = os_signpost_id_make_with_pointer(*(os_log_t *)(v14 + 8), self);
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v17 = v16;
      if (os_signpost_enabled(v15))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_185066000, v15, OS_SIGNPOST_EVENT, v17, "FocusRegionCacheHit", "Found cached focus region.", buf, 2u);
      }
    }

  }
  else
  {
    objc_msgSend(v8, "_nextFocusedItemForFocusMovementRequest:inMap:withSnapshot:", v9, v10, self);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = v18;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v20;

    CFDictionarySetValue(self->_regionToFocusItemCache, v11, v13);
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 == v21)
    v22 = 0;
  else
    v22 = v13;
  v23 = v22;

  return v23;
}

- (CGRect)snapshotFrameForRegion:(id)a3
{
  id v5;
  double *Value;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  CGRect result;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusMapSnapshot.m"), 358, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("region"));

  }
  Value = (double *)CFDictionaryGetValue(self->_regionFrameCache, v5);
  if (Value)
  {
    v7 = *Value;
    v8 = Value[1];
    v9 = Value[2];
    v10 = Value[3];
  }
  else
  {
    -[_UIFocusMapSnapshot coordinateSpace](self, "coordinateSpace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIFocusRegionEvaluator frameForRegion:inCoordinateSpace:](_UIFocusRegionEvaluator, "frameForRegion:inCoordinateSpace:", v5, v11);
    v7 = v12;
    v8 = v13;
    v9 = v14;
    v10 = v15;

    v16 = (double *)malloc_type_malloc(0x20uLL, 0x1000040E0EAB150uLL);
    *v16 = v7;
    v16[1] = v8;
    v16[2] = v9;
    v16[3] = v10;
    CFDictionarySetValue(self->_regionFrameCache, v5, v16);
  }

  v17 = v7;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)markContainerAsProvidingDynamicContent
{
  NSHashTable *uncachableEnvironments;
  void *v3;
  id v4;

  uncachableEnvironments = self->_uncachableEnvironments;
  -[NSMutableArray lastObject](self->_stateStack, "lastObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "regionContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHashTable addObject:](uncachableEnvironments, "addObject:", v3);

}

- (BOOL)hasOnlyStaticContent
{
  NSUInteger v3;
  _BYTE *v4;
  unint64_t v6;
  NSObject *v7;
  NSHashTable *uncachableEnvironments;
  int v9;
  NSHashTable *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = -[NSHashTable count](self->_uncachableEnvironments, "count");
  v4 = (_BYTE *)_MergedGlobals_1039;
  if (!_MergedGlobals_1039)
  {
    v4 = (_BYTE *)(__UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16);
    atomic_store((unint64_t)v4, (unint64_t *)&_MergedGlobals_1039);
  }
  if ((*v4 & 1) != 0 && v3 && !_AXSFullKeyboardAccessEnabled())
  {
    v6 = qword_1ECD7D9F8;
    if (!qword_1ECD7D9F8)
    {
      v6 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&qword_1ECD7D9F8);
    }
    if ((*(_BYTE *)v6 & 1) != 0)
    {
      v7 = *(NSObject **)(v6 + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uncachableEnvironments = self->_uncachableEnvironments;
        v9 = 138412290;
        v10 = uncachableEnvironments;
        _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Found uncachable environments during linear focus lookup: %@", (uint8_t *)&v9, 0xCu);
      }
    }
  }
  return v3 == 0;
}

- (void)_capture
{
  NSArray *regions;
  NSMutableArray *v5;
  NSMutableArray *mutableUnoccludedRegions;
  NSHashTable *v7;
  NSHashTable *filteredOriginalRegions;
  const __CFAllocator *v9;
  NSMutableArray *v10;
  NSMutableArray *stateStack;
  NSHashTable *v12;
  NSHashTable *eligibleEnvironments;
  NSHashTable *v14;
  NSHashTable *ineligibleEnvironments;
  NSHashTable *v16;
  NSHashTable *uncachableEnvironments;
  id WeakRetained;
  void *v19;

  *(_BYTE *)&self->_flags &= ~1u;
  regions = self->_regions;
  self->_regions = 0;

  v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  mutableUnoccludedRegions = self->_mutableUnoccludedRegions;
  self->_mutableUnoccludedRegions = v5;

  objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 512);
  v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
  filteredOriginalRegions = self->_filteredOriginalRegions;
  self->_filteredOriginalRegions = v7;

  if (*(_OWORD *)&self->_subregionToRegionMap != 0 || self->_regionToFocusItemCache || self->_regionFrameCache)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusMapSnapshot.m"), 399, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_subregionToRegionMap == NULL && _regionToOccludingRegionsMap == NULL && _regionToFocusItemCache == NULL && _regionFrameCache == NULL"));

  }
  v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  self->_subregionToRegionMap = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &pointerKeyCallbacks, &pointerValueCallbacks);
  self->_regionToOccludingRegionsMap = CFDictionaryCreateMutable(v9, 0, &pointerKeyCallbacks, &equalValueCallbacks);
  self->_regionToFocusItemCache = CFDictionaryCreateMutable(v9, 0, &equalKeyCallbacks, &pointerValueCallbacks);
  self->_regionFrameCache = CFDictionaryCreateMutable(v9, 0, &pointerKeyCallbacks, &rectValueCallbacks);
  v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  stateStack = self->_stateStack;
  self->_stateStack = v10;

  objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
  v12 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
  eligibleEnvironments = self->_eligibleEnvironments;
  self->_eligibleEnvironments = v12;

  objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
  v14 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
  ineligibleEnvironments = self->_ineligibleEnvironments;
  self->_ineligibleEnvironments = v14;

  objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
  v16 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
  uncachableEnvironments = self->_uncachableEnvironments;
  self->_uncachableEnvironments = v16;

  *(_BYTE *)&self->_flags &= ~2u;
  WeakRetained = objc_loadWeakRetained((id *)&self->_rootContainer);
  -[_UIFocusMapSnapshot addRegionsInContainer:](self, "addRegionsInContainer:", WeakRetained);

  *(_BYTE *)&self->_flags |= 1u;
}

- (UICoordinateSpace)coordinateSpace
{
  void *v2;
  void *v3;

  -[_UIFocusMapSnapshot _searchArea](self, "_searchArea");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coordinateSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UICoordinateSpace *)v3;
}

- (void)addRegion:(id)a3
{
  void *v5;
  id v6;
  id WeakRetained;
  void *v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v13;
  id regions;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  int v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  v38 = a3;
  if (!v38)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusMapSnapshot.m"), 431, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("region"));

  }
  -[NSMutableArray lastObject](self->_stateStack, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "regionContainerFocusSystem");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
  if (v6 == WeakRetained)
  {
    -[_UIFocusMapSnapshot mapArea](self, "mapArea");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFocusMapSnapshot snapshotFrameForRegion:](self, "snapshotFrameForRegion:", v38);
    x = v40.origin.x;
    y = v40.origin.y;
    width = v40.size.width;
    height = v40.size.height;
    if (fabs(CGRectGetWidth(v40)) < 0.0001)
      goto LABEL_31;
    v41.origin.x = x;
    v41.origin.y = y;
    v41.size.width = width;
    v41.size.height = height;
    if (fabs(CGRectGetHeight(v41)) < 0.0001)
      goto LABEL_31;
    v13 = v38;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
    {
      if (!objc_msgSend(v8, "intersectsRegion:inSnapshot:", v38, self))
      {
LABEL_31:

        goto LABEL_32;
      }
      if ((*(_BYTE *)&self->_flags & 4) != 0 && objc_msgSend(v38, "_shouldCropRegionToSearchArea"))
      {
        objc_msgSend(v8, "intersectionWithRegion:inSnapshot:", v38, self);
        regions = (id)objc_claimAutoreleasedReturnValue();
        v15 = v38;
        if (regions != v38)
        {
          if (regions)
          {
            -[_UIFocusMapSnapshot snapshotFrameForRegion:](self, "snapshotFrameForRegion:", regions);
            v15 = v38;
            x = v16;
            y = v17;
            width = v18;
            height = v19;
          }
          else
          {
            x = *MEMORY[0x1E0C9D628];
            y = *(double *)(MEMORY[0x1E0C9D628] + 8);
            width = *(double *)(MEMORY[0x1E0C9D628] + 16);
            height = *(double *)(MEMORY[0x1E0C9D628] + 24);
          }
        }

      }
      else
      {
        regions = v38;
      }
    }
    else
    {
      regions = v38;
    }
    if (regions)
    {
      if ((objc_msgSend(regions, "_isUnclippable", v13) & 1) != 0)
        goto LABEL_22;
      objc_msgSend(v6, "behavior");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "supportsClipToBounds");

      if (!v21)
        goto LABEL_22;
      -[NSMutableArray lastObject](self->_stateStack, "lastObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "clippingRect");
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v30 = v29;

      v42.origin.x = v24;
      v42.origin.y = v26;
      v42.size.width = v28;
      v42.size.height = v30;
      if (CGRectIsNull(v42))
        goto LABEL_22;
      v43.origin.x = x;
      v43.origin.y = y;
      v43.size.width = width;
      v43.size.height = height;
      v46.origin.x = v24;
      v46.origin.y = v26;
      v46.size.width = v28;
      v46.size.height = v30;
      v44 = CGRectIntersection(v43, v46);
      v31 = v44.origin.x;
      v32 = v44.origin.y;
      v33 = v44.size.width;
      v34 = v44.size.height;
      v47.origin.x = x;
      v47.origin.y = y;
      v47.size.width = width;
      v47.size.height = height;
      if (CGRectEqualToRect(v44, v47))
      {
LABEL_22:
        v35 = regions;
        goto LABEL_23;
      }
      v45.origin.x = v31;
      v45.origin.y = v32;
      v45.size.width = v33;
      v45.size.height = v34;
      if (CGRectIsEmpty(v45))
      {
        v38 = 0;
LABEL_26:

        goto LABEL_31;
      }
      +[_UIFocusRegionEvaluator subregionFromRegion:withSnapshotFrame:inSnapshot:](_UIFocusRegionEvaluator, "subregionFromRegion:withSnapshotFrame:inSnapshot:", regions, self, v31, v32, v33, v34);
      v39 = (id)objc_claimAutoreleasedReturnValue();

      v35 = v39;
      if (v39)
      {
LABEL_23:
        v38 = v35;
        -[NSMutableArray addObject:](self->_mutableUnoccludedRegions, "addObject:");
        if ((*(_BYTE *)&self->_flags & 2) != 0)
        {
          -[_UIFocusMapSnapshot originalRegionForRegion:](self, "originalRegionForRegion:", v38);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSHashTable addObject:](self->_filteredOriginalRegions, "addObject:", v36);

        }
        regions = self->_regions;
        self->_regions = 0;
        goto LABEL_26;
      }
    }
    v38 = 0;
    goto LABEL_31;
  }
LABEL_32:

}

- (void)addRegions:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusMapSnapshot.m"), 482, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("regions"));

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[_UIFocusMapSnapshot addRegion:](self, "addRegion:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)addRegionsInContainer:(id)a3
{
  id v5;
  NSUInteger v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  NSHashTable *eligibleEnvironments;
  NSHashTable *ineligibleEnvironments;
  NSMutableArray *stateStack;
  NSHashTable *v17;
  NSHashTable *v18;
  NSMutableArray *v19;
  NSHashTable *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSHashTable *v24;
  id v25;
  const char *v26;
  void *v27;
  _BYTE *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id WeakRetained;
  BOOL v35;
  double v36;
  double v37;
  double v38;
  double v39;
  id v40;
  NSMutableArray *v41;
  void *v42;
  NSMutableArray *v43;
  id v44;
  id v45;
  char v46;
  double height;
  double width;
  double y;
  double x;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  int IsScrollableContainer;
  id v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  double v72;
  CGFloat v73;
  double v74;
  CGFloat v75;
  double v76;
  CGFloat v77;
  double v78;
  CGFloat v79;
  double v80;
  double MaxY;
  double v82;
  double MaxX;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  void *v95;
  double v96;
  CGFloat v97;
  double v98;
  CGFloat v99;
  double v100;
  CGFloat v101;
  double v102;
  CGFloat v103;
  void *v104;
  double v105;
  double v106;
  double v107;
  double v108;
  void *v109;
  double v110;
  CGFloat v111;
  double v112;
  CGFloat v113;
  double v114;
  CGFloat v115;
  double v116;
  CGFloat v117;
  void *v118;
  BOOL IsNull;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  NSObject *v129;
  unint64_t v130;
  double MinX;
  double v132;
  double MinY;
  CGFloat v134;
  CGFloat v135;
  CGFloat v136;
  CGFloat v137;
  id v138;
  int v139;
  NSHashTable *v140;
  void *v141;
  id v142;
  _UIFocusMapSnapshot *v143;
  _QWORD block[4];
  id v145;
  _QWORD v146[3];
  char v147;
  uint64_t v148;
  uint64_t *v149;
  uint64_t v150;
  char v151;
  uint64_t v152;
  uint64_t *v153;
  uint64_t v154;
  uint64_t (*v155)(uint64_t, uint64_t);
  void (*v156)(uint64_t);
  id v157;
  uint64_t v158;
  uint64_t *v159;
  uint64_t v160;
  char IsEligibleForFocusOcclusion;
  __int128 buf;
  void (*v163)(uint64_t, void *, _BYTE *);
  void *v164;
  id v165;
  id v166;
  NSHashTable *v167;
  NSHashTable *v168;
  uint64_t *v169;
  uint64_t *v170;
  _QWORD *v171;
  uint64_t *v172;
  uint64_t v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;
  CGRect v179;
  CGRect v180;
  CGRect v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;
  CGRect v187;
  CGRect v188;
  CGRect v189;
  CGRect v190;
  CGRect v191;
  CGRect v192;
  CGRect v193;
  CGRect v194;
  CGRect v195;
  CGRect v196;
  CGRect v197;
  CGRect v198;

  v173 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v143 = self;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusMapSnapshot.m"), 490, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("container"));

  }
  v6 = -[NSHashTable count](self->_visitedRegionContainers, "count");
  v7 = v5;
  v8 = v7;
  if (objc_msgSend(v7, "_ui_isUIFocusRegionContainerProxy"))
  {
    objc_msgSend(v7, "owningEnvironment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[NSHashTable addObject:](self->_visitedRegionContainers, "addObject:", v8);
  if (v6 != -[NSHashTable count](self->_visitedRegionContainers, "count"))
  {
    eligibleEnvironments = self->_eligibleEnvironments;
    ineligibleEnvironments = self->_ineligibleEnvironments;
    stateStack = self->_stateStack;
    v142 = v7;
    v17 = eligibleEnvironments;
    v18 = ineligibleEnvironments;
    v19 = stateStack;
    if (v5)
    {
      if (v17)
        goto LABEL_15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UIFocusSystem *__UIFocusMapRecurseSearchForFocusSystemInEligibleContainer(__strong id<_UIFocusRegionContainer>, NSHashTable<id<UIFocusEnvironment>> *__strong, NSHashTable<id<UIFocusEnvironment>> *__strong, NSArray<_UIFocusRegionSearchContextState *> *__strong)");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "handleFailureInFunction:file:lineNumber:description:", v124, CFSTR("_UIFocusMapSnapshot.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("container"));

      if (v17)
      {
LABEL_15:
        if (v18)
          goto LABEL_16;
LABEL_91:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UIFocusSystem *__UIFocusMapRecurseSearchForFocusSystemInEligibleContainer(__strong id<_UIFocusRegionContainer>, NSHashTable<id<UIFocusEnvironment>> *__strong, NSHashTable<id<UIFocusEnvironment>> *__strong, NSArray<_UIFocusRegionSearchContextState *> *__strong)");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v127, "handleFailureInFunction:file:lineNumber:description:", v128, CFSTR("_UIFocusMapSnapshot.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ineligibleEnvironments"));

LABEL_16:
        v158 = 0;
        v159 = &v158;
        v160 = 0x2020000000;
        IsEligibleForFocusOcclusion = 0;
        IsEligibleForFocusOcclusion = _UIFocusEnvironmentIsEligibleForFocusOcclusion(v142, 0);
        if (*((_BYTE *)v159 + 24))
          v20 = v17;
        else
          v20 = v18;
        -[NSHashTable addObject:](v20, "addObject:", v142);
        if (!*((_BYTE *)v159 + 24))
        {
          v11 = 0;
          goto LABEL_37;
        }
        -[NSMutableArray lastObject](v19, "lastObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "regionContainer");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v140 = v18;
        if (objc_msgSend(v22, "_ui_isUIFocusRegionContainerProxy"))
        {
          objc_msgSend(v22, "owningEnvironment");
          v23 = objc_claimAutoreleasedReturnValue();

          v24 = v17;
          v25 = v7;
          v26 = a2;
          v27 = v8;
          v22 = (void *)v23;
        }
        else
        {
          v24 = v17;
          v25 = v7;
          v26 = a2;
          v27 = v8;
        }
        v152 = 0;
        v153 = &v152;
        v154 = 0x3032000000;
        v155 = __Block_byref_object_copy__88;
        v156 = __Block_byref_object_dispose__88;
        v157 = 0;
        v148 = 0;
        v149 = &v148;
        v150 = 0x2020000000;
        v151 = 0;
        v146[0] = 0;
        v146[1] = v146;
        v146[2] = 0x2020000000;
        v147 = 1;
        *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
        *((_QWORD *)&buf + 1) = 3221225472;
        v163 = ____UIFocusMapRecurseSearchForFocusSystemInEligibleContainer_block_invoke;
        v164 = &unk_1E16C6A30;
        v169 = &v152;
        v31 = v142;
        v165 = v31;
        v32 = v22;
        v166 = v32;
        v170 = &v148;
        v171 = v146;
        v167 = v24;
        v168 = v140;
        v172 = &v158;
        _UIFocusEnvironmentEnumerateAncestorEnvironments(v31, &buf);
        v8 = v27;
        a2 = v26;
        v7 = v25;
        if (*((_BYTE *)v159 + 24))
        {
          if (*((_BYTE *)v149 + 24))
          {
            -[NSMutableArray lastObject](v19, "lastObject");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "regionContainerFocusSystem");
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            v17 = v24;
            v18 = v140;
LABEL_36:

            _Block_object_dispose(v146, 8);
            _Block_object_dispose(&v148, 8);
            _Block_object_dispose(&v152, 8);

LABEL_37:
            _Block_object_dispose(&v158, 8);

            if (!v11)
              goto LABEL_88;
            -[_UIFocusMapSnapshot regionsContainer](v143, "regionsContainer");
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            v139 = objc_msgSend(v142, "isEqual:", v141);
            if (v139 && (*(_BYTE *)&v143->_flags & 2) == 0)
              *(_BYTE *)&v143->_flags |= 2u;
            WeakRetained = objc_loadWeakRetained((id *)&v143->_rootContainer);
            if ((objc_msgSend(v142, "isEqual:", WeakRetained) & 1) != 0)
            {
              v35 = (*(_BYTE *)&v143->_flags & 8) == 0;

              if (!v35)
              {
                v36 = *MEMORY[0x1E0C9D628];
                v37 = *(double *)(MEMORY[0x1E0C9D628] + 8);
                v38 = *(double *)(MEMORY[0x1E0C9D628] + 16);
                v39 = *(double *)(MEMORY[0x1E0C9D628] + 24);
LABEL_80:
                v194.origin.x = v36;
                v194.origin.y = v37;
                v194.size.width = v38;
                v194.size.height = v39;
                if (CGRectIsNull(v194))
                {
                  if (-[NSMutableArray count](v143->_stateStack, "count"))
                  {
                    -[NSMutableArray lastObject](v143->_stateStack, "lastObject");
                    v118 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v118, "clippingRect");
                    IsNull = CGRectIsNull(v195);

                    if (!IsNull)
                    {
                      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                      v120 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v120, "handleFailureInMethod:object:file:lineNumber:description:", a2, v143, CFSTR("_UIFocusMapSnapshot.m"), 534, CFSTR("Encountered a NULL clipping rect, which is invalid when previous containers are clipping."));

                    }
                  }
                }
                +[_UIFocusRegionSearchContextState stateWithRegionContainer:focusSystem:clippingRect:](_UIFocusRegionSearchContextState, "stateWithRegionContainer:focusSystem:clippingRect:", v142, v11, v36, v37, v38, v39);
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableArray addObject:](v143->_stateStack, "addObject:", v121);
                objc_msgSend(v142, "_searchForFocusRegionsInContext:", v143);
                -[NSMutableArray removeLastObject](v143->_stateStack, "removeLastObject");
                if (v139 && (*(_BYTE *)&v143->_flags & 2) != 0)
                  *(_BYTE *)&v143->_flags &= ~2u;

                goto LABEL_88;
              }
            }
            else
            {

            }
            v40 = objc_loadWeakRetained((id *)&v143->_focusSystem);
            v41 = v143->_stateStack;
            -[_UIFocusMapSnapshot coordinateSpace](v143, "coordinateSpace");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v138 = v40;
            v43 = v41;
            v44 = v142;
            v45 = v42;
            v46 = objc_opt_respondsToSelector();
            v36 = *MEMORY[0x1E0C9D628];
            v37 = *(double *)(MEMORY[0x1E0C9D628] + 8);
            v38 = *(double *)(MEMORY[0x1E0C9D628] + 16);
            v39 = *(double *)(MEMORY[0x1E0C9D628] + 24);
            height = v39;
            width = v38;
            y = v37;
            x = *MEMORY[0x1E0C9D628];
            if ((v46 & 1) != 0)
            {
              objc_msgSend(v44, "_clippingRectInCoordinateSpace:", v45);
              x = v51;
              y = v52;
              width = v53;
              height = v54;
            }
            v174.origin.x = x;
            v174.origin.y = y;
            v174.size.width = width;
            v174.size.height = height;
            if (!CGRectIsNull(v174) || -[NSMutableArray count](v43, "count"))
            {
              objc_msgSend(v44, "focusItemContainer");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              IsScrollableContainer = _UIFocusItemContainerIsScrollableContainer(v55);
              buf = *MEMORY[0x1E0C9D538];
              if (IsScrollableContainer
                && objc_msgSend(v138, "_isScrollingScrollableContainer:targetContentOffset:", v55, &buf))
              {
                v57 = v55;
                objc_msgSend(v57, "contentOffset");
                v59 = v58;
                v61 = v60;
                objc_msgSend(v57, "visibleSize");
                v63 = v62;
                v65 = v64;
                objc_msgSend(v57, "coordinateSpace");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "convertRect:toCoordinateSpace:", v45, v59, v61, v63, v65);
                v136 = v68;
                v137 = v67;
                v134 = v70;
                v135 = v69;

                v175.origin.x = x;
                v175.origin.y = y;
                v175.size.width = width;
                v175.size.height = height;
                if (CGRectIsNull(v175))
                {
                  x = v137;
                  y = v136;
                  width = v135;
                  height = v134;
                }
                if (-[NSMutableArray count](v43, "count"))
                {
                  -[NSMutableArray lastObject](v43, "lastObject");
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v71, "clippingRect");
                  v73 = v72;
                  v75 = v74;
                  v77 = v76;
                  v79 = v78;

                  v176.origin.x = v73;
                  v176.origin.y = v75;
                  v176.size.width = v77;
                  v176.size.height = v79;
                  if (!CGRectIsNull(v176))
                  {
                    v177.origin.x = x;
                    v177.origin.y = y;
                    v177.size.width = width;
                    v177.size.height = height;
                    v196.origin.x = v73;
                    v196.origin.y = v75;
                    v196.size.width = v77;
                    v196.size.height = v79;
                    v178 = CGRectIntersection(v177, v196);
                    x = v178.origin.x;
                    y = v178.origin.y;
                    width = v178.size.width;
                    height = v178.size.height;
                  }
                }
                v179.origin.x = x;
                v179.origin.y = y;
                v179.size.width = width;
                v179.size.height = height;
                MinY = CGRectGetMinY(v179);
                v180.origin.y = v136;
                v180.origin.x = v137;
                v180.size.height = v134;
                v180.size.width = v135;
                v132 = CGRectGetMinY(v180);
                v181.origin.x = x;
                v181.origin.y = y;
                v181.size.width = width;
                v181.size.height = height;
                MinX = CGRectGetMinX(v181);
                v182.origin.y = v136;
                v182.origin.x = v137;
                v182.size.height = v134;
                v182.size.width = v135;
                v80 = CGRectGetMinX(v182);
                v183.origin.y = v136;
                v183.origin.x = v137;
                v183.size.height = v134;
                v183.size.width = v135;
                MaxY = CGRectGetMaxY(v183);
                v184.origin.x = x;
                v184.origin.y = y;
                v184.size.width = width;
                v184.size.height = height;
                v82 = CGRectGetMaxY(v184);
                v185.origin.y = v136;
                v185.origin.x = v137;
                v185.size.height = v134;
                v185.size.width = v135;
                MaxX = CGRectGetMaxX(v185);
                v186.origin.x = x;
                v186.origin.y = y;
                v186.size.width = width;
                v186.size.height = height;
                v84 = MaxX - CGRectGetMaxX(v186);
                if (MinY - v132 >= 0.0)
                  v85 = MinY - v132;
                else
                  v85 = 0.0;
                if (MinX - v80 >= 0.0)
                  v86 = MinX - v80;
                else
                  v86 = 0.0;
                if (MaxY - v82 >= 0.0)
                  v87 = MaxY - v82;
                else
                  v87 = 0.0;
                if (v84 >= 0.0)
                  v88 = v84;
                else
                  v88 = 0.0;
                v90 = *((double *)&buf + 1);
                v89 = *(double *)&buf;
                objc_msgSend(v57, "visibleSize");
                v92 = v91;
                v94 = v93;
                objc_msgSend(v57, "coordinateSpace");
                v95 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v95, "convertRect:toCoordinateSpace:", v45, v89, v90, v92, v94);
                v97 = v96;
                v99 = v98;
                v101 = v100;
                v103 = v102;

                v187.origin.y = v136;
                v187.origin.x = v137;
                v187.size.height = v134;
                v187.size.width = v135;
                v197.origin.x = v97;
                v197.origin.y = v99;
                v197.size.width = v101;
                v197.size.height = v103;
                v188 = CGRectUnion(v187, v197);
                v36 = v86 + v188.origin.x;
                v37 = v85 + v188.origin.y;
                v38 = v188.size.width - (v86 + v88);
                v39 = v188.size.height - (v85 + v87);
                v188.origin.x = v86 + v188.origin.x;
                v188.origin.y = v85 + v188.origin.y;
                v188.size.width = v38;
                v188.size.height = v39;
                if (CGRectIsNull(v188))
                {
                  v36 = *MEMORY[0x1E0C9D648];
                  v37 = *(double *)(MEMORY[0x1E0C9D648] + 8);
                  v38 = *(double *)(MEMORY[0x1E0C9D648] + 16);
                  v39 = *(double *)(MEMORY[0x1E0C9D648] + 24);
                }

              }
              else
              {
                v189.origin.x = x;
                v189.origin.y = y;
                v189.size.width = width;
                v189.size.height = height;
                if (CGRectIsNull(v189))
                {
                  -[NSMutableArray lastObject](v43, "lastObject");
                  v104 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v104, "clippingRect");
                  v36 = v105;
                  v37 = v106;
                  v38 = v107;
                  v39 = v108;

                }
                else
                {
                  if (-[NSMutableArray count](v43, "count"))
                  {
                    -[NSMutableArray lastObject](v43, "lastObject");
                    v109 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v109, "clippingRect");
                    v111 = v110;
                    v113 = v112;
                    v115 = v114;
                    v117 = v116;

                    v190.origin.x = v111;
                    v190.origin.y = v113;
                    v190.size.width = v115;
                    v190.size.height = v117;
                    if (!CGRectIsNull(v190))
                    {
                      v191.origin.x = x;
                      v191.origin.y = y;
                      v191.size.width = width;
                      v191.size.height = height;
                      v198.origin.x = v111;
                      v198.origin.y = v113;
                      v198.size.width = v115;
                      v198.size.height = v117;
                      v192 = CGRectIntersection(v191, v198);
                      x = v192.origin.x;
                      y = v192.origin.y;
                      width = v192.size.width;
                      height = v192.size.height;
                    }
                  }
                  v36 = x;
                  v37 = y;
                  v38 = width;
                  v39 = height;
                  v193.origin.x = x;
                  v193.origin.y = y;
                  v193.size.width = width;
                  v193.size.height = height;
                  if (CGRectIsNull(v193))
                  {
                    v36 = *MEMORY[0x1E0C9D648];
                    v37 = *(double *)(MEMORY[0x1E0C9D648] + 8);
                    v38 = *(double *)(MEMORY[0x1E0C9D648] + 16);
                    v39 = *(double *)(MEMORY[0x1E0C9D648] + 24);
                  }
                }
              }

            }
            goto LABEL_80;
          }
          +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", v153[5]);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = 0;
        }
        v17 = v24;
        v18 = v140;
        goto LABEL_36;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UIFocusSystem *__UIFocusMapRecurseSearchForFocusSystemInEligibleContainer(__strong id<_UIFocusRegionContainer>, NSHashTable<id<UIFocusEnvironment>> *__strong, NSHashTable<id<UIFocusEnvironment>> *__strong, NSArray<_UIFocusRegionSearchContextState *> *__strong)");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "handleFailureInFunction:file:lineNumber:description:", v126, CFSTR("_UIFocusMapSnapshot.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eligibleEnvironments"));

    if (v18)
      goto LABEL_16;
    goto LABEL_91;
  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "debugDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("Ignoring attempt to add focus items in already-visited container. This can potentially cause infinite recursion.\nContainer: %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (dyld_program_sdk_at_least())
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v129 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v129, OS_LOG_TYPE_FAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v11;
        _os_log_fault_impl(&dword_185066000, v129, OS_LOG_TYPE_FAULT, "%@", (uint8_t *)&buf, 0xCu);
      }

    }
    else
    {
      v12 = qword_1ECD7DA00;
      if (!qword_1ECD7DA00)
      {
        v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v12, (unint64_t *)&qword_1ECD7DA00);
      }
      v13 = *(NSObject **)(v12 + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v11;
LABEL_12:
        _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  else
  {
    v28 = (_BYTE *)qword_1ECD7DA08;
    if (!qword_1ECD7DA08)
    {
      v28 = (_BYTE *)(__UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16);
      atomic_store((unint64_t)v28, (unint64_t *)&qword_1ECD7DA08);
    }
    if ((*v28 & 1) != 0)
    {
      v130 = qword_1ECD7DA10;
      if (!qword_1ECD7DA10)
      {
        v130 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v130, (unint64_t *)&qword_1ECD7DA10);
      }
      v13 = *(NSObject **)(v130 + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v11;
        goto LABEL_12;
      }
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45___UIFocusMapSnapshot_addRegionsInContainer___block_invoke;
      block[3] = &unk_1E16B1B28;
      v29 = v11;
      v11 = v29;
      v145 = v29;
      if (qword_1ECD7DA18 == -1)
      {
        v30 = v29;
      }
      else
      {
        dispatch_once(&qword_1ECD7DA18, block);
        v30 = v145;
      }

    }
  }
LABEL_88:

}

- (void)addRegionsInContainers:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusMapSnapshot.m"), 551, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("containers"));

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[_UIFocusMapSnapshot addRegionsInContainer:](self, "addRegionsInContainer:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (UIFocusSystem)focusSystem
{
  return (UIFocusSystem *)objc_loadWeakRetained((id *)&self->_focusSystem);
}

- (_UIFocusRegionContainer)rootContainer
{
  return (_UIFocusRegionContainer *)objc_loadWeakRetained((id *)&self->_rootContainer);
}

- (_UIFocusMapRect)mapArea
{
  return self->_mapArea;
}

- (_UIFocusRegion)focusedRegion
{
  return self->_focusedRegion;
}

- (_UIFocusRegionContainer)regionsContainer
{
  return (_UIFocusRegionContainer *)objc_loadWeakRetained((id *)&self->_regionsContainer);
}

- (_UIFocusSearchInfo)searchInfo
{
  return self->_searchInfo;
}

- (void)setSearchInfo:(id)a3
{
  objc_storeStrong((id *)&self->_searchInfo, a3);
}

- (_UIFocusMovementInfo)movementInfo
{
  return self->_movementInfo;
}

- (void)setMovementInfo:(id)a3
{
  objc_storeStrong((id *)&self->_movementInfo, a3);
}

- (_UIFocusMapRect)_searchArea
{
  return self->_searchArea;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchArea, 0);
  objc_storeStrong((id *)&self->_movementInfo, 0);
  objc_storeStrong((id *)&self->_searchInfo, 0);
  objc_destroyWeak((id *)&self->_regionsContainer);
  objc_storeStrong((id *)&self->_focusedRegion, 0);
  objc_storeStrong((id *)&self->_mapArea, 0);
  objc_destroyWeak((id *)&self->_rootContainer);
  objc_destroyWeak((id *)&self->_focusSystem);
  objc_storeStrong((id *)&self->_visitedRegionContainers, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_uncachableEnvironments, 0);
  objc_storeStrong((id *)&self->_ineligibleEnvironments, 0);
  objc_storeStrong((id *)&self->_eligibleEnvironments, 0);
  objc_storeStrong((id *)&self->_stateStack, 0);
  objc_storeStrong((id *)&self->_filteredOriginalRegions, 0);
  objc_storeStrong((id *)&self->_mutableUnoccludedRegions, 0);
}

@end
