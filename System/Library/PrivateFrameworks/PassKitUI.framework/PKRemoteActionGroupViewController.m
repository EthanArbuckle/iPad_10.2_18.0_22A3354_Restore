@implementation PKRemoteActionGroupViewController

- (PKRemoteActionGroupViewController)initWithPass:(id)a3 actionGroup:(id)a4 paymentDataProvider:(id)a5 webService:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PKRemoteActionGroupViewController *v15;
  PKRemoteActionGroupViewController *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  UIBarButtonItem *button;
  void *v22;
  uint64_t v23;
  UIBarButtonItem *spinner;
  objc_super v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)PKRemoteActionGroupViewController;
  v15 = -[PKRemoteActionGroupViewController init](&v26, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_pass, a3);
    objc_storeStrong((id *)&v16->_actionGroup, a4);
    objc_storeStrong((id *)&v16->_paymentDataProvider, a5);
    objc_storeStrong((id *)&v16->_webService, a6);
    -[PKRemoteActionGroupViewController navigationItem](v16, "navigationItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
    objc_msgSend(v18, "configureWithTransparentBackground");
    PKProvisioningBackgroundColor();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBackgroundColor:", v19);

    objc_msgSend(v17, "setStandardAppearance:", v18);
    objc_msgSend(v17, "setScrollEdgeAppearance:", v18);
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", 0, 2, v16, sel__rightBarButtonPressed_);
    button = v16->_button;
    v16->_button = (UIBarButtonItem *)v20;

    objc_msgSend(v17, "setRightBarButtonItem:", v16->_button);
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v22);
    spinner = v16->_spinner;
    v16->_spinner = (UIBarButtonItem *)v23;

    objc_msgSend(v22, "startAnimating");
  }

  return v16;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKRemoteActionGroupViewController;
  -[PKRemoteActionGroupViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[PKRemoteActionGroupViewController _reloadActionGroupActionsView](self, "_reloadActionGroupActionsView");
  -[PKRemoteActionGroupViewController _fetchRemoteContentIfNeeded](self, "_fetchRemoteContentIfNeeded");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKRemoteActionGroupViewController;
  -[PKRemoteActionGroupViewController viewWillAppear:](&v11, sel_viewWillAppear_, a3);
  -[PKRemoteActionGroupViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRemoteActionGroupViewController presentingViewController](self, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    if (v4)
    {
      objc_msgSend(v4, "viewControllers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      if (v8 != 1)
        goto LABEL_7;
    }
    else
    {

    }
    -[PKRemoteActionGroupViewController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelButtonPressed_);
    objc_msgSend(v9, "setLeftBarButtonItem:", v10);

  }
LABEL_7:

}

- (void)_reloadActionGroupActionsView
{
  PKSelectActionGroupActionsView *actionGroupActionView;
  void *v4;
  _BOOL8 v5;
  PKSelectActionGroupActionsView *v6;
  PKSelectActionGroupActionsView *v7;
  PKSelectActionGroupActionsView *v8;
  void *v9;
  id v10;

  -[PKRemoteActionGroupViewController view](self, "view");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PKSelectActionGroupActionsView removeFromSuperview](self->_actionGroupActionView, "removeFromSuperview");
  -[PKSelectActionGroupActionsView setDelegate:](self->_actionGroupActionView, "setDelegate:", 0);
  actionGroupActionView = self->_actionGroupActionView;
  self->_actionGroupActionView = 0;

  -[PKPaymentPassActionGroup remoteContentConfiguration](self->_actionGroup, "remoteContentConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = !self->_remoteContentFetched;
  else
    v5 = 0;

  v6 = -[PKSelectActionGroupActionsView initWithPass:actionGroup:]([PKSelectActionGroupActionsView alloc], "initWithPass:actionGroup:", self->_pass, self->_actionGroup);
  v7 = self->_actionGroupActionView;
  self->_actionGroupActionView = v6;

  -[PKSelectActionGroupActionsView setLoading:](self->_actionGroupActionView, "setLoading:", v5);
  v8 = self->_actionGroupActionView;
  PKProvisioningBackgroundColor();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectActionGroupActionsView setBackgroundColor:](v8, "setBackgroundColor:", v9);

  -[PKSelectActionGroupActionsView setDelegate:](self->_actionGroupActionView, "setDelegate:", self);
  objc_msgSend(v10, "addSubview:", self->_actionGroupActionView);

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
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PKRemoteActionGroupViewController;
  -[PKRemoteActionGroupViewController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  -[PKRemoteActionGroupViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "safeAreaInsets");
  -[PKSelectActionGroupActionsView setFrame:](self->_actionGroupActionView, "setFrame:", v13 + v5 + 0.0, v7 + v12 + 0.0, v9 - (v13 + v14), v11 - (v12 + 0.0));

}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (void)_showSpinner:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = a3;
  -[PKRemoteActionGroupViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v6 = 4;
  if (v3)
    v6 = 5;
  objc_msgSend(v5, "setRightBarButtonItem:", *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PKRemoteActionGroupViewController__pass[v6]));

}

