@implementation MTPlaylistSelectPodcastListViewController

- (void)viewDidLoad
{
  void *v3;
  MTPodcastPlaylistSheetHeaderView *v4;
  void *v5;
  double Width;
  double v7;
  MTPodcastPlaylistSheetHeaderView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  void *v16;
  id v17;
  id location;
  objc_super v19;
  CGRect v20;

  v19.receiver = self;
  v19.super_class = (Class)MTPlaylistSelectPodcastListViewController;
  -[MTBasePodcastListViewController viewDidLoad](&v19, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
  objc_msgSend(v3, "bounds");

  +[MTTableViewCell rowHeight](MTPodcastPlaylistCell, "rowHeight");
  v4 = [MTPodcastPlaylistSheetHeaderView alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSelectPodcastListViewController view](self, "view"));
  objc_msgSend(v5, "bounds");
  Width = CGRectGetWidth(v20);
  +[MTTableViewCell rowHeight](MTPodcastPlaylistCell, "rowHeight");
  v8 = -[MTPodcastPlaylistSheetHeaderView initWithFrame:](v4, "initWithFrame:", 0.0, 0.0, Width, v7);

  -[MTPodcastPlaylistSheetHeaderView setOn:](v8, "setOn:", -[MTPlaylistSelectPodcastListViewController allPodcastsSelected](self, "allPodcastsSelected"));
  objc_initWeak(&location, self);
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_1000C825C;
  v16 = &unk_1004A9E78;
  objc_copyWeak(&v17, &location);
  -[MTPodcastPlaylistSheetHeaderView setAction:](v8, "setAction:", &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView", v13, v14, v15, v16));
  objc_msgSend(v9, "setTableHeaderView:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Add Podcasts"), &stru_1004C6D40, 0));
  -[MTPlaylistSelectPodcastListViewController setTitle:](self, "setTitle:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSelectPodcastListViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v12, "setLargeTitleDisplayMode:", 2);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTPlaylistSelectPodcastListViewController;
  -[MTBasePodcastListViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSelectPodcastListViewController saveDelegate](self, "saveDelegate"));
  objc_msgSend(v4, "saveNewPlaylists");

}

- (void)updateAllPodcastsTo:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  MTPlaylistSelectPodcastListViewController *v11;
  BOOL v12;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainQueueContext"));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000C83B8;
  v9[3] = &unk_1004A7698;
  v12 = v3;
  v10 = v6;
  v11 = self;
  v8 = v6;
  objc_msgSend(v8, "performBlockAndWait:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
  objc_msgSend(v7, "reloadData");

  -[MTPlaylistSelectPodcastListViewController setAllPodcastsSelected:](self, "setAllPodcastsSelected:", v3);
}

- (void)togglePodcastUuid:(id)a3
{
  id v4;
  NSMutableSet *podcastUuids;
  NSMutableSet *v6;
  NSMutableSet *v7;
  unsigned int v8;
  NSMutableSet *v9;
  id v10;

  v4 = a3;
  podcastUuids = self->_podcastUuids;
  v10 = v4;
  if (!podcastUuids)
  {
    v6 = objc_opt_new(NSMutableSet);
    v7 = self->_podcastUuids;
    self->_podcastUuids = v6;

    v4 = v10;
    podcastUuids = self->_podcastUuids;
  }
  v8 = -[NSMutableSet containsObject:](podcastUuids, "containsObject:", v4);
  v9 = self->_podcastUuids;
  if (v8)
    -[NSMutableSet removeObject:](v9, "removeObject:", v10);
  else
    -[NSMutableSet addObject:](v9, "addObject:", v10);

}

- (void)configureCell:(id)a3 withObject:(id)a4 atIndexPath:(id)a5
{
  id v7;
  NSMutableSet *podcastUuids;
  void *v9;
  id v10;

  v7 = a4;
  v10 = a3;
  objc_msgSend(v10, "updateWithObject:", v7);
  podcastUuids = self->_podcastUuids;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuid"));

  objc_msgSend(v10, "setAdded:", -[NSMutableSet containsObject:](podcastUuids, "containsObject:", v9));
  objc_msgSend(v10, "setEnabled:", -[MTPlaylistSelectPodcastListViewController allPodcastsSelected](self, "allPodcastsSelected") ^ 1);

}

- (id)newCellInstanceWithReuseIdentifier:(id)a3
{
  id v3;
  MTPodcastPlaylistCell *v4;

  v3 = a3;
  v4 = -[MTPodcastPlaylistCell initWithStyle:reuseIdentifier:]([MTPodcastPlaylistCell alloc], "initWithStyle:reuseIdentifier:", 0, v3);

  return v4;
}

- (id)reuseIdentifierForRow:(id)a3
{
  return CFSTR("MTPodcastPlaylistCell");
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTPlaylistSelectPodcastListViewController;
  v5 = a4;
  v6 = a3;
  -[MTBasePodcastListViewController tableView:didSelectRowAtIndexPath:](&v8, "tableView:didSelectRowAtIndexPath:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForRowAtIndexPath:", v5, v8.receiver, v8.super_class));
  objc_msgSend(v7, "setAdded:", objc_msgSend(v7, "isAdded") ^ 1);
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v5, 1);

}

- (NSString)playlistName
{
  return self->_playlistName;
}

- (void)setPlaylistName:(id)a3
{
  objc_storeStrong((id *)&self->_playlistName, a3);
}

- (NSMutableSet)podcastUuids
{
  return self->_podcastUuids;
}

- (void)setPodcastUuids:(id)a3
{
  objc_storeStrong((id *)&self->_podcastUuids, a3);
}

- (BOOL)allPodcastsSelected
{
  return self->_allPodcastsSelected;
}

- (void)setAllPodcastsSelected:(BOOL)a3
{
  self->_allPodcastsSelected = a3;
}

- (NSString)playlistUuid
{
  return self->_playlistUuid;
}

- (void)setPlaylistUuid:(id)a3
{
  objc_storeStrong((id *)&self->_playlistUuid, a3);
}

- (MTPlaylistSelectPodcastListViewControllerSaveDelegate)saveDelegate
{
  return (MTPlaylistSelectPodcastListViewControllerSaveDelegate *)objc_getProperty(self, a2, 176, 1);
}

- (void)setSaveDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveDelegate, 0);
  objc_storeStrong((id *)&self->_playlistUuid, 0);
  objc_storeStrong((id *)&self->_podcastUuids, 0);
  objc_storeStrong((id *)&self->_playlistName, 0);
}

@end
