@implementation MCDAlbumsDataSource

- (MCDAlbumsDataSource)initWithLimitedUI:(BOOL)a3 person:(id)a4
{
  _BOOL8 v5;
  id v7;
  MCDAlbumsDataSource *v8;
  MCDAlbumsDataSource *v9;
  objc_super v11;

  v5 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MCDAlbumsDataSource;
  v8 = -[_MCDLibraryDataSource initWithLimitedUI:](&v11, "initWithLimitedUI:", v5);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_person, a4);

  return v9;
}

- (MCDAlbumsDataSource)initWithLimitedUI:(BOOL)a3 genre:(id)a4
{
  _BOOL8 v5;
  id v7;
  MCDAlbumsDataSource *v8;
  MCDAlbumsDataSource *v9;
  objc_super v11;

  v5 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MCDAlbumsDataSource;
  v8 = -[_MCDLibraryDataSource initWithLimitedUI:](&v11, "initWithLimitedUI:", v5);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_genre, a4);

  return v9;
}

- (id)requestItemKind
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](MPModelSong, "kindWithVariants:", 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelAlbum kindWithSongKind:](MPModelAlbum, "kindWithSongKind:", v2));

  return v3;
}

- (id)requestLabel
{
  return CFSTR("Albums CarPlay View Controller");
}

- (id)requestItemProperties
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v11 = MPModelRelationshipAlbumArtist;
  v10 = MPModelPropertyArtistName;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2));
  v12 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));

  v5 = objc_alloc((Class)MPPropertySet);
  v9[0] = MPModelPropertyAlbumTitle;
  v9[1] = MPModelPropertyAlbumIsFavorite;
  v9[2] = MPModelPropertyAlbumIsDisliked;
  v9[3] = MPModelPropertyAlbumIsCompilation;
  v9[4] = MPModelPropertyAlbumArtwork;
  v9[5] = MPModelPropertyAlbumTrackCount;
  v9[6] = MPModelPropertyAlbumYear;
  v9[7] = MPModelPropertyAlbumSongPopularity;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 8));
  v7 = objc_msgSend(v5, "initWithProperties:relationships:", v6, v4);

  return v7;
}

- (id)itemSortDescriptors
{
  void *v3;
  id MCDSortByRecentlyPlayed_1;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  unsigned int v12;
  void *v13;
  _QWORD *v15;
  void *v16;
  unsigned int v17;
  int v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[2];
  uint64_t v35;
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  void *v39;
  void *v40;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDLibraryDataSource sortingPreference](self, "sortingPreference"));
  if (-[_MCDLibraryDataSource limitedUI](self, "limitedUI"))
  {
    MCDSortByRecentlyPlayed_1 = getMCDSortByRecentlyPlayed_1();
    v5 = objc_claimAutoreleasedReturnValue(MCDSortByRecentlyPlayed_1);

    v3 = (void *)v5;
  }
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v6 = (_QWORD *)getMCDSortByRecentlyAddedSymbolLoc_ptr_1;
  v32 = getMCDSortByRecentlyAddedSymbolLoc_ptr_1;
  if (!getMCDSortByRecentlyAddedSymbolLoc_ptr_1)
  {
    v7 = (void *)MusicCarDisplayUILibrary_12();
    v6 = dlsym(v7, "MCDSortByRecentlyAdded");
    v30[3] = (uint64_t)v6;
    getMCDSortByRecentlyAddedSymbolLoc_ptr_1 = (uint64_t)v6;
  }
  _Block_object_dispose(&v29, 8);
  if (!v6)
    goto LABEL_32;
  if (objc_msgSend(v3, "isEqualToString:", *v6))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", MPModelPropertyAlbumLibraryAddedDate, 0));
    v40 = v8;
    v9 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v40, 1));
