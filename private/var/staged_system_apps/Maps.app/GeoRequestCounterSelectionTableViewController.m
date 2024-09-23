@implementation GeoRequestCounterSelectionTableViewController

- (GeoRequestCounterSelectionTableViewController)initWithSelection:(id)a3
{
  id v5;
  GeoRequestCounterSelectionTableViewController *v6;
  GeoRequestCounterSelectionTableViewController *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GeoRequestCounterSelectionTableViewController;
  v6 = -[GeoRequestCounterSelectionTableViewController init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_selection, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterSelectionTableViewController tableView](v7, "tableView"));
    objc_msgSend(v8, "registerClass:forCellReuseIdentifier:", objc_opt_class(UITableViewCell), CFSTR("selection"));

  }
  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (int64_t)-[GeoRequestCounterSelection rowCount](self->_selection, "rowCount", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("selection"), v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterSelection currentSelection](self->_selection, "currentSelection"));
  v9 = objc_msgSend(v8, "containsIndex:", objc_msgSend(v6, "row"));

  if (v9)
    v10 = 3;
  else
    v10 = 0;
  objc_msgSend(v7, "setAccessoryType:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterSelection stringForRow:](self->_selection, "stringForRow:", objc_msgSend(v6, "row")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
  objc_msgSend(v12, "setText:", v11);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  GeoRequestCounterSelection *selection;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "cellForRowAtIndexPath:", v6));
  v8 = -[GeoRequestCounterSelection supportsMultipleSelection](self->_selection, "supportsMultipleSelection");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterSelection currentSelection](self->_selection, "currentSelection"));
  v10 = v9;
  if ((v8 & 1) != 0)
  {
    v11 = objc_msgSend(v9, "mutableCopy");

    if (objc_msgSend(v7, "accessoryType") == (id)3)
    {
      objc_msgSend(v7, "setAccessoryType:", 0);
      objc_msgSend(v11, "removeIndex:", objc_msgSend(v6, "row"));
    }
    else
    {
      objc_msgSend(v7, "setAccessoryType:", 3);
      objc_msgSend(v11, "addIndex:", objc_msgSend(v6, "row"));
    }
    -[GeoRequestCounterSelection setSelection:](self->_selection, "setSelection:", v11);
    v10 = v11;
  }
  else
  {
    if (objc_msgSend(v9, "count"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", objc_msgSend(v10, "firstIndex"), 0));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "cellForRowAtIndexPath:", v12));

      objc_msgSend(v13, "setAccessoryType:", 0);
    }
    selection = self->_selection;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", objc_msgSend(v6, "row")));
    -[GeoRequestCounterSelection setSelection:](selection, "setSelection:", v15);

    objc_msgSend(v7, "setAccessoryType:", 3);
  }

  objc_msgSend(v16, "deselectRowAtIndexPath:animated:", v6, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selection, 0);
}

@end
