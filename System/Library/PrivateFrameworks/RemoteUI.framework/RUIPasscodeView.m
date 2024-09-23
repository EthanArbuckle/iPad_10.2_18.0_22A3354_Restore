@implementation RUIPasscodeView

- (RUIPasscodeView)initWithAttributes:(id)a3 parent:(id)a4
{
  id v6;
  id v7;
  RUIPasscodeView *v8;
  RUIPasscodeView *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  objc_super v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)RUIPasscodeView;
  v8 = -[RUIElement initWithAttributes:parent:](&v15, sel_initWithAttributes_parent_, v6, v7);
  v9 = v8;
  if (v8)
  {
    v8->_numberOfEntryFields = 4;
    v17 = 0;
    v18 = &v17;
    v19 = 0x2050000000;
    v10 = (void *)getPSListControllerClass_softClass;
    v20 = getPSListControllerClass_softClass;
    if (!getPSListControllerClass_softClass)
    {
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __getPSListControllerClass_block_invoke;
      v16[3] = &unk_24C297758;
      v16[4] = &v17;
      __getPSListControllerClass_block_invoke((uint64_t)v16);
      v10 = (void *)v18[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v17, 8);
    objc_msgSend(v11, "appearance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextColor:", v13);

  }
  return v9;
}

- (RUIPasscodeField)passcodeField
{
  return self->_passcodeField;
}

- (id)sourceURL
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
  objc_msgSend(WeakRetained, "sourceURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setForegroundColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;
  UIColor **p_foregroundColor;
  char v8;
  UIColor *v9;

  v5 = (UIColor *)a3;
  v6 = v5;
  p_foregroundColor = &self->_foregroundColor;
  if (self->_foregroundColor != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_foregroundColor, a3);
    -[PSPasscodeField setForegroundColor:](self->_passcodeField, "setForegroundColor:", *p_foregroundColor);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[RUIHeader setHeaderColor:](self->_headerView, "setHeaderColor:", *p_foregroundColor);
    v8 = objc_opt_respondsToSelector();
    v6 = v9;
    if ((v8 & 1) != 0)
    {
      -[RemoteUITableFooter setTextColor:](self->_footerView, "setTextColor:", *p_foregroundColor);
      v6 = v9;
    }
  }

}

- (void)setKeyboardAppearance:(int64_t)a3
{
  if (self->_keyboardAppearance != a3)
  {
    self->_keyboardAppearance = a3;
    -[PSPasscodeField setKeyboardAppearance:](self->_passcodeField, "setKeyboardAppearance:");
  }
}

- (void)_updateFieldSpacer
{
  void *v3;
  void *v4;
  unint64_t v5;
  id v6;

  if (!-[RUIPasscodeView _requiresLocalPasscodeValidation](self, "_requiresLocalPasscodeValidation")
    && self->_passcodeField)
  {
    -[RUIElement attributes](self, "attributes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("fieldSpacer"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if ((self->_numberOfEntryFields & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v6, "isEqualToString:", CFSTR("center")))
        {
          v4 = (void *)objc_opt_new();
          if (self->_numberOfEntryFields >= 4)
          {
            v5 = 1;
            do
            {
              objc_msgSend(v4, "addObject:", &unk_24C2B1CB0);
              ++v5;
            }
            while (v5 < self->_numberOfEntryFields >> 1);
          }
          objc_msgSend(v4, "addObject:", &unk_24C2B1CC8);
          -[PSPasscodeField setFieldSpacing:](self->_passcodeField, "setFieldSpacing:", v4);

        }
      }
    }

  }
}

