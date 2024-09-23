@implementation WFAlarmChooserViewController

- (WFAlarmChooserViewController)initWithAlarmDataSource:(id)a3 checkedAlarmIDs:(id)a4
{
  id v7;
  id v8;
  WFAlarmChooserViewController *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSMutableOrderedSet *checkedAlarmIDs;
  WFAlarmChooserViewController *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WFAlarmChooserViewController;
  v9 = -[WFAlarmChooserViewController initWithNibName:bundle:](&v16, sel_initWithNibName_bundle_, 0, 0);
  if (v9)
  {
    WFLocalizedString(CFSTR("Choose Alarms"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAlarmChooserViewController setTitle:](v9, "setTitle:", v10);

    objc_storeStrong((id *)&v9->_alarmDataSource, a3);
    -[WFAlarmChooserViewController alarmDataSource](v9, "alarmDataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerObserver:", v9);

    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSetWithArray:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
    checkedAlarmIDs = v9->_checkedAlarmIDs;
    v9->_checkedAlarmIDs = (NSMutableOrderedSet *)v12;

    v14 = v9;
  }

  return v9;
}

- (void)loadView
{
  id v3;
  UITableView *v4;
  UITableView *tableView;
  UITableView *v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc(MEMORY[0x24BEBD9F0]);
  v4 = (UITableView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  tableView = self->_tableView;
  self->_tableView = v4;

  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setAllowsSelectionDuringEditing:](self->_tableView, "setAllowsSelectionDuringEditing:", 1);
  -[UITableView setAllowsSelection:](self->_tableView, "setAllowsSelection:", 1);
  -[UITableView setAllowsMultipleSelection:](self->_tableView, "setAllowsMultipleSelection:", 1);
  -[UITableView setEstimatedRowHeight:](self->_tableView, "setEstimatedRowHeight:", 96.0);
  -[UITableView setRowHeight:](self->_tableView, "setRowHeight:", *MEMORY[0x24BEBE770]);
  v6 = self->_tableView;
  v7 = objc_opt_class();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView registerClass:forCellReuseIdentifier:](v6, "registerClass:forCellReuseIdentifier:", v7, v9);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancel_);
  -[WFAlarmChooserViewController navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLeftBarButtonItem:", v10);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_finish_);
  -[WFAlarmChooserViewController navigationItem](self, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRightBarButtonItem:", v12);

  -[WFAlarmChooserViewController setView:](self, "setView:", self->_tableView);
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFAlarmChooserViewController;
  -[WFAlarmChooserViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[WFAlarmChooserViewController alarmDataSource](self, "alarmDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "reloadAlarms");

}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (void)dataSourceDidReload:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  getWFTriggersLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    -[WFAlarmChooserViewController alarmDataSource](self, "alarmDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAlarmChooserViewController alarmDataSource](self, "alarmDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315650;
    v9 = "-[WFAlarmChooserViewController dataSourceDidReload:]";
    v10 = 2112;
    v11 = v5;
    v12 = 2048;
    v13 = objc_msgSend(v6, "numberOfAlarms");
    _os_log_impl(&dword_22007E000, v4, OS_LOG_TYPE_INFO, "%s alarmDataSource: %@ has %lu alarms", (uint8_t *)&v8, 0x20u);

  }
  -[WFAlarmChooserViewController checkForValidCheckedAlarmIDs](self, "checkForValidCheckedAlarmIDs");
  -[WFAlarmChooserViewController updateDoneButtonEnabled](self, "updateDoneButtonEnabled");
  -[WFAlarmChooserViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadData");

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[WFAlarmChooserViewController alarmDataSource](self, "alarmDataSource", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfAlarms");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v6 = a4;
  v7 = a3;
  -[WFAlarmChooserViewController alarmDataSource](self, "alarmDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "alarmAtRow:", objc_msgSend(v6, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "refreshUI:animated:", v9, 0);
  -[WFAlarmChooserViewController checkedAlarmIDs](self, "checkedAlarmIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "alarmID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v13, "containsObject:", v14);

  if ((_DWORD)v7)
    v15 = 3;
  else
    v15 = 0;
  objc_msgSend(v12, "setAccessoryType:", v15);

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a4;
  -[WFAlarmChooserViewController alarmDataSource](self, "alarmDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alarmAtRow:", objc_msgSend(v16, "row"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alarmID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFAlarmChooserViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cellForRowAtIndexPath:", v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFAlarmChooserViewController checkedAlarmIDs](self, "checkedAlarmIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v7);

  -[WFAlarmChooserViewController checkedAlarmIDs](self, "checkedAlarmIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    objc_msgSend(v12, "removeObject:", v7);
    v14 = 0;
  }
  else
  {
    objc_msgSend(v12, "addObject:", v7);
    v14 = 3;
  }

  objc_msgSend(v9, "setAccessoryType:", v14);
  -[WFAlarmChooserViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "deselectRowAtIndexPath:animated:", v16, 1);

  -[WFAlarmChooserViewController updateDoneButtonEnabled](self, "updateDoneButtonEnabled");
}

- (void)checkForValidCheckedAlarmIDs
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  id v12;

  v12 = (id)objc_opt_new();
  -[WFAlarmChooserViewController alarmDataSource](self, "alarmDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfAlarms");

  if (v4)
  {
    v5 = 0;
    do
    {
      -[WFAlarmChooserViewController alarmDataSource](self, "alarmDataSource");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "alarmAtRow:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "alarmID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v8);

      ++v5;
      -[WFAlarmChooserViewController alarmDataSource](self, "alarmDataSource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "numberOfAlarms");

    }
    while (v5 < v10);
  }
  -[WFAlarmChooserViewController checkedAlarmIDs](self, "checkedAlarmIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "intersectSet:", v12);

}

- (void)updateDoneButtonEnabled
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  -[WFAlarmChooserViewController checkedAlarmIDs](self, "checkedAlarmIDs");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "count") != 0;
  -[WFAlarmChooserViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v3);

}

- (void)finish:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  unint64_t v15;
  id v16;

  -[WFAlarmChooserViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v16 = v4;
    v5 = (void *)objc_opt_new();
    -[WFAlarmChooserViewController alarmDataSource](self, "alarmDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "numberOfAlarms");

    if (v7)
    {
      v8 = 0;
      do
      {
        -[WFAlarmChooserViewController alarmDataSource](self, "alarmDataSource");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "alarmAtRow:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        -[WFAlarmChooserViewController checkedAlarmIDs](self, "checkedAlarmIDs");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "alarmID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "containsObject:", v12);

        if (v13)
          objc_msgSend(v5, "addObject:", v10);

        ++v8;
        -[WFAlarmChooserViewController alarmDataSource](self, "alarmDataSource");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "numberOfAlarms");

      }
      while (v8 < v15);
    }
    objc_msgSend(v16, "alarmChooserViewController:didFinishWithChosenAlarms:", self, v5);

    v4 = v16;
  }

}

- (void)cancel:(id)a3
{
  id v4;

  -[WFAlarmChooserViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alarmChooserViewControllerDidCancel:", self);

}

- (WFAlarmChooserViewControllerDelegate)delegate
{
  return (WFAlarmChooserViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (MTAlarmDataSource)alarmDataSource
{
  return self->_alarmDataSource;
}

- (NSMutableOrderedSet)checkedAlarmIDs
{
  return self->_checkedAlarmIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkedAlarmIDs, 0);
  objc_storeStrong((id *)&self->_alarmDataSource, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
