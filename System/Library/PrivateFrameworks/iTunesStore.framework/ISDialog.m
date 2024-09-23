@implementation ISDialog

- (ISDialog)initWithAuthenticationChallege:(id)a3
{
  ISDialog *v4;
  void *v5;
  ISDialogButton *v6;
  id v7;
  ISDialogTextField *v8;
  int v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  ISDialogTextField *v13;

  v4 = -[ISDialog init](self, "init");
  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDBCE30];
    v6 = +[ISDialogButton buttonWithTitle:](ISDialogButton, "buttonWithTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24C441158, 0));
    -[ISDialog setButtons:](v4, "setButtons:", objc_msgSend(v5, "arrayWithObjects:", v6, +[ISDialogButton buttonWithTitle:](ISDialogButton, "buttonWithTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24C441158, 0)), 0));
    -[ISDialog setDefaultButtonIndex:](v4, "setDefaultButtonIndex:", 1);
    -[ISDialog setExpectsResponse:](v4, "setExpectsResponse:", 1);
    -[ISDialog setGroupsTextFields:](v4, "setGroupsTextFields:", 1);
    -[ISDialog setTitle:](v4, "setTitle:", objc_msgSend(a3, "localizedTitle"));
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (objc_msgSend(a3, "userNameIsEditable"))
    {
      v8 = objc_alloc_init(ISDialogTextField);
      v9 = objc_msgSend(a3, "userNameIsEmail");
      if (v9)
        v10 = 7;
      else
        v10 = 0;
      if (v9)
        v11 = CFSTR("EMAIL");
      else
        v11 = CFSTR("USERNAME");
      -[ISDialogTextField setKeyboardType:](v8, "setKeyboardType:", v10);
      -[ISDialogTextField setTitle:](v8, "setTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", v11, &stru_24C441158, 0));
      -[ISDialogTextField setValue:](v8, "setValue:", objc_msgSend(a3, "user"));
      objc_msgSend(v7, "addObject:", v8);

    }
    else
    {
      v12 = objc_msgSend(a3, "user");
      if (v12)
      {
LABEL_12:
        -[ISDialog setMessage:](v4, "setMessage:", v12);
        v13 = objc_alloc_init(ISDialogTextField);
        -[ISDialogTextField setKeyboardType:](v13, "setKeyboardType:", 0);
        -[ISDialogTextField setSecure:](v13, "setSecure:", 1);
        -[ISDialogTextField setTitle:](v13, "setTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("PASSWORD"), &stru_24C441158, 0));
        objc_msgSend(v7, "addObject:", v13);

        -[ISDialog setTextFields:](v4, "setTextFields:", v7);
        return v4;
      }
    }
    v12 = objc_msgSend(a3, "localizedMessage", v12);
    goto LABEL_12;
  }
  return v4;
}

- (ISDialog)init
{
  ISDialog *v3;
  ISDialog *v4;
  NSLock *v5;
  NSLock *lock;
  objc_super v8;

  __ISRecordSPIClassUsage(self);
  v8.receiver = self;
  v8.super_class = (Class)ISDialog;
  v3 = -[ISDialog init](&v8, sel_init);
  v4 = v3;
  if (v3)
  {
    v3->_authorizationIsForced = 1;
    v3->_defaultButtonIndex = -1;
    v3->_dismissOnHomeButton = 1;
    v3->_shouldDismissAfterUnlock = 1;
    v3->_unlockActionButtonIndex = -1;
    v3->_displaysOnLockscreen = 0;
    v5 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    lock = v4->_lock;
    v4->_lock = v5;

  }
  return v4;
}

- (ISDialog)initWithDialogDictionary:(id)a3 authenticationContext:(id)a4
{
  id v6;
  id v7;
  ISDialog *v8;
  uint64_t v9;
  SSAuthenticationContext *authenticationContext;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  int v21;
  const __CFString *v22;
  void *v23;
  ISDialogButton *v24;
  void *v25;
  _BOOL8 v26;
  _BOOL8 v27;
  void *v28;
  uint64_t v29;
  ISDialogButton *v30;
  id v31;
  void *v32;
  ISDialogButton *v33;
  void *v34;
  uint64_t v35;
  void *paymentSheet;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  SSPaymentSheet *v42;
  void *v44;
  id v45;

  v6 = a3;
  v7 = a4;
  v8 = -[ISDialog init](self, "init");
  if (!v8)
  {
    v11 = v6;
    goto LABEL_66;
  }
  v9 = objc_msgSend(v7, "copy");
  authenticationContext = v8->_authenticationContext;
  v8->_authenticationContext = (SSAuthenticationContext *)v9;

  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F70]), "initWithDictionary:", v6);
  objc_msgSend(v44, "dictionaryByEvaluatingConditions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKey:", CFSTR("force-authentication"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ISDialog setAuthorizationIsForced:](v8, "setAuthorizationIsForced:", objc_msgSend(v12, "BOOLValue"));
  objc_msgSend(v11, "objectForKey:", CFSTR("explanation"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[ISDialog setMessage:](v8, "setMessage:", v13);
  objc_msgSend(v11, "objectForKey:", CFSTR("message"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[ISDialog setTitle:](v8, "setTitle:", v14);
  objc_msgSend(v11, "objectForKey:", CFSTR("kind"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[ISDialog setKind:](v8, "setKind:", -[ISDialog _kindForString:](v8, "_kindForString:", v15));
  objc_msgSend(v11, "objectForKey:", CFSTR("display-count-key"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&v8->_displayCountKey, v16);
  objc_msgSend(v11, "objectForKey:", CFSTR("max-display-count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8->_maxDisplayCount = (int)objc_msgSend(v17, "intValue");
  objc_msgSend(v11, "objectForKey:", CFSTR("noDefaultButton"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8->_noDefaultButton = objc_msgSend(v18, "BOOLValue");
  v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v11, "objectForKey:", CFSTR("cancelButtonString"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v45 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = 1;
    v22 = CFSTR("cancelButtonAction");
  }
  else
  {
    objc_msgSend(v11, "objectForKey:", CFSTR("cancelButton"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = 1;
      v22 = CFSTR("cancelButtonAction");
      v20 = v23;
    }
    else
    {
      objc_msgSend(v11, "objectForKey:", CFSTR("otherButtonString"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = 0;
      v22 = CFSTR("otherButtonAction");
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = objc_alloc_init(ISDialogButton);
    -[ISDialogButton setTitle:](v24, "setTitle:", v20);
    objc_msgSend(v11, "objectForKey:", v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[ISDialogButton loadFromDictionary:](v24, "loadFromDictionary:", v25);
      v26 = -[ISDialogButton actionType](v24, "actionType") == 3;
      v27 = -[ISDialogButton actionType](v24, "actionType") != 0;
    }
    else
    {
      v27 = 0;
      v26 = 0;
    }
    objc_msgSend(v19, "addObject:", v24);

  }
  else
  {
    v27 = 0;
    v26 = 0;
    v25 = v20;
  }
  objc_msgSend(v11, "objectForKey:", CFSTR("okButtonString"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v11, "objectForKey:", CFSTR("okButton"));
    v29 = objc_claimAutoreleasedReturnValue();

    v28 = (void *)v29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v31 = v28;
    if (!v21)
      goto LABEL_43;
    goto LABEL_38;
  }
  v30 = objc_alloc_init(ISDialogButton);
  -[ISDialogButton setTitle:](v30, "setTitle:", v28);
  objc_msgSend(v11, "objectForKey:", CFSTR("okButtonAction"));
  v31 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ISDialogButton loadFromDictionary:](v30, "loadFromDictionary:", v31);
    if (v26)
    {
      v26 = 1;
      if (!v27)
      {
LABEL_32:
        v27 = -[ISDialogButton actionType](v30, "actionType") != 0;
        goto LABEL_37;
      }
    }
    else
    {
      v26 = -[ISDialogButton actionType](v30, "actionType") == 3;
      if (!v27)
        goto LABEL_32;
    }
    v27 = 1;
  }
LABEL_37:
  objc_msgSend(v19, "addObject:", v30);

  if (!v21)
  {
LABEL_43:
    v34 = v44;
    v7 = v45;
    goto LABEL_50;
  }
LABEL_38:
  objc_msgSend(v11, "objectForKey:", CFSTR("otherButtonString"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v31 = v32;
    goto LABEL_43;
  }
  v33 = objc_alloc_init(ISDialogButton);
  -[ISDialogButton setTitle:](v33, "setTitle:", v32);
  objc_msgSend(v11, "objectForKey:", CFSTR("otherButtonAction"));
  v31 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ISDialogButton loadFromDictionary:](v33, "loadFromDictionary:", v31);
    v26 = v26 || -[ISDialogButton actionType](v33, "actionType") == 3;
    v34 = v44;
    v7 = v45;
    v27 = v27 || -[ISDialogButton actionType](v33, "actionType") != 0;
  }
  else
  {
    v34 = v44;
    v7 = v45;
  }
  objc_msgSend(v19, "addObject:", v33);

LABEL_50:
  if (objc_msgSend(v19, "count"))
    -[ISDialog setButtons:](v8, "setButtons:", v19);
  -[ISDialog setExpectsResponse:](v8, "setExpectsResponse:", v27);
  -[ISDialog setAllowDuplicates:](v8, "setAllowDuplicates:", v26);
  if (SSDebugShouldUseFileBasedPaymentSheetProxy())
  {
    +[ISBiometricStore diskBasedPaymentSheet](ISBiometricStore, "diskBasedPaymentSheet");
    v35 = objc_claimAutoreleasedReturnValue();
    paymentSheet = v8->_paymentSheet;
    v8->_paymentSheet = (SSPaymentSheet *)v35;
  }
  else
  {
    objc_msgSend(v11, "objectForKey:", CFSTR("paymentSheetInfo"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_61;
    v31 = v37;
    -[ISDialog buyParams](v8, "buyParams");
    paymentSheet = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F48]), "initWithServerResponse:buyParams:", v31, paymentSheet);

    -[SSAuthenticationContext accountName](v8->_authenticationContext, "accountName");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setAccountName:", v39);

    -[ISDialog message](v8, "message");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
      objc_msgSend(v38, "setExplanation:", v40);
    -[ISDialog title](v8, "title");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
      objc_msgSend(v38, "setMessage:", v41);
    v42 = v8->_paymentSheet;
    v8->_paymentSheet = (SSPaymentSheet *)v38;

  }
  v37 = v31;
LABEL_61:
  if (!v8->_title && !v8->_message && !-[NSArray count](v8->_buttons, "count"))
  {

    v8 = 0;
  }

LABEL_66:
  return v8;
}

- (ISDialog)initWithDialogDictionary:(id)a3
{
  return -[ISDialog initWithDialogDictionary:authenticationContext:](self, "initWithDialogDictionary:authenticationContext:", a3, 0);
}

- (ISDialog)initWithError:(id)a3
{
  id v4;
  ISDialog *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  ISDialogButton *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  if ((ISErrorIsEqual(v4, (uint64_t)CFSTR("SSErrorDomain"), 16) & 1) != 0)
  {
    v5 = 0;
LABEL_9:

    goto LABEL_10;
  }
  v5 = -[ISDialog init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "localizedFailureReason");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISDialog setMessage:](v5, "setMessage:", v6);

    objc_msgSend(v4, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISDialog setTitle:](v5, "setTitle:", v7);

    objc_msgSend(v4, "userInfo");
    self = (ISDialog *)objc_claimAutoreleasedReturnValue();
    -[ISDialog objectForKey:](self, "objectForKey:", *MEMORY[0x24BEB2210]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISDialog objectForKey:](self, "objectForKey:", *MEMORY[0x24BEB2200]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISDialog objectForKey:](self, "objectForKey:", *MEMORY[0x24BEB2208]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && v9)
    {
      v11 = objc_alloc(MEMORY[0x24BDBCEB8]);
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24C441158, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[ISDialogButton buttonWithTitle:](ISDialogButton, "buttonWithTitle:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v11, "initWithObjects:", v14, 0);

      v16 = objc_alloc_init(ISDialogButton);
      -[ISDialogButton setActionTypeWithString:](v16, "setActionTypeWithString:", v9);
      -[ISDialogButton setParameter:](v16, "setParameter:", v10);
      -[ISDialogButton setTitle:](v16, "setTitle:", v8);
      objc_msgSend(v15, "addObject:", v16);
      -[ISDialog setButtons:](v5, "setButtons:", v15);
    }
    else
    {
      v17 = (void *)MEMORY[0x24BDBCE30];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24C441158, 0);
      v16 = (ISDialogButton *)objc_claimAutoreleasedReturnValue();
      +[ISDialogButton buttonWithTitle:](ISDialogButton, "buttonWithTitle:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "arrayWithObjects:", v18, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISDialog setButtons:](v5, "setButtons:", v19);

    }
    goto LABEL_9;
  }
LABEL_10:

  return v5;
}

- (ISDialog)initWithOfferDeviceError:(id)a3
{
  id v4;
  ISDialog *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  ISDialog *v10;
  void *v11;
  void *v12;
  ISDialogButton *v13;
  ISDialogButton *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ISDialog;
  v5 = -[ISDialog init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "localizedMessage");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedTitle");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v6 && v7)
    {
      -[ISDialog setMessage:](v5, "setMessage:", v6);
      v9 = v8;
    }
    else
    {
      if (v6)
        v9 = (void *)v6;
      else
        v9 = (void *)v7;
      if (!(v6 | v7))
      {
        v10 = v5;
        v5 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    -[ISDialog setTitle:](v5, "setTitle:", v9);
    v10 = (ISDialog *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v4, "localizedURLTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (ISDialogButton *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v11 && v12)
    {
      -[ISDialogButton localizedStringForKey:value:table:](v13, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24C441158, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[ISDialogButton buttonWithTitle:](ISDialogButton, "buttonWithTitle:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISDialog addObject:](v10, "addObject:", v16);

      v14 = objc_alloc_init(ISDialogButton);
      -[ISDialogButton setActionType:](v14, "setActionType:", 4);
      -[ISDialogButton setParameter:](v14, "setParameter:", v12);
      -[ISDialogButton setTitle:](v14, "setTitle:", v11);
      -[ISDialog addObject:](v10, "addObject:", v14);
    }
    else
    {
      -[ISDialogButton localizedStringForKey:value:table:](v13, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24C441158, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[ISDialogButton buttonWithTitle:](ISDialogButton, "buttonWithTitle:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISDialog addObject:](v10, "addObject:", v18);

    }
    -[ISDialog setButtons:](v5, "setButtons:", v10);

    goto LABEL_15;
  }
LABEL_16:

  return v5;
}

- (ISDialog)initWithTitle:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  ISDialog *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = -[ISDialog init](self, "init");
  if (v8)
  {
    v9 = (void *)MEMORY[0x24BDBCE30];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24C441158, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[ISDialogButton buttonWithTitle:](ISDialogButton, "buttonWithTitle:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayWithObjects:", v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISDialog setButtons:](v8, "setButtons:", v13);

    -[ISDialog setMessage:](v8, "setMessage:", v7);
    -[ISDialog setTitle:](v8, "setTitle:", v6);
  }

  return v8;
}

- (void)dealloc
{
  __CFDictionary *userNotificationValues;
  objc_super v4;

  -[ISDialog setButtons:](self, "setButtons:", 0);
  -[ISDialog setMessage:](self, "setMessage:", 0);
  -[ISDialog setTextFields:](self, "setTextFields:", 0);
  -[ISDialog setTitle:](self, "setTitle:", 0);
  userNotificationValues = self->_userNotificationValues;
  if (userNotificationValues)
    CFRelease(userNotificationValues);
  v4.receiver = self;
  v4.super_class = (Class)ISDialog;
  -[ISDialog dealloc](&v4, sel_dealloc);
}

+ (int64_t)displayCountForKey:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;

  v3 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ISDialogDisplayCount-%@"), a3);
  v4 = (const __CFString *)*MEMORY[0x24BDBD580];
  CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x24BDBD580]);
  return CFPreferencesGetAppIntegerValue(v3, v4, 0);
}

- (id)copyUserNotification
{
  ISDialog *v2;
  const __CFDictionary *userNotificationValues;
  __CFDictionary *MutableCopy;
  id result;
  void *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  const void *v12;
  void *v13;
  uint64_t v14;
  __CFDictionary *v15;
  char *i;
  void *v17;
  char *v18;
  const void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  const CFArrayCallBacks *v31;
  __CFArray *Mutable;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  int v43;
  uint64_t v44;
  const void *v45;
  _BOOL4 v46;
  const void *v47;
  const void *v48;
  const void *v49;
  const void *v50;
  const void *v51;
  const void *v52;
  const void *v53;
  const void *v54;
  const void *v55;
  const void *v56;
  const void *v57;
  const void *v58;
  const void *v59;
  const void *v60;
  const void *v61;
  uint64_t v62;
  ISUserNotification *v63;
  void *v64;
  ISDialog *v65;
  __CFArray *v66;
  __CFArray *theArray;
  __CFArray *v68;
  CFMutableArrayRef v69;
  __CFArray *v70;

  v2 = self;
  -[NSLock lock](self->_lock, "lock");
  userNotificationValues = v2->_userNotificationValues;
  if (!userNotificationValues)
  {
    -[NSLock unlock](v2->_lock, "unlock");
    goto LABEL_5;
  }
  MutableCopy = CFDictionaryCreateMutableCopy(0, 0, userNotificationValues);
  -[NSLock unlock](v2->_lock, "unlock");
  if (!MutableCopy)
  {
LABEL_5:
    result = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    MutableCopy = (__CFDictionary *)result;
    if (!result)
      return result;
  }
  -[ISDialog title](v2, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
    CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x24BDBD6D8], v6);
  -[ISDialog message](v2, "message");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v7)
    CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x24BDBD6E0], v7);
  -[ISDialog buttons](v2, "buttons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  v10 = 0x24BDD1000;
  v65 = v2;
  if (v9 == 1)
  {
    objc_msgSend(v8, "objectAtIndex:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (const void *)*MEMORY[0x24BDBD6F8];
    objc_msgSend(v11, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    CFDictionarySetValue(MutableCopy, v12, v13);

  }
  else
  {
    v14 = v9;
    -[ISDialog orderedButtonTitleKeysForCFUserNotification](v2, "orderedButtonTitleKeysForCFUserNotification");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = (CFMutableArrayRef)objc_msgSend(v11, "count");
    v15 = MutableCopy;
    if (v14 >= 1)
    {
      for (i = 0; i != (char *)v14; ++i)
      {
        objc_msgSend(v8, "objectAtIndex:", i);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((uint64_t)i >= (uint64_t)((char *)v69 - 1))
          v18 = (char *)v69 - 1;
        else
          v18 = i;
        v19 = (const void *)objc_msgSend(v11, "objectAtIndex:", v18);
        objc_msgSend(v17, "title");
        v20 = v8;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        CFDictionarySetValue(v15, v19, v21);

        v8 = v20;
      }
    }
    v2 = v65;
    v22 = -[ISDialog defaultButtonIndex](v65, "defaultButtonIndex");
    MutableCopy = v15;
    v10 = 0x24BDD1000uLL;
    if ((v22 & 0x8000000000000000) == 0)
    {
      v23 = v22;
      if (v22 < (uint64_t)v69)
      {
        v24 = objc_msgSend((id)objc_opt_class(), "buttonTagForCFUserNotificationButtonTitleKey:", objc_msgSend(v11, "objectAtIndex:", v23));
        CFDictionarySetValue(v15, (const void *)*MEMORY[0x24BEB0E30], (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v24));
      }
    }
    v25 = -[ISDialog unlockActionButtonIndex](v65, "unlockActionButtonIndex", v23);
    if ((v25 & 0x8000000000000000) == 0)
    {
      v26 = v25;
      if (v25 < (uint64_t)v69)
      {
        v27 = objc_msgSend((id)objc_opt_class(), "buttonTagForCFUserNotificationButtonTitleKey:", objc_msgSend(v11, "objectAtIndex:", v26));
        CFDictionarySetValue(v15, (const void *)*MEMORY[0x24BEB0E20], (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v27));
      }
    }
  }

  -[ISDialog textFields](v2, "textFields");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "count");
  if (v29 < 1)
  {
    v34 = 3;
  }
  else
  {
    v30 = v29;
    v64 = v8;
    v31 = (const CFArrayCallBacks *)MEMORY[0x24BDBD690];
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
    v70 = CFArrayCreateMutable(0, 0, v31);
    v68 = CFArrayCreateMutable(0, 0, v31);
    theArray = CFArrayCreateMutable(0, 0, v31);
    v66 = CFArrayCreateMutable(0, 0, v31);
    v33 = 0;
    v34 = 3;
    do
    {
      objc_msgSend(v28, "objectAtIndex:", v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "title");
      v36 = v28;
      v37 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v37)
        v38 = v37;
      else
        v38 = &stru_24C441158;
      CFArrayAppendValue(theArray, v38);
      objc_msgSend(v35, "value");
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v7)
        v39 = v7;
      else
        v39 = &stru_24C441158;
      CFArrayAppendValue(v66, v39);
      CFArrayAppendValue(Mutable, (const void *)objc_msgSend(*(id *)(v10 + 1760), "numberWithInt:", 0));
      CFArrayAppendValue(v70, (const void *)objc_msgSend(*(id *)(v10 + 1760), "numberWithInt:", 1));
      v40 = *(void **)(v10 + 1760);
      v41 = objc_msgSend(v35, "keyboardType");
      v42 = v40;
      v28 = v36;
      CFArrayAppendValue(v68, (const void *)objc_msgSend(v42, "numberWithInteger:", v41));
      v43 = objc_msgSend(v35, "isSecure");
      v44 = 0x10000 << v33;
      if (!v43)
        v44 = 0;
      v34 |= v44;

      ++v33;
    }
    while (v30 != v33);
    CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x24BEB0EB8], Mutable);
    CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x24BEB0EC0], v70);
    CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x24BDBD708], v68);
    CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x24BDBD720], theArray);
    CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x24BDBD728], v66);
    CFRelease(Mutable);
    CFRelease(v70);
    CFRelease(v68);
    CFRelease(theArray);
    CFRelease(v66);
    v2 = v65;
    v8 = v64;
  }
  v45 = (const void *)*MEMORY[0x24BEB0E48];
  v46 = -[ISDialog displaysOnLockscreen](v2, "displaysOnLockscreen");
  v47 = (const void *)*MEMORY[0x24BDBD270];
  v48 = (const void *)*MEMORY[0x24BDBD268];
  if (v46)
    v49 = (const void *)*MEMORY[0x24BDBD270];
  else
    v49 = (const void *)*MEMORY[0x24BDBD268];
  CFDictionarySetValue(MutableCopy, v45, v49);
  v50 = (const void *)*MEMORY[0x24BEB0E70];
  if (-[ISDialog displaysOnLockscreen](v2, "displaysOnLockscreen"))
    v51 = v47;
  else
    v51 = v48;
  CFDictionarySetValue(MutableCopy, v50, v51);
  v52 = (const void *)*MEMORY[0x24BEB0E00];
  if (-[ISDialog dismissOnHomeButton](v2, "dismissOnHomeButton"))
    v53 = v47;
  else
    v53 = v48;
  CFDictionarySetValue(MutableCopy, v52, v53);
  v54 = (const void *)*MEMORY[0x24BEB0E40];
  if (-[ISDialog dismissOnLock](v2, "dismissOnLock"))
    v55 = v47;
  else
    v55 = v48;
  CFDictionarySetValue(MutableCopy, v54, v55);
  v56 = (const void *)*MEMORY[0x24BDBD6E8];
  if (-[ISDialog shouldDisplayAsTopMost](v2, "shouldDisplayAsTopMost"))
    v57 = v47;
  else
    v57 = v48;
  CFDictionarySetValue(MutableCopy, v56, v57);
  v58 = (const void *)*MEMORY[0x24BEB0E58];
  if (-[ISDialog shouldDismissAfterUnlock](v2, "shouldDismissAfterUnlock"))
    v59 = v48;
  else
    v59 = v47;
  CFDictionarySetValue(MutableCopy, v58, v59);
  v60 = (const void *)*MEMORY[0x24BEB0E90];
  if (-[ISDialog shouldPendInSetupIfNotAllowed](v2, "shouldPendInSetupIfNotAllowed"))
    v61 = v47;
  else
    v61 = v48;
  CFDictionarySetValue(MutableCopy, v60, v61);
  if (v2->_noDefaultButton)
    v62 = v34 | 0x20;
  else
    v62 = v34;
  v63 = -[ISUserNotification initWithDictionary:options:]([ISUserNotification alloc], "initWithDictionary:options:", MutableCopy, v62);
  CFRelease(MutableCopy);

  return v63;
}

