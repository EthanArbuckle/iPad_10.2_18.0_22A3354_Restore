@implementation TSCellularPlanConfirmationCodeViewController

- (id)initAsMidOperationWithCarrierName:(id)a3
{
  id v5;
  void *v6;
  TSCellularPlanConfirmationCodeViewController *v7;
  objc_super v9;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)TSCellularPlanConfirmationCodeViewController;
  v7 = -[TSCellularPlanConfirmationCodeViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, CFSTR("TSCellularPlanConfirmationCodeView"), v6);

  if (v7)
  {
    -[TSCellularPlanConfirmationCodeViewController setModalInPresentation:](v7, "setModalInPresentation:", 1);
    objc_storeStrong((id *)&v7->_carrierName, a3);
    v7->_isMidOperation = 1;
  }

  return v7;
}

- (TSCellularPlanConfirmationCodeViewController)initWithCardData:(id)a3
{
  id v5;
  void *v6;
  TSCellularPlanConfirmationCodeViewController *v7;
  objc_super v9;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)TSCellularPlanConfirmationCodeViewController;
  v7 = -[TSCellularPlanConfirmationCodeViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, CFSTR("TSCellularPlanConfirmationCodeView"), v6);

  if (v7)
  {
    -[TSCellularPlanConfirmationCodeViewController setModalInPresentation:](v7, "setModalInPresentation:", 1);
    objc_storeStrong((id *)&v7->_fauxCardData, a3);
    v7->_isMidOperation = 0;
  }

  return v7;
}

- (void)viewDidLoad
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
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  UIBarButtonItem *v25;
  UIBarButtonItem *nextButton;
  void *v27;
  UIBarButtonItem *v28;
  UIBarButtonItem *cancelButton;
  void *v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)TSCellularPlanConfirmationCodeViewController;
  -[SSUIViewController viewDidLoad](&v31, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanConfirmationCodeViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanConfirmationCodeViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v5);

  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE238]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(v8, "fontDescriptorWithSymbolicTraits:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fontWithDescriptor:size:", v10, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_confirmationCodeTitleLabel);
  objc_msgSend(WeakRetained, "setFont:", v11);

  if (-[NSString length](self->_carrierName, "length"))
  {
    v13 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("CTCELLULARPLAN_CONFIRMATION_CODE_MESSAGE_%@"), &stru_24DEF4290, CFSTR("Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", v15, self->_carrierName);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_loadWeakRetained((id *)&self->_confirmationCodeMessageLabel);
    objc_msgSend(v17, "setText:", v16);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("CTCELLULARPLAN_CONFIRMATION_CODE_MESSAGE_NO_CARRIER"), &stru_24DEF4290, CFSTR("Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_loadWeakRetained((id *)&self->_confirmationCodeMessageLabel);
    objc_msgSend(v16, "setText:", v15);
  }

  v18 = objc_loadWeakRetained((id *)&self->_codeTextField);
  objc_msgSend(v18, "setDelegate:", self);

  v19 = objc_loadWeakRetained((id *)&self->_codeTextField);
  objc_msgSend(v19, "setKeyboardType:", 2);

  v20 = objc_loadWeakRetained((id *)&self->_codeTextField);
  objc_msgSend(v20, "setReturnKeyType:", 4);

  v21 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v21, "setDefaultNavigationItems:", self);

  v22 = objc_alloc(MEMORY[0x24BEBD410]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("NPHCELLULAR_CARD_INFO_NEXT"), &stru_24DEF4290, CFSTR("Localizable"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (UIBarButtonItem *)objc_msgSend(v22, "initWithTitle:style:target:action:", v24, 2, self, sel_confirm_);
  nextButton = self->_nextButton;
  self->_nextButton = v25;

  -[TSCellularPlanConfirmationCodeViewController navigationItem](self, "navigationItem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setRightBarButtonItem:", self->_nextButton);

  -[UIBarButtonItem setEnabled:](self->_nextButton, "setEnabled:", 0);
  v28 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_userDidTapCancel);
  cancelButton = self->_cancelButton;
  self->_cancelButton = v28;

  -[TSCellularPlanConfirmationCodeViewController navigationItem](self, "navigationItem");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setLeftBarButtonItem:", self->_cancelButton);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSCellularPlanConfirmationCodeViewController;
  -[TSCellularPlanConfirmationCodeViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  TSCellularPlanConfirmationCodeViewController *v3;
  id WeakRetained;
  id v5;
  objc_super v6;

  v3 = self;
  v6.receiver = self;
  v6.super_class = (Class)TSCellularPlanConfirmationCodeViewController;
  -[TSCellularPlanConfirmationCodeViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  v3 = (TSCellularPlanConfirmationCodeViewController *)((char *)v3 + 1024);
  WeakRetained = objc_loadWeakRetained((id *)&v3->super.super.super.super.isa);
  objc_msgSend(WeakRetained, "receivedResponse");

  v5 = objc_loadWeakRetained((id *)&v3->super.super.super.super.isa);
  objc_msgSend(v5, "startTimer:", 1);

}

- (void)userDidTapCancel
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
  id WeakRetained;
  _QWORD v19[5];

  if (+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
  {
    v3 = (void *)MEMORY[0x24BEBD3B0];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SKIP_SETUP_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SKIP_SETUP_MESSAGE"), &stru_24DEF4290, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SKIP"), &stru_24DEF4290, CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __64__TSCellularPlanConfirmationCodeViewController_userDidTapCancel__block_invoke;
    v19[3] = &unk_24DEF2F40;
    v19[4] = self;
    objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 1, v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v12);

    v13 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24DEF4290, CFSTR("Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 0, &__block_literal_global_14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v16);

    -[TSCellularPlanConfirmationCodeViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
  }
  else
  {
    +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "provideUserResponse:confirmationCode:", 2, &stru_24DEF4290);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "userDidTapCancel");

  }
}

