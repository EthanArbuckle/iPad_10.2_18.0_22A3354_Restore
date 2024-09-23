@implementation ACMSignInDialogCustom

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[UIButton setEnabled:](-[ACMSignInDialogCustom signInButton](self, "signInButton"), "setEnabled:", 1);
  -[UIButton setEnabled:](-[ACMSignInDialogCustom cancelButton](self, "cancelButton"), "setEnabled:", 1);
  -[ACMSignInDialogCustom setSignInButton:](self, "setSignInButton:", 0);
  -[ACMSignInDialogCustom setSignInBarButton:](self, "setSignInBarButton:", 0);
  -[ACMSignInDialogCustom setCancelButton:](self, "setCancelButton:", 0);
  -[ACMSignInDialogCustom setCancelBarButton:](self, "setCancelBarButton:", 0);
  -[ACMSignInDialogCustom setView:](self, "setView:", 0);
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7F58], 0);

  self->_widget = 0;
  v4.receiver = self;
  v4.super_class = (Class)ACMSignInDialogCustom;
  -[ACMSignInDialog dealloc](&v4, sel_dealloc);
}

- (void)setupCustomView
{
  void *v3;
  uint64_t v4;

  -[ACMSignInDialog setAccountNameField:](self, "setAccountNameField:", -[ACMSignInWidgetProtocol accountField](-[ACMSignInDialogCustom widget](self, "widget"), "accountField"));
  if (-[NSString length](-[ACMSignInDialog requestedUserName](self, "requestedUserName"), "length"))
  {
    -[UITextField setText:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setText:", -[ACMSignInDialog requestedUserName](self, "requestedUserName"));
    -[UITextField setUserInteractionEnabled:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setUserInteractionEnabled:", -[ACMSignInDialogCustom userNameFieldEditable](self, "userNameFieldEditable"));
  }
  -[ACMSignInDialog setPasswordField:](self, "setPasswordField:", -[ACMSignInWidgetProtocol passwordField](-[ACMSignInDialogCustom widget](self, "widget"), "passwordField"));
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = *MEMORY[0x24BDF7F58];
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_checkFields, *MEMORY[0x24BDF7F58], -[ACMSignInDialog passwordField](self, "passwordField"));
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel_checkFields, v4, -[ACMSignInDialog accountNameField](self, "accountNameField"));
}

- (void)loadView
{
  -[ACMSignInDialogCustom setView:](self, "setView:", -[ACMSignInWidgetProtocol view](-[ACMSignInDialogCustom widget](self, "widget"), "view"));
  -[ACMSignInDialogCustom setupCustomView](self, "setupCustomView");
}

- (void)setRequestedUserName:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ACMSignInDialogCustom;
  -[ACMSignInDialog setRequestedUserName:](&v5, sel_setRequestedUserName_);
  -[UITextField setText:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setText:", a3);
}

- (ACMSignInWidgetProtocol)widget
{
  ACMSignInWidgetProtocol *widget;

  widget = self->_widget;
  if (!widget)
  {
    -[ACMSignInDialogCustom widgetClass](self, "widgetClass");
    widget = (ACMSignInWidgetProtocol *)objc_opt_new();
    self->_widget = widget;
    -[ACMSignInWidgetProtocol setShouldAuthenticateOnUserInput:](widget, "setShouldAuthenticateOnUserInput:", 1);
    -[ACMSignInWidgetProtocol setDelegate:](widget, "setDelegate:", self);
  }
  return widget;
}

- (BOOL)standardViewController
{
  return 0;
}

- (void)checkFields
{
  _BOOL8 v3;

  v3 = -[ACMSignInDialogCustom canSignIn](self, "canSignIn");
  -[UIButton setEnabled:](-[ACMSignInDialogCustom signInButton](self, "signInButton"), "setEnabled:", v3);
  -[UIBarButtonItem setEnabled:](-[ACMSignInDialogCustom signInBarButton](self, "signInBarButton"), "setEnabled:", v3);
}

- (BOOL)canSignIn
{
  uint64_t v3;

  v3 = objc_msgSend((id)objc_msgSend((id)-[ACMSignInWidgetProtocol passwordField](-[ACMSignInDialogCustom widget](self, "widget"), "passwordField"), "text"), "length");
  if (v3)
    LOBYTE(v3) = objc_msgSend((id)objc_msgSend((id)-[ACMSignInWidgetProtocol accountField](-[ACMSignInDialogCustom widget](self, "widget"), "accountField"), "text"), "length") != 0;
  return v3;
}

