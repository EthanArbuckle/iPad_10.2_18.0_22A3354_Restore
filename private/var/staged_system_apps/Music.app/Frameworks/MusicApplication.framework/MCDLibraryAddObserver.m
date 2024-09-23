@implementation MCDLibraryAddObserver

- (void)updateRequestForTracklist:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  MCDStorePlaybackItemsManager *v23;
  MCDPlaylistAddedDataSource *v24;
  MCDStorePlaybackItemsManager *v25;
  void *v26;
  MCDStorePlaybackItemsManager *v27;
  MCDAlbumAddedDataSource *v28;
  MCDStorePlaybackItemsManager *v29;
  NSObject *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  void *v40;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "playingItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metadataObject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "flattenedGenericObject"));

  if (objc_msgSend(v7, "type") == (char *)&dword_0 + 1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "song"));
    -[MCDLibraryAddObserver setSong:](self, "setSong:", v8);

    v9 = soft_MCDMusicGeneralLogging_4();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryAddObserver song](self, "song"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "debugDescription"));
      v39 = 138543362;
      v40 = v12;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "LibraryAddObserver: Song updated %{public}@", (uint8_t *)&v39, 0xCu);

    }
  }
  else
  {
    -[MCDLibraryAddObserver setSong:](self, "setSong:", 0);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "playingItemIndexPath"));

  if (!v13)
  {
    -[MCDLibraryAddObserver setDidReceivePlaylistResponse:](self, "setDidReceivePlaylistResponse:", 0);
    v20 = 0;
    v22 = 0;
    goto LABEL_16;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "items"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "playingItemIndexPath"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sectionAtIndex:", objc_msgSend(v15, "section")));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "metadataObject"));
  v18 = (int *)objc_msgSend(v17, "type");
  if (v18 == (int *)((char *)&dword_0 + 2))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "album"));
    v21 = 0;
    v20 = v19;
    goto LABEL_12;
  }
  if (v18 == &dword_4)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "playlist"));
    v20 = 0;
    v21 = v19;
LABEL_12:
    v22 = v19;
    goto LABEL_14;
  }
  v22 = 0;
  v20 = 0;
  v21 = 0;
LABEL_14:

  -[MCDLibraryAddObserver setDidReceivePlaylistResponse:](self, "setDidReceivePlaylistResponse:", 0);
  if (v21)
  {
    v23 = [MCDStorePlaybackItemsManager alloc];
    v24 = -[MCDPlaylistTracksDataSource initWithLimitedUI:playlist:]([MCDPlaylistAddedDataSource alloc], "initWithLimitedUI:playlist:", 0, v21);
    v25 = -[_MCDContentManager initWithDataSource:delegate:](v23, "initWithDataSource:delegate:", v24, self);
    -[MCDLibraryAddObserver setPlaylistContentManager:](self, "setPlaylistContentManager:", v25);

    goto LABEL_17;
  }
LABEL_16:
  -[MCDLibraryAddObserver setPlaylistContentManager:](self, "setPlaylistContentManager:", 0);
  v21 = 0;
LABEL_17:
  -[MCDLibraryAddObserver setDidReceiveAlbumResponse:](self, "setDidReceiveAlbumResponse:", 0);
  if (!v20)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryAddObserver song](self, "song"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "album"));

    if (v22)
    {
      if (v20)
        goto LABEL_20;
    }
    else
    {
      v22 = v20;
      if (v20)
        goto LABEL_20;
    }
    -[MCDLibraryAddObserver setAlbumsContentManager:](self, "setAlbumsContentManager:", 0);
    goto LABEL_21;
  }
LABEL_20:
  v27 = [MCDStorePlaybackItemsManager alloc];
  v28 = -[MCDAlbumTracksDataSource initWithLimitedUI:album:storeContent:]([MCDAlbumAddedDataSource alloc], "initWithLimitedUI:album:storeContent:", 0, v20, 0);
  v29 = -[_MCDContentManager initWithDataSource:delegate:](v27, "initWithDataSource:delegate:", v28, self);
  -[MCDLibraryAddObserver setAlbumsContentManager:](self, "setAlbumsContentManager:", v29);

