@implementation PKPaymentSetupOptionalExpressModeViewController

- (PKPaymentSetupOptionalExpressModeViewController)initWithProvisioningController:(id)a3 secureElementPass:(id)a4 context:(int64_t)a5
{
  id v9;
  id v10;
  PKPaymentSetupOptionalExpressModeViewController *v11;
  PKPaymentSetupOptionalExpressModeViewController *v12;
  uint64_t v13;
  PKPaymentProvisioningTracker *provisioningTracker;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentSetupOptionalExpressModeViewController;
  v11 = -[PKExplanationViewController initWithContext:](&v16, sel_initWithContext_, a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_provisioningController, a3);
    objc_storeStrong((id *)&v12->_pass, a4);
    objc_msgSend(v9, "provisioningTracker");
    v13 = objc_claimAutoreleasedReturnValue();
    provisioningTracker = v12->_provisioningTracker;
    v12->_provisioningTracker = (PKPaymentProvisioningTracker *)v13;

    -[PKSecureElementPass loadImageSetAsync:preheat:withCompletion:](v12->_pass, "loadImageSetAsync:preheat:withCompletion:", 0, 1, &__block_literal_global_179);
  }

  return v12;
}

void __108__PKPaymentSetupOptionalExpressModeViewController_initWithProvisioningController_secureElementPass_context___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  PKLogFacilityTypeGetObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_19D178000, v0, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupOptionalExpressModeViewController: front face for pass loaded", v1, 2u);
  }

}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PKPassView *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PKPaymentSetupOptionalExpressModeViewController;
  -[PKExplanationViewController loadView](&v16, sel_loadView);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dockView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "footerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedTransitString(CFSTR("OPTIONAL_EXPRESS_SETUP_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleText:", v6);

  objc_msgSend(v4, "primaryButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedTransitString(CFSTR("OPTIONAL_EXPRESS_SETUP_CONFIRM_BUTTON"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:forState:", v8, 0);

  objc_msgSend(v3, "setForceShowSetupLaterButton:", 1);
  objc_msgSend(v5, "setManualEntryButton:", 0);
  -[PKSecureElementPass localizedDescription](self->_pass, "localizedDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedTransitString(CFSTR("OPTIONAL_EXPRESS_SETUP_BODY"), CFSTR("%@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBodyText:", v10);

  objc_msgSend(v5, "setupLaterButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedTransitString(CFSTR("OPTIONAL_EXPRESS_SETUP_LATER_BUTTON"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:forState:", v12, 0);

  v13 = -[PKPassView initWithPass:content:suppressedContent:]([PKPassView alloc], "initWithPass:content:suppressedContent:", self->_pass, 5, 1911);
  -[PKPaymentSetupOptionalExpressModeViewController _snapshotSize](self, "_snapshotSize");
  -[PKPassView snapshotOfFrontFaceWithRequestedSize:](v13, "snapshotOfFrontFaceWithRequestedSize:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v14);
  objc_msgSend(v3, "setShowPrivacyView:", 0);
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "showCheckmark:animated:", 0, 0);
  objc_msgSend(v3, "setNeedsLayout");
  -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", 0);
  -[PKExplanationViewController setShowDoneButton:](self, "setShowDoneButton:", 0);
  -[PKPaymentSetupOptionalExpressModeViewController navigationItem](self, "navigationItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHidesBackButton:animated:", 1, 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupOptionalExpressModeViewController;
  -[PKPaymentSetupOptionalExpressModeViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKProvisioningAnalyticsSessionUIReporter reportViewAppeared](self->_reporter, "reportViewAppeared");
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  PKPaymentProvisioningController *provisioningController;
  void *v8;
  PKPaymentProvisioningTracker *provisioningTracker;
  PKPaymentProvisioningTracker *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PKSecureElementPass uniqueID](self->_pass, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v6;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupOptionalExpressModeViewController: Selected to set pass with uniqueID:%@ as express", buf, 0xCu);

  }
  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 0);
  -[PKExplanationViewController showSpinner:](self, "showSpinner:", 1);
  objc_initWeak((id *)buf, self);
  provisioningController = self->_provisioningController;
  -[PKSecureElementPass paymentPass](self->_pass, "paymentPass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  provisioningTracker = self->_provisioningTracker;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__PKPaymentSetupOptionalExpressModeViewController_explanationViewDidSelectContinue___block_invoke;
  v11[3] = &unk_1E3E61C58;
  objc_copyWeak(&v12, (id *)buf);
  -[PKPaymentProvisioningController finishOptionalExpressModeSetupForPass:withProvisioningTracker:completion:](provisioningController, "finishOptionalExpressModeSetupForPass:withProvisioningTracker:completion:", v8, provisioningTracker, v11);

  v10 = self->_provisioningTracker;
  self->_provisioningTracker = 0;

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);

}

