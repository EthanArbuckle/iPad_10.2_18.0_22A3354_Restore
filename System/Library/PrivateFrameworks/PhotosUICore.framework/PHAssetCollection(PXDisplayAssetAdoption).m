@implementation PHAssetCollection(PXDisplayAssetAdoption)

- (BOOL)px_isSharedLibrarySharingSuggestionsSmartAlbum
{
  return objc_msgSend(a1, "assetCollectionSubtype") == 1000000214;
}

- (uint64_t)px_isSharedLibrarySharingSuggestion
{
  void *v3;
  uint64_t v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(a1, "isSharingSuggestion") & 1) != 0)
    return 1;
  objc_msgSend(a1, "transientIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PXSharedLibrarySharingSuggestionTransientIdentifier"));

  return v4;
}

- (BOOL)px_isSharedAlbum
{
  return objc_msgSend(a1, "assetCollectionSubtype") == 101;
}

- (BOOL)isAggregation
{
  return objc_msgSend(a1, "assetCollectionType") == 6 && objc_msgSend(a1, "type") == 3;
}

- (uint64_t)px_highlightEnrichmentState
{
  if (objc_msgSend(a1, "assetCollectionType") == 6)
    return objc_msgSend(a1, "enrichmentState");
  else
    return 0;
}

- (BOOL)px_supportsFastCuration
{
  return objc_msgSend(a1, "assetCollectionType") == 4 || objc_msgSend(a1, "assetCollectionType") == 6;
}

- (uint64_t)isRecent
{
  return 0;
}

- (id)localizedSmartDescription
{
  id v4;
  void *v5;
  void *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;

  if (objc_msgSend(a1, "assetCollectionType") != 6)
  {
    v5 = 0;
    return v5;
  }
  v4 = a1;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, 0, CFSTR("PHAsset+PXDisplayAssetAdoption.m"), 933, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self"), v9);
LABEL_9:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "px_descriptionForAssertionMessage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, v4, CFSTR("PHAsset+PXDisplayAssetAdoption.m"), 933, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self"), v9, v11);

    goto LABEL_9;
  }
LABEL_4:
  objc_msgSend(v4, "smartDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)localizedDateDescription
{
  id v4;
  void *v5;
  void *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;

  if (objc_msgSend(a1, "assetCollectionType") != 6)
  {
    v5 = 0;
    return v5;
  }
  v4 = a1;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, 0, CFSTR("PHAsset+PXDisplayAssetAdoption.m"), 909, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self"), v9);
LABEL_9:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "px_descriptionForAssertionMessage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, v4, CFSTR("PHAsset+PXDisplayAssetAdoption.m"), 909, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self"), v9, v11);

    goto LABEL_9;
  }
LABEL_4:
  objc_msgSend(v4, "dateDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isEnriched
{
  void *v2;
  _BOOL8 v3;

  if (objc_msgSend(a1, "assetCollectionType") != 4)
    return 0;
  objc_msgSend(a1, "graphMemoryIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isEnrichmentComplete
{
  void *v2;
  _BOOL8 v3;

  if (objc_msgSend(a1, "assetCollectionType") == 4)
  {
    objc_msgSend(a1, "graphMemoryIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2 != 0;

  }
  else
  {
    return objc_msgSend(a1, "assetCollectionType") == 6 && objc_msgSend(a1, "enrichmentState") > 3;
  }
  return v3;
}

- (uint64_t)px_highlightKind
{
  if (objc_msgSend(a1, "assetCollectionType") == 6)
    return objc_msgSend(a1, "kind");
  else
    return -1;
}

- (double)promotionScore
{
  return 0.0;
}

- (id)localizedShortDateDescription
{
  id v4;
  void *v5;
  void *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;

  if (objc_msgSend(a1, "assetCollectionType") != 6)
  {
    v5 = 0;
    return v5;
  }
  v4 = a1;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, 0, CFSTR("PHAsset+PXDisplayAssetAdoption.m"), 917, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self"), v9);
LABEL_9:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "px_descriptionForAssertionMessage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, v4, CFSTR("PHAsset+PXDisplayAssetAdoption.m"), 917, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self"), v9, v11);

    goto LABEL_9;
  }
LABEL_4:
  objc_msgSend(v4, "shortDateDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)localizedDateDescriptionWithOptions:()PXDisplayAssetAdoption
{
  id v6;
  void *v7;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;

  if (objc_msgSend(a1, "assetCollectionType") != 6)
  {
    v7 = 0;
    return v7;
  }
  v6 = a1;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, 0, CFSTR("PHAsset+PXDisplayAssetAdoption.m"), 925, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self"), v11);
LABEL_9:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("PHAsset+PXDisplayAssetAdoption.m"), 925, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self"), v11, v13);

    goto LABEL_9;
  }
LABEL_4:
  objc_msgSend(v6, "dateDescriptionWithOptions:", a3 & 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)localizedDebugDescription
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;

  if (objc_msgSend(a1, "assetCollectionType") != 6)
  {
    v10 = 0;
    return v10;
  }
  v4 = a1;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, 0, CFSTR("PHAsset+PXDisplayAssetAdoption.m"), 941, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self"), v14);
LABEL_9:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "px_descriptionForAssertionMessage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v4, CFSTR("PHAsset+PXDisplayAssetAdoption.m"), 941, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self"), v14, v16);

    goto LABEL_9;
  }
