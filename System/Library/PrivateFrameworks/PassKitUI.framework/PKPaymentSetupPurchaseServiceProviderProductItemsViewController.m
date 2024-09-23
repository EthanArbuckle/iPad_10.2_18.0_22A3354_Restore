@implementation PKPaymentSetupPurchaseServiceProviderProductItemsViewController

- (PKPaymentSetupPurchaseServiceProviderProductItemsViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 product:(id)a5 serviceProviderProduct:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  PKPaymentSetupPurchaseServiceProviderProductItemsViewController *v16;
  _QWORD v18[4];
  id v19;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  objc_msgSend(v10, "items");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __137__PKPaymentSetupPurchaseServiceProviderProductItemsViewController_initWithProvisioningController_context_product_serviceProviderProduct___block_invoke;
  v18[3] = &unk_1E3E776D0;
  v19 = v10;
  v14 = v10;
  objc_msgSend(v13, "pk_arrayByApplyingBlock:", v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[PKPaymentSetupPurchaseServiceProviderProductItemsViewController _initWithProvisioningController:context:product:primaryServiceProviderProduct:serviceProviderProductWithItems:](self, "_initWithProvisioningController:context:product:primaryServiceProviderProduct:serviceProviderProductWithItems:", v12, a4, v11, v14, v15);
  return v16;
}

PKPaymentSetupServiceProviderProductWithItem *__137__PKPaymentSetupPurchaseServiceProviderProductItemsViewController_initWithProvisioningController_context_product_serviceProviderProduct___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PKPaymentSetupServiceProviderProductWithItem *v4;

  v3 = a2;
  v4 = -[PKPaymentSetupServiceProviderProductWithItem initWithServiceProviderProduct:item:]([PKPaymentSetupServiceProviderProductWithItem alloc], "initWithServiceProviderProduct:item:", *(_QWORD *)(a1 + 32), v3);

  return v4;
}

- (PKPaymentSetupPurchaseServiceProviderProductItemsViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 product:(id)a5 serviceProviderProductWithItems:(id)a6
{
  return (PKPaymentSetupPurchaseServiceProviderProductItemsViewController *)-[PKPaymentSetupPurchaseServiceProviderProductItemsViewController _initWithProvisioningController:context:product:primaryServiceProviderProduct:serviceProviderProductWithItems:](self, "_initWithProvisioningController:context:product:primaryServiceProviderProduct:serviceProviderProductWithItems:", a3, a4, a5, 0, a6);
}

- (id)_initWithProvisioningController:(id)a3 context:(int64_t)a4 product:(id)a5 primaryServiceProviderProduct:(id)a6 serviceProviderProductWithItems:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  PKPaymentSetupPurchaseServiceProviderProductItemsViewController *v16;
  PKPaymentSetupPurchaseServiceProviderProductItemsViewController *v17;
  uint64_t v18;
  PKPaymentProvisioningMethodMetadata *provisioningMethodMetadata;
  PKPaymentSetupPurchaseController *v20;
  PKPaymentSetupPurchaseController *purchaseController;
  PKPaymentServiceProviderItemsSectionController *v22;
  void *v23;
  uint64_t v24;
  PKPaymentServiceProviderItemsSectionController *listSectionController;
  void *v26;
  void *v27;
  id v28;
  objc_super v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v30.receiver = self;
  v30.super_class = (Class)PKPaymentSetupPurchaseServiceProviderProductItemsViewController;
  v16 = -[PKPaymentSetupOptionsViewController initWithProvisioningController:context:delegate:](&v30, sel_initWithProvisioningController_context_delegate_, v12, a4, 0);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_product, a5);
    v17->_hasSelectedItems = 0;
    objc_storeStrong((id *)&v17->_primaryServiceProviderProduct, a6);
    -[PKDynamicCollectionViewController setUseItemIdentityWhenUpdating:](v17, "setUseItemIdentityWhenUpdating:", 1);
    -[PKPaymentSetupProduct provisioningMethodMetadataForType:](v17->_product, "provisioningMethodMetadataForType:", *MEMORY[0x1E0D6AE28]);
    v18 = objc_claimAutoreleasedReturnValue();
    provisioningMethodMetadata = v17->_provisioningMethodMetadata;
    v17->_provisioningMethodMetadata = (PKPaymentProvisioningMethodMetadata *)v18;

    v20 = -[PKPaymentSetupPurchaseController initWithProvisioningController:context:purchaseControllerDelegate:product:provisioningMetadata:]([PKPaymentSetupPurchaseController alloc], "initWithProvisioningController:context:purchaseControllerDelegate:product:provisioningMetadata:", v12, a4, v17, v13, v17->_provisioningMethodMetadata);
    purchaseController = v17->_purchaseController;
    v17->_purchaseController = v20;

    v22 = [PKPaymentServiceProviderItemsSectionController alloc];
    -[PKPaymentProvisioningMethodMetadata currency](v17->_provisioningMethodMetadata, "currency");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[PKPaymentServiceProviderItemsSectionController initWithIdentifier:serviceProviderProductWithItems:currency:delegate:](v22, "initWithIdentifier:serviceProviderProductWithItems:currency:delegate:", CFSTR("ServiceProviderItems"), v15, v23, v17);
    listSectionController = v17->_listSectionController;
    v17->_listSectionController = (PKPaymentServiceProviderItemsSectionController *)v24;

    v31[0] = v17->_listSectionController;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupOptionsViewController setSections:animated:](v17, "setSections:animated:", v26, 0);

    -[PKPaymentSetupPurchaseServiceProviderProductItemsViewController navigationItem](v17, "navigationItem");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
    objc_msgSend(v28, "configureWithDefaultBackground");
    objc_msgSend(v27, "setStandardAppearance:", v28);

  }
  return v17;
}

