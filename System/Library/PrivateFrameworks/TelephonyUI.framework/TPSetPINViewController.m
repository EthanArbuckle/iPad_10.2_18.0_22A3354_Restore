@implementation TPSetPINViewController

- (TPSetPINViewController)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Please don't call -[PHVoicemailSetupPinViewController init]"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("** TUAssertion failure: %@"), v4);

  if (_TUAssertShouldCrashApplication())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TPSetPINViewController.m"), 72, CFSTR("Please don't call -[PHVoicemailSetupPinViewController init]"));

  }
  return 0;
}

- (id)_initForMinLength:(unsigned int)a3 maxLength:(unsigned int)a4 confirmPIN:(BOOL)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v9;
  void *v10;
  TPSetPINViewController *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  if (a3 <= a4)
  {
    v12 = a5;
    v21.receiver = self;
    v21.super_class = (Class)TPSetPINViewController;
    v11 = -[TPSetPINViewController init](&v21, sel_init);
    if (v11)
    {
      TelephonyUIBundle();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("PASSWORD"), &stru_1E75FDD38, CFSTR("General"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPSetPINViewController navigationItem](v11, "navigationItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTitle:", v14);

      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, v11, sel__doneButtonTapped);
      -[TPSetPINViewController navigationItem](v11, "navigationItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setRightBarButtonItem:", v16);

      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, v11, sel__cancelButtonTapped);
      -[TPSetPINViewController navigationItem](v11, "navigationItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setLeftBarButtonItem:", v18);

      -[TPSetPINViewController setMinPINLength:](v11, "setMinPINLength:", v6);
      -[TPSetPINViewController setMaxPINLength:](v11, "setMaxPINLength:", v5);
      -[TPSetPINViewController setConfirmPIN:](v11, "setConfirmPIN:", v12);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Min PIN length of %u exceeds max PIN length of %u."), *(_QWORD *)&a3, *(_QWORD *)&a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("** TUAssertion failure: %@"), v9);

    if (_TUAssertShouldCrashApplication())
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TPSetPINViewController.m"), 77, CFSTR("Min PIN length of %u exceeds max PIN length of %u."), v6, v5);

    }
    return 0;
  }
  return v11;
}

- (id)initForNewPINWithMinLength:(unsigned int)a3 maxLength:(unsigned int)a4 confirmPIN:(BOOL)a5
{
  id v5;
  void *v6;

  v5 = -[TPSetPINViewController _initForMinLength:maxLength:confirmPIN:](self, "_initForMinLength:maxLength:confirmPIN:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5);
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "setInitialState:", 1);
  return v6;
}

