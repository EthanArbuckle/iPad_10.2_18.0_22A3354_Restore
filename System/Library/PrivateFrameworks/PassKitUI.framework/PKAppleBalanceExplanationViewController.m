@implementation PKAppleBalanceExplanationViewController

- (PKAppleBalanceExplanationViewController)initWithSetupController:(id)a3
{
  id v5;
  PKAppleBalanceExplanationViewController *v6;
  PKAppleBalanceExplanationViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAppleBalanceExplanationViewController;
  v6 = -[PKExplanationViewController initWithContext:](&v9, sel_initWithContext_, objc_msgSend(v5, "setupContext"));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_setupController, a3);
    -[PKExplanationViewController setShowCancelButton:](v7, "setShowCancelButton:", -[PKAppleBalanceSetupController uiOnly](v7->_setupController, "uiOnly"));
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
  void *v10;
  void *v11;
  int v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PKPaymentSetupHeroView *v19;
  int64_t v20;
  void *v21;
  PKPaymentSetupHeroView *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)PKAppleBalanceExplanationViewController;
  -[PKExplanationViewController viewDidLoad](&v28, sel_viewDidLoad);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D65190], "pk_privacyLinkForContext:", 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowPrivacyView:", 1);
  -[PKExplanationViewController setPrivacyLinkController:](self, "setPrivacyLinkController:", v4);
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setBodyDataDetectorTypes:", 0);
  -[PKAppleBalanceExplanationViewController _titleText](self, "_titleText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleText:", v5);

  -[PKAppleBalanceExplanationViewController _bodyText](self, "_bodyText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBodyText:", v6);

  v7 = (void *)MEMORY[0x1E0D66DF8];
  PKPassKitUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLForImageNamed:inBundle:scale:", CFSTR("AppleBalance_Hero"), v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9
    && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "path"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v10, "fileExistsAtPath:", v11),
        v11,
        v10,
        v12))
  {
    v13 = objc_alloc_init(MEMORY[0x1E0D67138]);
    v14 = objc_alloc(MEMORY[0x1E0D67130]);
    v15 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend(v9, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dataWithContentsOfFile:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v14, "initWithIdentifier:imageData:credentialType:", CFSTR("AppleBalance_Hero"), v17, 135);

    if (v18)
    {
      v19 = [PKPaymentSetupHeroView alloc];
      v20 = -[PKAppleBalanceSetupController setupContext](self->_setupController, "setupContext");
      v29[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[PKPaymentSetupHeroView initWithContext:heroImageController:heroImages:](v19, "initWithContext:heroImageController:heroImages:", v20, v13, v21);

    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }
  objc_msgSend(v3, "setHeroView:", v22);
  PKProvisioningSecondaryBackgroundColor();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTopBackgroundColor:", v23);

  objc_msgSend(v3, "dockView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAppleBalanceExplanationViewController _primaryActionTitle](self, "_primaryActionTitle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "primaryButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setTitle:forState:", v25, 0);

  objc_msgSend(v24, "footerView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setManualEntryButton:", 0);

}

- (id)_titleText
{
  return (id)PKLocalizedFeatureString();
}

- (id)_bodyText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[PKAppleBalanceSetupController credential](self->_setupController, "credential");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "product");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "longLocalizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    PKLocalizedFeatureString();
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)_primaryActionTitle
{
  return (id)PKLocalizedFeatureString();
}

- (void)_setShowSpinner:(BOOL)a3
{
  _QWORD block[4];
  id v5;
  BOOL v6;
  id location;

  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__PKAppleBalanceExplanationViewController__setShowSpinner___block_invoke;
  block[3] = &unk_1E3E61C08;
  objc_copyWeak(&v5, &location);
  v6 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __59__PKAppleBalanceExplanationViewController__setShowSpinner___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "explanationView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dockView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setButtonsEnabled:", *(_BYTE *)(a1 + 40) == 0);

    objc_msgSend(v5, "showSpinner:", *(unsigned __int8 *)(a1 + 40));
    WeakRetained = v5;
  }

}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "appleBalanceExplanationViewControllerDidSelectContinue:", self);

}

- (PKAppleBalanceExplanationViewControllerDelegate)delegate
{
  return (PKAppleBalanceExplanationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_setupController, 0);
}

@end
