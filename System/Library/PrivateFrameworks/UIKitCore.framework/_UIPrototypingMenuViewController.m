@implementation _UIPrototypingMenuViewController

- (void)loadView
{
  UITableView *v3;
  void *v4;
  UITableView *v5;

  v3 = [UITableView alloc];
  v5 = -[UITableView initWithFrame:style:](v3, "initWithFrame:style:", 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[UITableView setDelegate:](v5, "setDelegate:", self);
  -[UITableView setDataSource:](v5, "setDataSource:", self);
  -[UIScrollView setContentInsetAdjustmentBehavior:](v5, "setContentInsetAdjustmentBehavior:", 3);
  -[_UIPrototypingMenuViewController setTableView:](self, "setTableView:", v5);
  -[_UIPrototypingMenuViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController setView:](self, "setView:", v4);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  UIBarButtonItem *v5;
  UIBarButtonItem *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)_UIPrototypingMenuViewController;
  -[UIViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[_UIPrototypingMenuViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("kNumberSettingCell"));

  -[_UIPrototypingMenuViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("kBoolSettingCell"));

  v5 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]([UIBarButtonItem alloc], "initWithBarButtonSystemItem:target:action:", 13, self, sel__reloadSettings_);
  v6 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]([UIBarButtonItem alloc], "initWithBarButtonSystemItem:target:action:", 16, self, sel__resetSettings_);
  +[UIColor systemRedColor](UIColor, "systemRedColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setTintColor:](v6, "setTintColor:", v7);

  v11[0] = v6;
  v11[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRightBarButtonItems:", v8);

}

- (void)_reloadSettings:(id)a3
{
  NSArray *allSettings;
  id v5;

  allSettings = self->_allSettings;
  self->_allSettings = 0;

  -[_UIPrototypingMenuViewController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

}

- (void)_resetSettings:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Delete Settings"), CFSTR("Warning: This will delete all persisted prototyping settings and their values from this app's domain."), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51___UIPrototypingMenuViewController__resetSettings___block_invoke;
  v9[3] = &unk_1E16B3EC8;
  v9[4] = self;
  +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Delete All Settings"), 2, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __51___UIPrototypingMenuViewController__resetSettings___block_invoke_2;
  v8[3] = &unk_1E16B3EC8;
  v8[4] = self;
  +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAction:", v6);
  objc_msgSend(v4, "addAction:", v7);
  -[UIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  NSArray *allSettings;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIPrototypingMenuViewController;
  -[UIViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  +[_UIPrototypingSettingsManager sharedManager](_UIPrototypingSettingsManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronizeStoredSettings");

  allSettings = self->_allSettings;
  self->_allSettings = 0;

  -[_UIPrototypingMenuViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadData");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIPrototypingMenuViewController;
  -[UIViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  +[_UIPrototypingSettingsManager sharedManager](_UIPrototypingSettingsManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronizeStoredSettings");

}

- (NSArray)allSettings
{
  NSArray *allSettings;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  allSettings = self->_allSettings;
  if (!allSettings)
  {
    +[_UIPrototypingSettingsManager sharedManager](_UIPrototypingSettingsManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allSettings");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_allSettings;
    self->_allSettings = v5;

    allSettings = self->_allSettings;
  }
  return allSettings;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  _UIContentUnavailableView *v19;
  void *v20;
  _UIContentUnavailableView *v21;
  void *v22;
  void *v23;
  int64_t v24;

  -[_UIPrototypingMenuViewController allSettings](self, "allSettings", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  -[_UIPrototypingMenuViewController noContentView](self, "noContentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "removeFromSuperview");
  }
  else
  {

    if (v8)
    {
      -[UIViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bounds");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      -[_UIPrototypingMenuViewController noContentView](self, "noContentView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

    }
    else
    {
      v19 = [_UIContentUnavailableView alloc];
      -[UIViewController view](self, "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "bounds");
      v21 = -[_UIContentUnavailableView initWithFrame:title:style:](v19, "initWithFrame:title:style:", CFSTR("No Settings"), 0);
      -[_UIPrototypingMenuViewController setNoContentView:](self, "setNoContentView:", v21);

      -[_UIPrototypingMenuViewController noContentView](self, "noContentView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAutoresizingMask:", 18);
    }

    -[UIViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPrototypingMenuViewController noContentView](self, "noContentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v22);

  }
  -[_UIPrototypingMenuViewController allSettings](self, "allSettings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");

  return v24;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  __CFString *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  -[_UIPrototypingMenuViewController allSettings](self, "allSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "type");
  if (v10 > 2)
    v11 = 0;
  else
    v11 = off_1E16E7D50[v10];
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setPrototypingSetting:", v9);
  return v12;
}

- (void)setAllSettings:(id)a3
{
  objc_storeStrong((id *)&self->_allSettings, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (_UIContentUnavailableView)noContentView
{
  return self->_noContentView;
}

- (void)setNoContentView:(id)a3
{
  objc_storeStrong((id *)&self->_noContentView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noContentView, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_allSettings, 0);
}

@end
