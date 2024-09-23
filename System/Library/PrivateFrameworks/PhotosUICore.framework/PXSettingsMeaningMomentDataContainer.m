@implementation PXSettingsMeaningMomentDataContainer

- (PXSettingsMeaningMomentDataContainer)initWithCuratedAssets:(id)a3 assetCollection:(id)a4
{
  id v7;
  id v8;
  PXSettingsMeaningMomentDataContainer *v9;
  PXSettingsMeaningMomentDataContainer *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXSettingsMeaningMomentDataContainer;
  v9 = -[PXSettingsMeaningMomentDataContainer init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_curatedAssets, a3);
    objc_storeStrong((id *)&v10->_assetCollection, a4);
  }

  return v10;
}

- (PHFetchResult)curatedAssets
{
  return self->_curatedAssets;
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_curatedAssets, 0);
}

@end
