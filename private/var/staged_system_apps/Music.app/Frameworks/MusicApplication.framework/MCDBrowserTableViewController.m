@implementation MCDBrowserTableViewController

- (MCDBrowserTableViewController)initWithLimitedUI:(BOOL)a3
{
  MCDBrowserTableViewController *v3;
  MCDBrowserTableViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCDBrowserTableViewController;
  v3 = -[MCDTableViewController initWithLimitedUI:](&v6, "initWithLimitedUI:", a3);
  v4 = v3;
  if (v3)
    -[MCDBrowserTableViewController setPlayActivityFeatureName:](v3, "setPlayActivityFeatureName:", CFSTR("library"));
  return v4;
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
  v5.super_class = (Class)MCDBrowserTableViewController;
  -[MCDBrowserTableViewController dealloc](&v5, "dealloc");
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  void *v5;
  MCDLibraryPlaybackManager *v6;
  MCDRecentlyAddedDataSource *v7;
  MCDLibraryContentManager *v8;
  void *v9;
  _BOOL8 v10;
  _BOOL8 v11;
  void *v12;
  MCDLibraryContentManager *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)MCDBrowserTableViewController;
  -[MCDTableViewController viewDidLoad](&v20, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowserTableViewController tableView](self, "tableView"));
  v4 = objc_opt_class(MCDLibraryMenuTableViewCell);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_MCDReusableCell reuseIdentifier](MCDLibraryMenuTableViewCell, "reuseIdentifier"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v4, v5);

  v6 = -[MCDPlaybackManager initWithDelegate:]([MCDLibraryPlaybackManager alloc], "initWithDelegate:", self);
  -[MCDBrowserTableViewController setLibraryPlaybackManager:](self, "setLibraryPlaybackManager:", v6);

  v7 = -[_MCDLibraryDataSource initWithLimitedUI:]([MCDRecentlyAddedDataSource alloc], "initWithLimitedUI:", -[MCDTableViewController limitedUI](self, "limitedUI"));
  -[MCDBrowserTableViewController setRecentlyAddedDataSource:](self, "setRecentlyAddedDataSource:", v7);

  v8 = [MCDLibraryContentManager alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowserTableViewController recentlyAddedDataSource](self, "recentlyAddedDataSource"));
  v10 = -[MCDTableViewController limitedUI](self, "limitedUI");
  v11 = -[MCDBrowserTableViewController showOnlyLocalContent](self, "showOnlyLocalContent");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowserTableViewController libraryPlaybackManager](self, "libraryPlaybackManager"));
  LOBYTE(v19) = 1;
  v13 = -[_MCDContentManager initWithDataSource:limitedUI:showLocalContent:delegate:viewController:playbackManager:shouldPerformRequestImmediately:](v8, "initWithDataSource:limitedUI:showLocalContent:delegate:viewController:playbackManager:shouldPerformRequestImmediately:", v9, v10, v11, self, self, v12, v19);
  -[MCDBrowserTableViewController setRecentlyAddedContentManager:](self, "setRecentlyAddedContentManager:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowserTableViewController tableView](self, "tableView"));
  -[MCDBrowserTableViewController setContentTableView:](self, "setContentTableView:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MCDBrowserIdentifiers sharedInstance](MCDBrowserIdentifiers, "sharedInstance"));
  objc_msgSend(v15, "_identifiersDidChange");

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCDBrowserIdentifiers sharedInstance](MCDBrowserIdentifiers, "sharedInstance"));
  objc_msgSend(v16, "_updateCellIdentifiersOrdering");

  -[MCDBrowserTableViewController _loadCellIdentifiers](self, "_loadCellIdentifiers");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v17, "addObserver:selector:name:object:", self, "_updateCellOrdering:", NSUserDefaultsDidChangeNotification, 0);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v18, "addObserver:selector:name:object:", self, "_showContentView:", MPMediaLibraryDidChangeNotification, 0);

}

- (void)_limitedUIDidChange
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowserTableViewController viewControllers](self, "viewControllers", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), "setLimitedUI:", -[MCDTableViewController limitedUI](self, "limitedUI"));
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowserTableViewController recentlyAddedContentManager](self, "recentlyAddedContentManager"));
  objc_msgSend(v8, "setLimitedUI:", -[MCDTableViewController limitedUI](self, "limitedUI"));

}

- (id)_textForHeaderView
{
  return 0;
}

