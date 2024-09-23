@implementation PUSceneDebugInspectorViewController

- (id)sceneTaxonomy
{
  PUSceneDebugInspectorViewController *v2;
  PFSceneTaxonomy *v3;
  PFSceneTaxonomy *sceneTaxonomy;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_sceneTaxonomy)
  {
    v3 = (PFSceneTaxonomy *)objc_alloc_init(MEMORY[0x1E0D75250]);
    sceneTaxonomy = v2->_sceneTaxonomy;
    v2->_sceneTaxonomy = v3;

  }
  objc_sync_exit(v2);

  return v2->_sceneTaxonomy;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _QWORD block[5];
  id v23;
  id location;
  objc_super v25;
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)PUSceneDebugInspectorViewController;
  -[PUSceneDebugInspectorViewController viewDidLoad](&v25, sel_viewDidLoad);
  -[PUSceneDebugInspectorViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", CFSTR("Scene Inspector"));

  -[PUSceneDebugInspectorViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSceneDebugInspectorViewController loadingContentView](self, "loadingContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  -[PUSceneDebugInspectorViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  +[PUSceneDebugInspectorCell reuseIdentifier](PUSceneDebugInspectorCell, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerClass:forCellReuseIdentifier:", v7, v8);

  v9 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v10 = (void *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[PUSceneDebugInspectorViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTableFooterView:", v10);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  -[PUSceneDebugInspectorViewController shareButton](self, "shareButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v13;
  v26[1] = v12;
  -[PUSceneDebugInspectorViewController sortButton](self, "sortButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSceneDebugInspectorViewController setToolbarItems:](self, "setToolbarItems:", v15);

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_didSelectDoneButton_);
  -[PUSceneDebugInspectorViewController navigationItem](self, "navigationItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setRightBarButtonItem:", v16);

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C40]), "initWithSearchResultsController:", 0);
  objc_msgSend(v18, "setSearchResultsUpdater:", self);
  objc_msgSend(v18, "setObscuresBackgroundDuringPresentation:", 0);
  -[PUSceneDebugInspectorViewController navigationItem](self, "navigationItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setSearchController:", v18);

  -[PUSceneDebugInspectorViewController navigationItem](self, "navigationItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setHidesSearchBarWhenScrolling:", 0);

  objc_initWeak(&location, self);
  dispatch_get_global_queue(25, 0);
  v21 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PUSceneDebugInspectorViewController_viewDidLoad__block_invoke;
  block[3] = &unk_1E58AB210;
  block[4] = self;
  objc_copyWeak(&v23, &location);
  dispatch_async(v21, block);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUSceneDebugInspectorViewController;
  -[PUSceneDebugInspectorViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[PUSceneDebugInspectorViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToolbarHidden:", 0);

}

- (UIView)loadingContentView
{
  UIView *loadingContentView;
  id v4;
  void *v5;
  UIView *v6;
  UIView *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
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

  loadingContentView = self->_loadingContentView;
  if (!loadingContentView)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[PUSceneDebugInspectorViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v6 = (UIView *)objc_msgSend(v4, "initWithFrame:");
    v7 = self->_loadingContentView;
    self->_loadingContentView = v6;

    -[UIView setAutoresizingMask:](self->_loadingContentView, "setAutoresizingMask:", 18);
    -[PUSceneDebugInspectorViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", self->_loadingContentView);

    v9 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v9, "setText:", CFSTR("Loading..."));
    objc_msgSend(MEMORY[0x1E0DC3658], "darkGrayColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v10);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v11);

    objc_msgSend(v9, "setAdjustsFontForContentSizeCategory:", 1);
    -[UIView addSubview:](self->_loadingContentView, "addSubview:", v9);
    objc_msgSend(v9, "centerXAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](self->_loadingContentView, "centerXAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setActive:", 1);

    objc_msgSend(v9, "centerYAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](self->_loadingContentView, "centerYAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:", 1);

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](self->_loadingContentView, "addSubview:", v18);
    objc_msgSend(v18, "centerXAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](self->_loadingContentView, "centerXAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setActive:", 1);

    objc_msgSend(v18, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v23, 1.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setActive:", 1);

    objc_msgSend(v18, "startAnimating");
    loadingContentView = self->_loadingContentView;
  }
  return loadingContentView;
}

- (void)didSelectDoneButton:(id)a3
{
  -[PUSceneDebugInspectorViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[PUSceneDebugInspectorViewController groupedSceneViewModelTitles](self, "groupedSceneViewModelTitles", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;

  -[PUSceneDebugInspectorViewController groupedSceneViewModels](self, "groupedSceneViewModels", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSceneDebugInspectorViewController groupedSceneViewModelTitles](self, "groupedSceneViewModelTitles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  return v10;
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
  uint64_t v14;
  void *v15;

  v6 = a4;
  v7 = a3;
  +[PUSceneDebugInspectorCell reuseIdentifier](PUSceneDebugInspectorCell, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUSceneDebugInspectorViewController groupedSceneViewModelTitles](self, "groupedSceneViewModelTitles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUSceneDebugInspectorViewController groupedSceneViewModels](self, "groupedSceneViewModels");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v6, "row");

  objc_msgSend(v13, "objectAtIndexedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setViewModel:", v15);

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;

  -[PUSceneDebugInspectorViewController groupedSceneViewModelTitles](self, "groupedSceneViewModelTitles", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_opt_class();
  -[PUSceneDebugInspectorViewController groupedSceneViewModelTitles](self, "groupedSceneViewModelTitles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUSceneSettings sharedInstance](PUSceneSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_shortTitlesForSectionTitles:SortOrder:", v5, objc_msgSend(v6, "inspectorSortOrder"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];

  v5 = a4;
  -[PUSceneDebugInspectorViewController groupedSceneViewModelTitles](self, "groupedSceneViewModelTitles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUSceneDebugInspectorViewController groupedSceneViewModels](self, "groupedSceneViewModels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "row");

  objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_opt_class();
  -[PUSceneDebugInspectorViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_assetGridViewControllerForViewModel:interfaceIdiom:", v11, objc_msgSend(v13, "userInterfaceIdiom"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUSceneDebugInspectorViewController navigationController](self, "navigationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__PUSceneDebugInspectorViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  v16[3] = &unk_1E58ABD10;
  v16[4] = self;
  objc_msgSend(v15, "px_pushViewController:animated:completion:", v14, 1, v16);

}

- (void)updateSearchResultsForSearchController:(id)a3
{
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
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("keyword CONTAINS[c] %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SUBQUERY(synonyms, $synonym, $synonym CONTAINS[c] %@).@count > 0"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3528];
  v15[0] = v6;
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "orPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUSceneDebugInspectorViewController sceneViewModelsAll](self, "sceneViewModelsAll");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "filteredArrayUsingPredicate:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSceneDebugInspectorViewController setSceneViewModelsSearched:](self, "setSceneViewModelsSearched:", v12);

  -[PUSceneDebugInspectorViewController currentSceneViewModels](self, "currentSceneViewModels");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUSceneSettings sharedInstance](PUSceneSettings, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSceneDebugInspectorViewController _reloadTableViewByGroupingViewModels:sortOrder:](self, "_reloadTableViewByGroupingViewModels:sortOrder:", v13, objc_msgSend(v14, "inspectorSortOrder"));

}

- (UIBarButtonItem)sortButton
{
  UIBarButtonItem *sortButton;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIBarButtonItem *v9;
  UIBarButtonItem *v10;
  CGSize v12;

  sortButton = self->_sortButton;
  if (!sortButton)
  {
    v12.width = 22.0;
    v12.height = 22.0;
    UIGraphicsBeginImageContextWithOptions(v12, 0, 0.0);
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", 0.5, 0.5, 21.0, 21.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stroke");

    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", 6.0, 7.0, 10.0, 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fill");

    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", 7.0, 11.0, 8.0, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fill");

    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", 8.0, 15.0, 6.0, 1.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fill");

    UIGraphicsGetImageFromCurrentImageContext();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    v9 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithImage:style:target:action:", v8, 0, self, sel_didSelectSortButton_);
    v10 = self->_sortButton;
    self->_sortButton = v9;

    -[UIBarButtonItem setEnabled:](self->_sortButton, "setEnabled:", 0);
    sortButton = self->_sortButton;
  }
  return sortButton;
}

- (void)didSelectSortButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[6];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Sort Scenes"), 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "popoverPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBarButtonItem:", v4);

  for (i = 0; i != 5; ++i)
  {
    objc_msgSend((id)objc_opt_class(), "_titleForSortOrder:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __59__PUSceneDebugInspectorViewController_didSelectSortButton___block_invoke;
    v15[3] = &unk_1E58A7A80;
    v15[4] = self;
    v15[5] = i;
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v8, 0, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUSceneSettings sharedInstance](PUSceneSettings, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "inspectorSortOrder");

    if (i == v11)
      objc_msgSend(v9, "_setChecked:", 1);
    objc_msgSend(v5, "addAction:", v9);

  }
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v12);

  -[PUSceneDebugInspectorViewController presentedViewController](self, "presentedViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[PUSceneDebugInspectorViewController presentedViewController](self, "presentedViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "presentViewController:animated:completion:", v5, 1, 0);

  }
  else
  {
    -[PUSceneDebugInspectorViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
  }

}

- (void)_reloadTableViewByGroupingViewModels:(id)a3 sortOrder:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
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
  _BOOL8 v34;
  void *v35;
  void *v36;
  _BOOL8 v37;
  void *v38;
  id v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  void *v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v46;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v46 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v11);
        objc_msgSend((id)objc_opt_class(), "_sectionTitleForSceneViewModel:sortOrder:", v12, a4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          v15 = (void *)objc_opt_new();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v13);

        }
        objc_msgSend(v7, "objectForKeyedSubscript:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v9);
  }

  v17 = (void *)objc_opt_new();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(v7, "allKeys");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v42;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v42 != v20)
          objc_enumerationMutation(v39);
        v22 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v21);
        v23 = (void *)objc_opt_class();
        objc_msgSend(v7, "objectForKeyedSubscript:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "_sortedSceneViewModels:sortOrder:", v24, a4);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v25, v22);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v19);
  }

  v26 = v17;
  v27 = (void *)objc_msgSend(v17, "copy");
  -[PUSceneDebugInspectorViewController setGroupedSceneViewModels:](self, "setGroupedSceneViewModels:", v27);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), objc_msgSend((id)objc_opt_class(), "_isAscendingForSortOrder:", a4));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "allKeys");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "sortedArrayUsingDescriptors:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSceneDebugInspectorViewController setGroupedSceneViewModelTitles:](self, "setGroupedSceneViewModelTitles:", v31);

  -[PUSceneDebugInspectorViewController tableView](self, "tableView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "reloadData");

  -[PUSceneDebugInspectorViewController currentSceneViewModels](self, "currentSceneViewModels");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "count") != 0;
  -[PUSceneDebugInspectorViewController shareButton](self, "shareButton");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setEnabled:", v34);

  -[PUSceneDebugInspectorViewController currentSceneViewModels](self, "currentSceneViewModels");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "count") != 0;
  -[PUSceneDebugInspectorViewController sortButton](self, "sortButton");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setEnabled:", v37);

}

