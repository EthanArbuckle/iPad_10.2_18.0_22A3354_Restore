@implementation PSKeychainSyncSecurityCodeController

- (PSKeychainSyncSecurityCodeController)init
{
  PSKeychainSyncSecurityCodeController *v2;
  PSKeychainSyncSecurityCodeController *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSKeychainSyncSecurityCodeController;
  v2 = -[PSKeychainSyncTextEntryController init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PSKeychainSyncTextEntryController setTextEntryType:](v2, "setTextEntryType:", 1);
    -[PSKeychainSyncTextEntryController setSecureTextEntry:](v3, "setSecureTextEntry:", 1);
    -[PSKeychainSyncTextEntryController setHidesNextButton:](v3, "setHidesNextButton:", 1);
    -[PSKeychainSyncSecurityCodeController setMode:](v3, "setMode:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_keyboardWillShow_, *MEMORY[0x1E0CEB978], 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PSKeychainSyncSecurityCodeController;
  -[PSKeychainSyncTextEntryController dealloc](&v4, sel_dealloc);
}

- (Class)textEntryCellClass
{
  objc_class *v3;
  objc_super v5;

  if (-[PSKeychainSyncTextEntryController textEntryType](self, "textEntryType") == 1)
  {
    v5.receiver = self;
    v5.super_class = (Class)PSKeychainSyncSecurityCodeController;
    v3 = -[PSKeychainSyncTextEntryController textEntryCellClass](&v5, sel_textEntryCellClass);
  }
  else
  {
    v3 = (objc_class *)objc_opt_class();
  }
  return v3;
}

- (id)_configureTextEntryCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PSKeychainSyncSecurityCodeController;
  -[PSKeychainSyncTextEntryController textEntryCell](&v14, sel_textEntryCell);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "setMode:", -[PSKeychainSyncSecurityCodeController mode](self, "mode"));
    objc_msgSend(v3, "setSecurityCodeType:", -[PSKeychainSyncSecurityCodeController securityCodeType](self, "securityCodeType"));
    -[PSKeychainSyncSecurityCodeController firstPasscodeEntry](self, "firstPasscodeEntry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFirstPasscodeEntry:", v4);

    if (self->_securityCodeType == 1)
    {
      +[PSKeychainSyncManager sharedManager](PSKeychainSyncManager, "sharedManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isRunningInBuddy"))
      {
        PS_LocalizedStringForKeychainSync(CFSTR("SECURITY_CODE"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(v3, "setBulletText:", v6);
    objc_msgSend(v3, "textField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (self->_securityCodeType == 2)
    {
      if (self->_firstPasscodeEntry)
        v9 = 4;
      else
        v9 = 1;
    }
    else
    {
      v9 = 4;
    }
    objc_msgSend(v7, "setTextAlignment:", v9);

    objc_msgSend(v3, "textField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAdjustsFontSizeToFitWidth:", 1);

    objc_msgSend(v3, "textField");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMinimumFontSize:", 8.0);

    if (self->_securityCodeType == 2)
    {
      objc_msgSend(v3, "textField");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setDisplaySecureTextUsingPlainText:", 1);

    }
  }
  return v3;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PSKeychainSyncSecurityCodeController;
  -[PSListController viewDidLoad](&v12, sel_viewDidLoad);
  if (self->_securityCodeType)
  {
    v3 = objc_alloc(MEMORY[0x1E0CEA380]);
    PS_LocalizedStringForKeychainSync(CFSTR("NEXT"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v4, 2, self, sel_nextPressed);

  }
  else
  {
    v5 = 0;
  }
  -[PSKeychainSyncSecurityCodeController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRightBarButtonItem:", v5);

  -[PSKeychainSyncViewController headerView](self, "headerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (self->_mode == 1)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_referenceBounds");
    if (v10 == 480.0)
    {
      +[PSKeychainSyncManager sharedManager](PSKeychainSyncManager, "sharedManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setUsesCompactLayout:", objc_msgSend(v11, "isRunningInBuddy"));

    }
    else
    {
      objc_msgSend(v8, "setUsesCompactLayout:", 0);
    }

  }
  else
  {
    objc_msgSend(v7, "setUsesCompactLayout:", 0);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSKeychainSyncSecurityCodeController;
  -[PSKeychainSyncTextEntryController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PSKeychainSyncTextEntryController becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CEB890]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;

  self->_keyboardHeight = v7;
  -[PSKeychainSyncSecurityCodeController view](self, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsLayout");

}

- (void)viewDidLayoutSubviews
{
  double v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  int v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  float v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  CGFloat v54;
  CGFloat rect;
  CGFloat v56;
  CGFloat v57;
  double v58;
  objc_super v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  v59.receiver = self;
  v59.super_class = (Class)PSKeychainSyncSecurityCodeController;
  -[PSListController viewDidLayoutSubviews](&v59, sel_viewDidLayoutSubviews);
  v58 = 25.0;
  v3 = 5.0;
  if (self->_mode == 1)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_referenceBounds");
    if (v5 == 480.0)
    {
      +[PSKeychainSyncManager sharedManager](PSKeychainSyncManager, "sharedManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isRunningInBuddy"))
        v3 = -21.0;
      else
        v3 = 5.0;

    }
    if (self->_mode == 1)
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_referenceBounds");
      if (v8 == 480.0)
      {
        +[PSKeychainSyncManager sharedManager](PSKeychainSyncManager, "sharedManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isRunningInBuddy");
        v11 = 25.0;
        if (v10)
          v11 = 15.0;
        v58 = v11;

      }
      else
      {
        v58 = 25.0;
      }

    }
  }
  -[PSListController table](self, "table");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cellForRowAtIndexPath:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSListController table](self, "table");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v56 = v17;
  v57 = v16;
  v19 = v18;
  rect = v20;

  -[UILabel sizeThatFits:](self->_footerLabel, "sizeThatFits:", v19 + -40.0, 1.79769313e308);
  v22 = v21;
  v24 = v23;
  v54 = v21;
  *(float *)&v21 = (v19 - v21) * 0.5;
  v25 = floorf(*(float *)&v21);
  objc_msgSend(v14, "frame");
  v26 = v3 + CGRectGetMaxY(v60);
  v27 = v25;
  -[UILabel setFrame:](self->_footerLabel, "setFrame:", v25, v26, v22, v24);
  v28 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CEA478], "_systemInteractionTintColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = *MEMORY[0x1E0CEA0A0];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 14.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "dictionaryWithObjectsAndKeys:", v29, v30, v31, *MEMORY[0x1E0CEA098], 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_mode == 2)
    v33 = CFSTR("FORGOT_SECURITY_CODE");
  else
    v33 = CFSTR("ADVANCED_OPTIONS");
  PS_LocalizedStringForKeychainSync(v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v34, v32);
  -[UIButton setAttributedTitle:forState:](self->_footerButton, "setAttributedTitle:forState:", v35, 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setObject:forKey:", v36, v30);

  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v34, v32);
  -[UIButton setAttributedTitle:forState:](self->_footerButton, "setAttributedTitle:forState:", v37, 1);
  -[UIButton sizeToFit](self->_footerButton, "sizeToFit");
  -[UIButton frame](self->_footerButton, "frame");
  v39 = v38;
  v41 = v40;
  v42 = (v19 - v38) * 0.5;
  v53 = floorf(v42);
  v61.origin.y = v56;
  v61.origin.x = v57;
  v61.size.width = v19;
  v61.size.height = rect;
  v43 = CGRectGetMaxY(v61) - self->_keyboardHeight - v41 - v58;
  v62.origin.x = v27;
  v62.origin.y = v26;
  v62.size.width = v54;
  v62.size.height = v24;
  v44 = CGRectGetMaxY(v62) + 10.0;
  if (v43 >= v44)
    v45 = v43;
  else
    v45 = v44;
  -[UIButton setFrame:](self->_footerButton, "setFrame:", v53, v45, v39, v41);
  -[PSListController table](self, "table");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "contentSize");
  v48 = v47;
  v50 = v49;

  v63.origin.x = v27;
  v63.origin.y = v26;
  v63.size.width = v54;
  v63.size.height = v24;
  v51 = v58 + v41 + CGRectGetMaxY(v63) + 10.0;
  if (v50 < v51)
  {
    -[PSListController table](self, "table");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setContentSize:", v48, v51);

  }
}

