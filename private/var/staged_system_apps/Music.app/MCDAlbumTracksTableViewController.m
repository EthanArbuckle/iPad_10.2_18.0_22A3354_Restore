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
  v10 = (_QWORD *)qword_1011ECEC8;
  v22 = qword_1011ECEC8;
  if (!qword_1011ECEC8)
  {
    v11 = (void *)sub_100039DF0();
    v10 = dlsym(v11, "MCDAlbumsDetailViewControllerIdentifier");
    v20[3] = (uint64_t)v10;
    qword_1011ECEC8 = (uint64_t)v10;
  }
  _Block_object_dispose(&v19, 8);
  if (!v10)
  {
    v18 = (_Unwind_Exception *)sub_100DE9368();
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
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentManager](self, "contentManager", _NSConcreteStackBlock, 3221225472, sub_100038804, &unk_1010A8A18));
  objc_msgSend(v20, "setTableCellConfigurationBlock:", &v21);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
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
      v8 = sub_100038AD4;
      v9 = &unk_1010A8B00;
      objc_copyWeak(&v10, &location);
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPWeakTimer timerWithInterval:repeats:block:](MPWeakTimer, "timerWithInterval:repeats:block:", 0, &v6, 2.0));
      -[MCDAlbumTracksTableViewController setLoadingTimer:](self, "setLoadingTimer:", v5, v6, v7, v8, v9);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
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
  v4 = (void *)qword_1011ECED8;
  v11 = qword_1011ECED8;
  if (!qword_1011ECED8)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100039EA0;
    v7[3] = &unk_1010A89D8;
    v7[4] = &v8;
    sub_100039EA0((uint64_t)v7);
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
      if (objc_msgSend(v10, "itemType") == (id)1)
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
  v20[2] = sub_100038F78;
  v20[3] = &unk_1010A97B0;
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
  v8 = off_1011ECEE0;
  v23 = off_1011ECEE0;
  if (!off_1011ECEE0)
  {
    v9 = (void *)sub_100039DF0();
    v8 = dlsym(v9, "MCDMusicGeneralLogging");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v8;
    off_1011ECEE0 = v8;
  }
  _Block_object_dispose(&buf, 8);
  if (!v8)
  {
    sub_100DE9368();
    __break(1u);
  }
  v10 = ((uint64_t (*)(void))v8)();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Album tracks content manager failed to load data with error: %{public}@\nShowing error view", (uint8_t *)&buf, 0xCu);
  }

  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v12 = (void *)qword_1011ECEE8;
  v20 = qword_1011ECEE8;
  if (!qword_1011ECEE8)
  {
    *(_QWORD *)&buf = _NSConcreteStackBlock;
    *((_QWORD *)&buf + 1) = 3221225472;
    v22 = (uint64_t)sub_100039EF4;
    v23 = &unk_1010A89D8;
    v24 = &v17;
    sub_100039EF4((uint64_t)&buf);
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
    v5 = off_1011ECEF0;
    v12 = off_1011ECEF0;
    if (!off_1011ECEF0)
    {
      v6 = (void *)sub_100039DF0();
      v5 = dlsym(v6, "MCDSetAllowsCellularData");
      v10[3] = (uint64_t)v5;
      off_1011ECEF0 = v5;
    }
    _Block_object_dispose(&v9, 8);
    if (!v5)
    {
      v8 = (_Unwind_Exception *)sub_100DE9368();
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
    v11 = off_1011ECEF8;
    v33 = off_1011ECEF8;
    if (!off_1011ECEF8)
    {
      v12 = (void *)sub_100039DF0();
      v11 = dlsym(v12, "MCDCarDisplayBundle");
      v31[3] = (uint64_t)v11;
      off_1011ECEF8 = v11;
    }
    _Block_object_dispose(&v30, 8);
    if (!v11)
    {
      v27 = (_Unwind_Exception *)sub_100DE9368();
      _Block_object_dispose(&v30, 8);
      _Unwind_Resume(v27);
    }
    v13 = ((uint64_t (*)(void))v11)();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Unknown Album"), &stru_101122068, CFSTR("MusicCarDisplayUI")));
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

    objc_msgSend(v18, "setDestination:configurationBlock:", v7, &stru_1010A97F0);
  }
  else
  {
    objc_msgSend(v7, "setTemplateArtworkImage:", 0);
  }
  objc_msgSend(v7, "setContentPlayable:", -[MCDAlbumTracksTableViewController hasPlayableContent](self, "hasPlayableContent"));
  objc_msgSend(v7, "setFavorite:", objc_msgSend(v9, "isFavorite"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10003977C;
  v28[3] = &unk_1010A9818;
  v28[4] = self;
  v29 = v9;
  v25 = v9;
  objc_msgSend(v7, "setShuffleActionBlock:", v28);

  return v7;
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
  uint64_t v5;
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
  v5 = (uint64_t)objc_msgSend(v4, "numberOfSections");

  if (v5 >= 1)
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
      v27[2] = sub_100039ADC;
      v27[3] = &unk_1010A9840;
      v27[4] = self;
      *(double *)&v27[5] = v23;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v27, 0.4);
    }
  }
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
