@implementation MTBasePodcastListViewController

+ (id)defaultsKey
{
  return 0;
}

- (id)storedUuid
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = objc_msgSend((id)objc_opt_class(self), "defaultsKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v6 = objc_msgSend((id)objc_opt_class(self), "defaultsKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringForKey:", v7));

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)reuseIdentifierForRow:(id)a3
{
  return +[MTGenericCell reuseIdentifier](MTPodcastCell, "reuseIdentifier", a3);
}

- (id)newCellInstanceWithReuseIdentifier:(id)a3
{
  id v3;
  MTPodcastCell *v4;

  v3 = a3;
  v4 = -[MTPodcastCell initWithStyle:reuseIdentifier:]([MTPodcastCell alloc], "initWithStyle:reuseIdentifier:", 0, v3);

  return v4;
}

- (void)configureCell:(id)a3 withObject:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("MTAbstractMethod"), CFSTR("Handle this method in the subclass"), 0));
  objc_exception_throw(v10);
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return -[MTBasePodcastListViewController isEditing](self, "isEditing", a3, a4);
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;

  v15 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController frc](self, "frc"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexPath:", v15));

  if ((objc_opt_respondsToSelector(v6, "uuid") & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController delegate](self, "delegate"));
    objc_msgSend(v8, "sourceList:didSelectItemUuid:atIndexPath:", self, v7, v15);

    v9 = objc_msgSend((id)objc_opt_class(self), "defaultsKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v12 = objc_msgSend((id)objc_opt_class(self), "defaultsKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      objc_msgSend(v11, "setObject:forKey:", v7, v13);

      v14 = -[MTBasePodcastListViewController _selectItemWithUuid:](self, "_selectItemWithUuid:", v7);
    }

  }
}

- (void)restoreSelection
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController storedUuid](self, "storedUuid"));
  -[MTBasePodcastListViewController setSelectedUuid:](self, "setSelectedUuid:", v3);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController selectedUuid](self, "selectedUuid"));
  -[MTBasePodcastListViewController selectItemWithUuid:forceScroll:](self, "selectItemWithUuid:forceScroll:", v4, 0);

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[MTBasePodcastListViewController didEndDraggingScrollView](self, "didEndDraggingScrollView", a3);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  -[MTBasePodcastListViewController didEndDraggingScrollView](self, "didEndDraggingScrollView", a3);
}

- (void)didEndDraggingScrollView
{
  if (self->_endRefreshWhenDraggingEnds)
  {
    -[MTBasePodcastListViewController setRefreshing:](self, "setRefreshing:", 0);
    self->_endRefreshWhenDraggingEnds = 0;
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTBasePodcastListViewController;
  return -[MTFetchedTableViewController numberOfSectionsInTableView:](&v4, "numberOfSectionsInTableView:", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTBasePodcastListViewController;
  return -[MTFetchedTableViewController tableView:numberOfRowsInSection:](&v5, "tableView:numberOfRowsInSection:", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTBasePodcastListViewController;
  v4 = -[MTFetchedTableViewController tableView:cellForRowAtIndexPath:](&v6, "tableView:cellForRowAtIndexPath:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  return a5;
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v12;
  void *v13;
  void *v14;
  id v15;
  objc_super v16;

  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MTBasePodcastListViewController;
  -[MTFetchedTableViewController controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:](&v16, "controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:", a3, v12, a5, a6, a7);
  if ((objc_opt_respondsToSelector(v12, "uuid") & 1) != 0)
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuid"));
  else
    v13 = 0;
  if (objc_msgSend(v13, "isEqual:", self->_selectedUuid))
  {
    if (a6 == 2)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController navigationController](self, "navigationController"));
      v15 = objc_msgSend(v14, "popToRootViewControllerAnimated:", 1);
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController delegate](self, "delegate"));
      objc_msgSend(v14, "sourceList:didUpdateSelectedItemUuid:", self, v13);
    }

  }
}