- (id)specifiers
{
  void *v3;
  UIButton *v4;
  UIButton *footerButton;
  void *v6;
  UILabel *v7;
  UILabel *footerLabel;
  UILabel *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int mode;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  int securityCodeType;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  NSString *firstPasscodeEntry;
  BOOL v33;
  __CFString *v34;
  const __CFString *v35;
  NSString *v36;
  const __CFString *v37;
  const __CFString *v38;
  BOOL v39;
  __CFString *v40;
  __CFString *v41;
  __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  int v50;
  _BOOL8 v51;
  __CFString *v52;
  __CFString *v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  char v59;
  void *v60;
  void *v61;
  UILabel *v62;
  void *v63;
  void *v64;
  __CFString *v66;
  const __CFString *v67;
  objc_super v68;

  v68.receiver = self;
  v68.super_class = (Class)PSKeychainSyncSecurityCodeController;
  -[PSKeychainSyncTextEntryController specifiers](&v68, sel_specifiers);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_footerButton)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    footerButton = self->_footerButton;
    self->_footerButton = v4;

    -[PSListController table](self, "table");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_footerButton);

  }
  if (!self->_footerLabel)
  {
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    footerLabel = self->_footerLabel;
    self->_footerLabel = v7;

    v9 = self->_footerLabel;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 14.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v9, "setFont:", v10);

    -[UILabel setTextAlignment:](self->_footerLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](self->_footerLabel, "setNumberOfLines:", 0);
    -[PSListController table](self, "table");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", self->_footerLabel);

  }
  -[UIButton setAlpha:](self->_footerButton, "setAlpha:", 0.0);
  -[UIButton removeTarget:action:forControlEvents:](self->_footerButton, "removeTarget:action:forControlEvents:", self, 0, 64);
  +[PSKeychainSyncManager sharedManager](PSKeychainSyncManager, "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isRunningInBuddy");

  mode = self->_mode;
  if (mode == 2)
  {
    -[UILabel setText:](self->_footerLabel, "setText:", 0);
    -[PSKeychainSyncViewController headerView](self, "headerView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setDetailText:", 0);

    -[PSKeychainSyncViewController groupSpecifier](self, "groupSpecifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setProperty:forKey:", 0, CFSTR("footerText"));

    if (v13)
      v27 = CFSTR("ICLOUD_SECURITY_CODE");
    else
      v27 = CFSTR("SECURITY_CODE");
    if (v13)
      v28 = CFSTR("ENTER_YOUR_SECURITY_CODE");
    else
      v28 = CFSTR("ENTER_YOUR_ICLOUD_SECURITY_CODE");
    PS_LocalizedStringForKeychainSync(v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSKeychainSyncViewController setTitle:](self, "setTitle:", v29);

    -[PSKeychainSyncViewController headerView](self, "headerView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    PS_LocalizedStringForKeychainSync(v28);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setDetailText:", v31);

    -[UIButton addTarget:action:forControlEvents:](self->_footerButton, "addTarget:action:forControlEvents:", self, sel_forgotSecurityCode, 64);
    -[UIButton setAlpha:](self->_footerButton, "setAlpha:", 1.0);
    goto LABEL_90;
  }
  if (mode != 1)
    goto LABEL_90;
  +[PSKeychainSyncManager sharedManager](PSKeychainSyncManager, "sharedManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isRunningInBuddy");

  if ((v16 & 1) == 0)
  {
    -[PSKeychainSyncSecurityCodeController navigationItem](self, "navigationItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PS_LocalizedStringForKeychainSync(CFSTR("KEYCHAIN_SETUP"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTitle:", v18);

  }
  if (self->_showsAdvancedSettings && !self->_firstPasscodeEntry)
  {
    -[UIButton addTarget:action:forControlEvents:](self->_footerButton, "addTarget:action:forControlEvents:", self, sel_showAdvancedOptions, 64);
    -[UIButton setAlpha:](self->_footerButton, "setAlpha:", 1.0);
  }
  securityCodeType = self->_securityCodeType;
  if (securityCodeType == 2)
  {
    firstPasscodeEntry = self->_firstPasscodeEntry;
    v33 = firstPasscodeEntry == 0;
    if (firstPasscodeEntry)
      v34 = CFSTR("CONFIRM_RANDOM_CODE_DESCRIPTION");
    else
      v34 = CFSTR("COMPLEX_CODE_DESCRIPTION");
    v35 = CFSTR("CONFIRM_SECURITY_CODE_BUDDY");
    if (v33)
      v35 = CFSTR("RANDOM_SECURITY_CODE_BUDDY");
    v66 = (__CFString *)v35;
    if (v33)
      v23 = CFSTR("RANDOM_CODE");
    else
      v23 = CFSTR("CONFIRM_CODE");
    if (v13)
    {
      v21 = 0;
    }
    else
    {
      v34 = 0;
      v21 = CFSTR("COMPLEX_CODE_DESCRIPTION");
    }
    v22 = v34;
    goto LABEL_58;
  }
  if (securityCodeType == 1)
  {
    v36 = self->_firstPasscodeEntry;
    v37 = CFSTR("REENTER_YOUR_SECURITY_CODE");
    if (v13)
    {
      v38 = CFSTR("COMPLEX_CODE_DESCRIPTION");
    }
    else
    {
      v37 = 0;
      v38 = 0;
    }
    if (v13)
      v21 = 0;
    else
      v21 = CFSTR("COMPLEX_CODE_DESCRIPTION");
    v39 = v36 == 0;
    if (v36)
      v40 = (__CFString *)v37;
    else
      v40 = (__CFString *)v38;
    if (v39)
      v23 = CFSTR("COMPLEX_CODE");
    else
      v23 = CFSTR("CONFIRM_CODE");
    v22 = v40;
    v24 = CFSTR("COMPLEX_SECURITY_CODE_BUDDY");
  }
  else
  {
    if (securityCodeType)
    {
      v66 = 0;
      v22 = 0;
      v67 = 0;
      v41 = 0;
      goto LABEL_59;
    }
    if (!self->_firstPasscodeEntry)
    {
      v42 = CFSTR("CREATE_AN_ICLOUD_SECURITY_CODE");
      v66 = CFSTR("CREATE_AN_ICLOUD_SECURITY_CODE");
      if (v13)
      {
        v42 = 0;
        v21 = CFSTR("SECURITY_CODE_DESCRIPTION");
      }
      else
      {
        v21 = 0;
      }
      v22 = v42;
      v23 = CFSTR("CREATE_SECURITY_CODE");
      goto LABEL_58;
    }
    v20 = CFSTR("REENTER_YOUR_ICLOUD_SECURITY_CODE");
    if (v13)
    {
      v20 = 0;
      v21 = CFSTR("REENTER_YOUR_SECURITY_CODE");
    }
    else
    {
      v21 = 0;
    }
    v22 = v20;
    v23 = CFSTR("CREATE_SECURITY_CODE");
    v24 = CFSTR("CREATE_AN_ICLOUD_SECURITY_CODE");
  }
  v66 = (__CFString *)v24;
