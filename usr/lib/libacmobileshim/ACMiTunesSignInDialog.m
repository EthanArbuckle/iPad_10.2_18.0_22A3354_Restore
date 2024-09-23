@implementation ACMiTunesSignInDialog

- (void)dealloc
{
  objc_super v3;

  -[UITextField setDelegate:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setDelegate:", 0);
  -[ACMSignInDialog setAccountNameField:](self, "setAccountNameField:", 0);
  -[UITextField setDelegate:](-[ACMSignInDialog passwordField](self, "passwordField"), "setDelegate:", 0);
  -[ACMSignInDialog setPasswordField:](self, "setPasswordField:", 0);
  -[ACMiTunesSignInDialog setTitleField:](self, "setTitleField:", 0);
  -[UIAlertView setDelegate:](-[ACMiTunesSignInDialog signInDialog](self, "signInDialog"), "setDelegate:", 0);
  -[ACMiTunesSignInDialog setView:](self, "setView:", 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)ACMiTunesSignInDialog;
  -[ACMSignInDialog dealloc](&v3, sel_dealloc);
}

- (id)dialogTitle
{
  NSString *v3;

  if (!-[ACMiTunesSignInDialog alertViewPrompt](self, "alertViewPrompt")
    || !-[NSString length](-[ACMiTunesSignInDialog alertViewPrompt](self, "alertViewPrompt"), "length"))
  {
    return +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Apple ID password"));
  }
  v3 = -[ACMiTunesSignInDialog alertViewPrompt](self, "alertViewPrompt");
  if (-[NSString length](v3, "length") < 0x47)
    return v3;
  else
    return -[NSString stringByAppendingString:](-[NSString substringToIndex:](v3, "substringToIndex:", 70), "stringByAppendingString:", CFSTR("…"));
}

- (void)didPresentAlertView:(id)a3
{
  UITextField *v4;

  if (-[NSString length](-[UITextField text](-[ACMSignInDialog accountNameField](self, "accountNameField", a3), "text"), "length"))
  {
    v4 = -[ACMSignInDialog passwordField](self, "passwordField");
  }
  else
  {
    v4 = -[ACMSignInDialog accountNameField](self, "accountNameField");
  }
  -[UITextField becomeFirstResponder](v4, "becomeFirstResponder");
}

- (void)viewDidLoad
{
  id v3;
  id v4;
  void *v5;
  objc_super v6;

  if (!-[ACMSignInDialog accountNameField](self, "accountNameField"))
  {
    v3 = objc_alloc(MEMORY[0x24BDF6EA8]);
    -[ACMiTunesSignInDialog userNameFrame](self, "userNameFrame");
    -[ACMSignInDialog setAccountNameField:](self, "setAccountNameField:", (id)objc_msgSend(v3, "initWithFrame:"));
    -[UITextField setAutoresizingMask:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setAutoresizingMask:", 34);
    -[UITextField setBorderStyle:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setBorderStyle:", 2);
    -[UITextField setContentVerticalAlignment:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setContentVerticalAlignment:", 0);
    -[UITextField setReturnKeyType:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setReturnKeyType:", 4);
    -[UITextField setTextColor:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setTextColor:", objc_msgSend(MEMORY[0x24BDF6950], "blackColor"));
    -[UITextField setAutocapitalizationType:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setAutocapitalizationType:", 0);
    -[UITextField setAutocorrectionType:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setAutocorrectionType:", 1);
    -[UITextField setBackgroundColor:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "whiteColor"));
    -[UITextField setKeyboardAppearance:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setKeyboardAppearance:", 1);
    -[UITextField setKeyboardType:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setKeyboardType:", 7);
    -[UITextField setClearButtonMode:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setClearButtonMode:", 1);
    -[UITextField setOpaque:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setOpaque:", 0);
    -[UITextField setDelegate:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setDelegate:", self);
    -[UITextField setPlaceholder:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setPlaceholder:", +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Apple ID")));
    if (objc_msgSend((id)objc_msgSend(+[ACMAppleConnectImplComponents components](ACMAppleConnectImplComponents, "components"), "systemInfo"), "isPreRelease"))-[UITextField setPlaceholder:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setPlaceholder:", -[NSString stringByAppendingString:](-[UITextField placeholder](-[ACMSignInDialog accountNameField](self, "accountNameField"), "placeholder"), "stringByAppendingString:", CFSTR(" (PRE-RELEASE)")));
    -[UITextField setText:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setText:", -[ACMSignInDialog requestedUserName](self, "requestedUserName"));
    if (!-[ACMiTunesSignInDialog isUserNameEditable](self, "isUserNameEditable")
      && -[NSString length](-[ACMSignInDialog requestedUserName](self, "requestedUserName"), "length"))
    {
      -[UITextField setBorderStyle:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setBorderStyle:", 0);
      -[UITextField setBackgroundColor:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
      -[UITextField setText:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setText:", -[ACMSignInDialog requestedUserName](self, "requestedUserName"));
      -[UITextField setTextColor:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setTextColor:", objc_msgSend(MEMORY[0x24BDF6950], "whiteColor"));
      -[UITextField setContentHorizontalAlignment:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setContentHorizontalAlignment:", 0);
      -[UITextField setUserInteractionEnabled:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setUserInteractionEnabled:", 0);
      -[UITextField setTextAlignment:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setTextAlignment:", 1);
      -[UITextField setClearButtonMode:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setClearButtonMode:", 0);
      -[UITextField setAccessibilityTraits:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setAccessibilityTraits:", *MEMORY[0x24BDF73E8]);
    }
  }
  if (!-[ACMSignInDialog passwordField](self, "passwordField"))
  {
    v4 = objc_alloc(MEMORY[0x24BDF6EA8]);
    -[ACMiTunesSignInDialog passwordFrame](self, "passwordFrame");
    -[ACMSignInDialog setPasswordField:](self, "setPasswordField:", (id)objc_msgSend(v4, "initWithFrame:"));
    -[UITextField setAutoresizingMask:](-[ACMSignInDialog passwordField](self, "passwordField"), "setAutoresizingMask:", 34);
    -[UITextField setBorderStyle:](-[ACMSignInDialog passwordField](self, "passwordField"), "setBorderStyle:", 2);
    -[UITextField setContentVerticalAlignment:](-[ACMSignInDialog passwordField](self, "passwordField"), "setContentVerticalAlignment:", 0);
    -[UITextField setReturnKeyType:](-[ACMSignInDialog passwordField](self, "passwordField"), "setReturnKeyType:", 1);
    -[UITextField setTextColor:](-[ACMSignInDialog passwordField](self, "passwordField"), "setTextColor:", objc_msgSend(MEMORY[0x24BDF6950], "blackColor"));
    -[UITextField setAutocapitalizationType:](-[ACMSignInDialog passwordField](self, "passwordField"), "setAutocapitalizationType:", 0);
    -[UITextField setAutocorrectionType:](-[ACMSignInDialog passwordField](self, "passwordField"), "setAutocorrectionType:", 1);
    -[UITextField setBackgroundColor:](-[ACMSignInDialog passwordField](self, "passwordField"), "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "whiteColor"));
    -[UITextField setSecureTextEntry:](-[ACMSignInDialog passwordField](self, "passwordField"), "setSecureTextEntry:", 1);
    -[UITextField setKeyboardAppearance:](-[ACMSignInDialog passwordField](self, "passwordField"), "setKeyboardAppearance:", 1);
    -[UITextField setClearButtonMode:](-[ACMSignInDialog passwordField](self, "passwordField"), "setClearButtonMode:", 1);
    -[UITextField setDelegate:](-[ACMSignInDialog passwordField](self, "passwordField"), "setDelegate:", self);
    -[UITextField setPlaceholder:](-[ACMSignInDialog passwordField](self, "passwordField"), "setPlaceholder:", +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Password")));
    if (objc_msgSend((id)objc_msgSend(+[ACMAppleConnectImplComponents components](ACMAppleConnectImplComponents, "components"), "systemInfo"), "isPreRelease"))-[UITextField setPlaceholder:](-[ACMSignInDialog passwordField](self, "passwordField"), "setPlaceholder:", -[NSString stringByAppendingString:](-[UITextField placeholder](-[ACMSignInDialog passwordField](self, "passwordField"), "placeholder"), "stringByAppendingString:", CFSTR(" (PRE-RELEASE)")));
  }
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  if ((objc_opt_respondsToSelector() & 1) == 0
    || !objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_didRotate_, *MEMORY[0x24BDF76D8], 0);
  }
  v6.receiver = self;
  v6.super_class = (Class)ACMiTunesSignInDialog;
  -[ACMiTunesSignInDialog viewDidLoad](&v6, sel_viewDidLoad);
}

- (BOOL)isPortraitMode
{
  return (unint64_t)(objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "statusBarOrientation")- 1) < 2;
}

- (BOOL)changeTitleStringIfNeeded
{
  NSString *v3;
  void *v4;
  double v5;
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
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  NSString *v22;
  int64_t v23;
  double v24;
  NSString *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
  {
    return 0;
  }
  if (-[ACMiTunesSignInDialog isPortraitMode](self, "isPortraitMode"))
  {
    if (!-[NSString isEqualToString:](-[UIAlertView title](-[ACMiTunesSignInDialog signInDialog](self, "signInDialog"), "title"), "isEqualToString:", -[ACMiTunesSignInDialog titleField](self, "titleField")))
    {
      -[UIAlertView setTitle:](-[ACMiTunesSignInDialog signInDialog](self, "signInDialog"), "setTitle:", -[ACMiTunesSignInDialog titleField](self, "titleField"));
      v3 = -[NSString stringByReplacingOccurrencesOfString:withString:](-[ACMiTunesSignInDialog titleField](self, "titleField"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_24FCE58F0);
      v4 = (void *)MEMORY[0x24BDF6A70];
      objc_msgSend(MEMORY[0x24BDF6A70], "systemFontSize");
      -[NSString sizeWithFont:](v3, "sizeWithFont:", objc_msgSend(v4, "systemFontOfSize:"));
      -[ACMiTunesSignInDialog setTitleStringSize:](self, "setTitleStringSize:");
      -[ACMiTunesSignInDialog userNameFrame](self, "userNameFrame");
      v6 = v5;
      v8 = v7;
      v10 = v9;
      v12 = v11;
      -[ACMiTunesSignInDialog passwordFrame](self, "passwordFrame");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;
      -[ACMiTunesSignInDialog titleStringSize](self, "titleStringSize");
      if (floor(v21 / 190.0) == 1.0)
      {
        v16 = v16 + 10.0;
        v8 = v8 + 10.0;
      }
      -[UITextField setFrame:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setFrame:", v6, v8, v10, v12);
      goto LABEL_14;
    }
    return 0;
  }
  v22 = -[NSString stringByReplacingOccurrencesOfString:withString:](-[ACMiTunesSignInDialog titleField](self, "titleField"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_24FCE58F0);
  v23 = -[NSString length](-[NSString stringByReplacingOccurrencesOfString:withString:](-[ACMiTunesSignInDialog titleField](self, "titleField"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_24FCE58F0), "length");
  -[ACMiTunesSignInDialog titleStringSize](self, "titleStringSize");
  if (v24 <= 190.0 || v23 < 21)
    return 0;
  v27 = -[NSString substringToIndex:](v22, "substringToIndex:", 19);
  -[UIAlertView setTitle:](-[ACMiTunesSignInDialog signInDialog](self, "signInDialog"), "setTitle:", -[NSString stringByAppendingString:](-[NSString stringByAppendingString:](v27, "stringByAppendingString:", CFSTR("…")), "stringByAppendingString:", CFSTR("\n\n\n\n\n\n")));
  v28 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontSize");
  -[NSString sizeWithFont:](v27, "sizeWithFont:", objc_msgSend(v28, "systemFontOfSize:"));
  -[ACMiTunesSignInDialog setTitleStringSize:](self, "setTitleStringSize:");
  -[ACMiTunesSignInDialog userNameFrame](self, "userNameFrame");
  -[UITextField setFrame:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setFrame:", v29, v30, v31, v32);
  -[ACMiTunesSignInDialog passwordFrame](self, "passwordFrame");
  v14 = v33;
  v16 = v34;
  v18 = v35;
  v20 = v36;
LABEL_14:
  -[UITextField setFrame:](-[ACMSignInDialog passwordField](self, "passwordField"), "setFrame:", v14, v16, v18, v20);
  return 1;
}

- (void)didRotate:(id)a3
{
  uint64_t v4;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice", a3);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || !objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
  {
    v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "statusBarOrientation");
    if (-[ACMiTunesSignInDialog previousInterfaceOrientation](self, "previousInterfaceOrientation") != v4)
    {
      -[ACMiTunesSignInDialog setPreviousInterfaceOrientation:](self, "setPreviousInterfaceOrientation:", v4);
      -[ACMiTunesSignInDialog handleRotation](self, "handleRotation");
    }
  }
}

- (void)showWithParentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  if (!-[ACMiTunesSignInDialog isShown](self, "isShown", a3, a4))
  {
    -[UIAlertView show](-[ACMiTunesSignInDialog signInDialog](self, "signInDialog"), "show");
    -[ACMiTunesSignInDialog setIsShown:](self, "setIsShown:", 1);
    if (a5)
      (*((void (**)(id))a5 + 2))(a5);
  }
}

- (void)hideWithParentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  if (-[ACMiTunesSignInDialog isShown](self, "isShown", a3, a4))
    -[ACMiTunesSignInDialog setIsShown:](self, "setIsShown:", 0);
  if (a5)
    (*((void (**)(id))a5 + 2))(a5);
}

- (void)disableControls:(BOOL)a3
{
  if (-[ACMiTunesSignInDialog isShown](self, "isShown")
    && !a3
    && !-[UIAlertView isVisible](-[ACMiTunesSignInDialog signInDialog](self, "signInDialog"), "isVisible"))
  {
    -[UIAlertView show](-[ACMiTunesSignInDialog signInDialog](self, "signInDialog"), "show");
  }
}

- (NSString)passwordString
{
  return -[UITextField text](-[ACMSignInDialog passwordField](self, "passwordField"), "text");
}

- (NSString)userNameString
{
  if (-[ACMiTunesSignInDialog isUserNameEditable](self, "isUserNameEditable"))
    return -[UITextField text](-[ACMSignInDialog accountNameField](self, "accountNameField"), "text");
  else
    return -[ACMSignInDialog requestedUserName](self, "requestedUserName");
}

- (int64_t)statusBarStyle
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "statusBarStyle");
}

- (void)cancel
{
  objc_super v3;

  -[UIAlertView dismissWithClickedButtonIndex:animated:](-[ACMiTunesSignInDialog signInDialog](self, "signInDialog"), "dismissWithClickedButtonIndex:animated:", 0, 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMiTunesSignInDialog;
  -[ACMSignInDialog cancel](&v3, sel_cancel);
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
    -[ACMSignInDialogDelegate onSignIn:](-[ACMSignInDialog delegate](self, "delegate"), "onSignIn:", a3);
    -[UIAlertView dismissWithClickedButtonIndex:animated:](-[ACMiTunesSignInDialog signInDialog](self, "signInDialog"), "dismissWithClickedButtonIndex:animated:", 0, 1);
    -[UITextField resignFirstResponder](-[ACMSignInDialog passwordField](self, "passwordField"), "resignFirstResponder");
    return 1;
  }
  return -[ACMiTunesSignInDialog shouldPasswordTextFieldReturnOnSignInDisallowed](self, "shouldPasswordTextFieldReturnOnSignInDisallowed");
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

- (BOOL)shouldPasswordTextFieldReturnOnSignInDisallowed
{
  return 0;
}

- (NSString)titleField
{
  return (NSString *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setTitleField:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1040);
}

- (BOOL)isShown
{
  return self->_isShown;
}

- (void)setIsShown:(BOOL)a3
{
  self->_isShown = a3;
}

- (BOOL)isUserNameEditable
{
  return self->_isUserNameEditable;
}

- (void)setIsUserNameEditable:(BOOL)a3
{
  self->_isUserNameEditable = a3;
}

- (int64_t)previousInterfaceOrientation
{
  return self->_previousInterfaceOrientation;
}

- (void)setPreviousInterfaceOrientation:(int64_t)a3
{
  self->_previousInterfaceOrientation = a3;
}

- (CGSize)titleStringSize
{
  double width;
  double height;
  CGSize result;

  width = self->_titleStringSize.width;
  height = self->_titleStringSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setTitleStringSize:(CGSize)a3
{
  self->_titleStringSize = a3;
}

- (NSString)alertViewPrompt
{
  return self->_alertViewPrompt;
}

- (void)setAlertViewPrompt:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1080);
}

- (CGRect)userNameFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_userNameFrame, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)passwordFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_passwordFrame, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t __52__ACMiTunesSignInDialog_Modern_didPresentAlertView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "becomeFirstResponder");
}

uint64_t __63__ACMiTunesSignInDialog_Legacy_alertView_clickedButtonAtIndex___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "onSignInCancel:", *(_QWORD *)(a1 + 40));
}

@end
