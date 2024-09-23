@implementation PKPeerPaymentIdentityVerificationExplanationViewController

- (PKPeerPaymentIdentityVerificationExplanationViewController)initWithContext:(int64_t)a3 setupDelegate:(id)a4 identityVerificationController:(id)a5
{
  id v8;
  id v9;
  PKPeerPaymentIdentityVerificationExplanationViewController *v10;
  PKPeerPaymentIdentityVerificationExplanationViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PKPassView *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v8 = a4;
  v9 = a5;
  v25.receiver = self;
  v25.super_class = (Class)PKPeerPaymentIdentityVerificationExplanationViewController;
  v10 = -[PKExplanationViewController initWithContext:](&v25, sel_initWithContext_, a3);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_controller, a5);
    objc_storeWeak((id *)&v11->_setupDelegate, v8);
    objc_msgSend(v9, "webService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "peerPaymentService");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "account");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "associatedPassUniqueID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "length"))
    {
      objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "passWithUniqueID:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "loadImageSetSync:preheat:", 0, 1);
      v18 = -[PKPassView initWithPass:content:suppressedContent:]([PKPassView alloc], "initWithPass:content:suppressedContent:", v17, 5, 512);
      -[PKPeerPaymentIdentityVerificationExplanationViewController _snapshotSize](v11, "_snapshotSize");
      -[PKPassView snapshotOfFrontFaceWithRequestedSize:](v18, "snapshotOfFrontFaceWithRequestedSize:");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKExplanationViewController explanationView](v11, "explanationView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setImage:", v19);
      objc_msgSend(v20, "setShowPrivacyView:", 0);
      objc_msgSend(v20, "imageView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setAccessibilityIgnoresInvertColors:", 1);

    }
    -[PKPeerPaymentIdentityVerificationExplanationViewController navigationItem](v11, "navigationItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, v11, sel__cancel);
    objc_msgSend(v22, "setLeftBarButtonItem:", v23);

  }
  return v11;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPeerPaymentIdentityVerificationExplanationViewController;
  -[PKExplanationViewController loadView](&v7, sel_loadView);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);
  -[PKPeerPaymentIdentityVerificationExplanationViewController _titleText](self, "_titleText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleText:", v4);

  -[PKPeerPaymentIdentityVerificationExplanationViewController _bodyText](self, "_bodyText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBodyText:", v5);

  -[PKPeerPaymentIdentityVerificationExplanationViewController _bodyButtonText](self, "_bodyButtonText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBodyButtonText:", v6);

  objc_msgSend(v3, "setTopMargin:", 12.0);
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
  -[PKPeerPaymentIdentityVerificationExplanationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, a5, 0);
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  -[PKPeerPaymentIdentityVerificationExplanationViewController presentingViewController](self, "presentingViewController", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", v4, 0);

}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  PKPeerPaymentAccountResolutionController *v18;
  NSObject *v19;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  id location[2];

  v4 = a3;
  v5 = v4;
  switch(self->_identityVerificaionError)
  {
    case 0uLL:
    case 1uLL:
      objc_initWeak(location, self);
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __95__PKPeerPaymentIdentityVerificationExplanationViewController_explanationViewDidSelectContinue___block_invoke;
      v21[3] = &unk_1E3E69C80;
      objc_copyWeak(&v22, location);
      -[PKPeerPaymentIdentityVerificationExplanationViewController _performAuthenticationLocationBased:withCompletion:](self, "_performAuthenticationLocationBased:withCompletion:", 1, v21);
      objc_destroyWeak(&v22);
      objc_destroyWeak(location);
      goto LABEL_11;
    case 2uLL:
      PKLocalizedPaymentString(CFSTR("COULD_NOT_CONNECT_TITLE"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("COULD_NOT_CONNECT_MESSAGE"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PKDisplayableErrorCustom();
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __95__PKPeerPaymentIdentityVerificationExplanationViewController_explanationViewDidSelectContinue___block_invoke_34;
      v20[3] = &unk_1E3E612E8;
      v20[4] = self;
      v9 = PKAlertForDisplayableErrorWithHandlers(v8, 0, v20, 0);
      -[PKPeerPaymentIdentityVerificationExplanationViewController navigationController](self, "navigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "presentViewController:animated:completion:", v9, 1, 0);

      goto LABEL_10;
    case 3uLL:
      objc_msgSend(v4, "dockView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setButtonsEnabled:", 0);

      objc_msgSend(v5, "dockView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "primaryButton");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setShowSpinner:", 1);

      objc_msgSend(v5, "dockView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "footerView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setButtonsEnabled:", 0);

      goto LABEL_5;
    case 4uLL:
      -[PKPeerPaymentIdentityVerificationExplanationViewController _terminateFlow](self, "_terminateFlow");
      goto LABEL_11;
    case 5uLL:
      -[PKPeerPaymentIdentityVerificationController webService](self->_controller, "webService");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "peerPaymentService");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "account");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      v17 = objc_alloc_init(MEMORY[0x1E0D66F18]);
      v18 = -[PKPeerPaymentAccountResolutionController initWithAccount:webService:context:delegate:passLibraryDataProvider:]([PKPeerPaymentAccountResolutionController alloc], "initWithAccount:webService:context:delegate:passLibraryDataProvider:", v9, v8, -[PKExplanationViewController context](self, "context"), self, v17);
      PKLogFacilityTypeGetObject();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_19D178000, v19, OS_LOG_TYPE_DEFAULT, "Presenting contact apple support alert...", (uint8_t *)location, 2u);
      }

      MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68540], 0);
      -[PKPeerPaymentAccountResolutionController presentFlowForAccountResolution:configuration:completion:](v18, "presentFlowForAccountResolution:configuration:completion:", 3, 0, &__block_literal_global_67);

