@implementation ICPasswordChangeViewController

- (ICPasswordChangeViewController)initWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  ICPasswordChangeViewController *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)ICPasswordChangeViewController;
  v6 = -[ICPasswordChangeViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, v5);

  if (v6)
  {
    v7 = (void *)objc_msgSend(v4, "copy");
    -[ICPasswordChangeViewController setCompletionHandler:](v6, "setCompletionHandler:", v7);

    -[ICPasswordChangeViewController registerForTraitChanges](v6, "registerForTraitChanges");
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[ICPasswordChangeViewController scrollViewResizer](self, "scrollViewResizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAutoResizing");

  v4.receiver = self;
  v4.super_class = (Class)ICPasswordChangeViewController;
  -[ICPasswordChangeViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  ICScrollViewKeyboardResizer *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
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
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  objc_super v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _QWORD v56[5];

  v56[4] = *MEMORY[0x1E0C80C00];
  v53.receiver = self;
  v53.super_class = (Class)ICPasswordChangeViewController;
  -[ICPasswordChangeViewController viewDidLoad](&v53, sel_viewDidLoad);
  -[ICPasswordChangeViewController resetTextFields](self, "resetTextFields");
  -[ICPasswordChangeViewController setUpNavigationBar](self, "setUpNavigationBar");
  v3 = -[ICScrollViewKeyboardResizer initWithDelegate:]([ICScrollViewKeyboardResizer alloc], "initWithDelegate:", self);
  -[ICPasswordChangeViewController setScrollViewResizer:](self, "setScrollViewResizer:", v3);

  -[ICPasswordChangeViewController scrollView](self, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentInsetAdjustmentBehavior:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "ICGroupedBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordChangeViewController scrollView](self, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  -[ICPasswordChangeViewController oldPasswordTextField](self, "oldPasswordTextField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v7;
  -[ICPasswordChangeViewController passwordTextField](self, "passwordTextField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v8;
  -[ICPasswordChangeViewController verifyTextField](self, "verifyTextField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v56[2] = v9;
  -[ICPasswordChangeViewController hintTextField](self, "hintTextField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v56[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordChangeViewController setOrderedTextFields:](self, "setOrderedTextFields:", v11);

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  -[ICPasswordChangeViewController orderedTextFields](self, "orderedTextFields");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v50;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v50 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v16++), "setDelegate:", self);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    }
    while (v14);
  }

  -[ICPasswordChangeViewController setUsingLargerAXSizes:](self, "setUsingLargerAXSizes:", ICAccessibilityAccessibilityLargerTextSizesEnabled());
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordChangeViewController passwordLabel](self, "passwordLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTextColor:", v17);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordChangeViewController oldPasswordLabel](self, "oldPasswordLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTextColor:", v19);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordChangeViewController verifyLabel](self, "verifyLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTextColor:", v21);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordChangeViewController hintLabel](self, "hintLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTextColor:", v23);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordChangeViewController headerLabel](self, "headerLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setTextColor:", v25);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordChangeViewController passwordTextField](self, "passwordTextField");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTextColor:", v27);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordChangeViewController oldPasswordTextField](self, "oldPasswordTextField");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setTextColor:", v29);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordChangeViewController verifyTextField](self, "verifyTextField");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setTextColor:", v31);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordChangeViewController hintTextField](self, "hintTextField");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setTextColor:", v33);

  objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordChangeViewController warningLabel](self, "warningLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setTextColor:", v35);

  -[ICPasswordChangeViewController warningLabel](self, "warningLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setHidden:", 1);

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  -[ICPasswordChangeViewController textBackgroundViews](self, "textBackgroundViews", 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v46;
    do
    {
      v42 = 0;
      do
      {
        if (*(_QWORD *)v46 != v41)
          objc_enumerationMutation(v38);
        v43 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v42);
        if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
        {
          objc_msgSend(v43, "setBackgroundColor:", 0);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setBackgroundColor:", v44);

        }
        ++v42;
      }
      while (v40 != v42);
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    }
    while (v40);
  }

}