- (NSArray)currentSceneViewModels
{
  void *v3;
  void *v4;
  int v5;

  -[PUSceneDebugInspectorViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isActive");

  if (v5)
    -[PUSceneDebugInspectorViewController sceneViewModelsSearched](self, "sceneViewModelsSearched");
  else
    -[PUSceneDebugInspectorViewController sceneViewModelsAll](self, "sceneViewModelsAll");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (UIBarButtonItem)shareButton
{
  UIBarButtonItem *shareButton;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  shareButton = self->_shareButton;
  if (!shareButton)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 9, self, sel_didSelectShareButton_);
    v5 = self->_shareButton;
    self->_shareButton = v4;

    -[UIBarButtonItem setEnabled:](self->_shareButton, "setEnabled:", 0);
    shareButton = self->_shareButton;
  }
  return shareButton;
}

- (void)didSelectShareButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[6];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[PUSceneDebugInspectorViewController currentSceneViewModels](self, "currentSceneViewModels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_commaSeparatedValueRepresentation:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSTemporaryDirectory();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("Scenes.csv"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "writeToURL:atomically:", v11, 1);
  v12 = objc_alloc(MEMORY[0x1E0D96D28]);
  v23[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithActivityItems:applicationActivities:", v13, 0);

  objc_msgSend(v14, "popoverPresentationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBarButtonItem:", v4);

  v16 = *MEMORY[0x1E0D96DD8];
  v22[0] = *MEMORY[0x1E0D96DD0];
  v22[1] = v16;
  v17 = *MEMORY[0x1E0D96DE8];
  v22[2] = *MEMORY[0x1E0D96DE0];
  v22[3] = v17;
  v18 = *MEMORY[0x1E0D96DF8];
  v22[4] = *MEMORY[0x1E0D96DF0];
  v22[5] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setExcludedActivityTypes:", v19);

  -[PUSceneDebugInspectorViewController presentedViewController](self, "presentedViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[PUSceneDebugInspectorViewController presentedViewController](self, "presentedViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "presentViewController:animated:completion:", v14, 1, 0);

  }
  else
  {
    -[PUSceneDebugInspectorViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
  }

}

- (NSArray)sceneViewModelsAll
{
  return self->_sceneViewModelsAll;
}

- (void)setSceneViewModelsAll:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (NSArray)sceneViewModelsSearched
{
  return self->_sceneViewModelsSearched;
}

- (void)setSceneViewModelsSearched:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (NSDictionary)groupedSceneViewModels
{
  return self->_groupedSceneViewModels;
}

- (void)setGroupedSceneViewModels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (NSArray)groupedSceneViewModelTitles
{
  return self->_groupedSceneViewModelTitles;
}

- (void)setGroupedSceneViewModelTitles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1072);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupedSceneViewModelTitles, 0);
  objc_storeStrong((id *)&self->_groupedSceneViewModels, 0);
  objc_storeStrong((id *)&self->_sceneViewModelsSearched, 0);
  objc_storeStrong((id *)&self->_sceneViewModelsAll, 0);
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_sortButton, 0);
  objc_storeStrong((id *)&self->_loadingContentView, 0);
  objc_storeStrong((id *)&self->_sceneTaxonomy, 0);
}

