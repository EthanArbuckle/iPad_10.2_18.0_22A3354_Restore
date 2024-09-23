@implementation NCNotificationTextInputView

- (NCNotificationTextInputView)initWithFrame:(CGRect)a3
{
  NCNotificationTextInputView *v3;
  void *v4;
  void *v5;
  NSString *v6;
  BOOL IsAccessibilityCategory;
  double v8;
  void *v9;
  double v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  UITextView *textView;
  UITextView *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  UITextView *v23;
  void *v24;
  uint64_t v25;
  UIButton *button;
  double v27;
  void *v28;
  void *v29;
  UIButton *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  UIStackView *horizontalStack;
  uint64_t v35;
  UIScribbleInteraction *scribbleInteraction;
  void *v37;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)NCNotificationTextInputView;
  v3 = -[NCNotificationTextInputView initWithFrame:](&v39, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationTextInputView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[NCNotificationTextInputView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[NCNotificationTextInputView traitCollection](v3, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

    v8 = 1.0;
    if (!IsAccessibilityCategory)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "scale");
      v8 = v10;

    }
    v11 = objc_alloc(MEMORY[0x1E0DC3E50]);
    v12 = *MEMORY[0x1E0C9D648];
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v16 = objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E0C9D648], v13, v14, v15);
    textView = v3->_textView;
    v3->_textView = (UITextView *)v16;

    -[UITextView setAcceptsEmoji:](v3->_textView, "setAcceptsEmoji:", 1);
    -[UITextView setAutoresizingMask:](v3->_textView, "setAutoresizingMask:", 18);
    -[UITextView setDelegate:](v3->_textView, "setDelegate:", v3);
    v18 = v3->_textView;
    v19 = *MEMORY[0x1E0DC4A88];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v18, "setFont:", v20);

    -[UITextView setTextContainerInset:](v3->_textView, "setTextContainerInset:", 8.0, 0.0, 8.0, 0.0);
    -[UITextView layer](v3->_textView, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBorderWidth:", 1.0 / v8);

    -[UITextView layer](v3->_textView, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setCornerRadius:", 5.0);

    objc_opt_class();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v23 = v3->_textView;
      objc_msgSend(MEMORY[0x1E0DC3658], "_textFieldBackgroundColor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView setBackgroundColor:](v23, "setBackgroundColor:", v24);

    }
    -[NCNotificationTextInputView addSubview:](v3, "addSubview:", v3->_textView);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v25 = objc_claimAutoreleasedReturnValue();
    button = v3->_button;
    v3->_button = (UIButton *)v25;

    LODWORD(v27) = 1148846080;
    -[UIButton setContentHuggingPriority:forAxis:](v3->_button, "setContentHuggingPriority:forAxis:", 0, v27);
    -[UIButton titleLabel](v3->_button, "titleLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "bsui_preferredFontForTextStyle:hiFontStyle:", v19, 4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setFont:", v29);

    v30 = v3->_button;
    NCUserNotificationsUIKitFrameworkBundle();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("QUICK_REPLY_SEND_BUTTON_TITLE"), &stru_1E8D21F60, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v30, "setTitle:forState:", v32, 0);

    -[UIButton addTarget:action:forControlEvents:](v3->_button, "addTarget:action:forControlEvents:", v3, sel__buttonPressed_, 64);
    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA8]), "initWithFrame:", v12, v13, v14, v15);
    horizontalStack = v3->_horizontalStack;
    v3->_horizontalStack = (UIStackView *)v33;

    -[UIStackView addArrangedSubview:](v3->_horizontalStack, "addArrangedSubview:", v3->_textView);
    -[UIStackView addArrangedSubview:](v3->_horizontalStack, "addArrangedSubview:", v3->_button);
    -[UIStackView setDistribution:](v3->_horizontalStack, "setDistribution:", 0);
    -[UIStackView setAxis:](v3->_horizontalStack, "setAxis:", 0);
    -[UIStackView setSpacing:](v3->_horizontalStack, "setSpacing:", 8.0);
    -[NCNotificationTextInputView addSubview:](v3, "addSubview:", v3->_horizontalStack);
    v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C08]), "initWithDelegate:", v3);
    scribbleInteraction = v3->_scribbleInteraction;
    v3->_scribbleInteraction = (UIScribbleInteraction *)v35;

    -[NCNotificationTextInputView textView](v3, "textView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addInteraction:", v3->_scribbleInteraction);

    -[NCNotificationTextInputView _updateForTextChange](v3, "_updateForTextChange");
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[NCNotificationTextInputView directionalLayoutMargins](self, "directionalLayoutMargins");
  v4 = v3;
  v5 = *MEMORY[0x1E0DC55F0];
  -[NCNotificationTextInputView _textViewHeight](self, "_textViewHeight");
  v7 = v6;
  -[NCNotificationTextInputView _maximumTextViewHeight](self, "_maximumTextViewHeight");
  if (v7 < v8)
    v8 = v7;
  v9 = v4 + v8 + 12.0;
  v10 = v5;
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationTextInputView;
  -[NCNotificationTextInputView safeAreaInsetsDidChange](&v3, sel_safeAreaInsetsDidChange);
  -[NCNotificationTextInputView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIStackView *horizontalStack;
  CGFloat v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;

  v19.receiver = self;
  v19.super_class = (Class)NCNotificationTextInputView;
  -[NCNotificationTextInputView layoutSubviews](&v19, sel_layoutSubviews);
  -[NCNotificationTextInputView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[NCNotificationTextInputView directionalLayoutMargins](self, "directionalLayoutMargins");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  horizontalStack = self->_horizontalStack;
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  v18 = CGRectGetWidth(v20) - v12 - v16;
  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  -[UIStackView setFrame:](horizontalStack, "setFrame:", v12, 6.0, v18, CGRectGetHeight(v21) + -12.0 - v14);
}

- (void)setAction:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NCNotificationAction *v9;

  v9 = (NCNotificationAction *)a3;
  if (self->_action != v9)
  {
    objc_storeStrong((id *)&self->_action, a3);
    -[NCNotificationAction behaviorParameters](v9, "behaviorParameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CEC7D0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[NCNotificationTextInputView setButtonTitle:](self, "setButtonTitle:", v6);
    -[NCNotificationAction behaviorParameters](v9, "behaviorParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CEC7D8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[NCNotificationTextInputView setPlaceholder:](self, "setPlaceholder:", v8);
  }

}

- (void)setButtonTitle:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = objc_msgSend(v9, "length");
  -[NCNotificationTextInputView button](self, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "setTitle:forState:", v9, 0);
  }
  else
  {
    NCUserNotificationsUIKitFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("QUICK_REPLY_SEND_BUTTON_TITLE"), &stru_1E8D21F60, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:forState:", v8, 0);

  }
}

