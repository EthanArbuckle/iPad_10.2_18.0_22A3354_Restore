@implementation MCDRecentlyAddedDataSource

- (id)requestItemKind
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[2];

  v12[0] = MPModelRelationshipGenericAlbum;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](MPModelSong, "kindWithVariants:", 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelAlbum kindWithSongKind:](MPModelAlbum, "kindWithSongKind:", v2));
  v13[0] = v3;
  v12[1] = MPModelRelationshipGenericPlaylist;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](MPModelSong, "kindWithVariants:", 1));
  v11 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelPlaylistEntry kindWithKinds:](MPModelPlaylistEntry, "kindWithKinds:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelPlaylist kindWithPlaylistEntryKind:options:](MPModelPlaylist, "kindWithPlaylistEntryKind:options:", v6, 4));
  v13[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelGenericObject kindWithRelationshipKinds:](MPModelGenericObject, "kindWithRelationshipKinds:", v8));

  return v9;
}

- (id)requestLabel
{
  return CFSTR("Recently Added CarPlay View Controller");
}

- (id)requestItemProperties
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[2];
  _QWORD v19[2];
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[8];
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[7];

  v28[0] = MPModelPropertyAlbumTitle;
  v28[1] = MPModelPropertyAlbumIsFavorite;
  v28[2] = MPModelPropertyAlbumIsDisliked;
  v28[3] = MPModelPropertyAlbumArtwork;
  v28[4] = MPModelPropertyAlbumIsCompilation;
  v28[5] = MPModelPropertyAlbumTrackCount;
  v28[6] = MPModelPropertyAlbumSongPopularity;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 7));
  v26[0] = MPModelRelationshipAlbumArtist;
  v25 = MPModelPropertyArtistName;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v3));
  v27[0] = v4;
  v26[1] = MPModelRelationshipAlbumRepresentativeSong;
  v24 = MPModelPropertySongTitle;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v5));
  v27[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 2));

  v8 = objc_msgSend(objc_alloc((Class)MPPropertySet), "initWithProperties:relationships:", v2, v7);
  v23[0] = MPModelPropertyPlaylistName;
  v23[1] = MPModelPropertyPlaylistIsFavorite;
  v23[2] = MPModelPropertyPlaylistIsDisliked;
  v23[3] = MPModelPropertyPlaylistArtwork;
  v23[4] = MPModelPropertyPlaylistType;
  v23[5] = MPModelPropertyPlaylistTracksTiledArtwork;
  v23[6] = MPModelPropertyPlaylistLastModifiedDateComponents;
  v23[7] = MPModelPropertyPlaylistLibraryAdded;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 8));
  v21 = MPModelRelationshipPlaylistCurator;
  v20 = MPModelPropertyCuratorName;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v10));
  v22 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));

  v13 = objc_msgSend(objc_alloc((Class)MPPropertySet), "initWithProperties:relationships:", v9, v12);
  v14 = objc_alloc((Class)MPPropertySet);
  v18[0] = MPModelRelationshipGenericAlbum;
  v18[1] = MPModelRelationshipGenericPlaylist;
  v19[0] = v8;
  v19[1] = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 2));
  v16 = objc_msgSend(v14, "initWithProperties:relationships:", 0, v15);

  return v16;
}

- (id)itemSortDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[2];
  void *v8;

  v6[0] = MPModelRelationshipGenericAlbum;
  v6[1] = MPModelRelationshipGenericPlaylist;
  v7[0] = MPModelPropertyAlbumLibraryAddedDate;
  v7[1] = MPModelPropertyPlaylistLibraryAddedDate;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPMultiSortDescriptor sortDescriptorWithRelatedProperties:ascending:](MPMultiSortDescriptor, "sortDescriptorWithRelatedProperties:ascending:", v2, 0));
  v8 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));

  return v4;
}

- (_NSRange)contentRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = 0;
  v3 = 20;
  result.length = v3;
  result.location = v2;
  return result;
}

@end
