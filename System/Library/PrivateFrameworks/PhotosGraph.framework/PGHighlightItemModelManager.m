@implementation PGHighlightItemModelManager

- (PGHighlightItemModelManager)initWithLibrary:(id)a3
{
  id v5;
  PGHighlightItemModelManager *v6;
  PGHighlightItemModelManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGHighlightItemModelManager;
  v6 = -[PGHighlightItemModelManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_library, a3);
    -[PGHighlightItemModelManager commonInit](v7, "commonInit");
  }

  return v7;
}

- (id)initForTesting
{
  PGHighlightItemModelManager *v2;
  PGHighlightItemModelManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGHighlightItemModelManager;
  v2 = -[PGHighlightItemModelManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PGHighlightItemModelManager commonInit](v2, "commonInit");
  return v3;
}

- (void)commonInit
{
  NSMutableDictionary *v3;
  NSMutableDictionary *visibilityStatePrivateByHighlighItemUUID;
  NSMutableDictionary *v5;
  NSMutableDictionary *visibilityStateSharedByHighlighItemUUID;
  NSMutableDictionary *v7;
  NSMutableDictionary *visibilityStateMixedByHighlighItemUUID;
  NSMutableDictionary *v9;
  NSMutableDictionary *contextualKeyAssetPrivateByHighlighItemUUID;
  NSMutableDictionary *v11;
  NSMutableDictionary *contextualKeyAssetSharedByHighlighItemUUID;
  NSMutableDictionary *v13;
  NSMutableDictionary *contextualKeyAssetMixedByHighlighItemUUID;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  visibilityStatePrivateByHighlighItemUUID = self->_visibilityStatePrivateByHighlighItemUUID;
  self->_visibilityStatePrivateByHighlighItemUUID = v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  visibilityStateSharedByHighlighItemUUID = self->_visibilityStateSharedByHighlighItemUUID;
  self->_visibilityStateSharedByHighlighItemUUID = v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  visibilityStateMixedByHighlighItemUUID = self->_visibilityStateMixedByHighlighItemUUID;
  self->_visibilityStateMixedByHighlighItemUUID = v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  contextualKeyAssetPrivateByHighlighItemUUID = self->_contextualKeyAssetPrivateByHighlighItemUUID;
  self->_contextualKeyAssetPrivateByHighlighItemUUID = v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  contextualKeyAssetSharedByHighlighItemUUID = self->_contextualKeyAssetSharedByHighlighItemUUID;
  self->_contextualKeyAssetSharedByHighlighItemUUID = v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  contextualKeyAssetMixedByHighlighItemUUID = self->_contextualKeyAssetMixedByHighlighItemUUID;
  self->_contextualKeyAssetMixedByHighlighItemUUID = v13;

}

- (void)consumeHighlightItemList:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0CD1710];
  v4 = a3;
  objc_msgSend(v4, "modelObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "changeRequestForPhotosHighlight:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "promotionScore");
  objc_msgSend(v9, "setPromotionScore:");
  objc_msgSend(v9, "setEnrichmentState:", 4);
  objc_msgSend(v9, "setVisibilityState:", objc_msgSend(v4, "visibilityStateForHighlightFilter:", 0));
  objc_msgSend(v9, "setVisibilityStateShared:", objc_msgSend(v4, "visibilityStateForHighlightFilter:", 1));
  objc_msgSend(v9, "setVisibilityStateMixed:", objc_msgSend(v4, "visibilityStateForHighlightFilter:", 2));
  objc_msgSend(v4, "keyAssetPrivate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setKeyAssetPrivate:", v6);

  objc_msgSend(v4, "keyAssetShared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setKeyAssetShared:", v7);

  v8 = objc_msgSend(v4, "mixedSharingCompositionKeyAssetRelationship");
  objc_msgSend(v9, "setMixedSharingCompositionKeyAssetRelationship:", v8);
  objc_msgSend(v9, "didEnrichHighlight");

}

- (id)fetchParentHighlightItemsForHighlightItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGHighlightItemModelManager library](self, "library");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "modelObject", (_QWORD)v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CD1708], "fetchParentHighlightsForHighlights:options:", v7, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fetchedObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v15;
}

- (id)fetchChildHighlightItemsForHighlightItem:(id)a3 sharingFilter:(unsigned __int16)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];

  v4 = a4;
  v17[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PGHighlightItemModelManager library](self, "library");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "librarySpecificFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setSharingFilter:", v4);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSortDescriptors:", v11);

  v12 = (void *)MEMORY[0x1E0CD1708];
  objc_msgSend(v6, "modelObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "fetchChildHighlightsForHighlight:options:", v13, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "fetchedObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)setVisibilityState:(unsigned __int16)a3 forHighlightItem:(id)a4 sharingFilter:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a5;
  v6 = a3;
  v8 = a4;
  -[PGHighlightItemModelManager _visibilityStateByHighlighItemUUIDForHighlightFilter:](self, "_visibilityStateByHighlighItemUUIDForHighlightFilter:", v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, v10);
}

- (void)setVisibilityState:(unsigned __int16)a3 forHighlightItemList:(id)a4 sharingFilter:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;

  v5 = a5;
  v6 = a3;
  v8 = a4;
  objc_msgSend(v8, "setVisibilityState:forSharingFilter:", v6, v5);
  -[PGHighlightItemModelManager setVisibilityState:forHighlightItem:sharingFilter:](self, "setVisibilityState:forHighlightItem:sharingFilter:", v6, v8, v5);

}

