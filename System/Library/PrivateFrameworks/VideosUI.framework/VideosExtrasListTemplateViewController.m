@implementation VideosExtrasListTemplateViewController

- (VideosExtrasListTemplateViewController)initWithDocument:(id)a3 options:(id)a4 context:(id)a5
{
  VideosExtrasListTemplateViewController *v5;
  uint64_t v6;
  NSMapTable *relatedContentViewControllerMap;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  VideosExtrasListTemplateViewController *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)VideosExtrasListTemplateViewController;
  v5 = -[VideosExtrasTemplateViewController initWithDocument:options:context:](&v14, sel_initWithDocument_options_context_, a3, a4, a5);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v6 = objc_claimAutoreleasedReturnValue();
    relatedContentViewControllerMap = v5->_relatedContentViewControllerMap;
    v5->_relatedContentViewControllerMap = (NSMapTable *)v6;

    -[VideosExtrasListTemplateViewController templateElement](v5, "templateElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "list");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __75__VideosExtrasListTemplateViewController_initWithDocument_options_context___block_invoke;
    v12[3] = &unk_1E9FA3748;
    v13 = v5;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v12);

  }
  return v5;
}

void __75__VideosExtrasListTemplateViewController_initWithDocument_options_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend(a2, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__VideosExtrasListTemplateViewController_initWithDocument_options_context___block_invoke_2;
  v8[3] = &unk_1E9FA3720;
  v9 = *(id *)(a1 + 32);
  v10 = a3;
  v11 = a4;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

}

void __75__VideosExtrasListTemplateViewController_initWithDocument_options_context___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(a2, "autoHighlightIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, *(_QWORD *)(a1 + 40));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 1080);
    *(_QWORD *)(v9 + 1080) = v8;

    *a4 = 1;
    **(_BYTE **)(a1 + 48) = 1;
  }
}

- (void)dealloc
{
  objc_super v3;

  -[UITableView setDataSource:](self->_tableView, "setDataSource:", 0);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)VideosExtrasListTemplateViewController;
  -[VideosExtrasTemplateViewController dealloc](&v3, sel_dealloc);
}

- (id)templateElement
{
  void *v2;
  void *v3;

  -[VideosExtrasTemplateViewController document](self, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "templateElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)showsPlaceholder
{
  return 0;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  UIImageView *v15;
  UIImageView *vignetteView;
  void *v17;
  UIImageView *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  VideosExtrasTableView *v23;
  UITableView *v24;
  UITableView *tableView;
  UITableView *v26;
  void *v27;
  UITableView *v28;
  void *v29;
  UITableView *v30;
  id v31;
  void *v32;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)VideosExtrasListTemplateViewController;
  -[VideosExtrasTemplateViewController viewDidLoad](&v33, sel_viewDidLoad);
  -[VideosExtrasListTemplateViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasListTemplateViewController templateElement](self, "templateElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "elementAlignment");

  self->_tableViewLeft = v6 == 1;
  -[VideosExtrasListTemplateViewController templateElement](self, "templateElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "background");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[VideosExtrasListTemplateViewController templateElement](self, "templateElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "documentBanner");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = v11;
  if (v8)
    objc_msgSend(v11, "addObject:", v8);
  objc_msgSend(v10, "background");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v10, "background");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v14);

  }
  -[VideosExtrasTemplateViewController configureBackgroundWithElements:](self, "configureBackgroundWithElements:", v12);
  -[VideosExtrasListTemplateViewController _configureBannerWithElement:](self, "_configureBannerWithElement:", v10);
  v15 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
  vignetteView = self->_vignetteView;
  self->_vignetteView = v15;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_vignetteView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v17 = (void *)MEMORY[0x1E0CB3718];
  v18 = self->_vignetteView;
  -[VideosExtrasListTemplateViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintsByAttachingView:toView:alongEdges:insets:", v18, v19, 15, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[VideosExtrasListTemplateViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", self->_vignetteView);

  -[VideosExtrasListTemplateViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addConstraints:", v20);

  v23 = [VideosExtrasTableView alloc];
  v24 = -[VideosExtrasTableView initWithFrame:style:](v23, "initWithFrame:style:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  tableView = self->_tableView;
  self->_tableView = v24;

  -[UITableView _setHeaderAndFooterViewsFloat:](self->_tableView, "_setHeaderAndFooterViewsFloat:", 0);
  -[UITableView setSeparatorStyle:](self->_tableView, "setSeparatorStyle:", 1);
  v26 = self->_tableView;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView setSeparatorColor:](v26, "setSeparatorColor:", v27);

  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("ListTableViewCell"));
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  v28 = self->_tableView;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView setBackgroundColor:](v28, "setBackgroundColor:", v29);

  -[UITableView setShowsHorizontalScrollIndicator:](self->_tableView, "setShowsHorizontalScrollIndicator:", 0);
  -[UITableView setShowsVerticalScrollIndicator:](self->_tableView, "setShowsVerticalScrollIndicator:", 0);
  v30 = self->_tableView;
  v31 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[UITableView setTableFooterView:](v30, "setTableFooterView:", v31);

  -[UITableView _setContentInsetAdjustmentBehavior:](self->_tableView, "_setContentInsetAdjustmentBehavior:", 2);
  -[UITableView setEstimatedRowHeight:](self->_tableView, "setEstimatedRowHeight:", 60.0);
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4028]), "initWithPrivateStyle:", 2030);
  objc_msgSend(v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITableView setBackgroundView:](self->_tableView, "setBackgroundView:", v32);
  objc_msgSend(v3, "addSubview:", self->_tableView);

}

