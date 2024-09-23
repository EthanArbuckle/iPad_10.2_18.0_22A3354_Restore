@implementation PKPeerPaymentIdentityVerificationViewController

- (PKPeerPaymentIdentityVerificationViewController)initWithController:(id)a3 visibleFieldIdentifiers:(id)a4
{
  return -[PKPeerPaymentIdentityVerificationViewController initWithController:setupDelegate:visibleFieldIdentifiers:](self, "initWithController:setupDelegate:visibleFieldIdentifiers:", a3, 0, a4);
}

- (PKPeerPaymentIdentityVerificationViewController)initWithController:(id)a3 setupDelegate:(id)a4 visibleFieldIdentifiers:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  PKPeerPaymentIdentityVerificationViewController *v14;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v11 = a4;
  v12 = objc_msgSend(v9, "context");
  objc_msgSend(v9, "fieldsModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)PKPeerPaymentIdentityVerificationViewController;
  v14 = -[PKPaymentSetupFieldsViewController initWithWebService:context:setupDelegate:setupFieldsModel:](&v16, sel_initWithWebService_context_setupDelegate_setupFieldsModel_, 0, v12, v11, v13);

  if (v14)
  {
    objc_storeStrong((id *)&v14->_controller, a3);
    objc_storeStrong((id *)&v14->_visibleFieldIdentifiers, a5);
    v14->_showCancelButton = 1;
    -[PKPeerPaymentIdentityVerificationViewController _updateNavigationBarItems](v14, "_updateNavigationBarItems");
  }

  return v14;
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentIdentityVerificationViewController;
  -[PKPeerPaymentIdentityVerificationViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  if ((-[PKPeerPaymentIdentityVerificationViewController isBeingDismissed](self, "isBeingDismissed") & 1) != 0
    || -[PKPeerPaymentIdentityVerificationViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    -[PKPeerPaymentIdentityVerificationController didDismissViewController](self->_controller, "didDismissViewController");
  }
}

- (void)setShowCancelButton:(BOOL)a3
{
  if (self->_showCancelButton != a3)
  {
    self->_showCancelButton = a3;
    -[PKPeerPaymentIdentityVerificationViewController _updateNavigationBarItems](self, "_updateNavigationBarItems");
  }
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
  -[PKPeerPaymentIdentityVerificationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, a5, 0);
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4
{
  -[PKPeerPaymentIdentityVerificationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  PKPeerPaymentAccountResolutionController *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  switch(self->_identityVerificaionError)
  {
    case 2uLL:
      PKLocalizedPaymentString(CFSTR("COULD_NOT_CONNECT_TITLE"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("COULD_NOT_CONNECT_MESSAGE"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      PKDisplayableErrorCustom();
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __84__PKPeerPaymentIdentityVerificationViewController_explanationViewDidSelectContinue___block_invoke_19;
      v20[3] = &unk_1E3E612E8;
      v20[4] = self;
      v8 = PKAlertForDisplayableErrorWithHandlers(v6, 0, v20, 0);
      -[PKPeerPaymentIdentityVerificationViewController navigationController](self, "navigationController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "presentViewController:animated:completion:", v8, 1, 0);

      goto LABEL_7;
    case 3uLL:
      objc_msgSend(v4, "dockView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setButtonsEnabled:", 0);

      objc_msgSend(v5, "dockView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "primaryButton");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setShowSpinner:", 1);

      objc_msgSend(v5, "dockView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "footerView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setButtonsEnabled:", 0);

      -[PKPeerPaymentIdentityVerificationViewController handleNextButtonTapped:](self, "handleNextButtonTapped:", 0);
      break;
    case 5uLL:
    case 6uLL:
      -[PKPeerPaymentIdentityVerificationController webService](self->_controller, "webService");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "peerPaymentService");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "account");
      v8 = (id)objc_claimAutoreleasedReturnValue();

      v9 = objc_alloc_init(MEMORY[0x1E0D66F18]);
      v10 = -[PKPeerPaymentAccountResolutionController initWithAccount:webService:context:delegate:passLibraryDataProvider:]([PKPeerPaymentAccountResolutionController alloc], "initWithAccount:webService:context:delegate:passLibraryDataProvider:", v8, v6, -[PKPaymentSetupTableViewController context](self, "context"), self, v9);
      PKLogFacilityTypeGetObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Presenting contact apple support alert...", buf, 2u);
      }

      MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68540], 0);
      -[PKPeerPaymentAccountResolutionController presentFlowForAccountResolution:configuration:completion:](v10, "presentFlowForAccountResolution:configuration:completion:", 3, 0, &__block_literal_global_244);

LABEL_7:
      break;
    default:
      -[PKPeerPaymentIdentityVerificationViewController _terminateFlow](self, "_terminateFlow");
      break;
  }

}

void __84__PKPeerPaymentIdentityVerificationViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1, int a2)
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

uint64_t __84__PKPeerPaymentIdentityVerificationViewController_explanationViewDidSelectContinue___block_invoke_19(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCancelButtonTapped:", 0);
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  -[PKPeerPaymentIdentityVerificationViewController _handleCancelButtonTapped:](self, "_handleCancelButtonTapped:", 0);
}

- (id)visibleFieldIdentifiers
{
  return self->_visibleFieldIdentifiers;
}

- (void)handleNextButtonTapped:(id)a3
{
  id v4;
  PKPeerPaymentIdentityVerificationController *controller;
  _QWORD v6[5];
  id v7;
  id location;

  v4 = a3;
  -[PKPeerPaymentIdentityVerificationViewController _showNavigationBarSpinner:](self, "_showNavigationBarSpinner:", 1);
  objc_initWeak(&location, self);
  controller = self->_controller;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__PKPeerPaymentIdentityVerificationViewController_handleNextButtonTapped___block_invoke;
  v6[3] = &unk_1E3E61E48;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  -[PKPeerPaymentIdentityVerificationController nextViewControllerWithCompletion:](controller, "nextViewControllerWithCompletion:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __74__PKPeerPaymentIdentityVerificationViewController_handleNextButtonTapped___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __74__PKPeerPaymentIdentityVerificationViewController_handleNextButtonTapped___block_invoke_2;
    v13[3] = &unk_1E3E61E20;
    v13[4] = *(_QWORD *)(a1 + 32);
    v18 = a5;
    v14 = v9;
    v15 = WeakRetained;
    v16 = v11;
    v17 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], v13);

  }
}

void __74__PKPeerPaymentIdentityVerificationViewController_handleNextButtonTapped___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  dispatch_time_t v14;
  id v15;
  _QWORD block[4];
  id v17;
  _QWORD v18[5];

  objc_msgSend(*(id *)(a1 + 32), "_showNavigationBarSpinner:", 0);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1232) = *(_QWORD *)(a1 + 72);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "navigationController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v2;
    v3 = *(_QWORD *)(a1 + 40);
