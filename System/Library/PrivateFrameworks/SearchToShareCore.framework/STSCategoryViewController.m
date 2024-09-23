@implementation STSCategoryViewController

- (STSCategoryViewController)init
{
  STSCategoryViewController *v2;
  NSMutableArray *v3;
  NSMutableArray *model;
  NSArray *categories;
  NSArray *v6;
  NSArray *recents;
  STSCategoryView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD block[4];
  STSCategoryViewController *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)STSCategoryViewController;
  v2 = -[STSCategoryViewController init](&v18, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    model = v2->_model;
    v2->_model = v3;

    categories = v2->_categories;
    v6 = (NSArray *)MEMORY[0x24BDBD1A8];
    v2->_categories = (NSArray *)MEMORY[0x24BDBD1A8];

    recents = v2->_recents;
    v2->_recents = v6;

    v2->_isScrolling = 0;
    v8 = objc_alloc_init(STSCategoryView);
    -[STSCategoryView tableView](v8, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDataSource:", v2);

    -[STSCategoryView tableView](v8, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", v2);

    -[STSCategoryView tableView](v8, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("CategoryCell"));

    -[STSCategoryView tableView](v8, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("CategoryTitleCell"));

    -[STSCategoryView tableView](v8, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSeparatorStyle:", 1);

    -[STSCategoryViewController setView:](v2, "setView:", v8);
    dispatch_get_global_queue(9, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __33__STSCategoryViewController_init__block_invoke;
    block[3] = &unk_24E7457A8;
    v17 = v2;
    dispatch_async(v14, block);

  }
  return v2;
}

uint64_t __33__STSCategoryViewController_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateModel");
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STSCategoryViewController;
  -[STSCategoryViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[STSCategoryViewController updateModel](self, "updateModel");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v3;
  void *v4;
  id v5;

  -[STSCategoryViewController view](self, "view", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollToRowAtIndexPath:atScrollPosition:animated:", v4, 1, 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  if (-[STSCategoryViewController sendFeedbackOnViewDidAppear](self, "sendFeedbackOnViewDidAppear", a3))
  {
    -[STSCategoryViewController setSendFeedbackOnViewDidAppear:](self, "setSendFeedbackOnViewDidAppear:", 0);
    -[STSCategoryViewController sendVisibleResultsFeedback](self, "sendVisibleResultsFeedback");
  }
}

- (UIEdgeInsets)contentInset
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  -[STSCategoryViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentInset");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  void *v7;
  id v8;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[STSCategoryViewController view](self, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentInset:", top, left, bottom, right);

}

- (void)updateContentOffset:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  -[STSCategoryViewController view](self, "view");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSCategoryViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentInset");
  objc_msgSend(v5, "setContentOffset:", -v8, a3);

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x24BEBE770];
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  objc_class *v4;
  id v5;
  id v6;
  double v7;
  double v8;

  v4 = (objc_class *)MEMORY[0x24BEBDB00];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "bounds");
  v8 = v7;

  return (id)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, v8, 0.0);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSMutableArray count](self->_model, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 isScrolling;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[NSMutableArray objectAtIndex:](self->_model, "objectAtIndex:", objc_msgSend(v7, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "type");
  if (v9 >= 2)
  {
    if (v9 == 2)
    {
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("CategoryTitleCell"), v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSelectionStyle:", 0);
      objc_msgSend(v10, "textLabel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "title");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setText:", v23);

      objc_msgSend(v10, "setClearButtonHidden:", objc_msgSend(v8, "clearButtonHidden"));
      objc_msgSend(v10, "setResult:", v8);
      objc_msgSend(v10, "setSelectionDelegate:", self);
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("CategoryCell"), v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v12);

    objc_msgSend(v10, "textLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemPinkColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextColor:", v14);

    objc_msgSend(v10, "textLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE250]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFont:", v16);

    objc_msgSend(v8, "searchResult");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      isScrolling = self->_isScrolling;

      if (isScrolling)
      {
        +[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "searchResult");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = v20;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "didShowResults:scrolling:", v21, 1);

      }
    }
  }

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[NSMutableArray objectAtIndex:](self->_model, "objectAtIndex:", objc_msgSend(a4, "row", a3));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "type") == 1)
  {
    objc_msgSend(v13, "suggestion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "prediction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[STSCategoryViewController selectionDelegate](self, "selectionDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "categoryViewController:didSelectCategory:suggested:", self, v8, v6 != 0);
  }
  else
  {
    if (objc_msgSend(v13, "type"))
      goto LABEL_6;
    -[STSCategoryViewController selectionDelegate](self, "selectionDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "categoryViewController:didSelectRecent:", self, v8);
  }

LABEL_6:
  objc_msgSend(v13, "searchResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "searchResult");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "suggestion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "didEngageCategoryResult:suggestion:", v11, v12);

  }
}

- (void)updateModel
{
  id v3;
  NSUInteger v4;
  uint64_t v5;
  STSCategoryResult *v6;
  void *v7;
  NSArray *recents;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  STSCategoryResult *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;

  -[NSMutableArray removeAllObjects](self->_model, "removeAllObjects");
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = -[NSArray count](self->_recents, "count");
  v5 = MEMORY[0x24BDAC760];
  if (v4)
  {
    v6 = objc_alloc_init(STSCategoryResult);
    -[STSCategoryResult setType:](v6, "setType:", 2);
    STSLocalizedString(CFSTR("RECENT"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSCategoryResult setTitle:](v6, "setTitle:", v7);

    -[STSCategoryResult setClearButtonHidden:](v6, "setClearButtonHidden:", 0);
    -[NSMutableArray addObject:](self->_model, "addObject:", v6);
    recents = self->_recents;
    v16[0] = v5;
    v16[1] = 3221225472;
    v16[2] = __40__STSCategoryViewController_updateModel__block_invoke;
    v16[3] = &unk_24E7457D0;
    v16[4] = self;
    v17 = v3;
    -[NSArray enumerateObjectsUsingBlock:](recents, "enumerateObjectsUsingBlock:", v16);

  }
  v13 = objc_alloc_init(STSCategoryResult);
  -[STSCategoryResult setType:](v13, "setType:", 2);
  STSLocalizedString(CFSTR("CATEGORIES"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSCategoryResult setTitle:](v13, "setTitle:", v9);

  -[STSCategoryResult setClearButtonHidden:](v13, "setClearButtonHidden:", 1);
  -[NSMutableArray addObject:](self->_model, "addObject:", v13);
  -[STSSearchModel categoryList](self->_searchModel, "categoryList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __40__STSCategoryViewController_updateModel__block_invoke_2;
  v14[3] = &unk_24E7457F8;
  v14[4] = self;
  v15 = v3;
  v12 = v3;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v14);

}

void __40__STSCategoryViewController_updateModel__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  STSCategoryResult *v8;

  v3 = a2;
  v8 = objc_alloc_init(STSCategoryResult);
  -[STSCategoryResult setType:](v8, "setType:", 0);
  -[STSCategoryResult setTitle:](v8, "setTitle:", v3);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84F98]), "initWithSuggestion:query:score:type:", v3, &stru_24E7469D8, 3, 0.0);
  -[STSCategoryResult setSuggestion:](v8, "setSuggestion:", v4);

  v5 = objc_alloc_init(MEMORY[0x24BE84F90]);
  objc_msgSend(MEMORY[0x24BE85018], "textWithString:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

  objc_msgSend(*(id *)(a1 + 32), "_searchResultIdentifierForSuggestion:recent:", v3, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setIdentifier:", v7);
  objc_msgSend(v5, "setType:", 16);
  objc_msgSend(v5, "setResultBundleId:", CFSTR("com.apple.hashtagimages.categorylist.recents.recent"));
  objc_msgSend(v5, "setSectionBundleIdentifier:", CFSTR("com.apple.hashtagimages.categorylist.recents"));
  -[STSCategoryResult setSearchResult:](v8, "setSearchResult:", v5);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "addObject:", v8);

}

