@implementation MCDAlbumsTableViewController

- (MCDAlbumsTableViewController)initWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  MCDAlbumsDataSource *v9;
  MCDAlbumsTableViewController *v10;
  objc_super v12;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = -[_MCDLibraryDataSource initWithLimitedUI:]([MCDAlbumsDataSource alloc], "initWithLimitedUI:", v6);
  v12.receiver = self;
  v12.super_class = (Class)MCDAlbumsTableViewController;
  v10 = -[MCDLibraryTableViewController initWithIdentifier:limitedUI:showLocalContent:dataSource:](&v12, "initWithIdentifier:limitedUI:showLocalContent:dataSource:", v8, v6, v5, v9);

  if (v10)
    -[MCDAlbumsTableViewController setPlayActivityFeatureName:](v10, "setPlayActivityFeatureName:", CFSTR("albums"));
  return v10;
}

+ (id)albumsForPerson:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v7;
  MCDAlbumsDataSource *v8;
  MCDAlbumsTableViewController *v9;
  id MCDAlbumsViewControllerIdentifier;
  void *v11;
  MCDAlbumsTableViewController *v12;
  void *v13;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v8 = -[MCDAlbumsDataSource initWithLimitedUI:person:]([MCDAlbumsDataSource alloc], "initWithLimitedUI:person:", v6, v7);
  v9 = [MCDAlbumsTableViewController alloc];
  MCDAlbumsViewControllerIdentifier = getMCDAlbumsViewControllerIdentifier();
  v11 = (void *)objc_claimAutoreleasedReturnValue(MCDAlbumsViewControllerIdentifier);
  v12 = -[MCDLibraryTableViewController initWithIdentifier:limitedUI:showLocalContent:dataSource:](v9, "initWithIdentifier:limitedUI:showLocalContent:dataSource:", v11, v6, v5, v8);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
  -[MCDAlbumsTableViewController setTitle:](v12, "setTitle:", v13);

  -[MCDAlbumsTableViewController setPlayActivityFeatureName:](v12, "setPlayActivityFeatureName:", CFSTR("albums"));
  return v12;
}

+ (id)albumsForGenre:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v7;
  MCDAlbumsDataSource *v8;
  MCDAlbumsTableViewController *v9;
  id MCDAlbumsViewControllerIdentifier;
  void *v11;
  MCDAlbumsTableViewController *v12;
  void *v13;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v8 = -[MCDAlbumsDataSource initWithLimitedUI:genre:]([MCDAlbumsDataSource alloc], "initWithLimitedUI:genre:", v6, v7);
  v9 = [MCDAlbumsTableViewController alloc];
  MCDAlbumsViewControllerIdentifier = getMCDAlbumsViewControllerIdentifier();
  v11 = (void *)objc_claimAutoreleasedReturnValue(MCDAlbumsViewControllerIdentifier);
  v12 = -[MCDLibraryTableViewController initWithIdentifier:limitedUI:showLocalContent:dataSource:](v9, "initWithIdentifier:limitedUI:showLocalContent:dataSource:", v11, v6, v5, v8);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
  -[MCDAlbumsTableViewController setTitle:](v12, "setTitle:", v13);

  -[MCDAlbumsTableViewController setPlayActivityFeatureName:](v12, "setPlayActivityFeatureName:", CFSTR("albums"));
  return v12;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MCDAlbumsTableViewController;
  -[MCDLibraryTableViewController viewDidLoad](&v8, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentManager](self, "contentManager"));
  objc_msgSend(v3, "setShowShuffleAll:", 1);

  objc_initWeak(&location, self);
  objc_copyWeak(&v6, &location);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentManager](self, "contentManager", _NSConcreteStackBlock, 3221225472, __43__MCDAlbumsTableViewController_viewDidLoad__block_invoke, &unk_1339168));
  objc_msgSend(v4, "setTableCellConfigurationBlock:", &v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __43__MCDAlbumsTableViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id *v10;
  id v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _BOOL8 v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  id v28;

  v8 = a4;
  v9 = a5;
  v10 = (id *)(a1 + 32);
  v11 = a2;
  WeakRetained = objc_loadWeakRetained(v10);
  v28 = v8;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MusicCarPlayManager sharedManager](MusicCarPlayManager, "sharedManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "nowPlayingContentManager"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentPlayingSong"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "album"));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "identifiers"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "library"));
    v19 = objc_msgSend(v18, "persistentID");
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifiers"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "library"));
    v22 = v19 == objc_msgSend(v21, "persistentID");

  }
  else
  {
    v22 = 0;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "screen"));
  objc_msgSend(v24, "scale");
  v26 = v25;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "contentManager"));
  objc_msgSend(v11, "configureWithAlbum:utterance:currentlyPlaying:artworkScale:contentAvailable:", v28, 0, v22, objc_msgSend(v27, "itemIsPlayable:", v28), v26);

}