void __59__PUSceneDebugInspectorViewController_didSelectSortButton___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  +[PUSceneSettings sharedInstance](PUSceneSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInspectorSortOrder:", v2);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "currentSceneViewModels");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_reloadTableViewByGroupingViewModels:sortOrder:", v5, *(_QWORD *)(a1 + 40));

}

void __73__PUSceneDebugInspectorViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setActive:", 0);

}

void __50__PUSceneDebugInspectorViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PUSceneDebugInspectorSceneViewModel *v24;
  __CFString *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  PUSceneDebugInspectorSceneViewModel *v31;
  unsigned int v32;
  uint64_t v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  id obj;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD block[4];
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[4];
  id v66;
  id v67;
  uint64_t *v68;
  id v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  _BYTE v76[128];
  uint8_t v77[128];
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  id v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "librarySpecificFetchOptions");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setShouldPrefetchCount:", 1);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v44);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = 0;
  v71 = &v70;
  v72 = 0x3032000000;
  v73 = __Block_byref_object_copy__83033;
  v74 = __Block_byref_object_dispose__83034;
  v75 = 0;
  v1 = (void *)MEMORY[0x1E0D719A8];
  objc_msgSend(v45, "photoLibraryBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = 0;
  v46 = (void *)objc_msgSend(v1, "newPhotoLibraryWithName:loadedFromBundle:options:error:", "-[PUSceneDebugInspectorViewController viewDidLoad]_block_invoke", v2, 0, &v69);
  v41 = v69;

  v3 = v46;
  if (!v46)
  {
    PLUIGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v45, "photoLibraryBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v79 = v5;
      v80 = 2112;
      v81 = v41;
      _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_FAULT, "Error loading photo library from bundle %@: %@", buf, 0x16u);

    }
    v3 = 0;
  }
  objc_msgSend(v3, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(MEMORY[0x1E0D71AB0], "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setPropertiesToFetch:", &unk_1E59BA780);
  objc_msgSend(v9, "setReturnsDistinctResults:", 0);
  objc_msgSend(v9, "setResultType:", 2);
  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 3221225472;
  v65[2] = __50__PUSceneDebugInspectorViewController_viewDidLoad__block_invoke_155;
  v65[3] = &unk_1E58AAD18;
  v68 = &v70;
  v39 = v6;
  v66 = v39;
  v40 = v9;
  v67 = v40;
  objc_msgSend(v46, "performBlockAndWait:", v65);
  v49 = (void *)objc_opt_new();
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v10 = (id)v71[5];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v62 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("sceneIdentifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v14, "unsignedIntValue"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "addObject:", v15);

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
    }
    while (v11);
  }

  objc_msgSend(*(id *)(a1 + 32), "sceneTaxonomy");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v42, "count");
  v51 = (void *)objc_opt_new();
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = (id)v71[5];
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v76, 16);
  if (v17)
  {
    v18 = (double)v16;
    v48 = *(_QWORD *)v58;
    do
    {
      v50 = v17;
      for (j = 0; j != v50; ++j)
      {
        if (*(_QWORD *)v58 != v48)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("sceneIdentifier"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v53, "unsignedLongLongValue"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "nodeRefForExtendedSceneClassId:", objc_msgSend(v21, "unsignedLongLongValue"));
        v22 = (void *)MEMORY[0x1E0CB37E8];
        PFSceneTaxonomyNodeSearchThreshold();
        objc_msgSend(v22, "numberWithDouble:");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "objectForKeyedSubscript:", v21);
        v24 = (PUSceneDebugInspectorSceneViewModel *)objc_claimAutoreleasedReturnValue();
        if (!v24)
        {
          PFSceneTaxonomyNodeName();
          v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (!v25)
          {
            objc_msgSend(v21, "unsignedIntValue");
            v25 = CFSTR("~ No Localized Keyword ~");
          }
          PFSceneTaxonomyNodeLocalizedSynonyms();
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = (void *)v26;
          v28 = (void *)MEMORY[0x1E0C9AA60];
          if (v26)
            v28 = (void *)v26;
          v29 = v28;

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", PFSceneTaxonomyNodeIsIndexed());
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = [PUSceneDebugInspectorSceneViewModel alloc];
          v32 = objc_msgSend(v21, "unsignedIntValue");
          v33 = objc_msgSend(v30, "BOOLValue");
          objc_msgSend(v23, "doubleValue");
          v24 = -[PUSceneDebugInspectorSceneViewModel initWithKeyword:synonyms:sceneIdentifier:indexed:threshold:](v31, "initWithKeyword:synonyms:sceneIdentifier:indexed:threshold:", v25, v29, v32, v33);
          objc_msgSend(v51, "setObject:forKeyedSubscript:", v24, v21);

        }
        -[PUSceneDebugInspectorSceneViewModel setCount:](v24, "setCount:", -[PUSceneDebugInspectorSceneViewModel count](v24, "count") + 1);
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("confidence"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "doubleValue");
        v36 = v35;
        objc_msgSend(v23, "doubleValue");
        if (v36 >= v37)
        {
          -[PUSceneDebugInspectorSceneViewModel setHighConfidenceCount:](v24, "setHighConfidenceCount:", -[PUSceneDebugInspectorSceneViewModel highConfidenceCount](v24, "highConfidenceCount") + 1);
          -[PUSceneDebugInspectorSceneViewModel setLibraryCoverage:](v24, "setLibraryCoverage:", (double)-[PUSceneDebugInspectorSceneViewModel highConfidenceCount](v24, "highConfidenceCount") / v18);
        }

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v76, 16);
    }
    while (v17);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PUSceneDebugInspectorViewController_viewDidLoad__block_invoke_163;
  block[3] = &unk_1E58AB210;
  objc_copyWeak(&v56, (id *)(a1 + 40));
  v55 = v51;
  v38 = v51;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v56);
  _Block_object_dispose(&v70, 8);

}

