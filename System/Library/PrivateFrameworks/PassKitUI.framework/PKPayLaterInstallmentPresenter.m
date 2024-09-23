@implementation PKPayLaterInstallmentPresenter

- (PKPayLaterInstallmentPresenter)init
{
  PKPayLaterInstallmentPresenter *v2;
  PKPayLaterFinancingPlanInstallmentCell *v3;
  uint64_t v4;
  PKPayLaterFinancingPlanInstallmentCell *sampleCell;
  PKPaymentTransactionIconGenerator *v6;
  PKPaymentTransactionIconGenerator *iconGenerator;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterInstallmentPresenter;
  v2 = -[PKPayLaterInstallmentPresenter init](&v9, sel_init);
  if (v2)
  {
    v3 = [PKPayLaterFinancingPlanInstallmentCell alloc];
    v4 = -[PKDashboardCollectionViewCell initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    sampleCell = v2->_sampleCell;
    v2->_sampleCell = (PKPayLaterFinancingPlanInstallmentCell *)v4;

    v6 = -[PKPaymentTransactionIconGenerator initWithCache:scale:]([PKPaymentTransactionIconGenerator alloc], "initWithCache:scale:", 1, PKUIScreenScale());
    iconGenerator = v2->_iconGenerator;
    v2->_iconGenerator = v6;

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
  v3 = CFSTR("kInstallmentCellIdentifier");
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
  objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("kInstallmentCellIdentifier"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterInstallmentPresenter _configureCell:item:collectionView:indexPath:](self, "_configureCell:item:collectionView:indexPath:", v11, v10, v9, v8);

  return v11;
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  PKPayLaterFinancingPlanInstallmentCell *sampleCell;
  id v9;
  PKPayLaterFinancingPlanInstallmentCell *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  sampleCell = self->_sampleCell;
  v9 = a4;
  -[PKPayLaterInstallmentPresenter _configureCell:item:collectionView:indexPath:](self, "_configureCell:item:collectionView:indexPath:", sampleCell, a3, v9, a5);
  v10 = self->_sampleCell;
  objc_msgSend(v9, "bounds");
  v12 = v11;

  +[PKDashboardCollectionViewCell defaultHorizontalInset](PKDashboardCollectionViewCell, "defaultHorizontalInset");
  -[PKPayLaterIconCell sizeThatFits:](v10, "sizeThatFits:", v12 + v13 * -2.0, 3.40282347e38);
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PKPayLaterFinancingPlanViewController *v24;
  void *v25;
  PKPayLaterFinancingPlanViewController *v26;
  PKPayLaterFinancingPlanViewController *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  PKPayLaterFinancingPlanViewController *v32;
  id v33;
  id location;
  _QWORD v35[3];
  _QWORD v36[4];

  v36[3] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v28 = a5;
  v29 = a6;
  v14 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = v12;
    objc_msgSend(v15, "financingPlan");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0D66A58];
    v18 = *MEMORY[0x1E0D68858];
    v36[0] = *MEMORY[0x1E0D68850];
    v19 = *MEMORY[0x1E0D68F50];
    v35[0] = v18;
    v35[1] = v19;
    objc_msgSend(v15, "pageTag");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v20;
    v35[2] = *MEMORY[0x1E0D68BD0];
    objc_msgSend(v16, "productType");
    PKPayLaterAccountProductTypeToString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "subject:sendEvent:", *MEMORY[0x1E0D69918], v22);

    objc_msgSend(v15, "paymentIntentController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = [PKPayLaterFinancingPlanViewController alloc];
    objc_msgSend(v23, "payLaterAccount");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[PKPayLaterFinancingPlanViewController initWithFinancingPlan:payLaterAccount:paymentIntentController:merchantIcon:iconGenerator:](v24, "initWithFinancingPlan:payLaterAccount:paymentIntentController:merchantIcon:iconGenerator:", v16, v25, v23, 0, self->_iconGenerator);

    objc_initWeak(&location, self);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __109__PKPayLaterInstallmentPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke;
    v30[3] = &unk_1E3E63B10;
    objc_copyWeak(&v33, &location);
    v31 = v13;
    v27 = v26;
    v32 = v27;
    -[PKPayLaterFinancingPlanViewController preflightWithCompletion:](v27, "preflightWithCompletion:", v30);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);

  }
}

void __109__PKPayLaterInstallmentPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "pkui_viewControllerFromResponderChain");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pushViewController:animated:", *(_QWORD *)(a1 + 40), 1);

    WeakRetained = v5;
  }

}

- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5
{
  id v7;
  NSString *v8;
  NSString *v9;
  NSComparisonResult v10;
  PKPayLaterFinancingPlanInstallmentCell *v11;
  PKPayLaterFinancingPlanInstallmentCell *v12;
  PKPayLaterFinancingPlanInstallmentCell *sampleCell;

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
      v11 = [PKPayLaterFinancingPlanInstallmentCell alloc];
      v12 = -[PKDashboardCollectionViewCell initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      sampleCell = self->_sampleCell;
      self->_sampleCell = v12;

    }
  }
}

- (void)_configureCell:(id)a3 item:(id)a4 collectionView:(id)a5 indexPath:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v9;
      v13 = v20;
      objc_msgSend(v12, "financingPlan");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "relevantInstallment");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pkui_viewControllerFromResponderChain");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v11, "row");
      objc_msgSend(v12, "paymentIntentController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "setFinancingPlan:installment:rowIndex:paymentIntentController:presentingViewController:", v14, v15, v17, v18, v16);
      objc_msgSend(v15, "dueDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setIconDate:animated:", v19, 0);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconGenerator, 0);
  objc_storeStrong((id *)&self->_sampleCell, 0);
}

@end
