@implementation PKPaymentCardIneligibleViewController

- (PKPaymentCardIneligibleViewController)initWithReason:(int64_t)a3 context:(int64_t)a4
{
  PKPaymentCardIneligibleViewController *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPaymentCardIneligibleViewController;
  result = -[PKPaymentCardIneligibleViewController init](&v7, sel_init);
  if (result)
  {
    result->_reason = a3;
    result->_context = a4;
    result->_preloadLearnMoreWebView = 1;
  }
  return result;
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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKPaymentCardIneligibleViewController;
  -[PKPaymentCardIneligibleViewController viewDidLoad](&v11, sel_viewDidLoad);
  -[PKPaymentCardIneligibleViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentCardIneligibleViewController webView](self, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", v4);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 3, 0, v3, 3, 1.0, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v5);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 4, 0, v3, 4, 1.0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v6);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 1, 0, v3, 1, 1.0, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v7);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 2, 0, v3, 2, 1.0, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_handleDone_);
  -[PKPaymentCardIneligibleViewController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRightBarButtonItem:", v9);

}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKPaymentCardIneligibleViewController;
  -[PKPaymentCardIneligibleViewController dealloc](&v2, sel_dealloc);
}

- (id)webView
{
  WKWebView *webView;
  id v4;
  WKWebView *v5;
  WKWebView *v6;

  webView = self->_webView;
  if (!webView)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEF630]);
    v5 = (WKWebView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_webView;
    self->_webView = v5;

    -[WKWebView setNavigationDelegate:](self->_webView, "setNavigationDelegate:", self);
    webView = self->_webView;
  }
  return webView;
}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 preloadLearnMoreWebView;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  id preflightCompletion;
  id v11;
  void *v12;
  id v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPaymentCardIneligibleViewController learnMoreURL](self, "learnMoreURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v14 = "No Learn More URL was available";
      v15 = v7;
      v16 = 2;
LABEL_10:
      _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
    }
LABEL_11:

    -[PKPaymentCardIneligibleViewController _alertWithReason:learnMoreURL:isPreloaded:](self, "_alertWithReason:learnMoreURL:isPreloaded:", self->_reason, v5, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __65__PKPaymentCardIneligibleViewController_preflightWithCompletion___block_invoke;
    v18[3] = &unk_1E3E618A0;
    v19 = v17;
    v20 = v4;
    v11 = v17;
    dispatch_async(MEMORY[0x1E0C80D38], v18);

    v12 = v20;
    goto LABEL_12;
  }
  preloadLearnMoreWebView = self->_preloadLearnMoreWebView;
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (!preloadLearnMoreWebView)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v22 = v5;
      v14 = "Skipped pre-load of the Learn More URL %@";
      v15 = v7;
      v16 = 12;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (v8)
  {
    *(_DWORD *)buf = 138412290;
    v22 = v5;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Pre-loading the learn more URL %@", buf, 0xCu);
  }

  v9 = (void *)objc_msgSend(v4, "copy");
  preflightCompletion = self->_preflightCompletion;
  self->_preflightCompletion = v9;

  objc_msgSend(MEMORY[0x1E0CB39E0], "requestWithURL:", v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentCardIneligibleViewController webView](self, "webView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v12, "loadRequest:", v11);
LABEL_12:

}

