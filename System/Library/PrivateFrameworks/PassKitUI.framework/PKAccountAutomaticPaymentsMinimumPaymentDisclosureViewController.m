@implementation PKAccountAutomaticPaymentsMinimumPaymentDisclosureViewController

- (PKAccountAutomaticPaymentsMinimumPaymentDisclosureViewController)initWithController:(id)a3
{
  id v5;
  PKAccountAutomaticPaymentsMinimumPaymentDisclosureViewController *v6;
  PKAccountAutomaticPaymentsMinimumPaymentDisclosureViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountAutomaticPaymentsMinimumPaymentDisclosureViewController;
  v6 = -[PKExplanationViewController initWithContext:](&v9, sel_initWithContext_, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_controller, a3);
    v7->_featureIdentifier = objc_msgSend(v5, "featureIdentifier");
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKAccountAutomaticPaymentsMinimumPaymentDisclosureViewController;
  -[PKExplanationViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedFeatureString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleText:", v4);

  PKLocalizedFeatureString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBodyText:", v5);

  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setShowPrivacyView:", 0);
  objc_msgSend(v3, "dockView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedFeatureString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:forState:", v8, 0);

  objc_msgSend(v7, "setContentEdgeInsets:", 0.0, 16.0, 0.0, 16.0);
  objc_msgSend(v7, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAdjustsFontSizeToFitWidth:", 1);

  objc_msgSend(v7, "sizeToFit");
  -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", 0);

}

- (void)explanationViewDidSelectContinue:(id)a3
{
  -[PKAccountAutomaticPaymentsController performScheduleAutomaticPaymentsFromViewController:](self->_controller, "performScheduleAutomaticPaymentsFromViewController:", self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
