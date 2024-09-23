@implementation PKSubcredentialPairingErrorViewController

- (PKSubcredentialPairingErrorViewController)initWithFlowController:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  PKSubcredentialPairingErrorViewController *v11;
  PKSubcredentialPairingErrorViewController *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint8_t v18[16];

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    PKLogFacilityTypeGetObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Showing provisioning error view controller with no error", v18, 2u);
    }

  }
  v11 = -[PKSubcredentialPairingErrorViewController init](self, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_flowController, a3);
    objc_storeStrong((id *)&v12->_provisioningContext, a4);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, v12, sel_cancelButtonPressed);
    -[PKSubcredentialPairingErrorViewController navigationItem](v12, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLeftBarButtonItem:", v13);

    v15 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
    objc_msgSend(v15, "configureWithTransparentBackground");
    -[PKSubcredentialPairingErrorViewController navigationItem](v12, "navigationItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setStandardAppearance:", v15);

  }
  return v12;
}

- (unint64_t)operation
{
  return 0;
}

- (void)viewDidLoad
{
  PKExplanationView *v3;
  PKExplanationView *explanationView;
  PKExplanationView *v5;
  PKCredentialPairingExplanationHeaderView *v6;
  void *v7;
  PKCredentialPairingExplanationHeaderView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)PKSubcredentialPairingErrorViewController;
  -[PKSubcredentialPairingErrorViewController viewDidLoad](&v21, sel_viewDidLoad);
  v3 = -[PKExplanationView initWithContext:delegate:]([PKExplanationView alloc], "initWithContext:delegate:", 0, self);
  explanationView = self->_explanationView;
  self->_explanationView = v3;

  v5 = self->_explanationView;
  v6 = [PKCredentialPairingExplanationHeaderView alloc];
  -[PKSubcredentialPairingFlowControllerContext configuration](self->_provisioningContext, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKCredentialPairingExplanationHeaderView initWithConfiguration:](v6, "initWithConfiguration:", v7);
  -[PKExplanationView setHeroView:](v5, "setHeroView:", v8);

  -[PKSubcredentialPairingFlowControllerContext configuration](self->_provisioningContext, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "provisioningTemplateIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D67538], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "provisioningString:templateIdentifier:", CFSTR("TRY_AGAIN_BUTTON_TITLE"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    PKLocalizedPaymentString(CFSTR("TRY_AGAIN_BUTTON_TITLE"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  -[PKExplanationView dockView](self->_explanationView, "dockView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "primaryButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTitle:forState:", v15, 0);

  -[PKSubcredentialPairingErrorViewController _error](self, "_error");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSubcredentialPairingErrorViewController configureExplanationViewWithError:](self, "configureExplanationViewWithError:", v18);

  -[PKSubcredentialPairingErrorViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  PKProvisioningBackgroundColor();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setBackgroundColor:", v20);

  objc_msgSend(v19, "addSubview:", self->_explanationView);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKSubcredentialPairingErrorViewController;
  -[PKSubcredentialPairingErrorViewController viewDidAppear:](&v9, sel_viewDidAppear_, a3);
  -[PKSubcredentialPairingErrorViewController _error](self, "_error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = 0;
  -[PKSubcredentialPairingErrorViewController _translateErrorCode:toTitleText:bodyText:](self, "_translateErrorCode:toTitleText:bodyText:", objc_msgSend(v4, "code"), &v8, &v7);
  v5 = v8;
  v6 = v7;

  +[PKSubcredentialPairingAnalyticsReporter sendOutcome:errorMessage:page:](PKSubcredentialPairingAnalyticsReporter, "sendOutcome:errorMessage:page:", 0, v5, 2);
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
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKSubcredentialPairingErrorViewController;
  -[PKSubcredentialPairingErrorViewController viewWillLayoutSubviews](&v14, sel_viewWillLayoutSubviews);
  -[PKSubcredentialPairingErrorViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "safeAreaInsets");
  -[PKExplanationView setFrame:](self->_explanationView, "setFrame:", v5 + v12, v7 + 0.0, v9 - (v12 + v13), v11);

}

- (void)configureExplanationViewWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  BOOL v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D6B9E8]) & 1) != 0)
  {
    v6 = objc_msgSend(v4, "code");
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = (uint64_t)v5;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Showing provisioning error view controller with error of unknown domain: %@", buf, 0xCu);
    }

    v6 = 0;
  }
  v12 = 0;
  v13 = 0;
  v8 = -[PKSubcredentialPairingErrorViewController _translateErrorCode:toTitleText:bodyText:](self, "_translateErrorCode:toTitleText:bodyText:", v6, &v13, &v12);
  v9 = v13;
  v10 = v12;
  if (!v8)
  {
    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v15 = v6;
      _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Showing provisioning error view controller with unexpected error: %ld", buf, 0xCu);
    }

  }
  -[PKExplanationView setTitleText:](self->_explanationView, "setTitleText:", v9);
  -[PKExplanationView setBodyText:](self->_explanationView, "setBodyText:", v10);

}