- (void)controllerDidChangeContent:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTBasePodcastListViewController;
  -[MTFetchedTableViewController controllerDidChangeContent:](&v6, "controllerDidChangeContent:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
  if (!-[MTFetchedTableViewController changeIsUserDriven](self, "changeIsUserDriven")
    && (-[MTBasePodcastListViewController isHorizontallyCompact](self, "isHorizontallyCompact") & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathForSelectedRow"));
    if (v5)
    {

    }
    else if ((uint64_t)objc_msgSend(v4, "numberOfRowsInSection:", 0) >= 1)
    {
      -[MTBasePodcastListViewController restoreSelection](self, "restoreSelection");
    }
  }

}

- (id)tableView
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTBasePodcastListViewController;
  v2 = -[MTBasePodcastListViewController tableView](&v4, "tableView");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTBasePodcastListViewController;
  -[MTFetchedTableViewController viewWillDisappear:](&v8, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController refreshControl](self, "refreshControl"));
  v5 = objc_msgSend(v4, "isRefreshing");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController refreshControl](self, "refreshControl"));
    objc_msgSend(v6, "endRefreshing");

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "removeObserver:name:object:", self, NSUserDefaultsDidChangeNotification, 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  void *v23;
  dispatch_time_t v24;
  void *v25;
  char v26;
  id v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  _QWORD block[5];
  objc_super v32;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForSelectedRow"));

  v32.receiver = self;
  v32.super_class = (Class)MTBasePodcastListViewController;
  -[MTFetchedTableViewController viewWillAppear:](&v32, "viewWillAppear:", v3);
  v7 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
  +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
  objc_msgSend(v8, "reloadData");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController splitViewController](self, "splitViewController"));
  v10 = objc_msgSend(v9, "isHorizontallyCompact");

  if ((v10 & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "addObserver:selector:name:object:", self, "updatedDefaults:", NSUserDefaultsDidChangeNotification, 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
    objc_msgSend(v12, "selectRowAtIndexPath:animated:scrollPosition:", v6, 0, 0);

    -[MTBasePodcastListViewController restoreSelection](self, "restoreSelection");
  }
  +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController refreshControl](self, "refreshControl"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController refreshControl](self, "refreshControl"));
    v15 = objc_msgSend(v14, "isRefreshing");

    if ((v15 & 1) == 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController refreshControl](self, "refreshControl"));
      objc_msgSend(v16, "beginRefreshing");

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController refreshControl](self, "refreshControl"));
      objc_msgSend(v17, "endRefreshing");

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController refreshControl](self, "refreshControl"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController attributedTitleForRefreshControl](self, "attributedTitleForRefreshControl"));
    objc_msgSend(v18, "setAttributedTitle:", v19);

    if (-[MTBasePodcastListViewController isRefreshing](self, "isRefreshing"))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController refreshControl](self, "refreshControl"));
      v21 = objc_msgSend(v20, "isRefreshing");

      if ((v21 & 1) == 0)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
        objc_msgSend(v22, "setAdjustContentOffsetForRefreshControlAsNeeded:", 1);

        v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController refreshControl](self, "refreshControl"));
        objc_msgSend(v23, "beginRefreshing");

        v24 = dispatch_time(0, 100000000);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100118658;
        block[3] = &unk_1004A6200;
        block[4] = self;
        dispatch_after(v24, (dispatch_queue_t)&_dispatch_main_q, block);
      }
    }
  }
  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController targetForRefreshControl](self, "targetForRefreshControl"));
    v26 = objc_opt_respondsToSelector(v25, -[MTBasePodcastListViewController selectorForRefreshControl](self, "selectorForRefreshControl"));

    if ((v26 & 1) != 0)
    {
      v27 = objc_alloc_init((Class)UIRefreshControl);
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController targetForRefreshControl](self, "targetForRefreshControl"));
      objc_msgSend(v27, "addTarget:action:forControlEvents:", v28, -[MTBasePodcastListViewController selectorForRefreshControl](self, "selectorForRefreshControl"), 4096);

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController attributedTitleForRefreshControl](self, "attributedTitleForRefreshControl"));
      objc_msgSend(v27, "setAttributedTitle:", v29);

      -[MTFetchedTableViewController setRefreshControl:](self, "setRefreshControl:", v27);
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10011868C;
      v30[3] = &unk_1004A6200;
      v30[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v30);

    }
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTBasePodcastListViewController;
  -[MTBasePodcastListViewController viewDidAppear:](&v7, "viewDidAppear:", a3);
  if (-[MTBasePodcastListViewController isHorizontallyCompact](self, "isHorizontallyCompact"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForSelectedRow"));
    objc_msgSend(v4, "deselectRowAtIndexPath:animated:", v6, 1);

  }
  -[MTBasePodcastListViewController simulateMemoryWarning](self, "simulateMemoryWarning");
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MTBasePodcastListViewController;
  -[MTFetchedTableViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (void)loadView
{
  MTTableView *v3;
  void *v4;
  MTTableView *v5;

  v3 = [MTTableView alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v4, "bounds");
  v5 = -[MTTableView initWithFrame:style:](v3, "initWithFrame:style:", 2);

  -[MTTableView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
  -[MTTableView setDataSource:](v5, "setDataSource:", self);
  -[MTTableView setDelegate:](v5, "setDelegate:", self);
  -[MTTableView setSeparatorStyle:](v5, "setSeparatorStyle:", 1);
  -[MTTableView setSeparatorInset:](v5, "setSeparatorInset:", 0.0, 70.0, 0.0, 0.0);
  -[MTBasePodcastListViewController setView:](self, "setView:", v5);

}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTBasePodcastListViewController;
  -[MTFetchedTableViewController viewDidLoad](&v7, "viewDidLoad");
  v3 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
  objc_msgSend(v4, "setTableFooterView:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController storedUuid](self, "storedUuid"));
  -[MTBasePodcastListViewController setSelectedUuid:](self, "setSelectedUuid:", v5);

  -[MTBasePodcastListViewController configureRowHeight](self, "configureRowHeight");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "contentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

}

- (void)configureRowHeight
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
  +[MTGenericCell heightForWidth:](MTPodcastCell, "heightForWidth:", 1.79769313e308);
  objc_msgSend(v3, "setEstimatedRowHeight:");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
  objc_msgSend(v4, "setRowHeight:", UITableViewAutomaticDimension);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MTBasePodcastListViewController;
  -[MTFetchedTableViewController dealloc](&v4, "dealloc");
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController view](self, "view", a3));
  objc_msgSend(v4, "setNeedsLayout");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tableHeaderView"));

  objc_msgSend(v6, "setNeedsLayout");
}

