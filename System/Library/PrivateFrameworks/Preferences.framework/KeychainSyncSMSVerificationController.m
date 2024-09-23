@implementation KeychainSyncSMSVerificationController

- (KeychainSyncSMSVerificationController)init
{
  KeychainSyncSMSVerificationController *v2;
  KeychainSyncSMSVerificationController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)KeychainSyncSMSVerificationController;
  v2 = -[PSKeychainSyncTextEntryController init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PSKeychainSyncTextEntryController setTextEntryType:](v2, "setTextEntryType:", 1);
    -[PSKeychainSyncTextEntryController setSecureTextEntry:](v3, "setSecureTextEntry:", 0);
    -[PSKeychainSyncTextEntryController setConvertsNumeralsToASCII:](v3, "setConvertsNumeralsToASCII:", 1);
  }
  return v3;
}

- (id)specifiers
{
  void *v3;
  void *v4;
  NSString *phoneNumber;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  PS_LocalizedStringForKeychainSync(CFSTR("VERIFICATION_CODE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSKeychainSyncViewController setTitle:](self, "setTitle:", v3);

  v15.receiver = self;
  v15.super_class = (Class)KeychainSyncSMSVerificationController;
  -[PSKeychainSyncTextEntryController specifiers](&v15, sel_specifiers);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  phoneNumber = self->_phoneNumber;
  -[KeychainSyncSMSVerificationController countryCode](self, "countryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[KeychainSyncCountryInfo countryInfoForCountryCode:dialingPrefix:](KeychainSyncCountryInfo, "countryInfoForCountryCode:dialingPrefix:", v6, self->_dialingPrefix);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSKeychainSyncPhoneNumber phoneNumberWithDigits:countryInfo:](PSKeychainSyncPhoneNumber, "phoneNumberWithDigits:countryInfo:", phoneNumber, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "formattedAndObfuscatedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSKeychainSyncViewController headerView](self, "headerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3940];
  PS_LocalizedStringForKeychainSync(CFSTR("VERIFICATION_CODE_SENT_TO"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDetailText:", v13);

  return v4;
}

- (void)loadView
{
  UIButton *v3;
  UIButton *footerButton;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)KeychainSyncSMSVerificationController;
  -[PSKeychainSyncTextEntryController loadView](&v18, sel_loadView);
  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
  v3 = (UIButton *)objc_claimAutoreleasedReturnValue();
  footerButton = self->_footerButton;
  self->_footerButton = v3;

  -[UIButton addTarget:action:forControlEvents:](self->_footerButton, "addTarget:action:forControlEvents:", self, sel_showSupportVerification, 64);
  -[PSListController table](self, "table");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", self->_footerButton);

  -[PSKeychainSyncViewController headerView](self, "headerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_referenceBounds");
  objc_msgSend(v6, "setUsesCompactLayout:", v8 == 480.0);

  v9 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CEA478], "_systemInteractionTintColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0CEA0A0];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 14.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, v11, v12, *MEMORY[0x1E0CEA098], 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  PS_LocalizedStringForKeychainSync(CFSTR("DONT_HAVE_PHONE"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v14, v13);
  -[UIButton setAttributedTitle:forState:](self->_footerButton, "setAttributedTitle:forState:", v15, 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v16, v11);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v14, v13);
  -[UIButton setAttributedTitle:forState:](self->_footerButton, "setAttributedTitle:forState:", v17, 1);
  -[UIButton sizeToFit](self->_footerButton, "sizeToFit");

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  float v21;
  CGFloat v22;
  CGFloat v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double MaxY;
  void *v30;
  objc_super v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v31.receiver = self;
  v31.super_class = (Class)KeychainSyncSMSVerificationController;
  -[PSListController viewDidLayoutSubviews](&v31, sel_viewDidLayoutSubviews);
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_referenceBounds");
  if (v4 == 480.0)
    v5 = -21.0;
  else
    v5 = 5.0;

  -[PSListController table](self, "table");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[UIButton frame](self->_footerButton, "frame");
  v18 = v17;
  v20 = v19;
  v21 = (v14 - v17) * 0.5;
  v22 = floorf(v21);
  v32.origin.x = v10;
  v32.origin.y = v12;
  v32.size.width = v14;
  v32.size.height = v16;
  v23 = v5 + CGRectGetMaxY(v32);
  -[UIButton setFrame:](self->_footerButton, "setFrame:", v22, v23, v18, v20);
  -[PSListController table](self, "table");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "contentSize");
  v26 = v25;
  v28 = v27;

  v33.origin.x = v22;
  v33.origin.y = v23;
  v33.size.width = v18;
  v33.size.height = v20;
  MaxY = CGRectGetMaxY(v33);
  v34.origin.x = v22;
  v34.origin.y = v23;
  v34.size.width = v18;
  v34.size.height = v20;
  if (v28 < CGRectGetMaxY(v34))
  {
    -[PSListController table](self, "table");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setContentSize:", v26, v5 + MaxY);

  }
}

- (void)showSupportVerification
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];

  +[PSKeychainSyncManager sharedManager](PSKeychainSyncManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isRunningInBuddy"))
  {
    PS_LocalizedStringForKeychainSync(CFSTR("SET_UP_LATER"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  v5 = (void *)MEMORY[0x1E0CEA2E8];
  PS_LocalizedStringForKeychainSync(CFSTR("VERIFICATION_REQUIRED"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PS_LocalizedStringForKeychainSync(CFSTR("CAN_VERIFY_WITH_APPLESUPPORT"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CEA2E0];
  PS_LocalizedStringForKeychainSync(CFSTR("VERIFY_WITH_APPLESUPPORT"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __64__KeychainSyncSMSVerificationController_showSupportVerification__block_invoke;
  v18[3] = &unk_1E4A65BF8;
  v18[4] = self;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 0, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v12);

  if (v4)
  {
    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = __64__KeychainSyncSMSVerificationController_showSupportVerification__block_invoke_2;
    v17[3] = &unk_1E4A65BF8;
    v17[4] = self;
    objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", v4, 0, v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v13);

  }
  v14 = (void *)MEMORY[0x1E0CEA2E0];
  PS_LocalizedStringForKeychainSync(CFSTR("CANCEL"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v16);

  -[KeychainSyncSMSVerificationController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
}

void __64__KeychainSyncSMSVerificationController_showSupportVerification__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "keychainSyncManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "showContactAppleSupportPane");

}

void __64__KeychainSyncSMSVerificationController_showSupportVerification__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Preferences.KeychainSync"), 2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keychainSyncController:didFinishWithResult:error:", v2, 0, v3);

}

- (void)dismissAlerts
{
  -[KeychainSyncSMSVerificationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumber, a3);
}

- (NSString)dialingPrefix
{
  return self->_dialingPrefix;
}

- (void)setDialingPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_dialingPrefix, a3);
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (PSKeychainSyncManager)keychainSyncManager
{
  return (PSKeychainSyncManager *)objc_loadWeakRetained((id *)&self->_keychainSyncManager);
}

- (void)setKeychainSyncManager:(id)a3
{
  objc_storeWeak((id *)&self->_keychainSyncManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_keychainSyncManager);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_dialingPrefix, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_footerButton, 0);
}

@end
