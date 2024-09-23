@implementation PKPeerPaymentActionViewController

+ (id)peerPaymentActionViewControllerForAction:(unint64_t)a3 paymentPass:(id)a4 webService:(id)a5 passLibraryDataProvider:(id)a6 context:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  __objc2_class **v14;
  void *v15;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (a3 == 1)
  {
    v14 = off_1E3E1CA20;
  }
  else
  {
    if (a3 != 2)
    {
      v15 = 0;
      goto LABEL_7;
    }
    v14 = off_1E3E1CA30;
  }
  v15 = (void *)objc_msgSend(objc_alloc(*v14), "initWithPaymentPass:webService:passLibraryDataProvider:context:", v11, v12, v13, a7);
LABEL_7:

  return v15;
}

- (PKPeerPaymentActionViewController)initWithPaymentPass:(id)a3 webService:(id)a4 passLibraryDataProvider:(id)a5 context:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  PKPeerPaymentActionViewController *v14;
  PKPeerPaymentActionViewController *v15;
  uint64_t v16;
  NSDecimalNumber *currentAmount;
  uint64_t v18;
  NSDecimalNumber *cardBalance;
  PKPeerPaymentActionController *v20;
  PKPeerPaymentActionController *actionController;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v29.receiver = self;
  v29.super_class = (Class)PKPeerPaymentActionViewController;
  v14 = -[PKPeerPaymentActionViewController init](&v29, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_pass, a3);
    objc_storeStrong((id *)&v15->_webService, a4);
    v15->_context = a6;
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v16 = objc_claimAutoreleasedReturnValue();
    currentAmount = v15->_currentAmount;
    v15->_currentAmount = (NSDecimalNumber *)v16;

    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v18 = objc_claimAutoreleasedReturnValue();
    cardBalance = v15->_cardBalance;
    v15->_cardBalance = (NSDecimalNumber *)v18;

    objc_storeWeak((id *)&v15->_passLibraryDataProvider, v13);
    v20 = -[PKPeerPaymentActionController initWithPaymentPass:webService:context:passLibraryDataProvider:delegate:]([PKPeerPaymentActionController alloc], "initWithPaymentPass:webService:context:passLibraryDataProvider:delegate:", v11, v12, v15->_context, v13, v15);
    actionController = v15->_actionController;
    v15->_actionController = v20;

    -[PKPeerPaymentActionViewController setShowCancelButton:](v15, "setShowCancelButton:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *MEMORY[0x1E0D6B2B8];
    objc_msgSend(v12, "targetDevice");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", v15, sel__handlePeerPaymentAccountDidChangeNotification_, v23, v24);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v15, sel__handleApplicationDidBecomeActiveNotification_, *MEMORY[0x1E0DC4750], 0);

    -[PKPeerPaymentWebService targetDevice](v15->_webService, "targetDevice");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "account");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPeerPaymentActionViewController setAccount:](v15, "setAccount:", v27);
  }

  return v15;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentActionViewController;
  -[PKPeerPaymentActionViewController dealloc](&v4, sel_dealloc);
}

+ (id)navigationBarBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentActionViewController;
  -[PKPeerPaymentActionViewController loadView](&v5, sel_loadView);
  -[PKPeerPaymentActionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "navigationBarBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentActionViewController;
  -[PKPeerPaymentActionViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  self->_viewHasAppeared = 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentActionViewController;
  -[PKPeerPaymentActionViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  self->_viewHasAppeared = 1;
  if (!self->_dismissingViewController)
    -[PKPeerPaymentActionViewController updateFirstResponder](self, "updateFirstResponder");
}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (void)peerPaymentActionController:(id)a3 hasChangedState:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  switch(a4)
  {
    case 0uLL:
    case 3uLL:
      v7 = v6;
      -[PKPeerPaymentActionViewController _performedAction](self, "_performedAction");
      goto LABEL_5;
    case 4uLL:
      v7 = v6;
      -[PKPeerPaymentActionViewController _cancelledAction](self, "_cancelledAction");
      goto LABEL_5;
    case 5uLL:
      v7 = v6;
      -[PKPeerPaymentActionViewController updateAccountValues](self, "updateAccountValues");
LABEL_5:
      v6 = v7;
      break;
    default:
      break;
  }

}

- (void)peerPaymentActionController:(id)a3 requestPresentViewController:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[PKPeerPaymentActionViewController navigationController](self, "navigationController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentViewController:animated:completion:", v5, 1, 0);

}

