@implementation PKDashboardInstallmentPlanStatusItemPresenter

- (PKDashboardInstallmentPlanStatusItemPresenter)init
{
  PKDashboardInstallmentPlanStatusItemPresenter *v2;
  PKInstallmentPlanProgressCollectionViewCell *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  PKInstallmentPlanProgressCollectionViewCell *sampleProgressCell;
  PKInstallmentPlanTotalFinancedCollectionViewCell *v10;
  PKInstallmentPlanTotalFinancedCollectionViewCell *sampleTotalFinancedCell;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKDashboardInstallmentPlanStatusItemPresenter;
  v2 = -[PKDashboardInstallmentPlanStatusItemPresenter init](&v13, sel_init);
  if (v2)
  {
    v3 = [PKInstallmentPlanProgressCollectionViewCell alloc];
    v4 = *MEMORY[0x1E0C9D648];
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v8 = -[PKInstallmentPlanProgressCollectionViewCell initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
    sampleProgressCell = v2->_sampleProgressCell;
    v2->_sampleProgressCell = (PKInstallmentPlanProgressCollectionViewCell *)v8;

    v10 = -[PKInstallmentPlanTotalFinancedCollectionViewCell initWithFrame:]([PKInstallmentPlanTotalFinancedCollectionViewCell alloc], "initWithFrame:", v4, v5, v6, v7);
    sampleTotalFinancedCell = v2->_sampleTotalFinancedCell;
    v2->_sampleTotalFinancedCell = v10;

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
  v3[0] = CFSTR("InstallmentPlanStatusItemCellReuseIdentifier");
  v3[1] = CFSTR("InstallmentPlanTotalFinancedCellReuseIdentifier");
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  return !-[PKDashboardInstallmentPlanStatusItemPresenter _showStatusForItem:](self, "_showStatusForItem:", a3, a4, a5);
}

- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  PKInstallmentPlanDetailsViewController *v24;
  PKInstallmentPlanDetailsViewController *v25;
  void *v26;
  id v27;

  v27 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = v14;
  if (!v14 || (*((unsigned int (**)(id))v14 + 2))(v14))
  {
    v16 = v27;
    v25 = [PKInstallmentPlanDetailsViewController alloc];
    objc_msgSend(v16, "account");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "installmentPlan");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "accountUserCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "familyMemberCollection");
    v26 = v13;
    v21 = v11;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "transactionSourceCollection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = -[PKInstallmentPlanDetailsViewController initWithAccount:installmentPlan:accountService:accountUserCollection:familyMemberCollection:transactionSourceCollection:](v25, "initWithAccount:installmentPlan:accountService:accountUserCollection:familyMemberCollection:transactionSourceCollection:", v17, v18, v19, v20, v22, v23);
    v11 = v21;
    v13 = v26;

    objc_msgSend(v26, "pushViewController:animated:", v24, 1);
  }

}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  if (-[PKDashboardInstallmentPlanStatusItemPresenter _showStatusForItem:](self, "_showStatusForItem:", v8))
  {
    objc_msgSend(v10, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("InstallmentPlanStatusItemCellReuseIdentifier"), v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardInstallmentPlanStatusItemPresenter _configureProgressCell:forItem:inCollectionView:forIndexPath:](self, "_configureProgressCell:forItem:inCollectionView:forIndexPath:", v11, v8, v10, v9);
  }
  else
  {
    objc_msgSend(v10, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("InstallmentPlanTotalFinancedCellReuseIdentifier"), v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardInstallmentPlanStatusItemPresenter _configureTotalFinancedCell:forItem:inCollection:forIndexPath:](self, "_configureTotalFinancedCell:forItem:inCollection:forIndexPath:", v11, v8, v10, v9);
  }

  return v11;
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void **p_sampleProgressCell;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  if (-[PKDashboardInstallmentPlanStatusItemPresenter _showStatusForItem:](self, "_showStatusForItem:", v8))
  {
    p_sampleProgressCell = (void **)&self->_sampleProgressCell;
    -[PKDashboardInstallmentPlanStatusItemPresenter _configureProgressCell:forItem:inCollectionView:forIndexPath:](self, "_configureProgressCell:forItem:inCollectionView:forIndexPath:", self->_sampleProgressCell, v8, v10, v9);
  }
  else
  {
    p_sampleProgressCell = (void **)&self->_sampleTotalFinancedCell;
    -[PKDashboardInstallmentPlanStatusItemPresenter _configureTotalFinancedCell:forItem:inCollection:forIndexPath:](self, "_configureTotalFinancedCell:forItem:inCollection:forIndexPath:", self->_sampleTotalFinancedCell, v8, v10, v9);
  }

  v12 = *p_sampleProgressCell;
  objc_msgSend(v10, "bounds");
  v14 = v13;

  objc_msgSend(v12, "sizeThatFits:", v14, 1.79769313e308);
  v16 = v15;
  v18 = v17;

  v19 = v16;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v13 = a4;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  if (-[PKDashboardInstallmentPlanStatusItemPresenter _showStatusForItem:](self, "_showStatusForItem:", v13))
    -[PKDashboardInstallmentPlanStatusItemPresenter _configureProgressCell:forItem:inCollectionView:forIndexPath:](self, "_configureProgressCell:forItem:inCollectionView:forIndexPath:", v12, v13, v11, v10);
  else
    -[PKDashboardInstallmentPlanStatusItemPresenter _configureTotalFinancedCell:forItem:inCollection:forIndexPath:](self, "_configureTotalFinancedCell:forItem:inCollection:forIndexPath:", v12, v13, v11, v10);

}

