@implementation MCDAlbumTracksTableViewController

- (MCDAlbumTracksTableViewController)initWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  MCDAlbumTracksDataSource *v9;
  MCDAlbumTracksTableViewController *v10;
  objc_super v12;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = -[_MCDLibraryDataSource initWithLimitedUI:]([MCDAlbumTracksDataSource alloc], "initWithLimitedUI:", v6);
  v12.receiver = self;
  v12.super_class = (Class)MCDAlbumTracksTableViewController;
  v10 = -[MCDLibraryTableViewController initWithIdentifier:limitedUI:showLocalContent:dataSource:](&v12, "initWithIdentifier:limitedUI:showLocalContent:dataSource:", v8, v6, v5, v9);

  if (v10)
    -[MCDAlbumTracksTableViewController setPlayActivityFeatureName:](v10, "setPlayActivityFeatureName:", CFSTR("album_detail"));
  return v10;
}

+ (id)albumTracksViewControllerForContentItem:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v7;
  MCDAlbumTracksDataSource *v8;
  MCDAlbumTracksTableViewController *v9;
  _QWORD *v10;
  void *v11;
  MCDAlbumTracksTableViewController *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _Unwind_Exception *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v8 = -[MCDAlbumTracksDataSource initWithLimitedUI:album:storeContent:]([MCDAlbumTracksDataSource alloc], "initWithLimitedUI:album:storeContent:", v6, v7, 0);
  v9 = [MCDAlbumTracksTableViewController alloc];
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v10 = (_QWORD *)getMCDAlbumsDetailViewControllerIdentifierSymbolLoc_ptr;
  v22 = getMCDAlbumsDetailViewControllerIdentifierSymbolLoc_ptr;
  if (!getMCDAlbumsDetailViewControllerIdentifierSymbolLoc_ptr)
  {
    v11 = (void *)MusicCarDisplayUILibrary_10();
    v10 = dlsym(v11, "MCDAlbumsDetailViewControllerIdentifier");
    v20[3] = (uint64_t)v10;
    getMCDAlbumsDetailViewControllerIdentifierSymbolLoc_ptr = (uint64_t)v10;
  }
  _Block_object_dispose(&v19, 8);
  if (!v10)
  {
    v18 = (_Unwind_Exception *)soft_MCDMusicGeneralLogging_cold_1();
    _Block_object_dispose(&v19, 8);
    _Unwind_Resume(v18);
  }
  v12 = -[MCDLibraryTableViewController initWithIdentifier:limitedUI:showLocalContent:dataSource:](v9, "initWithIdentifier:limitedUI:showLocalContent:dataSource:", *v10, v6, v5, v8, v19);
  -[MCDAlbumTracksTableViewController setAlbum:](v12, "setAlbum:", v7);
  -[MCDAlbumTracksTableViewController setPlayActivityFeatureName:](v12, "setPlayActivityFeatureName:", CFSTR("album_detail"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksTableViewController titleViewLabel](v12, "titleViewLabel"));
  objc_msgSend(v14, "setText:", v13);

  v15 = objc_opt_class(MCDAlbumTracksCell);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentManager](v12, "contentManager"));
  objc_msgSend(v16, "setTableCellClass:", v15);

  return v12;
}

