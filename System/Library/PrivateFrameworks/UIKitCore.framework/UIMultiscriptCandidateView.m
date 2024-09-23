@implementation UIMultiscriptCandidateView

- (UIMultiscriptCandidateView)init
{
  UIMultiscriptCandidateView *v2;
  UIMultiscriptCandidateView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIMultiscriptCandidateView;
  v2 = -[UIView init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UIStackView setLayoutMarginsRelativeArrangement:](v2, "setLayoutMarginsRelativeArrangement:", 0);
    -[UIView setSemanticContentAttribute:](v3, "setSemanticContentAttribute:", 3);
  }
  return v3;
}

- (void)reloadArrangedSubviews:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  _BOOL4 v16;
  _BOOL4 v17;
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
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v34 = a3;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentInputMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "multiscriptSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "multiscriptIndex");
  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {
    v9 = 0;
    if (v7)
    {
      v10 = 0;
      v8 = 0;
      goto LABEL_17;
    }
    v8 = 0;
    goto LABEL_13;
  }
  if (v7 == 1)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
LABEL_11:
    v10 = 0;
    goto LABEL_17;
  }
  if (v7)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") < 3)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_13:
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textInputTraits");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isSecureTextEntry") & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "textInputTraits");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v14, "keyboardType") == 1;

  }
LABEL_17:
  v15 = -[UIMultiscriptCandidateView requiresAlternativeCandidatesButton](self, "requiresAlternativeCandidatesButton");
  v16 = v15;
  if (v8)
    v17 = v15;
  else
    v17 = 0;
  -[UIMultiscriptCandidateView leadingButton](self, "leadingButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView removeArrangedSubview:](self, "removeArrangedSubview:", v18);

  -[UIMultiscriptCandidateView leadingButton](self, "leadingButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "removeFromSuperview");

  -[UIMultiscriptCandidateView trailingButton](self, "trailingButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView removeArrangedSubview:](self, "removeArrangedSubview:", v20);

  -[UIMultiscriptCandidateView trailingButton](self, "trailingButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "removeFromSuperview");

  -[UIMultiscriptCandidateView alternativeCandidatesButton](self, "alternativeCandidatesButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView removeArrangedSubview:](self, "removeArrangedSubview:", v22);

  -[UIMultiscriptCandidateView alternativeCandidatesButton](self, "alternativeCandidatesButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "removeFromSuperview");

  -[UIStackView removeArrangedSubview:](self, "removeArrangedSubview:", v34);
  if (!v10)
  {
    if (v9)
    {
      _GetButtonForInputMode(v9, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIMultiscriptCandidateView setLeadingButton:](self, "setLeadingButton:", v24);

      -[UIMultiscriptCandidateView leadingButton](self, "leadingButton");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIStackView addArrangedSubview:](self, "addArrangedSubview:", v25);

    }
    else if (v17)
    {
      -[UIMultiscriptCandidateView alternativeCandidateAction](self, "alternativeCandidateAction");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      _GetAlternativeCandidatesButton(v26, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIMultiscriptCandidateView setAlternativeCandidatesButton:](self, "setAlternativeCandidatesButton:", v27);

      -[UIMultiscriptCandidateView alternativeCandidatesButton](self, "alternativeCandidatesButton");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIStackView addArrangedSubview:](self, "addArrangedSubview:", v28);

      -[UIStackView addArrangedSubview:](self, "addArrangedSubview:", v34);
      goto LABEL_27;
    }
    -[UIStackView addArrangedSubview:](self, "addArrangedSubview:", v34);
    if (!v8)
    {
      if (!v16)
        goto LABEL_29;
      -[UIMultiscriptCandidateView alternativeCandidateAction](self, "alternativeCandidateAction");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      _GetAlternativeCandidatesButton(v32, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIMultiscriptCandidateView setAlternativeCandidatesButton:](self, "setAlternativeCandidatesButton:", v33);

      -[UIMultiscriptCandidateView alternativeCandidatesButton](self, "alternativeCandidatesButton");
      v30 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }
LABEL_27:
    _GetButtonForInputMode(v8, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIMultiscriptCandidateView setTrailingButton:](self, "setTrailingButton:", v29);

    -[UIMultiscriptCandidateView trailingButton](self, "trailingButton");
    v30 = objc_claimAutoreleasedReturnValue();
LABEL_28:
    v31 = (void *)v30;
    -[UIStackView addArrangedSubview:](self, "addArrangedSubview:", v30);

    goto LABEL_29;
  }
  -[UIStackView addArrangedSubview:](self, "addArrangedSubview:", v34);
LABEL_29:

}

- (BOOL)requiresAlternativeCandidatesButton
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v7;

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentInputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "multiscriptSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "multiscriptIndex");
  v7 = (unint64_t)objc_msgSend(v4, "count") < 2 || v5 != 0;

  return v7;
}

- (UIAction)alternativeCandidateAction
{
  return self->_alternativeCandidateAction;
}

- (void)setAlternativeCandidateAction:(id)a3
{
  objc_storeStrong((id *)&self->_alternativeCandidateAction, a3);
}

- (UIButton)leadingButton
{
  return self->_leadingButton;
}

- (void)setLeadingButton:(id)a3
{
  objc_storeStrong((id *)&self->_leadingButton, a3);
}

- (UIButton)trailingButton
{
  return self->_trailingButton;
}

- (void)setTrailingButton:(id)a3
{
  objc_storeStrong((id *)&self->_trailingButton, a3);
}

- (UIAlternativeCandidatesButton)alternativeCandidatesButton
{
  return self->_alternativeCandidatesButton;
}

- (void)setAlternativeCandidatesButton:(id)a3
{
  objc_storeStrong((id *)&self->_alternativeCandidatesButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeCandidatesButton, 0);
  objc_storeStrong((id *)&self->_trailingButton, 0);
  objc_storeStrong((id *)&self->_leadingButton, 0);
  objc_storeStrong((id *)&self->_alternativeCandidateAction, 0);
}

@end