LABEL_21:
  v30 = objc_claimAutoreleasedReturnValue(-[MCDLibraryAddObserver song](self, "song"));
  if (!v30)
  {
    v30 = objc_claimAutoreleasedReturnValue(-[MCDLibraryAddObserver album](self, "album"));
    if (!v30)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryAddObserver playlist](self, "playlist"));

      if (v31)
        goto LABEL_24;
      v32 = soft_MCDMusicGeneralLogging_4();
      v30 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        -[MCDLibraryAddObserver updateRequestForTracklist:].cold.1((uint64_t)v4, v30, v33, v34, v35, v36, v37, v38);
    }
  }

LABEL_24:
}

- (void)setSong:(id)a3
{
  MPModelSong *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  v5 = (MPModelSong *)a3;
  if (self->_song != v5)
    objc_storeStrong((id *)&self->_song, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryAddObserver songAddStatusObserver](self, "songAddStatusObserver"));
  v7 = v6;
  if (v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryAddObserver songAddStatusObserver](self, "songAddStatusObserver"));

    if (v8)
    {
      v9 = v7;
    }
    else
    {
      v9 = objc_alloc_init((Class)MPLibraryAddStatusObserver);

      objc_initWeak(&location, self);
      v10 = _NSConcreteStackBlock;
      v11 = 3221225472;
      v12 = __33__MCDLibraryAddObserver_setSong___block_invoke;
      v13 = &unk_1339808;
      objc_copyWeak(&v14, &location);
      objc_msgSend(v9, "setStatusBlock:", &v10);
      -[MCDLibraryAddObserver setSongAddStatusObserver:](self, "setSongAddStatusObserver:", v9, v10, v11, v12, v13);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    objc_msgSend(v9, "configureWithModelObject:", v5);

  }
  else
  {

    if (v7)
      -[MCDLibraryAddObserver setSongAddStatusObserver:](self, "setSongAddStatusObserver:", 0);
  }

}

void __33__MCDLibraryAddObserver_setSong___block_invoke(uint64_t a1)
{
  void (**v1)(void);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "updateBlock"));
  v1[2]();

}

- (void)addSongToLibrary
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = soft_MCDMusicGeneralLogging_4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Adding song to library", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryAddObserver song](self, "song"));
  -[MCDLibraryAddObserver _addItemToLibrary:](self, "_addItemToLibrary:", v5);

}

- (void)addAlbumToLibrary
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = soft_MCDMusicGeneralLogging_4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Adding album to library", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryAddObserver album](self, "album"));
  -[MCDLibraryAddObserver _addItemToLibrary:](self, "_addItemToLibrary:", v5);

}

- (void)addPlaylistToLibrary
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = soft_MCDMusicGeneralLogging_4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Adding playlist to library", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryAddObserver playlist](self, "playlist"));
  -[MCDLibraryAddObserver _addItemToLibrary:](self, "_addItemToLibrary:", v5);

}

- (void)_addItemToLibrary:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init((Class)MPMutableSectionedCollection);
    -[NSObject appendSection:](v5, "appendSection:", &stru_13E1990);
    -[NSObject appendItem:](v5, "appendItem:", v4);
    v6 = objc_alloc_init((Class)MPModelLibraryImportChangeRequest);
    objc_msgSend(v6, "setShouldLibraryAdd:", 1);
    objc_msgSend(v6, "setModelObjects:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryAddObserver referralObject](self, "referralObject"));
    objc_msgSend(v6, "setReferralObject:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelLibraryTransientStateController sharedDeviceLibraryController](MPModelLibraryTransientStateController, "sharedDeviceLibraryController"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __43__MCDLibraryAddObserver__addItemToLibrary___block_invoke;
    v10[3] = &unk_133A5C0;
    v11 = v4;
    objc_msgSend(v8, "performLibraryImportChangeRequest:withRelatedModelObjects:completion:", v6, 0, v10);

  }
  else
  {
    v9 = soft_MCDMusicGeneralLogging_4();
    v5 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[MCDLibraryAddObserver _addItemToLibrary:].cold.1(v5);
  }

}

