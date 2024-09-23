@implementation TSTransferOneTimeCodeViewController

- (TSTransferOneTimeCodeViewController)initWithSourceIccid:(id)a3 phoneNumber:(id)a4 carrierName:(id)a5 usePin:(BOOL)a6
{
  id v6;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  TSTransferOneTimeCodeViewController *v34;
  TSTransferOneTimeCodeViewController *v35;
  id v36;
  uint64_t v37;
  CoreTelephonyClient *client;
  uint64_t v40;
  id v41;
  objc_super v42;

  LODWORD(v6) = a6;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((_DWORD)v6)
  {
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ENTER_ACCOUNT_PIN"), &stru_24DEF4290, CFSTR("Localizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "length"))
    {
      v17 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("ENTER_PIN_DETAILS_%@"), &stru_24DEF4290, CFSTR("Localizable"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", v19, v13);
LABEL_10:
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v29;
    v30 = CFSTR("ENTER_PIN_DETAILS_NO_CARRIER");
  }
  else
  {
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ENTER_ONE_TIME_PASSCODE"), &stru_24DEF4290, CFSTR("Localizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("****"), v12);
      v20 = objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v18 = (void *)v20;
        v41 = v11;
        v21 = objc_msgSend(v13, "length");
        v22 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v21)
        {
          objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("ONE_TIME_PASSCODE_DETAILS_%@_%@"), &stru_24DEF4290, CFSTR("Localizable"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringWithFormat:", v25, v18, v13);
        }
        else
        {
          objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("ONE_TIME_PASSCODE_DETAILS_NO_CARRIER_%@"), &stru_24DEF4290, CFSTR("Localizable"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringWithFormat:", v25, v18, v40);
        }
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = v41;
        goto LABEL_16;
      }
    }
    if (objc_msgSend(v13, "length"))
    {
      v6 = v11;
      v26 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("ONE_TIME_PASSCODE_DETAILS_NO_PHONE_NUMBER_%@"), &stru_24DEF4290, CFSTR("Localizable"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      v11 = v6;
      LOBYTE(v6) = 0;
      objc_msgSend(v27, "stringWithFormat:", v19, v13);
      goto LABEL_10;
    }
    v6 = v11;
    v31 = (void *)MEMORY[0x24BDD1488];
    v32 = objc_opt_class();
    v33 = v31;
    v11 = v6;
    LOBYTE(v6) = 0;
    objc_msgSend(v33, "bundleForClass:", v32);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v29;
    v30 = CFSTR("ONE_TIME_PASSCODE_DETAILS_NO_CARRIER_NO_PHONE_NUMBER");
  }
  objc_msgSend(v29, "localizedStringForKey:value:table:", v30, &stru_24DEF4290, CFSTR("Localizable"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  v42.receiver = self;
  v42.super_class = (Class)TSTransferOneTimeCodeViewController;
  v34 = -[TSTransferOneTimeCodeViewController initWithTitle:detailText:icon:](&v42, sel_initWithTitle_detailText_icon_, v16, v28, 0);
  v35 = v34;
  if (v34)
  {
    objc_storeStrong((id *)&v34->_details, v28);
    objc_storeStrong((id *)&v35->_sourceIccid, a3);
    v35->_usePin = (char)v6;
    v36 = objc_alloc(MEMORY[0x24BDC2810]);
    v37 = objc_msgSend(v36, "initWithQueue:", MEMORY[0x24BDAC9B8]);
    client = v35->_client;
    v35->_client = (CoreTelephonyClient *)v37;

  }
  return v35;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  UITextField *v7;
  UITextField *otpEditor;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SSOBLinkTrayButton *v17;
  SSOBLinkTrayButton *resendOTPButton;
  SSOBLinkTrayButton *v19;
  void *v20;
  void *v21;
  void *v22;
  SSOBBoldTrayButton *v23;
  SSOBBoldTrayButton *continueButton;
  SSOBBoldTrayButton *v25;
  void *v26;
  void *v27;
  void *v28;
  OBLinkTrayButton *v29;
  OBLinkTrayButton *skipButton;
  OBLinkTrayButton *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  UIBarButtonItem *v36;
  UIBarButtonItem *cancelButton;
  void *v38;
  void *v39;
  void *v40;
  objc_super v41;
  _QWORD v42[3];

  v42[2] = *MEMORY[0x24BDAC8D0];
  v41.receiver = self;
  v41.super_class = (Class)TSTransferOneTimeCodeViewController;
  -[TSOBWelcomeController viewDidLoad](&v41, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateTrayButtonText_, CFSTR("esim.install.state.changed"), 0);

  -[TSTransferOneTimeCodeViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSTransferOneTimeCodeViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v6 = objc_alloc(MEMORY[0x24BEBDA48]);
  v7 = (UITextField *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  otpEditor = self->_otpEditor;
  self->_otpEditor = v7;

  -[UITextField setBorderStyle:](self->_otpEditor, "setBorderStyle:", 3);
  -[UITextField setKeyboardType:](self->_otpEditor, "setKeyboardType:", 4);
  -[UITextField setTextContentType:](self->_otpEditor, "setTextContentType:", *MEMORY[0x24BEBE800]);
  -[UITextField setClearButtonMode:](self->_otpEditor, "setClearButtonMode:", 1);
  -[UITextField setReturnKeyType:](self->_otpEditor, "setReturnKeyType:", 9);
  -[UITextField addTarget:action:forControlEvents:](self->_otpEditor, "addTarget:action:forControlEvents:", self, sel__textFieldDidChange, 0x20000);
  -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](self->_otpEditor, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITextField setDelegate:](self->_otpEditor, "setDelegate:", self);
  if (self->_usePin)
    -[UITextField setSecureTextEntry:](self->_otpEditor, "setSecureTextEntry:", 1);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA90]), "initWithFrame:", 0.0, 0.0, 320.0, 50.0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v42[0] = v10;
  v11 = objc_alloc(MEMORY[0x24BEBD410]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_24DEF4290, CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithTitle:style:target:action:", v13, 2, self, sel__hideKeyboard);
  v42[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setItems:", v15);

  objc_msgSend(v9, "sizeToFit");
  -[UITextField setInputAccessoryView:](self->_otpEditor, "setInputAccessoryView:", v9);
  -[TSTransferOneTimeCodeViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", self->_otpEditor);

  if (!self->_usePin)
  {
    +[OBLinkTrayButton linkButton](SSOBLinkTrayButton, "linkButton");
    v17 = (SSOBLinkTrayButton *)objc_claimAutoreleasedReturnValue();
    resendOTPButton = self->_resendOTPButton;
    self->_resendOTPButton = v17;

    v19 = self->_resendOTPButton;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("RENEW_ONE_TIME_PASSCODE"), &stru_24DEF4290, CFSTR("Localizable"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSOBLinkTrayButton setTitle:forState:](v19, "setTitle:forState:", v21, 0);

    -[SSOBLinkTrayButton addTarget:action:forControlEvents:](self->_resendOTPButton, "addTarget:action:forControlEvents:", self, sel__resendOTP, 64);
    -[TSTransferOneTimeCodeViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", self->_resendOTPButton);

  }
  +[OBBoldTrayButton boldButton](SSOBBoldTrayButton, "boldButton", 1177);
  v23 = (SSOBBoldTrayButton *)objc_claimAutoreleasedReturnValue();
  continueButton = self->_continueButton;
  self->_continueButton = v23;

  v25 = self->_continueButton;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_24DEF4290, CFSTR("Localizable"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSOBBoldTrayButton setTitle:forState:](v25, "setTitle:forState:", v27, 0);

  -[SSOBBoldTrayButton addTarget:action:forControlEvents:](self->_continueButton, "addTarget:action:forControlEvents:", self, sel__continueButtonTapped_, 64);
  -[OBBoldTrayButton setEnabled:](self->_continueButton, "setEnabled:", 0);
  -[TSTransferOneTimeCodeViewController buttonTray](self, "buttonTray");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addButton:", self->_continueButton);

  if (+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
  {
    objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
    v29 = (OBLinkTrayButton *)objc_claimAutoreleasedReturnValue();
    skipButton = self->_skipButton;
    self->_skipButton = v29;

    -[OBLinkTrayButton setRole:](self->_skipButton, "setRole:", 2);
    v31 = self->_skipButton;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("SET_UP_LATER_IN_SETTINGS"), &stru_24DEF4290, CFSTR("Localizable"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBLinkTrayButton setTitle:forState:](v31, "setTitle:forState:", v33, 0);

    -[OBLinkTrayButton addTarget:action:forControlEvents:](self->_skipButton, "addTarget:action:forControlEvents:", self, sel__cancelButtonTapped_, 64);
    -[TSTransferOneTimeCodeViewController buttonTray](self, "buttonTray");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addButton:", self->_skipButton);

    -[TSTransferOneTimeCodeViewController buttonTray](self, "buttonTray");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }
  else
  {
    v36 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelButtonTapped_);
    cancelButton = self->_cancelButton;
    self->_cancelButton = v36;

    -[OBBaseWelcomeController navigationItem](self, "navigationItem");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setLeftBarButtonItem:", self->_cancelButton);
  }

  -[TSTransferOneTimeCodeViewController _setupLayoutConstraint](self, "_setupLayoutConstraint");
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setHidesBackButton:animated:", 1, 0);

  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel__hideKeyboard);
  -[TSTransferOneTimeCodeViewController view](self, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addGestureRecognizer:", v39);

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  UITextField *otpEditor;

  otpEditor = self->_otpEditor;
  if (otpEditor == a3)
    -[TSTransferOneTimeCodeViewController _hideKeyboard](self, "_hideKeyboard");
  return otpEditor != a3;
}

- (void)_hideKeyboard
{
  id v3;

  if (-[UITextField isFirstResponder](self->_otpEditor, "isFirstResponder"))
  {
    -[TSTransferOneTimeCodeViewController view](self, "view");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endEditing:", 1);

  }
}

- (void)_setupLayoutConstraint
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
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
  void *v25;
  void *v26;
  id v27;

  -[UITextField topAnchor](self->_otpEditor, "topAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSTransferOneTimeCodeViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintGreaterThanOrEqualToAnchor:constant:", v5, 20.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", 1);

  -[UITextField leadingAnchor](self->_otpEditor, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSTransferOneTimeCodeViewController contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutMarginsGuide");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintGreaterThanOrEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  -[UITextField trailingAnchor](self->_otpEditor, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSTransferOneTimeCodeViewController contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutMarginsGuide");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintGreaterThanOrEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  -[UITextField centerXAnchor](self->_otpEditor, "centerXAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSTransferOneTimeCodeViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "centerXAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setActive:", 1);

  if (!self->_usePin)
  {
    -[SSOBLinkTrayButton topAnchor](self->_resendOTPButton, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField bottomAnchor](self->_otpEditor, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, 20.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setActive:", 1);

    -[SSOBLinkTrayButton centerXAnchor](self->_resendOTPButton, "centerXAnchor");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    -[TSTransferOneTimeCodeViewController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "centerXAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setActive:", 1);

  }
}

- (void)updateOtpState:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  int64_t v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v27 = a3;
    v28 = 2080;
    v29 = "-[TSTransferOneTimeCodeViewController updateOtpState:]";
    _os_log_impl(&dword_21B647000, v5, OS_LOG_TYPE_DEFAULT, "updating otpState to %ld @%s", buf, 0x16u);
  }

  if (a3 == 1)
  {
    v8 = !self->_usePin;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
      v11 = CFSTR("INCORRECT_ONE_TIME_PASSCODE");
    else
      v11 = CFSTR("INCORRECT_PIN");
    objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_24DEF4290, CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = !self->_usePin;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13)
      v16 = CFSTR("INCORRECT_ONE_TIME_PASSCODE_MESSAGE");
    else
      v16 = CFSTR("INCORRECT_PIN_MESSAGE");
    objc_msgSend(v14, "localizedStringForKey:value:table:", v16, &stru_24DEF4290, CFSTR("Localizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)buf, self);
    objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v12, v17, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24DEF4290, CFSTR("Localizable"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __54__TSTransferOneTimeCodeViewController_updateOtpState___block_invoke;
    v24[3] = &unk_24DEF2A20;
    objc_copyWeak(&v25, (id *)buf);
    objc_msgSend(v19, "actionWithTitle:style:handler:", v21, 0, v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addAction:", v22);

    -[TSTransferOneTimeCodeViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v18, 1, 0);
    objc_destroyWeak(&v25);

    objc_destroyWeak((id *)buf);
  }
  else if (a3 == 2)
  {
    -[TSTransferOneTimeCodeViewController disableButtonsAndHideSpinnerText](self, "disableButtonsAndHideSpinnerText");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CONTINUE_BUTTON_STATE_INSTALLING"), &stru_24DEF4290, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController _showButtonTraySpinnerWithBusyText:](self, "_showButtonTraySpinnerWithBusyText:", v7);

    return;
  }
  -[OBWelcomeController _hideButtonTraySpinner](self, "_hideButtonTraySpinner");
  -[SSOBLinkTrayButton hideSpinner](self->_resendOTPButton, "hideSpinner");
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __54__TSTransferOneTimeCodeViewController_updateOtpState___block_invoke_2;
  v23[3] = &unk_24DEF29A8;
  v23[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], v23);
}

void __54__TSTransferOneTimeCodeViewController_updateOtpState___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentedViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

uint64_t __54__TSTransferOneTimeCodeViewController_updateOtpState___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_changeOtpTextFieldState:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1232), "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1240), "setEnabled:", objc_msgSend(v2, "length") != 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1264), "setEnabled:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1248), "setEnabled:", 1);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1256), "setEnabled:", 1);
}

