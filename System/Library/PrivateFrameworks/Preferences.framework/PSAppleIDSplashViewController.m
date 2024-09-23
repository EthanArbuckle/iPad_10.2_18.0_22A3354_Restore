@implementation PSAppleIDSplashViewController

- (id)serviceName
{
  return 0;
}

- (id)serviceDescription
{
  return 0;
}

- (id)serviceIcon
{
  return 0;
}

- (id)serviceFooter
{
  return 0;
}

- (id)_silhouetteMonogram
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x1E0CEA638];
  PSPreferencesFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("PaddedSilhouetteMonogram"), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageWithTintColor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)dealloc
{
  void *v3;
  void *powerAssertion;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[RemoteUIController setDelegate:](self->_remoteUIController, "setDelegate:", 0);
  powerAssertion = self->_powerAssertion;
  if (powerAssertion)
  {
    CFRelease(powerAssertion);
    self->_powerAssertion = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)PSAppleIDSplashViewController;
  -[PSListController dealloc](&v5, sel_dealloc);
}

- (id)specifiers
{
  NSArray *specifiers;
  NSArray *v4;
  void *v5;
  PSSpecifier *v6;
  PSSpecifier *userSpecifier;
  PSSpecifier *v8;
  PSSpecifier *passwordSpecifier;
  void *v10;
  void *v11;
  NSArray *v12;

  specifiers = self->super._specifiers;
  if (!specifiers)
  {
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[PSAppleIDSplashViewController _specifierForGroupWithiForgotLink](self, "_specifierForGroupWithiForgotLink");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v4, "addObject:", v5);

    -[PSAppleIDSplashViewController _specifierForLoginUserForm](self, "_specifierForLoginUserForm");
    v6 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    userSpecifier = self->_userSpecifier;
    self->_userSpecifier = v6;

    -[NSArray addObject:](v4, "addObject:", self->_userSpecifier);
    -[PSAppleIDSplashViewController _specifierForLoginPasswordForm](self, "_specifierForLoginPasswordForm");
    v8 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    passwordSpecifier = self->_passwordSpecifier;
    self->_passwordSpecifier = v8;

    if (self->_passwordHandler)
      -[NSArray addObject:](v4, "addObject:", self->_passwordSpecifier);
    if (!self->_isPresentedModally)
    {
      -[PSAppleIDSplashViewController _specifiersForSignInButton](self, "_specifiersForSignInButton");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObjectsFromArray:](v4, "addObjectsFromArray:", v10);

    }
    -[PSAppleIDSplashViewController _specifiersForCreateNewAccount](self, "_specifiersForCreateNewAccount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v4, "addObjectsFromArray:", v11);

    v12 = self->super._specifiers;
    self->super._specifiers = v4;

    specifiers = self->super._specifiers;
  }
  return specifiers;
}