+ (id)albumTracksViewControllerForStoreItem:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v7;
  MCDAlbumTracksTableViewController *v8;
  MCDAlbumTracksTableViewController *v9;
  MCDAlbumTracksDataSource *v10;
  void *v11;
  void *v12;
  MCDStoreContentManager *v13;
  void *v14;
  MCDStorePlaybackManager *v15;
  MCDStoreContentManager *v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v8 = -[MCDTableViewController initWithLimitedUI:]([MCDAlbumTracksTableViewController alloc], "initWithLimitedUI:", v6);
  v9 = v8;
  if (v8)
  {
    -[MCDLibraryTableViewController setShowLocalContent:](v8, "setShowLocalContent:", v5);
    v10 = -[MCDAlbumTracksDataSource initWithLimitedUI:album:storeContent:]([MCDAlbumTracksDataSource alloc], "initWithLimitedUI:album:storeContent:", v6, v7, 1);
    -[MCDLibraryTableViewController setDataSource:](v9, "setDataSource:", v10);

    -[MCDAlbumTracksTableViewController setAlbum:](v9, "setAlbum:", v7);
    -[MCDAlbumTracksTableViewController setPlayActivityFeatureName:](v9, "setPlayActivityFeatureName:", CFSTR("album_detail"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksTableViewController titleViewLabel](v9, "titleViewLabel"));
    objc_msgSend(v12, "setText:", v11);

    -[MCDAlbumTracksTableViewController setStoreContent:](v9, "setStoreContent:", 1);
    v13 = [MCDStoreContentManager alloc];
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController dataSource](v9, "dataSource"));
    v15 = -[MCDPlaybackManager initWithDelegate:]([MCDStorePlaybackManager alloc], "initWithDelegate:", v9);
    LOBYTE(v20) = 1;
    v16 = -[_MCDContentManager initWithDataSource:limitedUI:showLocalContent:delegate:viewController:playbackManager:shouldPerformRequestImmediately:](v13, "initWithDataSource:limitedUI:showLocalContent:delegate:viewController:playbackManager:shouldPerformRequestImmediately:", v14, v6, v5, v9, v9, v15, v20);
    -[MCDLibraryTableViewController setContentManager:](v9, "setContentManager:", v16);

    v17 = objc_opt_class(MCDAlbumTracksCell);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentManager](v9, "contentManager"));
    objc_msgSend(v18, "setTableCellClass:", v17);

  }
  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id location;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)MCDAlbumTracksTableViewController;
  -[MCDLibraryTableViewController viewDidLoad](&v24, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentManager](self, "contentManager"));
  objc_msgSend(v3, "setShowSiriCellInLimitedUI:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksTableViewController tableView](self, "tableView"));
  objc_msgSend(v4, "_setHeaderAndFooterViewsFloat:", 0);

  v5 = objc_opt_new(UILabel);
  -[MCDAlbumTracksTableViewController setTitleViewLabel:](self, "setTitleViewLabel:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksTableViewController album](self, "album"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksTableViewController titleViewLabel](self, "titleViewLabel"));
  objc_msgSend(v8, "setText:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:variant:](UIFont, "_preferredFontForTextStyle:variant:", UIFontTextStyleCallout, 1024));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksTableViewController titleViewLabel](self, "titleViewLabel"));
  objc_msgSend(v10, "setFont:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksTableViewController titleViewLabel](self, "titleViewLabel"));
  objc_msgSend(v11, "setAlpha:", 0.0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksTableViewController titleViewLabel](self, "titleViewLabel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksTableViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v13, "setTitleView:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksTableViewController tableView](self, "tableView"));
  v15 = objc_opt_class(MCDAlbumsDetailTableHeaderView);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCDAlbumsDetailTableHeaderView reuseIdentifier](MCDAlbumsDetailTableHeaderView, "reuseIdentifier"));
  objc_msgSend(v14, "registerClass:forHeaderFooterViewReuseIdentifier:", v15, v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksTableViewController tableView](self, "tableView"));
  v18 = objc_opt_class(MCDAlbumTracksCell);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[_MCDReusableCell reuseIdentifier](MCDAlbumTracksCell, "reuseIdentifier"));
  objc_msgSend(v17, "registerClass:forCellReuseIdentifier:", v18, v19);

  objc_initWeak(&location, self);
  objc_copyWeak(&v22, &location);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentManager](self, "contentManager", _NSConcreteStackBlock, 3221225472, __48__MCDAlbumTracksTableViewController_viewDidLoad__block_invoke, &unk_1339168));
  objc_msgSend(v20, "setTableCellConfigurationBlock:", &v21);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __48__MCDAlbumTracksTableViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id *v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  id v24;

  v6 = a4;
  v7 = (id *)(a1 + 32);
  v8 = a2;
  WeakRetained = objc_loadWeakRetained(v7);
  v24 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MusicCarPlayManager sharedManager](MusicCarPlayManager, "sharedManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nowPlayingContentManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentPlayingSong"));

  if (v12)
  {
    v13 = objc_msgSend(WeakRetained, "storeContent");
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifiers"));
    v15 = v14;
    if (v13)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "universalStore"));
      v17 = objc_msgSend(v16, "adamID");
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "identifiers"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "universalStore"));
      v20 = objc_msgSend(v19, "adamID");
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "library"));
      v17 = objc_msgSend(v16, "persistentID");
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "identifiers"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "library"));
      v20 = objc_msgSend(v19, "persistentID");
    }
    v21 = v17 == v20;

  }
  else
  {
    v21 = 0;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "album"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "contentManager"));
  objc_msgSend(v8, "configureWithAlbumTrack:currentlyPlaying:album:contentAvailable:", v24, v21, v22, objc_msgSend(v23, "itemIsPlayable:", v24));

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void **v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MCDAlbumTracksTableViewController;
  -[MCDLibraryTableViewController viewWillAppear:](&v12, "viewWillAppear:", a3);
  if (-[MCDTableViewController alwaysHideNowPlayingButton](self, "alwaysHideNowPlayingButton"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController placeholderView](self, "placeholderView"));
    if (v4)
    {

    }
    else if (!-[MCDAlbumTracksTableViewController hasLoadedContent](self, "hasLoadedContent"))
    {
      objc_initWeak(&location, self);
      v6 = _NSConcreteStackBlock;
      v7 = 3221225472;
      v8 = __52__MCDAlbumTracksTableViewController_viewWillAppear___block_invoke;
      v9 = &unk_1338FB0;
      objc_copyWeak(&v10, &location);
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPWeakTimer timerWithInterval:repeats:block:](MPWeakTimer, "timerWithInterval:repeats:block:", 0, &v6, 2.0));
      -[MCDAlbumTracksTableViewController setLoadingTimer:](self, "setLoadingTimer:", v5, v6, v7, v8, v9);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __52__MCDAlbumTracksTableViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_showLoadingScreen");
    WeakRetained = v2;
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  MPWeakTimer *loadingTimer;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MCDAlbumTracksTableViewController;
  -[MCDLibraryTableViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  if (-[MCDTableViewController alwaysHideNowPlayingButton](self, "alwaysHideNowPlayingButton"))
  {
    -[MPWeakTimer invalidate](self->_loadingTimer, "invalidate");
    loadingTimer = self->_loadingTimer;
    self->_loadingTimer = 0;

  }
}

