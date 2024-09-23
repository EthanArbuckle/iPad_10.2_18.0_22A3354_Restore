@implementation PKAccountAutomaticPaymentsHeroViewController

- (PKAccountAutomaticPaymentsHeroViewController)initWithController:(id)a3
{
  id v5;
  PKAccountAutomaticPaymentsHeroViewController *v6;
  PKAccountAutomaticPaymentsHeroViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountAutomaticPaymentsHeroViewController;
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;
  uint64_t v36;
  void *v37;
  _QWORD v38[3];
  _QWORD v39[5];

  v39[3] = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)PKAccountAutomaticPaymentsHeroViewController;
  -[PKExplanationViewController viewDidLoad](&v35, sel_viewDidLoad);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedFeatureString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleText:", v4);

  PKLocalizedFeatureString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBodyText:", v5);

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 70.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("clock.arrow.2.circlepath"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:");
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setShowPrivacyView:", 0);
  objc_msgSend(v3, "setTitleHyphenationFactor:", 0.1);
  objc_msgSend(v3, "setTitleAccessoriesEnabled:", 0);
  objc_msgSend(v3, "dockView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("CONTINUE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:forState:", v8, 0);

  objc_msgSend(v7, "setContentEdgeInsets:", 0.0, 16.0, 0.0, 16.0);
  objc_msgSend(v7, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAdjustsFontSizeToFitWidth:", 1);

  v30 = v7;
  objc_msgSend(v7, "sizeToFit");
  -[PKAccountAutomaticPaymentsHeroViewController _updateSetupPrompt](self, "_updateSetupPrompt");
  objc_msgSend(v3, "dockView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "buttonExplanationTextView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  PKLocalizedFeatureString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountAutomaticPaymentsController account](self->_controller, "account");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "creditDetails");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "accountSummary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "balanceStatus");
  v17 = objc_msgSend(v15, "requiresDebtCollectionNotices");
  v32 = v6;
  v31 = v12;
  if (v16 == 2 || v17)
  {
    PKLocalizedFeatureString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\n%@"), v19, v12);
    v18 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = v12;
  }
  v20 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v20, "setLineBreakMode:", 0);
  objc_msgSend(v20, "setAlignment:", 1);
  v38[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(v11, "font");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *MEMORY[0x1E0DC1178];
  v39[0] = v21;
  v39[1] = v20;
  v23 = *MEMORY[0x1E0DC1140];
  v38[1] = v22;
  v38[2] = v23;
  objc_msgSend(v11, "textColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  PKAttributedStringByParsingLinksInString();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAttributedText:", v26);
  objc_msgSend(v11, "setDelegate:", self);
  objc_msgSend(v11, "setDataDetectorTypes:", 2);
  v36 = v23;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLinkTextAttributes:", v28);

  -[PKAccountAutomaticPaymentsHeroViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67FD0]);

}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  PKAccountTermsAndConditionsController *v13;
  void *v14;
  PKAccountTermsAndConditionsController *v15;
  PKAccountTermsAndConditionsController *termsController;
  PKAccountTermsAndConditionsController *v17;
  NSObject *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[PKAccountAutomaticPaymentsController account](self->_controller, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "creditDetails");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "termsIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = [PKAccountTermsAndConditionsController alloc];
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PKAccountTermsAndConditionsController initWithAccount:webService:context:termsIdentifier:](v13, "initWithAccount:webService:context:termsIdentifier:", v10, v14, -[PKAccountAutomaticPaymentsController paymentSetupContext](self->_controller, "paymentSetupContext"), v12);
    termsController = self->_termsController;
    self->_termsController = v15;

    objc_initWeak(location, self);
    v17 = self->_termsController;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __99__PKAccountAutomaticPaymentsHeroViewController_textView_shouldInteractWithURL_inRange_interaction___block_invoke;
    v21[3] = &unk_1E3E62598;
    objc_copyWeak(&v22, location);
    -[PKAccountTermsAndConditionsController termsViewControllerWithCompletion:](v17, "termsViewControllerWithCompletion:", v21);
    objc_destroyWeak(&v22);
    objc_destroyWeak(location);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "accountIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v19;
      _os_log_impl(&dword_19D178000, v18, OS_LOG_TYPE_DEFAULT, "Error: Account: %@ is missing terms and conditions. Using the value in the pass instead.", (uint8_t *)location, 0xCu);

    }
  }

  return 0;
}