- (id)_specifierForLoginUserForm
{
  void *v3;
  void *v4;
  void *v5;

  +[PSTextFieldSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSTextFieldSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_1E4A69238, self, sel__setUsername_withSpecifier_, sel__usernameForSpecifier_, 0, 8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setKeyboardType:autoCaps:autoCorrection:", 7, 0, 1);
  PS_LocalizedStringForAppleID(CFSTR("EXAMPLE_APPLE_ID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPlaceholder:", v4);

  objc_msgSend(v3, "setProperty:forKey:", CFSTR("PSSpecifierUsername"), CFSTR("key"));
  -[PSAppleIDSplashViewController _silhouetteMonogram](self, "_silhouetteMonogram");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v5, CFSTR("iconImage"));

  objc_msgSend(v3, "setProperty:forKey:", *MEMORY[0x1E0CEBD10], CFSTR("textContentType"));
  objc_msgSend(v3, "setIdentifier:", CFSTR("LOGIN_USER"));
  return v3;
}

- (id)_specifierForLoginPasswordForm
{
  void *v2;
  void *v3;

  +[PSTextFieldSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSTextFieldSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_1E4A69238, self, sel__setPassword_withSpecifier_, sel__passwordForSpecifier_, 0, 8, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeyboardType:autoCaps:autoCorrection:", 1, 0, 1);
  objc_msgSend(v2, "setProperty:forKey:", CFSTR("PSSpecifierPassword"), CFSTR("key"));
  objc_msgSend(v2, "setCellType:", 12);
  PS_LocalizedStringForAppleID(CFSTR("PASSWORD_FIELD_PLACEHOLDER_REQUIRED"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPlaceholder:", v3);

  objc_msgSend(v2, "setIdentifier:", CFSTR("LOGIN_PASSWORD"));
  return v2;
}

- (void)_reloadPasswordSpecifier
{
  _QWORD block[5];

  if (self->_passwordHandler)
  {
    if (!-[PSListController containsSpecifier:](self, "containsSpecifier:", self->_passwordSpecifier))
    {
      -[PSListController insertSpecifier:afterSpecifier:animated:](self, "insertSpecifier:afterSpecifier:animated:", self->_passwordSpecifier, self->_userSpecifier, 1);
      -[PSSpecifier setProperty:forKey:](self->_signInButtonSpecifier, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("enabled"));
      -[PSListController reloadSpecifier:](self, "reloadSpecifier:", self->_signInButtonSpecifier);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __57__PSAppleIDSplashViewController__reloadPasswordSpecifier__block_invoke;
      block[3] = &unk_1E4A654F0;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      return;
    }
    if (self->_passwordHandler)
      return;
  }
  if (-[PSListController containsSpecifier:](self, "containsSpecifier:", self->_passwordSpecifier))
  {
    -[PSListController removeSpecifier:animated:](self, "removeSpecifier:animated:", self->_passwordSpecifier, 1);
    -[PSSpecifier setProperty:forKey:](self->_signInButtonSpecifier, "setProperty:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("enabled"));
    -[PSListController reloadSpecifier:](self, "reloadSpecifier:", self->_signInButtonSpecifier);
  }
}

void __57__PSAppleIDSplashViewController__reloadPasswordSpecifier__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1448), "propertyForKey:", CFSTR("cellObject"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "becomeFirstResponder");

}

- (id)_specifiersForSignInButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PSSpecifier *v7;
  PSSpecifier *signInButtonSpecifier;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSSpecifier emptyGroupSpecifier](PSSpecifier, "emptyGroupSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSAppleIDSplashViewController serviceFooter](self, "serviceFooter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("footerText"));

  objc_msgSend(v3, "addObject:", v4);
  PS_LocalizedStringForAppleID(CFSTR("SIGN_IN_BUTTON"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, 0, 0, 13, 0);
  v7 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  signInButtonSpecifier = self->_signInButtonSpecifier;
  self->_signInButtonSpecifier = v7;

  -[PSSpecifier setProperty:forKey:](self->_signInButtonSpecifier, "setProperty:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("enabled"));
  -[PSSpecifier setButtonAction:](self->_signInButtonSpecifier, "setButtonAction:", sel__signInButtonWasTapped_);
  objc_msgSend(v3, "addObject:", self->_signInButtonSpecifier);

  return v3;
}

- (id)_specifiersForCreateNewAccount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PSSpecifier *v10;
  PSSpecifier *createNewAccountGroupSpecifier;
  PSSpecifier *v12;
  objc_class *v13;
  void *v14;
  PSSpecifier *v15;
  void *v16;
  PSSpecifier *v17;
  void *v18;
  void *v19;
  PSSpecifier *v20;
  PSSpecifier *createNewAccountButtonSpecifier;
  PSSpecifier *v22;
  PSSpecifier *v23;
  PSSpecifier *v24;
  void *v25;
  void *v26;
  PSSpecifier *v27;
  PSSpecifier *v28;
  PSSpecifier *v29;
  void *v30;
  void *v31;
  PSSpecifier *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  PSSpecifier *v41;
  PSSpecifier *v42;
  PSSpecifier *v43;
  objc_class *v44;
  void *v45;
  PSSpecifier *v46;
  void *v47;
  PSSpecifier *v48;
  void *v49;
  PSSpecifier *v50;
  void *v51;
  void *v52;
  void *v53;
  PSSpecifier *v54;
  PSSpecifier *v55;
  void *v57;
  _QWORD v58[5];
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  NSRange v63;
  NSRange v64;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aa_primaryAppleAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(MEMORY[0x1E0CEA2F8], "isRunningInStoreDemoMode") & 1) != 0
    || -[PSAppleIDSplashViewController _runningInMail](self, "_runningInMail"))
  {
    if ((objc_msgSend(MEMORY[0x1E0CEA2F8], "isRunningInStoreDemoMode") & 1) == 0
      && -[PSAppleIDSplashViewController _runningInMail](self, "_runningInMail")
      && objc_msgSend(v4, "aa_needsEmailConfiguration")
      && _os_feature_enabled_impl())
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      PS_RebrandedKeyForAppleID(CFSTR("CREATE_ICLOUD_MAIL_ACCOUNT_EXPLANATION_FOOTER"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PS_LocalizedStringForAppleID(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      PS_LocalizedStringForAppleID(CFSTR("CREATE_ICLOUD_MAIL_ACCOUNT_FOOTER_LEARN_MORE_BUTTON"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[PSSpecifier groupSpecifierWithID:](PSSpecifier, "groupSpecifierWithID:", CFSTR("CREATE_MAIL_ACCOUNT_GROUP"));
      v10 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
      createNewAccountGroupSpecifier = self->_createNewAccountGroupSpecifier;
      self->_createNewAccountGroupSpecifier = v10;

      v12 = self->_createNewAccountGroupSpecifier;
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifier setProperty:forKey:](v12, "setProperty:forKey:", v14, CFSTR("footerCellClass"));

      -[PSSpecifier setProperty:forKey:](self->_createNewAccountGroupSpecifier, "setProperty:forKey:", v9, CFSTR("footerText"));
      v15 = self->_createNewAccountGroupSpecifier;
      v63.location = objc_msgSend(v9, "rangeOfString:", v8);
      NSStringFromRange(v63);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifier setProperty:forKey:](v15, "setProperty:forKey:", v16, CFSTR("footerHyperlinkRange"));

      v17 = self->_createNewAccountGroupSpecifier;
      PS_LocalizedStringForAppleID(CFSTR("CREATE_ICLOUD_MAIL_ACCOUNT_FOOTER_LEARN_MORE_KB_LINK"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifier setProperty:forKey:](v17, "setProperty:forKey:", v18, CFSTR("headerFooterHyperlinkButtonURL"));

      objc_msgSend(v5, "addObject:", self->_createNewAccountGroupSpecifier);
      PS_LocalizedStringForAppleID(CFSTR("CREATE_ICLOUD_MAIL_ACCOUNT_BUTTON"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v19, self, 0, 0, 0, 13, 0);
      v20 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
      createNewAccountButtonSpecifier = self->_createNewAccountButtonSpecifier;
      self->_createNewAccountButtonSpecifier = v20;

      -[PSSpecifier setButtonAction:](self->_createNewAccountButtonSpecifier, "setButtonAction:", sel__createICloudMailButtonWasTapped_);
      objc_msgSend(v5, "addObject:", self->_createNewAccountButtonSpecifier);

    }
    else if ((objc_msgSend(MEMORY[0x1E0CEA2F8], "isRunningInStoreDemoMode") & 1) != 0
           || !-[PSAppleIDSplashViewController _runningInMail](self, "_runningInMail")
           || (objc_msgSend(v4, "aa_needsEmailConfiguration") & 1) != 0
           || (objc_msgSend(v4, "isEnabledForDataclass:", *MEMORY[0x1E0C8EEB0]) & 1) != 0
           || !_os_feature_enabled_impl())
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[PSSpecifier groupSpecifierWithID:](PSSpecifier, "groupSpecifierWithID:", CFSTR("ENABLE_MAIL_ACCOUNT_GROUP"));
      v22 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
      v23 = self->_createNewAccountGroupSpecifier;
      self->_createNewAccountGroupSpecifier = v22;

      v24 = self->_createNewAccountGroupSpecifier;
      PS_LocalizedStringForAppleID(CFSTR("ENABLE_ICLOUD_MAIL_ACCOUNT_FOOTER"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifier setProperty:forKey:](v24, "setProperty:forKey:", v25, CFSTR("footerText"));

      objc_msgSend(v5, "addObject:", self->_createNewAccountGroupSpecifier);
      PS_LocalizedStringForAppleID(CFSTR("ENABLE_ICLOUD_MAIL_ACCOUNT_BUTTON"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v26, self, 0, 0, objc_opt_class(), 13, 0);
      v27 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
      v28 = self->_createNewAccountButtonSpecifier;
      self->_createNewAccountButtonSpecifier = v27;

      -[PSSpecifier setProperty:forKey:](self->_createNewAccountButtonSpecifier, "setProperty:forKey:", objc_opt_class(), CFSTR("cellClass"));
      v29 = self->_createNewAccountButtonSpecifier;
      objc_msgSend(v4, "aa_childMailAccount");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "accountPropertyForKey:", CFSTR("defaultAddress"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifier setProperty:forKey:](v29, "setProperty:forKey:", v31, CFSTR("cellSubtitleText"));

      v32 = self->_createNewAccountButtonSpecifier;
      objc_msgSend(MEMORY[0x1E0CEA478], "grayColor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifier setProperty:forKey:](v32, "setProperty:forKey:", v33, CFSTR("cellSubtitleColor"));

      -[PSSpecifier setButtonAction:](self->_createNewAccountButtonSpecifier, "setButtonAction:", sel__enableICloudMailButtonWasTapped_);
      objc_msgSend(v5, "addObject:", self->_createNewAccountButtonSpecifier);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0;
    v60 = &v59;
    v61 = 0x2050000000;
    v34 = (void *)getOBBundleClass_softClass;
    v62 = getOBBundleClass_softClass;
    if (!getOBBundleClass_softClass)
    {
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __getOBBundleClass_block_invoke;
      v58[3] = &unk_1E4A65650;
      v58[4] = &v59;
      __getOBBundleClass_block_invoke((uint64_t)v58);
      v34 = (void *)v60[3];
    }
    v35 = objc_retainAutorelease(v34);
    _Block_object_dispose(&v59, 8);
    getOBPrivacyAppleIDIdentifier();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "bundleWithIdentifier:", v36);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v57, "privacyFlow");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "localizedButtonCaption");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "localizedButtonTitle");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSSpecifier groupSpecifierWithID:](PSSpecifier, "groupSpecifierWithID:", CFSTR("Create"));
    v41 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    v42 = self->_createNewAccountGroupSpecifier;
    self->_createNewAccountGroupSpecifier = v41;

    v43 = self->_createNewAccountGroupSpecifier;
    v44 = (objc_class *)objc_opt_class();
    NSStringFromClass(v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setProperty:forKey:](v43, "setProperty:forKey:", v45, CFSTR("footerCellClass"));

    -[PSSpecifier setProperty:forKey:](self->_createNewAccountGroupSpecifier, "setProperty:forKey:", v40, CFSTR("footerText"));
    v46 = self->_createNewAccountGroupSpecifier;
    v64.location = objc_msgSend(v40, "rangeOfString:", v39);
    NSStringFromRange(v64);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setProperty:forKey:](v46, "setProperty:forKey:", v47, CFSTR("footerHyperlinkRange"));

    v48 = self->_createNewAccountGroupSpecifier;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setProperty:forKey:](v48, "setProperty:forKey:", v49, CFSTR("footerHyperlinkTarget"));

    v50 = self->_createNewAccountGroupSpecifier;
    NSStringFromSelector(sel__presentAppleIDPrivacyInformationPane);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setProperty:forKey:](v50, "setProperty:forKey:", v51, CFSTR("footerHyperlinkAction"));

    objc_msgSend(v5, "addObject:", self->_createNewAccountGroupSpecifier);
    PS_RebrandedKeyForAppleID(CFSTR("CREATE_ACCOUNT_BUTTON"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    PS_LocalizedStringForAppleID(v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v53, self, 0, 0, 0, 13, 0);
    v54 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    v55 = self->_createNewAccountButtonSpecifier;
    self->_createNewAccountButtonSpecifier = v54;

    -[PSSpecifier setButtonAction:](self->_createNewAccountButtonSpecifier, "setButtonAction:", sel__createNewAppleIDButtonWasTapped_);
    objc_msgSend(v5, "addObject:", self->_createNewAccountButtonSpecifier);

  }
  return v5;
}

- (id)_specifierForGroupWithiForgotLink
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  void *v12;
  void *v13;
  void *v14;
  NSRange v16;

  PS_RebrandedKeyForAppleID(CFSTR("IFORGOT_BUTTON"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PS_LocalizedStringForAppleID(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4;
  +[PSSpecifier groupSpecifierWithID:](PSSpecifier, "groupSpecifierWithID:", CFSTR("iForgot"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", v8, CFSTR("footerCellClass"));

  objc_msgSend(v6, "setProperty:forKey:", v5, CFSTR("headerFooterHyperlinkButtonTitle"));
  v9 = objc_msgSend(v5, "rangeOfString:", v5);
  v11 = v10;

  v16.location = v9;
  v16.length = v11;
  NSStringFromRange(v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", v12, CFSTR("footerHyperlinkRange"));

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", v13, CFSTR("footerHyperlinkTarget"));

  NSStringFromSelector(sel__iForgotButtonWasTapped_);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", v14, CFSTR("footerHyperlinkAction"));

  return v6;
}

- (void)_presentAppleIDPrivacyInformationPane
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v3 = (void *)getOBPrivacyPresenterClass_softClass;
  v11 = getOBPrivacyPresenterClass_softClass;
  if (!getOBPrivacyPresenterClass_softClass)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getOBPrivacyPresenterClass_block_invoke;
    v7[3] = &unk_1E4A65650;
    v7[4] = &v8;
    __getOBPrivacyPresenterClass_block_invoke((uint64_t)v7);
    v3 = (void *)v9[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v8, 8);
  getOBPrivacyAppleIDIdentifier();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presenterForPrivacySplashWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setPresentingViewController:", self);
  objc_msgSend(v6, "present");

}

- (void)viewDidLoad
{
  UIActivityIndicatorView *v3;
  UIActivityIndicatorView *spinner;
  UIBarButtonItem *v5;
  UIBarButtonItem *spinnerBarItem;
  UIBarButtonItem *v7;
  UIBarButtonItem *cancelButtonBarItem;
  void *v9;
  id v10;
  void *v11;
  UIBarButtonItem *v12;
  UIBarButtonItem *nextButtonBarItem;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PSAppleIDSplashViewController;
  -[PSListController viewDidLoad](&v15, sel_viewDidLoad);
  v3 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
  spinner = self->_spinner;
  self->_spinner = v3;

  v5 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithCustomView:", self->_spinner);
  spinnerBarItem = self->_spinnerBarItem;
  self->_spinnerBarItem = v5;

  if (self->_isPresentedModally)
  {
    v7 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelButtonWasTapped_);
    cancelButtonBarItem = self->_cancelButtonBarItem;
    self->_cancelButtonBarItem = v7;

    -[PSAppleIDSplashViewController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLeftBarButtonItem:", self->_cancelButtonBarItem);

    v10 = objc_alloc(MEMORY[0x1E0CEA380]);
    PS_LocalizedStringForAppleID(CFSTR("NEXT_BUTTON"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (UIBarButtonItem *)objc_msgSend(v10, "initWithTitle:style:target:action:", v11, 2, self, sel__signInButtonWasTapped_);
    nextButtonBarItem = self->_nextButtonBarItem;
    self->_nextButtonBarItem = v12;

    -[PSAppleIDSplashViewController navigationItem](self, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRightBarButtonItem:", self->_nextButtonBarItem);

  }
  self->_isPasswordDirty = 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PSAppleIDSplashViewController;
  -[PSListController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  -[PSAppleIDSplashViewController _updateSignInButton](self, "_updateSignInButton");
  if (!self->_isPresentedModally)
  {
    -[PSAppleIDSplashViewController navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      PS_RebrandedKeyForAppleID(CFSTR("APPLE_ID_TITLE"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PS_LocalizedStringForAppleID(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSAppleIDSplashViewController navigationItem](self, "navigationItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitle:", v7);

    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (+[PSListController instancesRespondToSelector:](PSListController, "instancesRespondToSelector:", sel_traitCollectionDidChange_))
  {
    v5.receiver = self;
    v5.super_class = (Class)PSAppleIDSplashViewController;
    -[PSAppleIDSplashViewController traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, v4);
  }
  if (-[PSAppleIDSplashViewController _shouldAnchorCreateAccountButton](self, "_shouldAnchorCreateAccountButton"))
    -[UITableView reloadData](self->super._table, "reloadData");

}

- (BOOL)_shouldAnchorCreateAccountButton
{
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "sf_isiPad") & 1) == 0 && self->_createNewAccountButtonSpecifier != 0;

  return v4;
}

- (double)_heightForCreateNewAccountSpecifierWithWidth:(double)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  -[PSSpecifier propertyForKey:](self->_createNewAccountButtonSpecifier, "propertyForKey:", CFSTR("cellObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (v4)
  {
    LODWORD(v5) = 1148846080;
    LODWORD(v6) = 1112014848;
    objc_msgSend(v4, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3, *(double *)(MEMORY[0x1E0CEB980] + 8), v5, v6);
    v9 = v8;
  }
  else
  {
    v9 = *MEMORY[0x1E0CEBC18];
  }

  return v9;
}

- (double)_heightForCreateNewAccountFooterWithWidth:(double)a3
{
  PSFooterHyperlinkView *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = -[PSFooterHyperlinkView initWithSpecifier:]([PSFooterHyperlinkView alloc], "initWithSpecifier:", self->_createNewAccountGroupSpecifier);
  LODWORD(v5) = 1148846080;
  LODWORD(v6) = 1112014848;
  -[PSFooterHyperlinkView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v4, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3, *(double *)(MEMORY[0x1E0CEB980] + 8), v5, v6);
  v8 = v7;

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  double v7;
  double v8;
  double MaxY;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double Width;
  double Height;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v35;
  uint64_t v36;
  objc_super v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v6 = a3;
  v37.receiver = self;
  v37.super_class = (Class)PSAppleIDSplashViewController;
  -[PSListController tableView:heightForHeaderInSection:](&v37, sel_tableView_heightForHeaderInSection_, v6, a4);
  v8 = v7;
  if (-[PSAppleIDSplashViewController _shouldAnchorCreateAccountButton](self, "_shouldAnchorCreateAccountButton"))
  {
    v35 = 0;
    v36 = 0;
    -[PSListController getGroup:row:ofSpecifier:](self, "getGroup:row:ofSpecifier:", &v36, &v35, self->_createNewAccountButtonSpecifier);
    if (a4 >= 1 && v36 == a4)
    {
      objc_msgSend(v6, "rectForSection:", a4 - 1);
      MaxY = CGRectGetMaxY(v38);
      -[PSAppleIDSplashViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;
      -[PSAppleIDSplashViewController view](self, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "safeAreaInsets");
      v21 = v12 + v20;
      v23 = v14 + v22;
      v25 = v16 - (v20 + v24);
      v27 = v18 - (v22 + v26);

      v39.origin.x = v21;
      v39.origin.y = v23;
      v39.size.width = v25;
      v39.size.height = v27;
      Width = CGRectGetWidth(v39);
      v40.origin.x = v21;
      v40.origin.y = v23;
      v40.size.width = v25;
      v40.size.height = v27;
      Height = CGRectGetHeight(v40);
      -[PSAppleIDSplashViewController _heightForCreateNewAccountSpecifierWithWidth:](self, "_heightForCreateNewAccountSpecifierWithWidth:", Width);
      v31 = v30;
      -[PSAppleIDSplashViewController _heightForCreateNewAccountFooterWithWidth:](self, "_heightForCreateNewAccountFooterWithWidth:", Width);
      v33 = Height - MaxY - v31 - v32 + -20.0;
      if (v33 >= 0.0)
        v8 = v33;
      else
        v8 = 0.0;
    }
  }

  return v8;
}

- (id)_usernameForSpecifier:(id)a3
{
  return self->_username;
}

- (void)_setUsername:(id)a3 withSpecifier:(id)a4
{
  id v6;
  NSString *password;

  objc_storeStrong((id *)&self->_username, a3);
  v6 = a3;
  password = self->_password;
  self->_password = 0;

  -[PSAppleIDSplashViewController _cancelPasswordDelegateIfNecessary](self, "_cancelPasswordDelegateIfNecessary");
  -[PSAppleIDSplashViewController _reloadPasswordSpecifier](self, "_reloadPasswordSpecifier");
}

- (id)_passwordForSpecifier:(id)a3
{
  return self->_password;
}

- (void)_setPassword:(id)a3 withSpecifier:(id)a4
{
  self->_isPasswordDirty = 1;
  objc_storeStrong((id *)&self->_password, a3);
}

- (void)_signInWithUsername:(id)a3 password:(id)a4
{
  id v6;
  id v7;
  void (**passwordHandler)(id, id, _QWORD);
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  passwordHandler = (void (**)(id, id, _QWORD))self->_passwordHandler;
  if (passwordHandler)
  {
    passwordHandler[2](passwordHandler, v7, 0);
    v9 = self->_passwordHandler;
    self->_passwordHandler = 0;

  }
  else
  {
    _PSLoggingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3819000, v10, OS_LOG_TYPE_DEFAULT, "User asked to sign. Calling out to AuthKit...", buf, 2u);
    }

    v11 = objc_alloc_init((Class)getAKAppleIDAuthenticationInAppContextClass());
    objc_msgSend(v11, "_setPasswordDelegate:", self);
    objc_msgSend(v11, "setPresentingViewController:", self);
    objc_msgSend(v11, "setAuthenticationType:", 0);
    objc_msgSend(v11, "setIsUsernameEditable:", 1);
    objc_msgSend(v11, "setShouldUpdatePersistentServiceTokens:", 1);
    objc_msgSend(v11, "setFirstTimeLogin:", 1);
    if (v6)
    {
      objc_msgSend(v11, "setUsername:", v6);
      objc_msgSend(v11, "setIsUsernameEditable:", 0);
    }
    if (v7)
      objc_msgSend(v11, "_setPassword:", v7);
    -[PSAppleIDSplashViewController willBeginAuthWithContext:](self, "willBeginAuthWithContext:", v11);
    dispatch_get_global_queue(25, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __62__PSAppleIDSplashViewController__signInWithUsername_password___block_invoke;
    v14[3] = &unk_1E4A655B8;
    v14[4] = self;
    v15 = v11;
    v13 = v11;
    dispatch_async(v12, v14);

  }
}

void __62__PSAppleIDSplashViewController__signInWithUsername_password___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "authenticationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__PSAppleIDSplashViewController__signInWithUsername_password___block_invoke_2;
  v4[3] = &unk_1E4A65A00;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "authenticateWithContext:completion:", v5, v4);

}

uint64_t __62__PSAppleIDSplashViewController__signInWithUsername_password___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "didFinishAuthWithContext:results:error:", *(_QWORD *)(a1 + 40), a2, a3);
}

- (void)didFinishAuthWithContext:(id)a3 results:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    _PSLoggingFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v10;
      _os_log_impl(&dword_1A3819000, v11, OS_LOG_TYPE_DEFAULT, "No dice with auth: %@", buf, 0xCu);
    }

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __72__PSAppleIDSplashViewController_didFinishAuthWithContext_results_error___block_invoke_115;
    v13[3] = &unk_1E4A65A28;
    v13[4] = self;
    v12 = &v14;
    v14 = v9;
    v15 = v10;
    v16 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], v13);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__PSAppleIDSplashViewController_didFinishAuthWithContext_results_error___block_invoke;
    block[3] = &unk_1E4A655B8;
    block[4] = self;
    v12 = &v18;
    v18 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __72__PSAppleIDSplashViewController_didFinishAuthWithContext_results_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleAuthCompletionWithResults:", *(_QWORD *)(a1 + 40));
}

void __72__PSAppleIDSplashViewController_didFinishAuthWithContext_results_error___block_invoke_115(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint8_t v21[8];
  _QWORD v22[5];

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __72__PSAppleIDSplashViewController_didFinishAuthWithContext_results_error___block_invoke_2;
  v22[3] = &unk_1E4A65A50;
  v22[4] = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1A8594D10](v22);
  v3 = *(void **)(a1 + 40);
  getAKAuthenticationNewAppleIDSetupInfoKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_8;
  v6 = (void *)v5;
  objc_msgSend(*(id *)(a1 + 48), "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  getAKAppleIDAuthenticationErrorDomain();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", v8))
  {

LABEL_8:
LABEL_9:
    if (objc_msgSend(*(id *)(a1 + 56), "needsCredentialRecovery"))
    {
      objc_msgSend(*(id *)(a1 + 48), "domain");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      getAKAppleIDAuthenticationErrorDomain();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v15, "isEqualToString:", v16) & 1) != 0)
      {
        v17 = objc_msgSend(*(id *)(a1 + 48), "code");

        if (v17 == -7017)
        {
          objc_msgSend(*(id *)(a1 + 32), "hideBusyUI");
          objc_msgSend(*(id *)(a1 + 32), "_openWebBasedCredentialRecoveryFlow");
          goto LABEL_20;
        }
      }
      else
      {

      }
    }
    if (objc_msgSend(*(id *)(a1 + 56), "needsNewAppleID"))
    {
      objc_msgSend(*(id *)(a1 + 48), "domain");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      getAKAppleIDAuthenticationErrorDomain();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v18, "isEqualToString:", v19) & 1) != 0)
      {
        v20 = objc_msgSend(*(id *)(a1 + 48), "code");

        if (v20 == -7016)
        {
          objc_msgSend(*(id *)(a1 + 32), "createNewAppleIDWithCompletion:", v2);
          goto LABEL_20;
        }
      }
      else
      {

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "hideBusyUI");
    goto LABEL_20;
  }
  v9 = objc_msgSend(*(id *)(a1 + 48), "code");

  if (v9 != -7043)
    goto LABEL_9;
  _PSLoggingFacility();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_1A3819000, v10, OS_LOG_TYPE_DEFAULT, "AuthKit wants us to start the U-13 flow.", v21, 2u);
  }

  v12 = *(void **)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  getAKAuthenticationNewAppleIDSetupInfoKey();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_beginiCloudCreationFlowWithContinuationData:completion:", v14, v2);

