@implementation ACMSignInWidget_Modern

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);
  -[UITextField setDelegate:](-[ACMSignInWidget_Modern accountField](self, "accountField"), "setDelegate:", 0);

  self->_accountField = 0;
  -[UITextField setDelegate:](-[ACMSignInWidget_Modern passwordField](self, "passwordField"), "setDelegate:", 0);

  self->_passwordField = 0;
  self->_view = 0;
  -[ACMSignInWidget_Modern setAccountLabelText:](self, "setAccountLabelText:", 0);
  -[ACMSignInWidget_Modern setBackgroundColor:](self, "setBackgroundColor:", 0);
  -[ACMSignInWidget_Modern setPlaceholderAttributes:](self, "setPlaceholderAttributes:", 0);
  -[UIButton removeTarget:action:forControlEvents:](-[ACMSignInWidget_Modern accountClearButton](self, "accountClearButton"), "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  -[UIButton removeTarget:action:forControlEvents:](-[ACMSignInWidget_Modern passwordClearButton](self, "passwordClearButton"), "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  -[ACMSignInWidget_Modern setAccountClearButton:](self, "setAccountClearButton:", 0);
  -[ACMSignInWidget_Modern setPasswordClearButton:](self, "setPasswordClearButton:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMSignInWidget_Modern;
  -[ACMSignInWidget_Modern dealloc](&v3, sel_dealloc);
}

- (double)leftMargin
{
  _BOOL4 v2;
  double result;

  v2 = -[ACMSignInWidget_Modern hideMargin](self, "hideMargin");
  result = 15.0;
  if (v2)
    return 0.0;
  return result;
}

- (UIView)view
{
  UIView *result;
  uint64_t v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIView *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  id v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;
  id v33;
  UIColor *v34;

  result = self->_view;
  if (!result)
  {
    v4 = objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.5, 0.5, 0.5, 0.46);
    v5 = objc_alloc(MEMORY[0x24BDF6F90]);
    -[ACMSignInWidget_Modern position](self, "position");
    v7 = v6;
    -[ACMSignInWidget_Modern position](self, "position");
    v9 = v8;
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "scale");
    v11 = (UIView *)objc_msgSend(v5, "initWithFrame:", v7, v9, 320.0, dbl_22F80E4D0[v10 > 1.0] * 2.0 + 0.0);
    self->_view = v11;
    -[UIView setAutoresizingMask:](v11, "setAutoresizingMask:", 34);
    -[UITextField setAutoresizingMask:](-[ACMSignInWidget_Modern accountField](self, "accountField"), "setAutoresizingMask:", 34);
    -[UITextField frame](-[ACMSignInWidget_Modern accountField](self, "accountField"), "frame");
    v13 = v12;
    v15 = v14;
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "scale");
    if (v16 <= 1.0)
      v17 = 1.0;
    else
      v17 = 0.5;
    if (!-[ACMSignInWidget_Modern hideTopSeparator](self, "hideTopSeparator"))
    {
      v18 = objc_alloc(MEMORY[0x24BDF6F90]);
      -[UIView frame](-[ACMSignInWidget_Modern view](self, "view"), "frame");
      v19 = (id)objc_msgSend(v18, "initWithFrame:", 0.0, v13);
      objc_msgSend(v19, "setAutoresizingMask:", 34);
      objc_msgSend(v19, "setBackgroundColor:", v4);
      -[UIView addSubview:](self->_view, "addSubview:", v19);
    }
    -[UIView addSubview:](self->_view, "addSubview:", -[ACMSignInWidget_Modern accountField](self, "accountField"));
    v20 = objc_alloc(MEMORY[0x24BDF6F90]);
    -[ACMSignInWidget_Modern leftMargin](self, "leftMargin");
    v22 = v21;
    v23 = v13 + v15;
    -[UIView frame](-[ACMSignInWidget_Modern view](self, "view"), "frame");
    v25 = v24;
    -[ACMSignInWidget_Modern leftMargin](self, "leftMargin");
    v27 = (id)objc_msgSend(v20, "initWithFrame:", v22, v23, v25 - v26, v17);
    objc_msgSend(v27, "setAutoresizingMask:", 34);
    objc_msgSend(v27, "setBackgroundColor:", v4);
    -[UIView addSubview:](self->_view, "addSubview:", v27);
    -[UITextField setAutoresizingMask:](-[ACMSignInWidget_Modern passwordField](self, "passwordField"), "setAutoresizingMask:", 34);
    -[UIView addSubview:](self->_view, "addSubview:", -[ACMSignInWidget_Modern passwordField](self, "passwordField"));
    -[UITextField frame](-[ACMSignInWidget_Modern passwordField](self, "passwordField"), "frame");
    v29 = v28;
    v31 = v30;
    v32 = objc_alloc(MEMORY[0x24BDF6F90]);
    -[UIView frame](-[ACMSignInWidget_Modern view](self, "view"), "frame");
    v33 = (id)objc_msgSend(v32, "initWithFrame:", 0.0, v29 + v31);
    objc_msgSend(v33, "setAutoresizingMask:", 34);
    objc_msgSend(v33, "setBackgroundColor:", v4);
    -[UIView addSubview:](self->_view, "addSubview:", v33);
    -[ACMSignInWidget_Modern applyPlaceholderAttributes](self, "applyPlaceholderAttributes");
    if (-[ACMSignInWidget_Modern backgroundColor](self, "backgroundColor"))
      v34 = -[ACMSignInWidget_Modern backgroundColor](self, "backgroundColor");
    else
      v34 = (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    -[UIView setBackgroundColor:](self->_view, "setBackgroundColor:", v34);
    return self->_view;
  }
  return result;
}

