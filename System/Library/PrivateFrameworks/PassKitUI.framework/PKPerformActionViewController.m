@implementation PKPerformActionViewController

+ (id)alertControllerForUnableReason:(unint64_t)a3 action:(id)a4 displayableError:(id)a5 addCardActionHandler:(id)a6 unavailableActionHandler:(id)a7 cancelActionHandler:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
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
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  if (a3 != 6)
  {
    if (!v14)
    {
      v18 = 0;
      goto LABEL_21;
    }
    v19 = (void *)MEMORY[0x1E0DC3450];
    PKTitleForDisplayableError();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1A1AE46BC](v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "alertControllerWithTitle:message:preferredStyle:", v20, v21, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3 == 5)
      v22 = CFSTR("PASS_ACTION_UNAVAILABLE_OK_BUTTON_TITLE");
    else
      v22 = CFSTR("PASS_ACTION_UNAVAILABLE_CANCEL_BUTTON_TITLE");
    PKLocalizedPaymentString(&v22->isa);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1E0DC3448];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __154__PKPerformActionViewController_alertControllerForUnableReason_action_displayableError_addCardActionHandler_unavailableActionHandler_cancelActionHandler___block_invoke;
    v44[3] = &unk_1E3E61CA8;
    v45 = v17;
    objc_msgSend(v24, "actionWithTitle:style:handler:", v23, 1, v44);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addAction:", v25);
    if (a3 == 2 && v15)
    {
      v38 = v23;
      if ((objc_msgSend(v13, "serviceProviderCapabilities") & 0xC) == 8)
        v26 = CFSTR("PASS_ACTION_UNAVAILABLE_ADD_DEBIT_CARD_BUTTON_TITLE");
      else
        v26 = CFSTR("PASS_ACTION_UNAVAILABLE_ADD_CARD_BUTTON_TITLE");
      v27 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedPaymentString(&v26->isa);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __154__PKPerformActionViewController_alertControllerForUnableReason_action_displayableError_addCardActionHandler_unavailableActionHandler_cancelActionHandler___block_invoke_2;
      v42[3] = &unk_1E3E61CA8;
      v43 = v15;
      objc_msgSend(v27, "actionWithTitle:style:handler:", v28, 0, v42);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "addAction:", v29);
      objc_msgSend(v18, "setPreferredAction:", v29);

      v30 = v43;
    }
    else
    {
      if (a3 != 7)
      {
LABEL_20:

        goto LABEL_21;
      }
      v38 = v23;
      objc_msgSend(v13, "unavailableActionTitle");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v31)
      {
        v33 = v31;
      }
      else
      {
        PKLocalizedPaymentString(CFSTR("PASS_ACTION_UNAVAILABLE_OK_BUTTON_TITLE"));
        v33 = (id)objc_claimAutoreleasedReturnValue();
      }
      v30 = v33;
      v34 = MEMORY[0x1E0C809B0];

      v35 = (void *)MEMORY[0x1E0DC3448];
      v39[0] = v34;
      v39[1] = 3221225472;
      v39[2] = __154__PKPerformActionViewController_alertControllerForUnableReason_action_displayableError_addCardActionHandler_unavailableActionHandler_cancelActionHandler___block_invoke_3;
      v39[3] = &unk_1E3E683C8;
      v40 = v13;
      v41 = v16;
      objc_msgSend(v35, "actionWithTitle:style:handler:", v30, 0, v39);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addAction:", v36);
      objc_msgSend(v18, "setPreferredAction:", v36);

    }
    v23 = v38;
    goto LABEL_20;
  }
  v18 = PKCreateAlertControllerForWalletUninstalled(0);
LABEL_21:

  return v18;
}

uint64_t __154__PKPerformActionViewController_alertControllerForUnableReason_action_displayableError_addCardActionHandler_unavailableActionHandler_cancelActionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __154__PKPerformActionViewController_alertControllerForUnableReason_action_displayableError_addCardActionHandler_unavailableActionHandler_cancelActionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __154__PKPerformActionViewController_alertControllerForUnableReason_action_displayableError_addCardActionHandler_unavailableActionHandler_cancelActionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "unavailableActionURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D107F8]), "initWithURL:", v3);
    objc_msgSend(v4, "setShouldReturnErrorOnUserCancellation:", 1);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __154__PKPerformActionViewController_alertControllerForUnableReason_action_displayableError_addCardActionHandler_unavailableActionHandler_cancelActionHandler___block_invoke_4;
    v7[3] = &unk_1E3E642A8;
    v8 = v3;
    v9 = *(id *)(a1 + 40);
    v5 = v3;
    objc_msgSend(v4, "requestClipWithCompletion:", v7);

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      (*(void (**)(void))(v6 + 16))();
  }

}

void __154__PKPerformActionViewController_alertControllerForUnableReason_action_displayableError_addCardActionHandler_unavailableActionHandler_cancelActionHandler___block_invoke_4(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t v9[16];

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "PKPerformActionViewController launches app clip", v9, 2u);
    }
  }
  else
  {
    if (objc_msgSend(v5, "code") == 8)
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject openURL:configuration:completionHandler:](v7, "openURL:configuration:completionHandler:", *(_QWORD *)(a1 + 32), 0, 0);
  }

LABEL_7:
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(void))(v8 + 16))();

}

