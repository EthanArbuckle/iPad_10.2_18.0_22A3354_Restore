@implementation PKNewDevicePasscodeViewController

- (PKNewDevicePasscodeViewController)initWithPasscodeUpgradeFlowController:(id)a3 minimumPasscodeLength:(int64_t)a4 withCurrentPasscode:(id)a5
{
  id v8;
  id v9;
  PKNewDevicePasscodeViewController *v10;
  PKNewDevicePasscodeViewController *v11;
  uint64_t v12;
  NSString *currentPasscode;
  void *v14;
  PKPaymentService *v15;
  PKPaymentService *paymentService;
  objc_super v18;

  v8 = a3;
  v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PKNewDevicePasscodeViewController;
  v10 = -[PKNewDevicePasscodeViewController init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_flowController, v8);
    v11->_minimumPasscodeLength = a4;
    objc_msgSend(v9, "pk_zString");
    v12 = objc_claimAutoreleasedReturnValue();
    currentPasscode = v11->_currentPasscode;
    v11->_currentPasscode = (NSString *)v12;

    v11->_passcodeInputState = 0;
    v11->_context = objc_msgSend(v8, "context");
    -[PKNewDevicePasscodeViewController navigationItem](v11, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v14, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    v15 = (PKPaymentService *)objc_alloc_init(MEMORY[0x1E0D672B0]);
    paymentService = v11->_paymentService;
    v11->_paymentService = v15;

  }
  return v11;
}

- (void)loadView
{
  BFFPasscodeView *v3;
  BFFPasscodeView *passcodeView;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKNewDevicePasscodeViewController;
  -[PKNewDevicePasscodeViewController loadView](&v5, sel_loadView);
  v3 = (BFFPasscodeView *)objc_msgSend(objc_alloc(getBFFPasscodeViewClass()), "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  passcodeView = self->_passcodeView;
  self->_passcodeView = v3;

  -[BFFPasscodeView setAutoresizingMask:](self->_passcodeView, "setAutoresizingMask:", 18);
  -[BFFPasscodeView setPasscodeViewController:](self->_passcodeView, "setPasscodeViewController:", self);
  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts")&& (PKPaymentSetupContextIsSetupAssistant() & 1) == 0)
  {
    -[BFFPasscodeView setScrollEnabled:](self->_passcodeView, "setScrollEnabled:", 0);
  }
  -[PKNewDevicePasscodeViewController setView:](self, "setView:", self->_passcodeView);
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  BFFPasscodeView *passcodeView;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKNewDevicePasscodeViewController;
  -[PKNewDevicePasscodeViewController viewDidLoad](&v8, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "minimumNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:", 0);

  self->_passcodeInputScreenType = -[PKNewDevicePasscodeViewController _passcodeInputScreenTypeForUnlockScreenType:](self, "_passcodeInputScreenTypeForUnlockScreenType:", v4);
  -[PKNewDevicePasscodeViewController _configureNavigationItemForPasscodeInputScreenType:animated:](self, "_configureNavigationItemForPasscodeInputScreenType:animated:");
  passcodeView = self->_passcodeView;
  -[PKNewDevicePasscodeViewController _titleForState:](self, "_titleForState:", self->_passcodeInputState);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFPasscodeView setTitle:](passcodeView, "setTitle:", v6);

  -[PKNewDevicePasscodeViewController _passcodeInputViewForPasscodeInputState:passcodeInputScreenType:](self, "_passcodeInputViewForPasscodeInputState:passcodeInputScreenType:", self->_passcodeInputState, self->_passcodeInputScreenType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFPasscodeView transitionToPasscodeInput:delegate:](self->_passcodeView, "transitionToPasscodeInput:delegate:", v7, self);

}

