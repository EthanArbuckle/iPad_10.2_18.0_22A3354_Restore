@implementation MCDFuseDataSource

- (double)timeoutInterval
{
  return 20.0;
}

- (MPPropertySet)sectionProperties
{
  return (MPPropertySet *)+[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
}

- (MPPropertySet)itemProperties
{
  return (MPPropertySet *)+[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
}

- (MPPropertySet)albumProperties
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[8];

  v2 = objc_alloc((Class)MPPropertySet);
  v15[0] = MPModelPropertyAlbumTitle;
  v15[1] = MPModelPropertyAlbumIsFavorite;
  v15[2] = MPModelPropertyAlbumIsDisliked;
  v15[3] = MPModelPropertyAlbumIsClassical;
  v15[4] = MPModelPropertyAlbumArtwork;
  v15[5] = MPModelPropertyAlbumSongPopularity;
  v15[6] = MPModelPropertyAlbumLibraryAddEligible;
  v15[7] = MPModelPropertyAlbumIsCompilation;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 8));
  v13[0] = MPModelRelationshipAlbumArtist;
  v12 = MPModelPropertyArtistName;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v4));
  v14[0] = v5;
  v13[1] = MPModelRelationshipAlbumGenre;
  v11 = MPModelPropertyGenreName;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v6));
  v14[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 2));
  v9 = objc_msgSend(v2, "initWithProperties:relationships:", v3, v8);

  return (MPPropertySet *)v9;
}

- (MPPropertySet)songProperties
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[6];

  v2 = objc_alloc((Class)MPPropertySet);
  v23[0] = MPModelPropertySongTitle;
  v23[1] = MPModelPropertySongExplicit;
  v23[2] = MPModelPropertySongIsFavorite;
  v23[3] = MPModelPropertySongIsDisliked;
  v23[4] = MPModelPropertySongArtwork;
  v23[5] = MPModelPropertySongShouldShowComposer;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 6));
  v21[0] = MPModelRelationshipSongAlbum;
  v3 = objc_alloc((Class)MPPropertySet);
  v20[0] = MPModelPropertyAlbumTitle;
  v20[1] = MPModelPropertyAlbumIsFavorite;
  v20[2] = MPModelPropertyAlbumIsDisliked;
  v20[3] = MPModelPropertyAlbumReleaseDateComponents;
  v20[4] = MPModelPropertyAlbumYear;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 5));
  v18 = MPModelRelationshipAlbumArtist;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", &__NSArray0__struct));
  v19 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
  v6 = objc_msgSend(v3, "initWithProperties:relationships:", v14, v5);
  v22[0] = v6;
  v21[1] = MPModelRelationshipSongArtist;
  v17 = MPModelPropertyArtistName;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v7));
  v22[1] = v8;
  v21[2] = MPModelRelationshipSongComposer;
  v16 = MPModelPropertyComposerName;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v9));
  v22[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 3));
  v12 = objc_msgSend(v2, "initWithProperties:relationships:", v15, v11);

  return (MPPropertySet *)v12;
}

- (MPPropertySet)playlistProperties
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[12];

  v2 = objc_alloc((Class)MPPropertySet);
  v12[0] = MPModelPropertyPlaylistName;
  v12[1] = MPModelPropertyPlaylistArtwork;
  v12[2] = MPModelPropertyPlaylistEditorialArtwork;
  v12[3] = MPModelPropertyPlaylistTracksTiledArtwork;
  v12[4] = MPModelPropertyPlaylistType;
  v12[5] = MPModelPropertyPlaylistCuratorPlaylist;
  v12[6] = MPModelPropertyPlaylistIsFavorite;
  v12[7] = MPModelPropertyPlaylistIsDisliked;
  v12[8] = MPModelPropertyPlaylistPublicPlaylist;
  v12[9] = MPModelPropertyPlaylistVisiblePlaylist;
  v12[10] = MPModelPropertyPlaylistLastModifiedDateComponents;
  v12[11] = MPModelPropertyPlaylistLibraryAdded;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 12));
  v10 = MPModelRelationshipPlaylistCurator;
  v9 = MPModelPropertyCuratorName;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v4));
  v11 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  v7 = objc_msgSend(v2, "initWithProperties:relationships:", v3, v6);

  return (MPPropertySet *)v7;
}

- (MPPropertySet)curatorProperties
{
  void *v2;
  void *v3;
  _QWORD v5[4];

  v5[0] = MPModelPropertyCuratorName;
  v5[1] = MPModelPropertyCuratorShortName;
  v5[2] = MPModelPropertyCuratorKind;
  v5[3] = MPModelPropertyCuratorEditorialArtwork;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 4));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2));

  return (MPPropertySet *)v3;
}

- (MPPropertySet)radioStationProperties
{
  void *v2;
  void *v3;
  _QWORD v5[7];

  v5[0] = MPModelPropertyRadioStationBeats1;
  v5[1] = MPModelPropertyRadioStationSubtype;
  v5[2] = MPModelPropertyRadioStationName;
  v5[3] = MPModelPropertyRadioStationEditorNotes;
  v5[4] = MPModelPropertyRadioStationShortEditorNotes;
  v5[5] = MPModelPropertyRadioStationArtwork;
  v5[6] = MPModelPropertyRadioStationGlyph;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 7));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2));

  return (MPPropertySet *)v3;
}

@end
