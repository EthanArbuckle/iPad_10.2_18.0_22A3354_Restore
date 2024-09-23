@implementation PKPayLaterViewController

- (PKPayLaterViewController)initWithPayLaterAccount:(id)a3
{
  id v5;
  PKPayLaterViewController *v6;
  PKPayLaterViewController *v7;
  uint64_t v8;
  PKAccountService *accountService;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPayLaterViewController;
  v6 = -[PKPaymentSetupOptionsViewController initWithProvisioningController:context:delegate:](&v12, sel_initWithProvisioningController_context_delegate_, 0, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_payLaterAccount, a3);
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    accountService = v7->_accountService;
    v7->_accountService = (PKAccountService *)v8;

    -[PKAccountService registerObserver:](v7->_accountService, "registerObserver:", v7);
    -[PKPayLaterViewController navigationItem](v7, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v10, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    objc_msgSend(v10, "setBackButtonDisplayMode:", 2);

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[PKAccountService unregisterObserver:](self->_accountService, "unregisterObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)PKPayLaterViewController;
  -[PKPayLaterViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PKPayLaterViewController;
  -[PKPaymentSetupOptionsViewController viewDidLoad](&v16, sel_viewDidLoad);
  PKPayLaterSetupGreyBackgroundColor();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[PKPayLaterViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setHeaderBackgroundColor:](self, "setHeaderBackgroundColor:", v6);

  -[PKPaymentSetupOptionsViewController headerView](self, "headerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitleAccessoriesEnabled:", 0);

  -[PKPaymentSetupOptionsViewController headerView](self, "headerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRemoveAdditionalTopPadding:", 1);

  -[PKPayLaterViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "backBarButtonItem");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
LABEL_5:

    goto LABEL_6;
  }
  -[PKPayLaterViewController navigationController](self, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "viewControllers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = PKEqualObjects();

  if (v15)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelButtonTapped);
    -[PKPayLaterViewController navigationItem](self, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLeftBarButtonItem:", v9);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterViewController;
  -[PKPaymentSetupOptionsViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKPayLaterViewController _reportViewDidAppear:](self, "_reportViewDidAppear:", 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterViewController;
  -[PKPayLaterViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[PKPayLaterViewController _reportViewDidAppear:](self, "_reportViewDidAppear:", 0);
}

- (void)willMoveToParentViewController:(id)a3
{
  void *v5;
  objc_super v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)PKPayLaterViewController;
  -[PKPayLaterViewController willMoveToParentViewController:](&v6, sel_willMoveToParentViewController_);
  if (!a3)
  {
    v7 = *MEMORY[0x1E0D68858];
    v8[0] = *MEMORY[0x1E0D687C0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterViewController reportAnalyticsEvent:](self, "reportAnalyticsEvent:", v5);

  }
}

- (void)_reportViewDidAppear:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  _QWORD *v6;
  id v7;

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = v5;
  v6 = (_QWORD *)MEMORY[0x1E0D68C50];
  if (!v3)
    v6 = (_QWORD *)MEMORY[0x1E0D68C58];
  objc_msgSend(v5, "setObject:forKey:", *v6, *MEMORY[0x1E0D68AA0]);
  -[PKPayLaterViewController reportAnalyticsEvent:](self, "reportAnalyticsEvent:", v7);

}

- (double)footerViewContentHeight
{
  UIView *footerView;
  unint64_t v3;
  double *v4;
  double v5;

  footerView = self->_footerView;
  v3 = PKUIGetMinScreenType();
  v4 = (double *)((char *)&unk_19DF17FD0 + 8 * v3);
  if (v3 >= 0x12)
    v4 = (double *)MEMORY[0x1E0C9D820];
  -[UIView sizeThatFits:](footerView, "sizeThatFits:", *v4, 1.79769313e308);
  return v5;
}

- (void)setFooterView:(id)a3
{
  UIView *v5;
  UIView *footerView;
  UIView *v7;

  v5 = (UIView *)a3;
  footerView = self->_footerView;
  if (footerView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](footerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_footerView, a3);
    -[PKPayLaterViewController _layoutFooter](self, "_layoutFooter");
    v5 = v7;
  }

}

- (id)navigationBarAnimationText
{
  return 0;
}

- (id)navigationBarAnimationView
{
  return 0;
}

- (double)headerHeight
{
  return 0.0;
}

- (id)additionalAnalyticsDictionary
{
  return 0;
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPayLaterViewController;
  -[PKPaymentSetupOptionsViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[PKPayLaterViewController reloadNavigationBarHeaderFooterLayout](self, "reloadNavigationBarHeaderFooterLayout");
}

- (void)reloadNavigationBarHeaderFooterLayout
{
  double v3;
  double v4;
  double v5;
  double v6;
  double navBarAnimationProgress;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  id v12;

  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentOffset");
  v4 = v3;
  objc_msgSend(v12, "safeAreaInsets");
  v6 = v5;
  navBarAnimationProgress = self->_navBarAnimationProgress;
  -[PKPayLaterViewController headerHeight](self, "headerHeight");
  if (v8 <= 0.0)
  {
    self->_navBarAnimationProgress = 0.0;
    if (navBarAnimationProgress < 1.0)
      goto LABEL_11;
    goto LABEL_9;
  }
  v9 = fmin(fmax(v4 / vabdd_f64(v8, v6), 0.0), 1.0);
  self->_navBarAnimationProgress = v9;
  if (navBarAnimationProgress < 1.0 && v9 >= 1.0)
  {
    v10 = 1;
LABEL_10:
    -[PKPayLaterViewController _updateNavigationBarIconForNavigationBarAppeared:](self, "_updateNavigationBarIconForNavigationBarAppeared:", v10);
    goto LABEL_11;
  }
  if (navBarAnimationProgress >= 1.0 && v9 < 1.0)
  {
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
LABEL_11:
  -[PKPayLaterViewController _layoutFooter](self, "_layoutFooter");
  -[PKPayLaterViewController navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v11);

}

- (void)didTapHyperLink:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PKAccountTermsAndConditionsController *v7;
  PKAccount *payLaterAccount;
  void *v9;
  PKAccountTermsAndConditionsController *v10;
  PKAccountTermsAndConditionsController *termsController;
  PKAccountTermsAndConditionsController *v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[2];
  _QWORD v25[2];
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "linkURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "termsIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (v5)
    {
      objc_msgSend(v5, "scheme");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "containsString:", CFSTR("http"));

      if (v14)
      {
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5600]), "initWithURL:", v5);
        objc_msgSend(v15, "setModalPresentationStyle:", 2);
        -[PKPayLaterViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, 0);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "openSensitiveURL:withOptions:", v5, 0);
      }

    }
    else
    {
      PKLogFacilityTypeGetObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v4;
        _os_log_impl(&dword_19D178000, v17, OS_LOG_TYPE_DEFAULT, "Error: not opening any link for %@ since there is no URL or terms identifier set.", (uint8_t *)location, 0xCu);
      }

    }
    goto LABEL_14;
  }
  if (self->_payLaterAccount)
  {
    v7 = [PKAccountTermsAndConditionsController alloc];
    payLaterAccount = self->_payLaterAccount;
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PKAccountTermsAndConditionsController initWithAccount:webService:context:termsIdentifier:](v7, "initWithAccount:webService:context:termsIdentifier:", payLaterAccount, v9, -[PKPaymentSetupOptionsViewController context](self, "context"), v6);
    termsController = self->_termsController;
    self->_termsController = v10;

    objc_initWeak(location, self);
    v12 = self->_termsController;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __44__PKPayLaterViewController_didTapHyperLink___block_invoke;
    v22[3] = &unk_1E3E62598;
    objc_copyWeak(&v23, location);
    -[PKAccountTermsAndConditionsController termsViewControllerWithCompletion:](v12, "termsViewControllerWithCompletion:", v22);
    objc_destroyWeak(&v23);
    objc_destroyWeak(location);
