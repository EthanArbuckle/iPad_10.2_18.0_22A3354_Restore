@implementation PKPaymentSetupWelcomeViewController

- (PKPaymentSetupWelcomeViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 delegate:(id)a5
{
  PKPaymentSetupWelcomeViewController *v5;
  PKPaymentSetupCategoriesSectionController *v6;
  PKPaymentSetupCategoriesSectionController *categoriesSectionController;
  PKPaymentSetupAppExtensionsSectionController *v8;
  PKPaymentSetupAppExtensionsSectionController *appExtensionSectionController;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKPaymentSetupWelcomeViewController;
  v5 = -[PKPaymentSetupOptionsViewController initWithProvisioningController:context:delegate:](&v11, sel_initWithProvisioningController_context_delegate_, a3, a4, a5);
  if (v5)
  {
    v6 = objc_alloc_init(PKPaymentSetupCategoriesSectionController);
    categoriesSectionController = v5->_categoriesSectionController;
    v5->_categoriesSectionController = v6;

    -[PKPaymentSetupCategoriesSectionController setDelegate:](v5->_categoriesSectionController, "setDelegate:", v5);
    v8 = objc_alloc_init(PKPaymentSetupAppExtensionsSectionController);
    appExtensionSectionController = v5->_appExtensionSectionController;
    v5->_appExtensionSectionController = v8;

    -[PKPaymentSetupAppExtensionsSectionController setDelegate:](v5->_appExtensionSectionController, "setDelegate:", v5);
    -[PKDynamicCollectionViewController setUseItemIdentityWhenUpdating:](v5, "setUseItemIdentityWhenUpdating:", 1);
  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PKPaymentSetupOptionsViewController provisioningController](self, "provisioningController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeDelegate:", self);

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupWelcomeViewController;
  -[PKPaymentSetupWelcomeViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  int v4;
  void *v5;
  PKMultiHyperlinkView *v6;
  void *v7;
  void *v8;
  void *v9;
  PKTextRangeHyperlink *v10;
  PKTextRangeHyperlink *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)PKPaymentSetupWelcomeViewController;
  -[PKPaymentSetupOptionsViewController viewDidLoad](&v18, sel_viewDidLoad);
  -[PKDynamicCollectionViewController setRetainCellSelectionCellOnReload:](self, "setRetainCellSelectionCellOnReload:", 1);
  PKCurrentRegion();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("CN"));

  if (v4)
  {
    -[PKPaymentSetupOptionsViewController dockView](self, "dockView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(PKMultiHyperlinkView);
    PKLocalizedPaymentString(CFSTR("WELCOME_PRIVACY_LABEL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("WELCOME_PRIVACY_HYPERLINK"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PKStringWithValidatedFormat();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMultiHyperlinkView setText:](v6, "setText:", v9, v8);
    -[PKMultiHyperlinkView setTextAlignment:](v6, "setTextAlignment:", 1);
    objc_initWeak(&location, self);
    v10 = [PKTextRangeHyperlink alloc];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __50__PKPaymentSetupWelcomeViewController_viewDidLoad__block_invoke;
    v15[3] = &unk_1E3E61310;
    objc_copyWeak(&v16, &location);
    v11 = -[PKTextRangeHyperlink initWithLinkText:action:](v10, "initWithLinkText:action:", v8, v15);
    v19[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMultiHyperlinkView setSources:](v6, "setSources:", v12);

    objc_msgSend(v5, "setAdditionalLinkView:", v6);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
  -[PKPaymentSetupOptionsViewController provisioningController](self, "provisioningController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addDelegate:", self);
  -[PKPaymentSetupWelcomeViewController _updateHeaderContentsWithProvisoningController:](self, "_updateHeaderContentsWithProvisoningController:", v13);
  -[PKPaymentSetupWelcomeViewController reloadSectionsForRequirements:animated:forceReload:](self, "reloadSectionsForRequirements:animated:forceReload:", objc_msgSend(v13, "preflightRequirements"), 0, 0);
  -[PKPaymentSetupWelcomeViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67E60]);

}

void __50__PKPaymentSetupWelcomeViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *MEMORY[0x1E0D699F8]);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "didTapFooterLink:", v1);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupWelcomeViewController;
  -[PKPaymentSetupOptionsViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  -[PKProvisioningAnalyticsSessionUIReporter reportViewAppeared](self->_reporter, "reportViewAppeared");
  -[PKPaymentSetupOptionsViewController provisioningController](self, "provisioningController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupWelcomeViewController reloadSectionsForRequirements:animated:forceReload:](self, "reloadSectionsForRequirements:animated:forceReload:", objc_msgSend(v5, "preflightRequirements"), v3, 0);

  -[PKPaymentSetupWelcomeViewController preflightWithCompletion:](self, "preflightWithCompletion:", 0);
}

- (void)reloadSectionsForRequirements:(unint64_t)a3 animated:(BOOL)a4 forceReload:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v9;
  id v10;

  v5 = a5;
  v6 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKPaymentSetupOptionsViewController provisioningController](self, "provisioningController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupWelcomeViewController _updateFilteredPaymentSetupProductModelForRequirements:provisoningController:forceReload:](self, "_updateFilteredPaymentSetupProductModelForRequirements:provisoningController:forceReload:", a3, v9, v5);
  if (-[PKPaymentSetupCategoriesSectionController updateWithRequirements:provisioningController:paymentSetupProductModel:forceProductConfiguration:](self->_categoriesSectionController, "updateWithRequirements:provisioningController:paymentSetupProductModel:forceProductConfiguration:", a3, v9, self->_filteredPaymentSetupProductModel, v5))
  {
    objc_msgSend(v10, "addObject:", self->_categoriesSectionController);
  }
  if (-[PKPaymentSetupAppExtensionsSectionController updateWithRequirements:paymentSetupProductModel:](self->_appExtensionSectionController, "updateWithRequirements:paymentSetupProductModel:", a3, self->_filteredPaymentSetupProductModel))
  {
    objc_msgSend(v10, "addObject:", self->_appExtensionSectionController);
  }
  -[PKPaymentSetupWelcomeViewController _updateHeaderContentsWithProvisoningController:](self, "_updateHeaderContentsWithProvisoningController:", v9);
  -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:", v10, v6);
  -[PKPaymentSetupOptionsViewController setShowHeaderSpinner:](self, "setShowHeaderSpinner:", (a3 & 0xA) == 0);

}

- (void)_updateFilteredPaymentSetupProductModelForRequirements:(unint64_t)a3 provisoningController:(id)a4 forceReload:(BOOL)a5
{
  char v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PKPaymentSetupProductModel *v14;
  PKPaymentSetupProductModel *filteredPaymentSetupProductModel;
  id v16;

  v6 = a3;
  v16 = a4;
  if (a5
    || (v6 & 2) != 0 && (self->_currentConfiguredRequirements & 2) == 0
    || (v6 & 8) != 0 && (self->_currentConfiguredRequirements & 8) == 0)
  {
    PKCurrentMobileCarrierRegion();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "webService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "targetDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deviceRegion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "paymentSetupProductModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localCredentials");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "filteredPaymentSetupProductModelWithLocalCredentials:setupContext:webService:mobileCarrierRegion:deviceRegion:", v13, -[PKPaymentSetupOptionsViewController context](self, "context"), v9, v8, v11);
    v14 = (PKPaymentSetupProductModel *)objc_claimAutoreleasedReturnValue();
    filteredPaymentSetupProductModel = self->_filteredPaymentSetupProductModel;
    self->_filteredPaymentSetupProductModel = v14;

  }
}

