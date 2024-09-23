@implementation PSUIBiometricController

- (PSUIBiometricController)init
{
  PSUIBiometricController *v2;
  PSUIBiometricController *v3;
  NSArray *storedBiometricTemplates;
  uint64_t v5;
  PSUIDeviceTakeOverController *dtoController;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PSUIBiometricController;
  v2 = -[PSUIPasscodeLockController init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    storedBiometricTemplates = v2->_storedBiometricTemplates;
    v2->_storedBiometricTemplates = 0;

    v3->_currentBiometricTemplateFetchStatus = 0;
    -[PSUIBiometricController fetchBiometricTemplateUUIDsWithCompletion:](v3, "fetchBiometricTemplateUUIDsWithCompletion:", 0);
    v5 = objc_opt_new();
    dtoController = v3->_dtoController;
    v3->_dtoController = (PSUIDeviceTakeOverController *)v5;

  }
  return v3;
}

- (void)fetchBiometricTemplateUUIDsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  unint64_t currentBiometricTemplateFetchStatus;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  v5 = v4;
  currentBiometricTemplateFetchStatus = self->_currentBiometricTemplateFetchStatus;
  if (currentBiometricTemplateFetchStatus != 1)
  {
    if (currentBiometricTemplateFetchStatus == 4)
    {
      if (v4)
        (*((void (**)(id))v4 + 2))(v4);
    }
    else
    {
      self->_currentBiometricTemplateFetchStatus = 1;
      objc_initWeak(&location, self);
      v7 = objc_alloc_init(MEMORY[0x24BE1BDF0]);
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __69__PSUIBiometricController_fetchBiometricTemplateUUIDsWithCompletion___block_invoke;
      v8[3] = &unk_24F9E3910;
      objc_copyWeak(&v10, &location);
      v9 = v5;
      objc_msgSend(v7, "globalAuthACLTemplateUUIDsWithCompletion:", v8);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }

}

void __69__PSUIBiometricController_fetchBiometricTemplateUUIDsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __69__PSUIBiometricController_fetchBiometricTemplateUUIDsWithCompletion___block_invoke_2;
  v9[3] = &unk_24F9E38E8;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v10 = v6;
  v11 = v5;
  v12 = *(id *)(a1 + 32);
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

  objc_destroyWeak(&v13);
}

void __69__PSUIBiometricController_fetchBiometricTemplateUUIDsWithCompletion___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  _QWORD *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained(v2);
    if (*(_QWORD *)(a1 + 32))
    {
      PSUILogForCategory(1uLL);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __69__PSUIBiometricController_fetchBiometricTemplateUUIDsWithCompletion___block_invoke_2_cold_1((uint64_t *)(a1 + 32), v5);

    }
    objc_msgSend(v4, "setStoredBiometricTemplates:", *(_QWORD *)(a1 + 40));
    PSUILogForCategory(1uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_22E0C8000, v6, OS_LOG_TYPE_DEFAULT, "Fetched biometric template UUIDs: %@", (uint8_t *)&v10, 0xCu);
    }

    v8 = 2;
    if (*(_QWORD *)(a1 + 32))
      v8 = 3;
    v4[188] = v8;
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
      (*(void (**)(void))(v9 + 16))();

  }
}

- (CIDVUIBiometricBindingFlowManager)_biometricBindingFlowManager
{
  CIDVUIBiometricBindingFlowManager *biometricBindingFlowManager;
  CIDVUIBiometricBindingFlowManager *v4;
  CIDVUIBiometricBindingFlowManager *v5;

  biometricBindingFlowManager = self->__biometricBindingFlowManager;
  if (!biometricBindingFlowManager)
  {
    v4 = (CIDVUIBiometricBindingFlowManager *)objc_alloc_init(MEMORY[0x24BE1DEF0]);
    v5 = self->__biometricBindingFlowManager;
    self->__biometricBindingFlowManager = v4;

    biometricBindingFlowManager = self->__biometricBindingFlowManager;
  }
  return biometricBindingFlowManager;
}

- (void)deleteGlobalAuthACL
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id location;

  objc_initWeak(&location, self);
  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v5 = 3221225472;
  v6 = __46__PSUIBiometricController_deleteGlobalAuthACL__block_invoke;
  v7 = &unk_24F9E3978;
  objc_copyWeak(&v8, &location);
  dispatch_async(v3, &v4);

  self->_currentBiometricTemplateFetchStatus = 4;
  -[PSUIBiometricController setStoredBiometricTemplates:](self, "setStoredBiometricTemplates:", 0, v4, v5, v6, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __46__PSUIBiometricController_deleteGlobalAuthACL__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_biometricBindingFlowManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "deleteBoundACLWithCompletion:", &__block_literal_global);

}

void __46__PSUIBiometricController_deleteGlobalAuthACL__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    PSUILogForCategory(1uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __46__PSUIBiometricController_deleteGlobalAuthACL__block_invoke_2_cold_1((uint64_t)v2, v3);

  }
}

- (void)updateWithReplacedUUIDs:(id)a3
{
  -[PSUIBiometricController setStoredBiometricTemplates:](self, "setStoredBiometricTemplates:", a3);
  self->_currentBiometricTemplateFetchStatus = 2;
}

