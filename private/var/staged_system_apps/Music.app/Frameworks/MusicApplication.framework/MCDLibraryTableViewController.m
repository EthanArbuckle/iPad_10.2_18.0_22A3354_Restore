@implementation MCDLibraryTableViewController

- (MCDLibraryTableViewController)initWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  _MCDLibraryDataSource *v9;
  MCDLibraryTableViewController *v10;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = objc_alloc_init(_MCDLibraryDataSource);
  v10 = -[MCDLibraryTableViewController initWithIdentifier:limitedUI:showLocalContent:dataSource:](self, "initWithIdentifier:limitedUI:showLocalContent:dataSource:", v8, v6, v5, v9);

  return v10;
}

- (MCDLibraryTableViewController)initWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5 dataSource:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v11;
  id v12;
  MCDLibraryTableViewController *v13;
  MCDLibraryTableViewController *v14;
  MCDLibraryContentManager *v15;
  MCDContentManagerDataSource *dataSource;
  MCDLibraryPlaybackManager *v17;
  MCDLibraryContentManager *v18;
  _MCDContentManager *contentManager;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  objc_super v26;

  v7 = a5;
  v8 = a4;
  v11 = a3;
  v12 = a6;
  v26.receiver = self;
  v26.super_class = (Class)MCDLibraryTableViewController;
  v13 = -[MCDLibraryTableViewController init](&v26, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_identifier, a3);
    objc_storeStrong((id *)&v14->_dataSource, a6);
    v14->_showLocalContent = v7;
    v15 = [MCDLibraryContentManager alloc];
    dataSource = v14->_dataSource;
    v17 = -[MCDPlaybackManager initWithDelegate:]([MCDLibraryPlaybackManager alloc], "initWithDelegate:", v14);
    LOBYTE(v25) = 0;
    v18 = -[_MCDContentManager initWithDataSource:limitedUI:showLocalContent:delegate:viewController:playbackManager:shouldPerformRequestImmediately:](v15, "initWithDataSource:limitedUI:showLocalContent:delegate:viewController:playbackManager:shouldPerformRequestImmediately:", dataSource, v8, v7, v14, v14, v17, v25);
    contentManager = v14->_contentManager;
    v14->_contentManager = &v18->super;

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController sortingPreferenceKey](v14, "sortingPreferenceKey"));
    if (v20)
    {

    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController filteringPreferenceKey](v14, "filteringPreferenceKey"));

      if (!v21)
      {
        -[_MCDContentManager performRequest](v14->_contentManager, "performRequest");
        goto LABEL_6;
      }
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v22, "addObserver:selector:name:object:", v14, "userDefaultsChanged:", NSUserDefaultsDidChangeNotification, 0);

    -[MCDLibraryTableViewController userDefaultsChanged:](v14, "userDefaultsChanged:", 0);
