@implementation PSUIDeviceTakeOverController

- (void)dealloc
{
  LAContext *laContext;
  objc_super v4;

  laContext = self->_laContext;
  if (laContext)
    -[LAContext invalidate](laContext, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)PSUIDeviceTakeOverController;
  -[PSUIDeviceTakeOverController dealloc](&v4, sel_dealloc);
}

+ (BOOL)isRatchetFeatureAvailable
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sf_isiPhone");

  v4 = _os_feature_enabled_impl();
  v5 = v3 & v4;
  PSUILogForCategory(1uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_22E0C8000, v6, OS_LOG_TYPE_DEFAULT, "Ratchet: %@ [isPhone: %@, FeatureEnabled: %@]", (uint8_t *)&v11, 0x20u);

  }
  return v5;
}

- (BOOL)isRatchetEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDDA950], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFeatureEnabled");

  return v3;
}

- (BOOL)isStrictModeEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDDA950], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFeatureStrictModeEnabled");

  return v3;
}

- (void)toggleToStrictMode:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDDA950], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __66__PSUIDeviceTakeOverController_toggleToStrictMode_withCompletion___block_invoke;
    v14[3] = &unk_24F9E3CD8;
    v8 = &v15;
    v15 = v6;
    v9 = v6;
    objc_msgSend(v7, "enableFeatureStrictModeWithCompletion:", v14);
  }
  else
  {
    -[PSUIDeviceTakeOverController laContext](self, "laContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __66__PSUIDeviceTakeOverController_toggleToStrictMode_withCompletion___block_invoke_6;
    v12[3] = &unk_24F9E3CD8;
    v8 = &v13;
    v13 = v6;
    v11 = v6;
    objc_msgSend(v7, "disableFeatureStrictModeWithContext:completion:", v10, v12);

  }
}

void __66__PSUIDeviceTakeOverController_toggleToStrictMode_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  __CFString *v5;
  int v6;
  __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  PSUILogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (v3)
    {
      objc_msgSend(v3, "description");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = CFSTR("Succeeded");
    }
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_22E0C8000, v4, OS_LOG_TYPE_DEFAULT, "Ratchet: Turn on Strict Mode - %@", (uint8_t *)&v6, 0xCu);
    if (v3)

  }
  (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v3 == 0);

}

void __66__PSUIDeviceTakeOverController_toggleToStrictMode_withCompletion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  __CFString *v5;
  int v6;
  __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  PSUILogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (v3)
    {
      objc_msgSend(v3, "description");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = CFSTR("Succeeded");
    }
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_22E0C8000, v4, OS_LOG_TYPE_DEFAULT, "Ratchet: Turn off Strict Mode - %@", (uint8_t *)&v6, 0xCu);
    if (v3)

  }
  (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v3 == 0);

}

- (void)gateWithRatchetForOperation:(unint64_t)a3 forPresentingVC:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _BOOL4 v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = -[PSUIDeviceTakeOverController canGateOperation:](self, "canGateOperation:", a3);
  PSUILogForCategory(1uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v21 = a3;
      _os_log_impl(&dword_22E0C8000, v12, OS_LOG_TYPE_DEFAULT, "Ratchet: Performing gating check for identifier: %lu", buf, 0xCu);
    }

    v13 = objc_alloc(MEMORY[0x24BDDA948]);
    -[PSUIDeviceTakeOverController getOperationNameForIdentifier:](self, "getOperationNameForIdentifier:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithIdentifier:", v14);

    objc_initWeak((id *)buf, self);
    -[PSUIDeviceTakeOverController getArmingOptionsDictionaryForIdentifier:](self, "getArmingOptionsDictionaryForIdentifier:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __87__PSUIDeviceTakeOverController_gateWithRatchetForOperation_forPresentingVC_completion___block_invoke;
    v17[3] = &unk_24F9E3D00;
    objc_copyWeak(&v19, (id *)buf);
    v18 = v9;
    objc_msgSend(v15, "armWithOptions:completion:", v16, v17);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PSUIDeviceTakeOverController gateWithRatchetForOperation:forPresentingVC:completion:].cold.1();

    (*((void (**)(id, uint64_t))v9 + 2))(v9, 2);
    -[PSUIDeviceTakeOverController showAlertForFailureToGateForOperation:forPresentingVC:](self, "showAlertForFailureToGateForOperation:forPresentingVC:", a3, v8);
  }

}

