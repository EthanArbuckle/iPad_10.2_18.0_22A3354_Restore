@implementation OBPasscodeViewController

- (void)setPasscodeInputView:(id)a3
{
  id v5;
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
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
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
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];

  v44[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[OBPasscodeViewController passcodeInputView](self, "passcodeInputView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_passcodeInputView, a3);
  objc_msgSend(v6, "setDelegate:", 0);
  objc_msgSend(v5, "setDelegate:", self);
  -[OBWelcomeController contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v5);

  -[OBPasscodeViewController presentingViewController](self, "presentingViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (objc_msgSend(v6, "isFirstResponder"))
    {
      v9 = (void *)MEMORY[0x1E0DC3F10];
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __49__OBPasscodeViewController_setPasscodeInputView___block_invoke;
      v42[3] = &unk_1E37AA900;
      v43 = v5;
      objc_msgSend(v9, "performWithoutAnimation:", v42);

    }
    else
    {
      objc_msgSend(v5, "becomeFirstResponder");
    }
  }
  objc_msgSend(v6, "removeFromSuperview");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leadingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", 1);

    objc_msgSend(v5, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController contentView](self, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:", 1);

  }
  v41 = v6;
  -[OBPasscodeViewController _verticalPaddingForInputView](self, "_verticalPaddingForInputView");
  v19 = v18;
  objc_msgSend(v5, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[OBWelcomeController contentView](self, "contentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, v19);
  v27 = objc_claimAutoreleasedReturnValue();

  -[OBPasscodeViewController contentViewTopConstraint](self, "contentViewTopConstraint");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[OBPasscodeViewController contentViewTopConstraint](self, "contentViewTopConstraint");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constant");
    objc_msgSend(v23, "setConstant:");

  }
  -[OBPasscodeViewController setContentViewTopConstraint:](self, "setContentViewTopConstraint:", v23);
  -[OBPasscodeViewController setContentViewBottomConstraint:](self, "setContentViewBottomConstraint:", v27);
  v30 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v5, "centerXAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController contentView](self, "contentView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "centerXAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v34;
  -[OBPasscodeViewController contentViewTopConstraint](self, "contentViewTopConstraint");
  v40 = v23;
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v35;
  -[OBPasscodeViewController contentViewBottomConstraint](self, "contentViewBottomConstraint");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 3);
  v37 = v5;
  v38 = (void *)v27;
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "activateConstraints:", v39);

}

uint64_t __49__OBPasscodeViewController_setPasscodeInputView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "becomeFirstResponder");
}

