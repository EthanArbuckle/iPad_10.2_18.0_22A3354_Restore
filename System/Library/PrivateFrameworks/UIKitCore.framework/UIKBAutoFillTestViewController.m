@implementation UIKBAutoFillTestViewController

- (UIKBAutoFillTestViewController)initWithAutoFillTestArchive:(id)a3
{
  id v5;
  UIKBAutoFillTestViewController *v6;
  UIKBAutoFillTestViewController *v7;
  UIKBAutoFillTestViewController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIKBAutoFillTestViewController;
  v6 = -[UIViewController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_testArchive, a3);
    v8 = v7;
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIKBAutoFillTestViewController;
  -[UIViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[UIKBAutoFillTestArchive snapshotView](self->_testArchive, "snapshotView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoresizingMask:", 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__UIKBAutoFillTestViewController_viewDidLoad__block_invoke;
  v6[3] = &unk_1E16CC9B0;
  v6[4] = self;
  +[UIKBAutoFillTestViewController enumerateSubviewsOfRootView:usingBlock:](UIKBAutoFillTestViewController, "enumerateSubviewsOfRootView:usingBlock:", v3, v6);
  -[UIViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v3);

  -[UIKBAutoFillTestArchive viewControllerTitle](self->_testArchive, "viewControllerTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController setTitle:](self, "setTitle:", v5);

  -[UIKBAutoFillTestViewController _applyNavigationItemPropertiesFromTestArchive](self, "_applyNavigationItemPropertiesFromTestArchive");
}

void __45__UIKBAutoFillTestViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  id v6;
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    *a3 = 1;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = v7;
    objc_msgSend(v6, "setDelegate:", v5);
    objc_msgSend(v6, "setDataSource:", *(_QWORD *)(a1 + 32));

  }
}

- (void)_applyNavigationItemPropertiesFromTestArchive
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[UIKBAutoFillTestArchive viewControllerNavigationItem](self->_testArchive, "viewControllerNavigationItem");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[UIViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  objc_msgSend(v13, "prompt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPrompt:", v5);

  objc_msgSend(v13, "backButtonTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackButtonTitle:", v6);

  objc_msgSend(v13, "backBarButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackBarButtonItem:", v7);

  objc_msgSend(v13, "leftBarButtonItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v3, "setLeftBarButtonItems:", v8);
  }
  else
  {
    objc_msgSend(v13, "leftBarButtonItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLeftBarButtonItem:", v9);

  }
  objc_msgSend(v13, "titleView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v3, "setTitleView:", v10);
  objc_msgSend(v13, "rightBarButtonItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v3, "setRightBarButtonItems:", v11);
  }
  else
  {
    objc_msgSend(v13, "rightBarButtonItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRightBarButtonItem:", v12);

  }
  if (dyld_program_sdk_at_least())
    objc_msgSend(v3, "setLargeTitleDisplayMode:", objc_msgSend(v13, "largeTitleDisplayMode"));

}

+ (void)enumerateSubviewsOfRootView:(id)a3 usingBlock:(id)a4
{
  id v5;
  void (**v6)(id, void *, char *, _WORD *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int16 v11;

  v5 = a3;
  v6 = (void (**)(id, void *, char *, _WORD *))a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v5);
  while (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectAtIndex:", 0);
    v11 = 0;
    v6[2](v6, v9, (char *)&v11 + 1, &v11);
    if ((_BYTE)v11)
    {

      break;
    }
    if (!HIBYTE(v11))
    {
      objc_msgSend(v9, "subviews");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObjectsFromArray:", v10);

    }
  }

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[UIKBAutoFillTestArchive tableViewDataSourceWithTag:](self->_testArchive, "tableViewDataSourceWithTag:", objc_msgSend(a3, "tag"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  int64_t v6;

  -[UIKBAutoFillTestArchive tableViewDataSourceWithTag:](self->_testArchive, "tableViewDataSourceWithTag:", objc_msgSend(a3, "tag"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfRowsInSection:", a4);

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  UIKBAutoFillTestArchive *testArchive;
  id v6;
  void *v7;
  void *v8;

  testArchive = self->_testArchive;
  v6 = a4;
  -[UIKBAutoFillTestArchive tableViewDataSourceWithTag:](testArchive, "tableViewDataSourceWithTag:", objc_msgSend(a3, "tag"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForRowAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;

  -[UIKBAutoFillTestArchive tableViewDataSourceWithTag:](self->_testArchive, "tableViewDataSourceWithTag:", objc_msgSend(a3, "tag"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "titleForHeaderInSection:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;

  -[UIKBAutoFillTestArchive tableViewDataSourceWithTag:](self->_testArchive, "tableViewDataSourceWithTag:", objc_msgSend(a3, "tag"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "titleForFooterInSection:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  UIKBAutoFillTestArchive *testArchive;
  id v6;
  void *v7;
  double v8;
  double v9;

  testArchive = self->_testArchive;
  v6 = a4;
  -[UIKBAutoFillTestArchive tableViewDataSourceWithTag:](testArchive, "tableViewDataSourceWithTag:", objc_msgSend(a3, "tag"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "heightForRowAtIndexPath:", v6);
  v9 = v8;

  return v9;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  void *v5;
  double v6;
  double v7;

  -[UIKBAutoFillTestArchive tableViewDataSourceWithTag:](self->_testArchive, "tableViewDataSourceWithTag:", objc_msgSend(a3, "tag"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "heightForHeaderInSection:", a4);
  v7 = v6;

  return v7;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  void *v5;
  double v6;
  double v7;

  -[UIKBAutoFillTestArchive tableViewDataSourceWithTag:](self->_testArchive, "tableViewDataSourceWithTag:", objc_msgSend(a3, "tag"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "heightForHeaderInSection:", a4);
  v7 = v6;

  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;

  -[UIKBAutoFillTestArchive tableViewDataSourceWithTag:](self->_testArchive, "tableViewDataSourceWithTag:", objc_msgSend(a3, "tag"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewForHeaderInSection:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;

  -[UIKBAutoFillTestArchive tableViewDataSourceWithTag:](self->_testArchive, "tableViewDataSourceWithTag:", objc_msgSend(a3, "tag"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewForHeaderInSection:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (UIKBAutoFillTestArchive)testArchive
{
  return self->_testArchive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testArchive, 0);
}

@end