- (void)disableControls:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[ACMSignInDialog controlsWillChangeState:](self, "controlsWillChangeState:");
  -[ACMSignInWidgetProtocol disableControls:](-[ACMSignInDialogCustom widget](self, "widget"), "disableControls:", v3);
  v5.receiver = self;
  v5.super_class = (Class)ACMSignInDialogCustom;
  -[ACMSignInDialog disableControls:](&v5, sel_disableControls_, v3);
  -[UIBarButtonItem setEnabled:](-[ACMSignInDialogCustom signInBarButton](self, "signInBarButton"), "setEnabled:", v3 ^ 1);
  -[UIBarButtonItem setEnabled:](-[ACMSignInDialogCustom cancelBarButton](self, "cancelBarButton"), "setEnabled:", v3 ^ 1);
  -[UIButton setEnabled:](-[ACMSignInDialogCustom signInButton](self, "signInButton"), "setEnabled:", v3 ^ 1);
  -[UIButton setEnabled:](-[ACMSignInDialogCustom cancelButton](self, "cancelButton"), "setEnabled:", v3 ^ 1);
  if (!v3)
    -[ACMSignInDialogCustom checkFields](self, "checkFields");
  -[ACMSignInDialog controlsDidChangeState:](self, "controlsDidChangeState:", v3);
}

- (void)setSignInButton:(id)a3
{
  UIButton *signInButton;
  UIButton *v6;

  signInButton = self->_signInButton;
  if (signInButton != a3)
  {
    -[UIButton removeTarget:action:forControlEvents:](signInButton, "removeTarget:action:forControlEvents:", 0, 0, 64);

    v6 = (UIButton *)a3;
    self->_signInButton = v6;
    -[UIButton addTarget:action:forControlEvents:](v6, "addTarget:action:forControlEvents:", self, sel_onSignIn_, 64);
    -[UIButton setExclusiveTouch:](self->_signInButton, "setExclusiveTouch:", 1);
    -[ACMSignInDialogCustom checkFields](self, "checkFields");
  }
}

- (void)setCancelButton:(id)a3
{
  UIButton *cancelButton;
  UIButton *v6;

  cancelButton = self->_cancelButton;
  if (cancelButton != a3)
  {
    -[UIButton removeTarget:action:forControlEvents:](cancelButton, "removeTarget:action:forControlEvents:", 0, 0, 64);

    v6 = (UIButton *)a3;
    self->_cancelButton = v6;
    -[UIButton addTarget:action:forControlEvents:](v6, "addTarget:action:forControlEvents:", self, sel_onSignInCancel_, 64);
    -[UIButton setExclusiveTouch:](self->_cancelButton, "setExclusiveTouch:", 1);
  }
}

- (void)setSignInBarButton:(id)a3
{
  UIBarButtonItem *signInBarButton;
  UIBarButtonItem *v6;

  signInBarButton = self->_signInBarButton;
  if (signInBarButton != a3)
  {
    -[UIBarButtonItem setTarget:](signInBarButton, "setTarget:", 0);
    -[UIBarButtonItem setAction:](self->_signInBarButton, "setAction:", 0);

    v6 = (UIBarButtonItem *)a3;
    self->_signInBarButton = v6;
    -[UIBarButtonItem setTarget:](v6, "setTarget:", self);
    -[UIBarButtonItem setAction:](self->_signInBarButton, "setAction:", sel_onSignIn_);
    -[ACMSignInDialogCustom checkFields](self, "checkFields");
  }
}

- (void)setCancelBarButton:(id)a3
{
  UIBarButtonItem *cancelBarButton;
  UIBarButtonItem *v6;

  cancelBarButton = self->_cancelBarButton;
  if (cancelBarButton != a3)
  {
    -[UIBarButtonItem setTarget:](cancelBarButton, "setTarget:", 0);
    -[UIBarButtonItem setAction:](self->_cancelBarButton, "setAction:", 0);

    v6 = (UIBarButtonItem *)a3;
    self->_cancelBarButton = v6;
    -[UIBarButtonItem setTarget:](v6, "setTarget:", self);
    -[UIBarButtonItem setAction:](self->_cancelBarButton, "setAction:", sel_onSignInCancel_);
  }
}

- (UIColor)backgroundColor
{
  return (UIColor *)-[ACMSignInWidgetProtocol backgroundColor](-[ACMSignInDialogCustom widget](self, "widget"), "backgroundColor");
}

- (void)setBackgroundColor:(id)a3
{
  -[ACMSignInWidgetProtocol setBackgroundColor:](-[ACMSignInDialogCustom widget](self, "widget"), "setBackgroundColor:", a3);
}