- (id)passcodeView
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIScrollView *v8;
  UIScrollView *containerView;
  UIScrollView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  unint64_t v17;
  BOOL v18;
  UITextField *v19;
  id *p_complexPasscodeField;
  UITextField *complexPasscodeField;
  UITextField *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  NSObject *v32;
  void *v33;
  objc_class *v34;
  id v35;
  PSPasscodeField *v36;
  PSPasscodeField *passcodeField;
  void *v38;
  UIScrollView *v39;
  void *v40;
  NSObject *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint8_t buf[8];
  uint64_t v48;
  Class (*v49)(uint64_t);
  void *v50;
  uint64_t *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  if (!self->_containerView)
  {
    v3 = objc_alloc(MEMORY[0x24BEBD918]);
    v4 = *MEMORY[0x24BDBF090];
    v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v8 = (UIScrollView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], v5, v6, v7);
    containerView = self->_containerView;
    self->_containerView = v8;

    v10 = self->_containerView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView setBackgroundColor:](v10, "setBackgroundColor:", v11);

    -[UIScrollView setDirectionalLayoutMargins:](self->_containerView, "setDirectionalLayoutMargins:", 0.0, 20.0, 0.0, 20.0);
    -[UIScrollView setLayoutMarginsFollowReadableWidth:](self->_containerView, "setLayoutMarginsFollowReadableWidth:", 1);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", self, sel_keyboardFrameDidChange_, *MEMORY[0x24BEBE580], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", self, sel_keyboardFrameDidChange_, *MEMORY[0x24BEBE438], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", self, sel_keyboardFrameDidChange_, *MEMORY[0x24BEBE578], 0);

    if (-[RUIPasscodeView _requiresLocalPasscodeValidation](self, "_requiresLocalPasscodeValidation"))
    {
      LODWORD(v43) = 0;
      objc_msgSend(getMCProfileConnectionClass(), "sharedConnection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "unlockScreenTypeWithOutSimplePasscodeType:", &v43);

      if (v16 == 2 || v16 == 1)
      {
        v18 = v16 == 2;
        v19 = (UITextField *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA48]), "initWithFrame:", v4, v5, v6, v7);
        p_complexPasscodeField = (id *)&self->_complexPasscodeField;
        complexPasscodeField = self->_complexPasscodeField;
        self->_complexPasscodeField = v19;

        -[UITextField setKeyboardAppearance:](self->_complexPasscodeField, "setKeyboardAppearance:", self->_keyboardAppearance);
        -[UITextField setEnablesReturnKeyAutomatically:](self->_complexPasscodeField, "setEnablesReturnKeyAutomatically:", 1);
        -[UITextField addTarget:action:forControlEvents:](self->_complexPasscodeField, "addTarget:action:forControlEvents:", self, sel__complexPasscodeFieldDidChange_, 983040);
        v22 = self->_complexPasscodeField;
        v23 = (void *)MEMORY[0x24BEBB520];
        objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "userInterfaceIdiom");

        v26 = 18.0;
        if ((v25 & 0xFFFFFFFFFFFFFFFBLL) == 1)
          v26 = 23.0;
        objc_msgSend(v23, "systemFontOfSize:", v26, v43);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextField setFont:](v22, "setFont:", v27);

        objc_msgSend(*p_complexPasscodeField, "setSecureTextEntry:", 1);
        objc_msgSend(*p_complexPasscodeField, "setTextAlignment:", 1);
        objc_msgSend(*p_complexPasscodeField, "layer");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setBorderWidth:", 1.0);

        objc_msgSend(*p_complexPasscodeField, "layer");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEBD4B8], "_labelColor");
        v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v29, "setBorderColor:", objc_msgSend(v30, "CGColor"));

        objc_msgSend(*p_complexPasscodeField, "layer");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setCornerRadius:", 10.0);

        if (!v18)
          objc_msgSend(*p_complexPasscodeField, "setKeyboardType:", 4);
        goto LABEL_24;
      }
      if (v16)
      {
        if (_isInternalInstall())
        {
          _RUILoggingFacility();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v16;
            _os_log_impl(&dword_209E87000, v32, OS_LOG_TYPE_DEFAULT, "Error! Unexpected unlock type: %d", buf, 8u);
          }

        }
        goto LABEL_19;
      }
      if ((_DWORD)v43 == 1)
      {
        v17 = 6;
      }
      else
      {
        if ((_DWORD)v43)
        {
          if (_isInternalInstall())
          {
            _RUILoggingFacility();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v43;
              _os_log_impl(&dword_209E87000, v42, OS_LOG_TYPE_DEFAULT, "Error! Unlock type is MCUnlockScreenSimple, but value for MCSimplePasscodeType (%d) is invalid.", buf, 8u);
            }

          }
          goto LABEL_19;
        }
        v17 = 4;
      }
      self->_numberOfEntryFields = v17;
    }
LABEL_19:
    v43 = 0;
    v44 = &v43;
    v45 = 0x2050000000;
    v33 = (void *)getPSPasscodeFieldClass_softClass;
    v46 = getPSPasscodeFieldClass_softClass;
    if (!getPSPasscodeFieldClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      v48 = 3221225472;
      v49 = __getPSPasscodeFieldClass_block_invoke;
      v50 = &unk_24C297758;
      v51 = &v43;
      __getPSPasscodeFieldClass_block_invoke((uint64_t)buf);
      v33 = (void *)v44[3];
    }
    v34 = objc_retainAutorelease(v33);
    _Block_object_dispose(&v43, 8);
    v35 = [v34 alloc];
    v36 = (PSPasscodeField *)objc_msgSend(v35, "initWithNumberOfEntryFields:", self->_numberOfEntryFields, v43);
    p_complexPasscodeField = (id *)&self->_passcodeField;
    passcodeField = self->_passcodeField;
    self->_passcodeField = v36;

    -[PSPasscodeField setAccessibilityTraits:](self->_passcodeField, "setAccessibilityTraits:", *MEMORY[0x24BEBDF40]);
    -[RUIPasscodeView _passcodeFieldAccessibilityIdentifier](self, "_passcodeFieldAccessibilityIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSPasscodeField setAccessibilityIdentifier:](self->_passcodeField, "setAccessibilityIdentifier:", v38);

    if (self->_foregroundColor)
      objc_msgSend(*p_complexPasscodeField, "setForegroundColor:");
    -[RUIPasscodeView _updateFieldSpacer](self, "_updateFieldSpacer");
    objc_msgSend(*p_complexPasscodeField, "setKeyboardAppearance:", self->_keyboardAppearance);
    v39 = self->_containerView;
    -[RUIPasscodeView activityIndicatorView](self, "activityIndicatorView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView addSubview:](v39, "addSubview:", v40);

    objc_msgSend(*p_complexPasscodeField, "setDelegate:", self);
LABEL_24:
    -[UIScrollView addSubview:](self->_containerView, "addSubview:", *p_complexPasscodeField);
  }
  return self->_containerView;
}

