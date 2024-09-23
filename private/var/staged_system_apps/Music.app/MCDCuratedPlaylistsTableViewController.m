@implementation MCDCuratedPlaylistsTableViewController

- (MCDCuratedPlaylistsTableViewController)initWithCurator:(id)a3 limitedUI:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  MCDCuratedPlaylistsTableViewController *v8;
  MCDCuratedPlaylistsTableViewController *v9;
  objc_super v11;

  v4 = a4;
  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MCDCuratedPlaylistsTableViewController;
  v8 = -[MCDFuseTableViewController initWithLimitedUI:](&v11, "initWithLimitedUI:", v4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_curator, a3);

  return v9;
}

- (id)contentManager:(id)a3 viewControllerForItem:(id)a4 indexPath:(id)a5
{
  return 0;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  objc_super v17;
  __int128 buf;
  uint64_t v19;
  void *v20;

  v17.receiver = self;
  v17.super_class = (Class)MCDCuratedPlaylistsTableViewController;
  -[MCDContentItemTableViewController viewDidLoad](&v17, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDCuratedPlaylistsTableViewController curator](self, "curator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shortName"));
  v5 = objc_msgSend(v4, "length") == 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDCuratedPlaylistsTableViewController curator](self, "curator"));
  v7 = v6;
  if (v5)
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  else
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shortName"));
  v9 = (void *)v8;
  -[MCDCuratedPlaylistsTableViewController setTitle:](self, "setTitle:", v8);

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v19 = 0x2020000000;
  v10 = off_1011EC9F8;
  v20 = off_1011EC9F8;
  if (!off_1011EC9F8)
  {
    v11 = (void *)sub_10000BA70();
    v10 = dlsym(v11, "MCDMusicGeneralLogging");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v10;
    off_1011EC9F8 = v10;
  }
  _Block_object_dispose(&buf, 8);
  if (!v10)
  {
    sub_100DE9368();
    __break(1u);
  }
  v12 = ((uint64_t (*)(void))v10)();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCDCuratedPlaylistsTableViewController title](self, "title"));
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Loading content item view, title: %@", (uint8_t *)&buf, 0xCu);

  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000B8BC;
  v16[3] = &unk_1010A8A80;
  v16[4] = self;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseTableViewController contentManager](self, "contentManager"));
  objc_msgSend(v15, "setTableCellConfigurationBlock:", v16);

}

- (id)_contentManager
{
  MCDCuratedPlaylistsContentManager *v3;
  MCDCuratedPlaylistsDataSource *v4;
  void *v5;
  MCDCuratedPlaylistsDataSource *v6;
  void *v7;
  MCDCuratedPlaylistsContentManager *v8;

  v3 = [MCDCuratedPlaylistsContentManager alloc];
  v4 = [MCDCuratedPlaylistsDataSource alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDCuratedPlaylistsTableViewController curator](self, "curator"));
  v6 = -[MCDCuratedPlaylistsDataSource initWithCurator:](v4, "initWithCurator:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseTableViewController playbackManager](self, "playbackManager"));
  v8 = -[MCDFuseContentManager initWithDataSource:delegate:viewController:playbackManager:limitedUI:](v3, "initWithDataSource:delegate:viewController:playbackManager:limitedUI:", v6, self, self, v7, -[MCDTableViewController limitedUI](self, "limitedUI"));

  return v8;
}

- (MPModelCurator)curator
{
  return self->_curator;
}

- (void)setCurator:(id)a3
{
  objc_storeStrong((id *)&self->_curator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curator, 0);
}

@end