- (void)viewDidLoad
{
  PKDigitalIssuanceServiceProviderProduct *primaryServiceProviderProduct;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKPaymentSetupPurchaseServiceProviderProductItemsViewController;
  -[PKPaymentSetupOptionsViewController viewDidLoad](&v11, sel_viewDidLoad);
  -[PKDynamicCollectionViewController setRetainCellSelectionCellOnReload:](self, "setRetainCellSelectionCellOnReload:", 1);
  primaryServiceProviderProduct = self->_primaryServiceProviderProduct;
  if (primaryServiceProviderProduct)
  {
    -[PKDigitalIssuanceServiceProviderProduct localizedDisplayName](primaryServiceProviderProduct, "localizedDisplayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v4);

    -[PKDigitalIssuanceServiceProviderProduct localizedDescription](self->_primaryServiceProviderProduct, "localizedDescription");
  }
  else
  {
    PKLocalizedPaymentString(CFSTR("DCI_COMMUTE_PLANS_TITLE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v5);

    PKLocalizedPaymentString(CFSTR("DCI_COMMUTE_PLANS_DESCRIPTION"));
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSubtitleText:](self, "setSubtitleText:", v6);

  PKUIImageNamed(CFSTR("PlaceholderCardArt_Large"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupPurchaseServiceProviderProductItemsViewController _setHeroCardImage:](self, "_setHeroCardImage:", v7);

  -[PKPaymentSetupPurchaseServiceProviderProductItemsViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupPurchaseServiceProviderProductItemsViewController _rightBarButton](self, "_rightBarButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRightBarButtonItem:", v9);

  objc_msgSend(v8, "rightBarButtonItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", self->_hasSelectedItems);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupPurchaseServiceProviderProductItemsViewController;
  -[PKPaymentSetupOptionsViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKProvisioningAnalyticsSessionUIReporter reportViewAppeared](self->_reporter, "reportViewAppeared");
}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  PKPaymentSetupProduct *product;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  product = self->_product;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __91__PKPaymentSetupPurchaseServiceProviderProductItemsViewController_preflightWithCompletion___block_invoke;
  v8[3] = &unk_1E3E632B8;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  v7 = -[PKPaymentSetupProduct digitalCardCachedImage:](product, "digitalCardCachedImage:", v8);

}

void __91__PKPaymentSetupPurchaseServiceProviderProductItemsViewController_preflightWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setHeroCardImage:", v4);
    v4 = v6;
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, 1, v4);
    v4 = v6;
  }

}