LABEL_20:
}

void __72__PSAppleIDSplashViewController_didFinishAuthWithContext_results_error___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72__PSAppleIDSplashViewController_didFinishAuthWithContext_results_error___block_invoke_3;
  v14[3] = &unk_1E4A65A28;
  v10 = *(_QWORD *)(a1 + 32);
  v15 = v9;
  v16 = v10;
  v17 = v7;
  v18 = v8;
  v11 = v8;
  v12 = v7;
  v13 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v14);

}

void __72__PSAppleIDSplashViewController_didFinishAuthWithContext_results_error___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint8_t buf[16];

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "hideBusyUI");
    v2 = (void *)MEMORY[0x1E0CEA2E8];
    PS_RebrandedKeyForAppleID(CFSTR("CREATE_ACCOUNT_FAILED_TITLE"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PS_LocalizedStringForAppleID(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0CEA2E0];
    PS_LocalizedStringForAppleID(CFSTR("OK_BUTTON"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAction:", v8);

    objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v12, 1, 0);
  }
  else
  {
    v9 = *(void **)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    if (v10)
    {
      objc_msgSend(v9, "_signInWithUsername:password:", v10, *(_QWORD *)(a1 + 56));
    }
    else
    {
      objc_msgSend(v9, "hideBusyUI");
      _PSLoggingFacility();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A3819000, v11, OS_LOG_TYPE_DEFAULT, "PSAppleIDSplashViewController: missing password for Apple ID creation!", buf, 2u);
      }

    }
  }
}

