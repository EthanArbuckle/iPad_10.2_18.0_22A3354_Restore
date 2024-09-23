@implementation TVRAlertController

- (TVRAlertController)initWithKeyboardAttributes:(id)a3
{
  id v4;
  void *v5;
  TVRAlertController *v6;

  v4 = a3;
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TVRAlertController initWithTitle:keyboardAttributes:](self, "initWithTitle:keyboardAttributes:", v5, v4);

  return v6;
}

- (TVRAlertController)initWithTitle:(id)a3 keyboardAttributes:(id)a4
{
  id v7;
  id v8;
  void *v9;
  TVRAlertController *v10;

  objc_storeStrong((id *)&self->_keyboardAttributes, a4);
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "PINEntryAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[TVRAlertController initWithTitle:PINEntryAttributes:](self, "initWithTitle:PINEntryAttributes:", v8, v9);
  return v10;
}

- (TVRAlertController)initWithTitle:(id)a3 passcodeSize:(int64_t)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  TVRAlertController *v9;

  v6 = (objc_class *)MEMORY[0x24BEB40B0];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithDigitCount:", a4);
  v9 = -[TVRAlertController initWithTitle:PINEntryAttributes:](self, "initWithTitle:PINEntryAttributes:", v7, v8);

  return v9;
}

- (TVRAlertController)initWithTitle:(id)a3 PINEntryAttributes:(id)a4
{
  id v6;
  id v7;
  TVRAlertController *v8;
  TVRAlertController *v9;
  TVRAlertView *v10;
  id *p_alertView;
  TVRAlertView *alertView;
  TVRKeyboardView *v13;
  TVRKeyboardView *keyboardView;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)TVRAlertController;
  v8 = -[TVRAlertController initWithNibName:bundle:](&v16, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    -[TVRAlertController setModalPresentationStyle:](v8, "setModalPresentationStyle:", 4);
    -[TVRAlertController setTransitioningDelegate:](v9, "setTransitioningDelegate:", v9);
    -[TVRAlertController setTitle:](v9, "setTitle:", v6);
    -[TVRAlertController _observeKeyboardNotifications](v9, "_observeKeyboardNotifications");
    if (v7)
    {
      v9->_type = 0;
      v10 = objc_alloc_init(TVRAlertView);
      p_alertView = (id *)&v9->_alertView;
      alertView = v9->_alertView;
      v9->_alertView = v10;

      -[TVRAlertView setTitle:](v9->_alertView, "setTitle:", v6);
      -[TVRAlertView setPINEntryAttributes:](v9->_alertView, "setPINEntryAttributes:", v7);
    }
    else
    {
      v9->_type = 1;
      v13 = objc_alloc_init(TVRKeyboardView);
      p_alertView = (id *)&v9->_keyboardView;
      keyboardView = v9->_keyboardView;
      v9->_keyboardView = v13;

      -[TVRKeyboardView setTitle:](v9->_keyboardView, "setTitle:", v6);
      -[TVRKeyboardView setAttributes:](v9->_keyboardView, "setAttributes:", v9->_keyboardAttributes);
    }
    objc_msgSend(*p_alertView, "setDelegate:", v9);
  }

  return v9;
}

- (id)initForTextPasswordType:(id)a3
{
  id v4;
  TVRAlertController *v5;
  TVRAlertController *v6;
  uint64_t v7;
  TVRCKeyboardAttributes *keyboardAttributes;
  TVRKeyboardView *v9;
  TVRKeyboardView *keyboardView;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TVRAlertController;
  v5 = -[TVRAlertController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    -[TVRAlertController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 4);
    -[TVRAlertController setTransitioningDelegate:](v6, "setTransitioningDelegate:", v6);
    -[TVRAlertController setTitle:](v6, "setTitle:", v4);
    -[TVRAlertController _observeKeyboardNotifications](v6, "_observeKeyboardNotifications");
    v6->_type = 2;
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BEB40A8]), "_init");
    keyboardAttributes = v6->_keyboardAttributes;
    v6->_keyboardAttributes = (TVRCKeyboardAttributes *)v7;

    -[TVRCKeyboardAttributes _setSecure:](v6->_keyboardAttributes, "_setSecure:", 1);
    -[TVRCKeyboardAttributes _setAutocorrectionType:](v6->_keyboardAttributes, "_setAutocorrectionType:", 1);
    -[TVRCKeyboardAttributes _setAutocapitalizationType:](v6->_keyboardAttributes, "_setAutocapitalizationType:", 0);
    -[TVRCKeyboardAttributes _setEnablesReturnKeyAutomatically:](v6->_keyboardAttributes, "_setEnablesReturnKeyAutomatically:", 1);
    v9 = objc_alloc_init(TVRKeyboardView);
    keyboardView = v6->_keyboardView;
    v6->_keyboardView = v9;

    -[TVRKeyboardView setTitle:](v6->_keyboardView, "setTitle:", v4);
    -[TVRKeyboardView setAttributes:](v6->_keyboardView, "setAttributes:", v6->_keyboardAttributes);
    -[TVRKeyboardView setDelegate:](v6->_keyboardView, "setDelegate:", v6);
  }

  return v6;
}