- (void)didUnlock
{
  void *v3;
  int v4;
  id v5;

  +[PSUIPasscode sharedInstance](PSUIPasscode, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPasscodeSet");

  if (v4)
  {
    -[PSUIBiometricController popRecursivelyToRootController](self, "popRecursivelyToRootController");
    -[PSUIBiometricController navigationController](self, "navigationController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setViewControllers:", MEMORY[0x24BDBD1A8]);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSUIBiometricController;
  -[PSUIBiometricController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == 6)
    -[PSUIBiometricController setupBiometricLogoHeader](self, "setupBiometricLogoHeader");
}

- (BOOL)isPasscodeSet
{
  void *v2;
  char v3;

  +[PSUIPasscode sharedInstance](PSUIPasscode, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPasscodeSet");

  return v3;
}

- (void)addEnrollmentOrCreatePasscodeIfNecessaryWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  void (**v9)(void);

  v9 = (void (**)(void))a3;
  -[PSUIBiometricController setModalFlowSuccessCompletion:](self, "setModalFlowSuccessCompletion:");
  +[PSUIBiometrics identities](PSUIBiometrics, "identities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    +[PSUIPasscode sharedInstance](PSUIPasscode, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isPasscodeSet");

    if ((v7 & 1) != 0)
    {
      v9[2]();
    }
    else
    {
      -[PSUIBiometricController specifierForID:](self, "specifierForID:", CFSTR("PASSCODE_OFF"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSUIBiometricController presentPasscodePaneFromSpecifier:](self, "presentPasscodePaneFromSpecifier:", v8);

    }
  }
  else
  {
    -[PSUIBiometricController enrollBiometric](self, "enrollBiometric");
  }

}

- (id)isTouchIDUnlockEnabled:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  +[PSUIPasscodeAndBiometrics sharedInstance](PSUIPasscodeAndBiometrics, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "isUnlockEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setBiometricUnlockEnabled:(id)a3 specifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;

  v5 = a3;
  -[PSUIBiometricController presentingViewController](self, "presentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", self);
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __63__PSUIBiometricController_setBiometricUnlockEnabled_specifier___block_invoke;
    v13 = &unk_24F9E39A0;
    v14 = v7;
    v15 = v5;
    v8 = v7;
    v9 = _Block_copy(&v10);
    -[PSUIBiometricController addEnrollmentOrCreatePasscodeIfNecessaryWithCompletion:](self, "addEnrollmentOrCreatePasscodeIfNecessaryWithCompletion:", v9, v10, v11, v12, v13);

  }
}

void __63__PSUIBiometricController_setBiometricUnlockEnabled_specifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(*(id *)(a1 + 32), "anyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    PSUILogForCategory(1uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __63__PSUIBiometricController_setBiometricUnlockEnabled_specifier___block_invoke_cold_2();

  }
  objc_msgSend(*(id *)(a1 + 32), "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "propertyForKey:", *MEMORY[0x24BE75CC0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    PSUILogForCategory(1uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __63__PSUIBiometricController_setBiometricUnlockEnabled_specifier___block_invoke_cold_1();

  }
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFingerprintUnlockAllowed:passcode:completion:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"), v7, 0);

  if (objc_msgSend(*(id *)(a1 + 40), "BOOLValue"))
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forSetting:", &unk_24F9EB9A0, *MEMORY[0x24BE63A40]);

  }
  objc_msgSend(*(id *)(a1 + 32), "anyObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateGracePeriodSpecifier");

}

- (void)updateTouchIDUnlockSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PSUIBiometricController specifierForID:](self, "specifierForID:", CFSTR("TOUCHID_UNLOCK"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD16E0];
  +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "isTouchIDUnlockRestricted") ^ 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", v5, *MEMORY[0x24BE75A18]);

  -[PSUIBiometricController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v6, 1);
}

- (void)setStoreState:(int64_t)a3
{
  if (self->_storeState != a3)
  {
    self->_storeState = a3;
    -[PSUIBiometricController reloadSpecifierID:](self, "reloadSpecifierID:", CFSTR("TOUCHID_PURCHASES"));
  }
}

- (void)updateStoreBiometricsState
{
  id v3;
  _QWORD v4[5];

  v3 = objc_alloc_init(MEMORY[0x24BEB1DD8]);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__PSUIBiometricController_updateStoreBiometricsState__block_invoke;
  v4[3] = &unk_24F9E39F0;
  v4[4] = self;
  objc_msgSend(v3, "getStateWithCompletionBlock:", v4);

}

void __53__PSUIBiometricController_updateStoreBiometricsState__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __53__PSUIBiometricController_updateStoreBiometricsState__block_invoke_2;
  v2[3] = &unk_24F9E39C8;
  v2[4] = *(_QWORD *)(a1 + 32);
  v2[5] = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
}

uint64_t __53__PSUIBiometricController_updateStoreBiometricsState__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setStoreState:", *(_QWORD *)(a1 + 40));
}

- (id)authorizationToken
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;

  -[PSUIBiometricController specifier](self, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    PSUILogForCategory(1uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[PSUIBiometricController authorizationToken].cold.2();

  }
  -[PSUIBiometricController specifier](self, "specifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertyForKey:", *MEMORY[0x24BE75CC0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    PSUILogForCategory(1uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[PSUIBiometricController authorizationToken].cold.1();

  }
  PSAuthorizationTokenForPasscode();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)isTouchIDForPurchasesEnabled:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  if (-[PSUIBiometricController currentlyEnablingTouchIDForPurchases](self, "currentlyEnablingTouchIDForPurchases", a3))
  {
    v4 = (void *)MEMORY[0x24BDBD1C8];
  }
  else
  {
    if (-[PSUIBiometricController storeState](self, "storeState") == 1)
    {
      +[PSUIPasscode sharedInstance](PSUIPasscode, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isPasscodeSet"))
      {
        +[PSUIBiometrics identities](PSUIBiometrics, "identities");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "count") != 0;

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setTouchIDForPurchasesEnabled:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(id *);
  void *v14;
  id v15;
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  -[PSUIBiometricController setCurrentlyEnablingTouchIDForPurchases:](self, "setCurrentlyEnablingTouchIDForPurchases:", 1);
  objc_initWeak(&location, self);
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __67__PSUIBiometricController_setTouchIDForPurchasesEnabled_specifier___block_invoke;
  v14 = &unk_24F9E3A90;
  objc_copyWeak(&v17, &location);
  v8 = v6;
  v15 = v8;
  v9 = v7;
  v16 = v9;
  v10 = _Block_copy(&v11);
  -[PSUIBiometricController addEnrollmentOrCreatePasscodeIfNecessaryWithCompletion:](self, "addEnrollmentOrCreatePasscodeIfNecessaryWithCompletion:", v10, v11, v12, v13, v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __67__PSUIBiometricController_setTouchIDForPurchasesEnabled_specifier___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;

  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __67__PSUIBiometricController_setTouchIDForPurchasesEnabled_specifier___block_invoke_2;
  v5[3] = &unk_24F9E3A68;
  v5[4] = WeakRetained;
  v6 = a1[4];
  objc_copyWeak(&v8, v2);
  v7 = a1[5];
  dispatch_async(v4, v5);

  objc_destroyWeak(&v8);
}

void __67__PSUIBiometricController_setTouchIDForPurchasesEnabled_specifier___block_invoke_2(id *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(a1[4], "authorizationToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1[5], "BOOLValue");
  v4 = objc_alloc_init(MEMORY[0x24BEB1DD8]);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __67__PSUIBiometricController_setTouchIDForPurchasesEnabled_specifier___block_invoke_3;
  v5[3] = &unk_24F9E3A40;
  objc_copyWeak(&v7, a1 + 7);
  v6 = a1[6];
  objc_msgSend(v4, "setEnabled:withAuthToken:completionBlock:", v3, v2, v5);

  objc_destroyWeak(&v7);
}

void __67__PSUIBiometricController_setTouchIDForPurchasesEnabled_specifier___block_invoke_3(uint64_t a1, char a2)
{
  _QWORD block[4];
  id v5;
  id v6;
  char v7;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__PSUIBiometricController_setTouchIDForPurchasesEnabled_specifier___block_invoke_4;
  block[3] = &unk_24F9E3A18;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v7 = a2;
  v5 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v6);
}

void __67__PSUIBiometricController_setTouchIDForPurchasesEnabled_specifier___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!*(_BYTE *)(a1 + 48))
  {
    PSUILogForCategory(1uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_22E0C8000, v3, OS_LOG_TYPE_DEFAULT, "Failed to set Touch ID for purchases", v6, 2u);
    }

  }
  objc_msgSend(WeakRetained, "setCurrentlyEnablingTouchIDForPurchases:", 0);
  objc_msgSend(WeakRetained, "updateStoreBiometricsState");
  objc_msgSend(WeakRetained, "reloadSpecifierID:animated:", CFSTR("TOUCHID_PURCHASES"), 1);
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(WeakRetained, "isTouchIDForPurchasesRestricted") ^ 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v5, *MEMORY[0x24BE75A18]);

}

- (BOOL)isTouchIDForPurchasesRestricted
{
  void *v3;
  int v4;
  BOOL v5;
  void *v6;
  char v7;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63770]);

  if (-[PSUIBiometricController storeState](self, "storeState") == 4)
    return 1;
  +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldRestrictFeaturesRequiringEnrollment");
  if (v4 == 1)
    v5 = v7;
  else
    v5 = 1;

  return v5;
}