+ (id)alertControllerForUnableReason:(unint64_t)a3 action:(id)a4 displayableError:(id)a5 addCardActionHandler:(id)a6
{
  return (id)objc_msgSend(a1, "alertControllerForUnableReason:action:displayableError:addCardActionHandler:unavailableActionHandler:cancelActionHandler:", a3, a4, a5, a6, 0, 0);
}

- (PKPerformActionViewController)init
{
  return -[PKPerformActionViewController initWithPass:action:](self, "initWithPass:action:", 0, 0);
}

- (PKPerformActionViewController)initWithPass:(id)a3 action:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  PKPerformActionViewController *v10;

  v6 = (objc_class *)MEMORY[0x1E0D67100];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  v10 = -[PKPerformActionViewController initWithPass:action:paymentDataProvider:](self, "initWithPass:action:paymentDataProvider:", v8, v7, v9);

  return v10;
}

- (PKPerformActionViewController)initWithPass:(id)a3 action:(id)a4 paymentDataProvider:(id)a5
{
  return -[PKPerformActionViewController initWithPass:action:viewStyle:paymentDataProvider:](self, "initWithPass:action:viewStyle:paymentDataProvider:", a3, a4, 0, a5);
}

- (PKPerformActionViewController)initWithPass:(id)a3 action:(id)a4 viewStyle:(int64_t)a5 paymentDataProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  PKPerformActionViewController *v16;
  PKPerformActionViewController *v17;
  id *p_action;
  uint64_t v19;
  PKPaymentWebService *webService;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  UIBarButtonItem *button;
  void *v28;
  uint64_t v29;
  UIBarButtonItem *spinner;
  PKPaymentAutoReloadSetupController *v31;
  PKPaymentAutoReloadSetupController *autoReloadSetupController;
  objc_super v34;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = objc_msgSend(v12, "type");
  if (v14)
  {
    v15 = v14;
    v34.receiver = self;
    v34.super_class = (Class)PKPerformActionViewController;
    v16 = -[PKPerformActionViewController init](&v34, sel_init);
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_pass, a3);
      p_action = (id *)&v17->_action;
      objc_storeStrong((id *)&v17->_action, a4);
      objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
      v19 = objc_claimAutoreleasedReturnValue();
      webService = v17->_webService;
      v17->_webService = (PKPaymentWebService *)v19;

      objc_storeStrong((id *)&v17->_paymentDataProvider, a6);
      -[PKPerformActionViewController navigationItem](v17, "navigationItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
      objc_msgSend(v22, "configureWithTransparentBackground");
      PKProvisioningBackgroundColor();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setBackgroundColor:", v23);

      objc_msgSend(v21, "setStandardAppearance:", v22);
      objc_msgSend(v21, "setScrollEdgeAppearance:", v22);
      if (v15 != 5)
      {
        objc_msgSend(*p_action, "title");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setTitle:", v24);

      }
      objc_msgSend(*p_action, "confirmationTitle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v25, 2, v17, sel__rightBarButtonPressed_);
      button = v17->_button;
      v17->_button = (UIBarButtonItem *)v26;

      objc_msgSend(v21, "setRightBarButtonItem:", v17->_button);
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
      v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v28);
      spinner = v17->_spinner;
      v17->_spinner = (UIBarButtonItem *)v29;

      objc_msgSend(v28, "startAnimating");
      v17->_fieldsVerified = 1;
      if (+[PKPaymentAutoReloadSetupController shouldOfferAutoReloadForPass:](PKPaymentAutoReloadSetupController, "shouldOfferAutoReloadForPass:", v11))
      {
        v31 = -[PKPaymentAutoReloadSetupController initWithPass:paymentDataProvider:viewStyle:delegate:]([PKPaymentAutoReloadSetupController alloc], "initWithPass:paymentDataProvider:viewStyle:delegate:", v11, v13, a5, v17);
        autoReloadSetupController = v17->_autoReloadSetupController;
        v17->_autoReloadSetupController = v31;

      }
    }
  }
  else
  {

    v17 = 0;
  }

  return v17;
}

- (void)autoReloadSetupController:(id)a3 requestsPresentViewController:(id)a4
{
  -[PKPerformActionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, 1, 0);
}

- (void)autoReloadSetupController:(id)a3 requestsDismissViewController:(id)a4
{
  -[PKPerformActionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)autoReloadSetupControllerDidCompleteWithAmount:(id)a3 threshold:(id)a4
{
  PKPerformActionViewControllerDelegate **p_delegate;
  id WeakRetained;
  id v7;
  char v8;
  id v9;
  id v10;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    v8 = objc_opt_respondsToSelector();

    v9 = objc_loadWeakRetained((id *)p_delegate);
    v10 = v9;
    if ((v8 & 1) != 0)
      objc_msgSend(v9, "performActionViewControllerDidCompleteAutoReload:", self);
    else
      objc_msgSend(v9, "performActionViewControllerDidPerformAction:", self);
  }
  else
  {
    -[PKPerformActionViewController navigationController](self, "navigationController");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (void)didTapSetUpAutoReloadButton
{
  -[PKPaymentAutoReloadSetupController presentAutoTopUpFlow](self->_autoReloadSetupController, "presentAutoTopUpFlow");
}

- (id)_actionViewForPass:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  __objc2_class **v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "type");
  switch(v8)
  {
    case 1:
      v9 = off_1E3E1CD80;
      break;
    case 5:
      v9 = off_1E3E1CD98;
      break;
    case 2:
      v9 = off_1E3E1CDA8;
      break;
    default:
      v10 = 0;
      goto LABEL_9;
  }
  v10 = (void *)objc_msgSend(objc_alloc(*v9), "initWithPass:action:paymentDataProvider:", v6, v7, self->_paymentDataProvider);
LABEL_9:

  return v10;
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
  v11.super_class = (Class)PKPerformActionViewController;
  -[PKPerformActionViewController viewWillAppear:](&v11, sel_viewWillAppear_, a3);
  -[PKPerformActionViewController _fetchRemoteContentIfNeeded](self, "_fetchRemoteContentIfNeeded");
  -[PKPerformActionViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPerformActionViewController presentingViewController](self, "presentingViewController");
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
    -[PKPerformActionViewController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelButtonPressed_);
    objc_msgSend(v9, "setLeftBarButtonItem:", v10);

  }