LABEL_58:
  v67 = v23;
  v41 = v21;
LABEL_59:
  -[PSKeychainSyncTextEntryController textEntryView](self, "textEntryView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_firstPasscodeEntry || self->_securityCodeType != 2)
  {
    v44 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 16.0);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setFont:", v48);

    }
    -[PSKeychainSyncSecurityCodeController textEntryCell](self, "textEntryCell");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v47 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v44 = v3;
    -[PSKeychainSyncSecurityCodeController generateRandomCode](self, "generateRandomCode");
    objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", 16.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setFont:", v45);

    -[PSKeychainSyncSecurityCodeController textEntryCell](self, "textEntryCell");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v47 = objc_claimAutoreleasedReturnValue();
  }
  v49 = (void *)v47;
  objc_msgSend(v46, "setBackgroundColor:", v47);

  if ((v13 & 1) != 0)
  {
    v50 = self->_securityCodeType;
    if (v50 == 1)
      v51 = 1;
    else
      v51 = v50 == 2 && self->_firstPasscodeEntry != 0;
    v3 = v44;
    v53 = (__CFString *)v67;
    -[PSKeychainSyncTextEntryController setTextFieldHasRoundBorder:](self, "setTextFieldHasRoundBorder:", v51);
    if (v66)
      v54 = v13;
    else
      v54 = 0;
    v52 = v22;
    if (v54 == 1)
    {
      -[PSKeychainSyncViewController headerView](self, "headerView");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      PS_LocalizedStringForKeychainSync(v66);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setTitleText:", v56);

    }
  }
  else
  {
    -[PSKeychainSyncTextEntryController setTextFieldHasRoundBorder:](self, "setTextFieldHasRoundBorder:", 0);
    v3 = v44;
    v52 = v22;
    v53 = (__CFString *)v67;
  }
  if (v52)
  {
    -[PSKeychainSyncViewController headerView](self, "headerView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    PS_LocalizedStringForKeychainSync(v52);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setDetailText:", v58);

  }
  if (v53)
    v59 = v13;
  else
    v59 = 1;
  if ((v59 & 1) == 0)
  {
    -[PSKeychainSyncSecurityCodeController navigationItem](self, "navigationItem");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    PS_LocalizedStringForKeychainSync(v53);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setTitle:", v61);

  }
  if (v41)
  {
    if (v13)
    {
      v62 = self->_footerLabel;
      PS_LocalizedStringForKeychainSync(v41);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](v62, "setText:", v63);
    }
    else
    {
      -[PSKeychainSyncViewController groupSpecifier](self, "groupSpecifier");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      PS_LocalizedStringForKeychainSync(v41);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "setProperty:forKey:", v64, CFSTR("footerText"));

    }
  }