void __43__MCDLibraryAddObserver__addItemToLibrary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = soft_MCDMusicGeneralLogging_4();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "debugDescription"));
      v13 = 138543874;
      v14 = v12;
      v15 = 2114;
      v16 = v5;
      v17 = 2114;
      v18 = v6;
      _os_log_error_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "Failed to add %{public}@ to Music Library with:\n - resultingObjects: %{public}@\n - error: %{public}@", (uint8_t *)&v13, 0x20u);

    }
  }
  v9 = soft_MCDMusicGeneralLogging_4();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "debugDescription"));
    v13 = 138543618;
    v14 = v11;
    v15 = 2114;
    v16 = v5;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Added %{public}@ to Music Library, resultingObjects: %{public}@", (uint8_t *)&v13, 0x16u);

  }
}

- (BOOL)isCloudLibraryEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudController sharedCloudController](MPCloudController, "sharedCloudController"));
  v3 = objc_msgSend(v2, "isCloudLibraryEnabled");

  return v3;
}

- (BOOL)isSongAddable
{
  void *v3;
  char *v4;
  id v5;
  NSObject *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  unsigned int v11;
  BOOL result;
  int v13;
  void *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryAddObserver songAddStatusObserver](self, "songAddStatusObserver"));
  v4 = (char *)objc_msgSend(v3, "currentStatus");

  v5 = soft_MCDMusicGeneralLogging_4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryAddObserver song](self, "song"));
    if (-[MCDLibraryAddObserver isCloudLibraryEnabled](self, "isCloudLibraryEnabled"))
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    v13 = 134218754;
    if (-[MCDLibraryAddObserver isSongAdded](self, "isSongAdded"))
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    v14 = v7;
    if (v4 == (_BYTE *)&dword_0 + 2)
      v10 = CFSTR("YES");
    else
      v10 = CFSTR("NO");
    v15 = 2114;
    v16 = v8;
    v17 = 2114;
    v18 = v9;
    v19 = 2114;
    v20 = v10;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "isSongAddable: %p\n\tisCloudLibraryEnabled: %{public}@\n\tlibraryAdded: %{public}@\n\tlibraryAddEligible: %{public}@", (uint8_t *)&v13, 0x2Au);

  }
  v11 = -[MCDLibraryAddObserver isCloudLibraryEnabled](self, "isCloudLibraryEnabled");
  result = 0;
  if (v11)
  {
    if (v4 == (_BYTE *)&dword_0 + 2)
      return !-[MCDLibraryAddObserver isSongAdded](self, "isSongAdded");
  }
  return result;
}

- (BOOL)isSongAdded
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryAddObserver songAddStatusObserver](self, "songAddStatusObserver"));
  v3 = objc_msgSend(v2, "currentStatus") == (char *)&dword_0 + 1;

  return v3;
}

- (BOOL)shouldShowFavoriteSong
{
  void *v3;
  char *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  void *v24;
  char *v25;
  MCDLibraryAddObserver *v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  const __CFString *v34;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryAddObserver songAddStatusObserver](self, "songAddStatusObserver"));
  v4 = (char *)objc_msgSend(v3, "currentStatus");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryAddObserver song](self, "song"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifiers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "library"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "databaseID"));
  v26 = self;
  if (v8)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryAddObserver song](self, "song"));
    v25 = v4;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "identifiers"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "library"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "databaseID"));
    v12 = v5;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary deviceMediaLibrary](MPMediaLibrary, "deviceMediaLibrary"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uniqueIdentifier"));
    v15 = objc_msgSend(v11, "isEqualToString:", v14) ^ 1;

    v5 = v12;
    v4 = v25;
  }
  else
  {
    v15 = 0;
  }

  v16 = soft_MCDMusicGeneralLogging_4();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = objc_claimAutoreleasedReturnValue(-[MCDLibraryAddObserver song](v26, "song"));
    v19 = (void *)v18;
    v20 = CFSTR("NO");
    if (v4 == (_BYTE *)&dword_0 + 1)
      v21 = CFSTR("YES");
    else
      v21 = CFSTR("NO");
    *(_DWORD *)buf = 134218754;
    v28 = v18;
    if (v4 == (_BYTE *)&dword_0 + 2)
      v22 = CFSTR("YES");
    else
      v22 = CFSTR("NO");
    v30 = v21;
    v29 = 2114;
    v31 = 2114;
    if (v15)
      v20 = CFSTR("YES");
    v32 = v22;
    v33 = 2114;
    v34 = v20;
    _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "shouldShowFavoriteSong: %p\n\tlibraryAdded: %{public}@\n\tlibraryAddEligible: %{public}@\n\tisHomeSharing: %{public}@", buf, 0x2Au);

  }
  if ((unint64_t)(v4 - 1) < 2)
    return v15 ^ 1;
  else
    return 0;
}