LABEL_4:
  objc_msgSend(v4, "type");
  PHShortDescriptionForPhotosHighlightType();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enrichmentState");
  PHShortDescriptionForPhotosHighlightEnrichmentState();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "countForCurationType:", objc_msgSend(v4, "px_curationType"));
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "promotionScore");
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ | %@ | %.2f | %li"), v5, v6, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (__CFString)px_symbolImageName
{
  void *v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;

  if (objc_msgSend(a1, "isTransient"))
  {
    objc_msgSend(a1, "transientIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (PXSymbolNameForTransientCollectionIdentifier_onceToken != -1)
      dispatch_once(&PXSymbolNameForTransientCollectionIdentifier_onceToken, &__block_literal_global_163105);
    objc_msgSend((id)PXSymbolNameForTransientCollectionIdentifier_symbolNames, "objectForKeyedSubscript:", v2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    v5 = CFSTR("rectangle.stack");
    if (v3)
      v5 = (__CFString *)v3;
    v6 = v5;

  }
  else
  {
    v7 = objc_msgSend(a1, "assetCollectionSubtype");
    if (PXSymbolNameForAssetCollectionSubtype_onceToken != -1)
      dispatch_once(&PXSymbolNameForAssetCollectionSubtype_onceToken, &__block_literal_global_764);
    v8 = (void *)PXSymbolNameForAssetCollectionSubtype_symbolNames;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v2);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)px_isMemory
{
  return objc_msgSend(a1, "assetCollectionType") == 4;
}

- (uint64_t)px_allowsImplicitSelectionForProjectOrSharingAction
{
  if ((objc_msgSend(a1, "px_isRecentsSmartAlbum") & 1) != 0
    || (objc_msgSend(a1, "px_isImportHistoryCollection") & 1) != 0)
  {
    return 0;
  }
  else
  {
    return objc_msgSend(a1, "px_isSearchResultsVirtualCollection") ^ 1;
  }
}

- (BOOL)px_isRegularAlbum
{
  return objc_msgSend(a1, "assetCollectionSubtype") == 2;
}

- (BOOL)px_isImportedAlbum
{
  return objc_msgSend(a1, "assetCollectionSubtype") == 6;
}

- (BOOL)px_isMyPhotoStreamAlbum
{
  return objc_msgSend(a1, "assetCollectionSubtype") == 100;
}

- (BOOL)px_isUserSmartAlbum
{
  return objc_msgSend(a1, "assetCollectionSubtype") == 1000000204;
}

- (uint64_t)px_isSmartAlbum
{
  if (objc_msgSend(a1, "assetCollectionType") == 2)
    return objc_msgSend(a1, "isTransient") ^ 1;
  else
    return 0;
}

- (uint64_t)px_isRootSmartAlbum
{
  uint64_t result;

  result = objc_msgSend(a1, "px_isSmartAlbum");
  if ((_DWORD)result)
  {
    if ((objc_msgSend(a1, "px_isPlacesSmartAlbum") & 1) != 0
      || (objc_msgSend(a1, "px_isUserSmartAlbum") & 1) != 0
      || (objc_msgSend(a1, "px_isMediaTypeSmartAlbum") & 1) != 0)
    {
      return 0;
    }
    else
    {
      return objc_msgSend(a1, "px_isLemonadeUtilitiesAlbum") ^ 1;
    }
  }
  return result;
}

- (uint64_t)px_isMediaTypeSmartAlbum
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend((id)objc_opt_class(), "px_mediaTypeSmartAlbumSubtypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "assetCollectionSubtype"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (uint64_t)px_isLemonadeUtilitiesAlbum
{
  uint64_t result;

  result = +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled");
  if ((_DWORD)result)
  {
    if ((objc_msgSend(a1, "px_isUtilityCollection") & 1) != 0
      || (objc_msgSend(a1, "px_isRecentsCollection") & 1) != 0
      || (objc_msgSend(a1, "px_isHiddenSmartAlbum") & 1) != 0
      || (objc_msgSend(a1, "px_isRecentlyDeletedSmartAlbum") & 1) != 0
      || (objc_msgSend(a1, "px_isAllLibraryDuplicatesSmartAlbum") & 1) != 0)
    {
      return 1;
    }
    else
    {
      return objc_msgSend(a1, "px_isImportHistoryCollection");
    }
  }
  return result;
}

- (BOOL)px_isAllPhotosSmartAlbum
{
  return objc_msgSend(a1, "assetCollectionSubtype") == 1000000205;
}

- (BOOL)px_isFavoritesSmartAlbum
{
  return objc_msgSend(a1, "assetCollectionSubtype") == 203;
}

- (BOOL)px_isHiddenSmartAlbum
{
  return objc_msgSend(a1, "assetCollectionSubtype") == 205;
}

- (BOOL)px_isRecentlyAddedSmartAlbum
{
  return objc_msgSend(a1, "assetCollectionSubtype") == 206;
}

- (BOOL)px_isRecentlyDeletedSmartAlbum
{
  return objc_msgSend(a1, "assetCollectionSubtype") == 1000000201;
}

- (BOOL)px_isPlacesSmartAlbum
{
  return objc_msgSend(a1, "assetCollectionSubtype") == 1000000203;
}

- (uint64_t)px_isRecentlySavedCollection
{
  if (objc_msgSend(a1, "assetCollectionSubtype") == 1000000218)
    return 1;
  else
    return objc_msgSend(a1, "px_isSavedTodayCollection");
}

- (uint64_t)px_isSavedTodayCollection
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "transientIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "hasPrefix:", CFSTR("PXTransientCollectionIdentifierSavedToday"));

  return v2;
}

- (uint64_t)px_isPhotosVirtualCollection
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "isTransient");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "transientIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PXPhotosVirtualCollection"));

    return v4;
  }
  return result;
}