LABEL_90:
  -[PSKeychainSyncSecurityCodeController updateNextButton](self, "updateNextButton");
  return v3;
}

- (id)placeholderText
{
  int securityCodeType;
  void *v4;
  char v5;
  __CFString *v6;
  void *v7;

  securityCodeType = self->_securityCodeType;
  if (securityCodeType == 2)
  {
    v6 = CFSTR("RANDOM_SECURITY_CODE_PLACEHOLDER");
LABEL_10:
    PS_LocalizedStringForKeychainSync(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    return v7;
  }
  if (securityCodeType == 1)
  {
    +[PSKeychainSyncManager sharedManager](PSKeychainSyncManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isRunningInBuddy");

    if ((v5 & 1) != 0)
    {
      v6 = CFSTR("REQUIRED_LOWERCASE");
    }
    else if (self->_firstPasscodeEntry)
    {
      v6 = CFSTR("CONFIRM_SECURITY_CODE_LOWERCASE");
    }
    else
    {
      v6 = CFSTR("SECURITY_CODE_LOWERCASE");
    }
    goto LABEL_10;
  }
  v7 = 0;
  return v7;
}

- (void)animatePasscodeFieldLeft:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  const __CFString *generatedCode;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  PSKeychainSyncSecurityCodeController *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  double v25;
  double v26;

  v3 = a3;
  -[PSListController table](self, "table");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  UIKeyboardDisableAutomaticAppearance();
  v8 = objc_alloc_init(MEMORY[0x1E0CEA9B8]);
  objc_msgSend(v5, "frame");
  objc_msgSend(v8, "setFrame:");
  objc_msgSend(v8, "captureSnapshotOfView:withSnapshotType:", v5, 1);
  objc_msgSend(v5, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v8);

  if (v3 || self->_securityCodeType != 2)
    generatedCode = &stru_1E4A69238;
  else
    generatedCode = (const __CFString *)self->_generatedCode;
  -[PSKeychainSyncTextEntryController setTextEntryText:](self, "setTextEntryText:", generatedCode);
  if (v3)
    v11 = 1.0;
  else
    v11 = -1.0;
  -[PSListController reloadSpecifiers](self, "reloadSpecifiers");
  objc_msgSend(v5, "frame");
  objc_msgSend(v5, "setFrame:", v12 + v11 * v7);
  v13 = (void *)MEMORY[0x1E0CEABB0];
  objc_msgSend(MEMORY[0x1E0CEAB98], "defaultDurationForTransition:", 1);
  v15 = v14;
  v16 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __65__PSKeychainSyncSecurityCodeController_animatePasscodeFieldLeft___block_invoke;
  v22[3] = &unk_1E4A65BA8;
  v23 = v5;
  v25 = v11;
  v26 = v7;
  v24 = v8;
  v19[0] = v16;
  v19[1] = 3221225472;
  v19[2] = __65__PSKeychainSyncSecurityCodeController_animatePasscodeFieldLeft___block_invoke_2;
  v19[3] = &unk_1E4A65BD0;
  v20 = v24;
  v21 = self;
  v17 = v24;
  v18 = v5;
  objc_msgSend(v13, "animateWithDuration:animations:completion:", v22, v19, v15);

}

uint64_t __65__PSKeychainSyncSecurityCodeController_animatePasscodeFieldLeft___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  CGRect v5;
  CGRect v6;
  CGRect v7;
  CGRect v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "frame");
  v6 = CGRectOffset(v5, -(*(double *)(a1 + 48) * *(double *)(a1 + 56)), 0.0);
  objc_msgSend(v2, "setFrame:", v6.origin.x, v6.origin.y, v6.size.width, v6.size.height);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(v3, "frame");
  v8 = CGRectOffset(v7, -(*(double *)(a1 + 48) * *(double *)(a1 + 56)), 0.0);
  return objc_msgSend(v3, "setFrame:", v8.origin.x, v8.origin.y, v8.size.width, v8.size.height);
}