LABEL_7:

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPerformActionViewController;
  -[PKPerformActionViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PKPerformActionView willDismissViewController](self->_actionView, "willDismissViewController");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  PKPerformActionPassView *v5;
  PKPaymentPass *pass;
  void *v7;
  PKPerformActionPassView *v8;
  PKPerformActionPassView *passView;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKPerformActionViewController;
  -[PKPerformActionViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[PKPerformActionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKProvisioningBackgroundColor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = [PKPerformActionPassView alloc];
  pass = self->_pass;
  -[PKPerformActionViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v8 = -[PKPerformActionPassView initWithPass:frame:](v5, "initWithPass:frame:", pass);
  passView = self->_passView;
  self->_passView = v8;

  -[PKPerformActionPassView setHidden:](self->_passView, "setHidden:", -[PKPerformActionViewController shouldHidePassView](self, "shouldHidePassView"));
  objc_msgSend(v3, "addSubview:", self->_passView);
  -[PKPerformActionViewController _reloadActionView](self, "_reloadActionView");

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPerformActionViewController;
  -[PKPerformActionViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKPerformActionViewController updateFirstResponder](self, "updateFirstResponder");
}

- (void)updateFirstResponder
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = -[PKPaymentPassAction type](self->_action, "type");
  -[PKPerformActionView amountTextField](self->_actionView, "amountTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 == 1)
    objc_msgSend(v4, "becomeFirstResponder");
  else
    objc_msgSend(v4, "resignFirstResponder");

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double width;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double x;
  double v17;
  double y;
  double v19;
  double height;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  CGRect v26;
  CGRect remainder;
  objc_super v28;
  CGRect v29;

  v28.receiver = self;
  v28.super_class = (Class)PKPerformActionViewController;
  -[PKPerformActionViewController viewWillLayoutSubviews](&v28, sel_viewWillLayoutSubviews);
  -[PKPerformActionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  width = v8;
  v11 = v10;
  objc_msgSend(v3, "safeAreaInsets");
  v13 = v12;
  v15 = v14;
  x = v5 + 0.0;
  y = v7 + v17;
  height = v11 - (v17 + v19);
  memset(&remainder, 0, sizeof(remainder));
  -[PKPerformActionPassView sizeThatFits:](self->_passView, "sizeThatFits:", width, height, 0, 0, 0, 0);
  v22 = v21;
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  CGRectDivide(v29, &v26, &remainder, v22, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  -[PKPerformActionPassView setFrame:](self->_passView, "setFrame:");
  if ((-[PKPerformActionPassView isHidden](self->_passView, "isHidden") & 1) == 0)
  {
    x = remainder.origin.x;
    y = remainder.origin.y;
    width = remainder.size.width;
    height = remainder.size.height;
  }
  v23 = v13 + x;
  v24 = y + 0.0;
  v25 = width - (v13 + v15);
  -[PKPerformActionView setFrame:](self->_actionView, "setFrame:", v23, v24, v25, height);
  -[PKPerformActionLoadingView setFrame:](self->_loadingView, "setFrame:", v23, v24, v25, height);

}

- (BOOL)shouldHidePassView
{
  void *v3;
  BOOL v4;

  if (!PKUIGetMinScreenWidthType())
    return 1;
  -[PKPerformActionViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "verticalSizeClass") == 1;

  return v4;
}

- (void)updatePassViewVisibility
{
  _BOOL8 v3;
  id v4;

  v3 = -[PKPerformActionViewController shouldHidePassView](self, "shouldHidePassView");
  if (v3 != -[PKPerformActionPassView isHidden](self->_passView, "isHidden"))
  {
    -[PKPerformActionPassView setHidden:](self->_passView, "setHidden:", v3);
    -[PKPerformActionViewController viewIfLoaded](self, "viewIfLoaded");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsLayout");

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPerformActionViewController;
  -[PKPerformActionViewController traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[PKPerformActionViewController updatePassViewVisibility](self, "updatePassViewVisibility");
}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (void)shakeCard
{
  -[PKPerformActionPassView shakeImage](self->_passView, "shakeImage");
}

- (void)setRightBarButtonEnabled:(BOOL)a3
{
  self->_fieldsVerified = a3;
  -[UIBarButtonItem setEnabled:](self->_button, "setEnabled:");
}

- (void)_showSpinner:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = a3;
  -[PKPerformActionViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v6 = 4;
  if (v3)
    v6 = 5;
  objc_msgSend(v5, "setRightBarButtonItem:", *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PKPerformActionViewController__pass[v6]));

}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 remoteContentFetched;
  PKPaymentWebService *webService;
  PKPaymentPassAction *action;
  PKPaymentPass *pass;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  -[PKPaymentPassAction remoteContentConfiguration](self->_action, "remoteContentConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (remoteContentFetched = self->_remoteContentFetched, v5, !remoteContentFetched))
  {
    self->_remoteContentFetched = 1;
    objc_initWeak(&location, self);
    webService = self->_webService;
    action = self->_action;
    pass = self->_pass;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__PKPerformActionViewController_preflightWithCompletion___block_invoke;
    v10[3] = &unk_1E3E77BC8;
    objc_copyWeak(&v12, &location);
    v11 = v4;
    -[PKPaymentWebService passActionWithRemoteContentPassAction:forPass:completion:](webService, "passActionWithRemoteContentPassAction:forPass:completion:", action, pass, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
  }

}

void __57__PKPerformActionViewController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__PKPerformActionViewController_preflightWithCompletion___block_invoke_2;
  v10[3] = &unk_1E3E670F8;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  v7 = *(id *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v11 = v5;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

  objc_destroyWeak(&v14);
}

void __57__PKPerformActionViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  uint64_t v4;
  void (*v5)(void);
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id *v17;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v17 = WeakRetained;
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    if (v3)
    {
      objc_storeStrong(WeakRetained + 130, v3);
      v4 = *(_QWORD *)(a1 + 48);
      if (v4)
      {
        v5 = *(void (**)(void))(v4 + 16);
LABEL_7:
        v5();
        goto LABEL_23;
      }
      goto LABEL_23;
    }
    v7 = *(void **)(a1 + 40);
    if (v7)
    {
      objc_msgSend(v7, "domain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *MEMORY[0x1E0D6B0B8];
      if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D6B0B8]) & 1) != 0)
      {
        v10 = objc_msgSend(*(id *)(a1 + 40), "code");

        if (v10 == 60091)
        {
          v11 = *(_QWORD *)(a1 + 48);
          if (!v11)
            goto LABEL_23;
          objc_msgSend(v17, "_generateNoActionsAvailableDueToConflictErrorAlertWithCompletion:", 0);
          v12 = objc_claimAutoreleasedReturnValue();
LABEL_22:
          v16 = (void *)v12;
          (*(void (**)(uint64_t, _QWORD, uint64_t))(v11 + 16))(v11, 0, v12);

          goto LABEL_23;
        }
      }
      else
      {

      }
      v13 = *(void **)(a1 + 40);
      if (v13)
      {
        objc_msgSend(v13, "domain");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v14, "isEqualToString:", v9) & 1) != 0)
        {
          v15 = objc_msgSend(*(id *)(a1 + 40), "code");

          if (v15 == 60086)
          {
            v11 = *(_QWORD *)(a1 + 48);
            if (!v11)
              goto LABEL_23;
            objc_msgSend(v17, "_generateNoActionsAvailableDueToRemoteActionFailureAlertWithCompletion:", 0);
            v12 = objc_claimAutoreleasedReturnValue();
            goto LABEL_22;
          }
        }
        else
        {

        }
      }
    }
    v11 = *(_QWORD *)(a1 + 48);
    if (!v11)
      goto LABEL_23;
    objc_msgSend(v17, "_generateGenericAlertWithCompletion:", 0);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
  {
    v5 = *(void (**)(void))(v6 + 16);
    goto LABEL_7;
  }
