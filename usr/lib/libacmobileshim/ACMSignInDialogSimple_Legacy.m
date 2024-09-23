@implementation ACMSignInDialogSimple_Legacy

- (ACMSignInDialogSimple_Legacy)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ACMSignInDialogSimple_Legacy;
  return -[ACMSignInDialogSimple_Legacy initWithNibName:bundle:](&v5, sel_initWithNibName_bundle_, a3, a4);
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  objc_super v5;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = *MEMORY[0x24BDF7F58];
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7F58], -[ACMSignInDialogSimple_Legacy passwordField](self, "passwordField"));
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:name:object:", self, v4, -[ACMSignInDialogSimple_Legacy accountNameField](self, "accountNameField"));
  v5.receiver = self;
  v5.super_class = (Class)ACMSignInDialogSimple_Legacy;
  -[ACMSignInDialogSimple dealloc](&v5, sel_dealloc);
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ACMSignInDialogSimple_Legacy;
  -[ACMSignInDialogSimple_Legacy didReceiveMemoryWarning](&v2, sel_didReceiveMemoryWarning);
}

- (void)loadView
{
  __assert_rtn("-[ACMSignInDialogSimple_Legacy loadView]", "ACMSignInDialogSimple_Legacy.m", 46, "nil != self.delegate");
}

- (id)accountNameField
{
  id result;
  ACMSimpleTextField *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSString *v14;
  void *v15;
  uint64_t v16;
  double v17;

  result = self->super.super._accountNameField;
  if (!result)
  {
    v4 = [ACMSimpleTextField alloc];
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "bounds");
    v6 = v5;
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
    {
      v7 = 348.0;
    }
    else
    {
      v7 = 280.0;
    }
    v8 = v6 - v7;
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
    {
      v9 = 118.0;
    }
    else
    {
      v9 = 75.0;
    }
    v10 = v8 * 0.5;
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
    {
      v11 = 348.0;
    }
    else
    {
      v11 = 280.0;
    }
    v12 = floor(v10);
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
    {
      v13 = 43.0;
    }
    else
    {
      v13 = 33.0;
    }
    self->super.super._accountNameField = (UITextField *)-[ACMSimpleTextField initWithFrame:](v4, "initWithFrame:", v12, v9, v11, v13);
    if (-[ACMSignInDialogSimple accountNameFieldPlaceholder](self, "accountNameFieldPlaceholder"))
      v14 = -[ACMSignInDialogSimple accountNameFieldPlaceholder](self, "accountNameFieldPlaceholder");
    else
      v14 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Apple ID"));
    -[UITextField setPlaceholder:](self->super.super._accountNameField, "setPlaceholder:", v14);
    if (objc_msgSend((id)objc_msgSend(+[ACMAppleConnectImplComponents components](ACMAppleConnectImplComponents, "components"), "systemInfo"), "isPreRelease"))-[UITextField setPlaceholder:](self->super.super._accountNameField, "setPlaceholder:", -[NSString stringByAppendingString:](-[UITextField placeholder](self->super.super._accountNameField, "placeholder"), "stringByAppendingString:", CFSTR(" (PRE-RELEASE)")));
    -[UITextField setTextAlignment:](self->super.super._accountNameField, "setTextAlignment:", 0);
    -[UITextField setTextColor:](self->super.super._accountNameField, "setTextColor:", objc_msgSend(MEMORY[0x24BDF6950], "blackColor"));
    -[UITextField setReturnKeyType:](self->super.super._accountNameField, "setReturnKeyType:", 4);
    -[UITextField setContentVerticalAlignment:](self->super.super._accountNameField, "setContentVerticalAlignment:", 0);
    -[UITextField setAutocapitalizationType:](self->super.super._accountNameField, "setAutocapitalizationType:", 0);
    -[UITextField setAutocorrectionType:](self->super.super._accountNameField, "setAutocorrectionType:", 1);
    -[UITextField setClearButtonMode:](self->super.super._accountNameField, "setClearButtonMode:", 1);
    v15 = (void *)MEMORY[0x24BDF6A70];
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (v16 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"),
          v17 = 22.0,
          !v16))
    {
      v17 = 18.0;
    }
    -[UITextField setFont:](self->super.super._accountNameField, "setFont:", objc_msgSend(v15, "systemFontOfSize:", v17));
    -[UITextField setAutoresizingMask:](self->super.super._accountNameField, "setAutoresizingMask:", 37);
    -[UITextField setDelegate:](self->super.super._accountNameField, "setDelegate:", self);
    -[UITextField setKeyboardType:](self->super.super._accountNameField, "setKeyboardType:", 7);
    -[UITextField setExclusiveTouch:](self->super.super._accountNameField, "setExclusiveTouch:", 1);
    return self->super.super._accountNameField;
  }
  return result;
}