- (void)_updateCellOrdering:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __53__MCDBrowserTableViewController__updateCellOrdering___block_invoke;
  block[3] = &unk_1338FD8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __53__MCDBrowserTableViewController__updateCellOrdering___block_invoke(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCDBrowserIdentifiers sharedInstance](MCDBrowserIdentifiers, "sharedInstance"));
  v3 = objc_msgSend(v2, "_identifiersDidChange");

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCDBrowserIdentifiers sharedInstance](MCDBrowserIdentifiers, "sharedInstance"));
    objc_msgSend(v4, "_updateCellIdentifiersOrdering");

    objc_msgSend(*(id *)(a1 + 32), "_loadCellIdentifiers");
  }
}

- (unint64_t)_contentGroups
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *i;
  void *v9;
  id MCDAlbumsViewControllerIdentifier_1;
  void *v11;
  unsigned int v12;
  id MCDSongsViewControllerIdentifier_0;
  void *v14;
  unsigned int v15;
  id MCDPlaylistsViewControllerIdentifier_0;
  void *v17;
  unsigned int v18;
  id MCDArtistsViewControllerIdentifier_0;
  void *v20;
  unsigned int v21;
  id MCDGenresViewControllerIdentifier;
  void *v23;
  unsigned int v24;
  id MCDCompilationsViewControllerIdentifier_0;
  void *v26;
  unsigned int v27;
  id MCDComposersViewControllerIdentifier;
  void *v29;
  unsigned int v30;
  id MCDRecentlyAddedControllerIdentifier;
  void *v32;
  unsigned int v33;
  id MCDMadeForYouViewControllerIdentifier_0;
  void *v35;
  unsigned int v36;
  void *v37;
  id v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];

  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCDBrowserIdentifiers sharedInstance](MCDBrowserIdentifiers, "sharedInstance", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "cellIdentifiers"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v41 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
        MCDAlbumsViewControllerIdentifier_1 = getMCDAlbumsViewControllerIdentifier_1();
        v11 = (void *)objc_claimAutoreleasedReturnValue(MCDAlbumsViewControllerIdentifier_1);
        v12 = objc_msgSend(v9, "isEqualToString:", v11);

        if (v12)
        {
          v6 |= 1uLL;
        }
        else
        {
          MCDSongsViewControllerIdentifier_0 = getMCDSongsViewControllerIdentifier_0();
          v14 = (void *)objc_claimAutoreleasedReturnValue(MCDSongsViewControllerIdentifier_0);
          v15 = objc_msgSend(v9, "isEqualToString:", v14);

          if (v15)
          {
            v6 |= 0x80uLL;
          }
          else
          {
            MCDPlaylistsViewControllerIdentifier_0 = getMCDPlaylistsViewControllerIdentifier_0();
            v17 = (void *)objc_claimAutoreleasedReturnValue(MCDPlaylistsViewControllerIdentifier_0);
            v18 = objc_msgSend(v9, "isEqualToString:", v17);

            if (v18)
            {
              v6 |= 0x40uLL;
            }
            else
            {
              MCDArtistsViewControllerIdentifier_0 = getMCDArtistsViewControllerIdentifier_0();
              v20 = (void *)objc_claimAutoreleasedReturnValue(MCDArtistsViewControllerIdentifier_0);
              v21 = objc_msgSend(v9, "isEqualToString:", v20);

              if (v21)
              {
                v6 |= 2uLL;
              }
              else
              {
                MCDGenresViewControllerIdentifier = getMCDGenresViewControllerIdentifier();
                v23 = (void *)objc_claimAutoreleasedReturnValue(MCDGenresViewControllerIdentifier);
                v24 = objc_msgSend(v9, "isEqualToString:", v23);

                if (v24)
                {
                  v6 |= 0x10uLL;
                }
                else
                {
                  MCDCompilationsViewControllerIdentifier_0 = getMCDCompilationsViewControllerIdentifier_0();
                  v26 = (void *)objc_claimAutoreleasedReturnValue(MCDCompilationsViewControllerIdentifier_0);
                  v27 = objc_msgSend(v9, "isEqualToString:", v26);

                  if (v27)
                  {
                    v6 |= 4uLL;
                  }
                  else
                  {
                    MCDComposersViewControllerIdentifier = getMCDComposersViewControllerIdentifier();
                    v29 = (void *)objc_claimAutoreleasedReturnValue(MCDComposersViewControllerIdentifier);
                    v30 = objc_msgSend(v9, "isEqualToString:", v29);

                    if (v30)
                    {
                      v6 |= 8uLL;
                    }
                    else
                    {
                      MCDRecentlyAddedControllerIdentifier = getMCDRecentlyAddedControllerIdentifier();
                      v32 = (void *)objc_claimAutoreleasedReturnValue(MCDRecentlyAddedControllerIdentifier);
                      v33 = objc_msgSend(v9, "isEqualToString:", v32);

                      if (v33)
                      {
                        v6 |= 0x41uLL;
                      }
                      else
                      {
                        MCDMadeForYouViewControllerIdentifier_0 = getMCDMadeForYouViewControllerIdentifier_0();
                        v35 = (void *)objc_claimAutoreleasedReturnValue(MCDMadeForYouViewControllerIdentifier_0);
                        v36 = objc_msgSend(v9, "isEqualToString:", v35);

                        if (v36)
                          v6 |= 0x400uLL;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary"));
  v38 = objc_msgSend(v37, "filterAvailableContentGroups:withOptions:", v6, 0);

  return (unint64_t)v38;
}

- (void)_loadCellIdentifiers
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id MCDAlbumsViewControllerIdentifier_1;
  void *v12;
  unsigned __int8 v13;
  MCDCompilationsTableViewController *v14;
  id MCDSongsViewControllerIdentifier_0;
  void *v16;
  unsigned __int8 v17;
  id MCDRecentlyAddedControllerIdentifier;
  void *v19;
  unsigned int v20;
  id MCDPlaylistsViewControllerIdentifier_0;
  void *v22;
  unsigned int v23;
  id MCDMadeForYouViewControllerIdentifier_0;
  void *v25;
  unsigned int v26;
  id MCDArtistsViewControllerIdentifier_0;
  void *v28;
  unsigned __int8 v29;
  MCDCompilationsTableViewController *v30;
  void *v31;
  void *v32;
  void *v33;
  id MCDGenresViewControllerIdentifier;
  void *v35;
  unsigned __int8 v36;
  id MCDCompilationsViewControllerIdentifier_0;
  void *v38;
  unsigned __int8 v39;
  id MCDComposersViewControllerIdentifier;
  void *v41;
  unsigned __int8 v42;
  id MCDDownloadedMusicViewControllerIdentifier;
  unsigned __int8 v44;
  void *v45;
  unsigned int v46;
  id v47;
  NSArray *v48;
  NSArray *viewControllers;
  void *v50;
  void *v51;
  _BOOL4 v52;
  void *v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  void *v57;
  objc_class *v58;
  id v59;
  unsigned int v60;
  char v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[5];
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  _BYTE v72[128];

  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = -[MCDBrowserTableViewController _contentGroups](self, "_contentGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MusicCarPlayManager sharedManager](MusicCarPlayManager, "sharedManager"));
  v60 = objc_msgSend(v4, "libraryHasContent");

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCDBrowserIdentifiers sharedInstance](MCDBrowserIdentifiers, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cellIdentifiers"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
  if (v7)
  {
    v61 = v60 ^ 1;
    v8 = *(_QWORD *)v64;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v64 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)v9);
        MCDAlbumsViewControllerIdentifier_1 = getMCDAlbumsViewControllerIdentifier_1();
        v12 = (void *)objc_claimAutoreleasedReturnValue(MCDAlbumsViewControllerIdentifier_1);
        v13 = objc_msgSend(v10, "isEqualToString:", v12);

        if ((v13 & v3 & 1) != 0)
        {
          v14 = -[MCDAlbumsTableViewController initWithIdentifier:limitedUI:showLocalContent:]([MCDAlbumsTableViewController alloc], "initWithIdentifier:limitedUI:showLocalContent:", v10, -[MCDTableViewController limitedUI](self, "limitedUI"), -[MCDBrowserTableViewController showOnlyLocalContent](self, "showOnlyLocalContent"));
LABEL_18:
          v30 = v14;
          if (!v14)
            goto LABEL_21;
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowserTableViewController titleForIdentifier:](self, "titleForIdentifier:", v10));
          -[MCDCompilationsTableViewController setTitle:](v30, "setTitle:", v31);

          v32 = (void *)objc_claimAutoreleasedReturnValue(+[MCDBrowserIdentifiers symbolImageForIdentifier:](MCDBrowserIdentifiers, "symbolImageForIdentifier:", v10));
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[MCDCompilationsTableViewController tabBarItem](v30, "tabBarItem"));
          objc_msgSend(v33, "setImage:", v32);

          objc_msgSend(v62, "addObject:", v30);
LABEL_20:

          goto LABEL_21;
        }
        MCDSongsViewControllerIdentifier_0 = getMCDSongsViewControllerIdentifier_0();
        v16 = (void *)objc_claimAutoreleasedReturnValue(MCDSongsViewControllerIdentifier_0);
        v17 = objc_msgSend(v10, "isEqualToString:", v16);

        if ((v17 & ((v3 & 0x80) != 0)) != 0)
        {
          v14 = -[MCDSongsTableViewController initWithIdentifier:limitedUI:showLocalContent:]([MCDSongsTableViewController alloc], "initWithIdentifier:limitedUI:showLocalContent:", v10, -[MCDTableViewController limitedUI](self, "limitedUI"), -[MCDBrowserTableViewController showOnlyLocalContent](self, "showOnlyLocalContent"));
          goto LABEL_18;
        }
        MCDRecentlyAddedControllerIdentifier = getMCDRecentlyAddedControllerIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue(MCDRecentlyAddedControllerIdentifier);
        v20 = objc_msgSend(v10, "isEqualToString:", v19);

        if (!((v20 ^ 1) & 1 | (v3 == 0) | v61 & 1))
        {
          v14 = -[MCDRecentlyAddedTableViewController initWithIdentifier:limitedUI:showLocalContent:]([MCDRecentlyAddedTableViewController alloc], "initWithIdentifier:limitedUI:showLocalContent:", v10, -[MCDTableViewController limitedUI](self, "limitedUI"), -[MCDBrowserTableViewController showOnlyLocalContent](self, "showOnlyLocalContent"));
          goto LABEL_18;
        }
        MCDPlaylistsViewControllerIdentifier_0 = getMCDPlaylistsViewControllerIdentifier_0();
        v22 = (void *)objc_claimAutoreleasedReturnValue(MCDPlaylistsViewControllerIdentifier_0);
        v23 = objc_msgSend(v10, "isEqualToString:", v22);

        if (!((v23 ^ 1) & 1 | ((v3 & 0x40) == 0) | v61 & 1))
        {
          v14 = -[MCDPlaylistsViewController initWithIdentifier:limitedUI:showLocalContent:]([MCDPlaylistsViewController alloc], "initWithIdentifier:limitedUI:showLocalContent:", v10, -[MCDTableViewController limitedUI](self, "limitedUI"), -[MCDBrowserTableViewController showOnlyLocalContent](self, "showOnlyLocalContent"));
          goto LABEL_18;
        }
        MCDMadeForYouViewControllerIdentifier_0 = getMCDMadeForYouViewControllerIdentifier_0();
        v25 = (void *)objc_claimAutoreleasedReturnValue(MCDMadeForYouViewControllerIdentifier_0);
        v26 = objc_msgSend(v10, "isEqualToString:", v25);

        if (!((v26 ^ 1) & 1 | ((v3 & 0x400) == 0) | v61 & 1))
        {
          v14 = (MCDCompilationsTableViewController *)objc_claimAutoreleasedReturnValue(+[MCDPlaylistsViewController madeForYouViewControllerWithIdentifier:limitedUI:showLocalContent:](MCDPlaylistsViewController, "madeForYouViewControllerWithIdentifier:limitedUI:showLocalContent:", v10, -[MCDTableViewController limitedUI](self, "limitedUI"), -[MCDBrowserTableViewController showOnlyLocalContent](self, "showOnlyLocalContent")));
          goto LABEL_18;
        }
        MCDArtistsViewControllerIdentifier_0 = getMCDArtistsViewControllerIdentifier_0();
        v28 = (void *)objc_claimAutoreleasedReturnValue(MCDArtistsViewControllerIdentifier_0);
        v29 = objc_msgSend(v10, "isEqualToString:", v28);

        if ((v29 & ((v3 & 2) != 0)) != 0)
        {
          v14 = -[MCDArtistsTableViewController initWithIdentifier:limitedUI:showLocalContent:]([MCDArtistsTableViewController alloc], "initWithIdentifier:limitedUI:showLocalContent:", v10, -[MCDTableViewController limitedUI](self, "limitedUI"), -[MCDBrowserTableViewController showOnlyLocalContent](self, "showOnlyLocalContent"));
          goto LABEL_18;
        }
        MCDGenresViewControllerIdentifier = getMCDGenresViewControllerIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue(MCDGenresViewControllerIdentifier);
        v36 = objc_msgSend(v10, "isEqualToString:", v35);

        if ((v36 & ((v3 & 0x10) != 0)) != 0)
        {
          v14 = -[MCDGenresViewController initWithIdentifier:limitedUI:showLocalContent:]([MCDGenresViewController alloc], "initWithIdentifier:limitedUI:showLocalContent:", v10, -[MCDTableViewController limitedUI](self, "limitedUI"), -[MCDBrowserTableViewController showOnlyLocalContent](self, "showOnlyLocalContent"));
          goto LABEL_18;
        }
        MCDCompilationsViewControllerIdentifier_0 = getMCDCompilationsViewControllerIdentifier_0();
        v38 = (void *)objc_claimAutoreleasedReturnValue(MCDCompilationsViewControllerIdentifier_0);
        v39 = objc_msgSend(v10, "isEqualToString:", v38);

        if ((v39 & ((v3 & 4) != 0)) != 0)
        {
          v14 = -[MCDCompilationsTableViewController initWithIdentifier:limitedUI:showLocalContent:]([MCDCompilationsTableViewController alloc], "initWithIdentifier:limitedUI:showLocalContent:", v10, -[MCDTableViewController limitedUI](self, "limitedUI"), -[MCDBrowserTableViewController showOnlyLocalContent](self, "showOnlyLocalContent"));
          goto LABEL_18;
        }
        MCDComposersViewControllerIdentifier = getMCDComposersViewControllerIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue(MCDComposersViewControllerIdentifier);
        v42 = objc_msgSend(v10, "isEqualToString:", v41);

        if ((v42 & ((v3 & 8) != 0)) != 0)
        {
          v14 = -[MCDComposersTableViewController initWithIdentifier:limitedUI:showLocalContent:]([MCDComposersTableViewController alloc], "initWithIdentifier:limitedUI:showLocalContent:", v10, -[MCDTableViewController limitedUI](self, "limitedUI"), -[MCDBrowserTableViewController showOnlyLocalContent](self, "showOnlyLocalContent"));
          goto LABEL_18;
        }
        MCDDownloadedMusicViewControllerIdentifier = getMCDDownloadedMusicViewControllerIdentifier();
        v30 = (MCDCompilationsTableViewController *)objc_claimAutoreleasedReturnValue(MCDDownloadedMusicViewControllerIdentifier);
        if (!objc_msgSend(v10, "isEqualToString:", v30))
          goto LABEL_20;
        v44 = -[MCDBrowserTableViewController showOnlyLocalContent](self, "showOnlyLocalContent");

        if ((v44 & 1) == 0)
        {
          v45 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary deviceMediaLibrary](MPMediaLibrary, "deviceMediaLibrary"));
          v46 = objc_msgSend(v45, "filterAvailableContentGroups:withOptions:", 128, 2) ? v60 : 0;

          if (v46)
          {
            v14 = -[MCDLocalBrowserTableViewController initWithLimitedUI:]([MCDLocalBrowserTableViewController alloc], "initWithLimitedUI:", -[MCDTableViewController limitedUI](self, "limitedUI"));
            goto LABEL_18;
          }
        }
LABEL_21:
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v47 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
      v7 = v47;
    }
    while (v47);
  }

  v48 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v62));
  viewControllers = self->_viewControllers;
  self->_viewControllers = v48;

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowserTableViewController tableView](self, "tableView"));
  objc_msgSend(v50, "reloadData");

  if ((v60 & 1) != 0)
  {
    -[MCDBrowserTableViewController _replacePlaceholderViewWithView:](self, "_replacePlaceholderViewWithView:", 0);
  }
  else
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[MusicCarPlayApplicationCapabilitiesController sharedController](MusicCarPlayApplicationCapabilitiesController, "sharedController"));
    v52 = ((unint64_t)objc_msgSend(v51, "subscriptionCapabilities") & 1) == 0;
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v54 = v53;
    if (v52)
      v55 = CFSTR("Music purchased in iTunes or added from your computer will appear here.");
    else
      v55 = CFSTR("Music added from Apple Music, from your computer, or purchased in iTunes will appear here.");
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "localizedStringForKey:value:table:", v55, &stru_13E1990, 0));

    v68 = 0;
    v69 = &v68;
    v70 = 0x2050000000;
    v57 = (void *)getMCDNoContentViewClass_softClass_1;
    v71 = getMCDNoContentViewClass_softClass_1;
    if (!getMCDNoContentViewClass_softClass_1)
    {
      v67[0] = _NSConcreteStackBlock;
      v67[1] = 3221225472;
      v67[2] = __getMCDNoContentViewClass_block_invoke_1;
      v67[3] = &unk_1339000;
      v67[4] = &v68;
      __getMCDNoContentViewClass_block_invoke_1((uint64_t)v67);
      v57 = (void *)v69[3];
    }
    v58 = objc_retainAutorelease(v57);
    _Block_object_dispose(&v68, 8);
    v59 = objc_msgSend([v58 alloc], "initWithTitle:subtitle:", 0, v56);
    -[MCDBrowserTableViewController _replacePlaceholderViewWithView:](self, "_replacePlaceholderViewWithView:", v59);

  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_viewControllers, "count", a3, a4);
}