- (id)textFieldFont
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "fontWithName:size:", CFSTR("Helvetica Neue"), 17.0);
}

- (void)applyPlaceholderAttributes
{
  id v3;
  id v4;
  NSString *v5;
  NSString *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8 = *MEMORY[0x24BDF65F8];
  v9[0] = -[ACMSignInWidget_Modern textFieldFont](self, "textFieldFont");
  v3 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  if (-[ACMSignInWidget_Modern placeholderAttributes](self, "placeholderAttributes"))
  {
    v4 = (id)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v4, "addEntriesFromDictionary:", -[ACMSignInWidget_Modern placeholderAttributes](self, "placeholderAttributes"));
    v3 = (id)objc_msgSend(v4, "copy");
  }
  if (-[ACMSignInWidget_Modern accountLabelText](self, "accountLabelText"))
    v5 = -[ACMSignInWidget_Modern accountLabelText](self, "accountLabelText");
  else
    v5 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Apple ID"));
  v6 = v5;
  if (objc_msgSend((id)objc_msgSend(+[ACMAppleConnectImplComponents components](ACMAppleConnectImplComponents, "components"), "systemInfo"), "isPreRelease"))v6 = -[NSString stringByAppendingString:](v6, "stringByAppendingString:", CFSTR(" (PRE-RELEASE)"));
  -[UITextField setAttributedPlaceholder:](-[ACMSignInWidget_Modern accountField](self, "accountField"), "setAttributedPlaceholder:", (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v6, v3));
  v7 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Password"));
  if (objc_msgSend((id)objc_msgSend(+[ACMAppleConnectImplComponents components](ACMAppleConnectImplComponents, "components"), "systemInfo"), "isPreRelease"))v7 = (id)objc_msgSend(v7, "stringByAppendingString:", CFSTR(" (PRE-RELEASE)"));
  -[UITextField setAttributedPlaceholder:](-[ACMSignInWidget_Modern passwordField](self, "passwordField"), "setAttributedPlaceholder:", (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v7, v3));
}