- (void)setUpNavigationBar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[ICPasswordChangeViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setModalPresentationStyle:", 2);

  -[ICPasswordChangeViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNavigationBarHidden:", 0);

  -[ICPasswordChangeViewController cancelButton](self, "cancelButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordChangeViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLeftBarButtonItem:", v5);

  -[ICPasswordChangeViewController doneButton](self, "doneButton");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ICPasswordChangeViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRightBarButtonItem:", v8);

}

- (void)viewWillAppear:(BOOL)a3
{
  float v4;
  void *v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ICPasswordChangeViewController;
  -[ICPasswordChangeViewController viewWillAppear:](&v11, sel_viewWillAppear_, a3);
  if (-[ICPasswordChangeViewController isSetupForChangePassword](self, "isSetupForChangePassword"))
  {
    if (-[ICPasswordChangeViewController didAuthenticateWithBiometrics](self, "didAuthenticateWithBiometrics"))
      v4 = 999.0;
    else
      v4 = 1.0;
  }
  else
  {
    v4 = 999.0;
  }
  -[ICPasswordChangeViewController oldPasswordHeightConstraint](self, "oldPasswordHeightConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = v4;
  objc_msgSend(v5, "setPriority:", v6);

  if (-[ICPasswordChangeViewController isSetupForChangePassword](self, "isSetupForChangePassword")
    && !-[ICPasswordChangeViewController didAuthenticateWithBiometrics](self, "didAuthenticateWithBiometrics"))
  {
    -[ICPasswordChangeViewController oldPasswordTextField](self, "oldPasswordTextField");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ICPasswordChangeViewController passwordTextField](self, "passwordTextField");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
  if (!UIAccessibilityIsVoiceOverRunning())
    objc_msgSend(v8, "becomeFirstResponder");
  -[ICPasswordChangeViewController updateFonts](self, "updateFonts");
  -[ICPasswordChangeViewController scrollViewResizer](self, "scrollViewResizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startAutoResizing");

  -[ICPasswordChangeViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layoutIfNeeded");

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICPasswordChangeViewController;
  -[ICPasswordChangeViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[ICPasswordChangeViewController scrollViewResizer](self, "scrollViewResizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAutoResizing");

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICPasswordChangeViewController;
  -[ICPasswordChangeViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  -[ICPasswordChangeViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordChangeViewController passphraseManager](self, "passphraseManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWindow:", v5);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[ICPasswordChangeViewController firstResponderTextField](self, "firstResponderTextField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)ICPasswordChangeViewController;
  -[ICPasswordChangeViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__ICPasswordChangeViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v10[3] = &unk_1E5C23858;
  v11 = v8;
  v9 = v8;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", &__block_literal_global_83, v10);

}

void *__85__ICPasswordChangeViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)objc_msgSend(result, "becomeFirstResponder");
  return result;
}

- (UITextField)firstResponderTextField
{
  void *v2;
  void *v3;

  -[ICPasswordChangeViewController orderedTextFields](self, "orderedTextFields");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_objectPassingTest:", &__block_literal_global_23);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextField *)v3;
}

uint64_t __57__ICPasswordChangeViewController_firstResponderTextField__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isFirstResponder");
}

- (BOOL)validateInput
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL8 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  void *v27;

  if (-[ICPasswordChangeViewController isSetupForChangePassword](self, "isSetupForChangePassword"))
  {
    if (!-[ICPasswordChangeViewController didAuthenticateWithBiometrics](self, "didAuthenticateWithBiometrics"))
    {
      -[ICPasswordChangeViewController passphraseManager](self, "passphraseManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "account");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICPasswordChangeViewController oldPasswordTextField](self, "oldPasswordTextField");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "text");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v4, "isPassphraseCorrect:", v6);

      if ((v7 & 1) == 0)
      {
        v19 = -[ICPasswordChangeViewController incorrectPasswordAttempts](self, "incorrectPasswordAttempts") >= 2;
        -[ICPasswordChangeViewController passphraseManager](self, "passphraseManager");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "account");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[ICAuthenticationAlert incorrectCustomPasswordInfoAlertWithObject:showHint:](ICAuthenticationAlert, "incorrectCustomPasswordInfoAlertWithObject:showHint:", v21, v19);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[ICPasswordChangeViewController view](self, "view");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "window");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "presentInWindow:completionHandler:", v23, 0);

        -[ICPasswordChangeViewController setIncorrectPasswordAttempts:](self, "setIncorrectPasswordAttempts:", -[ICPasswordChangeViewController incorrectPasswordAttempts](self, "incorrectPasswordAttempts") + 1);
        goto LABEL_11;
      }
    }
  }
  -[ICPasswordChangeViewController passwordTextField](self, "passwordTextField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (!v10)
  {
    +[ICAuthenticationAlert missingCustomPasswordInfoAlert](ICAuthenticationAlert, "missingCustomPasswordInfoAlert");
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v11 = (void *)v14;
    -[ICPasswordChangeViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "window");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentInWindow:completionHandler:", v16, 0);

LABEL_11:
    v13 = 0;
    goto LABEL_12;
  }
  if (!-[ICPasswordChangeViewController passwordAndVerifyTextFieldsMatch](self, "passwordAndVerifyTextFieldsMatch"))
  {
    +[ICAuthenticationAlert mismatchedCustomPasswordInfoAlert](ICAuthenticationAlert, "mismatchedCustomPasswordInfoAlert");
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  -[ICPasswordChangeViewController hintTextField](self, "hintTextField");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "length"))
  {

    v13 = 1;
LABEL_12:

    goto LABEL_13;
  }
  v24 = -[ICPasswordChangeViewController didAttemptToSubmitWithoutHint](self, "didAttemptToSubmitWithoutHint");

  if (!v24)
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("A hint is strongly recommended."), CFSTR("A hint is strongly recommended."), 0, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICPasswordChangeViewController warningLabel](self, "warningLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setText:", v25);

    -[ICPasswordChangeViewController warningLabel](self, "warningLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setHidden:", 0);

    -[ICPasswordChangeViewController setDidAttemptToSubmitWithoutHint:](self, "setDidAttemptToSubmitWithoutHint:", 1);
    return 0;
  }
  v13 = 1;