- (void)_addConstraintsToTableView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *masterViewConstraints;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  NSArray *v31;
  id v32;

  v32 = a3;
  -[VideosExtrasListTemplateViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self->_masterViewConstraints)
    objc_msgSend(v4, "removeConstraints:");
  if (-[VideosExtrasElementViewController isWide](self, "isWide"))
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsBySizingView:toSize:", v32, 305.0, 500.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_tableViewLeft)
      v7 = 4;
    else
      v7 = 5;
    v8 = (void *)MEMORY[0x1E0D3A780];
    UIEdgeInsetsMakeWithEdges();
    objc_msgSend(v8, "positionConstraintsForView:insets:position:", v32, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v32, 10, 0, v5, 10, 1.0, 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayByAddingObject:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v11);
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    masterViewConstraints = self->_masterViewConstraints;
    self->_masterViewConstraints = v12;

    objc_msgSend(v32, "setContentInset:", 0.0, 0.0, 60.0, 0.0);
  }
  else
  {
    v15 = *MEMORY[0x1E0DC49E8];
    v14 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v17 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v16 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsByAttachingView:toView:alongEdges:insets:", v32, v5, 13, *MEMORY[0x1E0DC49E8], v14, v17, v16);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasListTemplateViewController navigationController](self, "navigationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) != 0)
    {
      -[VideosExtrasListTemplateViewController navigationController](self, "navigationController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "mainTemplateViewController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "bounds");
      v24 = v23;

      v17 = 60.0;
      if (v24 > 60.0)
      {
        objc_msgSend(v21, "menuBarView");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "bounds");
        v27 = v26;

        v17 = fmax(v27, 60.0);
      }

    }
    objc_msgSend(v32, "setContentInset:", v15, v14, v17, v16);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bounds");
    if (v29 > 480.0)
      v30 = 0.4;
    else
      v30 = 0.5;

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v32, 7, 0, v5, 7, v30, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayByAddingObject:", v11);
    v31 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v10 = self->_masterViewConstraints;
    self->_masterViewConstraints = v31;
  }

  objc_msgSend(v5, "addConstraints:", self->_masterViewConstraints);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  -[VideosExtrasListTemplateViewController templateElement](self, "templateElement", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "list");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;

  -[VideosExtrasListTemplateViewController templateElement](self, "templateElement", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "list");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("ListTableViewCell"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "section");
  v10 = objc_msgSend(v7, "row");
  -[VideosExtrasListTemplateViewController templateElement](self, "templateElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "list");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sections");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 >= objc_msgSend(v13, "count"))
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(v13, "objectAtIndex:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v14, "items");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 < objc_msgSend(v15, "count"))
  {
    objc_msgSend(v15, "objectAtIndex:", v10);
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)v16;
      objc_msgSend(v8, "configureForListItemLockupElement:wide:", v16, -[VideosExtrasElementViewController isWide](self, "isWide"));

    }
  }
  objc_msgSend(v6, "indexPathForSelectedRow");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v7, "isEqual:", v18);

  objc_msgSend(v8, "setSelected:animated:", v19, 0);
  return v8;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  objc_msgSend(a4, "updateConstraintsIfNeeded", a3);
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;

  v6 = a3;
  if (tableView_heightForHeaderInSection__onceToken != -1)
    dispatch_once(&tableView_heightForHeaderInSection__onceToken, &__block_literal_global_142);
  -[VideosExtrasListTemplateViewController templateElement](self, "templateElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "list");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count") <= a4)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v9, "objectAtIndex:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "header");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  if (v14)
  {
    objc_msgSend((id)tableView_heightForHeaderInSection__headerView, "configureForHeaderElement:", v11);
    objc_msgSend((id)tableView_heightForHeaderInSection__headerView, "intrinsicContentSize");
    v16 = v15;
  }
  else
  {
    v16 = 0.0;
  }

  return v16;
}