- (id)_passcodeFieldAccessibilityIdentifier
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;

  -[RUIElement attributes](self, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("accessibilityIdentifier");
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("accessibilityIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[RUIElement attributes](self, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v5)
  {
    v4 = CFSTR("id");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("id"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = CFSTR("passcodeField");
      return v9;
    }
    -[RUIElement attributes](self, "attributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (_TtC8RemoteUI28RUITextActivityIndicatorView)activityIndicatorView
{
  void *v3;
  int v4;
  _TtC8RemoteUI28RUITextActivityIndicatorView *activityIndicatorView;
  _TtC8RemoteUI28RUITextActivityIndicatorView *v6;
  _TtC8RemoteUI28RUITextActivityIndicatorView *v7;
  _TtC8RemoteUI28RUITextActivityIndicatorView *v8;

  -[RUIElement style](self, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportActivityIndicatorInPinView");

  if (v4)
  {
    activityIndicatorView = self->_activityIndicatorView;
    if (!activityIndicatorView)
    {
      v6 = objc_alloc_init(_TtC8RemoteUI28RUITextActivityIndicatorView);
      v7 = self->_activityIndicatorView;
      self->_activityIndicatorView = v6;

      activityIndicatorView = self->_activityIndicatorView;
    }
    v8 = activityIndicatorView;
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)keyboardFrameDidChange:(id)a3
{
  UIScrollView *containerView;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;

  containerView = self->_containerView;
  v5 = a3;
  -[UIScrollView superview](containerView, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyboardSceneDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView superview](self->_containerView, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "verticalOverlapForView:usingKeyboardInfo:", v8, v9);
  self->_keyboardHeight = v10;

  -[RUIPasscodeView viewDidLayout](self, "viewDidLayout");
}

- (void)setNumberOfEntryFields:(unint64_t)a3
{
  if (!-[RUIPasscodeView _requiresLocalPasscodeValidation](self, "_requiresLocalPasscodeValidation")
    && self->_numberOfEntryFields != a3)
  {
    self->_numberOfEntryFields = a3;
    -[PSPasscodeField setNumberOfEntryFields:](self->_passcodeField, "setNumberOfEntryFields:", a3);
    -[RUIPasscodeView _updateFieldSpacer](self, "_updateFieldSpacer");
  }
}

- (void)populatePostbackDictionary:(id)a3
{
  void *v4;
  void *v5;
  NSString *submittedPIN;
  id v7;

  v7 = a3;
  if (!-[RUIPasscodeView _requiresLocalPasscodeValidation](self, "_requiresLocalPasscodeValidation"))
  {
    -[RUIElement attributes](self, "attributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("id"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "length"))
    {
      submittedPIN = self->_submittedPIN;
      if (submittedPIN)
        objc_msgSend(v7, "setObject:forKey:", submittedPIN, v5);
    }

  }
}

- (void)performAction:(int)a3 forElement:(id)a4 completion:(id)a5
{
  RUIObjectModel **p_objectModel;
  id v8;
  id v9;
  id WeakRetained;

  p_objectModel = &self->_objectModel;
  v8 = a5;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_objectModel);
  objc_msgSend(WeakRetained, "passcodeViewOM:activatedElement:completion:", self, v9, v8);

}

- (id)subElementWithID:(id)a3
{
  id v4;
  id *p_header;
  void *v6;
  char v7;
  void *v8;
  int v9;
  id v10;

  v4 = a3;
  p_header = (id *)&self->_header;
  -[RUIElement identifier](self->_header, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v4);

  if ((v7 & 1) != 0
    || (p_header = (id *)&self->_footer,
        -[RUIElement identifier](self->_footer, "identifier"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEqualToString:", v4),
        v8,
        v9))
  {
    v10 = *p_header;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)titleLabel
{
  return 0;
}

- (void)setHeaderTitle:(id)a3
{
  RUIHeaderElement *v4;
  RUIHeaderElement *header;
  void *v6;
  char isKindOfClass;
  void *v8;
  id v9;

  v9 = a3;
  if (!self->_header)
  {
    v4 = -[RUIElement initWithAttributes:parent:]([RUIHeaderElement alloc], "initWithAttributes:parent:", 0, self);
    header = self->_header;
    self->_header = v4;

  }
  -[RUIPasscodeView headerView](self, "headerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[RUIPasscodeView headerView](self, "headerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", v9);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  NSString *pendingAutoFillToken;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  uint8_t v13[16];

  self->_appeared = 1;
  if (self->_pendingAutoFillToken)
  {
    if (_isInternalInstall())
    {
      _RUILoggingFacility();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_209E87000, v4, OS_LOG_TYPE_DEFAULT, "Filling pending PINView token", v13, 2u);
      }

    }
    -[RUIPasscodeView passcodeField](self, "passcodeField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStringValue:", self->_pendingAutoFillToken);

    pendingAutoFillToken = self->_pendingAutoFillToken;
    self->_pendingAutoFillToken = 0;

  }
  -[UIScrollView contentSize](self->_containerView, "contentSize", a3);
  v8 = v7;
  -[RUIPasscodeView view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "readableContentGuide");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layoutFrame");
  v12 = v11;

  if (-[RUIPasscodeView shouldManageScrollViewInsets](self, "shouldManageScrollViewInsets"))
    -[UIScrollView setContentOffset:animated:](self->_containerView, "setContentOffset:animated:", 1, 0.0, fmax(v8 - v12, 0.0));
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  if (self->_passcodeField)
  {
    -[RUIElement attributes](self, "attributes", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secure"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[RUIElement attributes](self, "attributes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("secure"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "BOOLValue");

    }
    else
    {
      v8 = 1;
    }

    -[PSPasscodeField setSecurePasscodeEntry:](self->_passcodeField, "setSecurePasscodeEntry:", v8);
    -[PSPasscodeField becomeFirstResponder](self->_passcodeField, "becomeFirstResponder");
  }
  else if (self->_complexPasscodeField)
  {
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__doneButtonTapped_);
    objc_msgSend(v11, "setEnabled:", 0);
    -[RUIPasscodeView page](self, "page");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRightBarButtonItem:", v11);

    -[UITextField becomeFirstResponder](self->_complexPasscodeField, "becomeFirstResponder");
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *passcodeField;

  self->_appeared = 0;
  passcodeField = self->_passcodeField;
  if (passcodeField || (passcodeField = self->_complexPasscodeField) != 0)
    objc_msgSend(passcodeField, "resignFirstResponder", a3);
}

- (void)viewDidLayout
{
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double keyboardHeight;
  void *v11;
  double v12;
  double v13;
  UITextField *complexPasscodeField;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  double v21;
  void *passcodeField;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  char v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  _BOOL4 v59;
  double v60;
  RUIElement *footer;
  BOOL v62;
  unsigned int v63;
  double v64;
  double v65;
  RUIHeaderElement *header;
  double v67;
  double v68;
  RUIHTMLHeaderElement *HTMLHeader;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  void *v82;
  char v83;
  double v84;
  float v85;
  double v86;
  void *v87;
  float v88;
  double v89;
  void *v90;
  double MaxY;
  double v92;
  void *v93;
  void *v94;
  char v95;
  CGFloat v96;
  void *v97;
  void *v98;
  double v99;
  double v100;
  double v101;
  double v102;
  void *v103;
  void *v104;
  CGFloat v105;
  void *v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  id v121;
  double v122;
  CGRect v123;
  CGRect v124;

  -[UIScrollView bounds](self->_containerView, "bounds");
  v122 = v3;
  v5 = v4;
  -[RUIPasscodeView view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "readableContentGuide");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutFrame");
  v9 = v8;

  keyboardHeight = 0.0;
  if (!+[RUIPlatform isAppleTV](RUIPlatform, "isAppleTV"))
    keyboardHeight = self->_keyboardHeight;
  -[RUIPasscodeView scrollView](self, "scrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "adjustedContentInset");
  v13 = v12;

  complexPasscodeField = self->_complexPasscodeField;
  if (complexPasscodeField)
  {
    -[UITextField sizeToFit](complexPasscodeField, "sizeToFit");
    -[UITextField frame](self->_complexPasscodeField, "frame");
    v16 = v15;
    v18 = v17;
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "userInterfaceIdiom");

    v21 = 14.0;
    if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v21 = 24.0;
    -[UITextField setFrame:](self->_complexPasscodeField, "setFrame:", v21, v16, v122 + v21 * -2.0, v18 + v18);
  }
  passcodeField = self->_passcodeField;
  if (!passcodeField)
    passcodeField = self->_complexPasscodeField;
  v121 = passcodeField;
  objc_msgSend(v121, "frame");
  v24 = v23;
  v26 = v25;
  -[RUIPasscodeView headerView](self, "headerView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "frame");

  -[RUIPasscodeView headerView](self, "headerView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_opt_respondsToSelector();

  -[RUIPasscodeView headerView](self, "headerView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  v119 = v26;
  if ((v29 & 1) != 0)
  {
    -[RUIPasscodeView view](self, "view");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "headerHeightForWidth:inView:", v32, v9);
    v34 = v33;

    v113 = v9;
  }
  else
  {
    objc_msgSend(v30, "sizeThatFits:", v9, 1.79769313e308);
    v113 = v35;
    v34 = v36;
  }
  v37 = v5 - keyboardHeight;

  -[RUIPasscodeView HTMLHeaderView](self, "HTMLHeaderView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "frame");
  v40 = v39;
  v42 = v41;

  -[RUIPasscodeView HTMLHeaderView](self, "HTMLHeaderView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    -[RUIPasscodeView HTMLHeaderView](self, "HTMLHeaderView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIPasscodeView view](self, "view");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "headerHeightForWidth:inView:", v45, v9);
    v42 = v46;

    v117 = v9;
  }
  else
  {
    v117 = v40;
  }
  v47 = v37 - v13;
  -[RUIPasscodeView footerView](self, "footerView", *(_QWORD *)&v113);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "frame");

  -[RUIPasscodeView footerView](self, "footerView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_opt_respondsToSelector();

  -[RUIPasscodeView footerView](self, "footerView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v51;
  v53 = v24;
  v115 = keyboardHeight;
  v118 = v9;
  if ((v50 & 1) != 0)
  {
    -[RUIPasscodeView view](self, "view");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "footerHeightForWidth:inView:", v54, v9);
    v56 = v55;

  }
  else
  {
    objc_msgSend(v51, "sizeThatFits:", v9, 1.79769313e308);
    v56 = v57;
  }
  v58 = v119;

  v59 = +[RUIPlatform isAppleTV](RUIPlatform, "isAppleTV");
  objc_msgSend(v121, "bounds");
  footer = self->_footer;
  v62 = footer == 0;
  v63 = footer != 0;
  v116 = v56;
  if (v62)
    v64 = 0.0;
  else
    v64 = v56;
  v65 = v60 + v64;
  header = self->_header;
  if (header)
    v67 = v34;
  else
    v67 = 0.0;
  v68 = v65 + v67;
  HTMLHeader = self->_HTMLHeader;
  if (header)
    ++v63;
  if (HTMLHeader)
    v70 = v42;
  else
    v70 = 0.0;
  v71 = v68 + v70;
  if (HTMLHeader)
    ++v63;
  v72 = fmax(v47 - v71, 0.0) / (double)v63;
  if (v72 <= 20.0)
    v73 = v72;
  else
    v73 = 20.0;
  v74 = v34;
  v75 = v34 + v73;
  if (!header)
    v75 = 0.0;
  if (HTMLHeader)
    v76 = v42 + v73;
  else
    v76 = 0.0;
  if (v59)
    v77 = -160.0;
  else
    v77 = 0.0;
  if (v59)
    v58 = 600.0;
  v78 = (v47 - v58) * 0.5;
  if (v59)
    v79 = v122;
  else
    v79 = v53;
  v80 = v75 + v76;
  if (v78 <= v80)
    v78 = v80;
  v81 = v77 + v78;
  objc_msgSend(v121, "setFrame:", round((v122 - v79) * 0.5), v77 + v78, v79, v58);
  if (self->_header)
  {
    -[RUIPasscodeView page](self, "page");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(v82, "showsTitlesAsHeaderViews");

    if ((v83 & 1) == 0)
    {
      v84 = 0.0;
      if (self->_HTMLHeader)
        v84 = v42 + v73;
      v120 = v81 - v73 - v84 - v74 - v77;
      v85 = (v122 - v114) * 0.5;
      v86 = floorf(v85);
      -[RUIPasscodeView headerView](self, "headerView");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "setFrame:", v86, v120, v114, v74);

    }
  }
  if (self->_HTMLHeader)
  {
    v88 = (v122 - v117) * 0.5;
    v89 = floorf(v88);
    -[RUIPasscodeView HTMLHeaderView](self, "HTMLHeaderView");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setFrame:", v89, v81 - v73 - v42 - v77, v117, v42);

  }
  MaxY = v58 + v81;
  if (self->_footer)
  {
    v92 = v73 + MaxY;
    -[RUIPasscodeView footerView](self, "footerView");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "setFrame:", (v122 - v118) * 0.5, v92, v118, v116);

    MaxY = v116 + v92;
  }
  -[RUIPasscodeView activityIndicatorView](self, "activityIndicatorView");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend(v94, "isHidden");

  if ((v95 & 1) == 0)
  {
    v96 = v73 + MaxY;
    -[RUIPasscodeView activityIndicatorView](self, "activityIndicatorView");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "frame");

    -[RUIPasscodeView activityIndicatorView](self, "activityIndicatorView");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "systemLayoutSizeFittingSize:", *MEMORY[0x24BEBE588], *(double *)(MEMORY[0x24BEBE588] + 8));
    v100 = v99;
    v102 = v101;

    -[RUIPasscodeView activityIndicatorView](self, "activityIndicatorView");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "superview");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "bounds");
    v105 = CGRectGetMidX(v123) + v100 * -0.5;

    -[RUIPasscodeView activityIndicatorView](self, "activityIndicatorView");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "setFrame:", v105, v96, v100, v102);

    v124.origin.x = v105;
    v124.origin.y = v96;
    v124.size.width = v100;
    v124.size.height = v102;
    MaxY = CGRectGetMaxY(v124);
  }
  -[UIScrollView setContentSize:](self->_containerView, "setContentSize:", 0.0, MaxY);
  -[UIScrollView contentInset](self->_containerView, "contentInset");
  v108 = v107;
  v110 = v109;
  v112 = v111;
  if (-[RUIPasscodeView shouldManageScrollViewInsets](self, "shouldManageScrollViewInsets"))
    -[UIScrollView setContentInset:](self->_containerView, "setContentInset:", v108, v110, v115, v112);

}

- (void)startActivityIndicator
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[RUIPasscodeView activityIndicatorView](self, "activityIndicatorView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startAnimating");

  -[RUIElement pageElement](self, "pageElement");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "page");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

}

