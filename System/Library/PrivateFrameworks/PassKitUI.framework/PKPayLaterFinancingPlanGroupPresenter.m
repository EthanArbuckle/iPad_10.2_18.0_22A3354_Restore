@implementation PKPayLaterFinancingPlanGroupPresenter

- (PKPayLaterFinancingPlanGroupPresenter)init
{
  PKPayLaterFinancingPlanGroupPresenter *v2;
  PKDashboardTitleDetailCell *v3;
  uint64_t v4;
  PKDashboardTitleDetailCell *sampleCell;
  NSNumberFormatter *v6;
  NSNumberFormatter *numberFormatter;
  uint64_t v8;
  PKAccountService *accountService;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKPayLaterFinancingPlanGroupPresenter;
  v2 = -[PKPayLaterFinancingPlanGroupPresenter init](&v11, sel_init);
  if (v2)
  {
    v3 = [PKDashboardTitleDetailCell alloc];
    v4 = -[PKDashboardTitleDetailCell initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    sampleCell = v2->_sampleCell;
    v2->_sampleCell = (PKDashboardTitleDetailCell *)v4;

    v6 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    numberFormatter = v2->_numberFormatter;
    v2->_numberFormatter = v6;

    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    accountService = v2->_accountService;
    v2->_accountService = (PKAccountService *)v8;

    -[PKAccountService registerObserver:](v2->_accountService, "registerObserver:", v2);
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
  v3 = CFSTR("kFinancingPlanGroupCellIdentifier");
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("kFinancingPlanGroupCellIdentifier"), a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlanGroupPresenter _configureCell:item:collectionView:](self, "_configureCell:item:collectionView:", v10, v9, v8);

  return v10;
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  PKDashboardTitleDetailCell *sampleCell;
  id v8;
  PKDashboardTitleDetailCell *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  sampleCell = self->_sampleCell;
  v8 = a4;
  -[PKPayLaterFinancingPlanGroupPresenter _configureCell:item:collectionView:](self, "_configureCell:item:collectionView:", sampleCell, a3, v8);
  v9 = self->_sampleCell;
  objc_msgSend(v8, "bounds");
  v11 = v10;

  +[PKDashboardCollectionViewCell defaultHorizontalInset](PKDashboardCollectionViewCell, "defaultHorizontalInset");
  -[PKDashboardTitleDetailCell sizeThatFits:](v9, "sizeThatFits:", v11 + v12 * -2.0, 3.40282347e38);
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  PKAccountService *accountService;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id location;
  _QWORD aBlock[4];
  id v38;
  PKPayLaterFinancingPlanGroupPresenter *v39;
  id v40;
  id v41;
  _QWORD v42[2];
  _QWORD v43[4];

  v43[2] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v32 = a5;
  v14 = a6;
  v15 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v12;
    v17 = (void *)MEMORY[0x1E0D66A58];
    v18 = *MEMORY[0x1E0D69438];
    v43[0] = *MEMORY[0x1E0D68820];
    v19 = *MEMORY[0x1E0D68F50];
    v42[0] = v18;
    v42[1] = v19;
    objc_msgSend(v16, "pageTag", v32);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "subject:sendEvent:", *MEMORY[0x1E0D69918], v21);

    v22 = objc_alloc(MEMORY[0x1E0D668F8]);
    objc_msgSend(v16, "payLaterAccount");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "accountIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v22, "initWithAccountIdentifier:queryItems:", v24, 8);

    v26 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __116__PKPayLaterFinancingPlanGroupPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke;
    aBlock[3] = &unk_1E3E62460;
    v27 = v16;
    v38 = v27;
    v39 = self;
    v28 = v25;
    v40 = v28;
    v41 = v13;
    v29 = _Block_copy(aBlock);
    v30 = v29;
    if (self->_completedFinancingPlans)
    {
      (*((void (**)(void *))v29 + 2))(v29);
    }
    else
    {
      objc_initWeak(&location, self);
      accountService = self->_accountService;
      v33[0] = v26;
      v33[1] = 3221225472;
      v33[2] = __116__PKPayLaterFinancingPlanGroupPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke_2;
      v33[3] = &unk_1E3E67B80;
      objc_copyWeak(&v35, &location);
      v34 = v30;
      -[PKAccountService financingPlansWithQuery:completion:](accountService, "financingPlansWithQuery:completion:", v28, v33);

      objc_destroyWeak(&v35);
      objc_destroyWeak(&location);
    }

  }
}

void __116__PKPayLaterFinancingPlanGroupPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "payLaterAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "paymentIntentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPayLaterFinancingPlanListViewController completedFinancingPlansListViewControllerWithPayLaterAccount:paymentIntentController:completedFinancingPlans:completedFinancingPlansQuery:](PKPayLaterFinancingPlanListViewController, "completedFinancingPlansListViewControllerWithPayLaterAccount:paymentIntentController:completedFinancingPlans:completedFinancingPlansQuery:", v2, v3, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), *(_QWORD *)(a1 + 48));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 56), "pkui_viewControllerFromResponderChain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushViewController:animated:", v6, 1);

}

void __116__PKPayLaterFinancingPlanGroupPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __116__PKPayLaterFinancingPlanGroupPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke_3;
  block[3] = &unk_1E3E61B90;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
}

void __116__PKPayLaterFinancingPlanGroupPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "completedFinancingPlans");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)WeakRetained[4];
    WeakRetained[4] = v2;

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5
{
  id v7;
  NSString *v8;
  NSString *v9;
  NSComparisonResult v10;
  PKDashboardTitleDetailCell *v11;
  PKDashboardTitleDetailCell *v12;
  PKDashboardTitleDetailCell *sampleCell;

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
      v11 = [PKDashboardTitleDetailCell alloc];
      v12 = -[PKDashboardTitleDetailCell initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      sampleCell = self->_sampleCell;
      self->_sampleCell = v12;

    }
  }
}

- (void)_configureCell:(id)a3 item:(id)a4 collectionView:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSNumberFormatter *numberFormatter;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      v9 = v16;
      PKLocalizedCocoonString(CFSTR("COMPLETED_LOANS"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      numberFormatter = self->_numberFormatter;
      v12 = (void *)MEMORY[0x1E0CB37E8];
      v13 = objc_msgSend(v8, "financingPlansCount");

      objc_msgSend(v12, "numberWithInteger:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSNumberFormatter stringFromNumber:](numberFormatter, "stringFromNumber:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setTitleText:detail:", v10, v15);
      objc_msgSend(v9, "setAccessory:", 1);

    }
  }

}

- (void)_removeCachedFinancingPlans
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__PKPayLaterFinancingPlanGroupPresenter__removeCachedFinancingPlans__block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __68__PKPayLaterFinancingPlanGroupPresenter__removeCachedFinancingPlans__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 32);
  *(_QWORD *)(v1 + 32) = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedFinancingPlans, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_sampleCell, 0);
}

@end
