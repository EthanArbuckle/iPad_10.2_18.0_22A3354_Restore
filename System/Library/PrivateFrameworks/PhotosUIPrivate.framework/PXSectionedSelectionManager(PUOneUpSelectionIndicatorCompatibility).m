@implementation PXSectionedSelectionManager(PUOneUpSelectionIndicatorCompatibility)

- (uint64_t)pu_registerSelectionIndicatorObserver:()PUOneUpSelectionIndicatorCompatibility
{
  return objc_msgSend(a1, "registerChangeObserver:context:", a3, PhotosUICoreSelectionManagerObservationContext_50980);
}

- (uint64_t)pu_unregisterSelectionIndicatorObserver:()PUOneUpSelectionIndicatorCompatibility
{
  return objc_msgSend(a1, "unregisterChangeObserver:context:", a3, PhotosUICoreSelectionManagerObservationContext_50980);
}

- (uint64_t)pu_isAssetReferenceSelected:()PUOneUpSelectionIndicatorCompatibility
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _OWORD v9[4];

  objc_msgSend(a3, "indexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "selectionSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");

  PXSimpleIndexPathFromIndexPath();
  memset(v9, 0, sizeof(v9));
  v7 = objc_msgSend(v5, "isIndexPathSelected:", v9);

  return v7;
}

@end
