@implementation MFMailboxFilterPickerViewController

- (MFMailboxFilterPickerViewController)initWithViewModel:(id)a3 delegate:(id)a4
{
  id v8;
  id v9;
  void *v10;
  MFMailboxFilterPickerViewController *v11;
  MFMailboxFilterPickerViewController *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailboxFilterPickerViewController.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewModel"));

    if (v10)
      goto LABEL_3;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailboxFilterPickerViewController.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)MFMailboxFilterPickerViewController;
  v11 = -[MFMailboxFilterPickerViewController initWithStyle:](&v16, "initWithStyle:", 2);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v10);
    objc_storeStrong((id *)&v12->_viewModel, a3);
  }

  return v12;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFMailboxFilterPickerViewController;
  -[MFMailboxFilterPickerViewController viewDidLoad](&v3, "viewDidLoad");
  -[MFMailboxFilterPickerViewController _setupNavigationBar](self, "_setupNavigationBar");
  -[MFMailboxFilterPickerViewController _setupTableView](self, "_setupTableView");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFMailboxFilterPickerViewController;
  -[MFMailboxFilterPickerViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewController mf_updatePreferredContentSizeBasedOnTableView](self, "mf_updatePreferredContentSizeBasedOnTableView"));
  -[MFMailboxFilterPickerViewController setTableViewObserver:](self, "setTableViewObserver:", v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFMailboxFilterPickerViewController;
  -[MFMailboxFilterPickerViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("MFMailboxFilterPickerViewControllerDidShow"), 0);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MFMailboxFilterPickerViewController;
  -[MFMailboxFilterPickerViewController traitCollectionDidChange:](&v5, "traitCollectionDidChange:", v4);
  -[MFMailboxFilterPickerViewController mf_updateTableViewBackgroundColorForPopover](self, "mf_updateTableViewBackgroundColorForPopover");

}

- (void)_setupTableView
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewController tableView](self, "tableView"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(MFMailboxFilterPickerSwitchCell), CFSTR("MFMailboxFilterPickerSwitchCell"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(MFMailboxFilterPickerCheckmarkCell), CFSTR("MFMailboxFilterPickerCheckmarkCell"));
  objc_msgSend(v3, "setKeyboardDismissMode:", 1);
  objc_msgSend(v3, "setEstimatedRowHeight:", 44.0);
  objc_msgSend(v3, "setRowHeight:", UITableViewAutomaticDimension);
  objc_msgSend(v3, "setAllowsMultipleSelection:", 1);
  -[MFMailboxFilterPickerViewController _updateSelectedRows](self, "_updateSelectedRows");

}

- (void)_setupNavigationBar
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FILTERS_PICKER_TITLE"), &stru_100531B00, CFSTR("Main")));
  -[MFMailboxFilterPickerViewController setTitle:](self, "setTitle:", v3);

  v6 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "doneButtonPressed:");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v4, "setRightBarButtonItem:", v6);

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewController viewModel](self, "viewModel", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "titleForSection:", a4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedUppercaseString"));
  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewController viewModel](self, "viewModel", a3));
  v4 = objc_msgSend(v3, "numberOfFilterSection");

  return (int64_t)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewController viewModel](self, "viewModel", a3));
  v6 = objc_msgSend(v5, "numberOfFiltersForSection:", a4);

  return (int64_t)v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewController viewModel](self, "viewModel"));
  v9 = objc_msgSend(v8, "selectionTypeAtIndex:", v7);

  if (v9)
  {
    if (v9 == (id)1)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("MFMailboxFilterPickerSwitchCell"), v7));
      objc_msgSend(v10, "setDelegate:", self);
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[MFMailboxFilterPickerViewController tableView:cellForRowAtIndexPath:]"));
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("MFMailboxFilterPickerViewController.m"), 133, CFSTR("Unknown selection type"));

      v10 = 0;
    }
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("MFMailboxFilterPickerCheckmarkCell"), v7));
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewController viewModel](self, "viewModel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "filterAtIndexPath:", v7));

  objc_msgSend(v10, "bindWithMailboxFilter:", v14);
  objc_msgSend(v10, "mf_updateBackgroundColorForPopover:", -[MFMailboxFilterPickerViewController mf_supportsPopoverPresentation](self, "mf_supportsPopoverPresentation"));

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewController viewModel](self, "viewModel"));
  objc_msgSend(v5, "selectFilterAtIndexPath:", v6);

}

- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewController viewModel](self, "viewModel"));
  if (objc_msgSend(v6, "canDeselectRowAtIndexPath:", v5))
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewController viewModel](self, "viewModel"));
  objc_msgSend(v5, "deselectFilterAtIndexPath:", v6);

}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6;

  v6 = a4;
  objc_msgSend(v6, "mf_updateBackgroundColorForPopover:", -[MFMailboxFilterPickerViewController mf_supportsPopoverPresentation](self, "mf_supportsPopoverPresentation"));

}

- (void)doneButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewController viewModel](self, "viewModel", a3));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedFilters"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewController delegate](self, "delegate"));
  objc_msgSend(v5, "mailboxFilterPickerViewController:didFinishPickingWithSelectedFilters:", self, v6);

}

- (void)cancelButtonPressed:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "didDismissMailboxFilterPickerViewController:", self);

}

- (void)_updateSelectedRows
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewController tableView](self, "tableView"));
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewController viewModel](self, "viewModel", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selected"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(v3, "selectRowAtIndexPath:animated:scrollPosition:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), 0, 0);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)mailboxFilterPickerSwitchCell:(id)a3 valueDidChange:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewController tableView](self, "tableView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathForCell:", v9));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewController viewModel](self, "viewModel"));
  if (v4)
    objc_msgSend(v8, "selectFilterAtIndexPath:", v7);
  else
    objc_msgSend(v8, "deselectFilterAtIndexPath:", v7);

}

- (MFMailboxFilterPickerViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (MFMailboxFilterPickerViewControllerDelegate)delegate
{
  return (MFMailboxFilterPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (EFCancelable)tableViewObserver
{
  return self->_tableViewObserver;
}

- (void)setTableViewObserver:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableViewObserver, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