LABEL_23:

}

- (void)_fetchRemoteContentIfNeeded
{
  void *v3;
  _BOOL4 remoteContentFetched;
  PKPaymentWebService *webService;
  PKPaymentPassAction *action;
  PKPaymentPass *pass;
  _QWORD v8[4];
  id v9;
  id location;

  -[PKPaymentPassAction remoteContentConfiguration](self->_action, "remoteContentConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    remoteContentFetched = self->_remoteContentFetched;

    if (!remoteContentFetched)
    {
      self->_remoteContentFetched = 1;
      -[PKPerformActionViewController _showLoadingView:](self, "_showLoadingView:", 1);
      objc_initWeak(&location, self);
      webService = self->_webService;
      action = self->_action;
      pass = self->_pass;
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __60__PKPerformActionViewController__fetchRemoteContentIfNeeded__block_invoke;
      v8[3] = &unk_1E3E77BF0;
      objc_copyWeak(&v9, &location);
      -[PKPaymentWebService passActionWithRemoteContentPassAction:forPass:completion:](webService, "passActionWithRemoteContentPassAction:forPass:completion:", action, pass, v8);
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
}

void __60__PKPerformActionViewController__fetchRemoteContentIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__PKPerformActionViewController__fetchRemoteContentIfNeeded__block_invoke_2;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __60__PKPerformActionViewController__fetchRemoteContentIfNeeded__block_invoke_2(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;

  v2 = (id *)(a1 + 48);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_showLoadingView:", 0);
    v5 = *(void **)(a1 + 32);
    if (!v5)
    {
      v6 = *(void **)(a1 + 40);
      if (v6)
      {
        objc_msgSend(v6, "domain");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = *MEMORY[0x1E0D6B0B8];
        if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D6B0B8]) & 1) != 0)
        {
          v9 = objc_msgSend(*(id *)(a1 + 40), "code");

          if (v9 == 60091)
          {
            objc_msgSend(v4, "_showNoActionsAvailableDueToConflictErrorAlert");
            goto LABEL_15;
          }
        }
        else
        {

        }
        v10 = *(void **)(a1 + 40);
        if (v10)
        {
          objc_msgSend(v10, "domain");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v11, "isEqualToString:", v8) & 1) != 0)
          {
            v12 = objc_msgSend(*(id *)(a1 + 40), "code");

            if (v12 == 60086)
            {
              objc_msgSend(v4, "_showNoActionsAvailableDueToRemoteActionFailureAlert");
              goto LABEL_15;
            }
          }
          else
          {

          }
        }
      }
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __60__PKPerformActionViewController__fetchRemoteContentIfNeeded__block_invoke_3;
      v13[3] = &unk_1E3E61310;
      objc_copyWeak(&v14, v2);
      objc_msgSend(v4, "_showGenericErrorAlert:", v13);
      objc_destroyWeak(&v14);
      goto LABEL_15;
    }
    objc_storeStrong(v4 + 130, v5);
    objc_msgSend(v4, "_reloadActionView");
  }