LABEL_13:
  -[ICPasswordChangeViewController warningLabel](self, "warningLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setHidden:", 1);

  return v13;
}

- (void)cancelButtonPressed:(id)a3
{
  -[ICPasswordChangeViewController dismissWithResult:](self, "dismissWithResult:", 0);
}

- (void)doneButtonPressed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id location;

  v4 = a3;
  if (-[ICPasswordChangeViewController validateInput](self, "validateInput"))
  {
    -[ICPasswordChangeViewController dismissKeyboardIfNeeded](self, "dismissKeyboardIfNeeded");
    if (-[ICPasswordChangeViewController didAuthenticateWithBiometrics](self, "didAuthenticateWithBiometrics"))
    {
      v5 = 0;
    }
    else
    {
      -[ICPasswordChangeViewController oldPasswordTextField](self, "oldPasswordTextField");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "text");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[ICPasswordChangeViewController passwordTextField](self, "passwordTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (__CFString *)v8;
    else
      v10 = &stru_1E5C2F8C0;
    v11 = v10;

    -[ICPasswordChangeViewController hintTextField](self, "hintTextField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "text");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (__CFString *)v13;
    else
      v15 = &stru_1E5C2F8C0;
    v16 = v15;

    if (-[ICPasswordChangeViewController isSetupForChangePassword](self, "isSetupForChangePassword"))
    {
      objc_initWeak(&location, self);
      -[ICPasswordChangeViewController passphraseManager](self, "passphraseManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __52__ICPasswordChangeViewController_doneButtonPressed___block_invoke;
      v23[3] = &unk_1E5C23B48;
      objc_copyWeak(&v24, &location);
      objc_msgSend(v17, "changePassphrase:toPassphrase:hint:completion:", v5, v11, v16, v23);

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
    else
    {
      -[ICPasswordChangeViewController passphraseManager](self, "passphraseManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "setPassphrase:hint:", v11, v16);

      if (v19)
      {
        -[ICPasswordChangeViewController dismissWithResult:](self, "dismissWithResult:", 2);
      }
      else
      {
        +[ICAuthenticationAlert cannotSetCustomPasswordInfoAlert](ICAuthenticationAlert, "cannotSetCustomPasswordInfoAlert");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICPasswordChangeViewController view](self, "view");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "window");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "presentInWindow:completionHandler:", v22, 0);

      }
    }

  }
}

void __52__ICPasswordChangeViewController_doneButtonPressed___block_invoke(uint64_t a1, int a2)
{
  id *v3;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (a2)
  {
    objc_msgSend(WeakRetained, "dismissWithResult:", 2);
  }
  else
  {

    if (!v8)
      return;
    +[ICAuthenticationAlert cannotSetCustomPasswordInfoAlert](ICAuthenticationAlert, "cannotSetCustomPasswordInfoAlert");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_loadWeakRetained(v3);
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentInWindow:completionHandler:", v7, 0);

  }
}

- (void)dismissWithResult:(unint64_t)a3
{
  _QWORD v5[6];

  -[ICPasswordChangeViewController dismissKeyboardIfNeeded](self, "dismissKeyboardIfNeeded");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__ICPasswordChangeViewController_dismissWithResult___block_invoke;
  v5[3] = &unk_1E5C1E560;
  v5[4] = self;
  v5[5] = a3;
  -[ICPasswordChangeViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v5);
}

void __52__ICPasswordChangeViewController_dismissWithResult___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v3 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 40));

  }
}