- (void)setShouldAuthenticateOnUserInput:(BOOL)a3
{
  -[ACMSignInWidgetProtocol setShouldAuthenticateOnUserInput:](-[ACMSignInDialogCustom widget](self, "widget"), "setShouldAuthenticateOnUserInput:", a3);
}

- (BOOL)shouldAuthenticateOnUserInput
{
  return -[ACMSignInWidgetProtocol shouldAuthenticateOnUserInput](-[ACMSignInDialogCustom widget](self, "widget"), "shouldAuthenticateOnUserInput");
}

- (CGPoint)widgetPosition
{
  double v2;
  double v3;
  CGPoint result;

  -[ACMSignInWidgetProtocol position](-[ACMSignInDialogCustom widget](self, "widget"), "position");
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setWidgetPosition:(CGPoint)a3
{
  -[ACMSignInWidgetProtocol setPosition:](-[ACMSignInDialogCustom widget](self, "widget"), "setPosition:", a3.x, a3.y);
}

- (NSString)widgetAccountLabel
{
  return (NSString *)-[ACMSignInWidgetProtocol accountLabelText](-[ACMSignInDialogCustom widget](self, "widget"), "accountLabelText");
}

- (void)setWidgetAccountLabel:(id)a3
{
  -[ACMSignInWidgetProtocol setAccountLabelText:](-[ACMSignInDialogCustom widget](self, "widget"), "setAccountLabelText:", a3);
}

- (int64_t)widgetPasswordReturnKeyType
{
  return objc_msgSend((id)-[ACMSignInWidgetProtocol passwordField](-[ACMSignInDialogCustom widget](self, "widget"), "passwordField"), "returnKeyType");
}

- (void)setWidgetPasswordReturnKeyType:(int64_t)a3
{
  objc_msgSend((id)-[ACMSignInWidgetProtocol passwordField](-[ACMSignInDialogCustom widget](self, "widget"), "passwordField"), "setReturnKeyType:", a3);
}

- (void)showWithParentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  objc_super v9;

  v6 = a4;
  if (-[ACMSignInDialogCustom standardViewController](self, "standardViewController"))
  {
    v9.receiver = self;
    v9.super_class = (Class)ACMSignInDialogCustom;
    -[ACMDialog showWithParentViewController:animated:completion:](&v9, sel_showWithParentViewController_animated_completion_, a3, v6, a5);
  }
  else
  {
    objc_msgSend((id)objc_msgSend(a3, "view"), "addSubview:", -[ACMSignInDialogCustom view](self, "view"));
    objc_msgSend((id)-[ACMSignInDialogCustom view](self, "view"), "setAutoresizingMask:", 34);
    if (a5)
      (*((void (**)(id))a5 + 2))(a5);
  }
}

- (void)hideWithParentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  objc_super v9;

  v6 = a4;
  if (-[ACMSignInDialogCustom standardViewController](self, "standardViewController"))
  {
    v9.receiver = self;
    v9.super_class = (Class)ACMSignInDialogCustom;
    -[ACMDialog hideWithParentViewController:animated:completion:](&v9, sel_hideWithParentViewController_animated_completion_, a3, v6, a5);
  }
  else if (objc_msgSend((id)-[ACMSignInDialogCustom view](self, "view"), "superview"))
  {
    objc_msgSend((id)-[ACMSignInDialogCustom view](self, "view"), "removeFromSuperview");
    if (a5)
      (*((void (**)(id))a5 + 2))(a5);
  }
}

- (void)onSignIn:(id)a3
{
  if (-[ACMSignInDialogCustom canSignIn](self, "canSignIn"))
    -[ACMSignInDialogDelegate onSignIn:](-[ACMSignInDialog delegate](self, "delegate"), "onSignIn:", a3);
}

- (void)onIForgot:(id)a3
{
  -[ACMSignInDialogDelegate onIForgot:](-[ACMSignInDialog delegate](self, "delegate"), "onIForgot:", a3);
}

- (Class)widgetClass
{
  return self->_widgetClass;
}

- (void)setWidgetClass:(Class)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1080);
}

- (UIButton)signInButton
{
  return self->_signInButton;
}

- (UIBarButtonItem)signInBarButton
{
  return self->_signInBarButton;
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (UIBarButtonItem)cancelBarButton
{
  return self->_cancelBarButton;
}

- (BOOL)userNameFieldEditable
{
  return self->_userNameFieldEditable;
}

- (void)setUserNameFieldEditable:(BOOL)a3
{
  self->_userNameFieldEditable = a3;
}

@end