LABEL_15:

}

void __60__PKPerformActionViewController__fetchRemoteContentIfNeeded__block_invoke_3(uint64_t a1)
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
  objc_msgSend(v2, "performActionViewControllerDidCancel:", v3);

}

- (void)_showLoadingView:(BOOL)a3
{
  PKPerformActionLoadingView *loadingView;
  PKPerformActionLoadingView *v5;
  PKPerformActionLoadingView *v6;
  PKPerformActionLoadingView *v7;
  void *v8;
  PKPerformActionView *actionView;

  loadingView = self->_loadingView;
  if (a3)
  {
    if (!loadingView)
    {
      v5 = [PKPerformActionLoadingView alloc];
      -[PKPerformActionView frame](self->_actionView, "frame");
      v6 = -[PKPerformActionLoadingView initWithFrame:](v5, "initWithFrame:");
      v7 = self->_loadingView;
      self->_loadingView = v6;

    }
    -[PKPerformActionViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", self->_loadingView);

    -[PKPerformActionView setDelegate:](self->_actionView, "setDelegate:", 0);
    -[PKPerformActionView removeFromSuperview](self->_actionView, "removeFromSuperview");
    actionView = self->_actionView;
    self->_actionView = 0;

  }
  else
  {
    -[PKPerformActionLoadingView removeFromSuperview](loadingView, "removeFromSuperview");
  }
}

- (void)_reloadActionView
{
  PKPerformActionView *v3;
  PKPerformActionView *actionView;
  id v5;

  -[PKPerformActionView setDelegate:](self->_actionView, "setDelegate:", 0);
  -[PKPerformActionView removeFromSuperview](self->_actionView, "removeFromSuperview");
  -[PKPerformActionViewController _actionViewForPass:action:](self, "_actionViewForPass:action:", self->_pass, self->_action);
  v3 = (PKPerformActionView *)objc_claimAutoreleasedReturnValue();
  actionView = self->_actionView;
  self->_actionView = v3;

  -[PKPerformActionView setDelegate:](self->_actionView, "setDelegate:", self);
  -[PKPerformActionViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertSubview:belowSubview:", self->_actionView, self->_passView);

}

- (void)_rightBarButtonPressed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  PKPerformActionViewController *v11;
  id v12;
  id location[2];

  v4 = a3;
  if (self->_fieldsVerified)
  {
    if (objc_msgSend(MEMORY[0x1E0D67088], "canMakePayments"))
    {
      -[PKPerformActionViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
      -[PKPerformActionViewController setRightBarButtonEnabled:](self, "setRightBarButtonEnabled:", 0);
      -[PKPerformActionView amountTextField](self->_actionView, "amountTextField");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "resignFirstResponder");

      -[PKPerformActionViewController actionView](self, "actionView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(location, self);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __56__PKPerformActionViewController__rightBarButtonPressed___block_invoke;
      v9[3] = &unk_1E3E77C40;
      v7 = v6;
      v10 = v7;
      objc_copyWeak(&v12, location);
      v11 = self;
      -[PKPerformActionViewController _canPerformPaymentWithCompletion:](self, "_canPerformPaymentWithCompletion:", v9);
      objc_destroyWeak(&v12);

      objc_destroyWeak(location);
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(location[0]) = 0;
        _os_log_error_impl(&dword_19D178000, v8, OS_LOG_TYPE_ERROR, "Error: Device is unable to make in-app payments.", (uint8_t *)location, 2u);
      }

      -[PKPerformActionViewController _showGenericErrorAlert:](self, "_showGenericErrorAlert:", 0);
    }
  }

}

void __56__PKPerformActionViewController__rightBarButtonPressed___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  int8x16_t v9;
  _QWORD v10[4];
  int8x16_t v11;
  id v12;
  id v13[2];

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__PKPerformActionViewController__rightBarButtonPressed___block_invoke_2;
  v10[3] = &unk_1E3E77C18;
  objc_copyWeak(v13, (id *)(a1 + 48));
  v9 = *(int8x16_t *)(a1 + 32);
  v7 = (id)v9.i64[0];
  v11 = vextq_s8(v9, v9, 8uLL);
  v13[1] = a3;
  v8 = v5;
  v12 = v8;
  objc_msgSend(v6, "fetchServiceProviderDataWithCompletion:", v10);

  objc_destroyWeak(v13);
}