- (BOOL)wantsGridCellAtIndexPath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  char isKindOfClass;

  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  if (v5 >= (id)-[NSArray count](self->_viewControllers, "count"))
  {
    isKindOfClass = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_viewControllers, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));
    v7 = objc_opt_class(MCDRecentlyAddedTableViewController);
    isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  }
  return isKindOfClass & 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  NSMutableArray *v7;
  NSMutableArray *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id location;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v24 = a3;
  v6 = a4;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_viewControllers, "objectAtIndexedSubscript:", objc_msgSend(v6, "indexAtPosition:", (char *)objc_msgSend(v6, "length") - 1)));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "title"));
  if (-[MCDBrowserTableViewController wantsGridCellAtIndexPath:](self, "wantsGridCellAtIndexPath:", v6))
  {
    v26 = (id)objc_claimAutoreleasedReturnValue(+[CPUIImageRowCell cellForTableView:](CPUIImageRowCell, "cellForTableView:", v24));
    v7 = objc_opt_new(NSMutableArray);
    v8 = objc_opt_new(NSMutableArray);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowserTableViewController artworksWithTitlesAtIndex:](self, "artworksWithTitlesAtIndex:", 0));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "first"));
          -[NSMutableArray addObject:](v7, "addObject:", v14);

          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "second"));
          -[NSMutableArray addObject:](v8, "addObject:", v15);

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v10);
    }

    objc_initWeak(&location, self);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = __65__MCDBrowserTableViewController_tableView_cellForRowAtIndexPath___block_invoke;
    v30[3] = &unk_1339808;
    objc_copyWeak(&v31, &location);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = __65__MCDBrowserTableViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
    v27[3] = &unk_1338F48;
    objc_copyWeak(&v29, &location);
    v28 = v6;
    LOBYTE(v22) = 1;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[CPUIImageRowCellConfiguration configurationWithText:artworkCatalogs:imageTitles:selectGridItemBlock:selectTitleBlock:showActivityIndicator:enabled:](CPUIImageRowCellConfiguration, "configurationWithText:artworkCatalogs:imageTitles:selectGridItemBlock:selectTitleBlock:showActivityIndicator:enabled:", v23, v7, v8, v30, v27, 0, v22));
    objc_msgSend(v26, "applyConfiguration:", v16);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);

  }
  else
  {
    v26 = (id)objc_claimAutoreleasedReturnValue(+[_MCDReusableCell cellForTableView:indexPath:](MCDLibraryMenuTableViewCell, "cellForTableView:indexPath:", v24, v6));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "textLabel"));
    objc_msgSend(v17, "setText:", v23);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "tabBarItem"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "image"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "imageView"));
    objc_msgSend(v20, "setImage:", v19);

    objc_msgSend(v26, "setAccessoryType:", 1);
  }

  return v26;
}

