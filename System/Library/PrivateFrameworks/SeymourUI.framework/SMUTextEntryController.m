@implementation SMUTextEntryController

- (SMUTextEntryController)initWithNibName:(id)a3 bundle:(id)a4
{
  SMUTextEntryController *v4;
  SMUTextEntryController *v5;
  NSString *title;
  NSString *doneText;
  SMUTextEntryTextField *v8;
  uint64_t v9;
  SMUTextEntryTextField *textField;
  SMUTextEntryTextField *v11;
  void *v12;
  UILabel *v13;
  UILabel *titleLabel;
  UILabel *v15;
  void *v16;
  UILabel *v17;
  UILabel *messageLabel;
  UILabel *v19;
  void *v20;
  uint64_t v21;
  UIButton *doneButton;
  void *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)SMUTextEntryController;
  v4 = -[SMUTextEntryController initWithNibName:bundle:](&v25, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    title = v4->_title;
    v4->_title = (NSString *)&stru_24F5DAFF0;

    doneText = v5->_doneText;
    v5->_doneText = (NSString *)&stru_24F5DAFF0;

    v8 = [SMUTextEntryTextField alloc];
    v9 = -[SMUTextEntryTextField initWithFrame:](v8, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    textField = v5->_textField;
    v5->_textField = (SMUTextEntryTextField *)v9;

    -[SMUTextEntryTextField _setBlurEnabled:](v5->_textField, "_setBlurEnabled:", 0);
    v11 = v5->_textField;
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE250]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMUTextEntryTextField setFont:](v11, "setFont:", v12);

    v13 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v13;

    v15 = v5->_titleLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE248]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v15, "setFont:", v16);

    v17 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    messageLabel = v5->_messageLabel;
    v5->_messageLabel = v17;

    v19 = v5->_messageLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v19, "setFont:", v20);

    -[UILabel setNumberOfLines:](v5->_messageLabel, "setNumberOfLines:", 2);
    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
    v21 = objc_claimAutoreleasedReturnValue();
    doneButton = v5->_doneButton;
    v5->_doneButton = (UIButton *)v21;

    -[UIButton addTarget:action:forControlEvents:](v5->_doneButton, "addTarget:action:forControlEvents:", v5, sel__doneButtonPressed_, 0x2000);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v5, sel_textFieldDidChange_, *MEMORY[0x24BEBE868], v5->_textField);

  }
  return v5;
}

- (SMUTextEntryController)init
{
  return -[SMUTextEntryController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SMUTextEntryController;
  -[SMUTextEntryController dealloc](&v4, sel_dealloc);
}

- (unint64_t)maxLength
{
  return -[SMUTextEntryTextField maxLength](self->_textField, "maxLength");
}

- (void)setMaxLength:(unint64_t)a3
{
  -[SMUTextEntryTextField setMaxLength:](self->_textField, "setMaxLength:", a3);
}

- (void)loadView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SMUTextEntryController;
  -[SMUTextEntryController loadView](&v4, sel_loadView);
  -[SMUTextEntryController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMUTextEntryTextField setText:](self->_textField, "setText:", self->_text);
  objc_msgSend(v3, "addSubview:", self->_textField);
  -[UILabel setText:](self->_titleLabel, "setText:", self->_title);
  objc_msgSend(v3, "addSubview:", self->_titleLabel);
  -[UILabel setText:](self->_messageLabel, "setText:", self->_message);
  objc_msgSend(v3, "addSubview:", self->_messageLabel);
  -[UIButton setTitle:forState:](self->_doneButton, "setTitle:forState:", self->_doneText, 0);
  objc_msgSend(v3, "addSubview:", self->_doneButton);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SMUTextEntryController;
  -[SMUTextEntryController viewDidLoad](&v5, sel_viewDidLoad);
  -[SMUTextEntryController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel__cancelButtonPressed_);
  objc_msgSend(v4, "setAllowedPressTypes:", &unk_24F631410);
  objc_msgSend(v3, "addGestureRecognizer:", v4);

}