- (void)viewWillAppear:(BOOL)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKNewDevicePasscodeViewController;
  -[PKNewDevicePasscodeViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  if (!self->_viewHasAppeared)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_flowController);
    objc_msgSend(WeakRetained, "beginShowingViewController");

    self->_viewHasAppeared = 1;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKNewDevicePasscodeViewController;
  -[PKNewDevicePasscodeViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[BFFPasscodeView passcodeInputView](self->_passcodeView, "passcodeInputView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "becomeFirstResponder");
  objc_msgSend(v4, "passcode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKNewDevicePasscodeViewController _updateNextButtonForPasscode:](self, "_updateNextButtonForPasscode:", v5);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKNewDevicePasscodeViewController;
  -[PKNewDevicePasscodeViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[BFFPasscodeView passcodeInputView](self->_passcodeView, "passcodeInputView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resignFirstResponder");

}

- (void)viewDidDisappear:(BOOL)a3
{
  NSString *currentPasscode;
  NSString *newPasscode;
  id WeakRetained;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKNewDevicePasscodeViewController;
  -[PKNewDevicePasscodeViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  -[BFFPasscodeView transitionToPasscodeInput:delegate:](self->_passcodeView, "transitionToPasscodeInput:delegate:", 0, 0);
  currentPasscode = self->_currentPasscode;
  self->_currentPasscode = 0;

  newPasscode = self->_newPasscode;
  self->_newPasscode = 0;

  if (self->_viewHasAppeared)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_flowController);
    objc_msgSend(WeakRetained, "endedShowingViewController");

    self->_viewHasAppeared = 0;
  }
}

- (unint64_t)onPresentationRemoveViewControllersAfterMarker
{
  return 5;
}

- (void)passcodeInput:(id)a3 willChangeContents:(id)a4
{
  -[PKNewDevicePasscodeViewController _updateNextButtonForPasscode:](self, "_updateNextButtonForPasscode:", a4);
}

- (void)passcodeInput:(id)a3 enteredPasscode:(id)a4
{
  id v6;
  void *v7;
  dispatch_time_t v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  objc_msgSend(a3, "passcodeField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "forceDisplayIfNeeded");

  v8 = dispatch_time(0, 76000000);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__PKNewDevicePasscodeViewController_passcodeInput_enteredPasscode___block_invoke;
  v10[3] = &unk_1E3E61388;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  dispatch_after(v8, MEMORY[0x1E0C80D38], v10);

}

void __67__PKNewDevicePasscodeViewController_passcodeInput_enteredPasscode___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "pk_zString");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_transitionToNextStateForPasscodeInput:", v2);

}

- (void)passcodeInput:(id)a3 tappedFooterButton:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PKNewDevicePasscodeViewController _passcodeOptionAlertController](self, "_passcodeOptionAlertController", a3, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    objc_msgSend(v8, "setModalPresentationStyle:", 7);
    objc_msgSend(v8, "popoverPresentationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BFFPasscodeView passcodeInputView](self->_passcodeView, "passcodeInputView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "footerButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setPermittedArrowDirections:", 2);
    objc_msgSend(v5, "setSourceView:", v7);
    objc_msgSend(v7, "bounds");
    objc_msgSend(v5, "setSourceRect:");

  }
  -[PKNewDevicePasscodeViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

}

- (void)_nextButtonPressed
{
  void *v3;
  void *v4;
  id v5;

  -[BFFPasscodeView passcodeInputView](self->_passcodeView, "passcodeInputView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "passcode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pk_zString");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[PKNewDevicePasscodeViewController _transitionToNextStateForPasscodeInput:](self, "_transitionToNextStateForPasscodeInput:", v5);
}

- (void)_updateNextButton
{
  void *v3;
  id v4;

  -[BFFPasscodeView passcodeInputView](self->_passcodeView, "passcodeInputView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "passcode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKNewDevicePasscodeViewController _updateNextButtonForPasscode:](self, "_updateNextButtonForPasscode:", v3);

}

- (void)_updateNextButtonForPasscode:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((unint64_t)objc_msgSend(v9, "length") >= self->_minimumPasscodeLength)
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "passcode:meetsCurrentConstraintsOutError:", v9, 0);

  }
  else
  {
    v4 = 0;
  }
  -[PKNewDevicePasscodeViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rightBarButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", v4);

  objc_msgSend(MEMORY[0x1E0DC3938], "activeKeyboard");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setReturnKeyEnabled:", v4);

}

