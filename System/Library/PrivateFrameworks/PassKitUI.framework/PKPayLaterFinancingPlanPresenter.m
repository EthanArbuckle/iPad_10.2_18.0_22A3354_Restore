@implementation PKPayLaterFinancingPlanPresenter

- (PKPayLaterFinancingPlanPresenter)init
{
  PKPayLaterFinancingPlanPresenter *v2;
  PKPayLaterFinancingPlanCell *v3;
  uint64_t v4;
  PKPayLaterFinancingPlanCell *sampleCell;
  PKPaymentTransactionIconGenerator *v6;
  PKPaymentTransactionIconGenerator *iconGenerator;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterFinancingPlanPresenter;
  v2 = -[PKPayLaterFinancingPlanPresenter init](&v9, sel_init);
  if (v2)
  {
    v3 = [PKPayLaterFinancingPlanCell alloc];
    v4 = -[PKDashboardCollectionViewCell initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    sampleCell = v2->_sampleCell;
    v2->_sampleCell = (PKPayLaterFinancingPlanCell *)v4;

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
  v3 = CFSTR("kFinancingPlanCellIdentifier");
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
  objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("kFinancingPlanCellIdentifier"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlanPresenter _configureCell:item:collectionView:indexPath:](self, "_configureCell:item:collectionView:indexPath:", v11, v10, v9, v8);

  return v11;
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  PKPayLaterFinancingPlanCell *sampleCell;
  id v9;
  PKPayLaterFinancingPlanCell *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  sampleCell = self->_sampleCell;
  v9 = a4;
  -[PKPayLaterFinancingPlanPresenter _configureCell:item:collectionView:indexPath:](self, "_configureCell:item:collectionView:indexPath:", sampleCell, a3, v9, a5);
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
  PKPayLaterFinancingPlanViewController *v23;
  void *v24;
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
    v36[0] = *MEMORY[0x1E0D68838];
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

    v23 = [PKPayLaterFinancingPlanViewController alloc];
    objc_msgSend(v15, "payLaterAccount");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "paymentIntentController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[PKPayLaterFinancingPlanViewController initWithFinancingPlan:payLaterAccount:paymentIntentController:merchantIcon:iconGenerator:](v23, "initWithFinancingPlan:payLaterAccount:paymentIntentController:merchantIcon:iconGenerator:", v16, v24, v25, 0, self->_iconGenerator);

    objc_initWeak(&location, self);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __111__PKPayLaterFinancingPlanPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke;
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

void __111__PKPayLaterFinancingPlanPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke(uint64_t a1)
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
  PKPayLaterFinancingPlanCell *v11;
  PKPayLaterFinancingPlanCell *v12;
  PKPayLaterFinancingPlanCell *sampleCell;

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
      v11 = [PKPayLaterFinancingPlanCell alloc];
      v12 = -[PKDashboardCollectionViewCell initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      sampleCell = self->_sampleCell;
      self->_sampleCell = v12;

    }
  }
}

- (void)_configureCell:(id)a3 item:(id)a4 collectionView:(id)a5 indexPath:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  PKPaymentTransactionIconGenerator *iconGenerator;
  void *v17;
  double v18;
  double v19;
  double v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v10;
      v24 = v11;
      objc_msgSend(v24, "financingPlan");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setFinancingPlan:context:rowIndex:", v15, 0, objc_msgSend(v13, "row"));
      objc_initWeak(&location, self);
      iconGenerator = self->_iconGenerator;
      objc_msgSend(v15, "merchant");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = PKPayLaterUICellIconSize();
      v20 = v19;
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __81__PKPayLaterFinancingPlanPresenter__configureCell_item_collectionView_indexPath___block_invoke;
      v25[3] = &unk_1E3E6E2F0;
      objc_copyWeak(&v30, &location);
      v26 = v14;
      v21 = v15;
      v27 = v21;
      v28 = v12;
      v22 = v26;
      v29 = v22;
      -[PKPaymentTransactionIconGenerator iconForPayLaterMerchant:size:ignoreLogoURL:requestType:iconHandler:](iconGenerator, "iconForPayLaterMerchant:size:ignoreLogoURL:requestType:iconHandler:", v17, 0, 0, v25, v18, v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "setIcon:animated:", v23, 0);
      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);

    }
  }

}

void __81__PKPayLaterFinancingPlanPresenter__configureCell_item_collectionView_indexPath___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __81__PKPayLaterFinancingPlanPresenter__configureCell_item_collectionView_indexPath___block_invoke_2;
  v5[3] = &unk_1E3E75280;
  v6 = v3;
  v4 = v3;
  objc_copyWeak(&v11, a1 + 8);
  v7 = a1[4];
  v8 = a1[5];
  v9 = a1[6];
  v10 = a1[7];
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v11);
}

void __81__PKPayLaterFinancingPlanPresenter__configureCell_item_collectionView_indexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    if (!WeakRetained)
    {
LABEL_13:

      return;
    }
    v13 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 40), "financingPlan");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "planIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "planIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    v7 = v5;
    if (v6 == v7)
    {

    }
    else
    {
      v8 = v7;
      if (!v6 || !v7)
      {

        goto LABEL_12;
      }
      v9 = objc_msgSend(v6, "isEqualToString:", v7);

      WeakRetained = v13;
      if ((v9 & 1) == 0)
        goto LABEL_13;
    }
    objc_msgSend(*(id *)(a1 + 56), "indexPathsForVisibleItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "indexPathForCell:", *(_QWORD *)(a1 + 64));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "containsObject:", v11);

    objc_msgSend(*(id *)(a1 + 40), "setIcon:animated:", *(_QWORD *)(a1 + 32), v12);
LABEL_12:
    WeakRetained = v13;
    goto LABEL_13;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconGenerator, 0);
  objc_storeStrong((id *)&self->_sampleCell, 0);
}

@end
