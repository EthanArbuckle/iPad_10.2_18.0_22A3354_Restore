@implementation PHCollectionList(PXDisplayAssetAdoption)

- (BOOL)px_isFolder
{
  return (objc_msgSend(a1, "collectionListType") & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)px_isSmartFolder
{
  return objc_msgSend(a1, "collectionListType") == 3;
}

- (uint64_t)px_isRegularFolder
{
  if (objc_msgSend(a1, "collectionListType") == 2 && objc_msgSend(a1, "collectionListSubtype") == 100)
    return objc_msgSend(a1, "isTransient") ^ 1;
  else
    return 0;
}

- (BOOL)px_isTopLevelFolder
{
  return objc_msgSend(a1, "collectionListType") == 2 && objc_msgSend(a1, "collectionListSubtype") == 1000000101;
}

- (BOOL)px_isMacSyncedEventsFolder
{
  return objc_msgSend(a1, "collectionListType") == 3 && objc_msgSend(a1, "collectionListSubtype") == 200;
}

- (BOOL)px_isMacSyncedFacesFolder
{
  return objc_msgSend(a1, "collectionListType") == 3 && objc_msgSend(a1, "collectionListSubtype") == 201;
}

- (uint64_t)px_isTransientPlacesCollection
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "transientIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("PXPlacesGridVirtualCollection"));

  return v2;
}

@end
