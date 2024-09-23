@implementation PXTimelineContentModeTableViewController

- (PXTimelineContentModeTableViewController)initWithContentMode:(unint64_t)a3 widgetSizeClass:(unint64_t)a4
{
  PXTimelineContentModeTableViewController *v6;
  PXTimelineContentModeTableViewController *v7;
  uint64_t v8;
  NSArray *dataSource;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXTimelineContentModeTableViewController;
  v6 = -[PXTimelineContentModeTableViewController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_contentMode = a3;
    v6->_widgetSizeClass = a4;
    -[PXTimelineContentModeTableViewController _fetchAssetSourcesForContentMode:](v6, "_fetchAssetSourcesForContentMode:", a3);
    v8 = objc_claimAutoreleasedReturnValue();
    dataSource = v7->_dataSource;
    v7->_dataSource = (NSArray *)v8;

  }
  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXTimelineContentModeTableViewController;
  -[PXTimelineContentModeTableViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[PXTimelineContentModeTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsMultipleSelection:", 0);

  -[PXTimelineContentModeTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PXSettingsTimelineContentModeTableViewCell"));

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[PXTimelineContentModeTableViewController dataSource](self, "dataSource", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  -[PXTimelineContentModeTableViewController dataSource](self, "dataSource", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetSources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  PXTimelineDataSource *v17;
  PXSettingsTimelineInspectorViewController *v18;
  void *v19;
  id v20;

  v5 = a4;
  -[PXTimelineContentModeTableViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetSources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "row");

  objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXTimelineSize widgetSizeForSizeClass:](PXTimelineSize, "widgetSizeForSizeClass:", -[PXTimelineContentModeTableViewController widgetSizeClass](self, "widgetSizeClass"));
  v12 = v11;
  v14 = v13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v20, "localIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXWidgetTimeline timelineFromLibrary:albumIdentifier:widgetIdentifier:widgetSize:](PXWidgetTimeline, "timelineFromLibrary:albumIdentifier:widgetIdentifier:widgetSize:", v10, v15, 0, v12, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = -[PXTimelineDataSource initWithPhotoLibrary:forWidgetSize:]([PXTimelineDataSource alloc], "initWithPhotoLibrary:forWidgetSize:", v10, v12, v14);
      v18 = -[PXSettingsTimelineInspectorViewController initWithWidgetSizeClass:timeline:dataSource:]([PXSettingsTimelineInspectorViewController alloc], "initWithWidgetSizeClass:timeline:dataSource:", -[PXTimelineContentModeTableViewController widgetSizeClass](self, "widgetSizeClass"), v16, v17);
      -[PXTimelineContentModeTableViewController navigationController](self, "navigationController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "pushViewController:animated:", v18, 1);

    }
  }

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[PXTimelineContentModeTableViewController dataSource](self, "dataSource", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PXSettingsTimelineContentModeTableViewCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTimelineContentModeTableViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assetSources");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "row");

  objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "localizedTitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v13);

  }
  return v7;
}

- (id)_fetchAssetSourcesForContentMode:(unint64_t)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  PXTimelineContentModeDataSource *v9;
  void *v10;
  void *v11;
  void *v12;
  PXTimelineContentModeDataSource *v13;
  void *v14;
  void *v15;
  void *v16;
  PXTimelineContentModeDataSource *v17;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 1)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v4, "librarySpecificFetchOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("assetCollectionSubtype == %d || assetCollectionSubtype == %d"), 203, 212);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPredicate:", v7);

    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 2, 0x7FFFFFFFFFFFFFFFLL, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v9 = -[PXTimelineContentModeDataSource initWithName:assetSources:]([PXTimelineContentModeDataSource alloc], "initWithName:assetSources:", CFSTR("Smart Album"), v8);
      objc_msgSend(v5, "addObject:", v9);

    }
    v10 = (void *)MEMORY[0x1E0CD13B8];
    objc_msgSend(v4, "librarySpecificFetchOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fetchTopLevelUserCollectionsWithOptions:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "count"))
    {
      v13 = -[PXTimelineContentModeDataSource initWithName:assetSources:]([PXTimelineContentModeDataSource alloc], "initWithName:assetSources:", CFSTR("My Albums"), v12);
      objc_msgSend(v5, "addObject:", v13);

    }
    v14 = (void *)MEMORY[0x1E0CD13B8];
    objc_msgSend(v4, "librarySpecificFetchOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fetchAssetCollectionsWithType:subtype:options:", 1, 101, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "count"))
    {
      v17 = -[PXTimelineContentModeDataSource initWithName:assetSources:]([PXTimelineContentModeDataSource alloc], "initWithName:assetSources:", CFSTR("Shared Albums"), v16);
      objc_msgSend(v5, "addObject:", v17);

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)contentMode
{
  return self->_contentMode;
}

- (unint64_t)widgetSizeClass
{
  return self->_widgetSizeClass;
}

- (NSArray)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