- (void)_transitionToNextStateForPasscodeInput:(id)a3
{
  id v5;
  void *v6;
  unint64_t passcodeInputState;
  id v8;
  void *v9;
  NSString *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSString *v16;
  void *v17;
  int v18;
  NSString *v19;
  NSString *constraintFailedInstructions;
  id v21;

  v5 = a3;
  v6 = v5;
  passcodeInputState = self->_passcodeInputState;
  switch(passcodeInputState)
  {
    case 2uLL:
      goto LABEL_4;
    case 1uLL:
      if (!-[NSString isEqualToString:](self->_newPasscode, "isEqualToString:", v5))
      {
        passcodeInputState = 2;
        break;
      }
      v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v8);
      -[PKNewDevicePasscodeViewController navigationItem](self, "navigationItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setRightBarButtonItem:", v12);

      objc_msgSend(v8, "startAnimating");
      -[PKNewDevicePasscodeViewController _setNavigationBarEnabled:](self, "_setNavigationBarEnabled:", 0);
      -[PKNewDevicePasscodeViewController _applyPasscode](self, "_applyPasscode");

      goto LABEL_12;
    case 0uLL:
LABEL_4:
      if ((unint64_t)objc_msgSend(v5, "length") < self->_minimumPasscodeLength)
      {
        v8 = 0;
        goto LABEL_6;
      }
      objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      v15 = objc_msgSend(v14, "passcode:meetsCurrentConstraintsOutError:", v6, &v21);
      v8 = v21;

      if (!v15)
      {
        if (v8)
        {
          objc_msgSend(v8, "domain");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0D471E0]);

          if (v18)
          {
            objc_msgSend(v8, "localizedDescription");
            v19 = (NSString *)objc_claimAutoreleasedReturnValue();
            constraintFailedInstructions = self->_constraintFailedInstructions;
            self->_constraintFailedInstructions = v19;

            goto LABEL_7;
          }
        }
LABEL_6:
        objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedDescriptionOfCurrentPasscodeConstraints");
        v10 = (NSString *)objc_claimAutoreleasedReturnValue();
        v11 = self->_constraintFailedInstructions;
        self->_constraintFailedInstructions = v10;

LABEL_7:
        passcodeInputState = 0;
        break;
      }
      objc_storeStrong((id *)&self->_newPasscode, a3);
      v16 = self->_constraintFailedInstructions;
      self->_constraintFailedInstructions = 0;

LABEL_12:
      passcodeInputState = 1;
      break;
  }
  -[PKNewDevicePasscodeViewController _setPasscodeInputState:forceUpdate:](self, "_setPasscodeInputState:forceUpdate:", passcodeInputState, 0);

}

