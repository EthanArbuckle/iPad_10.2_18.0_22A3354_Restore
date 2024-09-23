@implementation MCDRecentlyAddedTableViewController

- (MCDRecentlyAddedTableViewController)initWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  MCDRecentlyAddedDataSource *v9;
  MCDRecentlyAddedTableViewController *v10;
  objc_super v12;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = -[_MCDLibraryDataSource initWithLimitedUI:]([MCDRecentlyAddedDataSource alloc], "initWithLimitedUI:", v6);
  v12.receiver = self;
  v12.super_class = (Class)MCDRecentlyAddedTableViewController;
  v10 = -[MCDLibraryTableViewController initWithIdentifier:limitedUI:showLocalContent:dataSource:](&v12, "initWithIdentifier:limitedUI:showLocalContent:dataSource:", v8, v6, v5, v9);

  if (v10)
    -[MCDRecentlyAddedTableViewController setPlayActivityFeatureName:](v10, "setPlayActivityFeatureName:", CFSTR("recently_added"));
  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MCDRecentlyAddedTableViewController;
  -[MCDLibraryTableViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentManager](self, "contentManager"));
  objc_msgSend(v3, "setTableCellConfigurationBlock:", &__block_literal_global_21);

}

void __50__MCDRecentlyAddedTableViewController_viewDidLoad__block_invoke(id a1, UITableViewCell *a2, MPModelObject *a3, MPModelObject *a4, UITableView *a5, NSIndexPath *a6)
{
  UITableViewCell *v10;
  MPModelObject *v11;
  MPModelObject *v12;
  UITableView *v13;
  NSIndexPath *v14;
  MPModelObject *v15;
  uint64_t (*v16)(MPModelObject *);
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  MPModelObject *v23;
  void *v24;
  NSIndexPath *v25;
  UITableView *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _Unwind_Exception *v48;
  unsigned int v49;
  void *v50;
  UITableViewCell *v51;
  NSIndexPath *v52;
  _QWORD v53[5];
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  void *v57;

  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v12;
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v16 = (uint64_t (*)(MPModelObject *))getMCDMPModelObjectForGenericObjectSymbolLoc_ptr_0;
  v57 = getMCDMPModelObjectForGenericObjectSymbolLoc_ptr_0;
  if (!getMCDMPModelObjectForGenericObjectSymbolLoc_ptr_0)
  {
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = __getMCDMPModelObjectForGenericObjectSymbolLoc_block_invoke;
    v53[3] = &unk_1339000;
    v53[4] = &v54;
    __getMCDMPModelObjectForGenericObjectSymbolLoc_block_invoke((uint64_t)v53);
    v16 = (uint64_t (*)(MPModelObject *))v55[3];
  }
  _Block_object_dispose(&v54, 8);
  if (!v16)
  {
    v48 = (_Unwind_Exception *)soft_MCDMusicGeneralLogging_cold_1();
    _Block_object_dispose(&v54, 8);
    _Unwind_Resume(v48);
  }
  v17 = v16(v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  v19 = objc_opt_class(MPModelAlbum);
  if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
  {
    v20 = v18;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifiers"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[MusicCarPlayManager sharedManager](MusicCarPlayManager, "sharedManager"));
    v51 = v10;
    v23 = v11;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "nowPlayingContentManager"));
    v25 = v14;
    v26 = v13;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "currentPlayingSong"));
    v50 = v18;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "album"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "identifiers"));
    v49 = objc_msgSend(v21, "intersectsSet:", v29);

    v13 = v26;
    v14 = v25;

    v11 = v23;
    v10 = v51;

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView window](v13, "window"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "screen"));
    objc_msgSend(v31, "scale");
    -[UITableViewCell configureWithAlbum:currentlyPlaying:artworkScale:](v51, "configureWithAlbum:currentlyPlaying:artworkScale:", v20, v49);

    v18 = v50;
    if (objc_msgSend(v20, "trackCount") != (char *)&dword_0 + 1)
    {
LABEL_13:

      goto LABEL_14;
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "representativeSong"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "title"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell textLabel](v51, "textLabel"));
    objc_msgSend(v34, "setText:", v33);
    goto LABEL_11;
  }
  v35 = objc_opt_class(MPModelPlaylist);
  if ((objc_opt_isKindOfClass(v18, v35) & 1) != 0)
  {
    v52 = v14;
    v36 = v18;
    v37 = v18;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[MusicCarPlayManager sharedManager](MusicCarPlayManager, "sharedManager"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "nowPlayingContentManager"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "currentPlayingPlaylist"));

    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "identifiers"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "identifiers"));
    v42 = objc_msgSend(v40, "intersectsSet:", v41);

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView window](v13, "window"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "screen"));
    objc_msgSend(v44, "scale");
    -[UITableViewCell configureWithPlaylist:currentlyPlaying:artworkScale:showCurator:](v10, "configureWithPlaylist:currentlyPlaying:artworkScale:showCurator:", v37, v42, 1);

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell detailTextLabel](v10, "detailTextLabel"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "text"));

    if (v46)
    {
      v14 = v52;
      v18 = v36;
LABEL_12:

      goto LABEL_13;
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("Playlist"), &stru_13E1990, 0));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell detailTextLabel](v10, "detailTextLabel"));
    objc_msgSend(v47, "setText:", v34);

    v14 = v52;
    v18 = v36;
LABEL_11:

    goto LABEL_12;
  }
LABEL_14:

}

- (id)contentManager:(id)a3 viewControllerForItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  MCDPlaylistTracksTableViewController *v8;
  void *v9;
  MCDPlaylistTracksTableViewController *v10;
  MCDPlaylistTracksTableViewController *v11;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "album"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "album"));
    v8 = (MCDPlaylistTracksTableViewController *)objc_claimAutoreleasedReturnValue(+[MCDAlbumTracksTableViewController albumTracksViewControllerForContentItem:limitedUI:showLocalContent:](MCDAlbumTracksTableViewController, "albumTracksViewControllerForContentItem:limitedUI:showLocalContent:", v7, -[MCDTableViewController limitedUI](self, "limitedUI"), -[MCDLibraryTableViewController showLocalContent](self, "showLocalContent")));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "playlist"));

    if (!v9)
    {
      v11 = 0;
      goto LABEL_6;
    }
    v10 = [MCDPlaylistTracksTableViewController alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "playlist"));
    v8 = -[MCDPlaylistTracksTableViewController initWithPlaylist:limitedUI:showLocalContent:](v10, "initWithPlaylist:limitedUI:showLocalContent:", v7, -[MCDTableViewController limitedUI](self, "limitedUI"), -[MCDLibraryTableViewController showLocalContent](self, "showLocalContent"));
  }
  v11 = v8;

LABEL_6:
  return v11;
}

- (BOOL)contentManager:(id)a3 canDrillIntoItem:(id)a4
{
  id v4;
  void *v5;
  char v6;
  void *v7;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "album"));
  if (v5)
  {
    v6 = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "playlist"));
    v6 = v7 != 0;

  }
  return v6;
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

+ (BOOL)wantsTallCells
{
  return 1;
}

@end