void __50__PUSceneDebugInspectorViewController_viewDidLoad__block_invoke_155(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v3 = a1[5];
  v9 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v9);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v9;
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    PLUIGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_ERROR, "Failed to fetch scenes error: %@", buf, 0xCu);
    }

  }
}

void __50__PUSceneDebugInspectorViewController_viewDidLoad__block_invoke_163(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[PUSceneSettings sharedInstance](PUSceneSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "inspectorSortOrder");

  objc_msgSend(*(id *)(a1 + 32), "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setSceneViewModelsAll:", v4);

  objc_msgSend(WeakRetained, "setSceneViewModelsSearched:", 0);
  objc_msgSend(WeakRetained, "loadingContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  objc_msgSend(WeakRetained, "sceneViewModelsAll");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_reloadTableViewByGroupingViewModels:sortOrder:", v6, v3);

}

+ (id)_sortedSceneViewModels:(id)a3 sortOrder:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v14[16];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    PXAssertGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_error_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_ERROR, "Attempted to sort nil view models", v14, 2u);
    }

  }
  objc_msgSend(a1, "_keyForSortOrder:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(a1, "_isAscendingForSortOrder:", a4);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingDescriptors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_sectionTitleForSceneViewModel:(id)a3 sortOrder:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  double v9;
  unint64_t v10;
  __CFString *v11;
  int v12;
  __CFString *v13;

  v5 = a3;
  v6 = v5;
  switch(a4)
  {
    case 0uLL:
      objc_msgSend(v5, "keyword");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "substringToIndex:", 1);
      a4 = objc_claimAutoreleasedReturnValue();

      break;
    case 1uLL:
      v8 = 100 * (objc_msgSend(v5, "count") / 0x64uLL);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Count: %06lu ~ %06lu"), v8, v8 + 100);
      goto LABEL_6;
    case 2uLL:
      objc_msgSend(v5, "libraryCoverage");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Coverage: %.0lf%% ~ %.0lf%%"), (double)(unint64_t)(v9 * 10.0) * 10.0, (double)(unint64_t)(v9 * 10.0) * 10.0 + 10.0);
      goto LABEL_6;
    case 3uLL:
      v10 = 100 * (objc_msgSend(v5, "sceneIdentifier") / 0x64uLL);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Identifier: %06lu ~ %06lu"), v10, v10 + 100);
LABEL_6:
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 4uLL:
      v12 = objc_msgSend(v5, "isIndexed");
      v13 = CFSTR("Non-searchable");
      if (v12)
        v13 = CFSTR("Searchable");
      v11 = v13;
LABEL_10:
      a4 = (unint64_t)v11;
      break;
    default:
      break;
  }

  return (id)a4;
}