- (void)stopActivityIndicator
{
  id v2;

  -[RUIPasscodeView activityIndicatorView](self, "activityIndicatorView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopAnimating");

}

- (id)headerView
{
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  RUIHeader *v8;
  RUIHeader *headerView;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];

  v27[3] = *MEMORY[0x24BDAC8D0];
  if (self->_header && !self->_headerView)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[RUIPasscodeView page](self, "page");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "showsTitlesAsHeaderViews");
      v4 = (objc_class *)objc_opt_class();

    }
    else
    {
      v4 = 0;
    }
    v5 = [v4 alloc];
    -[RUIPasscodeView header](self, "header");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (RUIHeader *)objc_msgSend(v5, "initWithAttributes:", v7);
    headerView = self->_headerView;
    self->_headerView = v8;

    -[RUIHeaderElement configureView:](self->_header, "configureView:", self->_headerView);
    if (self->_foregroundColor && (objc_opt_respondsToSelector() & 1) != 0)
      -[RUIHeader setHeaderColor:](self->_headerView, "setHeaderColor:", self->_foregroundColor);
    -[RUIPasscodeView passcodeView](self, "passcodeView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", self->_headerView);

    -[RUIPasscodeView page](self, "page");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "showsTitlesAsHeaderViews");

    if (v12)
    {
      -[RUIHeader setTranslatesAutoresizingMaskIntoConstraints:](self->_headerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v23 = (void *)MEMORY[0x24BDD1628];
      -[RUIHeader topAnchor](self->_headerView, "topAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIScrollView topAnchor](self->_containerView, "topAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "constraintEqualToAnchor:", v25);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v24;
      -[RUIHeader leftAnchor](self->_headerView, "leftAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIScrollView readableContentGuide](self->_containerView, "readableContentGuide");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "leftAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v15;
      -[RUIHeader rightAnchor](self->_headerView, "rightAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIScrollView readableContentGuide](self->_containerView, "readableContentGuide");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "rightAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintEqualToAnchor:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v27[2] = v19;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "activateConstraints:", v20);

    }
    if (-[RUIElement hasImage](self, "hasImage"))
      -[RUIElement loadImage](self, "loadImage");
  }
  return self->_headerView;
}