LABEL_6:
    -[MCDTableViewController setLimitedUI:](v14, "setLimitedUI:", v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v23, "addObserver:selector:name:object:", v14, "mediaLibraryChanged:", MPMediaLibraryDidChangeNotification, 0);

    v14->_canModifyView = 1;
  }

  return v14;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, NSUserDefaultsDidChangeNotification, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, MPMediaLibraryDidChangeNotification, 0);

  v5.receiver = self;
  v5.super_class = (Class)MCDLibraryTableViewController;
  -[MCDLibraryTableViewController dealloc](&v5, "dealloc");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MCDLibraryTableViewController;
  -[MCDTableViewController viewDidLoad](&v9, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController tableView](self, "tableView"));
  -[MCDLibraryTableViewController setContentTableView:](self, "setContentTableView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController tableView](self, "tableView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentManager](self, "contentManager"));
  objc_msgSend(v5, "setTableView:", v4);

  if (objc_msgSend((id)objc_opt_class(self), "wantsTallCells"))
  {
    v6 = objc_opt_class(MCDTallCell);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentManager](self, "contentManager"));
    objc_msgSend(v7, "setTableCellClass:", v6);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController tableView](self, "tableView"));
  objc_msgSend(v8, "_setHeaderAndFooterViewsFloat:", 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  _TtC16MusicApplication31LibraryTableNavigationTitleView *v5;
  void *v6;
  _TtC16MusicApplication31LibraryTableNavigationTitleView *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id location;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)MCDLibraryTableViewController;
  -[MCDTableViewController viewWillAppear:](&v24, "viewWillAppear:", a3);
  if (-[MCDLibraryTableViewController canShowFavoriteContent](self, "canShowFavoriteContent"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController navigationTitleView](self, "navigationTitleView"));

    if (!v4)
    {
      v5 = [_TtC16MusicApplication31LibraryTableNavigationTitleView alloc];
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController title](self, "title"));
      v7 = -[LibraryTableNavigationTitleView initWithTitle:](v5, "initWithTitle:", v6);
      -[MCDLibraryTableViewController setNavigationTitleView:](self, "setNavigationTitleView:", v7);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentManager](self, "contentManager"));
      v9 = objc_msgSend(v8, "showFavoriteContent");
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController navigationTitleView](self, "navigationTitleView"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "filterButton"));
      objc_msgSend(v11, "setSelected:", v9);

      objc_initWeak(&location, self);
      v18 = _NSConcreteStackBlock;
      v19 = 3221225472;
      v20 = __48__MCDLibraryTableViewController_viewWillAppear___block_invoke;
      v21 = &unk_13392C8;
      objc_copyWeak(&v22, &location);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", &v18));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController navigationTitleView](self, "navigationTitleView", v18, v19, v20, v21));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "filterButton"));
      objc_msgSend(v14, "addAction:forControlEvents:", v12, 64);

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController navigationTitleView](self, "navigationTitleView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v16, "setTitleView:", v15);

  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v15, "setTitleView:", 0);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController tableView](self, "tableView"));
  objc_msgSend(v17, "reloadData");

  -[MCDLibraryTableViewController checkContentAndSetView](self, "checkContentAndSetView");
  self->_canModifyView = 0;
}

void __48__MCDLibraryTableViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "filterButtonTapped");

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MCDLibraryTableViewController;
  -[MCDTableViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  self->_canModifyView = 1;
  -[MCDLibraryTableViewController checkContentAndSetView](self, "checkContentAndSetView");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MCDLibraryTableViewController;
  -[MCDTableViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v4, "setTitleView:", 0);

}

- (void)userDefaultsChanged:(id)a3
{
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentManager](self, "contentManager", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastReceivedResponse"));
  v6 = v5 == 0;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentManager](self, "contentManager"));
  v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sortingPreference"));

  v8 = (id)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController sortingPreference](self, "sortingPreference"));
  if (v25 == v8)
  {
    v11 = v25;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController sortingPreference](self, "sortingPreference"));
    v10 = objc_msgSend(v25, "isEqualToString:", v9);

    if ((v10 & 1) != 0)
      goto LABEL_6;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController sortingPreference](self, "sortingPreference"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentManager](self, "contentManager"));
    objc_msgSend(v12, "setSortingPreference:", v11);

    v6 = 1;
  }

LABEL_6:
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController filteringPreferenceKey](self, "filteringPreferenceKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController legacyFilteringPreferenceKey](self, "legacyFilteringPreferenceKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("LibraryFilterOptionsController-%@"), v14));
  v16 = +[LibraryFilterOptionsController isFilteringToFavoritesWithStorageKey:legacyStorageKey:](_TtC16MusicApplication30LibraryFilterOptionsController, "isFilteringToFavoritesWithStorageKey:legacyStorageKey:", v13, v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentManager](self, "contentManager"));
  LODWORD(v15) = objc_msgSend(v17, "showFavoriteContent");

  if (v16 != (_DWORD)v15)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController navigationTitleView](self, "navigationTitleView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "filterButton"));
    objc_msgSend(v19, "setSelected:", v16);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentManager](self, "contentManager"));
    objc_msgSend(v20, "setShowFavoriteContent:", v16);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentManager](self, "contentManager"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "playbackManager"));
    objc_msgSend(v22, "setFavoriteContentOnly:", v16);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentManager](self, "contentManager"));
    objc_msgSend(v23, "setLastReceivedResponse:", 0);

    -[MCDLibraryTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
LABEL_9:
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentManager](self, "contentManager"));
    objc_msgSend(v24, "performRequest");

    goto LABEL_10;
  }
  if (v6)
    goto LABEL_9;
LABEL_10:

}

- (id)sortingPreference
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController sortingPreferenceKey](self, "sortingPreferenceKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringForKey:", v4));

  return v5;
}