void __77__VideosExtrasListTemplateViewController_tableView_heightForHeaderInSection___block_invoke()
{
  VideosExtrasTableViewHeaderView *v0;
  void *v1;

  v0 = -[VideosExtrasTableViewHeaderView initWithReuseIdentifier:]([VideosExtrasTableViewHeaderView alloc], "initWithReuseIdentifier:", CFSTR("ListTableViewHeaderLayout"));
  v1 = (void *)tableView_heightForHeaderInSection__headerView;
  tableView_heightForHeaderInSection__headerView = (uint64_t)v0;

}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  VideosExtrasTableViewHeaderView *v12;

  v6 = a3;
  -[VideosExtrasListTemplateViewController templateElement](self, "templateElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "list");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count") <= a4)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v9, "objectAtIndex:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "header");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("ListTableViewHeader"));
    v12 = (VideosExtrasTableViewHeaderView *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      v12 = -[VideosExtrasTableViewHeaderView initWithReuseIdentifier:]([VideosExtrasTableViewHeaderView alloc], "initWithReuseIdentifier:", CFSTR("ListTableViewHeader"));
    -[VideosExtrasTableViewHeaderView configureForHeaderElement:](v12, "configureForHeaderElement:", v11);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)tableView:(id)a3 didHighlightRowAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a4;
  v6 = objc_msgSend(v5, "section");
  v7 = objc_msgSend(v5, "row");

  -[VideosExtrasListTemplateViewController templateElement](self, "templateElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "list");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sections");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 >= objc_msgSend(v13, "count"))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v13, "objectAtIndex:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 < objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "objectAtIndex:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 4, 1, 0, 0, 0);

  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  v5 = objc_msgSend(v16, "section");
  v6 = objc_msgSend(v16, "row");
  -[VideosExtrasListTemplateViewController templateElement](self, "templateElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "list");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 >= objc_msgSend(v9, "count"))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v9, "objectAtIndex:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 >= objc_msgSend(v11, "count"))
  {
    v13 = 0;
    v12 = 0;
  }
  else
  {
    objc_msgSend(v11, "objectAtIndex:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "relatedContent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      if (-[VideosExtrasElementViewController isWide](self, "isWide"))
        v14 = v16;
      else
        v14 = 0;
      objc_storeStrong((id *)&self->_autohighlightIndexPath, v14);
      objc_msgSend((id)objc_opt_class(), "relatedContentViewControllerForElement:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](self->_relatedContentViewControllerMap, "setObject:forKey:", v15, v12);
      -[VideosExtrasListTemplateViewController setRelatedContentViewController:](self, "setRelatedContentViewController:", v15);

    }
  }
  objc_msgSend(v12, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 0, 0, 0);

}