void __87__PSUIDeviceTakeOverController_gateWithRatchetForOperation_forPresentingVC_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  void (*v11)(void);
  NSObject *v12;
  NSObject *v13;
  uint8_t v14[16];

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_24F9EB9B8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v9 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "setLaContext:", v7);
      PSUILogForCategory(1uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_22E0C8000, v10, OS_LOG_TYPE_DEFAULT, "Ratchet: Proceeding to perform critical operation as gating was successful", v14, 2u);
      }

      v11 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    else
    {
      PSUILogForCategory(1uLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __87__PSUIDeviceTakeOverController_gateWithRatchetForOperation_forPresentingVC_completion___block_invoke_cold_2();

      v11 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    v11();

  }
  else
  {
    PSUILogForCategory(1uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __87__PSUIDeviceTakeOverController_gateWithRatchetForOperation_forPresentingVC_completion___block_invoke_cold_1(v6);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (id)getArmingOptionsDictionaryForIdentifier:(unint64_t)a3
{
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

  v5 = (void *)objc_opt_new();
  -[PSUIDeviceTakeOverController getTitleForIdentifier:](self, "getTitleForIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, &unk_24F9EB9D0);

  PSUI_LocalizedStringForPasscodeDimpleKey(CFSTR("DTO_BEGIN_DESCRIPTION_DEFAULT"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, &unk_24F9EB9E8);

  -[PSUIDeviceTakeOverController getInProgressDescriptionForIdentifier:](self, "getInProgressDescriptionForIdentifier:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v8, &unk_24F9EBA00);

  -[PSUIDeviceTakeOverController getAuthenticationFallbackDescriptionForIdentifier:](self, "getAuthenticationFallbackDescriptionForIdentifier:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v9, &unk_24F9EBA18);

  PSUI_LocalizedStringForPasscodeDimpleKey(CFSTR("DTO_NOTIFICATION_DESCRIPTION_DEFAULT"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v10, &unk_24F9EB9B8);

  v11 = (void *)MEMORY[0x24BDBCF48];
  -[PSUIDeviceTakeOverController getOperationDeepLinkForIdentifier:](self, "getOperationDeepLinkForIdentifier:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLWithString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v13, &unk_24F9EBA30);

  if (-[PSUIDeviceTakeOverController isABiometricModifyingIdentifier:](self, "isABiometricModifyingIdentifier:", a3))
    objc_msgSend(v5, "setObject:forKey:", MEMORY[0x24BDBD1C8], &unk_24F9EBA48);
  v14 = (void *)objc_msgSend(v5, "copy");

  return v14;
}

- (BOOL)isABiometricModifyingIdentifier:(unint64_t)a3
{
  return (a3 < 0xA) & (0x33Fu >> a3);
}

- (BOOL)canGateOperation:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDDA950], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSensorTrusted");

  +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identitiesForIdentityType:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = objc_msgSend(v7, "count");
  else
    v8 = 0;
  if (v8 == 1)
    v9 = v5 ^ 1;
  else
    v9 = 1;
  if (a3)
    v10 = 1;
  else
    v10 = v5 ^ 1;
  if (a3 == 4)
    v11 = v9;
  else
    v11 = v10;
  PSUILogForCategory(1uLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138413058;
    v18 = v13;
    v19 = 2048;
    v20 = a3;
    v21 = 2112;
    v22 = v14;
    v23 = 2112;
    v24 = v15;
    _os_log_impl(&dword_22E0C8000, v12, OS_LOG_TYPE_DEFAULT, "Ratchet: Gating precheck: %@ for identifier: %lu [TrustedSensor:%@ | IdentitiesCount:%@]", (uint8_t *)&v17, 0x2Au);

  }
  return v11;
}

- (void)showAlertForFailureToGateForOperation:(unint64_t)a3 forPresentingVC:(id)a4
{
  id v4;
  int v5;
  BOOL v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t v17[16];

  v4 = a4;
  v5 = PSSupportsMesa();
  v6 = v5 == 0;
  if (v5)
    v7 = CFSTR("DTO_ALERT_CANNOT_DELETE_TOUCH_ID_TITLE");
  else
    v7 = CFSTR("DTO_ALERT_CANNOT_RESET_FACE_ID_TITLE");
  if (v6)
    v8 = CFSTR("DTO_ALERT_CANNOT_RESET_FACE_ID_MESSAGE");
  else
    v8 = CFSTR("DTO_ALERT_CANNOT_DELETE_TOUCH_ID_MESSAGE");
  PSUI_LocalizedStringForPasscodeDimpleKey(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PSUI_LocalizedStringForPasscodeDimpleKey(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v9, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BEBD3A8];
  PSUI_LocalizedStringForPasscodeDimpleKey(CFSTR("DTO_ALERT_OK_BUTTON"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 0, &__block_literal_global_1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v14);

  PSUILogForCategory(1uLL);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_22E0C8000, v15, OS_LOG_TYPE_DEFAULT, "Ratchet: Gating precheck [Failed] - Alert [Shown]", v17, 2u);
  }

  if (v4)
  {
    objc_msgSend(v4, "presentViewController:animated:completion:", v11, 1, 0);
  }
  else
  {
    PSUILogForCategory(1uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[PSUIDeviceTakeOverController showAlertForFailureToGateForOperation:forPresentingVC:].cold.1();

  }
}

void __86__PSUIDeviceTakeOverController_showAlertForFailureToGateForOperation_forPresentingVC___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  PSUILogForCategory(1uLL);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_22E0C8000, v0, OS_LOG_TYPE_DEFAULT, "Ratchet: Gating precheck [Failed] - Alert [Dismissed]", v1, 2u);
  }

}

- (void)performPreliminaryPreEnableDTOChecksWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BDDA950], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __83__PSUIDeviceTakeOverController_performPreliminaryPreEnableDTOChecksWithCompletion___block_invoke;
  v7[3] = &unk_24F9E3D68;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "checkCanEnableFeatureWithCompletion:", v7);

  objc_destroyWeak(&location);
}

void __83__PSUIDeviceTakeOverController_performPreliminaryPreEnableDTOChecksWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  char v10;
  int v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  uint8_t v15[16];

  v5 = a2;
  v6 = a3;
  PSUILogForCategory(1uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __83__PSUIDeviceTakeOverController_performPreliminaryPreEnableDTOChecksWithCompletion___block_invoke_cold_1(v6);

    objc_msgSend(v6, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDDA920]);

    if ((v10 & 1) != 0 && (objc_msgSend(v6, "code") == 4 || objc_msgSend(v6, "code") == 5))
    {
      v11 = PSIsPearlAvailable();
      v12 = *(_QWORD *)(a1 + 32);
      if (v11)
        v13 = CFSTR("DTO_GROUP_DISABLED_REASON_FOOTER_DESCRIPTION_FACE_ID");
      else
        v13 = CFSTR("DTO_GROUP_DISABLED_REASON_FOOTER_DESCRIPTION_TOUCH_ID");
    }
    else
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = CFSTR("DTO_GROUP_DISABLED_REASON_FOOTER_DESCRIPTION_DEFAULT");
    }
    PSUI_LocalizedStringForPasscodeDimpleKey(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v14);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_22E0C8000, v8, OS_LOG_TYPE_DEFAULT, "Ratchet: Preliminary check succeeded", v15, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)enableRatchetWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BDDA950], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__PSUIDeviceTakeOverController_enableRatchetWithCompletion___block_invoke;
  v7[3] = &unk_24F9E3D90;
  v6 = v4;
  v8 = v6;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "checkCanEnableFeatureWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __60__PSUIDeviceTakeOverController_enableRatchetWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PSUILogForCategory(1uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __60__PSUIDeviceTakeOverController_enableRatchetWithCompletion___block_invoke_cold_2(v6);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v9 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "proceedToPeformBiometricLivenessIfNeededWithResultDictionary:withCompletion:", v5, *(_QWORD *)(a1 + 32));
    }
    else
    {
      PSUILogForCategory(1uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __60__PSUIDeviceTakeOverController_enableRatchetWithCompletion___block_invoke_cold_1();

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }

  }
}

