@implementation WFChooseFromListDialogViewController

- (WFChooseFromListDialogViewController)initWithRequest:(id)a3
{
  id v4;
  WFChooseFromListDialogViewController *v5;
  uint64_t v6;
  NSMutableArray *selectedItems;
  uint64_t v8;
  NSCache *imageCache;
  uint64_t v10;
  NSMutableDictionary *cachedAggregateHeightsByWidth;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  WFChooseFromListDialogViewController *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)WFChooseFromListDialogViewController;
  v5 = -[WFCompactDialogViewController initWithRequest:](&v24, sel_initWithRequest_, v4);
  if (v5)
  {
    v6 = objc_opt_new();
    selectedItems = v5->_selectedItems;
    v5->_selectedItems = (NSMutableArray *)v6;

    v8 = objc_opt_new();
    imageCache = v5->_imageCache;
    v5->_imageCache = (NSCache *)v8;

    v10 = objc_opt_new();
    cachedAggregateHeightsByWidth = v5->_cachedAggregateHeightsByWidth;
    v5->_cachedAggregateHeightsByWidth = (NSMutableDictionary *)v10;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v4, "items", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if (objc_msgSend(v17, "selected"))
            -[NSMutableArray addObject:](v5->_selectedItems, "addObject:", v17);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v14);
    }

    v18 = v5;
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[WFChooseFromListDialogViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("contentSize"), WFChooseFromListDialogContentSizeContext);

  v4.receiver = self;
  v4.super_class = (Class)WFChooseFromListDialogViewController;
  -[WFChooseFromListDialogViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  objc_class *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  id location;
  objc_super v50;
  _QWORD v51[6];

  v51[4] = *MEMORY[0x24BDAC8D0];
  v50.receiver = self;
  v50.super_class = (Class)WFChooseFromListDialogViewController;
  -[WFCompactDialogViewController loadView](&v50, sel_loadView);
  -[WFCompactPlatterViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelaysContentTouches:", 1);

  -[WFCompactDialogViewController request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactPlatterViewController platterView](self, "platterView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setSecondaryText:", v5);

  v44 = (void *)objc_opt_new();
  objc_msgSend(v4, "cancelButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x24BDAC760];
  if (v6)
  {
    objc_initWeak(&location, self);
    objc_msgSend(v4, "cancelButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v7;
    v47[1] = 3221225472;
    v47[2] = __48__WFChooseFromListDialogViewController_loadView__block_invoke;
    v47[3] = &unk_24E604D60;
    objc_copyWeak(&v48, &location);
    +[WFCompactDialogAction actionForButton:handler:](WFCompactDialogAction, "actionForButton:handler:", v8, v47);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addObject:", v9);

    objc_destroyWeak(&v48);
    objc_destroyWeak(&location);
  }
  if ((objc_msgSend(v4, "allowsMultipleSelection") & 1) != 0
    || (objc_msgSend(v4, "items"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "count") == 0,
        v10,
        v11))
  {
    objc_initWeak(&location, self);
    objc_msgSend(v4, "doneButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "doneButton");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v7;
      v45[1] = 3221225472;
      v45[2] = __48__WFChooseFromListDialogViewController_loadView__block_invoke_2;
      v45[3] = &unk_24E604D60;
      objc_copyWeak(&v46, &location);
      +[WFCompactDialogAction actionForButton:handler:](WFCompactDialogAction, "actionForButton:handler:", v13, v45);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "addObject:", v14);

      objc_destroyWeak(&v46);
    }
    objc_destroyWeak(&location);
  }
  -[WFCompactDialogViewController configureActionGroupWithActions:](self, "configureActionGroupWithActions:", v44);
  objc_msgSend(v4, "items");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    objc_msgSend(v43, "setContentClippingDelegate:", self);
    v17 = objc_alloc(MEMORY[0x24BEBD9F0]);
    v18 = (void *)objc_msgSend(v17, "initWithFrame:style:", 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(v18, "setDataSource:", self);
    objc_msgSend(v18, "setDelegate:", self);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBackgroundColor:", v19);

    objc_msgSend(v18, "setAlwaysBounceVertical:", 0);
    objc_msgSend(v18, "setScrollEnabled:", 0);
    objc_msgSend(v18, "setSeparatorInsetReference:", 0);
    objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 1200);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBDAF0], "effectForBlurEffect:style:", v20, 7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setSeparatorEffect:", v21);

    objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v22 = objc_opt_class();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "registerClass:forCellReuseIdentifier:", v22, v24);

    objc_storeWeak((id *)&self->_tableView, v18);
    v25 = v18;
    objc_msgSend(v25, "_setOverrideVibrancyTrait:", 1);
    objc_msgSend(v25, "addObserver:forKeyPath:options:context:", self, CFSTR("contentSize"), 3, WFChooseFromListDialogContentSizeContext);
    v26 = v25;
  }
  else
  {
    v20 = objc_alloc_init(MEMORY[0x24BEBD708]);
    objc_msgSend(v4, "emptyStateMessage");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setText:", v27);

    objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v20, "setNumberOfLines:", 0);
    objc_msgSend(v20, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFont:", v28);

    v26 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    objc_msgSend(v26, "addSubview:", v20);
    v35 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v20, "leadingAnchor");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "leadingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v42, 16.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v41;
    objc_msgSend(v20, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, -16.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = v38;
    objc_msgSend(v20, "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:constant:", v36, 10.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v51[2] = v29;
    objc_msgSend(v20, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, -10.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v51[3] = v32;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "activateConstraints:", v33);

  }
  v34 = objc_alloc_init(MEMORY[0x24BEBDB08]);
  objc_msgSend(v34, "setView:", v26);
  -[WFCompactPlatterViewController setContentViewController:](self, "setContentViewController:", v34);

}