- (void)_showLoadingScreen
{
  MPWeakTimer *loadingTimer;
  void *v4;
  objc_class *v5;
  id v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  -[MPWeakTimer invalidate](self->_loadingTimer, "invalidate");
  loadingTimer = self->_loadingTimer;
  self->_loadingTimer = 0;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v4 = (void *)getMCDLoadingContentViewClass_softClass_0;
  v11 = getMCDLoadingContentViewClass_softClass_0;
  if (!getMCDLoadingContentViewClass_softClass_0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = __getMCDLoadingContentViewClass_block_invoke_0;
    v7[3] = &unk_1339000;
    v7[4] = &v8;
    __getMCDLoadingContentViewClass_block_invoke_0((uint64_t)v7);
    v4 = (void *)v9[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v8, 8);
  v6 = objc_alloc_init(v5);
  -[MCDAlbumTracksTableViewController _replacePlaceholderViewWithView:](self, "_replacePlaceholderViewWithView:", v6);

}

- (void)_setCurrentTableView
{
  MPWeakTimer *loadingTimer;
  id v4;

  -[MPWeakTimer invalidate](self->_loadingTimer, "invalidate");
  loadingTimer = self->_loadingTimer;
  self->_loadingTimer = 0;

  -[MCDAlbumTracksTableViewController _replacePlaceholderViewWithView:](self, "_replacePlaceholderViewWithView:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksTableViewController tableView](self, "tableView"));
  objc_msgSend(v4, "reloadData");

}

- (void)contentManager:(id)a3 didReceiveResponse:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  MPModelAlbum *v15;
  void *v16;
  void *v17;
  MPModelAlbum *v18;
  objc_super v19;
  _QWORD v20[4];
  MPModelAlbum *v21;
  id v22;
  id location;
  uint64_t v24;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "results"));
  if ((uint64_t)objc_msgSend(v8, "numberOfSections") >= 1
    && (uint64_t)objc_msgSend(v8, "numberOfItemsInSection:", 0) >= 1
    && -[MCDTableViewController alwaysHideNowPlayingButton](self, "alwaysHideNowPlayingButton"))
  {
    v9 = -[MCDAlbumTracksTableViewController storeContent](self, "storeContent");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstSection"));
    v11 = v10;
    if (v9)
    {
      if (objc_msgSend(v10, "itemType") == (char *)&dword_0 + 1)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "album"));
        -[MCDAlbumTracksTableViewController setAlbum:](self, "setAlbum:", v12);

      }
    }
    else
    {
      -[MCDAlbumTracksTableViewController setAlbum:](self, "setAlbum:", v10);
    }

    -[MCDAlbumTracksTableViewController _setCurrentTableView](self, "_setCurrentTableView");
    -[MCDAlbumTracksTableViewController setHasLoadedContent:](self, "setHasLoadedContent:", 1);
  }
  objc_initWeak(&location, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "request"));
  v14 = objc_msgSend(v13, "copy");

  v15 = self->_album;
  v24 = MPModelPropertySongDuration;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v16));
  objc_msgSend(v14, "setItemProperties:", v17);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = __71__MCDAlbumTracksTableViewController_contentManager_didReceiveResponse___block_invoke;
  v20[3] = &unk_1339BD8;
  objc_copyWeak(&v22, &location);
  v18 = v15;
  v21 = v18;
  objc_msgSend(v14, "performWithResponseHandler:", v20);
  -[MCDAlbumTracksTableViewController setHasPlayableContent:](self, "setHasPlayableContent:", 1);
  v19.receiver = self;
  v19.super_class = (Class)MCDAlbumTracksTableViewController;
  -[MCDLibraryTableViewController contentManager:didReceiveResponse:](&v19, "contentManager:didReceiveResponse:", v6, v7);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