- (id)sortingPreferenceKey
{
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  uint64_t v9;
  char v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController dataSource](self, "dataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "genre"));

  if (v3)
  {
    v4 = CFSTR("genreAlbumsSortType");
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "person"));
    v6 = objc_opt_class(MPModelComposer);
    isKindOfClass = objc_opt_isKindOfClass(v5, v6);

    if ((isKindOfClass & 1) != 0)
    {
      v4 = CFSTR("composerAlbumsSortType");
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "person"));
      v9 = objc_opt_class(MPModelArtist);
      v10 = objc_opt_isKindOfClass(v8, v9);

      if ((v10 & 1) != 0)
        v4 = CFSTR("artistAlbumsSortType");
      else
        v4 = CFSTR("SortAlbums");
    }
  }

  return (id)v4;
}

- (id)filteringPreferenceKey
{
  void *v2;
  void *v3;
  const __CFString *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController dataSource](self, "dataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "genre"));

  if (v3)
    v4 = CFSTR("LibraryGenresFilterOption");
  else
    v4 = CFSTR("LibraryAlbumsFilterOption");

  return (id)v4;
}

- (id)legacyFilteringPreferenceKey
{
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  uint64_t v9;
  char v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController dataSource](self, "dataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "genre"));

  if (v3)
  {
    v4 = CFSTR("genres");
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "person"));
    v6 = objc_opt_class(MPModelComposer);
    isKindOfClass = objc_opt_isKindOfClass(v5, v6);

    if ((isKindOfClass & 1) != 0)
    {
      v4 = CFSTR("composers");
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "person"));
      v9 = objc_opt_class(MPModelArtist);
      v10 = objc_opt_isKindOfClass(v8, v9);

      if ((v10 & 1) != 0)
        v4 = CFSTR("artistDetail");
      else
        v4 = CFSTR("albums");
    }
  }

  return (id)v4;
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
    v5 = getMCDCarDisplayBundleSymbolLoc_ptr_0;
    v16 = getMCDCarDisplayBundleSymbolLoc_ptr_0;
    if (!getMCDCarDisplayBundleSymbolLoc_ptr_0)
    {
      v6 = (void *)MusicCarDisplayUILibrary_0();
      v5 = dlsym(v6, "MCDCarDisplayBundle");
      v14[3] = (uint64_t)v5;
      getMCDCarDisplayBundleSymbolLoc_ptr_0 = v5;
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
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("RECENTLY_PLAYED_ALBUMS"), &stru_13E1990, CFSTR("MusicCarDisplayUI"), v13));

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

- (id)sectionIndexTitlesForContentManager:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  if (-[MCDTableViewController limitedUI](self, "limitedUI"))
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastReceivedResponse"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "results"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __68__MCDAlbumsTableViewController_sectionIndexTitlesForContentManager___block_invoke;
    v12[3] = &unk_1339190;
    v13 = v6;
    v9 = v6;
    objc_msgSend(v8, "enumerateSectionsUsingBlock:", v12);

    if (objc_msgSend(v9, "count"))
      v10 = v9;
    else
      v10 = 0;
    v5 = v10;

  }
  return v5;
}

void __68__MCDAlbumsTableViewController_sectionIndexTitlesForContentManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "length"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (id)shuffleContainerForContentManager:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController dataSource](self, "dataSource", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scopedContainers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  return v5;
}

+ (BOOL)wantsTallCells
{
  return 1;
}

@end