- (NSString)sortingPreferenceKey
{
  return 0;
}

- (NSString)filteringPreferenceKey
{
  return 0;
}

- (id)legacyFilteringPreferenceKey
{
  return 0;
}

- (void)_limitedUIDidChange
{
  _BOOL8 v3;
  id v4;

  v3 = -[MCDTableViewController limitedUI](self, "limitedUI");
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentManager](self, "contentManager"));
  objc_msgSend(v4, "setLimitedUI:", v3);

}

- (BOOL)canShowFavoriteContent
{
  NSString *identifier;
  id MCDAlbumsViewControllerIdentifier_0;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  NSString *v9;
  id MCDPlaylistsViewControllerIdentifier;
  NSString *v11;
  id MCDArtistsViewControllerIdentifier;
  NSString *v13;
  id MCDCompilationsViewControllerIdentifier;
  void *v15;
  NSString *v16;
  id MCDSongsViewControllerIdentifier;
  void *v18;
  NSString *v19;
  id MCDMadeForYouViewControllerIdentifier;
  void *v21;

  identifier = self->_identifier;
  MCDAlbumsViewControllerIdentifier_0 = getMCDAlbumsViewControllerIdentifier_0();
  v5 = (void *)objc_claimAutoreleasedReturnValue(MCDAlbumsViewControllerIdentifier_0);
  LODWORD(identifier) = -[NSString isEqualToString:](identifier, "isEqualToString:", v5);

  if ((_DWORD)identifier)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController dataSource](self, "dataSource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "person"));
    v8 = v7 == 0;
LABEL_14:

    goto LABEL_15;
  }
  v9 = self->_identifier;
  MCDPlaylistsViewControllerIdentifier = getMCDPlaylistsViewControllerIdentifier();
  v6 = (void *)objc_claimAutoreleasedReturnValue(MCDPlaylistsViewControllerIdentifier);
  if (!-[NSString isEqualToString:](v9, "isEqualToString:", v6))
  {
    v11 = self->_identifier;
    MCDArtistsViewControllerIdentifier = getMCDArtistsViewControllerIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue(MCDArtistsViewControllerIdentifier);
    if (-[NSString isEqualToString:](v11, "isEqualToString:", v7))
    {
      v8 = 1;
    }
    else
    {
      v13 = self->_identifier;
      MCDCompilationsViewControllerIdentifier = getMCDCompilationsViewControllerIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue(MCDCompilationsViewControllerIdentifier);
      if (-[NSString isEqualToString:](v13, "isEqualToString:", v15))
      {
        v8 = 1;
      }
      else
      {
        v16 = self->_identifier;
        MCDSongsViewControllerIdentifier = getMCDSongsViewControllerIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue(MCDSongsViewControllerIdentifier);
        if (-[NSString isEqualToString:](v16, "isEqualToString:", v18))
        {
          v8 = 1;
        }
        else
        {
          v19 = self->_identifier;
          MCDMadeForYouViewControllerIdentifier = getMCDMadeForYouViewControllerIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue(MCDMadeForYouViewControllerIdentifier);
          v8 = -[NSString isEqualToString:](v19, "isEqualToString:", v21);

        }
      }

    }
    goto LABEL_14;
  }
  v8 = 1;
LABEL_15:

  return v8;
}

