@implementation WFTagPickerViewController

- (WFTagPickerViewController)initWithTitle:(id)a3 tags:(id)a4
{
  id v6;
  id v7;
  WFTagPickerViewController *v8;
  uint64_t v9;
  NSArray *tags;
  uint64_t v11;
  NSMutableOrderedSet *selectedTags;
  uint64_t v13;
  UISearchController *searchController;
  WFTagPickerViewController *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WFTagPickerViewController;
  v8 = -[WFTagPickerViewController initWithStyle:](&v17, sel_initWithStyle_, 0);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    tags = v8->_tags;
    v8->_tags = (NSArray *)v9;

    v11 = objc_opt_new();
    selectedTags = v8->_selectedTags;
    v8->_selectedTags = (NSMutableOrderedSet *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD928]), "initWithSearchResultsController:", 0);
    searchController = v8->_searchController;
    v8->_searchController = (UISearchController *)v13;

    -[UISearchController setSearchResultsUpdater:](v8->_searchController, "setSearchResultsUpdater:", v8);
    -[UISearchController setObscuresBackgroundDuringPresentation:](v8->_searchController, "setObscuresBackgroundDuringPresentation:", 0);
    -[UISearchController setHidesNavigationBarDuringPresentation:](v8->_searchController, "setHidesNavigationBarDuringPresentation:", 0);
    -[WFTagPickerViewController setTitle:](v8, "setTitle:", v6);
    v15 = v8;
  }

  return v8;
}

- (void)viewDidLoad
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
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)WFTagPickerViewController;
  -[WFTagPickerViewController viewDidLoad](&v16, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancel);
  -[WFTagPickerViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLeftBarButtonItem:", v3);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_dismiss);
  -[WFTagPickerViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRightBarButtonItem:", v5);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTagPickerViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);
  -[WFTagPickerViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v7);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
  -[WFTagPickerViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTableFooterView:", v10);

  -[WFTagPickerViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("TagCell"));

  -[WFTagPickerViewController searchController](self, "searchController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "searchBar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTagPickerViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTableHeaderView:", v14);

  -[WFTagPickerViewController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
}

- (CGSize)preferredContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[WFTagPickerViewController tableView](self, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentSize");
  v4 = v3;

  v5 = 320.0;
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)cancel
{
  id v3;

  -[WFTagPickerViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tagPickerDidCancel:", self);

}

- (void)dismiss
{
  void *v3;
  void *v4;
  id v5;

  -[WFTagPickerViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WFTagPickerViewController selectedTags](self, "selectedTags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tagPicker:didSelectTags:", self, v4);

}

- (id)currentResults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  -[WFTagPickerViewController searchController](self, "searchController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isActive") & 1) != 0)
  {
    -[WFTagPickerViewController searchController](self, "searchController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      -[WFTagPickerViewController searchController](self, "searchController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "searchBar");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "text");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lowercaseString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFTagPickerViewController tags](self, "tags");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __43__WFTagPickerViewController_currentResults__block_invoke;
      v16[3] = &unk_24EE24D90;
      v17 = v11;
      v13 = v11;
      objc_msgSend(v12, "if_compactMap:", v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      return v14;
    }
  }
  else
  {

  }
  -[WFTagPickerViewController tags](self, "tags");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[WFTagPickerViewController currentResults](self, "currentResults", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
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
  uint64_t v14;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("TagCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTagPickerViewController currentResults](self, "currentResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v12);

  -[WFTagPickerViewController selectedTags](self, "selectedTags");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "containsObject:", v10))
    v14 = 3;
  else
    v14 = 0;
  objc_msgSend(v7, "setAccessoryType:", v14);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[WFTagPickerViewController currentResults](self, "currentResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFTagPickerViewController selectedTags](self, "selectedTags");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v9);

  -[WFTagPickerViewController selectedTags](self, "selectedTags");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
    objc_msgSend(v12, "removeObject:", v9);
  else
    objc_msgSend(v12, "addObject:", v9);

  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);
  v15[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadRowsAtIndexPaths:withRowAnimation:", v14, 100);

}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v3;

  -[WFTagPickerViewController tableView](self, "tableView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (WFTagPickerViewControllerDelegate)delegate
{
  return (WFTagPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)tags
{
  return self->_tags;
}

- (NSMutableOrderedSet)selectedTags
{
  return self->_selectedTags;
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_selectedTags, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

id __43__WFTagPickerViewController_currentResults__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsString:", *(_QWORD *)(a1 + 32)))
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

@end
