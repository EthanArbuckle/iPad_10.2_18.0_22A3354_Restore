@implementation MCDCompilationsDataSource

- (id)requestLabel
{
  return CFSTR("Compilations CarPlay View Controller");
}

- (id)requestItemKind
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](MPModelSong, "kindWithVariants:", 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelAlbum kindWithVariants:songKind:](MPModelAlbum, "kindWithVariants:songKind:", 2, v2));

  return v3;
}

- (BOOL)forceScopingToResponseResults
{
  return 1;
}

- (id)itemSortDescriptors
{
  void *v3;
  id MCDSortByRecentlyPlayed;
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
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];
  _QWORD v24[2];
  void *v25;
  void *v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDLibraryDataSource sortingPreference](self, "sortingPreference"));
  if (-[_MCDLibraryDataSource limitedUI](self, "limitedUI"))
  {
    MCDSortByRecentlyPlayed = getMCDSortByRecentlyPlayed();
    v5 = objc_claimAutoreleasedReturnValue(MCDSortByRecentlyPlayed);

    v3 = (void *)v5;
  }
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v6 = (_QWORD *)getMCDSortByRecentlyAddedSymbolLoc_ptr;
  v22 = getMCDSortByRecentlyAddedSymbolLoc_ptr;
  if (!getMCDSortByRecentlyAddedSymbolLoc_ptr)
  {
    v7 = (void *)MusicCarDisplayUILibrary_4();
    v6 = dlsym(v7, "MCDSortByRecentlyAdded");
    v20[3] = (uint64_t)v6;
    getMCDSortByRecentlyAddedSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v19, 8);
  if (!v6)
    goto LABEL_19;
  if (objc_msgSend(v3, "isEqualToString:", *v6))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", MPModelPropertyAlbumLibraryAddedDate, 0));
    v26 = v8;
    v9 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
LABEL_10:
    v13 = (void *)v9;
    goto LABEL_11;
  }
  v10 = getMCDSortByRecentlyPlayed();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = objc_msgSend(v3, "isEqualToString:", v11);

  if (v12)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", MPModelPropertyAlbumLastDevicePlaybackDate, 0));
    v25 = v8;
    v9 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
    goto LABEL_10;
  }
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v15 = (_QWORD *)getMCDSortByArtistSymbolLoc_ptr;
  v22 = getMCDSortByArtistSymbolLoc_ptr;
  if (!getMCDSortByArtistSymbolLoc_ptr)
  {
    v16 = (void *)MusicCarDisplayUILibrary_4();
    v15 = dlsym(v16, "MCDSortByArtist");
    v20[3] = (uint64_t)v15;
    getMCDSortByArtistSymbolLoc_ptr = (uint64_t)v15;
  }
  _Block_object_dispose(&v19, 8);
  if (!v15)
  {
LABEL_19:
    soft_MCDMusicGeneralLogging_cold_1();
    __break(1u);
  }
  if (!objc_msgSend(v3, "isEqualToString:", *v15))
  {
    v13 = 0;
    goto LABEL_12;
  }
  v23[0] = MPModelRelationshipAlbumArtist;
  v23[1] = MPModelPropertyArtistName;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 2));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSortDescriptor sortDescriptorWithKeyPath:ascending:](MPModelSortDescriptor, "sortDescriptorWithKeyPath:ascending:", v8, 1));
  v24[0] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", MPModelPropertyAlbumTitle, 1));
  v24[1] = v18;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 2));

LABEL_11:
LABEL_12:

  return v13;
}

- (unint64_t)favoriteFilteringOptions
{
  return 0x1000000;
}

@end