void __56__PKPerformActionViewController__rightBarButtonPressed___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
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
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  _QWORD aBlock[4];
  id v30;
  id v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 56);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = objc_alloc_init(MEMORY[0x1E0D66EB0]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "actionDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItemDescription:", v7);

  objc_msgSend(v6, "setServiceProviderData:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "serviceProviderIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setServiceProviderIdentifier:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67660]), "initWithServiceProviderOrder:", v6);
  objc_msgSend(*(id *)(a1 + 40), "transactionCurrency");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCurrencyCode:", v10);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "serviceProviderAcceptedNetworks");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSupportedNetworks:", v11);

  objc_msgSend(v9, "setMerchantCapabilities:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "serviceProviderCapabilities"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "serviceProviderCountryCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCountryCode:", v12);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "serviceProviderSupportedCountries");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSupportedCountries:", v13);

  objc_msgSend(*(id *)(a1 + 40), "transactionAmount");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "serviceProviderLocalizedDisplayName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "organizationName");
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;

  objc_msgSend(MEMORY[0x1E0D67358], "summaryItemWithLabel:amount:", v18, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPaymentSummaryItems:", v20);

  v21 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PKPerformActionViewController__rightBarButtonPressed___block_invoke_3;
  aBlock[3] = &unk_1E3E61388;
  v22 = v9;
  v30 = v22;
  v31 = WeakRetained;
  v23 = _Block_copy(aBlock);
  v24 = v23;
  if (*(_QWORD *)(a1 + 64) == 2)
  {
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v21;
    v26[1] = 3221225472;
    v26[2] = __56__PKPerformActionViewController__rightBarButtonPressed___block_invoke_2_74;
    v26[3] = &unk_1E3E73CA8;
    v26[4] = WeakRetained;
    v28 = v24;
    v27 = *(id *)(a1 + 48);
    objc_msgSend(v25, "canPresentPaymentRequest:completion:", v22, v26);

  }
  else if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(WeakRetained, "setRightBarButtonEnabled:", 1);
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 48), 1, 0);
  }
  else
  {
    (*((void (**)(void *))v23 + 2))(v23);
  }

}

void __56__PKPerformActionViewController__rightBarButtonPressed___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67088]), "initWithPaymentRequest:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "setDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "_setPrivateDelegate:", *(_QWORD *)(a1 + 40));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__PKPerformActionViewController__rightBarButtonPressed___block_invoke_4;
  v3[3] = &unk_1E3E62288;
  v3[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "presentWithCompletion:", v3);

}

void __56__PKPerformActionViewController__rightBarButtonPressed___block_invoke_4(uint64_t a1, char a2)
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
  block[2] = __56__PKPerformActionViewController__rightBarButtonPressed___block_invoke_5;
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
    v7[2] = __56__PKPerformActionViewController__rightBarButtonPressed___block_invoke_71;
    v7[3] = &unk_1E3E612E8;
    v7[4] = *(_QWORD *)(a1 + 32);
    v6 = (void *)MEMORY[0x1E0C80D38];
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
}

uint64_t __56__PKPerformActionViewController__rightBarButtonPressed___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRightBarButtonEnabled:", 1);
}

uint64_t __56__PKPerformActionViewController__rightBarButtonPressed___block_invoke_71(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showGenericErrorAlert:", 0);
}