void __65__MCDBrowserTableViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "recentlyAddedContentManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", a2, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "itemAtIndexPath:", v4));

  objc_msgSend(WeakRetained, "_initiatePlaybackForItem:", v5);
}

void __65__MCDBrowserTableViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "tableView"));
  objc_msgSend(v2, "selectRowAtIndexPath:animated:scrollPosition:", *(_QWORD *)(a1 + 32), 0, 0);

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "tableView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "tableView"));
  objc_msgSend(v4, "tableView:didSelectRowAtIndexPath:", v5, *(_QWORD *)(a1 + 32));

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = objc_msgSend(v5, "indexAtPosition:", (char *)objc_msgSend(v5, "length") - 1);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", v6));
  objc_msgSend(v8, "setPlayActivityFeatureNameSourceViewController:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowserTableViewController navigationController](self, "navigationController"));
  objc_msgSend(v7, "pushViewController:animated:", v8, 1);

}

- (void)contentManager:(id)a3 didReceiveResponse:(id)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MCDBrowserTableViewController tableView](self, "tableView", a3, a4));
  objc_msgSend(v4, "reloadData");

}

- (void)playbackManagerShouldShowNowPlaying:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MCDBrowserTableViewController navigationController](self, "navigationController", a3));
  objc_msgSend(v3, "MCD_pushNowPlayingViewControllerAnimated:", 1);

}

