@implementation PKDashboardPassLinkedAppItemPresenter

- (PKDashboardPassLinkedAppItemPresenter)initWithDelegate:(id)a3
{
  id v4;
  PKDashboardPassLinkedAppItemPresenter *v5;
  PKDashboardPassLinkedAppItemPresenter *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKDashboardPassLinkedAppItemPresenter;
  v5 = -[PKDashboardPassLinkedAppItemPresenter init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)collectionViewCellClasses
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("PassLinkedAppItem");
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("PassLinkedAppItem"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKDashboardCollectionViewCell defaultHorizontalInset](PKDashboardCollectionViewCell, "defaultHorizontalInset");
  objc_msgSend(v11, "setHostedContentInset:", 0.0, v12, 0.0, v12);
  -[PKDashboardPassLinkedAppItemPresenter _configureCell:forItem:inCollectionView:forIndexPath:animated:](self, "_configureCell:forItem:inCollectionView:forIndexPath:animated:", v11, v10, v9, v8, 0);

  return v11;
}

- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  -[PKDashboardPassLinkedAppItemPresenter _configureCell:forItem:inCollectionView:forIndexPath:animated:](self, "_configureCell:forItem:inCollectionView:forIndexPath:animated:", a3, a4, v10, v11, 1);
  v12 = objc_alloc_init(MEMORY[0x1E0DC3630]);
  v19[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "invalidateItemsAtIndexPaths:", v13);

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __89__PKDashboardPassLinkedAppItemPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke;
  v16[3] = &unk_1E3E61388;
  v17 = v10;
  v18 = v12;
  v14 = v12;
  v15 = v10;
  objc_msgSend(v15, "performBatchUpdates:completion:", v16, 0);

}

void __89__PKDashboardPassLinkedAppItemPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "collectionViewLayout");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateLayoutWithContext:", *(_QWORD *)(a1 + 40));

}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKDashboardContentHostCollectionViewCell *sampleCell;
  PKDashboardContentHostCollectionViewCell *v12;
  PKDashboardContentHostCollectionViewCell *v13;
  PKDashboardContentHostCollectionViewCell *v14;
  double v15;
  PKDashboardContentHostCollectionViewCell *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGSize result;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  sampleCell = self->_sampleCell;
  if (!sampleCell)
  {
    v12 = [PKDashboardContentHostCollectionViewCell alloc];
    v13 = -[PKDashboardContentHostCollectionViewCell initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v14 = self->_sampleCell;
    self->_sampleCell = v13;

    +[PKDashboardCollectionViewCell defaultHorizontalInset](PKDashboardCollectionViewCell, "defaultHorizontalInset");
    -[PKDashboardContentHostCollectionViewCell setHostedContentInset:](self->_sampleCell, "setHostedContentInset:", 0.0, v15, 0.0, v15);
    sampleCell = self->_sampleCell;
  }
  -[PKDashboardPassLinkedAppItemPresenter _configureCell:forItem:inCollectionView:forIndexPath:animated:](self, "_configureCell:forItem:inCollectionView:forIndexPath:animated:", sampleCell, v8, v9, v10, 0);
  v16 = self->_sampleCell;
  objc_msgSend(v9, "bounds");
  -[PKDashboardContentHostCollectionViewCell sizeThatFits:](v16, "sizeThatFits:", v17, 1.79769313e308);
  v19 = v18;
  v21 = v20;
  -[PKDashboardContentHostCollectionViewCell prepareForReuse](self->_sampleCell, "prepareForReuse");

  v22 = v19;
  v23 = v21;
  result.height = v23;
  result.width = v22;
  return result;
}

- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6 animated:(BOOL)a7
{
  void *v9;
  PKLinkedAppContentView *v10;
  PKLinkedAppContentView *v11;
  void *v12;
  PKLinkedAppContentView *v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(a4, "linkedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hostedContentView");
  v10 = (PKLinkedAppContentView *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10
    || (-[PKLinkedAppContentView linkedApplication](v10, "linkedApplication"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v12 != v9))
  {
    v13 = -[PKLinkedAppContentView initWithLinkedApplication:]([PKLinkedAppContentView alloc], "initWithLinkedApplication:", v9);

    -[PKLinkedAppContentView setDelegate:](v13, "setDelegate:", self);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKLinkedAppContentView setBackgroundColor:](v13, "setBackgroundColor:", v14);

    -[UIView pkui_setMaskType:](v13, "pkui_setMaskType:", 3);
    objc_msgSend(v15, "setHostedContentView:", v13);
    v11 = v13;
  }

}

- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  return 0;
}

- (void)appViewContentSizeChanged:(id)a3
{
  void *v4;
  id WeakRetained;
  PKDashboardContentHostCollectionViewCell *v6;

  objc_msgSend(a3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v6 = (PKDashboardContentHostCollectionViewCell *)objc_claimAutoreleasedReturnValue();

  if (self->_sampleCell != v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "invalidateLayoutForCell:", v6);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleCell, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
