@implementation STSZKWBrowserHeaderView

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  id v4;
  _BOOL4 writingInSearchBar;
  _QWORD block[5];

  v4 = a3;
  writingInSearchBar = self->_writingInSearchBar;
  if (!self->_writingInSearchBar
    && -[STSSearchBar isUserInteractionEnabled](self->_searchBar, "isUserInteractionEnabled"))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__STSZKWBrowserHeaderView_searchBarShouldBeginEditing___block_invoke;
    block[3] = &unk_24E7457A8;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

  return writingInSearchBar;
}

uint64_t __55__STSZKWBrowserHeaderView_searchBarShouldBeginEditing___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setUserInteractionEnabled:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_searchButtonPressed:", 0);
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  -[STSZKWBrowserHeaderView _cancelButtonPressed:](self, "_cancelButtonPressed:", 0);
}

- (STSZKWBrowserHeaderView)init
{
  STSZKWBrowserHeaderView *v2;
  void *v3;
  uint64_t v4;
  NSMutableArray *topZKWButtons;
  uint64_t v6;
  NSMutableArray *bottomZKWButtons;
  STSSearchBar *v8;
  STSSearchBar *searchBar;
  void *v10;
  void *v11;
  STSSearchBar *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSMutableArray *searchBarConstraints;
  void *v23;
  uint64_t v24;
  STSZKWBrowserHeaderView *v25;
  NSMutableArray *v26;
  void *v27;
  STSZKWBrowserHeaderView *v28;
  void *v29;
  void *v30;
  NSMutableArray *v31;
  void *v32;
  STSZKWBrowserHeaderView *v33;
  void *v34;
  void *v35;
  id v36;
  void *v38;
  objc_super v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v39.receiver = self;
  v39.super_class = (Class)STSZKWBrowserHeaderView;
  v2 = -[STSZKWBrowserHeaderView init](&v39, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "sts_defaultBackgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSZKWBrowserHeaderView setBackgroundColor:](v2, "setBackgroundColor:", v3);

    -[STSZKWBrowserHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    topZKWButtons = v2->_topZKWButtons;
    v2->_topZKWButtons = (NSMutableArray *)v4;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    bottomZKWButtons = v2->_bottomZKWButtons;
    v2->_bottomZKWButtons = (NSMutableArray *)v6;

    v8 = objc_alloc_init(STSSearchBar);
    searchBar = v2->_searchBar;
    v2->_searchBar = v8;

    -[STSSearchBar setDelegate:](v2->_searchBar, "setDelegate:", v2);
    -[STSSearchBar setStsDelegate:](v2->_searchBar, "setStsDelegate:", v2);
    -[STSSearchBar searchTextField](v2->_searchBar, "searchTextField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", v2);

    -[STSSearchBar setStsDelegate:](v2->_searchBar, "setStsDelegate:", v2);
    -[STSSearchBar setTranslatesAutoresizingMaskIntoConstraints:](v2->_searchBar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[STSSearchBar _setDisableDictationButton:](v2->_searchBar, "_setDisableDictationButton:", 1);
    -[STSSearchBar searchField](v2->_searchBar, "searchField");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSSearchBar setSearchBarStyle:](v2->_searchBar, "setSearchBarStyle:", 2);
    v12 = v2->_searchBar;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemPinkColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSSearchBar setTintColor:](v12, "setTintColor:", v13);

    -[STSSearchBar searchTextField](v2->_searchBar, "searchTextField");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "sts_headerZKWSearchButtonAndSearchTextFieldBackgroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v15);

    STSLocalizedString(CFSTR("SEARCHBAR_BUTTON_TITLE"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc(MEMORY[0x24BDD1688]);
    v40 = *MEMORY[0x24BEBB368];
    objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v17, "initWithString:attributes:", v16, v19);

    v38 = v11;
    objc_msgSend(v11, "setAttributedPlaceholder:", v20);
    -[STSZKWBrowserHeaderView addSubview:](v2, "addSubview:", v2->_searchBar);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v21 = objc_claimAutoreleasedReturnValue();
    searchBarConstraints = v2->_searchBarConstraints;
    v2->_searchBarConstraints = (NSMutableArray *)v21;

    -[STSZKWBrowserHeaderView traitCollection](v2, "traitCollection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "horizontalSizeClass");

    -[STSZKWBrowserHeaderView readableContentGuide](v2, "readableContentGuide");
    v25 = (STSZKWBrowserHeaderView *)objc_claimAutoreleasedReturnValue();
    v26 = v2->_searchBarConstraints;
    -[STSSearchBar leadingAnchor](v2->_searchBar, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24 == 2)
      v28 = v25;
    else
      v28 = v2;
    -[STSZKWBrowserHeaderView leadingAnchor](v28, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v26, "addObject:", v30);

    v31 = v2->_searchBarConstraints;
    -[STSSearchBar trailingAnchor](v2->_searchBar, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24 == 2)
      v33 = v25;
    else
      v33 = v2;
    -[STSZKWBrowserHeaderView trailingAnchor](v33, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v31, "addObject:", v35);

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v2->_searchBarConstraints);
    v36 = objc_alloc_init(MEMORY[0x24BDE33D0]);
    objc_msgSend(v36, "setDelegate:", v2);
    objc_msgSend(v36, "setElementSource:", v2);
    -[STSZKWBrowserHeaderView addInteraction:](v2, "addInteraction:", v36);

    -[STSZKWBrowserHeaderView _updateTopStackView:andBottomStackView:](v2, "_updateTopStackView:andBottomStackView:", 1, 1);
  }
  return v2;
}

- (void)clear
{
  id v2;

  -[STSSearchBar searchTextField](self->_searchBar, "searchTextField");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setText:", 0);

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  NSMutableArray *searchBarConstraints;
  void *v7;
  STSZKWBrowserHeaderView *v8;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  void *v12;
  STSZKWBrowserHeaderView *v13;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  void *v17;
  void *v18;
  void *v19;
  STSZKWBrowserHeaderView *v20;

  -[STSZKWBrowserHeaderView traitCollection](self, "traitCollection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "horizontalSizeClass");

  -[STSZKWBrowserHeaderView readableContentGuide](self, "readableContentGuide");
  v20 = (STSZKWBrowserHeaderView *)objc_claimAutoreleasedReturnValue();
  searchBarConstraints = self->_searchBarConstraints;
  -[STSSearchBar leadingAnchor](self->_searchBar, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == 2)
    v8 = v20;
  else
    v8 = self;
  -[STSZKWBrowserHeaderView leadingAnchor](v8, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](searchBarConstraints, "addObject:", v10);

  v11 = self->_searchBarConstraints;
  -[STSSearchBar trailingAnchor](self->_searchBar, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == 2)
    v13 = v20;
  else
    v13 = self;
  -[STSZKWBrowserHeaderView trailingAnchor](v13, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v11, "addObject:", v15);

  v16 = self->_searchBarConstraints;
  -[STSSearchBar topAnchor](self->_searchBar, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSZKWBrowserHeaderView topAnchor](self, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v16, "addObject:", v19);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_searchBarConstraints);
}

- (void)layoutSubviews
{
  double top;
  double left;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGRect *v19;
  CGSize size;
  uint64_t v21;
  uint64_t v22;
  double Width;
  double v24;
  CGFloat v25;
  uint64_t v26;
  double v27;
  double v28;
  NSMutableArray *topZKWButtons;
  uint64_t v30;
  double v31;
  double v32;
  NSMutableArray *bottomZKWButtons;
  _QWORD v34[7];
  _QWORD v35[7];
  CGRect slice;
  uint64_t v37;
  CGRect *v38;
  uint64_t v39;
  void *v40;
  CGRect v41;
  uint64_t v42;
  CGRect *v43;
  uint64_t v44;
  void *v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  -[STSZKWBrowserHeaderView bounds](self, "bounds");
  top = self->_contentInset.top;
  left = self->_contentInset.left;
  v6 = v5 + left;
  v8 = v7 + top;
  v10 = v9 - (left + self->_contentInset.right);
  v12 = v11 - (top + self->_contentInset.bottom);
  v13 = -[NSMutableArray count](self->_bottomZKWButtons, "count");
  if (v13)
    v14 = 2;
  else
    v14 = 1;
  if (v13)
    v15 = 6.0;
  else
    v15 = 0.0;
  v47.origin.x = v6;
  v47.origin.y = v8;
  v47.size.width = v10;
  v47.size.height = v12;
  v16 = (CGRectGetHeight(v47) - v15) / (double)v14;
  -[STSSearchBar sizeThatFits:](self->_searchBar, "sizeThatFits:", v10, v12);
  v18 = v17;
  v42 = 0;
  v43 = (CGRect *)&v42;
  v44 = 0x4010000000;
  v45 = &unk_221817A09;
  memset(&v46, 0, sizeof(v46));
  v37 = 0;
  v38 = (CGRect *)&v37;
  v39 = 0x4010000000;
  v40 = &unk_221817A09;
  memset(&v41, 0, sizeof(v41));
  v48.origin.x = v6;
  v48.origin.y = v8;
  v48.size.width = v10;
  v48.size.height = v12;
  CGRectDivide(v48, &v46, &v41, v15 + v16, CGRectMinYEdge);
  v19 = v43;
  v43[1].size.height = v18;
  v38[1].size.height = v18;
  size = v19[1].size;
  slice.origin = v19[1].origin;
  slice.size = size;
  v21 = -[NSMutableArray count](self->_topZKWButtons, "count");
  v22 = MEMORY[0x24BDAC760];
  if (v21)
  {
    Width = CGRectGetWidth(slice);
    -[STSZKWBrowserHeaderView _searchBarWidthFraction](self, "_searchBarWidthFraction");
    CGRectDivide(v43[1], &slice, v43 + 1, Width * v24 + -3.0 + 6.0, CGRectMinXEdge);
    slice.size.width = slice.size.width + -6.0;
    UIFloorToViewScale();
    slice.size.width = v25;
    v26 = -[NSMutableArray count](self->_topZKWButtons, "count");
    v27 = CGRectGetWidth(v43[1]);
    v28 = (double)(unint64_t)-[NSMutableArray count](self->_topZKWButtons, "count");
    topZKWButtons = self->_topZKWButtons;
    v35[0] = v22;
    v35[1] = 3221225472;
    v35[2] = __41__STSZKWBrowserHeaderView_layoutSubviews__block_invoke;
    v35[3] = &unk_24E746000;
    v35[4] = self;
    v35[5] = &v42;
    *(double *)&v35[6] = (v27 + (double)(unint64_t)(v26 - 1) * -6.0) / v28;
    -[NSMutableArray enumerateObjectsUsingBlock:](topZKWButtons, "enumerateObjectsUsingBlock:", v35);
  }
  if (-[NSMutableArray count](self->_bottomZKWButtons, "count"))
  {
    v30 = -[NSMutableArray count](self->_bottomZKWButtons, "count");
    v31 = CGRectGetWidth(v38[1]);
    v32 = (double)(unint64_t)-[NSMutableArray count](self->_bottomZKWButtons, "count");
    bottomZKWButtons = self->_bottomZKWButtons;
    v34[0] = v22;
    v34[1] = 3221225472;
    v34[2] = __41__STSZKWBrowserHeaderView_layoutSubviews__block_invoke_2;
    v34[3] = &unk_24E746000;
    v34[4] = self;
    v34[5] = &v37;
    *(double *)&v34[6] = (v31 + (double)(v30 - 1) * -6.0) / v32;
    -[NSMutableArray enumerateObjectsUsingBlock:](bottomZKWButtons, "enumerateObjectsUsingBlock:", v34);
  }
  -[STSSearchBar setFrame:](self->_searchBar, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v42, 8);
}

void __41__STSZKWBrowserHeaderView_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  id v6;
  double v7;
  CGSize v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CGFloat v13;
  CGFloat v14;
  CGRect v15;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 440);
  v6 = a2;
  if (objc_msgSend(v5, "count") - 1 <= a3)
    v7 = 0.0;
  else
    v7 = 6.0;
  v8 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  v15.origin = (CGPoint)*MEMORY[0x24BDBF090];
  v15.size = v8;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(_QWORD *)(v9 + 32);
  v8.width = *(CGFloat *)(v9 + 40);
  v9 += 32;
  v11 = *(_QWORD *)(v9 + 16);
  v12 = *(_QWORD *)(v9 + 24);
  CGRectDivide(*(CGRect *)((char *)&v8 - 8), &v15, (CGRect *)v9, v7 + *(double *)(a1 + 48), CGRectMinXEdge);
  UIFloorToViewScale();
  v15.origin.x = v13;
  UIFloorToViewScale();
  v15.size.width = v14;
  objc_msgSend(v6, "setFrame:", *(_OWORD *)&v15.origin, __PAIR128__(*(unint64_t *)&v15.size.height, *(unint64_t *)&v14));

}