- (void)_beginiCloudCreationFlowWithContinuationData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  PSAppleIDSplashViewController *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__PSAppleIDSplashViewController__beginiCloudCreationFlowWithContinuationData_completion___block_invoke;
  block[3] = &unk_1E4A65780;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __89__PSAppleIDSplashViewController__beginiCloudCreationFlowWithContinuationData_completion___block_invoke(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  id v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  v32 = 0;
  v33 = &v32;
  v34 = 0x2050000000;
  v2 = (void *)getAADeviceInfoClass_softClass;
  v35 = getAADeviceInfoClass_softClass;
  if (!getAADeviceInfoClass_softClass)
  {
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __getAADeviceInfoClass_block_invoke;
    v30 = &unk_1E4A65650;
    v31 = &v32;
    __getAADeviceInfoClass_block_invoke((uint64_t)&v27);
    v2 = (void *)v33[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v32, 8);
  v4 = objc_alloc_init(v3);
  v5 = (void *)MEMORY[0x1E0C99E98];
  v32 = 0;
  v33 = &v32;
  v34 = 0x2050000000;
  v6 = (void *)getAAURLConfigurationClass_softClass;
  v35 = getAAURLConfigurationClass_softClass;
  if (!getAAURLConfigurationClass_softClass)
  {
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __getAAURLConfigurationClass_block_invoke;
    v30 = &unk_1E4A65650;
    v31 = &v32;
    __getAAURLConfigurationClass_block_invoke((uint64_t)&v27);
    v6 = (void *)v33[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v32, 8);
  objc_msgSend(v7, "urlConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "repairCloudAccountUIURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLWithString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A8]), "initWithURL:cachePolicy:timeoutInterval:", v10, 1, 30.0);
  objc_msgSend(v11, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v11, "setValue:forHTTPHeaderField:", CFSTR("application/x-plist"), CFSTR("Content-Type"));
  objc_msgSend(v11, "setValue:forHTTPHeaderField:", *(_QWORD *)(a1 + 32), CFSTR("X-Apple-AK-Continuation-Data"));
  objc_msgSend(v4, "clientInfoHeader");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forHTTPHeaderField:", v12, CFSTR("X-MMe-Client-Info"));

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uppercaseString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forHTTPHeaderField:", v15, CFSTR("X-MMe-Country"));

  v32 = 0;
  v33 = &v32;
  v34 = 0x2050000000;
  v16 = (void *)getRemoteUIControllerClass_softClass;
  v35 = getRemoteUIControllerClass_softClass;
  if (!getRemoteUIControllerClass_softClass)
  {
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __getRemoteUIControllerClass_block_invoke;
    v30 = &unk_1E4A65650;
    v31 = &v32;
    __getRemoteUIControllerClass_block_invoke((uint64_t)&v27);
    v16 = (void *)v33[3];
  }
  v17 = objc_retainAutorelease(v16);
  _Block_object_dispose(&v32, 8);
  v18 = objc_alloc_init(v17);
  v19 = *(_QWORD *)(a1 + 40);
  v20 = *(void **)(v19 + 1512);
  *(_QWORD *)(v19 + 1512) = v18;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1512), "setDelegate:");
  v21 = *(_QWORD **)(a1 + 40);
  v22 = (void *)v21[189];
  objc_msgSend(v21, "navigationController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setNavigationController:", v23);

  v24 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v25 = *(_QWORD *)(a1 + 40);
  v26 = *(void **)(v25 + 1520);
  *(_QWORD *)(v25 + 1520) = v24;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1512), "loadRequest:completion:", v11, 0);
}