void __71__MCDAlbumTracksTableViewController_contentManager_didReceiveResponse___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD *v12;
  _QWORD v13[5];
  _QWORD v14[4];

  v5 = a2;
  v6 = a3;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "results"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __71__MCDAlbumTracksTableViewController_contentManager_didReceiveResponse___block_invoke_2;
  v13[3] = &unk_1339B88;
  v13[4] = v14;
  objc_msgSend(v7, "enumerateItemsUsingBlock:", v13);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __71__MCDAlbumTracksTableViewController_contentManager_didReceiveResponse___block_invoke_3;
    v10[3] = &unk_1339BB0;
    v10[4] = WeakRetained;
    v11 = *(id *)(a1 + 32);
    v12 = v14;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);

  }
  _Block_object_dispose(v14, 8);

}

double __71__MCDAlbumTracksTableViewController_contentManager_didReceiveResponse___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  double result;

  objc_msgSend(a2, "duration");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = v4 + *(double *)(v3 + 24);
  *(double *)(v3 + 24) = result;
  return result;
}

void __71__MCDAlbumTracksTableViewController_contentManager_didReceiveResponse___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "album"));
  v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setAlbumDuration:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "tableView"));
    objc_msgSend(v4, "reloadData");

  }
}

- (void)contentManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  objc_class *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 buf;
  uint64_t v22;
  void *v23;
  uint64_t *v24;

  v6 = a3;
  v7 = a4;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v22 = 0x2020000000;
  v8 = getMCDMusicGeneralLoggingSymbolLoc_ptr_5;
  v23 = getMCDMusicGeneralLoggingSymbolLoc_ptr_5;
  if (!getMCDMusicGeneralLoggingSymbolLoc_ptr_5)
  {
    v9 = (void *)MusicCarDisplayUILibrary_10();
    v8 = dlsym(v9, "MCDMusicGeneralLogging");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v8;
    getMCDMusicGeneralLoggingSymbolLoc_ptr_5 = v8;
  }
  _Block_object_dispose(&buf, 8);
  if (!v8)
  {
    soft_MCDMusicGeneralLogging_cold_1();
    __break(1u);
  }
  v10 = ((uint64_t (*)(void))v8)();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Album tracks content manager failed to load data with error: %{public}@\nShowing error view", (uint8_t *)&buf, 0xCu);
  }

  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v12 = (void *)getMCDErrorLoadingViewClass_softClass_0;
  v20 = getMCDErrorLoadingViewClass_softClass_0;
  if (!getMCDErrorLoadingViewClass_softClass_0)
  {
    *(_QWORD *)&buf = _NSConcreteStackBlock;
    *((_QWORD *)&buf + 1) = 3221225472;
    v22 = (uint64_t)__getMCDErrorLoadingViewClass_block_invoke_0;
    v23 = &unk_1339000;
    v24 = &v17;
    __getMCDErrorLoadingViewClass_block_invoke_0((uint64_t)&buf);
    v12 = (void *)v18[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v17, 8);
  v14 = [v13 alloc];
  v15 = objc_msgSend(v14, "initWithTitle:buttonText:", 0, 0, v17);
  -[MCDAlbumTracksTableViewController _replacePlaceholderViewWithView:](self, "_replacePlaceholderViewWithView:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController placeholderView](self, "placeholderView"));
  objc_msgSend(v16, "setDelegate:", self);

}

- (void)errorViewDidTapButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _Unwind_Exception *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  if (objc_msgSend(v4, "shouldEnableNetwork"))
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v5 = getMCDSetAllowsCellularDataSymbolLoc_ptr_0;
    v12 = getMCDSetAllowsCellularDataSymbolLoc_ptr_0;
    if (!getMCDSetAllowsCellularDataSymbolLoc_ptr_0)
    {
      v6 = (void *)MusicCarDisplayUILibrary_10();
      v5 = dlsym(v6, "MCDSetAllowsCellularData");
      v10[3] = (uint64_t)v5;
      getMCDSetAllowsCellularDataSymbolLoc_ptr_0 = v5;
    }
    _Block_object_dispose(&v9, 8);
    if (!v5)
    {
      v8 = (_Unwind_Exception *)soft_MCDMusicGeneralLogging_cold_1();
      _Block_object_dispose(&v9, 8);
      _Unwind_Resume(v8);
    }
    ((void (*)(uint64_t))v5)(1);
  }
  -[MCDAlbumTracksTableViewController _showLoadingScreen](self, "_showLoadingScreen", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentManager](self, "contentManager"));
  objc_msgSend(v7, "performRequest");

}

