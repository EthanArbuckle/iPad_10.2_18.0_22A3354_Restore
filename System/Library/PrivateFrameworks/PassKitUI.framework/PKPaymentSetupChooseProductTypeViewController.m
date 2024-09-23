@implementation PKPaymentSetupChooseProductTypeViewController

- (PKPaymentSetupChooseProductTypeViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 product:(id)a6
{
  id v11;
  id v12;
  id v13;
  PKPaymentSetupChooseProductTypeViewController *v14;
  PKPaymentSetupChooseProductTypeViewController *v15;
  uint64_t v16;
  PKPaymentProvisioningMethodMetadata *provisioningMethodMetadata;
  uint64_t v18;
  UIImage *cardImage;
  void *v20;
  id v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  PKAnimatedNavigationBarTitleView *v26;
  PKAnimatedNavigationBarTitleView *titleIconView;
  PKAnimatedNavigationBarTitleView *v28;
  void *v29;
  UIImageView *v30;
  UIImageView *passView;
  UIImageView *v32;
  void *v33;
  void *v35;
  objc_super v36;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v36.receiver = self;
  v36.super_class = (Class)PKPaymentSetupChooseProductTypeViewController;
  v14 = -[PKDynamicCollectionViewController init](&v36, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_product, a6);
    objc_storeStrong((id *)&v15->_provisioningController, a3);
    v15->_setupContext = a4;
    objc_storeStrong((id *)&v15->_setupDelegate, a5);
    -[PKPaymentSetupProduct provisioningMethodMetadataForType:](v15->_product, "provisioningMethodMetadataForType:", *MEMORY[0x1E0D6AE28]);
    v16 = objc_claimAutoreleasedReturnValue();
    provisioningMethodMetadata = v15->_provisioningMethodMetadata;
    v15->_provisioningMethodMetadata = (PKPaymentProvisioningMethodMetadata *)v16;

    PKUIImageNamed(CFSTR("PlaceholderCardArt_Large"));
    v18 = objc_claimAutoreleasedReturnValue();
    cardImage = v15->_cardImage;
    v15->_cardImage = (UIImage *)v18;

    -[PKPaymentSetupChooseProductTypeViewController navigationItem](v15, "navigationItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
    objc_msgSend(v21, "configureWithOpaqueBackground");
    objc_msgSend(v20, "setStandardAppearance:", v21);
    objc_msgSend(v20, "setTitle:", 0);
    -[PKPaymentSetupChooseProductTypeViewController navigationController](v15, "navigationController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "navigationBar");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "frame");
    v24 = v23;
    v25 = v23 + v23;
    v26 = -[PKAnimatedNavigationBarTitleView initWithFrame:]([PKAnimatedNavigationBarTitleView alloc], "initWithFrame:", 0.0, 0.0, v23 + v23, v23);
    titleIconView = v15->_titleIconView;
    v15->_titleIconView = v26;

    v28 = v15->_titleIconView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemCyanColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAnimatedNavigationBarTitleView setBackgroundColor:](v28, "setBackgroundColor:", v29);

    -[PKAnimatedNavigationBarTitleView setAlpha:](v15->_titleIconView, "setAlpha:", 1.0);
    objc_msgSend(v20, "pkui_setCenterAlignedTitleView:", v15->_titleIconView);
    v30 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    passView = v15->_passView;
    v15->_passView = v30;

    v32 = v15->_passView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v32, "setBackgroundColor:", v33);

    -[UIImageView setFrame:](v15->_passView, "setFrame:", 0.0, 0.0, v25, v24);
    -[UIImageView setAlpha:](v15->_passView, "setAlpha:", 1.0);
    -[PKAnimatedNavigationBarTitleView setTitleView:animated:](v15->_titleIconView, "setTitleView:animated:", v15->_passView, 1);
    -[PKDynamicCollectionViewController setUseItemIdentityWhenUpdating:](v15, "setUseItemIdentityWhenUpdating:", 1);

  }
  return v15;
}

- (void)viewDidLoad
{
  PKPaymentSetupChooseProductListSectionController *v3;
  UIImage *cardImage;
  void *v5;
  PKPaymentSetupChooseProductListSectionController *v6;
  PKPaymentSetupChooseProductListSectionController *listSectionController;
  void *v8;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupChooseProductTypeViewController;
  -[PKDynamicCollectionViewController viewDidLoad](&v9, sel_viewDidLoad);
  v3 = [PKPaymentSetupChooseProductListSectionController alloc];
  cardImage = self->_cardImage;
  -[PKPaymentProvisioningMethodMetadata digitalIssuanceMetadata](self->_provisioningMethodMetadata, "digitalIssuanceMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKPaymentSetupChooseProductListSectionController initWithImage:digitalIssuanceMetadata:](v3, "initWithImage:digitalIssuanceMetadata:", cardImage, v5);
  listSectionController = self->_listSectionController;
  self->_listSectionController = v6;

  -[PKPaymentSetupChooseProductListSectionController setDelegate:](self->_listSectionController, "setDelegate:", self);
  v10[0] = self->_listSectionController;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDynamicCollectionViewController setSections:animated:](self, "setSections:animated:", v8, 1);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupChooseProductTypeViewController;
  -[PKDynamicCollectionViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
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
  v8[2] = __73__PKPaymentSetupChooseProductTypeViewController_preflightWithCompletion___block_invoke;
  v8[3] = &unk_1E3E632B8;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  v7 = -[PKPaymentSetupProduct digitalCardCachedImage:](product, "digitalCardCachedImage:", v8);

}

void __73__PKPaymentSetupChooseProductTypeViewController_preflightWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1048) = 1;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1112), a3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "setImage:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1112));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "setCardImage:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1112));
    objc_msgSend(*(id *)(a1 + 32), "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutSubviews");

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, 1);

}

