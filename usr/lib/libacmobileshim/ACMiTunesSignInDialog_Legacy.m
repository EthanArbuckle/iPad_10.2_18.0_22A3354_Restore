@implementation ACMiTunesSignInDialog_Legacy

- (void)dealloc
{
  objc_super v3;

  -[UIAlertView setAcmAlertViewDelegate:](-[ACMiTunesSignInDialog signInDialog](self, "signInDialog"), "setAcmAlertViewDelegate:", 0);
  -[ACMiTunesSignInDialog_Legacy setEditingTextField:](self, "setEditingTextField:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMiTunesSignInDialog_Legacy;
  -[ACMiTunesSignInDialog dealloc](&v3, sel_dealloc);
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  -[ACMiTunesSignInDialog_Legacy setEditingTextField:](self, "setEditingTextField:");
  objc_msgSend((id)objc_msgSend(a3, "undoManager"), "disableUndoRegistration");
  return 1;
}

- (void)loadView
{
  id v3;
  void *v4;
  double v5;
  void *v6;
  const __CFString *v7;
  objc_super v8;

  v3 = -[ACMiTunesSignInDialog dialogTitle](self, "dialogTitle");
  v4 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontSize");
  objc_msgSend(v3, "sizeWithFont:", objc_msgSend(v4, "systemFontOfSize:"));
  -[ACMiTunesSignInDialog setTitleStringSize:](self, "setTitleStringSize:");
  -[ACMiTunesSignInDialog setPreviousInterfaceOrientation:](self, "setPreviousInterfaceOrientation:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "statusBarOrientation"));
  -[ACMiTunesSignInDialog setTitleField:](self, "setTitleField:", objc_msgSend(v3, "stringByAppendingString:", CFSTR("\n\n\n\n")));
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  if (((objc_opt_respondsToSelector() & 1) == 0
     || !objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
    && !-[ACMiTunesSignInDialog isPortraitMode](self, "isPortraitMode"))
  {
    -[ACMiTunesSignInDialog titleStringSize](self, "titleStringSize");
    if (v5 > 190.0 && (unint64_t)objc_msgSend(v3, "length") >= 0x15)
    {
      v3 = (id)objc_msgSend((id)objc_msgSend(v3, "substringToIndex:", 19), "stringByAppendingString:", CFSTR("…"));
      v6 = (void *)MEMORY[0x24BDF6A70];
      objc_msgSend(MEMORY[0x24BDF6A70], "systemFontSize");
      objc_msgSend(v3, "sizeWithFont:", objc_msgSend(v6, "systemFontOfSize:"));
      -[ACMiTunesSignInDialog setTitleStringSize:](self, "setTitleStringSize:");
    }
  }
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
  {
    v7 = CFSTR("\n\n\n\n");
  }
  else if (-[ACMiTunesSignInDialog isPortraitMode](self, "isPortraitMode"))
  {
    v7 = CFSTR("\n\n\n\n");
  }
  else
  {
    v7 = CFSTR("\n\n\n");
  }
  -[ACMiTunesSignInDialog_Legacy setView:](self, "setView:", -[ACMAlertView initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:]([ACMAlertView alloc], "initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:", objc_msgSend(v3, "stringByAppendingString:", v7), 0, self, +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Cancel")), +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Sign In")), 0));
  v8.receiver = self;
  v8.super_class = (Class)ACMiTunesSignInDialog_Legacy;
  -[ACMiTunesSignInDialog loadView](&v8, sel_loadView);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ACMiTunesSignInDialog_Legacy;
  -[ACMiTunesSignInDialog viewDidLoad](&v3, sel_viewDidLoad);
  objc_msgSend((id)-[UITextField undoManager](-[ACMSignInDialog accountNameField](self, "accountNameField"), "undoManager"), "disableUndoRegistration");
  objc_msgSend((id)-[UITextField undoManager](-[ACMSignInDialog passwordField](self, "passwordField"), "undoManager"), "disableUndoRegistration");
}

- (void)handleRotation
{
  double v3;
  double v4;
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
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (!-[ACMiTunesSignInDialog changeTitleStringIfNeeded](self, "changeTitleStringIfNeeded"))
  {
    -[ACMiTunesSignInDialog_Legacy userNameFrame](self, "userNameFrame");
    -[UITextField setFrame:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setFrame:", v3, v4, v5, v6);
    -[ACMiTunesSignInDialog_Legacy passwordFrame](self, "passwordFrame");
    -[UITextField setFrame:](-[ACMSignInDialog passwordField](self, "passwordField"), "setFrame:", v7, v8, v9, v10);
  }
  -[UIAlertView bounds](-[ACMiTunesSignInDialog signInDialog](self, "signInDialog"), "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[ACMiTunesSignInDialog titleStringSize](self, "titleStringSize");
  v18 = v17;
  if (-[ACMiTunesSignInDialog isPortraitMode](self, "isPortraitMode"))
    v19 = dbl_22F80E580[floor(v18 / 190.0) > 0.0];
  else
    v19 = 158.0;
  v20 = (void *)-[UIAlertView subviews](-[ACMiTunesSignInDialog signInDialog](self, "signInDialog"), "subviews");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v27;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v27 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v24);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v25, "frame");
          objc_msgSend(v25, "setFrame:");
        }
        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v22);
  }
  -[UIAlertView setBounds:](-[ACMiTunesSignInDialog signInDialog](self, "signInDialog"), "setBounds:", v12, v14, v16, v19);
}

