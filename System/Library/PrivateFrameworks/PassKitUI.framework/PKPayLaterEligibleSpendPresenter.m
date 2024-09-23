@implementation PKPayLaterEligibleSpendPresenter

- (PKPayLaterEligibleSpendPresenter)init
{
  PKPayLaterEligibleSpendPresenter *v2;
  PKDashboardTitleDetailCell *v3;
  uint64_t v4;
  PKDashboardTitleDetailCell *sampleCell;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPayLaterEligibleSpendPresenter;
  v2 = -[PKPayLaterEligibleSpendPresenter init](&v7, sel_init);
  if (v2)
  {
    v3 = [PKDashboardTitleDetailCell alloc];
    v4 = -[PKDashboardTitleDetailCell initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    sampleCell = v2->_sampleCell;
    v2->_sampleCell = (PKDashboardTitleDetailCell *)v4;

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
  v3 = CFSTR("kPayLaterEligibleSpendCellIdentifier");
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
  objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("kPayLaterEligibleSpendCellIdentifier"), a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterEligibleSpendPresenter _configureCell:item:collectionView:](self, "_configureCell:item:collectionView:", v10, v9, v8);

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
  -[PKPayLaterEligibleSpendPresenter _configureCell:item:collectionView:](self, "_configureCell:item:collectionView:", sampleCell, a3, v8);
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
  id v18;
  id v19;
  PKPayLaterEligibleSpendViewController *v20;
  void *v21;
  PKPayLaterEligibleSpendViewController *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  PKPayLaterSetupFlowController *v30;
  PKPayLaterSetupFlowController *payLaterSetupFlowController;
  PKPayLaterSetupFlowController *v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  id v38;
  id location;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v13, "cellForItemAtIndexPath:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && !self->_loadingContent)
    {
      v18 = v12;
      if (-[PKPayLaterEligibleSpendPresenter _payLaterAccountHasEligibleSpend:](self, "_payLaterAccountHasEligibleSpend:", v18))
      {
        v19 = v18;
        v20 = [PKPayLaterEligibleSpendViewController alloc];
        v33 = v19;
        objc_msgSend(v19, "payLaterAccount");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[PKPayLaterEligibleSpendViewController initWithPayLaterAccount:](v20, "initWithPayLaterAccount:", v21);

        objc_msgSend(v13, "pkui_viewControllerFromResponderChain");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "navigationController");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "pushViewController:animated:", v22, 1);

        v25 = (void *)MEMORY[0x1E0D66A58];
        v42 = *MEMORY[0x1E0D68858];
        v43[0] = *MEMORY[0x1E0D68818];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "subject:sendEvent:", *MEMORY[0x1E0D69918], v26);

      }
      else
      {
        self->_loadingContent = 1;
        -[PKPayLaterEligibleSpendPresenter _updateAccessoryForCell:eligibleSpendItem:](self, "_updateAccessoryForCell:eligibleSpendItem:", v17, v18);
        v27 = (void *)MEMORY[0x1E0D66A58];
        v40 = *MEMORY[0x1E0D68858];
        v41 = *MEMORY[0x1E0D68868];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "subject:sendEvent:", *MEMORY[0x1E0D69918], v28);

        objc_msgSend(v18, "payLaterAccount");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKPayLaterSetupFlowController defaultPayLaterSetupFlowControllerForAccount:controllerContext:referrerIdentifier:](PKPayLaterSetupFlowController, "defaultPayLaterSetupFlowControllerForAccount:controllerContext:referrerIdentifier:", v29, 3, 0);
        v30 = (PKPayLaterSetupFlowController *)objc_claimAutoreleasedReturnValue();
        payLaterSetupFlowController = self->_payLaterSetupFlowController;
        self->_payLaterSetupFlowController = v30;

        objc_initWeak(&location, self);
        v32 = self->_payLaterSetupFlowController;
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __111__PKPayLaterEligibleSpendPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke;
        v34[3] = &unk_1E3E62218;
        objc_copyWeak(&v38, &location);
        v34[4] = self;
        v35 = v17;
        v36 = v18;
        v37 = v13;
        -[PKPayLaterSetupFlowController fetchPayLaterDynamicContentWithCompletion:](v32, "fetchPayLaterDynamicContentWithCompletion:", v34);

        objc_destroyWeak(&v38);
        objc_destroyWeak(&location);
      }

    }
  }

}

void __111__PKPayLaterEligibleSpendPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  char v15;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __111__PKPayLaterEligibleSpendPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke_2;
  block[3] = &unk_1E3E621F0;
  objc_copyWeak(&v14, (id *)(a1 + 64));
  v6 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v10 = v6;
  v7 = *(id *)(a1 + 48);
  v15 = a2;
  v11 = v7;
  v12 = v5;
  v13 = *(id *)(a1 + 56);
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v14);
}

void __111__PKPayLaterEligibleSpendPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;
  id v15;
  id location;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __111__PKPayLaterEligibleSpendPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke_3;
    v12 = &unk_1E3E61EE8;
    objc_copyWeak(&v15, &location);
    v13 = *(id *)(a1 + 40);
    v14 = *(id *)(a1 + 48);
    v3 = (void (**)(_QWORD))_Block_copy(&v9);
    if (!*(_BYTE *)(a1 + 80) || *(_QWORD *)(a1 + 56))
    {
      PKDisplayableErrorForCommonType();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PKAccountDisplayableError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = PKAlertForDisplayableErrorWithHandlers(v4, 0, 0, 0);
      if (v7)
      {
        v5 = v7;
        objc_msgSend(*(id *)(a1 + 64), "pkui_viewControllerFromResponderChain", v9, v10, v11, v12, v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "presentViewController:animated:completion:", v5, 1, v3);

      }
      else
      {
        v3[2](v3);
        v5 = 0;
      }
    }
    else
    {
      objc_msgSend(WeakRetained[2], "firstViewController", v9, v10, v11, v12, v13);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "pkui_viewControllerFromResponderChain");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, v3);
    }

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

}

void __111__PKPayLaterEligibleSpendPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke_3(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    WeakRetained[24] = 0;
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateAccessoryForCell:eligibleSpendItem:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
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
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      v9 = v19;
      objc_msgSend(v8, "payLaterAccount");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "payLaterDetails");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "maximumEligibleSpendAmount");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[PKPayLaterEligibleSpendPresenter _payLaterAccountHasEligibleSpend:](self, "_payLaterAccountHasEligibleSpend:", v8);
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        PKLocalizedCocoonString(CFSTR("AVAILABLE_TO_SPEND"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "formattedStringValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        PKLocalizedCocoonString(CFSTR("NEW_PURCHASE_BUTTON"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
        v17 = objc_claimAutoreleasedReturnValue();

        v16 = 0;
        v14 = (void *)v17;
      }
      objc_msgSend(v9, "setTitleText:detail:", v15, v16);
      objc_msgSend(v9, "setTitleTextColor:", v14);
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDetailTextColor:", v18);

      -[PKPayLaterEligibleSpendPresenter _updateAccessoryForCell:eligibleSpendItem:](self, "_updateAccessoryForCell:eligibleSpendItem:", v9, v8);
    }
  }

}

- (void)_updateAccessoryForCell:(id)a3 eligibleSpendItem:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v6 = a3;
  v8 = v6;
  if (self->_loadingContent)
  {
    v7 = 2;
  }
  else
  {
    v7 = -[PKPayLaterEligibleSpendPresenter _payLaterAccountHasEligibleSpend:](self, "_payLaterAccountHasEligibleSpend:", a4);
    v6 = v8;
  }
  objc_msgSend(v6, "setAccessory:", v7);

}

- (BOOL)_payLaterAccountHasEligibleSpend:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "payLaterAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "payLaterDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasEligibleSpend");

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payLaterSetupFlowController, 0);
  objc_storeStrong((id *)&self->_sampleCell, 0);
}

@end
