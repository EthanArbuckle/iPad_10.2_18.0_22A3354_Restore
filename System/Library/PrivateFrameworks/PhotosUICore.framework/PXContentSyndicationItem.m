@implementation PXContentSyndicationItem

- (PXContentSyndicationItem)initWithAssetCollection:(id)a3
{
  id v5;
  PXContentSyndicationItem *v6;
  PXContentSyndicationItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXContentSyndicationItem;
  v6 = -[PXContentSyndicationItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_assetCollection, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PXContentSyndicationItem *v4;
  PXContentSyndicationItem *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = (PXContentSyndicationItem *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PXContentSyndicationItem assetCollection](self, "assetCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXContentSyndicationItem assetCollection](v5, "assetCollection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v6 == v7;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (PXAssetCollectionActionManager)assetCollectionActionManager
{
  return (PXAssetCollectionActionManager *)-[PXAssetCollectionActionManager initWithAssetCollection:displayTitleInfo:]([PXPhotoKitAssetCollectionActionManager alloc], "initWithAssetCollection:displayTitleInfo:", self->_assetCollection, 0);
}

- (PXDisplayAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollection, 0);
}

@end