- (void)updateTouchIDForPurchasesSpecifier
{
  void *v3;
  id v4;

  -[PSUIBiometricController updateStoreBiometricsState](self, "updateStoreBiometricsState");
  -[PSUIBiometricController specifierForID:](self, "specifierForID:", CFSTR("TOUCHID_PURCHASES"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PSUIBiometricController isTouchIDForPurchasesRestricted](self, "isTouchIDForPurchasesRestricted") ^ 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v3, *MEMORY[0x24BE75A18]);

  -[PSUIBiometricController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v4, 1);
}

- (id)isTouchIDForStockholmEnabled:(id)a3
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63938]);

  v5 = (void *)MEMORY[0x24BDD16E0];
  if (v4 == 1)
  {
    +[PSUIPasscode sharedInstance](PSUIPasscode, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isPasscodeSet") & 1) != 0)
    {
      +[PSUIBiometrics identities](PSUIBiometrics, "identities");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "numberWithBool:", objc_msgSend(v7, "count") != 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v5, "numberWithBool:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (void)setTouchIDForStockholmEnabled:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  PSUILogForCategory(1uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl(&dword_22E0C8000, v8, OS_LOG_TYPE_DEFAULT, "Using biometric for Wallet & Apple Pay: User toggled to %@", buf, 0xCu);
  }

  if ((objc_msgSend(v6, "BOOLValue") & 1) != 0)
  {
    -[PSUIBiometricController proceedTouchIDForStockholmEnabled:specifier:](self, "proceedTouchIDForStockholmEnabled:specifier:", v6, v7);
  }
  else
  {
    -[PSUIBiometricController dtoController](self, "dtoController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isRatchetEnabled");

    if (v10)
    {
      objc_initWeak((id *)buf, self);
      -[PSUIBiometricController dtoController](self, "dtoController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __67__PSUIBiometricController_setTouchIDForStockholmEnabled_specifier___block_invoke;
      v12[3] = &unk_24F9E3AE0;
      objc_copyWeak(&v15, (id *)buf);
      v13 = v7;
      v14 = v6;
      objc_msgSend(v11, "gateWithRatchetForOperation:forPresentingVC:completion:", 8, self, v12);

      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      -[PSUIBiometricController presentConfirmationAndProceedTouchIDForStockholmEnabled:specifier:](self, "presentConfirmationAndProceedTouchIDForStockholmEnabled:specifier:", v6, v7);
    }
  }

}

void __67__PSUIBiometricController_setTouchIDForStockholmEnabled_specifier___block_invoke(id *a1, void *a2)
{
  _QWORD v4[4];
  id v5;
  id v6;
  id v7[2];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __67__PSUIBiometricController_setTouchIDForStockholmEnabled_specifier___block_invoke_2;
  v4[3] = &unk_24F9E3AB8;
  objc_copyWeak(v7, a1 + 6);
  v7[1] = a2;
  v5 = a1[4];
  v6 = a1[5];
  dispatch_async(MEMORY[0x24BDAC9B8], v4);

  objc_destroyWeak(v7);
}

void __67__PSUIBiometricController_setTouchIDForStockholmEnabled_specifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*(_QWORD *)(a1 + 56) == 2)
  {
    PSUILogForCategory(1uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __67__PSUIBiometricController_setTouchIDForStockholmEnabled_specifier___block_invoke_2_cold_1();

    objc_msgSend(WeakRetained, "reloadSpecifier:animated:", *(_QWORD *)(a1 + 32), 1);
  }
  else
  {
    PSUILogForCategory(1uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (WeakRetained)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_22E0C8000, v5, OS_LOG_TYPE_DEFAULT, "Using biometric for Wallet & Apple Pay: Toggling to Off ", v6, 2u);
      }

      objc_msgSend(WeakRetained, "presentConfirmationAndProceedTouchIDForStockholmEnabled:specifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __67__PSUIBiometricController_setTouchIDForStockholmEnabled_specifier___block_invoke_2_cold_2();

    }
  }

}