- (double)heightForHeaderViewInContentManager:(id)a3
{
  return 44.0;
}

- (id)viewForHeaderViewInContentManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  NSString *v23;
  void *v24;
  id v25;
  _Unwind_Exception *v27;
  _QWORD v28[5];
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  void *v33;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksTableViewController tableView](self, "tableView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCDAlbumsDetailTableHeaderView reuseIdentifier](MCDAlbumsDetailTableHeaderView, "reuseIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dequeueReusableHeaderFooterViewWithIdentifier:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController dataSource](self, "dataSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "album"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
  if (objc_msgSend(v10, "length"))
  {
    objc_msgSend(v7, "setTitle:", v10);
  }
  else
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v11 = getMCDCarDisplayBundleSymbolLoc_ptr_9;
    v33 = getMCDCarDisplayBundleSymbolLoc_ptr_9;
    if (!getMCDCarDisplayBundleSymbolLoc_ptr_9)
    {
      v12 = (void *)MusicCarDisplayUILibrary_10();
      v11 = dlsym(v12, "MCDCarDisplayBundle");
      v31[3] = (uint64_t)v11;
      getMCDCarDisplayBundleSymbolLoc_ptr_9 = v11;
    }
    _Block_object_dispose(&v30, 8);
    if (!v11)
    {
      v27 = (_Unwind_Exception *)soft_MCDMusicGeneralLogging_cold_1();
      _Block_object_dispose(&v30, 8);
      _Unwind_Resume(v27);
    }
    v13 = ((uint64_t (*)(void))v11)();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Unknown Album"), &stru_13E1990, CFSTR("MusicCarDisplayUI")));
    objc_msgSend(v7, "setTitle:", v15);

  }
  -[MCDAlbumTracksTableViewController albumDuration](self, "albumDuration");
  objc_msgSend(v7, "setDuration:count:", objc_msgSend(v9, "trackCount"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "artworkCatalog"));
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "setFittingSize:", 36.0, 36.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksTableViewController view](self, "view"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "window"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "screen"));
    objc_msgSend(v21, "scale");
    objc_msgSend(v18, "setDestinationScale:");

    v22 = (objc_class *)objc_opt_class(self);
    v23 = NSStringFromClass(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    objc_msgSend(v18, "setCacheIdentifier:forRequestingContext:", v24, self);

    objc_msgSend(v18, "setDestination:configurationBlock:", v7, &__block_literal_global_11);
  }
  else
  {
    objc_msgSend(v7, "setTemplateArtworkImage:", 0);
  }
  objc_msgSend(v7, "setContentPlayable:", -[MCDAlbumTracksTableViewController hasPlayableContent](self, "hasPlayableContent"));
  objc_msgSend(v7, "setFavorite:", objc_msgSend(v9, "isFavorite"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = __71__MCDAlbumTracksTableViewController_viewForHeaderViewInContentManager___block_invoke_2;
  v28[3] = &unk_1339C40;
  v28[4] = self;
  v29 = v9;
  v25 = v9;
  objc_msgSend(v7, "setShuffleActionBlock:", v28);

  return v7;
}

void __71__MCDAlbumTracksTableViewController_viewForHeaderViewInContentManager___block_invoke(id a1, MCDAlbumsDetailTableHeaderView *a2, UIImage *a3)
{
  if (a3)
    -[MCDAlbumsDetailTableHeaderView setArtworkImage:](a2, "setArtworkImage:");
  else
    -[MCDAlbumsDetailTableHeaderView setTemplateArtworkImage:](a2, "setTemplateArtworkImage:");
}

void __71__MCDAlbumTracksTableViewController_viewForHeaderViewInContentManager___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contentManager"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "playbackManager"));
  v3 = *(_QWORD *)(a1 + 40);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contentManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastReceivedResponse"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "combinedPlayActivityFeatureName"));
  objc_msgSend(v2, "initiatePlaybackForAlbum:lastResponse:shuffled:playActivityFeatureName:", v3, v5, 1, v6);

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

- (void)setAlbum:(id)a3
{
  void *v5;
  MPModelAlbum *v6;

  v6 = (MPModelAlbum *)a3;
  if (self->_album != v6)
  {
    objc_storeStrong((id *)&self->_album, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController dataSource](self, "dataSource"));
    objc_msgSend(v5, "setAlbum:", v6);

  }
}