- (void)filterButtonTapped
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  id location[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentManager](self, "contentManager"));
  v4 = objc_msgSend(v3, "showFavoriteContent");

  v25 = 0;
  v26 = &v25;
  v27 = 0x2050000000;
  v5 = (void *)getMCDAlertControllerClass_softClass;
  v28 = getMCDAlertControllerClass_softClass;
  if (!getMCDAlertControllerClass_softClass)
  {
    location[0] = _NSConcreteStackBlock;
    location[1] = (id)3221225472;
    location[2] = __getMCDAlertControllerClass_block_invoke;
    location[3] = &unk_1339000;
    location[4] = &v25;
    __getMCDAlertControllerClass_block_invoke((uint64_t)location);
    v5 = (void *)v26[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v25, 8);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("checkmark")));
  v9 = objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController showAllActionTitle:](self, "showAllActionTitle:", self->_identifier));
  objc_initWeak(location, self);
  if (v4)
    v10 = 0;
  else
    v10 = v8;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = __51__MCDLibraryTableViewController_filterButtonTapped__block_invoke;
  v22[3] = &unk_13392F0;
  v22[4] = self;
  objc_copyWeak(&v23, location);
  v19 = (void *)v9;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MCDAlertAction actionWithTitle:image:handler:](MCDAlertAction, "actionWithTitle:image:handler:", v9, v10, v22));
  objc_msgSend(v7, "addAction:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Favorites"), &stru_13E1990, 0));
  if (v4)
    v13 = v8;
  else
    v13 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = __51__MCDLibraryTableViewController_filterButtonTapped__block_invoke_2;
  v20[3] = &unk_13392F0;
  v20[4] = self;
  objc_copyWeak(&v21, location);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCDAlertAction actionWithTitle:image:handler:](MCDAlertAction, "actionWithTitle:image:handler:", v12, v13, v20));

  objc_msgSend(v7, "addAction:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_13E1990, 0));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v16, 1, 0));
  objc_msgSend(v7, "addAction:", v17);

  -[MCDLibraryTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v23);
  objc_destroyWeak(location);

}

void __51__MCDLibraryTableViewController_filterButtonTapped__block_invoke(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  void *v4;
  id WeakRetained;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contentManager"));
  v3 = objc_msgSend(v2, "showFavoriteContent");

  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "filteringPreferenceKey"));
    +[LibraryFilterOptionsController updateFavoriteFilter:storageKey:](_TtC16MusicApplication30LibraryFilterOptionsController, "updateFavoriteFilter:storageKey:", 0, v4);

  }
}

void __51__MCDLibraryTableViewController_filterButtonTapped__block_invoke_2(uint64_t a1)
{
  void *v2;
  unsigned __int8 v3;
  void *v4;
  id WeakRetained;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contentManager"));
  v3 = objc_msgSend(v2, "showFavoriteContent");

  if ((v3 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "filteringPreferenceKey"));
    +[LibraryFilterOptionsController updateFavoriteFilter:storageKey:](_TtC16MusicApplication30LibraryFilterOptionsController, "updateFavoriteFilter:storageKey:", 1, v4);

  }
}

- (id)showAllActionTitle:(id)a3
{
  id v3;
  id MCDPlaylistsViewControllerIdentifier;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  id MCDArtistsViewControllerIdentifier;
  void *v11;
  unsigned int v12;
  id MCDAlbumsViewControllerIdentifier_0;
  void *v14;
  unsigned int v15;
  id MCDCompilationsViewControllerIdentifier;
  void *v17;
  unsigned int v18;
  id MCDSongsViewControllerIdentifier;
  void *v20;
  unsigned int v21;
  id MCDMadeForYouViewControllerIdentifier;
  void *v23;
  unsigned int v24;
  __CFString *v25;

  v3 = a3;
  MCDPlaylistsViewControllerIdentifier = getMCDPlaylistsViewControllerIdentifier();
  v5 = (void *)objc_claimAutoreleasedReturnValue(MCDPlaylistsViewControllerIdentifier);
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = v7;
    v9 = CFSTR("All Playlists");
  }
  else
  {
    MCDArtistsViewControllerIdentifier = getMCDArtistsViewControllerIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue(MCDArtistsViewControllerIdentifier);
    v12 = objc_msgSend(v3, "isEqualToString:", v11);

    if (v12)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v7;
      v9 = CFSTR("All Artists");
    }
    else
    {
      MCDAlbumsViewControllerIdentifier_0 = getMCDAlbumsViewControllerIdentifier_0();
      v14 = (void *)objc_claimAutoreleasedReturnValue(MCDAlbumsViewControllerIdentifier_0);
      v15 = objc_msgSend(v3, "isEqualToString:", v14);

      if (v15)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = v7;
        v9 = CFSTR("All Albums");
      }
      else
      {
        MCDCompilationsViewControllerIdentifier = getMCDCompilationsViewControllerIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue(MCDCompilationsViewControllerIdentifier);
        v18 = objc_msgSend(v3, "isEqualToString:", v17);

        if (v18)
        {
          v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v8 = v7;
          v9 = CFSTR("All Compilations");
        }
        else
        {
          MCDSongsViewControllerIdentifier = getMCDSongsViewControllerIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue(MCDSongsViewControllerIdentifier);
          v21 = objc_msgSend(v3, "isEqualToString:", v20);

          if (v21)
          {
            v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v8 = v7;
            v9 = CFSTR("All Songs");
          }
          else
          {
            MCDMadeForYouViewControllerIdentifier = getMCDMadeForYouViewControllerIdentifier();
            v23 = (void *)objc_claimAutoreleasedReturnValue(MCDMadeForYouViewControllerIdentifier);
            v24 = objc_msgSend(v3, "isEqualToString:", v23);

            if (!v24)
            {
              v25 = &stru_13E1990;
              goto LABEL_14;
            }
            v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v8 = v7;
            v9 = CFSTR("All");
          }
        }
      }
    }
  }
  v25 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_13E1990, 0));

