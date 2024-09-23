@implementation MCDContentItemTableViewController

- (MCDContentItemTableViewController)initWithSectionItem:(id)a3 limitedUI:(BOOL)a4 showRankedList:(BOOL)a5 queueListForPlayback:(BOOL)a6 radioDomain:(BOOL)a7
{
  return -[MCDContentItemTableViewController initWithSectionItem:limitedUI:showRankedList:queueListForPlayback:radioDomain:musicKit:](self, "initWithSectionItem:limitedUI:showRankedList:queueListForPlayback:radioDomain:musicKit:", a3, a4, a5, a6, a7, 0);
}

- (MCDContentItemTableViewController)initWithSectionItem:(id)a3 limitedUI:(BOOL)a4 showRankedList:(BOOL)a5 queueListForPlayback:(BOOL)a6 radioDomain:(BOOL)a7 musicKit:(BOOL)a8
{
  _BOOL8 v12;
  id v15;
  MCDContentItemTableViewController *v16;
  MCDContentItemTableViewController *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v12 = a4;
  v15 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MCDContentItemTableViewController;
  v16 = -[MCDFuseTableViewController initWithLimitedUI:](&v21, "initWithLimitedUI:", v12);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_parentSection, a3);
    v17->_displayRankings = a5;
    v17->_customListForPlayback = a6;
    v17->_useRadioDomain = a7;
    v17->_useMusicKit = a8;
    -[MCDContentItemTableViewController setPlayActivityFeatureName:](v17, "setPlayActivityFeatureName:", CFSTR("grouping"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "title"));
    if (v18)
    {
      -[MCDContentItemTableViewController setTitle:](v17, "setTitle:", v18);
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MCDContentItemTableViewController title](v17, "title"));
      -[MCDContentItemTableViewController setTitle:](v17, "setTitle:", v19);

    }
  }

  return v17;
}

- (id)_contentManager
{
  __objc2_class *v3;
  id v4;
  void *v5;
  id v6;
  MCDBrowseItemsContentManager *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  MCDBrowseItemsContentManager *v11;

  if (-[MCDContentItemTableViewController useRadioDomain](self, "useRadioDomain"))
    v3 = MCDRadioGenresDataSource;
  else
    v3 = MCDBrowseDataSource;
  v4 = [v3 alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDContentItemTableViewController parentSection](self, "parentSection"));
  v6 = objc_msgSend(v4, "initWithParentSection:", v5);

  -[MCDContentItemTableViewController useMusicKit](self, "useMusicKit");
  v7 = [MCDBrowseItemsContentManager alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseTableViewController playbackManager](self, "playbackManager"));
  v9 = -[MCDTableViewController limitedUI](self, "limitedUI");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCDContentItemTableViewController contentResults](self, "contentResults"));
  v11 = -[MCDFuseContentManager initWithDataSource:delegate:viewController:playbackManager:limitedUI:contentResults:](v7, "initWithDataSource:delegate:viewController:playbackManager:limitedUI:contentResults:", v6, self, self, v8, v9, v10);

  return v11;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MCDContentItemTableViewController;
  -[MCDFuseTableViewController viewDidLoad](&v7, "viewDidLoad");
  objc_initWeak(&location, self);
  objc_copyWeak(&v5, &location);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseTableViewController contentManager](self, "contentManager", _NSConcreteStackBlock, 3221225472, sub_10000AFE4, &unk_1010A8A18));
  objc_msgSend(v3, "setTableCellConfigurationBlock:", &v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)queueListForPlayback
{
  return -[MCDContentItemTableViewController customListForPlayback](self, "customListForPlayback");
}

- (id)contentManager:(id)a3 viewControllerForItem:(id)a4 indexPath:(id)a5
{
  id v6;
  MCDCuratedPlaylistsTableViewController *v7;
  void *v8;
  MCDCuratedPlaylistsTableViewController *v9;

  v6 = a4;
  if (objc_msgSend(v6, "itemType") == (id)3)
  {
    v7 = [MCDCuratedPlaylistsTableViewController alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "curator"));
    v9 = -[MCDCuratedPlaylistsTableViewController initWithCurator:limitedUI:](v7, "initWithCurator:limitedUI:", v8, -[MCDTableViewController limitedUI](self, "limitedUI"));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (MPSectionedCollection)contentResults
{
  return self->_contentResults;
}

- (void)setContentResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (MPModelStoreBrowseSection)parentSection
{
  return self->_parentSection;
}

- (void)setParentSection:(id)a3
{
  objc_storeStrong((id *)&self->_parentSection, a3);
}

- (BOOL)displayRankings
{
  return self->_displayRankings;
}

- (void)setDisplayRankings:(BOOL)a3
{
  self->_displayRankings = a3;
}

- (BOOL)customListForPlayback
{
  return self->_customListForPlayback;
}

- (void)setCustomListForPlayback:(BOOL)a3
{
  self->_customListForPlayback = a3;
}

- (BOOL)useRadioDomain
{
  return self->_useRadioDomain;
}

- (void)setUseRadioDomain:(BOOL)a3
{
  self->_useRadioDomain = a3;
}

- (BOOL)useMusicKit
{
  return self->_useMusicKit;
}

- (void)setUseMusicKit:(BOOL)a3
{
  self->_useMusicKit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentSection, 0);
  objc_storeStrong((id *)&self->_contentResults, 0);
}

@end