- (id)HTMLHeaderView
{
  RUIHTMLHeaderView *v3;
  RUIHTMLHeaderView *HTMLHeaderView;
  void *v5;

  if (self->_HTMLHeader)
  {
    if (!self->_HTMLHeaderView)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v3 = objc_alloc_init(RUIHTMLHeaderView);
        HTMLHeaderView = self->_HTMLHeaderView;
        self->_HTMLHeaderView = v3;

        -[RUIHTMLHeaderElement configureView:](self->_HTMLHeader, "configureView:", self->_HTMLHeaderView);
        -[RUIPasscodeView passcodeView](self, "passcodeView");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addSubview:", self->_HTMLHeaderView);

      }
    }
  }
  return self->_HTMLHeaderView;
}

- (id)footerView
{
  id v3;
  void *v4;
  void *v5;
  RemoteUITableFooter *v6;
  RemoteUITableFooter *footerView;
  void *v8;

  if (self->_footer && !self->_footerView)
  {
    objc_opt_class();
    objc_opt_isKindOfClass();
    v3 = objc_alloc((Class)objc_opt_class());
    -[RUIPasscodeView footer](self, "footer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (RemoteUITableFooter *)objc_msgSend(v3, "initWithAttributes:", v5);
    footerView = self->_footerView;
    self->_footerView = v6;

    -[RemoteUITableFooter setDelegate:](self->_footerView, "setDelegate:", self);
    -[RUIElement configureView:](self->_footer, "configureView:", self->_footerView);
    if (self->_foregroundColor && (objc_opt_respondsToSelector() & 1) != 0)
      -[RemoteUITableFooter setTextColor:](self->_footerView, "setTextColor:", self->_foregroundColor);
    -[RUIPasscodeView passcodeView](self, "passcodeView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", self->_footerView);

  }
  return self->_footerView;
}

- (void)footerView:(id)a3 activatedLinkWithURL:(id)a4
{
  id WeakRetained;

  if (self->_footer)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
    objc_msgSend(WeakRetained, "passcodeViewOM:activatedElement:completion:", self, self->_footer, 0);

  }
}

