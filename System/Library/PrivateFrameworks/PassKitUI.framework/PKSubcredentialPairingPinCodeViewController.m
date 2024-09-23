@implementation PKSubcredentialPairingPinCodeViewController

- (PKSubcredentialPairingPinCodeViewController)initWithFlowController:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  PKSubcredentialPairingPinCodeViewController *v9;
  PKSubcredentialPairingPinCodeViewController *v10;
  CGFloat v11;
  CGFloat v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  UIBarButtonItem *nextButton;
  id v19;
  void *v20;

  v7 = a3;
  v8 = a4;
  v9 = -[PKSubcredentialPairingPinCodeViewController init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_flowController, a3);
    objc_storeStrong((id *)&v10->_provisioningContext, a4);
    objc_msgSend(MEMORY[0x1E0DC3938], "sizeForInterfaceOrientation:", 1);
    v10->_keyboardSize.width = v11;
    v10->_keyboardSize.height = v12;
    -[PKSubcredentialPairingPinCodeViewController navigationItem](v10, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, v10, sel_cancelButtonPressed);
    v15 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PKLocalizedPaymentString(CFSTR("NEXT"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithTitle:style:target:action:", v16, 0, v10, sel_nextButtonPressed);
    nextButton = v10->_nextButton;
    v10->_nextButton = (UIBarButtonItem *)v17;

    -[UIBarButtonItem setEnabled:](v10->_nextButton, "setEnabled:", 0);
    objc_msgSend(v13, "setLeftBarButtonItem:", v14);
    objc_msgSend(v13, "setRightBarButtonItem:", v10->_nextButton);
    v19 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
    objc_msgSend(v19, "configureWithTransparentBackground");
    -[PKSubcredentialPairingPinCodeViewController navigationItem](v10, "navigationItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setStandardAppearance:", v19);

  }
  return v10;
}

- (unint64_t)operation
{
  return 2;
}