- (void)handleTextFieldShouldReturnOnNonPasswordField
{
  -[UITextField becomeFirstResponder](-[ACMSignInDialog passwordField](self, "passwordField"), "becomeFirstResponder");
}

- (CGRect)passwordFrame
{
  double v3;
  double v4;
  double v5;
  _BOOL4 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  -[ACMiTunesSignInDialog titleStringSize](self, "titleStringSize");
  v4 = v3;
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
  {
    v5 = 78.0;
  }
  else
  {
    v6 = -[ACMiTunesSignInDialog isPortraitMode](self, "isPortraitMode");
    v5 = 64.0;
    if (v6)
      v5 = 78.0;
  }
  v7 = floor(v4 / 190.0) * 20.0 + v5;
  v8 = 260.0;
  v9 = 12.0;
  v10 = 30.0;
  result.size.height = v10;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v9;
  return result;
}

- (CGRect)userNameFrame
{
  double v3;
  double v4;
  double v5;
  _BOOL4 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  -[ACMiTunesSignInDialog titleStringSize](self, "titleStringSize");
  v4 = v3;
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
  {
    v5 = 48.0;
  }
  else
  {
    v6 = -[ACMiTunesSignInDialog isPortraitMode](self, "isPortraitMode");
    v5 = 34.0;
    if (v6)
      v5 = 48.0;
  }
  v7 = floor(v4 / 190.0) * 20.0 + v5;
  v8 = 260.0;
  v9 = 12.0;
  v10 = 30.0;
  result.size.height = v10;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v9;
  return result;
}

