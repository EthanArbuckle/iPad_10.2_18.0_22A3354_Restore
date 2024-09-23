@implementation PKDashboardRewardsBalancePresenter

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)collectionViewCellClasses
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("paymentRewardsBalanceCellReuseIdentifier");
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v7;
  void *v8;

  v7 = a3;
  objc_msgSend(a4, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("paymentRewardsBalanceCellReuseIdentifier"), a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configureWithRewardsBalanceItem:", v7);

  return v8;
}

- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  return 1;
}

- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v8 = a6;
  +[PKDashboardRewardsBalanceDetailsViewHosting makeViewControllerWithRewardsBalanceItem:](PKDashboardRewardsBalanceDetailsViewHosting, "makeViewControllerWithRewardsBalanceItem:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPrefersLargeTitles:", 1);

  objc_msgSend(v11, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLargeTitleDisplayMode:", 1);

  objc_msgSend(v8, "pushViewController:animated:", v11, 1);
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id v8;
  _TtC9PassKitUI29PKDashboardRewardsBalanceCell *sampleCell;
  _TtC9PassKitUI29PKDashboardRewardsBalanceCell *v10;
  _TtC9PassKitUI29PKDashboardRewardsBalanceCell *v11;
  _TtC9PassKitUI29PKDashboardRewardsBalanceCell *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  v7 = a3;
  v8 = a4;
  sampleCell = self->_sampleCell;
  if (!sampleCell)
  {
    v10 = [_TtC9PassKitUI29PKDashboardRewardsBalanceCell alloc];
    v11 = -[PKDashboardRewardsBalanceCell initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v12 = self->_sampleCell;
    self->_sampleCell = v11;

    sampleCell = self->_sampleCell;
  }
  -[PKDashboardRewardsBalanceCell configureWithRewardsBalanceItem:](sampleCell, "configureWithRewardsBalanceItem:", v7);
  objc_msgSend(v8, "bounds");
  v14 = v13;
  +[PKDashboardCollectionViewCell defaultHorizontalInset](PKDashboardCollectionViewCell, "defaultHorizontalInset");
  v16 = v14 + v15 * -2.0;
  -[PKDashboardRewardsBalanceCell sizeThatFits:](self->_sampleCell, "sizeThatFits:", v16, 1.79769313e308);
  v18 = v17;
  -[PKDashboardCollectionViewCell prepareForReuse](self->_sampleCell, "prepareForReuse");

  v19 = v16;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6
{
  objc_msgSend(a3, "configureWithRewardsBalanceItem:", a4);
}

- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5
{
  id v7;
  NSString *v8;
  NSString *v9;
  NSComparisonResult v10;
  _TtC9PassKitUI29PKDashboardRewardsBalanceCell *sampleCell;

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
      sampleCell = self->_sampleCell;
      self->_sampleCell = 0;

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleCell, 0);
}

@end