- (BOOL)isAlbumAddable
{
  id v3;
  NSObject *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  unsigned int v12;
  int v14;
  void *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  const __CFString *v23;

  v3 = soft_MCDMusicGeneralLogging_4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryAddObserver album](self, "album"));
    if (-[MCDLibraryAddObserver didReceiveAlbumResponse](self, "didReceiveAlbumResponse"))
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    if (-[MCDLibraryAddObserver isCloudLibraryEnabled](self, "isCloudLibraryEnabled"))
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    if (-[MCDLibraryAddObserver isAlbumAdded](self, "isAlbumAdded"))
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryAddObserver album](self, "album"));
    v14 = 134219010;
    if (objc_msgSend(v9, "isLibraryAddEligible"))
      v10 = CFSTR("YES");
    else
      v10 = CFSTR("NO");
    v15 = v5;
    v16 = 2114;
    v17 = v6;
    v18 = 2114;
    v19 = v7;
    v20 = 2114;
    v21 = v8;
    v22 = 2114;
    v23 = v10;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "isAlbumAddable: %p\n\tdidReceiveAlbumResponse: %{public}@\n\tisCloudLibraryEnabled: %{public}@\n\tlibraryAdded: %{public}@\n\tlibraryAddEligible: %{public}@", (uint8_t *)&v14, 0x34u);

  }
  if (-[MCDLibraryAddObserver didReceiveAlbumResponse](self, "didReceiveAlbumResponse")
    && -[MCDLibraryAddObserver isCloudLibraryEnabled](self, "isCloudLibraryEnabled"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryAddObserver album](self, "album"));
    if (objc_msgSend(v11, "isLibraryAddEligible"))
      v12 = !-[MCDLibraryAddObserver isAlbumAdded](self, "isAlbumAdded");
    else
      LOBYTE(v12) = 0;

  }
  else
  {
    LOBYTE(v12) = 0;
  }
  return v12;
}

- (BOOL)isAlbumAdded
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryAddObserver album](self, "album"));
  v3 = objc_msgSend(v2, "isLibraryAdded");

  return v3;
}

- (BOOL)isPlaylistAddable
{
  id v3;
  NSObject *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  unsigned int v10;
  int v12;
  void *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;

  v3 = soft_MCDMusicGeneralLogging_4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryAddObserver playlist](self, "playlist"));
    if (-[MCDLibraryAddObserver didReceivePlaylistResponse](self, "didReceivePlaylistResponse"))
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    if (-[MCDLibraryAddObserver isCloudLibraryEnabled](self, "isCloudLibraryEnabled"))
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    v12 = 134218754;
    if (-[MCDLibraryAddObserver isPlaylistAdded](self, "isPlaylistAdded"))
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    v13 = v5;
    v14 = 2114;
    v15 = v6;
    v16 = 2114;
    v17 = v7;
    v18 = 2114;
    v19 = v8;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "isPlaylistAddable: %p\n\tdidReceivePlaylistResponse: %{public}@\n\tisCloudLibraryEnabled: %{public}@\n\tlibraryAdded: %{public}@", (uint8_t *)&v12, 0x2Au);

  }
  if (-[MCDLibraryAddObserver didReceivePlaylistResponse](self, "didReceivePlaylistResponse")
    && -[MCDLibraryAddObserver isCloudLibraryEnabled](self, "isCloudLibraryEnabled"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryAddObserver playlist](self, "playlist"));
    if (v9)
      v10 = !-[MCDLibraryAddObserver isPlaylistAdded](self, "isPlaylistAdded");
    else
      LOBYTE(v10) = 0;

  }
  else
  {
    LOBYTE(v10) = 0;
  }
  return v10;
}

- (BOOL)isPlaylistAdded
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryAddObserver playlist](self, "playlist"));
  v3 = objc_msgSend(v2, "isLibraryAdded");

  return v3;
}

