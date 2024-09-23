@implementation ACMSignInWidget

- (void)dealloc
{
  objc_super v3;

  -[UITableView setDelegate:](self->_table, "setDelegate:", 0);
  -[UITableView setDataSource:](self->_table, "setDataSource:", 0);
  -[UITableView removeFromSuperview](self->_table, "removeFromSuperview");

  self->_table = 0;
  self->_accountLabel = 0;
  -[UITextField setDelegate:](-[ACMSignInWidget accountField](self, "accountField"), "setDelegate:", 0);
  -[UITextField setDelegate:](-[ACMSignInWidget passwordField](self, "passwordField"), "setDelegate:", 0);
  -[ACMSignInWidget setAccountField:](self, "setAccountField:", 0);
  -[ACMSignInWidget setPasswordField:](self, "setPasswordField:", 0);
  -[ACMSignInWidget setBackgroundColor:](self, "setBackgroundColor:", 0);
  -[ACMSignInWidget setPlaceholderAttributes:](self, "setPlaceholderAttributes:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMSignInWidget;
  -[ACMSignInWidget dealloc](&v3, sel_dealloc);
}

- (CGPoint)position
{
  double v2;
  double v3;
  CGPoint result;

  -[UITableView frame](-[ACMSignInWidget table](self, "table"), "frame");
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;

  y = a3.y;
  x = a3.x;
  -[UITableView frame](-[ACMSignInWidget table](self, "table"), "frame");
  -[UITableView setFrame:](-[ACMSignInWidget table](self, "table"), "setFrame:", x, y, v6, v7);
}

- (UITableView)table
{
  UITableView *result;
  UITableView *v4;
  char v5;

  result = self->_table;
  if (!result)
  {
    v4 = (UITableView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E58]), "initWithFrame:style:", 1, 0.0, 0.0, 320.0, 112.0);
    self->_table = v4;
    -[UITableView setDelegate:](v4, "setDelegate:", self);
    -[UITableView setDataSource:](self->_table, "setDataSource:", self);
    -[UITableView setScrollEnabled:](self->_table, "setScrollEnabled:", 0);
    -[UITableView setShowsHorizontalScrollIndicator:](self->_table, "setShowsHorizontalScrollIndicator:", 0);
    -[UITableView setShowsVerticalScrollIndicator:](self->_table, "setShowsVerticalScrollIndicator:", 0);
    -[UITableView setBackgroundColor:](self->_table, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
    v5 = objc_opt_respondsToSelector();
    result = self->_table;
    if ((v5 & 1) != 0)
    {
      -[UITableView setBackgroundView:](result, "setBackgroundView:", 0);
      return self->_table;
    }
  }
  return result;
}

- (NSString)accountLabelText
{
  return -[UILabel text](-[ACMSignInWidget accountLabel](self, "accountLabel"), "text");
}

- (void)setAccountLabelText:(id)a3
{
  -[UILabel setText:](-[ACMSignInWidget accountLabel](self, "accountLabel"), "setText:", a3);
}

- (UITextField)accountField
{
  UITextField *result;

  result = self->_accountField;
  if (!result)
  {
    -[ACMSignInWidget accountEditCell](self, "accountEditCell");
    return self->_accountField;
  }
  return result;
}

- (void)setAccountField:(id)a3
{
  UITextField *accountField;
  UITextField *v6;

  accountField = self->_accountField;
  if (accountField != a3)
  {
    v6 = accountField;
    self->_accountField = (UITextField *)a3;
  }
}

- (UITextField)passwordField
{
  UITextField *result;

  result = self->_passwordField;
  if (!result)
  {
    -[ACMSignInWidget passwordEditCell](self, "passwordEditCell");
    return self->_passwordField;
  }
  return result;
}

- (void)setPasswordField:(id)a3
{
  UITextField *passwordField;
  UITextField *v6;

  passwordField = self->_passwordField;
  if (passwordField != a3)
  {
    v6 = passwordField;
    self->_passwordField = (UITextField *)a3;
  }
}

