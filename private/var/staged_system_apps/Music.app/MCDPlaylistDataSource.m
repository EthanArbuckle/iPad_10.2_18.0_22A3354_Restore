@implementation MCDPlaylistDataSource

- (MCDPlaylistDataSource)initWithLimitedUI:(BOOL)a3 playlist:(id)a4
{
  _BOOL8 v5;
  id v7;
  MCDPlaylistDataSource *v8;
  MCDPlaylistDataSource *v9;

  v5 = a3;
  v7 = a4;
  v8 = -[_MCDLibraryDataSource initWithLimitedUI:](self, "initWithLimitedUI:", v5);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_playlist, a4);

  return v9;
}

- (id)requestItemKind
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  if (-[_MCDLibraryDataSource limitedUI](self, "limitedUI"))
    v2 = 215;
  else
    v2 = 223;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](MPModelSong, "kindWithVariants:", 1));
  v8 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelPlaylistEntry kindWithKinds:](MPModelPlaylistEntry, "kindWithKinds:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelPlaylist kindWithVariants:playlistEntryKind:options:](MPModelPlaylist, "kindWithVariants:playlistEntryKind:options:", v2, v5, 4));

  return v6;
}

- (id)requestLabel
{
  return CFSTR("Playlist CarPlay View Controller");
}

- (id)requestItemProperties
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[10];

  v11[0] = MPModelPropertyPlaylistName;
  v11[1] = MPModelPropertyPlaylistType;
  v11[2] = MPModelPropertyPlaylistArtwork;
  v11[3] = MPModelPropertyPlaylistTracksTiledArtwork;
  v11[4] = MPModelPropertyPlaylistCuratorPlaylist;
  v11[5] = MPModelPropertyPlaylistIsFavorite;
  v11[6] = MPModelPropertyPlaylistIsDisliked;
  v11[7] = MPModelPropertyPlaylistLastModifiedDateComponents;
  v11[8] = MPModelPropertyPlaylistIsOwner;
  v11[9] = MPModelPropertyPlaylistLibraryAdded;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 10));
  v9 = MPModelRelationshipPlaylistCurator;
  v8 = MPModelPropertyCuratorName;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v3));
  v10 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));

  v6 = objc_msgSend(objc_alloc((Class)MPPropertySet), "initWithProperties:relationships:", v2, v5);
  return v6;
}

- (id)requestSectionProperties
{
  void *v2;
  void *v3;
  uint64_t v5;

  v5 = MPModelPropertySectionTitle;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2));

  return v3;
}

- (id)itemSortDescriptors
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void **v10;
  id v11;
  void *v12;
  unsigned int v13;
  id v14;
  void *v15;
  unsigned int v16;
  id v17;
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
    v4 = sub_100019CEC();
    v5 = objc_claimAutoreleasedReturnValue(v4);

    v3 = (void *)v5;
  }
  v6 = sub_100019D84();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v3, "isEqualToString:", v7);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", MPModelPropertyPlaylistLibraryAddedDate, 0));
    v25 = v9;
    v10 = &v25;
  }
  else
  {
    v11 = sub_100019CEC();
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
      v14 = sub_100019E1C();
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = objc_msgSend(v3, "isEqualToString:", v15);

      if (v16)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", MPModelPropertyPlaylistLastModifiedDateComponents, 0));
        v23 = v9;
        v10 = &v23;
      }
      else
      {
        v17 = sub_100019EB4();
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
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

- (id)scopedContainers
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDPlaylistDataSource playlist](self, "playlist"));

  if (!v3)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDPlaylistDataSource playlist](self, "playlist"));
  v7 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));

  return v5;
}

- (unint64_t)favoriteFilteringOptions
{
  return 0x1000000;
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
