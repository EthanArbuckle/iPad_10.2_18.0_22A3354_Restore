@implementation _EnvironmentsAlertTableViewController

- (_EnvironmentsAlertTableViewController)initWithStyle:(int64_t)a3 environments:(id)a4
{
  id v7;
  _EnvironmentsAlertTableViewController *v8;
  _EnvironmentsAlertTableViewController *v9;
  void *v10;
  void *v11;
  uint64_t String;
  void *v13;
  NSString *v14;
  NSString *selectedEnvironmentName;
  _EnvironmentsAlertTableViewController *v16;
  objc_super v18;

  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_EnvironmentsAlertTableViewController;
  v8 = -[_EnvironmentsAlertTableViewController initWithStyle:](&v18, "initWithStyle:", a3);
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_EnvironmentsAlertTableViewController tableView](v8, "tableView"));
    objc_msgSend(v10, "setDelegate:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_EnvironmentsAlertTableViewController tableView](v9, "tableView"));
    objc_msgSend(v11, "setDataSource:", v9);

    objc_storeStrong((id *)&v9->_environments, a4);
    String = GEOConfigGetString(GeoServicesConfig_ResourceManifestEnvironment[0], GeoServicesConfig_ResourceManifestEnvironment[1]);
    v13 = (void *)objc_claimAutoreleasedReturnValue(String);
    v14 = (NSString *)objc_msgSend(v13, "copy");
    selectedEnvironmentName = v9->_selectedEnvironmentName;
    v9->_selectedEnvironmentName = v14;

    v16 = v9;
  }

  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (int64_t)-[NSArray count](self->_environments, "count", a3, a4) + 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *selectedEnvironmentName;
  void *v14;
  uint64_t v15;

  v5 = a4;
  v6 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, 0);
  v7 = objc_msgSend(v5, "row");
  if (v7 == (id)-[NSArray count](self->_environments, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textLabel"));
    objc_msgSend(v8, "setText:", CFSTR("Custom Environment"));

    if (self->_customEnvironmentSelected)
      v9 = 3;
    else
      v9 = 0;
    objc_msgSend(v6, "setAccessoryType:", v9);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_environments, "objectAtIndexedSubscript:", objc_msgSend(v5, "row")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textLabel"));
    objc_msgSend(v12, "setText:", v11);

    selectedEnvironmentName = self->_selectedEnvironmentName;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
    LODWORD(selectedEnvironmentName) = -[NSString isEqualToString:](selectedEnvironmentName, "isEqualToString:", v14);

    if ((_DWORD)selectedEnvironmentName)
      v15 = 3;
    else
      v15 = 0;
    objc_msgSend(v6, "setAccessoryType:", v15);

  }
  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  NSString *selectedEnvironmentName;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *v12;
  void *v13;
  id v14;

  v14 = a4;
  v6 = a3;
  v7 = objc_msgSend(v14, "row");
  if (v7 == (id)-[NSArray count](self->_environments, "count"))
  {
    selectedEnvironmentName = self->_selectedEnvironmentName;
    self->_selectedEnvironmentName = 0;

    self->_customEnvironmentSelected = 1;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_environments, "objectAtIndexedSubscript:", objc_msgSend(v14, "row")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
    v11 = (NSString *)objc_msgSend(v10, "copy");
    v12 = self->_selectedEnvironmentName;
    self->_selectedEnvironmentName = v11;

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_EnvironmentsAlertTableViewController tableView](self, "tableView"));
  objc_msgSend(v13, "reloadData");

  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v14, 1);
}

- (NSString)selectedEnvironmentName
{
  return self->_selectedEnvironmentName;
}

- (BOOL)isCustomEnvironmentSelected
{
  return self->_customEnvironmentSelected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedEnvironmentName, 0);
  objc_storeStrong((id *)&self->_environments, 0);
}

@end
