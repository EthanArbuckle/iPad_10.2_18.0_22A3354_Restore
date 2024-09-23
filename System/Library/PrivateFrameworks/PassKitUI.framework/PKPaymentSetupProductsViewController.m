@implementation PKPaymentSetupProductsViewController

- (PKPaymentSetupProductsViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 delegate:(id)a5 category:(id)a6 paymentSetupProducts:(id)a7
{
  id v12;
  id v13;
  id v14;
  PKPaymentSetupProductsViewController *v15;
  PKPaymentSetupProductsViewController *v16;
  objc_super v18;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)PKPaymentSetupProductsViewController;
  v15 = -[PKPaymentSetupOptionsViewController initWithProvisioningController:context:delegate:](&v18, sel_initWithProvisioningController_context_delegate_, v12, a4, a5);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_category, a6);
    objc_storeStrong((id *)&v16->_paymentSetupProducts, a7);
    objc_msgSend(v12, "addDelegate:", v16);
    -[PKDynamicCollectionViewController setUseItemIdentityWhenUpdating:](v16, "setUseItemIdentityWhenUpdating:", 1);
  }

  return v16;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PKPaymentSetupOptionsViewController provisioningController](self, "provisioningController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeDelegate:", self);

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupProductsViewController;
  -[PKPaymentSetupProductsViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  PKPaymentSetupProductCategory *category;
  void *v5;
  void *v6;
  PKPaymentSetupProductsSectionController *v7;
  void *v8;
  PKPaymentSetupProductsSectionController *v9;
  PKPaymentSetupProductsSectionController *primaryProductSectionController;
  void *v11;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentSetupProductsViewController;
  -[PKPaymentSetupOptionsViewController viewDidLoad](&v12, sel_viewDidLoad);
  -[PKDynamicCollectionViewController setRetainCellSelectionCellOnReload:](self, "setRetainCellSelectionCellOnReload:", 1);
  -[PKPaymentSetupProductCategory localizedTitle](self->_category, "localizedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v3);

  category = self->_category;
  -[PKPaymentSetupOptionsViewController context](self, "context");
  -[PKPaymentSetupProductCategory localizedSubtitleWithIsBridge:](category, "localizedSubtitleWithIsBridge:", PKPaymentSetupContextIsBridge());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSubtitleText:](self, "setSubtitleText:", v5);

  -[PKPaymentSetupOptionsViewController setShowSearchBar:](self, "setShowSearchBar:", -[NSArray count](self->_paymentSetupProducts, "count") > 6);
  -[PKPaymentSetupProductCategory localizedSearchBarDefaultText](self->_category, "localizedSearchBarDefaultText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSearchBarDefaultText:](self, "setSearchBarDefaultText:", v6);

  v7 = [PKPaymentSetupProductsSectionController alloc];
  -[PKPaymentSetupOptionsViewController provisioningController](self, "provisioningController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PKPaymentSetupProductsSectionController initWithProvisoningController:](v7, "initWithProvisoningController:", v8);
  primaryProductSectionController = self->_primaryProductSectionController;
  self->_primaryProductSectionController = v9;

  -[PKPaymentSetupProductsSectionController setDelegate:](self->_primaryProductSectionController, "setDelegate:", self);
  -[PKPaymentSetupProductsSectionController updateWithPaymentSetupProducts:](self->_primaryProductSectionController, "updateWithPaymentSetupProducts:", self->_paymentSetupProducts);
  v13[0] = self->_primaryProductSectionController;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:", v11, 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  PKProvisioningAnalyticsSessionUIReporter *reporter;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupProductsViewController;
  -[PKPaymentSetupOptionsViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  reporter = self->_reporter;
  -[PKPaymentSetupProductCategory identifier](self->_category, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProvisioningAnalyticsSessionUIReporter setProductType:subtype:](reporter, "setProductType:subtype:", v5, 0);

  -[PKProvisioningAnalyticsSessionUIReporter reportViewAppeared](self->_reporter, "reportViewAppeared");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupProductsViewController;
  -[PKPaymentSetupProductsViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  if (-[PKPaymentSetupProductsViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))-[PKProvisioningAnalyticsSessionUIReporter resetProductTypes](self->_reporter, "resetProductTypes");
}

- (void)provisioningControllerUpdatedProducts:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *paymentSetupProducts;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[PKPaymentSetupOptionsViewController provisioningController](self, "provisioningController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paymentSetupProductModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray valueForKey:](self->_paymentSetupProducts, "valueForKey:", CFSTR("productIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "productsForProductIdentifiers:", v6);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  paymentSetupProducts = self->_paymentSetupProducts;
  self->_paymentSetupProducts = v7;

  -[PKPaymentSetupProductsSectionController updateWithPaymentSetupProducts:](self->_primaryProductSectionController, "updateWithPaymentSetupProducts:", self->_paymentSetupProducts);
  v10[0] = self->_primaryProductSectionController;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:", v9, 1);

}

- (void)searchTextDidChangeTo:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentSetupProductsViewController;
  v4 = a3;
  -[PKPaymentSetupOptionsViewController searchTextDidChangeTo:](&v5, sel_searchTextDidChangeTo_, v4);
  -[PKPaymentSetupProductsSectionController applySearchString:](self->_primaryProductSectionController, "applySearchString:", v4, v5.receiver, v5.super_class);

}

- (void)searchBarCancelButtonClicked
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupProductsViewController;
  -[PKPaymentSetupOptionsViewController searchBarCancelButtonClicked](&v3, sel_searchBarCancelButtonClicked);
  -[PKPaymentSetupProductsSectionController applySearchString:](self->_primaryProductSectionController, "applySearchString:", 0);
}

- (void)displayNoResultsViewWithSubtitle:(id)a3 needsManualEntryButton:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[PKPaymentSetupOptionsViewController setShowNoResultsView:animated:](self, "setShowNoResultsView:animated:", 1, 1);
  -[PKPaymentSetupOptionsViewController setNoResultsSubtitle:](self, "setNoResultsSubtitle:", v6);

  if (v4)
  {
    PKLocalizedPaymentString(CFSTR("ADD_A_NEW_CARD"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupOptionsViewController setNoResultsActionButtonTitle:target:action:](self, "setNoResultsActionButtonTitle:target:action:", v7, self, sel__didSelectAddADifferentCard);

  }
}

- (void)hideNoResultsView
{
  -[PKPaymentSetupOptionsViewController setShowNoResultsView:animated:](self, "setShowNoResultsView:animated:", 0, 1);
}

- (BOOL)didSelectProduct:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD);
  PKPaymentSetupProduct **p_currentlyLoadingProduct;
  PKPaymentSetupProduct *currentlyLoadingProduct;
  NSObject *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  PKPaymentSetupProduct *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  p_currentlyLoadingProduct = &self->_currentlyLoadingProduct;
  currentlyLoadingProduct = self->_currentlyLoadingProduct;
  if (currentlyLoadingProduct)
  {
    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[PKPaymentSetupProduct productIdentifier](currentlyLoadingProduct, "productIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "productIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v12;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Already loading product for: %@ cannot select: %@", (uint8_t *)&v17, 0x16u);

    }
    if (v8)
      v8[2](v8, 0);
  }
  else
  {
    objc_storeStrong((id *)&self->_currentlyLoadingProduct, a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
    objc_msgSend(WeakRetained, "productsViewController:didSelectProduct:", self, v7);

    -[PKProvisioningAnalyticsSessionUIReporter setSetupProduct:](self->_reporter, "setSetupProduct:", v7);
    v15 = *p_currentlyLoadingProduct;
    *p_currentlyLoadingProduct = 0;

    if (v8)
      v8[2](v8, 1);
  }

  return currentlyLoadingProduct == 0;
}

