@implementation PXSettingsTimelineTableViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXSettingsTimelineTableViewController;
  -[PXSettingsTimelineTableViewController viewDidLoad](&v8, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSettingsTimelineTableViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  +[PXTimelineSize allSupportedSizes](PXTimelineSize, "allSupportedSizes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSettingsTimelineTableViewController setWidgetSizes:](self, "setWidgetSizes:", v5);

  -[PXSettingsTimelineTableViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowsMultipleSelection:", 0);

  -[PXSettingsTimelineTableViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PXSettingsTimelineTableViewCell"));

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[PXSettingsTimelineTableViewController widgetSizes](self, "widgetSizes", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  PXTimelineDataSource *v14;
  void *v15;
  PXSettingsTimelineInspectorViewController *v16;
  void *v17;
  id v18;

  v5 = a4;
  -[PXSettingsTimelineTableViewController widgetSizes](self, "widgetSizes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_systemPhotoLibrary");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  +[PXTimelineSize widgetSizeForSizeClass:](PXTimelineSize, "widgetSizeForSizeClass:", v9);
  v11 = v10;
  v13 = v12;
  v14 = -[PXTimelineDataSource initWithPhotoLibrary:forWidgetSize:]([PXTimelineDataSource alloc], "initWithPhotoLibrary:forWidgetSize:", v18, v10, v12);
  +[PXWidgetTimeline timelineFromLibrary:forWidgetSize:timelineSize:](PXWidgetTimeline, "timelineFromLibrary:forWidgetSize:timelineSize:", v18, v9, v11, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PXSettingsTimelineInspectorViewController initWithWidgetSizeClass:timeline:dataSource:]([PXSettingsTimelineInspectorViewController alloc], "initWithWidgetSizeClass:timeline:dataSource:", v9, v15, v14);
  -[PXSettingsTimelineTableViewController navigationController](self, "navigationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pushViewController:animated:", v16, 1);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PXSettingsTimelineTableViewCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSettingsTimelineTableViewController widgetSizes](self, "widgetSizes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  +[PXTimelineSize sizeDescriptionForSizeClass:](PXTimelineSize, "sizeDescriptionForSizeClass:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

  return v7;
}

- (NSArray)widgetSizes
{
  return self->_widgetSizes;
}

- (void)setWidgetSizes:(id)a3
{
  objc_storeStrong((id *)&self->_widgetSizes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetSizes, 0);
}

@end
