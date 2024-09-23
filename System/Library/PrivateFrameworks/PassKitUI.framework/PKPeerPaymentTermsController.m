@implementation PKPeerPaymentTermsController

- (PKPeerPaymentTermsController)initWithTermsURL:(id)a3 termsIdentifier:(id)a4 passUniqueID:(id)a5 webService:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PKPeerPaymentTermsController *v15;
  PKPeerPaymentTermsController *v16;
  uint64_t v17;
  NSString *termsIdentifier;
  RemoteUIController *v19;
  RemoteUIController *remoteUIController;
  int v21;
  Class *v22;
  UINavigationController *v23;
  UINavigationController *navigationController;
  uint64_t v25;
  void *v26;
  void *v27;
  objc_super v29;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v29.receiver = self;
  v29.super_class = (Class)PKPeerPaymentTermsController;
  v15 = -[PKPeerPaymentTermsController init](&v29, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_termsURL, a3);
    v17 = objc_msgSend(v12, "copy");
    termsIdentifier = v16->_termsIdentifier;
    v16->_termsIdentifier = (NSString *)v17;

    objc_storeStrong((id *)&v16->_passUniqueID, a5);
    objc_storeStrong((id *)&v16->_webService, a6);
    v19 = (RemoteUIController *)objc_alloc_init(MEMORY[0x1E0D872F0]);
    remoteUIController = v16->_remoteUIController;
    v16->_remoteUIController = v19;

    -[RemoteUIController setDelegate:](v16->_remoteUIController, "setDelegate:", v16);
    v21 = PKUserInterfaceIdiomSupportsLargeLayouts();
    v22 = (Class *)0x1E0DC3A40;
    if (!v21)
      v22 = (Class *)&off_1E3E1CE28;
    v23 = (UINavigationController *)objc_alloc_init(*v22);
    navigationController = v16->_navigationController;
    v16->_navigationController = v23;

    v25 = 1;
    -[UINavigationController setModalInPresentation:](v16->_navigationController, "setModalInPresentation:", 1);
    -[RemoteUIController setNavigationController:](v16->_remoteUIController, "setNavigationController:", v16->_navigationController);
    -[RemoteUIController loader](v16->_remoteUIController, "loader");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentWebService context](v16->_webService, "context");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v27, "devSigned") & 1) == 0)
      v25 = os_variant_allows_internal_security_policies();
    objc_msgSend(v26, "setAllowNonSecureHTTP:", v25);

  }
  return v16;
}

- (void)presentTermsOverController:(id)a3 showInterstitialViewController:(BOOL)a4 withCompletionHandler:(id)a5
{
  _BOOL4 v5;
  UIViewController **p_currentHostController;
  id v9;
  void *v10;
  id completionHandler;
  NSObject *v12;
  PKNavigationController *v13;
  PKPeerPaymentUpdatedTermsViewController *v14;
  void (**customPresentationHandler)(id, id, PKNavigationController *);
  id WeakRetained;
  uint8_t v17[16];

  v5 = a4;
  p_currentHostController = &self->_currentHostController;
  v9 = a5;
  objc_storeWeak((id *)p_currentHostController, a3);
  v10 = (void *)objc_msgSend(v9, "copy");

  completionHandler = self->_completionHandler;
  self->_completionHandler = v10;

  if (v5)
  {
    PKLogFacilityTypeGetObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Presenting peer payment interstial terms view controller.", v17, 2u);
    }

    v13 = objc_alloc_init(PKNavigationController);
    -[PKNavigationController setModalInPresentation:](v13, "setModalInPresentation:", 1);
    v14 = -[PKPeerPaymentUpdatedTermsViewController initWithPassUniqueID:]([PKPeerPaymentUpdatedTermsViewController alloc], "initWithPassUniqueID:", self->_passUniqueID);
    -[PKPeerPaymentUpdatedTermsViewController setDelegate:](v14, "setDelegate:", self);
    if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](v14, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
    {
      -[PKNavigationController setModalPresentationStyle:](v13, "setModalPresentationStyle:", 2);
    }
    -[PKNavigationController pushViewController:animated:](v13, "pushViewController:animated:", v14, 0);
    customPresentationHandler = (void (**)(id, id, PKNavigationController *))self->_customPresentationHandler;
    WeakRetained = objc_loadWeakRetained((id *)p_currentHostController);
    if (customPresentationHandler)
      customPresentationHandler[2](customPresentationHandler, WeakRetained, v13);
    else
      objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v13, 1, 0);

  }
  else
  {
    -[PKPeerPaymentTermsController _presentRemoteUIController](self, "_presentRemoteUIController");
  }
}