LABEL_14:
  return v25;
}

- (id)favoriteNoContentMessage:(id)a3
{
  id v3;
  id MCDPlaylistsViewControllerIdentifier;
  void *v5;
  id MCDMadeForYouViewControllerIdentifier;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  __CFString *v12;
  id MCDArtistsViewControllerIdentifier;
  void *v15;
  unsigned int v16;
  id MCDAlbumsViewControllerIdentifier_0;
  void *v18;
  id MCDCompilationsViewControllerIdentifier;
  void *v20;
  unsigned int v21;
  id MCDSongsViewControllerIdentifier;
  void *v23;
  unsigned int v24;

  v3 = a3;
  MCDPlaylistsViewControllerIdentifier = getMCDPlaylistsViewControllerIdentifier();
  v5 = (void *)objc_claimAutoreleasedReturnValue(MCDPlaylistsViewControllerIdentifier);
  if (objc_msgSend(v3, "isEqualToString:", v5))
  {

LABEL_4:
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = v9;
    v11 = CFSTR("Playlists you favorite will appear here.");
    goto LABEL_5;
  }
  MCDMadeForYouViewControllerIdentifier = getMCDMadeForYouViewControllerIdentifier();
  v7 = (void *)objc_claimAutoreleasedReturnValue(MCDMadeForYouViewControllerIdentifier);
  v8 = objc_msgSend(v3, "isEqualToString:", v7);

  if (v8)
    goto LABEL_4;
  MCDArtistsViewControllerIdentifier = getMCDArtistsViewControllerIdentifier();
  v15 = (void *)objc_claimAutoreleasedReturnValue(MCDArtistsViewControllerIdentifier);
  v16 = objc_msgSend(v3, "isEqualToString:", v15);

  if (v16)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = v9;
    v11 = CFSTR("Artists you favorite will appear here.");
    goto LABEL_5;
  }
  MCDAlbumsViewControllerIdentifier_0 = getMCDAlbumsViewControllerIdentifier_0();
  v18 = (void *)objc_claimAutoreleasedReturnValue(MCDAlbumsViewControllerIdentifier_0);
  if (objc_msgSend(v3, "isEqualToString:", v18))
  {

LABEL_12:
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = v9;
    v11 = CFSTR("Albums you favorite will appear here.");
    goto LABEL_5;
  }
  MCDCompilationsViewControllerIdentifier = getMCDCompilationsViewControllerIdentifier();
  v20 = (void *)objc_claimAutoreleasedReturnValue(MCDCompilationsViewControllerIdentifier);
  v21 = objc_msgSend(v3, "isEqualToString:", v20);

  if (v21)
    goto LABEL_12;
  MCDSongsViewControllerIdentifier = getMCDSongsViewControllerIdentifier();
  v23 = (void *)objc_claimAutoreleasedReturnValue(MCDSongsViewControllerIdentifier);
  v24 = objc_msgSend(v3, "isEqualToString:", v23);

  if (!v24)
  {
    v12 = &stru_13E1990;
    goto LABEL_6;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = v9;
  v11 = CFSTR("Songs you favorite will appear here.");
LABEL_5:
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_13E1990, 0));

LABEL_6:
  return v12;
}

- (BOOL)hasRowsToDisplay
{
  objc_super v3;

  if (self->_isShowingButton)
    return 1;
  v3.receiver = self;
  v3.super_class = (Class)MCDLibraryTableViewController;
  return -[MCDTableViewController hasRowsToDisplay](&v3, "hasRowsToDisplay");
}

