@implementation WFAppSearchViewController

- (WFAppSearchViewController)init
{
  return -[WFAppSearchViewController initWithAppSearchType:](self, "initWithAppSearchType:", 0);
}

- (WFAppSearchViewController)initWithAppSearchType:(int64_t)a3
{
  return -[WFAppSearchViewController initWithAppSearchType:allowMultipleSelection:selectedApps:](self, "initWithAppSearchType:allowMultipleSelection:selectedApps:", a3, 0, 0);
}

- (WFAppSearchViewController)initWithAppSearchType:(int64_t)a3 allowMultipleSelection:(BOOL)a4 selectedApps:(id)a5
{
  return -[WFAppSearchViewController initWithAppSearchType:omittedAppBundleIDs:allowMultipleSelection:selectedApps:](self, "initWithAppSearchType:omittedAppBundleIDs:allowMultipleSelection:selectedApps:", a3, 0, a4, a5);
}

- (WFAppSearchViewController)initWithAppSearchType:(int64_t)a3 omittedAppBundleIDs:(id)a4 allowMultipleSelection:(BOOL)a5 selectedApps:(id)a6
{
  id v10;
  id v11;
  WFAppSearchViewController *v12;
  WFAppSearchViewController *v13;
  uint64_t v14;
  NSArray *omittedAppBundleIDs;
  void *v16;
  void *v17;
  uint64_t v18;
  NSMutableDictionary *cachedAppIconForBundleId;
  void *v20;
  WFAppSearchViewController *v21;
  objc_super v23;

  v10 = a4;
  v11 = a6;
  v23.receiver = self;
  v23.super_class = (Class)WFAppSearchViewController;
  v12 = -[WFAppSearchViewController initWithNibName:bundle:](&v23, sel_initWithNibName_bundle_, 0, 0);
  v13 = v12;
  if (v12)
  {
    v12->_appSearchType = a3;
    v14 = objc_msgSend(v10, "copy");
    omittedAppBundleIDs = v13->_omittedAppBundleIDs;
    v13->_omittedAppBundleIDs = (NSArray *)v14;

    v13->_allowMultipleSelection = a5;
    if (v11)
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEE0]), "initWithOrderedSet:", v11);
    else
      v16 = (void *)objc_opt_new();
    v17 = v16;
    objc_storeStrong((id *)&v13->_selectedApps, v16);

    v18 = objc_opt_new();
    cachedAppIconForBundleId = v13->_cachedAppIconForBundleId;
    v13->_cachedAppIconForBundleId = (NSMutableDictionary *)v18;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v13, sel_adjustInsetsForKeyboard, *MEMORY[0x24BEC2F58], 0);

    v21 = v13;
  }

  return v13;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEC2F58], 0);

  v4.receiver = self;
  v4.super_class = (Class)WFAppSearchViewController;
  -[WFAppSearchViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_super v41;
  _QWORD v42[6];

  v42[4] = *MEMORY[0x24BDAC8D0];
  v41.receiver = self;
  v41.super_class = (Class)WFAppSearchViewController;
  -[WFAppSearchViewController loadView](&v41, sel_loadView);
  WFLocalizedString(CFSTR("Choose App"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAppSearchViewController setTitle:](self, "setTitle:", v3);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancel);
  -[WFAppSearchViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLeftBarButtonItem:", v4);

  if (-[WFAppSearchViewController allowMultipleSelection](self, "allowMultipleSelection"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_done);
    -[WFAppSearchViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRightBarButtonItem:", v6);

  }
  v8 = objc_alloc(MEMORY[0x24BEBD9F0]);
  v9 = *MEMORY[0x24BDBF090];
  v10 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v11 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v12 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v13 = (void *)objc_msgSend(v8, "initWithFrame:style:", 0, *MEMORY[0x24BDBF090], v10, v11, v12);
  objc_msgSend(v13, "setAllowsMultipleSelection:", -[WFAppSearchViewController allowMultipleSelection](self, "allowMultipleSelection"));
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v13, "setDataSource:", self);
  objc_msgSend(v13, "setDelegate:", self);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", v9, v10, v11, v12);
  objc_msgSend(v13, "setTableFooterView:", v14);

  objc_msgSend(v13, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("Cell"));
  -[WFAppSearchViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", v13);

  -[WFAppSearchViewController setTableView:](self, "setTableView:", v13);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD928]), "initWithSearchResultsController:", 0);
  objc_msgSend(v16, "setObscuresBackgroundDuringPresentation:", 0);
  objc_msgSend(v16, "searchBar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAutocorrectionType:", 1);

  objc_msgSend(v16, "setHidesNavigationBarDuringPresentation:", 0);
  WFLocalizedString(CFSTR("Search Apps"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "searchBar");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPlaceholder:", v18);

  objc_msgSend(v16, "searchBar");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDelegate:", self);

  -[WFAppSearchViewController navigationItem](self, "navigationItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setSearchController:", v16);

  -[WFAppSearchViewController navigationItem](self, "navigationItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setHidesSearchBarWhenScrolling:", 0);

  v33 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v13, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAppSearchViewController view](self, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v37;
  objc_msgSend(v13, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAppSearchViewController view](self, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v34);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v32;
  objc_msgSend(v13, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAppSearchViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v25;
  objc_msgSend(v13, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAppSearchViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v29;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "activateConstraints:", v30);

}

- (void)cancel
{
  void *v3;
  void *v4;
  id v5;

  -[WFAppSearchViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActive:", 0);

  -[WFAppSearchViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appSearchViewControllerDidCancel:", self);

}

- (void)done
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[WFAppSearchViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActive:", 0);

  -[WFAppSearchViewController delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[WFAppSearchViewController selectedApps](self, "selectedApps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appSearchViewController:didFinishWithApps:", self, v6);

}

- (void)adjustInsetsForKeyboard
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v20;
  void *v21;
  double MaxY;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  id v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  objc_msgSend(MEMORY[0x24BEC2EF8], "sharedKeyboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isVisible");

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEC2EF8], "sharedKeyboard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppSearchViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyboardFrameInView:", v6);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    -[WFAppSearchViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v33.origin.x = v8;
    v33.origin.y = v10;
    v33.size.width = v12;
    v33.size.height = v14;
    v29 = CGRectIntersection(v28, v33);
    x = v29.origin.x;
    y = v29.origin.y;
    width = v29.size.width;
    height = v29.size.height;

    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    v20 = 0.0;
    if (!CGRectIsNull(v30))
    {
      -[WFAppSearchViewController view](self, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "bounds");
      MaxY = CGRectGetMaxY(v31);
      v32.origin.x = x;
      v32.origin.y = y;
      v32.size.width = width;
      v32.size.height = height;
      v20 = MaxY - CGRectGetMinY(v32);

    }
    -[WFAppSearchViewController tableView](self, "tableView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setContentInset:", 0.0, 0.0, v20, 0.0);

    -[WFAppSearchViewController tableView](self, "tableView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v24;
    v25 = v20;
  }
  else
  {
    -[WFAppSearchViewController tableView](self, "tableView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setContentInset:", 0.0, 0.0, 0.0, 0.0);

    -[WFAppSearchViewController tableView](self, "tableView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v24;
    v25 = 0.0;
  }
  objc_msgSend(v24, "setScrollIndicatorInsets:", 0.0, 0.0, v25, 0.0);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFAppSearchViewController;
  -[WFAppSearchViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[WFAppSearchViewController adjustInsetsForKeyboard](self, "adjustInsetsForKeyboard");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFAppSearchViewController;
  -[WFAppSearchViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[WFAppSearchViewController updateDoneButtonEnabledState](self, "updateDoneButtonEnabledState");
  -[WFAppSearchViewController apps](self, "apps");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
    -[WFAppSearchViewController loadApps](self, "loadApps");
}

- (void)loadApps
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__WFAppSearchViewController_loadApps__block_invoke;
  block[3] = &unk_24E604D88;
  block[4] = self;
  dispatch_async(v3, block);

}

- (id)filteredApps
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;

  -[WFAppSearchViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");
  -[WFAppSearchViewController apps](self, "apps");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __41__WFAppSearchViewController_filteredApps__block_invoke;
    v11[3] = &unk_24E603720;
    v12 = v6;
    objc_msgSend(v8, "if_objectsPassingTest:", v11);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }

  return v8;
}

- (id)applicationIconImageForBundleIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v4 = (void *)MEMORY[0x24BEC39F0];
  v5 = a3;
  objc_msgSend(v4, "sharedRegistry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appWithIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "icon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UIImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v9;
  }
  else
  {
    -[WFAppSearchViewController placeholderImage](self, "placeholderImage");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (UIImage)placeholderImage
{
  UIImage *placeholderImage;
  void *v4;
  UIImage *v5;
  UIImage *v6;
  CGSize v8;
  CGRect v9;

  placeholderImage = self->_placeholderImage;
  if (!placeholderImage)
  {
    v8.width = 29.0;
    v8.height = 29.0;
    UIGraphicsBeginImageContextWithOptions(v8, 1, 0.0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFill");

    v9.origin.x = 0.0;
    v9.origin.y = 0.0;
    v9.size.width = 29.0;
    v9.size.height = 29.0;
    UIRectFill(v9);
    UIGraphicsGetImageFromCurrentImageContext();
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v6 = self->_placeholderImage;
    self->_placeholderImage = v5;

    UIGraphicsEndImageContext();
    placeholderImage = self->_placeholderImage;
  }
  return placeholderImage;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[WFAppSearchViewController filteredApps](self, "filteredApps", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;

  v6 = a3;
  v7 = a4;
  -[WFAppSearchViewController filteredApps](self, "filteredApps");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("Cell"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  if (-[WFAppSearchViewController allowMultipleSelection](self, "allowMultipleSelection")
    && (-[WFAppSearchViewController selectedApps](self, "selectedApps"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "containsObject:", v9),
        v13,
        (v14 & 1) != 0))
  {
    v15 = 3;
  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(v10, "setAccessoryType:", v15);
  -[WFAppSearchViewController placeholderImage](self, "placeholderImage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setImage:", v16);

  objc_msgSend(v9, "bundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[WFAppSearchViewController cachedAppIconForBundleId](self, "cachedAppIconForBundleId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v10, "imageView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setImage:", v21);

    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v23 = objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __61__WFAppSearchViewController_tableView_cellForRowAtIndexPath___block_invoke;
      v25[3] = &unk_24E604480;
      v25[4] = self;
      v26 = v9;
      v27 = v6;
      v28 = v7;
      dispatch_async(v23, v25);

    }
  }

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  -[WFAppSearchViewController filteredApps](self, "filteredApps");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "row");
  if (v8 < objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[WFAppSearchViewController allowMultipleSelection](self, "allowMultipleSelection"))
    {
      objc_msgSend(v17, "cellForRowAtIndexPath:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "accessoryType"))
      {
        objc_msgSend(v10, "setAccessoryType:", 0);
        -[WFAppSearchViewController selectedApps](self, "selectedApps");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeObject:", v9);
      }
      else
      {
        objc_msgSend(v10, "setAccessoryType:", 3);
        -[WFAppSearchViewController selectedApps](self, "selectedApps");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v9);
      }

      objc_msgSend(v17, "deselectRowAtIndexPath:animated:", v6, 1);
      -[WFAppSearchViewController updateDoneButtonEnabledState](self, "updateDoneButtonEnabledState");
    }
    else
    {
      -[WFAppSearchViewController navigationItem](self, "navigationItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "searchController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isActive");

      if (v14)
      {
        -[WFAppSearchViewController navigationItem](self, "navigationItem");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "searchController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setActive:", 0);

      }
      objc_msgSend(v17, "deselectRowAtIndexPath:animated:", v6, 1);
      -[WFAppSearchViewController delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appSearchViewController:didFinishWithApp:", self, v9);
    }

  }
}

- (void)updateDoneButtonEnabledState
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  id v8;

  -[WFAppSearchViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFAppSearchViewController selectedApps](self, "selectedApps");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v8, "count") != 0;
    -[WFAppSearchViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rightBarButtonItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnabled:", v5);

  }
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CGRect v16;
  CGRect v17;

  -[WFAppSearchViewController filteredApps](self, "filteredApps", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x24BEBDB00]);
    -[WFAppSearchViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v7 = (void *)objc_msgSend(v8, "initWithFrame:", 0.0, 0.0, CGRectGetWidth(v16), 0.0);

    v10 = objc_alloc(MEMORY[0x24BEBD708]);
    -[WFAppSearchViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v12 = (void *)objc_msgSend(v10, "initWithFrame:", 15.0, 0.0, CGRectGetWidth(v17) + -30.0, 0.0);

    objc_msgSend(v12, "setAutoresizingMask:", 21);
    WFLocalizedString(CFSTR("No results."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v13);

    objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextColor:", v14);

    objc_msgSend(v7, "addSubview:", v12);
  }
  return v7;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  void *v4;
  double v5;

  -[WFAppSearchViewController filteredApps](self, "filteredApps", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    v5 = 0.0;
  else
    v5 = 44.0;

  return v5;
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v4;

  -[WFAppSearchViewController tableView](self, "tableView", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v3;

  -[WFAppSearchViewController tableView](self, "tableView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (void)searchBarSearchButtonClicked:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
}

- (WFAppSearchViewControllerDelegate)delegate
{
  return (WFAppSearchViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UITableView)tableView
{
  return (UITableView *)objc_loadWeakRetained((id *)&self->_tableView);
}

- (void)setTableView:(id)a3
{
  objc_storeWeak((id *)&self->_tableView, a3);
}

- (int64_t)appSearchType
{
  return self->_appSearchType;
}

- (NSArray)omittedAppBundleIDs
{
  return self->_omittedAppBundleIDs;
}

- (BOOL)allowMultipleSelection
{
  return self->_allowMultipleSelection;
}

- (NSArray)apps
{
  return self->_apps;
}

- (void)setApps:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1008);
}

- (NSMutableOrderedSet)selectedApps
{
  return self->_selectedApps;
}

- (void)setSelectedApps:(id)a3
{
  objc_storeStrong((id *)&self->_selectedApps, a3);
}

- (NSMutableDictionary)cachedAppIconForBundleId
{
  return self->_cachedAppIconForBundleId;
}

- (void)setCachedAppIconForBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAppIconForBundleId, a3);
}

- (void)setPlaceholderImage:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_cachedAppIconForBundleId, 0);
  objc_storeStrong((id *)&self->_selectedApps, 0);
  objc_storeStrong((id *)&self->_apps, 0);
  objc_storeStrong((id *)&self->_omittedAppBundleIDs, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_destroyWeak((id *)&self->_delegate);
}

void __61__WFAppSearchViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationIconImageForBundleIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__WFAppSearchViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
  block[3] = &unk_24E603748;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v10 = v4;
  v5 = *(void **)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __61__WFAppSearchViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "cellForRowAtIndexPath:", *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v7, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v2);

  objc_msgSend(v7, "setNeedsLayout");
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "cachedAppIconForBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

}

uint64_t __41__WFAppSearchViewController_filteredApps__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsString:", v5);

  return v6;
}