void __99__PKAccountAutomaticPaymentsHeroViewController_textView_shouldInteractWithURL_inRange_interaction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v5)
    {
      v7 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
      objc_msgSend(WeakRetained, "navigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "presentViewController:animated:completion:", v7, 1, 0);

LABEL_6:
      goto LABEL_7;
    }
    if (v9)
    {
      objc_msgSend(WeakRetained, "navigationController");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pk_presentPaymentSetupViewController:animated:completion:", v9, 1, 0);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKAccountAutomaticPaymentsHeroViewController;
  -[PKExplanationViewController viewWillLayoutSubviews](&v7, sel_viewWillLayoutSubviews);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountAutomaticPaymentsHeroViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  PKFloatRoundToPixel();
  v6 = v5;

  objc_msgSend(v3, "setTopMargin:", v6);
}

- (void)setShowSetupPrompt:(BOOL)a3
{
  if (self->_showSetupPrompt != a3)
  {
    self->_showSetupPrompt = a3;
    -[PKAccountAutomaticPaymentsHeroViewController _updateSetupPrompt](self, "_updateSetupPrompt");
  }
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id v4;
  PKAccountAutomaticPaymentsController *controller;
  _QWORD v6[5];
  id v7;
  id location;

  v4 = a3;
  if (-[PKAccountAutomaticPaymentsController needsPreflight](self->_controller, "needsPreflight"))
  {
    -[PKExplanationViewController showSpinner:](self, "showSpinner:", 1);
    objc_initWeak(&location, self);
    controller = self->_controller;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __81__PKAccountAutomaticPaymentsHeroViewController_explanationViewDidSelectContinue___block_invoke;
    v6[3] = &unk_1E3E625E8;
    objc_copyWeak(&v7, &location);
    v6[4] = self;
    -[PKAccountAutomaticPaymentsController preflightWithCompletion:](controller, "preflightWithCompletion:", v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    -[PKAccountAutomaticPaymentsController presentNextViewControllerFromViewController:](self->_controller, "presentNextViewControllerFromViewController:", self);
  }

}

void __81__PKAccountAutomaticPaymentsHeroViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  char v12;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__PKAccountAutomaticPaymentsHeroViewController_explanationViewDidSelectContinue___block_invoke_2;
  v8[3] = &unk_1E3E625C0;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  v12 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

  objc_destroyWeak(&v11);
}

void __81__PKAccountAutomaticPaymentsHeroViewController_explanationViewDidSelectContinue___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  BOOL v3;
  void *v4;
  id v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "showSpinner:", 0);
    if (*(_BYTE *)(a1 + 56))
      v3 = *(_QWORD *)(a1 + 32) == 0;
    else
      v3 = 0;
    if (v3)
    {
      objc_msgSend(v6[129], "presentNextViewControllerFromViewController:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = PKAlertForDisplayableErrorWithHandlers(v4, 0, 0, 0);
      objc_msgSend(v6, "presentViewController:animated:completion:", v5, 1, 0);

    }
    WeakRetained = v6;
  }

}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  -[PKAccountAutomaticPaymentsHeroViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_updateSetupPrompt
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[PKExplanationViewController explanationView](self, "explanationView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dockView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "footerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setManualEntryButton:", 0);

  LODWORD(v4) = self->_showSetupPrompt;
  objc_msgSend(v3, "footerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((_DWORD)v4)
  {
    objc_msgSend(v5, "secondaryActionButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    PKLocalizedFeatureString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:forState:", v8, 0);

    objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel__notNowAction_, 64);
    if (PKIsPhone())
    {
      -[PKAccountAutomaticPaymentsHeroViewController _autoPayMenuPromptBodyAttributedString](self, "_autoPayMenuPromptBodyAttributedString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAttributedBodyText:", v9);

    }
  }
  else
  {
    objc_msgSend(v5, "setSecondaryActionButton:", 0);

    PKLocalizedFeatureString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBodyText:", v7);
  }

}

- (void)_notNowAction:(id)a3
{
  -[PKAccountAutomaticPaymentsHeroViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)_autoPayMenuPromptBodyAttributedString
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC4938]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, *MEMORY[0x1E0DC1138]);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v4, *MEMORY[0x1E0DC1140]);

  v5 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v5, "setLineBreakMode:", 0);
  objc_msgSend(v5, "setFirstLineHeadIndent:", 0.0);
  objc_msgSend(v2, "setObject:forKey:", v5, *MEMORY[0x1E0DC1178]);
  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  PKLocalizedFeatureString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedFeatureString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@\n\n%@"), v7, v8);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v9, v2);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("ellipsis.circle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageWithTintColor:renderingMode:", v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC12B0], "textAttachmentWithImage:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v9, "rangeOfString:", CFSTR("%@"));
  if (v17)
    objc_msgSend(v10, "replaceCharactersInRange:withAttributedString:", v16, v17, v15);

  return v10;
}

- (BOOL)showSetupPrompt
{
  return self->_showSetupPrompt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsController, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