- (void)didSelectPKPaymentSetupChooseProductListItem:(id)a3
{
  id v4;
  NSString *v5;
  NSString *selectedItemIdentifier;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  selectedItemIdentifier = self->_selectedItemIdentifier;
  self->_selectedItemIdentifier = v5;

  v7 = objc_msgSend(v4, "type");
  if (v7 == 1)
  {
    -[PKPaymentProvisioningMethodMetadata digitalIssuanceMetadata](self->_provisioningMethodMetadata, "digitalIssuanceMetadata");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "serviceProviderProducts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
    objc_msgSend(WeakRetained, "chooseProductTypeViewController:didSelectServiceProducts:", self, v8);

  }
  else
  {
    v10 = objc_loadWeakRetained((id *)&self->_flowDelegate);
    objc_msgSend(v10, "chooseProductTypeViewControllerDidSelectManualEntry:", self);
  }

}

- (BOOL)acceptedTerms
{
  return -[PKPaymentSetupPurchaseController acceptedTerms](self->_purchaseController, "acceptedTerms");
}

- (void)_showSpinner:(BOOL)a3
{
  -[PKPaymentSetupChooseProductListSectionController showLoadingIndicatorsForItemIdentifier:show:](self->_listSectionController, "showLoadingIndicatorsForItemIdentifier:show:", self->_selectedItemIdentifier, a3);
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
  v3[2] = __90__PKPaymentSetupChooseProductTypeViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke;
  v3[3] = &unk_1E3E612E8;
  v3[4] = self;
  objc_msgSend(a3, "dismissWithCompletion:", v3);
}

void __90__PKPaymentSetupChooseProductTypeViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__PKPaymentSetupChooseProductTypeViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2;
  block[3] = &unk_1E3E612E8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __90__PKPaymentSetupChooseProductTypeViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id WeakRetained;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1176);
  *(_QWORD *)(v2 + 1176) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v4 + 1184))
  {
    v5 = *(void **)(v4 + 1216);
    v20 = *MEMORY[0x1E0D68AA0];
    v21[0] = *MEMORY[0x1E0D68BA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reportEvent:", v6);

    v7 = objc_alloc(MEMORY[0x1E0D67110]);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(v8 + 1192);
    v10 = *(_QWORD *)(v8 + 1184);
    v11 = *(_QWORD *)(v8 + 1160);
    v12 = *(_QWORD *)(v8 + 1168);
    objc_msgSend(*(id *)(v8 + 1088), "currency");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v7, "initWithPaymentSetupProduct:purchase:serviceProviderProduct:item:currency:", v9, v10, v11, v12, v13);

    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(v15 + 1184);
    *(_QWORD *)(v15 + 1184) = 0;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "resolveRequirementsUsingProvisioningMethodMetadata:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1088));
    objc_msgSend(v14, "state");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "requirementsResponse");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setRequirementsResponse:", v18);

    objc_msgSend(*(id *)(a1 + 32), "_showSpinner:", 0);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1208));
    objc_msgSend(WeakRetained, "chooseProductTypeViewController:didPerformPurchaseWithCredential:", *(_QWORD *)(a1 + 32), v14);

  }
}

- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKPaymentSetupChooseProductTypeViewController view](self, "view", a3);
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
    v12[2] = __113__PKPaymentSetupChooseProductTypeViewController_paymentAuthorizationCoordinator_didAuthorizePurchase_completion___block_invoke;
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

void __113__PKPaymentSetupChooseProductTypeViewController_paymentAuthorizationCoordinator_didAuthorizePurchase_completion___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1184), *(id *)(a1 + 40));
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  PKPaymentSetupChooseProductTypeViewControllerFlowDelegate **p_flowDelegate;
  id WeakRetained;
  id v6;

  p_flowDelegate = &self->_flowDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)p_flowDelegate);
    objc_msgSend(v6, "chooseProductTypeViewControllerDidTerminate:", self);

  }
  else
  {
    -[PKPaymentSetupViewControllerDelegate viewControllerDidTerminateSetupFlow:](self->_setupDelegate, "viewControllerDidTerminateSetupFlow:", self);
  }
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  PKPaymentSetupPurchaseController *purchaseController;
  id v8;
  id v9;
  id v10;

  v10 = a4;
  purchaseController = self->_purchaseController;
  v8 = a3;
  -[PKPaymentSetupPurchaseController termsController](purchaseController, "termsController");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v8)
    PKPaymentSetupApplyContextAppearance(self->_setupContext, v10);

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

- (PKPaymentSetupChooseProductTypeViewControllerFlowDelegate)flowDelegate
{
  return (PKPaymentSetupChooseProductTypeViewControllerFlowDelegate *)objc_loadWeakRetained((id *)&self->_flowDelegate);
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
  objc_storeStrong((id *)&self->_authorizationCoordinator, 0);
  objc_storeStrong((id *)&self->_postPaidItem, 0);
  objc_storeStrong((id *)&self->_postPaidProduct, 0);
  objc_storeStrong((id *)&self->_selectedItemIdentifier, 0);
  objc_storeStrong((id *)&self->_listSectionController, 0);
  objc_storeStrong((id *)&self->_titleIconView, 0);
  objc_storeStrong((id *)&self->_cardImage, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_passView, 0);
  objc_storeStrong((id *)&self->_provisioningMethodMetadata, 0);
  objc_storeStrong((id *)&self->_setupDelegate, 0);
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