- (void)setRefreshing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  unsigned int v11;
  void *v12;
  id v13;

  if (self->_refreshing != a3)
  {
    v3 = a3;
    if (a3)
    {
      self->_refreshing = a3;
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
      v6 = objc_msgSend(v5, "isDragging");

      if (v6)
      {
        -[MTBasePodcastListViewController endRefreshingWhenDraggingCompletes](self, "endRefreshingWhenDraggingCompletes");
        return;
      }
      self->_refreshing = v3;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
      objc_msgSend(v7, "reloadData");

    }
    -[MTFetchedTableViewController setChangeIsUserDriven:](self, "setChangeIsUserDriven:", v3);
    if (self->_refreshing)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController refreshControl](self, "refreshControl"));
      v9 = objc_msgSend(v8, "isRefreshing");

      if ((v9 & 1) == 0)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController refreshControl](self, "refreshControl"));
        objc_msgSend(v12, "beginRefreshing");
        goto LABEL_13;
      }
      if (self->_refreshing)
        return;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController refreshControl](self, "refreshControl"));
    v11 = objc_msgSend(v10, "isRefreshing");

    if (!v11)
      goto LABEL_14;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController refreshControl](self, "refreshControl"));
    objc_msgSend(v12, "endRefreshing");
LABEL_13:

LABEL_14:
    if (!self->_refreshing)
    {
      v13 = (id)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController refreshDelegate](self, "refreshDelegate"));
      objc_msgSend(v13, "didEndRefreshing");

    }
  }
}

- (void)endRefreshingWhenDraggingCompletes
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
  v4 = objc_msgSend(v3, "isDragging");

  if (v4)
    self->_endRefreshWhenDraggingEnds = 1;
  else
    -[MTBasePodcastListViewController setRefreshing:](self, "setRefreshing:", 0);
}

- (void)setAttributedTitleForRefreshControl:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (!-[NSAttributedString isEqualToAttributedString:](self->_attributedTitleForRefreshControl, "isEqualToAttributedString:"))
  {
    objc_storeStrong((id *)&self->_attributedTitleForRefreshControl, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController refreshControl](self, "refreshControl"));
    objc_msgSend(v5, "setAttributedTitle:", v6);

  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v6, "setBackgroundColor:", v7);

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "backgroundView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor backgroundColor](UIColor, "backgroundColor"));
  objc_msgSend(v9, "setBackgroundColor:", v8);

}