- (void)createNewAppleIDWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0CB28A8];
  v10 = *MEMORY[0x1E0CB2D50];
  v11[0] = CFSTR("This feature is not supported yet.");
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, void *))a3 + 2))(v7, 0, 0, v9);

}

- (void)_openWebBasedCredentialRecoveryFlow
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://iforgot.apple.com"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:options:completionHandler:", v2, MEMORY[0x1E0C9AA70], 0);

}

- (void)_textFieldValueDidChange:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  if (-[NSArray count](self->super._specifiers, "count", a3))
  {
    v4 = 0;
    v5 = 0x1E4A63000uLL;
    do
    {
      -[NSArray objectAtIndex:](self->super._specifiers, "objectAtIndex:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSListController indexPathForIndex:](self, "indexPathForIndex:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableView cellForRowAtIndexPath:](self->super._table, "cellForRowAtIndexPath:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEditing");

      if (v9)
      {
        -[UITableView cellForRowAtIndexPath:](self->super._table, "cellForRowAtIndexPath:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v5;
          objc_msgSend(v6, "propertyForKey:", CFSTR("key"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "textField");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "text");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v12, "isEqualToString:", CFSTR("PSSpecifierPassword")))
          {
            -[PSAppleIDSplashViewController _setPassword:withSpecifier:](self, "_setPassword:withSpecifier:", v14, v6);
          }
          else if (objc_msgSend(v12, "isEqualToString:", CFSTR("PSSpecifierUsername")))
          {
            -[PSAppleIDSplashViewController _setUsername:withSpecifier:](self, "_setUsername:withSpecifier:", v14, v6);
          }

          v5 = v11;
        }

      }
      ++v4;
    }
    while (-[NSArray count](self->super._specifiers, "count") > v4);
  }
  -[PSAppleIDSplashViewController _updateSignInButton](self, "_updateSignInButton");
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id textFieldTextDidChangeObserver;
  _QWORD v21[4];
  id v22;
  id location;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PSAppleIDSplashViewController;
  -[PSListController tableView:cellForRowAtIndexPath:](&v24, sel_tableView_cellForRowAtIndexPath_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_12;
  -[PSListController specifierAtIndex:](self, "specifierAtIndex:", -[PSListController indexForIndexPath:](self, "indexForIndexPath:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "propertyForKey:", CFSTR("key"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("PSSpecifierPassword")))
  {
    PS_LocalizedStringForAppleID(CFSTR("PASSWORD_LABEL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessibilityLabel:", v11);
LABEL_6:

    goto LABEL_7;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("PSSpecifierUsername")))
  {
    PS_RebrandedKeyForAppleID(CFSTR("APPLE_ID_LABEL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PS_LocalizedStringForAppleID(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessibilityLabel:", v12);

    goto LABEL_6;
  }
LABEL_7:
  objc_msgSend(v8, "setSeparatorInset:", 0.0, 70.0, 0.0, 0.0);
  objc_msgSend(v8, "textField");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (uint64_t *)MEMORY[0x1E0CEBD20];
    if (self->_textFieldTextDidChangeObserver)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeObserver:name:object:", self->_textFieldTextDidChangeObserver, *v14, v13);

    }
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *v14;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __65__PSAppleIDSplashViewController_tableView_cellForRowAtIndexPath___block_invoke;
    v21[3] = &unk_1E4A65A78;
    objc_copyWeak(&v22, &location);
    objc_msgSend(v16, "addObserverForName:object:queue:usingBlock:", v17, v13, 0, v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    textFieldTextDidChangeObserver = self->_textFieldTextDidChangeObserver;
    self->_textFieldTextDidChangeObserver = v18;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

LABEL_12:
  return v8;
}

void __65__PSAppleIDSplashViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_textFieldValueDidChange:", v3);

}

- (void)_updateSignInButton
{
  NSUInteger v3;
  _BOOL8 v4;
  void *v5;
  id v6;

  v3 = -[NSString length](self->_username, "length");
  if (self->_isPresentedModally)
  {
    v4 = v3 != 0;
    -[PSAppleIDSplashViewController navigationItem](self, "navigationItem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rightBarButtonItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", v4);

  }
}

- (void)showBusyUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PSSpecifier setProperty:forKey:](self->_createNewAccountButtonSpecifier, "setProperty:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("enabled"));
  -[PSListController reloadSpecifier:](self, "reloadSpecifier:", self->_createNewAccountButtonSpecifier);
  -[PSAppleIDSplashViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PS_LocalizedStringForAppleID(CFSTR("VERIFYING_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  LODWORD(v4) = self->_isPresentedModally;
  -[PSAppleIDSplashViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((_DWORD)v4)
    objc_msgSend(v5, "setLeftBarButtonItem:animated:", 0, 1);
  else
    objc_msgSend(v5, "setHidesBackButton:animated:", 1, 1);

  -[PSAppleIDSplashViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRightBarButtonItem:animated:", self->_spinnerBarItem, 1);

  -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
  -[PSAppleIDSplashViewController _setInteractionEnabled:](self, "_setInteractionEnabled:", 0);
}

- (void)hideBusyUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PSSpecifier setProperty:forKey:](self->_createNewAccountButtonSpecifier, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("enabled"));
  -[PSListController reloadSpecifier:](self, "reloadSpecifier:", self->_createNewAccountButtonSpecifier);
  -[PSAppleIDSplashViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSAppleIDSplashViewController serviceName](self, "serviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  LODWORD(v4) = self->_isPresentedModally;
  -[PSAppleIDSplashViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((_DWORD)v4)
    objc_msgSend(v5, "setLeftBarButtonItem:animated:", self->_cancelButtonBarItem, 1);
  else
    objc_msgSend(v5, "setHidesBackButton:animated:", 0, 1);

  -[PSAppleIDSplashViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRightBarButtonItem:animated:", self->_nextButtonBarItem, 1);

  -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
  -[PSAppleIDSplashViewController _setInteractionEnabled:](self, "_setInteractionEnabled:", 1);
}

- (void)setUsername:(id)a3
{
  objc_storeStrong((id *)&self->_username, a3);
  -[PSAppleIDSplashViewController _updateSignInButton](self, "_updateSignInButton");
  -[PSAppleIDSplashViewController _cancelPasswordDelegateIfNecessary](self, "_cancelPasswordDelegateIfNecessary");
  -[PSAppleIDSplashViewController _reloadPasswordSpecifier](self, "_reloadPasswordSpecifier");
}

- (void)setUsernameEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[PSListController specifierForID:](self, "specifierForID:", CFSTR("PSSpecifierUsername"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProperty:forKey:", v4, CFSTR("enabled"));

}

- (void)willMoveToParentViewController:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSAppleIDSplashViewController;
  -[PSAppleIDSplashViewController willMoveToParentViewController:](&v5, sel_willMoveToParentViewController_);
  if (!a3)
    -[PSAppleIDSplashViewController _setInteractionEnabled:](self, "_setInteractionEnabled:", 1);
}

- (void)_setInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PSAppleIDSplashViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", v3);

  -[PSAppleIDSplashViewController splitViewController](self, "splitViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "masterViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInteractionEnabled:", v3);

}

- (void)_iForgotButtonWasTapped:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = objc_alloc_init((Class)getAKAppleIDAuthenticationInAppContextClass());
  objc_msgSend(v4, "setUsername:", self->_username);
  objc_msgSend(v4, "setNeedsCredentialRecovery:", 1);
  objc_msgSend(v4, "setPresentingViewController:", self);
  -[PSAppleIDSplashViewController willBeginAuthWithContext:](self, "willBeginAuthWithContext:", v4);
  -[PSAppleIDSplashViewController authenticationController](self, "authenticationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__PSAppleIDSplashViewController__iForgotButtonWasTapped___block_invoke;
  v7[3] = &unk_1E4A65A00;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "authenticateWithContext:completion:", v6, v7);

}

uint64_t __57__PSAppleIDSplashViewController__iForgotButtonWasTapped___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "didFinishAuthWithContext:results:error:", *(_QWORD *)(a1 + 40), a2, a3);
}

- (void)_createNewAppleIDButtonWasTapped:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = objc_alloc_init((Class)getAKAppleIDAuthenticationInAppContextClass());
  objc_msgSend(v4, "setNeedsNewAppleID:", 1);
  objc_msgSend(v4, "setPresentingViewController:", self);
  -[PSAppleIDSplashViewController willBeginAuthWithContext:](self, "willBeginAuthWithContext:", v4);
  -[PSAppleIDSplashViewController authenticationController](self, "authenticationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__PSAppleIDSplashViewController__createNewAppleIDButtonWasTapped___block_invoke;
  v7[3] = &unk_1E4A65A00;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "authenticateWithContext:completion:", v6, v7);

}

uint64_t __66__PSAppleIDSplashViewController__createNewAppleIDButtonWasTapped___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "didFinishAuthWithContext:results:error:", *(_QWORD *)(a1 + 40), a2, a3);
}

- (void)_createICloudMailButtonWasTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "aa_primaryAppleAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v7 = (void *)getiCloudMailAccountProviderClass_softClass;
  v18 = getiCloudMailAccountProviderClass_softClass;
  v8 = MEMORY[0x1E0C809B0];
  if (!getiCloudMailAccountProviderClass_softClass)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __getiCloudMailAccountProviderClass_block_invoke;
    v14[3] = &unk_1E4A65650;
    v14[4] = &v15;
    __getiCloudMailAccountProviderClass_block_invoke((uint64_t)v14);
    v7 = (void *)v16[3];
  }
  v9 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v15, 8);
  v10 = (void *)objc_msgSend([v9 alloc], "initWithAccountStore:appleAccount:presenter:", v5, v6, self);
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __66__PSAppleIDSplashViewController__createICloudMailButtonWasTapped___block_invoke;
  v12[3] = &unk_1E4A655B8;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v10, "presentWithAlert:completionHandler:", 0, v12);

}

