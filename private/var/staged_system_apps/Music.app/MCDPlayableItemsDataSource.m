@implementation MCDPlayableItemsDataSource

- (id)requestItemProperties
{
  return objc_msgSend((id)objc_opt_class(self, a2), "requiredPropertiesForSongs");
}

+ (id)requiredPropertiesForSongs
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v13;
  _QWORD v14[4];
  _QWORD v15[4];
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[4];

  v2 = objc_alloc((Class)MPPropertySet);
  v18[0] = MPModelPropertySongExplicit;
  v18[1] = MPModelPropertySongCloudStatus;
  v18[2] = MPModelPropertySongHasVideo;
  v18[3] = MPModelPropertySongTraits;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 4));
  v16[0] = MPModelRelationshipSongLocalFileAsset;
  v15[0] = MPModelPropertyFileAssetProtectionType;
  v15[1] = MPModelPropertyFileAssetNonPurgeable;
  v15[2] = MPModelPropertyFileAssetFilePath;
  v15[3] = MPModelPropertyFileAssetTraits;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v4));
  v17[0] = v5;
  v16[1] = MPModelRelationshipSongStoreAsset;
  v14[0] = MPModelPropertyStoreAssetRedownloadable;
  v14[1] = MPModelPropertyStoreAssetEndpointType;
  v14[2] = MPModelPropertyStoreAssetSubscriptionRequired;
  v14[3] = MPModelPropertyStoreAssetNeedsUserUpload;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v6));
  v17[1] = v7;
  v16[2] = MPModelRelationshipSongHomeSharingAsset;
  v13 = MPModelPropertyHomeSharingAssetAvailable;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v8));
  v17[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 3));
  v11 = objc_msgSend(v2, "initWithProperties:relationships:", v3, v10);

  return v11;
}

+ (id)requiredPlaylistEntryPropertiesForModelClass:(Class)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class requiredLibraryAddStatusObservationProperties](a3, "requiredLibraryAddStatusObservationProperties"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "propertySetByCombiningWithPropertySet:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class requiredLibraryRemovalProperties](a3, "requiredLibraryRemovalProperties"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "propertySetByCombiningWithPropertySet:", v8));

  if ((Class)objc_opt_class(MPModelSong, v10) == a3)
  {
    v12 = objc_msgSend((id)objc_opt_class(a1, v11), "requiredPropertiesForSongs");
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "propertySetByCombiningWithPropertySet:", v13));

    v9 = (void *)v14;
  }
  return v9;
}

@end
