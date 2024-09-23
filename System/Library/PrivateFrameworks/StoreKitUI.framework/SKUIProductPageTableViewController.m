@implementation SKUIProductPageTableViewController

- (SKUIProductPageTableViewController)initWithInAppPurchases:(id)a3 clientContext:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SKUIProductPageTableViewController *v16;
  SKUIProductPageTableViewController *v17;
  id *p_clientContext;
  void *v19;
  SKUIProductPageTableInAppPurchasesSection *v20;
  void *v21;
  objc_super v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIProductPageTableViewController initWithInAppPurchases:clientContext:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)SKUIProductPageTableViewController;
  v16 = -[SKUIProductPageTableViewController init](&v23, sel_init);
  v17 = v16;
  if (v16)
  {
    p_clientContext = (id *)&v16->_clientContext;
    objc_storeStrong((id *)&v16->_clientContext, a4);
    if (*p_clientContext)
      objc_msgSend(*p_clientContext, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_IN_APPS_TITLE"), CFSTR("ProductPage"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_IN_APPS_TITLE"), 0, CFSTR("ProductPage"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIProductPageTableViewController setTitle:](v17, "setTitle:", v19);

    v20 = -[SKUIProductPageTableInAppPurchasesSection initWithInAppPurchases:clientContext:]([SKUIProductPageTableInAppPurchasesSection alloc], "initWithInAppPurchases:clientContext:", v6, v7);
    -[SKUIProductPageTableInAppPurchasesSection setExpanded:](v20, "setExpanded:", 1);
    -[SKUITableViewSection setHidesHeaderView:](v20, "setHidesHeaderView:", 1);
    v24[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIProductPageTableViewController setSections:](v17, "setSections:", v21);

  }
  return v17;
}

- (SKUIProductPageTableViewController)initWithReleaseNotes:(id)a3 clientContext:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SKUIProductPageTableViewController *v16;
  SKUIProductPageTableUpdateHistorySection *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  SKUILayoutCache *v29;
  SKUILayoutCache *textLayoutCache;
  void *v31;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  SKUIProductPageTableUpdateHistorySection *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIProductPageTableViewController initWithReleaseNotes:clientContext:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v39.receiver = self;
  v39.super_class = (Class)SKUIProductPageTableViewController;
  v16 = -[SKUIProductPageTableViewController init](&v39, sel_init);
  if (v16)
  {
    if (objc_msgSend(v6, "count"))
    {
      objc_storeStrong((id *)&v16->_clientContext, a4);
      if (v16->_clientContext)
        -[SKUIClientContext localizedStringForKey:inTable:](v16->_clientContext, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_UPDATE_HISTORY_TITLE"), CFSTR("ProductPage"));
      else
        +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_UPDATE_HISTORY_TITLE"), 0, CFSTR("ProductPage"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIProductPageTableViewController setTitle:](v16, "setTitle:", v18, v7);

      v17 = -[SKUIProductPageTableUpdateHistorySection initWithClientContext:]([SKUIProductPageTableUpdateHistorySection alloc], "initWithClientContext:", v16->_clientContext);
      -[SKUIProductPageTableUpdateHistorySection setExpanded:](v17, "setExpanded:", 1);
      -[SKUITableViewSection setHidesHeaderView:](v17, "setHidesHeaderView:", 1);
      -[SKUIProductPageTableUpdateHistorySection setReleaseNotes:](v17, "setReleaseNotes:", v6);
      v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v34 = v6;
      v20 = v6;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v36 != v23)
              objc_enumerationMutation(v20);
            objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "changeNotes");
            v25 = objc_claimAutoreleasedReturnValue();
            v26 = (void *)v25;
            if (v25)
              v27 = (const __CFString *)v25;
            else
              v27 = &stru_1E73A9FB0;
            -[SKUIProductPageTableViewController _textLayoutRequestWithText:](v16, "_textLayoutRequestWithText:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v28);

          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
        }
        while (v22);
      }

      v29 = objc_alloc_init(SKUILayoutCache);
      textLayoutCache = v16->_textLayoutCache;
      v16->_textLayoutCache = v29;

      -[SKUILayoutCache populateCacheWithLayoutRequests:](v16->_textLayoutCache, "populateCacheWithLayoutRequests:", v19);
      -[SKUIProductPageTableUpdateHistorySection setTextLayoutCache:](v17, "setTextLayoutCache:", v16->_textLayoutCache);
      -[SKUIProductPageTableViewController setTextLayoutCache:](v16, "setTextLayoutCache:", v16->_textLayoutCache);
      v40 = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIProductPageTableViewController setSections:](v16, "setSections:", v31);

      v7 = v33;
      v6 = v34;
    }
    else
    {
      v17 = (SKUIProductPageTableUpdateHistorySection *)v16;
      v16 = 0;
    }

  }
  return v16;
}