- (void)copyValueForCFUserNotificationKey:(__CFString *)a3
{
  __CFDictionary *userNotificationValues;
  const void *Value;
  CFTypeRef v7;

  -[NSLock lock](self->_lock, "lock");
  userNotificationValues = self->_userNotificationValues;
  if (userNotificationValues && (Value = CFDictionaryGetValue(userNotificationValues, a3)) != 0)
    v7 = CFRetain(Value);
  else
    v7 = 0;
  -[NSLock unlock](self->_lock, "unlock");
  return (void *)v7;
}

- (NSString)displayCountKey
{
  NSString *v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = self->_displayCountKey;
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (void)incrementDisplayCount
{
  const __CFString *v3;
  const __CFString *v4;
  void *v5;

  -[NSLock lock](self->_lock, "lock");
  if (self->_displayCountKey)
  {
    v3 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ISDialogDisplayCount-%@"), self->_displayCountKey);
    v4 = (const __CFString *)*MEMORY[0x24BDBD580];
    CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x24BDBD580]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", CFPreferencesGetAppIntegerValue(v3, v4, 0) + 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CFPreferencesSetAppValue(v3, v5, v4);

    CFPreferencesAppSynchronize(v4);
  }
  -[NSLock unlock](self->_lock, "unlock");
}