- (void)proceedToPeformBiometricLivenessIfNeededWithResultDictionary:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id buf;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", &unk_24F9EBA60);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  PSUILogForCategory(1uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_22E0C8000, v10, OS_LOG_TYPE_DEFAULT, "Ratchet: Biometric liveness confirmed already", (uint8_t *)&buf, 2u);
    }

    -[PSUIDeviceTakeOverController proceedToEnableRatchetWithCompletion:](self, "proceedToEnableRatchetWithCompletion:", v7);
  }
  else
  {
    if (v11)
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_22E0C8000, v10, OS_LOG_TYPE_DEFAULT, "Ratchet: Confirming Biometric liveness", (uint8_t *)&buf, 2u);
    }

    objc_initWeak(&buf, self);
    v12 = objc_alloc_init(MEMORY[0x24BDDA938]);
    v20 = &unk_24F9EBA30;
    v21[0] = CFSTR("Turn On Stolen Device Protection");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __108__PSUIDeviceTakeOverController_proceedToPeformBiometricLivenessIfNeededWithResultDictionary_withCompletion___block_invoke;
    v15[3] = &unk_24F9E3DB8;
    v14 = v12;
    v16 = v14;
    v17 = v7;
    objc_copyWeak(&v18, &buf);
    objc_msgSend(v14, "evaluatePolicy:options:reply:", 1, v13, v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&buf);
  }

}