void __40__STSCategoryViewController_updateModel__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  STSCategoryResult *v17;

  v5 = a2;
  v17 = objc_alloc_init(STSCategoryResult);
  -[STSCategoryResult setType:](v17, "setType:", 1);
  objc_msgSend(v5, "suggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSCategoryResult setTitle:](v17, "setTitle:", v6);

  -[STSCategoryResult setSuggestion:](v17, "setSuggestion:", v5);
  v7 = objc_alloc_init(MEMORY[0x24BE84F90]);
  objc_msgSend(v5, "fbr");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFbr:", v8);

  v9 = (void *)MEMORY[0x24BE85018];
  objc_msgSend(v5, "suggestion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v11);

  v12 = *(void **)(a1 + 32);
  objc_msgSend(v5, "suggestion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_searchResultIdentifierForSuggestion:recent:", v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIdentifier:", v14);

  objc_msgSend(v7, "setResultBundleId:", CFSTR("com.apple.hashtagimages.categorylist.categories.category"));
  objc_msgSend(v7, "setSectionBundleIdentifier:", CFSTR("com.apple.hashtagimages.categorylist.categories"));
  objc_msgSend(v5, "prediction");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    v16 = 15;
  else
    v16 = 17;
  objc_msgSend(v7, "setType:", v16);
  -[STSCategoryResult setSearchResult:](v17, "setSearchResult:", v7);
  if (a3 <= 0xF)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "addObject:", v17);
  }

}

