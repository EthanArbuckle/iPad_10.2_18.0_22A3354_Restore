@implementation PKDashboardBalancePresenter

- (PKDashboardBalancePresenter)init
{
  PKDashboardBalancePresenter *v2;
  PKDashboardBalanceView *v3;
  uint64_t v4;
  PKDashboardBalanceView *sampleBalanceView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKDashboardBalancePresenter;
  v2 = -[PKDashboardBalancePresenter init](&v7, sel_init);
  if (v2)
  {
    v3 = [PKDashboardBalanceView alloc];
    v4 = -[PKDashboardBalanceView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    sampleBalanceView = v2->_sampleBalanceView;
    v2->_sampleBalanceView = (PKDashboardBalanceView *)v4;

  }
  return v2;
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
  v3 = CFSTR("PKDashboardBalancePresenterIdentifier");
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_identifierForItem:(id)a3
{
  return CFSTR("PKDashboardBalancePresenterIdentifier");
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  UICollectionView *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  UICollectionView *collectionView;
  UICollectionView *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v8 = (UICollectionView *)a4;
  v9 = a5;
  v10 = a3;
  -[PKDashboardBalancePresenter _identifierForItem:](self, "_identifierForItem:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  collectionView = self->_collectionView;
  self->_collectionView = v8;
  v14 = v8;

  -[PKDashboardBalancePresenter _updateBalanceView:withItem:](self, "_updateBalanceView:withItem:", v12, v10);
  objc_msgSend((id)objc_opt_class(), "defaultHorizontalInset");
  v16 = v15;
  objc_msgSend((id)objc_opt_class(), "defaultHorizontalInset");
  -[UICollectionView pkui_readableContentBoundsWithMargins:](v14, "pkui_readableContentBoundsWithMargins:", 0.0, v16, 0.0, v17);
  v19 = v18;

  objc_msgSend(v12, "setHorizontalInset:", v19);
  return v12;
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  PKDashboardBalanceView *sampleBalanceView;
  id v8;
  double v9;
  double v10;
  double v11;
  PKDashboardBalanceView *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  sampleBalanceView = self->_sampleBalanceView;
  v8 = a4;
  -[PKDashboardBalancePresenter _updateBalanceView:withItem:](self, "_updateBalanceView:withItem:", sampleBalanceView, a3);
  objc_msgSend((id)objc_opt_class(), "defaultHorizontalInset");
  v10 = v9;
  objc_msgSend((id)objc_opt_class(), "defaultHorizontalInset");
  objc_msgSend(v8, "pkui_readableContentBoundsWithMargins:", 0.0, v10, 0.0, v11);
  -[PKDashboardCollectionViewCell setHorizontalInset:](self->_sampleBalanceView, "setHorizontalInset:");
  v12 = self->_sampleBalanceView;
  objc_msgSend(v8, "bounds");
  v14 = v13;

  -[PKDashboardBalanceView sizeThatFits:](v12, "sizeThatFits:", v14, 3.40282347e38);
  result.height = v16;
  result.width = v15;
  return result;
}

- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  return 0;
}

- (void)_updateBalanceView:(id)a3 withItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  v5 = a4;
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v14, "setTitle:", v6);
  }
  else
  {
    PKLocalizedPaymentString(CFSTR("DASHBOARD_MODULE_BALANCE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTitle:", v7);

  }
  objc_msgSend(v5, "titleColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitleColor:", v8);

  objc_msgSend(v5, "balance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBalance:", v9);

  objc_msgSend(v5, "availableCredit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAvailableCredit:", v10);

  objc_msgSend(v5, "topUpTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTopUpTitle:", v11);

  objc_msgSend(v5, "topUpAction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTopUpAction:", v12);

  v13 = objc_msgSend(v5, "topUpEnabled");
  objc_msgSend(v14, "setTopUpEnabled:", v13);

}

- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5
{
  id v7;
  NSString *v8;
  NSString *v9;
  NSComparisonResult v10;
  PKDashboardBalanceView *v11;
  PKDashboardBalanceView *v12;
  PKDashboardBalanceView *sampleBalanceView;

  if (a3 && a4)
  {
    v7 = a4;
    objc_msgSend(a3, "preferredContentSizeCategory");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredContentSizeCategory");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();

    v10 = UIContentSizeCategoryCompareToCategory(v8, v9);
    if (v10)
    {
      v11 = [PKDashboardBalanceView alloc];
      v12 = -[PKDashboardBalanceView initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      sampleBalanceView = self->_sampleBalanceView;
      self->_sampleBalanceView = v12;

    }
  }
}

- (int64_t)cellStyle
{
  return self->_cellStyle;
}

- (void)setCellStyle:(int64_t)a3
{
  self->_cellStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_sampleBalanceView, 0);
}

@end