- (SKUIProductPageTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SKUIProductPageTableViewController *v16;
  uint64_t v17;
  UIColor *color;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIProductPageTableViewController initWithNibName:bundle:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUIProductPageTableViewController;
  v16 = -[SKUIProductPageTableViewController initWithNibName:bundle:](&v20, sel_initWithNibName_bundle_, v6, v7);
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.97254902, 1.0);
    v17 = objc_claimAutoreleasedReturnValue();
    color = v16->_color;
    v16->_color = (UIColor *)v17;

  }
  return v16;
}

- (void)dealloc
{
  objc_super v3;

  -[SKUIProductPageTableView setDataSource:](self->_tableView, "setDataSource:", 0);
  -[SKUIProductPageTableView setDelegate:](self->_tableView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SKUIProductPageTableViewController;
  -[SKUIProductPageTableViewController dealloc](&v3, sel_dealloc);
}

- (void)scrollToView:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v4 = a4;
  v13 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "topContentOffset");
    v9 = v8;
    v11 = v10;

    objc_msgSend(v13, "bounds");
    objc_msgSend(v13, "convertPoint:toView:", self->_tableView);
    -[SKUIProductPageTableView setContentOffset:animated:](self->_tableView, "setContentOffset:animated:", v4, v9, v11 + v12);
  }

}

- (void)setColorScheme:(id)a3
{
  SKUIColorScheme *v5;
  SKUIColorScheme **p_colorScheme;
  void *v7;
  void *v8;
  SKUIProductPageTableView *tableView;
  void *v10;
  void *v11;
  SKUIColorScheme *v12;

  v5 = (SKUIColorScheme *)a3;
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    v12 = v5;
    objc_storeStrong((id *)&self->_colorScheme, a3);
    -[SKUIColorScheme backgroundColor](*p_colorScheme, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.97254902, 1.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&self->_color, v8);
    if (!v7)

    tableView = self->_tableView;
    -[SKUIColorScheme backgroundColor](*p_colorScheme, "backgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[SKUIProductPageTableView setBackgroundColor:](tableView, "setBackgroundColor:", v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.97254902, 1.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIProductPageTableView setBackgroundColor:](tableView, "setBackgroundColor:", v11);

    }
    v5 = v12;
  }

}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    v5 = obj;
    if (self->_tableView)
    {
      v6 = objc_loadWeakRetained((id *)&self->_delegate);
      v7 = objc_loadWeakRetained((id *)&self->_delegateSender);
      objc_msgSend(v6, "productPageChildViewControllerDidLoadScrollView:", v7);

      v5 = obj;
    }
  }

}

