@implementation PKPaymentPassMakeDefaultViewController

- (PKPaymentPassMakeDefaultViewController)initWithProvisioningController:(id)a3 paymentPass:(id)a4 context:(int64_t)a5
{
  id v9;
  id v10;
  PKPaymentPassMakeDefaultViewController *v11;
  PKPaymentPassMakeDefaultViewController *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentPassMakeDefaultViewController;
  v11 = -[PKExplanationViewController initWithContext:](&v14, sel_initWithContext_, a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_provisioningController, a3);
    objc_storeStrong((id *)&v12->_pass, a4);
    -[PKSecureElementPass loadImageSetSync:preheat:](v12->_pass, "loadImageSetSync:preheat:", 0, 1);
  }

  return v12;
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
  PKPassView *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PKPaymentPassMakeDefaultViewController;
  -[PKExplanationViewController loadView](&v15, sel_loadView);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dockView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "footerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKSecureElementPass supportsBarcodePayment](self->_pass, "supportsBarcodePayment"))
  {
    PKLocalizedAquamanString(CFSTR("PAYMENT_ACCOUNT_MAKE_DEFAULT_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedAquamanString(CFSTR("PAYMENT_ACCOUNT_MAKE_DEFAULT_BODY"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedAquamanString(CFSTR("PAYMENT_MAKE_DEFAULT_CONFIRM_BUTTON"));
  }
  else
  {
    PKLocalizedPaymentString(CFSTR("PAYMENT_MAKE_DEFAULT_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("PAYMENT_MAKE_DEFAULT_BODY"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("PAYMENT_MAKE_DEFAULT_CONFIRM_BUTTON"));
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleText:", v6);
  objc_msgSend(v4, "primaryButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:forState:", v8, 0);

  objc_msgSend(v3, "setForceShowSetupLaterButton:", 1);
  objc_msgSend(v5, "setManualEntryButton:", 0);
  objc_msgSend(v3, "setBodyText:", v7);
  objc_msgSend(v5, "setupLaterButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("PAYMENT_MAKE_DEFAULT_SETUP_LATER_BUTTON"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:forState:", v11, 0);

  v12 = -[PKPassView initWithPass:content:suppressedContent:]([PKPassView alloc], "initWithPass:content:suppressedContent:", self->_pass, 5, 1911);
  -[PKPaymentPassMakeDefaultViewController _snapshotSize](self, "_snapshotSize");
  -[PKPassView snapshotOfFrontFaceWithRequestedSize:](v12, "snapshotOfFrontFaceWithRequestedSize:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v13);
  objc_msgSend(v3, "setShowPrivacyView:", 0);
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "showCheckmark:animated:", 0, 0);
  objc_msgSend(v3, "setNeedsLayout");
  -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", 0);
  -[PKExplanationViewController setShowDoneButton:](self, "setShowDoneButton:", 0);
  -[PKPaymentPassMakeDefaultViewController navigationItem](self, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHidesBackButton:animated:", 1, 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentPassMakeDefaultViewController;
  -[PKPaymentPassMakeDefaultViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKProvisioningAnalyticsSessionUIReporter reportViewAppeared](self->_reporter, "reportViewAppeared");
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  void *v4;
  void *v5;

  -[PKExplanationViewController explanationView](self, "explanationView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dockView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setButtonsEnabled:", 0);

  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 0);
  -[PKPaymentPassMakeDefaultViewController _makePaymentPassDefault](self, "_makePaymentPassDefault");
  -[PKPaymentPassMakeDefaultViewController proceedToNextScreen](self, "proceedToNextScreen");
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  void *v4;
  void *v5;
  PKProvisioningAnalyticsSessionUIReporter *reporter;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[PKExplanationViewController explanationView](self, "explanationView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dockView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setButtonsEnabled:", 0);

  reporter = self->_reporter;
  v8 = *MEMORY[0x1E0D69418];
  v9[0] = *MEMORY[0x1E0D69410];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:context:](reporter, "reportButtonPressed:context:", 3, v7);

  -[PKPaymentPassMakeDefaultViewController proceedToNextScreen](self, "proceedToNextScreen");
}

- (void)proceedToNextScreen
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);
  objc_msgSend(WeakRetained, "paymentPassMakeDefaultViewControllerDidFinish:", self);

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

- (void)_makePaymentPassDefault
{
  NSObject *v3;
  void *v4;
  void *v5;
  PKProvisioningAnalyticsSessionUIReporter *reporter;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  if ((-[PKSecureElementPass supportsDefaultCardSelection](self->_pass, "supportsDefaultCardSelection") & 1) != 0)
  {
    -[PKPaymentProvisioningController webService](self->_provisioningController, "webService");
    v3 = objc_claimAutoreleasedReturnValue();
    -[NSObject targetDevice](v3, "targetDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[PKSecureElementPass uniqueID](self->_pass, "uniqueID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "paymentWebService:setDefaultPaymentPassUniqueIdentifier:", v3, v5);

      reporter = self->_reporter;
      v7 = 1;
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Error: Target device does not support setting default", v9, 2u);
      }

      reporter = self->_reporter;
      v7 = 0;
    }
    -[PKProvisioningAnalyticsSessionUIReporter reportPageCompleted:context:](reporter, "reportPageCompleted:context:", v7, 0);

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Attempted to set default with pass that does not allow default selection. Skipping.", buf, 2u);
    }
  }

}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;

  v4 = a3;
  -[PKPaymentPassMakeDefaultViewController view](self, "view", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", v4 ^ 1);

  -[PKExplanationViewController showSpinner:](self, "showSpinner:", v4);
}

- (PKPaymentPassMakeDefaultViewControllerDelegate)flowItemDelegate
{
  return (PKPaymentPassMakeDefaultViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_flowItemDelegate);
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
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_provisioningController, 0);
}

@end