void __41__STSZKWBrowserHeaderView_layoutSubviews__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  id v6;
  double v7;
  CGSize v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CGFloat v13;
  CGFloat v14;
  CGRect v15;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 448);
  v6 = a2;
  if (objc_msgSend(v5, "count") - 1 <= a3)
    v7 = 0.0;
  else
    v7 = 6.0;
  v8 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  v15.origin = (CGPoint)*MEMORY[0x24BDBF090];
  v15.size = v8;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(_QWORD *)(v9 + 32);
  v8.width = *(CGFloat *)(v9 + 40);
  v9 += 32;
  v11 = *(_QWORD *)(v9 + 16);
  v12 = *(_QWORD *)(v9 + 24);
  CGRectDivide(*(CGRect *)((char *)&v8 - 8), &v15, (CGRect *)v9, v7 + *(double *)(a1 + 48), CGRectMinXEdge);
  UIFloorToViewScale();
  v15.origin.x = v13;
  UIFloorToViewScale();
  v15.size.width = v14;
  objc_msgSend(v6, "setFrame:", *(_OWORD *)&v15.origin, __PAIR128__(*(unint64_t *)&v15.size.height, *(unint64_t *)&v14));

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  double v11;
  double v12;
  CGSize result;

  width = a3.width;
  -[STSSearchBar sizeThatFits:](self->_searchBar, "sizeThatFits:", a3.width, a3.height);
  v6 = v5;
  v7 = -[NSMutableArray count](self->_bottomZKWButtons, "count");
  v8 = 0.0;
  if (v7)
    v9 = v6;
  else
    v9 = 0.0;
  if (v9 > 0.0 && v6 > 0.0)
    v8 = 6.0;
  v11 = self->_contentInset.bottom + v9 + v6 + self->_contentInset.top + v8;
  v12 = width;
  result.height = v11;
  result.width = v12;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[STSZKWBrowserHeaderView frame](self, "frame");
  -[STSZKWBrowserHeaderView sizeThatFits:](self, "sizeThatFits:", v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)_searchButtonPressed:(id)a3
{
  id WeakRetained;

  if (!self->_writingInSearchBar)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "headerViewDidSelectSearchButton:", self);

  }
}