- (void)_rightBarButtonPressed:(id)a3
{
  id v4;

  v4 = a3;
  if (-[PKRemoteActionGroupViewController _canSkipSecondaryScreen](self, "_canSkipSecondaryScreen"))
    -[PKRemoteActionGroupViewController _rightBarButtonPressedForOslo:](self, "_rightBarButtonPressedForOslo:", v4);
  else
    -[PKRemoteActionGroupViewController _rightBarButtonPressedForPerformAction:](self, "_rightBarButtonPressedForPerformAction:", v4);

}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 remoteContentFetched;
  PKPaymentWebService *webService;
  PKPaymentPassActionGroup *actionGroup;
  PKPaymentPass *pass;
  _QWORD v10[5];
  id v11;
  id v12;
  id location;

  v4 = a3;
  -[PKPaymentPassActionGroup remoteContentConfiguration](self->_actionGroup, "remoteContentConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (remoteContentFetched = self->_remoteContentFetched, v5, !remoteContentFetched))
  {
    self->_remoteContentFetched = 1;
    objc_initWeak(&location, self);
    webService = self->_webService;
    actionGroup = self->_actionGroup;
    pass = self->_pass;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__PKRemoteActionGroupViewController_preflightWithCompletion___block_invoke;
    v10[3] = &unk_1E3E73C30;
    objc_copyWeak(&v12, &location);
    v10[4] = self;
    v11 = v4;
    -[PKPaymentWebService passActionGroupWithRemoteContentPassActionGroup:forPass:completion:](webService, "passActionGroupWithRemoteContentPassActionGroup:forPass:completion:", actionGroup, pass, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
  }

}

void __61__PKRemoteActionGroupViewController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__PKRemoteActionGroupViewController_preflightWithCompletion___block_invoke_2;
  block[3] = &unk_1E3E66418;
  block[4] = WeakRetained;
  v13 = v5;
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v14 = v6;
  v15 = v9;
  v16 = v8;
  v10 = v6;
  v11 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __61__PKRemoteActionGroupViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v3 = *(void **)(a1 + 40);
    if (v3)
    {
      objc_storeStrong((id *)(v1 + 976), v3);
      v4 = *(_QWORD *)(a1 + 64);
      if (v4)
        (*(void (**)(uint64_t, uint64_t, _QWORD))(v4 + 16))(v4, 1, 0);
      return;
    }
    v5 = *(void **)(a1 + 48);
    if (v5)
    {
      objc_msgSend(v5, "domain");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D6B0B8]) & 1) != 0)
      {
        v7 = objc_msgSend(*(id *)(a1 + 48), "code");

        if (v7 == 60091)
        {
          v8 = *(_QWORD *)(a1 + 64);
          if (!v8)
            return;
          objc_msgSend(*(id *)(a1 + 56), "_generateNoActionsAvailableDueToConflictErrorAlert");
          v9 = objc_claimAutoreleasedReturnValue();
LABEL_13:
          v10 = (id)v9;
          (*(void (**)(uint64_t, _QWORD, uint64_t))(v8 + 16))(v8, 0, v9);

          return;
        }
      }
      else
      {

      }
    }
    v8 = *(_QWORD *)(a1 + 64);
    if (!v8)
      return;
    objc_msgSend(*(id *)(a1 + 56), "_generateGenericAlertForError:", *(_QWORD *)(a1 + 48));
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
}

- (id)_generateGenericAlertForError:(id)a3
{
  return -[PKRemoteActionGroupViewController _generateGenericAlertForError:completion:](self, "_generateGenericAlertForError:completion:", a3, 0);
}