void __64__TSCellularPlanConfirmationCodeViewController_userDidTapCancel__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "provideUserResponse:confirmationCode:", 2, &stru_24DEF4290);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userDidTapCancel");

}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return 1;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  void *v11;

  length = a4.length;
  location = a4.location;
  v9 = a5;
  objc_msgSend(a3, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", location, length, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIBarButtonItem setEnabled:](self->_nextButton, "setEnabled:", objc_msgSend(v11, "length") != 0);
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  -[TSCellularPlanConfirmationCodeViewController confirm:](self, "confirm:", 0);
  return 1;
}

- (void)confirm:(id)a3
{
  UITextField **p_codeTextField;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  id v10;
  char *v11;
  id v12;
  id v13;
  NSString *v14;
  NSString *confirmationCode;
  TSSIMSetupFlowDelegate **p_delegate;
  id v17;
  NSString *fauxCardData;
  NSString *v19;
  id v20;
  int v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  p_codeTextField = &self->_codeTextField;
  WeakRetained = objc_loadWeakRetained((id *)&self->_codeTextField);
  objc_msgSend(WeakRetained, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  _TSLogDomain();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      v10 = objc_loadWeakRetained((id *)p_codeTextField);
      objc_msgSend(v10, "text");
      v11 = (char *)objc_claimAutoreleasedReturnValue();
      v21 = 138412546;
      v22 = v11;
      v23 = 2080;
      v24 = "-[TSCellularPlanConfirmationCodeViewController confirm:]";
      _os_log_impl(&dword_21B647000, v8, OS_LOG_TYPE_DEFAULT, "confirmation code:%@ @%s", (uint8_t *)&v21, 0x16u);

    }
    v12 = objc_loadWeakRetained((id *)p_codeTextField);
    objc_msgSend(v12, "resignFirstResponder");

    v13 = objc_loadWeakRetained((id *)p_codeTextField);
    objc_msgSend(v13, "text");
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    confirmationCode = self->_confirmationCode;
    self->_confirmationCode = v14;

    if (self->_isMidOperation)
    {
      -[TSCellularPlanConfirmationCodeViewController delegate](self, "delegate");
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject viewControllerDidComplete:](v8, "viewControllerDidComplete:", self);
    }
    else
    {
      p_delegate = &self->_delegate;
      v17 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v17, "waitForResponse:", self);

      +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
      v8 = objc_claimAutoreleasedReturnValue();
      fauxCardData = self->_fauxCardData;
      v19 = self->_confirmationCode;
      v20 = objc_loadWeakRetained((id *)p_delegate);
      -[NSObject addNewPlanWithCardData:confirmationCode:userConsentResponse:completion:](v8, "addNewPlanWithCardData:confirmationCode:userConsentResponse:completion:", fauxCardData, v19, objc_msgSend(v20, "signupUserConsentResponse"), &__block_literal_global_52);

    }
  }
  else if (v9)
  {
    v21 = 136315138;
    v22 = "-[TSCellularPlanConfirmationCodeViewController confirm:]";
    _os_log_impl(&dword_21B647000, v8, OS_LOG_TYPE_DEFAULT, "No Confirmation Code @%s", (uint8_t *)&v21, 0xCu);
  }

}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (TSSIMSetupFlowDelegate)delegate
{
  return (TSSIMSetupFlowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)confirmationCode
{
  return self->_confirmationCode;
}

- (UILabel)confirmationCodeTitleLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_confirmationCodeTitleLabel);
}

- (void)setConfirmationCodeTitleLabel:(id)a3
{
  objc_storeWeak((id *)&self->_confirmationCodeTitleLabel, a3);
}

- (UILabel)confirmationCodeMessageLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_confirmationCodeMessageLabel);
}

- (void)setConfirmationCodeMessageLabel:(id)a3
{
  objc_storeWeak((id *)&self->_confirmationCodeMessageLabel, a3);
}

- (UITextField)codeTextField
{
  return (UITextField *)objc_loadWeakRetained((id *)&self->_codeTextField);
}

- (void)setCodeTextField:(id)a3
{
  objc_storeWeak((id *)&self->_codeTextField, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_codeTextField);
  objc_destroyWeak((id *)&self->_confirmationCodeMessageLabel);
  objc_destroyWeak((id *)&self->_confirmationCodeTitleLabel);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_confirmationCode, 0);
  objc_storeStrong((id *)&self->_fauxCardData, 0);
}

@end