- (uint64_t)px_isMomentsVirtualCollection
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "isTransient");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "transientIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PXMomentsVirtualCollection"));

    return v4;
  }
  return result;
}

- (uint64_t)px_isEventsVirtualCollection
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "isTransient");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "transientIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PXTransientCollectionIdentifierEvents"));

    return v4;
  }
  return result;
}

- (uint64_t)px_isTripsVirtualCollection
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "isTransient");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "transientIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PXTransientCollectionIdentifierTrips"));

    return v4;
  }
  return result;
}

- (uint64_t)px_isFeaturedPhotosCollection
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "isTransient");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "transientIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("PXFeaturedPhotosVirtualCollection"));

    return v4;
  }
  return result;
}

- (uint64_t)px_isWallpaperSuggestionsVirtualCollection
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "isTransient");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "transientIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PXTransientCollectionIdentifierWallpaperSuggestions"));

    return v4;
  }
  return result;
}

- (uint64_t)px_isBookmarksVirtualCollection
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "isTransient");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "transientIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PXTransientCollectionIdentifierBookmarks"));

    return v4;
  }
  return result;
}

- (uint64_t)px_isSearchResultsVirtualCollection
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "transientIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("PXPhotosSearchResultsVirtualCollection"));

  return v2;
}

- (uint64_t)px_isMemoriesVirtualCollection
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "isTransient");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "transientIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PXMemoriesVirtualCollection"));

    return v4;
  }
  return result;
}

- (uint64_t)px_isForYouVirtualCollection
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "isTransient");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "transientIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PXForYouVirtualCollection"));

    return v4;
  }
  return result;
}