- (BOOL)passwordAndVerifyTextFieldsMatch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  -[ICPasswordChangeViewController passwordTextField](self, "passwordTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "precomposedStringWithCanonicalMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordChangeViewController verifyTextField](self, "verifyTextField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "precomposedStringWithCanonicalMapping");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isEqualToString:", v8);

  return v9;
}

- (void)setUpForAddingPasswordWithAccount:(id)a3
{
  id v4;
  ICAccountPassphraseManager *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v4 = a3;
  v5 = -[ICAccountPassphraseManager initWithAccount:]([ICAccountPassphraseManager alloc], "initWithAccount:", v4);
  -[ICPasswordChangeViewController setPassphraseManager:](self, "setPassphraseManager:", v5);

  -[ICPasswordChangeViewController resetTextFields](self, "resetTextFields");
  -[ICPasswordChangeViewController setUpNavigationBar](self, "setUpNavigationBar");
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Set Password"), CFSTR("Set Password"), 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordChangeViewController setTitle:](self, "setTitle:", v6);

  -[ICPasswordChangeViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  v7 = (void *)MEMORY[0x1E0D639C8];
  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allActiveAccountsInContext:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  objc_msgSend(v4, "accountName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "ic_trimmedString");
  v25 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 >= 2 && objc_msgSend(v25, "length"))
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Create a password for all your locked notes in your “%@” account."), CFSTR("Create a password for all your locked notes in your “%@” account."), 0, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringWithFormat:", v14, v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICPasswordChangeViewController headerLabel](self, "headerLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v15);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Create a password for all your locked notes."), CFSTR("Create a password for all your locked notes."), 0, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICPasswordChangeViewController headerLabel](self, "headerLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setText:", v14);
  }

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Password"), CFSTR("Password"), 0, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordChangeViewController passwordLabel](self, "passwordLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setText:", v17);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Verify"), CFSTR("Verify"), 0, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordChangeViewController verifyLabel](self, "verifyLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setText:", v19);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Hint"), CFSTR("Hint"), 0, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordChangeViewController hintLabel](self, "hintLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setText:", v21);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Done"), CFSTR("Done"), 0, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordChangeViewController doneButton](self, "doneButton");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTitle:", v23);

  -[ICPasswordChangeViewController setIsSetupForChangePassword:](self, "setIsSetupForChangePassword:", 0);
  -[ICPasswordChangeViewController setupAccessibility](self, "setupAccessibility");

}