- (id)_generateGenericAlertForError:(id)a3 completion:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v4 = a4;
  v5 = (void *)MEMORY[0x1E0DC3450];
  PKLocalizedPaymentString(CFSTR("PASS_ACTION_UNAVAILABLE_REASON_GENERIC_BEFORE_REASON"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("PASS_ACTION_UNAVAILABLE_GENERIC_REASON"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedPaymentString(CFSTR("PASS_ACTION_UNAVAILABLE_OK_BUTTON_TITLE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__PKRemoteActionGroupViewController__generateGenericAlertForError_completion___block_invoke;
  v14[3] = &unk_1E3E61CA8;
  v15 = v4;
  v11 = v4;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 1, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v12);

  return v8;
}

uint64_t __78__PKRemoteActionGroupViewController__generateGenericAlertForError_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_showGenericErrorAlertForError:(id)a3 completion:(id)a4
{
  id v5;

  -[PKRemoteActionGroupViewController _generateGenericAlertForError:completion:](self, "_generateGenericAlertForError:completion:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKRemoteActionGroupViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

}

- (id)_generateNoActionsAvailableDueToConflictErrorAlertWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD v20[4];
  id v21;
  uint8_t buf[16];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[PKPaymentPass devicePaymentApplications](self->_pass, "devicePaymentApplications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v10), "supportedTransitNetworkIdentifiers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObjectsFromArray:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    PKPassLocalizedStringWithFormat();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PKPassLocalizedStringWithFormat();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v12, v13, 1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPaymentString(CFSTR("PASS_ACTION_UNAVAILABLE_OK_BUTTON_TITLE"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __102__PKRemoteActionGroupViewController__generateNoActionsAvailableDueToConflictErrorAlertWithCompletion___block_invoke;
    v20[3] = &unk_1E3E61CA8;
    v21 = v4;
    objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 1, v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "addAction:", v17);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v18, OS_LOG_TYPE_DEFAULT, "PKPerformActionViewController unable to find transit network identifiers for pass", buf, 2u);
    }

    -[PKRemoteActionGroupViewController _generateGenericAlertForError:completion:](self, "_generateGenericAlertForError:completion:", 0, v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

uint64_t __102__PKRemoteActionGroupViewController__generateNoActionsAvailableDueToConflictErrorAlertWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_generateNoActionsAvailableDueToConflictErrorAlert
{
  return -[PKRemoteActionGroupViewController _generateNoActionsAvailableDueToConflictErrorAlertWithCompletion:](self, "_generateNoActionsAvailableDueToConflictErrorAlertWithCompletion:", 0);
}

- (void)_fetchRemoteContentIfNeeded
{
  void *v3;
  _BOOL4 remoteContentFetched;
  PKPaymentWebService *webService;
  PKPaymentPassActionGroup *actionGroup;
  PKPaymentPass *pass;
  _QWORD v8[4];
  id v9;
  id location;

  -[PKPaymentPassActionGroup remoteContentConfiguration](self->_actionGroup, "remoteContentConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    remoteContentFetched = self->_remoteContentFetched;

    if (!remoteContentFetched)
    {
      self->_remoteContentFetched = 1;
      -[PKSelectActionGroupActionsView setLoading:](self->_actionGroupActionView, "setLoading:", 1);
      objc_initWeak(&location, self);
      webService = self->_webService;
      actionGroup = self->_actionGroup;
      pass = self->_pass;
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __64__PKRemoteActionGroupViewController__fetchRemoteContentIfNeeded__block_invoke;
      v8[3] = &unk_1E3E73C58;
      objc_copyWeak(&v9, &location);
      -[PKPaymentWebService passActionGroupWithRemoteContentPassActionGroup:forPass:completion:](webService, "passActionGroupWithRemoteContentPassActionGroup:forPass:completion:", actionGroup, pass, v8);
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
}

void __64__PKRemoteActionGroupViewController__fetchRemoteContentIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__PKRemoteActionGroupViewController__fetchRemoteContentIfNeeded__block_invoke_2;
    block[3] = &unk_1E3E62F50;
    block[4] = WeakRetained;
    v8 = v3;
    objc_copyWeak(&v9, v4);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v9);

  }
}

void __64__PKRemoteActionGroupViewController__fetchRemoteContentIfNeeded__block_invoke_2(uint64_t a1)
{
  void *v2;
  id *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setLoading:", 0);
  v3 = *(id **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_storeStrong(v3 + 122, v2);
    objc_msgSend(*(id *)(a1 + 32), "_reloadActionGroupActionsView");
  }
  else
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __64__PKRemoteActionGroupViewController__fetchRemoteContentIfNeeded__block_invoke_3;
    v4[3] = &unk_1E3E61310;
    objc_copyWeak(&v5, (id *)(a1 + 48));
    objc_msgSend(v3, "_showGenericErrorAlert:", v4);
    objc_destroyWeak(&v5);
  }
}

void __64__PKRemoteActionGroupViewController__fetchRemoteContentIfNeeded__block_invoke_3(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "remoteGroupActionsViewControllerDidCancel:", v3);

}

- (void)fetchServiceProviderDataWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v4 = a3;
  v5 = -[PKPaymentPassAction type](self->_selectedAction, "type");
  if (v5 == 5)
  {
    -[PKPaymentPassAction purchaseNewActionItems](self->_selectedAction, "purchaseNewActionItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaymentPass secureElementPass](self->_pass, "secureElementPass");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __76__PKRemoteActionGroupViewController_fetchServiceProviderDataWithCompletion___block_invoke_2;
    v15[3] = &unk_1E3E73C80;
    v16 = v13;
    v17 = v4;
    v8 = v13;
    objc_msgSend(v8, "serviceProviderDataWithItemForPass:completion:", v14, v15);

  }
  else
  {
    if (v5 != 2)
    {
      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v4 + 2))(v4, 0, 0, 0);
      goto LABEL_7;
    }
    -[PKPaymentPassAction selectedActionItems](self->_selectedAction, "selectedActionItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D66D98], "passPropertiesForPass:", self->_pass);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "balance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPass secureElementPass](self->_pass, "secureElementPass");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __76__PKRemoteActionGroupViewController_fetchServiceProviderDataWithCompletion___block_invoke;
    v18[3] = &unk_1E3E73C80;
    v19 = v7;
    v20 = v4;
    v11 = v7;
    objc_msgSend(v11, "serviceProviderDataWithPass:currentLocalBalance:completion:", v10, v9, v18);

  }
LABEL_7:

}