- (void)contentManager:(id)a3 didReceiveResponse:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  void *v25;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "results"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstSection"));

  v8 = (int *)objc_msgSend(v7, "type");
  if (v8 == &dword_4)
  {
    -[MCDLibraryAddObserver setDidReceivePlaylistResponse:](self, "setDidReceivePlaylistResponse:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "playlist"));
    -[MCDLibraryAddObserver setPlaylist:](self, "setPlaylist:", v15);

    v16 = soft_MCDMusicGeneralLogging_4();
    v11 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryAddObserver playlist](self, "playlist"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "debugDescription"));
      v24 = 138543362;
      v25 = v13;
      v14 = "LibraryAddObserver: Playlist updated %{public}@";
      goto LABEL_7;
    }
  }
  else if (v8 == (int *)((char *)&dword_0 + 2))
  {
    -[MCDLibraryAddObserver setDidReceiveAlbumResponse:](self, "setDidReceiveAlbumResponse:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "album"));
    -[MCDLibraryAddObserver setAlbum:](self, "setAlbum:", v9);

    v10 = soft_MCDMusicGeneralLogging_4();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryAddObserver album](self, "album"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "debugDescription"));
      v24 = 138543362;
      v25 = v13;
      v14 = "LibraryAddObserver: Album updated %{public}@";
LABEL_7:
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v24, 0xCu);

    }
  }
  else
  {
    v17 = soft_MCDMusicGeneralLogging_4();
    v11 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MCDLibraryAddObserver contentManager:didReceiveResponse:].cold.1((uint64_t)v5, v11, v18, v19, v20, v21, v22, v23);
  }

}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (MPLibraryAddStatusObserver)songAddStatusObserver
{
  return self->_songAddStatusObserver;
}

- (void)setSongAddStatusObserver:(id)a3
{
  objc_storeStrong((id *)&self->_songAddStatusObserver, a3);
}

- (MCDStorePlaybackItemsManager)albumsContentManager
{
  return self->_albumsContentManager;
}

- (void)setAlbumsContentManager:(id)a3
{
  objc_storeStrong((id *)&self->_albumsContentManager, a3);
}

- (MCDStorePlaybackItemsManager)playlistContentManager
{
  return self->_playlistContentManager;
}

- (void)setPlaylistContentManager:(id)a3
{
  objc_storeStrong((id *)&self->_playlistContentManager, a3);
}

- (BOOL)didReceiveAlbumResponse
{
  return self->_didReceiveAlbumResponse;
}

- (void)setDidReceiveAlbumResponse:(BOOL)a3
{
  self->_didReceiveAlbumResponse = a3;
}

- (BOOL)didReceivePlaylistResponse
{
  return self->_didReceivePlaylistResponse;
}

- (void)setDidReceivePlaylistResponse:(BOOL)a3
{
  self->_didReceivePlaylistResponse = a3;
}

- (MPModelSong)song
{
  return self->_song;
}

- (MPModelAlbum)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
  objc_storeStrong((id *)&self->_album, a3);
}

- (MPModelPlaylist)playlist
{
  return self->_playlist;
}

- (void)setPlaylist:(id)a3
{
  objc_storeStrong((id *)&self->_playlist, a3);
}

- (MPModelObject)referralObject
{
  return self->_referralObject;
}

- (void)setReferralObject:(id)a3
{
  objc_storeStrong((id *)&self->_referralObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referralObject, 0);
  objc_storeStrong((id *)&self->_playlist, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_song, 0);
  objc_storeStrong((id *)&self->_playlistContentManager, 0);
  objc_storeStrong((id *)&self->_albumsContentManager, 0);
  objc_storeStrong((id *)&self->_songAddStatusObserver, 0);
  objc_storeStrong(&self->_updateBlock, 0);
}

- (void)updateRequestForTracklist:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_0, a2, a3, "No supported objects obtained from tracklist: %{public}@", a5, a6, a7, a8, 2u);
}

- (void)_addItemToLibrary:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Trying to add nil object to Music Library", v1, 2u);
}

- (void)contentManager:(uint64_t)a3 didReceiveResponse:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_0, a2, a3, "Unsupported response received: %{public}@", a5, a6, a7, a8, 2u);
}

@end