LABEL_10:
      goto LABEL_11;
    default:
LABEL_5:
      -[PKPeerPaymentIdentityVerificationExplanationViewController _processNextViewController](self, "_processNextViewController");
LABEL_11:

      return;
  }
}

void __95__PKPeerPaymentIdentityVerificationExplanationViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (!a2 || v5)
    {
      PKLogFacilityTypeGetObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "localizedDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412290;
        v11 = v9;
        _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Auth error during peer payment personalization: %@", (uint8_t *)&v10, 0xCu);

      }
    }
    else
    {
      objc_msgSend(WeakRetained, "_processNextViewController");
    }
  }

}

void __95__PKPeerPaymentIdentityVerificationExplanationViewController_explanationViewDidSelectContinue___block_invoke_24(uint64_t a1, int a2)
{
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("NO");
    if (a2)
      v4 = CFSTR("YES");
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Presented contact apple support alert with success %@", (uint8_t *)&v5, 0xCu);
  }

}

uint64_t __95__PKPeerPaymentIdentityVerificationExplanationViewController_explanationViewDidSelectContinue___block_invoke_34(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancel");
}

- (void)explanationViewDidSelectBodyButton:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  -[PKPeerPaymentIdentityVerificationController response](self->_controller, "response", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "learnMore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buttonURL");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v10;
  if (v10)
  {
    objc_msgSend(v10, "scheme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsString:", CFSTR("http"));

    if (v8)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5600]), "initWithURL:", v10);
      objc_msgSend(v9, "setModalPresentationStyle:", 2);
      -[PKPeerPaymentIdentityVerificationExplanationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "openSensitiveURL:withOptions:", v10, 0);
    }

    v6 = v10;
  }

}

- (void)_processNextViewController
{
  PKPeerPaymentIdentityVerificationController *controller;
  _QWORD v3[5];

  controller = self->_controller;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __88__PKPeerPaymentIdentityVerificationExplanationViewController__processNextViewController__block_invoke;
  v3[3] = &unk_1E3E69CF0;
  v3[4] = self;
  -[PKPeerPaymentIdentityVerificationController nextViewControllerWithCompletion:](controller, "nextViewControllerWithCompletion:", v3);
}

