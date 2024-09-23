@implementation ACMSignInDialogSimple_Modern

- (void)dealloc
{
  objc_super v3;

  -[ACMSignInDialog setDelegate:](self, "setDelegate:", 0);
  -[ACMSignInDialogSimple_Modern setToolbar:](self, "setToolbar:", 0);
  -[ACMSignInDialogSimple_Modern setBurButtonItems:](self, "setBurButtonItems:", 0);
  -[ACMSignInDialogSimple_Modern setLogo:](self, "setLogo:", 0);
  -[ACMSignInDialogSimple_Modern setLogoView:](self, "setLogoView:", 0);
  -[ACMSignInDialogSimple_Modern setAccountNameFieldPlaceholder:](self, "setAccountNameFieldPlaceholder:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMSignInDialogSimple_Modern;
  -[ACMSignInDialogCustom dealloc](&v3, sel_dealloc);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return (-[ACMSignInDialogSimple_Modern supportedInterfaceOrientations](self, "supportedInterfaceOrientations") >> a3) & 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (id)createIForgotItem
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithImage:style:target:action:", -[ACMSignInDialogSimple_Modern iForgotImage](self, "iForgotImage"), 0, self, sel_onIForgot_);
}

- (id)createCancelItem
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 14, 0, 0);
}

- (NSArray)burButtonItems
{
  NSArray *result;
  _QWORD v4[4];

  v4[3] = *MEMORY[0x24BDAC8D0];
  result = self->_burButtonItems;
  if (!result)
  {
    if (-[ACMSignInDialog delegate](self, "delegate"))
    {
      -[ACMSignInDialogCustom setCancelBarButton:](self, "setCancelBarButton:", -[ACMSignInDialogSimple_Modern createCancelItem](self, "createCancelItem"));
      v4[0] = -[ACMSignInDialogCustom cancelBarButton](self, "cancelBarButton");
      v4[1] = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0, v4[0]);
      v4[2] = -[ACMSignInDialogSimple_Modern createIForgotItem](self, "createIForgotItem");
      result = (NSArray *)(id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 3);
      self->_burButtonItems = result;
    }
    else
    {
      return self->_burButtonItems;
    }
  }
  return result;
}

- (BOOL)shouldManuallyChangeStatusBarStyle
{
  return 0;
}

- (BOOL)userNameFieldEditable
{
  return 1;
}

- (BOOL)shouldAuthenticateOnUserInput
{
  return 1;
}

- (id)tintColor
{
  return 0;
}

- (UIToolbar)toolbar
{
  UIToolbar *result;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  float v10;
  double v11;
  ACMEToolbar *v12;

  if (!-[ACMSignInDialog delegate](self, "delegate"))
    -[ACMSignInDialogSimple_Modern toolbar].cold.1();
  result = self->_toolbar;
  if (!result)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "statusBarFrame");
    v5 = v4;
    v7 = v6;
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "bounds");
    v9 = v8;
    *(float *)&v8 = v7;
    v10 = v5;
    v12 = -[ACMEToolbar initWithFrame:]([ACMEToolbar alloc], "initWithFrame:", v9, fminf(*(float *)&v8, v10), v11, 60.0);
    self->_toolbar = &v12->super;
    -[ACMEToolbar setItems:animated:](v12, "setItems:animated:", -[ACMSignInDialogSimple_Modern burButtonItems](self, "burButtonItems"), 0);
    -[UIToolbar setBarStyle:](self->_toolbar, "setBarStyle:", 0);
    -[UIToolbar setBarTintColor:](self->_toolbar, "setBarTintColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
    -[UIToolbar setTintColor:](self->_toolbar, "setTintColor:", -[ACMSignInDialogSimple_Modern tintColor](self, "tintColor"));
    -[UIToolbar setTranslucent:](self->_toolbar, "setTranslucent:", 1);
    -[UIToolbar setOpaque:](self->_toolbar, "setOpaque:", 0);
    objc_msgSend((id)-[ACMSignInDialogSimple_Modern toolbarItems](self, "toolbarItems"), "makeObjectsPerformSelector:withObject:", sel_setTintColor_, -[ACMSignInDialogSimple_Modern tintColor](self, "tintColor"));
    return self->_toolbar;
  }
  return result;
}

- (BOOL)prefersStatusBarHidden
{
  return 0;
}

- (int64_t)preferredStatusBarStyle
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "statusBarStyle");
}

- (id)darkTextColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.5, 0.5, 0.5, 1.0);
}

- (id)darkDisabledTextColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.5, 0.5, 0.5, 0.75);
}

- (void)loadView
{
  __assert_rtn("-[ACMSignInDialogSimple_Modern loadView]", "ACMSignInDialogSimple_Modern.m", 144, "nil != self.delegate");
}

- (double)widgetConstraintMultiplier
{
  return 1.0;
}

- (double)widgetConstraintConstant
{
  return -99.0;
}