- (void)setPlaceholderAttributes:(id)a3
{
  NSDictionary *placeholderAttributes;
  NSDictionary *v6;

  placeholderAttributes = self->_placeholderAttributes;
  if (placeholderAttributes != a3)
  {

    v6 = (NSDictionary *)a3;
    self->_placeholderAttributes = v6;
    if (v6)
      -[ACMSignInWidget_Modern applyPlaceholderAttributes](self, "applyPlaceholderAttributes");
  }
}

- (id)clearButtonImage
{
  return (id)objc_msgSend(ACMImageWithName((uint64_t)CFSTR("buttonClear_iphone.png")), "imageWithRenderingMode:", 2);
}

- (id)createClearButtonForEditField:(id)a3
{
  void *v5;
  dispatch_time_t v6;
  _QWORD v8[6];

  objc_msgSend(a3, "setRightViewMode:", 0);
  objc_msgSend(a3, "setClearButtonMode:", 0);
  v5 = (void *)objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 0);
  objc_msgSend(v5, "setImage:forState:", -[ACMSignInWidget_Modern clearButtonImage](self, "clearButtonImage"), 0);
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel_clearTextField_, 64);
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel_touchIn_, 17);
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel_touchOut_, 160);
  objc_msgSend(v5, "frame");
  objc_msgSend(v5, "setFrame:");
  objc_msgSend(v5, "setImageEdgeInsets:", 0.0, 0.0, 0.0, 8.0);
  v6 = dispatch_time(0, 100000000);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__ACMSignInWidget_Modern_createClearButtonForEditField___block_invoke;
  v8[3] = &unk_24FCE5100;
  v8[4] = v5;
  v8[5] = a3;
  dispatch_after(v6, MEMORY[0x24BDAC9B8], v8);
  objc_msgSend(a3, "setRightView:", v5);
  return v5;
}

- (UITextField)accountField
{
  UITextField *accountField;
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  accountField = self->_accountField;
  if (!accountField)
  {
    v4 = -[ACMSignInWidget_Modern textFieldFont](self, "textFieldFont");
    v5 = objc_alloc(MEMORY[0x24BDF6EA8]);
    -[ACMSignInWidget_Modern leftMargin](self, "leftMargin");
    v7 = v6;
    -[ACMSignInWidget_Modern leftMargin](self, "leftMargin");
    v9 = 320.0 - v8;
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "scale");
    accountField = (UITextField *)objc_msgSend(v5, "initWithFrame:", v7, 0.0, v9, dbl_22F80E4D0[v10 > 1.0]);
    -[UITextField setTextAlignment:](accountField, "setTextAlignment:", 0);
    -[UITextField setBorderStyle:](accountField, "setBorderStyle:", 0);
    -[UITextField setReturnKeyType:](accountField, "setReturnKeyType:", 4);
    -[UITextField setContentVerticalAlignment:](accountField, "setContentVerticalAlignment:", 0);
    -[UITextField setAutocapitalizationType:](accountField, "setAutocapitalizationType:", 0);
    -[UITextField setAutocorrectionType:](accountField, "setAutocorrectionType:", 1);
    -[UITextField setClearButtonMode:](accountField, "setClearButtonMode:", 1);
    -[UITextField setTag:](accountField, "setTag:", 128);
    -[UITextField setKeyboardType:](accountField, "setKeyboardType:", 7);
    -[UITextField setDelegate:](accountField, "setDelegate:", self);
    -[UITextField setFont:](accountField, "setFont:", v4);
    -[ACMSignInWidget_Modern setAccountClearButton:](self, "setAccountClearButton:", -[ACMSignInWidget_Modern createClearButtonForEditField:](self, "createClearButtonForEditField:", accountField));
    self->_accountField = accountField;
  }
  return accountField;
}