- (id)artworksWithTitlesAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;
  id v5;
  __int128 v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  __CFString *v24;
  void *v25;
  id v26;
  __int128 v28;
  NSMutableArray *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  _BYTE buf[24];
  void *v38;

  v31 = objc_opt_new(NSMutableArray);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowserTableViewController recentlyAddedContentManager](self, "recentlyAddedContentManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "itemsInSectionAtIndex:", a3));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v5)
  {
    v7 = *(_QWORD *)v33;
    *(_QWORD *)&v6 = 138543618;
    v28 = v6;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v10 = objc_opt_class(MPModelGenericObject);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
        {
          v11 = v9;
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject artworkCatalog](v11, "artworkCatalog"));
          if (!v12)
          {
            if (-[NSObject type](v11, "type") != &dword_4
              || (v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject playlist](v11, "playlist")),
                  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "tracksTiledArtworkCatalogWithRows:columns:", 2, 2)),
                  v13,
                  !v12))
            {
              v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowserTableViewController tableView](self, "tableView", v28));
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "traitCollection"));
              v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage defaultPlaceholderForTraitCollection:](UIImage, "defaultPlaceholderForTraitCollection:", v15));
              v12 = (void *)objc_claimAutoreleasedReturnValue(+[MPArtworkCatalog staticArtworkCatalogWithImage:](MPArtworkCatalog, "staticArtworkCatalogWithImage:", v16));

            }
          }
          v17 = (int *)-[NSObject type](v11, "type", v28);
          if ((uint64_t)v17 > 3)
          {
            if (v17 == &dword_4)
            {
              v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject playlist](v11, "playlist"));
              v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
            }
            else
            {
              if (v17 != (int *)((char *)&dword_C + 1))
                goto LABEL_28;
              v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject radioStation](v11, "radioStation"));
              v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
            }
          }
          else
          {
            if (v17 != (int *)((char *)&dword_0 + 1))
            {
              if (v17 == (int *)((char *)&dword_0 + 2))
              {
                v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject album](v11, "album"));
                v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "title"));
                goto LABEL_25;
              }