LABEL_14:
    objc_msgSend(v4, "analyticsIdentifier");
    v18 = objc_claimAutoreleasedReturnValue();
    v16 = v18;
    if (v18)
    {
      v19 = *MEMORY[0x1E0D68B18];
      v20 = *MEMORY[0x1E0D68858];
      v24[0] = *MEMORY[0x1E0D68AA0];
      v24[1] = v20;
      v25[0] = v19;
      v25[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterViewController reportAnalyticsEvent:](self, "reportAnalyticsEvent:", v21);

    }
    goto LABEL_16;
  }
  PKLogFacilityTypeGetObject();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(location[0]) = 138412290;
    *(id *)((char *)location + 4) = v6;
    _os_log_impl(&dword_19D178000, v16, OS_LOG_TYPE_DEFAULT, "Error: there is no account in order to open termsIdentifier %@", (uint8_t *)location, 0xCu);
  }
LABEL_16:

}

void __44__PKPayLaterViewController_didTapHyperLink___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v5)
    {
      v7 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
      objc_msgSend(WeakRetained, "navigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "presentViewController:animated:completion:", v7, 1, 0);

    }
    else if (v9)
    {
      objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v9, 1, 0);
    }
  }

}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  if (a3)
  {
    v4 = a4;
    v6 = a3;
    -[PKPayLaterViewController navigationController](self, "navigationController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pushViewController:animated:", v6, v4);

  }
}