- (void)setPlaceholder:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3498], "nc_safeAttributedStringWithString:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NCNotificationTextInputView textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttributedPlaceholder:", v5);

}

- (void)setInputContextHistory:(id)a3
{
  UIInputContextHistory *v5;

  v5 = (UIInputContextHistory *)a3;
  if (self->_inputContextHistory != v5)
  {
    objc_storeStrong((id *)&self->_inputContextHistory, a3);
    -[UITextView setInputContextHistory:](self->_textView, "setInputContextHistory:", v5);
  }

}

- (BOOL)canBecomeFirstResponder
{
  void *v2;
  char v3;

  -[NCNotificationTextInputView textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canBecomeFirstResponder");

  return v3;
}

- (BOOL)becomeFirstResponder
{
  void *v2;
  char v3;

  -[NCNotificationTextInputView textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "becomeFirstResponder");

  return v3;
}

- (BOOL)canResignFirstResponder
{
  void *v2;
  char v3;

  -[NCNotificationTextInputView textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canResignFirstResponder");

  return v3;
}

- (BOOL)resignFirstResponder
{
  char v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCNotificationTextInputView;
  if (-[NCNotificationTextInputView resignFirstResponder](&v6, sel_resignFirstResponder))
    return 1;
  -[NCNotificationTextInputView textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "resignFirstResponder");

  return v3;
}

- (BOOL)isFirstResponder
{
  void *v2;
  char v3;

  -[NCNotificationTextInputView textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFirstResponder");

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NCNotificationTextInputView;
  v4 = a3;
  -[NCNotificationTextInputView traitCollectionDidChange:](&v11, sel_traitCollectionDidChange_, v4);
  -[NCNotificationTextInputView traitCollection](self, "traitCollection", v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
  {
    -[UITextView layer](self->_textView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "_textFieldBorderColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resolvedColorWithTraitCollection:", v5);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v8, "setBorderColor:", objc_msgSend(v10, "CGColor"));

  }
}

- (double)_textViewWidth
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double result;
  CGRect v11;

  -[NCNotificationTextInputView button](self, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v5 = v4;

  -[NCNotificationTextInputView directionalLayoutMargins](self, "directionalLayoutMargins");
  v7 = v6;
  v9 = v8;
  -[NCNotificationTextInputView bounds](self, "bounds");
  result = CGRectGetWidth(v11) + -24.0 - v7 - v9 - v5;
  if (result < 0.0)
    return 0.0;
  return result;
}

- (double)_textViewHeight
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double result;

  -[NCNotificationTextInputView button](self, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v5 = v4;

  -[NCNotificationTextInputView textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationTextInputView _textViewWidth](self, "_textViewWidth");
  objc_msgSend(v6, "sizeThatFits:");
  v8 = v7;

  if (objc_msgSend(MEMORY[0x1E0DC3C08], "isPencilInputExpected"))
  {
    -[NCNotificationTextInputView _pencilModeHeight](self, "_pencilModeHeight");
  }
  else if (v5 >= v8)
  {
    return v5;
  }
  else
  {
    return v8;
  }
  return result;
}

- (double)_maximumTextViewHeight
{
  void *v2;
  double v3;
  double v4;

  -[UITextView font](self->_textView, "font");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lineHeight");
  v4 = v3 * 4.0;

  return v4;
}

- (double)_pencilModeHeight
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  -[UITextView font](self->_textView, "font");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lineHeight");
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0DC3C08], "_recommendedBlankSpaceHeight");
  v6 = v4 + v5;

  return v6;
}