- (BOOL)isDisplayable
{
  const __CFString *v3;
  BOOL v4;

  -[NSLock lock](self->_lock, "lock");
  if (self->_displayCountKey && self->_maxDisplayCount >= 1)
  {
    v3 = (const __CFString *)*MEMORY[0x24BDBD580];
    CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x24BDBD580]);
    v4 = CFPreferencesGetAppIntegerValue((CFStringRef)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ISDialogDisplayCount-%@"), self->_displayCountKey), v3, 0) < self->_maxDisplayCount;
  }
  else
  {
    v4 = 1;
  }
  -[NSLock unlock](self->_lock, "unlock");
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ISDialog message](self, "message");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
      v7 = 1;
    else
      v7 = objc_msgSend(v5, "isEqual:", v6);
    -[ISDialog title](self, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (v9 == v10)
        v11 = 1;
      else
        v11 = objc_msgSend(v9, "isEqual:", v10);
    }
    else
    {
      v11 = 0;
    }
    -[ISDialog buttons](self, "buttons");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "buttons");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v11 & 1) != 0)
    {
      if (v12 == v13)
      {
        v8 = 1;
      }
      else
      {
        v14 = objc_msgSend(v12, "count");
        v8 = v14 == objc_msgSend(v13, "count");
      }
      v16 = objc_msgSend(v12, "count");
      if (v16 >= 1 && v8)
      {
        v17 = v16;
        v18 = 1;
        do
        {
          objc_msgSend(v12, "objectAtIndex:", v18 - 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectAtIndex:", v18 - 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v8) = objc_msgSend(v19, "isEqual:superficial:", v20, 0);

          if (v18 >= v17)
            break;
          ++v18;
        }
        while ((v8 & 1) != 0);
      }
    }
    else
    {
      objc_msgSend(v12, "count");
      LOBYTE(v8) = 0;
    }

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (int64_t)maximumDisplayCount
{
  int64_t maxDisplayCount;

  -[NSLock lock](self->_lock, "lock");
  maxDisplayCount = self->_maxDisplayCount;
  -[NSLock unlock](self->_lock, "unlock");
  return maxDisplayCount;
}

- (void)setButtonsWithTitles:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  ISDialogButton *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          v12 = objc_alloc_init(ISDialogButton);
          -[ISDialogButton setTitle:](v12, "setTitle:", v11, (_QWORD)v13);
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    -[ISDialog setButtons:](self, "setButtons:", v5);
  }
  else
  {
    -[ISDialog setButtons:](self, "setButtons:", 0);
  }

}