- (id)passwordField
{
  id result;
  ACMSimpleTextField *v4;
  double v5;
  double v6;
  double v7;
  int v8;
  float v9;
  float v10;
  double v11;
  float v12;
  float v13;
  double v14;
  float v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  double v21;

  result = self->super.super._passwordField;
  if (!result)
  {
    v4 = [ACMSimpleTextField alloc];
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "bounds");
    v6 = v5;
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
    {
      v7 = 348.0;
    }
    else
    {
      v7 = 280.0;
    }
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
    {
      *(float *)&v8 = 118.0;
    }
    else
    {
      *(float *)&v8 = 75.0;
    }
    v9 = *(float *)&v8;
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
    {
      v10 = 43.0;
    }
    else
    {
      v10 = 33.0;
    }
    v11 = v6 - v7;
    v12 = v9 + v10;
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
    {
      v13 = 34.0;
    }
    else
    {
      v13 = 25.0;
    }
    v14 = v11 * 0.5;
    v15 = v12 + v13;
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
    {
      v16 = 348.0;
    }
    else
    {
      v16 = 280.0;
    }
    v17 = floor(v14);
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
    {
      v18 = 43.0;
    }
    else
    {
      v18 = 33.0;
    }
    self->super.super._passwordField = (UITextField *)-[ACMSimpleTextField initWithFrame:](v4, "initWithFrame:", v17, v15, v16, v18);
    -[UITextField setPlaceholder:](self->super.super._passwordField, "setPlaceholder:", +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Password")));
    if (objc_msgSend((id)objc_msgSend(+[ACMAppleConnectImplComponents components](ACMAppleConnectImplComponents, "components"), "systemInfo"), "isPreRelease"))-[UITextField setPlaceholder:](self->super.super._passwordField, "setPlaceholder:", -[NSString stringByAppendingString:](-[UITextField placeholder](self->super.super._passwordField, "placeholder"), "stringByAppendingString:", CFSTR(" (PRE-RELEASE)")));
    -[UITextField setTextAlignment:](self->super.super._passwordField, "setTextAlignment:", 0);
    -[UITextField setTextColor:](self->super.super._passwordField, "setTextColor:", objc_msgSend(MEMORY[0x24BDF6950], "blackColor"));
    -[UITextField setSecureTextEntry:](self->super.super._passwordField, "setSecureTextEntry:", 1);
    -[UITextField setReturnKeyType:](self->super.super._passwordField, "setReturnKeyType:", 1);
    -[UITextField setContentVerticalAlignment:](self->super.super._passwordField, "setContentVerticalAlignment:", 0);
    -[UITextField setEnablesReturnKeyAutomatically:](self->super.super._passwordField, "setEnablesReturnKeyAutomatically:", 0);
    -[UITextField setClearButtonMode:](self->super.super._passwordField, "setClearButtonMode:", 1);
    v19 = (void *)MEMORY[0x24BDF6A70];
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (v20 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"),
          v21 = 22.0,
          !v20))
    {
      v21 = 18.0;
    }
    -[UITextField setFont:](self->super.super._passwordField, "setFont:", objc_msgSend(v19, "systemFontOfSize:", v21));
    -[UITextField setAutoresizingMask:](self->super.super._passwordField, "setAutoresizingMask:", 37);
    -[UITextField setDelegate:](self->super.super._passwordField, "setDelegate:", self);
    return self->super.super._passwordField;
  }
  return result;
}