- (void)_handleTransitionFromState:(unint64_t)a3 toState:(unint64_t)a4
{
  BFFPasscodeView *passcodeView;
  void *v7;
  uint64_t v8;
  BFFPasscodeView *v9;
  void *v10;
  BFFPasscodeView *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BFFPasscodeView *v15;

  passcodeView = self->_passcodeView;
  -[PKNewDevicePasscodeViewController _titleForState:](self, "_titleForState:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFPasscodeView setTitle:](passcodeView, "setTitle:", v7);

  if (!a4)
  {
    -[BFFPasscodeView passcodeInputView](self->_passcodeView, "passcodeInputView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPasscode:", &stru_1E3E7D690);

    v15 = self->_passcodeView;
    -[PKNewDevicePasscodeViewController _passcodeInputViewForPasscodeInputState:passcodeInputScreenType:](self, "_passcodeInputViewForPasscodeInputState:passcodeInputScreenType:", 0, self->_passcodeInputScreenType);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v15;
    v12 = v10;
    v13 = 3;
LABEL_8:
    -[BFFPasscodeView animateTransitionToPasscodeInput:animation:](v11, "animateTransitionToPasscodeInput:animation:", v12, v13);
    goto LABEL_9;
  }
  if (a4 <= 2)
  {
    if (a4 == 1)
      v8 = 2;
    else
      v8 = 1;
    v9 = self->_passcodeView;
    -[PKNewDevicePasscodeViewController _passcodeInputViewForPasscodeInputState:passcodeInputScreenType:](self, "_passcodeInputViewForPasscodeInputState:passcodeInputScreenType:", a4, self->_passcodeInputScreenType);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    v12 = v10;
    v13 = v8;
    goto LABEL_8;
  }
  if (a4 != 3)
    goto LABEL_10;
  -[PKNewDevicePasscodeViewController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRightBarButtonItem:", 0);
LABEL_9:

LABEL_10:
  -[PKNewDevicePasscodeViewController _updateNextButton](self, "_updateNextButton");
}

- (void)_setPasscodeInputState:(unint64_t)a3 forceUpdate:(BOOL)a4
{
  unint64_t passcodeInputState;

  passcodeInputState = self->_passcodeInputState;
  self->_passcodeInputState = a3;
  if (passcodeInputState != a3 || a4)
    -[PKNewDevicePasscodeViewController _handleTransitionFromState:toState:](self, "_handleTransitionFromState:toState:");
}

- (id)_passcodeInputViewForPasscodeInputState:(unint64_t)a3 passcodeInputScreenType:(unint64_t)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (a4)
    v6 = objc_msgSend(objc_alloc(off_1EE4C1498()), "initWithFrame:numericOnly:", a4 == 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  else
    v6 = objc_msgSend(objc_alloc(_MergedGlobals_3_0()), "initWithFrame:numberOfEntryFields:", 6, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = (void *)v6;
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    -[PKNewDevicePasscodeViewController _passcodeOptionAlertController](self, "_passcodeOptionAlertController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "actions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v9, "count") >= 2)
    {
      PKLocalizedPaymentString(CFSTR("PASSCODE_UPGRADE_PASSCODE_OPTIONS"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFooterButtonText:", v10);

    }
  }
  objc_msgSend(v7, "instructions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKNewDevicePasscodeViewController _instructionsForState:](self, "_instructionsForState:", self->_passcodeInputState);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v12);

  return v7;
}

- (void)_configureNavigationItemForPasscodeInputScreenType:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  if (a3)
  {
    v6 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PKLocalizedPaymentString(CFSTR("PASSCODE_UPGRADE_NEXT"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v6, "initWithTitle:style:target:action:", v7, 2, self, sel__nextButtonPressed);

    -[PKNewDevicePasscodeViewController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRightBarButtonItem:animated:", v9, v4);

    -[PKNewDevicePasscodeViewController _updateNextButton](self, "_updateNextButton");
  }
  else
  {
    -[PKNewDevicePasscodeViewController navigationItem](self, "navigationItem");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRightBarButtonItem:animated:", 0, v4);
  }

}

- (id)_passcodeOptionAlertController
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
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
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "minimumNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:", 0);

  v5 = -[PKNewDevicePasscodeViewController _passcodeInputScreenTypeForUnlockScreenType:](self, "_passcodeInputScreenTypeForUnlockScreenType:", v4);
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (v5 > 2)
      goto LABEL_11;
  }
  else if (self->_passcodeInputScreenType)
  {
    v7 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPaymentString(CFSTR("PASSCODE_UPGRADE_6_DIGIT_CODE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __67__PKNewDevicePasscodeViewController__passcodeOptionAlertController__block_invoke;
    v22[3] = &unk_1E3E61D68;
    v22[4] = self;
    objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 0, v22);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v9);

  }
  if (self->_passcodeInputScreenType != 2)
  {
    v10 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPaymentString(CFSTR("PASSCODE_UPGRADE_CUSTOM_ALPHANUMERIC_CODE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __67__PKNewDevicePasscodeViewController__passcodeOptionAlertController__block_invoke_2;
    v21[3] = &unk_1E3E61D68;
    v21[4] = self;
    objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 0, v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v12);

  }
  if (v5 <= 1 && self->_passcodeInputScreenType != 1)
  {
    v13 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPaymentString(CFSTR("PASSCODE_UPGRADE_CUSTOM_NUMERIC_CODE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __67__PKNewDevicePasscodeViewController__passcodeOptionAlertController__block_invoke_3;
    v20[3] = &unk_1E3E61D68;
    v20[4] = self;
    objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 0, v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v15);

  }
LABEL_11:
  v16 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedPaymentString(CFSTR("PASSCODE_UPGRADE_CANCEL"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 1, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v18);

  return v6;
}

uint64_t __67__PKNewDevicePasscodeViewController__passcodeOptionAlertController__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transitionToPasscodeInputScreenType:", 0);
}

uint64_t __67__PKNewDevicePasscodeViewController__passcodeOptionAlertController__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transitionToPasscodeInputScreenType:", 2);
}

uint64_t __67__PKNewDevicePasscodeViewController__passcodeOptionAlertController__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transitionToPasscodeInputScreenType:", 1);
}

- (void)_transitionToPasscodeInputScreenType:(unint64_t)a3
{
  if (self->_passcodeInputScreenType != a3)
  {
    self->_passcodeInputScreenType = a3;
    -[PKNewDevicePasscodeViewController _configureNavigationItemForPasscodeInputScreenType:animated:](self, "_configureNavigationItemForPasscodeInputScreenType:animated:");
    -[PKNewDevicePasscodeViewController _setPasscodeInputState:forceUpdate:](self, "_setPasscodeInputState:forceUpdate:", 0, 1);
  }
}

- (void)_applyPasscode
{
  uint64_t v3;
  NSObject *v4;
  _QWORD block[11];
  _QWORD v6[3];
  uint64_t v7;

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v3 = MEMORY[0x1E0C809B0];
  v7 = 0;
  block[6] = MEMORY[0x1E0C809B0];
  block[7] = 3221225472;
  block[8] = __51__PKNewDevicePasscodeViewController__applyPasscode__block_invoke;
  block[9] = &unk_1E3E62060;
  block[10] = v6;
  v7 = PKBeginBackgroundTask();
  dispatch_get_global_queue(25, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __51__PKNewDevicePasscodeViewController__applyPasscode__block_invoke_2;
  block[3] = &unk_1E3E681D8;
  block[4] = self;
  block[5] = v6;
  dispatch_async(v4, block);

  _Block_object_dispose(v6, 8);
}

uint64_t __51__PKNewDevicePasscodeViewController__applyPasscode__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v3 = *MEMORY[0x1E0D69A78];
  if (result != *MEMORY[0x1E0D69A78])
  {
    result = PKEndBackgroundTask();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
  }
  return result;
}

uint64_t __51__PKNewDevicePasscodeViewController__applyPasscode__block_invoke_2(uint64_t a1)
{
  __int128 v1;
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[4];
  __int128 v8;

  v1 = *(_OWORD *)(a1 + 32);
  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[130];
  v4 = v2[126];
  v5 = v2[127];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__PKNewDevicePasscodeViewController__applyPasscode__block_invoke_3;
  v7[3] = &unk_1E3E681B0;
  v8 = v1;
  return objc_msgSend(v3, "changePasscodeFrom:toPasscode:completion:", v4, v5, v7);
}

void __51__PKNewDevicePasscodeViewController__applyPasscode__block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;
  char v11;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__PKNewDevicePasscodeViewController__applyPasscode__block_invoke_4;
  v8[3] = &unk_1E3E68188;
  v11 = a2;
  v6 = *(_QWORD *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __51__PKNewDevicePasscodeViewController__applyPasscode__block_invoke_4(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  uint64_t result;

  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0DC3968], "sharedInputModeController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "saveDeviceUnlockPasscodeInputModes");

  }
  objc_msgSend(*(id *)(a1 + 32), "_setPasscodeInputState:forceUpdate:", 3, 0);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1056));
  objc_msgSend(WeakRetained, "newDevicePasscodeViewController:didFinishSettingPasscode:withError:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (result != *MEMORY[0x1E0D69A78])
    return PKEndBackgroundTask();
  return result;
}