- (int64_t)flattenedCellIndexForIndexPath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  int64_t v14;
  int64_t v15;
  char *v16;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
  v7 = -[MTBasePodcastListViewController numberOfSectionsInTableView:](self, "numberOfSectionsInTableView:", v6);

  if ((uint64_t)v5 >= v7)
    v8 = v7;
  else
    v8 = (uint64_t)v5;
  if (v8 < 1)
  {
    v10 = 0;
  }
  else
  {
    v9 = 0;
    v10 = 0;
    do
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
      v10 += -[MTBasePodcastListViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v11, v9);

      ++v9;
      v12 = objc_msgSend(v4, "section");
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
      v14 = -[MTBasePodcastListViewController numberOfSectionsInTableView:](self, "numberOfSectionsInTableView:", v13);

      if ((uint64_t)v12 >= v14)
        v15 = v14;
      else
        v15 = (int64_t)v12;
    }
    while (v15 > v9);
  }
  v16 = (char *)objc_msgSend(v4, "row") + v10;

  return (int64_t)v16;
}

- (void)updatedDefaults:(id)a3
{
  id v4;
  void *v5;
  _QWORD block[5];

  v4 = objc_msgSend((id)objc_opt_class(self), "defaultsKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  if (v5)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100118F58;
    block[3] = &unk_1004A6200;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (id)firstValidIndexPath
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dataSource"));
  if (objc_msgSend(v3, "tableView:numberOfRowsInSection:", v2, 0))
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 0));
  else
    v4 = 0;

  return v4;
}

- (id)_selectItemWithUuid:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController frc](self, "frc"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fetchedObjects"));
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v12 = 0;
    v13 = 0;
    -[MTBasePodcastListViewController getObjectId:andIndexPath:forItemWithUuid:](self, "getObjectId:andIndexPath:forItemWithUuid:", &v13, &v12, v4);
    v8 = v13;
    v9 = v12;
    if (v9)
      v10 = v4;
    else
      v10 = 0;
    -[MTBasePodcastListViewController setSelectedUuid:](self, "setSelectedUuid:", v10);
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }

  return v9;
}

- (void)selectItemWithUuid:(id)a3 forceScroll:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v6 = objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController _selectItemWithUuid:](self, "_selectItemWithUuid:", a3));
  if (v6
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController firstValidIndexPath](self, "firstValidIndexPath")),
        (v6 = (uint64_t)v7) != 0))
  {
    v10 = (id)v6;
    if (!-[MTBasePodcastListViewController indexPathIsCurrentlySelectedRow:](self, "indexPathIsCurrentlySelectedRow:", v6)|| v4)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
      objc_msgSend(v8, "selectRowAtIndexPath:animated:scrollPosition:", v10, 0, 2);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
      -[MTBasePodcastListViewController tableView:didSelectRowAtIndexPath:](self, "tableView:didSelectRowAtIndexPath:", v9, v10);

    }
    v7 = v10;
  }

}

- (BOOL)indexPathIsCurrentlySelectedRow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForSelectedRow"));
  v7 = objc_msgSend(v4, "isEqual:", v6);

  return v7;
}

- (MTSourceListDelegate)delegate
{
  return (MTSourceListDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MTRefreshControlDelegate)refreshDelegate
{
  return (MTRefreshControlDelegate *)objc_loadWeakRetained((id *)&self->_refreshDelegate);
}

- (void)setRefreshDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_refreshDelegate, a3);
}

- (NSString)selectedUuid
{
  return self->_selectedUuid;
}

- (void)setSelectedUuid:(id)a3
{
  objc_storeStrong((id *)&self->_selectedUuid, a3);
}

- (BOOL)isRefreshing
{
  return self->_refreshing;
}

- (NSAttributedString)attributedTitleForRefreshControl
{
  return self->_attributedTitleForRefreshControl;
}

- (SEL)selectorForRefreshControl
{
  return self->_selectorForRefreshControl;
}

- (void)setSelectorForRefreshControl:(SEL)a3
{
  self->_selectorForRefreshControl = a3;
}

- (id)targetForRefreshControl
{
  return objc_loadWeakRetained(&self->_targetForRefreshControl);
}

- (void)setTargetForRefreshControl:(id)a3
{
  objc_storeWeak(&self->_targetForRefreshControl, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_targetForRefreshControl);
  objc_storeStrong((id *)&self->_attributedTitleForRefreshControl, 0);
  objc_storeStrong((id *)&self->_selectedUuid, 0);
  objc_destroyWeak((id *)&self->_refreshDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
