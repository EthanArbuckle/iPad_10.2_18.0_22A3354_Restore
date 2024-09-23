@implementation BFFPasscodeViewController

+ (BOOL)allowSkip
{
  int v2;
  void *v3;

  if ((PSHasStockholmPass() & 1) != 0)
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "isPasscodeRequired") ^ 1;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[BFFPasscodeViewController passcodeManager](self, "passcodeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)BFFPasscodeViewController;
  -[BFFPasscodeViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  BFFPasscodeView *v3;
  BFFPasscodeView *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BFFPasscodeViewController;
  -[BFFPasscodeViewController loadView](&v7, sel_loadView);
  v3 = [BFFPasscodeView alloc];
  v4 = -[BFFPasscodeView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[BFFPasscodeView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
  -[BFFPasscodeView setPasscodeViewController:](v4, "setPasscodeViewController:", self);
  -[BFFPasscodeViewController setView:](self, "setView:", v4);
  +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFPasscodeViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applyAutomaticScrollToEdgeBehaviorOnNavigationItem:", v6);

}

- (void)_setupFirstEntry
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;

  +[BFFPasscodeCreationManager sharedPasscodeManager](BFFPasscodeCreationManager, "sharedPasscodeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFPasscodeViewController setPasscodeManager:](self, "setPasscodeManager:", v3);

  -[BFFPasscodeViewController passcodeManager](self, "passcodeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reset");

  -[BFFPasscodeViewController passcodeManager](self, "passcodeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  v21 = 0;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "minimumNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:", &v21);

  if (v7)
  {
    -[BFFPasscodeViewController passcodeManager](self, "passcodeManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNumericPasscodeEntry:", 0);

    -[BFFPasscodeViewController passcodeManager](self, "passcodeManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSimplePasscodeEntryLength:", 0);
  }
  else
  {
    if ((PSSupportsMesa() & 1) != 0)
      v10 = 1;
    else
      v10 = MGGetBoolAnswer();
    if (v21 == 1)
      v11 = 1;
    else
      v11 = v10;
    -[BFFPasscodeViewController passcodeManager](self, "passcodeManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
      v14 = 6;
    else
      v14 = 4;
    objc_msgSend(v12, "setSimplePasscodeEntryLength:", v14);

    -[BFFPasscodeViewController passcodeManager](self, "passcodeManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNumericPasscodeEntry:", 1);
  }

  -[BFFPasscodeViewController configurePasscodeTypeUsingAnimations:](self, "configurePasscodeTypeUsingAnimations:", 0);
  -[BFFPasscodeViewController passcodeManager](self, "passcodeManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "passcodeState");

  -[BFFPasscodeViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFPasscodeViewController titleForState:](self, "titleForState:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTitle:", v18);

  -[BFFPasscodeViewController _passcodeInputViewForState:](self, "_passcodeInputViewForState:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFPasscodeViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "transitionToPasscodeInput:delegate:", v19, self);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BFFPasscodeViewController;
  -[BFFPasscodeViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[BFFPasscodeViewController setExtendedLayoutIncludesOpaqueBars:](self, "setExtendedLayoutIncludesOpaqueBars:", 1);
  -[BFFPasscodeViewController _setupFirstEntry](self, "_setupFirstEntry");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BFFPasscodeViewController;
  -[BFFPasscodeViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[BFFPasscodeViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "passcodeInputView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "becomeFirstResponder");
  objc_msgSend(v5, "passcode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFPasscodeViewController _updateNextButtonForPasscode:](self, "_updateNextButtonForPasscode:", v6);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BFFPasscodeViewController;
  -[BFFPasscodeViewController viewDidAppear:](&v11, sel_viewDidAppear_, a3);
  -[BFFPasscodeViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentSize");
  v6 = v5;
  -[BFFPasscodeViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;

  if (v6 > v9)
  {
    -[BFFPasscodeViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "flashScrollIndicators");

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BFFPasscodeViewController;
  -[BFFPasscodeViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  -[BFFPasscodeViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "passcodeInputView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "resignFirstResponder");
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BFFPasscodeViewController;
  -[BFFPasscodeViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  if (self->_showingSpinner)
  {
    +[BFFViewControllerSpinnerManager stopAnimatingSpinnerFor:](BFFViewControllerSpinnerManager, "stopAnimatingSpinnerFor:", CFSTR("SETUP_PASSCODE_VIEW_CONTROLLER"));
    self->_showingSpinner = 0;
  }
  +[BFFPasscodeCreationManager sharedPasscodeManager](BFFPasscodeCreationManager, "sharedPasscodeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "passcodeState");

  if (v5 == 4)
  {
    -[BFFPasscodeViewController clear](self, "clear");
  }
  else
  {
    +[BFFPasscodeCreationManager sharedPasscodeManager](BFFPasscodeCreationManager, "sharedPasscodeManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reset");

  }
}

- (void)nextButtonPressed
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[BFFPasscodeViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "passcodeInputView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "passcode");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[BFFPasscodeViewController passcodeManager](self, "passcodeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transitionToNextPasscodeStateForInput:", v6);

}

- (void)_updateNextButton
{
  void *v3;
  void *v4;
  id v5;

  -[BFFPasscodeViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "passcodeInputView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "passcode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFPasscodeViewController _updateNextButtonForPasscode:](self, "_updateNextButtonForPasscode:", v4);

}

- (void)_updateNextButtonForPasscode:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "passcode:meetsCurrentConstraintsOutError:", v9, 0);

  }
  else
  {
    v5 = 0;
  }
  -[BFFPasscodeViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rightBarButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", v5);

  objc_msgSend(MEMORY[0x24BEBD6C8], "activeKeyboard");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setReturnKeyEnabled:", v5);

}

- (BOOL)_allowSkip
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[BFFPasscodeViewController passcodeCreationDelegate](self, "passcodeCreationDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return +[BFFPasscodeViewController allowSkip](BFFPasscodeViewController, "allowSkip");
  -[BFFPasscodeViewController passcodeCreationDelegate](self, "passcodeCreationDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "passcodeViewControllerAllowSkip:", self);

  return v6;
}

- (void)passcodeInput:(id)a3 willChangeContents:(id)a4
{
  -[BFFPasscodeViewController _updateNextButtonForPasscode:](self, "_updateNextButtonForPasscode:", a4);
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
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__BFFPasscodeViewController_passcodeInput_enteredPasscode___block_invoke;
  v10[3] = &unk_24D2341E0;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  dispatch_after(v8, MEMORY[0x24BDAC9B8], v10);

}

void __59__BFFPasscodeViewController_passcodeInput_enteredPasscode___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "passcodeManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitionToNextPasscodeStateForInput:", *(_QWORD *)(a1 + 40));

}

- (id)passcodeInputView
{
  void *v3;
  int v4;
  BFFSimplePasscodeInputView *v5;
  void *v6;
  uint64_t v7;
  BFFSimplePasscodeInputView *v8;
  BFFComplexPasscodeInputView *v9;
  void *v10;
  uint64_t v11;

  -[BFFPasscodeViewController passcodeManager](self, "passcodeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSimplePasscodeEntry");

  if (v4)
  {
    v5 = [BFFSimplePasscodeInputView alloc];
    -[BFFPasscodeViewController passcodeManager](self, "passcodeManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "simplePasscodeEntryLength");
    v8 = -[BFFSimplePasscodeInputView initWithFrame:numberOfEntryFields:](v5, "initWithFrame:numberOfEntryFields:", v7, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));

    -[BFFSimplePasscodeInputView setLimitCharactersToNumbers:](v8, "setLimitCharactersToNumbers:", 0);
  }
  else
  {
    v9 = [BFFComplexPasscodeInputView alloc];
    -[BFFPasscodeViewController passcodeManager](self, "passcodeManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isNumericPasscodeEntry");
    v8 = -[BFFComplexPasscodeInputView initWithFrame:numericOnly:](v9, "initWithFrame:numericOnly:", v11, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));

  }
  return v8;
}

- (id)_passcodeInputViewForState:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;

  -[BFFPasscodeViewController passcodeInputView](self, "passcodeInputView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 3 || !a3)
  {
    -[BFFPasscodeViewController passcodeOptionAlertController](self, "passcodeOptionAlertController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count") == 2)
    {
      v8 = -[BFFPasscodeViewController _allowSkip](self, "_allowSkip");
      self->_footerButtonIsSkip = v8;
      if (v8)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = CFSTR("DO_NOT_ADD_PASSCODE");
        goto LABEL_9;
      }
    }
    else
    {
      self->_footerButtonIsSkip = 0;
    }
    if ((unint64_t)objc_msgSend(v7, "count") < 2)
    {
LABEL_10:

      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = CFSTR("PASSCODE_OPTIONS");
LABEL_9:
    objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_24D234A48, CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFooterButtonText:", v12);

    goto LABEL_10;
  }
LABEL_11:
  objc_msgSend(v5, "instructions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFPasscodeViewController instructionsForState:](self, "instructionsForState:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v14);

  return v5;
}

- (void)_animatedPasscodeViewTransitionToState:(unint64_t)a3 animation:(unint64_t)a4
{
  void *v6;
  id v7;

  -[BFFPasscodeViewController _passcodeInputViewForState:](self, "_passcodeInputViewForState:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[BFFPasscodeViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animateTransitionToPasscodeInput:animation:", v7, a4);

}

- (void)passcodeManager:(id)a3 didTransitionFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  void *v8;
  void *v9;
  uint64_t v10;
  BFFPasscodeViewController *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[BFFPasscodeViewController view](self, "view", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFPasscodeViewController titleForState:](self, "titleForState:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v9);

  if (a5)
  {
    if ((a5 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      if (a5 == 2)
        v10 = 2;
      else
        v10 = 1;
      v11 = self;
      v12 = a5;
      goto LABEL_9;
    }
    if (a5 == 4)
    {
      -[BFFPasscodeViewController passcodeManager](self, "passcodeManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "passcode");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[BFFPasscodeViewController _finishedWithPasscode:](self, "_finishedWithPasscode:", v16);

    }
    else if (a5 == 1)
    {
      -[BFFPasscodeViewController _showWeakWarningAlert](self, "_showWeakWarningAlert");
    }
  }
  else
  {
    -[BFFPasscodeViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "passcodeInputView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPasscode:", &stru_24D234A48);

    if (a4 != 1)
    {
      v11 = self;
      v12 = 0;
      v10 = 3;
LABEL_9:
      -[BFFPasscodeViewController _animatedPasscodeViewTransitionToState:animation:](v11, "_animatedPasscodeViewTransitionToState:animation:", v12, v10);
    }
  }
  -[BFFPasscodeViewController _updateNextButton](self, "_updateNextButton");
}

- (void)passcodeManagerWillSetPasscode:(id)a3
{
  void *v4;
  char v5;
  id v6;

  +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:identifier:](BFFViewControllerSpinnerManager, "startAnimatingSpinnerFor:identifier:", self, CFSTR("SETUP_PASSCODE_VIEW_CONTROLLER"));
  self->_showingSpinner = 1;
  -[BFFPasscodeViewController passcodeCreationDelegate](self, "passcodeCreationDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[BFFPasscodeViewController passcodeCreationDelegate](self, "passcodeCreationDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "passcodeViewControllerWillSetPasscode:", self);

  }
}

- (void)passcodeManager:(id)a3 didSetPasscodeWithSuccess:(BOOL)a4 error:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v13 = a3;
  v8 = a5;
  if (self->_showingSpinner)
  {
    +[BFFViewControllerSpinnerManager stopAnimatingSpinnerFor:](BFFViewControllerSpinnerManager, "stopAnimatingSpinnerFor:", CFSTR("SETUP_PASSCODE_VIEW_CONTROLLER"));
    self->_showingSpinner = 0;
  }
  if (v6)
  {
    -[BFFPasscodeViewController passcodeCreationDelegate](self, "passcodeCreationDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[BFFPasscodeViewController passcodeCreationDelegate](self, "passcodeCreationDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "passcode");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "passcodeViewController:didSetPasscode:", self, v12);

    }
  }

}

- (void)passcodeInput:(id)a3 tappedFooterButton:(id)a4
{
  if (self->_footerButtonIsSkip)
    -[BFFPasscodeViewController _showSkipPasscodeAlert](self, "_showSkipPasscodeAlert", a3, a4);
  else
    -[BFFPasscodeViewController _showPasscodeOptionsSheet](self, "_showPasscodeOptionsSheet", a3, a4);
}

- (void)clear
{
  void *v3;
  void *v4;

  -[BFFPasscodeViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitionToPasscodeInput:delegate:", 0, 0);

  -[BFFPasscodeViewController passcodeManager](self, "passcodeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  -[BFFPasscodeViewController setPasscodeManager:](self, "setPasscodeManager:", 0);
}

- (void)_finishedWithPasscode:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BFFPasscodeViewController passcodeCreationDelegate](self, "passcodeCreationDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "passcodeViewController:didFinishWithPasscodeCreation:", self, v4);

}

- (id)titleForState:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("CREATE_PASSCODE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v4, &stru_24D234A48, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)instructionsForState:(unint64_t)a3
{
  void *v4;
  __CFString *v5;
  uint64_t v6;
  __CFString *v7;
  const __CFString *v8;
  __CFString *v9;

  if (a3 == 3)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v5 = v7;
    v8 = CFSTR("PASSCODES_FAILED_TO_MATCH");
LABEL_9:
    -[__CFString localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", v8, &stru_24D234A48, CFSTR("Localizable"));
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v5 = v7;
    v8 = CFSTR("RE_ENTER_PASSCODE");
    goto LABEL_9;
  }
  if (a3)
  {
    v5 = &stru_24D234A48;
    return v5;
  }
  -[BFFPasscodeViewController passcodeManager](self, "passcodeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintInstructions");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v5 || !-[__CFString length](v5, "length"))
  {
    -[BFFPasscodeViewController _firstEntryInstructions](self, "_firstEntryInstructions");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v9 = (__CFString *)v6;

    v5 = v9;
  }
  return v5;
}

- (id)_firstEntryInstructions
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[BFFPasscodeViewController passcodeCreationDelegate](self, "passcodeCreationDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0
    || (-[BFFPasscodeViewController passcodeCreationDelegate](self, "passcodeCreationDelegate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "passcodeViewControllerCustomFirstEntryInstructions:", self),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("PASSCODE_DESCRIPTION"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", v8, &stru_24D234A48, CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)configurePasscodeTypeUsingAnimations:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  -[BFFPasscodeViewController passcodeManager](self, "passcodeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSimplePasscodeEntry");

  if (v6)
  {
    -[BFFPasscodeViewController navigationItem](self, "navigationItem");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRightBarButtonItem:animated:", 0, v3);
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x24BEBD410]);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("NEXT"), &stru_24D234A48, CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v7, "initWithTitle:style:target:action:", v9, 2, self, sel_nextButtonPressed);

    -[BFFPasscodeViewController navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRightBarButtonItem:animated:", v11, v3);

    -[BFFPasscodeViewController _updateNextButton](self, "_updateNextButton");
  }

}

- (void)_showWeakWarningAlert
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[5];

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("WEAK_PASSCODE_DETAILS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v4, &stru_24D234A48, CFSTR("Localizable"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("WEAK_PASSCODE"), &stru_24D234A48, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v7, v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CHANGE_PASSCODE"), &stru_24D234A48, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __50__BFFPasscodeViewController__showWeakWarningAlert__block_invoke;
  v20[3] = &unk_24D234288;
  v20[4] = self;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 1, v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v13);

  v14 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("USE_WEAK_PASSCODE_ANYWAY"), &stru_24D234A48, CFSTR("Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __50__BFFPasscodeViewController__showWeakWarningAlert__block_invoke_2;
  v19[3] = &unk_24D234288;
  v19[4] = self;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 0, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v17);

  -[BFFPasscodeViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
}

void __50__BFFPasscodeViewController__showWeakWarningAlert__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "passcodeManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "acceptWeakPasscode:", 0);

}

void __50__BFFPasscodeViewController__showWeakWarningAlert__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  _BYLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_214875000, v2, OS_LOG_TYPE_DEFAULT, "User accepted weak passcode", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "passcodeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "acceptWeakPasscode:", 1);

}

- (void)_showSkipPasscodeAlert
{
  void *v2;
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
  void *v16;
  _QWORD v18[5];

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("SKIP_PASSCODE_DESCRIPTION"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v3, &stru_24D234A48, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SKIP_PASSCODE"), &stru_24D234A48, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v7, v4, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SKIP_OPTION_CREATE_PASSCODE"), &stru_24D234A48, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v12);

  v13 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SKIP_OPTION_DONT_USE_PASSCODE"), &stru_24D234A48, CFSTR("Localizable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __51__BFFPasscodeViewController__showSkipPasscodeAlert__block_invoke;
  v18[3] = &unk_24D234288;
  v18[4] = self;
  objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 0, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v16);

  -[BFFPasscodeViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
}

uint64_t __51__BFFPasscodeViewController__showSkipPasscodeAlert__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _BYLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_214875000, v2, OS_LOG_TYPE_DEFAULT, "User opted out of passcode", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_finishedWithPasscode:", 0);
}

- (void)_commitPasscodeEntryTypeChange
{
  id v3;

  -[BFFPasscodeViewController configurePasscodeTypeUsingAnimations:](self, "configurePasscodeTypeUsingAnimations:", 1);
  -[BFFPasscodeViewController passcodeManager](self, "passcodeManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPasscodeState:", 0);

}

- (id)passcodeOptionAlertController
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD v44[5];
  int v45;

  v45 = 0;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "minimumNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:", &v45);

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFPasscodeViewController passcodeManager](self, "passcodeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isNumericPasscodeEntry");

  if (v7)
  {
    v8 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CUSTOM_ALPHANUMERIC_CODE"), &stru_24D234A48, CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __58__BFFPasscodeViewController_passcodeOptionAlertController__block_invoke;
    v44[3] = &unk_24D234288;
    v44[4] = self;
    objc_msgSend(v8, "actionWithTitle:style:handler:", v10, 0, v44);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v11);

  }
  if (v4 <= 1)
  {
    -[BFFPasscodeViewController passcodeManager](self, "passcodeManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isNumericPasscodeEntry") & 1) != 0)
    {
      -[BFFPasscodeViewController passcodeManager](self, "passcodeManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "simplePasscodeEntryLength");

      if (v14 < 1)
      {
        if (v4)
          goto LABEL_15;
LABEL_10:
        -[BFFPasscodeViewController passcodeManager](self, "passcodeManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "simplePasscodeEntryLength");

        if (v20 != 6)
        {
          v21 = (void *)MEMORY[0x24BEBD3A8];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("6_DIGIT_CODE"), &stru_24D234A48, CFSTR("Localizable"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v42[0] = MEMORY[0x24BDAC760];
          v42[1] = 3221225472;
          v42[2] = __58__BFFPasscodeViewController_passcodeOptionAlertController__block_invoke_3;
          v42[3] = &unk_24D234288;
          v42[4] = self;
          objc_msgSend(v21, "actionWithTitle:style:handler:", v23, 0, v42);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addAction:", v24);

        }
        if (!v45)
        {
          -[BFFPasscodeViewController passcodeManager](self, "passcodeManager");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "simplePasscodeEntryLength");

          if (v26 != 4)
          {
            v27 = (void *)MEMORY[0x24BEBD3A8];
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("4_DIGIT_CODE"), &stru_24D234A48, CFSTR("Localizable"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v41[0] = MEMORY[0x24BDAC760];
            v41[1] = 3221225472;
            v41[2] = __58__BFFPasscodeViewController_passcodeOptionAlertController__block_invoke_4;
            v41[3] = &unk_24D234288;
            v41[4] = self;
            objc_msgSend(v27, "actionWithTitle:style:handler:", v29, 0, v41);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addAction:", v30);

          }
        }
        goto LABEL_15;
      }
    }
    else
    {

    }
    v15 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CUSTOM_NUMERIC_CODE"), &stru_24D234A48, CFSTR("Localizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __58__BFFPasscodeViewController_passcodeOptionAlertController__block_invoke_2;
    v43[3] = &unk_24D234288;
    v43[4] = self;
    objc_msgSend(v15, "actionWithTitle:style:handler:", v17, 0, v43);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v18);

    if (v4)
      goto LABEL_15;
    goto LABEL_10;
  }
LABEL_15:
  if (-[BFFPasscodeViewController _allowSkip](self, "_allowSkip"))
  {
    v31 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("DO_NOT_ADD_PASSCODE"), &stru_24D234A48, CFSTR("Localizable"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __58__BFFPasscodeViewController_passcodeOptionAlertController__block_invoke_5;
    v40[3] = &unk_24D234288;
    v40[4] = self;
    objc_msgSend(v31, "actionWithTitle:style:handler:", v33, 0, v40);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v34);

  }
  v35 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24D234A48, CFSTR("Localizable"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "actionWithTitle:style:handler:", v37, 1, 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v38);

  return v5;
}

uint64_t __58__BFFPasscodeViewController_passcodeOptionAlertController__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "passcodeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNumericPasscodeEntry:", 0);

  objc_msgSend(*(id *)(a1 + 32), "passcodeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSimplePasscodeEntryLength:", 0);

  return objc_msgSend(*(id *)(a1 + 32), "_commitPasscodeEntryTypeChange");
}