- (void)_configureTotalFinancedCell:(id)a3 forItem:(id)a4 inCollection:(id)a5 forIndexPath:(id)a6
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSDecimalNumber *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  objc_msgSend(a4, "installmentPlan");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currencyCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "totalAmount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedBeekmanString(CFSTR("TOTAL_FINANCED"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTitle:", v10);

  PKCurrencyAmountMake();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setAmount:", v11);

  objc_msgSend(v7, "nextPaymentDue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "amountDue");
    v14 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currencyCode");
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountCreate(v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "statementDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v19 = v17;
    }
    else
    {
      objc_msgSend(v13, "dueDate");
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = v19;

    PKMediumDateString();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "formattedStringValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedBeekmanString(CFSTR("NEXT_PAYMENT_DUE_FORMAT"), CFSTR("%@%@"), v22, v23);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(v24, "setSubtitleText:", v20);

}

- (void)_configureProgressCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6
{
  void *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  NSDecimalNumber *v12;
  NSDecimalNumber *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  float v20;
  double v21;
  void *v22;
  void *v23;
  NSDecimalNumber *v24;
  NSDecimalNumber *v25;
  void *v26;
  void *v27;
  void *v28;
  NSDecimalNumber *v29;
  NSString *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;

  v39 = a3;
  objc_msgSend(a4, "installmentPlan");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currencyCode");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "summary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "paymentsToDateAmount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v12 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  objc_msgSend(v7, "totalAmount");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v7, "isComplete");
  objc_msgSend(v39, "setComplete:", v15);
  if ((v15 & 1) != 0)
  {
    PKLocalizedBeekmanString(CFSTR("INSTALLMENT_STATUS"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setLeadingTitle:", v16);

    objc_msgSend(v39, "setTrailingTitle:", 0);
    objc_msgSend(v39, "setLeadingAmount:", 0);
    objc_msgSend(v39, "setTrailingAmount:", 0);
    objc_msgSend(v7, "nextPaymentDue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)PKLocalizedBeekmanString(CFSTR("FINAL_PAYMENT_RECEIVED"));
LABEL_17:
    v35 = 0;
    goto LABEL_20;
  }
  if (v8)
  {
    if (v13 && v14)
    {
      -[NSDecimalNumber decimalNumberByDividingBy:](v13, "decimalNumberByDividingBy:", v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "floatValue");
      v21 = v20;

      PKCurrencyAmountCreate(v13, v8);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v24 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      PKCurrencyAmountCreate(v24, v8);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = 0.0;
    }
    objc_msgSend(v7, "remainingAmount");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v7, "remainingAmount");
      v25 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      PKCurrencyAmountCreate(v25, v8);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v22 = 0;
    v23 = 0;
    v21 = 0.0;
  }
  objc_msgSend(v39, "setProgressAmount:", v21);
  PKLocalizedBeekmanString(CFSTR("TOTAL_PAID"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setLeadingTitle:", v26);

  objc_msgSend(v39, "setLeadingAmount:", v22);
  PKLocalizedBeekmanString(CFSTR("TOTAL_REMAINING"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setTrailingTitle:", v27);

  objc_msgSend(v39, "setTrailingAmount:", v23);
  objc_msgSend(v7, "nextPaymentDue");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v28;
  if (!v28)
    goto LABEL_17;
  objc_msgSend(v28, "amountDue");
  v29 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "currencyCode");
  v30 = (NSString *)objc_claimAutoreleasedReturnValue();
  PKCurrencyAmountCreate(v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "statementDate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
  {
    v34 = v32;
  }
  else
  {
    objc_msgSend(v17, "dueDate");
    v34 = (id)objc_claimAutoreleasedReturnValue();
  }
  v36 = v34;

  PKMediumDateString();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "formattedStringValue");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedBeekmanString(CFSTR("NEXT_PAYMENT_DUE_FORMAT"), CFSTR("%@%@"), v37, v38);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
  objc_msgSend(v39, "setSubtitleText:", v35);

}

- (BOOL)_showStatusForItem:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accessLevel") == 1;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleTotalFinancedCell, 0);
  objc_storeStrong((id *)&self->_sampleProgressCell, 0);
}

@end
