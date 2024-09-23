@implementation MCDAlbumTracksDataSource

- (MCDAlbumTracksDataSource)initWithLimitedUI:(BOOL)a3 album:(id)a4 storeContent:(BOOL)a5
{
  _BOOL8 v7;
  id v9;
  MCDAlbumTracksDataSource *v10;
  MCDAlbumTracksDataSource *v11;

  v7 = a3;
  v9 = a4;
  v10 = -[_MCDLibraryDataSource initWithLimitedUI:](self, "initWithLimitedUI:", v7);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_album, a4);
    v11->_storeContent = a5;
  }

  return v11;
}

- (id)requestItemKind
{
  return +[MPModelSong kindWithVariants:](MPModelSong, "kindWithVariants:", 1);
}

- (id)requestSectionKind
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksDataSource requestItemKind](self, "requestItemKind"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelAlbum kindWithSongKind:](MPModelAlbum, "kindWithSongKind:", v2));

  return v3;
}

- (id)requestLabel
{
  return CFSTR("Albums Detail CarPlay View Controller");
}

- (id)itemSortDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", MPModelPropertySongDiscNumber, 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", MPModelPropertySongTrackNumber, 1, v2));
  v7[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", MPModelPropertySongTitle, 1));
  v7[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 3));

  return v5;
}

- (id)requestItemProperties
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[8];

  v3 = objc_alloc((Class)MPPropertySet);
  v11[0] = MPModelPropertySongTitle;
  v11[1] = MPModelPropertySongArtwork;
  v11[2] = MPModelPropertySongTrackNumber;
  v11[3] = MPModelPropertySongExplicit;
  v11[4] = MPModelPropertySongIsFavorite;
  v11[5] = MPModelPropertySongIsDisliked;
  v11[6] = MPModelPropertySongDuration;
  v11[7] = MPModelPropertySongArtistUploadedContent;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 8));
  v5 = objc_msgSend(v3, "initWithProperties:relationships:", v4, 0);

  v10.receiver = self;
  v10.super_class = (Class)MCDAlbumTracksDataSource;
  v6 = -[MCDPlayableItemsDataSource requestItemProperties](&v10, "requestItemProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "propertySetByCombiningWithPropertySet:", v5));

  return v8;
}

- (id)requestSectionProperties
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _QWORD v17[8];
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v19 = MPModelRelationshipAlbumArtist;
  v18 = MPModelPropertyArtistName;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v3));
  v20 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));

  v6 = objc_alloc((Class)MPPropertySet);
  v17[0] = MPModelPropertyAlbumTitle;
  v17[1] = MPModelPropertyAlbumIsFavorite;
  v17[2] = MPModelPropertyAlbumIsDisliked;
  v17[3] = MPModelPropertyAlbumIsCompilation;
  v17[4] = MPModelPropertyAlbumArtwork;
  v17[5] = MPModelPropertyAlbumTrackCount;
  v17[6] = MPModelPropertyAlbumYear;
  v17[7] = MPModelPropertyAlbumSongPopularity;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 8));
  v8 = objc_msgSend(v6, "initWithProperties:relationships:", v7, v5);

  if (-[MCDAlbumTracksDataSource storeContent](self, "storeContent"))
  {
    v15 = MPModelStoreBrowseContentItemRelationshipAlbum;
    v16 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    v10 = objc_alloc((Class)MPPropertySet);
    v14 = MPModelStoreBrowseContentItemPropertyItemType;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
    v12 = objc_msgSend(v10, "initWithProperties:relationships:", v11, v9);

  }
  else
  {
    v12 = v8;
  }

  return v12;
}

- (id)scopedContainers
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksDataSource album](self, "album"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return v3;
}

- (id)allowedSectionIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksDataSource album](self, "album"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "identifiers"));
  v6 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));

  return v4;
}

- (id)requestIdentifierSet
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksDataSource album](self, "album"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "identifiers"));

  return v3;
}

- (MPModelAlbum)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
  objc_storeStrong((id *)&self->_album, a3);
}

- (BOOL)storeContent
{
  return self->_storeContent;
}

- (void)setStoreContent:(BOOL)a3
{
  self->_storeContent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_album, 0);
}

@end