LABEL_28:
              v24 = &stru_13E1990;
              if (v12)
                goto LABEL_29;
              goto LABEL_30;
            }
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject song](v11, "song"));
            v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "title"));
          }
LABEL_25:
          v24 = (__CFString *)v19;

          if (!v24)
            goto LABEL_28;
          if (v12)
          {
LABEL_29:
            v25 = (void *)objc_claimAutoreleasedReturnValue(+[MusicObjectPair pairWithFirst:andSecond:](MusicObjectPair, "pairWithFirst:andSecond:", v12, v24));
            -[NSMutableArray addObject:](v31, "addObject:", v25);

          }
LABEL_30:

          goto LABEL_31;
        }
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v20 = getMCDMusicGeneralLoggingSymbolLoc_ptr_3;
        v38 = getMCDMusicGeneralLoggingSymbolLoc_ptr_3;
        if (!getMCDMusicGeneralLoggingSymbolLoc_ptr_3)
        {
          v21 = (void *)MusicCarDisplayUILibrary_8();
          v20 = dlsym(v21, "MCDMusicGeneralLogging");
          *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v20;
          getMCDMusicGeneralLoggingSymbolLoc_ptr_3 = v20;
        }
        _Block_object_dispose(buf, 8);
        if (!v20)
        {
          soft_MCDMusicGeneralLogging_cold_1();
          __break(1u);
        }
        v22 = ((uint64_t (*)(void))v20)();
        v11 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v23 = objc_opt_class(v9);
          *(_DWORD *)buf = v28;
          *(_QWORD *)&buf[4] = v23;
          *(_WORD *)&buf[12] = 2050;
          *(_QWORD *)&buf[14] = a3;
          _os_log_error_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "Wrong kind (%{public}@) of object found in itemsInSectionAtIndex at %{public}lu", buf, 0x16u);
        }