+ (id)_shortTitlesForSectionTitles:(id)a3 SortOrder:(unint64_t)a4
{
  id v4;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (a4 - 1 < 3)
  {
    v8 = (void *)objc_opt_new();
    if (objc_msgSend(v7, "count"))
    {
      v9 = 0;
      do
      {
        objc_msgSend(v8, "addObject:", CFSTR("·"));
        ++v9;
      }
      while (v9 < objc_msgSend(v7, "count"));
    }
LABEL_17:
    v4 = (id)objc_msgSend(v8, "copy", (_QWORD)v17);

    goto LABEL_18;
  }
  if (a4 == 4)
  {
    v8 = (void *)objc_opt_new();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "substringToIndex:", 1, (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

    goto LABEL_17;
  }
  if (!a4)
    v4 = v6;
LABEL_18:

  return v4;
}

+ (id)_keyForSortOrder:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return CFSTR("keyword");
  else
    return off_1E58A7AC8[a3 - 1];
}

+ (BOOL)_isAscendingForSortOrder:(unint64_t)a3
{
  return (a3 > 4) | (9u >> a3) & 1;
}

+ (id)_titleForSortOrder:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return CFSTR("Alphabetically");
  else
    return off_1E58A7AE8[a3 - 1];
}

+ (id)_commaSeparatedValueRepresentation:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  int v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(&unk_1E59BA798, "componentsJoinedByString:", CFSTR(","));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v20 = v4;
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("\n"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithString:", v6);

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v3;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v30;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(obj);
        v24 = v8;
        v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v8);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v10 = objc_msgSend(&unk_1E59BA798, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v26 != v12)
                objc_enumerationMutation(&unk_1E59BA798);
              v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
              if (objc_msgSend(v14, "isEqualToString:", CFSTR("isIndexed")))
              {
                v15 = objc_msgSend(v9, "isIndexed");
                v16 = CFSTR("NO");
                if (v15)
                  v16 = CFSTR("YES");
                objc_msgSend(v7, "appendFormat:", CFSTR("%@"), v16);
              }
              else
              {
                if (objc_msgSend(v14, "isEqualToString:", CFSTR("synonyms")))
                  objc_msgSend(v9, "concatenatedSynonyms");
                else
                  objc_msgSend(v9, "valueForKey:", v14);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "appendFormat:", CFSTR("%@"), v17);

              }
              objc_msgSend(&unk_1E59BA798, "lastObject");
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (v14 != v18)
                objc_msgSend(v7, "appendString:", CFSTR(","));
            }
            v11 = objc_msgSend(&unk_1E59BA798, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v11);
        }
        objc_msgSend(v7, "appendString:", CFSTR("\n"));
        v8 = v24 + 1;
      }
      while (v24 + 1 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v23);
  }

  return v7;
}