- (void)_cancelButtonPressed:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "headerDidSelectCancelButton:", self);

}

- (unint64_t)_suggestionIndexForButton:(id)a3
{
  id v4;
  unint64_t v5;

  v4 = a3;
  v5 = -[NSMutableArray indexOfObject:](self->_topZKWButtons, "indexOfObject:", v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    v5 = -[NSMutableArray indexOfObject:](self->_bottomZKWButtons, "indexOfObject:", v4);

  return v5;
}

- (void)_suggestionButtonPressed:(id)a3
{
  STSZKWBrowserHeaderViewDelegate **p_delegate;
  id v5;
  unint64_t v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v6 = -[STSZKWBrowserHeaderView _suggestionIndexForButton:](self, "_suggestionIndexForButton:", v5);

  objc_msgSend(WeakRetained, "headerView:didSelectSuggestionButtonAtIndex:", self, v6);
}

- (CGRect)contentRect
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
  CGRect result;

  -[STSSearchBar searchField](self->_searchBar, "searchField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setTopSuggestions:(id)a3
{
  NSArray *v4;
  NSArray *topSuggestions;

  if (self->_topSuggestions != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    topSuggestions = self->_topSuggestions;
    self->_topSuggestions = v4;

    -[STSZKWBrowserHeaderView _updateTopStackView:andBottomStackView:](self, "_updateTopStackView:andBottomStackView:", 1, 0);
  }
}

- (void)setBottomSuggestions:(id)a3
{
  NSArray *v4;
  NSArray *bottomSuggestions;

  if (self->_bottomSuggestions != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    bottomSuggestions = self->_bottomSuggestions;
    self->_bottomSuggestions = v4;

    -[STSZKWBrowserHeaderView _updateTopStackView:andBottomStackView:](self, "_updateTopStackView:andBottomStackView:", 0, 1);
  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    -[STSZKWBrowserHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)searchBarClicked
{
  -[STSZKWBrowserHeaderView _searchButtonPressed:](self, "_searchButtonPressed:", 0);
}

- (id)searchQuery
{
  return (id)-[STSSearchBar text](self->_searchBar, "text");
}

- (void)setSearchQuery:(id)a3
{
  -[STSSearchBar setText:](self->_searchBar, "setText:", a3);
}

- (void)_updateTopStackView:(BOOL)a3 andBottomStackView:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  _QWORD v9[5];

  v4 = a4;
  v5 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __66__STSZKWBrowserHeaderView__updateTopStackView_andBottomStackView___block_invoke;
  v9[3] = &unk_24E746068;
  v9[4] = self;
  v7 = MEMORY[0x227672A18](v9, a2);
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (v5)
    (*(void (**)(uint64_t, NSMutableArray *, NSArray *))(v7 + 16))(v7, self->_topZKWButtons, self->_topSuggestions);
  if (v4)
    ((void (**)(_QWORD, NSMutableArray *, NSArray *))v8)[2](v8, self->_bottomZKWButtons, self->_bottomSuggestions);
  -[STSZKWBrowserHeaderView setNeedsLayout](self, "setNeedsLayout");
  -[STSZKWBrowserHeaderView layoutIfNeeded](self, "layoutIfNeeded");

}

void __66__STSZKWBrowserHeaderView__updateTopStackView_andBottomStackView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &__block_literal_global_0);
  objc_msgSend(v5, "removeAllObjects");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66__STSZKWBrowserHeaderView__updateTopStackView_andBottomStackView___block_invoke_3;
  v8[3] = &unk_24E7457F8;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

}

uint64_t __66__STSZKWBrowserHeaderView__updateTopStackView_andBottomStackView___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperview");
}

