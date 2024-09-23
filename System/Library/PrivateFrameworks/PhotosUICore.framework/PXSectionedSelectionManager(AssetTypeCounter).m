@implementation PXSectionedSelectionManager(AssetTypeCounter)

- (PXAssetSelectionTypeCounter)assetTypeCounter
{
  PXAssetSelectionTypeCounter *v2;
  void *v3;
  void *v4;
  char isKindOfClass;

  objc_getAssociatedObject(a1, (const void *)PXAssetTypeCounterKey);
  v2 = (PXAssetSelectionTypeCounter *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(a1, "selectionSnapshot");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v2 = -[PXAssetSelectionTypeCounter initWithSelectionManager:]([PXAssetSelectionTypeCounter alloc], "initWithSelectionManager:", a1);
      objc_setAssociatedObject(a1, (const void *)PXAssetTypeCounterKey, v2, (void *)1);
    }
    else
    {
      v2 = 0;
    }
  }
  return v2;
}

@end