uint64_t __66__PSAppleIDSplashViewController__createICloudMailButtonWasTapped___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didCompleteCreateiCloudMailAccount:", *(_QWORD *)(a1 + 40));
}

- (void)_enableICloudMailButtonWasTapped:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aa_primaryAppleAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:forDataclass:", 1, *MEMORY[0x1E0C8EEB0]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__PSAppleIDSplashViewController__enableICloudMailButtonWasTapped___block_invoke;
  v7[3] = &unk_1E4A65AA0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  objc_msgSend(v4, "saveAccount:withDataclassActions:doVerify:completion:", v6, 0, 0, v7);

}

void __66__PSAppleIDSplashViewController__enableICloudMailButtonWasTapped___block_invoke(uint64_t a1, int a2)
{
  void *v2;
  _QWORD v3[5];
  id v4;

  if (a2)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __66__PSAppleIDSplashViewController__enableICloudMailButtonWasTapped___block_invoke_2;
    v3[3] = &unk_1E4A655B8;
    v2 = *(void **)(a1 + 40);
    v3[4] = *(_QWORD *)(a1 + 32);
    v4 = v2;
    dispatch_async(MEMORY[0x1E0C80D38], v3);

  }
}

uint64_t __66__PSAppleIDSplashViewController__enableICloudMailButtonWasTapped___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didCompleteCreateiCloudMailAccount:", *(_QWORD *)(a1 + 40));
}

