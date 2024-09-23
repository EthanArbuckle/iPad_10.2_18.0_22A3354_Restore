@implementation SearchUICardCollectionViewController

- (SearchUICardCollectionViewController)init
{
  SearchUICardCollectionViewController *v2;
  SearchUICardCollectionViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchUICardCollectionViewController;
  v2 = -[SearchUICollectionViewController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SearchUICardCollectionViewController setRowSelectionAppearanceEnabled:](v2, "setRowSelectionAppearanceEnabled:", 1);
  return v3;
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SearchUICardCollectionViewController;
  -[SearchUICollectionViewController viewDidDisappear:](&v12, sel_viewDidDisappear_, a3);
  -[SearchUICardCollectionViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visibleViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[SearchUICollectionViewController feedbackListener](self, "feedbackListener");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0)
      return;
    -[SearchUICardCollectionViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "interactivePopGestureRecognizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "state") < 1)
      v10 = 1;
    else
      v10 = 2;

    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C238]), "initWithEvent:", v10);
    -[SearchUICollectionViewController tableModel](self, "tableModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setQueryId:", objc_msgSend(v11, "queryId"));

    -[SearchUICollectionViewController feedbackListener](self, "feedbackListener");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cardViewDidDisappear:", v4);
  }

}

- (void)setShowsVerticalScrollIndicator:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SearchUICardCollectionViewController collectionView](self, "collectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsVerticalScrollIndicator:", v3);

}

- (BOOL)showsVerticalScrollIndicator
{
  void *v2;
  char v3;

  -[SearchUICardCollectionViewController collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsVerticalScrollIndicator");

  return v3;
}

- (void)reloadViews
{
  void *v3;
  id v4;

  -[SearchUICardCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

  -[SearchUICardCollectionViewController collectionView](self, "collectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

- (void)setShouldUseInsetRoundedSections:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SearchUICardCollectionViewController;
  -[SearchUICollectionViewController setShouldUseInsetRoundedSections:](&v4, sel_setShouldUseInsetRoundedSections_, a3);
  -[SearchUICardCollectionViewController updateTopPadding](self, "updateTopPadding");
}

- (void)setShouldUseStandardSectionInsets:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SearchUICardCollectionViewController;
  -[SearchUICollectionViewController setShouldUseStandardSectionInsets:](&v4, sel_setShouldUseStandardSectionInsets_, a3);
  -[SearchUICardCollectionViewController updateTopPadding](self, "updateTopPadding");
}

- (void)updateTopPadding
{
  double v3;
  id v4;

  v3 = 0.0;
  if (-[SearchUICollectionViewController shouldUseInsetRoundedSections](self, "shouldUseInsetRoundedSections"))
  {
    if (-[SearchUICollectionViewController shouldUseStandardSectionInsets](self, "shouldUseStandardSectionInsets"))
      v3 = 16.0;
    else
      v3 = 12.0;
  }
  -[SearchUICardCollectionViewController collectionView](self, "collectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentInset:", v3, 0.0, 0.0, 0.0);

}

- (CGSize)collectionViewContentSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[SearchUICardCollectionViewController collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewContentSize");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)cellForRowModel:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  -[SearchUICollectionViewController cardViewDelegate](self, "cardViewDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) == 0)
    goto LABEL_5;
  objc_msgSend(v6, "cardSection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_5;
  -[SearchUICollectionViewController cardViewDelegate](self, "cardViewDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cardSection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "customViewControllerForCardSection:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SearchUICardCollectionViewController addChildViewController:](self, "addChildViewController:", v13);
    objc_msgSend(v6, "cardSection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[SearchUICardCollectionViewController collectionView](self, "collectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), v15);

    -[SearchUICardCollectionViewController collectionView](self, "collectionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v15, v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setEmbeddedViewController:", v13);
  }
  else
  {
LABEL_5:
    v20.receiver = self;
    v20.super_class = (Class)SearchUICardCollectionViewController;
    -[SearchUICollectionViewController cellForRowModel:atIndexPath:](&v20, sel_cellForRowModel_atIndexPath_, v6, v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[SearchUICardCollectionViewController rowSelectionAppearanceEnabled](self, "rowSelectionAppearanceEnabled"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v18, "setSearchui_focusStyle:", 6);
    }
  }

  return v18;
}

- (id)tableView
{
  void *v3;
  void *v4;
  NSObject *v5;

  -[SearchUICardCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setScrollEnabled:", 0);

  -[SearchUICardCollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setSafeAreaInsetsFrozen:", 1);

  SearchUIGeneralLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    -[SearchUICardCollectionViewController tableView].cold.1(v5);

  return 0;
}

- (Class)restorationContextClass
{
  return (Class)objc_opt_class();
}

- (SFCard)card
{
  return self->_card;
}

- (void)setCard:(id)a3
{
  objc_storeStrong((id *)&self->_card, a3);
}

- (BOOL)rowSelectionAppearanceEnabled
{
  return self->_rowSelectionAppearanceEnabled;
}

- (void)setRowSelectionAppearanceEnabled:(BOOL)a3
{
  self->_rowSelectionAppearanceEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_card, 0);
}

- (void)tableView
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1DAD39000, log, OS_LOG_TYPE_FAULT, "Dont dip in to SearchUI to get this use scrollEnabled on SearchUICardViewController", v1, 2u);
}

@end