- (uint64_t)px_isPeopleVirtualCollection
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "isTransient");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "transientIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PXPeopleVirtualCollection"));

    return v4;
  }
  return result;
}

- (uint64_t)px_isSharedActivityVirtualCollection
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "isTransient");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "transientIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PXSharedActivityVirtualCollection"));

    return v4;
  }
  return result;
}

- (uint64_t)px_isImportHistoryCollection
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "isTransient");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "transientIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PXImportHistoryVirtualCollection"));

    return v4;
  }
  return result;
}

- (uint64_t)px_isAllAlbumsVirtualCollection
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "isTransient");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "transientIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PXAllAlbumsVirtualCollection"));

    return v4;
  }
  return result;
}

- (uint64_t)px_isMyAlbumsVirtualCollection
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "isTransient");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "transientIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PXMyAlbumsVirtualCollection"));

    return v4;
  }
  return result;
}

- (uint64_t)px_isSharedAlbumsVirtualCollection
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "isTransient");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "transientIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PXSharedAlbumsVirtualCollection"));

    return v4;
  }
  return result;
}

- (uint64_t)px_isContentSyndicationVirtualCollection
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "isTransient");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "transientIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PXContentSyndicationVirtualCollection"));

    return v4;
  }
  return result;
}

- (uint64_t)px_isMapVirtualCollection
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "isTransient");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "transientIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PXTransientCollectionIdentifierMap"));

    return v4;
  }
  return result;
}

- (uint64_t)px_isContentSyndicationAllPhotosAlbum
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "isTransient");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "transientIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PXContentSyndicationAllPhotosAssetCollection"));

    return v4;
  }
  return result;
}

- (uint64_t)px_isMomentShareVirtualCollection
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "isTransient");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "transientIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PXCompleteMyMomentVirtualCollection"));

    return v4;
  }
  return result;
}

- (BOOL)px_isImportSessionCollection
{
  return objc_msgSend(a1, "assetCollectionType") == 9;
}

- (uint64_t)px_isImportAssetCollection
{
  return 0;
}

- (uint64_t)px_isRecentlyViewedCollection
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "isTransient");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "transientIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PXRecentlyViewedVirtualCollection"));

    return v4;
  }
  return result;
}

- (uint64_t)px_isRecentlyEditedCollection
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "isTransient");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "transientIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PXRecentlyEditedVirtualCollection"));

    return v4;
  }
  return result;
}

- (uint64_t)px_isRecentlySharedCollection
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "isTransient");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "transientIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PXRecentlySharedVirtualCollection"));

    return v4;
  }
  return result;
}

- (BOOL)px_isRecentsSmartAlbum
{
  return objc_msgSend(a1, "assetCollectionSubtype") == 209;
}

- (BOOL)px_isRecentlyEditedSmartAlbum
{
  return objc_msgSend(a1, "assetCollectionSubtype") == 1000000206;
}

- (BOOL)px_isScreenRecordingsSmartAlbum
{
  return objc_msgSend(a1, "assetCollectionSubtype") == 1000000207;
}

- (BOOL)px_isVideosSmartAlbum
{
  return objc_msgSend(a1, "assetCollectionSubtype") == 202;
}

- (BOOL)px_isTimelapsesSmartAlbum
{
  return objc_msgSend(a1, "assetCollectionSubtype") == 204;
}

- (BOOL)px_isBurstsSmartAlbum
{
  return objc_msgSend(a1, "assetCollectionSubtype") == 207;
}

- (BOOL)px_isSlomoVideosSmartAlbum
{
  return objc_msgSend(a1, "assetCollectionSubtype") == 208;
}

- (BOOL)px_isSelfPortraitsSmartAlbum
{
  return objc_msgSend(a1, "assetCollectionSubtype") == 210;
}

- (BOOL)px_isScreenshotsSmartAlbum
{
  return objc_msgSend(a1, "assetCollectionSubtype") == 211;
}

- (BOOL)px_isDepthEffectSmartAlbum
{
  return objc_msgSend(a1, "assetCollectionSubtype") == 212;
}

- (BOOL)px_isLivePhotosSmartAlbum
{
  return objc_msgSend(a1, "assetCollectionSubtype") == 213;
}

- (BOOL)px_isAnimatedSmartAlbum
{
  return objc_msgSend(a1, "assetCollectionSubtype") == 214;
}