LABEL_10:
    v13 = (void *)v9;
    goto LABEL_11;
  }
  v10 = getMCDSortByRecentlyPlayed_1();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = objc_msgSend(v3, "isEqualToString:", v11);

  if (v12)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", MPModelPropertyAlbumLastDevicePlaybackDate, 0));
    v39 = v8;
    v9 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v39, 1));
    goto LABEL_10;
  }
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v15 = (_QWORD *)getMCDSortByArtistSymbolLoc_ptr_1;
  v32 = getMCDSortByArtistSymbolLoc_ptr_1;
  if (!getMCDSortByArtistSymbolLoc_ptr_1)
  {
    v16 = (void *)MusicCarDisplayUILibrary_12();
    v15 = dlsym(v16, "MCDSortByArtist");
    v30[3] = (uint64_t)v15;
    getMCDSortByArtistSymbolLoc_ptr_1 = (uint64_t)v15;
  }
  _Block_object_dispose(&v29, 8);
  if (!v15)
    goto LABEL_32;
  v17 = objc_msgSend(v3, "isEqualToString:", *v15);
  if (v3)
    v18 = v17;
  else
    v18 = 1;
  if (v18 == 1)
  {
    v37[0] = MPModelRelationshipAlbumArtist;
    v37[1] = MPModelPropertyArtistName;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 2));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSortDescriptor sortDescriptorWithKeyPath:ascending:](MPModelSortDescriptor, "sortDescriptorWithKeyPath:ascending:", v8, 1));
    v38[0] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", MPModelPropertyAlbumTitle, 1));
    v38[1] = v20;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 2));

    goto LABEL_11;
  }
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v21 = (_QWORD *)getMCDSortByReleaseDateAscendingSymbolLoc_ptr;
  v32 = getMCDSortByReleaseDateAscendingSymbolLoc_ptr;
  if (!getMCDSortByReleaseDateAscendingSymbolLoc_ptr)
  {
    v22 = (void *)MusicCarDisplayUILibrary_12();
    v21 = dlsym(v22, "MCDSortByReleaseDateAscending");
    v30[3] = (uint64_t)v21;
    getMCDSortByReleaseDateAscendingSymbolLoc_ptr = (uint64_t)v21;
  }
  _Block_object_dispose(&v29, 8);
  if (!v21)
    goto LABEL_32;
  if (objc_msgSend(v3, "isEqualToString:", *v21))
  {
    v35 = MPModelPropertyAlbumReleaseDateComponents;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v35, 1));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSortDescriptor sortDescriptorWithKeyPath:ascending:](MPModelSortDescriptor, "sortDescriptorWithKeyPath:ascending:", v8, 1));
    v36[0] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", MPModelPropertyAlbumTitle, 1));
    v36[1] = v24;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 2));

    goto LABEL_11;
  }
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v25 = (_QWORD *)getMCDSortByReleaseDateDescendingSymbolLoc_ptr;
  v32 = getMCDSortByReleaseDateDescendingSymbolLoc_ptr;
  if (!getMCDSortByReleaseDateDescendingSymbolLoc_ptr)
  {
    v26 = (void *)MusicCarDisplayUILibrary_12();
    v25 = dlsym(v26, "MCDSortByReleaseDateDescending");
    v30[3] = (uint64_t)v25;
    getMCDSortByReleaseDateDescendingSymbolLoc_ptr = (uint64_t)v25;
  }
  _Block_object_dispose(&v29, 8);
  if (!v25)
  {
LABEL_32:
    soft_MCDMusicGeneralLogging_cold_1();
    __break(1u);
  }
  if (!objc_msgSend(v3, "isEqualToString:", *v25))
  {
    v13 = 0;
    goto LABEL_12;
  }
  v33 = MPModelPropertyAlbumReleaseDateComponents;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSortDescriptor sortDescriptorWithKeyPath:ascending:](MPModelSortDescriptor, "sortDescriptorWithKeyPath:ascending:", v8, 0));
  v34[0] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", MPModelPropertyAlbumTitle, 1));
  v34[1] = v28;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 2));

LABEL_11:
LABEL_12:

  return v13;
}

- (id)scopedContainers
{
  void *v3;
  void *v4;
  void **v5;
  void *v6;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumsDataSource person](self, "person"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumsDataSource person](self, "person"));
    v9 = v4;
    v5 = &v9;
LABEL_5:
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 1));

    return v6;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumsDataSource genre](self, "genre"));

  if (v6)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumsDataSource genre](self, "genre"));
    v8 = v4;
    v5 = &v8;
    goto LABEL_5;
  }
  return v6;
}

- (id)containerObject
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumsDataSource scopedContainers](self, "scopedContainers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  return v3;
}

- (unint64_t)favoriteFilteringOptions
{
  return 0x1000000;
}

- (MPModelPerson)person
{
  return self->_person;
}

- (MPModelGenre)genre
{
  return self->_genre;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

@end