- (id)initForChangePINWithMinLength:(unsigned int)a3 maxLength:(unsigned int)a4 confirmPIN:(BOOL)a5
{
  id v5;
  void *v6;

  v5 = -[TPSetPINViewController _initForMinLength:maxLength:confirmPIN:](self, "_initForMinLength:maxLength:confirmPIN:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5);
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "setInitialState:", 0);
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[TPSimpleNumberPad setDelegate:](self->_numberPad, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TPSetPINViewController;
  -[TPSetPINViewController dealloc](&v3, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  void *v4;
  TPSetPINKeyPadNumberPad *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  TPSetPINKeyPadNumberPad *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  TPPasscodeView *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)TPSetPINViewController;
  -[TPSetPINViewController loadView](&v42, sel_loadView);
  -[TPSetPINViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "dynamicBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = [TPSetPINKeyPadNumberPad alloc];
  -[TPSetPINViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");
  v8 = *MEMORY[0x1E0C9D648];
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v12 = -[TPSimpleNumberPad initWithFrame:style:](v5, "initWithFrame:style:", v7, *MEMORY[0x1E0C9D648], v9, v10, v11);

  -[TPSetPINKeyPadNumberPad setTranslatesAutoresizingMaskIntoConstraints:](v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v13) = 1148846080;
  -[TPSetPINKeyPadNumberPad setContentCompressionResistancePriority:forAxis:](v12, "setContentCompressionResistancePriority:forAxis:", 0, v13);
  LODWORD(v14) = 1148846080;
  -[TPSetPINKeyPadNumberPad setContentCompressionResistancePriority:forAxis:](v12, "setContentCompressionResistancePriority:forAxis:", 1, v14);
  LODWORD(v15) = 1148846080;
  -[TPSetPINKeyPadNumberPad setContentHuggingPriority:forAxis:](v12, "setContentHuggingPriority:forAxis:", 0, v15);
  LODWORD(v16) = 1148846080;
  -[TPSetPINKeyPadNumberPad setContentHuggingPriority:forAxis:](v12, "setContentHuggingPriority:forAxis:", 1, v16);
  -[TPSimpleNumberPad setDelegate:](v12, "setDelegate:", self);
  objc_msgSend(v3, "addSubview:", v12);
  -[TPSetPINViewController setNumberPad:](self, "setNumberPad:", v12);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v8, v9, v10, v11);
  objc_msgSend(v17, "setNumberOfLines:", 2);
  objc_msgSend(v17, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFont:", v18);

  objc_msgSend(MEMORY[0x1E0DC3658], "dynamicLabelColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTextColor:", v19);

  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v20) = 1132068864;
  objc_msgSend(v17, "setContentCompressionResistancePriority:forAxis:", 0, v20);
  LODWORD(v21) = 1148846080;
  objc_msgSend(v17, "setContentCompressionResistancePriority:forAxis:", 1, v21);
  objc_msgSend(v3, "addSubview:", v17);
  -[TPSetPINViewController setStatusLabel:](self, "setStatusLabel:", v17);
  v22 = -[TPPasscodeView initWithFrame:]([TPPasscodeView alloc], "initWithFrame:", v8, v9, v10, v11);
  -[TPPasscodeView setTranslatesAutoresizingMaskIntoConstraints:](v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v23) = 1148846080;
  -[TPPasscodeView setContentCompressionResistancePriority:forAxis:](v22, "setContentCompressionResistancePriority:forAxis:", 0, v23);
  LODWORD(v24) = 1148846080;
  -[TPPasscodeView setContentCompressionResistancePriority:forAxis:](v22, "setContentCompressionResistancePriority:forAxis:", 1, v24);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPasscodeView setBackgroundColor:](v22, "setBackgroundColor:", v25);

  objc_msgSend(v3, "addSubview:", v22);
  -[TPSetPINViewController setPasscodeView:](self, "setPasscodeView:", v22);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 9, 0, v3, 9, 1.0, 0.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v26);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 5, 1, v3, 5, 1.0, 27.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v27);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 6, -1, v3, 6, 1.0, -27.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v28);

  v29 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "isUserInterfaceIdiomPad");
  v33 = 79.0;
  if (!v31)
    v33 = 109.0;
  LODWORD(v32) = 1144750080;
  objc_msgSend(v29, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:", v17, 10, 0, v3, 3, 1.0, v33, v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v34);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v22, 9, 0, v3, 9, 1.0, 0.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v35);

  LODWORD(v36) = 1148846080;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:", v22, 3, 0, v17, 11, 1.0, 14.0, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v37);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 9, 0, v3, 9, 1.0, 0.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v38);

  v39 = (void *)MEMORY[0x1E0CB3718];
  -[TPSetPINViewController numberPadTopConstraintConstant](self, "numberPadTopConstraintConstant");
  objc_msgSend(v39, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 3, 0, v22, 4, 1.0, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v41);

  -[TPSetPINViewController setState:](self, "setState:", -[TPSetPINViewController initialState](self, "initialState"));
  -[TPSetPINViewController _updateUIForStateChange](self, "_updateUIForStateChange");

}

- (double)numberPadTopConstraintConstant
{
  double result;
  void *v3;
  void *v4;
  char v5;

  result = *(double *)&numberPadTopConstraintConstant_topConstraintConstant;
  if (*(double *)&numberPadTopConstraintConstant_topConstraintConstant == 0.0)
  {
    numberPadTopConstraintConstant_topConstraintConstant = 0x404E000000000000;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen", result);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "screenSizeCategory") == 1)
    {

LABEL_5:
      numberPadTopConstraintConstant_topConstraintConstant = 0x4034000000000000;
      return 20.0;
    }
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isUserInterfaceIdiomPad");

    if ((v5 & 1) != 0)
      goto LABEL_5;
    return *(double *)&numberPadTopConstraintConstant_topConstraintConstant;
  }
  return result;
}

