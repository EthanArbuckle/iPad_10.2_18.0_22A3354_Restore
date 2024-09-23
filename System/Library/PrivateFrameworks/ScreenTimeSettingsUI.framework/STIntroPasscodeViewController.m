@implementation STIntroPasscodeViewController

- (STIntroPasscodeViewController)initWithIntroductionModel:(id)a3 askForRecoveryAppleID:(BOOL)a4 altDSID:(id)a5 isChildOrNotSignedIntoiCloud:(BOOL)a6 continueHandler:(id)a7
{
  STIntroductionViewModel *v12;
  id v13;
  id v14;
  STIntroPasscodeViewController *v15;
  STIntroductionViewModel *model;
  STIntroductionViewModel *v17;
  uint64_t v18;
  NSString *altDSID;
  uint64_t v20;
  id continueHandler;
  objc_super v23;

  v12 = (STIntroductionViewModel *)a3;
  v23.receiver = self;
  v23.super_class = (Class)STIntroPasscodeViewController;
  v13 = a7;
  v14 = a5;
  v15 = -[STIntroPasscodeViewController initWithNibName:bundle:](&v23, sel_initWithNibName_bundle_, 0, 0);
  model = v15->_model;
  v15->_model = v12;
  v17 = v12;

  v15->_askForRecoveryAppleID = a4;
  v18 = objc_msgSend(v14, "copy", v23.receiver, v23.super_class);

  altDSID = v15->_altDSID;
  v15->_altDSID = (NSString *)v18;

  v15->_childOrNotSignedIntoiCloud = a6;
  v20 = objc_msgSend(v13, "copy");

  continueHandler = v15->_continueHandler;
  v15->_continueHandler = (id)v20;

  v15->_passcodeState = 0;
  v15->_numeric = 1;
  v15->_numericLength = 4;
  return v15;
}

- (void)loadView
{
  id v3;

  v3 = (id)objc_opt_new();
  objc_msgSend(v3, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "setPasscodeViewController:", self);
  -[STIntroPasscodeViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STIntroPasscodeViewController;
  -[STIntroPasscodeViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[STIntroPasscodeViewController _passcodeView](self, "_passcodeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("IntroPasscodeSetupTitle"), &stru_24DB8A1D0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v5);

  -[STIntroPasscodeViewController passcodeInputView](self, "passcodeInputView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitionToPasscodeInput:delegate:", v6, self);

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STIntroPasscodeViewController.viewDidLoad", v7, 2u);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint8_t v7[16];
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)STIntroPasscodeViewController;
  -[STIntroPasscodeViewController viewDidAppear:](&v8, sel_viewDidAppear_);
  -[STIntroPasscodeViewController _passcodeView](self, "_passcodeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "passcodeInputView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "becomeFirstResponder");
  -[STIntroPasscodeViewController passcodeTypeChanged:](self, "passcodeTypeChanged:", v3);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STIntroPasscodeViewController.viewDidAppear", v7, 2u);
  }

}

- (void)passcodeTypeChanged:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[STIntroPasscodeViewController navigationItem](self, "navigationItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:animated:", 0, v3);

}