- (void)playbackManagerShouldShowNowPlaying:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_super v7;

  v4 = a3;
  if (-[MCDTableViewController alwaysHideNowPlayingButton](self, "alwaysHideNowPlayingButton"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksTableViewController navigationController](self, "navigationController"));
    v6 = objc_msgSend(v5, "popViewControllerAnimated:", 1);

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MCDAlbumTracksTableViewController;
    -[MCDLibraryTableViewController playbackManagerShouldShowNowPlaying:](&v7, "playbackManagerShouldShowNowPlaying:", v4);
  }

}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  CGFloat v17;
  void *v18;
  double v19;
  CGFloat v20;
  void *v21;
  double height;
  double v23;
  void *v24;
  double v25;
  double v26;
  _QWORD v27[6];
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksTableViewController tableView](self, "tableView", a3));
  v5 = objc_msgSend(v4, "numberOfSections");

  if ((uint64_t)v5 >= 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksTableViewController tableView](self, "tableView"));
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksTableViewController tableView](self, "tableView"));
    objc_msgSend(v15, "safeAreaInsets");
    v17 = v10 + v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksTableViewController tableView](self, "tableView"));
    objc_msgSend(v18, "safeAreaInsets");
    v20 = v14 - v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksTableViewController tableView](self, "tableView"));
    objc_msgSend(v21, "rectForHeaderInSection:", 0);
    v30.origin.x = v8;
    v30.origin.y = v17;
    v30.size.width = v12;
    v30.size.height = v20;
    v29 = CGRectIntersection(v28, v30);
    height = v29.size.height;

    if (height > 0.0)
      v23 = 0.0;
    else
      v23 = 1.0;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksTableViewController titleViewLabel](self, "titleViewLabel"));
    objc_msgSend(v24, "alpha");
    v26 = v25;

    if (v26 != v23)
    {
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = __57__MCDAlbumTracksTableViewController_scrollViewDidScroll___block_invoke;
      v27[3] = &unk_1339C68;
      v27[4] = self;
      *(double *)&v27[5] = v23;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v27, 0.4);
    }
  }
}

