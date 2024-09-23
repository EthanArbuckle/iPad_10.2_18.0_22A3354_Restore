@implementation PKBarcodePaymentPrivacyViewController

- (PKBarcodePaymentPrivacyViewController)initWithIssuerName:(id)a3 displayContext:(unint64_t)a4 paymentSetupContext:(int64_t)a5
{
  id v9;
  PKBarcodePaymentPrivacyViewController *v10;
  PKBarcodePaymentPrivacyViewController *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKBarcodePaymentPrivacyViewController;
  v10 = -[PKExplanationViewController initWithContext:](&v13, sel_initWithContext_, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_issuerName, a3);
    v11->_displayContext = a4;
  }

  return v11;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t displayContext;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKBarcodePaymentPrivacyViewController;
  -[PKExplanationViewController viewDidLoad](&v11, sel_viewDidLoad);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dockView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "footerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  displayContext = self->_displayContext;
  if (displayContext == 1)
  {
    objc_msgSend(v4, "primaryButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedAquamanString(CFSTR("DONE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:forState:", v8, 0);

    goto LABEL_5;
  }
  if (!displayContext)
  {
    -[PKExplanationViewController setShowDoneButton:](self, "setShowDoneButton:", 1);
    objc_msgSend(v4, "setPrimaryButton:", 0);
LABEL_5:
    objc_msgSend(v5, "setManualEntryButton:", 0);
  }
  -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", 0);
  PKLocalizedAquamanString(CFSTR("BARCODE_PAYMENT_INTRO_PRIVACY_TITLE"), CFSTR("%@"), self->_issuerName);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleText:", v9);

  PKLocalizedAquamanString(CFSTR("BARCODE_PAYMENT_INTRO_PRIVACY_BODY"), CFSTR("%@%@%@"), self->_issuerName, self->_issuerName, self->_issuerName);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBodyText:", v10);

  objc_msgSend(v3, "setShowPrivacyView:", 0);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_dismiss
{
  id v2;

  -[PKBarcodePaymentPrivacyViewController presentingViewController](self, "presentingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issuerName, 0);
}

@end