- (BOOL)shouldUpdateByReplacingViewControllerWithTemplate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unsigned __int8 v8;
  objc_super v10;

  v4 = a3;
  v5 = objc_opt_class();
  -[VideosExtrasListTemplateViewController templateElement](self, "templateElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();

  if (v5 == v7)
  {
    -[VideosExtrasListTemplateViewController _updateForTemplate:](self, "_updateForTemplate:", v4);
    v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VideosExtrasListTemplateViewController;
    v8 = -[VideosExtrasListTemplateViewController shouldReplaceViewControllerWithNewTemplate:](&v10, sel_shouldReplaceViewControllerWithNewTemplate_, v4);
  }

  return v8;
}

- (void)_updateForTemplate:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  uint64_t v16;
  void *v18;
  void *v19;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "updateType") == 1)
  {
    v20 = v4;
    objc_msgSend(v4, "list");
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sections");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v27 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (objc_msgSend(v9, "updateType") == 1)
          {
            v24 = 0u;
            v25 = 0u;
            v22 = 0u;
            v23 = 0u;
            objc_msgSend(v9, "items");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            if (v11)
            {
              v12 = v11;
              v13 = *(_QWORD *)v23;
              do
              {
                for (j = 0; j != v12; ++j)
                {
                  if (*(_QWORD *)v23 != v13)
                    objc_enumerationMutation(v10);
                  v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
                  v16 = objc_msgSend(v15, "updateType");
                  if (v16 == 4 || v16 == 1)
                  {
                    objc_msgSend(v15, "relatedContent");
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    -[VideosExtrasListTemplateViewController _updateRelatedContent:forListItem:](self, "_updateRelatedContent:forListItem:", v18, v15);

                  }
                }
                v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
              }
              while (v12);
            }

          }
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v6);
    }

    v4 = v20;
  }

}

- (void)_updateRelatedContent:(id)a3 forListItem:(id)a4
{
  NSMapTable *relatedContentViewControllerMap;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  relatedContentViewControllerMap = self->_relatedContentViewControllerMap;
  v7 = a4;
  v8 = a3;
  -[NSMapTable objectForKey:](relatedContentViewControllerMap, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasListTemplateViewController relatedContentViewController](self, "relatedContentViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "relatedContentViewControllerForElement:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMapTable setObject:forKey:](self->_relatedContentViewControllerMap, "setObject:forKey:", v11, v7);
  if (v9 == v10)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __76__VideosExtrasListTemplateViewController__updateRelatedContent_forListItem___block_invoke;
    v12[3] = &unk_1E9F98FD8;
    v12[4] = self;
    v13 = v11;
    dispatch_async(MEMORY[0x1E0C80D38], v12);

  }
}

uint64_t __76__VideosExtrasListTemplateViewController__updateRelatedContent_forListItem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRelatedContentViewController:", *(_QWORD *)(a1 + 40));
}

- (void)_configureBannerWithElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VideosExtrasListTemplateViewController;
  -[VideosExtrasElementViewController _configureBannerWithElement:](&v11, sel__configureBannerWithElement_, a3);
  -[VideosExtrasListTemplateViewController title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[VideosExtrasListTemplateViewController templateElement](self, "templateElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "list");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "header");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[VideosExtrasListTemplateViewController setTitle:](self, "setTitle:", v10);
  }
}

- (void)_setRelatedContentEmbedded:(BOOL)a3
{
  if (self->_relatedContentEmbedded != a3)
  {
    if (self->_relatedContentViewController)
    {
      if (a3)
      {
        -[VideosExtrasListTemplateViewController _embedRelatedContentViewController](self, "_embedRelatedContentViewController");
      }
      else
      {
        -[VideosExtrasListTemplateViewController _unembedRelatedContent](self, "_unembedRelatedContent");
        -[VideosExtrasListTemplateViewController _pushRelatedViewController:animated:](self, "_pushRelatedViewController:animated:", self->_relatedContentViewController, 0);
      }
    }
    self->_relatedContentEmbedded = a3;
  }
}