- (id)loginButton
{
  id result;
  const __CFString *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  UIButton *v10;
  void *v11;
  uint64_t v12;
  double v13;

  if (!-[ACMSignInDialog delegate](self, "delegate"))
    -[ACMSignInDialogSimple_Legacy loginButton].cold.1();
  result = self->super._loginButton;
  if (!result)
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v4 = CFSTR("blueButton.png");
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
    {
      v4 = CFSTR("blueButton_iPad.png");
    }
    v5 = ACMImageWithName((uint64_t)v4);
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
    {
      v6 = 8;
    }
    else
    {
      v6 = 6;
    }
    v7 = objc_msgSend(v5, "stretchableImageWithLeftCapWidth:topCapHeight:", v6, 0);
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
    {
      v8 = 101.0;
    }
    else
    {
      v8 = 78.0;
    }
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
    {
      v9 = 38.0;
    }
    else
    {
      v9 = 30.0;
    }
    v10 = (UIButton *)(id)objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 0);
    self->super._loginButton = v10;
    -[UIButton setFrame:](v10, "setFrame:", 0.0, 0.0, v8, v9);
    -[UIButton setTitle:forState:](self->super._loginButton, "setTitle:forState:", +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Sign In")), 0);
    -[UIButton setBackgroundImage:forState:](self->super._loginButton, "setBackgroundImage:forState:", v7, 0);
    -[UIButton setTitleColor:forState:](self->super._loginButton, "setTitleColor:forState:", objc_msgSend(MEMORY[0x24BDF6950], "whiteColor"), 0);
    v11 = (void *)MEMORY[0x24BDF6A70];
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"),
          v13 = 15.0,
          !v12))
    {
      v13 = 13.0;
    }
    -[UILabel setFont:](-[UIButton titleLabel](self->super._loginButton, "titleLabel"), "setFont:", objc_msgSend(v11, "systemFontOfSize:", v13));
    -[UILabel setShadowColor:](-[UIButton titleLabel](self->super._loginButton, "titleLabel"), "setShadowColor:", objc_msgSend(MEMORY[0x24BDF6950], "blackColor"));
    -[UILabel setShadowOffset:](-[UIButton titleLabel](self->super._loginButton, "titleLabel"), "setShadowOffset:", 0.0, -1.0);
    -[UIButton setContentMode:](self->super._loginButton, "setContentMode:", 0);
    -[UIButton setAutoresizingMask:](self->super._loginButton, "setAutoresizingMask:", 37);
    -[UIButton addTarget:action:forControlEvents:](self->super._loginButton, "addTarget:action:forControlEvents:", self, sel_onSignIn_, 64);
    -[UIButton setExclusiveTouch:](self->super._loginButton, "setExclusiveTouch:", 1);
    return self->super._loginButton;
  }
  return result;
}

- (id)cancelButton
{
  id result;
  const __CFString *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  UIButton *v10;
  void *v11;
  uint64_t v12;
  double v13;

  if (!-[ACMSignInDialog delegate](self, "delegate"))
    -[ACMSignInDialogSimple_Legacy cancelButton].cold.1();
  result = self->super._cancelButton;
  if (!result)
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v4 = CFSTR("greyButton.png");
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
    {
      v4 = CFSTR("greyButton_iPad.png");
    }
    v5 = ACMImageWithName((uint64_t)v4);
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
    {
      v6 = 8;
    }
    else
    {
      v6 = 6;
    }
    v7 = objc_msgSend(v5, "stretchableImageWithLeftCapWidth:topCapHeight:", v6, 0);
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
    {
      v8 = 101.0;
    }
    else
    {
      v8 = 78.0;
    }
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
    {
      v9 = 38.0;
    }
    else
    {
      v9 = 30.0;
    }
    v10 = (UIButton *)(id)objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 0);
    self->super._cancelButton = v10;
    -[UIButton setFrame:](v10, "setFrame:", 0.0, 0.0, v8, v9);
    -[UIButton setTitle:forState:](self->super._cancelButton, "setTitle:forState:", +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Cancel")), 0);
    -[UIButton addTarget:action:forControlEvents:](self->super._cancelButton, "addTarget:action:forControlEvents:", self, sel_onSignInCancel_, 64);
    -[UIButton setBackgroundImage:forState:](self->super._cancelButton, "setBackgroundImage:forState:", v7, 0);
    -[UIButton setTitleColor:forState:](self->super._cancelButton, "setTitleColor:forState:", objc_msgSend(MEMORY[0x24BDF6950], "whiteColor"), 0);
    v11 = (void *)MEMORY[0x24BDF6A70];
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"),
          v13 = 15.0,
          !v12))
    {
      v13 = 13.0;
    }
    -[UILabel setFont:](-[UIButton titleLabel](self->super._cancelButton, "titleLabel"), "setFont:", objc_msgSend(v11, "systemFontOfSize:", v13));
    -[UILabel setShadowColor:](-[UIButton titleLabel](self->super._cancelButton, "titleLabel"), "setShadowColor:", objc_msgSend(MEMORY[0x24BDF6950], "blackColor"));
    -[UILabel setShadowOffset:](-[UIButton titleLabel](self->super._cancelButton, "titleLabel"), "setShadowOffset:", 0.0, -1.0);
    -[UIButton setContentMode:](self->super._cancelButton, "setContentMode:", 0);
    -[UIButton setAutoresizingMask:](self->super._cancelButton, "setAutoresizingMask:", 37);
    -[UIButton setExclusiveTouch:](self->super._cancelButton, "setExclusiveTouch:", 1);
    return self->super._cancelButton;
  }
  return result;
}

- (void)loginButton
{
  __assert_rtn("-[ACMSignInDialogSimple_Legacy loginButton]", "ACMSignInDialogSimple_Legacy.m", 163, "nil != self.delegate");
}

- (void)cancelButton
{
  __assert_rtn("-[ACMSignInDialogSimple_Legacy cancelButton]", "ACMSignInDialogSimple_Legacy.m", 191, "nil != self.delegate");
}

@end