- (void)cancelButtonPressed
{
  -[PKSubcredentialPairingFlowControllerProtocol provisioningWasCanceledWithOperation:](self->_flowController, "provisioningWasCanceledWithOperation:", self);
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id v4;
  NSObject *v5;
  PKSubcredentialPairingFlowControllerProtocol *flowController;
  _QWORD v7[5];
  id v8;
  id buf[2];

  v4 = a3;
  if (self->_flowController)
  {
    if (!self->_isAdvancing)
    {
      self->_isAdvancing = 1;
      objc_initWeak(buf, self);
      flowController = self->_flowController;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __78__PKSubcredentialPairingErrorViewController_explanationViewDidSelectContinue___block_invoke;
      v7[3] = &unk_1E3E64AF8;
      objc_copyWeak(&v8, buf);
      v7[4] = self;
      -[PKSubcredentialPairingFlowControllerProtocol nextViewControllerFromProvisioningOperation:withCompletion:](flowController, "nextViewControllerFromProvisioningOperation:withCompletion:", self, v7);
      objc_destroyWeak(&v8);
      objc_destroyWeak(buf);
      goto LABEL_8;
    }
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to advance flow concurrently", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    -[PKSubcredentialPairingErrorViewController presentingViewController](self, "presentingViewController");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject dismissViewControllerAnimated:completion:](v5, "dismissViewControllerAnimated:completion:", 1, 0);
  }

LABEL_8:
}

void __78__PKSubcredentialPairingErrorViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1, void *a2)
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
      v8[2] = __78__PKSubcredentialPairingErrorViewController_explanationViewDidSelectContinue___block_invoke_2;
      v8[3] = &unk_1E3E61C58;
      objc_copyWeak(&v9, v4);
      objc_msgSend(v7, "pk_presentPaymentSetupViewController:animated:completion:", v3, 1, v8);

      objc_destroyWeak(&v9);
    }
    else
    {
      objc_msgSend(WeakRetained[123], "provisioningFinishedWithOperation:", WeakRetained);
    }
  }

}

void __78__PKSubcredentialPairingErrorViewController_explanationViewDidSelectContinue___block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    WeakRetained[976] = 0;

}

- (BOOL)suppressFieldDetect
{
  return 1;
}

- (id)_error
{
  return -[PKSubcredentialProvisioningFlowControllerContext error](self->_provisioningContext, "error");
}

- (BOOL)_translateErrorCode:(int64_t)a3 toTitleText:(id *)a4 bodyText:(id *)a5
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  __CFString *v20;
  id v21;
  id v22;
  id v23;
  BOOL v24;
  id v25;
  void *v26;
  id v27;

  objc_msgSend(MEMORY[0x1E0D67538], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSubcredentialPairingFlowControllerContext configuration](self->_provisioningContext, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "provisioningTemplateIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 == 4)
  {
    objc_msgSend(v9, "provisioningString:templateIdentifier:", CFSTR("PAIRING_PREREQUISITES_NOT_MET_CODE_TITLE"), v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      *a4 = objc_retainAutorelease(v14);
    }
    else
    {
      PKLocalizedCredentialString(CFSTR("PAIRING_PREREQUISITES_NOT_MET_CODE_TITLE"));
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a4 = v21;

    }
    objc_msgSend(v9, "provisioningString:templateIdentifier:", CFSTR("PAIRING_PREREQUISITES_NOT_MET_CODE_BODY"), v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      v20 = CFSTR("PAIRING_PREREQUISITES_NOT_MET_CODE_BODY");
      goto LABEL_16;
    }
LABEL_14:
    v22 = objc_retainAutorelease(v19);
    *a5 = v22;
LABEL_17:
    v24 = 1;
    goto LABEL_22;
  }
  if (a3 == 3)
  {
    objc_msgSend(v9, "provisioningString:templateIdentifier:", CFSTR("INVALID_PAIRING_CODE_TITLE"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      *a4 = objc_retainAutorelease(v12);
    }
    else
    {
      PKLocalizedCredentialString(CFSTR("INVALID_PAIRING_CODE_TITLE"));
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a4 = v18;

    }
    objc_msgSend(v9, "provisioningString:templateIdentifier:", CFSTR("INVALID_PAIRING_CODE_BODY"), v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      v20 = CFSTR("INVALID_PAIRING_CODE_BODY");
LABEL_16:
      PKLocalizedCredentialString(&v20->isa);
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a5 = v23;

      v22 = 0;
      goto LABEL_17;
    }
    goto LABEL_14;
  }
  objc_msgSend(v9, "provisioningString:templateIdentifier:", CFSTR("PAIRING_FAILED_TITLE"), v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    *a4 = objc_retainAutorelease(v16);
  }
  else
  {
    PKLocalizedCredentialString(CFSTR("PAIRING_FAILED_TITLE"));
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a4 = v25;

  }
  objc_msgSend(v9, "provisioningString:templateIdentifier:", CFSTR("PAIRING_FAILED_BODY"), v11);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v22 = objc_retainAutorelease(v26);
    v24 = 0;
    *a5 = v22;
  }
  else
  {
    PKLocalizedCredentialString(CFSTR("PAIRING_FAILED_BODY"));
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a5 = v27;

    v22 = 0;
    v24 = 0;
  }
LABEL_22:

  return v24;
}

- (PKSubcredentialPairingFlowControllerProtocol)flowController
{
  return self->_flowController;
}

- (PKSubcredentialPairingFlowControllerContext)provisioningContext
{
  return self->_provisioningContext;
}

- (void)setProvisioningContext:(id)a3
{
  objc_storeStrong((id *)&self->_provisioningContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningContext, 0);
  objc_storeStrong((id *)&self->_flowController, 0);
  objc_storeStrong((id *)&self->_explanationView, 0);
}

@end