- (void)setDisplayCountKey:(id)a3
{
  NSString *v4;
  NSString *displayCountKey;
  NSString *v6;

  v6 = (NSString *)a3;
  -[NSLock lock](self->_lock, "lock");
  if (self->_displayCountKey != v6)
  {
    v4 = (NSString *)-[NSString copy](v6, "copy");
    displayCountKey = self->_displayCountKey;
    self->_displayCountKey = v4;

  }
  -[NSLock unlock](self->_lock, "unlock");

}

- (void)setMaximumDisplayCount:(int64_t)a3
{
  -[NSLock lock](self->_lock, "lock");
  self->_maxDisplayCount = a3;
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)setValue:(id)a3 forUserInfoKey:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *userInfo;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[NSLock lock](self->_lock, "lock");
  if (!self->_userInfo)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    userInfo = self->_userInfo;
    self->_userInfo = v7;

  }
  v9 = self->_userInfo;
  if (v10)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v10, v6);
  else
    -[NSMutableDictionary removeObjectForKey:](v9, "removeObjectForKey:", v6);
  -[NSLock unlock](self->_lock, "unlock");

}

- (void)setValue:(void *)a3 forCFUserNotificationKey:(__CFString *)a4
{
  __CFDictionary *userNotificationValues;

  -[NSLock lock](self->_lock, "lock");
  userNotificationValues = self->_userNotificationValues;
  if (a3)
  {
    if (!userNotificationValues)
    {
      userNotificationValues = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      self->_userNotificationValues = userNotificationValues;
    }
    CFDictionarySetValue(userNotificationValues, a4, a3);
  }
  else if (userNotificationValues)
  {
    CFDictionaryRemoveValue(userNotificationValues, a4);
  }
  -[NSLock unlock](self->_lock, "unlock");
}