- (void)submitPIN
{
  _BOOL4 v3;
  void *passcodeField;
  id v5;
  PSPasscodeField *v6;
  uint64_t v7;
  void *v8;
  UITextField *complexPasscodeField;
  void *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  void *WeakRetained;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  dispatch_time_t v24;
  _QWORD v25[5];
  _QWORD block[5];
  id v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = -[RUIPasscodeView _requiresLocalPasscodeValidation](self, "_requiresLocalPasscodeValidation");
  passcodeField = self->_passcodeField;
  if (!passcodeField)
    passcodeField = self->_complexPasscodeField;
  v5 = passcodeField;
  if (v3)
  {
    if (self->_passcodeValidationAttempts > 2)
      goto LABEL_20;
    v6 = self->_passcodeField;
    if (v6)
    {
      -[PSPasscodeField stringValue](v6, "stringValue");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      complexPasscodeField = self->_complexPasscodeField;
      if (!complexPasscodeField)
      {
        v10 = 0;
LABEL_11:
        objc_msgSend(getMCProfileConnectionClass(), "sharedConnection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 0;
        v12 = objc_msgSend(v11, "unlockDeviceWithPasscode:outError:", v10, &v27);
        v13 = v27;

        if (v13 && _isInternalInstall())
        {
          _RUILoggingFacility();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v29 = v13;
            _os_log_impl(&dword_209E87000, v14, OS_LOG_TYPE_DEFAULT, "Error! Entered passcode does not validate: %@", buf, 0xCu);
          }

        }
        ++self->_passcodeValidationAttempts;

        if ((v12 & 1) != 0)
        {
          -[RUIPasscodeView setSubmittedPIN:](self, "setSubmittedPIN:", 0);
          goto LABEL_18;
        }
        if (self->_passcodeValidationAttempts < 3)
        {
          -[RUIPasscodeView _jiggleView:](self, "_jiggleView:", v5);
          v24 = dispatch_time(0, 250000000);
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __28__RUIPasscodeView_submitPIN__block_invoke;
          block[3] = &unk_24C2973F0;
          block[4] = self;
          dispatch_after(v24, MEMORY[0x24BDAC9B8], block);
          goto LABEL_22;
        }
LABEL_20:
        v16 = (void *)MEMORY[0x24BEBD3B0];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("TOO_MANY_FAILED_PASSCODE_ATTEMPTS"), &stru_24C29B280, CFSTR("Localizable"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "alertControllerWithTitle:message:preferredStyle:", v18, 0, 1);
        WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

        v19 = (void *)MEMORY[0x24BEBD3A8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24C29B280, CFSTR("Localizable"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "actionWithTitle:style:handler:", v21, 1, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "addAction:", v22);

        -[RUIPasscodeView page](self, "page");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "presentViewController:animated:completion:", WeakRetained, 1, 0);

        goto LABEL_21;
      }
      -[UITextField text](complexPasscodeField, "text");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v7;
    goto LABEL_11;
  }
  -[PSPasscodeField stringValue](self->_passcodeField, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIPasscodeView setSubmittedPIN:](self, "setSubmittedPIN:", v8);

LABEL_18:
  WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __28__RUIPasscodeView_submitPIN__block_invoke_2;
  v25[3] = &unk_24C2974D8;
  v25[4] = self;
  objc_msgSend(WeakRetained, "passcodeViewOM:activatedElement:completion:", self, self, v25);
LABEL_21:

LABEL_22:
}

uint64_t __28__RUIPasscodeView_submitPIN__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearPasscode");
}

