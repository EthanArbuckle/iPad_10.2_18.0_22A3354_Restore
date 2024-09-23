@implementation MCDPlaylistTracksDataSource

- (MCDPlaylistTracksDataSource)initWithLimitedUI:(BOOL)a3 playlist:(id)a4
{
  _BOOL8 v5;
  id v7;
  MCDPlaylistTracksDataSource *v8;
  MCDPlaylistTracksDataSource *v9;
  objc_super v11;

  v5 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MCDPlaylistTracksDataSource;
  v8 = -[_MCDLibraryDataSource initWithLimitedUI:](&v11, "initWithLimitedUI:", v5);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_playlist, a4);

  return v9;
}

- (Class)requestItemClass
{
  return (Class)objc_opt_class(MPModelPlaylistEntry, a2);
}

- (id)requestItemKind
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](MPModelSong, "kindWithVariants:", 1));
  v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelPlaylistEntry kindWithKinds:](MPModelPlaylistEntry, "kindWithKinds:", v3));

  return v4;
}

- (id)requestLabel
{
  return CFSTR("Playlist Detail CarPlay View Controller");
}

- (id)requestItemProperties
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
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[9];

  v2 = objc_alloc((Class)MPPropertySet);
  v34[0] = MPModelPropertySongTitle;
  v34[1] = MPModelPropertySongDuration;
  v34[2] = MPModelPropertySongArtwork;
  v34[3] = MPModelPropertySongExplicit;
  v34[4] = MPModelPropertySongIsFavorite;
  v34[5] = MPModelPropertySongIsDisliked;
  v34[6] = MPModelPropertySongLibraryAdded;
  v34[7] = MPModelPropertySongShouldShowComposer;
  v34[8] = MPModelPropertySongArtistUploadedContent;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 9));
  v32[0] = MPModelRelationshipSongArtist;
  v31 = MPModelPropertyArtistName;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v4));
  v33[0] = v5;
  v32[1] = MPModelRelationshipSongAlbum;
  v30 = MPModelPropertyAlbumTitle;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v6));
  v33[1] = v7;
  v32[2] = MPModelRelationshipSongComposer;
  v29 = MPModelPropertyComposerName;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v8));
  v33[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 3));
  v11 = objc_msgSend(v2, "initWithProperties:relationships:", v3, v10);

  v12 = (void *)objc_opt_class(self);
  v13 = objc_msgSend(v12, "requiredPlaylistEntryPropertiesForModelClass:", objc_opt_class(MPModelSong));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "propertySetByCombiningWithPropertySet:", v14));

  v28[0] = v15;
  v27[0] = MPModelRelationshipPlaylistEntrySong;
  v27[1] = MPModelRelationshipPlaylistEntrySocialContributor;
  v26[0] = MPModelPropertySocialPersonName;
  v26[1] = MPModelPropertySocialPersonArtwork;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 2));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v16));
  v28[1] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 2));

  v19 = objc_msgSend(objc_alloc((Class)MPPropertySet), "initWithProperties:relationships:", 0, v18);
  v20 = (void *)objc_opt_class(self);
  v21 = objc_msgSend(v20, "requiredPlaylistEntryPropertiesForModelClass:", objc_opt_class(MPModelPlaylistEntry));
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "propertySetByCombiningWithPropertySet:", v22));

  return v23;
}

- (id)itemSortDescriptors
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCDPlaylistTracksDataSource playlist](self, "playlist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "preferredTracklistSortDescriptors"));

  return v3;
}

- (id)scopedContainers
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCDPlaylistTracksDataSource playlist](self, "playlist"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return v3;
}

- (MPModelPlaylist)playlist
{
  return self->_playlist;
}

- (void)setPlaylist:(id)a3
{
  objc_storeStrong((id *)&self->_playlist, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playlist, 0);
}

@end
