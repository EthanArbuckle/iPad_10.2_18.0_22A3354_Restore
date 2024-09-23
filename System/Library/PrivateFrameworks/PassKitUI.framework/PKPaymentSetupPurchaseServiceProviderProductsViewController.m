@implementation PKPaymentSetupPurchaseServiceProviderProductsViewController

- (PKPaymentSetupPurchaseServiceProviderProductsViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 product:(id)a6
{
  id v11;
  id v12;
  PKPaymentSetupPurchaseServiceProviderProductsViewController *v13;
  PKPaymentSetupPurchaseServiceProviderProductsViewController *v14;
  uint64_t v15;
  PKPaymentProvisioningMethodMetadata *provisioningMethodMetadata;
  void *v17;
  void *v18;
  PKPaymentServiceProviderProductsListSectionController *v19;
  PKPaymentServiceProviderProductsListSectionController *listSectionController;
  void *v21;
  void *v22;
  id v23;
  objc_super v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a6;
  v25.receiver = self;
  v25.super_class = (Class)PKPaymentSetupPurchaseServiceProviderProductsViewController;
  v13 = -[PKPaymentSetupOptionsViewController initWithProvisioningController:context:delegate:](&v25, sel_initWithProvisioningController_context_delegate_, a3, a4, 0);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_product, a6);
    objc_storeStrong((id *)&v14->_setupDelegate, a5);
    -[PKPaymentSetupProduct provisioningMethodMetadataForType:](v14->_product, "provisioningMethodMetadataForType:", *MEMORY[0x1E0D6AE28]);
    v15 = objc_claimAutoreleasedReturnValue();
    provisioningMethodMetadata = v14->_provisioningMethodMetadata;
    v14->_provisioningMethodMetadata = (PKPaymentProvisioningMethodMetadata *)v15;

    -[PKDynamicCollectionViewController setUseItemIdentityWhenUpdating:](v14, "setUseItemIdentityWhenUpdating:", 1);
    -[PKPaymentProvisioningMethodMetadata digitalIssuanceMetadata](v14->_provisioningMethodMetadata, "digitalIssuanceMetadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "serviceProviderProducts");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = -[PKPaymentServiceProviderProductsListSectionController initWithIdentifier:serviceProviderProducts:]([PKPaymentServiceProviderProductsListSectionController alloc], "initWithIdentifier:serviceProviderProducts:", CFSTR("ServiceProviderProducts"), v18);
    listSectionController = v14->_listSectionController;
    v14->_listSectionController = v19;

    -[PKPaymentServiceProviderProductsListSectionController setDelegate:](v14->_listSectionController, "setDelegate:", v14);
    v26[0] = v14->_listSectionController;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupOptionsViewController setSections:animated:](v14, "setSections:animated:", v21, 0);

    -[PKPaymentSetupPurchaseServiceProviderProductsViewController navigationItem](v14, "navigationItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
    objc_msgSend(v23, "configureWithDefaultBackground");
    objc_msgSend(v22, "setStandardAppearance:", v23);

  }
  return v14;
}

- (void)didSelectServiceProviderProduct:(id)a3
{
  PKProvisioningAnalyticsSessionUIReporter *reporter;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  reporter = self->_reporter;
  v5 = *MEMORY[0x1E0D68AA0];
  v12[0] = *MEMORY[0x1E0D68BD8];
  v6 = *MEMORY[0x1E0D68740];
  v11[0] = v5;
  v11[1] = v6;
  v7 = a3;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProvisioningAnalyticsSessionUIReporter reportEvent:](reporter, "reportEvent:", v9);

  WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
  objc_msgSend(WeakRetained, "purchaseServiceProviderProductsViewController:didSelectServiceProviderProduct:", self, v7);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentSetupPurchaseServiceProviderProductsViewController;
  -[PKPaymentSetupOptionsViewController viewDidLoad](&v5, sel_viewDidLoad);
  PKLocalizedPaymentString(CFSTR("DCI_COMMUTE_PLANS_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v3);

  PKLocalizedPaymentString(CFSTR("DCI_COMMUTE_PLANS_DESCRIPTION"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSubtitleText:](self, "setSubtitleText:", v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupPurchaseServiceProviderProductsViewController;
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
  v8[2] = __87__PKPaymentSetupPurchaseServiceProviderProductsViewController_preflightWithCompletion___block_invoke;
  v8[3] = &unk_1E3E632B8;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  v7 = -[PKPaymentSetupProduct digitalCardCachedImage:](product, "digitalCardCachedImage:", v8);

}

void __87__PKPaymentSetupPurchaseServiceProviderProductsViewController_preflightWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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

- (PKPaymentSetupProduct)product
{
  return self->_product;
}

- (PKPaymentSetupPurchaseServiceProviderProductsViewControllerFlowDelegate)flowDelegate
{
  return (PKPaymentSetupPurchaseServiceProviderProductsViewControllerFlowDelegate *)objc_loadWeakRetained((id *)&self->_flowDelegate);
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
  objc_storeStrong((id *)&self->_product, 0);
  objc_storeStrong((id *)&self->_listSectionController, 0);
  objc_storeStrong((id *)&self->_provisioningMethodMetadata, 0);
  objc_storeStrong((id *)&self->_setupDelegate, 0);
}

@end