void __28__RUIPasscodeView_submitPIN__block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[5];

  v2 = dispatch_time(0, 350000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__RUIPasscodeView_submitPIN__block_invoke_3;
  block[3] = &unk_24C2973F0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x24BDAC9B8], block);
}

uint64_t __28__RUIPasscodeView_submitPIN__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearPasscode");
}

- (void)_clearPasscode
{
  PSPasscodeField *passcodeField;
  UITextField *complexPasscodeField;

  passcodeField = self->_passcodeField;
  if (passcodeField)
  {
    -[PSPasscodeField setStringValue:](passcodeField, "setStringValue:", &stru_24C29B280);
  }
  else
  {
    complexPasscodeField = self->_complexPasscodeField;
    if (complexPasscodeField)
    {
      -[UITextField setText:](complexPasscodeField, "setText:", &stru_24C29B280);
      -[RUIPasscodeView _complexPasscodeFieldDidChange:](self, "_complexPasscodeFieldDidChange:", self->_complexPasscodeField);
    }
  }
}

- (void)autofillWithToken:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  if (self->_appeared)
  {
    -[RUIPasscodeView passcodeField](self, "passcodeField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStringValue:", v5);

  }
  else
  {
    if (_isInternalInstall())
    {
      _RUILoggingFacility();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_209E87000, v7, OS_LOG_TYPE_DEFAULT, "PINView autofill pending appearance", v8, 2u);
      }

    }
    objc_storeStrong((id *)&self->_pendingAutoFillToken, a3);
  }

}