- (void)buildWidgetContentGroupHorizontalConstraints
{
  objc_msgSend((id)-[ACMSignInDialogSimple_Modern view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", objc_msgSend(-[ACMSignInDialogSimple_Modern widget](self, "widget"), "view"), 7, 0, -[ACMSignInDialogSimple_Modern view](self, "view"), 7, 1.0, 0.0));
}

- (void)buildWidgetContentGroupVerticalConstraints
{
  NSDictionary *v3;
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double v10;
  void *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = _NSDictionaryOfVariableBindings(CFSTR("logo, widget, button"), -[ACMSignInDialogSimple_Modern logoView](self, "logoView"), objc_msgSend(-[ACMSignInDialogSimple_Modern widget](self, "widget"), "view"), -[ACMSignInDialogCustom signInButton](self, "signInButton"), 0);
  v4 = (void *)MEMORY[0x24BDD1628];
  v5 = (void *)MEMORY[0x24BDD17C8];
  -[UIImageView frame](-[ACMSignInDialogSimple_Modern logoView](self, "logoView"), "frame");
  v7 = (int)v6;
  objc_msgSend((id)objc_msgSend(-[ACMSignInDialogSimple_Modern widget](self, "widget"), "view"), "frame");
  v9 = (int)v8;
  -[UIButton frame](-[ACMSignInDialogCustom signInButton](self, "signInButton"), "frame");
  v11 = (void *)objc_msgSend(v4, "constraintsWithVisualFormat:options:metrics:views:", objc_msgSend(v5, "stringWithFormat:", CFSTR("V:[logo(==%d)]-22-[widget(==%d)]-22-[button(==%d)]"), v7, v9, (int)v10), 0, 0, v3);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v22;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v11);
        LODWORD(v13) = 1148846080;
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v16++), "setPriority:", v13);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }
  objc_msgSend((id)-[ACMSignInDialogSimple_Modern view](self, "view"), "addConstraints:", v11);
  objc_msgSend((id)-[ACMSignInDialogSimple_Modern view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACMSignInDialogSimple_Modern container](self, "container"), 8, 1, 0, 8, 1.0, 0.0));
  v17 = (void *)objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACMSignInDialogSimple_Modern container](self, "container"), 3, 0, -[ACMSignInDialogSimple_Modern logoView](self, "logoView"), 3, 1.0, 0.0);
  objc_msgSend((id)-[ACMSignInDialogSimple_Modern view](self, "view"), "addConstraint:", v17);
  LODWORD(v18) = 1148846080;
  objc_msgSend(v17, "setPriority:", v18);
  v19 = (void *)objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACMSignInDialogSimple_Modern container](self, "container"), 4, 0, -[ACMSignInDialogCustom signInButton](self, "signInButton"), 4, 1.0, 0.0);
  objc_msgSend((id)-[ACMSignInDialogSimple_Modern view](self, "view"), "addConstraint:", v19);
  LODWORD(v20) = 1148846080;
  objc_msgSend(v19, "setPriority:", v20);
}

- (void)buildHorizontalConstraints
{
  -[ACMSignInDialogSimple_Modern buildWidgetContentGroupHorizontalConstraints](self, "buildWidgetContentGroupHorizontalConstraints");
  objc_msgSend((id)-[ACMSignInDialogSimple_Modern view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACMSignInDialogSimple_Modern toolbar](self, "toolbar"), 9, 0, -[ACMSignInDialogSimple_Modern view](self, "view"), 9, 1.0, 0.0));
  objc_msgSend((id)-[ACMSignInDialogSimple_Modern view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACMSignInDialogSimple_Modern toolbar](self, "toolbar"), 7, 0, -[ACMSignInDialogSimple_Modern view](self, "view"), 7, 1.0, 0.0));
  objc_msgSend((id)-[ACMSignInDialogSimple_Modern view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACMSignInDialogSimple_Modern logoView](self, "logoView"), 9, 0, -[ACMSignInDialogSimple_Modern view](self, "view"), 9, 1.0, 0.0));
  objc_msgSend((id)-[ACMSignInDialogSimple_Modern view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACMSignInDialogCustom signInButton](self, "signInButton"), 9, 0, -[ACMSignInDialogSimple_Modern view](self, "view"), 9, 1.0, 0.0));
}

- (void)buildVerticalConstraints
{
  void *v3;
  UIView *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  UIToolbar *v10;
  uint64_t v11;

  -[ACMSignInDialogSimple_Modern buildWidgetContentGroupVerticalConstraints](self, "buildWidgetContentGroupVerticalConstraints");
  v3 = (void *)MEMORY[0x24BDD1628];
  v4 = -[ACMSignInDialogSimple_Modern container](self, "container");
  v5 = -[ACMSignInDialogSimple_Modern view](self, "view");
  -[ACMSignInDialogSimple_Modern widgetConstraintMultiplier](self, "widgetConstraintMultiplier");
  v7 = v6;
  -[ACMSignInDialogSimple_Modern widgetConstraintConstant](self, "widgetConstraintConstant");
  objc_msgSend((id)-[ACMSignInDialogSimple_Modern view](self, "view"), "addConstraint:", objc_msgSend(v3, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 10, 0, v5, 10, v7, v8));
  v9 = (void *)MEMORY[0x24BDD1628];
  v10 = -[ACMSignInDialogSimple_Modern toolbar](self, "toolbar");
  v11 = -[ACMSignInDialogSimple_Modern view](self, "view");
  -[UIToolbar frame](-[ACMSignInDialogSimple_Modern toolbar](self, "toolbar"), "frame");
  objc_msgSend((id)-[ACMSignInDialogSimple_Modern view](self, "view"), "addConstraint:", objc_msgSend(v9, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 3, 0, v11, 3, 1.0));
}

