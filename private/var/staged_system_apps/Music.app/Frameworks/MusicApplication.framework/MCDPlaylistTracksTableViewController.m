@implementation MCDPlaylistTracksTableViewController

- (MCDPlaylistTracksTableViewController)initWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  MCDPlaylistTracksDataSource *v9;
  MCDPlaylistTracksTableViewController *v10;
  objc_super v12;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = -[_MCDLibraryDataSource initWithLimitedUI:]([MCDPlaylistTracksDataSource alloc], "initWithLimitedUI:", v6);
  v12.receiver = self;
  v12.super_class = (Class)MCDPlaylistTracksTableViewController;
  v10 = -[MCDLibraryTableViewController initWithIdentifier:limitedUI:showLocalContent:dataSource:](&v12, "initWithIdentifier:limitedUI:showLocalContent:dataSource:", v8, v6, v5, v9);

  if (v10)
    -[MCDPlaylistTracksTableViewController setPlayActivityFeatureName:](v10, "setPlayActivityFeatureName:", CFSTR("playlist_detail"));
  return v10;
}

- (MCDPlaylistTracksTableViewController)initWithPlaylist:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  MCDPlaylistTracksDataSource *v9;
  uint64_t *v10;
  uint64_t v11;
  MCDPlaylistTracksTableViewController *v12;
  void *v13;
  _Unwind_Exception *v15;
  objc_super v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = -[MCDPlaylistTracksDataSource initWithLimitedUI:playlist:]([MCDPlaylistTracksDataSource alloc], "initWithLimitedUI:playlist:", v6, v8);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v10 = (uint64_t *)getMCDPlaylistTracksViewControllerIdentifierSymbolLoc_ptr;
  v21 = getMCDPlaylistTracksViewControllerIdentifierSymbolLoc_ptr;
  if (!getMCDPlaylistTracksViewControllerIdentifierSymbolLoc_ptr)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __getMCDPlaylistTracksViewControllerIdentifierSymbolLoc_block_invoke;
    v17[3] = &unk_1339000;
    v17[4] = &v18;
    __getMCDPlaylistTracksViewControllerIdentifierSymbolLoc_block_invoke((uint64_t)v17);
    v10 = (uint64_t *)v19[3];
  }
  _Block_object_dispose(&v18, 8);
  if (!v10)
  {
    v15 = (_Unwind_Exception *)soft_MCDMusicGeneralLogging_cold_1();
    _Block_object_dispose(&v18, 8);
    _Unwind_Resume(v15);
  }
  v11 = *v10;
  v16.receiver = self;
  v16.super_class = (Class)MCDPlaylistTracksTableViewController;
  v12 = -[MCDLibraryTableViewController initWithIdentifier:limitedUI:showLocalContent:dataSource:](&v16, "initWithIdentifier:limitedUI:showLocalContent:dataSource:", v11, v6, v5, v9);
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
    -[MCDPlaylistTracksTableViewController setTitle:](v12, "setTitle:", v13);

    -[MCDPlaylistTracksTableViewController setPlayActivityFeatureName:](v12, "setPlayActivityFeatureName:", CFSTR("playlist_detail"));
  }

  return v12;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id location;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MCDPlaylistTracksTableViewController;
  -[MCDLibraryTableViewController viewDidLoad](&v9, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentManager](self, "contentManager"));
  objc_msgSend(v3, "setShowShuffleAll:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentManager](self, "contentManager"));
  objc_msgSend(v4, "setShowSiriCellInLimitedUI:", 1);

  objc_initWeak(&location, self);
  objc_copyWeak(&v7, &location);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentManager](self, "contentManager", _NSConcreteStackBlock, 3221225472, __51__MCDPlaylistTracksTableViewController_viewDidLoad__block_invoke, &unk_1339168));
  objc_msgSend(v5, "setTableCellConfigurationBlock:", &v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __51__MCDPlaylistTracksTableViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  id v30;

  v8 = a2;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v12 = v9;
  v30 = v8;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MusicCarPlayManager sharedManager](MusicCarPlayManager, "sharedManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "nowPlayingContentManager"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentPlayingPlaylistEntry"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifiers"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifiers"));
  v18 = objc_msgSend(v16, "intersectsSet:", v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "socialContributor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "artworkCatalog"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "window"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "screen"));
  objc_msgSend(v22, "scale");
  objc_msgSend(v30, "configureWithAttributionArtwork:artworkScale:", v20);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "song"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "window"));

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "screen"));
  objc_msgSend(v25, "scale");
  v27 = v26;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "contentManager"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "song"));

  objc_msgSend(v30, "configureWithSong:currentlyPlaying:artworkScale:contentAvailable:", v23, v18, objc_msgSend(v28, "itemIsPlayable:", v29), v27);
}

- (id)shuffleContainerForContentManager:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController dataSource](self, "dataSource", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "containerObject"));

  return v4;
}

- (id)sortingPreferenceKey
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController dataSource](self, "dataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "containerObject"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sortStorageKeyDomain"));
  if (objc_msgSend(v4, "length"))
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("playlistDetailSortType-"), "stringByAppendingString:", v4));
  else
    v5 = 0;

  return v5;
}

- (id)textForHeaderViewInContentManager:(id)a3
{
  void *v3;

  if (-[MCDLibraryTableViewController showLocalContent](self, "showLocalContent", a3))
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString downloadedOnlyMessage](NSString, "downloadedOnlyMessage"));
  else
    v3 = 0;
  return v3;
}

@end