- (void)_updateHeaderContentsWithProvisoningController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "paymentSetupProductModel");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedSubtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    PKLocalizedPaymentString(CFSTR("PAYMENT_SETUP_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v6);

    if (v5)
      goto LABEL_3;
LABEL_5:
    PKLocalizedPaymentString(CFSTR("PAYMENT_SETUP_SUBTITLE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupOptionsViewController setSubtitleText:](self, "setSubtitleText:", v7);

    goto LABEL_6;
  }
  -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v4);
  if (!v5)
    goto LABEL_5;
LABEL_3:
  -[PKPaymentSetupOptionsViewController setSubtitleText:](self, "setSubtitleText:", v5);
LABEL_6:

}

- (void)preflightRequirementsUpdated:(unint64_t)a3 displayableError:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id location;

  v6 = a4;
  v7 = v6;
  if (!self->_isDisplayingError)
  {
    if (v6)
    {
      self->_isDisplayingError = 1;
      -[PKPaymentSetupOptionsViewController setShowHeaderSpinner:](self, "setShowHeaderSpinner:", 0);
      objc_initWeak(&location, self);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __85__PKPaymentSetupWelcomeViewController_preflightRequirementsUpdated_displayableError___block_invoke;
      v9[3] = &unk_1E3E61B68;
      objc_copyWeak(&v10, &location);
      v9[4] = self;
      PKAlertForDisplayableErrorWithHandlers(v7, 0, v9, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentSetupWelcomeViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
      -[PKProvisioningAnalyticsSessionUIReporter reportError:context:](self->_reporter, "reportError:context:", v7, 0);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
    else
    {
      -[PKPaymentSetupWelcomeViewController reloadSectionsForRequirements:animated:forceReload:](self, "reloadSectionsForRequirements:animated:forceReload:", a3, 1, 0);
    }
  }

}

void __85__PKPaymentSetupWelcomeViewController_preflightRequirementsUpdated_displayableError___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v2 = objc_loadWeakRetained(WeakRetained + 165);

  if (v2)
  {
    v3 = objc_loadWeakRetained(WeakRetained + 165);
    objc_msgSend(v3, "welcomeViewControllerDidTerminate:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    objc_msgSend(WeakRetained, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(WeakRetained, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "viewControllerDidTerminateSetupFlow:", WeakRetained);

    }
    else
    {
      objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);
    }
  }

}