- (void)setUpForChangePasswordWithAccount:(id)a3 didAuthenticateWithBiometrics:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  ICAccountPassphraseManager *v7;
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

  v4 = a4;
  v6 = a3;
  v7 = -[ICAccountPassphraseManager initWithAccount:]([ICAccountPassphraseManager alloc], "initWithAccount:", v6);

  -[ICPasswordChangeViewController setPassphraseManager:](self, "setPassphraseManager:", v7);
  -[ICPasswordChangeViewController resetTextFields](self, "resetTextFields");
  -[ICPasswordChangeViewController setUpNavigationBar](self, "setUpNavigationBar");
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Change Password"), CFSTR("Change Password"), 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordChangeViewController setTitle:](self, "setTitle:", v8);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Old Password"), CFSTR("Old Password"), 0, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordChangeViewController oldPasswordLabel](self, "oldPasswordLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("New Password"), CFSTR("New Password"), 0, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordChangeViewController passwordLabel](self, "passwordLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Verify"), CFSTR("Verify"), 0, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordChangeViewController verifyLabel](self, "verifyLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v13);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Hint"), CFSTR("Hint"), 0, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordChangeViewController hintLabel](self, "hintLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v15);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Done"), CFSTR("Done"), 0, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordChangeViewController doneButton](self, "doneButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTitle:", v17);

  -[ICPasswordChangeViewController setIsSetupForChangePassword:](self, "setIsSetupForChangePassword:", 1);
  -[ICPasswordChangeViewController setDidAuthenticateWithBiometrics:](self, "setDidAuthenticateWithBiometrics:", v4);
  -[ICPasswordChangeViewController setupAccessibility](self, "setupAccessibility");
}

- (void)resetTextFields
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[ICPasswordChangeViewController oldPasswordTextField](self, "oldPasswordTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", &stru_1E5C2F8C0);

  -[ICPasswordChangeViewController passwordTextField](self, "passwordTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", &stru_1E5C2F8C0);

  -[ICPasswordChangeViewController verifyTextField](self, "verifyTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", &stru_1E5C2F8C0);

  -[ICPasswordChangeViewController hintTextField](self, "hintTextField");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", &stru_1E5C2F8C0);

}

- (id)disclaimerAttributedString
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 13.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_fontWithSingleLineA");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *MEMORY[0x1E0DC1140];
  v17[0] = *MEMORY[0x1E0DC1138];
  v17[1] = v4;
  v18[0] = v3;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D639C8];
  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allActiveAccountsInContext:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11 < 2)
    v12 = CFSTR("IMPORTANT: If you forget this password, you won’t be able to view your locked notes.");
  else
    v12 = CFSTR("IMPORTANT: If you forget this password, you won’t be able to view the locked notes that use it.");
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", v12, v12, 0, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v13, v6);
  v15 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v15, "setAlignment:", 4);
  objc_msgSend(v14, "addAttribute:value:range:", *MEMORY[0x1E0DC1178], v15, 0, objc_msgSend(v14, "length"));

  return v14;
}

- (void)dismissKeyboardIfNeeded
{
  id v2;

  -[ICPasswordChangeViewController firstResponderTextField](self, "firstResponderTextField");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resignFirstResponder");

}

- (void)registerForTraitChanges
{
  void *v3;
  id v4;
  _QWORD v5[5];
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__ICPasswordChangeViewController_registerForTraitChanges__block_invoke;
  v5[3] = &unk_1E5C205C8;
  v5[4] = self;
  v4 = (id)-[ICPasswordChangeViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v3, v5);

}