- (void)contentManager:(id)a3 didReceiveResponse:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  _BYTE v19[24];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  unsigned int v24;
  __int16 v25;
  void *v26;

  v6 = a3;
  v7 = a4;
  *(_QWORD *)v19 = 0;
  *(_QWORD *)&v19[8] = v19;
  *(_QWORD *)&v19[16] = 0x2020000000;
  v8 = getMCDMusicGeneralLoggingSymbolLoc_ptr_1;
  v20 = getMCDMusicGeneralLoggingSymbolLoc_ptr_1;
  if (!getMCDMusicGeneralLoggingSymbolLoc_ptr_1)
  {
    v9 = (void *)MusicCarDisplayUILibrary_2();
    v8 = dlsym(v9, "MCDMusicGeneralLogging");
    *(_QWORD *)(*(_QWORD *)&v19[8] + 24) = v8;
    getMCDMusicGeneralLoggingSymbolLoc_ptr_1 = v8;
  }
  _Block_object_dispose(v19, 8);
  if (!v8)
  {
    soft_MCDMusicGeneralLogging_cold_1();
    __break(1u);
  }
  v11 = ((uint64_t (*)(uint64_t))v8)(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "results", *(_QWORD *)v19));
    v14 = objc_msgSend(v13, "totalItemCount");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentManager](self, "contentManager"));
    v16 = objc_msgSend(v15, "showFavoriteContent");
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "request"));
    *(_DWORD *)v19 = 138413570;
    *(_QWORD *)&v19[4] = self;
    *(_WORD *)&v19[12] = 2112;
    *(_QWORD *)&v19[14] = v7;
    *(_WORD *)&v19[22] = 2112;
    v20 = v6;
    v21 = 2048;
    v22 = v14;
    v23 = 1024;
    v24 = v16;
    v25 = 2112;
    v26 = v17;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%@ Received response %@ from %@: itemCount=%ld, showFavoriteContent=%d, request=%@", v19, 0x3Au);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController tableView](self, "tableView"));
  objc_msgSend(v18, "reloadData");

  -[MCDLibraryTableViewController checkContentAndSetView](self, "checkContentAndSetView");
}

- (id)contentManager:(id)a3 viewControllerForItem:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  id v13;
  MCDPlaylistTracksTableViewController *v14;

  v5 = a4;
  v6 = objc_opt_class(MPModelGenre);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[MCDAlbumsTableViewController albumsForGenre:limitedUI:showLocalContent:](MCDAlbumsTableViewController, "albumsForGenre:limitedUI:showLocalContent:", v5, -[MCDTableViewController limitedUI](self, "limitedUI"), -[MCDLibraryTableViewController showLocalContent](self, "showLocalContent")));
LABEL_7:
    v10 = (void *)v7;
    goto LABEL_8;
  }
  v8 = objc_opt_class(MPModelAlbum);
  if ((objc_opt_isKindOfClass(v5, v8) & 1) != 0)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[MCDAlbumTracksTableViewController albumTracksViewControllerForContentItem:limitedUI:showLocalContent:](MCDAlbumTracksTableViewController, "albumTracksViewControllerForContentItem:limitedUI:showLocalContent:", v5, -[MCDTableViewController limitedUI](self, "limitedUI"), -[MCDLibraryTableViewController showLocalContent](self, "showLocalContent")));
    goto LABEL_7;
  }
  v9 = objc_opt_class(MPModelPerson);
  if ((objc_opt_isKindOfClass(v5, v9) & 1) != 0)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[MCDAlbumsTableViewController albumsForPerson:limitedUI:showLocalContent:](MCDAlbumsTableViewController, "albumsForPerson:limitedUI:showLocalContent:", v5, -[MCDTableViewController limitedUI](self, "limitedUI"), -[MCDLibraryTableViewController showLocalContent](self, "showLocalContent")));
    goto LABEL_7;
  }
  v12 = objc_opt_class(MPModelPlaylist);
  if ((objc_opt_isKindOfClass(v5, v12) & 1) != 0)
  {
    v13 = v5;
    if (objc_msgSend(v13, "type") == (char *)&dword_0 + 3)
      v14 = (MCDPlaylistTracksTableViewController *)objc_claimAutoreleasedReturnValue(+[MCDPlaylistsViewController playlistsViewControllerForFolder:limitedUI:showLocalContent:](MCDPlaylistsViewController, "playlistsViewControllerForFolder:limitedUI:showLocalContent:", v13, -[MCDTableViewController limitedUI](self, "limitedUI"), -[MCDLibraryTableViewController showLocalContent](self, "showLocalContent")));
    else
      v14 = -[MCDPlaylistTracksTableViewController initWithPlaylist:limitedUI:showLocalContent:]([MCDPlaylistTracksTableViewController alloc], "initWithPlaylist:limitedUI:showLocalContent:", v13, -[MCDTableViewController limitedUI](self, "limitedUI"), -[MCDLibraryTableViewController showLocalContent](self, "showLocalContent"));
    v10 = v14;

  }
  else
  {
    v10 = 0;
  }