void __56__PKPerformActionViewController__rightBarButtonPressed___block_invoke_2_74(uint64_t a1, uint64_t a2)
{
  _QWORD v3[5];
  id v4;
  id v5;
  uint64_t v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__PKPerformActionViewController__rightBarButtonPressed___block_invoke_3_75;
  v3[3] = &unk_1E3E64370;
  v3[4] = *(_QWORD *)(a1 + 32);
  v6 = a2;
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __56__PKPerformActionViewController__rightBarButtonPressed___block_invoke_3_75(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldPresentPaymentRequest:", *(_QWORD *)(a1 + 56)))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
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
  PKPaymentPassAction *action;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  PKPerformActionViewController *v17;
  id v18;

  v4 = a3;
  if (v4)
  {
    if (-[PKPaymentPassAction type](self->_action, "type") == 5)
    {
      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
      goto LABEL_15;
    }
    if (-[PKPaymentPassAction type](self->_action, "type") == 2)
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
        v15[2] = __66__PKPerformActionViewController__canPerformPaymentWithCompletion___block_invoke;
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
      v8 = -[PKPaymentPass canPerformAction:unableReason:displayableError:](self->_pass, "canPerformAction:unableReason:displayableError:", self->_action, &v14, &v13);
      v5 = v13;
      if ((v8 & 1) != 0)
      {
        (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
LABEL_14:

        goto LABEL_15;
      }
      action = self->_action;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __66__PKPerformActionViewController__canPerformPaymentWithCompletion___block_invoke_2_88;
      v12[3] = &unk_1E3E612E8;
      v12[4] = self;
      +[PKPerformActionViewController alertControllerForUnableReason:action:displayableError:addCardActionHandler:](PKPerformActionViewController, "alertControllerForUnableReason:action:displayableError:addCardActionHandler:", v14, action, v5, v12);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[PKPaymentPass isTransitPass](self->_pass, "isTransitPass"))
      {
        objc_msgSend((id)objc_opt_class(), "displayableErrorForTransitAction:andReason:", self->_action, v14);
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

void __66__PKPerformActionViewController__canPerformPaymentWithCompletion___block_invoke(uint64_t a1, void *a2)
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
  v8[2] = __66__PKPerformActionViewController__canPerformPaymentWithCompletion___block_invoke_2;
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

void __66__PKPerformActionViewController__canPerformPaymentWithCompletion___block_invoke_2(_QWORD *a1)
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
    && (objc_msgSend(v2, "transitPassPropertiesWithPaymentApplication:pass:", a1[5], *(_QWORD *)(a1[6] + 1032)),
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
    v10 = *(_QWORD *)(v9 + 1040);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __66__PKPerformActionViewController__canPerformPaymentWithCompletion___block_invoke_86;
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

void __66__PKPerformActionViewController__canPerformPaymentWithCompletion___block_invoke_86(uint64_t a1)
{
  id *v1;
  id v2;

  v1 = *(id **)(a1 + 32);
  objc_msgSend(v1[130], "serviceProviderAcceptedNetworks");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_presentPaymentSetupControllerWithAllowedPaymentNetworks:", v2);

}

void __66__PKPerformActionViewController__canPerformPaymentWithCompletion___block_invoke_2_88(uint64_t a1)
{
  id *v1;
  id v2;

  v1 = *(id **)(a1 + 32);
  objc_msgSend(v1[130], "serviceProviderAcceptedNetworks");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_presentPaymentSetupControllerWithAllowedPaymentNetworks:", v2);

}

- (id)_generateGenericAlertWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D671C8], "displayableErrorForAction:andReason:", self->_action, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(v5, "localizedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedRecoverySuggestion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedPaymentString(CFSTR("PASS_ACTION_UNAVAILABLE_OK_BUTTON_TITLE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__PKPerformActionViewController__generateGenericAlertWithCompletion___block_invoke;
  v15[3] = &unk_1E3E61CA8;
  v16 = v4;
  v12 = v4;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 1, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v13);

  return v9;
}

uint64_t __69__PKPerformActionViewController__generateGenericAlertWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_showGenericErrorAlert:(id)a3
{
  id v4;

  -[PKPerformActionViewController _generateGenericAlertWithCompletion:](self, "_generateGenericAlertWithCompletion:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPerformActionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (id)_generateNoActionsAvailableDueToRemoteActionFailureAlertWithCompletion:(id)a3
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

  v4 = a3;
  -[PKPaymentPass localizedDescription](self->_pass, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("PASS_ACTION_UNAVAILABLE_UNABLE_TO_GET_AVAILABLE_PASSES_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("PASS_ACTION_UNAVAILABLE_UNABLE_TO_GET_AVAILABLE_PASSES_MESSAGE"), CFSTR("%@"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedPaymentString(CFSTR("PASS_ACTION_UNAVAILABLE_OK_BUTTON_TITLE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __104__PKPerformActionViewController__generateNoActionsAvailableDueToRemoteActionFailureAlertWithCompletion___block_invoke;
  v14[3] = &unk_1E3E61CA8;
  v15 = v4;
  v11 = v4;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 1, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v12);

  return v8;
}

uint64_t __104__PKPerformActionViewController__generateNoActionsAvailableDueToRemoteActionFailureAlertWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
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
    v20[2] = __98__PKPerformActionViewController__generateNoActionsAvailableDueToConflictErrorAlertWithCompletion___block_invoke;
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

    -[PKPerformActionViewController _generateGenericAlertWithCompletion:](self, "_generateGenericAlertWithCompletion:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

uint64_t __98__PKPerformActionViewController__generateNoActionsAvailableDueToConflictErrorAlertWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_showNoActionsAvailableDueToRemoteActionFailureAlert
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __85__PKPerformActionViewController__showNoActionsAvailableDueToRemoteActionFailureAlert__block_invoke;
  v8 = &unk_1E3E61310;
  objc_copyWeak(&v9, &location);
  v3 = _Block_copy(&v5);
  -[PKPerformActionViewController _generateNoActionsAvailableDueToRemoteActionFailureAlertWithCompletion:](self, "_generateNoActionsAvailableDueToRemoteActionFailureAlertWithCompletion:", v3, v5, v6, v7, v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPerformActionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __85__PKPerformActionViewController__showNoActionsAvailableDueToRemoteActionFailureAlert__block_invoke(uint64_t a1)
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
  objc_msgSend(v2, "performActionViewControllerDidCancel:", v3);

}

- (void)_showNoActionsAvailableDueToConflictErrorAlert
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __79__PKPerformActionViewController__showNoActionsAvailableDueToConflictErrorAlert__block_invoke;
  v8 = &unk_1E3E61310;
  objc_copyWeak(&v9, &location);
  v3 = _Block_copy(&v5);
  -[PKPerformActionViewController _generateNoActionsAvailableDueToConflictErrorAlertWithCompletion:](self, "_generateNoActionsAvailableDueToConflictErrorAlertWithCompletion:", v3, v5, v6, v7, v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPerformActionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __79__PKPerformActionViewController__showNoActionsAvailableDueToConflictErrorAlert__block_invoke(uint64_t a1)
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
  objc_msgSend(v2, "performActionViewControllerDidCancel:", v3);

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
  -[PKPerformActionViewController _showSpinner:](self, "_showSpinner:", 1);
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __90__PKPerformActionViewController__presentPaymentSetupControllerWithAllowedPaymentNetworks___block_invoke;
  v8[3] = &unk_1E3E625E8;
  objc_copyWeak(&v10, &location);
  v7 = v6;
  v9 = v7;
  objc_msgSend(v7, "preflightWithCompletion:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __90__PKPerformActionViewController__presentPaymentSetupControllerWithAllowedPaymentNetworks___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  PKPaymentSetupNavigationController *v8;
  PKPaymentSetupNavigationController *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  PKPaymentSetupNavigationController *v12;

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
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __90__PKPerformActionViewController__presentPaymentSetupControllerWithAllowedPaymentNetworks___block_invoke_2;
      v11[3] = &unk_1E3E619E0;
      v11[4] = v7;
      v12 = v8;
      v9 = v8;
      -[PKPaymentSetupNavigationController preflightWithCompletion:](v9, "preflightWithCompletion:", v11);

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
        v10[2] = __90__PKPerformActionViewController__presentPaymentSetupControllerWithAllowedPaymentNetworks___block_invoke_3;
        v10[3] = &unk_1E3E612E8;
        v10[4] = v7;
        objc_msgSend(v7, "_showGenericErrorAlert:", v10);
      }
    }

  }
}

uint64_t __90__PKPerformActionViewController__presentPaymentSetupControllerWithAllowedPaymentNetworks___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_showSpinner:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

void __90__PKPerformActionViewController__presentPaymentSetupControllerWithAllowedPaymentNetworks___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performActionViewControllerDidCancel:", *(_QWORD *)(a1 + 32));

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
  -[PKPerformActionViewController _showSpinner:](self, "_showSpinner:", 1);
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__PKPerformActionViewController__presentAddAnotherCardFlowWithTransitNetworkIdentifiers___block_invoke;
  v8[3] = &unk_1E3E625E8;
  objc_copyWeak(&v10, &location);
  v7 = v6;
  v9 = v7;
  objc_msgSend(v7, "preflightWithCompletion:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __89__PKPerformActionViewController__presentAddAnotherCardFlowWithTransitNetworkIdentifiers___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  PKPaymentSetupNavigationController *v8;
  PKPaymentSetupNavigationController *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  PKPaymentSetupNavigationController *v12;

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
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __89__PKPerformActionViewController__presentAddAnotherCardFlowWithTransitNetworkIdentifiers___block_invoke_2;
      v11[3] = &unk_1E3E619E0;
      v11[4] = v7;
      v12 = v8;
      v9 = v8;
      -[PKPaymentSetupNavigationController preflightWithCompletion:](v9, "preflightWithCompletion:", v11);

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
        v10[2] = __89__PKPerformActionViewController__presentAddAnotherCardFlowWithTransitNetworkIdentifiers___block_invoke_3;
        v10[3] = &unk_1E3E612E8;
        v10[4] = v7;
        objc_msgSend(v7, "_showGenericErrorAlert:", v10);
      }
    }

  }
}

uint64_t __89__PKPerformActionViewController__presentAddAnotherCardFlowWithTransitNetworkIdentifiers___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_showSpinner:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

void __89__PKPerformActionViewController__presentAddAnotherCardFlowWithTransitNetworkIdentifiers___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performActionViewControllerDidCancel:", *(_QWORD *)(a1 + 32));

}

