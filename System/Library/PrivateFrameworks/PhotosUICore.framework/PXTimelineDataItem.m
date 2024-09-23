@implementation PXTimelineDataItem

- (PXTimelineDataItem)initWithAssetCollection:(id)a3 suggestedCrop:(id)a4
{
  id v7;
  id v8;
  PXTimelineDataItem *v9;
  PXTimelineDataItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXTimelineDataItem;
  v9 = -[PXTimelineDataItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetCollection, a3);
    objc_storeStrong((id *)&v10->_suggestedCrop, a4);
  }

  return v10;
}

- (PXTimelineCrop)suggestedCrop
{
  return self->_suggestedCrop;
}

- (void)setSuggestedCrop:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedCrop, a3);
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (void)setAssetCollection:(id)a3
{
  objc_storeStrong((id *)&self->_assetCollection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_suggestedCrop, 0);
}

@end