- (void)returnPressedAtEnd
{
  -[PSAppleIDSplashViewController _signInButtonWasTapped:](self, "_signInButtonWasTapped:", 0);
}

- (void)_cancelButtonWasTapped:(id)a3
{
  id v3;

  -[PSAppleIDSplashViewController presentingViewController](self, "presentingViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_signInButtonWasTapped:(id)a3
{
  void *v4;

  -[UITableView firstResponder](self->super._table, "firstResponder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resignFirstResponder");

  -[PSAppleIDSplashViewController showBusyUI](self, "showBusyUI");
  -[PSAppleIDSplashViewController _signInWithUsername:password:](self, "_signInWithUsername:password:", self->_username, self->_password);
}

- (void)_presentInvalidUsernameAlert
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
  id v14;

  v3 = (void *)MEMORY[0x1E0CEA2E8];
  PS_RebrandedKeyForAppleID(CFSTR("INVALID_USERNAME_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PS_LocalizedStringForAppleID(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PS_RebrandedKeyForAppleID(CFSTR("INVALID_USERNAME_MESSAGE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PS_LocalizedStringForAppleID(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CEA2E0];
  PS_LocalizedStringForAppleID(CFSTR("OK_BUTTON"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v10);

  v11 = (void *)MEMORY[0x1E0CEA2E0];
  PS_LocalizedStringForAppleID(CFSTR("LEARN_MORE_BUTTON"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 1, &__block_literal_global_3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v13);

  -[PSAppleIDSplashViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
}

void __61__PSAppleIDSplashViewController__presentInvalidUsernameAlert__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://www.me.com/findmyiphone/account"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "openURL:options:completionHandler:", v0, MEMORY[0x1E0C9AA70], 0);

}

- (AKAppleIDAuthenticationController)authenticationController
{
  AKAppleIDAuthenticationController *authController;
  void *v4;
  objc_class *v5;
  AKAppleIDAuthenticationController *v6;
  AKAppleIDAuthenticationController *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  authController = self->_authController;
  if (!authController)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)getAKAppleIDAuthenticationControllerClass_softClass;
    v13 = getAKAppleIDAuthenticationControllerClass_softClass;
    if (!getAKAppleIDAuthenticationControllerClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getAKAppleIDAuthenticationControllerClass_block_invoke;
      v9[3] = &unk_1E4A65650;
      v9[4] = &v10;
      __getAKAppleIDAuthenticationControllerClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    v6 = (AKAppleIDAuthenticationController *)objc_alloc_init(v5);
    v7 = self->_authController;
    self->_authController = v6;

    authController = self->_authController;
  }
  return authController;
}

- (BOOL)_runningInMail
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilemail"));

  return v4;
}

- (BOOL)_shouldShowCancelDone
{
  return self->_isPresentedModally;
}

- (void)remoteUIControllerDidDismiss:(id)a3
{
  id remoteUICompletion;
  id v5;

  remoteUICompletion = self->_remoteUICompletion;
  if (remoteUICompletion)
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))remoteUICompletion + 2))(remoteUICompletion, 0, 0, 0);
    v5 = self->_remoteUICompletion;
    self->_remoteUICompletion = 0;

  }
}

