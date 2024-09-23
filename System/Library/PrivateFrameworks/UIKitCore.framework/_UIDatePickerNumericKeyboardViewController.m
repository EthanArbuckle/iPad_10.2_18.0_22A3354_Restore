@implementation _UIDatePickerNumericKeyboardViewController

- (_UIDatePickerNumericKeyboardViewController)init
{
  _UIDatePickerNumericKeyboardViewController *v2;
  _UIDatePickerNumericKeyboardViewController *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIDatePickerNumericKeyboardViewController;
  v2 = -[UIViewController init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UIViewController setModalPresentationStyle:](v2, "setModalPresentationStyle:", 7);
    -[UIViewController popoverPresentationController](v3, "popoverPresentationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setIgnoresKeyboardNotifications:", 1);

  }
  return v3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  UIKeyboard *v3;
  UIKeyboard *v4;
  UIKeyboard *keyboard;
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
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;
  _QWORD v26[2];
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)_UIDatePickerNumericKeyboardViewController;
  -[UIViewController viewDidLoad](&v25, sel_viewDidLoad);
  v3 = [UIKeyboard alloc];
  v4 = -[UIKeyboard initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  keyboard = self->_keyboard;
  self->_keyboard = v4;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_keyboard, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", self->_keyboard);

  -[UIViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeAreaLayoutGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0D156E0];
  -[UIView topAnchor](self->_keyboard, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v22;
  -[UIView leadingAnchor](self->_keyboard, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v9;
  -[UIView trailingAnchor](self->_keyboard, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v12;
  -[UIView bottomAnchor](self->_keyboard, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "activateConstraints:", v16);

  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[UIViewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v17, sel__updateKeyboardRenderConfiguration);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_UIDatePickerNumericKeyboardViewController;
  -[UIViewController viewWillAppear:](&v16, sel_viewWillAppear_, a3);
  -[_UIDatePickerNumericKeyboardViewController keyboard](self, "keyboard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateLayout");

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[UIKBScreenTraits traitsForPopoverEmulatingWidth:minorEdge:orientation:idiom:](UIKBScreenTraits, "traitsForPopoverEmulatingWidth:minorEdge:orientation:idiom:", 1, 1, 0, 320.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "keyboardName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardLayoutStar keyboardWithName:screenTraits:](UIKeyboardLayoutStar, "keyboardWithName:screenTraits:", v12, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "frame");
    v8 = v14;
    v10 = v15 + 17.0;

  }
  -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:", v8, v10);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDatePickerNumericKeyboardViewController;
  -[UIViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[_UIDatePickerNumericKeyboardViewController keyboard](self, "keyboard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deactivate");

}

- (void)_updateKeyboardRenderConfiguration
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = +[UITextInputTraits configuredAppearanceForAppearance:withTraitEnvironment:](UITextInputTraits, "configuredAppearanceForAppearance:withTraitEnvironment:", 0, self);
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentInputMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderConfig configForAppearance:inputMode:traitEnvironment:](UIKBRenderConfig, "configForAppearance:inputMode:traitEnvironment:", v3, v5, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIDatePickerNumericKeyboardViewController keyboard](self, "keyboard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setRenderConfig:", v8);

  -[UIViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsLayout");

}

- (UIKeyboard)keyboard
{
  return self->_keyboard;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboard, 0);
}

@end
