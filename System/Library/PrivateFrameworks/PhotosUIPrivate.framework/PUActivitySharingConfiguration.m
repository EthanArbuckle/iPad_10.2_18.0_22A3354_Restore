@implementation PUActivitySharingConfiguration

- (PUActivitySharingConfiguration)initWithCollectionsFetchResult:(id)a3 selectionManager:(id)a4
{
  id v8;
  id v9;
  void *v10;
  PUActivitySharingConfiguration *v11;
  PUActivitySharingConfiguration *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivitySharingConfiguration.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("collectionListFetchResult"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivitySharingConfiguration.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("selectionManager"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)PUActivitySharingConfiguration;
  v11 = -[PUActivitySharingConfiguration init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_collectionListFetchResult, a3);
    objc_storeStrong((id *)&v12->_selectionManager, a4);
  }

  return v12;
}

- (PHFetchResult)collectionListFetchResult
{
  return self->_collectionListFetchResult;
}

- (PUPhotoSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (PXPhotosDataSource)photosDataSource
{
  return self->_photosDataSource;
}

- (void)setPhotosDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_photosDataSource, a3);
}

- (NSDictionary)assetsFetchResultsByAssetCollection
{
  return self->_assetsFetchResultsByAssetCollection;
}

- (void)setAssetsFetchResultsByAssetCollection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)activities
{
  return self->_activities;
}

- (void)setActivities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)excludedActivityTypes
{
  return self->_excludedActivityTypes;
}

- (void)setExcludedActivityTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)allowsAirPlayActivity
{
  return self->_allowsAirPlayActivity;
}

- (void)setAllowsAirPlayActivity:(BOOL)a3
{
  self->_allowsAirPlayActivity = a3;
}

- (BOOL)allowsSuggestLessPersonActivity
{
  return self->_allowsSuggestLessPersonActivity;
}

- (void)setAllowsSuggestLessPersonActivity:(BOOL)a3
{
  self->_allowsSuggestLessPersonActivity = a3;
}

- (PHPerson)person
{
  return self->_person;
}

- (void)setPerson:(id)a3
{
  objc_storeStrong((id *)&self->_person, a3);
}

- (PHSocialGroup)socialGroup
{
  return self->_socialGroup;
}

- (void)setSocialGroup:(id)a3
{
  objc_storeStrong((id *)&self->_socialGroup, a3);
}

- (BOOL)wantsActionSheet
{
  return self->_wantsActionSheet;
}

- (void)setWantsActionSheet:(BOOL)a3
{
  self->_wantsActionSheet = a3;
}

- (BOOL)excludeShareActivity
{
  return self->_excludeShareActivity;
}

- (void)setExcludeShareActivity:(BOOL)a3
{
  self->_excludeShareActivity = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (PXDisplayAsset)keyAsset
{
  return self->_keyAsset;
}

- (void)setKeyAsset:(id)a3
{
  objc_storeStrong((id *)&self->_keyAsset, a3);
}

- (int64_t)sourceOrigin
{
  return self->_sourceOrigin;
}

- (void)setSourceOrigin:(int64_t)a3
{
  self->_sourceOrigin = a3;
}

- (PHFetchResult)initialAssetsFetchResult
{
  return self->_initialAssetsFetchResult;
}

- (void)setInitialAssetsFetchResult:(id)a3
{
  objc_storeStrong((id *)&self->_initialAssetsFetchResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_socialGroup, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_excludedActivityTypes, 0);
  objc_storeStrong((id *)&self->_activities, 0);
  objc_storeStrong((id *)&self->_assetsFetchResultsByAssetCollection, 0);
  objc_storeStrong((id *)&self->_photosDataSource, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_storeStrong((id *)&self->_collectionListFetchResult, 0);
}

@end