- (id)navigationControllerViewControllers
{
  void *v2;
  void *v3;

  -[PKPayLaterViewController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)popViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;

  v3 = a3;
  -[PKPayLaterViewController navigationController](self, "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v5, "popViewControllerAnimated:", v3);

}

- (void)reportAnalyticsEvent:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPayLaterViewController pageTag](self, "pageTag");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 && v5)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v7, "setObject:forKey:", v6, *MEMORY[0x1E0D68F50]);
    objc_msgSend(v7, "addEntriesFromDictionary:", v4);
    -[PKPayLaterViewController additionalAnalyticsDictionary](self, "additionalAnalyticsDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addEntriesFromDictionary:", v8);

    objc_msgSend(MEMORY[0x1E0D66A58], "subject:sendEvent:", *MEMORY[0x1E0D69918], v7);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[PKPayLaterViewController additionalAnalyticsSubjects](self, "additionalAnalyticsSubjects", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(MEMORY[0x1E0D66A58], "subject:sendEvent:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), v7);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (id)pageTag
{
  return 0;
}

- (id)additionalAnalyticsSubjects
{
  return 0;
}

- (BOOL)disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (void)accountChanged:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKPayLaterViewController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__PKPayLaterViewController_accountChanged___block_invoke;
  v6[3] = &unk_1E3E61388;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __43__PKPayLaterViewController_accountChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  BOOL v5;
  char v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "accountIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1304), "accountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v2;
  v4 = v3;
  if (v7 == v4)
  {

LABEL_10:
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 1304), *(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "didUpdatePayLaterAccount:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1304));
    return;
  }
  if (v7)
    v5 = v4 == 0;
  else
    v5 = 1;
  if (v5)
  {

    return;
  }
  v6 = objc_msgSend(v7, "isEqualToString:", v4);

  if ((v6 & 1) != 0)
    goto LABEL_10;
}

- (void)accountFinancingPlanUpdated:(id)a3 oldFinancingPlan:(id)a4 accountIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  PKPayLaterViewController *v13;
  id v14;

  v7 = a3;
  v8 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__PKPayLaterViewController_accountFinancingPlanUpdated_oldFinancingPlan_accountIdentifier___block_invoke;
  block[3] = &unk_1E3E61400;
  v12 = v8;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __91__PKPayLaterViewController_accountFinancingPlanUpdated_oldFinancingPlan_accountIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  BOOL v6;
  int v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1304), "accountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  v5 = v3;
  if (v4 == v5)
  {

LABEL_10:
    objc_msgSend(*(id *)(a1 + 40), "didUpdateFinancingPlan:", *(_QWORD *)(a1 + 48));
    return;
  }
  if (v4)
    v6 = v5 == 0;
  else
    v6 = 1;
  v8 = v5;
  if (v6)
  {

    return;
  }
  v7 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v7)
    goto LABEL_10;
}

- (void)accountFinancingPlanRemoved:(id)a3 accountIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  PKPayLaterViewController *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PKPayLaterViewController_accountFinancingPlanRemoved_accountIdentifier___block_invoke;
  block[3] = &unk_1E3E61400;
  v11 = v7;
  v12 = self;
  v13 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __74__PKPayLaterViewController_accountFinancingPlanRemoved_accountIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  BOOL v6;
  int v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1304), "accountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  v5 = v3;
  if (v4 == v5)
  {

LABEL_10:
    objc_msgSend(*(id *)(a1 + 40), "didRemoveFinancingPlan:", *(_QWORD *)(a1 + 48));
    return;
  }
  if (v4)
    v6 = v5 == 0;
  else
    v6 = 1;
  v8 = v5;
  if (v6)
  {

    return;
  }
  v7 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v7)
    goto LABEL_10;
}