- (id)_rightBarButton
{
  void *v3;
  void *v4;

  PKLocalizedPaymentString(CFSTR("SETUP_PURCHASE_ACTION_BUY"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v3, 2, self, sel__rightBarButtonPressed_);

  return v4;
}

- (void)_rightBarButtonPressed:(id)a3
{
  PKPaymentSetupPurchaseController *purchaseController;
  PKPaymentSetupProduct *product;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  if (self->_hasSelectedItems)
  {
    -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 0);
    purchaseController = self->_purchaseController;
    product = self->_product;
    -[PKPaymentSetupServiceProviderProductWithItem serviceProviderProduct](self->_selectedItemPair, "serviceProviderProduct");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupServiceProviderProductWithItem item](self->_selectedItemPair, "item");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupPurchaseController paymentRequestForProduct:serviceProviderProduct:productItem:](purchaseController, "paymentRequestForProduct:serviceProviderProduct:productItem:", product, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __90__PKPaymentSetupPurchaseServiceProviderProductItemsViewController__rightBarButtonPressed___block_invoke;
    v11[3] = &unk_1E3E63520;
    v11[4] = self;
    v12 = v8;
    v10 = v8;
    objc_msgSend(v9, "canPresentPaymentRequest:completion:", v10, v11);

  }
}

void __90__PKPaymentSetupPurchaseServiceProviderProductItemsViewController__rightBarButtonPressed___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD block[5];
  id v5;
  uint64_t v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__PKPaymentSetupPurchaseServiceProviderProductItemsViewController__rightBarButtonPressed___block_invoke_2;
  block[3] = &unk_1E3E63480;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __90__PKPaymentSetupPurchaseServiceProviderProductItemsViewController__rightBarButtonPressed___block_invoke_2(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 1328), "presetPaymentRequest:forResultType:", a1[5], a1[6]);
}

- (BOOL)acceptedTerms
{
  return -[PKPaymentSetupPurchaseController acceptedTerms](self->_purchaseController, "acceptedTerms");
}

- (void)_setHeroCardImage:(id)a3
{
  void *v4;
  PKHeroCardExplanationHeaderView *v5;
  id v6;

  v6 = a3;
  -[PKPaymentSetupOptionsViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topArtView");
  v5 = (PKHeroCardExplanationHeaderView *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[PKHeroCardExplanationHeaderView initWithImage:]([PKHeroCardExplanationHeaderView alloc], "initWithImage:", 0);
    -[PKHeroCardExplanationHeaderView setPadding:](v5, "setPadding:", 0);
    -[PKHeroCardExplanationHeaderView setSize:](v5, "setSize:", 0);
    -[PKHeroCardExplanationHeaderView setHideBackground:](v5, "setHideBackground:", 1);
    -[PKHeroCardExplanationHeaderView setHideShadow:](v5, "setHideShadow:", 1);
    objc_msgSend(v4, "setTopArtView:", v5);
  }
  -[PKHeroCardExplanationHeaderView setCardImage:](v5, "setCardImage:", v6);

}

- (void)didSelectServiceProviderItem:(id)a3
{
  PKPaymentSetupServiceProviderProductWithItem *v4;
  void *v5;
  void *v6;
  PKPaymentSetupServiceProviderProductWithItem *selectedItemPair;

  v4 = (PKPaymentSetupServiceProviderProductWithItem *)a3;
  self->_hasSelectedItems = 1;
  -[PKPaymentSetupPurchaseServiceProviderProductItemsViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", 1);

  selectedItemPair = self->_selectedItemPair;
  self->_selectedItemPair = v4;

}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  objc_class *v5;
  void (**v6)(id, id);
  id v7;

  v5 = (objc_class *)MEMORY[0x1E0D670A8];
  v6 = (void (**)(id, id))a5;
  v7 = (id)objc_msgSend([v5 alloc], "initWithStatus:errors:", 0, 0);
  v6[2](v6, v7);

}

- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __108__PKPaymentSetupPurchaseServiceProviderProductItemsViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke;
  v3[3] = &unk_1E3E612E8;
  v3[4] = self;
  objc_msgSend(a3, "dismissWithCompletion:", v3);
}

