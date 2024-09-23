@implementation GeoRequestResponseLogBundleIdTableViewController

- (GeoRequestResponseLogBundleIdTableViewController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GeoRequestResponseLogBundleIdTableViewController;
  return -[GeoRequestResponseLogBundleIdTableViewController initWithStyle:](&v3, "initWithStyle:", 0);
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GeoRequestResponseLogBundleIdTableViewController;
  -[GeoRequestResponseLogBundleIdTableViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 4, self, "_addRow");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestResponseLogBundleIdTableViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v4, "setRightBarButtonItem:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestResponseLogBundleIdTableViewController tableView](self, "tableView"));
  objc_msgSend(v5, "setSectionHeaderHeight:", UITableViewAutomaticDimension);

}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t Set;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  NSMutableArray *bundleIds;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GeoRequestResponseLogBundleIdTableViewController;
  -[GeoRequestResponseLogBundleIdTableViewController viewWillAppear:](&v9, "viewWillAppear:", a3);
  Set = GEOConfigGetSet(GeoServicesConfig_MapsRequestResponseLoggingPersistedLimitBundleIds[0], GeoServicesConfig_MapsRequestResponseLoggingPersistedLimitBundleIds[1]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(Set);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
  v7 = (NSMutableArray *)objc_msgSend(v6, "mutableCopy");
  bundleIds = self->_bundleIds;
  self->_bundleIds = v7;

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (int64_t)-[NSMutableArray count](self->_bundleIds, "count", a3, a4);
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];

  v4 = objc_alloc_init((Class)UILabel);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "setText:", CFSTR("Bundle Ids are matched exactly. An id may end in * to perform a prefix match (e.g. \"com.apple.*\" to filter on all internal apps)"));
  objc_msgSend(v4, "setNumberOfLines:", 0);
  v5 = objc_alloc_init((Class)UIView);
  objc_msgSend(v5, "addSubview:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:", v18, 8.0));
  v20[0] = v17;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:", v15, 8.0));
  v20[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, 8.0));
  v20[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 8.0));
  v20[3] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_bundleIds, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10026CDD0;
  v11[3] = &unk_1011AE3D0;
  v11[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  -[GeoRequestResponseLogBundleIdTableViewController _editBundleId:completion:](self, "_editBundleId:completion:", v8, v11);

  objc_msgSend(v9, "deselectRowAtIndexPath:animated:", v10, 1);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  NSMutableArray *bundleIds;
  id v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, CFSTR("row"));
  objc_msgSend(v6, "setSelectionStyle:", 0);
  bundleIds = self->_bundleIds;
  v8 = objc_msgSend(v5, "row");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](bundleIds, "objectAtIndexedSubscript:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textLabel"));
  objc_msgSend(v10, "setText:", v9);

  return v6;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  GeoRequestResponseLogBundleIdTableViewController *v13;
  id v14;
  void *v15;

  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_10026D0AC;
  v12 = &unk_1011AE3F8;
  v13 = self;
  v14 = a4;
  v4 = v14;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextualAction contextualActionWithStyle:title:handler:](UIContextualAction, "contextualActionWithStyle:title:handler:", 1, CFSTR("Delete"), &v9));
  v15 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1, v9, v10, v11, v12, v13));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UISwipeActionsConfiguration configurationWithActions:](UISwipeActionsConfiguration, "configurationWithActions:", v6));

  return v7;
}

- (void)_addRow
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10026D1FC;
  v2[3] = &unk_1011AE420;
  v2[4] = self;
  -[GeoRequestResponseLogBundleIdTableViewController _editBundleId:completion:](self, "_editBundleId:completion:", &stru_1011EB268, v2);
}

- (void)_editBundleId:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10026D3E4;
  v8[3] = &unk_1011AE448;
  v9 = a4;
  v6 = v9;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GeoRequestResponseLogBundleIdAlertController alertControllerWithBundleId:completionHandler:](GeoRequestResponseLogBundleIdAlertController, "alertControllerWithBundleId:completionHandler:", a3, v8));
  -[GeoRequestResponseLogBundleIdTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIds, 0);
}

@end