- (void)accountFinancingPlanAdded:(id)a3 accountIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  PKPayLaterViewController *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__PKPayLaterViewController_accountFinancingPlanAdded_accountIdentifier___block_invoke;
  block[3] = &unk_1E3E61400;
  v11 = v7;
  v12 = self;
  v13 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __72__PKPayLaterViewController_accountFinancingPlanAdded_accountIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  BOOL v6;
  int v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1304), "accountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  v5 = v3;
  if (v4 == v5)
  {

LABEL_10:
    objc_msgSend(*(id *)(a1 + 40), "didAddFinancingPlan:", *(_QWORD *)(a1 + 48));
    return;
  }
  if (v4)
    v6 = v5 == 0;
  else
    v6 = 1;
  v8 = v5;
  if (v6)
  {

    return;
  }
  v7 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v7)
    goto LABEL_10;
}

- (void)_layoutFooter
{
  void *v3;
  UIView *footerView;
  BOOL v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;

  -[PKPayLaterViewController viewIfLoaded](self, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  footerView = self->_footerView;
  if (footerView)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    v14 = v3;
    -[UIView superview](footerView, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      objc_msgSend(v14, "addSubview:", self->_footerView);
    objc_msgSend(v14, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[PKPayLaterViewController footerViewContentHeight](self, "footerViewContentHeight");
    -[UIView setFrame:](self->_footerView, "setFrame:", 0.0, v8 + v12 - v13, v10, v13);
    v3 = v14;
  }

}

- (void)_updateNavigationBarIconForNavigationBarAppeared:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  PKAnimatedNavigationBarTitleView *navBarImageView;
  void *v7;
  void *v8;
  double v9;
  double v10;
  PKAnimatedNavigationBarTitleView *v11;
  PKAnimatedNavigationBarTitleView *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a3;
  -[PKPayLaterViewController navigationBarAnimationView](self, "navigationBarAnimationView");
  v18 = objc_claimAutoreleasedReturnValue();
  -[PKPayLaterViewController navigationBarAnimationText](self, "navigationBarAnimationText");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v18 | v5
    && (-[PKPayLaterViewController isBeingDismissed](self, "isBeingDismissed") & 1) == 0
    && (-[PKPayLaterViewController isBeingPresented](self, "isBeingPresented") & 1) == 0)
  {
    if (v3)
    {
      if (v18)
      {
        navBarImageView = self->_navBarImageView;
        if (!navBarImageView)
        {
          -[PKPayLaterViewController navigationController](self, "navigationController");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "navigationBar");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "frame");
          v10 = v9;

          v11 = -[PKAnimatedNavigationBarTitleView initWithFrame:]([PKAnimatedNavigationBarTitleView alloc], "initWithFrame:", 0.0, 0.0, v10, v10);
          v12 = self->_navBarImageView;
          self->_navBarImageView = v11;

          -[PKPayLaterViewController navigationItem](self, "navigationItem");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "pkui_setCenterAlignedTitleView:", self->_navBarImageView);

          navBarImageView = self->_navBarImageView;
        }
        v14 = v18;
        goto LABEL_11;
      }
      if (!v5)
        goto LABEL_17;
      -[PKPayLaterViewController navigationItem](self, "navigationItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = v5;
    }
    else
    {
      if (v18)
      {
        navBarImageView = self->_navBarImageView;
        v14 = 0;
LABEL_11:
        -[PKAnimatedNavigationBarTitleView setTitleView:animated:](navBarImageView, "setTitleView:animated:", v14, 1);
        goto LABEL_17;
      }
      if (!v5)
        goto LABEL_17;
      -[PKPayLaterViewController navigationItem](self, "navigationItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = 0;
    }
    objc_msgSend(v15, "_setTitle:animated:", v17, 1);

  }
LABEL_17:

}

- (void)_cancelButtonTapped
{
  -[PKPayLaterViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (PKAccount)payLaterAccount
{
  return self->_payLaterAccount;
}

- (void)setPayLaterAccount:(id)a3
{
  objc_storeStrong((id *)&self->_payLaterAccount, a3);
}

- (PKAccountService)accountService
{
  return self->_accountService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_payLaterAccount, 0);
  objc_storeStrong((id *)&self->_termsController, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_navBarImageView, 0);
}

@end