- (BOOL)wantsFullScreenLayout
{
  return 1;
}

- (void)resetWithErrorPrompt:(id)a3
{
  -[TPSetPINViewController resetWithErrorPrompt:title:](self, "resetWithErrorPrompt:title:", a3, 0);
}

- (void)resetWithErrorPrompt:(id)a3 title:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    v9 = (void *)MEMORY[0x1E0DC3450];
    if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", v8, v6, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      TelephonyUIBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("ERROR"), &stru_1E75FDD38, CFSTR("General"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", v12, v6, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v13 = (void *)MEMORY[0x1E0DC3448];
    TelephonyUIBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E75FDD38, CFSTR("General"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __53__TPSetPINViewController_resetWithErrorPrompt_title___block_invoke;
    v17[3] = &unk_1E75FD528;
    v17[4] = self;
    objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 0, v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v16);

    -[TPSetPINViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
  }
  else
  {
    -[TPSetPINViewController setState:](self, "setState:", -[TPSetPINViewController initialState](self, "initialState"));
  }

}

uint64_t __53__TPSetPINViewController_resetWithErrorPrompt_title___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setState:", objc_msgSend(*(id *)(a1 + 32), "initialState"));
}

- (void)setPromptTextForOldPIN:(id)a3
{
  void *v3;
  NSString *v5;
  int v6;
  void *v7;
  NSString *promptTextForOldPIN;

  v5 = (NSString *)a3;
  if (!v5
    || (-[TPSetPINViewController promptTextForOldPIN](self, "promptTextForOldPIN"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[TPSetPINViewController promptTextForOldPIN](self, "promptTextForOldPIN");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqualToString:", v5) ^ 1;

    if (!v5)
      goto LABEL_6;
  }
  else
  {
    v6 = 1;
  }

LABEL_6:
  promptTextForOldPIN = self->_promptTextForOldPIN;
  self->_promptTextForOldPIN = v5;

  if (v6)
    -[TPSetPINViewController _updateStatusLabel](self, "_updateStatusLabel");
}

- (void)setPromptTextForNewPIN:(id)a3
{
  void *v3;
  NSString *v5;
  int v6;
  void *v7;
  NSString *promptTextForNewPIN;

  v5 = (NSString *)a3;
  if (!v5
    || (-[TPSetPINViewController promptTextForNewPIN](self, "promptTextForNewPIN"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[TPSetPINViewController promptTextForNewPIN](self, "promptTextForNewPIN");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqualToString:", v5) ^ 1;

    if (!v5)
      goto LABEL_6;
  }
  else
  {
    v6 = 1;
  }

LABEL_6:
  promptTextForNewPIN = self->_promptTextForNewPIN;
  self->_promptTextForNewPIN = v5;

  if (v6)
    -[TPSetPINViewController _updateStatusLabel](self, "_updateStatusLabel");
}

- (void)setPromptTextForConfirmingNewPIN:(id)a3
{
  void *v3;
  NSString *v5;
  int v6;
  void *v7;
  NSString *promptTextForConfirmingNewPIN;

  v5 = (NSString *)a3;
  if (!v5
    || (-[TPSetPINViewController promptTextForConfirmingNewPIN](self, "promptTextForConfirmingNewPIN"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[TPSetPINViewController promptTextForConfirmingNewPIN](self, "promptTextForConfirmingNewPIN");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqualToString:", v5) ^ 1;

    if (!v5)
      goto LABEL_6;
  }
  else
  {
    v6 = 1;
  }

LABEL_6:
  promptTextForConfirmingNewPIN = self->_promptTextForConfirmingNewPIN;
  self->_promptTextForConfirmingNewPIN = v5;

  if (v6)
    -[TPSetPINViewController _updateStatusLabel](self, "_updateStatusLabel");
}

- (void)setPromptTextForSavingPIN:(id)a3
{
  void *v3;
  NSString *v5;
  int v6;
  void *v7;
  NSString *promptTextForSavingPIN;

  v5 = (NSString *)a3;
  if (!v5
    || (-[TPSetPINViewController promptTextForSavingPIN](self, "promptTextForSavingPIN"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[TPSetPINViewController promptTextForSavingPIN](self, "promptTextForSavingPIN");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqualToString:", v5) ^ 1;

    if (!v5)
      goto LABEL_6;
  }
  else
  {
    v6 = 1;
  }

LABEL_6:
  promptTextForSavingPIN = self->_promptTextForSavingPIN;
  self->_promptTextForSavingPIN = v5;

  if (v6)
    -[TPSetPINViewController _updateStatusLabel](self, "_updateStatusLabel");
}

- (void)_doneButtonTapped
{
  int v3;
  void *v4;
  void *v5;
  TPSetPINViewController *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;

  v3 = -[TPSetPINViewController state](self, "state");
  switch(v3)
  {
    case 2:
      -[TPSetPINViewController passcodeView](self, "passcodeView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "passcodeString");
      v20 = (id)objc_claimAutoreleasedReturnValue();

      -[TPSetPINViewController unconfirmedPIN](self, "unconfirmedPIN");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v20, "isEqualToString:", v9);

      if (v10)
      {
        -[TPSetPINViewController setState:](self, "setState:", 3);
        -[TPSetPINViewController delegate](self, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
LABEL_17:

          return;
        }
        -[TPSetPINViewController delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[TPSetPINViewController oldPIN](self, "oldPIN");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[TPSetPINViewController unconfirmedPIN](self, "unconfirmedPIN");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setPINViewControllerFinished:success:oldPIN:newPIN:", self, 1, v13, v14);
      }
      else
      {
        TelephonyUIBundle();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("MISMATCH"), &stru_1E75FDD38, CFSTR("General"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        TelephonyUIBundle();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ERROR"), &stru_1E75FDD38, CFSTR("General"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[TPSetPINViewController resetWithErrorPrompt:title:](self, "resetWithErrorPrompt:title:", v13, v18);

      }
LABEL_16:

      goto LABEL_17;
    case 1:
      v15 = -[TPSetPINViewController confirmPIN](self, "confirmPIN");
      -[TPSetPINViewController passcodeView](self, "passcodeView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "passcodeString");
      v17 = objc_claimAutoreleasedReturnValue();
      v20 = (id)v17;
      if (v15)
      {
        -[TPSetPINViewController setUnconfirmedPIN:](self, "setUnconfirmedPIN:", v17);

        v6 = self;
        v7 = 2;
        goto LABEL_10;
      }

      -[TPSetPINViewController setState:](self, "setState:", 3);
      -[TPSetPINViewController delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
        goto LABEL_17;
      -[TPSetPINViewController delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPSetPINViewController oldPIN](self, "oldPIN");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPINViewControllerFinished:success:oldPIN:newPIN:", self, 1, v13, v20);
      goto LABEL_16;
    case 0:
      -[TPSetPINViewController passcodeView](self, "passcodeView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "passcodeString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPSetPINViewController setOldPIN:](self, "setOldPIN:", v5);

      v6 = self;
      v7 = 1;
LABEL_10:
      -[TPSetPINViewController setState:](v6, "setState:", v7);
      break;
  }
}

- (void)_cancelButtonTapped
{
  void *v3;
  id v4;

  -[TPSetPINViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TPSetPINViewController delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPINViewControllerFinished:success:oldPIN:newPIN:", self, 0, 0, 0);

  }
}

- (void)simpleNumberPad:(id)a3 buttonPressedWithCharacter:(id)a4
{
  void *v5;
  void *v6;
  unint64_t v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  -[TPSetPINViewController passcodeView](self, "passcodeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "passcodeString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");
  v8 = -[TPSetPINViewController maxPINLength](self, "maxPINLength");

  if (v7 < v8)
  {
    -[TPSetPINViewController passcodeView](self, "passcodeView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendCharacter:", v13);

    -[TPSetPINViewController _updateDeleteAllowed](self, "_updateDeleteAllowed");
    -[TPSetPINViewController _updateNavBarButtons](self, "_updateNavBarButtons");
  }
  -[TPSetPINViewController numberPad](self, "numberPad");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSetPINViewController passcodeView](self, "passcodeView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "passcodeString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNumberButtonsEnabled:", objc_msgSend(v12, "length") < (unint64_t)-[TPSetPINViewController maxPINLength](self, "maxPINLength"));

}

- (void)simpleNumberPadDeletePressed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[TPSetPINViewController passcodeView](self, "passcodeView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteLastCharacter");

  -[TPSetPINViewController numberPad](self, "numberPad");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSetPINViewController passcodeView](self, "passcodeView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "passcodeString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumberButtonsEnabled:", objc_msgSend(v7, "length") < (unint64_t)-[TPSetPINViewController maxPINLength](self, "maxPINLength"));

  -[TPSetPINViewController _updateDeleteAllowed](self, "_updateDeleteAllowed");
  -[TPSetPINViewController _updateNavBarButtons](self, "_updateNavBarButtons");
}

- (void)setState:(int)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    -[TPSetPINViewController _updateUIForStateChange](self, "_updateUIForStateChange");
  }
}

- (void)_updateDeleteAllowed
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  id v6;

  -[TPSetPINViewController passcodeView](self, "passcodeView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "passcodeString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") != 0;
  -[TPSetPINViewController numberPad](self, "numberPad");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowsDeleteButton:", v4);

}

- (void)_updateNavBarButtons
{
  void *v3;
  void *v4;
  unint64_t v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  id v11;

  -[TPSetPINViewController passcodeView](self, "passcodeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "passcodeString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  v6 = v5 >= -[TPSetPINViewController minPINLength](self, "minPINLength");
  -[TPSetPINViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rightBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v6);

  v9 = -[TPSetPINViewController state](self, "state") != 3;
  -[TPSetPINViewController navigationItem](self, "navigationItem");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leftBarButtonItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", v9);

}

- (void)_updateStatusLabel
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  if (-[TPSetPINViewController isViewLoaded](self, "isViewLoaded"))
  {
    switch(-[TPSetPINViewController state](self, "state"))
    {
      case 0:
        -[TPSetPINViewController promptTextForOldPIN](self, "promptTextForOldPIN");
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v4)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Asked to show UI for requesting old PIN, but promptTextForOldPIN is nil"));
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("** TUAssertion failure: %@"), v5);

          if (_TUAssertShouldCrashApplication())
          {
            -[TPSetPINViewController promptTextForOldPIN](self, "promptTextForOldPIN");
            v6 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v6)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TPSetPINViewController.m"), 387, CFSTR("Asked to show UI for requesting old PIN, but promptTextForOldPIN is nil"));

            }
          }
        }
        -[TPSetPINViewController promptTextForOldPIN](self, "promptTextForOldPIN");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      case 1:
        -[TPSetPINViewController promptTextForNewPIN](self, "promptTextForNewPIN");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Asked to show UI for requesting new PIN, but promptTextForNewPIN is nil"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("** TUAssertion failure: %@"), v9);

          if (_TUAssertShouldCrashApplication())
          {
            -[TPSetPINViewController promptTextForNewPIN](self, "promptTextForNewPIN");
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v10)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TPSetPINViewController.m"), 392, CFSTR("Asked to show UI for requesting new PIN, but promptTextForNewPIN is nil"));

            }
          }
        }
        -[TPSetPINViewController promptTextForNewPIN](self, "promptTextForNewPIN");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      case 2:
        -[TPSetPINViewController promptTextForConfirmingNewPIN](self, "promptTextForConfirmingNewPIN");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Asked to show UI for confirming new PIN, but promptTextForConfirmingNewPIN is nil"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("** TUAssertion failure: %@"), v12);

          if (_TUAssertShouldCrashApplication())
          {
            -[TPSetPINViewController promptTextForConfirmingNewPIN](self, "promptTextForConfirmingNewPIN");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v13)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TPSetPINViewController.m"), 397, CFSTR("Asked to show UI for confirming new PIN, but promptTextForConfirmingNewPIN is nil"));

            }
          }
        }
        -[TPSetPINViewController promptTextForConfirmingNewPIN](self, "promptTextForConfirmingNewPIN");
        v7 = objc_claimAutoreleasedReturnValue();
LABEL_19:
        v14 = (void *)v7;
        -[TPSetPINViewController statusLabel](self, "statusLabel");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setText:", v14);

        -[TPSetPINViewController view](self, "view");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v16;
        v17 = 1;
        goto LABEL_25;
      case 3:
        -[TPSetPINViewController promptTextForSavingPIN](self, "promptTextForSavingPIN");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Asked to show UI for saving new PIN, but promptTextForSavingPIN is nil"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("** TUAssertion failure: %@"), v19);

          if (_TUAssertShouldCrashApplication())
          {
            -[TPSetPINViewController promptTextForSavingPIN](self, "promptTextForSavingPIN");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v20)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TPSetPINViewController.m"), 402, CFSTR("Asked to show UI for saving new PIN, but promptTextForSavingPIN is nil"));

            }
          }
        }
        -[TPSetPINViewController promptTextForSavingPIN](self, "promptTextForSavingPIN");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[TPSetPINViewController statusLabel](self, "statusLabel");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setText:", v21);

        -[TPSetPINViewController view](self, "view");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v16;
        v17 = 0;