- (void)clearButton:(id)a3 pressedForCategoryResult:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  id v23;
  _QWORD v24[5];

  v5 = a3;
  +[STSAlertController alertControllerWithTitle:message:preferredStyle:](STSAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemPinkColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v8);

  v9 = (void *)MEMORY[0x24BEBD3A8];
  STSLocalizedString(CFSTR("CLEAR_RECENTS_ACTION_TITLE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __66__STSCategoryViewController_clearButton_pressedForCategoryResult___block_invoke;
  v24[3] = &unk_24E745A48;
  v24[4] = self;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 0, v24);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BEBD3A8];
  STSLocalizedString(CFSTR("CANCEL"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11;
  v20 = 3221225472;
  v21 = __66__STSCategoryViewController_clearButton_pressedForCategoryResult___block_invoke_2;
  v22 = &unk_24E745A48;
  v23 = v6;
  v15 = v6;
  objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 1, &v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "addAction:", v12, v19, v20, v21, v22);
  objc_msgSend(v15, "addAction:", v16);
  objc_msgSend(v15, "setModalPresentationStyle:", 7);
  objc_msgSend(v15, "popoverPresentationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v17, "setSourceRect:");

  objc_msgSend(v15, "popoverPresentationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSourceView:", v5);

  -[STSCategoryViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, 0);
}

uint64_t __66__STSCategoryViewController_clearButton_pressedForCategoryResult___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_commitClearRecents");
}