- (id)passcodeInputView
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x24BE858F8]);
  v4 = -[STIntroPasscodeViewController numericLength](self, "numericLength");
  v5 = (void *)objc_msgSend(v3, "initWithFrame:numberOfEntryFields:", v4, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  switch(-[STIntroPasscodeViewController passcodeState](self, "passcodeState"))
  {
    case 0:
      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("IntroPasscodeSetupInstructions");
      goto LABEL_7;
    case 1:
      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("IntroPasscodeSetupInstructionsReentry");
      goto LABEL_7;
    case 2:
      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("IntroPasscodeSetupInstructionsFailure");
      goto LABEL_7;
    case 3:
      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("RecoveryAppleIDInvalidError");
LABEL_7:
      objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_24DB8A1D0, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v9 = 0;
      break;
  }
  objc_msgSend(v5, "instructions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

  objc_msgSend(v5, "setFooterView:", 0);
  return v5;
}

- (void)nextButtonTapped
{
  void *v3;
  void *v4;
  id v5;

  -[STIntroPasscodeViewController _passcodeView](self, "_passcodeView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "passcodeInputView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "passcode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STIntroPasscodeViewController userEnteredPasscode:](self, "userEnteredPasscode:", v4);

}

- (void)userEnteredPasscode:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void (**v17)(void);
  _QWORD v18[5];
  id v19;
  id v20;

  v4 = a3;
  if (-[STIntroPasscodeViewController passcodeState](self, "passcodeState") == 1)
  {
    -[STIntroPasscodeViewController initialPasscode](self, "initialPasscode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqualToString:", v5);

    if (!v6)
    {
      -[STIntroPasscodeViewController _transitionToFirstPasscodePaneWithState:](self, "_transitionToFirstPasscodePaneWithState:", 2);
      goto LABEL_9;
    }
    if (!-[STIntroPasscodeViewController askForRecoveryAppleID](self, "askForRecoveryAppleID"))
    {
      -[STIntroPasscodeViewController model](self, "model");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setParentalControlsPasscode:", v4);

      -[STIntroPasscodeViewController continueHandler](self, "continueHandler");
      v17 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v17[2]();

      goto LABEL_9;
    }
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setIsEphemeral:", 1);
    objc_msgSend(v7, "setAuthenticationType:", 2);
    objc_msgSend(v7, "setShouldPromptForPasswordOnly:", 1);
    objc_msgSend(v7, "_setProxiedAppName:", CFSTR("ScreenTime"));
    objc_msgSend(v7, "setPresentingViewController:", self);
    objc_msgSend(v7, "setAppProvidedContext:", CFSTR("setup"));
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("RecoveryAppleIDAlertTitle"), &stru_24DB8A1D0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v9);

    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("RecoveryAppleIDAlertReason"), &stru_24DB8A1D0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setReason:", v10);

    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ConfirmationButtonOK"), &stru_24DB8A1D0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDefaultButtonString:", v11);

    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("RecoveryAppleIDAlertSkipButton"), &stru_24DB8A1D0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCancelButtonString:", v12);

    v13 = (void *)objc_opt_new();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __53__STIntroPasscodeViewController_userEnteredPasscode___block_invoke;
    v18[3] = &unk_24DB874D8;
    v18[4] = self;
    v19 = v4;
    v20 = v8;
    v14 = v8;
    objc_msgSend(v13, "authenticateWithContext:completion:", v7, v18);

  }
  else
  {
    -[STIntroPasscodeViewController setInitialPasscode:](self, "setInitialPasscode:", v4);
    -[STIntroPasscodeViewController setPasscodeState:](self, "setPasscodeState:", 1);
    -[STIntroPasscodeViewController _passcodeView](self, "_passcodeView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "passcodeInputView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPasscode:", &stru_24DB8A1D0);

    -[STIntroPasscodeViewController passcodeInputView](self, "passcodeInputView");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "animateTransitionToPasscodeInput:animation:", v14, 2);
  }

LABEL_9:
}

void __53__STIntroPasscodeViewController_userEnteredPasscode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[2] = __53__STIntroPasscodeViewController_userEnteredPasscode___block_invoke_2;
  v12[3] = &unk_24DB874B0;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v14 = v6;
  v15 = v8;
  v12[1] = 3221225472;
  v13 = v5;
  v16 = v9;
  v17 = *(id *)(a1 + 48);
  v10 = v6;
  v11 = v5;
  objc_msgSend(v7, "addOperationWithBlock:", v12);

}

void __53__STIntroPasscodeViewController_userEnteredPasscode___block_invoke_2(uint64_t a1)
{
  uint64_t *v2;
  void *v3;
  void *v4;
  id *v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void (**v14)(void);
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  id v32;

  v2 = (uint64_t *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x24BE0AB48]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id *)(a1 + 40);
  v4 = *(void **)(a1 + 40);
  if (v4)
    v6 = 1;
  else
    v6 = v3 == 0;
  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 48), "altDSID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", v3);

    v12 = *(void **)(a1 + 48);
    if (v11)
    {
      objc_msgSend(v12, "_transitionToFirstPasscodePaneWithState:", 3);
    }
    else
    {
      objc_msgSend(v12, "model");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setParentalControlsPasscode:", *(_QWORD *)(a1 + 56));
      objc_msgSend(v13, "setRecoveryAltDSID:", v3);
      objc_msgSend(*(id *)(a1 + 48), "continueHandler");
      v14 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v14[2]();

    }
    goto LABEL_24;
  }
  objc_msgSend(v4, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE0AB28]))
  {

    goto LABEL_12;
  }
  v8 = objc_msgSend(*v5, "code");

  if (v8 != -7003)
  {
LABEL_12:
    if (*v5)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __53__STIntroPasscodeViewController_userEnteredPasscode___block_invoke_2_cold_2((uint64_t *)(a1 + 40));
    }
    else if (!v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      __53__STIntroPasscodeViewController_userEnteredPasscode___block_invoke_2_cold_1(v2);
    }
    v9 = CFSTR("RecoveryAppleIDUnknownError");
    goto LABEL_20;
  }
  v9 = CFSTR("RecoveryAppleIDAlertConfirmSkipTitle");
