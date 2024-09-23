@implementation PXSharedLibraryAggregateSharingSuggestionContainer

- (PXSharedLibraryAggregateSharingSuggestionContainer)initWithSharingSuggestions:(id)a3 aggregateBeforeDate:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  NSUInteger v10;
  void *v11;
  void *v12;
  uint64_t v13;
  PXSharedLibraryAggregateSharingSuggestionContainer *v14;
  PXSharedLibraryAggregateSharingSuggestionContainer *v16;
  PXSharedLibraryAggregateSharingSuggestionContainer *v17;
  void *v18;
  uint64_t v19;
  NSArray *px_sl_containedSharingSuggestions;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSSet *px_sl_containedSharingSuggestionObjectIDs;
  id obj;
  objc_super v27;

  v7 = a3;
  obj = a4;
  v8 = a4;
  v9 = objc_msgSend(v7, "count");
  v10 = 0;
  while (1)
  {
    if ((v9 & ~(v9 >> 63)) == v10)
    {
LABEL_6:
      v14 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "compare:", v8);

    if (v13 == -1 && (uint64_t)(v10 + 1) < v9)
      break;

    ++v10;
    if (v13 == -1)
      goto LABEL_6;
  }

  v14 = 0;
  if (v10 != 0x7FFFFFFFFFFFFFFFLL && v9 != v10)
  {
    v27.receiver = self;
    v27.super_class = (Class)PXSharedLibraryAggregateSharingSuggestionContainer;
    v16 = -[PXSharedLibraryAggregateSharingSuggestionContainer init](&v27, sel_init);
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_sharingSuggestions, a3);
      objc_storeStrong((id *)&v17->_aggregateBeforeDate, obj);
      v17->_aggregationRange.location = v10;
      v17->_aggregationRange.length = v9 - v10;
      -[PHFetchResult fetchedObjects](v17->_sharingSuggestions, "fetchedObjects");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "subarrayWithRange:", v17->_aggregationRange.location, v17->_aggregationRange.length);
      v19 = objc_claimAutoreleasedReturnValue();
      px_sl_containedSharingSuggestions = v17->_px_sl_containedSharingSuggestions;
      v17->_px_sl_containedSharingSuggestions = (NSArray *)v19;

      v21 = (void *)MEMORY[0x1E0C99E60];
      -[PHFetchResult fetchedObjectIDs](v17->_sharingSuggestions, "fetchedObjectIDs");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "subarrayWithRange:", v17->_aggregationRange.location, v17->_aggregationRange.length);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setWithArray:", v23);
      v24 = objc_claimAutoreleasedReturnValue();
      px_sl_containedSharingSuggestionObjectIDs = v17->_px_sl_containedSharingSuggestionObjectIDs;
      v17->_px_sl_containedSharingSuggestionObjectIDs = (NSSet *)v24;

    }
    self = v17;
    v14 = self;
  }
LABEL_7:

  return v14;
}

- (NSString)px_sl_identifier
{
  return (NSString *)CFSTR("PXSharedLibrarySuggestionAggregateIdentifier");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PXSharedLibraryAggregateSharingSuggestionContainer px_sl_identifier](self, "px_sl_identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "px_sl_identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
      v7 = 1;
    else
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PXSharedLibraryAggregateSharingSuggestionContainer px_sl_identifier](self, "px_sl_identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)px_sl_title
{
  PXSharedLibraryAggregateSharingSuggestionContainer *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *px_sl_title;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_px_sl_title)
  {
    -[PXSharedLibraryAggregateSharingSuggestionContainer px_sl_containedSharingSuggestions](v2, "px_sl_containedSharingSuggestions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXSharedLibraryAggregateSharingSuggestionContainer px_sl_containedSharingSuggestions](v2, "px_sl_containedSharingSuggestions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "earlierDate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "laterDate:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v9, v12);
    _localizedSuggestionTitleForDateInterval(v13);
    v14 = objc_claimAutoreleasedReturnValue();
    px_sl_title = v2->_px_sl_title;
    v2->_px_sl_title = (NSString *)v14;

  }
  objc_sync_exit(v2);

  return v2->_px_sl_title;
}