LABEL_8:

  return v10;
}

- (BOOL)contentManager:(id)a3 canDrillIntoItem:(id)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char isKindOfClass;
  uint64_t v10;

  v4 = a4;
  v5 = objc_opt_class(MPModelGenre);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0
    || (v6 = objc_opt_class(MPModelAlbum), (objc_opt_isKindOfClass(v4, v6) & 1) != 0)
    || (v7 = objc_opt_class(MPModelPerson), (objc_opt_isKindOfClass(v4, v7) & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    v10 = objc_opt_class(MPModelPlaylist);
    isKindOfClass = objc_opt_isKindOfClass(v4, v10);
  }

  return isKindOfClass & 1;
}

- (void)contentManager:(id)a3 shouldDisplayViewController:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(v5, "setPlayActivityFeatureNameSourceViewController:", self);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController navigationController](self, "navigationController"));
  objc_msgSend(v6, "pushViewController:animated:", v5, 1);

}

- (void)playbackManagerShouldShowNowPlaying:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController navigationController](self, "navigationController", a3));
  objc_msgSend(v4, "MCD_pushNowPlayingViewControllerAnimated:fromViewController:", 1, self);

}

- (void)didTapButton:(id)a3
{
  MCDContentManagerDataSource *dataSource;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  dataSource = self->_dataSource;
  v5 = objc_opt_class(MCDAlbumsDataSource);
  if ((objc_opt_isKindOfClass(dataSource, v5) & 1) != 0)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[MCDContentManagerDataSource person](self->_dataSource, "person"));
    if (v9)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentManager](self, "contentManager"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "playbackManager"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController playActivityFeatureName](self, "playActivityFeatureName"));
      objc_msgSend(v7, "initiateRadioPlaybackForArtist:playActivityFeatureName:", v9, v8);

    }
  }
}

- (void)checkContentAndSetView
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  MCDContentManagerDataSource *dataSource;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;

  self->_isShowingButton = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentManager](self, "contentManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastReceivedResponse"));
  if ((objc_msgSend(v4, "isEmpty") & 1) == 0)
  {

LABEL_5:
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentManager](self, "contentManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastReceivedResponse"));
    v10 = objc_msgSend(v9, "isEmpty");

    if (!v10)
    {
      -[MCDLibraryTableViewController replacePlaceholderViewWithView:](self, "replacePlaceholderViewWithView:", 0);
      return;
    }
    if (-[MCDLibraryTableViewController showLocalContent](self, "showLocalContent"))
    {
      v30 = (id)objc_claimAutoreleasedReturnValue(+[NSString downloadedOnlyMessage](NSString, "downloadedOnlyMessage"));
    }
    else
    {
      dataSource = self->_dataSource;
      v12 = objc_opt_class(MCDAlbumsDataSource);
      if ((objc_opt_isKindOfClass(dataSource, v12) & 1) != 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCDContentManagerDataSource person](self->_dataSource, "person"));

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCDContentManagerDataSource person](self->_dataSource, "person"));
          v15 = -[MCDLibraryTableViewController artistHasCatalogID:](self, "artistHasCatalogID:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v17 = v16;
          if (v15)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Add music by %@ to save it here, or start a station to hear similar music."), &stru_13E1990, 0));
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController title](self, "title"));
            v30 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v19));

            v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Start Station"), &stru_13E1990, 0));

            self->_isShowingButton = 1;
          }
          else
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Add music by %@ to save it here."), &stru_13E1990, 0));
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController title](self, "title"));
            v30 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v28, v29));

            v21 = 0;
          }

          goto LABEL_18;
        }
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[MusicCarPlayApplicationCapabilitiesController sharedController](MusicCarPlayApplicationCapabilitiesController, "sharedController"));
      v23 = objc_msgSend(v22, "subscriptionCapabilities");

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = v24;
      if ((v23 & 1) != 0)
        v26 = CFSTR("Music added from Apple Music, from your computer, or purchased in iTunes will appear here.");
      else
        v26 = CFSTR("Music purchased in iTunes or added from your computer will appear here.");
      v30 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", v26, &stru_13E1990, 0));

    }
    v21 = 0;
