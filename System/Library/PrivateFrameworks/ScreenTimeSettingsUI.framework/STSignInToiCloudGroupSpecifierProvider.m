@implementation STSignInToiCloudGroupSpecifierProvider

- (STSignInToiCloudGroupSpecifierProvider)init
{
  STSignInToiCloudGroupSpecifierProvider *v2;
  STSignInToiCloudGroupSpecifierProvider *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  PSSpecifier *signInSpecifier;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)STSignInToiCloudGroupSpecifierProvider;
  v2 = -[STGroupSpecifierProvider init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    -[STGroupSpecifierProvider setIsHidden:](v2, "setIsHidden:", 1);
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SignInToiCloudFooterText"), &stru_24DB8A1D0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[STGroupSpecifierProvider groupSpecifier](v3, "groupSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE75A68]);

    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SignInToiCloudButtonName"), &stru_24DB8A1D0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v7, v3, 0, 0, 0, 13, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    signInSpecifier = v3->_signInSpecifier;
    v3->_signInSpecifier = (PSSpecifier *)v8;

    -[PSSpecifier setButtonAction:](v3->_signInSpecifier, "setButtonAction:", sel_presentAppleAccountSignInController_);
    -[STGroupSpecifierProvider mutableSpecifiers](v3, "mutableSpecifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v3->_signInSpecifier);
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerObserver:", v3);

    -[STSignInToiCloudGroupSpecifierProvider _updateEnabledValue](v3, "_updateEnabledValue");
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)STSignInToiCloudGroupSpecifierProvider;
  -[STGroupSpecifierProvider dealloc](&v4, sel_dealloc);
}

- (void)setCoordinator:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel.canSignIn"), CFSTR("STSignInToiCloudGroupSpecifierProviderObservationContext"));
  v6.receiver = self;
  v6.super_class = (Class)STSignInToiCloudGroupSpecifierProvider;
  -[STRootGroupSpecifierProvider setCoordinator:](&v6, sel_setCoordinator_, v4);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("viewModel.canSignIn"), 4, CFSTR("STSignInToiCloudGroupSpecifierProviderObservationContext"));

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  id v18;
  objc_super v19;

  if (a6 == CFSTR("STSignInToiCloudGroupSpecifierProviderObservationContext"))
  {
    v11 = a3;
    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");

    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("viewModel.canSignIn"));
    if (v12)
    {
      if (_os_feature_enabled_impl())
      {
        objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "effectiveBoolValueForSetting:", *MEMORY[0x24BE638F0]);

        -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "viewModel");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "canSignIn") ^ 1;
        if (v14 == 2)
          v17 = 1;
        else
          v17 = v16;
      }
      else
      {
        -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "viewModel");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "canSignIn") ^ 1;
      }
      -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", v17);

    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)STSignInToiCloudGroupSpecifierProvider;
    v10 = a3;
    -[STSignInToiCloudGroupSpecifierProvider observeValueForKeyPath:ofObject:change:context:](&v19, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, a5, a6);

  }
}

- (void)presentAppleAccountSignInController:(id)a3
{
  const __SCNetworkReachability *v4;
  const __SCNetworkReachability *v5;
  char v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SCNetworkReachabilityFlags flags;
  sockaddr address;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  address = (sockaddr)xmmword_219BA4D80;
  v4 = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x24BDBD240], &address);
  if (!v4)
    goto LABEL_9;
  v5 = v4;
  flags = 0;
  if (!SCNetworkReachabilityGetFlags(v4, &flags) || (v6 = flags, (flags & 6) != 2))
  {
    CFRelease(v5);
    goto LABEL_9;
  }
  CFRelease(v5);
  if ((v6 & 0x10) != 0)
  {
LABEL_9:
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SignInToiCloudNotConnectedToInternet"), &stru_24DB8A1D0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v10, 0, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ConfirmationButtonOK"), &stru_24DB8A1D0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v14);

    -[STGroupSpecifierProvider presentViewController:animated:](self, "presentViewController:animated:", v11, 1);
    goto LABEL_10;
  }
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "sf_isiPad");

  if (v9)
  {
    objc_msgSend(v7, "setModalPresentationStyle:", 2);
    objc_msgSend(v7, "setModalTransitionStyle:", 0);
  }
  -[STGroupSpecifierProvider presentViewController:animated:](self, "presentViewController:animated:", v7, 1);
LABEL_10:

}

- (void)_updateEnabledValue
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63770]) != 2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[STSignInToiCloudGroupSpecifierProvider signInSpecifier](self, "signInSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE75A18]);

}

- (void)signInController:(id)a3 didCompleteWithSuccess:(BOOL)a4 error:(id)a5
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0, a5);
}

- (void)signInControllerDidCancel:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  id v11;

  -[STSignInToiCloudGroupSpecifierProvider _updateEnabledValue](self, "_updateEnabledValue", a3, a4);
  -[STSignInToiCloudGroupSpecifierProvider signInSpecifier](self, "signInSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STGroupSpecifierProvider reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v5, 1);

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "effectiveBoolValueForSetting:", *MEMORY[0x24BE638F0]);

    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "canSignIn") ^ 1;
    if (v7 == 2)
      v10 = 1;
    else
      v10 = v9;
    -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", v10);

  }
}

- (PSSpecifier)signInSpecifier
{
  return self->_signInSpecifier;
}

- (void)setSignInSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_signInSpecifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signInSpecifier, 0);
}

@end
