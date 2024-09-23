@implementation PXMemoryCustomUserAssetsEdit

- (PXMemoryCustomUserAssetsEdit)initWithAssets:(id)a3
{
  id v5;
  PXMemoryCustomUserAssetsEdit *v6;
  PXMemoryCustomUserAssetsEdit *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXMemoryCustomUserAssetsEdit;
  v6 = -[PXMemoryCustomUserAssetsEdit init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_assets, a3);

  return v7;
}

- (PXDisplayAssetFetchResult)assets
{
  return self->_assets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assets, 0);
}

@end
