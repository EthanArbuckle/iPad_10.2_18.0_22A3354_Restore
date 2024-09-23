@implementation ACMSignInDialogSimple

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[ACMSignInDialog controlsWillChangeState:](self, "controlsWillChangeState:", 1);
  v5.receiver = self;
  v5.super_class = (Class)ACMSignInDialogSimple;
  -[ACMSignInDialog viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
  -[ACMSignInDialog controlsDidChangeState:](self, "controlsDidChangeState:", 1);
}

- (void)dealloc
{
  objc_super v3;

  -[UIButton removeTarget:action:forControlEvents:](self->_cancelButton, "removeTarget:action:forControlEvents:", 0, 0, 64);
  -[UIButton removeTarget:action:forControlEvents:](self->_loginButton, "removeTarget:action:forControlEvents:", 0, 0, 64);

  self->_cancelButton = 0;
  self->_loginButton = 0;

  self->_licenseTextField = 0;
  -[ACMSignInDialogSimple setLogo:](self, "setLogo:", 0);
  -[ACMSignInDialogSimple setBackgroundColor:](self, "setBackgroundColor:", 0);
  -[ACMSignInDialogSimple setAccountNameFieldPlaceholder:](self, "setAccountNameFieldPlaceholder:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMSignInDialogSimple;
  -[ACMSignInDialog dealloc](&v3, sel_dealloc);
}

- (int64_t)statusBarStyle
{
  return 0;
}

- (void)loadView
{
  id v3;

  v3 = objc_alloc(MEMORY[0x24BDF6F90]);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "bounds");
  -[ACMSignInDialogSimple setView:](self, "setView:", (id)objc_msgSend(v3, "initWithFrame:"));
}

- (void)checkFields
{
  -[UIButton setEnabled:](-[ACMSignInDialogSimple loginButton](self, "loginButton"), "setEnabled:", -[ACMSignInDialog canSignIn](self, "canSignIn"));
}

- (void)focus
{
  UITextField *v3;

  if (-[NSString length](-[UITextField text](-[ACMSignInDialog accountNameField](self, "accountNameField"), "text"), "length"))
  {
    v3 = -[ACMSignInDialog passwordField](self, "passwordField");
  }
  else
  {
    v3 = -[ACMSignInDialog accountNameField](self, "accountNameField");
  }
  -[UITextField becomeFirstResponder](v3, "becomeFirstResponder");
  -[ACMSignInDialogSimple checkFields](self, "checkFields");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ACMSignInDialogSimple;
  -[ACMSignInDialog viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[ACMSignInDialogSimple focus](self, "focus");
}

- (void)disableControls:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[ACMSignInDialog controlsWillChangeState:](self, "controlsWillChangeState:");
  v5.receiver = self;
  v5.super_class = (Class)ACMSignInDialogSimple;
  -[ACMSignInDialog disableControls:](&v5, sel_disableControls_, v3);
  -[UIButton setEnabled:](-[ACMSignInDialogSimple loginButton](self, "loginButton"), "setEnabled:", v3 ^ 1);
  -[UIButton setEnabled:](-[ACMSignInDialogSimple cancelButton](self, "cancelButton"), "setEnabled:", v3 ^ 1);
  -[UITextField setEnabled:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setEnabled:", v3 ^ 1);
  -[UITextField setEnabled:](-[ACMSignInDialog passwordField](self, "passwordField"), "setEnabled:", v3 ^ 1);
  if (!v3)
    -[ACMSignInDialogSimple focus](self, "focus");
  -[ACMSignInDialog controlsDidChangeState:](self, "controlsDidChangeState:", v3);
}

- (unint64_t)verticalShift
{
  double v3;

  if (!-[ACMSignInDialogSimple logo](self, "logo"))
    return 10;
  -[UIImage size](-[ACMSignInDialogSimple logo](self, "logo"), "size");
  return (unint64_t)(v3 + 10.0);
}

- (NSString)passwordString
{
  return -[UITextField text](-[ACMSignInDialog passwordField](self, "passwordField"), "text");
}

- (NSString)userNameString
{
  return -[UITextField text](-[ACMSignInDialog accountNameField](self, "accountNameField"), "text");
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  return (objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom")
      || (unint64_t)(a3 - 1) < 2;
}

- (UIImage)logo
{
  return self->_logo;
}

- (void)setLogo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1048);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1064);
}

- (UIView)backgroudView
{
  return self->_backgroudView;
}

- (void)setBackgroudView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1080);
}

- (NSString)accountNameFieldPlaceholder
{
  return self->_accountNameFieldPlaceholder;
}

- (void)setAccountNameFieldPlaceholder:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1072);
}

- (UIColor)licenseTextColor
{
  return (UIColor *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setLicenseTextColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1088);
}

- (UIButton)loginButton
{
  return self->_loginButton;
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

@end