LABEL_18:
    v27 = objc_msgSend(objc_alloc((Class)getMCDNoContentViewClass()), "initWithTitle:subtitle:buttonText:", 0, v30, v21);
    objc_msgSend(v27, "setDelegate:", self);
    -[MCDLibraryTableViewController replacePlaceholderViewWithView:](self, "replacePlaceholderViewWithView:", v27);

    goto LABEL_19;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentManager](self, "contentManager"));
  v6 = objc_msgSend(v5, "showFavoriteContent");

  if (!v6)
    goto LABEL_5;
  v30 = (id)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController favoriteNoContentMessage:](self, "favoriteNoContentMessage:", self->_identifier));
  v7 = objc_msgSend(objc_alloc((Class)getMCDNoContentViewClass()), "initWithTitle:subtitle:", 0, v30);
  -[MCDLibraryTableViewController replacePlaceholderViewWithView:](self, "replacePlaceholderViewWithView:", v7);

LABEL_19:
}

- (void)replacePlaceholderViewWithView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v4 = a3;
  if (self->_canModifyView)
  {
    v27 = v4;
    -[MCDLibraryTableViewController setPlaceholderView:](self, "setPlaceholderView:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController placeholderView](self, "placeholderView"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController tableView](self, "tableView"));
      objc_msgSend(v6, "frame");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController tableView](self, "tableView"));
      objc_msgSend(v15, "safeAreaInsets");
      v17 = v8 + v16;
      v19 = v10 + v18;
      v21 = v12 - (v16 + v20);
      v23 = v14 - (v18 + v22);

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController placeholderView](self, "placeholderView"));
      objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController placeholderView](self, "placeholderView"));
      -[MCDLibraryTableViewController setView:](self, "setView:", v25);
    }
    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentTableView](self, "contentTableView"));
      -[MCDLibraryTableViewController setView:](self, "setView:", v26);

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentTableView](self, "contentTableView"));
      objc_msgSend(v25, "reloadData");
    }

    v4 = v27;
  }

}

- (BOOL)artistHasCatalogID:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  BOOL v7;
  _QWORD v9[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifiers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "universalStore"));

  if (v4)
  {
    v9[1] = objc_msgSend(v4, "purchasedAdamID", objc_msgSend(v4, "subscriptionAdamID"));
    v5 = objc_msgSend(v4, "adamID");
    v6 = 0;
    v9[2] = v5;
    while (!v9[v6])
    {
      if (++v6 == 3)
        goto LABEL_5;
    }
    v7 = 1;
  }
  else
  {
LABEL_5:
    v7 = 0;
  }

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isShowingButton
{
  return self->_isShowingButton;
}

- (void)setIsShowingButton:(BOOL)a3
{
  self->_isShowingButton = a3;
}

- (_MCDContentManager)contentManager
{
  return self->_contentManager;
}

- (void)setContentManager:(id)a3
{
  objc_storeStrong((id *)&self->_contentManager, a3);
}

- (MCDContentManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (BOOL)showLocalContent
{
  return self->_showLocalContent;
}

- (void)setShowLocalContent:(BOOL)a3
{
  self->_showLocalContent = a3;
}

- (MCDTableView)contentTableView
{
  return self->_contentTableView;
}

- (void)setContentTableView:(id)a3
{
  objc_storeStrong((id *)&self->_contentTableView, a3);
}

- (UIView)placeholderView
{
  return self->_placeholderView;
}

- (void)setPlaceholderView:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderView, a3);
}

- (_TtC16MusicApplication31LibraryTableNavigationTitleView)navigationTitleView
{
  return self->_navigationTitleView;
}

- (void)setNavigationTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_navigationTitleView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationTitleView, 0);
  objc_storeStrong((id *)&self->_placeholderView, 0);
  objc_storeStrong((id *)&self->_contentTableView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_contentManager, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
