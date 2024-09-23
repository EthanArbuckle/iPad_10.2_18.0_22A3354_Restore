@implementation PKPaymentSetupGetAppViewController

- (PKPaymentSetupGetAppViewController)initWithPaymentProduct:(id)a3 setupContext:(int64_t)a4
{
  id v6;
  PKLinkedApplication *v7;
  void *v8;
  void *v9;
  PKLinkedApplication *v10;
  PKPaymentSetupGetAppViewController *v11;

  v6 = a3;
  v7 = [PKLinkedApplication alloc];
  objc_msgSend(v6, "associatedStoreIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appLaunchURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PKLinkedApplication initWithStoreIDs:defaultLaunchURL:](v7, "initWithStoreIDs:defaultLaunchURL:", v8, v9);

  v11 = -[PKPaymentSetupGetAppViewController initWithPaymentProduct:setupContext:linkedApplication:](self, "initWithPaymentProduct:setupContext:linkedApplication:", v6, a4, v10);
  return v11;
}

- (PKPaymentSetupGetAppViewController)initWithPaymentProduct:(id)a3 setupContext:(int64_t)a4 linkedApplication:(id)a5
{
  id v9;
  id v10;
  PKPaymentSetupGetAppViewController *v11;
  PKPaymentSetupGetAppViewController *v12;
  id v13;
  void *v14;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentSetupGetAppViewController;
  v11 = -[PKExplanationViewController initWithContext:](&v16, sel_initWithContext_, a4);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_product, a3);
    objc_storeStrong((id *)&v12->_linkedApplication, a5);
    -[PKLinkedApplication addObserver:](v12->_linkedApplication, "addObserver:", v12);
    v13 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
    objc_msgSend(v13, "configureWithTransparentBackground");
    -[PKPaymentSetupGetAppViewController navigationItem](v12, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setStandardAppearance:", v13);

  }
  return v12;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  ASCLockupView *appStoreView;
  id v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PKPaymentSetupGetAppViewController;
  -[PKExplanationViewController viewDidLoad](&v15, sel_viewDidLoad);
  -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", 0);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupProduct partnerName](self->_product, "partnerName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowPrivacyView:", 0);
  objc_msgSend(v3, "dockView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrimaryButton:", 0);

  PKLocalizedAquamanString(CFSTR("BARCODE_PAYMENT_ADD_ACCOUNT_TITLE"), CFSTR("%@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleText:", v6);

  PKLocalizedAquamanString(CFSTR("BARCODE_PAYMENT_INSTALL_APP_INSTRUCTION"), CFSTR("%@"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBodyText:", v7);

  v8 = objc_alloc_init(MEMORY[0x1E0CF9BC8]);
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCornerRadius:", 16.0);

  objc_msgSend(v8, "setLayoutMargins:", 16.0, 16.0, 16.0, 16.0);
  PKProvisioningSecondaryBackgroundColor();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v10);

  objc_msgSend(v8, "setSize:", *MEMORY[0x1E0CF9B58]);
  objc_msgSend(v8, "setDelegate:", self);
  appStoreView = self->_appStoreView;
  self->_appStoreView = (ASCLockupView *)v8;
  v12 = v8;

  -[PKPaymentSetupGetAppViewController _updateAppStoreViewRequest](self, "_updateAppStoreViewRequest");
  objc_msgSend(v3, "setBodyView:", v12);

  objc_msgSend(v3, "setBodyViewPadding:", 32.0);
  -[PKPaymentSetupGetAppViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PKProvisioningBackgroundColor();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v14);

  PKPaymentSetupApplyContextAppearance(-[PKExplanationViewController context](self, "context"), v13);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupGetAppViewController;
  -[PKPaymentSetupGetAppViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKProvisioningAnalyticsSessionUIReporter reportViewAppeared](self->_reporter, "reportViewAppeared");
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentSetupGetAppViewController;
  -[PKPaymentSetupGetAppViewController traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, a3);
  -[PKPaymentSetupGetAppViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

}

- (void)lockupViewDidBeginRequest:(id)a3
{
  -[PKProvisioningAnalyticsSessionUIReporter reportOtherButtonPressed:](self->_reporter, "reportOtherButtonPressed:", CFSTR("getApp"));
}

- (void)lockupViewDidInvalidateIntrinsicContentSize:(id)a3
{
  id v3;

  -[PKExplanationViewController explanationView](self, "explanationView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)linkedApplicationDidChangeState:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__PKPaymentSetupGetAppViewController_linkedApplicationDidChangeState___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __70__PKPaymentSetupGetAppViewController_linkedApplicationDidChangeState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAppStoreViewRequest");
}

- (void)_updateAppStoreViewRequest
{
  int64_t v3;
  void *v4;
  ASCLockupView *appStoreView;
  void *v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v3 = -[PKLinkedApplication state](self->_linkedApplication, "state");
  if (v3 != 2)
  {
    if (v3 != 1)
    {
      if (!v3)
        -[PKLinkedApplication reloadApplicationStateIfNecessary](self->_linkedApplication, "reloadApplicationStateIfNecessary");
      return;
    }
    -[PKLinkedApplication storeIdentifier](self->_linkedApplication, "storeIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
      return;
LABEL_6:
    appStoreView = self->_appStoreView;
    _PKCreateASCLookupRequestForStoreID(v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockupView setRequest:](appStoreView, "setRequest:", v6);

    return;
  }
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupGetAppViewController received payment setup product with invalid linked application", v9, 2u);
  }

  -[PKPaymentSetupProduct associatedStoreIdentifiers](self->_product, "associatedStoreIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    goto LABEL_6;
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
  objc_storeStrong((id *)&self->_appStoreView, 0);
  objc_storeStrong((id *)&self->_linkedApplication, 0);
  objc_storeStrong((id *)&self->_product, 0);
}

@end