void __76__PKRemoteActionGroupViewController_fetchServiceProviderDataWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "currency");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "amount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, void *))(v3 + 16))(v3, v5, v7, v6);

}

void __76__PKRemoteActionGroupViewController_fetchServiceProviderDataWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "currency");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "amount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, void *))(v3 + 16))(v3, v5, v7, v6);

}

- (void)_rightBarButtonPressedForPerformAction:(id)a3
{
  char v4;
  id v5;
  PKPerformActionViewController *v6;
  PKNavigationController *v7;
  id v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v4 = -[PKPaymentPass canPerformAction:unableReason:displayableError:](self->_pass, "canPerformAction:unableReason:displayableError:", self->_selectedAction, &v9, &v8);
  v5 = v8;
  if ((v4 & 1) != 0 || v9 == 2)
  {
    v6 = -[PKPerformActionViewController initWithPass:action:paymentDataProvider:]([PKPerformActionViewController alloc], "initWithPass:action:paymentDataProvider:", self->_pass, self->_selectedAction, self->_paymentDataProvider);
    -[PKPerformActionViewController setDelegate:](v6, "setDelegate:", self);
    -[PKPerformActionViewController setWebService:](v6, "setWebService:", self->_webService);
    v7 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v6);
    -[PKNavigationController setSupportedInterfaceOrientations:](v7, "setSupportedInterfaceOrientations:", 2);
    -[PKRemoteActionGroupViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

  }
  else
  {
    +[PKPerformActionViewController alertControllerForUnableReason:action:displayableError:addCardActionHandler:](PKPerformActionViewController, "alertControllerForUnableReason:action:displayableError:addCardActionHandler:", v9, self->_selectedAction, v5, 0);
    v6 = (PKPerformActionViewController *)objc_claimAutoreleasedReturnValue();
    -[PKRemoteActionGroupViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
  }

}

- (void)_rightBarButtonPressedForOslo:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;
  id location[2];

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D67088], "canMakePayments"))
  {
    -[PKRemoteActionGroupViewController setRightBarButtonEnabled:](self, "setRightBarButtonEnabled:", 0);
    objc_initWeak(location, self);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __67__PKRemoteActionGroupViewController__rightBarButtonPressedForOslo___block_invoke;
    v6[3] = &unk_1E3E73CF8;
    v6[4] = self;
    objc_copyWeak(&v7, location);
    -[PKRemoteActionGroupViewController _canPerformPaymentWithCompletion:](self, "_canPerformPaymentWithCompletion:", v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(location);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_19D178000, v5, OS_LOG_TYPE_ERROR, "Error: Device is unable to make in-app payments.", (uint8_t *)location, 2u);
    }

    -[PKRemoteActionGroupViewController _showGenericErrorAlert:](self, "_showGenericErrorAlert:", 0);
  }

}

void __67__PKRemoteActionGroupViewController__rightBarButtonPressedForOslo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10[2];

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__PKRemoteActionGroupViewController__rightBarButtonPressedForOslo___block_invoke_2;
  v8[3] = &unk_1E3E73CD0;
  objc_copyWeak(v10, (id *)(a1 + 40));
  v8[4] = *(_QWORD *)(a1 + 32);
  v10[1] = a3;
  v7 = v5;
  v9 = v7;
  objc_msgSend(v6, "fetchServiceProviderDataWithCompletion:", v8);

  objc_destroyWeak(v10);
}