- (void)buildConstraints
{
  -[UIToolbar setTranslatesAutoresizingMaskIntoConstraints:](-[ACMSignInDialogSimple_Modern toolbar](self, "toolbar"), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](-[ACMSignInDialogSimple_Modern logoView](self, "logoView"), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend((id)objc_msgSend(-[ACMSignInDialogSimple_Modern widget](self, "widget"), "view"), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](-[ACMSignInDialogCustom signInButton](self, "signInButton"), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](-[ACMSignInDialogSimple_Modern container](self, "container"), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ACMSignInDialogSimple_Modern buildHorizontalConstraints](self, "buildHorizontalConstraints");
  -[ACMSignInDialogSimple_Modern buildVerticalConstraints](self, "buildVerticalConstraints");
}

- (id)accountNameField
{
  return (id)objc_msgSend(-[ACMSignInDialogSimple_Modern widget](self, "widget"), "accountField");
}

- (id)passwordField
{
  return (id)objc_msgSend(-[ACMSignInDialogSimple_Modern widget](self, "widget"), "passwordField");
}

- (BOOL)canSignIn
{
  uint64_t v3;

  v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[ACMSignInDialogSimple_Modern widget](self, "widget"), "passwordField"), "text"), "length");
  if (v3)
    LOBYTE(v3) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[ACMSignInDialogSimple_Modern widget](self, "widget"), "accountField"), "text"), "length") != 0;
  return v3;
}

- (void)checkFields
{
  -[UIButton setEnabled:](-[ACMSignInDialogCustom signInButton](self, "signInButton"), "setEnabled:", -[ACMSignInDialogSimple_Modern canSignIn](self, "canSignIn"));
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ACMSignInDialogSimple_Modern;
  -[ACMSignInDialog viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  if (objc_msgSend((id)objc_msgSend(-[ACMSignInDialogSimple_Modern accountNameField](self, "accountNameField"), "text"), "length"))
  {
    v4 = -[ACMSignInDialogSimple_Modern passwordField](self, "passwordField");
  }
  else
  {
    v4 = -[ACMSignInDialogSimple_Modern accountNameField](self, "accountNameField");
  }
  objc_msgSend(v4, "becomeFirstResponder");
  -[ACMSignInDialogSimple_Modern checkFields](self, "checkFields");
}

- (UIImage)iForgotImage
{
  return (UIImage *)objc_msgSend(ACMImageWithName((uint64_t)CFSTR("forgotButton.png")), "imageWithRenderingMode:", 2);
}

- (id)widget
{
  ACMSignInWidgetProtocol *widget;
  objc_super v4;

  widget = self->super._widget;
  if (!widget)
  {
    v4.receiver = self;
    v4.super_class = (Class)ACMSignInDialogSimple_Modern;
    widget = -[ACMSignInDialogCustom widget](&v4, sel_widget);
    -[ACMSignInWidgetProtocol setPosition:](widget, "setPosition:", 0.0, 152.0);
    -[ACMSignInWidgetProtocol setShouldAuthenticateOnUserInput:](widget, "setShouldAuthenticateOnUserInput:", 1);
    -[ACMSignInWidgetProtocol setHideTopSeparator:](widget, "setHideTopSeparator:", 1);
  }
  return widget;
}

- (Class)widgetClass
{
  return (Class)objc_opt_class();
}

- (BOOL)standardViewController
{
  return 1;
}

- (void)disableControls:(BOOL)a3
{
  _BOOL8 v3;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  -[ACMSignInDialog controlsWillChangeState:](self, "controlsWillChangeState:");
  v14.receiver = self;
  v14.super_class = (Class)ACMSignInDialogSimple_Modern;
  -[ACMSignInDialogCustom disableControls:](&v14, sel_disableControls_, v3);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = -[ACMSignInDialogSimple_Modern burButtonItems](self, "burButtonItems", 0);
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setEnabled:", v3 ^ 1);
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }
  -[ACMSignInDialog controlsDidChangeState:](self, "controlsDidChangeState:", v3);
}

- (UIImage)logo
{
  return self->_logo;
}

- (void)setLogo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1120);
}

- (UIImageView)logoView
{
  return self->_logoView;
}

- (void)setLogoView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1128);
}

- (NSString)accountNameFieldPlaceholder
{
  return self->_accountNameFieldPlaceholder;
}

- (void)setAccountNameFieldPlaceholder:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1136);
}

- (UIView)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1144);
}

- (void)setToolbar:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1152);
}

- (void)setBurButtonItems:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1160);
}

- (void)toolbar
{
  __assert_rtn("-[ACMSignInDialogSimple_Modern toolbar]", "ACMSignInDialogSimple_Modern.m", 102, "nil != self.delegate");
}

@end