LABEL_20:
  objc_msgSend(*(id *)(a1 + 64), "localizedStringForKey:value:table:", v9, &stru_24DB8A1D0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 48), "isChildOrNotSignedIntoiCloud"))
    v16 = CFSTR("RecoveryAppleIDAlertConfirmSkipMessageChild");
  else
    v16 = CFSTR("RecoveryAppleIDAlertConfirmSkipMessage");
  objc_msgSend(*(id *)(a1 + 64), "localizedStringForKey:value:table:", v16, &stru_24DB8A1D0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v15, v17, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "localizedStringForKey:value:table:", CFSTR("RecoveryAppleIDAlertSkipButton"), &stru_24DB8A1D0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x24BEBD3A8];
  v21 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v22 = *(_QWORD *)(a1 + 48);
  v23 = *(void **)(a1 + 56);
  v31[2] = __53__STIntroPasscodeViewController_userEnteredPasscode___block_invoke_53;
  v31[3] = &unk_24DB868F8;
  v31[4] = v22;
  v32 = v23;
  objc_msgSend(v20, "actionWithTitle:style:handler:", v19, 0, v31);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAction:", v24);

  objc_msgSend(*(id *)(a1 + 64), "localizedStringForKey:value:table:", CFSTR("RecoveryAppleIDAlertSetButton"), &stru_24DB8A1D0, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x24BEBD3A8];
  v29[0] = v21;
  v29[1] = 3221225472;
  v29[2] = __53__STIntroPasscodeViewController_userEnteredPasscode___block_invoke_2_57;
  v29[3] = &unk_24DB868F8;
  v27 = *(void **)(a1 + 56);
  v29[4] = *(_QWORD *)(a1 + 48);
  v30 = v27;
  objc_msgSend(v26, "actionWithTitle:style:handler:", v25, 1, v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAction:", v28);

  objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", v18, 1, 0);
LABEL_24:

}

void __53__STIntroPasscodeViewController_userEnteredPasscode___block_invoke_53(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void (**v4)(void);

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setParentalControlsPasscode:", v2);

  objc_msgSend(*(id *)(a1 + 32), "continueHandler");
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v4[2]();

}

uint64_t __53__STIntroPasscodeViewController_userEnteredPasscode___block_invoke_2_57(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "userEnteredPasscode:", *(_QWORD *)(a1 + 40));
}

- (void)_transitionToFirstPasscodePaneWithState:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[STIntroPasscodeViewController setInitialPasscode:](self, "setInitialPasscode:", 0);
  -[STIntroPasscodeViewController setPasscodeState:](self, "setPasscodeState:", a3);
  -[STIntroPasscodeViewController _passcodeView](self, "_passcodeView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "passcodeInputView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPasscode:", &stru_24DB8A1D0);

  -[STIntroPasscodeViewController passcodeInputView](self, "passcodeInputView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "animateTransitionToPasscodeInput:animation:", v6, 1);

}

- (void)updatePasscodeType
{
  void *v3;
  void *v4;
  id v5;

  -[STIntroPasscodeViewController setPasscodeState:](self, "setPasscodeState:", 0);
  -[STIntroPasscodeViewController passcodeTypeChanged:](self, "passcodeTypeChanged:", 1);
  -[STIntroPasscodeViewController _passcodeView](self, "_passcodeView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[STIntroPasscodeViewController passcodeInputView](self, "passcodeInputView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transitionToPasscodeInput:delegate:", v3, self);

  objc_msgSend(v5, "passcodeInputView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "becomeFirstResponder");

}

- (void)passcodeInput:(id)a3 enteredPasscode:(id)a4
{
  -[STIntroPasscodeViewController userEnteredPasscode:](self, "userEnteredPasscode:", a4);
}

- (STIntroductionViewModel)model
{
  return (STIntroductionViewModel *)objc_getProperty(self, a2, 976, 1);
}

- (BOOL)askForRecoveryAppleID
{
  return self->_askForRecoveryAppleID;
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 984, 1);
}

- (BOOL)isChildOrNotSignedIntoiCloud
{
  return self->_childOrNotSignedIntoiCloud;
}

- (id)continueHandler
{
  return objc_getProperty(self, a2, 992, 1);
}

- (int64_t)passcodeState
{
  return self->_passcodeState;
}

- (void)setPasscodeState:(int64_t)a3
{
  self->_passcodeState = a3;
}

- (NSString)initialPasscode
{
  return (NSString *)objc_getProperty(self, a2, 1008, 1);
}

- (void)setInitialPasscode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1008);
}

- (BOOL)isNumeric
{
  return self->_numeric;
}

- (void)setNumeric:(BOOL)a3
{
  self->_numeric = a3;
}

- (unint64_t)numericLength
{
  return self->_numericLength;
}

- (void)setNumericLength:(unint64_t)a3
{
  self->_numericLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialPasscode, 0);
  objc_storeStrong(&self->_continueHandler, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

void __53__STIntroPasscodeViewController_userEnteredPasscode___block_invoke_2_cold_1(uint64_t *a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = *a1;
  v2 = 138412290;
  v3 = v1;
  _os_log_fault_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Authenticated user without an altDSID: %@", (uint8_t *)&v2, 0xCu);
}

void __53__STIntroPasscodeViewController_userEnteredPasscode___block_invoke_2_cold_2(uint64_t *a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = *a1;
  v2 = 138543362;
  v3 = v1;
  _os_log_error_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to authenticate recovery Apple ID: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