- (void)disableButtonsAndHideSpinnerText
{
  _QWORD block[5];

  -[OBWelcomeController _showButtonTraySpinnerWithBusyText:](self, "_showButtonTraySpinnerWithBusyText:", CFSTR(" "));
  -[SSOBLinkTrayButton hideSpinner](self->_resendOTPButton, "hideSpinner");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__TSTransferOneTimeCodeViewController_disableButtonsAndHideSpinnerText__block_invoke;
  block[3] = &unk_24DEF29A8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __71__TSTransferOneTimeCodeViewController_disableButtonsAndHideSpinnerText__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_changeOtpTextFieldState:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1264), "setEnabled:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1248), "setEnabled:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1256), "setEnabled:", 0);
}

- (void)_continueButtonTapped:(id)a3
{
  id WeakRetained;
  id v5;

  -[UITextField text](self->_otpEditor, "text", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[TSTransferOneTimeCodeViewController disableButtonsAndHideSpinnerText](self, "disableButtonsAndHideSpinnerText");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "startTimer:", 1);

  -[CoreTelephonyClient handleUserEnteredOtp:otp:completion:](self->_client, "handleUserEnteredOtp:otp:completion:", self->_sourceIccid, v5, &__block_literal_global_5);
}

void __61__TSTransferOneTimeCodeViewController__continueButtonTapped___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    _TSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __61__TSTransferOneTimeCodeViewController__continueButtonTapped___block_invoke_cold_1();

  }
}