- (void)peerPaymentUpdatedTermsViewController:(id)a3 didSelectContinue:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void (**completionHandler)(id, uint64_t, _QWORD);
  id v8;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    v8 = v6;
    objc_storeWeak((id *)&self->_currentHostController, v6);
    -[PKPeerPaymentTermsController setCustomPresentationHandler:](self, "setCustomPresentationHandler:", &__block_literal_global_157);
    -[PKPeerPaymentTermsController _presentRemoteUIControllerWithUpdatedTermsViewController:](self, "_presentRemoteUIControllerWithUpdatedTermsViewController:", v8);
LABEL_5:
    v6 = v8;
    goto LABEL_6;
  }
  completionHandler = (void (**)(id, uint64_t, _QWORD))self->_completionHandler;
  if (completionHandler)
  {
    v8 = v6;
    completionHandler[2](completionHandler, 1, 0);
    goto LABEL_5;
  }
LABEL_6:

}

void __88__PKPeerPaymentTermsController_peerPaymentUpdatedTermsViewController_didSelectContinue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "setModalPresentationStyle:", 3);
  objc_msgSend(v5, "presentViewController:withTransition:completion:", v4, 1, 0);

}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  if (self->_remoteUIController == a3)
    PKPaymentSetupApplyContextAppearance(self->_paymentSetupContext, a4);
}

- (void)_presentRemoteUIController
{
  -[PKPeerPaymentTermsController _presentRemoteUIControllerWithUpdatedTermsViewController:](self, "_presentRemoteUIControllerWithUpdatedTermsViewController:", 0);
}

- (void)_presentRemoteUIControllerWithUpdatedTermsViewController:(id)a3
{
  id v4;
  NSObject *v5;
  NSURL *termsURL;
  NSString *termsIdentifier;
  RemoteUIController *remoteUIController;
  NSURL *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  PKPeerPaymentTermsController *v13;
  id v14;
  uint8_t buf[4];
  NSURL *v16;
  __int16 v17;
  NSString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    termsURL = self->_termsURL;
    termsIdentifier = self->_termsIdentifier;
    *(_DWORD *)buf = 138412546;
    v16 = termsURL;
    v17 = 2112;
    v18 = termsIdentifier;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Presenting peer payment terms with URL: %@, termsIdentifier: %@", buf, 0x16u);
  }

  objc_msgSend(v4, "showSpinner:", 1);
  objc_initWeak((id *)buf, self);
  remoteUIController = self->_remoteUIController;
  v9 = self->_termsURL;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke;
  v11[3] = &unk_1E3E63548;
  objc_copyWeak(&v14, (id *)buf);
  v10 = v4;
  v12 = v10;
  v13 = self;
  -[RemoteUIController loadURL:postBody:completion:](remoteUIController, "loadURL:postBody:completion:", v9, 0, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);

}

void __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  char v14;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_2;
  block[3] = &unk_1E3E72550;
  v14 = a2;
  v10 = v5;
  v6 = v5;
  objc_copyWeak(&v13, (id *)(a1 + 48));
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v11 = v7;
  v12 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v13);
}

void __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const __CFString *v4;
  id *WeakRetained;
  void (**v6)(id, id, id);
  id v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  const __CFString *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(a1 + 64))
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    *(_DWORD *)buf = 138412546;
    v22 = v4;
    v23 = 2112;
    v24 = v3;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Presented terms with success: %@, error %@.", buf, 0x16u);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 40), "showSpinner:", 0);
    if (*(_BYTE *)(a1 + 64))
    {
      PKPaymentSetupApplyContextAppearance(objc_msgSend(WeakRetained, "paymentSetupContext"), WeakRetained[10]);
      v6 = (void (**)(id, id, id))WeakRetained[8];
      v7 = objc_loadWeakRetained(WeakRetained + 9);
      if (v6)
        v6[2](v6, v7, WeakRetained[10]);
      else
        objc_msgSend(v7, "presentViewController:animated:completion:", WeakRetained[10], 1, 0);

      v11 = WeakRetained[6];
      v12 = MEMORY[0x1E0C809B0];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_18;
      v19[3] = &unk_1E3E724D8;
      objc_copyWeak(&v20, (id *)(a1 + 56));
      v19[4] = *(_QWORD *)(a1 + 48);
      objc_msgSend(v11, "setHandlerForElementName:handler:", CFSTR("agree"), v19);
      v13 = WeakRetained[6];
      v17[0] = v12;
      v17[1] = 3221225472;
      v17[2] = __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_27;
      v17[3] = &unk_1E3E72500;
      v17[4] = *(_QWORD *)(a1 + 48);
      v18 = *(id *)(a1 + 32);
      objc_msgSend(v13, "setHandlerForElementName:handler:", CFSTR("disagree"), v17);
      v14 = WeakRetained[6];
      v15[0] = v12;
      v15[1] = 3221225472;
      v15[2] = __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_2_30;
      v15[3] = &unk_1E3E72528;
      objc_copyWeak(&v16, (id *)(a1 + 56));
      objc_msgSend(v14, "setHandlerForElementName:handler:", CFSTR("emailTerms"), v15);
      objc_destroyWeak(&v16);

      objc_destroyWeak(&v20);
    }
    else
    {
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(const __CFString **)(*(_QWORD *)(a1 + 48) + 16);
        v9 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v22 = v8;
        v23 = 2112;
        v24 = v9;
        _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Error Failed to load termsURL %@ with error %@", buf, 0x16u);
      }

      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      if (v10)
        (*(void (**)(uint64_t, _QWORD, _QWORD))(v10 + 16))(v10, 0, *(_QWORD *)(a1 + 32));
    }
  }

}