void __67__PKRemoteActionGroupViewController__rightBarButtonPressedForOslo___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v7;
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD block[5];
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  _QWORD aBlock[4];
  id v38;
  id v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v7 = (id *)(a1 + 48);
  v8 = a4;
  v9 = a3;
  v10 = a2;
  WeakRetained = objc_loadWeakRetained(v7);
  v12 = objc_alloc_init(MEMORY[0x1E0D66EB0]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "actionDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setItemDescription:", v13);

  objc_msgSend(v12, "setServiceProviderData:", v10);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "serviceProviderIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setServiceProviderIdentifier:", v14);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67660]), "initWithServiceProviderOrder:", v12);
  objc_msgSend(v15, "setCurrencyCode:", v9);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "serviceProviderAcceptedNetworks");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSupportedNetworks:", v16);

  objc_msgSend(v15, "setMerchantCapabilities:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "serviceProviderCapabilities"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "serviceProviderCountryCode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCountryCode:", v17);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "serviceProviderSupportedCountries");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSupportedCountries:", v18);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "serviceProviderLocalizedDisplayName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    v21 = v19;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "organizationName");
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  v22 = v21;

  objc_msgSend(MEMORY[0x1E0D67358], "summaryItemWithLabel:amount:", v22, v8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v40[0] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPaymentSummaryItems:", v24);

  v25 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PKRemoteActionGroupViewController__rightBarButtonPressedForOslo___block_invoke_3;
  aBlock[3] = &unk_1E3E61388;
  v26 = v15;
  v38 = v26;
  v39 = WeakRetained;
  v27 = _Block_copy(aBlock);
  v28 = v27;
  if (*(_QWORD *)(a1 + 56) == 2)
  {
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v25;
    v34[1] = 3221225472;
    v34[2] = __67__PKRemoteActionGroupViewController__rightBarButtonPressedForOslo___block_invoke_2_56;
    v34[3] = &unk_1E3E73CA8;
    v34[4] = WeakRetained;
    v36 = v28;
    v35 = *(id *)(a1 + 40);
    objc_msgSend(v29, "canPresentPaymentRequest:completion:", v26, v34);

    v30 = v36;
  }
  else
  {
    v31 = *(void **)(a1 + 40);
    if (!v31)
    {
      (*((void (**)(void *))v27 + 2))(v27);
      goto LABEL_9;
    }
    block[0] = v25;
    block[1] = 3221225472;
    block[2] = __67__PKRemoteActionGroupViewController__rightBarButtonPressedForOslo___block_invoke_4_59;
    block[3] = &unk_1E3E61388;
    block[4] = WeakRetained;
    v33 = v31;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v30 = v33;
  }

LABEL_9:
}

void __67__PKRemoteActionGroupViewController__rightBarButtonPressedForOslo___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67088]), "initWithPaymentRequest:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "setDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "_setPrivateDelegate:", *(_QWORD *)(a1 + 40));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__PKRemoteActionGroupViewController__rightBarButtonPressedForOslo___block_invoke_4;
  v3[3] = &unk_1E3E62288;
  v3[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "presentWithCompletion:", v3);

}

void __67__PKRemoteActionGroupViewController__rightBarButtonPressedForOslo___block_invoke_4(uint64_t a1, char a2)
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[8];
  _QWORD block[5];

  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PKRemoteActionGroupViewController__rightBarButtonPressedForOslo___block_invoke_5;
  block[3] = &unk_1E3E612E8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  if ((a2 & 1) == 0)
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19D178000, v5, OS_LOG_TYPE_ERROR, "Error: Device failed to present payment coordinator!", buf, 2u);
    }

    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __67__PKRemoteActionGroupViewController__rightBarButtonPressedForOslo___block_invoke_53;
    v7[3] = &unk_1E3E612E8;
    v7[4] = *(_QWORD *)(a1 + 32);
    v6 = (void *)MEMORY[0x1E0C80D38];
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
}

uint64_t __67__PKRemoteActionGroupViewController__rightBarButtonPressedForOslo___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRightBarButtonEnabled:", 1);
}

uint64_t __67__PKRemoteActionGroupViewController__rightBarButtonPressedForOslo___block_invoke_53(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showGenericErrorAlert:", 0);
}

