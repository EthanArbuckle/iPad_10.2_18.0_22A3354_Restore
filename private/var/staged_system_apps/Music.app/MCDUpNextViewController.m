@implementation MCDUpNextViewController

- (MCDUpNextViewController)initWithContentManager:(id)a3
{
  id v5;
  MCDUpNextViewController *v6;
  MCDUpNextViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCDUpNextViewController;
  v6 = -[MCDTableViewController initWithLimitedUI:](&v9, "initWithLimitedUI:", objc_msgSend(v5, "limitedUI"));
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contentManager, a3);

  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MCDUpNextViewController;
  -[MCDTableViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tableView](self->_contentManager, "tableView"));
  objc_msgSend(v4, "_scrollToTopIfPossible:", 0);

}

- (void)viewDidLoad
{
  int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  MCDPlaybackManager *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MCDUpNextViewController;
  -[MCDTableViewController viewDidLoad](&v10, "viewDidLoad");
  v3 = _os_feature_enabled_impl("MediaPlayer", "QueueFA");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = v4;
  if (v3)
    v6 = CFSTR("Queue");
  else
    v6 = CFSTR("Playing Next");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_101122068, 0));
  -[MCDUpNextViewController setTitle:](self, "setTitle:", v7);

  -[MCDNowPlayingContentManager setTableCellConfigurationBlock:](self->_contentManager, "setTableCellConfigurationBlock:", &stru_1010A9310);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDUpNextViewController tableView](self, "tableView"));
  -[MCDNowPlayingContentManager setTableView:](self->_contentManager, "setTableView:", v8);

  v9 = -[MCDPlaybackManager initWithDelegate:]([MCDPlaybackManager alloc], "initWithDelegate:", self);
  -[MCDNowPlayingContentManager setPlaybackManager:](self->_contentManager, "setPlaybackManager:", v9);

}

- (BOOL)alwaysHideNowPlayingButton
{
  return 1;
}

- (void)playbackManagerShouldShowNowPlaying:(id)a3
{
  id v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MCDUpNextViewController navigationController](self, "navigationController", a3));
  v3 = objc_msgSend(v4, "popViewControllerAnimated:", 1);

}

- (MCDNowPlayingContentManager)contentManager
{
  return self->_contentManager;
}

- (void)setContentManager:(id)a3
{
  objc_storeStrong((id *)&self->_contentManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentManager, 0);
}

@end