uint64_t __57__ICPasswordChangeViewController_registerForTraitChanges__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "contentSizeCategoryDidChange");
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[ICPasswordChangeViewController orderedTextFields](self, "orderedTextFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  v7 = v6 + 1;
  -[ICPasswordChangeViewController orderedTextFields](self, "orderedTextFields");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v7 >= v9)
  {
    -[ICPasswordChangeViewController doneButtonPressed:](self, "doneButtonPressed:", 0);
  }
  else
  {
    objc_opt_class();
    -[ICPasswordChangeViewController orderedTextFields](self, "orderedTextFields");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "becomeFirstResponder");
  }
  return 1;
}

- (void)contentSizeCategoryDidChange
{
  id v3;

  -[ICPasswordChangeViewController updateFonts](self, "updateFonts");
  -[ICPasswordChangeViewController view](self, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdateConstraints");

}

- (void)updateFonts
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4A88]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v3, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v16, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordChangeViewController headerLabel](self, "headerLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  -[ICPasswordChangeViewController warningLabel](self, "warningLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v5);

  -[ICPasswordChangeViewController oldPasswordLabel](self, "oldPasswordLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v4);

  -[ICPasswordChangeViewController oldPasswordTextField](self, "oldPasswordTextField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v4);

  -[ICPasswordChangeViewController passwordLabel](self, "passwordLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v4);

  -[ICPasswordChangeViewController passwordTextField](self, "passwordTextField");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v4);

  -[ICPasswordChangeViewController verifyLabel](self, "verifyLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v4);

  -[ICPasswordChangeViewController verifyTextField](self, "verifyTextField");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFont:", v4);

  -[ICPasswordChangeViewController hintLabel](self, "hintLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFont:", v4);

  -[ICPasswordChangeViewController hintTextField](self, "hintTextField");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFont:", v4);

}

- (void)setupAccessibility
{
  void *v3;
  uint64_t v4;
  _BOOL8 v5;
  void *v6;
  _BOOL8 v7;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  -[ICPasswordChangeViewController headerLabel](self, "headerLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accessibilityTraits");
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x1E0DC4670] | v4);

  v5 = -[ICPasswordChangeViewController isSetupForChangePassword](self, "isSetupForChangePassword");
  -[ICPasswordChangeViewController oldPasswordLabel](self, "oldPasswordLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsAccessibilityElement:", v5);

  v7 = -[ICPasswordChangeViewController isSetupForChangePassword](self, "isSetupForChangePassword");
  -[ICPasswordChangeViewController oldPasswordTextField](self, "oldPasswordTextField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIsAccessibilityElement:", v7);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Old Password"), CFSTR("Old Password"), 0, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordChangeViewController oldPasswordTextField](self, "oldPasswordTextField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityLabel:", v9);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Enter your old password first in order to set a new password."), CFSTR("Enter your old password first in order to set a new password."), 0, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordChangeViewController oldPasswordTextField](self, "oldPasswordTextField");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityHint:", v11);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("New Password"), CFSTR("New Password"), 0, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordChangeViewController passwordTextField](self, "passwordTextField");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAccessibilityLabel:", v13);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Enter a new password to use for your protected notes."), CFSTR("Enter a new password to use for your protected notes."), 0, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordChangeViewController passwordTextField](self, "passwordTextField");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAccessibilityHint:", v15);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Confirm Password"), CFSTR("Confirm Password"), 0, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordChangeViewController verifyTextField](self, "verifyTextField");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAccessibilityLabel:", v17);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Enter your new password again for confirmation."), CFSTR("Enter your new password again for confirmation."), 0, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordChangeViewController verifyTextField](self, "verifyTextField");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAccessibilityHint:", v19);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Password Hint"), CFSTR("Password Hint"), 0, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordChangeViewController hintTextField](self, "hintTextField");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAccessibilityLabel:", v21);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Enter a hint for your new password."), CFSTR("Enter a hint for your new password."), 0, 1);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  -[ICPasswordChangeViewController hintTextField](self, "hintTextField");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAccessibilityHint:", v24);

}