- (void)presentConfirmationAndProceedTouchIDForStockholmEnabled:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;

  v6 = a3;
  v7 = a4;
  PSLocalizableStockholmStringForKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PSLocalizableStockholmStringForKey();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  if (v11 == 6 || (PSIsPearlAvailable() & 1) != 0 || PSSupportsMesa())
  {
    PSLocalizableStockholmStringForKey();
    v12 = objc_claimAutoreleasedReturnValue();

    PSLocalizableStockholmStringForKey();
    v13 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v13;
    v8 = (void *)v12;
  }
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v8, v9, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BEBD3A8];
  PSLocalizableMesaStringForKey();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __93__PSUIBiometricController_presentConfirmationAndProceedTouchIDForStockholmEnabled_specifier___block_invoke;
  v28[3] = &unk_24F9E3B08;
  v28[4] = self;
  v18 = v7;
  v29 = v18;
  objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 1, v28);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v19);

  v20 = (void *)MEMORY[0x24BEBD3A8];
  PSLocalizableMesaStringForKey();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v17;
  v25[1] = 3221225472;
  v25[2] = __93__PSUIBiometricController_presentConfirmationAndProceedTouchIDForStockholmEnabled_specifier___block_invoke_2;
  v25[3] = &unk_24F9E3B30;
  v25[4] = self;
  v26 = v6;
  v27 = v18;
  v22 = v18;
  v23 = v6;
  objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 2, v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v24);

  -[PSUIBiometricController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
}

uint64_t __93__PSUIBiometricController_presentConfirmationAndProceedTouchIDForStockholmEnabled_specifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:animated:", *(_QWORD *)(a1 + 40), 1);
}

uint64_t __93__PSUIBiometricController_presentConfirmationAndProceedTouchIDForStockholmEnabled_specifier___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "proceedTouchIDForStockholmEnabled:specifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)proceedTouchIDForStockholmEnabled:(id)a3 specifier:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;

  v5 = a3;
  -[PSUIBiometricController specifier](self, "specifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    PSUILogForCategory(1uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[PSUIBiometricController proceedTouchIDForStockholmEnabled:specifier:].cold.2();

  }
  -[PSUIBiometricController specifier](self, "specifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "propertyForKey:", *MEMORY[0x24BE75CC0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    PSUILogForCategory(1uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[PSUIBiometricController proceedTouchIDForStockholmEnabled:specifier:].cold.1();

  }
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __71__PSUIBiometricController_proceedTouchIDForStockholmEnabled_specifier___block_invoke;
  v17 = &unk_24F9E39A0;
  v18 = v5;
  v19 = v9;
  v11 = v9;
  v12 = v5;
  v13 = _Block_copy(&v14);
  -[PSUIBiometricController addEnrollmentOrCreatePasscodeIfNecessaryWithCompletion:](self, "addEnrollmentOrCreatePasscodeIfNecessaryWithCompletion:", v13, v14, v15, v16, v17);

}

void __71__PSUIBiometricController_proceedTouchIDForStockholmEnabled_specifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(*(id *)(a1 + 32), "BOOLValue");
  objc_msgSend(v3, "setBoolValue:forSetting:passcode:", v2, *MEMORY[0x24BE63938], *(_QWORD *)(a1 + 40));

}

- (BOOL)isTouchIDForStockholmRestricted
{
  void *v2;
  char v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isBoolSettingLockedDownByRestrictions:", *MEMORY[0x24BE63938]) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "shouldRestrictFeaturesRequiringEnrollment");

  }
  return v3;
}

- (void)updateTouchIDForStockholmSpecifier
{
  void *v3;
  id v4;

  -[PSUIBiometricController specifierForID:](self, "specifierForID:", CFSTR("TOUCHID_STOCKHOLM"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PSUIBiometricController isTouchIDForStockholmRestricted](self, "isTouchIDForStockholmRestricted") ^ 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setProperty:forKey:", v3, *MEMORY[0x24BE75A18]);

    -[PSUIBiometricController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v4, 1);
  }

}

- (BOOL)isBiometricEditingAllowed
{
  void *v2;
  char v3;

  +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBiometricEditingAllowed");

  return v3;
}

- (BOOL)isEnrollmentAvailable
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  BOOL v8;

  if (PSIsPearlAvailable())
  {
    +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = 2;
LABEL_5:
    v6 = objc_msgSend(v3, "maximumIdentityCountForIdentityType:", v5);

    goto LABEL_7;
  }
  if (PSSupportsMesa())
  {
    +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = 1;
    goto LABEL_5;
  }
  v6 = 0;
LABEL_7:
  +[PSUIBiometrics identities](PSUIBiometrics, "identities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count") < v6
    && -[PSUIBiometricController isBiometricEditingAllowed](self, "isBiometricEditingAllowed");

  return v8;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[PSUIBiometricController specifierAtIndex:](self, "specifierAtIndex:", -[PSUIBiometricController indexForIndexPath:](self, "indexForIndexPath:", a4));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BE75A18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = !v6 || objc_msgSend(v6, "BOOLValue");
  return v7;
}

- (id)placardSpecifier
{
  void *v2;

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24F9E4F80, self, 0, 0, 0, 4, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", NSClassFromString(CFSTR("PreferencesUI.PasscodePlacardCell")), *MEMORY[0x24BE75948]);
  objc_msgSend(v2, "setIdentifier:", CFSTR("PRIVACY_PLACARD"));
  return v2;
}

- (id)biometricLogo
{
  __assert_rtn("-[PSUIBiometricController biometricLogo]", "PSUIBiometricController.m", 607, "0");
}

- (id)biometricTableViewHeader
{
  void *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  void *v7;

  -[PSUIBiometricController biometricLogo](self, "biometricLogo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x24BEBD668]);
  objc_msgSend(v2, "size");
  v5 = v4;
  objc_msgSend(v2, "size");
  v7 = (void *)objc_msgSend(v3, "initWithFrame:", 0.0, 0.0, v5, v6 + 45.0);
  objc_msgSend(v7, "setImage:", v2);
  objc_msgSend(v7, "setContentMode:", 6);

  return v7;
}

- (void)setupBiometricLogoHeader
{
  void *v3;
  id v4;

  -[PSUIBiometricController biometricTableViewHeader](self, "biometricTableViewHeader");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PSUIBiometricController table](self, "table");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTableHeaderView:", v4);

}