- (id)valueForUserInfoKey:(id)a3
{
  NSLock *lock;
  id v5;
  void *v6;

  lock = self->_lock;
  v5 = a3;
  -[NSLock lock](lock, "lock");
  -[NSMutableDictionary objectForKey:](self->_userInfo, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSLock unlock](self->_lock, "unlock");
  return v6;
}

- (id)orderedButtonTitleKeysForCFUserNotification
{
  uint64_t v3;
  _BOOL4 noDefaultButton;
  NSUInteger v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD v10[3];
  _QWORD v11[2];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDBD6F8];
  v11[0] = *MEMORY[0x24BDBD6F0];
  v11[1] = v3;
  v12 = *MEMORY[0x24BDBD718];
  v10[0] = v11[0];
  v10[1] = v12;
  v10[2] = v3;
  -[NSLock lock](self->_lock, "lock");
  noDefaultButton = self->_noDefaultButton;
  v5 = -[NSArray count](self->_buttons, "count");
  -[NSLock unlock](self->_lock, "unlock");
  if (!v5)
    return 0;
  v6 = objc_alloc(MEMORY[0x24BDBCE30]);
  if (noDefaultButton)
    v7 = v10;
  else
    v7 = v11;
  if (v5 >= 3)
    v8 = 3;
  else
    v8 = v5;
  return (id)objc_msgSend(v6, "initWithObjects:count:", v7, v8);
}