LABEL_31:

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v5);
  }

  v26 = -[NSMutableArray copy](v31, "copy");
  return v26;
}

- (void)_initiatePlaybackForItem:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = objc_opt_class(MPModelGenericObject);
  if ((objc_opt_isKindOfClass(v11, v4) & 1) != 0)
    v5 = v11;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(+[MPModelGenericObject genericObjectWithModelObject:](MPModelGenericObject, "genericObjectWithModelObject:", v11));
  v6 = v5;
  v7 = (char *)objc_msgSend(v5, "type");
  switch((unint64_t)v7)
  {
    case 1uLL:
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowserTableViewController libraryPlaybackManager](self, "libraryPlaybackManager"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "song"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowserTableViewController combinedPlayActivityFeatureName](self, "combinedPlayActivityFeatureName"));
      objc_msgSend(v8, "initiatePlaybackForSong:lastResponse:shuffled:forceScopingToResponseResults:playActivityFeatureName:", v9, 0, 0, 0, v10);
      goto LABEL_11;
    case 2uLL:
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowserTableViewController libraryPlaybackManager](self, "libraryPlaybackManager"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "album"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowserTableViewController combinedPlayActivityFeatureName](self, "combinedPlayActivityFeatureName"));
      objc_msgSend(v8, "initiatePlaybackForAlbum:lastResponse:shuffled:playActivityFeatureName:", v9, 0, 0, v10);
      goto LABEL_11;
    case 3uLL:
      goto LABEL_12;
    case 4uLL:
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowserTableViewController libraryPlaybackManager](self, "libraryPlaybackManager"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "playlist"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowserTableViewController combinedPlayActivityFeatureName](self, "combinedPlayActivityFeatureName"));
      objc_msgSend(v8, "initiatePlaybackForPlaylist:lastResponse:shuffled:playActivityFeatureName:", v9, 0, 0, v10);
      goto LABEL_11;
    case 5uLL:
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowserTableViewController libraryPlaybackManager](self, "libraryPlaybackManager"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "playlistEntry"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowserTableViewController combinedPlayActivityFeatureName](self, "combinedPlayActivityFeatureName"));
      objc_msgSend(v8, "initiatePlaybackForPlaylistEntry:lastResponse:shuffled:forceScopingToResponseResults:playActivityFeatureName:", v9, 0, 0, 0, v10);
      goto LABEL_11;
    default:
      if (v7 != (_BYTE *)&dword_C + 1)
        goto LABEL_12;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowserTableViewController libraryPlaybackManager](self, "libraryPlaybackManager"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "radioStation"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowserTableViewController combinedPlayActivityFeatureName](self, "combinedPlayActivityFeatureName"));
      objc_msgSend(v8, "initiatePlaybackForRadioStation:lastResponse:shuffled:playActivityFeatureName:", v9, 0, 0, v10);
