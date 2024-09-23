@implementation PHPhotosHighlight(HighlightItem)

- (uint64_t)numberOfAssetsInExtendedPrivate
{
  return objc_msgSend(a1, "numberOfAssetsInExtendedForSharingFilter:", 0);
}

- (uint64_t)numberOfAssetsInExtendedShared
{
  return objc_msgSend(a1, "numberOfAssetsInExtendedForSharingFilter:", 1);
}

- (uint64_t)numberOfAssetsInExtendedMixed
{
  return objc_msgSend(a1, "numberOfAssetsInExtendedForSharingFilter:", 2);
}

- (uint64_t)numberOfAssetsInExtendedForSharingFilter:()HighlightItem
{
  int v5;

  v5 = objc_msgSend(a1, "kind");
  if (v5 == 3)
  {
    switch(a3)
    {
      case 2:
        return objc_msgSend(a1, "dayGroupExtendedAssetsCountMixed");
      case 1:
        return objc_msgSend(a1, "dayGroupExtendedAssetsCountShared");
      case 0:
        return objc_msgSend(a1, "dayGroupExtendedAssetsCountPrivate");
      default:
        return 0;
    }
  }
  else
  {
    if (v5)
      return 0;
    switch(a3)
    {
      case 2:
        return objc_msgSend(a1, "extendedCountMixed");
      case 1:
        return objc_msgSend(a1, "extendedCountShared");
      case 0:
        return objc_msgSend(a1, "extendedCountPrivate");
      default:
        return 0;
    }
  }
}

- (id)extendedCuratedAssets
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setIncludeGuestAssets:", 1);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchExtendedCuratedAssetsInAssetCollection:options:", a1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchedObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)keyAssetForHighlightFilter:()HighlightItem
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "keyAssetObjectIDForKindWithFilter:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "photoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "librarySpecificFetchOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setIncludeGuestAssets:", 1);
    v5 = (void *)MEMORY[0x1E0CD1390];
    v10[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fetchAssetsWithObjectIDs:options:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (uint64_t)visibilityStateForHighlightFilter:()HighlightItem
{
  if (a3 == 2)
    return objc_msgSend(a1, "visibilityStateMixed");
  if (a3 == 1)
    return objc_msgSend(a1, "visibilityStateShared");
  if (a3)
    return 0;
  return objc_msgSend(a1, "visibilityState");
}

@end