void __88__PKPeerPaymentIdentityVerificationExplanationViewController__processNextViewController__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__PKPeerPaymentIdentityVerificationExplanationViewController__processNextViewController__block_invoke_2;
  block[3] = &unk_1E3E69CC8;
  v12 = *(_QWORD *)(a1 + 32);
  v19 = v10;
  v20 = a5;
  block[4] = v12;
  v17 = v9;
  v18 = v11;
  v13 = v10;
  v14 = v11;
  v15 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __88__PKPeerPaymentIdentityVerificationExplanationViewController__processNextViewController__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1048) = *(_QWORD *)(a1 + 64);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pushViewController:animated:", *(_QWORD *)(a1 + 40), 1, v7);
LABEL_3:

    return;
  }
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0D673F8], "displayableErrorForError:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __88__PKPeerPaymentIdentityVerificationExplanationViewController__processNextViewController__block_invoke_3;
    v10[3] = &unk_1E3E612E8;
    v10[4] = *(_QWORD *)(a1 + 32);
    v3 = PKAlertForDisplayableErrorWithHandlers(v2, 0, v10, 0);
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentViewController:animated:completion:", v3, 1, 0);

  }
  else
  {
    v5 = *(void **)(a1 + 56);
    if (v5)
    {
      objc_msgSend(v5, "explanationView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setDelegate:", *(_QWORD *)(a1 + 32));

      objc_msgSend(*(id *)(a1 + 32), "navigationController");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pushViewController:animated:", *(_QWORD *)(a1 + 56), 1, v9);
      goto LABEL_3;
    }
  }
}

uint64_t __88__PKPeerPaymentIdentityVerificationExplanationViewController__processNextViewController__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancel");
}

- (void)_cancel
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "viewControllerDidCancelSetupFlow:", self);
  else
    -[PKPeerPaymentIdentityVerificationExplanationViewController _terminateFlow](self, "_terminateFlow");

}

- (void)_terminateFlow
{
  id WeakRetained;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "viewControllerDidTerminateSetupFlow:", self);
  }
  else
  {
    -[PKPeerPaymentIdentityVerificationExplanationViewController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (id)_titleText
{
  void *v2;
  void *v3;
  uint64_t v4;

  -[PKPeerPaymentIdentityVerificationController response](self->_controller, "response");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v3, "length"))
  {
    PKLocalizedPeerPaymentString(CFSTR("IDENTITY_VERIFICATION_VERIFY_YOUR_IDENTITY_TITLE"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

- (id)_bodyText
{
  void *v2;
  void *v3;

  -[PKPeerPaymentIdentityVerificationController response](self->_controller, "response");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subtitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_bodyButtonText
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[PKPeerPaymentIdentityVerificationController response](self->_controller, "response");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "learnMore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "buttonTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "buttonURL");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5)
      v5 = v4;
  }
  else
  {
    v5 = 0;
  }

  return v5;
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

- (void)_performAuthenticationLocationBased:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL4 v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v4 = a3;
  v20[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (v5)
  {
    if (v4)
      v6 = 1025;
    else
      v6 = 2;
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__14;
    v17 = __Block_byref_object_dispose__14;
    v18 = objc_alloc_init(MEMORY[0x1E0CC12A0]);
    v19[0] = &unk_1E3FAD048;
    PKLocalizedString(CFSTR("WALLET"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = &unk_1E3FAD060;
    v20[0] = v7;
    v20[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)v14[5];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __113__PKPeerPaymentIdentityVerificationExplanationViewController__performAuthenticationLocationBased_withCompletion___block_invoke;
    v10[3] = &unk_1E3E69D18;
    v11 = v5;
    v12 = &v13;
    objc_msgSend(v9, "evaluatePolicy:options:reply:", v6, v8, v10);

    _Block_object_dispose(&v13, 8);
  }

}

uint64_t __113__PKPeerPaymentIdentityVerificationExplanationViewController__performAuthenticationLocationBased_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 32);
  if (!a2 || a3)
    return (*(uint64_t (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD))(v4 + 16))(v4, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