- (TVRAlertController)initWithCoder:(id)a3
{
  void *v4;
  void *v5;
  TVRAlertController *v6;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIAlertTitle"), &stru_24DE30718, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TVRAlertController initWithTitle:passcodeSize:](self, "initWithTitle:passcodeSize:", v5, 4);

  return v6;
}

- (TVRAlertController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v5;
  void *v6;
  TVRAlertController *v7;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIAlertTitle"), &stru_24DE30718, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TVRAlertController initWithTitle:passcodeSize:](self, "initWithTitle:passcodeSize:", v6, 4);

  return v7;
}

- (void)enableDictationButton:(BOOL)a3
{
  -[TVRKeyboardView enableDictationButton:](self->_keyboardView, "enableDictationButton:", a3);
}

- (void)loadView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIView *v14;
  UIView *dimmingView;
  UIView *v16;
  void *v17;
  void *v18;
  void *alertView;
  id v20;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = *MEMORY[0x24BDBEFB0];
  v13 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", v5, v7, v9, v11);
  v14 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", v12, v13, v9, v11);
  dimmingView = self->_dimmingView;
  self->_dimmingView = v14;

  v16 = self->_dimmingView;
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v16, "setBackgroundColor:", v17);

  -[UIView setAutoresizingMask:](self->_dimmingView, "setAutoresizingMask:", 18);
  objc_msgSend(v20, "addSubview:", self->_dimmingView);
  if (self->_type - 1 <= 1)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel__cancel);
    objc_msgSend(v18, "setNumberOfTapsRequired:", 1);
    objc_msgSend(v18, "setNumberOfTouchesRequired:", 1);
    -[UIView addGestureRecognizer:](self->_dimmingView, "addGestureRecognizer:", v18);

  }
  alertView = self->_alertView;
  if (!alertView)
    alertView = self->_keyboardView;
  objc_msgSend(v20, "addSubview:", alertView);
  -[TVRAlertController setView:](self, "setView:", v20);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVRAlertController;
  -[TVRAlertController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[TVRAlertController _layoutForKeyboardFrame:](self, "_layoutForKeyboardFrame:", self->_previousKeyboardFrame.origin.x, self->_previousKeyboardFrame.origin.y, self->_previousKeyboardFrame.size.width, self->_previousKeyboardFrame.size.height);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TVRAlertController;
  -[TVRAlertController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[TVRAlertController _contentViewBasedOnType](self, "_contentViewBasedOnType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "becomeFirstResponder");

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  unint64_t v3;

  -[TVRAlertController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "userInterfaceIdiom") == 1)
    v3 = 30;
  else
    v3 = 2;

  return v3;
}

- (void)setText:(id)a3
{
  NSString *v5;

  v5 = (NSString *)a3;
  if (self->_text != v5)
  {
    objc_storeStrong((id *)&self->_text, a3);
    -[TVRKeyboardView setText:](self->_keyboardView, "setText:", v5);
    -[TVRAlertView setText:](self->_alertView, "setText:", v5);
  }

}

- (void)setKeyboardAttributes:(id)a3
{
  TVRCKeyboardAttributes *v5;

  v5 = (TVRCKeyboardAttributes *)a3;
  if (self->_keyboardAttributes != v5)
  {
    objc_storeStrong((id *)&self->_keyboardAttributes, a3);
    -[TVRKeyboardView setAttributes:](self->_keyboardView, "setAttributes:", v5);
  }

}

- (void)keyboardView:(id)a3 didUpdateText:(id)a4
{
  id WeakRetained;
  char v7;
  id v8;
  id v9;

  v9 = a4;
  objc_storeStrong((id *)&self->_text, a4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "alertController:enteredText:", self, v9);

  }
}