- (void)_setNavigationBarEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  -[PKNewDevicePasscodeViewController navigationController](self, "navigationController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", v3);

  objc_msgSend(v10, "interactivePopGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v3);

  -[PKNewDevicePasscodeViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leftBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v3);

  objc_msgSend(v7, "rightBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v3);

}

- (unint64_t)_passcodeInputScreenTypeForUnlockScreenType:(int)a3
{
  if (a3 == 2)
    return 2;
  if (a3 == 1)
    return 1;
  if (a3)
    return 0;
  return self->_minimumPasscodeLength > 6;
}

- (id)_titleForState:(unint64_t)a3
{
  if (a3 <= 3)
  {
    PKLocalizedPaymentString(&off_1E3E68218[a3]->isa);
    self = (PKNewDevicePasscodeViewController *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (id)_instructionsForState:(unint64_t)a3
{
  NSString *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;

  if (a3 == 2)
  {
    v5 = CFSTR("PASSCODE_UPGRADE_PASSCODES_FAILED_TO_MATCH");
LABEL_8:
    PKLocalizedPaymentString(&v5->isa);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (a3 == 1)
  {
    v5 = CFSTR("PASSCODE_UPGRADE_RE_ENTER_PASSCODE");
    goto LABEL_8;
  }
  if (a3)
  {
    v6 = &stru_1E3E7D690;
    return v6;
  }
  if (!-[NSString length](self->_constraintFailedInstructions, "length"))
  {
    v7 = (void *)MEMORY[0x1E0CB37F0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_minimumPasscodeLength);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringFromNumber:numberStyle:", v8, 5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    PKDeviceSpecificLocalizedStringKeyForKey(CFSTR("PASSCODE_UPGRADE_REQUIRED_BODY"), 0);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(v10, CFSTR("%@"), v9);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  v4 = self->_constraintFailedInstructions;
LABEL_9:
  v6 = (__CFString *)v4;
  return v6;
}

- (PKNewDevicePasscodeViewControllerDelegate)delegate
{
  return (PKNewDevicePasscodeViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_passcodeView, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_constraintFailedInstructions, 0);
  objc_storeStrong((id *)&self->_newPasscode, 0);
  objc_storeStrong((id *)&self->_currentPasscode, 0);
  objc_destroyWeak((id *)&self->_flowController);
}

@end