- (BOOL)didSelectManualEntryWithCompletion:(id)a3
{
  -[PKPaymentSetupProductsViewController _didSelectAddADifferentCardWithCompletion:](self, "_didSelectAddADifferentCardWithCompletion:", a3);
  return 1;
}

- (void)reloadSectionsRequired
{
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = self->_primaryProductSectionController;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:", v3, 1);

}

- (void)_didSelectAddADifferentCard
{
  -[PKPaymentSetupProductsViewController _didSelectAddADifferentCardWithCompletion:](self, "_didSelectAddADifferentCardWithCompletion:", 0);
}

- (void)_didSelectAddADifferentCardWithCompletion:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
  objc_msgSend(WeakRetained, "productsViewControllerDidSelectManualEntry:", self);

  v5 = v6;
  if (v6)
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
    v5 = v6;
  }

}

- (unint64_t)paymentSetupMarker
{
  return 1;
}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;

  v4 = a4;
  v5 = a3;
  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInteractionEnabled:", !v5);

  if (!v5)
    -[PKPaymentSetupProductsSectionController hideLoadingIndicatorsAnimated:](self->_primaryProductSectionController, "hideLoadingIndicatorsAnimated:", v4);
}

- (PKPaymentSetupProductsViewControllerFlowDelegate)flowDelegate
{
  return (PKPaymentSetupProductsViewControllerFlowDelegate *)objc_loadWeakRetained((id *)&self->_flowDelegate);
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
  objc_storeStrong((id *)&self->_currentlyLoadingProduct, 0);
  objc_storeStrong((id *)&self->_primaryProductSectionController, 0);
  objc_storeStrong((id *)&self->_paymentSetupProducts, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

@end