- (void)context:(id)a3 needsPasswordWithCompletion:(id)a4
{
  id v5;
  void *v6;
  id passwordHandler;

  if (a4)
  {
    v5 = a4;
    -[PSAppleIDSplashViewController hideBusyUI](self, "hideBusyUI");
    v6 = (void *)MEMORY[0x1A8594D10](v5);

    passwordHandler = self->_passwordHandler;
    self->_passwordHandler = v6;

    -[PSAppleIDSplashViewController _reloadPasswordSpecifier](self, "_reloadPasswordSpecifier");
  }
}

- (void)_cancelPasswordDelegateIfNecessary
{
  void (**passwordHandler)(id, _QWORD, void *);
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSString *password;

  passwordHandler = (void (**)(id, _QWORD, void *))self->_passwordHandler;
  if (passwordHandler)
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    getAKAppleIDAuthenticationErrorDomain();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, -7003, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    passwordHandler[2](passwordHandler, 0, v6);

    v7 = self->_passwordHandler;
    self->_passwordHandler = 0;

    password = self->_password;
    self->_password = 0;

  }
}

- (BOOL)isPresentedModally
{
  return self->_isPresentedModally;
}

- (void)setPresentedModally:(BOOL)a3
{
  self->_isPresentedModally = a3;
}

- (BOOL)shouldShowCreateAppleIDButton
{
  return self->_shouldShowCreateAppleIDButton;
}

- (void)setShouldShowCreateAppleIDButton:(BOOL)a3
{
  self->_shouldShowCreateAppleIDButton = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_remoteUICompletion, 0);
  objc_storeStrong((id *)&self->_remoteUIController, 0);
  objc_storeStrong((id *)&self->_idleJiggleTimer, 0);
  objc_storeStrong(&self->_textFieldTextDidChangeObserver, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_userSpecifier, 0);
  objc_storeStrong((id *)&self->_passwordSpecifier, 0);
  objc_storeStrong((id *)&self->_signInButtonSpecifier, 0);
  objc_storeStrong((id *)&self->_createNewAccountGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_createNewAccountButtonSpecifier, 0);
  objc_storeStrong((id *)&self->_cancelButtonBarItem, 0);
  objc_storeStrong((id *)&self->_nextButtonBarItem, 0);
  objc_storeStrong((id *)&self->_spinnerBarItem, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong(&self->_passwordHandler, 0);
  objc_storeStrong((id *)&self->_authController, 0);
}

@end