void __108__PKPaymentSetupPurchaseServiceProviderProductItemsViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __108__PKPaymentSetupPurchaseServiceProviderProductItemsViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2;
  block[3] = &unk_1E3E612E8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __108__PKPaymentSetupPurchaseServiceProviderProductItemsViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id WeakRetained;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 1312))
  {
    v3 = *(void **)(v1 + 1344);
    v19 = *MEMORY[0x1E0D68AA0];
    v20[0] = *MEMORY[0x1E0D68BA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reportEvent:", v4);

    v5 = objc_alloc(MEMORY[0x1E0D67110]);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(v6 + 1320);
    v8 = *(_QWORD *)(v6 + 1312);
    objc_msgSend(*(id *)(v6 + 1304), "serviceProviderProduct");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1304), "item");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1272), "currency");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v5, "initWithPaymentSetupProduct:purchase:serviceProviderProduct:item:currency:", v7, v8, v9, v10, v11);

    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 1312);
    *(_QWORD *)(v13 + 1312) = 0;

    objc_msgSend(*(id *)(a1 + 32), "provisioningController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "resolveRequirementsUsingProvisioningMethodMetadata:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1272));
    objc_msgSend(v12, "state");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "requirementsResponse");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setRequirementsResponse:", v17);

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1336));
    objc_msgSend(WeakRetained, "purchaseServiceProviderProductItemsViewController:didPerformPurchaseWithCredential:", *(_QWORD *)(a1 + 32), v12);

  }
}

- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKPaymentSetupPurchaseServiceProviderProductItemsViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePurchase:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  void (**v9)(id, _QWORD);
  void (*v10)(void);
  id v11;
  _QWORD v12[5];
  id v13;

  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __131__PKPaymentSetupPurchaseServiceProviderProductItemsViewController_paymentAuthorizationCoordinator_didAuthorizePurchase_completion___block_invoke;
    v12[3] = &unk_1E3E61388;
    v12[4] = self;
    v13 = v7;
    v9 = (void (**)(id, _QWORD))a5;
    dispatch_async(MEMORY[0x1E0C80D38], v12);
    v9[2](v9, 0);

  }
  else
  {
    v10 = (void (*)(void))*((_QWORD *)a5 + 2);
    v11 = a5;
    v10();

  }
}

void __131__PKPaymentSetupPurchaseServiceProviderProductItemsViewController_paymentAuthorizationCoordinator_didAuthorizePurchase_completion___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1312), *(id *)(a1 + 40));
}

- (void)paymentSetupDidFinish:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (PKPaymentSetupProduct)product
{
  return self->_product;
}

- (PKPaymentSetupPurchaseController)purchaseController
{
  return self->_purchaseController;
}

- (PKPaymentSetupPurchaseServiceProviderProductItemsViewControllerFlowDelegate)flowDelegate
{
  return (PKPaymentSetupPurchaseServiceProviderProductItemsViewControllerFlowDelegate *)objc_loadWeakRetained((id *)&self->_flowDelegate);
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
  objc_storeStrong((id *)&self->_purchaseController, 0);
  objc_storeStrong((id *)&self->_product, 0);
  objc_storeStrong((id *)&self->_purchase, 0);
  objc_storeStrong((id *)&self->_selectedItemPair, 0);
  objc_storeStrong((id *)&self->_listSectionController, 0);
  objc_storeStrong((id *)&self->_primaryServiceProviderProduct, 0);
  objc_storeStrong((id *)&self->_provisioningMethodMetadata, 0);
}

@end