void __67__PKRemoteActionGroupViewController__rightBarButtonPressedForOslo___block_invoke_2_56(uint64_t a1, uint64_t a2)
{
  _QWORD v3[5];
  id v4;
  id v5;
  uint64_t v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__PKRemoteActionGroupViewController__rightBarButtonPressedForOslo___block_invoke_3_57;
  v3[3] = &unk_1E3E64370;
  v3[4] = *(_QWORD *)(a1 + 32);
  v6 = a2;
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __67__PKRemoteActionGroupViewController__rightBarButtonPressedForOslo___block_invoke_3_57(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldPresentPaymentRequest:", *(_QWORD *)(a1 + 56)))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "setRightBarButtonEnabled:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

uint64_t __67__PKRemoteActionGroupViewController__rightBarButtonPressedForOslo___block_invoke_4_59(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setRightBarButtonEnabled:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (void)_canPerformPaymentWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  PKPaymentDataProvider *paymentDataProvider;
  char v8;
  PKPaymentPassAction *selectedAction;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  PKRemoteActionGroupViewController *v17;
  id v18;

  v4 = a3;
  if (v4)
  {
    if (-[PKPaymentPassAction type](self->_selectedAction, "type") == 5)
    {
      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
      goto LABEL_15;
    }
    if (-[PKPaymentPassAction type](self->_selectedAction, "type") == 2)
    {
      -[PKPaymentPass uniqueID](self->_pass, "uniqueID");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPass devicePrimaryPaymentApplication](self->_pass, "devicePrimaryPaymentApplication");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        paymentDataProvider = self->_paymentDataProvider;
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __70__PKRemoteActionGroupViewController__canPerformPaymentWithCompletion___block_invoke;
        v15[3] = &unk_1E3E73D20;
        v16 = v6;
        v17 = self;
        v18 = v4;
        -[PKPaymentDataProvider transitStateWithPassUniqueIdentifier:paymentApplication:completion:](paymentDataProvider, "transitStateWithPassUniqueIdentifier:paymentApplication:completion:", v5, v16, v15);

      }
      else
      {
        (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
      }
    }
    else
    {
      v13 = 0;
      v14 = 0;
      v8 = -[PKPaymentPass canPerformAction:unableReason:displayableError:](self->_pass, "canPerformAction:unableReason:displayableError:", self->_selectedAction, &v14, &v13);
      v5 = v13;
      if ((v8 & 1) != 0)
      {
        (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
LABEL_14:

        goto LABEL_15;
      }
      selectedAction = self->_selectedAction;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __70__PKRemoteActionGroupViewController__canPerformPaymentWithCompletion___block_invoke_2_70;
      v12[3] = &unk_1E3E612E8;
      v12[4] = self;
      +[PKPerformActionViewController alertControllerForUnableReason:action:displayableError:addCardActionHandler:](PKPerformActionViewController, "alertControllerForUnableReason:action:displayableError:addCardActionHandler:", v14, selectedAction, v5, v12);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[PKPaymentPass isTransitPass](self->_pass, "isTransitPass"))
      {
        objc_msgSend((id)objc_opt_class(), "displayableErrorForTransitAction:andReason:", self->_selectedAction, v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        MEMORY[0x1A1AE46BC]();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setMessage:", v11);

      }
      (*((void (**)(id, void *, uint64_t))v4 + 2))(v4, v6, v14);
    }

    goto LABEL_14;
  }
LABEL_15:

}

void __70__PKRemoteActionGroupViewController__canPerformPaymentWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__PKRemoteActionGroupViewController__canPerformPaymentWithCompletion___block_invoke_2;
  v8[3] = &unk_1E3E622D8;
  v9 = v3;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v10 = v4;
  v11 = v5;
  v12 = v6;
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __70__PKRemoteActionGroupViewController__canPerformPaymentWithCompletion___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[16];

  v2 = (void *)a1[4];
  if (v2
    && (objc_msgSend(v2, "transitPassPropertiesWithPaymentApplication:pass:", a1[5], *(_QWORD *)(a1[6] + 968)),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "isEnRoute"),
        v3,
        v4))
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Device unable to make in-app payments while in transit.", buf, 2u);
    }

    PKLocalizedPaymentString(CFSTR("CARD_IN_TRANSIT"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PKPassLocalizedStringWithFormat();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PKDisplayableErrorCustom();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = a1[6];
    v10 = *(_QWORD *)(v9 + 992);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __70__PKRemoteActionGroupViewController__canPerformPaymentWithCompletion___block_invoke_68;
    v12[3] = &unk_1E3E612E8;
    v12[4] = v9;
    +[PKPerformActionViewController alertControllerForUnableReason:action:displayableError:addCardActionHandler:](PKPerformActionViewController, "alertControllerForUnableReason:action:displayableError:addCardActionHandler:", 5, v10, v8, v12, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(a1[7] + 16))();

  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }
}

void __70__PKRemoteActionGroupViewController__canPerformPaymentWithCompletion___block_invoke_68(uint64_t a1)
{
  id *v1;
  id v2;

  v1 = *(id **)(a1 + 32);
  objc_msgSend(v1[124], "serviceProviderAcceptedNetworks");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_presentPaymentSetupControllerWithAllowedPaymentNetworks:", v2);

}

void __70__PKRemoteActionGroupViewController__canPerformPaymentWithCompletion___block_invoke_2_70(uint64_t a1)
{
  id *v1;
  id v2;

  v1 = *(id **)(a1 + 32);
  objc_msgSend(v1[124], "serviceProviderAcceptedNetworks");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_presentPaymentSetupControllerWithAllowedPaymentNetworks:", v2);

}

