@implementation MCDPlaylistAddedDataSource

- (id)requestSectionProperties
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v12 = MPModelRelationshipGenericPlaylist;
  v11 = MPModelPropertyPlaylistLibraryAdded;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2));
  v13 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));

  v5 = objc_alloc((Class)MPPropertySet);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelPlaylist requiredLibraryAddStatusObservationProperties](MPModelPlaylist, "requiredLibraryAddStatusObservationProperties"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "properties"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));
  v9 = objc_msgSend(v5, "initWithProperties:relationships:", v8, v4);

  return v9;
}

- (BOOL)wantsDetailedKeepLocalRequestableResponse
{
  return 1;
}

- (id)storeIDs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCDPlaylistTracksDataSource playlist](self, "playlist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "identifiers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "universalStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "globalPlaylistID"));

  if (v5)
  {
    v8 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