- (void)setRelatedContentViewController:(id)a3
{
  VideosExtrasViewElementViewController *v5;
  VideosExtrasViewElementViewController **p_relatedContentViewController;
  VideosExtrasViewElementViewController *relatedContentViewController;
  void *v8;
  id v9;
  VideosExtrasViewElementViewController *v10;
  VideosExtrasViewElementViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  VideosExtrasViewElementViewController *v20;

  v5 = (VideosExtrasViewElementViewController *)a3;
  p_relatedContentViewController = &self->_relatedContentViewController;
  relatedContentViewController = self->_relatedContentViewController;
  v20 = v5;
  if (relatedContentViewController != v5)
  {
    if (relatedContentViewController)
    {
      if (self->_relatedContentEmbedded)
      {
        -[VideosExtrasListTemplateViewController _unembedRelatedContent](self, "_unembedRelatedContent");
      }
      else if (v5)
      {
        -[VideosExtrasListTemplateViewController navigationController](self, "navigationController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (id)objc_msgSend(v8, "popViewControllerAnimated:", 0);

      }
    }
    objc_storeStrong((id *)&self->_relatedContentViewController, a3);
    v10 = *p_relatedContentViewController;
    if (self->_relatedContentEmbedded)
    {
      if (v10)
        -[VideosExtrasListTemplateViewController _embedRelatedContentViewController](self, "_embedRelatedContentViewController");
    }
    else if (v10)
    {
      v11 = v20;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[VideosExtrasListTemplateViewController templateElement](self, "templateElement");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "background");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        -[VideosExtrasListTemplateViewController templateElement](self, "templateElement");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "documentBanner");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v17 = v16;
        if (v13)
          objc_msgSend(v16, "addObject:", v13);
        objc_msgSend(v15, "background");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v15, "background");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v19);

        }
        -[VideosExtrasElementViewController configureBackgroundWithElements:](v11, "configureBackgroundWithElements:", v17);

      }
      -[VideosExtrasListTemplateViewController _pushRelatedViewController:animated:](self, "_pushRelatedViewController:animated:", *p_relatedContentViewController, 1);

    }
  }

}

- (void)_embedRelatedContentViewController
{
  void *v3;
  void *v4;
  id v5;

  -[VideosExtrasViewElementViewController setEmbedded:](self->_relatedContentViewController, "setEmbedded:", 1);
  -[VideosExtrasListTemplateViewController addChildViewController:](self, "addChildViewController:", self->_relatedContentViewController);
  -[VideosExtrasListTemplateViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasViewElementViewController view](self->_relatedContentViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "addSubview:", v3);
  -[VideosExtrasListTemplateViewController _setDetailContraints](self, "_setDetailContraints");
  -[VideosExtrasViewElementViewController didMoveToParentViewController:](self->_relatedContentViewController, "didMoveToParentViewController:", self);
  -[VideosExtrasElementViewController backgroundViewController](self, "backgroundViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVignetteType:", 3);

}