- (void)finishWithSelectedItems
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc(MEMORY[0x24BEC1388]);
  -[WFChooseFromListDialogViewController selectedItems](self, "selectedItems");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "initWithItems:cancelled:", v5, 0);
  -[WFCompactDialogViewController finishWithResponse:](self, "finishWithResponse:", v4);

}

- (double)contentHeightForWidth:(double)a3 withMaximumVisibleHeight:(double)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  WFChooseFromListDialogCell *v17;
  void *v18;
  void *v19;
  WFChooseFromListDialogCell *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  uint64_t v28;
  uint64_t v29;
  double (*v30)(uint64_t, uint64_t, uint64_t);
  void *v31;
  WFChooseFromListDialogViewController *v32;
  WFChooseFromListDialogCell *v33;
  uint64_t *v34;
  double v35;
  uint64_t v36;
  double *v37;
  uint64_t v38;
  uint64_t v39;
  objc_super v40;

  -[WFChooseFromListDialogViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFChooseFromListDialogViewController cachedAggregateHeightsByWidth](self, "cachedAggregateHeightsByWidth");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[WFChooseFromListDialogViewController cachedAggregateHeightsByWidth](self, "cachedAggregateHeightsByWidth");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;
      }
      else
      {
        v14 = 0;
      }
      v20 = v14;

      -[WFChooseFromListDialogCell doubleValue](v20, "doubleValue");
      v16 = v26;
    }
    else
    {
      v17 = self->_prototypeCell;
      if (!v17)
      {
        v17 = -[WFChooseFromListDialogCell initWithStyle:reuseIdentifier:]([WFChooseFromListDialogCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
        objc_storeStrong((id *)&self->_prototypeCell, v17);
      }
      v36 = 0;
      v37 = (double *)&v36;
      v38 = 0x2020000000;
      v39 = 0;
      -[WFCompactDialogViewController request](self, "request");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "items");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = MEMORY[0x24BDAC760];
      v29 = 3221225472;
      v30 = __87__WFChooseFromListDialogViewController_contentHeightForWidth_withMaximumVisibleHeight___block_invoke;
      v31 = &unk_24E603260;
      v32 = self;
      v20 = v17;
      v33 = v20;
      v34 = &v36;
      v35 = a3;
      objc_msgSend(v19, "enumerateObjectsUsingBlock:", &v28);

      -[WFChooseFromListDialogViewController tableView](self, "tableView", v28, v29, v30, v31, v32);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "contentInset");
      v37[3] = v22 + v37[3];

      -[WFChooseFromListDialogViewController cachedAggregateHeightsByWidth](self, "cachedAggregateHeightsByWidth");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v37[3]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKey:", v24, v25);

      v16 = v37[3];
      _Block_object_dispose(&v36, 8);
    }

  }
  else
  {
    v40.receiver = self;
    v40.super_class = (Class)WFChooseFromListDialogViewController;
    -[WFCompactPlatterViewController contentHeightForWidth:withMaximumVisibleHeight:](&v40, sel_contentHeightForWidth_withMaximumVisibleHeight_, a3, a4);
    return v15;
  }
  return v16;
}

