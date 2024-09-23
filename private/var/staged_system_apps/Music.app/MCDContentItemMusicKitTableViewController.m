@implementation MCDContentItemMusicKitTableViewController

- (MCDContentItemMusicKitTableViewController)initWithSectionItem:(id)a3 limitedUI:(BOOL)a4 radioDomain:(BOOL)a5
{
  _BOOL8 v6;
  id v9;
  MCDContentItemMusicKitTableViewController *v10;
  MCDContentItemMusicKitTableViewController *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a4;
  v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MCDContentItemMusicKitTableViewController;
  v10 = -[MCDFuseTableViewController initWithLimitedUI:](&v15, "initWithLimitedUI:", v6);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_parentSection, a3);
    v11->_useRadioDomain = a5;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
    if (v12)
    {
      -[MCDContentItemMusicKitTableViewController setTitle:](v11, "setTitle:", v12);
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCDContentItemMusicKitTableViewController title](v11, "title"));
      -[MCDContentItemMusicKitTableViewController setTitle:](v11, "setTitle:", v13);

    }
    -[MCDContentItemMusicKitTableViewController setPlayActivityFeatureName:](v11, "setPlayActivityFeatureName:", CFSTR("grouping"));
  }

  return v11;
}

- (id)_contentManager
{
  __objc2_class *v3;
  id v4;
  void *v5;
  id v6;
  MCDBrowseItemsMusicKitContentManager *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  MCDBrowseItemsMusicKitContentManager *v11;

  if (-[MCDContentItemMusicKitTableViewController useRadioDomain](self, "useRadioDomain"))
    v3 = MCDRadioGenresDataSource;
  else
    v3 = MCDBrowseDataSource;
  v4 = [v3 alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDContentItemMusicKitTableViewController parentSection](self, "parentSection"));
  v6 = objc_msgSend(v4, "initWithParentSection:", v5);

  v7 = [MCDBrowseItemsMusicKitContentManager alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseTableViewController playbackManager](self, "playbackManager"));
  v9 = -[MCDTableViewController limitedUI](self, "limitedUI");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCDContentItemMusicKitTableViewController contentResults](self, "contentResults"));
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
  v7.super_class = (Class)MCDContentItemMusicKitTableViewController;
  -[MCDFuseTableViewController viewDidLoad](&v7, "viewDidLoad");
  objc_initWeak(&location, self);
  objc_copyWeak(&v5, &location);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseTableViewController contentManager](self, "contentManager", _NSConcreteStackBlock, 3221225472, sub_1000322D0, &unk_1010A8A18));
  objc_msgSend(v3, "setTableCellConfigurationBlock:", &v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
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

- (BOOL)useRadioDomain
{
  return self->_useRadioDomain;
}

- (void)setUseRadioDomain:(BOOL)a3
{
  self->_useRadioDomain = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentSection, 0);
  objc_storeStrong((id *)&self->_contentResults, 0);
}

@end