- (UITextField)passwordField
{
  UITextField *passwordField;
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  passwordField = self->_passwordField;
  if (!passwordField)
  {
    v4 = -[ACMSignInWidget_Modern textFieldFont](self, "textFieldFont");
    v5 = objc_alloc(MEMORY[0x24BDF6EA8]);
    -[ACMSignInWidget_Modern leftMargin](self, "leftMargin");
    v7 = v6;
    -[UITextField frame](-[ACMSignInWidget_Modern accountField](self, "accountField"), "frame");
    v9 = v8;
    -[UITextField frame](-[ACMSignInWidget_Modern accountField](self, "accountField"), "frame");
    v11 = v9 + v10 + 0.0;
    -[ACMSignInWidget_Modern leftMargin](self, "leftMargin");
    v13 = 320.0 - v12;
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "scale");
    passwordField = (UITextField *)objc_msgSend(v5, "initWithFrame:", v7, v11, v13, dbl_22F80E4D0[v14 > 1.0]);
    -[UITextField setTextAlignment:](passwordField, "setTextAlignment:", 0);
    -[UITextField setBorderStyle:](passwordField, "setBorderStyle:", 0);
    -[UITextField setSecureTextEntry:](passwordField, "setSecureTextEntry:", 1);
    -[UITextField setReturnKeyType:](passwordField, "setReturnKeyType:", 1);
    -[UITextField setContentVerticalAlignment:](passwordField, "setContentVerticalAlignment:", 0);
    -[UITextField setEnablesReturnKeyAutomatically:](passwordField, "setEnablesReturnKeyAutomatically:", 0);
    -[UITextField setClearButtonMode:](passwordField, "setClearButtonMode:", 1);
    -[UITextField setTag:](passwordField, "setTag:", 129);
    -[UITextField setDelegate:](passwordField, "setDelegate:", self);
    -[UITextField setFont:](passwordField, "setFont:", v4);
    -[ACMSignInWidget_Modern setPasswordClearButton:](self, "setPasswordClearButton:", -[ACMSignInWidget_Modern createClearButtonForEditField:](self, "createClearButtonForEditField:", passwordField));
    self->_passwordField = passwordField;
  }
  return passwordField;
}

- (void)touchIn:(id)a3
{
  UIButton *v5;
  UITextField *v6;

  if (-[ACMSignInWidget_Modern accountClearButton](self, "accountClearButton") == a3)
  {
    v5 = -[ACMSignInWidget_Modern accountClearButton](self, "accountClearButton");
    v6 = -[ACMSignInWidget_Modern accountField](self, "accountField");
  }
  else if (-[ACMSignInWidget_Modern passwordClearButton](self, "passwordClearButton") == a3)
  {
    v5 = -[ACMSignInWidget_Modern passwordClearButton](self, "passwordClearButton");
    v6 = -[ACMSignInWidget_Modern passwordField](self, "passwordField");
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }
  -[UIButton setTintColor:](v5, "setTintColor:", -[UIColor colorWithAlphaComponent:](-[UITextField textColor](v6, "textColor"), "colorWithAlphaComponent:", 0.5));
}

- (void)touchOut:(id)a3
{
  UIButton *v5;
  UITextField *v6;

  if (-[ACMSignInWidget_Modern accountClearButton](self, "accountClearButton") == a3)
  {
    v5 = -[ACMSignInWidget_Modern accountClearButton](self, "accountClearButton");
    v6 = -[ACMSignInWidget_Modern accountField](self, "accountField");
  }
  else if (-[ACMSignInWidget_Modern passwordClearButton](self, "passwordClearButton") == a3)
  {
    v5 = -[ACMSignInWidget_Modern passwordClearButton](self, "passwordClearButton");
    v6 = -[ACMSignInWidget_Modern passwordField](self, "passwordField");
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }
  -[UIButton setTintColor:](v5, "setTintColor:", -[UITextField textColor](v6, "textColor"));
}

