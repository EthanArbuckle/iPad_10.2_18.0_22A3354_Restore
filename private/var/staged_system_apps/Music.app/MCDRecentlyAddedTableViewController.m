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
  objc_msgSend(v3, "setTableCellConfigurationBlock:", &stru_1010A99E8);

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
  BOOL v6;
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