- (void)didMoveToParentViewController:(id)a3
{
  id v4;
  UISystemInputViewController *v5;
  UISystemInputViewController *systemInputViewController;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SMUTextEntryController;
  -[SMUTextEntryController didMoveToParentViewController:](&v9, sel_didMoveToParentViewController_, v4);
  if (v4 && !self->_systemInputViewController)
  {
    objc_msgSend(MEMORY[0x24BEBD9C0], "systemInputViewControllerForResponder:editorView:containingResponder:", self->_textField, 0, self);
    v5 = (UISystemInputViewController *)objc_claimAutoreleasedReturnValue();
    systemInputViewController = self->_systemInputViewController;
    self->_systemInputViewController = v5;

    -[UISystemInputViewController setSupportsRecentInputsIntegration:](self->_systemInputViewController, "setSupportsRecentInputsIntegration:", 1);
    -[UISystemInputViewController setSystemInputViewControllerDelegate:](self->_systemInputViewController, "setSystemInputViewControllerDelegate:", self);
    if (!self->_systemInputViewController)
      -[SMUTextEntryController didMoveToParentViewController:].cold.1();
    -[SMUTextEntryController addChildViewController:](self, "addChildViewController:");
    -[SMUTextEntryController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController view](self->_systemInputViewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

    -[UISystemInputViewController willMoveToParentViewController:](self->_systemInputViewController, "willMoveToParentViewController:", self);
    self->_isTouchEnabled = -[UISystemInputViewController supportsTouchInput](self->_systemInputViewController, "supportsTouchInput");
  }

}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SMUTextEntryController;
  -[SMUTextEntryController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[UISystemInputViewController reloadInputViewsForPersistentDelegate](self->_systemInputViewController, "reloadInputViewsForPersistentDelegate");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SMUTextEntryController;
  -[SMUTextEntryController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SMUTextEntryTextField setUserInteractionEnabled:](self->_textField, "setUserInteractionEnabled:", 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SMUTextEntryController;
  -[SMUTextEntryController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[SMUTextEntryTextField setUserInteractionEnabled:](self->_textField, "setUserInteractionEnabled:", 0);
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  void *v4;

  objc_msgSend(a3, "nextFocusedView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v4, "isDescendantOfView:", self->_textField) ^ 1;

  return (char)self;
}

- (id)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_preferredFocusedView)
    objc_msgSend(v3, "addObject:");
  if (self->_systemInputViewController)
    objc_msgSend(v4, "addObject:");
  v7.receiver = self;
  v7.super_class = (Class)SMUTextEntryController;
  -[SMUTextEntryController preferredFocusEnvironments](&v7, sel_preferredFocusEnvironments);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  return v4;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v5 = a3;
  -[SMUTextEntryController view](self, "view");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextFocusedView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isDescendantOfView:", v9))
  {
    -[UISystemInputViewController view](self->_systemInputViewController, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isDescendantOfView:", v7);

    if ((v8 & 1) == 0)
      objc_storeStrong((id *)&self->_preferredFocusedView, v6);
  }

}

- (void)textFieldDidChange:(id)a3
{
  id v3;

  -[SMUTextEntryController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double width;
  double v19;
  double v20;
  double v21;
  UILabel *titleLabel;
  UILabel *messageLabel;
  SMUTextEntryTextField *textField;
  CGFloat v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  UIButton *doneButton;
  double v36;
  double v37;
  double v38;
  objc_super v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v39.receiver = self;
  v39.super_class = (Class)SMUTextEntryController;
  -[SMUTextEntryController viewDidLayoutSubviews](&v39, sel_viewDidLayoutSubviews);
  -[UISystemInputViewController view](self->_systemInputViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemLayoutSizeFittingSize:", *MEMORY[0x24BEBE588], *(double *)(MEMORY[0x24BEBE588] + 8));
  v38 = v4;
  -[SMUTextEntryController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v37 = v7;
  if (self->_isTouchEnabled)
    v8 = v6;
  else
    v8 = v6 + -838.0 + -90.0;
  v10 = *MEMORY[0x24BDBF148];
  v9 = *(double *)(MEMORY[0x24BDBF148] + 8);
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", *MEMORY[0x24BDBF148], v9);
  v12 = v11;
  -[UILabel sizeThatFits:](self->_messageLabel, "sizeThatFits:", v8, 360.0);
  v14 = v13;
  v15 = v13 + 100.0;
  if (v14 <= 0.0)
    v15 = 0.0;
  v16 = v12 + v15 + 100.0;
  -[SMUTextEntryTextField attributedText](self->_textField, "attributedText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "boundingRectWithSize:options:context:", 8, 0, v10, v9);
  v41 = CGRectIntegral(v40);
  width = v41.size.width;

  if (width + 40.0 > v8 * 0.9)
    v19 = v8 * 0.9;
  else
    v19 = width + 40.0;
  if (width + 40.0 > 600.0)
    v20 = v19;
  else
    v20 = 600.0;
  v36 = v20;
  v21 = v38 + 30.0 + 70.0;
  if (!self->_isTouchEnabled)
    v21 = 70.0;
  -[UIButton sizeThatFits:](self->_doneButton, "sizeThatFits:", v8, v37 - (v16 + v21), v19, *(_QWORD *)&v36);
  titleLabel = self->_titleLabel;
  UIRectCenteredXInRect();
  -[UILabel setFrame:](titleLabel, "setFrame:");
  -[UILabel frame](self->_titleLabel, "frame");
  CGRectGetMaxY(v42);
  messageLabel = self->_messageLabel;
  UIRectCenteredXInRect();
  -[UILabel setFrame:](messageLabel, "setFrame:");
  if (v14 > 0.0)
  {
    -[UILabel frame](self->_messageLabel, "frame");
    CGRectGetMaxY(v43);
  }
  textField = self->_textField;
  UIRectCenteredXInRect();
  -[SMUTextEntryTextField setFrame:](textField, "setFrame:");
  if (self->_isTouchEnabled)
  {
    -[SMUTextEntryTextField frame](self->_textField, "frame");
    v25 = CGRectGetMaxY(v44) + 30.0;
    -[SMUTextEntryController view](self, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bounds");
    v27 = CGRectGetWidth(v45);
    objc_msgSend(v3, "bounds");
    objc_msgSend(v3, "setFrame:", 0.0, v25, v27, CGRectGetHeight(v46));

  }
  else
  {
    objc_msgSend(v3, "bounds");
    -[SMUTextEntryController view](self, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "frame");
    UIRectCenteredYInRect();
    v30 = v29;
    v32 = v31;
    v34 = v33;

    objc_msgSend(v3, "setFrame:", 194.0, v30, v32, v34);
  }
  doneButton = self->_doneButton;
  UIRectCenteredXInRect();
  -[UIButton setFrame:](doneButton, "setFrame:");

}

- (BOOL)_disableAutomaticKeyboardUI
{
  return 1;
}

- (BOOL)_enableAutomaticKeyboardPressDone
{
  return 1;
}

- (void)systemInputViewController:(id)a3 didChangeAccessoryVisibility:(BOOL)a4
{
  _BOOL8 v5;

  v5 = !a4;
  self->_hideAccessoryViews = !a4;
  -[UILabel setHidden:](self->_titleLabel, "setHidden:", v5);
  -[UILabel setHidden:](self->_messageLabel, "setHidden:", v5);
  -[SMUTextEntryTextField setHidden:](self->_textField, "setHidden:", v5);
  -[UIButton setHidden:](self->_doneButton, "setHidden:", v5);
}

- (void)systemInputViewControllerDidAcceptRecentInput:(id)a3
{
  -[SMUTextEntryController _doneButtonPressed:](self, "_doneButtonPressed:", 0);
}

- (void)_doneButtonPressed:(id)a3
{
  NSString *v4;
  NSString *text;
  void (**onCompletion)(void);

  -[SMUTextEntryTextField text](self->_textField, "text", a3);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  text = self->_text;
  self->_text = v4;

  onCompletion = (void (**)(void))self->_onCompletion;
  if (onCompletion)
    onCompletion[2]();
}

- (void)_cancelButtonPressed:(id)a3
{
  NSString *text;
  void (**onCompletion)(void);

  text = self->_text;
  self->_text = 0;

  onCompletion = (void (**)(void))self->_onCompletion;
  if (onCompletion)
    onCompletion[2]();
}

- (BOOL)textFieldAllowsFocus
{
  return -[SMUTextEntryTextField allowsFocus](self->_textField, "allowsFocus");
}

- (void)setTextFieldAllowsFocus:(BOOL)a3
{
  -[SMUTextEntryTextField setAllowsFocus:](self->_textField, "setAllowsFocus:", a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1000);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1008);
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1016);
}

- (NSString)doneText
{
  return self->_doneText;
}

- (void)setDoneText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (id)onCompletion
{
  return self->_onCompletion;
}

- (void)setOnCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (UIButton)doneButton
{
  return self->_doneButton;
}

- (UITextField)textField
{
  return &self->_textField->super;
}

- (UISystemInputViewController)systemInputViewController
{
  return self->_systemInputViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemInputViewController, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong(&self->_onCompletion, 0);
  objc_storeStrong((id *)&self->_doneText, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_preferredFocusedView, 0);
  objc_storeStrong((id *)&self->_textField, 0);
}

- (void)didMoveToParentViewController:.cold.1()
{
  __assert_rtn("-[SMUTextEntryController didMoveToParentViewController:]", "SMUTextEntryController.m", 142, "_systemInputViewController && \"add the view controller in the stack before asking for its view\");
}

@end