LABEL_11:

LABEL_12:
      return;
  }
}

- (id)titleForIdentifier:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = MCDLibraryLocalizedStrings();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v3));

  return v6;
}

- (void)_replacePlaceholderViewWithView:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  id v17;

  -[MCDBrowserTableViewController setPlaceholderView:](self, "setPlaceholderView:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowserTableViewController placeholderView](self, "placeholderView"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowserTableViewController contentTableView](self, "contentTableView"));
  v6 = (uint64_t)v5;
  if (v4)
  {
    v16 = v5;
    objc_msgSend(v5, "frame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowserTableViewController placeholderView](self, "placeholderView"));
    objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

    v6 = objc_claimAutoreleasedReturnValue(-[MCDBrowserTableViewController placeholderView](self, "placeholderView"));
  }
  v17 = (id)v6;
  -[MCDBrowserTableViewController setView:](self, "setView:", v6);

}

- (NSArray)viewControllers
{
  return self->_viewControllers;
}

- (void)setViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_viewControllers, a3);
}

- (BOOL)showOnlyLocalContent
{
  return self->_showOnlyLocalContent;
}

- (void)setShowOnlyLocalContent:(BOOL)a3
{
  self->_showOnlyLocalContent = a3;
}

- (UIView)placeholderView
{
  return self->_placeholderView;
}

- (void)setPlaceholderView:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderView, a3);
}

- (UITableView)contentTableView
{
  return self->_contentTableView;
}

- (void)setContentTableView:(id)a3
{
  objc_storeStrong((id *)&self->_contentTableView, a3);
}

- (MCDLibraryPlaybackManager)libraryPlaybackManager
{
  return self->_libraryPlaybackManager;
}

- (void)setLibraryPlaybackManager:(id)a3
{
  objc_storeStrong((id *)&self->_libraryPlaybackManager, a3);
}

- (MCDRecentlyAddedDataSource)recentlyAddedDataSource
{
  return self->_recentlyAddedDataSource;
}

- (void)setRecentlyAddedDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_recentlyAddedDataSource, a3);
}

- (MCDLibraryContentManager)recentlyAddedContentManager
{
  return self->_recentlyAddedContentManager;
}

- (void)setRecentlyAddedContentManager:(id)a3
{
  objc_storeStrong((id *)&self->_recentlyAddedContentManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentlyAddedContentManager, 0);
  objc_storeStrong((id *)&self->_recentlyAddedDataSource, 0);
  objc_storeStrong((id *)&self->_libraryPlaybackManager, 0);
  objc_storeStrong((id *)&self->_contentTableView, 0);
  objc_storeStrong((id *)&self->_placeholderView, 0);
  objc_storeStrong((id *)&self->_viewControllers, 0);
}

@end