void __37__WFAppSearchViewController_loadApps__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD block[5];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v18 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  WFInstalledAppsEnumerator();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v22;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x2207E14F4]();
        if (objc_msgSend(v7, "wf_isAvailableInContext:", 0))
        {
          objc_msgSend(*(id *)(a1 + 32), "omittedAppBundleIDs");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "bundleIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "containsObject:", v10);

          if ((v11 & 1) == 0)
          {
            if (objc_msgSend(*(id *)(a1 + 32), "appSearchType") != 1)
              goto LABEL_12;
            objc_msgSend(v7, "claimRecords");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "allObjects");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "if_flatMap:", &__block_literal_global_4052);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v14, "count") && (objc_msgSend(v14, "isEqualToArray:", &unk_24E6318B0) & 1) == 0)
            {

LABEL_12:
              objc_msgSend(v7, "compatibilityObject");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v14);
            }

          }
        }
        objc_autoreleasePoolPop(v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v4);
  }

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", CFSTR("localizedName"), 1, sel_localizedStandardCompare_);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sortUsingDescriptors:", v16);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__WFAppSearchViewController_loadApps__block_invoke_3;
  block[3] = &unk_24E604E80;
  block[4] = *(_QWORD *)(a1 + 32);
  v20 = v18;
  v17 = v18;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __37__WFAppSearchViewController_loadApps__block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setApps:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

uint64_t __37__WFAppSearchViewController_loadApps__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "typeIdentifiers");
}

@end