- (void)provisioningControllerUpdatedProducts:(id)a3
{
  -[PKPaymentSetupWelcomeViewController reloadSectionsForRequirements:animated:forceReload:](self, "reloadSectionsForRequirements:animated:forceReload:", objc_msgSend(a3, "preflightRequirements"), 0, 1);
}

- (void)provisioningControllerUpdatedAccounts:(id)a3
{
  -[PKPaymentSetupWelcomeViewController reloadSectionsForRequirements:animated:forceReload:](self, "reloadSectionsForRequirements:animated:forceReload:", objc_msgSend(a3, "preflightRequirements"), 1, 1);
}

- (BOOL)didSelectAppExtensionWithIdentifier:(id)a3 title:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD);
  BOOL v12;
  void *v13;
  _QWORD v15[5];
  void (**v16)(id, _QWORD);

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD))a5;
  if (self->_loadingIdentifier)
  {
    if (v11)
      v11[2](v11, 0);
    v12 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_loadingIdentifier, a3);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __92__PKPaymentSetupWelcomeViewController_didSelectAppExtensionWithIdentifier_title_completion___block_invoke;
    v15[3] = &unk_1E3E61338;
    v15[4] = self;
    v16 = v11;
    v12 = -[PKPaymentSetupWelcomeViewController _didSelectItemWithIdentifier:title:category:productIdentifiers:completion:](self, "_didSelectItemWithIdentifier:title:category:productIdentifiers:completion:", 0, v10, 0, v13, v15);

  }
  return v12;
}

uint64_t __92__PKPaymentSetupWelcomeViewController_didSelectAppExtensionWithIdentifier_title_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "deselectCells");
}

- (BOOL)didSelectYourCardsWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  NSString **p_loadingIdentifier;
  NSString *loadingIdentifier;
  id WeakRetained;
  NSString *v10;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))v4;
  p_loadingIdentifier = &self->_loadingIdentifier;
  loadingIdentifier = self->_loadingIdentifier;
  if (!loadingIdentifier)
  {
    objc_storeStrong((id *)&self->_loadingIdentifier, (id)*MEMORY[0x1E0D6AFF8]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
    objc_msgSend(WeakRetained, "welcomeViewControllerDidSelectCardsOnFile:", self);

    v10 = *p_loadingIdentifier;
    *p_loadingIdentifier = 0;

    if (!v5)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v4)
LABEL_3:
    ((void (**)(_QWORD, BOOL))v5)[2](v5, loadingIdentifier == 0);
LABEL_4:

  return loadingIdentifier == 0;
}