- (void)clearTextField:(id)a3
{
  UIButton *v5;
  UITextField *v6;
  UITextField *v7;

  if (-[ACMSignInWidget_Modern accountClearButton](self, "accountClearButton") == a3)
  {
    v5 = -[ACMSignInWidget_Modern accountClearButton](self, "accountClearButton");
    v7 = -[ACMSignInWidget_Modern accountField](self, "accountField");
  }
  else
  {
    if (-[ACMSignInWidget_Modern passwordClearButton](self, "passwordClearButton") != a3)
    {
      v5 = 0;
      v6 = 0;
      goto LABEL_7;
    }
    v5 = -[ACMSignInWidget_Modern passwordClearButton](self, "passwordClearButton");
    v7 = -[ACMSignInWidget_Modern passwordField](self, "passwordField");
  }
  v6 = v7;
LABEL_7:
  if (-[ACMSignInWidget_Modern textFieldShouldClear:](self, "textFieldShouldClear:", v6))
  {
    -[UITextField replaceRange:withText:](v6, "replaceRange:withText:", -[UITextField textRangeFromPosition:toPosition:](v6, "textRangeFromPosition:toPosition:", -[UITextField beginningOfDocument](v6, "beginningOfDocument"), -[UITextField endOfDocument](v6, "endOfDocument")), &stru_24FCE58F0);
    -[UITextField setRightViewMode:](v6, "setRightViewMode:", 0);
    -[UIButton setTintColor:](v5, "setTintColor:", -[UITextField textColor](v6, "textColor"));
  }
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  if (-[ACMSignInWidget_Modern accountField](self, "accountField") == a3)
  {
    -[UITextField resignFirstResponder](-[ACMSignInWidget_Modern accountField](self, "accountField"), "resignFirstResponder");
    -[UITextField becomeFirstResponder](-[ACMSignInWidget_Modern passwordField](self, "passwordField"), "becomeFirstResponder");
  }
  if (-[ACMSignInWidget_Modern passwordField](self, "passwordField") == a3
    && !-[ACMSignInWidget_Modern shouldAuthenticateOnUserInput](self, "shouldAuthenticateOnUserInput"))
  {
    -[UITextField resignFirstResponder](-[ACMSignInWidget_Modern passwordField](self, "passwordField"), "resignFirstResponder");
  }
  else if (-[ACMSignInWidget_Modern passwordField](self, "passwordField") == a3
         && -[NSString length](-[UITextField text](-[ACMSignInWidget_Modern passwordField](self, "passwordField"), "text"), "length")&& -[NSString length](-[UITextField text](-[ACMSignInWidget_Modern accountField](self, "accountField"), "text"), "length"))
  {
    -[UITextField resignFirstResponder](-[ACMSignInWidget_Modern passwordField](self, "passwordField"), "resignFirstResponder");
    -[ACMSignInWidgetDelegate onSignIn:](-[ACMSignInWidget_Modern delegate](self, "delegate"), "onSignIn:", self);
  }
  return 1;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  uint64_t v4;

  if (objc_msgSend((id)objc_msgSend(a3, "text"), "length"))
    v4 = 3;
  else
    v4 = 0;
  objc_msgSend(a3, "setRightViewMode:", v4);
}

- (void)textFieldDidEndEditing:(id)a3
{
  objc_msgSend(a3, "setRightViewMode:", 0);
}