- (id)presentationSceneIdentifierForPeerPaymentActionController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKPeerPaymentActionViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)presentationSceneBundleIdentifierForPeerPaymentActionController:(id)a3
{
  return 0;
}

- (void)_cancelledAction
{
  void *v3;
  void *v4;
  id v5;

  -[PKPeerPaymentActionViewController willDismissViewController](self, "willDismissViewController");
  -[PKPeerPaymentActionViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v3)
  {
    objc_msgSend(v3, "peerPaymentActionViewControllerDidCancel:", self);
  }
  else
  {
    -[PKPeerPaymentActionViewController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)_performedAction
{
  void *v3;
  void *v4;
  id v5;

  -[PKPeerPaymentActionViewController willDismissViewController](self, "willDismissViewController");
  -[PKPeerPaymentActionViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v3)
  {
    objc_msgSend(v3, "peerPaymentActionViewControllerDidPerformAction:", self);
  }
  else
  {
    -[PKPeerPaymentActionViewController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)setShowCancelButton:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  if (self->_showCancelButton != a3)
  {
    v3 = a3;
    self->_showCancelButton = a3;
    -[PKPeerPaymentActionViewController navigationItem](self, "navigationItem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[PKPeerPaymentActionViewController _cancelBarButton](self, "_cancelBarButton");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setLeftBarButtonItem:", v5);

    }
    else
    {
      objc_msgSend(v6, "setLeftBarButtonItem:", 0);
    }

  }
}

- (void)willDismissViewController
{
  self->_dismissingViewController = 1;
}

- (void)setControllerAction:(unint64_t)a3
{
  void *v5;

  -[PKPeerPaymentActionViewController actionController](self, "actionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setControllerAction:", a3);

  -[PKPeerPaymentActionViewController updateAccountValues](self, "updateAccountValues");
}

- (unint64_t)controllerAction
{
  void *v2;
  unint64_t v3;

  -[PKPeerPaymentActionViewController actionController](self, "actionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "controllerAction");

  return v3;
}

- (void)setAccount:(id)a3
{
  PKPeerPaymentAccount *v5;
  void *v6;
  PKPeerPaymentAccount *v7;

  v5 = (PKPeerPaymentAccount *)a3;
  if (self->_account != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_account, a3);
    -[PKPeerPaymentActionViewController updateAccountValues](self, "updateAccountValues");
    -[PKPeerPaymentActionViewController viewIfLoaded](self, "viewIfLoaded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsLayout");

    v5 = v7;
  }

}

- (void)updateAccountValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[PKPeerPaymentAccount currentBalance](self->_account, "currentBalance");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentActionViewController feature](self, "feature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "maximumAmount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "minimumAmount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  objc_msgSend(v9, "amount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentActionViewController setCardBalance:](self, "setCardBalance:", v8);

  -[PKPeerPaymentActionViewController setMaxBalance:](self, "setMaxBalance:", 0);
  -[PKPeerPaymentActionViewController setMinBalance:](self, "setMinBalance:", v3);
  -[PKPeerPaymentActionViewController setMinLoadAmount:](self, "setMinLoadAmount:", v7);
  -[PKPeerPaymentActionViewController setMaxLoadAmount:](self, "setMaxLoadAmount:", v6);

}