- (unsigned)visibilityStateForHighlightItem:(id)a3 sharingFilter:(unsigned __int16)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int16 v10;
  unsigned __int16 v11;

  v4 = a4;
  v6 = a3;
  -[PGHighlightItemModelManager _visibilityStateByHighlighItemUUIDForHighlightFilter:](self, "_visibilityStateByHighlighItemUUIDForHighlightFilter:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = objc_msgSend(v9, "unsignedShortValue");
  else
    v10 = objc_msgSend(v6, "visibilityStateForHighlightFilter:", v4);
  v11 = v10;

  return v11;
}

- (void)setContextualKeyAsset:(id)a3 forHighlightItem:(id)a4 sharingFilter:(unsigned __int16)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  id v11;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[PGHighlightItemModelManager _contextualKeyAssetByHighlighItemUUIDForHighlightFilter:](self, "_contextualKeyAssetByHighlighItemUUIDForHighlightFilter:", v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, v10);
}

- (id)contextualKeyAssetForHighlightItem:(id)a3 sharingFilter:(unsigned __int16)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  -[PGHighlightItemModelManager _contextualKeyAssetByHighlighItemUUIDForHighlightFilter:](self, "_contextualKeyAssetByHighlighItemUUIDForHighlightFilter:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)highlightUUIDsWithVisibilityStateChange
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[NSMutableDictionary allKeys](self->_visibilityStatePrivateByHighlighItemUUID, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  -[NSMutableDictionary allKeys](self->_visibilityStateSharedByHighlighItemUUID, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  -[NSMutableDictionary allKeys](self->_visibilityStateMixedByHighlighItemUUID, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  return v3;
}

- (id)highlightUUIDsWithContextualKeyAssetChange
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[NSMutableDictionary allKeys](self->_contextualKeyAssetPrivateByHighlighItemUUID, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  -[NSMutableDictionary allKeys](self->_contextualKeyAssetSharedByHighlighItemUUID, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  -[NSMutableDictionary allKeys](self->_contextualKeyAssetMixedByHighlighItemUUID, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  return v3;
}

- (void)addVisibleHighlight:(id)a3 inMonth:(id)a4 withHighlightFilter:(unsigned __int16)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  double v16;
  uint64_t i;
  void *v18;
  double v19;
  double v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v5 = a5;
  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[PGHighlightItemModelManager fetchChildHighlightItemsForHighlightItem:sharingFilter:](self, "fetchChildHighlightItemsForHighlightItem:sharingFilter:", v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = v11;
    v22 = v8;
    v13 = 0;
    v14 = 0;
    v15 = *(_QWORD *)v24;
    v16 = 1.79769313e308;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v10);
        v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (MEMORY[0x1CAA4E418](-[PGHighlightItemModelManager visibilityStateForHighlightItem:sharingFilter:](self, "visibilityStateForHighlightItem:sharingFilter:", v18, v5)))
        {
          ++v13;
          objc_msgSend(v18, "promotionScore");
          if (v19 < v16)
          {
            v20 = v19;
            v21 = v18;

            v16 = v20;
            v14 = v21;
          }
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v12);
    if (v14)
    {
      v8 = v22;
      if (v13 >= +[PGUserDefaults maximumNumberOfVisibleItems](PGUserDefaults, "maximumNumberOfVisibleItems"))-[PGHighlightItemModelManager setVisibilityState:forHighlightItem:sharingFilter:](self, "setVisibilityState:forHighlightItem:sharingFilter:", 1, v14, v5);
    }
    else
    {
      v8 = v22;
    }
  }
  else
  {
    v14 = 0;
  }
  -[PGHighlightItemModelManager setVisibilityState:forHighlightItem:sharingFilter:](self, "setVisibilityState:forHighlightItem:sharingFilter:", 3, v8, v5);

}

- (id)_visibilityStateByHighlighItemUUIDForHighlightFilter:(unsigned __int16)a3
{
  if (a3 <= 2u)
    self = (&self->_visibilityStatePrivateByHighlighItemUUID)[a3];
  return self;
}

- (id)_contextualKeyAssetByHighlighItemUUIDForHighlightFilter:(unsigned __int16)a3
{
  if (a3 <= 2u)
    self = (&self->_contextualKeyAssetPrivateByHighlighItemUUID)[a3];
  return self;
}

- (PHPhotoLibrary)library
{
  return self->_library;
}

- (NSMutableDictionary)visibilityStatePrivateByHighlighItemUUID
{
  return self->_visibilityStatePrivateByHighlighItemUUID;
}

- (NSMutableDictionary)visibilityStateSharedByHighlighItemUUID
{
  return self->_visibilityStateSharedByHighlighItemUUID;
}

- (NSMutableDictionary)visibilityStateMixedByHighlighItemUUID
{
  return self->_visibilityStateMixedByHighlighItemUUID;
}

- (NSMutableDictionary)contextualKeyAssetPrivateByHighlighItemUUID
{
  return self->_contextualKeyAssetPrivateByHighlighItemUUID;
}

- (NSMutableDictionary)contextualKeyAssetSharedByHighlighItemUUID
{
  return self->_contextualKeyAssetSharedByHighlighItemUUID;
}

- (NSMutableDictionary)contextualKeyAssetMixedByHighlighItemUUID
{
  return self->_contextualKeyAssetMixedByHighlighItemUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextualKeyAssetMixedByHighlighItemUUID, 0);
  objc_storeStrong((id *)&self->_contextualKeyAssetSharedByHighlighItemUUID, 0);
  objc_storeStrong((id *)&self->_contextualKeyAssetPrivateByHighlighItemUUID, 0);
  objc_storeStrong((id *)&self->_visibilityStateMixedByHighlighItemUUID, 0);
  objc_storeStrong((id *)&self->_visibilityStateSharedByHighlighItemUUID, 0);
  objc_storeStrong((id *)&self->_visibilityStatePrivateByHighlighItemUUID, 0);
  objc_storeStrong((id *)&self->_library, 0);
}

@end