void __66__STSZKWBrowserHeaderView__updateTopStackView_andBottomStackView___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "suggestion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_buttonWithTitle:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__suggestionButtonPressed_, 64);
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v5);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

- (id)_buttonWithTitle:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v4 = (void *)MEMORY[0x24BEBD430];
  v5 = a3;
  objc_msgSend(v4, "buttonWithType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[STSSearchBar effectiveUserInterfaceLayoutDirection](self->_searchBar, "effectiveUserInterfaceLayoutDirection"))
    v7 = 0.0;
  else
    v7 = 8.0;
  objc_msgSend(v6, "setContentEdgeInsets:", 9.0, v7);
  objc_msgSend(v6, "setTitle:forState:", v5, 0);

  objc_msgSend(v6, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v9);

  objc_msgSend(v6, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "setBackgroundColor:", objc_msgSend(v11, "CGColor"));

  objc_msgSend(v6, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCornerRadius:", 6.0);

  return v6;
}

- (double)_searchBarWidthFraction
{
  NSUInteger v2;
  double result;

  v2 = -[NSArray count](self->_topSuggestions, "count");
  result = 0.5;
  if (v2 == 1)
    return 0.75;
  return result;
}

- (void)enableSearchButton
{
  -[STSSearchBar setUserInteractionEnabled:](self->_searchBar, "setUserInteractionEnabled:", 1);
}

- (BOOL)_scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a4.y;
  x = a4.x;
  -[STSSearchBar frame](self->_searchBar, "frame", a3);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4
{
  return 1;
}

- (void)_scribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4
{
  self->_writingInSearchBar = 1;
}

- (void)_scribbleInteraction:(id)a3 didFinishWritingInElement:(id)a4
{
  id WeakRetained;
  id v6;

  -[STSSearchBar text](self->_searchBar, "text", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  self->_writingInSearchBar = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "headerView:didSearchFor:", self, v6);

}

- (void)_scribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5
{
  (*((void (**)(id, void *, _QWORD, CGPoint, __n128, CGSize, __n128))a5 + 2))(a5, &unk_24E7575C0, 0, a4.origin, *(__n128 *)&a4.origin.y, a4.size, *(__n128 *)&a4.size.height);
}

- (CGRect)_scribbleInteraction:(id)a3 frameForElement:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[STSSearchBar frame](self->_searchBar, "frame", a3, a4);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)_scribbleInteraction:(id)a3 focusElement:(id)a4 initialFocusSelectionReferencePoint:(CGPoint)a5 completion:(id)a6
{
  CGFloat y;
  CGFloat x;
  void *v9;
  void (**v10)(id, void *);
  CGPoint v11;
  CGRect v12;

  y = a5.y;
  x = a5.x;
  v10 = (void (**)(id, void *))a6;
  -[STSSearchBar frame](self->_searchBar, "frame");
  v11.x = x;
  v11.y = y;
  if (CGRectContainsPoint(v12, v11))
  {
    self->_writingInSearchBar = 1;
    -[STSSearchBar searchTextField](self->_searchBar, "searchTextField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v9);

  }
  else
  {
    v10[2](v10, 0);
  }

}

- (id)keyCommands
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, sel_returnKeyPressed);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BEBE3D8], 0, sel_downArrowPressed, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BEBE3F8], 0, sel_upArrowPressed);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", CFSTR("\t"), 0, sel_downArrowPressed);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BEBE3E0], 0, sel_escapeKeyPressed);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)returnKeyPressed
{
  void *v3;
  void *v4;
  id WeakRetained;

  if (-[STSSearchBar isFirstResponder](self->_searchBar, "isFirstResponder"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_keyCommandDelegate);
    -[STSSearchBar searchField](self->_searchBar, "searchField");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "didPressReturnKey:", v4);

  }
}