- (void)_cancelButtonTapped:(id)a3
{
  NSObject *v4;
  id WeakRetained;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[TSTransferOneTimeCodeViewController _cancelButtonTapped:]";
    _os_log_impl(&dword_21B647000, v4, OS_LOG_TYPE_DEFAULT, "cancelled otp verification @%s", (uint8_t *)&v6, 0xCu);
  }

  -[TSTransferOneTimeCodeViewController disableButtonsAndHideSpinnerText](self, "disableButtonsAndHideSpinnerText");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "userDidTapCancel");

}

- (void)_resendOTP
{
  NSObject *v3;
  id WeakRetained;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[TSTransferOneTimeCodeViewController _resendOTP]";
    _os_log_impl(&dword_21B647000, v3, OS_LOG_TYPE_DEFAULT, "requested new OTP @%s", (uint8_t *)&v5, 0xCu);
  }

  -[TSTransferOneTimeCodeViewController _changeOtpTextFieldState:](self, "_changeOtpTextFieldState:", 0);
  -[OBBoldTrayButton setEnabled:](self->_continueButton, "setEnabled:", 0);
  -[SSOBLinkTrayButton setEnabled:](self->_resendOTPButton, "setEnabled:", 0);
  -[SSOBLinkTrayButton showSpinner](self->_resendOTPButton, "showSpinner");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "startTimer:", 1);

  -[CoreTelephonyClient renewOneTimePassword:completion:](self->_client, "renewOneTimePassword:completion:", self->_sourceIccid, &__block_literal_global_89);
}