- (void)setHeaderViewController:(id)a3
{
  SKUIProductPageHeaderViewController **p_headerViewController;
  void *v6;
  SKUIProductPageHeaderViewController *v7;

  p_headerViewController = &self->_headerViewController;
  v7 = (SKUIProductPageHeaderViewController *)a3;
  if (*p_headerViewController != v7)
  {
    -[SKUIProductPageTableView setProductPageHeaderView:](self->_tableView, "setProductPageHeaderView:", 0);
    -[SKUIProductPageHeaderViewController view](*p_headerViewController, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[SKUIProductPageHeaderViewController removeFromParentViewController](*p_headerViewController, "removeFromParentViewController");
    objc_storeStrong((id *)&self->_headerViewController, a3);
    if (*p_headerViewController)
    {
      -[SKUIProductPageTableViewController addChildViewController:](self, "addChildViewController:");
      if (self->_tableView)
        -[SKUIProductPageTableViewController _addHeaderView](self, "_addHeaderView");
    }
  }

}

- (void)setSections:(id)a3
{
  NSArray *v4;
  NSArray *sections;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_sections != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    sections = self->_sections;
    self->_sections = v4;

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_sections;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setClientContext:", self->_clientContext, (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)loadView
{
  id v3;

  -[SKUIProductPageTableViewController _tableView](self, "_tableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIProductPageTableViewController setView:](self, "setView:", v3);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[SKUIProductPageTableView indexPathForSelectedRow](self->_tableView, "indexPathForSelectedRow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[SKUIProductPageTableView deselectRowAtIndexPath:animated:](self->_tableView, "deselectRowAtIndexPath:animated:", v5, v3);
  v6.receiver = self;
  v6.super_class = (Class)SKUIProductPageTableViewController;
  -[SKUIProductPageTableViewController viewWillAppear:](&v6, sel_viewWillAppear_, v3);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_loadWeakRetained((id *)&self->_delegateSender);
  objc_msgSend(WeakRetained, "productPageChildViewControllerDidScroll:", v4);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_sections, "count", a3);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  NSArray *sections;
  id v6;
  id v7;
  void *v8;
  void *v9;

  sections = self->_sections;
  v6 = a4;
  v7 = a3;
  -[NSArray objectAtIndex:](sections, "objectAtIndex:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tableViewCellForTableView:indexPath:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[NSArray objectAtIndex:](self->_sections, "objectAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfRowsInSection");

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SKUIProductPageChildViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  SKUIProductPageChildViewControllerDelegate **v20;
  id v21;
  char v22;
  SKUIProductPageChildViewControllerDelegate **v23;
  id v24;
  char v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NSArray objectAtIndex:](self->_sections, "objectAtIndex:", objc_msgSend(v7, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectionActionForTableView:indexPath:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    switch(objc_msgSend(v9, "actionType"))
    {
      case 0:
        v26[0] = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "reloadRowsAtIndexPaths:withRowAnimation:", v19, 100);

        break;
      case 1:
      case 2:
        objc_msgSend(v10, "URL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
          goto LABEL_16;
        p_delegate = &self->_delegate;
        WeakRetained = objc_loadWeakRetained((id *)p_delegate);
        v14 = objc_opt_respondsToSelector();

        if ((v14 & 1) == 0)
          goto LABEL_16;
        v15 = objc_loadWeakRetained((id *)p_delegate);
        objc_msgSend(v10, "viewControllerBlock");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v15;
        v18 = v11;
        goto LABEL_14;
      case 3:
        -[SKUIProductPageTableViewController navigationController](self, "navigationController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v10, "viewController");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "pushViewController:animated:", v15, 1);
        }
        else
        {
          v23 = &self->_delegate;
          v24 = objc_loadWeakRetained((id *)v23);
          v25 = objc_opt_respondsToSelector();

          if ((v25 & 1) == 0)
            goto LABEL_16;
          v15 = objc_loadWeakRetained((id *)v23);
          objc_msgSend(v10, "viewControllerBlock");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v15;
          v18 = 0;
LABEL_14:
          objc_msgSend(v17, "productPageChildOpenURL:viewControllerBlock:", v18, v16);

        }
LABEL_15:

LABEL_16:
        objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);

        break;
      case 4:
        objc_msgSend(v10, "item");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
          goto LABEL_16;
        v20 = &self->_delegate;
        v21 = objc_loadWeakRetained((id *)v20);
        v22 = objc_opt_respondsToSelector();

        if ((v22 & 1) == 0)
          goto LABEL_16;
        v15 = objc_loadWeakRetained((id *)v20);
        objc_msgSend(v15, "productPageChildOpenItem:", v11);
        goto LABEL_15;
      default:
        break;
    }
  }

}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  NSArray *sections;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  sections = self->_sections;
  v6 = a3;
  -[NSArray objectAtIndex:](sections, "objectAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "footerViewForTableView:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "frame");
    v10 = v9;
  }
  else
  {
    v10 = 0.0;
  }

  return v10;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  NSArray *sections;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  sections = self->_sections;
  v6 = a3;
  -[NSArray objectAtIndex:](sections, "objectAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "headerViewForTableView:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "frame");
    v10 = v9;
  }
  else
  {
    v10 = 0.0;
  }

  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  NSArray *sections;
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;

  sections = self->_sections;
  v6 = a4;
  v7 = a3;
  -[NSArray objectAtIndex:](sections, "objectAtIndex:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "heightForCellInTableView:indexPath:", v7, v6);
  v10 = v9;

  return v10;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  NSArray *sections;
  id v7;
  void *v8;
  void *v9;

  sections = self->_sections;
  v7 = a3;
  -[NSArray objectAtIndex:](sections, "objectAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "footerViewForTableView:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v9, "setBackgroundColor:", self->_color);

  return v9;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  NSArray *sections;
  id v7;
  void *v8;
  void *v9;

  sections = self->_sections;
  v7 = a3;
  -[NSArray objectAtIndex:](sections, "objectAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "headerViewForTableView:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v9, "setBackgroundColor:", self->_color);

  return v9;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  objc_msgSend(a4, "setBackgroundColor:", self->_color);
}

