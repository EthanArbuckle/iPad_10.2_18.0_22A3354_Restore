@implementation PKPaymentSetupAssistantRegistrationUtilities

+ (void)preflightPaymentSetupProvisioningController:(id)a3 forSetupAssistant:(unint64_t)a4 withCompletion:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[16];

  v6 = a3;
  v7 = a5;
  PKLogFacilityTypeGetObject(0x28uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Performing -[PKPaymentRegistrationUtilities preflightPaymentSetupProvisioningController:forSetupAssistant:withCompletion:]", buf, 2u);
  }

  if (PKNetworkConnectivityAvailable())
  {
    objc_msgSend(v6, "webService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __125__PKPaymentSetupAssistantRegistrationUtilities_preflightPaymentSetupProvisioningController_forSetupAssistant_withCompletion___block_invoke;
    v10[3] = &unk_1E2ABEB88;
    v11 = v6;
    v12 = v7;
    +[PKPaymentRegistrationUtilities configureWebServiceIfNecessary:completion:](PKPaymentRegistrationUtilities, "configureWebServiceIfNecessary:completion:", v9, v10);

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Buddy provisioning disabled because device is not online", buf, 2u);
    }

    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __125__PKPaymentSetupAssistantRegistrationUtilities_preflightPaymentSetupProvisioningController_forSetupAssistant_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id *v5;
  id *v6;
  void *v7;
  _QWORD block[4];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[2];

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __125__PKPaymentSetupAssistantRegistrationUtilities_preflightPaymentSetupProvisioningController_forSetupAssistant_withCompletion___block_invoke_116;
    block[3] = &unk_1E2ABE058;
    v5 = &v9;
    v9 = v3;
    v6 = &v10;
    v10 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "webService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __125__PKPaymentSetupAssistantRegistrationUtilities_preflightPaymentSetupProvisioningController_forSetupAssistant_withCompletion___block_invoke_2;
    v11[3] = &unk_1E2AC2828;
    v5 = &v12;
    v12 = *(id *)(a1 + 32);
    v6 = (id *)v13;
    v13[0] = *(id *)(a1 + 40);
    v13[1] = 2;
    +[PKPaymentRegistrationUtilities _shouldShowAddCardFlowForWebService:options:completion:](PKPaymentRegistrationUtilities, "_shouldShowAddCardFlowForWebService:options:completion:", v7, 2, v11);

  }
}

void __125__PKPaymentSetupAssistantRegistrationUtilities_preflightPaymentSetupProvisioningController_forSetupAssistant_withCompletion___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t (*v10)(uint64_t);
  uint64_t *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "webService");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "targetDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceRegion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "webService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "buddyProvisioningEnabledForRegion:", v5);

    if (v9)
    {
      v17 = MEMORY[0x1E0C809B0];
      v10 = __125__PKPaymentSetupAssistantRegistrationUtilities_preflightPaymentSetupProvisioningController_forSetupAssistant_withCompletion___block_invoke_3;
      v11 = &v17;
    }
    else
    {
      v16 = MEMORY[0x1E0C809B0];
      v10 = __125__PKPaymentSetupAssistantRegistrationUtilities_preflightPaymentSetupProvisioningController_forSetupAssistant_withCompletion___block_invoke_4;
      v11 = &v16;
    }
    v11[1] = 3221225472;
    v11[2] = (uint64_t)v10;
    v11[3] = (uint64_t)&unk_1E2ABD9A0;
    v11[4] = (uint64_t)*(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], v11);

  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __125__PKPaymentSetupAssistantRegistrationUtilities_preflightPaymentSetupProvisioningController_forSetupAssistant_withCompletion___block_invoke_115;
    v13[3] = &unk_1E2AC1C68;
    v12 = *(void **)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 48);
    v14 = v12;
    dispatch_async(MEMORY[0x1E0C80D38], v13);
    v5 = v14;
  }

}

uint64_t __125__PKPaymentSetupAssistantRegistrationUtilities_preflightPaymentSetupProvisioningController_forSetupAssistant_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __125__PKPaymentSetupAssistantRegistrationUtilities_preflightPaymentSetupProvisioningController_forSetupAssistant_withCompletion___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0x28uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    PKCurrentRegion();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Buddy provisioning disabled in current region (%{public}@). Skipping.", (uint8_t *)&v5, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __125__PKPaymentSetupAssistantRegistrationUtilities_preflightPaymentSetupProvisioningController_forSetupAssistant_withCompletion___block_invoke_115(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0x28uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Add card flow not supported in due to missing options %lu. Skipping.", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __125__PKPaymentSetupAssistantRegistrationUtilities_preflightPaymentSetupProvisioningController_forSetupAssistant_withCompletion___block_invoke_116(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0x28uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    PKCurrentRegion();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Setup not supported in current region (%{public}@). Skipping. (Error: %{public}@)", (uint8_t *)&v6, 0x16u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (BOOL)setupAssistantNeedsToRun:(unint64_t)a3 returningRequirements:(unint64_t *)a4
{
  PKSetupAssistantUtilityContext *v5;
  PKPaymentSetupAssistantCoreController *v6;

  v5 = -[PKSetupAssistantUtilityContext initWithSetupAssistant:]([PKSetupAssistantUtilityContext alloc], "initWithSetupAssistant:", a3);
  v6 = -[PKPaymentSetupAssistantCoreController initWithSetupAssistantContext:]([PKPaymentSetupAssistantCoreController alloc], "initWithSetupAssistantContext:", v5);
  LOBYTE(a4) = -[PKPaymentSetupAssistantCoreController _setupAssistantNeedsToRunReturningRequirements:](v6, "_setupAssistantNeedsToRunReturningRequirements:", a4);

  return (char)a4;
}

@end