- (id)px_sl_fetchAssetCollections
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CD1708];
  -[PXSharedLibraryAggregateSharingSuggestionContainer px_sl_containedSharingSuggestions](self, "px_sl_containedSharingSuggestions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchHighlightsInSharedLibrarySharingSuggestions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)px_sl_getKeyAsset:(id *)a3 suggestedDate:(id *)a4 locations:(id *)a5
{
  id v6;
  id v7;
  id v8;
  uint64_t i;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  id v20;
  id v21;
  id obj;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[PXSharedLibraryAggregateSharingSuggestionContainer px_sl_containedSharingSuggestions](self, "px_sl_containedSharingSuggestions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  v7 = 0;
  v8 = 0;
  if (v27)
  {
    v26 = *(_QWORD *)v37;
    while (2)
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v37 != v26)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        v34 = 0;
        v35 = 0;
        v33 = 0;
        objc_msgSend(v10, "px_sl_getKeyAsset:suggestedDate:locations:", &v35, &v34, &v33);
        v11 = v35;
        v12 = v34;
        v13 = v33;
        if (!v8)
          v8 = v11;
        v28 = v11;
        if (!v7)
          v7 = v12;
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v14 = v13;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v30;
          do
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v30 != v17)
                objc_enumerationMutation(v14);
              v19 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
              if ((objc_msgSend(v6, "containsObject:", v19) & 1) == 0)
                objc_msgSend(v6, "addObject:", v19);
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
          }
          while (v16);
        }

        if (v8 && v7 && (unint64_t)objc_msgSend(v6, "count") >= 4)
        {

          goto LABEL_26;
        }

      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (v27)
        continue;
      break;
    }
  }
LABEL_26:

  v20 = objc_retainAutorelease(v8);
  *a3 = v20;
  v21 = objc_retainAutorelease(v7);
  *a4 = v21;
  objc_msgSend(v6, "array");
  *a5 = (id)objc_claimAutoreleasedReturnValue();

}

- (PHAssetCollection)px_sl_containerCollection
{
  PXSharedLibraryAggregateSharingSuggestionContainer *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  PHAssetCollection *px_sl_containerCollection;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_px_sl_containerCollection)
  {
    -[PXSharedLibraryAggregateSharingSuggestionContainer px_sl_containedSharingSuggestions](v2, "px_sl_containedSharingSuggestions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "librarySpecificFetchOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setIncludeSharedLibrarySharingSuggestionsSmartAlbum:", 1);
    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 2, 1000000214, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3880];
    -[PXSharedLibraryAggregateSharingSuggestionContainer px_sl_containedSharingSuggestionObjectIDs](v2, "px_sl_containedSharingSuggestionObjectIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicateWithFormat:", CFSTR("highlightBeingAssets.parentPhotosHighlight IN (%@)"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInternalPredicate:", v10);

    objc_msgSend(v6, "setWantsIncrementalChangeDetails:", 0);
    v11 = (void *)MEMORY[0x1E0CD1390];
    objc_msgSend(v7, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchAssetsInAssetCollection:options:", v12, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:identifier:", v13, 0, CFSTR("PXSharedLibrarySharingSuggestionTransientIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    px_sl_containerCollection = v2->_px_sl_containerCollection;
    v2->_px_sl_containerCollection = (PHAssetCollection *)v14;

  }
  objc_sync_exit(v2);

  return v2->_px_sl_containerCollection;
}

- (NSArray)px_sl_containedSharingSuggestions
{
  return self->_px_sl_containedSharingSuggestions;
}

- (NSSet)px_sl_containedSharingSuggestionObjectIDs
{
  return self->_px_sl_containedSharingSuggestionObjectIDs;
}

- (NSDate)aggregateBeforeDate
{
  return self->_aggregateBeforeDate;
}

- (_NSRange)aggregationRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_aggregationRange.length;
  location = self->_aggregationRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregateBeforeDate, 0);
  objc_storeStrong((id *)&self->_px_sl_containerCollection, 0);
  objc_storeStrong((id *)&self->_px_sl_containedSharingSuggestionObjectIDs, 0);
  objc_storeStrong((id *)&self->_px_sl_containedSharingSuggestions, 0);
  objc_storeStrong((id *)&self->_px_sl_title, 0);
  objc_storeStrong((id *)&self->_sharingSuggestions, 0);
}

@end
