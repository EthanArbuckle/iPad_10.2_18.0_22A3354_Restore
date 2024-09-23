@implementation PKDashboardPassTilesItemPresenter

- (PKDashboardPassTilesItemPresenter)initWithPassView:(id)a3
{
  id v5;
  PKDashboardPassTilesItemPresenter *v6;
  PKDashboardPassTilesItemPresenter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKDashboardPassTilesItemPresenter;
  v6 = -[PKDashboardPassTilesItemPresenter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_passView, a3);

  return v7;
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
  v3 = CFSTR("PassTilesItem");
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

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("PassTilesItem"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassTilesItemPresenter _configureCell:forItem:inCollectionView:forIndexPath:animated:](self, "_configureCell:forItem:inCollectionView:forIndexPath:animated:", v11, v10, v9, v8, 0);

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
  -[PKDashboardPassTilesItemPresenter _configureCell:forItem:inCollectionView:forIndexPath:animated:](self, "_configureCell:forItem:inCollectionView:forIndexPath:animated:", a3, a4, v10, v11, 1);
  v12 = objc_alloc_init(MEMORY[0x1E0DC3630]);
  v19[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "invalidateItemsAtIndexPaths:", v13);

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __85__PKDashboardPassTilesItemPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke;
  v16[3] = &unk_1E3E61388;
  v17 = v10;
  v18 = v12;
  v14 = v12;
  v15 = v10;
  objc_msgSend(v15, "performBatchUpdates:completion:", v16, 0);

}

void __85__PKDashboardPassTilesItemPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke(uint64_t a1)
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
  PKDashboardContentHostCollectionViewCell *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
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

    sampleCell = self->_sampleCell;
  }
  -[PKDashboardPassTilesItemPresenter _configureCell:forItem:inCollectionView:forIndexPath:animated:](self, "_configureCell:forItem:inCollectionView:forIndexPath:animated:", sampleCell, v8, v9, v10, 0);
  v15 = self->_sampleCell;
  objc_msgSend(v9, "bounds");
  -[PKDashboardContentHostCollectionViewCell sizeThatFits:](v15, "sizeThatFits:", v16, 1.79769313e308);
  v18 = v17;
  v20 = v19;
  -[PKDashboardContentHostCollectionViewCell prepareForReuse](self->_sampleCell, "prepareForReuse");

  v21 = v18;
  v22 = v20;
  result.height = v22;
  result.width = v21;
  return result;
}

- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6 animated:(BOOL)a7
{
  _BOOL4 v7;
  id v10;
  id v11;
  uint64_t v12;
  PKPassTileGroupView *v13;
  double v14;
  double v15;
  void *v16;
  PKPassView *passView;
  void *v18;
  uint64_t v19;
  _BOOL8 v20;
  _BYTE v21[8];
  uint64_t v22;
  uint64_t v23;

  v7 = a7;
  v10 = a3;
  v11 = a4;
  objc_msgSend(v10, "hostedContentView");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (PKPassTileGroupView *)v12;
  if (!v12)
  {
    +[PKDashboardCollectionViewCell defaultHorizontalInset](PKDashboardCollectionViewCell, "defaultHorizontalInset");
    v15 = v14;
    v13 = objc_alloc_init(PKPassTileGroupView);
    -[PKPassTileGroupView setDelegate:](v13, "setDelegate:", self);
    -[PKPassTileGroupView setContentInset:](v13, "setContentInset:", 0.0, v15, 0.0, v15);
    objc_msgSend(v10, "setHostedContentView:", v13);
  }
  objc_msgSend(v11, "pass");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  passView = self->_passView;
  objc_msgSend(v11, "groupTile");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v11, "maximumRowsOverride");

  v21[0] = 0;
  if (v12)
    v20 = v7;
  else
    v20 = 0;
  v22 = 0;
  v23 = v19;
  -[PKPassTileGroupView setPass:passView:groupTile:context:animated:](v13, "setPass:passView:groupTile:context:animated:", v16, passView, v18, v21, v20);

}

- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  return 0;
}

- (void)passTileGroupView:(id)a3 executeSEActionForPass:(id)a4 tile:(id)a5 withCompletion:(id)a6
{
  id v9;
  void (**v10)(id, _QWORD);
  id WeakRetained;
  void *v12;
  id v13;

  v13 = a4;
  v9 = a5;
  v10 = (void (**)(id, _QWORD))a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v12 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "passTilesItemPresenter:executeSEActionForPass:tile:withCompletion:", self, v13, v9, v10);
  else
    v10[2](v10, 0);

}

- (PKDashboardPassTilesItemPresenterDelegate)delegate
{
  return (PKDashboardPassTilesItemPresenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sampleCell, 0);
  objc_storeStrong((id *)&self->_passView, 0);
}

@end