- (BOOL)_shouldPresentPaymentRequest:(int64_t)a3
{
  return ((unint64_t)a3 > 0xA) | (0x5Au >> a3) & 1;
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
  v3[2] = __74__PKPerformActionViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke;
  v3[3] = &unk_1E3E612E8;
  v3[4] = self;
  objc_msgSend(a3, "dismissWithCompletion:", v3);
}

void __74__PKPerformActionViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PKPerformActionViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2;
  block[3] = &unk_1E3E612E8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __74__PKPerformActionViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setModalInPresentation:", 0);
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[125])
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "willDismissViewController");
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "performActionViewControllerDidPerformAction:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    objc_msgSend(v2, "updateFirstResponder");
  }
}

- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKPerformActionViewController view](self, "view", a3);
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
  void (**v8)(id, _QWORD);
  id v9;

  v9 = a4;
  if (v9)
  {
    objc_storeStrong((id *)&self->_completedPurchase, a4);
    v8 = (void (**)(id, _QWORD))a5;
    -[PKPerformActionView saveLastInputValues](self->_actionView, "saveLastInputValues");
    v8[2](v8, 0);
  }
  else
  {
    (*((void (**)(id, uint64_t))a5 + 2))(a5, 1);
  }

}

- (void)paymentSetupDidFinish:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "performActionViewControllerDidCancel:", self);

}

- (void)_cancelButtonPressed:(id)a3
{
  id v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PKPerformActionView willDismissViewController](self->_actionView, "willDismissViewController");
  -[PKPerformActionViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performActionViewControllerDidCancel:", self);

}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (PKPaymentPassAction)action
{
  return self->_action;
}

- (PKPerformActionView)actionView
{
  return self->_actionView;
}

- (PKPaymentWebService)webService
{
  return self->_webService;
}

- (void)setWebService:(id)a3
{
  objc_storeStrong((id *)&self->_webService, a3);
}

- (PKPerformActionViewControllerDelegate)delegate
{
  return (PKPerformActionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_actionView, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_autoReloadSetupController, 0);
  objc_storeStrong((id *)&self->_completedPurchase, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_passView, 0);
}

@end