- (id)headerForUseBiometricSection
{
  return &stru_24F9E4F80;
}

- (id)biometricNameDescription
{
  return &stru_24F9E4F80;
}

- (id)useBiometricForSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v49;
  void *v50;
  uint64_t v51;
  _QWORD v52[5];
  id v53;
  char v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", CFSTR("TOUCHID_SETTINGS"));
  -[PSUIBiometricController headerForUseBiometricSection](self, "headerForUseBiometricSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v5);

  objc_msgSend(v3, "addObject:", v4);
  if (PSIsPearlInterlocked())
  {
    +[PSUIBiometrics identities](PSUIBiometrics, "identities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count") != 0;

  }
  else
  {
    v7 = 1;
  }
  v8 = (void *)MEMORY[0x24BE75590];
  PSLocalizableMesaStringForKey();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, sel_setBiometricUnlockEnabled_specifier_, sel_isTouchIDUnlockEnabled_, 0, 6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *MEMORY[0x24BE75AC0];
  v51 = *MEMORY[0x24BE75AC0];
  objc_msgSend(v10, "setProperty:forKey:", CFSTR("TOUCHID_UNLOCK"), *MEMORY[0x24BE75AC0]);
  v12 = (void *)MEMORY[0x24BDD16E0];
  +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithInt:", v7 & ~objc_msgSend(v13, "isTouchIDUnlockRestricted"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x24BE75A18];
  objc_msgSend(v10, "setProperty:forKey:", v14, *MEMORY[0x24BE75A18]);

  v50 = v10;
  v16 = v10;
  v17 = v3;
  objc_msgSend(v3, "addObject:", v16);
  -[PSUIBiometricController updateStoreBiometricsState](self, "updateStoreBiometricsState");
  v18 = (void *)MEMORY[0x24BE75590];
  PSLocalizableMesaStringForKey();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v19, self, sel_setTouchIDForPurchasesEnabled_specifier_, sel_isTouchIDForPurchasesEnabled_, 0, 6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setProperty:forKey:", CFSTR("TOUCHID_PURCHASES"), v11);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v7 & ~-[PSUIBiometricController isTouchIDForPurchasesRestricted](self, "isTouchIDForPurchasesRestricted"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setProperty:forKey:", v21, v15);

  objc_msgSend(v17, "addObject:", v20);
  if (MGGetBoolAnswer())
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "BOOLForKey:", CFSTR("showPassbookRow"));

    v61 = 0;
    v62 = &v61;
    v63 = 0x2050000000;
    v31 = (void *)getPKWalletVisibilityClass_softClass;
    v64 = getPKWalletVisibilityClass_softClass;
    if (!getPKWalletVisibilityClass_softClass)
    {
      v56 = MEMORY[0x24BDAC760];
      v57 = 3221225472;
      v58 = __getPKWalletVisibilityClass_block_invoke;
      v59 = &unk_24F9E3C20;
      v60 = &v61;
      __getPKWalletVisibilityClass_block_invoke((uint64_t)&v56, v24, v25, v26, v27, v28, v29, v30, 0);
      v31 = (void *)v62[3];
    }
    v49 = v4;
    v32 = objc_retainAutorelease(v31);
    _Block_object_dispose(&v61, 8);
    v33 = objc_msgSend(v32, "isWalletVisible");
    v34 = (void *)MEMORY[0x24BE75590];
    PSLocalizableStockholmStringForKey();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v35, self, sel_setTouchIDForStockholmEnabled_specifier_, sel_isTouchIDForStockholmEnabled_, 0, 6, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "setProperty:forKey:", CFSTR("TOUCHID_STOCKHOLM"), v51);
    objc_msgSend(v36, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v7 & ~-[PSUIBiometricController isTouchIDForStockholmRestricted](self, "isTouchIDForStockholmRestricted"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setProperty:forKey:", v37, v15);

    if ((v23 & v33) == 1)
    {
      objc_msgSend(v17, "addObject:", v36);
    }
    else
    {
      v38 = PSHasStockholmPass();
      v61 = 0;
      v62 = &v61;
      v63 = 0x2050000000;
      v39 = (void *)getPKPaymentRegistrationUtilitiesClass_softClass;
      v64 = getPKPaymentRegistrationUtilitiesClass_softClass;
      if (!getPKPaymentRegistrationUtilitiesClass_softClass)
      {
        v56 = MEMORY[0x24BDAC760];
        v57 = 3221225472;
        v58 = __getPKPaymentRegistrationUtilitiesClass_block_invoke;
        v59 = &unk_24F9E3C20;
        v60 = &v61;
        __getPKPaymentRegistrationUtilitiesClass_block_invoke((uint64_t)&v56);
        v39 = (void *)v62[3];
      }
      v40 = objc_retainAutorelease(v39);
      _Block_object_dispose(&v61, 8);
      v61 = 0;
      v62 = &v61;
      v63 = 0x2050000000;
      v41 = (void *)getPKPaymentWebServiceClass_softClass;
      v64 = getPKPaymentWebServiceClass_softClass;
      if (!getPKPaymentWebServiceClass_softClass)
      {
        v56 = MEMORY[0x24BDAC760];
        v57 = 3221225472;
        v58 = __getPKPaymentWebServiceClass_block_invoke;
        v59 = &unk_24F9E3C20;
        v60 = &v61;
        __getPKPaymentWebServiceClass_block_invoke((uint64_t)&v56);
        v41 = (void *)v62[3];
      }
      v42 = objc_retainAutorelease(v41);
      _Block_object_dispose(&v61, 8);
      objc_msgSend(v42, "sharedService");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = MEMORY[0x24BDAC760];
      v52[1] = 3221225472;
      v52[2] = __52__PSUIBiometricController_useBiometricForSpecifiers__block_invoke;
      v52[3] = &unk_24F9E3B80;
      v54 = v38;
      v55 = v33;
      v52[4] = self;
      v53 = v36;
      objc_msgSend(v40, "shouldShowWalletInSettingsWithApplePaySupportInformation:completion:", v43, v52);

    }
    v4 = v49;
  }
  v44 = (void *)MEMORY[0x24BE75590];
  PSLocalizableMesaStringForKey();
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v45, self, sel_setSafariAutoFillEnabled_specifier_, sel_safariAutoFillEnabled_, 0, 6, 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v46, "setProperty:forKey:", CFSTR("TOUCHID_SAFARI_AUTOFILL"), v51);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v7 & ~-[PSUIBiometricController isSafariAutofillRestricted](self, "isSafariAutofillRestricted"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setProperty:forKey:", v47, v15);

  objc_msgSend(v17, "addObject:", v46);
  return v17;
}