LABEL_3:
    objc_msgSend(v2, "pushViewController:animated:", v3, 1);

    return;
  }
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0D673F8], "displayableErrorForError:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __74__PKPeerPaymentIdentityVerificationViewController_handleNextButtonTapped___block_invoke_3;
    v18[3] = &unk_1E3E612E8;
    v18[4] = *(_QWORD *)(a1 + 32);
    v5 = PKAlertForDisplayableErrorWithHandlers(v4, 0, v18, 0);
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentViewController:animated:completion:", v5, 1, 0);

LABEL_6:
    return;
  }
  v7 = *(void **)(a1 + 64);
  if (v7)
  {
    objc_msgSend(v7, "explanationView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v2;
    v3 = *(_QWORD *)(a1 + 64);
    goto LABEL_3;
  }
  v9 = *(_QWORD **)(a1 + 32);
  if (v9[154] == 1)
  {
    objc_msgSend(v9, "headerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "checkmarkLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRevealed:animated:", 1, 0);

    v11 = *(void **)(a1 + 32);
    PKLocalizedPeerPaymentString(CFSTR("IDENTITY_VERIFICATION_VERIFIED"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHeaderViewTitle:subtitle:", v12, &stru_1E3E7D690);

    objc_msgSend(v4, "setNeedsLayout");
    objc_msgSend(*(id *)(a1 + 32), "_setNavigationBarEnabled:animated:", 0, 1);
    objc_msgSend(*(id *)(a1 + 32), "_destroyNavigationBarButtonItemsAnimated:", 1);
    objc_msgSend(*(id *)(a1 + 32), "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setUserInteractionEnabled:", 0);

    v14 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__PKPeerPaymentIdentityVerificationViewController_handleNextButtonTapped___block_invoke_4;
    block[3] = &unk_1E3E612E8;
    v17 = *(id *)(a1 + 48);
    dispatch_after(v14, MEMORY[0x1E0C80D38], block);

    goto LABEL_6;
  }
}

uint64_t __74__PKPeerPaymentIdentityVerificationViewController_handleNextButtonTapped___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCancelButtonTapped:", 0);
}

uint64_t __74__PKPeerPaymentIdentityVerificationViewController_handleNextButtonTapped___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_terminateFlow");
}

- (id)defaultHeaderViewTitle
{
  return self->_headerTitle;
}

- (id)defaultHeaderViewSubTitle
{
  return self->_headerSubtitle;
}

- (void)_showNavigationBarSpinner:(BOOL)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = !a3;
  -[PKPaymentSetupFieldsViewController _setNavigationBarEnabled:animated:](self, "_setNavigationBarEnabled:animated:", !a3, 1);
  if (v4)
  {
    -[PKPeerPaymentIdentityVerificationViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRightBarButtonItem:", 0);

    -[PKPeerPaymentIdentityVerificationViewController navigationItem](self, "navigationItem");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLeftBarButtonItem:", 0);
  }
  else
  {
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v8, "startAnimating");
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v8);
    -[PKPeerPaymentIdentityVerificationViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRightBarButtonItem:", v5);

  }
}

