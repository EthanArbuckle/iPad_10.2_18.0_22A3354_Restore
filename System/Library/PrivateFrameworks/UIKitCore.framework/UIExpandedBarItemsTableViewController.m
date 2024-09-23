@implementation UIExpandedBarItemsTableViewController

- (UIExpandedBarItemsTableViewController)initWithBarButtonGroup:(id)a3
{
  id v5;
  UIExpandedBarItemsTableViewController *v6;
  UIExpandedBarItemsTableViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIExpandedBarItemsTableViewController;
  v6 = -[UITableViewController initWithStyle:](&v9, sel_initWithStyle_, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_barButtonGroup, a3);

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIExpandedBarItemsTableViewController;
  -[UIViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[UITableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlwaysBounceVertical:", 0);

  -[UITableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("baritemcell"));

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIExpandedBarItemsTableViewController;
  -[UITableViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[UIExpandedBarItemsTableViewController barButtonGroup](self, "barButtonGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_validateAllItems");

}

- (id)_visibleItems
{
  void *v2;
  void *v3;
  void *v4;

  -[UIBarButtonItemGroup barButtonItems](self->_barButtonGroup, "barButtonItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("hidden == NO"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)_numberOfItems
{
  void *v2;
  unint64_t v3;

  -[UIExpandedBarItemsTableViewController _visibleItems](self, "_visibleItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)_displayTitleForBarButtonItem:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v12;
  void *v13;

  v3 = a3;
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(v3, "possibleTitles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      objc_msgSend(v3, "possibleTitles");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "anyObject");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v3, "accessibilityLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v3, "accessibilityLabel");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      }
      if (!os_variant_has_internal_diagnostics())
      {
        v6 = &stru_1E16EDF20;
        goto LABEL_7;
      }
      v13 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromSelector((SEL)objc_msgSend(v3, "action"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("NEEDS TITLE: %@"), v9);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (__CFString *)v10;

    goto LABEL_7;
  }
  objc_msgSend(v3, "title");
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_3:
  v6 = (__CFString *)v5;
LABEL_7:

  return v6;
}

- (CGSize)preferredContentSize
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  unint64_t v19;
  double v20;
  double v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;
  CGSize result;

  v29 = *MEMORY[0x1E0C80C00];
  +[UILabel defaultFont](UILabel, "defaultFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[UIBarButtonItemGroup barButtonItems](self->_barButtonGroup, "barButtonItems", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    v8 = *(_QWORD *)off_1E1678D90;
    v9 = 180.0;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        -[UIExpandedBarItemsTableViewController _displayTitleForBarButtonItem:](self, "_displayTitleForBarButtonItem:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v8;
        v27 = v3;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "sizeWithAttributes:", v12);
        v14 = v13;

        if (v14 + 45.0 + 20.0 > v9)
          v9 = v14 + 45.0 + 20.0;

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v6);
  }
  else
  {
    v9 = 180.0;
  }

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "keyboardWindow");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v16, "bounds");
    if (v9 > v17)
    {
      objc_msgSend(v16, "bounds");
      v9 = v18;
    }
  }
  v19 = -[UIExpandedBarItemsTableViewController _numberOfItems](self, "_numberOfItems");

  v20 = (double)v19 * 55.0;
  v21 = v9;
  result.height = v20;
  result.width = v21;
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 55.0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("baritemcell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIExpandedBarItemsTableViewController _visibleItems](self, "_visibleItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIExpandedBarItemsTableViewController _displayTitleForBarButtonItem:](self, "_displayTitleForBarButtonItem:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  objc_msgSend(v10, "image");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setImage:", v13);

  if ((objc_msgSend(v10, "isEnabled") & 1) != 0)
  {
    objc_msgSend(v7, "setSelectionStyle:", 3);
    objc_msgSend(v7, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = 1.0;
  }
  else
  {
    objc_msgSend(v7, "setSelectionStyle:", 0);
    objc_msgSend(v7, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = 0.25;
  }
  objc_msgSend(v15, "setAlpha:", v17);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void (**v10)(_QWORD);
  _BYTE *v11;
  char v12;
  void (**v13)(_QWORD);
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  UIExpandedBarItemsTableViewController *v19;

  v5 = a4;
  -[UIExpandedBarItemsTableViewController _visibleItems](self, "_visibleItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __75__UIExpandedBarItemsTableViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  v17 = &unk_1E16B1B50;
  v9 = v8;
  v18 = v9;
  v19 = self;
  v10 = (void (**)(_QWORD))_Block_copy(&v14);
  objc_msgSend(v9, "buttonGroup", v14, v15, v16, v17);
  v11 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = v11[24];

    v13 = v10;
    if ((v12 & 4) != 0)
    {
      v10[2](v10);
      v13 = 0;
    }
  }
  else
  {
    v13 = v10;
  }
  -[UIViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v13);

}

void __75__UIExpandedBarItemsTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  if (objc_msgSend(*(id *)(a1 + 32), "action"))
  {
    objc_msgSend(*(id *)(a1 + 32), "target");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      v3 = (void *)UIApp;
      v4 = objc_msgSend(*(id *)(a1 + 32), "action");
      objc_msgSend(*(id *)(a1 + 32), "target");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "barButtonGroup");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "representativeItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "sendAction:to:from:forEvent:", v4, v7, v6, 0);

    }
  }
}

- (UIBarButtonItemGroup)barButtonGroup
{
  return self->_barButtonGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barButtonGroup, 0);
}

@end