void __52__PSUIBiometricController_useBiometricForSpecifiers__block_invoke(uint64_t a1, char a2, char a3)
{
  _BOOL8 v5;
  void *v6;
  void *v7;
  _QWORD block[5];
  id v9;
  char v10;

  v5 = (a3 & 1) != 0 || *(_BYTE *)(a1 + 48) || *(_BYTE *)(a1 + 49) != 0;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBool:forKey:", v5, CFSTR("showPassbookRow"));

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__PSUIBiometricController_useBiometricForSpecifiers__block_invoke_2;
  block[3] = &unk_24F9E3B58;
  v10 = a2;
  v7 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __52__PSUIBiometricController_useBiometricForSpecifiers__block_invoke_2(uint64_t a1)
{
  void *v2;

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "specifierForID:", CFSTR("TOUCHID_STOCKHOLM"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
      objc_msgSend(*(id *)(a1 + 32), "insertSpecifier:afterSpecifierID:animated:", *(_QWORD *)(a1 + 40), CFSTR("TOUCHID_UNLOCK"), 1);
  }
}

+ (BOOL)shouldPresentInModalSheet
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sf_isiPad");

  return v3;
}

- (void)presentSheetForContentViewController:(id)a3
{
  -[PSUIBiometricController presentSheetForContentViewController:completion:](self, "presentSheetForContentViewController:completion:", a3, 0);
}

- (void)presentSheetForContentViewController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "setModalPresentationStyle:", 2);
  objc_msgSend(MEMORY[0x24BE6E3E0], "preferredContentSize");
  objc_msgSend(v7, "setPreferredContentSize:");
  -[PSUIBiometricController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, v6);

}

- (void)enrollBiometric
{
  __assert_rtn("-[PSUIBiometricController enrollBiometric]", "PSUIBiometricController.m", 741, "0");
}