void __49__TSTransferOneTimeCodeViewController__resendOTP__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    _TSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __49__TSTransferOneTimeCodeViewController__resendOTP__block_invoke_cold_1();

  }
}

- (void)_textFieldDidChange
{
  id v3;

  -[UITextField text](self->_otpEditor, "text");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[OBBoldTrayButton setEnabled:](self->_continueButton, "setEnabled:", objc_msgSend(v3, "length") != 0);

}

- (void)_changeOtpTextFieldState:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[UITextField setEnabled:](self->_otpEditor, "setEnabled:");
  if (v3)
  {
    -[UITextField setTextColor:](self->_otpEditor, "setTextColor:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "grayColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[UITextField setTextColor:](self->_otpEditor, "setTextColor:", v5);

  }
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (NSArray)cachedButtons
{
  return (NSArray *)objc_getProperty(self, a2, 1184, 1);
}

- (void)setCachedButtons:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1184);
}

- (SSSpinner)spinner
{
  return (SSSpinner *)objc_getProperty(self, a2, 1192, 1);
}

- (void)setSpinner:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1192);
}

- (UIView)spinnerContainer
{
  return (UIView *)objc_getProperty(self, a2, 1200, 1);
}

- (void)setSpinnerContainer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1200);
}

- (TSSIMSetupFlowDelegate)delegate
{
  return (TSSIMSetupFlowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CoreTelephonyClient)client
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 1216, 1);
}

