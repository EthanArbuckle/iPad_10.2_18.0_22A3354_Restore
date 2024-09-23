@implementation PXFeedDummyItemLayoutFactory

- (id)createLayoutForFeedItemAtIndexPath:(PXSimpleIndexPath *)a3 inDataSource:(id)a4 viewModel:(id)a5 initialReferenceSize:(CGSize)a6 thumbnailAsset:(id *)a7
{
  id v8;
  PXFeedDummyItemLayout *v9;
  __int128 v10;
  void *v11;
  _OWORD v13[2];

  v8 = a4;
  v9 = objc_alloc_init(PXFeedDummyItemLayout);
  v10 = *(_OWORD *)&a3->item;
  v13[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v13[1] = v10;
  objc_msgSend(v8, "objectAtIndexPath:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXFeedDummyItemLayout setRepresentedObject:](v9, "setRepresentedObject:", v11);
  return v9;
}

@end
