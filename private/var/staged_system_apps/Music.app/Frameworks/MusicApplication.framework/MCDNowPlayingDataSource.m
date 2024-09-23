@implementation MCDNowPlayingDataSource

- (id)queueSectionProperties
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[3];
  _QWORD v13[2];
  uint64_t v14;
  _QWORD v15[3];
  _QWORD v16[3];

  v2 = objc_alloc((Class)MPPropertySet);
  v15[0] = MPModelRelationshipGenericAlbum;
  v14 = MPModelPropertyAlbumTitle;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v3));
  v16[0] = v4;
  v15[1] = MPModelRelationshipGenericPlaylist;
  v13[0] = MPModelPropertyPlaylistName;
  v13[1] = MPModelPropertyPlaylistCollaboratorStatus;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v5));
  v16[1] = v6;
  v15[2] = MPModelRelationshipGenericRadioStation;
  v12[0] = MPModelPropertyRadioStationName;
  v12[1] = MPModelPropertyRadioStationType;
  v12[2] = MPModelPropertyRadioStationAttributionLabel;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v7));
  v16[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 3));
  v10 = objc_msgSend(v2, "initWithProperties:relationships:", 0, v9);

  return v10;
}

- (id)_propertySet
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  _QWORD v26[2];
  _QWORD v27[2];
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[2];
  uint64_t v33;
  _QWORD v34[3];
  _QWORD v35[3];
  _QWORD v36[11];

  v21 = objc_alloc((Class)MPPropertySet);
  v36[0] = MPModelPropertySongTitle;
  v36[1] = MPModelPropertySongExplicit;
  v36[2] = MPModelPropertySongIsFavorite;
  v36[3] = MPModelPropertySongIsDisliked;
  v36[4] = MPModelPropertySongArtwork;
  v36[5] = MPModelPropertySongDuration;
  v36[6] = MPModelPropertySongHasVideo;
  v36[7] = MPModelPropertySongLibraryAdded;
  v36[8] = MPModelPropertySongLibraryAddEligible;
  v36[9] = MPModelPropertySongShouldShowComposer;
  v36[10] = MPModelPropertySongArtistUploadedContent;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 11));
  v34[0] = MPModelRelationshipSongComposer;
  v33 = MPModelPropertyComposerName;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v23));
  v35[0] = v22;
  v34[1] = MPModelRelationshipSongAlbum;
  v2 = objc_alloc((Class)MPPropertySet);
  v32[0] = MPModelPropertyAlbumTitle;
  v32[1] = MPModelPropertyAlbumLibraryAdded;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 2));
  v30 = MPModelRelationshipAlbumArtist;
  v4 = MPModelPropertyArtistName;
  v29 = MPModelPropertyArtistName;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v5));
  v31 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
  v8 = objc_msgSend(v2, "initWithProperties:relationships:", v3, v7);
  v35[1] = v8;
  v34[2] = MPModelRelationshipSongArtist;
  v28 = v4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v9));
  v35[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v35, v34, 3));
  v12 = objc_msgSend(v21, "initWithProperties:relationships:", v20, v11);

  v13 = objc_alloc((Class)MPPropertySet);
  v27[0] = v12;
  v26[0] = MPModelRelationshipGenericSong;
  v26[1] = MPModelRelationshipGenericPlaylistEntry;
  v14 = objc_alloc((Class)MPPropertySet);
  v24 = MPModelRelationshipPlaylistEntrySong;
  v25 = v12;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
  v16 = objc_msgSend(v14, "initWithProperties:relationships:", &__NSArray0__struct, v15);
  v27[1] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 2));
  v18 = objc_msgSend(v13, "initWithProperties:relationships:", 0, v17);

  return v18;
}

- (id)requestLabel
{
  return CFSTR("CarPlay Now Playing Request");
}

@end
