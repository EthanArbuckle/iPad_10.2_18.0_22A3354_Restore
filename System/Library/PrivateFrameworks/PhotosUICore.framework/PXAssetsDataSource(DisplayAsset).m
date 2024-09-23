@implementation PXAssetsDataSource(DisplayAsset)

- (id)displayAssetAtIndexPath:()DisplayAsset
{
  id v4;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "identifier");
  PXSimpleIndexPathFromIndexPath();

  objc_msgSend(a1, "assetAtItemIndexPath:", &v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)indexPathForDisplayAsset:()DisplayAsset hintIndexPath:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _BYTE v12[32];

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)off_1E50B1688);
  objc_msgSend(a1, "identifier");
  PXSimpleIndexPathFromIndexPath();

  v9 = (void *)objc_msgSend(v8, "initWithSectionObject:itemObject:subitemObject:indexPath:", 0, v7, 0, v12);
  objc_msgSend(a1, "indexPathForObjectReference:", v9);
  PXIndexPathFromSimpleIndexPath();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