- (void)updateCellSeparatorInsets
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[WFChooseFromListDialogViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForVisibleRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "row", (_QWORD)v24);
        -[WFChooseFromListDialogViewController tableView](self, "tableView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "numberOfRowsInSection:", objc_msgSend(v10, "section"));

        -[WFChooseFromListDialogViewController tableView](self, "tableView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "cellForRowAtIndexPath:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v16 = v15;
          else
            v16 = 0;
        }
        else
        {
          v16 = 0;
        }
        v17 = v11 + 1;
        v18 = v16;

        if (v17 >= v13)
        {
          v22 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v17, objc_msgSend(v10, "section"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFChooseFromListDialogViewController tableView](self, "tableView");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "cellForRowAtIndexPath:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            v22 = objc_msgSend(v21, "prefersSeparatorInsetForImage");
          else
            v22 = 0;

        }
        if ((v22 & objc_msgSend(v18, "prefersSeparatorInsetForImage")) != 0)
          v23 = 66.0;
        else
          v23 = 24.0;
        objc_msgSend(v18, "setSeparatorInset:", 0.0, v23, 0.0, 0.0);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v7);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFChooseFromListDialogViewController;
  -[WFChooseFromListDialogViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[WFChooseFromListDialogViewController updateCellSeparatorInsets](self, "updateCellSeparatorInsets");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  int64_t v6;

  -[WFCompactDialogViewController request](self, "request", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFChooseFromListDialogViewController configureCell:forIndexPath:](self, "configureCell:forIndexPath:", v10, v6);
  return v10;
}