uint64_t __58__BFFPasscodeViewController_passcodeOptionAlertController__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "passcodeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNumericPasscodeEntry:", 1);

  objc_msgSend(*(id *)(a1 + 32), "passcodeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSimplePasscodeEntryLength:", 0);

  return objc_msgSend(*(id *)(a1 + 32), "_commitPasscodeEntryTypeChange");
}

uint64_t __58__BFFPasscodeViewController_passcodeOptionAlertController__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "passcodeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNumericPasscodeEntry:", 1);

  objc_msgSend(*(id *)(a1 + 32), "passcodeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSimplePasscodeEntryLength:", 6);

  return objc_msgSend(*(id *)(a1 + 32), "_commitPasscodeEntryTypeChange");
}

uint64_t __58__BFFPasscodeViewController_passcodeOptionAlertController__block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "passcodeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNumericPasscodeEntry:", 1);

  objc_msgSend(*(id *)(a1 + 32), "passcodeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSimplePasscodeEntryLength:", 4);

  return objc_msgSend(*(id *)(a1 + 32), "_commitPasscodeEntryTypeChange");
}

uint64_t __58__BFFPasscodeViewController_passcodeOptionAlertController__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showSkipPasscodeAlert");
}

- (void)_showPasscodeOptionsSheet
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[BFFPasscodeViewController passcodeOptionAlertController](self, "passcodeOptionAlertController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (BFFIsiPad())
  {
    objc_msgSend(v7, "setModalPresentationStyle:", 7);
    objc_msgSend(v7, "popoverPresentationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[BFFPasscodeViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "passcodeInputView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "footerButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setPermittedArrowDirections:", 2);
    objc_msgSend(v3, "setSourceView:", v6);
    objc_msgSend(v6, "bounds");
    objc_msgSend(v3, "setSourceRect:");

  }
  -[BFFPasscodeViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

}

- (BFFPasscodeViewControllerDelegate)passcodeCreationDelegate
{
  return (BFFPasscodeViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_passcodeCreationDelegate);
}

- (void)setPasscodeCreationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_passcodeCreationDelegate, a3);
}

- (BFFPasscodeCreationManager)passcodeManager
{
  return self->_passcodeManager;
}

- (void)setPasscodeManager:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcodeManager, 0);
  objc_destroyWeak((id *)&self->_passcodeCreationDelegate);
}

@end
