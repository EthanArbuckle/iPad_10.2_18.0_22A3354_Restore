@implementation KeychainSyncPhoneNumberController

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  UILabel *v11;
  UILabel *footerLabel;
  UILabel *v13;
  void *v14;
  UILabel *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)KeychainSyncPhoneNumberController;
  -[PSListController loadView](&v17, sel_loadView);
  v3 = objc_alloc(MEMORY[0x1E0CEA380]);
  PS_LocalizedStringForKeychainSync(CFSTR("NEXT"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v4, 2, self, sel_nextPressed);

  -[KeychainSyncPhoneNumberController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRightBarButtonItem:", v5);

  +[PSKeychainSyncManager sharedManager](PSKeychainSyncManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isRunningInBuddy"))
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if (!v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0CEA700]);
    v11 = (UILabel *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    footerLabel = self->_footerLabel;
    self->_footerLabel = v11;

    v13 = self->_footerLabel;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 14.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v13, "setFont:", v14);

    -[UILabel setNumberOfLines:](self->_footerLabel, "setNumberOfLines:", 0);
    v15 = self->_footerLabel;
    PS_LocalizedStringForKeychainSync(CFSTR("PHONE_NUMBER_DESCRIPTION_NO_NEWLINES"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v15, "setText:", v16);

    -[UILabel setTextAlignment:](self->_footerLabel, "setTextAlignment:", 1);
    -[KeychainSyncPhoneNumberController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_footerLabel);
LABEL_4:

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  -[KeychainSyncPhoneNumberController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[KeychainSyncPhoneSettingsFragment phoneNumber](self->_phoneSettingsFragment, "phoneNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    -[KeychainSyncPhoneSettingsFragment countryInfo](self->_phoneSettingsFragment, "countryInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", v8 != 0);

  }
  else
  {
    objc_msgSend(v6, "setEnabled:", 0);
  }

  v9.receiver = self;
  v9.super_class = (Class)KeychainSyncPhoneNumberController;
  -[PSListController viewWillAppear:](&v9, sel_viewWillAppear_, v3);
}

- (id)specifiers
{
  void *v3;
  NSArray *specifiers;
  KeychainSyncPhoneSettingsFragment *phoneSettingsFragment;
  KeychainSyncPhoneSettingsFragment *v6;
  KeychainSyncPhoneSettingsFragment *v7;
  KeychainSyncPhoneSettingsFragment *v8;
  void *v9;
  NSArray *v10;
  NSArray *v11;

  PS_LocalizedStringForKeychainSync(CFSTR("PHONE_NUMBER"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSKeychainSyncViewController setTitle:](self, "setTitle:", v3);

  specifiers = self->super.super._specifiers;
  if (!specifiers)
  {
    phoneSettingsFragment = self->_phoneSettingsFragment;
    if (!phoneSettingsFragment)
    {
      v6 = -[KeychainSyncPhoneSettingsFragment initWithListController:]([KeychainSyncPhoneSettingsFragment alloc], "initWithListController:", self);
      v7 = self->_phoneSettingsFragment;
      self->_phoneSettingsFragment = v6;

      v8 = self->_phoneSettingsFragment;
      PS_LocalizedStringForKeychainSync(CFSTR("PHONE_NUMBER"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[KeychainSyncPhoneSettingsFragment setTitle:](v8, "setTitle:", v9);

      -[KeychainSyncPhoneSettingsFragment setDelegate:](self->_phoneSettingsFragment, "setDelegate:", self);
      phoneSettingsFragment = self->_phoneSettingsFragment;
    }
    -[KeychainSyncPhoneSettingsFragment specifiers](phoneSettingsFragment, "specifiers");
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v11 = self->super.super._specifiers;
    self->super.super._specifiers = v10;

    specifiers = self->super.super._specifiers;
  }
  return specifiers;
}

- (void)reloadSpecifiers
{
  objc_super v3;

  -[KeychainSyncPhoneSettingsFragment reloadSpecifiers](self->_phoneSettingsFragment, "reloadSpecifiers");
  v3.receiver = self;
  v3.super_class = (Class)KeychainSyncPhoneNumberController;
  -[PSListController reloadSpecifiers](&v3, sel_reloadSpecifiers);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)KeychainSyncPhoneNumberController;
  -[PSListController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  if (-[KeychainSyncPhoneNumberController isMovingToParentViewController](self, "isMovingToParentViewController"))
  {
    +[PSKeychainSyncManager sharedManager](PSKeychainSyncManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isRunningInBuddy") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "userInterfaceIdiom");

      if (v6 != 1)
        return;
    }
    else
    {

    }
    -[KeychainSyncPhoneSettingsFragment phoneNumberCell](self->_phoneSettingsFragment, "phoneNumberCell");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "becomeFirstResponder");

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[KeychainSyncPhoneSettingsFragment resignFirstResponder](self->_phoneSettingsFragment, "resignFirstResponder");
  v5.receiver = self;
  v5.super_class = (Class)KeychainSyncPhoneNumberController;
  -[PSListController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  UILabel *footerLabel;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  v18.receiver = self;
  v18.super_class = (Class)KeychainSyncPhoneNumberController;
  -[PSListController viewDidLayoutSubviews](&v18, sel_viewDidLayoutSubviews);
  if (self->_footerLabel)
  {
    -[KeychainSyncPhoneNumberController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    footerLabel = self->_footerLabel;
    v19.origin.x = v5;
    v19.origin.y = v7;
    v19.size.width = v9;
    v19.size.height = v11;
    v20 = CGRectInset(v19, 15.0, 0.0);
    -[UILabel sizeThatFits:](footerLabel, "sizeThatFits:", v20.size.width, v20.size.height);
    v14 = v13;
    v16 = v15;
    *(float *)&v13 = (v9 - v13) * 0.5;
    v17 = floorf(*(float *)&v13);
    v21.origin.x = v5;
    v21.origin.y = v7;
    v21.size.width = v9;
    v21.size.height = v11;
    -[UILabel setFrame:](self->_footerLabel, "setFrame:", v17, CGRectGetMaxY(v21) - v16 + -25.0, v14, v16);
  }
}

- (void)controllerDone
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("phoneNumber");
  -[KeychainSyncPhoneSettingsFragment unformattedPhoneNumber](self->_phoneSettingsFragment, "unformattedPhoneNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("countryInfo");
  v8[0] = v3;
  -[KeychainSyncPhoneSettingsFragment countryInfo](self->_phoneSettingsFragment, "countryInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSKeychainSyncViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keychainSyncController:didFinishWithResult:error:", self, v5, 0);

}

- (void)nextPressed
{
  -[KeychainSyncPhoneSettingsFragment resignFirstResponder](self->_phoneSettingsFragment, "resignFirstResponder");
  -[KeychainSyncPhoneNumberController controllerDone](self, "controllerDone");
}

- (void)phoneSettingsFragment:(id)a3 didChangePhoneNumber:(id)a4 countryInfo:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  id v12;

  v7 = a4;
  -[KeychainSyncPhoneNumberController navigationItem](self, "navigationItem");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rightBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "length");

  if (a5)
    v10 = v9 == 0;
  else
    v10 = 1;
  v11 = !v10;
  objc_msgSend(v8, "setEnabled:", v11);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerLabel, 0);
  objc_storeStrong((id *)&self->_phoneSettingsFragment, 0);
}

@end
