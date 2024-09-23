@implementation PXSharedLibrarySharingSuggestionsFeedItemLayoutFactory

- (id)createLayoutForFeedItemAtIndexPath:(PXSimpleIndexPath *)a3 inDataSource:(id)a4 viewModel:(id)a5 initialReferenceSize:(CGSize)a6 thumbnailAsset:(id *)a7
{
  id v10;
  id v11;
  PXSharedLibrarySharingSuggestionLayout *v12;
  void *v13;
  __int128 v14;
  _OWORD v16[2];

  v10 = a5;
  v11 = a4;
  v12 = objc_alloc_init(PXSharedLibrarySharingSuggestionLayout);
  objc_msgSend(v10, "spec");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "itemCornerRadius");
  -[PXSharedLibrarySharingSuggestionLayout setCornerRadius:](v12, "setCornerRadius:");

  v14 = *(_OWORD *)&a3->item;
  v16[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v16[1] = v14;
  -[PXSharedLibrarySharingSuggestionsFeedItemLayoutFactory _configureLayout:indexPath:inDataSource:](self, "_configureLayout:indexPath:inDataSource:", v12, v16, v11);

  return v12;
}

- (void)configureItemLayout:(id)a3 forChangedItemFromIndexPath:(PXSimpleIndexPath *)a4 inDataSource:(id)a5 toIndexPath:(PXSimpleIndexPath *)a6 inDataSource:(id)a7
{
  __int128 v7;
  _OWORD v8[2];

  v7 = *(_OWORD *)&a6->item;
  v8[0] = *(_OWORD *)&a6->dataSourceIdentifier;
  v8[1] = v7;
  -[PXSharedLibrarySharingSuggestionsFeedItemLayoutFactory _configureLayout:indexPath:inDataSource:](self, "_configureLayout:indexPath:inDataSource:", a3, v8, a7);
}

- (void)_configureLayout:(id)a3 indexPath:(PXSimpleIndexPath *)a4 inDataSource:(id)a5
{
  __int128 v6;
  id v7;
  void *v8;
  __int128 v9;
  __int128 v10;

  v6 = *(_OWORD *)&a4->item;
  v9 = *(_OWORD *)&a4->dataSourceIdentifier;
  v10 = v6;
  v7 = a3;
  objc_msgSend(a5, "objectAtIndexPath:", &v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSharingSuggestion:", v8, v9, v10);

}

@end