+ (id)_assetGridViewControllerForViewModel:(id)a3 interfaceIdiom:(int64_t)a4
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  PUSceneDebugGridViewController *v9;
  void *v10;
  PUSceneDebugGridViewController *v11;
  NSObject *v12;
  PUSceneDebugGridViewController *v13;
  id v14;
  id v15;
  PUSceneDebugGridViewController *v16;
  PUSceneDebugGridViewController *v17;
  _QWORD block[4];
  id v20;
  id v21;
  PUSceneDebugGridViewController *v22;

  v4 = a3;
  objc_msgSend(v4, "keyword");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = objc_msgSend(v4, "sceneIdentifier");

  objc_msgSend(v6, "numberWithUnsignedLongLong:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v9 = [PUSceneDebugGridViewController alloc];
  v10 = (void *)objc_opt_new();
  v11 = -[PUPhotosAlbumViewController initWithSpec:](v9, "initWithSpec:", v10);

  -[PUSceneDebugGridViewController setSceneIdentifier:](v11, "setSceneIdentifier:", v8);
  dispatch_get_global_queue(25, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__PUSceneDebugInspectorViewController__assetGridViewControllerForViewModel_interfaceIdiom___block_invoke;
  block[3] = &unk_1E58AB790;
  v20 = v8;
  v21 = v5;
  v13 = v11;
  v22 = v13;
  v14 = v5;
  v15 = v8;
  dispatch_async(v12, block);

  v16 = v22;
  v17 = v13;

  return v17;
}

+ (id)highestConfidenceForAsset:(id)a3 sceneIdentifier:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(a3, "sceneClassifications", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "extendedSceneIdentifier");
        if (v13 == objc_msgSend(v5, "unsignedIntegerValue"))
        {
          objc_msgSend(v12, "confidence");
          if (v14 > v10)
          {
            objc_msgSend(v12, "confidence");
            v10 = v15;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 0.0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __91__PUSceneDebugInspectorViewController__assetGridViewControllerForViewModel_interfaceIdiom___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  id v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D719A8], "systemPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(MEMORY[0x1E0D71AB0], "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchRequestWithEntityName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("sceneIdentifier == %@"), *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v7);

  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__83033;
  v42 = __Block_byref_object_dispose__83034;
  v43 = 0;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __91__PUSceneDebugInspectorViewController__assetGridViewControllerForViewModel_interfaceIdiom___block_invoke_2;
  v34[3] = &unk_1E58AAD18;
  v21 = v3;
  v35 = v21;
  v22 = v6;
  v36 = v22;
  v37 = &v38;
  objc_msgSend(v2, "performBlockAndWait:", v34);
  v8 = (void *)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v9 = (id)v39[5];
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        +[PUSceneDebugInspectorViewController highestConfidenceForAsset:sceneIdentifier:](PUSceneDebugInspectorViewController, "highestConfidenceForAsset:sceneIdentifier:", v13, *(_QWORD *)(a1 + 32));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v15);

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
    }
    while (v10);
  }

  v16 = (void *)v39[5];
  v17 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __91__PUSceneDebugInspectorViewController__assetGridViewControllerForViewModel_interfaceIdiom___block_invoke_3;
  v28[3] = &unk_1E58A7AA8;
  v18 = v8;
  v29 = v18;
  objc_msgSend(v16, "sortedArrayUsingComparator:", v28);
  block[0] = v17;
  block[1] = 3221225472;
  block[2] = __91__PUSceneDebugInspectorViewController__assetGridViewControllerForViewModel_interfaceIdiom___block_invoke_4;
  block[3] = &unk_1E58A9AE0;
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v25 = *(id *)(a1 + 40);
  v26 = *(id *)(a1 + 48);
  v27 = v18;
  v19 = v18;
  v20 = v24;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(&v38, 8);
}

void __91__PUSceneDebugInspectorViewController__assetGridViewControllerForViewModel_interfaceIdiom___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "executeFetchRequest:error:", *(_QWORD *)(a1 + 40), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v9, "assetAttributes", (_QWORD)v20);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "asset");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          v13 = v11;
        }
        else
        {
          objc_msgSend(v9, "assetAttributesForTemporalSceneClassifications");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "asset");
          v13 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v3, "addObject:", v13);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  v15 = (void *)MEMORY[0x1E0D71880];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pl_PHAssetsForManagedAssets:photoLibrary:", v3, v16);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;

}

uint64_t __91__PUSceneDebugInspectorViewController__assetGridViewControllerForViewModel_interfaceIdiom___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "localIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  v11 = *(void **)(a1 + 32);
  objc_msgSend(v6, "localIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  if (v10 > v15)
    return -1;
  else
    return v10 != v15;
}

void __91__PUSceneDebugInspectorViewController__assetGridViewControllerForViewModel_interfaceIdiom___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssets:title:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CD14E0];
  v8[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transientCollectionListWithCollections:title:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setAssetsHighestConfidence:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 48), "setAssetCollection:fetchResultContainingAssetCollection:filterPredicate:", v2, v7, 0);

}

@end