- (PKPeerPaymentAccountFeatureDescriptor)feature
{
  unint64_t v3;
  void *v4;

  v3 = -[PKPeerPaymentActionViewController controllerAction](self, "controllerAction");
  switch(v3)
  {
    case 3uLL:
      -[PKPeerPaymentAccount transferToBankFeatureDescriptor](self->_account, "transferToBankFeatureDescriptor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      -[PKPeerPaymentAccount instantWithdrawalPromotionFeatureDescriptor](self->_account, "instantWithdrawalPromotionFeatureDescriptor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1uLL:
      -[PKPeerPaymentAccount loadFromCardFeatureDescriptor](self->_account, "loadFromCardFeatureDescriptor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v4 = 0;
      break;
  }
  return (PKPeerPaymentAccountFeatureDescriptor *)v4;
}

- (void)setMaxBalance:(id)a3
{
  void *v4;
  int v5;
  NSDecimalNumber *v6;
  NSDecimalNumber **p_maxBalance;
  char v8;
  NSDecimalNumber *obj;
  NSDecimalNumber *obja;

  obj = (NSDecimalNumber *)a3;
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSDecimalNumber isEqualToNumber:](obj, "isEqualToNumber:", v4);

  if (v5)
  {

    v6 = 0;
  }
  else
  {
    v6 = obj;
  }
  p_maxBalance = &self->_maxBalance;
  if (v6 != *p_maxBalance)
  {
    obja = v6;
    v8 = -[NSDecimalNumber isEqualToNumber:](v6, "isEqualToNumber:");
    v6 = obja;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)p_maxBalance, obja);
      v6 = obja;
    }
  }

}

- (void)setMinBalance:(id)a3
{
  NSDecimalNumber *v5;
  NSDecimalNumber *v6;
  NSDecimalNumber **p_minBalance;
  char v8;
  NSDecimalNumber *v9;

  v5 = (NSDecimalNumber *)a3;
  v6 = v5;
  p_minBalance = &self->_minBalance;
  if (*p_minBalance != v5)
  {
    v9 = v5;
    v8 = -[NSDecimalNumber isEqualToNumber:](v5, "isEqualToNumber:");
    v6 = v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)p_minBalance, a3);
      v6 = v9;
    }
  }

}

- (void)setMinLoadAmount:(id)a3
{
  NSDecimalNumber *v5;
  NSDecimalNumber *v6;
  NSDecimalNumber **p_minLoadAmount;
  char v8;
  NSDecimalNumber *v9;

  v5 = (NSDecimalNumber *)a3;
  v6 = v5;
  p_minLoadAmount = &self->_minLoadAmount;
  if (*p_minLoadAmount != v5)
  {
    v9 = v5;
    v8 = -[NSDecimalNumber isEqualToNumber:](v5, "isEqualToNumber:");
    v6 = v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)p_minLoadAmount, a3);
      v6 = v9;
    }
  }

}

- (void)setMaxLoadAmount:(id)a3
{
  NSDecimalNumber *v5;
  NSDecimalNumber *v6;
  NSDecimalNumber **p_maxLoadAmount;
  char v8;
  NSDecimalNumber *v9;

  v5 = (NSDecimalNumber *)a3;
  v6 = v5;
  p_maxLoadAmount = &self->_maxLoadAmount;
  if (*p_maxLoadAmount != v5)
  {
    v9 = v5;
    v8 = -[NSDecimalNumber isEqualToNumber:](v5, "isEqualToNumber:");
    v6 = v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)p_maxLoadAmount, a3);
      v6 = v9;
    }
  }

}

- (void)setCardBalance:(id)a3
{
  NSDecimalNumber *v5;
  NSDecimalNumber *v6;
  NSDecimalNumber **p_cardBalance;
  char v8;
  void *v9;
  int v10;
  uint64_t v11;
  NSDecimalNumber *v12;
  NSDecimalNumber *v13;

  v5 = (NSDecimalNumber *)a3;
  v6 = v5;
  p_cardBalance = &self->_cardBalance;
  if (*p_cardBalance != v5)
  {
    v13 = v5;
    v8 = -[NSDecimalNumber isEqualToNumber:](v5, "isEqualToNumber:");
    v6 = v13;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)p_cardBalance, a3);
      if (!*p_cardBalance
        || (objc_msgSend(MEMORY[0x1E0CB3598], "notANumber"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v10 = -[NSDecimalNumber isEqual:](v13, "isEqual:", v9),
            v9,
            v6 = v13,
            v10))
      {
        objc_msgSend(MEMORY[0x1E0CB3598], "zero");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = *p_cardBalance;
        *p_cardBalance = (NSDecimalNumber *)v11;

        v6 = v13;
      }
    }
  }

}