void __108__PSUIDeviceTakeOverController_proceedToPeformBiometricLivenessIfNeededWithResultDictionary_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  PSUILogForCategory(1uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __108__PSUIDeviceTakeOverController_proceedToPeformBiometricLivenessIfNeededWithResultDictionary_withCompletion___block_invoke_cold_2();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_22E0C8000, v6, OS_LOG_TYPE_DEFAULT, "Ratchet: Confirming Biometric liveness: Succeeded", v10, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v8 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "proceedToEnableRatchetWithCompletion:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      PSUILogForCategory(1uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __108__PSUIDeviceTakeOverController_proceedToPeformBiometricLivenessIfNeededWithResultDictionary_withCompletion___block_invoke_cold_1();

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
}

- (void)proceedToEnableRatchetWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDDA950], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__PSUIDeviceTakeOverController_proceedToEnableRatchetWithCompletion___block_invoke;
  v6[3] = &unk_24F9E3D68;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enableFeatureWithReply:", v6);

}

void __69__PSUIDeviceTakeOverController_proceedToEnableRatchetWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void (*v7)(void);
  uint8_t v8[16];

  v4 = a3;
  PSUILogForCategory(1uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __69__PSUIDeviceTakeOverController_proceedToEnableRatchetWithCompletion___block_invoke_cold_1(v4);

    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_22E0C8000, v6, OS_LOG_TYPE_DEFAULT, "Ratchet: Enabled successfully", v8, 2u);
    }

    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v7();

}

- (void)disableRatchetWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDDA950], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIDeviceTakeOverController laContext](self, "laContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__PSUIDeviceTakeOverController_disableRatchetWithCompletion___block_invoke;
  v8[3] = &unk_24F9E3CD8;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "disableFeatureWithContext:completion:", v6, v8);

}

void __61__PSUIDeviceTakeOverController_disableRatchetWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void (*v6)(void);
  uint8_t v7[16];

  v3 = a2;
  PSUILogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __61__PSUIDeviceTakeOverController_disableRatchetWithCompletion___block_invoke_cold_1(v3);

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_22E0C8000, v5, OS_LOG_TYPE_DEFAULT, "Ratchet: Disabled successfully", v7, 2u);
    }

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();

}

- (id)getOperationDeepLinkForIdentifier:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 > 0xA)
    return CFSTR("settings-navigation://com.apple.Settings.Passcode");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("settings-navigation://com.apple.Settings.Passcode#"), off_24F9E3DD8[a3], v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getOperationNameForIdentifier:(unint64_t)a3
{
  if (a3 > 0xA)
    return CFSTR("Default");
  else
    return off_24F9E3E30[a3];
}