- (void)_presentPaymentSetupControllerWithAllowedPaymentNetworks:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67230]), "initWithWebService:", v5);
  objc_msgSend(v6, "setAllowedPaymentNetworks:", v4);
  -[PKRemoteActionGroupViewController _showSpinner:](self, "_showSpinner:", 1);
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__PKRemoteActionGroupViewController__presentPaymentSetupControllerWithAllowedPaymentNetworks___block_invoke;
  v8[3] = &unk_1E3E625E8;
  objc_copyWeak(&v10, &location);
  v7 = v6;
  v9 = v7;
  objc_msgSend(v7, "preflightWithCompletion:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __94__PKRemoteActionGroupViewController__presentPaymentSetupControllerWithAllowedPaymentNetworks___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  PKPaymentSetupNavigationController *v8;
  PKPaymentSetupNavigationController *v9;
  _QWORD v10[5];
  _QWORD v11[4];
  PKPaymentSetupNavigationController *v12;
  id v13;
  id location;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      v8 = -[PKPaymentSetupNavigationController initWithProvisioningController:context:]([PKPaymentSetupNavigationController alloc], "initWithProvisioningController:context:", *(_QWORD *)(a1 + 32), 0);
      -[PKPaymentSetupNavigationController setShowsWelcomeViewController:](v8, "setShowsWelcomeViewController:", 0);
      -[PKNavigationController setCustomFormSheetPresentationStyleForiPad](v8, "setCustomFormSheetPresentationStyleForiPad");
      objc_initWeak(&location, v7);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __94__PKRemoteActionGroupViewController__presentPaymentSetupControllerWithAllowedPaymentNetworks___block_invoke_2;
      v11[3] = &unk_1E3E62FA0;
      objc_copyWeak(&v13, &location);
      v9 = v8;
      v12 = v9;
      -[PKPaymentSetupNavigationController preflightWithCompletion:](v9, "preflightWithCompletion:", v11);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_msgSend(WeakRetained, "_showSpinner:", 0);
      objc_msgSend(*(id *)(a1 + 32), "alertForDisplayableError:", v5);
      v9 = (PKPaymentSetupNavigationController *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v7, "presentViewController:animated:completion:", v9, 1, 0);
      }
      else
      {
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __94__PKRemoteActionGroupViewController__presentPaymentSetupControllerWithAllowedPaymentNetworks___block_invoke_3;
        v10[3] = &unk_1E3E612E8;
        v10[4] = v7;
        objc_msgSend(v7, "_showGenericErrorAlert:", v10);
      }
    }

  }
}

void __94__PKRemoteActionGroupViewController__presentPaymentSetupControllerWithAllowedPaymentNetworks___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_showSpinner:", 0);
    objc_msgSend(v3, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 32), 1, 0);
    WeakRetained = v3;
  }

}

uint64_t __94__PKRemoteActionGroupViewController__presentPaymentSetupControllerWithAllowedPaymentNetworks___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_presentAddAnotherCardFlowWithTransitNetworkIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67230]), "initWithWebService:", v5);
  objc_msgSend(v6, "setRequiredTransitNetworkIdentifiers:", v4);
  -[PKRemoteActionGroupViewController _showSpinner:](self, "_showSpinner:", 1);
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __93__PKRemoteActionGroupViewController__presentAddAnotherCardFlowWithTransitNetworkIdentifiers___block_invoke;
  v8[3] = &unk_1E3E625E8;
  objc_copyWeak(&v10, &location);
  v7 = v6;
  v9 = v7;
  objc_msgSend(v7, "preflightWithCompletion:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __93__PKRemoteActionGroupViewController__presentAddAnotherCardFlowWithTransitNetworkIdentifiers___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  PKPaymentSetupNavigationController *v8;
  PKPaymentSetupNavigationController *v9;
  _QWORD v10[5];
  _QWORD v11[4];
  PKPaymentSetupNavigationController *v12;
  id v13;
  id location;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      v8 = -[PKPaymentSetupNavigationController initWithProvisioningController:context:]([PKPaymentSetupNavigationController alloc], "initWithProvisioningController:context:", *(_QWORD *)(a1 + 32), 0);
      -[PKPaymentSetupNavigationController setShowsWelcomeViewController:](v8, "setShowsWelcomeViewController:", 0);
      -[PKNavigationController setCustomFormSheetPresentationStyleForiPad](v8, "setCustomFormSheetPresentationStyleForiPad");
      -[PKPaymentSetupNavigationController setPaymentSetupMode:](v8, "setPaymentSetupMode:", 3);
      -[PKPaymentSetupNavigationController setSetupDelegate:](v8, "setSetupDelegate:", v7);
      objc_initWeak(&location, v7);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __93__PKRemoteActionGroupViewController__presentAddAnotherCardFlowWithTransitNetworkIdentifiers___block_invoke_2;
      v11[3] = &unk_1E3E62FA0;
      objc_copyWeak(&v13, &location);
      v9 = v8;
      v12 = v9;
      -[PKPaymentSetupNavigationController preflightWithCompletion:](v9, "preflightWithCompletion:", v11);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_msgSend(WeakRetained, "_showSpinner:", 0);
      objc_msgSend(*(id *)(a1 + 32), "alertForDisplayableError:", v5);
      v9 = (PKPaymentSetupNavigationController *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v7, "presentViewController:animated:completion:", v9, 1, 0);
      }
      else
      {
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __93__PKRemoteActionGroupViewController__presentAddAnotherCardFlowWithTransitNetworkIdentifiers___block_invoke_3;
        v10[3] = &unk_1E3E612E8;
        v10[4] = v7;
        objc_msgSend(v7, "_showGenericErrorAlert:", v10);
      }
    }

  }
}