- (void)viewDidLoad
{
  uint64_t v3;
  unint64_t v4;
  NSObject *v5;
  PKPinCodeField *v6;
  PKPinCodeField *pinCodeView;
  void *v8;
  void *v9;
  void *v10;
  PKExplanationView *v11;
  PKExplanationView *explanationView;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  PKExplanationView *v19;
  void *v20;
  void *v21;
  void *v22;
  UILabel *v23;
  UILabel *helpLabel;
  UILabel *v25;
  void *v26;
  UILabel *v27;
  void *v28;
  UILabel *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_super v38;
  uint8_t buf[4];
  unint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v38.receiver = self;
  v38.super_class = (Class)PKSubcredentialPairingPinCodeViewController;
  -[PKSubcredentialPairingPinCodeViewController viewDidLoad](&v38, sel_viewDidLoad);
  v3 = PKCredentialPairingPincodeLengthOverride();
  if (v3)
  {
    v4 = v3;
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v40 = v4;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Overriding pin code length to: %ld", buf, 0xCu);
    }

  }
  else
  {
    v4 = 8;
  }
  v6 = -[PKPinCodeField initWithPinCodeLength:delegate:]([PKPinCodeField alloc], "initWithPinCodeLength:delegate:", v4, self);
  pinCodeView = self->_pinCodeView;
  self->_pinCodeView = v6;

  -[PKPinCodeField setHyphenatePinCode:](self->_pinCodeView, "setHyphenatePinCode:", v4 > 6);
  objc_msgSend(MEMORY[0x1E0D67538], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSubcredentialPairingFlowControllerContext configuration](self->_provisioningContext, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "provisioningTemplateIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[PKExplanationView initWithContext:delegate:]([PKExplanationView alloc], "initWithContext:delegate:", 0, self);
  explanationView = self->explanationView;
  self->explanationView = v11;

  -[PKExplanationView setTitleHyphenationFactor:](self->explanationView, "setTitleHyphenationFactor:", 0.5);
  -[PKExplanationView dockView](self->explanationView, "dockView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPrimaryButton:", 0);

  objc_msgSend(v8, "provisioningString:templateIdentifier:", CFSTR("CAR_KEY_PAIRING_AUTHENTICATION_CODE_TITLE"), v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    PKLocalizedCredentialString(CFSTR("CAR_KEY_PAIRING_AUTHENTICATION_CODE_TITLE"));
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;

  -[PKSubcredentialPairingPinCodeViewController localizedIssuerName](self, "localizedIssuerName");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  PKStringWithValidatedFormat();
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKExplanationView setTitleText:](self->explanationView, "setTitleText:", v18, v37);
  v19 = self->explanationView;
  objc_msgSend(v8, "provisioningString:templateIdentifier:", CFSTR("CAR_KEY_PAIRING_AUTHENTICATION_CODE_BODY"), v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    -[PKExplanationView setBodyText:](v19, "setBodyText:", v20);
  }
  else
  {
    PKLocalizedCredentialString(CFSTR("CAR_KEY_PAIRING_AUTHENTICATION_CODE_BODY"));
    v21 = v17;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKExplanationView setBodyText:](v19, "setBodyText:", v22);

    v17 = v21;
  }

  v23 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  helpLabel = self->_helpLabel;
  self->_helpLabel = v23;

  -[UILabel setNumberOfLines:](self->_helpLabel, "setNumberOfLines:", 0);
  v25 = self->_helpLabel;
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AA0], (NSString *)*MEMORY[0x1E0DC4918]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v25, "setFont:", v26);

  v27 = self->_helpLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v27, "setTextColor:", v28);

  -[UILabel setTextAlignment:](self->_helpLabel, "setTextAlignment:", 1);
  v29 = self->_helpLabel;
  objc_msgSend(v8, "provisioningString:templateIdentifier:", CFSTR("CAR_KEY_PAIRING_AUTHENTICATION_CODE_HELP"), v10);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    -[UILabel setText:](v29, "setText:", v30);
  }
  else
  {
    PKLocalizedCredentialString(CFSTR("CAR_KEY_PAIRING_AUTHENTICATION_CODE_HELP"));
    v31 = v8;
    v32 = v18;
    v33 = v17;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v29, "setText:", v34);

    v17 = v33;
    v18 = v32;
    v8 = v31;
  }

  -[PKSubcredentialPairingPinCodeViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  PKProvisioningBackgroundColor();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setBackgroundColor:", v36);

  objc_msgSend(v35, "addSubview:", self->explanationView);
  objc_msgSend(v35, "addSubview:", self->_pinCodeView);
  objc_msgSend(v35, "addSubview:", self->_helpLabel);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  CGRect v22;

  v21.receiver = self;
  v21.super_class = (Class)PKSubcredentialPairingPinCodeViewController;
  -[PKSubcredentialPairingPinCodeViewController viewWillLayoutSubviews](&v21, sel_viewWillLayoutSubviews);
  -[PKSubcredentialPairingPinCodeViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "safeAreaInsets");
  -[PKExplanationView setFrame:](self->explanationView, "setFrame:", v5 + v12, v7 + 0.0, v9 - (v12 + v13), v11);
  -[PKPinCodeField sizeThatFits:](self->_pinCodeView, "sizeThatFits:", v9 * 0.8, 1.79769313e308);
  -[PKExplanationView bodyTextView](self->explanationView, "bodyTextView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  CGRectGetMaxY(v22);

  UIRectCenteredXInRect();
  -[PKPinCodeField setFrame:](self->_pinCodeView, "setFrame:");
  objc_msgSend(v3, "readableContentGuide");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layoutFrame");
  v17 = v16;
  v19 = v18;

  -[UILabel sizeThatFits:](self->_helpLabel, "sizeThatFits:", v19, 1.79769313e308);
  -[UILabel setFrame:](self->_helpLabel, "setFrame:", v17, v11 - self->_keyboardSize.height - v20 + -24.0, v19, v20);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKSubcredentialPairingPinCodeViewController;
  -[PKSubcredentialPairingPinCodeViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKPinCodeField becomeFirstResponder](self->_pinCodeView, "becomeFirstResponder");
  +[PKSubcredentialPairingAnalyticsReporter sendViewDidAppearWithPage:](PKSubcredentialPairingAnalyticsReporter, "sendViewDidAppearWithPage:", 1);
}

- (void)nextButtonPressed
{
  NSObject *v2;
  void *v4;
  void *v5;
  PKSubcredentialPairingFlowControllerProtocol *flowController;
  _QWORD v7[5];
  id v8;
  id buf[2];

  if (self->_isAdvancing)
  {
    PKLogFacilityTypeGetObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Attempting to advance flow concurrently", (uint8_t *)buf, 2u);
    }

  }
  else
  {
    +[PKSubcredentialPairingAnalyticsReporter sendButtonPressWithButtonTag:page:](PKSubcredentialPairingAnalyticsReporter, "sendButtonPressWithButtonTag:page:", 2, 1);
    self->_isAdvancing = 1;
    -[PKSubcredentialPairingFlowControllerContext configuration](self->_provisioningContext, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPinCodeField pinCode](self->_pinCodeView, "pinCode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPassword:", v5);

    -[PKSubcredentialPairingFlowControllerContext setPasswordManuallyEntered:](self->_provisioningContext, "setPasswordManuallyEntered:", 1);
    objc_initWeak(buf, self);
    flowController = self->_flowController;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __64__PKSubcredentialPairingPinCodeViewController_nextButtonPressed__block_invoke;
    v7[3] = &unk_1E3E64AF8;
    objc_copyWeak(&v8, buf);
    v7[4] = self;
    -[PKSubcredentialPairingFlowControllerProtocol nextViewControllerFromProvisioningOperation:withCompletion:](flowController, "nextViewControllerFromProvisioningOperation:withCompletion:", self, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

void __64__PKSubcredentialPairingPinCodeViewController_nextButtonPressed__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id *WeakRetained;
  id *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "navigationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __64__PKSubcredentialPairingPinCodeViewController_nextButtonPressed__block_invoke_2;
      v8[3] = &unk_1E3E61C58;
      objc_copyWeak(&v9, v4);
      objc_msgSend(v7, "pk_presentPaymentSetupViewController:animated:completion:", v3, 1, v8);

      objc_destroyWeak(&v9);
    }
    else
    {
      objc_msgSend(WeakRetained[129], "provisioningFinishedWithOperation:", WeakRetained);
    }
  }

}