uint64_t __66__STSCategoryViewController_clearButton_pressedForCategoryResult___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_commitClearRecents
{
  NSArray *recents;
  void *v4;
  void *v5;
  id WeakRetained;

  recents = self->_recents;
  self->_recents = (NSArray *)MEMORY[0x24BDBD1A8];

  -[STSCategoryViewController updateModel](self, "updateModel");
  -[STSCategoryViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

  -[STSCategoryViewController sendRankSectionsFeedback](self, "sendRankSectionsFeedback");
  -[STSCategoryViewController sendVisibleResultsFeedback](self, "sendVisibleResultsFeedback");
  WeakRetained = objc_loadWeakRetained((id *)&self->_selectionDelegate);
  objc_msgSend(WeakRetained, "categoryViewControllerDidSelectClearRecentsButton:", self);

}

- (void)updateRecents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") < 4)
  {
    v5 = (void *)objc_msgSend(v4, "copy");
  }
  else
  {
    objc_msgSend(v4, "subarrayWithRange:", 0, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7 = objc_msgSend(v5, "count");
  if (v7 == -[NSArray count](self->_recents, "count"))
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __43__STSCategoryViewController_updateRecents___block_invoke;
    v10[3] = &unk_24E745820;
    v10[4] = self;
    v10[5] = &v11;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);
    if (!*((_BYTE *)v12 + 24))
      goto LABEL_9;
  }
  else
  {
    *((_BYTE *)v12 + 24) = 1;
  }
  objc_storeStrong((id *)&self->_recents, v6);
  -[STSCategoryViewController updateModel](self, "updateModel");
LABEL_9:
  -[STSCategoryViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reloadData");

  _Block_object_dispose(&v11, 8);
}

void __43__STSCategoryViewController_updateRecents___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 1016);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v6, "isEqualToString:", v7);

  if ((v5 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

- (void)reload
{
  void *v2;
  id v3;

  -[STSCategoryViewController view](self, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id WeakRetained;

  self->_isScrolling = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_selectionDelegate);
  objc_msgSend(WeakRetained, "categoryViewControllerScrollViewWillBeginDragging:", self);

  -[STSCategoryViewController _reportFeedbackDisplayedResultsDidScroll:](self, "_reportFeedbackDisplayedResultsDidScroll:", 0);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  self->_isScrolling = 0;
}

- (id)_searchResultIdentifierForSuggestion:(id)a3 recent:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  const __CFString *v6;
  void *v7;

  v4 = a4;
  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    if (v4)
      v6 = CFSTR("msgscat-recent:%@");
    else
      v6 = CFSTR("msgscat-cat:%@");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)sendRankSectionsFeedback
{
  id v3;
  id v4;
  NSMutableArray *model;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  model = self->_model;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __53__STSCategoryViewController_sendRankSectionsFeedback__block_invoke;
  v9[3] = &unk_24E745870;
  v10 = v3;
  v11 = v4;
  v6 = v4;
  v8 = v3;
  -[NSMutableArray enumerateObjectsUsingBlock:](model, "enumerateObjectsUsingBlock:", v9);
  +[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didLoadCategoryResults:recents:queryId:", v6, v8, -[STSSearchModel categoryListRequestQueryId](self->_searchModel, "categoryListRequestQueryId"));

}

void __53__STSCategoryViewController_sendRankSectionsFeedback__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "type") != 2)
  {
    if (objc_msgSend(v5, "type"))
      v3 = *(void **)(a1 + 40);
    else
      v3 = *(void **)(a1 + 32);
    objc_msgSend(v5, "searchResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

- (void)sendVisibleResultsFeedback
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  -[STSCategoryViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForVisibleRows");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__STSCategoryViewController_sendVisibleResultsFeedback__block_invoke;
  v9[3] = &unk_24E745898;
  v9[4] = self;
  v6 = v5;
  v10 = v6;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);
  if (objc_msgSend(v6, "count"))
  {
    +[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didShowResults:scrolling:", v6, 0);

  }
}

void __55__STSCategoryViewController_sendVisibleResultsFeedback__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "objectAtIndex:", objc_msgSend(a2, "row"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "type") != 2)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(v5, "searchResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

- (void)_reportFeedbackDisplayedResultsDidScroll:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  if (-[NSMutableArray count](self->_displayedResults, "count"))
  {
    +[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)-[NSMutableArray copy](self->_displayedResults, "copy");
    objc_msgSend(v5, "didShowResults:scrolling:", v6, v3);

    -[NSMutableArray removeAllObjects](self->_displayedResults, "removeAllObjects");
  }
}

- (STSSearchModel)searchModel
{
  return self->_searchModel;
}

- (void)setSearchModel:(id)a3
{
  objc_storeStrong((id *)&self->_searchModel, a3);
}

- (STSCategoryViewControllerDelegate)selectionDelegate
{
  return (STSCategoryViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_selectionDelegate);
}

- (void)setSelectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_selectionDelegate, a3);
}

- (BOOL)sendFeedbackOnViewDidAppear
{
  return self->_sendFeedbackOnViewDidAppear;
}

- (void)setSendFeedbackOnViewDidAppear:(BOOL)a3
{
  self->_sendFeedbackOnViewDidAppear = a3;
}

- (NSArray)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
  objc_storeStrong((id *)&self->_categories, a3);
}

- (NSArray)recents
{
  return self->_recents;
}

- (void)setRecents:(id)a3
{
  objc_storeStrong((id *)&self->_recents, a3);
}

- (NSMutableArray)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_recents, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_destroyWeak((id *)&self->_selectionDelegate);
  objc_storeStrong((id *)&self->_searchModel, 0);
  objc_storeStrong((id *)&self->_displayedResults, 0);
}

@end