void __84__PKPaymentSetupOptionalExpressModeViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1, int a2)
{
  id *WeakRetained;
  id *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _DWORD v8[2];
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "reporter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reportPageCompleted:context:", 1, 0);

    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4[130], "uniqueID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = 67109378;
      v8[1] = a2;
      v9 = 2112;
      v10 = v7;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupOptionalExpressModeViewController: Finished enabling express mode successfully:%d for pass with uniqueID:%@", (uint8_t *)v8, 0x12u);

    }
    objc_msgSend(v4, "proceedToNextScreen");
  }

}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  PKPaymentProvisioningController *provisioningController;
  void *v10;
  PKPaymentProvisioningTracker *provisioningTracker;
  PKPaymentProvisioningTracker *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PKSecureElementPass uniqueID](self->_pass, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupOptionalExpressModeViewController: Selected to not set pass with uniqueID:%@ as express", buf, 0xCu);

  }
  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 3);
  -[PKExplanationViewController showSpinner:](self, "showSpinner:", 1);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dockView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setButtonsEnabled:", 0);

  objc_initWeak((id *)buf, self);
  provisioningController = self->_provisioningController;
  -[PKSecureElementPass paymentPass](self->_pass, "paymentPass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  provisioningTracker = self->_provisioningTracker;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __86__PKPaymentSetupOptionalExpressModeViewController_explanationViewDidSelectSetupLater___block_invoke;
  v13[3] = &unk_1E3E61310;
  objc_copyWeak(&v14, (id *)buf);
  -[PKPaymentProvisioningController handleOptionalExpressModeSetupDidFinishForPass:withExpressModes:provisioningTracker:completion:](provisioningController, "handleOptionalExpressModeSetupDidFinishForPass:withExpressModes:provisioningTracker:completion:", v10, 0, provisioningTracker, v13);

  v12 = self->_provisioningTracker;
  self->_provisioningTracker = 0;

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);

}

void __86__PKPaymentSetupOptionalExpressModeViewController_explanationViewDidSelectSetupLater___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained[130], "uniqueID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupOptionalExpressModeViewController: Finish without enable express mode for pass with uniqueID:%@", (uint8_t *)&v5, 0xCu);

LABEL_4:
    objc_msgSend(WeakRetained, "reporter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reportPageCompleted:context:", 0, 0);

    objc_msgSend(WeakRetained, "proceedToNextScreen");
    goto LABEL_5;
  }

  if (WeakRetained)
    goto LABEL_4;
LABEL_5:

}

- (void)proceedToNextScreen
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);
  objc_msgSend(WeakRetained, "optionalExpressModeViewControllerDidFinish:", self);

}

- (void)_terminateSetupFlow
{
  NSObject *v3;
  id WeakRetained;
  uint8_t v5[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupOptionalExpressModeViewController: terminate flow", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);
  objc_msgSend(WeakRetained, "optionalExpressModeViewControllerDidFinish:", self);

}

- (CGSize)_snapshotSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 220.0;
  v3 = 134.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;

  v4 = a3;
  -[PKPaymentSetupOptionalExpressModeViewController view](self, "view", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", v4 ^ 1);

  -[PKExplanationViewController showSpinner:](self, "showSpinner:", v4);
}

- (PKPaymentSetupOptionalExpressModeViewControllerFlowDelegate)flowItemDelegate
{
  return (PKPaymentSetupOptionalExpressModeViewControllerFlowDelegate *)objc_loadWeakRetained((id *)&self->_flowItemDelegate);
}

- (void)setFlowItemDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_flowItemDelegate, a3);
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
  objc_destroyWeak((id *)&self->_flowItemDelegate);
  objc_storeStrong((id *)&self->_provisioningTracker, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_provisioningController, 0);
}

@end