void __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_18(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_ACTION_VIEW_TERMS_AND_CONDITIONS_TITLE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startNavigationBarSpinnerWithTitle:", v5);
    v6 = (void *)WeakRetained[5];
    v7 = WeakRetained[3];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_2_21;
    v10[3] = &unk_1E3E64E38;
    v8 = v3;
    v9 = *(_QWORD *)(a1 + 32);
    v11 = v8;
    v12 = v9;
    objc_msgSend(v6, "peerPaymentAcceptTermsWithIdentifier:completion:", v7, v10);

  }
}

void __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_2_21(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  char v12;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_3;
  v8[3] = &unk_1E3E64E10;
  v6 = *(id *)(a1 + 32);
  v12 = a2;
  v9 = v6;
  v10 = v5;
  v11 = *(_QWORD *)(a1 + 40);
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const __CFString *v4;
  uint64_t result;
  int v6;
  const __CFString *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "stopNavigationBarSpinner");
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(a1 + 56))
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Accepted terms with success: %@, error %@.", (uint8_t *)&v6, 0x16u);
  }

  result = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 2, *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_27(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, *(_QWORD *)(a1 + 40));
  return result;
}

void __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_2_30(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_3_31;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_3_31(uint64_t a1)
{
  id *WeakRetained;
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
  _QWORD v13[4];
  id v14;
  id *v15;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_EMAIL_TERMS_ALERT_TITLE"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PKPrimaryAppleAccountFormattedUsername();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_EMAIL_TERMS_ALERT_MESSAGE"), CFSTR("%@"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v3, v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_EMAIL_TERMS_ALERT_CANCEL"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_EMAIL_TERMS_ALERT_SEND"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_4;
    v13[3] = &unk_1E3E61D90;
    v14 = *(id *)(a1 + 32);
    v15 = WeakRetained;
    objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 0, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addAction:", v9);
    objc_msgSend(v6, "addAction:", v12);
    objc_msgSend(v6, "setPreferredAction:", v12);
    objc_msgSend(WeakRetained[10], "presentViewController:animated:completion:", v6, 1, 0);

  }
}

void __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v2 = *(void **)(a1 + 32);
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_EMAIL_TERMS_SENDING"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startNavigationBarSpinnerWithTitle:", v3);

  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_5;
  v8[3] = &unk_1E3E64E38;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 40);
  v9 = v6;
  v10 = v7;
  objc_msgSend(v5, "peerPaymentEmailTermsWithCompletion:", v8);

}

void __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_5(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  char v12;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_6;
  v8[3] = &unk_1E3E64E10;
  v6 = *(id *)(a1 + 32);
  v12 = a2;
  v9 = v6;
  v10 = v5;
  v11 = *(_QWORD *)(a1 + 40);
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_6(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "stopNavigationBarSpinner");
  if (!*(_BYTE *)(a1 + 56))
  {
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(MEMORY[0x1E0D673F8], "displayableErrorForError:");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      v2 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 80), "presentViewController:animated:completion:", v2, 1, 0);

    }
  }
}

- (NSURL)termsURL
{
  return self->_termsURL;
}

- (NSString)termsIdentifier
{
  return self->_termsIdentifier;
}

- (NSString)passUniqueID
{
  return self->_passUniqueID;
}

- (PKPeerPaymentWebService)webService
{
  return self->_webService;
}

- (RemoteUIController)remoteUIController
{
  return self->_remoteUIController;
}

- (int64_t)paymentSetupContext
{
  return self->_paymentSetupContext;
}

- (void)setPaymentSetupContext:(int64_t)a3
{
  self->_paymentSetupContext = a3;
}

- (id)customPresentationHandler
{
  return self->_customPresentationHandler;
}

- (void)setCustomPresentationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (UIViewController)currentHostController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_currentHostController);
}

- (void)setCurrentHostController:(id)a3
{
  objc_storeWeak((id *)&self->_currentHostController, a3);
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_destroyWeak((id *)&self->_currentHostController);
  objc_storeStrong(&self->_customPresentationHandler, 0);
  objc_storeStrong((id *)&self->_remoteUIController, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_passUniqueID, 0);
  objc_storeStrong((id *)&self->_termsIdentifier, 0);
  objc_storeStrong((id *)&self->_termsURL, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
