@implementation MTiOSPlaylistSettingsViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTiOSPlaylistSettingsViewController;
  -[MTPlaylistSettingsViewController viewDidLoad](&v6, "viewDidLoad");
  -[MTiOSPlaylistSettingsViewController addDeleteButtonInFooter](self, "addDeleteButtonInFooter");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Station Settings"), &stru_1004C6D40, 0));
  -[MTiOSPlaylistSettingsViewController setTitle:](self, "setTitle:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTiOSPlaylistSettingsViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v5, "setLargeTitleDisplayMode:", 2);

}

- (void)addDeleteButtonInFooter
{
  void *v3;
  void *v4;
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
  void *v15;
  void *v16;
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  -[MTiOSPlaylistSettingsViewController setDeleteButton:](self, "setDeleteButton:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTiOSPlaylistSettingsViewController deleteButton](self, "deleteButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
  objc_msgSend(v4, "setTintColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTiOSPlaylistSettingsViewController deleteButton](self, "deleteButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Delete Station"), &stru_1004C6D40, 0));
  objc_msgSend(v6, "setTitle:forState:", v8, 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTiOSPlaylistSettingsViewController deleteButton](self, "deleteButton"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "titleLabel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont buttonFont](UIFont, "buttonFont"));
  objc_msgSend(v10, "setFont:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTiOSPlaylistSettingsViewController deleteButton](self, "deleteButton"));
  objc_msgSend(v12, "addTarget:action:forControlEvents:", self, "deletePlaylist:", 64);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTiOSPlaylistSettingsViewController deleteButton](self, "deleteButton"));
  objc_msgSend(v13, "setFrame:", 10.0, 0.0, 300.0, 44.0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTiOSPlaylistSettingsViewController deleteButton](self, "deleteButton"));
  objc_msgSend(v14, "setAutoresizingMask:", 2);

  v17 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 320.0, 64.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTiOSPlaylistSettingsViewController deleteButton](self, "deleteButton"));
  objc_msgSend(v17, "addSubview:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTiOSPlaylistSettingsViewController tableView](self, "tableView"));
  objc_msgSend(v16, "setTableFooterView:", v17);

}

- (void)updateTitle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTiOSPlaylistSettingsViewController;
  -[MTPlaylistSettingsViewController updateTitle:](&v7, "updateTitle:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTCoreSpotlightController sharedInstance](MTCoreSpotlightController, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsViewController playlistUuid](self, "playlistUuid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v5));
  objc_msgSend(v4, "updateStationsWithUUIDs:", v6);

}

- (UIButton)deleteButton
{
  return self->_deleteButton;
}

- (void)setDeleteButton:(id)a3
{
  objc_storeStrong((id *)&self->_deleteButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteButton, 0);
}

@end