+ (void)_initializeStaticButtonTitleKeyAndTagMapping
{
  if (_initializeStaticButtonTitleKeyAndTagMapping_sButtonTitleKeyAndTagMappingOnceToken != -1)
    dispatch_once(&_initializeStaticButtonTitleKeyAndTagMapping_sButtonTitleKeyAndTagMappingOnceToken, &__block_literal_global_10);
}

_QWORD *__56__ISDialog__initializeStaticButtonTitleKeyAndTagMapping__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *result;

  v0 = *MEMORY[0x24BDBD6F8];
  v1 = *MEMORY[0x24BDBD6F0];
  v2 = *MEMORY[0x24BDBD718];
  sButtonTitleKeyAndTagMappingCount = 1;
  result = malloc_type_malloc(0x30uLL, 0xCA20526uLL);
  sButtonTitleKeyAndTagMapping = (uint64_t)result;
  *result = v0;
  result[1] = 0;
  result[2] = v1;
  result[3] = 1;
  result[4] = v2;
  result[5] = 2;
  return result;
}

+ (unint64_t)buttonTagForCFUserNotificationButtonTitleKey:(__CFString *)a3
{
  uint64_t v4;
  unint64_t v5;
  BOOL v6;

  objc_msgSend(a1, "_initializeStaticButtonTitleKeyAndTagMapping");
  if (!a3 || sButtonTitleKeyAndTagMappingCount != 1)
    return 0;
  v4 = 0;
  v5 = 0;
  while (!CFEqual(a3, *(CFTypeRef *)(sButtonTitleKeyAndTagMapping + v4)))
  {
    v6 = sButtonTitleKeyAndTagMappingCount != 1 || v5++ >= 2;
    v4 += 16;
    if (v6)
      return 0;
  }
  return *(_QWORD *)(sButtonTitleKeyAndTagMapping + v4 + 8);
}