- (BOOL)isSetupForChangePassword
{
  return self->_isSetupForChangePassword;
}

- (void)setIsSetupForChangePassword:(BOOL)a3
{
  self->_isSetupForChangePassword = a3;
}

- (BOOL)didAuthenticateWithBiometrics
{
  return self->_didAuthenticateWithBiometrics;
}

- (void)setDidAuthenticateWithBiometrics:(BOOL)a3
{
  self->_didAuthenticateWithBiometrics = a3;
}

- (BOOL)isInSettings
{
  return self->_isInSettings;
}

- (void)setIsInSettings:(BOOL)a3
{
  self->_isInSettings = a3;
}

- (BOOL)isSettingInitialPassword
{
  return self->_isSettingInitialPassword;
}

- (void)setIsSettingInitialPassword:(BOOL)a3
{
  self->_isSettingInitialPassword = a3;
}

- (ICAccountPassphraseManager)passphraseManager
{
  return self->_passphraseManager;
}

- (void)setPassphraseManager:(id)a3
{
  objc_storeStrong((id *)&self->_passphraseManager, a3);
}

- (NSArray)textBackgroundViews
{
  return self->_textBackgroundViews;
}

- (void)setTextBackgroundViews:(id)a3
{
  objc_storeStrong((id *)&self->_textBackgroundViews, a3);
}

- (UIView)headerBackground
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_headerBackground);
}

- (void)setHeaderBackground:(id)a3
{
  objc_storeWeak((id *)&self->_headerBackground, a3);
}

- (ICScrollViewKeyboardResizer)scrollViewResizer
{
  return self->_scrollViewResizer;
}

- (void)setScrollViewResizer:(id)a3
{
  objc_storeStrong((id *)&self->_scrollViewResizer, a3);
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_scrollView);
}

- (void)setScrollView:(id)a3
{
  objc_storeWeak((id *)&self->_scrollView, a3);
}

- (ICPasswordUtilities)passwordUtilities
{
  return self->_passwordUtilities;
}

- (void)setPasswordUtilities:(id)a3
{
  objc_storeStrong((id *)&self->_passwordUtilities, a3);
}

- (UILabel)headerLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_headerLabel);
}

- (void)setHeaderLabel:(id)a3
{
  objc_storeWeak((id *)&self->_headerLabel, a3);
}

- (UILabel)oldPasswordLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_oldPasswordLabel);
}

- (void)setOldPasswordLabel:(id)a3
{
  objc_storeWeak((id *)&self->_oldPasswordLabel, a3);
}

- (UILabel)passwordLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_passwordLabel);
}

- (void)setPasswordLabel:(id)a3
{
  objc_storeWeak((id *)&self->_passwordLabel, a3);
}

- (UILabel)verifyLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_verifyLabel);
}

- (void)setVerifyLabel:(id)a3
{
  objc_storeWeak((id *)&self->_verifyLabel, a3);
}

- (UILabel)hintLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_hintLabel);
}

- (void)setHintLabel:(id)a3
{
  objc_storeWeak((id *)&self->_hintLabel, a3);
}

- (UILabel)warningLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_warningLabel);
}

- (void)setWarningLabel:(id)a3
{
  objc_storeWeak((id *)&self->_warningLabel, a3);
}

- (UITextField)oldPasswordTextField
{
  return (UITextField *)objc_loadWeakRetained((id *)&self->_oldPasswordTextField);
}

- (void)setOldPasswordTextField:(id)a3
{
  objc_storeWeak((id *)&self->_oldPasswordTextField, a3);
}

- (UITextField)passwordTextField
{
  return (UITextField *)objc_loadWeakRetained((id *)&self->_passwordTextField);
}

- (void)setPasswordTextField:(id)a3
{
  objc_storeWeak((id *)&self->_passwordTextField, a3);
}

- (UITextField)verifyTextField
{
  return (UITextField *)objc_loadWeakRetained((id *)&self->_verifyTextField);
}