void __64__PKSubcredentialPairingPinCodeViewController_nextButtonPressed__block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    WeakRetained[1016] = 0;

}

- (void)cancelButtonPressed
{
  PKSubcredentialPairingFlowControllerProtocol *flowController;
  id v4;

  +[PKSubcredentialPairingAnalyticsReporter sendButtonPressWithButtonTag:page:](PKSubcredentialPairingAnalyticsReporter, "sendButtonPressWithButtonTag:page:", 1, 1);
  flowController = self->_flowController;
  if (flowController)
  {
    -[PKSubcredentialPairingFlowControllerProtocol provisioningWasCanceledWithOperation:](flowController, "provisioningWasCanceledWithOperation:", self);
  }
  else
  {
    -[PKSubcredentialPairingPinCodeViewController presentingViewController](self, "presentingViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)resetPinCode
{
  -[PKPinCodeField setPinCode:](self->_pinCodeView, "setPinCode:", 0);
}

- (id)localizedIssuerName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  -[PKSubcredentialPairingFlowControllerContext configuration](self->_provisioningContext, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "issuerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKSubcredentialProvisioningFlowControllerContext localDeviceWebService](self->_provisioningContext, "localDeviceWebService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "targetDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "paymentWebService:supportedRegionFeatureOfType:", v5, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "localizedNameForIssuerWithIdentifier:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    PKLocalizedCredentialString(CFSTR("GENERIC_PARTNER_NAME"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (void)pinCodeTextFieldWasUpdated:(id)a3 isComplete:(BOOL)a4
{
  -[UIBarButtonItem setEnabled:](self->_nextButton, "setEnabled:", a4);
}

- (void)explanationViewDidUpdateLayout:(id)a3
{
  id v3;

  -[PKSubcredentialPairingPinCodeViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (BOOL)suppressFieldDetect
{
  return 1;
}

- (PKSubcredentialPairingFlowControllerContext)provisioningContext
{
  return self->_provisioningContext;
}

- (void)setProvisioningContext:(id)a3
{
  objc_storeStrong((id *)&self->_provisioningContext, a3);
}

- (PKSubcredentialPairingFlowControllerProtocol)flowController
{
  return self->_flowController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flowController, 0);
  objc_storeStrong((id *)&self->_provisioningContext, 0);
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_helpLabel, 0);
  objc_storeStrong((id *)&self->_pinCodeView, 0);
  objc_storeStrong((id *)&self->explanationView, 0);
}

@end