- (void)_addHeaderView
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  -[SKUIProductPageHeaderViewController view](self->_headerViewController, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAutoresizingMask:", 2);
  objc_msgSend(v8, "frame");
  v4 = v3;
  -[SKUIProductPageTableView bounds](self->_tableView, "bounds");
  objc_msgSend(v8, "setFrame:", 0.0, v4);
  -[SKUIProductPageTableView _addContentSubview:atBack:](self->_tableView, "_addContentSubview:atBack:", v8, 0);
  -[SKUIProductPageHeaderViewController floatingView](self->_headerViewController, "floatingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAutoresizingMask:", 2);
  objc_msgSend(v5, "frame");
  v7 = v6;
  -[SKUIProductPageTableView bounds](self->_tableView, "bounds");
  objc_msgSend(v5, "setFrame:", 0.0, v7);
  -[SKUIProductPageTableView setProductPageHeaderView:](self->_tableView, "setProductPageHeaderView:", v5);

}

- (id)_tableView
{
  SKUIProductPageTableView *tableView;
  SKUIProductPageTableView *v4;
  SKUIProductPageTableView *v5;
  SKUIProductPageTableView *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  id v10;

  tableView = self->_tableView;
  if (!tableView)
  {
    v4 = objc_alloc_init(SKUIProductPageTableView);
    v5 = self->_tableView;
    self->_tableView = v4;

    v6 = self->_tableView;
    -[SKUIColorScheme backgroundColor](self->_colorScheme, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[SKUIProductPageTableView setBackgroundColor:](v6, "setBackgroundColor:", v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.97254902, 1.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIProductPageTableView setBackgroundColor:](v6, "setBackgroundColor:", v8);

    }
    -[SKUIProductPageTableView setDataSource:](self->_tableView, "setDataSource:", self);
    -[SKUIProductPageTableView setDelegate:](self->_tableView, "setDelegate:", self);
    -[SKUIProductPageTableView _setHeaderAndFooterViewsFloat:](self->_tableView, "_setHeaderAndFooterViewsFloat:", 0);
    -[SKUIProductPageTableView setSeparatorStyle:](self->_tableView, "setSeparatorStyle:", 0);
    if (self->_headerViewController)
      -[SKUIProductPageTableViewController _addHeaderView](self, "_addHeaderView");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = objc_loadWeakRetained((id *)&self->_delegateSender);
    objc_msgSend(WeakRetained, "productPageChildViewControllerDidLoadScrollView:", v10);

    tableView = self->_tableView;
  }
  return tableView;
}

- (id)_textLayoutRequestWithText:(id)a3
{
  id v4;
  SKUITextLayoutRequest *v5;
  double v6;

  v4 = a3;
  v5 = objc_alloc_init(SKUITextLayoutRequest);
  -[SKUITextLayoutRequest setNumberOfLines:](v5, "setNumberOfLines:", 5);
  -[SKUITextLayoutRequest setText:](v5, "setText:", v4);

  +[SKUIProductPageDetailsViewController defaultPageWidthForUserInterfaceIdiom:](SKUIProductPageDetailsViewController, "defaultPageWidthForUserInterfaceIdiom:", SKUIUserInterfaceIdiom(self->_clientContext));
  -[SKUITextLayoutRequest setWidth:](v5, "setWidth:", v6 + -30.0);
  return v5;
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (SKUIProductPageChildViewController)delegateSender
{
  return (SKUIProductPageChildViewController *)objc_loadWeakRetained((id *)&self->_delegateSender);
}

- (void)setDelegateSender:(id)a3
{
  objc_storeWeak((id *)&self->_delegateSender, a3);
}

- (SKUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (SKUIProductPageChildViewControllerDelegate)delegate
{
  return (SKUIProductPageChildViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (SKUIProductPageHeaderViewController)headerViewController
{
  return self->_headerViewController;
}

- (NSArray)sections
{
  return self->_sections;
}

- (SKUILayoutCache)textLayoutCache
{
  return self->_textLayoutCache;
}

- (void)setTextLayoutCache:(id)a3
{
  objc_storeStrong((id *)&self->_textLayoutCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLayoutCache, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_headerViewController, 0);
  objc_storeStrong((id *)&self->_evenColor, 0);
  objc_destroyWeak((id *)&self->_delegateSender);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithInAppPurchases:(uint64_t)a3 clientContext:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithReleaseNotes:(uint64_t)a3 clientContext:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithNibName:(uint64_t)a3 bundle:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