- (id)getTitleForIdentifier:(unint64_t)a3
{
  void *v4;
  __CFString *v5;
  uint64_t v6;

  PSUI_LocalizedStringForPasscodeDimpleKey(CFSTR("DTO_BEGIN_TITLE_DEFAULT"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("DTO_BEGIN_TITLE_ENROLL_FACE_ID");
  switch(a3)
  {
    case 0uLL:
    case 2uLL:
    case 3uLL:
      v5 = CFSTR("DTO_BEGIN_TITLE_CHANGE_FACE_ID");
      goto LABEL_10;
    case 1uLL:
      goto LABEL_10;
    case 4uLL:
      v5 = CFSTR("DTO_BEGIN_TITLE_CHANGE_TOUCH_ID");
      goto LABEL_10;
    case 5uLL:
      v5 = CFSTR("DTO_BEGIN_TITLE_ENROLL_TOUCH_ID");
      goto LABEL_10;
    case 6uLL:
    case 0xAuLL:
      v5 = CFSTR("DTO_BEGIN_TITLE_CHANGE_STOLEN_DEVICE_PROTECTION");
      goto LABEL_10;
    case 7uLL:
      v5 = CFSTR("DTO_BEGIN_TITLE_CHANGE_PASSCODE");
      goto LABEL_10;
    case 8uLL:
    case 9uLL:
      if (PSIsPearlAvailable())
        v5 = CFSTR("DTO_BEGIN_TITLE_CHANGE_FACE_ID");
      else
        v5 = CFSTR("DTO_BEGIN_TITLE_CHANGE_TOUCH_ID");
LABEL_10:
      PSUI_LocalizedStringForPasscodeDimpleKey(v5);
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v6;
      break;
    default:
      return v4;
  }
  return v4;
}

- (id)getInProgressDescriptionForIdentifier:(unint64_t)a3
{
  void *v4;
  __CFString *v5;
  uint64_t v6;

  PSUI_LocalizedStringForPasscodeDimpleKey(CFSTR("DTO_IN_PROGRESS_DESCRIPTION_DEFAULT"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("DTO_IN_PROGRESS_DESCRIPTION_SET_UP_FACE_ID");
  switch(a3)
  {
    case 0uLL:
      v5 = CFSTR("DTO_IN_PROGRESS_DESCRIPTION_RESET_FACE_ID");
      goto LABEL_13;
    case 1uLL:
      goto LABEL_13;
    case 2uLL:
      v5 = CFSTR("DTO_IN_PROGRESS_DESCRIPTION_SET_UP_FACE_ID_WITH_MASK");
      goto LABEL_13;
    case 3uLL:
      v5 = CFSTR("DTO_IN_PROGRESS_DESCRIPTION_SET_UP_FACE_ID_WITH_GLASSES");
      goto LABEL_13;
    case 4uLL:
      v5 = CFSTR("DTO_IN_PROGRESS_DESCRIPTION_DELETE_FINGERPRINT");
      goto LABEL_13;
    case 5uLL:
      v5 = CFSTR("DTO_IN_PROGRESS_DESCRIPTION_ADD_FINGERPRINT");
      goto LABEL_13;
    case 6uLL:
      v5 = CFSTR("DTO_IN_PROGRESS_DESCRIPTION_TURN_OFF_STOLEN_DEVICE_PROTECTION");
      goto LABEL_13;
    case 7uLL:
      v5 = CFSTR("DTO_IN_PROGRESS_DESCRIPTION_TURN_OFF_PASSCODE");
      goto LABEL_13;
    case 8uLL:
    case 9uLL:
      if (PSIsPearlAvailable())
        v5 = CFSTR("DTO_IN_PROGRESS_DESCRIPTION_DISABLE_USING_FACE_ID_FOR_FEATURES");
      else
        v5 = CFSTR("DTO_IN_PROGRESS_DESCRIPTION_DISABLE_USING_TOUCH_ID_FOR_FEATURES");
      goto LABEL_13;
    case 0xAuLL:
      v5 = CFSTR("DTO_IN_PROGRESS_DESCRIPTION_DOWNGRADE_SECURITY_FAMILIAR_ONLY");
LABEL_13:
      PSUI_LocalizedStringForPasscodeDimpleKey(v5);
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v6;
      break;
    default:
      return v4;
  }
  return v4;
}

- (id)getAuthenticationFallbackDescriptionForIdentifier:(unint64_t)a3
{
  void *v4;
  __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;

  PSUI_LocalizedStringForPasscodeDimpleKey(CFSTR("DTO_AUTHENTICATION_FALLBACK_DESCRIPTION_DEFAULT"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("DTO_AUTHENTICATION_FALLBACK_DESCRIPTION_SET_UP_FACE_ID");
  switch(a3)
  {
    case 0uLL:
      v5 = CFSTR("DTO_AUTHENTICATION_FALLBACK_DESCRIPTION_RESET_FACE_ID");
      goto LABEL_14;
    case 1uLL:
      goto LABEL_14;
    case 2uLL:
      v5 = CFSTR("DTO_AUTHENTICATION_FALLBACK_DESCRIPTION_SET_UP_FACE_ID_WITH_MASK");
      goto LABEL_14;
    case 3uLL:
      v5 = CFSTR("DTO_AUTHENTICATION_FALLBACK_DESCRIPTION_SET_UP_FACE_ID_WITH_GLASSES");
      goto LABEL_14;
    case 4uLL:
      v5 = CFSTR("DTO_AUTHENTICATION_FALLBACK_DESCRIPTION_DELETE_FINGERPRINT");
      goto LABEL_14;
    case 5uLL:
      v5 = CFSTR("DTO_AUTHENTICATION_FALLBACK_DESCRIPTION_ADD_FINGERPRINT");
      goto LABEL_14;
    case 6uLL:
      v5 = CFSTR("DTO_AUTHENTICATION_FALLBACK_DESCRIPTION_TURN_OFF_STOLEN_DEVICE_PROTECTION");
      goto LABEL_14;
    case 7uLL:
      v5 = CFSTR("DTO_AUTHENTICATION_FALLBACK_DESCRIPTION_TURN_OFF_PASSCODE");
      goto LABEL_14;
    case 8uLL:
    case 9uLL:
      if (PSIsPearlAvailable())
        v6 = CFSTR("DTO_AUTHENTICATION_FALLBACK_DESCRIPTION_DISABLE_USING_FACE_ID_FOR_FEATURES");
      else
        v6 = CFSTR("DTO_AUTHENTICATION_FALLBACK_DESCRIPTION_DISABLE_USING_TOUCH_ID_FOR_FEATURES");
      PSUI_LocalizedStringForPasscodeDimpleKey(v6);
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v7;
      goto LABEL_6;
    case 0xAuLL:
LABEL_6:
      v5 = CFSTR("DTO_AUTHENTICATION_FALLBACK_DESCRIPTION_DOWNGRADE_SECURITY_FAMILIAR_ONLY");
LABEL_14:
      PSUI_LocalizedStringForPasscodeDimpleKey(v5);
      v8 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v8;
      break;
    default:
      return v4;
  }
  return v4;
}

- (LAContext)laContext
{
  return self->_laContext;
}

- (void)setLaContext:(id)a3
{
  objc_storeStrong((id *)&self->_laContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_laContext, 0);
}

- (void)gateWithRatchetForOperation:forPresentingVC:completion:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_8();
  _os_log_error_impl(&dword_22E0C8000, v0, OS_LOG_TYPE_ERROR, "Ratchet: Cannot perform gating check for identifier: %lu", v1, 0xCu);
}

void __87__PSUIDeviceTakeOverController_gateWithRatchetForOperation_forPresentingVC_completion___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_22E0C8000, v2, v3, "Ratchet: Cannot proceed to perform critical operation as gating failed - Error: %@ - %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

void __87__PSUIDeviceTakeOverController_gateWithRatchetForOperation_forPresentingVC_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "Ratchet: Cannot proceed to perform critical operation as gating was successful but we are missing instance (self)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)showAlertForFailureToGateForOperation:forPresentingVC:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "Ratchet: Gating precheck [Failed] - Alert [Not shown - missing presenting VC]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __83__PSUIDeviceTakeOverController_performPreliminaryPreEnableDTOChecksWithCompletion___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_22E0C8000, v2, v3, "Ratchet: Preliminary check failed: Error: %@ - %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

void __60__PSUIDeviceTakeOverController_enableRatchetWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "Ratchet: Cannot perform Biometric Livenes check as we are missing instance (self)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __60__PSUIDeviceTakeOverController_enableRatchetWithCompletion___block_invoke_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_0(&dword_22E0C8000, v2, v3, "Ratchet: Failed to enable - Initial check failed: Error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

void __108__PSUIDeviceTakeOverController_proceedToPeformBiometricLivenessIfNeededWithResultDictionary_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "Ratchet: Cannot proceed to enable Ratchet as we are missing instance (self)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __108__PSUIDeviceTakeOverController_proceedToPeformBiometricLivenessIfNeededWithResultDictionary_withCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "Ratchet: Confirming Biometric liveness: Failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __69__PSUIDeviceTakeOverController_proceedToEnableRatchetWithCompletion___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_0(&dword_22E0C8000, v2, v3, "Ratchet: Failed to enable - Error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

void __61__PSUIDeviceTakeOverController_disableRatchetWithCompletion___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_0(&dword_22E0C8000, v2, v3, "Ratchet: Failed to disable - Error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

@end