LABEL_25:
        objc_msgSend(v16, "setUserInteractionEnabled:", v17);

        break;
      default:
        return;
    }
  }
}

- (void)_updateUIForStateChange
{
  void *v3;
  void *v4;

  -[TPSetPINViewController passcodeView](self, "passcodeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clear");

  -[TPSetPINViewController numberPad](self, "numberPad");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumberButtonsEnabled:", 1);

  -[TPSetPINViewController _updateDeleteAllowed](self, "_updateDeleteAllowed");
  -[TPSetPINViewController _updateNavBarButtons](self, "_updateNavBarButtons");
  -[TPSetPINViewController _updateStatusLabel](self, "_updateStatusLabel");
}

- (TPSetPINViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TPSetPINViewControllerDelegate *)a3;
}

- (NSString)promptTextForOldPIN
{
  return self->_promptTextForOldPIN;
}

- (NSString)promptTextForNewPIN
{
  return self->_promptTextForNewPIN;
}

- (NSString)promptTextForConfirmingNewPIN
{
  return self->_promptTextForConfirmingNewPIN;
}

- (NSString)promptTextForSavingPIN
{
  return self->_promptTextForSavingPIN;
}

- (UIView)customBackgroundView
{
  return (UIView *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setCustomBackgroundView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1032);
}