- (void)pushPasscodePane
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
  _QWORD v12[5];

  -[PSUIBiometricController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBarStyle:", 0);

  objc_msgSend(v3, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  objc_msgSend(v5, "setShadowImage:", v6);

  objc_msgSend(v3, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setHidesShadow:", 0);

  if (-[PSUIPasscodeLockController shouldUseLocalAuthenticationBasedPasscodeFlowForChangePasscodeRequests](self, "shouldUseLocalAuthenticationBasedPasscodeFlowForChangePasscodeRequests"))
  {
    PSUI_LocalizedStringForPasscodeLock(CFSTR("PMSET"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PSUI_LocalizedStringForPasscodeLock(CFSTR("ENTER_PASSCODE_PROMPT_TOUCH_ID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __43__PSUIBiometricController_pushPasscodePane__block_invoke;
    v12[3] = &unk_24F9E3BA8;
    v12[4] = self;
    -[PSUIPasscodeLockController showLocalAuthenticationPasscodeChangeFlowFromPresentingController:title:passcodePrompt:withCompletion:](self, "showLocalAuthenticationPasscodeChangeFlowFromPresentingController:title:passcodePrompt:withCompletion:", v3, v8, v9, v12);

  }
  else
  {
    -[PSUIBiometricController specifierAtIndex:](self, "specifierAtIndex:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIBiometricController _passcodeControllerForSpecifier:](self, "_passcodeControllerForSpecifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "preferredContentSize");
    objc_msgSend(v3, "setPreferredContentSize:");
    objc_msgSend(v3, "pushViewController:animated:", v11, 1);

  }
}

uint64_t __43__PSUIBiometricController_pushPasscodePane__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "cancelModalFlowWithCompletion:", 0);
  else
    return objc_msgSend(v2, "completeModalFlow");
}

- (void)presentPasscodePaneFromSpecifier:(id)a3
{
  PSEnrollmentNavigationController *v4;
  id v5;

  -[PSUIBiometricController _passcodeControllerForSpecifier:](self, "_passcodeControllerForSpecifier:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[PSEnrollmentNavigationController initWithRootViewController:]([PSEnrollmentNavigationController alloc], "initWithRootViewController:", v5);
  -[PSEnrollmentNavigationController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 2);
  -[PSEnrollmentNavigationController setModalInPresentation:](v4, "setModalInPresentation:", 1);
  -[PSUIBiometricController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (id)_passcodeControllerForSpecifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char *v7;
  void *v8;

  v4 = a3;
  -[PSUIBiometricController passcodeController](self, "passcodeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMode:", 0);
  objc_msgSend(v5, "setPinDelegate:", self);
  objc_msgSend(v5, "setSpecifier:", v4);

  v6 = objc_opt_class();
  objc_msgSend(v5, "specifier");
  v7 = (char *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v7[*MEMORY[0x24BE75748]] = v6;

  objc_msgSend(v5, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidesBackButton:", 1);

  return v5;
}

- (id)passcodeController
{
  return objc_alloc_init(PSBiometricPINController);
}

- (void)hideCancelButton
{
  int v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_msgSend((id)objc_opt_class(), "shouldPresentInModalSheet");
  -[PSUIBiometricController enrollContainerController](self, "enrollContainerController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "setLeftBarButtonItem:animated:", 0, 1);
  else
    objc_msgSend(v4, "setRightBarButtonItem:animated:", 0, 1);

}

- (void)enrollmentCompletedForIdentity:(id)a3
{
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v3 = PSIsPearlAvailable();
  +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = 2;
  else
    v6 = 1;
  objc_msgSend(v4, "nextIdentityNameForIdentityType:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    -[PSUIBiometricController enrollmentCompletedForIdentity:].cold.1();
  +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setName:forIdentity:completion:", v7, v9, 0);

}

- (void)completeModalFlow
{
  void *v3;
  void (**v4)(void);

  -[PSUIBiometricController setCurrentlyEnablingTouchIDForPurchases:](self, "setCurrentlyEnablingTouchIDForPurchases:", 0);
  -[PSUIBiometricController modalFlowSuccessCompletion](self, "modalFlowSuccessCompletion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PSUIBiometricController modalFlowSuccessCompletion](self, "modalFlowSuccessCompletion");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
  -[PSUIBiometricController setModalFlowSuccessCompletion:](self, "setModalFlowSuccessCompletion:", 0);
  -[PSUIBiometricController setModalFlowCancelCompletion:](self, "setModalFlowCancelCompletion:", 0);
  -[PSUIBiometricController _popEnrollmentControllerWithCompletion:](self, "_popEnrollmentControllerWithCompletion:", 0);
}

- (void)cancelModalFlowWithCompletion:(id)a3
{
  void *v4;
  void (**v5)(void);
  id v6;

  v6 = a3;
  -[PSUIBiometricController setCurrentlyEnablingTouchIDForPurchases:](self, "setCurrentlyEnablingTouchIDForPurchases:", 0);
  -[PSUIBiometricController modalFlowCancelCompletion](self, "modalFlowCancelCompletion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PSUIBiometricController modalFlowCancelCompletion](self, "modalFlowCancelCompletion");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
  -[PSUIBiometricController setModalFlowCancelCompletion:](self, "setModalFlowCancelCompletion:", 0);
  -[PSUIBiometricController setModalFlowSuccessCompletion:](self, "setModalFlowSuccessCompletion:", 0);
  -[PSUIBiometricController _popEnrollmentControllerWithCompletion:](self, "_popEnrollmentControllerWithCompletion:", v6);

}

- (void)_popEnrollmentControllerWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[PSUIBiometricController reloadSpecifiers](self, "reloadSpecifiers");
  -[PSUIBiometricController setEnrollContainerController:](self, "setEnrollContainerController:", 0);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __66__PSUIBiometricController__popEnrollmentControllerWithCompletion___block_invoke;
  v6[3] = &unk_24F9E3BD0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PSUIBiometricController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v6);

}

uint64_t __66__PSUIBiometricController__popEnrollmentControllerWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "enrollmentControllerDidDismiss");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)devicePINController:(id)a3 didAcceptSetPIN:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSUIBiometricController;
  -[PSUIPasscodeLockController devicePINController:didAcceptSetPIN:](&v5, sel_devicePINController_didAcceptSetPIN_, a3, a4);
  -[PSUIBiometricController completeModalFlow](self, "completeModalFlow");
}

- (void)didCancelEnteringPIN
{
  -[PSUIBiometricController cancelModalFlowWithCompletion:](self, "cancelModalFlowWithCompletion:", 0);
}

- (BOOL)isSafariAutofillRestricted
{
  void *v2;
  char v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isBoolSettingLockedDownByRestrictions:", *MEMORY[0x24BE637F0]) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "shouldRestrictFeaturesRequiringEnrollment");

  }
  return v3;
}

- (id)safariAutoFillEnabled:(id)a3
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAuthenticationBeforeAutoFillRequired");

  v5 = (void *)MEMORY[0x24BDD16E0];
  if (v4)
  {
    +[PSUIPasscode sharedInstance](PSUIPasscode, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isPasscodeSet") & 1) != 0)
    {
      +[PSUIBiometrics identities](PSUIBiometrics, "identities");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "numberWithInt:", objc_msgSend(v7, "count") != 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v5, "numberWithInt:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (void)setSafariAutoFillEnabled:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  PSUILogForCategory(1uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v6;
    _os_log_impl(&dword_22E0C8000, v8, OS_LOG_TYPE_DEFAULT, "Using biometric for Password AutoFill: User toggled to %@", buf, 0xCu);
  }

  if ((objc_msgSend(v6, "BOOLValue") & 1) != 0)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __62__PSUIBiometricController_setSafariAutoFillEnabled_specifier___block_invoke_2_158;
    v12[3] = &unk_24F9E3BF8;
    v13 = v6;
    -[PSUIBiometricController addEnrollmentOrCreatePasscodeIfNecessaryWithCompletion:](self, "addEnrollmentOrCreatePasscodeIfNecessaryWithCompletion:", v12);

  }
  else
  {
    -[PSUIBiometricController dtoController](self, "dtoController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isRatchetEnabled");

    if (v10)
    {
      objc_initWeak((id *)buf, self);
      -[PSUIBiometricController dtoController](self, "dtoController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __62__PSUIBiometricController_setSafariAutoFillEnabled_specifier___block_invoke;
      v16[3] = &unk_24F9E3AE0;
      objc_copyWeak(&v19, (id *)buf);
      v17 = v7;
      v18 = v6;
      objc_msgSend(v11, "gateWithRatchetForOperation:forPresentingVC:completion:", 9, self, v16);

      objc_destroyWeak(&v19);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __62__PSUIBiometricController_setSafariAutoFillEnabled_specifier___block_invoke_157;
      v14[3] = &unk_24F9E3BF8;
      v15 = v6;
      -[PSUIBiometricController addEnrollmentOrCreatePasscodeIfNecessaryWithCompletion:](self, "addEnrollmentOrCreatePasscodeIfNecessaryWithCompletion:", v14);

    }
  }

}

void __62__PSUIBiometricController_setSafariAutoFillEnabled_specifier___block_invoke(id *a1, void *a2)
{
  _QWORD v4[4];
  id v5;
  id v6;
  id v7[2];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __62__PSUIBiometricController_setSafariAutoFillEnabled_specifier___block_invoke_2;
  v4[3] = &unk_24F9E3AB8;
  objc_copyWeak(v7, a1 + 6);
  v7[1] = a2;
  v5 = a1[4];
  v6 = a1[5];
  dispatch_async(MEMORY[0x24BDAC9B8], v4);

  objc_destroyWeak(v7);
}

void __62__PSUIBiometricController_setSafariAutoFillEnabled_specifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*(_QWORD *)(a1 + 56) == 2)
  {
    PSUILogForCategory(1uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __62__PSUIBiometricController_setSafariAutoFillEnabled_specifier___block_invoke_2_cold_1();

    objc_msgSend(WeakRetained, "reloadSpecifier:animated:", *(_QWORD *)(a1 + 32), 1);
  }
  else
  {
    PSUILogForCategory(1uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (WeakRetained)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22E0C8000, v5, OS_LOG_TYPE_DEFAULT, "Using biometric for Password AutoFill: Toggling to Off ", buf, 2u);
      }

      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __62__PSUIBiometricController_setSafariAutoFillEnabled_specifier___block_invoke_156;
      v6[3] = &unk_24F9E3BF8;
      v7 = *(id *)(a1 + 40);
      objc_msgSend(WeakRetained, "addEnrollmentOrCreatePasscodeIfNecessaryWithCompletion:", v6);

    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __62__PSUIBiometricController_setSafariAutoFillEnabled_specifier___block_invoke_2_cold_2();

    }
  }

}

void __62__PSUIBiometricController_setSafariAutoFillEnabled_specifier___block_invoke_156(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(*(id *)(a1 + 32), "BOOLValue");
  objc_msgSend(v3, "setBoolValue:forSetting:", v2, *MEMORY[0x24BE637F0]);

}

void __62__PSUIBiometricController_setSafariAutoFillEnabled_specifier___block_invoke_157(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(*(id *)(a1 + 32), "BOOLValue");
  objc_msgSend(v3, "setBoolValue:forSetting:", v2, *MEMORY[0x24BE637F0]);

}

void __62__PSUIBiometricController_setSafariAutoFillEnabled_specifier___block_invoke_2_158(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(*(id *)(a1 + 32), "BOOLValue");
  objc_msgSend(v3, "setBoolValue:forSetting:", v2, *MEMORY[0x24BE637F0]);

}

- (int64_t)storeState
{
  return self->_storeState;
}

- (id)modalFlowSuccessCompletion
{
  return self->_modalFlowSuccessCompletion;
}

- (void)setModalFlowSuccessCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1480);
}

- (id)modalFlowCancelCompletion
{
  return self->_modalFlowCancelCompletion;
}

- (void)setModalFlowCancelCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1488);
}