- (void)configureCell:(id)a3 forIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v6 = a4;
  v7 = a3;
  -[WFCompactDialogViewController request](self, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "row");

  objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setViewController:", self);
  -[WFChooseFromListDialogViewController imageCache](self, "imageCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImageCache:", v11);

  -[WFChooseFromListDialogViewController selectedItems](self, "selectedItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setChecked:", objc_msgSend(v12, "containsObject:", v18));

  -[WFCompactDialogViewController request](self, "request");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "displayConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDisplayConfiguration:", v14);

  objc_msgSend(v7, "setListItem:", v18);
  -[WFCompactPlatterViewController platterView](self, "platterView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "visualStylingProviderForCategory:", 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setFillVisualStylingProvider:", v16);
  -[WFCompactPlatterViewController appearanceProvider](self, "appearanceProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "configureChooseFromListDialogCell:", v7);

}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  objc_msgSend(v15, "cellForRowAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "listItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactDialogViewController request](self, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "allowsMultipleSelection");

  -[WFChooseFromListDialogViewController selectedItems](self, "selectedItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v10 & 1) != 0)
  {
    v13 = objc_msgSend(v11, "containsObject:", v8);

    if (v13)
    {
      objc_msgSend(v7, "setChecked:", 0);
      -[WFChooseFromListDialogViewController selectedItems](self, "selectedItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObject:", v8);
    }
    else
    {
      objc_msgSend(v7, "setChecked:", 1);
      -[WFChooseFromListDialogViewController selectedItems](self, "selectedItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v8);
    }

    objc_msgSend(v15, "deselectRowAtIndexPath:animated:", v6, 1);
    objc_msgSend(v15, "beginUpdates");
    objc_msgSend(v15, "endUpdates");
  }
  else
  {
    objc_msgSend(v11, "addObject:", v8);

    -[WFChooseFromListDialogViewController finishWithSelectedItems](self, "finishWithSelectedItems");
  }

}

- (void)platterView:(id)a3 didUpdateContentVerticalOffset:(double)a4
{
  double v4;
  id v5;

  v4 = -a4;
  -[WFChooseFromListDialogViewController tableView](self, "tableView", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentOffset:", 0.0, v4);

}

- (void)setAppearanceProvider:(id)a3
{
  id v4;
  id WeakRetained;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFChooseFromListDialogViewController;
  v4 = a3;
  -[WFCompactPlatterViewController setAppearanceProvider:](&v6, sel_setAppearanceProvider_, v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  objc_msgSend(v4, "configureChooseFromListDialogViewController:", WeakRetained, v6.receiver, v6.super_class);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  objc_super v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  if ((void *)WFChooseFromListDialogContentSizeContext == a6)
  {
    v11 = *MEMORY[0x24BDD0E80];
    v12 = a5;
    objc_msgSend(v12, "objectForKey:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "CGSizeValue");
    v15 = v14;
    v17 = v16;

    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "CGSizeValue");
    v20 = v19;
    v22 = v21;

    v28.origin.x = 0.0;
    v28.origin.y = 0.0;
    v28.size.width = v15;
    v28.size.height = v17;
    v29 = CGRectIntegral(v28);
    x = v29.origin.x;
    y = v29.origin.y;
    width = v29.size.width;
    height = v29.size.height;
    v29.origin.x = 0.0;
    v29.origin.y = 0.0;
    v29.size.width = v20;
    v29.size.height = v22;
    v31 = CGRectIntegral(v29);
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    if (!CGRectEqualToRect(v30, v31))
      -[WFCompactPlatterViewController invalidateContentSize](self, "invalidateContentSize");
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)WFChooseFromListDialogViewController;
    v10 = a5;
    -[WFChooseFromListDialogViewController observeValueForKeyPath:ofObject:change:context:](&v27, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, v10, a6);

  }
}

- (BOOL)shouldInstallBannerDimmingLayer
{
  return 1;
}

- (UITableView)tableView
{
  return (UITableView *)objc_loadWeakRetained((id *)&self->_tableView);
}

- (void)setTableView:(id)a3
{
  objc_storeWeak((id *)&self->_tableView, a3);
}

- (NSMutableArray)selectedItems
{
  return self->_selectedItems;
}

- (void)setSelectedItems:(id)a3
{
  objc_storeStrong((id *)&self->_selectedItems, a3);
}

- (WFChooseFromListDialogCell)prototypeCell
{
  return self->_prototypeCell;
}

- (void)setPrototypeCell:(id)a3
{
  objc_storeStrong((id *)&self->_prototypeCell, a3);
}

- (NSCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_imageCache, a3);
}

- (NSMutableDictionary)cachedAggregateHeightsByWidth
{
  return self->_cachedAggregateHeightsByWidth;
}

- (void)setCachedAggregateHeightsByWidth:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAggregateHeightsByWidth, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAggregateHeightsByWidth, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_prototypeCell, 0);
  objc_storeStrong((id *)&self->_selectedItems, 0);
  objc_destroyWeak((id *)&self->_tableView);
}

double __87__WFChooseFromListDialogViewController_contentHeightForWidth_withMaximumVisibleHeight___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  double v8;
  double result;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configureCell:forIndexPath:", v5, v6);

  objc_msgSend(*(id *)(a1 + 40), "systemLayoutSizeFittingSize:", *(double *)(a1 + 56), *(double *)(MEMORY[0x24BEBE588] + 8));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  result = v8 + *(double *)(v7 + 24);
  *(double *)(v7 + 24) = result;
  return result;
}

void __48__WFChooseFromListDialogViewController_loadView__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = objc_alloc(MEMORY[0x24BEC1388]);
  v2 = (void *)objc_msgSend(v1, "initWithItems:cancelled:", MEMORY[0x24BDBD1A8], 1);
  objc_msgSend(WeakRetained, "finishWithResponse:", v2);

}

void __48__WFChooseFromListDialogViewController_loadView__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "finishWithSelectedItems");

}

@end
