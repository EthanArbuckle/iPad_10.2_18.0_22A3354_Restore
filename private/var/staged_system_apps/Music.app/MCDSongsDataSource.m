@implementation MCDSongsDataSource

- (id)requestItemKind
{
  return +[MPModelSong kindWithVariants:](MPModelSong, "kindWithVariants:", 1);
}

- (id)requestLabel
{
  return CFSTR("Songs CarPlay View Controller");
}

- (id)requestItemProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  objc_super v17;
  _QWORD v18[7];
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[3];
  _QWORD v23[3];

  v22[0] = MPModelRelationshipSongArtist;
  v21 = MPModelPropertyArtistName;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v3));
  v23[0] = v4;
  v22[1] = MPModelRelationshipSongAlbum;
  v20 = MPModelPropertyAlbumTitle;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v5));
  v23[1] = v6;
  v22[2] = MPModelRelationshipSongComposer;
  v19 = MPModelPropertyComposerName;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v7));
  v23[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 3));

  v10 = objc_alloc((Class)MPPropertySet);
  v18[0] = MPModelPropertySongTitle;
  v18[1] = MPModelPropertySongArtwork;
  v18[2] = MPModelPropertySongExplicit;
  v18[3] = MPModelPropertySongIsFavorite;
  v18[4] = MPModelPropertySongIsDisliked;
  v18[5] = MPModelPropertySongShouldShowComposer;
  v18[6] = MPModelPropertySongArtistUploadedContent;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 7));
  v12 = objc_msgSend(v10, "initWithProperties:relationships:", v11, v9);

  v17.receiver = self;
  v17.super_class = (Class)MCDSongsDataSource;
  v13 = -[MCDPlayableItemsDataSource requestItemProperties](&v17, "requestItemProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "propertySetByCombiningWithPropertySet:", v12));

  return v15;
}

- (id)itemSortDescriptors
{
  void *v3;
  id v4;
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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[2];
  _QWORD v29[3];
  _QWORD v30[5];
  void *v31;
  void *v32;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDLibraryDataSource sortingPreference](self, "sortingPreference"));
  if (-[_MCDLibraryDataSource limitedUI](self, "limitedUI"))
  {
    v4 = sub_100022334();
    v5 = objc_claimAutoreleasedReturnValue(v4);

    v3 = (void *)v5;
  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v6 = (_QWORD *)qword_1011ECD00;
  v27 = qword_1011ECD00;
  if (!qword_1011ECD00)
  {
    v7 = (void *)sub_1000223D4();
    v6 = dlsym(v7, "MCDSortByRecentlyAdded");
    v25[3] = (uint64_t)v6;
    qword_1011ECD00 = (uint64_t)v6;
  }
  _Block_object_dispose(&v24, 8);
  if (!v6)
    goto LABEL_20;
  if (!objc_msgSend(v3, "isEqualToString:", *v6, v24))
  {
    v10 = sub_100022334();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_msgSend(v3, "isEqualToString:", v11);

    if (v12)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", MPModelPropertySongLastDevicePlaybackDate, 0));
      v31 = v8;
      v9 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1));
      goto LABEL_10;
    }
    if (!v3)
    {
LABEL_18:
      v17 = MPModelRelationshipSongAlbum;
      v29[0] = MPModelRelationshipSongAlbum;
      v29[1] = MPModelRelationshipAlbumArtist;
      v29[2] = MPModelPropertyArtistName;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 3));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSortDescriptor sortDescriptorWithKeyPath:ascending:](MPModelSortDescriptor, "sortDescriptorWithKeyPath:ascending:", v8, 1));
      v30[0] = v18;
      v28[0] = v17;
      v28[1] = MPModelPropertyAlbumTitle;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 2));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSortDescriptor sortDescriptorWithKeyPath:ascending:](MPModelSortDescriptor, "sortDescriptorWithKeyPath:ascending:", v19, 1));
      v30[1] = v20;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", MPModelPropertySongDiscNumber, 1));
      v30[2] = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", MPModelPropertySongTrackNumber, 1));
      v30[3] = v22;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", MPModelPropertySongTitle, 1));
      v30[4] = v23;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 5));

      goto LABEL_11;
    }
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v15 = (_QWORD *)qword_1011ECD08;
    v27 = qword_1011ECD08;
    if (!qword_1011ECD08)
    {
      v16 = (void *)sub_1000223D4();
      v15 = dlsym(v16, "MCDSortByArtist");
      v25[3] = (uint64_t)v15;
      qword_1011ECD08 = (uint64_t)v15;
    }
    _Block_object_dispose(&v24, 8);
    if (v15)
    {
      if (!objc_msgSend(v3, "isEqualToString:", *v15, v24))
      {
        v13 = 0;
        goto LABEL_12;
      }
      goto LABEL_18;
    }
LABEL_20:
    sub_100DE9368();
    __break(1u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", MPModelPropertySongLibraryAddedDate, 0));
  v32 = v8;
  v9 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1));
LABEL_10:
  v13 = (void *)v9;
LABEL_11:

LABEL_12:
  return v13;
}

- (unint64_t)favoriteFilteringOptions
{
  return 0x800000;
}

@end
