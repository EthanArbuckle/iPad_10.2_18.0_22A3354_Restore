@implementation UIKeyboardViewController

- (UIKeyboardViewController)init
{
  return -[UIKeyboardViewController initWithServiceRole:](self, "initWithServiceRole:", 0);
}

- (UIKeyboardViewController)initWithServiceRole:(unint64_t)a3
{
  UIKeyboardViewController *v5;
  UIKeyboardViewController *v6;
  UIKeyboard *v7;
  UIKeyboard *keyboard;
  UIKeyboard *v9;
  uint64_t v10;
  UIInputViewController *inputViewController;
  UISystemInputAssistantViewController *v12;
  UISystemInputAssistantViewController *systemInputAssistantViewController;
  void *v14;
  void *v15;
  objc_super v17;

  objc_msgSend((id)objc_opt_class(), "_verifyClient");
  v17.receiver = self;
  v17.super_class = (Class)UIKeyboardViewController;
  v5 = -[UIViewController initWithNibName:bundle:](&v17, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    v5->_serviceRole = a3;
    v7 = -[UIKeyboard initWithDefaultSize]([UIKeyboard alloc], "initWithDefaultSize");
    -[UIKeyboard setShouldUpdateLayoutAutomatically:](v7, "setShouldUpdateLayoutAutomatically:", 0);
    -[UIKeyboard setRequestedInteractionModel:](v7, "setRequestedInteractionModel:", 1);
    -[UIKeyboard setOrientation:](v7, "setOrientation:", +[UIKeyboardSceneDelegate interfaceOrientation](UIKeyboardSceneDelegate, "interfaceOrientation"));
    keyboard = v6->_keyboard;
    v6->_keyboard = v7;
    v9 = v7;

    +[UICompatibilityInputViewController inputViewControllerWithView:](UICompatibilityInputViewController, "inputViewControllerWithView:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    inputViewController = v6->_inputViewController;
    v6->_inputViewController = (UIInputViewController *)v10;

    v12 = objc_alloc_init(UISystemInputAssistantViewController);
    systemInputAssistantViewController = v6->_systemInputAssistantViewController;
    v6->_systemInputAssistantViewController = v12;

    -[UIViewController view](v6->_systemInputAssistantViewController, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIKeyboardViewController keyboard](v6, "keyboard");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "deactivate");

  }
  return v6;
}

- (void)loadView
{
  _UIKeyboardViewControllerView *v3;
  _UIKeyboardViewControllerView *v4;

  v3 = [_UIKeyboardViewControllerView alloc];
  v4 = -[UIView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[UIViewController setView:](self, "setView:", v4);

}

- (void)viewDidLoad
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
  void *v16;
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
  objc_super v27;
  _QWORD v28[5];

  v28[4] = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)UIKeyboardViewController;
  -[UIViewController viewDidLoad](&v27, sel_viewDidLoad);
  -[UIKeyboardViewController inputViewController](self, "inputViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController addChildViewController:](self, "addChildViewController:", v3);

  -[UIViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardViewController keyboard](self, "keyboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  -[UIKeyboardViewController inputViewController](self, "inputViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  +[UIColor clearColor](UIColor, "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  v19 = (void *)MEMORY[0x1E0D156E0];
  objc_msgSend(v7, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v23;
  objc_msgSend(v7, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v18;
  objc_msgSend(v7, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v12;
  objc_msgSend(v7, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "activateConstraints:", v17);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  UITextView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UISystemInputAssistantViewController *systemInputAssistantViewController;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)UIKeyboardViewController;
  -[UIViewController viewWillAppear:](&v14, sel_viewWillAppear_, a3);
  -[UIKeyboardViewController textInputView](self, "textInputView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc_init(UITextView);
    -[UIKeyboardViewController setTextInputView:](self, "setTextInputView:", v5);

  }
  +[UIKeyboard setServiceRole:](UIKeyboard, "setServiceRole:", -[UIKeyboardViewController serviceRole](self, "serviceRole"));
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardViewController textInputView](self, "textInputView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", v7);

  -[UIKeyboardViewController keyboard](self, "keyboard");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activate");

  -[UIKeyboardViewController keyboard](self, "keyboard");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "createPathEffectViewIfNecessary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_pathEffectView, v10);

  systemInputAssistantViewController = self->_systemInputAssistantViewController;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISystemInputAssistantViewController automaticallySetCenterViewControllerBasedOnInputDelegate:](systemInputAssistantViewController, "automaticallySetCenterViewControllerBasedOnInputDelegate:", v13);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardViewController;
  -[UIViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  if (_UIApplicationIsEmojiPoster())
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_layout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clearUnusedObjects:", 0);

  }
  +[UIKeyboard resetServiceRole](UIKeyboard, "resetServiceRole");
}

- (void)setShouldUpdateLayoutAutomatically:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_shouldUpdateLayoutAutomatically = a3;
  -[UIKeyboardViewController keyboard](self, "keyboard");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldUpdateLayoutAutomatically:", v3);

}

- (BOOL)resizable
{
  return +[UIKeyboard resizable](UIKeyboard, "resizable");
}

- (void)setResizable:(BOOL)a3
{
  +[UIKeyboard setResizable:](UIKeyboard, "setResizable:", a3);
}

- (UIView)inputAssistantView
{
  return -[UIViewController view](self->_systemInputAssistantViewController, "view");
}

- (UIViewController)inputAssistantViewController
{
  return (UIViewController *)self->_systemInputAssistantViewController;
}

- (UIKeyboardAutocorrectionController)autocorrectionController
{
  void *v2;
  void *v3;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "autocorrectionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIKeyboardAutocorrectionController *)v3;
}

- (void)didSelectPredictiveCandidate:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "acceptPredictiveInput:", v3);

}

- (void)shouldAcceptAutocorrection
{
  id v2;

  +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "acceptAutocorrectionWithCompletionHandler:", 0);

}

- (UIKeyInput)textInputView
{
  return self->_textInputView;
}

- (void)setTextInputView:(id)a3
{
  objc_storeStrong((id *)&self->_textInputView, a3);
}

- (UIView)pathEffectView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_pathEffectView);
}

- (BOOL)shouldUpdateLayoutAutomatically
{
  return self->_shouldUpdateLayoutAutomatically;
}

- (unint64_t)serviceRole
{
  return self->_serviceRole;
}

- (void)setServiceRole:(unint64_t)a3
{
  self->_serviceRole = a3;
}

- (UIKeyboard)keyboard
{
  return self->_keyboard;
}

- (void)setKeyboard:(id)a3
{
  objc_storeStrong((id *)&self->_keyboard, a3);
}

- (UIInputViewController)inputViewController
{
  return self->_inputViewController;
}

- (void)setInputViewController:(id)a3
{
  objc_storeStrong((id *)&self->_inputViewController, a3);
}

- (UISystemInputAssistantViewController)systemInputAssistantViewController
{
  return self->_systemInputAssistantViewController;
}

- (void)setSystemInputAssistantViewController:(id)a3
{
  objc_storeStrong((id *)&self->_systemInputAssistantViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemInputAssistantViewController, 0);
  objc_storeStrong((id *)&self->_inputViewController, 0);
  objc_storeStrong((id *)&self->_keyboard, 0);
  objc_destroyWeak((id *)&self->_pathEffectView);
  objc_storeStrong((id *)&self->_textInputView, 0);
}

@end