- (void)setCurrentAmount:(id)a3
{
  NSDecimalNumber *v5;
  NSDecimalNumber *v6;
  NSDecimalNumber **p_currentAmount;
  char v8;
  void *v9;
  int v10;
  uint64_t v11;
  NSDecimalNumber *v12;
  NSDecimalNumber *v13;

  v5 = (NSDecimalNumber *)a3;
  v6 = v5;
  p_currentAmount = &self->_currentAmount;
  if (*p_currentAmount != v5)
  {
    v13 = v5;
    v8 = -[NSDecimalNumber isEqualToNumber:](v5, "isEqualToNumber:");
    v6 = v13;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)p_currentAmount, a3);
      if (!*p_currentAmount
        || (objc_msgSend(MEMORY[0x1E0CB3598], "notANumber"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v10 = -[NSDecimalNumber isEqual:](v13, "isEqual:", v9),
            v9,
            v6 = v13,
            v10))
      {
        objc_msgSend(MEMORY[0x1E0CB3598], "zero");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = *p_currentAmount;
        *p_currentAmount = (NSDecimalNumber *)v11;

        v6 = v13;
      }
    }
  }

}

- (void)_handlePeerPaymentAccountDidChangeNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__PKPeerPaymentActionViewController__handlePeerPaymentAccountDidChangeNotification___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __84__PKPeerPaymentActionViewController__handlePeerPaymentAccountDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "targetDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "account");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setAccount:", v3);
}

- (void)_handleApplicationDidBecomeActiveNotification:(id)a3
{
  if (self->_viewHasAppeared)
    -[PKPeerPaymentActionViewController updateFirstResponder](self, "updateFirstResponder", a3);
}

- (id)_cancelBarButton
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelButtonPressed_);
  objc_msgSend(v2, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AF8]);
  return v2;
}

- (PKPeerPaymentActionViewControllerDelegate)delegate
{
  return (PKPeerPaymentActionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKPassLibraryDataProvider)passLibraryDataProvider
{
  return (PKPassLibraryDataProvider *)objc_loadWeakRetained((id *)&self->_passLibraryDataProvider);
}

- (void)setPassLibraryDataProvider:(id)a3
{
  objc_storeWeak((id *)&self->_passLibraryDataProvider, a3);
}

- (PKPeerPaymentAccount)account
{
  return self->_account;
}

- (PKPeerPaymentActionController)actionController
{
  return self->_actionController;
}

- (PKPeerPaymentWebService)webService
{
  return self->_webService;
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (int64_t)context
{
  return self->_context;
}

- (NSDecimalNumber)currentAmount
{
  return self->_currentAmount;
}

- (NSDecimalNumber)cardBalance
{
  return self->_cardBalance;
}

- (NSDecimalNumber)minBalance
{
  return self->_minBalance;
}

- (NSDecimalNumber)maxBalance
{
  return self->_maxBalance;
}

- (NSDecimalNumber)minLoadAmount
{
  return self->_minLoadAmount;
}

- (NSDecimalNumber)maxLoadAmount
{
  return self->_maxLoadAmount;
}

- (BOOL)showCancelButton
{
  return self->_showCancelButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxLoadAmount, 0);
  objc_storeStrong((id *)&self->_minLoadAmount, 0);
  objc_storeStrong((id *)&self->_maxBalance, 0);
  objc_storeStrong((id *)&self->_minBalance, 0);
  objc_storeStrong((id *)&self->_cardBalance, 0);
  objc_storeStrong((id *)&self->_currentAmount, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_actionController, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_destroyWeak((id *)&self->_passLibraryDataProvider);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