- (BOOL)px_isLongExposuresSmartAlbum
{
  return objc_msgSend(a1, "assetCollectionSubtype") == 215;
}

- (BOOL)px_isRAWSmartAlbum
{
  return objc_msgSend(a1, "assetCollectionSubtype") == 217;
}

- (BOOL)px_isCinematicSmartAlbum
{
  return objc_msgSend(a1, "assetCollectionSubtype") == 218;
}

- (BOOL)px_isProResSmartAlbum
{
  return objc_msgSend(a1, "assetCollectionSubtype") == 1000000211;
}

- (BOOL)px_isPanoramasSmartAlbum
{
  return objc_msgSend(a1, "assetCollectionSubtype") == 201;
}

- (BOOL)px_isSpatialSmartAlbum
{
  return objc_msgSend(a1, "assetCollectionSubtype") == 219;
}

- (BOOL)px_isAllLibraryDuplicatesSmartAlbum
{
  return objc_msgSend(a1, "assetCollectionSubtype") == 1000000212;
}

- (BOOL)px_isDuplicatesAlbum
{
  return objc_msgSend(a1, "assetCollectionSubtype") == 1000000601;
}

- (BOOL)px_isRecoveredSmartAlbum
{
  return objc_msgSend(a1, "assetCollectionSubtype") == 1000000219;
}

- (uint64_t)px_containsPrivateContent
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  +[PXContentPrivacySettings sharedInstance](PXContentPrivacySettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "simulationMode");
  if (v3 == 1)
  {
    v5 = objc_msgSend(a1, "px_isPrivacySensitiveAlbum");
  }
  else if (v3 || !objc_msgSend(a1, "containsPrivateContent"))
  {
    v5 = 0;
  }
  else
  {
    +[PXContentPrivacyController privacyControllerForCollection:](PXContentPrivacyController, "privacyControllerForCollection:", a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isContentPrivacyEnabled");

  }
  return v5;
}

- (BOOL)px_isUnableToUploadSmartAlbum
{
  return objc_msgSend(a1, "assetCollectionSubtype") == 216;
}

- (BOOL)px_isMoment
{
  return objc_msgSend(a1, "assetCollectionType") == 3;
}

- (BOOL)px_isHighlight
{
  return objc_msgSend(a1, "assetCollectionType") == 6;
}

- (uint64_t)px_isHighlightEnrichedWithAssetMetadataAndScenesProcessed
{
  uint64_t result;

  result = objc_msgSend(a1, "px_isHighlight");
  if ((_DWORD)result)
    return objc_msgSend(a1, "px_highlightEnrichmentState") > 2;
  return result;
}

- (BOOL)px_isSuggestion
{
  return objc_msgSend(a1, "assetCollectionType") == 8;
}

- (BOOL)px_isMomentShare
{
  return objc_msgSend(a1, "assetCollectionType") == 7;
}

- (BOOL)px_isContentSyndicationAlbum
{
  void *v2;
  unint64_t v3;
  void *v4;
  uint64_t v5;
  _BOOL8 v6;

  +[PXContentSyndicationSettings sharedInstance](PXContentSyndicationSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dataSourceType");
  if (v3 <= 5)
  {
    objc_msgSend(a1, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "wellKnownPhotoLibraryIdentifier");

    if (v5 != 3)
    {
      v6 = objc_msgSend(a1, "assetCollectionSubtype") == 1000000501;
      goto LABEL_8;
    }
    goto LABEL_3;
  }
  if (v3 == 6)
  {
    if ((objc_msgSend(a1, "px_isMomentShare") & 1) == 0)
    {
LABEL_6:
      v6 = 0;
      goto LABEL_8;
    }
  }
  else if (v3 != 7 || (objc_msgSend(a1, "px_isSharedAlbum") & 1) == 0)
  {
    goto LABEL_6;
  }
LABEL_3:
  v6 = 1;
LABEL_8:

  return v6;
}

- (BOOL)px_isMacSyncedAlbum
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "assetCollectionSubtype");
  return v1 == 3 || (v1 & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (BOOL)px_isMacSyncedRegularAlbum
{
  return objc_msgSend(a1, "assetCollectionSubtype") == 5;
}

- (BOOL)px_isMacSyncedFacesAlbum
{
  return objc_msgSend(a1, "assetCollectionSubtype") == 4;
}

@end
