@implementation ACMSignInDialog

- (void)dealloc
{
  objc_super v3;

  -[UITextField setDelegate:](self->_accountNameField, "setDelegate:", 0);
  -[UITextField setDelegate:](self->_passwordField, "setDelegate:", 0);

  self->_accountNameField = 0;
  self->_passwordField = 0;
  v3.receiver = self;
  v3.super_class = (Class)ACMSignInDialog;
  -[ACMDialog dealloc](&v3, sel_dealloc);
}

- (NSString)passwordString
{
  return -[UITextField text](-[ACMSignInDialog passwordField](self, "passwordField"), "text");
}

- (void)setPasswordString:(id)a3
{
  -[UITextField setText:](-[ACMSignInDialog passwordField](self, "passwordField"), "setText:", a3);
}

- (NSString)userNameString
{
  return -[UITextField text](-[ACMSignInDialog accountNameField](self, "accountNameField"), "text");
}

- (BOOL)canSignIn
{
  NSUInteger v3;

  v3 = -[NSString length](-[UITextField text](-[ACMSignInDialog passwordField](self, "passwordField"), "text"), "length");
  if (v3)
  {
    if (-[ACMSignInDialog accountNameField](self, "accountNameField"))
      LOBYTE(v3) = -[NSString length](-[UITextField text](-[ACMSignInDialog accountNameField](self, "accountNameField"), "text"), "length") != 0;
    else
      LOBYTE(v3) = 1;
  }
  return v3;
}

- (void)controlsWillChangeState:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  char **v6;

  v3 = a3;
  if (!-[ACMSignInDialog stateChangeCounter](self, "stateChangeCounter"))
  {
    v5 = v3 ? 4 : 3;
    if (-[ACMSignInDialog signInDialogState](self, "signInDialogState") != v5
      && (-[ACMSignInDialog signInDialogState](self, "signInDialogState") != 2 || !v3)
      && (-[ACMSignInDialog signInDialogState](self, "signInDialogState") != 1 || v3))
    {
      v6 = &selRef_signInDialogWillBecomeDisabled;
      if (!v3)
        v6 = &selRef_signInDialogWillBecomeEnabled;
      -[ACMSignInDialogDelegate performSelector:](-[ACMSignInDialog delegate](self, "delegate"), "performSelector:", *v6);
      -[ACMSignInDialog setSignInDialogState:](self, "setSignInDialogState:", v5);
    }
  }
  -[ACMSignInDialog setStateChangeCounter:](self, "setStateChangeCounter:", -[ACMSignInDialog stateChangeCounter](self, "stateChangeCounter") + 1);
}

- (void)controlsDidChangeState:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  char **v6;

  v3 = a3;
  -[ACMSignInDialog setStateChangeCounter:](self, "setStateChangeCounter:", -[ACMSignInDialog stateChangeCounter](self, "stateChangeCounter") - 1);
  if (!-[ACMSignInDialog stateChangeCounter](self, "stateChangeCounter"))
  {
    v5 = v3 ? 2 : 1;
    if (-[ACMSignInDialog signInDialogState](self, "signInDialogState") != v5)
    {
      v6 = &selRef_signInDialogDidBecomeDisabled;
      if (!v3)
        v6 = &selRef_signInDialogDidBecomeEnabled;
      -[ACMSignInDialogDelegate performSelector:](-[ACMSignInDialog delegate](self, "delegate"), "performSelector:", *v6);
      -[ACMSignInDialog setSignInDialogState:](self, "setSignInDialogState:", v5);
    }
  }
}