- (UILabel)accountLabel
{
  UILabel *result;

  result = self->_accountLabel;
  if (!result)
  {
    self->_accountLabel = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", 8.0, 7.0, 120.0, 30.0);
    -[UILabel setText:](self->_accountLabel, "setText:", +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Apple ID")));
    -[UILabel setTextAlignment:](self->_accountLabel, "setTextAlignment:", 0);
    -[UILabel setTextColor:](self->_accountLabel, "setTextColor:", objc_msgSend(MEMORY[0x24BDF6950], "blackColor"));
    -[UILabel setUserInteractionEnabled:](self->_accountLabel, "setUserInteractionEnabled:", 0);
    -[UILabel setBackgroundColor:](self->_accountLabel, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
    return self->_accountLabel;
  }
  return result;
}

- (UILabel)passwordLabel
{
  UILabel *v2;

  v2 = (UILabel *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", 8.0, 7.0, 120.0, 30.0);
  -[UILabel setText:](v2, "setText:", +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Password")));
  -[UILabel setTextAlignment:](v2, "setTextAlignment:", 0);
  -[UILabel setTextColor:](v2, "setTextColor:", objc_msgSend(MEMORY[0x24BDF6950], "blackColor"));
  -[UILabel setFont:](v2, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 16.0));
  -[UILabel setUserInteractionEnabled:](v2, "setUserInteractionEnabled:", 0);
  -[UILabel setBackgroundColor:](v2, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
  -[UILabel setTag:](v2, "setTag:", 130);
  return v2;
}

- (UITableViewCell)accountEditCell
{
  UITableViewCell *result;
  UITableViewCell *v4;
  UILabel *v5;
  id v6;
  double v7;
  double v8;
  void *v9;

  result = self->_accountEditCell;
  if (!result)
  {
    v4 = (UITableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("ACMAccountCell"));
    self->_accountEditCell = v4;
    -[UITableViewCell setFrame:](v4, "setFrame:", 0.0, 0.0, 320.0, 40.0);
    v5 = -[ACMSignInWidget accountLabel](self, "accountLabel");
    v6 = objc_alloc(MEMORY[0x24BDF6EA8]);
    v7 = 128.0;
    if (!v5)
      v7 = 8.0;
    v8 = 304.0;
    if (v5)
      v8 = 168.0;
    v9 = (void *)objc_msgSend(v6, "initWithFrame:", v7, 6.0, v8, 31.0);
    objc_msgSend(v9, "setPlaceholder:", +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("john.appleseed")));
    if (objc_msgSend((id)objc_msgSend(+[ACMAppleConnectImplComponents components](ACMAppleConnectImplComponents, "components"), "systemInfo"), "isPreRelease"))objc_msgSend(v9, "setPlaceholder:", objc_msgSend((id)objc_msgSend(v9, "placeholder"), "stringByAppendingString:", CFSTR(" (PRE-RELEASE)")));
    objc_msgSend(v9, "setTextAlignment:", 0);
    objc_msgSend(v9, "setBorderStyle:", 0);
    objc_msgSend(v9, "setTextColor:", objc_msgSend(MEMORY[0x24BDF6950], "blackColor"));
    objc_msgSend(v9, "setReturnKeyType:", 4);
    objc_msgSend(v9, "setContentVerticalAlignment:", 0);
    objc_msgSend(v9, "setAutocapitalizationType:", 0);
    objc_msgSend(v9, "setAutocorrectionType:", 1);
    objc_msgSend(v9, "setClearButtonMode:", 1);
    objc_msgSend(v9, "setTag:", 128);
    objc_msgSend(v9, "setDelegate:", self);
    -[ACMSignInWidget setAccountField:](self, "setAccountField:", v9);
    -[UITextField setKeyboardType:](-[ACMSignInWidget accountField](self, "accountField"), "setKeyboardType:", 7);
    if (v5)
      -[UIView addSubview:](-[UITableViewCell contentView](self->_accountEditCell, "contentView"), "addSubview:", v5);
    -[UIView addSubview:](-[UITableViewCell contentView](self->_accountEditCell, "contentView"), "addSubview:", v9);
    -[UITableViewCell setSelectionStyle:](self->_accountEditCell, "setSelectionStyle:", 0);
    return self->_accountEditCell;
  }
  return result;
}

- (UITableViewCell)passwordEditCell
{
  UITableViewCell *result;
  UITableViewCell *v4;
  UILabel *v5;
  id v6;
  double v7;
  double v8;
  void *v9;

  result = self->_passwordEditCell;
  if (!result)
  {
    v4 = (UITableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("ACMPasswordCell"));
    self->_passwordEditCell = v4;
    -[UITableViewCell setFrame:](v4, "setFrame:", 0.0, 0.0, 320.0, 40.0);
    v5 = -[ACMSignInWidget passwordLabel](self, "passwordLabel");
    v6 = objc_alloc(MEMORY[0x24BDF6EA8]);
    v7 = 128.0;
    if (!v5)
      v7 = 8.0;
    v8 = 304.0;
    if (v5)
      v8 = 168.0;
    v9 = (void *)objc_msgSend(v6, "initWithFrame:", v7, 6.0, v8, 31.0);
    objc_msgSend(v9, "setPlaceholder:", +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Required")));
    if (objc_msgSend((id)objc_msgSend(+[ACMAppleConnectImplComponents components](ACMAppleConnectImplComponents, "components"), "systemInfo"), "isPreRelease"))objc_msgSend(v9, "setPlaceholder:", objc_msgSend((id)objc_msgSend(v9, "placeholder"), "stringByAppendingString:", CFSTR(" (PRE-RELEASE)")));
    objc_msgSend(v9, "setTextAlignment:", 0);
    objc_msgSend(v9, "setBorderStyle:", 0);
    objc_msgSend(v9, "setTextColor:", objc_msgSend(MEMORY[0x24BDF6950], "blackColor"));
    objc_msgSend(v9, "setSecureTextEntry:", 1);
    objc_msgSend(v9, "setReturnKeyType:", 1);
    objc_msgSend(v9, "setContentVerticalAlignment:", 0);
    objc_msgSend(v9, "setEnablesReturnKeyAutomatically:", 0);
    objc_msgSend(v9, "setClearButtonMode:", 1);
    objc_msgSend(v9, "setTag:", 129);
    objc_msgSend(v9, "setDelegate:", self);
    -[ACMSignInWidget setPasswordField:](self, "setPasswordField:", v9);
    if (v5)
      -[UIView addSubview:](-[UITableViewCell contentView](self->_passwordEditCell, "contentView"), "addSubview:", v5);
    -[UIView addSubview:](-[UITableViewCell contentView](self->_passwordEditCell, "contentView"), "addSubview:", v9);
    -[UITableViewCell setSelectionStyle:](self->_passwordEditCell, "setSelectionStyle:", 0);
    return self->_passwordEditCell;
  }
  return result;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  if (objc_msgSend(a4, "row", a3))
    return -[ACMSignInWidget passwordEditCell](self, "passwordEditCell");
  else
    return -[ACMSignInWidget accountEditCell](self, "accountEditCell");
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  if (-[ACMSignInWidget accountField](self, "accountField") == a3)
  {
    -[UITextField resignFirstResponder](-[ACMSignInWidget accountField](self, "accountField"), "resignFirstResponder");
    -[UITextField becomeFirstResponder](-[ACMSignInWidget passwordField](self, "passwordField"), "becomeFirstResponder");
  }
  if (-[ACMSignInWidget passwordField](self, "passwordField") == a3
    && !-[ACMSignInWidget shouldAuthenticateOnUserInput](self, "shouldAuthenticateOnUserInput"))
  {
    -[UITextField resignFirstResponder](-[ACMSignInWidget passwordField](self, "passwordField"), "resignFirstResponder");
  }
  else if (-[ACMSignInWidget passwordField](self, "passwordField") == a3
         && -[NSString length](-[UITextField text](-[ACMSignInWidget passwordField](self, "passwordField"), "text"), "length")&& -[NSString length](-[UITextField text](-[ACMSignInWidget accountField](self, "accountField"), "text"), "length"))
  {
    -[UITextField resignFirstResponder](-[ACMSignInWidget passwordField](self, "passwordField"), "resignFirstResponder");
    -[ACMSignInWidget onSignIn:](self, "onSignIn:", -[ACMSignInWidget passwordField](self, "passwordField"));
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
  v9 = 32 * (-[ACMSignInWidget passwordField](self, "passwordField", a3, a4.location) == a3);
  if (-[ACMSignInWidget accountField](self, "accountField") == a3)
    v10 = 128;
  else
    v10 = v9;
  v11 = objc_msgSend((id)objc_msgSend(a3, "text"), "length") - length;
  return v11 + objc_msgSend(a5, "length") <= v10;
}

- (void)disableControls:(BOOL)a3
{
  UITextField *v4;
  UITextField *v5;

  if (a3)
  {
    if (-[UITextField isFirstResponder](-[ACMSignInWidget passwordField](self, "passwordField"), "isFirstResponder"))-[UITextField resignFirstResponder](-[ACMSignInWidget passwordField](self, "passwordField"), "resignFirstResponder");
    if (-[UITextField isFirstResponder](-[ACMSignInWidget accountField](self, "accountField"), "isFirstResponder"))-[UITextField resignFirstResponder](-[ACMSignInWidget accountField](self, "accountField"), "resignFirstResponder");
    -[UITextField setEnabled:](-[ACMSignInWidget accountField](self, "accountField"), "setEnabled:", 0);
    -[UITextField setEnabled:](-[ACMSignInWidget passwordField](self, "passwordField"), "setEnabled:", 0);
  }
  else
  {
    -[UITextField setEnabled:](-[ACMSignInWidget accountField](self, "accountField"), "setEnabled:", 1);
    -[UITextField setEnabled:](-[ACMSignInWidget passwordField](self, "passwordField"), "setEnabled:", 1);
    v4 = -[ACMSignInWidget accountField](self, "accountField");
    v5 = -[ACMSignInWidget passwordField](self, "passwordField");
    if (-[NSString length](-[UITextField text](-[ACMSignInWidget accountField](self, "accountField"), "text"), "length"))
    {
      v4 = -[ACMSignInWidget passwordField](self, "passwordField");
      v5 = -[ACMSignInWidget accountField](self, "accountField");
    }
    if ((-[UITextField isFirstResponder](v4, "isFirstResponder") & 1) == 0)
    {
      -[UITextField resignFirstResponder](v5, "resignFirstResponder");
      -[UITextField becomeFirstResponder](v4, "becomeFirstResponder");
    }
  }
}

- (void)onSignIn:(id)a3
{
  -[ACMSignInWidgetDelegate onSignIn:](-[ACMSignInWidget delegate](self, "delegate", a3), "onSignIn:", self);
}

- (ACMSignInWidgetDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (ACMSignInWidgetDelegate *)a3;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSDictionary)placeholderAttributes
{
  return self->_placeholderAttributes;
}

- (void)setPlaceholderAttributes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (BOOL)shouldAuthenticateOnUserInput
{
  return self->_shouldAuthenticateOnUserInput;
}

- (void)setShouldAuthenticateOnUserInput:(BOOL)a3
{
  self->_shouldAuthenticateOnUserInput = a3;
}

uint64_t __56__ACMSignInWidget_Modern_createClearButtonForEditField___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTintColor:", objc_msgSend(*(id *)(a1 + 40), "textColor"));
}

@end