- (void)willPresentAlertView:(id)a3
{
  _BOOL4 v4;
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
  double v22;
  BOOL v23;
  double v24;
  double v25;
  double v26;
  double v27;
  float v28;
  UITextField *v29;

  if (!-[UIAlertView acmAlertViewDelegate](-[ACMiTunesSignInDialog signInDialog](self, "signInDialog", a3), "acmAlertViewDelegate"))
  {
    v4 = -[ACMiTunesSignInDialog changeTitleStringIfNeeded](self, "changeTitleStringIfNeeded");
    -[UIAlertView setAcmAlertViewDelegate:](-[ACMiTunesSignInDialog signInDialog](self, "signInDialog"), "setAcmAlertViewDelegate:", self);
    if (!-[UITextField superview](-[ACMSignInDialog passwordField](self, "passwordField"), "superview"))
    {
      if (v4)
        -[UITextField frame](-[ACMSignInDialog passwordField](self, "passwordField"), "frame");
      else
        -[ACMiTunesSignInDialog_Legacy passwordFrame](self, "passwordFrame");
      v9 = v5;
      v10 = v6;
      v11 = v7;
      v12 = v8;
      objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
      if (((objc_opt_respondsToSelector() & 1) == 0
         || !objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
        && !-[ACMiTunesSignInDialog isPortraitMode](self, "isPortraitMode"))
      {
        v10 = v10 + 4.0;
      }
      -[UITextField setFrame:](-[ACMSignInDialog passwordField](self, "passwordField"), "setFrame:", v9, v10, v11, v12);
      -[UIAlertView addSubview:](-[ACMiTunesSignInDialog signInDialog](self, "signInDialog"), "addSubview:", -[ACMSignInDialog passwordField](self, "passwordField"));
    }
    if (-[ACMSignInDialog accountNameField](self, "accountNameField")
      && !-[UITextField superview](-[ACMSignInDialog accountNameField](self, "accountNameField"), "superview"))
    {
      if (v4)
        -[UITextField frame](-[ACMSignInDialog accountNameField](self, "accountNameField"), "frame");
      else
        -[ACMiTunesSignInDialog_Legacy userNameFrame](self, "userNameFrame");
      v17 = v13;
      v18 = v14;
      v19 = v15;
      v20 = v16;
      objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
      if (((objc_opt_respondsToSelector() & 1) == 0
         || !objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
        && !-[ACMiTunesSignInDialog isPortraitMode](self, "isPortraitMode"))
      {
        v18 = v18 + 4.0;
      }
      -[UITextField setFrame:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setFrame:", v17, v18, v19, v20);
      -[UIAlertView addSubview:](-[ACMiTunesSignInDialog signInDialog](self, "signInDialog"), "addSubview:", -[ACMSignInDialog accountNameField](self, "accountNameField"));
    }
    -[UIAlertView center](-[ACMiTunesSignInDialog signInDialog](self, "signInDialog"), "center");
    v22 = v21;
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
    {
      v23 = !-[ACMiTunesSignInDialog isPortraitMode](self, "isPortraitMode");
      v24 = 208.0;
      v25 = 380.0;
    }
    else
    {
      v23 = !-[ACMiTunesSignInDialog isPortraitMode](self, "isPortraitMode");
      v24 = 82.0;
      v25 = 140.0;
    }
    if (v23)
      v26 = v24;
    else
      v26 = v25;
    -[UIAlertView bounds](-[ACMiTunesSignInDialog signInDialog](self, "signInDialog", v24), "bounds");
    v28 = v27;
    if ((llroundf(v28) & 0x8000000000000001) == 1)
      v26 = v26 + 0.5;
    -[UIAlertView setCenter:](-[ACMiTunesSignInDialog signInDialog](self, "signInDialog"), "setCenter:", v22, v26);
    if (-[ACMiTunesSignInDialog_Legacy editingTextField](self, "editingTextField"))
    {
      v29 = -[ACMiTunesSignInDialog_Legacy editingTextField](self, "editingTextField");
    }
    else if (-[NSString length](-[UITextField text](-[ACMSignInDialog accountNameField](self, "accountNameField"), "text"), "length"))
    {
      v29 = -[ACMSignInDialog passwordField](self, "passwordField");
    }
    else
    {
      v29 = -[ACMSignInDialog accountNameField](self, "accountNameField");
    }
    -[UITextField becomeFirstResponder](v29, "becomeFirstResponder");
  }
}

- (void)acmAlertViewWillBecomeInvisible
{
  -[UITextField resignFirstResponder](-[ACMiTunesSignInDialog_Legacy editingTextField](self, "editingTextField"), "resignFirstResponder");
}

- (void)acmAlertViewWillBecomeVisible
{
  -[UITextField becomeFirstResponder](-[ACMiTunesSignInDialog_Legacy editingTextField](self, "editingTextField"), "becomeFirstResponder");
}

- (void)alertView:(id)a3 clickedButtonAtIndex:(int64_t)a4
{
  NSString *v7;
  NSString *v8;
  UITextField *v9;
  UITextField *v10;
  UITextField *v11;
  _QWORD v12[6];

  if (-[ACMiTunesSignInDialog signInDialog](self, "signInDialog") == a3)
  {
    -[UIAlertView setAcmAlertViewDelegate:](-[ACMiTunesSignInDialog signInDialog](self, "signInDialog"), "setAcmAlertViewDelegate:", 0);
    -[UITextField resignFirstResponder](-[ACMSignInDialog passwordField](self, "passwordField"), "resignFirstResponder");
    if (a4 == 1)
    {
      if (-[ACMSignInDialog canSignIn](self, "canSignIn"))
      {
        -[ACMSignInDialogDelegate onSignIn:](-[ACMSignInDialog delegate](self, "delegate"), "onSignIn:", a3);
        -[UIAlertView dismissWithClickedButtonIndex:animated:](-[ACMiTunesSignInDialog signInDialog](self, "signInDialog"), "dismissWithClickedButtonIndex:animated:", 0, 0);
      }
      else
      {
        v7 = -[UITextField text](-[ACMSignInDialog accountNameField](self, "accountNameField"), "text");
        v8 = -[UITextField text](-[ACMSignInDialog passwordField](self, "passwordField"), "text");
        v9 = -[ACMSignInDialog accountNameField](self, "accountNameField");
        v10 = -[ACMiTunesSignInDialog_Legacy editingTextField](self, "editingTextField");
        -[UIAlertView dismissWithClickedButtonIndex:animated:](-[ACMiTunesSignInDialog signInDialog](self, "signInDialog"), "dismissWithClickedButtonIndex:animated:", 1, 0);
        -[UIAlertView show](-[ACMiTunesSignInDialog signInDialog](self, "signInDialog"), "show");
        if (-[NSString length](v7, "length"))
          -[UITextField setText:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setText:", v7);
        -[UITextField setText:](-[ACMSignInDialog passwordField](self, "passwordField"), "setText:", v8);
        if (v9 == v10)
          v11 = -[ACMSignInDialog accountNameField](self, "accountNameField");
        else
          v11 = -[ACMSignInDialog passwordField](self, "passwordField");
        -[UITextField becomeFirstResponder](v11, "becomeFirstResponder");
      }
    }
    else if (!a4)
    {
      -[ACMSignInDialog controlsWillChangeState:](self, "controlsWillChangeState:", 1);
      -[ACMSignInDialog controlsDidChangeState:](self, "controlsDidChangeState:", 1);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __63__ACMiTunesSignInDialog_Legacy_alertView_clickedButtonAtIndex___block_invoke;
      v12[3] = &unk_24FCE5100;
      v12[4] = self;
      v12[5] = a3;
      dispatch_async_on_main_thread((uint64_t)v12);
    }
  }
}

- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4
{
  UIAlertView *v7;

  v7 = -[ACMiTunesSignInDialog signInDialog](self, "signInDialog");
  if (a4 == 1 && v7 == a3)
  {
    -[ACMiTunesSignInDialog_Legacy setView:](self, "setView:", 0);
    -[UITextField setDelegate:](-[ACMSignInDialog accountNameField](self, "accountNameField"), "setDelegate:", 0);
    -[ACMSignInDialog setAccountNameField:](self, "setAccountNameField:", 0);
    -[UITextField setDelegate:](-[ACMSignInDialog passwordField](self, "passwordField"), "setDelegate:", 0);
    -[ACMSignInDialog setPasswordField:](self, "setPasswordField:", 0);
    -[ACMiTunesSignInDialog_Legacy setEditingTextField:](self, "setEditingTextField:", 0);
  }
}

- (UITextField)editingTextField
{
  return self->_editingTextField;
}

- (void)setEditingTextField:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1152);
}

@end
