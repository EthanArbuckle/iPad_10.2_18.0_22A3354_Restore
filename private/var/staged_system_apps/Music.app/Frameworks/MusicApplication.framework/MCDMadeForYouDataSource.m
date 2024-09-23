@implementation MCDMadeForYouDataSource

- (MCDMadeForYouDataSource)initWithLimitedUI:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MCDMadeForYouDataSource;
  return -[_MCDLibraryDataSource initWithLimitedUI:](&v4, "initWithLimitedUI:", a3);
}

- (id)itemSortDescriptors
{
  void *v3;
  id MCDSortByRecentlyPlayed_2;
  uint64_t v5;
  id MCDSortByRecentlyAdded;
  void *v7;
  unsigned int v8;
  void *v9;
  void **v10;
  id v11;
  void *v12;
  unsigned int v13;
  id MCDSortByRecentlyUpdated;
  void *v15;
  unsigned int v16;
  id MCDSortByTitle;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDLibraryDataSource sortingPreference](self, "sortingPreference"));
  if (-[_MCDLibraryDataSource limitedUI](self, "limitedUI"))
  {
    MCDSortByRecentlyPlayed_2 = getMCDSortByRecentlyPlayed_2();
    v5 = objc_claimAutoreleasedReturnValue(MCDSortByRecentlyPlayed_2);

    v3 = (void *)v5;
  }
  MCDSortByRecentlyAdded = getMCDSortByRecentlyAdded();
  v7 = (void *)objc_claimAutoreleasedReturnValue(MCDSortByRecentlyAdded);
  v8 = objc_msgSend(v3, "isEqualToString:", v7);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", MPModelPropertyPlaylistLibraryAddedDate, 0));
    v25 = v9;
    v10 = &v25;
  }
  else
  {
    v11 = getMCDSortByRecentlyPlayed_2();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = objc_msgSend(v3, "isEqualToString:", v12);

    if (v13)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", MPModelPropertyPlaylistLastDevicePlaybackDate, 0));
      v24 = v9;
      v10 = &v24;
    }
    else
    {
      MCDSortByRecentlyUpdated = getMCDSortByRecentlyUpdated();
      v15 = (void *)objc_claimAutoreleasedReturnValue(MCDSortByRecentlyUpdated);
      v16 = objc_msgSend(v3, "isEqualToString:", v15);

      if (v16)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", MPModelPropertyPlaylistLastModifiedDateComponents, 0));
        v23 = v9;
        v10 = &v23;
      }
      else
      {
        MCDSortByTitle = getMCDSortByTitle();
        v18 = (void *)objc_claimAutoreleasedReturnValue(MCDSortByTitle);
        v19 = objc_msgSend(v3, "isEqualToString:", v18);

        if (!v19)
        {
          v20 = 0;
          goto LABEL_12;
        }
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", MPModelPropertyPlaylistName, 1));
        v22 = v9;
        v10 = &v22;
      }
    }
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 1));

LABEL_12:
  return v20;
}

- (id)requestItemKind
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](MPModelSong, "kindWithVariants:", 1));
  v7 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelPlaylistEntry kindWithKinds:](MPModelPlaylistEntry, "kindWithKinds:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelPlaylist kindWithVariants:playlistEntryKind:options:](MPModelPlaylist, "kindWithVariants:playlistEntryKind:options:", 64, v4, 4));

  return v5;
}

- (unint64_t)favoriteFilteringOptions
{
  return 0x1000000;
}

@end