uint64_t __65__PKPaymentCardIneligibleViewController_preflightWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (id)_alertWithReason:(int64_t)a3 learnMoreURL:(id)a4 isPreloaded:(BOOL)a5
{
  id v8;
  _BOOL4 v9;
  int IsBridge;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  NSString *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char IsSetupAssistant;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  _QWORD v39[5];
  id v40;
  _QWORD v41[4];
  id v42;
  PKPaymentCardIneligibleViewController *v43;
  id v44;
  BOOL v45;
  _QWORD aBlock[5];
  _QWORD v47[6];

  v8 = a4;
  v38 = v8;
  if (!self->_learnMorePresentationHandler)
    goto LABEL_4;
  if (v8)
  {
    if (a3 == 5)
    {
LABEL_4:
      v9 = 0;
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v9 = 0;
  if (a3 != 5 && a5)
LABEL_7:
    v9 = a3 != 6;
LABEL_8:
  IsBridge = PKPaymentSetupContextIsBridge();
  if (PKPaymentSetupContextIsIssuerApp())
  {
    -[PKPaymentProvisioningController webService](self->_provisioningController, "webService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "targetDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "deviceClass");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    IsBridge = PKDeviceClassIsWatch();

  }
  switch(a3)
  {
    case 1:
      PKLocalizedPaymentString(CFSTR("ELIGIBILITY_UNKNOWN_REQUIREMENTS_ERROR_TITLE"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        v15 = CFSTR("ELIGIBILITY_UNKNOWN_REQUIREMENTS_ERROR_MESSAGE");
      else
        v15 = CFSTR("ELIGIBILITY_UNKNOWN_REQUIREMENTS_ERROR_MESSAGE_NO_URL");
      goto LABEL_24;
    case 2:
      MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D684C8], 0);
      PKLocalizedPaymentString(CFSTR("ELIGIBILITY_INELIGIBLE_ERROR_TITLE"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        v15 = CFSTR("ELIGIBILITY_INELIGIBLE_ERROR_MESSAGE");
      else
        v15 = CFSTR("ELIGIBILITY_INELIGIBLE_ERROR_MESSAGE_NO_URL");
      goto LABEL_24;
    case 3:
      MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D684D0], 0);
      PKLocalizedPaymentString(CFSTR("ELIGIBILITY_UNAVAILABLE_ERROR_TITLE"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("ELIGIBILITY_UNAVAILABLE_ERROR_MESSAGE");
      goto LABEL_24;
    case 4:
      MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D684B8], 0);
      PKLocalizedPaymentString(CFSTR("ELIGIBILITY_ALREADY_PROVISIONED_ERROR_TITLE"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      goto LABEL_26;
    case 5:
      MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D684D8], 0);
      PKLocalizedPaymentString(CFSTR("ELIGIBILITY_NEWER_OS_VERSION_REQUIRED_ERROR_TITLE"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("ELIGIBILITY_NEWER_OS_VERSION_REQUIRED_ERROR_MESSAGE");
      goto LABEL_20;
    case 6:
      MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D684C0], 0);
      PKLocalizedPaymentString(CFSTR("ELIGIBILITY_HARDWARE_NOT_SUPPORTED_ERROR_TITLE"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("ELIGIBILITY_HARDWARE_NOT_SUPPORTED_ERROR_MESSAGE");
LABEL_20:
      PKDeviceSpecificLocalizedStringKeyForKey(v17, IsBridge);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(v18);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_26;
    case 7:
      PKLocalizedLynxString(CFSTR("ELIGIBILITY_ERROR_BALANCE_TOO_LOW_TITLE"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedLynxString(CFSTR("ELIGIBILITY_ERROR_BALANCE_TOO_LOW_MESSAGE"));
      v19 = objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    default:
      PKLocalizedPaymentString(CFSTR("COULD_NOT_ADD_CARD_TITLE"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("COULD_NOT_ADD_CARD_MESSAGE");
LABEL_24:
      PKLocalizedPaymentString(&v15->isa);
      v19 = objc_claimAutoreleasedReturnValue();
LABEL_25:
      v16 = (void *)v19;
LABEL_26:
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v14, v16, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (PKPaymentSetupContextIsSetupAssistant()
        && (-[PKPaymentProvisioningController credentialProvisioningQueue](self->_provisioningController, "credentialProvisioningQueue"), v21 = (void *)objc_claimAutoreleasedReturnValue(), v22 = objc_msgSend(v21, "count"), v21, v22 <= 1))
      {
        v23 = (void *)MEMORY[0x1E0DC3448];
        PKLocalizedPaymentString(CFSTR("SET_UP_LATER_BUTTON_TITLE"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __83__PKPaymentCardIneligibleViewController__alertWithReason_learnMoreURL_isPreloaded___block_invoke;
        v47[3] = &unk_1E3E61D68;
        v47[4] = self;
        objc_msgSend(v23, "actionWithTitle:style:handler:", v24, 0, v47);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addAction:", v25);

        v26 = CFSTR("COULD_NOT_ADD_CARD_TRY_ANOTHER_CARD");
      }
      else if (a3 == 5)
      {
        v26 = CFSTR("ELIGIBILITY_CANCEL_BUTTON_TITLE");
      }
      else
      {
        v26 = CFSTR("ELIGIBILITY_OK_BUTTON_TITLE");
      }
      PKLocalizedPaymentString(&v26->isa);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __83__PKPaymentCardIneligibleViewController__alertWithReason_learnMoreURL_isPreloaded___block_invoke_2;
      aBlock[3] = &unk_1E3E61D68;
      aBlock[4] = self;
      v28 = _Block_copy(aBlock);
      if (v9)
      {
        v29 = (void *)MEMORY[0x1E0DC3448];
        PKLocalizedPaymentString(CFSTR("ELIGIBILITY_LEARN_MORE_BUTTON_TITLE"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __83__PKPaymentCardIneligibleViewController__alertWithReason_learnMoreURL_isPreloaded___block_invoke_3;
        v41[3] = &unk_1E3E6A558;
        v45 = a5;
        v42 = v38;
        v43 = self;
        v44 = v28;
        objc_msgSend(v29, "actionWithTitle:style:handler:", v30, 0, v41);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addAction:", v31);

      }
      objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v27, 1, v28);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addAction:", v32);

      IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
      if (a3 == 5 && (IsSetupAssistant & 1) == 0)
      {
        v34 = (void *)MEMORY[0x1E0DC3448];
        PKLocalizedPaymentString(CFSTR("ELIGIBILITY_SOFTWARE_UPDATE_BUTTON_TITLE"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __83__PKPaymentCardIneligibleViewController__alertWithReason_learnMoreURL_isPreloaded___block_invoke_4;
        v39[3] = &unk_1E3E683C8;
        v39[4] = self;
        v40 = v28;
        objc_msgSend(v34, "actionWithTitle:style:handler:", v35, 0, v39);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addAction:", v36);

      }
      return v20;
  }
}

uint64_t __83__PKPaymentCardIneligibleViewController__alertWithReason_learnMoreURL_isPreloaded___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1040);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __83__PKPaymentCardIneligibleViewController__alertWithReason_learnMoreURL_isPreloaded___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1032);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __83__PKPaymentCardIneligibleViewController__alertWithReason_learnMoreURL_isPreloaded___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  if (*(_QWORD *)(a1 + 32) && !*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 40), "webView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB39E0], "requestWithURL:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v3, "loadRequest:", v4);

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v6, "setModalPresentationStyle:", 2);
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 1024) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __83__PKPaymentCardIneligibleViewController__alertWithReason_learnMoreURL_isPreloaded___block_invoke_4(uint64_t a1, void *a2)
{
  int IsBridge;
  void *v4;
  const __CFString *v5;
  void *v6;
  id v7;

  v7 = a2;
  IsBridge = PKPaymentSetupContextIsBridge();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (IsBridge)
    v5 = CFSTR("bridge:root=GENERAL_LINK&path=SOFTWARE_UPDATE_LINK");
  else
    v5 = CFSTR("prefs:root=General&path=SOFTWARE_UPDATE_LINK");
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openSensitiveURL:withOptions:", v6, 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_webViewDidLoad:(BOOL)a3 withError:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id preflightCompletion;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD block[4];
  id v21;
  id v22;
  id v23;

  v4 = a3;
  v6 = a4;
  v7 = v6;
  if (self->_preflightCompletion)
  {
    -[PKPaymentCardIneligibleViewController _alertWithReason:learnMoreURL:isPreloaded:](self, "_alertWithReason:learnMoreURL:isPreloaded:", self->_reason, 0, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = _Block_copy(self->_preflightCompletion);
    preflightCompletion = self->_preflightCompletion;
    self->_preflightCompletion = 0;

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__PKPaymentCardIneligibleViewController__webViewDidLoad_withError___block_invoke;
    block[3] = &unk_1E3E6A580;
    v23 = v9;
    v21 = v8;
    v22 = v7;
    v11 = v8;
    v12 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], block);

LABEL_6:
    goto LABEL_7;
  }
  if (v6 && !v4)
  {
    v13 = (void *)MEMORY[0x1E0DC3450];
    PKLocalizedPaymentString(CFSTR("COULD_NOT_CONNECT_TITLE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("COULD_NOT_CONNECT_MESSAGE"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "alertControllerWithTitle:message:preferredStyle:", v14, v15, 1);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __67__PKPaymentCardIneligibleViewController__webViewDidLoad_withError___block_invoke_2;
    v19[3] = &unk_1E3E61D68;
    v19[4] = self;
    objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 1, v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "addAction:", v18);
    -[PKPaymentCardIneligibleViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);

    goto LABEL_6;
  }
LABEL_7:

}

uint64_t __67__PKPaymentCardIneligibleViewController__webViewDidLoad_withError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __67__PKPaymentCardIneligibleViewController__webViewDidLoad_withError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  NSObject *v5;
  uint8_t v6[16];

  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Learn More webview finished loading", v6, 2u);
  }

  -[PKPaymentCardIneligibleViewController _webViewDidLoad:withError:](self, "_webViewDidLoad:withError:", 1, 0);
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Learn More webview failed to load with error %@", (uint8_t *)&v8, 0xCu);
  }

  -[PKPaymentCardIneligibleViewController _webViewDidLoad:withError:](self, "_webViewDidLoad:withError:", 0, v6);
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  void (**v6)(id, uint64_t);
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a4;
  v6 = (void (**)(id, uint64_t))a5;
  v7 = objc_msgSend(v12, "navigationType");
  if (v7 == -1)
  {
    v11 = 1;
  }
  else
  {
    if (!v7 && (PKPaymentSetupContextIsSetupAssistant() & 1) == 0)
    {
      objc_msgSend(v12, "request");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "URL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "openURL:configuration:completionHandler:", v9, 0, 0);

    }
    v11 = 0;
  }
  v6[2](v6, v11);

}

- (void)handleDone:(id)a3
{
  -[PKPaymentCardIneligibleViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (PKPaymentProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (void)setProvisioningController:(id)a3
{
  objc_storeStrong((id *)&self->_provisioningController, a3);
}

- (NSURL)learnMoreURL
{
  return self->_learnMoreURL;
}

- (void)setLearnMoreURL:(id)a3
{
  objc_storeStrong((id *)&self->_learnMoreURL, a3);
}

- (id)learnMorePresentationHandler
{
  return self->_learnMorePresentationHandler;
}

- (void)setLearnMorePresentationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (id)continueActionHandler
{
  return self->_continueActionHandler;
}

- (void)setContinueActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (id)terminateFlowHandler
{
  return self->_terminateFlowHandler;
}

- (void)setTerminateFlowHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (BOOL)preloadLearnMoreWebView
{
  return self->_preloadLearnMoreWebView;
}

- (void)setPreloadLearnMoreWebView:(BOOL)a3
{
  self->_preloadLearnMoreWebView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_terminateFlowHandler, 0);
  objc_storeStrong(&self->_continueActionHandler, 0);
  objc_storeStrong(&self->_learnMorePresentationHandler, 0);
  objc_storeStrong((id *)&self->_learnMoreURL, 0);
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_storeStrong(&self->_preflightCompletion, 0);
  objc_storeStrong((id *)&self->_webView, 0);
}

@end