uint64_t __65__PSKeychainSyncSecurityCodeController_animatePasscodeFieldLeft___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  UIKeyboardEnableAutomaticAppearance();
  return objc_msgSend(*(id *)(a1 + 40), "becomeFirstResponder");
}

- (void)didFinishEnteringText:(id)a3
{
  id v4;
  int securityCodeType;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSString *v13;
  NSString *firstPasscodeEntry;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[2];
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  securityCodeType = self->_securityCodeType;
  if (!securityCodeType)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "sf_isiPad");

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "invertedSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v4, "rangeOfCharacterFromSet:", v9);

      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        self->_securityCodeType = 1;
    }
  }
  v40[0] = v4;
  v39[0] = CFSTR("securityCode");
  v39[1] = CFSTR("securityCodeType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_securityCodeType);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_mode == 2)
  {
    -[PSKeychainSyncViewController delegate](self, "delegate");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    -[NSString keychainSyncController:didFinishWithResult:error:](v13, "keychainSyncController:didFinishWithResult:error:", self, v12, 0);
  }
  else
  {
    firstPasscodeEntry = self->_firstPasscodeEntry;
    if (firstPasscodeEntry)
    {
      v13 = firstPasscodeEntry;
      if (securityCodeType == 2)
      {
        objc_msgSend(v4, "uppercaseString");
        v15 = objc_claimAutoreleasedReturnValue();

        -[NSString uppercaseString](v13, "uppercaseString");
        v16 = objc_claimAutoreleasedReturnValue();

        v13 = (NSString *)v16;
        v4 = (id)v15;
      }
      v17 = objc_msgSend(v4, "isEqualToString:", v13);
      -[PSKeychainSyncSecurityCodeController setFirstPasscodeEntry:](self, "setFirstPasscodeEntry:", 0);
      if (v17)
      {
        -[PSKeychainSyncViewController delegate](self, "delegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "keychainSyncController:didFinishWithResult:error:", self, v12, 0);
      }
      else
      {
        if (securityCodeType == 2)
          v29 = CFSTR("INCORRECT_SECURITY_CODE");
        else
          v29 = CFSTR("SECURITY_CODES_DID_NOT_MATCH");
        PS_LocalizedStringForKeychainSync(v29);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)MEMORY[0x1E0CEA2E8];
        PS_LocalizedStringForKeychainSync(CFSTR("ENTER_SECURITY_CODE_AGAIN"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "alertControllerWithTitle:message:preferredStyle:", v18, v31, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = (void *)MEMORY[0x1E0CEA2E0];
        PS_LocalizedStringForKeychainSync(CFSTR("OK"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __62__PSKeychainSyncSecurityCodeController_didFinishEnteringText___block_invoke_3;
        v36[3] = &unk_1E4A65BF8;
        v36[4] = self;
        objc_msgSend(v33, "actionWithTitle:style:handler:", v34, 0, v36);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addAction:", v35);

        -[PSKeychainSyncSecurityCodeController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v32, 1, 0);
      }

    }
    else
    {
      -[PSKeychainSyncSecurityCodeController setFirstPasscodeEntry:](self, "setFirstPasscodeEntry:", v4);
      if ((unint64_t)objc_msgSend(v4, "length") >= 6
        && (securityCodeType == 2 || !SecPasswordIsPasswordWeak2()))
      {
        -[PSKeychainSyncSecurityCodeController animatePasscodeFieldLeft:](self, "animatePasscodeFieldLeft:", 1);
        goto LABEL_22;
      }
      v19 = (void *)MEMORY[0x1E0CEA2E8];
      PS_LocalizedStringForKeychainSync(CFSTR("WEAK_SECURITY_CODE"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      PS_LocalizedStringForKeychainSync(CFSTR("WEAK_SECURITY_CODE_DETAILS"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "alertControllerWithTitle:message:preferredStyle:", v20, v21, 1);
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)MEMORY[0x1E0CEA2E0];
      PS_LocalizedStringForKeychainSync(CFSTR("CHANGE"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = MEMORY[0x1E0C809B0];
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __62__PSKeychainSyncSecurityCodeController_didFinishEnteringText___block_invoke;
      v38[3] = &unk_1E4A65BF8;
      v38[4] = self;
      objc_msgSend(v22, "actionWithTitle:style:handler:", v23, 0, v38);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString addAction:](v13, "addAction:", v25);

      v26 = (void *)MEMORY[0x1E0CEA2E0];
      PS_LocalizedStringForKeychainSync(CFSTR("USE_CODE"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v24;
      v37[1] = 3221225472;
      v37[2] = __62__PSKeychainSyncSecurityCodeController_didFinishEnteringText___block_invoke_2;
      v37[3] = &unk_1E4A65BF8;
      v37[4] = self;
      objc_msgSend(v26, "actionWithTitle:style:handler:", v27, 0, v37);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString addAction:](v13, "addAction:", v28);

      -[PSKeychainSyncSecurityCodeController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
    }
  }

LABEL_22:
}

uint64_t __62__PSKeychainSyncSecurityCodeController_didFinishEnteringText___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setTextEntryText:", &stru_1E4A69238);
  return objc_msgSend(*(id *)(a1 + 32), "setFirstPasscodeEntry:", 0);
}

uint64_t __62__PSKeychainSyncSecurityCodeController_didFinishEnteringText___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "animatePasscodeFieldLeft:", 1);
}

uint64_t __62__PSKeychainSyncSecurityCodeController_didFinishEnteringText___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "animatePasscodeFieldLeft:", 0);
}

- (void)updateNextButton
{
  void *v3;
  int securityCodeType;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  NSString *generatedCode;
  uint64_t v10;
  void *v11;
  _BOOL8 v12;
  id v13;

  -[PSKeychainSyncSecurityCodeController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightBarButtonItem");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  securityCodeType = self->_securityCodeType;
  if (securityCodeType == 2)
  {
    if (self->_mode == 1 && !self->_firstPasscodeEntry)
    {
      objc_msgSend(v13, "setEnabled:", 1);
    }
    else
    {
      generatedCode = self->_generatedCode;
      if (generatedCode)
      {
        v10 = -[NSString length](generatedCode, "length");
        -[PSKeychainSyncTextEntryController textEntryText](self, "textEntryText");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "length") == v10;
      }
      else
      {
        -[PSKeychainSyncTextEntryController textEntryText](self, "textEntryText");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "length") != 0;
      }
      objc_msgSend(v13, "setEnabled:", v12);

    }
LABEL_13:
    v5 = v13;
    goto LABEL_14;
  }
  v5 = v13;
  if (securityCodeType == 1)
  {
    -[PSKeychainSyncTextEntryController textEntryText](self, "textEntryText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");
    v8 = 6;
    if (self->_mode != 1)
      v8 = 1;
    objc_msgSend(v13, "setEnabled:", v7 >= v8);

    goto LABEL_13;
  }
LABEL_14:

}

- (void)setFirstPasscodeEntry:(id)a3
{
  NSString *v5;
  void *v6;
  NSString *v7;

  v5 = (NSString *)a3;
  if (self->_firstPasscodeEntry != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_firstPasscodeEntry, a3);
    -[PSKeychainSyncSecurityCodeController textEntryCell](self, "textEntryCell");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "setFirstPasscodeEntry:", v7);

    v5 = v7;
  }

}

- (void)setMode:(int)a3
{
  id v4;

  if (self->_mode != a3)
  {
    self->_mode = a3;
    v4 = -[PSKeychainSyncSecurityCodeController _configureTextEntryCell](self, "_configureTextEntryCell");
    if (self->_mode == 1)
      -[PSKeychainSyncTextEntryController setNumberOfPasscodeFields:](self, "setNumberOfPasscodeFields:", 6);
  }
}

- (void)setSecurityCodeType:(int)a3
{
  void *v4;
  id v5;

  self->_securityCodeType = a3;
  if (a3 <= 2)
    -[PSKeychainSyncTextEntryController setTextEntryType:](self, "setTextEntryType:", dword_1A38ECCC8[a3]);
  if (-[PSKeychainSyncSecurityCodeController isViewLoaded](self, "isViewLoaded"))
  {
    -[PSKeychainSyncSecurityCodeController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsLayout");

    -[PSKeychainSyncTextEntryController becomeFirstResponder](self, "becomeFirstResponder");
  }
  v5 = -[PSKeychainSyncSecurityCodeController _configureTextEntryCell](self, "_configureTextEntryCell");
}

- (void)generateRandomCode
{
  NSString **p_generatedCode;
  NSString *generatedCode;
  void *v5;
  void *v6;
  void *v7;

  p_generatedCode = &self->_generatedCode;
  generatedCode = self->_generatedCode;
  if (!generatedCode)
  {
    v5 = (void *)SecPasswordGenerate();
    objc_storeStrong((id *)p_generatedCode, v5);
    -[PSKeychainSyncSecurityCodeController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rightBarButtonItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnabled:", 1);

    generatedCode = *p_generatedCode;
  }
  -[PSKeychainSyncTextEntryController setTextEntryText:](self, "setTextEntryText:", generatedCode);
}

- (void)textEntryViewDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSKeychainSyncSecurityCodeController;
  -[PSKeychainSyncTextEntryController textEntryViewDidChange:](&v4, sel_textEntryViewDidChange_, a3);
  -[PSKeychainSyncSecurityCodeController updateNextButton](self, "updateNextButton");
}

- (void)showAdvancedOptions
{
  id v3;

  -[PSKeychainSyncSecurityCodeController setFirstPasscodeEntry:](self, "setFirstPasscodeEntry:", 0);
  -[PSKeychainSyncViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keychainSyncController:didFinishWithResult:error:", self, CFSTR("advancedOptions"), 0);

}

- (void)forgotSecurityCode
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[5];
  _QWORD v21[5];
  char v22;
  char v23;

  v23 = 0;
  PSKeychainSyncGetCircleMembershipStatus(&v23, 0);
  v3 = (void *)MEMORY[0x1E0CEA2E8];
  PS_LocalizedStringForKeychainSync(CFSTR("SECURITY_CODE_REQUIRED"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    v5 = CFSTR("FORGOT_SECURITY_CODE_DETAILS_WITH_CIRCLE");
  else
    v5 = CFSTR("FORGOT_SECURITY_CODE_DETAILS");
  PS_LocalizedStringForKeychainSync(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CEA2E0];
  if (v23)
    v9 = CFSTR("APPROVE_FROM_OTHER_DEVICE");
  else
    v9 = CFSTR("SET_UP_LATER");
  PS_LocalizedStringForKeychainSync(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __58__PSKeychainSyncSecurityCodeController_forgotSecurityCode__block_invoke;
  v21[3] = &unk_1E4A65C20;
  v22 = v23;
  v21[4] = self;
  objc_msgSend(v8, "actionWithTitle:style:handler:", v10, 0, v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v12);

  v13 = (void *)MEMORY[0x1E0CEA2E0];
  PS_LocalizedStringForKeychainSync(CFSTR("RESET_ICLOUD_KEYCHAIN"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = __58__PSKeychainSyncSecurityCodeController_forgotSecurityCode__block_invoke_2;
  v20[3] = &unk_1E4A65BF8;
  v20[4] = self;
  objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 0, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v15);

  v16 = (void *)MEMORY[0x1E0CEA2E0];
  PS_LocalizedStringForKeychainSync(CFSTR("CANCEL"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 1, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v18);

  -[PSKeychainSyncSecurityCodeController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
  dispatch_get_global_queue(-32768, 0);
  v19 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v19, &__block_literal_global_4);

}

void __58__PSKeychainSyncSecurityCodeController_forgotSecurityCode__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  const __CFString *v4;
  id v5;

  v2 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v2)
    v4 = CFSTR("usePeerApproval");
  else
    v4 = CFSTR("setUpLater");
  objc_msgSend(v3, "keychainSyncController:didFinishWithResult:error:", *(_QWORD *)(a1 + 32), v4, 0);

}

void __58__PSKeychainSyncSecurityCodeController_forgotSecurityCode__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t (*v10)(void);
  int v11;
  __CFString *v12;
  const __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _Unwind_Exception *v25;
  _QWORD v26[5];
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *(*v30)(uint64_t);
  void *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  void *v36;

  v3 = a2;
  v27 = 0;
  PSSecureBackupAccountInfo(&v27, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v27;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v6 = (_QWORD *)getkSecureBackupIsEnabledKeySymbolLoc_ptr;
  v36 = (void *)getkSecureBackupIsEnabledKeySymbolLoc_ptr;
  v7 = MEMORY[0x1E0C809B0];
  if (!getkSecureBackupIsEnabledKeySymbolLoc_ptr)
  {
    v28 = MEMORY[0x1E0C809B0];
    v29 = 3221225472;
    v30 = __getkSecureBackupIsEnabledKeySymbolLoc_block_invoke;
    v31 = &unk_1E4A65650;
    v32 = &v33;
    __getkSecureBackupIsEnabledKeySymbolLoc_block_invoke((uint64_t)&v28);
    v6 = (_QWORD *)v34[3];
  }
  _Block_object_dispose(&v33, 8);
  if (!v6)
  {
    PSPNCreateFormattedStringWithCountry_cold_1();
    goto LABEL_15;
  }
  objc_msgSend(v4, "objectForKey:", *v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v10 = (uint64_t (*)(void))getBYSetupAssistantHasCompletedInitialRunSymbolLoc_ptr;
  v36 = getBYSetupAssistantHasCompletedInitialRunSymbolLoc_ptr;
  if (!getBYSetupAssistantHasCompletedInitialRunSymbolLoc_ptr)
  {
    v28 = v7;
    v29 = 3221225472;
    v30 = __getBYSetupAssistantHasCompletedInitialRunSymbolLoc_block_invoke;
    v31 = &unk_1E4A65650;
    v32 = &v33;
    __getBYSetupAssistantHasCompletedInitialRunSymbolLoc_block_invoke((uint64_t)&v28);
    v10 = (uint64_t (*)(void))v34[3];
  }
  _Block_object_dispose(&v33, 8);
  if (!v10)
  {
LABEL_15:
    v25 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v33, 8);
    _Unwind_Resume(v25);
  }
  v11 = v10();
  v12 = CFSTR("REPLACE_ICLOUD_KEYCHAIN_DETAILS");
  if (v9)
    v12 = CFSTR("REPLACE_ICLOUD_KEYCHAIN_DETAILS_WITH_RECOVERY");
  v13 = CFSTR("RESET_ICLOUD_KEYCHAIN_DETAILS_WITH_RECOVERY");
  if (!v9)
    v13 = CFSTR("RESET_ICLOUD_KEYCHAIN_DETAILS");
  if (!v11)
    v12 = (__CFString *)v13;
  v14 = v12;
  v15 = (void *)MEMORY[0x1E0CEA2E8];
  PS_LocalizedStringForKeychainSync(CFSTR("RESET_ICLOUD_KEYCHAIN_QUESTION"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  PS_LocalizedStringForKeychainSync(v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "alertControllerWithTitle:message:preferredStyle:", v16, v17, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0CEA2E0];
  PS_LocalizedStringForKeychainSync(CFSTR("CANCEL"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 1, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAction:", v21);

  v22 = (void *)MEMORY[0x1E0CEA2E0];
  PS_LocalizedStringForKeychainSync(CFSTR("RESET"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __58__PSKeychainSyncSecurityCodeController_forgotSecurityCode__block_invoke_3;
  v26[3] = &unk_1E4A65BF8;
  v26[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v22, "actionWithTitle:style:handler:", v23, 0, v26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAction:", v24);

  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v18, 1, 0);
}

void __58__PSKeychainSyncSecurityCodeController_forgotSecurityCode__block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keychainSyncController:didFinishWithResult:error:", *(_QWORD *)(a1 + 32), CFSTR("resetKeychain"), 0);

}

id __58__PSKeychainSyncSecurityCodeController_forgotSecurityCode__block_invoke_4()
{
  return PSSecureBackupAccountInfo(0, 0);
}

- (void)dismissAlerts
{
  void *v3;
  char isKindOfClass;

  -[PSKeychainSyncSecurityCodeController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    -[PSKeychainSyncSecurityCodeController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
}

- (int)mode
{
  return self->_mode;
}

- (int)securityCodeType
{
  return self->_securityCodeType;
}

- (BOOL)showsAdvancedSettings
{
  return self->_showsAdvancedSettings;
}

- (void)setShowsAdvancedSettings:(BOOL)a3
{
  self->_showsAdvancedSettings = a3;
}

- (NSString)firstPasscodeEntry
{
  return self->_firstPasscodeEntry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstPasscodeEntry, 0);
  objc_storeStrong((id *)&self->_generatedCode, 0);
  objc_storeStrong((id *)&self->_footerLabel, 0);
  objc_storeStrong((id *)&self->_footerButton, 0);
}

@end