+ (__CFString)buttonTitleKeyForCFUserNotificationButtonTag:(unint64_t)a3
{
  _QWORD *v4;
  uint64_t v5;

  objc_msgSend(a1, "_initializeStaticButtonTitleKeyAndTagMapping");
  if (sButtonTitleKeyAndTagMappingCount != 1)
    return 0;
  v4 = (_QWORD *)(sButtonTitleKeyAndTagMapping + 8);
  v5 = -1;
  while (*v4 != a3)
  {
    v4 += 2;
    if ((unint64_t)++v5 >= 2)
      return 0;
  }
  return (__CFString *)*(v4 - 1);
}

- (id)buyParams
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__8;
  v10 = __Block_byref_object_dispose__8;
  v11 = 0;
  -[ISDialog buttons](self, "buttons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __21__ISDialog_buyParams__block_invoke;
  v5[3] = &unk_24C43CB58;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __21__ISDialog_buyParams__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id obj;

  objc_msgSend(a2, "parameter");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
    *a4 = 1;
  }

}

- (int64_t)_kindForString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("authorization"));
  else
    v4 = 0;

  return v4;
}

- (ISDialog)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  ISDialog *v6;
  id v8;
  void *v9;
  uint64_t v10;
  SSAuthenticationContext *authenticationContext;
  ISDialog *v12;
  uint64_t v13;
  uint64_t v14;
  NSArray *buttons;
  uint64_t v16;
  NSString *displayCountKey;
  uint64_t v18;
  NSString *message;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSArray *textFields;
  uint64_t v24;
  NSString *title;
  uint64_t v26;
  NSMutableDictionary *userInfo;
  const __CFDictionary *v28;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x20BD37E20](v4) == MEMORY[0x24BDACFA0])
  {
    v6 = -[ISDialog init](self, "init");
    if (!v6)
      goto LABEL_5;
    v6->_allowDuplicates = xpc_dictionary_get_BOOL(v5, "1");
    v8 = objc_alloc(MEMORY[0x24BEB1DC0]);
    xpc_dictionary_get_value(v5, "2");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithXPCEncoding:", v9);
    authenticationContext = v6->_authenticationContext;
    v6->_authenticationContext = (SSAuthenticationContext *)v10;

    v6->_authorizationIsForced = xpc_dictionary_get_BOOL(v5, "3");
    xpc_dictionary_get_value(v5, "4");
    v12 = (ISDialog *)objc_claimAutoreleasedReturnValue();
    self = v12;
    v13 = MEMORY[0x24BDACF78];
    if (v12 && MEMORY[0x20BD37E20](v12) == v13)
    {
      objc_opt_class();
      v14 = SSXPCCreateNSArrayFromXPCEncodedArray();
      buttons = v6->_buttons;
      v6->_buttons = (NSArray *)v14;

    }
    v6->_defaultButtonIndex = xpc_dictionary_get_int64(v5, "5");
    v6->_dismissOnHomeButton = xpc_dictionary_get_BOOL(v5, "6");
    v6->_dismissOnLock = xpc_dictionary_get_BOOL(v5, "7");
    objc_opt_class();
    v16 = SSXPCDictionaryCopyCFObjectWithClass();
    displayCountKey = v6->_displayCountKey;
    v6->_displayCountKey = (NSString *)v16;

    v6->_expectsResponse = xpc_dictionary_get_BOOL(v5, "9");
    v6->_groupsTextFields = xpc_dictionary_get_BOOL(v5, "A");
    v6->_kind = xpc_dictionary_get_int64(v5, "B");
    v6->_maxDisplayCount = xpc_dictionary_get_int64(v5, "C");
    objc_opt_class();
    v18 = SSXPCDictionaryCopyCFObjectWithClass();
    message = v6->_message;
    v6->_message = (NSString *)v18;

    v6->_noDefaultButton = xpc_dictionary_get_BOOL(v5, "N");
    v6->_oneButtonPerLine = xpc_dictionary_get_BOOL(v5, "E");
    v6->_shouldDismissAfterUnlock = xpc_dictionary_get_BOOL(v5, "F");
    v6->_shouldDisplayAsTopMost = xpc_dictionary_get_BOOL(v5, "G");
    v6->_shouldPendInSetupIfNotAllowed = xpc_dictionary_get_BOOL(v5, "H");
    xpc_dictionary_get_value(v5, "I");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v20 && MEMORY[0x20BD37E20](v20) == v13)
    {
      objc_opt_class();
      v22 = SSXPCCreateNSArrayFromXPCEncodedArray();
      textFields = v6->_textFields;
      v6->_textFields = (NSArray *)v22;

    }
    objc_opt_class();
    v24 = SSXPCDictionaryCopyCFObjectWithClass();
    title = v6->_title;
    v6->_title = (NSString *)v24;

    v6->_unlockActionButtonIndex = xpc_dictionary_get_int64(v5, "K");
    objc_opt_class();
    v26 = SSXPCDictionaryCopyCFObjectWithClass();
    userInfo = v6->_userInfo;
    v6->_userInfo = (NSMutableDictionary *)v26;

    objc_opt_class();
    v28 = (const __CFDictionary *)SSXPCDictionaryCopyCFObjectWithClass();
    if (v28)
      v6->_userNotificationValues = CFDictionaryCreateMutableCopy(0, 0, v28);

  }
  else
  {
    v6 = 0;
  }