- (BOOL)textFieldShouldClear:(id)a3
{
  return -[ACMSignInWidget_Modern textField:shouldChangeCharactersInRange:replacementString:](self, "textField:shouldChangeCharactersInRange:replacementString:", a3, 0, objc_msgSend((id)objc_msgSend(a3, "text"), "length"), &stru_24FCE58F0);
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v10;
  unint64_t v11;
  NSUInteger v12;
  unint64_t v13;
  uint64_t v14;

  length = a4.length;
  location = a4.location;
  if (-[ACMSignInWidget_Modern passwordField](self, "passwordField") == a3)
    v10 = 32;
  else
    v10 = 0;
  if (-[ACMSignInWidget_Modern accountField](self, "accountField") == a3)
    v11 = 128;
  else
    v11 = v10;
  v12 = objc_msgSend((id)objc_msgSend(a3, "text"), "length") - length;
  v13 = v12 + objc_msgSend(a5, "length");
  if (v13 <= v11)
  {
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "text"), "stringByReplacingCharactersInRange:withString:", location, length, a5), "length"))
    {
      v14 = 3;
    }
    else
    {
      v14 = 0;
    }
    objc_msgSend(a3, "setRightViewMode:", v14);
  }
  return v13 <= v11;
}

- (void)disableControls:(BOOL)a3
{
  UITextField *v4;
  UITextField *v5;

  if (a3)
  {
    if (-[UITextField isFirstResponder](-[ACMSignInWidget_Modern passwordField](self, "passwordField"), "isFirstResponder"))-[UITextField resignFirstResponder](-[ACMSignInWidget_Modern passwordField](self, "passwordField"), "resignFirstResponder");
    if (-[UITextField isFirstResponder](-[ACMSignInWidget_Modern accountField](self, "accountField"), "isFirstResponder"))-[UITextField resignFirstResponder](-[ACMSignInWidget_Modern accountField](self, "accountField"), "resignFirstResponder");
    -[UITextField setEnabled:](-[ACMSignInWidget_Modern accountField](self, "accountField"), "setEnabled:", 0);
    -[UITextField setEnabled:](-[ACMSignInWidget_Modern passwordField](self, "passwordField"), "setEnabled:", 0);
  }
  else
  {
    -[UITextField setEnabled:](-[ACMSignInWidget_Modern accountField](self, "accountField"), "setEnabled:", 1);
    -[UITextField setEnabled:](-[ACMSignInWidget_Modern passwordField](self, "passwordField"), "setEnabled:", 1);
    v4 = -[ACMSignInWidget_Modern accountField](self, "accountField");
    v5 = -[ACMSignInWidget_Modern passwordField](self, "passwordField");
    if (-[NSString length](-[UITextField text](-[ACMSignInWidget_Modern accountField](self, "accountField"), "text"), "length"))
    {
      v4 = -[ACMSignInWidget_Modern passwordField](self, "passwordField");
      v5 = -[ACMSignInWidget_Modern accountField](self, "accountField");
    }
    if ((-[UITextField isFirstResponder](v4, "isFirstResponder") & 1) == 0)
    {
      -[UITextField resignFirstResponder](v5, "resignFirstResponder");
      -[UITextField becomeFirstResponder](v4, "becomeFirstResponder");
    }
  }
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
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSString)accountLabelText
{
  return self->_accountLabelText;
}

- (void)setAccountLabelText:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (BOOL)shouldAuthenticateOnUserInput
{
  return self->_shouldAuthenticateOnUserInput;
}

- (void)setShouldAuthenticateOnUserInput:(BOOL)a3
{
  self->_shouldAuthenticateOnUserInput = a3;
}

- (CGPoint)position
{
  double x;
  double y;
  CGPoint result;

  x = self->_position.x;
  y = self->_position.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  self->_position = a3;
}

- (NSDictionary)placeholderAttributes
{
  return self->_placeholderAttributes;
}

- (UIButton)accountClearButton
{
  return self->_accountClearButton;
}

- (void)setAccountClearButton:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (UIButton)passwordClearButton
{
  return self->_passwordClearButton;
}

- (void)setPasswordClearButton:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (BOOL)hideTopSeparator
{
  return self->_hideTopSeparator;
}

- (void)setHideTopSeparator:(BOOL)a3
{
  self->_hideTopSeparator = a3;
}

- (BOOL)hideMargin
{
  return self->_hideMargin;
}

- (void)setHideMargin:(BOOL)a3
{
  self->_hideMargin = a3;
}

@end