- (BOOL)shouldAuthenticateOnUserInput
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[ACMSignInDialog controlsWillChangeState:](self, "controlsWillChangeState:", 0);
  v5.receiver = self;
  v5.super_class = (Class)ACMSignInDialog;
  -[ACMDialog viewWillAppear:](&v5, sel_viewWillAppear_, v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ACMSignInDialog;
  -[ACMDialog viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[ACMSignInDialog controlsDidChangeState:](self, "controlsDidChangeState:", 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[ACMSignInDialog controlsWillChangeState:](self, "controlsWillChangeState:", 1);
  v5.receiver = self;
  v5.super_class = (Class)ACMSignInDialog;
  -[ACMDialog viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
  -[ACMSignInDialog controlsDidChangeState:](self, "controlsDidChangeState:", 1);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  BOOL v5;
  UITextField *v6;
  UITextField *v7;

  if (-[ACMSignInDialog accountNameField](self, "accountNameField") == a3)
  {
    -[UITextField resignFirstResponder](-[ACMSignInDialog accountNameField](self, "accountNameField"), "resignFirstResponder");
    -[UITextField becomeFirstResponder](-[ACMSignInDialog passwordField](self, "passwordField"), "becomeFirstResponder");
  }
  v5 = -[ACMSignInDialog shouldAuthenticateOnUserInput](self, "shouldAuthenticateOnUserInput");
  v6 = -[ACMSignInDialog passwordField](self, "passwordField");
  v7 = -[ACMSignInDialog passwordField](self, "passwordField");
  if (v6 != a3 || v5)
  {
    if (v7 == a3 && -[ACMSignInDialog canSignIn](self, "canSignIn"))
    {
      -[UITextField resignFirstResponder](-[ACMSignInDialog passwordField](self, "passwordField"), "resignFirstResponder");
      -[ACMSignInDialogDelegate onSignIn:](-[ACMSignInDialog delegate](self, "delegate"), "onSignIn:", -[ACMSignInDialog passwordField](self, "passwordField"));
    }
  }
  else
  {
    -[UITextField resignFirstResponder](v7, "resignFirstResponder");
  }
  return 1;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  uint64_t v9;
  unint64_t v10;
  NSUInteger v11;

  length = a4.length;
  if (-[ACMSignInDialog passwordField](self, "passwordField", a3, a4.location) == a3)
    v9 = 32;
  else
    v9 = 0;
  if (-[ACMSignInDialog accountNameField](self, "accountNameField") == a3)
    v10 = 128;
  else
    v10 = v9;
  v11 = objc_msgSend((id)objc_msgSend(a3, "text"), "length") - length;
  return v11 + objc_msgSend(a5, "length") <= v10;
}

- (void)onIForgot:(id)a3
{
  if (-[ACMSignInDialog delegate](self, "delegate"))
    -[ACMSignInDialogDelegate onSignIn:](-[ACMSignInDialog delegate](self, "delegate"), "onSignIn:", a3);
}

- (void)onSignIn:(id)a3
{
  if (-[ACMSignInDialog delegate](self, "delegate"))
    -[ACMSignInDialogDelegate onSignIn:](-[ACMSignInDialog delegate](self, "delegate"), "onSignIn:", a3);
}

- (void)onSignInCancel:(id)a3
{
  if (-[ACMSignInDialog delegate](self, "delegate"))
    -[ACMSignInDialogDelegate onSignInCancel:](-[ACMSignInDialog delegate](self, "delegate"), "onSignInCancel:", a3);
}

- (ACMSignInDialogDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (ACMSignInDialogDelegate *)a3;
}

- (NSString)requestedUserName
{
  return self->_requestedUserName;
}

- (void)setRequestedUserName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1016);
}

- (int64_t)signInDialogState
{
  return self->_signInDialogState;
}

- (void)setSignInDialogState:(int64_t)a3
{
  self->_signInDialogState = a3;
}

- (UITextField)accountNameField
{
  return self->_accountNameField;
}

- (void)setAccountNameField:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 992);
}

- (UITextField)passwordField
{
  return self->_passwordField;
}

- (void)setPasswordField:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1000);
}

- (BOOL)userHasBegunEditingText
{
  return self->_userHasBegunEditingText;
}

- (void)setUserHasBegunEditingText:(BOOL)a3
{
  self->_userHasBegunEditingText = a3;
}

- (unint64_t)stateChangeCounter
{
  return self->_stateChangeCounter;
}

- (void)setStateChangeCounter:(unint64_t)a3
{
  self->_stateChangeCounter = a3;
}

@end