- (void)_updateNavigationBarItems
{
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (self->_showCancelButton)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__handleCancelButtonTapped_);
    objc_msgSend(v3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AF8]);
    if (v3)
    {
      v5[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentSetupFieldsViewController _setLeftBarButtonItems:animated:](self, "_setLeftBarButtonItems:animated:", v4, 0);

    }
    else
    {
      -[PKPaymentSetupFieldsViewController _setLeftBarButtonItems:animated:](self, "_setLeftBarButtonItems:animated:", 0, 0);
    }
    -[PKPaymentSetupFieldsViewController setHidesBackButton:animated:](self, "setHidesBackButton:animated:", 1, 0);

  }
  else
  {
    -[PKPaymentSetupFieldsViewController _setLeftBarButtonItems:animated:](self, "_setLeftBarButtonItems:animated:", 0, 0);
    -[PKPaymentSetupFieldsViewController setHidesBackButton:animated:](self, "setHidesBackButton:animated:", 0, 0);
  }
}

- (void)_handleCancelButtonTapped:(id)a3
{
  id v4;

  MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68538], 0, a3);
  -[PKPaymentSetupFieldsViewController setupDelegate](self, "setupDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "viewControllerDidCancelSetupFlow:", self);
  else
    -[PKPeerPaymentIdentityVerificationViewController _terminateFlow](self, "_terminateFlow");

}

- (void)_terminateFlow
{
  void *v3;
  void *v4;
  id v5;

  -[PKPaymentSetupFieldsViewController setupDelegate](self, "setupDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v3)
  {
    objc_msgSend(v3, "viewControllerDidTerminateSetupFlow:", self);
  }
  else
  {
    -[PKPeerPaymentIdentityVerificationViewController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (void)setHeaderTitle:(id)a3
{
  objc_storeStrong((id *)&self->_headerTitle, a3);
}

- (NSString)headerSubtitle
{
  return self->_headerSubtitle;
}

- (void)setHeaderSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_headerSubtitle, a3);
}

- (BOOL)showCancelButton
{
  return self->_showCancelButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerSubtitle, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_storeStrong((id *)&self->_visibleFieldIdentifiers, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