- (void)_pushRelatedViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  NSArray *v10;
  NSArray *detailViewConstraints;
  void *v12;
  void *v13;
  id v14;

  v4 = a4;
  v6 = (objc_class *)MEMORY[0x1E0DC3F20];
  v7 = a3;
  v14 = (id)objc_msgSend([v6 alloc], "initWithNibName:bundle:", 0, 0);
  objc_msgSend(v14, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addChildViewController:", v7);
  objc_msgSend(v8, "addSubview:", v9);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsByAttachingView:toView:alongEdges:insets:", v9, v8, 15, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
  detailViewConstraints = self->_detailViewConstraints;
  self->_detailViewConstraints = v10;

  objc_msgSend(v8, "addConstraints:", self->_detailViewConstraints);
  objc_msgSend(v7, "didMoveToParentViewController:", v14);
  objc_msgSend(v7, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setTitle:", v12);
  -[VideosExtrasListTemplateViewController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pushViewController:animated:", v14, v4);

}

- (void)_unembedRelatedContent
{
  void *v3;
  NSArray *detailViewConstraints;
  id v5;

  -[VideosExtrasViewElementViewController view](self->_relatedContentViewController, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasViewElementViewController willMoveToParentViewController:](self->_relatedContentViewController, "willMoveToParentViewController:", 0);
  -[VideosExtrasListTemplateViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeConstraints:", self->_detailViewConstraints);

  objc_msgSend(v5, "removeFromSuperview");
  detailViewConstraints = self->_detailViewConstraints;
  self->_detailViewConstraints = 0;

  -[VideosExtrasViewElementViewController removeFromParentViewController](self->_relatedContentViewController, "removeFromParentViewController");
  -[VideosExtrasViewElementViewController setEmbedded:](self->_relatedContentViewController, "setEmbedded:", 0);

}

- (void)_setDetailContraints
{
  void *v3;
  UITableView *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  UITableView *v8;
  UITableView *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSArray *v19;
  NSArray *detailViewConstraints;
  void *v21;
  void *v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  -[VideosExtrasViewElementViewController view](self->_relatedContentViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_tableView;
  if (self->_detailViewConstraints)
  {
    -[VideosExtrasListTemplateViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeConstraints:", self->_detailViewConstraints);

  }
  if (self->_tableViewLeft)
    v6 = 5;
  else
    v6 = 4;
  v7 = (void *)MEMORY[0x1E0D3A780];
  UIEdgeInsetsMakeWithEdges();
  objc_msgSend(v7, "positionConstraintsForView:insets:position:", v3, v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[VideosExtrasViewElementViewController matchParentHeight](self->_relatedContentViewController, "matchParentHeight"))
  {
    v8 = v4;
    v9 = v4;
  }
  else
  {
    -[VideosExtrasListTemplateViewController view](self, "view");
    v9 = v4;
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safeAreaLayoutGuide");
    v8 = (UITableView *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 4, 0, v8, 4, 1.0, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasViewElementViewController preferredLayoutGuide](self->_relatedContentViewController, "preferredLayoutGuide");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[VideosExtrasViewElementViewController preferredLayoutAttribute](self->_relatedContentViewController, "preferredLayoutAttribute");
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, v13, 0, v9, 3, 1.0, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_tableViewLeft)
    v15 = 1;
  else
    v15 = 2;
  if (self->_tableViewLeft)
    v16 = 2;
  else
    v16 = 1;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, v15, 0, v9, v16, 1.0, dbl_1DA1C2910[!self->_tableViewLeft]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v11;
  v23[1] = v14;
  v23[2] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "arrayByAddingObjectsFromArray:", v18);
  v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
  detailViewConstraints = self->_detailViewConstraints;
  self->_detailViewConstraints = v19;

  -[VideosExtrasListTemplateViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addConstraints:", self->_detailViewConstraints);

}

- (void)_prepareLayout
{
  VideosExtrasViewElementViewController *relatedContentViewController;
  NSIndexPath *autohighlightIndexPath;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)VideosExtrasListTemplateViewController;
  -[VideosExtrasElementViewController _prepareLayout](&v15, sel__prepareLayout);
  -[VideosExtrasListTemplateViewController _setRelatedContentEmbedded:](self, "_setRelatedContentEmbedded:", -[VideosExtrasElementViewController isWide](self, "isWide"));
  if (!self->_relatedContentEmbedded)
  {
    relatedContentViewController = self->_relatedContentViewController;
    self->_relatedContentViewController = 0;

  }
  -[VideosExtrasListTemplateViewController _addConstraintsToTableView:](self, "_addConstraintsToTableView:", self->_tableView);
  -[VideosExtrasListTemplateViewController _configureVignette:](self, "_configureVignette:", -[VideosExtrasElementViewController isWide](self, "isWide"));
  -[UITableView reloadData](self->_tableView, "reloadData");
  if (!-[VideosExtrasElementViewController isWide](self, "isWide"))
  {
    autohighlightIndexPath = self->_autohighlightIndexPath;
    self->_autohighlightIndexPath = 0;

  }
  if (self->_autohighlightIndexPath)
  {
    -[VideosExtrasListTemplateViewController templateElement](self, "templateElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "list");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[NSIndexPath section](self->_autohighlightIndexPath, "section");
    if (v8 < objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "objectAtIndex:", -[NSIndexPath section](self->_autohighlightIndexPath, "section"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "items");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = -[NSIndexPath row](self->_autohighlightIndexPath, "row");
      if (v11 < objc_msgSend(v10, "count"))
      {
        objc_msgSend(v10, "objectAtIndex:", -[NSIndexPath row](self->_autohighlightIndexPath, "row"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "relatedContent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend((id)objc_opt_class(), "relatedContentViewControllerForElement:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMapTable setObject:forKey:](self->_relatedContentViewControllerMap, "setObject:forKey:", v14, v12);
          -[VideosExtrasListTemplateViewController setRelatedContentViewController:](self, "setRelatedContentViewController:", v14);

        }
        -[UITableView selectRowAtIndexPath:animated:scrollPosition:](self->_tableView, "selectRowAtIndexPath:animated:scrollPosition:", self->_autohighlightIndexPath, 0, 0);

      }
    }

  }
}

- (void)_configureVignette:(BOOL)a3
{
  uint64_t v3;
  id v4;

  if (self->_relatedContentEmbedded)
  {
    if (self->_relatedContentViewController)
      v3 = 3;
    else
      v3 = 1;
  }
  else
  {
    v3 = 1;
  }
  -[VideosExtrasElementViewController backgroundViewController](self, "backgroundViewController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVignetteType:", v3);

}

+ (id)relatedContentViewControllerForElement:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;

  v3 = a3;
  if (relatedContentViewControllerForElement__onceToken != -1)
    dispatch_once(&relatedContentViewControllerForElement__onceToken, &__block_literal_global_41_0);
  v4 = (void *)relatedContentViewControllerForElement__templateMap;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)(id)objc_msgSend(v4, "objectForKey:", v6);

  if (!v7)
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Could not get viewcontroller class for %@"), v12);
    goto LABEL_7;
  }
  v7 = (objc_class *)objc_msgSend([v7 alloc], "initWithViewElement:", v3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v7;
    +[VideosExtrasGridElementViewController wideDetailStyle](VideosExtrasGridElementViewController, "wideDetailStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class setWideStyle:](v7, "setWideStyle:", v8);

    +[VideosExtrasGridElementViewController smallDetailStyle](VideosExtrasGridElementViewController, "smallDetailStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class setSmallStyle:](v7, "setSmallStyle:", v9);

    +[VideosExtrasGridElementViewController mediumDetailStyle](VideosExtrasGridElementViewController, "mediumDetailStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class setMediumStyle:](v7, "setMediumStyle:", v10);

    +[VideosExtrasGridElementViewController largeDetailStyle](VideosExtrasGridElementViewController, "largeDetailStyle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class setLargeStyle:](v7, "setLargeStyle:", v11);

    +[VideosExtrasGridElementViewController extraLargeDetailStyle](VideosExtrasGridElementViewController, "extraLargeDetailStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class setExtraLargeStyle:](v7, "setExtraLargeStyle:", v12);

LABEL_7:
  }

  return v7;
}

void __81__VideosExtrasListTemplateViewController_relatedContentViewControllerForElement___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("IKGridElement");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("IKLockupElement");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("IKActivityIndicatorElement");
  v3[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)relatedContentViewControllerForElement__templateMap;
  relatedContentViewControllerForElement__templateMap = v0;

}

- (VideosExtrasViewElementViewController)relatedContentViewController
{
  return self->_relatedContentViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedContentViewController, 0);
  objc_storeStrong((id *)&self->_autohighlightIndexPath, 0);
  objc_storeStrong((id *)&self->_relatedContentViewControllerMap, 0);
  objc_storeStrong((id *)&self->_detailViewConstraints, 0);
  objc_storeStrong((id *)&self->_masterViewConstraints, 0);
  objc_storeStrong((id *)&self->_vignetteView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
