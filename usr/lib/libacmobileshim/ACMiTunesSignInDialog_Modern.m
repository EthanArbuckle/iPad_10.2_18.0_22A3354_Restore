@implementation ACMiTunesSignInDialog_Modern

- (void)loadView
{
  id v3;
  id v4;
  NSString *v5;
  id v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ACMiTunesSignInDialog_Modern;
  -[ACMiTunesSignInDialog loadView](&v8, sel_loadView);
  v3 = -[ACMiTunesSignInDialog dialogTitle](self, "dialogTitle");
  v4 = objc_alloc(MEMORY[0x24BDF67F8]);
  if (-[ACMiTunesSignInDialog isUserNameEditable](self, "isUserNameEditable")
    || !-[NSString length](-[ACMSignInDialog requestedUserName](self, "requestedUserName"), "length"))
  {
    v5 = 0;
  }
  else
  {
    v5 = -[ACMSignInDialog requestedUserName](self, "requestedUserName");
  }
  v6 = (id)objc_msgSend(v4, "initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:", v3, v5, self, +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Cancel")), +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Sign In")), 0);
  if (-[ACMiTunesSignInDialog isUserNameEditable](self, "isUserNameEditable"))
    v7 = 3;
  else
    v7 = 1;
  objc_msgSend(v6, "setAlertViewStyle:", v7);
  -[ACMiTunesSignInDialog_Modern setView:](self, "setView:", v6);
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v3 = (void *)-[ACMiTunesSignInDialog_Modern view](self, "view");
  -[ACMSignInDialog setPasswordField:](self, "setPasswordField:", objc_msgSend(v3, "textFieldAtIndex:", objc_msgSend(v3, "alertViewStyle") != 1));
  -[UITextField setDelegate:](-[ACMSignInDialog passwordField](self, "passwordField"), "setDelegate:", self);
  -[UITextField setPlaceholder:](-[ACMSignInDialog passwordField](self, "passwordField"), "setPlaceholder:", +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Password")));
  if (objc_msgSend((id)objc_msgSend(+[ACMAppleConnectImplComponents components](ACMAppleConnectImplComponents, "components"), "systemInfo"), "isPreRelease"))-[UITextField setPlaceholder:](-[ACMSignInDialog passwordField](self, "passwordField"), "setPlaceholder:", -[NSString stringByAppendingString:](-[UITextField placeholder](-[ACMSignInDialog passwordField](self, "passwordField"), "placeholder"), "stringByAppendingString:", CFSTR(" (PRE-RELEASE)")));
  -[UITextField setClearButtonMode:](-[ACMSignInDialog passwordField](self, "passwordField"), "setClearButtonMode:", 1);
  -[UITextField setReturnKeyType:](-[ACMSignInDialog passwordField](self, "passwordField"), "setReturnKeyType:", 1);
  -[UITextField setKeyboardAppearance:](-[ACMSignInDialog passwordField](self, "passwordField"), "setKeyboardAppearance:", 0);
  if (objc_msgSend(v3, "alertViewStyle") == 3)
  {
    -[ACMSignInDialog setAccountNameField:](self, "setAccountNameField:", objc_msgSend(v3, "textFieldAtIndex:", 0));
    -[UITextField setPlaceholder:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setPlaceholder:", +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Apple ID")));
    if (objc_msgSend((id)objc_msgSend(+[ACMAppleConnectImplComponents components](ACMAppleConnectImplComponents, "components"), "systemInfo"), "isPreRelease"))-[UITextField setPlaceholder:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setPlaceholder:", -[NSString stringByAppendingString:](-[UITextField placeholder](-[ACMSignInDialog accountNameField](self, "accountNameField"), "placeholder"), "stringByAppendingString:", CFSTR(" (PRE-RELEASE)")));
    -[UITextField setDelegate:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setDelegate:", self);
    -[UITextField setClearButtonMode:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setClearButtonMode:", 1);
    -[UITextField setKeyboardAppearance:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setKeyboardAppearance:", 0);
    -[UITextField setKeyboardType:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setKeyboardType:", 7);
    -[UITextField setReturnKeyType:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setReturnKeyType:", 4);
    -[UITextField setText:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setText:", -[ACMSignInDialog requestedUserName](self, "requestedUserName"));
  }
  v4.receiver = self;
  v4.super_class = (Class)ACMiTunesSignInDialog_Modern;
  -[ACMiTunesSignInDialog viewDidLoad](&v4, sel_viewDidLoad);
}

- (BOOL)shouldPasswordTextFieldReturnOnSignInDisallowed
{
  return 0;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  if (-[ACMSignInDialog passwordField](self, "passwordField") != a3)
  {
    -[ACMiTunesSignInDialog handleTextFieldShouldReturnOnNonPasswordField](self, "handleTextFieldShouldReturnOnNonPasswordField");
    return 1;
  }
  if (-[ACMSignInDialog canSignIn](self, "canSignIn"))
  {
    -[UIAlertView dismissWithClickedButtonIndex:animated:](-[ACMiTunesSignInDialog signInDialog](self, "signInDialog"), "dismissWithClickedButtonIndex:animated:", 1, 1);
    return 1;
  }
  return -[ACMiTunesSignInDialog_Modern shouldPasswordTextFieldReturnOnSignInDisallowed](self, "shouldPasswordTextFieldReturnOnSignInDisallowed");
}

- (void)alertView:(id)a3 clickedButtonAtIndex:(int64_t)a4
{
  UIAlertView *v7;

  v7 = -[ACMiTunesSignInDialog signInDialog](self, "signInDialog");
  if (!a4 && v7 == a3)
  {
    -[ACMSignInDialog controlsWillChangeState:](self, "controlsWillChangeState:", 1);
    -[ACMSignInDialog controlsDidChangeState:](self, "controlsDidChangeState:", 1);
    -[ACMSignInDialogDelegate onSignInCancel:](-[ACMSignInDialog delegate](self, "delegate"), "onSignInCancel:", a3);
  }
}

- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4
{
  UIAlertView *v7;

  v7 = -[ACMiTunesSignInDialog signInDialog](self, "signInDialog");
  if (a4 == 1 && v7 == a3)
  {
    if (-[ACMiTunesSignInDialog isUserNameEditable](self, "isUserNameEditable"))
      -[ACMSignInDialog setRequestedUserName:](self, "setRequestedUserName:", -[UITextField text](-[ACMSignInDialog accountNameField](self, "accountNameField"), "text"));
    -[ACMSignInDialogDelegate onSignIn:](-[ACMSignInDialog delegate](self, "delegate"), "onSignIn:", a3);
  }
  -[ACMiTunesSignInDialog_Modern setView:](self, "setView:", 0);
  -[ACMiTunesSignInDialog_Modern setIsPresented:](self, "setIsPresented:", 0);
}

- (void)didPresentAlertView:(id)a3
{
  UITextField *v4;
  _QWORD v5[5];

  if (-[ACMiTunesSignInDialog signInDialog](self, "signInDialog") == a3
    && !-[ACMiTunesSignInDialog_Modern isPresented](self, "isPresented"))
  {
    -[ACMiTunesSignInDialog_Modern setIsPresented:](self, "setIsPresented:", 1);
    v4 = -[ACMSignInDialog passwordField](self, "passwordField");
    if (-[ACMSignInDialog accountNameField](self, "accountNameField")
      && !-[NSString length](-[UITextField text](-[ACMSignInDialog accountNameField](self, "accountNameField"), "text"), "length"))
    {
      v4 = -[ACMSignInDialog accountNameField](self, "accountNameField");
    }
    if (v4 == -[ACMSignInDialog passwordField](self, "passwordField"))
    {
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = __52__ACMiTunesSignInDialog_Modern_didPresentAlertView___block_invoke;
      v5[3] = &unk_24FCE4FA8;
      v5[4] = v4;
      dispatch_async_on_main_thread((uint64_t)v5);
    }
  }
}

- (BOOL)isPresented
{
  return self->_isPresented;
}

- (void)setIsPresented:(BOOL)a3
{
  self->_isPresented = a3;
}

@end
