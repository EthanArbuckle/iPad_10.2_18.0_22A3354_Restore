@implementation PKDashboardBankConnectPresenter

- (PKDashboardBankConnectPresenter)init
{
  PKDashboardBankConnectPresenter *v2;
  _TtC9PassKitUI31PKDashboardBankConnectDebitCell *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  _TtC9PassKitUI31PKDashboardBankConnectDebitCell *sampleBankConnectDebitView;
  _TtC9PassKitUI32PKDashboardBankConnectCreditCell *v10;
  _TtC9PassKitUI32PKDashboardBankConnectCreditCell *sampleBankConnectCreditView;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKDashboardBankConnectPresenter;
  v2 = -[PKDashboardBankConnectPresenter init](&v13, sel_init);
  if (v2)
  {
    v3 = [_TtC9PassKitUI31PKDashboardBankConnectDebitCell alloc];
    v4 = *MEMORY[0x1E0C9D648];
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v8 = -[PKDashboardBankConnectDebitCell initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
    sampleBankConnectDebitView = v2->_sampleBankConnectDebitView;
    v2->_sampleBankConnectDebitView = (_TtC9PassKitUI31PKDashboardBankConnectDebitCell *)v8;

    v10 = -[PKDashboardBankConnectCreditCell initWithFrame:]([_TtC9PassKitUI32PKDashboardBankConnectCreditCell alloc], "initWithFrame:", v4, v5, v6, v7);
    sampleBankConnectCreditView = v2->_sampleBankConnectCreditView;
    v2->_sampleBankConnectCreditView = v10;

  }
  return v2;
}

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)collectionViewCellClasses
{
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("debitCellReuseIdentifier");
  v3[1] = CFSTR("creditCellReuseIdentifier");
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v8;
  v12 = objc_msgSend(v11, "accountType");
  if (v12 == 1)
  {
    objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("creditCellReuseIdentifier"), v10);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[PKDashboardBankConnectPresenter _updateCreditView:withItem:](self, "_updateCreditView:withItem:", v8, v11);
    goto LABEL_5;
  }
  if (!v12)
  {
    objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("debitCellReuseIdentifier"), v10);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[PKDashboardBankConnectPresenter _updateDebitView:withItem:](self, "_updateDebitView:withItem:", v8, v11);
LABEL_5:
    objc_msgSend((id)objc_opt_class(), "defaultHorizontalInset");
    v14 = v13;
    objc_msgSend((id)objc_opt_class(), "defaultHorizontalInset");
    objc_msgSend(v9, "pkui_readableContentBoundsWithMargins:", 0.0, v14, 0.0, v15);
    objc_msgSend(v8, "setHorizontalInset:");
  }

  return v8;
}

- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6
{
  id v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = objc_msgSend(v8, "accountType");
  if (v9 == 1)
    goto LABEL_4;
  if (!v9)
  {
    -[PKDashboardBankConnectPresenter _updateDebitView:withItem:](self, "_updateDebitView:withItem:", v10, v8);
LABEL_4:
    -[PKDashboardBankConnectPresenter _updateCreditView:withItem:](self, "_updateCreditView:withItem:", v10, v8);
  }

}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  double v5;
  double v6;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id *p_sampleBankConnectCreditView;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  v9 = a3;
  v10 = a4;
  v11 = v9;
  v12 = objc_msgSend(v11, "accountType");
  if (v12 == 1)
  {
    p_sampleBankConnectCreditView = (id *)&self->_sampleBankConnectCreditView;
    -[PKDashboardBankConnectPresenter _updateCreditView:withItem:](self, "_updateCreditView:withItem:", self->_sampleBankConnectCreditView, v11);
    goto LABEL_5;
  }
  if (!v12)
  {
    p_sampleBankConnectCreditView = (id *)&self->_sampleBankConnectDebitView;
    -[PKDashboardBankConnectPresenter _updateDebitView:withItem:](self, "_updateDebitView:withItem:", self->_sampleBankConnectDebitView, v11);
LABEL_5:
    objc_msgSend((id)objc_opt_class(), "defaultHorizontalInset");
    v15 = v14;
    objc_msgSend(v10, "pkui_readableContentBoundsWithMargins:", 0.0, v15, 0.0, v15);
    objc_msgSend(*p_sampleBankConnectCreditView, "setHorizontalInset:");
    objc_msgSend(v10, "bounds");
    v5 = v16 + v15 * -2.0;
    objc_msgSend(*p_sampleBankConnectCreditView, "sizeThatFits:", v5, 3.40282347e38);
    v6 = v17;
  }

  v18 = v5;
  v19 = v6;
  result.height = v19;
  result.width = v18;
  return result;
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
  +[BankConnectBalanceDetailsViewControllerProvider makeViewControllerWithBankConnectItem:](_TtC9PassKitUI47BankConnectBalanceDetailsViewControllerProvider, "makeViewControllerWithBankConnectItem:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPrefersLargeTitles:", 1);

  objc_msgSend(v11, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLargeTitleDisplayMode:", 1);

  objc_msgSend(v8, "pushViewController:animated:", v11, 1);
}

- (void)_updateDebitView:(id)a3 withItem:(id)a4
{
  objc_msgSend(a3, "configureWithBankConnectItem:", a4);
}

- (void)_updateCreditView:(id)a3 withItem:(id)a4
{
  objc_msgSend(a3, "configureWithBankConnectItem:", a4);
}

- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5
{
  id v7;
  NSString *v8;
  NSString *v9;
  NSComparisonResult v10;
  _TtC9PassKitUI31PKDashboardBankConnectDebitCell *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _TtC9PassKitUI31PKDashboardBankConnectDebitCell *v16;
  _TtC9PassKitUI31PKDashboardBankConnectDebitCell *sampleBankConnectDebitView;
  _TtC9PassKitUI32PKDashboardBankConnectCreditCell *v18;
  _TtC9PassKitUI32PKDashboardBankConnectCreditCell *sampleBankConnectCreditView;

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
      v11 = [_TtC9PassKitUI31PKDashboardBankConnectDebitCell alloc];
      v12 = *MEMORY[0x1E0C9D648];
      v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v16 = -[PKDashboardBankConnectDebitCell initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E0C9D648], v13, v14, v15);
      sampleBankConnectDebitView = self->_sampleBankConnectDebitView;
      self->_sampleBankConnectDebitView = v16;

      v18 = -[PKDashboardBankConnectCreditCell initWithFrame:]([_TtC9PassKitUI32PKDashboardBankConnectCreditCell alloc], "initWithFrame:", v12, v13, v14, v15);
      sampleBankConnectCreditView = self->_sampleBankConnectCreditView;
      self->_sampleBankConnectCreditView = v18;

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
  objc_storeStrong((id *)&self->_sampleBankConnectCreditView, 0);
  objc_storeStrong((id *)&self->_sampleBankConnectDebitView, 0);
}

@end