- (BOOL)currentlyEnablingTouchIDForPurchases
{
  return self->_currentlyEnablingTouchIDForPurchases;
}

- (void)setCurrentlyEnablingTouchIDForPurchases:(BOOL)a3
{
  self->_currentlyEnablingTouchIDForPurchases = a3;
}

- (NSArray)storedBiometricTemplates
{
  return self->_storedBiometricTemplates;
}

- (void)setStoredBiometricTemplates:(id)a3
{
  objc_storeStrong((id *)&self->_storedBiometricTemplates, a3);
}

- (unint64_t)currentBiometricTemplateFetchStatus
{
  return self->_currentBiometricTemplateFetchStatus;
}

- (BOOL)isObservingBiometricTemplateFetchingStatus
{
  return self->_isObservingBiometricTemplateFetchingStatus;
}

- (void)setIsObservingBiometricTemplateFetchingStatus:(BOOL)a3
{
  self->_isObservingBiometricTemplateFetchingStatus = a3;
}

- (void)set_biometricBindingFlowManager:(id)a3
{
  objc_storeStrong((id *)&self->__biometricBindingFlowManager, a3);
}

- (PSUIDeviceTakeOverController)dtoController
{
  return self->_dtoController;
}

- (void)setDtoController:(id)a3
{
  objc_storeStrong((id *)&self->_dtoController, a3);
}

- (PSEnrollContainerViewController)enrollContainerController
{
  return (PSEnrollContainerViewController *)objc_loadWeakRetained((id *)&self->_enrollContainerController);
}

- (void)setEnrollContainerController:(id)a3
{
  objc_storeWeak((id *)&self->_enrollContainerController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_enrollContainerController);
  objc_storeStrong((id *)&self->_dtoController, 0);
  objc_storeStrong((id *)&self->__biometricBindingFlowManager, 0);
  objc_storeStrong((id *)&self->_storedBiometricTemplates, 0);
  objc_storeStrong(&self->_modalFlowCancelCompletion, 0);
  objc_storeStrong(&self->_modalFlowSuccessCompletion, 0);
}

void __69__PSUIBiometricController_fetchBiometricTemplateUUIDsWithCompletion___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_22E0C8000, a2, OS_LOG_TYPE_ERROR, "Failed fetching biometric template UUIDs with error: %@", (uint8_t *)&v3, 0xCu);
}

void __46__PSUIBiometricController_deleteGlobalAuthACL__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[PSUIBiometricController deleteGlobalAuthACL]_block_invoke_2";
  v4 = 2114;
  v5 = a1;
  _os_log_error_impl(&dword_22E0C8000, a2, OS_LOG_TYPE_ERROR, "%s: Encountered error '%{public}@'", (uint8_t *)&v2, 0x16u);
}

void __63__PSUIBiometricController_setBiometricUnlockEnabled_specifier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "setBiometricUnlockEnabled: No passcode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __63__PSUIBiometricController_setBiometricUnlockEnabled_specifier___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "setBiometricUnlockEnabled: No specifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)authorizationToken
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "authorizationToken: No specifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __67__PSUIBiometricController_setTouchIDForStockholmEnabled_specifier___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "Using biometric for Wallet & Apple Pay: Not toggling to Off as we are Ratcheted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __67__PSUIBiometricController_setTouchIDForStockholmEnabled_specifier___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "Using biometric for Wallet & Apple Pay: Not toggling to Off as we are are missing instance (self)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)proceedTouchIDForStockholmEnabled:specifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "proceedTouchIDForStockholmEnabled: No passcode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)proceedTouchIDForStockholmEnabled:specifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "proceedTouchIDForStockholmEnabled: No specifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)enrollmentCompletedForIdentity:.cold.1()
{
  __assert_rtn("-[PSUIBiometricController enrollmentCompletedForIdentity:]", "PSUIBiometricController.m", 816, "nextIdentityName");
}

void __62__PSUIBiometricController_setSafariAutoFillEnabled_specifier___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "Using biometric for Password AutoFill: Not toggling to Off as we are Ratcheted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __62__PSUIBiometricController_setSafariAutoFillEnabled_specifier___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "Using biometric for Password AutoFill: Not toggling to Off as we are are missing instance (self)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
