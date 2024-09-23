@implementation PKPaymentSetupBankAppDisambiguationViewController

- (PKPaymentSetupBankAppDisambiguationViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 delegate:(id)a5 paymentSetupProduct:(id)a6
{
  id v11;
  PKPaymentSetupBankAppDisambiguationViewController *v12;
  PKPaymentSetupBankAppDisambiguationViewController *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentSetupBankAppDisambiguationViewController;
  v12 = -[PKPaymentSetupOptionsViewController initWithProvisioningController:context:delegate:](&v15, sel_initWithProvisioningController_context_delegate_, a3, a4, a5);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_paymentSetupProduct, a6);
    -[PKDynamicCollectionViewController setUseItemIdentityWhenUpdating:](v13, "setUseItemIdentityWhenUpdating:", 1);
  }

  return v13;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  PKPaymentSetupBankAppDisambiguationController *v6;
  PKPaymentSetupBankAppDisambiguationController *sectionController;
  void *v8;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupBankAppDisambiguationViewController;
  -[PKPaymentSetupOptionsViewController viewDidLoad](&v9, sel_viewDidLoad);
  -[PKPaymentSetupBankAppDisambiguationViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeftBarButtonItem:", 0);

  PKLocalizedPaymentString(CFSTR("CARD_TYPE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v4);

  PKLocalizedPaymentString(CFSTR("CARD_TYPE_SELECTION_SUBTITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSubtitleText:](self, "setSubtitleText:", v5);

  v6 = -[PKPaymentSetupBankAppDisambiguationController initWithPaymentSetupProduct:]([PKPaymentSetupBankAppDisambiguationController alloc], "initWithPaymentSetupProduct:", self->_paymentSetupProduct);
  sectionController = self->_sectionController;
  self->_sectionController = v6;

  -[PKPaymentSetupBankAppDisambiguationController setDelegate:](self->_sectionController, "setDelegate:", self);
  v10[0] = self->_sectionController;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:", v8, 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupBankAppDisambiguationViewController;
  -[PKPaymentSetupOptionsViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKProvisioningAnalyticsSessionUIReporter reportViewAppeared](self->_reporter, "reportViewAppeared");
}

- (void)didSelectInAppWithCompletion:(id)a3
{
  PKProvisioningAnalyticsSessionUIReporter *reporter;
  id v5;
  void *v6;
  id loadingCompletion;
  id WeakRetained;

  reporter = self->_reporter;
  v5 = a3;
  -[PKProvisioningAnalyticsSessionUIReporter reportOtherButtonPressed:](reporter, "reportOtherButtonPressed:", CFSTR("inApp"));
  v6 = _Block_copy(v5);

  loadingCompletion = self->_loadingCompletion;
  self->_loadingCompletion = v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
  objc_msgSend(WeakRetained, "bankAppDisambiguationViewControllerDidSelectApp:", self);

}

- (void)didSelectCameraWithCompletion:(id)a3
{
  PKProvisioningAnalyticsSessionUIReporter *reporter;
  id v5;
  void *v6;
  id loadingCompletion;
  id WeakRetained;

  reporter = self->_reporter;
  v5 = a3;
  -[PKProvisioningAnalyticsSessionUIReporter reportOtherButtonPressed:](reporter, "reportOtherButtonPressed:", CFSTR("manualEntry"));
  v6 = _Block_copy(v5);

  loadingCompletion = self->_loadingCompletion;
  self->_loadingCompletion = v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
  objc_msgSend(WeakRetained, "bankAppDisambiguationViewControllerDidManualEntry:", self);

}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void (**loadingCompletion)(void);
  id v8;

  v4 = a3;
  -[PKDynamicCollectionViewController collectionView](self, "collectionView", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", !v4);

  if (!v4)
  {
    loadingCompletion = (void (**)(void))self->_loadingCompletion;
    if (loadingCompletion)
    {
      loadingCompletion[2]();
      v8 = self->_loadingCompletion;
      self->_loadingCompletion = 0;

    }
  }
}

- (PKPaymentSetupBankAppDisambiguationViewControllerFlowDelegate)flowDelegate
{
  return (PKPaymentSetupBankAppDisambiguationViewControllerFlowDelegate *)objc_loadWeakRetained((id *)&self->_flowDelegate);
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
  objc_storeStrong(&self->_loadingCompletion, 0);
  objc_storeStrong((id *)&self->_paymentSetupProduct, 0);
  objc_storeStrong((id *)&self->_sectionController, 0);
}

@end