void __57__MCDAlbumTracksTableViewController_scrollViewDidScroll___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  v1 = *(double *)(a1 + 40);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "titleViewLabel"));
  objc_msgSend(v2, "setAlpha:", v1);

}

- (void)_replacePlaceholderViewWithView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController placeholderView](self, "placeholderView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController placeholderView](self, "placeholderView"));
    objc_msgSend(v6, "removeFromSuperview");

  }
  -[MCDLibraryTableViewController setPlaceholderView:](self, "setPlaceholderView:", v30);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController placeholderView](self, "placeholderView"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksTableViewController tableView](self, "tableView"));
    objc_msgSend(v8, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksTableViewController tableView](self, "tableView"));
    objc_msgSend(v17, "safeAreaInsets");
    v19 = v10 + v18;
    v21 = v12 + v20;
    v23 = v14 - (v18 + v22);
    v25 = v16 - (v20 + v24);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController placeholderView](self, "placeholderView"));
    objc_msgSend(v26, "setFrame:", v19, v21, v23, v25);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksTableViewController tableView](self, "tableView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "superview"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController placeholderView](self, "placeholderView"));
    objc_msgSend(v28, "addSubview:", v29);

  }
}

- (double)albumDuration
{
  return self->_albumDuration;
}

- (void)setAlbumDuration:(double)a3
{
  self->_albumDuration = a3;
}

- (MPModelAlbum)album
{
  return self->_album;
}

- (BOOL)hasPlayableContent
{
  return self->_hasPlayableContent;
}

- (void)setHasPlayableContent:(BOOL)a3
{
  self->_hasPlayableContent = a3;
}

- (BOOL)storeContent
{
  return self->_storeContent;
}

- (void)setStoreContent:(BOOL)a3
{
  self->_storeContent = a3;
}

- (BOOL)hasLoadedContent
{
  return self->_hasLoadedContent;
}

- (void)setHasLoadedContent:(BOOL)a3
{
  self->_hasLoadedContent = a3;
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (MPWeakTimer)loadingTimer
{
  return self->_loadingTimer;
}

- (void)setLoadingTimer:(id)a3
{
  objc_storeStrong((id *)&self->_loadingTimer, a3);
}

- (UILabel)titleViewLabel
{
  return self->_titleViewLabel;
}

- (void)setTitleViewLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleViewLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleViewLabel, 0);
  objc_storeStrong((id *)&self->_loadingTimer, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_album, 0);
}

@end