LABEL_5:
  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  -[NSLock lock](self->_lock, "lock");
  xpc_dictionary_set_BOOL(v3, "1", self->_allowDuplicates);
  SSXPCDictionarySetCFObject();
  xpc_dictionary_set_BOOL(v3, "3", self->_authorizationIsForced);
  SSXPCDictionarySetCFObject();
  xpc_dictionary_set_int64(v3, "5", self->_defaultButtonIndex);
  xpc_dictionary_set_BOOL(v3, "6", self->_dismissOnHomeButton);
  xpc_dictionary_set_BOOL(v3, "7", self->_dismissOnLock);
  SSXPCDictionarySetCFObject();
  xpc_dictionary_set_BOOL(v3, "9", self->_expectsResponse);
  xpc_dictionary_set_BOOL(v3, "A", self->_groupsTextFields);
  xpc_dictionary_set_int64(v3, "B", self->_kind);
  xpc_dictionary_set_int64(v3, "C", self->_maxDisplayCount);
  SSXPCDictionarySetCFObject();
  xpc_dictionary_set_BOOL(v3, "N", self->_noDefaultButton);
  xpc_dictionary_set_BOOL(v3, "E", self->_oneButtonPerLine);
  xpc_dictionary_set_BOOL(v3, "F", self->_shouldDismissAfterUnlock);
  xpc_dictionary_set_BOOL(v3, "G", self->_shouldDisplayAsTopMost);
  xpc_dictionary_set_BOOL(v3, "H", self->_shouldPendInSetupIfNotAllowed);
  SSXPCDictionarySetCFObject();
  SSXPCDictionarySetCFObject();
  xpc_dictionary_set_int64(v3, "K", self->_unlockActionButtonIndex);
  SSXPCDictionarySetCFObject();
  SSXPCDictionarySetCFObject();
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (BOOL)allowDuplicates
{
  return self->_allowDuplicates;
}

- (void)setAllowDuplicates:(BOOL)a3
{
  self->_allowDuplicates = a3;
}

- (SSAuthenticationContext)authenticationContext
{
  return (SSAuthenticationContext *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAuthenticationContext:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (BOOL)authorizationIsForced
{
  return self->_authorizationIsForced;
}

- (void)setAuthorizationIsForced:(BOOL)a3
{
  self->_authorizationIsForced = a3;
}

- (NSArray)buttons
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setButtons:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (int64_t)defaultButtonIndex
{
  return self->_defaultButtonIndex;
}

- (void)setDefaultButtonIndex:(int64_t)a3
{
  self->_defaultButtonIndex = a3;
}

- (BOOL)dismissOnHomeButton
{
  return self->_dismissOnHomeButton;
}

- (void)setDismissOnHomeButton:(BOOL)a3
{
  self->_dismissOnHomeButton = a3;
}

- (BOOL)dismissOnLock
{
  return self->_dismissOnLock;
}

- (void)setDismissOnLock:(BOOL)a3
{
  self->_dismissOnLock = a3;
}

- (BOOL)expectsResponse
{
  return self->_expectsResponse;
}

- (void)setExpectsResponse:(BOOL)a3
{
  self->_expectsResponse = a3;
}

- (BOOL)groupsTextFields
{
  return self->_groupsTextFields;
}

- (void)setGroupsTextFields:(BOOL)a3
{
  self->_groupsTextFields = a3;
}

- (int64_t)kind
{
  return self->_kind;
}

- (void)setKind:(int64_t)a3
{
  self->_kind = a3;
}

- (NSString)message
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setMessage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (BOOL)noDefaultButton
{
  return self->_noDefaultButton;
}

- (void)setNoDefaultButton:(BOOL)a3
{
  self->_noDefaultButton = a3;
}

- (BOOL)oneButtonPerLine
{
  return self->_oneButtonPerLine;
}

- (void)setOneButtonPerLine:(BOOL)a3
{
  self->_oneButtonPerLine = a3;
}

- (BOOL)shouldDismissAfterUnlock
{
  return self->_shouldDismissAfterUnlock;
}

- (void)setShouldDismissAfterUnlock:(BOOL)a3
{
  self->_shouldDismissAfterUnlock = a3;
}

- (BOOL)shouldDisplayAsTopMost
{
  return self->_shouldDisplayAsTopMost;
}

- (void)setShouldDisplayAsTopMost:(BOOL)a3
{
  self->_shouldDisplayAsTopMost = a3;
}

- (BOOL)shouldPendInSetupIfNotAllowed
{
  return self->_shouldPendInSetupIfNotAllowed;
}

- (void)setShouldPendInSetupIfNotAllowed:(BOOL)a3
{
  self->_shouldPendInSetupIfNotAllowed = a3;
}

- (NSArray)textFields
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setTextFields:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (int64_t)unlockActionButtonIndex
{
  return self->_unlockActionButtonIndex;
}

- (void)setUnlockActionButtonIndex:(int64_t)a3
{
  self->_unlockActionButtonIndex = a3;
}

- (BOOL)displaysOnLockscreen
{
  return self->_displaysOnLockscreen;
}

- (void)setDisplaysOnLockscreen:(BOOL)a3
{
  self->_displaysOnLockscreen = a3;
}

- (SSPaymentSheet)paymentSheet
{
  return (SSPaymentSheet *)objc_getProperty(self, a2, 152, 1);
}

- (NSString)touchIDContinueToken
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setTouchIDContinueToken:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchIDContinueToken, 0);
  objc_storeStrong((id *)&self->_paymentSheet, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_textFields, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_displayCountKey, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
}

@end