- (void)setClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1216);
}

- (NSString)sourceIccid
{
  return (NSString *)objc_getProperty(self, a2, 1224, 1);
}

- (void)setSourceIccid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1224);
}

- (UITextField)otpEditor
{
  return (UITextField *)objc_getProperty(self, a2, 1232, 1);
}

- (void)setOtpEditor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1232);
}

- (SSOBBoldTrayButton)continueButton
{
  return (SSOBBoldTrayButton *)objc_getProperty(self, a2, 1240, 1);
}

- (void)setContinueButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1240);
}

- (OBLinkTrayButton)skipButton
{
  return (OBLinkTrayButton *)objc_getProperty(self, a2, 1248, 1);
}

- (void)setSkipButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1248);
}

- (UIBarButtonItem)cancelButton
{
  return (UIBarButtonItem *)objc_getProperty(self, a2, 1256, 1);
}

- (void)setCancelButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1256);
}

- (SSOBLinkTrayButton)resendOTPButton
{
  return (SSOBLinkTrayButton *)objc_getProperty(self, a2, 1264, 1);
}

- (void)setResendOTPButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1264);
}

- (BOOL)usePin
{
  return self->_usePin;
}

- (void)setUsePin:(BOOL)a3
{
  self->_usePin = a3;
}

- (NSString)details
{
  return (NSString *)objc_getProperty(self, a2, 1272, 1);
}

- (void)setDetails:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1272);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_resendOTPButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_skipButton, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_otpEditor, 0);
  objc_storeStrong((id *)&self->_sourceIccid, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spinnerContainer, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_cachedButtons, 0);
}

void __61__TSTransferOneTimeCodeViewController__continueButtonTapped___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]handleUserEnteredOtp failed : %@ @%s", v2, v3, v4, v5, v6);
}

void __49__TSTransferOneTimeCodeViewController__resendOTP__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]renewOneTimePassword failed : %@ @%s", v2, v3, v4, v5, v6);
}

@end