- (void)setVerifyTextField:(id)a3
{
  objc_storeWeak((id *)&self->_verifyTextField, a3);
}

- (UITextField)hintTextField
{
  return (UITextField *)objc_loadWeakRetained((id *)&self->_hintTextField);
}

- (void)setHintTextField:(id)a3
{
  objc_storeWeak((id *)&self->_hintTextField, a3);
}

- (NSArray)orderedTextFields
{
  return self->_orderedTextFields;
}

- (void)setOrderedTextFields:(id)a3
{
  objc_storeStrong((id *)&self->_orderedTextFields, a3);
}

- (UIBarButtonItem)doneButton
{
  return (UIBarButtonItem *)objc_loadWeakRetained((id *)&self->_doneButton);
}

- (void)setDoneButton:(id)a3
{
  objc_storeWeak((id *)&self->_doneButton, a3);
}

- (UIBarButtonItem)cancelButton
{
  return (UIBarButtonItem *)objc_loadWeakRetained((id *)&self->_cancelButton);
}

- (void)setCancelButton:(id)a3
{
  objc_storeWeak((id *)&self->_cancelButton, a3);
}

- (NSLayoutConstraint)oldPasswordHeightConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_oldPasswordHeightConstraint);
}

- (void)setOldPasswordHeightConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_oldPasswordHeightConstraint, a3);
}

- (int64_t)incorrectPasswordAttempts
{
  return self->_incorrectPasswordAttempts;
}

- (void)setIncorrectPasswordAttempts:(int64_t)a3
{
  self->_incorrectPasswordAttempts = a3;
}

- (BOOL)didAttemptToSubmitWithoutHint
{
  return self->_didAttemptToSubmitWithoutHint;
}

- (void)setDidAttemptToSubmitWithoutHint:(BOOL)a3
{
  self->_didAttemptToSubmitWithoutHint = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1144);
}

- (BOOL)usingLargerAXSizes
{
  return self->_usingLargerAXSizes;
}

- (void)setUsingLargerAXSizes:(BOOL)a3
{
  self->_usingLargerAXSizes = a3;
}

- (NSArray)defaultConstraints
{
  return self->_defaultConstraints;
}

- (void)setDefaultConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_defaultConstraints, a3);
}

- (NSArray)alternateConstraintsForAXLargerTextSizes
{
  return self->_alternateConstraintsForAXLargerTextSizes;
}

- (void)setAlternateConstraintsForAXLargerTextSizes:(id)a3
{
  objc_storeStrong((id *)&self->_alternateConstraintsForAXLargerTextSizes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateConstraintsForAXLargerTextSizes, 0);
  objc_storeStrong((id *)&self->_defaultConstraints, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_oldPasswordHeightConstraint);
  objc_destroyWeak((id *)&self->_cancelButton);
  objc_destroyWeak((id *)&self->_doneButton);
  objc_storeStrong((id *)&self->_orderedTextFields, 0);
  objc_destroyWeak((id *)&self->_hintTextField);
  objc_destroyWeak((id *)&self->_verifyTextField);
  objc_destroyWeak((id *)&self->_passwordTextField);
  objc_destroyWeak((id *)&self->_oldPasswordTextField);
  objc_destroyWeak((id *)&self->_warningLabel);
  objc_destroyWeak((id *)&self->_hintLabel);
  objc_destroyWeak((id *)&self->_verifyLabel);
  objc_destroyWeak((id *)&self->_passwordLabel);
  objc_destroyWeak((id *)&self->_oldPasswordLabel);
  objc_destroyWeak((id *)&self->_headerLabel);
  objc_storeStrong((id *)&self->_passwordUtilities, 0);
  objc_destroyWeak((id *)&self->_scrollView);
  objc_storeStrong((id *)&self->_scrollViewResizer, 0);
  objc_destroyWeak((id *)&self->_headerBackground);
  objc_storeStrong((id *)&self->_textBackgroundViews, 0);
  objc_storeStrong((id *)&self->_passphraseManager, 0);
}

@end