- (void)_complexPasscodeFieldDidChange:(id)a3
{
  void *v4;
  unint64_t passcodeValidationAttempts;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  -[UITextField text](self->_complexPasscodeField, "text", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {

    goto LABEL_5;
  }
  passcodeValidationAttempts = self->_passcodeValidationAttempts;

  if (passcodeValidationAttempts > 2)
  {
LABEL_5:
    -[RUIPasscodeView page](self, "page");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rightBarButtonItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 0;
    goto LABEL_6;
  }
  -[RUIPasscodeView page](self, "page");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rightBarButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = 1;
LABEL_6:
  objc_msgSend(v7, "setEnabled:", v9);

}

- (void)_doneButtonTapped:(id)a3
{
  id v4;

  -[UITextField text](self->_complexPasscodeField, "text", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RUIPasscodeView passcodeField:enteredPasscode:](self, "passcodeField:enteredPasscode:", 0, v4);

}

- (void)_jiggleView:(id)a3
{
  void *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  objc_msgSend(a3, "layer");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE5760], "animation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMass:", 1.20000005);
  objc_msgSend(v4, "setStiffness:", 1200.0);
  objc_msgSend(v4, "setDamping:", 12.0);
  objc_msgSend(v4, "setDuration:", 1.39999998);
  objc_msgSend(v4, "setFillMode:", *MEMORY[0x24BDE5968]);
  objc_msgSend(v4, "setDelegate:", self);
  LODWORD(v5) = 30.0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFromValue:", v6);

  LODWORD(v7) = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToValue:", v8);

  objc_msgSend(MEMORY[0x24BDE57F0], "functionWithName:", *MEMORY[0x24BDE5EA0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValueFunction:", v9);

  LODWORD(v10) = 1028389654;
  LODWORD(v11) = 990057071;
  LODWORD(v12) = 1059712716;
  LODWORD(v13) = 1.0;
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimingFunction:", v14);

  objc_msgSend(v4, "setKeyPath:", CFSTR("transform"));
  objc_msgSend(v15, "addAnimation:forKey:", v4, CFSTR("shake"));

}

- (BOOL)_requiresLocalPasscodeValidation
{
  void *v2;
  void *v3;

  -[RUIElement attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("requireLocalPasscode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "isEqual:", CFSTR("true"));
  return (char)v2;
}

- (void)setImage:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v4 = a3;
  -[RUIPasscodeView page](self, "page");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "showsTitlesAsHeaderViews");

  -[RUIPasscodeView headerView](self, "headerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "setIcon:accessibilityLabel:", v4, 0);
  else
    objc_msgSend(v7, "setIconImage:", v4);

}

- (void)setImageSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  char v7;
  id v8;

  height = a3.height;
  width = a3.width;
  -[RUIPasscodeView page](self, "page");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "showsTitlesAsHeaderViews");

  if ((v7 & 1) == 0)
  {
    -[RUIPasscodeView headerView](self, "headerView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImageSize:", width, height);

  }
}

- (void)setImageAlignment:(int)a3
{
  uint64_t v3;
  void *v5;
  char v6;
  id v7;

  v3 = *(_QWORD *)&a3;
  -[RUIPasscodeView page](self, "page");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "showsTitlesAsHeaderViews");

  if ((v6 & 1) == 0)
  {
    -[RUIPasscodeView headerView](self, "headerView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImageAlignment:", v3);

  }
}

- (RUIObjectModel)objectModel
{
  return (RUIObjectModel *)objc_loadWeakRetained((id *)&self->_objectModel);
}

- (void)setObjectModel:(id)a3
{
  objc_storeWeak((id *)&self->_objectModel, a3);
}

- (RUIPage)page
{
  return (RUIPage *)objc_loadWeakRetained((id *)&self->_page);
}

- (void)setPage:(id)a3
{
  objc_storeWeak((id *)&self->_page, a3);
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (BOOL)shouldManageScrollViewInsets
{
  return self->_shouldManageScrollViewInsets;
}

- (void)setShouldManageScrollViewInsets:(BOOL)a3
{
  self->_shouldManageScrollViewInsets = a3;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (NSString)submittedPIN
{
  return self->_submittedPIN;
}

- (void)setSubmittedPIN:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (int64_t)keyboardAppearance
{
  return self->_keyboardAppearance;
}

- (unint64_t)numberOfEntryFields
{
  return self->_numberOfEntryFields;
}

- (RUIHeaderElement)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
  objc_storeStrong((id *)&self->_header, a3);
}

- (RUIHTMLHeaderElement)HTMLHeader
{
  return self->_HTMLHeader;
}

- (void)setHTMLHeader:(id)a3
{
  objc_storeStrong((id *)&self->_HTMLHeader, a3);
}

- (RUIElement)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
  objc_storeStrong((id *)&self->_footer, a3);
}

- (void)setActivityIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_HTMLHeader, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_submittedPIN, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_destroyWeak((id *)&self->_page);
  objc_destroyWeak((id *)&self->_objectModel);
  objc_storeStrong((id *)&self->_passcodeField, 0);
  objc_storeStrong((id *)&self->_pendingAutoFillToken, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_complexPasscodeField, 0);
  objc_storeStrong((id *)&self->_HTMLHeaderView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end