- (void)downArrowPressed
{
  id WeakRetained;

  if (-[STSSearchBar isFirstResponder](self->_searchBar, "isFirstResponder"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_keyCommandDelegate);
    objc_msgSend(WeakRetained, "didPressDownKey");

  }
}

- (void)upArrowPressed
{
  id WeakRetained;

  if (-[STSSearchBar isFirstResponder](self->_searchBar, "isFirstResponder"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_keyCommandDelegate);
    objc_msgSend(WeakRetained, "didPressUpKey");

  }
}

- (void)escapeKeyPressed
{
  id WeakRetained;

  if (-[STSSearchBar isFirstResponder](self->_searchBar, "isFirstResponder"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_keyCommandDelegate);
    objc_msgSend(WeakRetained, "didRequestClose");

  }
}

- (STSZKWBrowserHeaderViewDelegate)delegate
{
  return (STSZKWBrowserHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (STSKeyCommandDelegate)keyCommandDelegate
{
  return (STSKeyCommandDelegate *)objc_loadWeakRetained((id *)&self->_keyCommandDelegate);
}

- (void)setKeyCommandDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_keyCommandDelegate, a3);
}

- (NSArray)topSuggestions
{
  return self->_topSuggestions;
}

- (NSArray)bottomSuggestions
{
  return self->_bottomSuggestions;
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomSuggestions, 0);
  objc_storeStrong((id *)&self->_topSuggestions, 0);
  objc_destroyWeak((id *)&self->_keyCommandDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchBarConstraints, 0);
  objc_storeStrong((id *)&self->_bottomZKWButtons, 0);
  objc_storeStrong((id *)&self->_topZKWButtons, 0);
  objc_storeStrong((id *)&self->_feedbackButton, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
}

@end