- (BOOL)didSelectCategory:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  NSString *v10;
  NSString *loadingIdentifier;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_loadingIdentifier)
  {
    if (v7)
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "identifier");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    loadingIdentifier = self->_loadingIdentifier;
    self->_loadingIdentifier = v10;

    objc_msgSend(v6, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedDisplayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "productIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PKPaymentSetupWelcomeViewController _didSelectItemWithIdentifier:title:category:productIdentifiers:completion:](self, "_didSelectItemWithIdentifier:title:category:productIdentifiers:completion:", v12, v13, v6, v14, v8);

  }
  return v9;
}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = v4;
  if (self->_didPreflight)
  {
    if (v4)
      (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
  else
  {
    self->_didPreflight = 1;
    -[PKPaymentSetupOptionsViewController provisioningController](self, "provisioningController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __63__PKPaymentSetupWelcomeViewController_preflightWithCompletion___block_invoke;
    v7[3] = &unk_1E3E653D8;
    v8 = v5;
    objc_msgSend(v6, "preflightWithCompletion:", v7);

  }
}

uint64_t __63__PKPaymentSetupWelcomeViewController_preflightWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)_didSelectItemWithIdentifier:(id)a3 title:(id)a4 category:(id)a5 productIdentifiers:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  void (**v13)(id, _QWORD);
  void *v14;
  id WeakRetained;
  NSObject *v16;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = (void (**)(id, _QWORD))a7;
  -[PKPaymentSetupProductModel availableProductsForProductIdentifiers:](self->_filteredPaymentSetupProductModel, "availableProductsForProductIdentifiers:", a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    if (v13)
      v13[2](v13, 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
    objc_msgSend(WeakRetained, "welcomeViewController:didSelectCategory:products:", self, v12, v14);
  }
  else
  {
    if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D6AFD8]) & 1) == 0)
    {
      PKLogFacilityTypeGetObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138412290;
        v19 = v11;
        _os_log_impl(&dword_19D178000, v16, OS_LOG_TYPE_DEFAULT, "Error: Category:%@ should have products - using default flow", (uint8_t *)&v18, 0xCu);
      }

    }
    if (v13)
      v13[2](v13, 1);
    WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
    objc_msgSend(WeakRetained, "welcomeViewControllerDidSelectManualEntry:", self);
  }

  return 1;
}

- (void)didTapFooterLink:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD5600]), "initWithURL:", v4);
    -[NSObject setModalPresentationStyle:](v5, "setModalPresentationStyle:", 2);
    -[PKPaymentSetupWelcomeViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Error: Could not open url in: %@", (uint8_t *)&v8, 0xCu);

    }
  }

}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;
  NSString *loadingIdentifier;

  v4 = a4;
  v5 = a3;
  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInteractionEnabled:", !v5);

  loadingIdentifier = self->_loadingIdentifier;
  if (loadingIdentifier)
  {
    if (!v5)
    {
      self->_loadingIdentifier = 0;

      -[PKPaymentSetupCategoriesSectionController hideLoadingIndicatorsAnimated:](self->_categoriesSectionController, "hideLoadingIndicatorsAnimated:", v4);
      -[PKPaymentSetupAppExtensionsSectionController hideLoadingIndicatorsAnimated:](self->_appExtensionSectionController, "hideLoadingIndicatorsAnimated:", v4);
    }
  }
}

- (PKPaymentSetupWelcomeViewControllerFlowDelegate)flowDelegate
{
  return (PKPaymentSetupWelcomeViewControllerFlowDelegate *)objc_loadWeakRetained((id *)&self->_flowDelegate);
}

- (void)setFlowDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_flowDelegate, a3);
}

- (PKProvisioningAnalyticsSessionUIReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
  objc_storeStrong((id *)&self->_reporter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_destroyWeak((id *)&self->_flowDelegate);
  objc_storeStrong((id *)&self->_filteredPaymentSetupProductModel, 0);
  objc_storeStrong((id *)&self->_loadingIdentifier, 0);
  objc_storeStrong((id *)&self->_appExtensionSectionController, 0);
  objc_storeStrong((id *)&self->_categoriesSectionController, 0);
}

@end