- (void)keyboardViewPressedDictationButton:(id)a3
{
  TVRAlertControllerDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "alertControllerPressedDictationButton:", self);

  }
}

- (void)keyboardViewReleasedDictationButton:(id)a3
{
  TVRAlertControllerDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "alertControllerReleasedDictationButton:", self);

  }
}

- (void)keyboardViewDidCancel:(id)a3
{
  TVRAlertControllerDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "alertControllerCancelled:", self);

  }
  -[TVRAlertController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)keyboardViewDidHitReturnKey:(id)a3
{
  TVRAlertControllerDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "alertControllerHitKeyboardReturnKey:", self);

  }
}

- (void)keyboardView:(id)a3 generatedTextInputPayload:(id)a4
{
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "alertController:generatedTextInputPayload:", self, v8);

  }
}

- (void)alertView:(id)a3 didUpdateText:(id)a4
{
  id WeakRetained;
  char v7;
  id v8;
  id v9;

  v9 = a4;
  objc_storeStrong((id *)&self->_text, a4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "alertController:enteredText:", self, v9);

  }
}

- (void)alertViewDidCancel:(id)a3
{
  TVRAlertControllerDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "alertControllerCancelled:", self);

  }
  -[TVRAlertController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6;
  id v7;
  TVRPresentationController *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[TVRPresentationController initWithPresentedViewController:presentingViewController:]([TVRPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v7, v6);

  return v8;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  _TVRMAlertControllerTransitioning *v6;
  void *v7;

  v6 = objc_alloc_init(_TVRMAlertControllerTransitioning);
  -[_TVRMAlertControllerTransitioning setIsPresentation:](v6, "setIsPresentation:", 1);
  -[TVRAlertController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[TVRAlertController _contentViewBasedOnType](self, "_contentViewBasedOnType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVRMAlertControllerTransitioning setContentView:](v6, "setContentView:", v7);

  -[_TVRMAlertControllerTransitioning setDimmingView:](v6, "setDimmingView:", self->_dimmingView);
  return v6;
}

- (id)animationControllerForDismissedController:(id)a3
{
  _TVRMAlertControllerTransitioning *v4;
  void *v5;

  v4 = objc_alloc_init(_TVRMAlertControllerTransitioning);
  -[_TVRMAlertControllerTransitioning setIsPresentation:](v4, "setIsPresentation:", 0);
  -[TVRAlertController _contentViewBasedOnType](self, "_contentViewBasedOnType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVRMAlertControllerTransitioning setContentView:](v4, "setContentView:", v5);

  -[_TVRMAlertControllerTransitioning setDimmingView:](v4, "setDimmingView:", self->_dimmingView);
  return v4;
}

- (void)_observeKeyboardNotifications
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__keyboardChanged_, *MEMORY[0x24BEBE580], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__keyboardChanged_, *MEMORY[0x24BEBE578], 0);

}

- (void)_keyboardChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  void *v25;
  void *v26;
  float v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  char v33;
  float v34;
  _QWORD v35[9];
  _QWORD v36[9];
  CGRect v37;
  CGRect v38;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", *MEMORY[0x24BEBE460]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGRectValue");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  objc_msgSend(v4, "userInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "valueForKey:", *MEMORY[0x24BEBE468]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "CGRectValue");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  objc_msgSend(v4, "userInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "valueForKey:", *MEMORY[0x24BEBE408]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "floatValue");
  v34 = v27;

  objc_msgSend(v4, "userInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "valueForKey:", *MEMORY[0x24BEBE400]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "integerValue");

  v37.origin.x = v8;
  v37.origin.y = v10;
  v37.size.width = v12;
  v37.size.height = v14;
  v38.origin.x = v18;
  v38.origin.y = v20;
  v38.size.width = v22;
  v38.size.height = v24;
  if (CGRectEqualToRect(v37, v38)
    || (-[TVRAlertController view](self, "view"),
        v31 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v31, "layer"),
        v32 = (void *)objc_claimAutoreleasedReturnValue(),
        v33 = objc_msgSend(v32, "needsLayout"),
        v32,
        v31,
        (v33 & 1) != 0))
  {
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __39__TVRAlertController__keyboardChanged___block_invoke_2;
    v35[3] = &unk_24DE2C340;
    v35[4] = self;
    *(CGFloat *)&v35[5] = v18;
    *(CGFloat *)&v35[6] = v20;
    *(CGFloat *)&v35[7] = v22;
    *(CGFloat *)&v35[8] = v24;
    objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v35);
  }
  else
  {
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __39__TVRAlertController__keyboardChanged___block_invoke;
    v36[3] = &unk_24DE2C340;
    v36[4] = self;
    *(CGFloat *)&v36[5] = v18;
    *(CGFloat *)&v36[6] = v20;
    *(CGFloat *)&v36[7] = v22;
    *(CGFloat *)&v36[8] = v24;
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", v30 << 16, v36, 0, v34, 0.0);
  }
  self->_previousKeyboardFrame.origin.x = v18;
  self->_previousKeyboardFrame.origin.y = v20;
  self->_previousKeyboardFrame.size.width = v22;
  self->_previousKeyboardFrame.size.height = v24;
}

