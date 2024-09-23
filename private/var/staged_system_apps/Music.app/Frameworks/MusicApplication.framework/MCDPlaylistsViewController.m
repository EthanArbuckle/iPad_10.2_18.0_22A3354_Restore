@implementation MCDPlaylistsViewController

- (MCDPlaylistsViewController)initWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  MCDPlaylistDataSource *v9;
  MCDPlaylistsViewController *v10;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = -[_MCDLibraryDataSource initWithLimitedUI:]([MCDPlaylistDataSource alloc], "initWithLimitedUI:", v6);
  v10 = -[MCDLibraryTableViewController initWithIdentifier:limitedUI:showLocalContent:dataSource:](self, "initWithIdentifier:limitedUI:showLocalContent:dataSource:", v8, v6, v5, v9);

  if (v10)
    -[MCDPlaylistsViewController setPlayActivityFeatureName:](v10, "setPlayActivityFeatureName:", CFSTR("playlists"));
  return v10;
}

+ (id)madeForYouViewControllerWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v7;
  MCDMadeForYouDataSource *v8;
  MCDPlaylistsViewController *v9;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v8 = -[MCDMadeForYouDataSource initWithLimitedUI:]([MCDMadeForYouDataSource alloc], "initWithLimitedUI:", v6);
  v9 = -[MCDLibraryTableViewController initWithIdentifier:limitedUI:showLocalContent:dataSource:]([MCDPlaylistsViewController alloc], "initWithIdentifier:limitedUI:showLocalContent:dataSource:", v7, v6, v5, v8);

  -[MCDPlaylistsViewController setPlayActivityFeatureName:](v9, "setPlayActivityFeatureName:", CFSTR("made_for_you"));
  return v9;
}

+ (id)playlistsViewControllerForFolder:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v7;
  MCDPlaylistDataSource *v8;
  MCDPlaylistsViewController *v9;
  _QWORD *v10;
  void *v11;
  MCDPlaylistsViewController *v12;
  void *v13;
  _Unwind_Exception *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v8 = -[MCDPlaylistDataSource initWithLimitedUI:playlist:]([MCDPlaylistDataSource alloc], "initWithLimitedUI:playlist:", v6, v7);
  v9 = [MCDPlaylistsViewController alloc];
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v10 = (_QWORD *)getMCDPlaylistsViewControllerIdentifierSymbolLoc_ptr_0;
  v19 = getMCDPlaylistsViewControllerIdentifierSymbolLoc_ptr_0;
  if (!getMCDPlaylistsViewControllerIdentifierSymbolLoc_ptr_0)
  {
    v11 = (void *)MusicCarDisplayUILibrary_5();
    v10 = dlsym(v11, "MCDPlaylistsViewControllerIdentifier");
    v17[3] = (uint64_t)v10;
    getMCDPlaylistsViewControllerIdentifierSymbolLoc_ptr_0 = (uint64_t)v10;
  }
  _Block_object_dispose(&v16, 8);
  if (!v10)
  {
    v15 = (_Unwind_Exception *)soft_MCDMusicGeneralLogging_cold_1();
    _Block_object_dispose(&v16, 8);
    _Unwind_Resume(v15);
  }
  v12 = -[MCDLibraryTableViewController initWithIdentifier:limitedUI:showLocalContent:dataSource:](v9, "initWithIdentifier:limitedUI:showLocalContent:dataSource:", *v10, v6, v5, v8, v16);
  -[MCDPlaylistsViewController setPlayActivityFeatureName:](v12, "setPlayActivityFeatureName:", CFSTR("playlists"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
  -[MCDPlaylistsViewController setTitle:](v12, "setTitle:", v13);

  return v12;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MCDPlaylistsViewController;
  -[MCDLibraryTableViewController viewDidLoad](&v7, "viewDidLoad");
  objc_initWeak(&location, self);
  objc_copyWeak(&v5, &location);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentManager](self, "contentManager", _NSConcreteStackBlock, 3221225472, __41__MCDPlaylistsViewController_viewDidLoad__block_invoke, &unk_1339168));
  objc_msgSend(v3, "setTableCellConfigurationBlock:", &v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __41__MCDPlaylistsViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id *v10;
  id v11;
  id WeakRetained;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  id v25;

  v8 = a2;
  v9 = a4;
  v10 = (id *)(a1 + 32);
  v11 = a5;
  WeakRetained = objc_loadWeakRetained(v10);
  v13 = v9;
  v25 = v8;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifiers"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MusicCarPlayManager sharedManager](MusicCarPlayManager, "sharedManager"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "nowPlayingContentManager"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentPlayingPlaylist"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifiers"));
  v19 = objc_msgSend(v14, "intersectsSet:", v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "window"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "screen"));
  objc_msgSend(v21, "scale");
  v23 = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "contentManager"));
  objc_msgSend(v25, "configureWithPlaylist:utterance:currentlyPlaying:artworkScale:showCurator:contentAvailable:", v13, 0, v19, 1, objc_msgSend(v24, "itemIsPlayable:", v13), v23);

}

- (id)textForHeaderViewInContentManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _Unwind_Exception *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;

  v4 = a3;
  if (-[MCDTableViewController limitedUI](self, "limitedUI"))
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v5 = getMCDCarDisplayBundleSymbolLoc_ptr_4;
    v16 = getMCDCarDisplayBundleSymbolLoc_ptr_4;
    if (!getMCDCarDisplayBundleSymbolLoc_ptr_4)
    {
      v6 = (void *)MusicCarDisplayUILibrary_5();
      v5 = dlsym(v6, "MCDCarDisplayBundle");
      v14[3] = (uint64_t)v5;
      getMCDCarDisplayBundleSymbolLoc_ptr_4 = v5;
    }
    _Block_object_dispose(&v13, 8);
    if (!v5)
    {
      v12 = (_Unwind_Exception *)soft_MCDMusicGeneralLogging_cold_1();
      _Block_object_dispose(&v13, 8);
      _Unwind_Resume(v12);
    }
    v8 = ((uint64_t (*)(uint64_t))v5)(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("RECENTLY_PLAYED_PLAYLISTS"), &stru_13E1990, CFSTR("MusicCarDisplayUI"), v13));

  }
  else if (-[MCDLibraryTableViewController showLocalContent](self, "showLocalContent"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString downloadedOnlyMessage](NSString, "downloadedOnlyMessage"));
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)sortingPreferenceKey
{
  void *v2;
  uint64_t v3;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController dataSource](self, "dataSource"));
  v3 = objc_opt_class(MCDMadeForYouDataSource);
  isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  if ((isKindOfClass & 1) != 0)
    return CFSTR("personalizedMixPlaylistsSortType");
  else
    return CFSTR("playlistsSortType");
}

- (id)filteringPreferenceKey
{
  void *v2;
  uint64_t v3;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController dataSource](self, "dataSource"));
  v3 = objc_opt_class(MCDMadeForYouDataSource);
  isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  if ((isKindOfClass & 1) != 0)
    return CFSTR("LibraryMadeForYouFilterOption");
  else
    return CFSTR("LibraryPlaylistsFilterOption");
}

- (id)legacyFilteringPreferenceKey
{
  void *v2;
  uint64_t v3;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController dataSource](self, "dataSource"));
  v3 = objc_opt_class(MCDMadeForYouDataSource);
  isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  if ((isKindOfClass & 1) != 0)
    return CFSTR("madeForYou");
  else
    return CFSTR("playlists");
}

+ (BOOL)wantsTallCells
{
  return 1;
}

@end