- (void)_buttonPressed:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0DC3938], "activeKeyboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__NCNotificationTextInputView__buttonPressed___block_invoke;
  v6[3] = &unk_1E8D1D568;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  objc_msgSend(v5, "acceptAutocorrectionWithCompletionHandler:", v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __46__NCNotificationTextInputView__buttonPressed___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(WeakRetained, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained, "action");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationTextInputView:didConfirmText:forAction:", v5, v3, v6);

    objc_msgSend(WeakRetained, "textView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", 0);

  }
}

- (void)_updateForTextChange
{
  void *v3;
  _BOOL8 v4;
  double v5;
  double v6;
  double v7;

  -[NCNotificationTextInputView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[UITextView text](self->_textView, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") != 0;

  -[UIButton setEnabled:](self->_button, "setEnabled:", v4);
  -[NCNotificationTextInputView _textViewHeight](self, "_textViewHeight");
  v6 = v5;
  -[NCNotificationTextInputView _maximumTextViewHeight](self, "_maximumTextViewHeight");
  -[UITextView setScrollEnabled:](self->_textView, "setScrollEnabled:", v6 >= v7);
}

- (NCNotificationTextInputViewDelegate)delegate
{
  return (NCNotificationTextInputViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NCNotificationAction)action
{
  return self->_action;
}

- (UIInputContextHistory)inputContextHistory
{
  return self->_inputContextHistory;
}

- (UIStackView)horizontalStack
{
  return self->_horizontalStack;
}

- (void)setHorizontalStack:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalStack, a3);
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (UIScribbleInteraction)scribbleInteraction
{
  return self->_scribbleInteraction;
}

- (void)setScribbleInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_scribbleInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scribbleInteraction, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_horizontalStack, 0);
  objc_storeStrong((id *)&self->_inputContextHistory, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