uint64_t __39__TVRAlertController__keyboardChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutForKeyboardFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __39__TVRAlertController__keyboardChanged___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutForKeyboardFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_layoutForKeyboardFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat x;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat y;
  CGFloat width;
  double v25;
  double v26;
  id v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  height = a3.size.height;
  y = a3.origin.y;
  width = a3.size.width;
  x = a3.origin.x;
  -[TVRAlertController _contentViewBasedOnType](self, "_contentViewBasedOnType");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "sizeThatFits:", 270.0, 0.0);
  v7 = v6;
  v9 = v8;
  -[TVRAlertController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v25 = v9;
  v26 = v7;
  UIRectCenteredIntegralRect();
  v28.origin.x = v12;
  v28.origin.y = v14;
  v28.size.width = v16;
  v28.size.height = v18;
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  v29 = CGRectIntersection(v28, v32);
  v19 = v29.origin.x;
  v20 = v29.origin.y;
  v21 = v29.size.width;
  v22 = v29.size.height;
  if (!CGRectIsNull(v29))
  {
    v30.origin.x = v19;
    v30.origin.y = v20;
    v30.size.width = v21;
    v30.size.height = v22;
    if (!CGRectIsEmpty(v30))
    {
      v31.origin.x = v19;
      v31.origin.y = v20;
      v31.size.width = v21;
      v31.size.height = v22;
      CGRectGetHeight(v31);
      UIRectCenteredIntegralRect();
    }
  }
  UIRectGetCenter();
  objc_msgSend(v27, "setCenter:");
  objc_msgSend(v27, "setBounds:", 0.0, 0.0, v26, v25);

}

- (id)_contentViewBasedOnType
{
  int *v2;

  if (self->_type)
    v2 = &OBJC_IVAR___TVRAlertController__keyboardView;
  else
    v2 = &OBJC_IVAR___TVRAlertController__alertView;
  return *(id *)((char *)&self->super.super.super.isa + *v2);
}

- (void)_cancel
{
  TVRAlertControllerDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "alertControllerCancelled:", self);

  }
  -[TVRAlertController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSString)text
{
  return self->_text;
}

- (TVRCKeyboardAttributes)keyboardAttributes
{
  return self->_keyboardAttributes;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (TVRAlertControllerDelegate)delegate
{
  return (TVRAlertControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TVRAlertView)alertView
{
  return self->_alertView;
}

- (void)setAlertView:(id)a3
{
  objc_storeStrong((id *)&self->_alertView, a3);
}

- (TVRKeyboardView)keyboardView
{
  return self->_keyboardView;
}

- (void)setKeyboardView:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardView, a3);
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
  objc_storeStrong((id *)&self->_dimmingView, a3);
}

- (CGRect)previousKeyboardFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_previousKeyboardFrame.origin.x;
  y = self->_previousKeyboardFrame.origin.y;
  width = self->_previousKeyboardFrame.size.width;
  height = self->_previousKeyboardFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPreviousKeyboardFrame:(CGRect)a3
{
  self->_previousKeyboardFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_keyboardView, 0);
  objc_storeStrong((id *)&self->_alertView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_keyboardAttributes, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