- (void)configureForPasscodeEntry:(unint64_t)a3 length:(int64_t)a4
{
  OBSimplePasscodeInputView *v7;
  OBComplexPasscodeInputView *v8;
  OBSimplePasscodeInputView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  OBSimplePasscodeInputView *v16;
  OBSimplePasscodeInputView *v17;

  if (a3 == 1)
    goto LABEL_5;
  if (!a3)
  {
    if (a4 >= 1)
    {
      v7 = [OBSimplePasscodeInputView alloc];
      v16 = -[OBSimplePasscodeInputView initWithFrame:numberOfEntryFields:](v7, "initWithFrame:numberOfEntryFields:", a4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[OBSimplePasscodeInputView setLimitCharactersToNumbers:](v16, "setLimitCharactersToNumbers:", 0);
LABEL_6:
      v9 = v16;
      goto LABEL_8;
    }
LABEL_5:
    v8 = [OBComplexPasscodeInputView alloc];
    v16 = -[OBComplexPasscodeInputView initWithFrame:numericOnly:](v8, "initWithFrame:numericOnly:", a3 == 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[OBPasscodeViewController setRequiresCompletion:](self, "setRequiresCompletion:", 1);
    goto LABEL_6;
  }
  v9 = 0;
LABEL_8:
  v17 = v9;
  -[OBSimplePasscodeInputView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[OBPasscodeViewController setPasscodeInputView:](self, "setPasscodeInputView:", v17);
  if (-[OBPasscodeViewController requiresCompletion](self, "requiresCompletion"))
  {
    -[OBPasscodeViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "completionButtonTitleForPasscodeViewController:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v11, 2, self, sel__completionTapped_);
    -[OBBaseWelcomeController navigationItem](self, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRightBarButtonItem:", v12);

    -[OBPasscodeViewController passcodeInputView](self, "passcodeInputView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "passcode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPasscodeViewController _updateCompletionButtonEnabledStateForPasscode:](self, "_updateCompletionButtonEnabledStateForPasscode:", v15);

  }
  else
  {
    -[OBBaseWelcomeController navigationItem](self, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRightBarButtonItem:", 0);
  }

}

- (void)clearPasscodeEntry
{
  id v2;

  -[OBPasscodeViewController passcodeInputView](self, "passcodeInputView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPasscode:", &stru_1E37AB0D0);

}

- (void)shakePasscodeEntry
{
  id v2;

  -[OBPasscodeViewController passcodeInputView](self, "passcodeInputView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shake");

}

- (void)loadView
{
  objc_super v3;

  -[OBWelcomeController setIncludePaddingAboveContentView:](self, "setIncludePaddingAboveContentView:", 0);
  v3.receiver = self;
  v3.super_class = (Class)OBPasscodeViewController;
  -[OBWelcomeController loadView](&v3, sel_loadView);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OBPasscodeViewController;
  -[OBBaseWelcomeController viewDidLoad](&v3, sel_viewDidLoad);
  -[OBWelcomeController setShouldAdjustScrollViewInsetForKeyboard:](self, "setShouldAdjustScrollViewInsetForKeyboard:", 1);
  -[OBWelcomeController setShouldAdjustButtonTrayForKeyboard:](self, "setShouldAdjustButtonTrayForKeyboard:", 1);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OBPasscodeViewController;
  -[OBWelcomeController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  -[OBPasscodeViewController presentedViewController](self, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[OBPasscodeViewController passcodeInputView](self, "passcodeInputView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "becomeFirstResponder");

  }
  -[OBPasscodeViewController passcodeInputView](self, "passcodeInputView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "passcode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBPasscodeViewController _updateCompletionButtonEnabledStateForPasscode:](self, "_updateCompletionButtonEnabledStateForPasscode:", v7);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OBPasscodeViewController;
  -[OBWelcomeController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[OBPasscodeViewController passcodeInputView](self, "passcodeInputView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resignFirstResponder");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OBPasscodeViewController;
  -[OBWelcomeController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[OBPasscodeViewController passcodeInputView](self, "passcodeInputView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resignFirstResponder");

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)OBPasscodeViewController;
  v7 = a4;
  -[OBWelcomeController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__OBPasscodeViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E37AAC20;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

void __79__OBPasscodeViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_verticalPaddingForInputView");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "contentViewTopConstraint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstant:", v3);

  objc_msgSend(*(id *)(a1 + 32), "contentViewBottomConstraint");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", v3);

}

- (void)_completionTapped:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[OBPasscodeViewController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[OBPasscodeViewController passcodeInputView](self, "passcodeInputView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "passcode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "passcodeViewController:didEnterPasscode:", self, v5);

}

- (void)_updateCompletionButtonEnabledStateForPasscode:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[OBPasscodeViewController requiresCompletion](self, "requiresCompletion"))
  {
    -[OBPasscodeViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "passcodeViewController:shouldEnableCompletionButtonForPasscode:", self, v9);

    -[OBBaseWelcomeController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rightBarButtonItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnabled:", v5);

    objc_msgSend(MEMORY[0x1E0DC3938], "activeKeyboard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setReturnKeyEnabled:", v5);

  }
}

- (double)_verticalPaddingForInputView
{
  void *v2;
  uint64_t v3;
  double result;
  void *v5;
  uint64_t v6;

  +[OBDevice currentDevice](OBDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  result = 20.0;
  if (v3 != 2)
  {
    +[OBDevice currentDevice](OBDevice, "currentDevice", 20.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "templateType");

    if ((unint64_t)(v6 - 5) > 5)
      return 37.0;
    else
      return dbl_19A01F3E0[v6 - 5];
  }
  return result;
}

- (void)passcodeInput:(id)a3 willChangeContents:(id)a4
{
  -[OBPasscodeViewController _updateCompletionButtonEnabledStateForPasscode:](self, "_updateCompletionButtonEnabledStateForPasscode:", a4);
}

- (void)passcodeInput:(id)a3 enteredPasscode:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[OBPasscodeViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "passcodeViewController:didEnterPasscode:", self, v5);

}

- (OBPasscodeViewControllerDelegate)delegate
{
  return (OBPasscodeViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OBPasscodeInputView)passcodeInputView
{
  return self->_passcodeInputView;
}

- (NSLayoutConstraint)contentViewTopConstraint
{
  return self->_contentViewTopConstraint;
}

- (void)setContentViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewTopConstraint, a3);
}

- (NSLayoutConstraint)contentViewBottomConstraint
{
  return self->_contentViewBottomConstraint;
}

- (void)setContentViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, a3);
}

- (BOOL)requiresCompletion
{
  return self->_requiresCompletion;
}

- (void)setRequiresCompletion:(BOOL)a3
{
  self->_requiresCompletion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_passcodeInputView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