void __93__PKRemoteActionGroupViewController__presentAddAnotherCardFlowWithTransitNetworkIdentifiers___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_showSpinner:", 0);
    objc_msgSend(v3, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 32), 1, 0);
    WeakRetained = v3;
  }

}

uint64_t __93__PKRemoteActionGroupViewController__presentAddAnotherCardFlowWithTransitNetworkIdentifiers___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (BOOL)_shouldPresentPaymentRequest:(int64_t)a3
{
  return ((unint64_t)a3 > 0xA) | (0x5Au >> a3) & 1;
}

- (BOOL)_canSkipSecondaryScreen
{
  uint64_t v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = -[PKPaymentPassAction type](self->_selectedAction, "type");
  if (v3 == 5)
  {
    -[PKPaymentPassAction purchaseNewActionItems](self->_selectedAction, "purchaseNewActionItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v3 != 2)
      return 0;
    -[PKPaymentPassAction selectedActionItems](self->_selectedAction, "selectedActionItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  v6 = objc_msgSend(v4, "count") == 1;

  return v6;
}

- (void)_showGenericErrorAlert:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0DC3450];
  PKLocalizedPaymentString(CFSTR("PASS_ACTION_UNAVAILABLE_REASON_GENERIC_BEFORE_REASON"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("PASS_ACTION_UNAVAILABLE_GENERIC_REASON"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedPaymentString(CFSTR("PASS_ACTION_UNAVAILABLE_OK_BUTTON_TITLE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__PKRemoteActionGroupViewController__showGenericErrorAlert___block_invoke;
  v13[3] = &unk_1E3E61CA8;
  v14 = v4;
  v11 = v4;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 1, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v12);

  -[PKRemoteActionGroupViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
}

uint64_t __60__PKRemoteActionGroupViewController__showGenericErrorAlert___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)performActionViewControllerDidCancel:(id)a3
{
  id v4;

  objc_msgSend(a3, "setDelegate:", 0);
  -[PKRemoteActionGroupViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteGroupActionsViewControllerDidCancel:", self);

}

- (void)performActionViewControllerDidPerformAction:(id)a3
{
  id v4;

  objc_msgSend(a3, "setDelegate:", 0);
  -[PKRemoteActionGroupViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteGroupActionsViewControllerDidPerformFetchActionGroup:", self);

}

- (void)selectActionGroupActionsViewDidSelectActionGroupAction:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_selectedAction, a3);
  if (-[PKRemoteActionGroupViewController _canSkipSecondaryScreen](self, "_canSkipSecondaryScreen"))
    -[PKPaymentPassAction confirmationTitle](self->_selectedAction, "confirmationTitle");
  else
    PKLocalizedPaymentString(CFSTR("NEXT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRemoteActionGroupViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rightBarButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v5);

}

- (void)_cancelButtonPressed:(id)a3
{
  id v4;

  -[PKRemoteActionGroupViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteGroupActionsViewControllerDidCancel:", self);

}

- (void)setRightBarButtonEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[PKRemoteActionGroupViewController navigationItem](self, "navigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  objc_class *v5;
  void (**v6)(id, id);
  id v7;

  v5 = (objc_class *)MEMORY[0x1E0D670A8];
  v6 = (void (**)(id, id))a5;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "setStatus:", 1);
  v6[2](v6, v7);

}

- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __78__PKRemoteActionGroupViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke;
  v3[3] = &unk_1E3E612E8;
  v3[4] = self;
  objc_msgSend(a3, "dismissWithCompletion:", v3);
}

void __78__PKRemoteActionGroupViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__PKRemoteActionGroupViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2;
  block[3] = &unk_1E3E612E8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __78__PKRemoteActionGroupViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteGroupActionsViewControllerDidPerformPayment:", *(_QWORD *)(a1 + 32));

}

- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKRemoteActionGroupViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePurchase:(id)a4 completion:(id)a5
{
  (*((void (**)(id, BOOL))a5 + 2))(a5, a4 == 0);
}

- (void)paymentSetupDidFinish:(id)a3
{
  -[PKRemoteActionGroupViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (PKRemoteActionGroupViewControllerDelegate)delegate
{
  return (PKRemoteActionGroupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_selectedAction, 0);
  objc_storeStrong((id *)&self->_actionGroupActionView, 0);
  objc_storeStrong((id *)&self->_actionGroup, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