- (int)initialState
{
  return self->_initialState;
}

- (void)setInitialState:(int)a3
{
  self->_initialState = a3;
}

- (int)state
{
  return self->_state;
}

- (unsigned)minPINLength
{
  return self->_minPINLength;
}

- (void)setMinPINLength:(unsigned int)a3
{
  self->_minPINLength = a3;
}

- (unsigned)maxPINLength
{
  return self->_maxPINLength;
}

- (void)setMaxPINLength:(unsigned int)a3
{
  self->_maxPINLength = a3;
}

- (BOOL)confirmPIN
{
  return self->_confirmPIN;
}

- (void)setConfirmPIN:(BOOL)a3
{
  self->_confirmPIN = a3;
}

- (UILabel)statusLabel
{
  return (UILabel *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setStatusLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1040);
}

- (TPPasscodeView)passcodeView
{
  return (TPPasscodeView *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setPasscodeView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1048);
}

- (TPSimpleNumberPad)numberPad
{
  return (TPSimpleNumberPad *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setNumberPad:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1056);
}

- (NSString)oldPIN
{
  return (NSString *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setOldPIN:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1064);
}

- (NSString)unconfirmedPIN
{
  return (NSString *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setUnconfirmedPIN:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1072);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unconfirmedPIN, 0);
  objc_storeStrong((id *)&self->_oldPIN, 0);
  objc_storeStrong((id *)&self->_numberPad, 0);
  objc_storeStrong((id *)&self->_passcodeView, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_customBackgroundView, 0);
  objc_storeStrong((id *)&self->_promptTextForSavingPIN, 0);
  objc_storeStrong((id *)&self->_promptTextForConfirmingNewPIN, 0);
  objc_storeStrong((id *)&self->_promptTextForNewPIN, 0);
  objc_storeStrong((id *)&self->_promptTextForOldPIN, 0);
}

@end
