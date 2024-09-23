@implementation PKPaymentRegistrationUtilities

+ (void)configureWebServiceIfNecessary:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "needsConfiguration"))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __76__PKPaymentRegistrationUtilities_configureWebServiceIfNecessary_completion___block_invoke;
    v10[3] = &unk_1E2AC2800;
    v7 = &v11;
    v11 = v6;
    objc_msgSend(v5, "configurePaymentServiceWithCompletion:", v10);
LABEL_5:

    goto LABEL_6;
  }
  if (v6)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __76__PKPaymentRegistrationUtilities_configureWebServiceIfNecessary_completion___block_invoke_3;
    v8[3] = &unk_1E2ABD9A0;
    v7 = &v9;
    v9 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v8);
    goto LABEL_5;
  }
LABEL_6:

}

+ (BOOL)_isPaymentSetupSupportedForWebService:(id)a3
{
  return objc_msgSend(a3, "paymentSetupSupportedInRegion") == 1;
}

uint64_t __76__PKPaymentRegistrationUtilities_configureWebServiceIfNecessary_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __102__PKPaymentRegistrationUtilities_shouldShowWalletInSettingsWithApplePaySupportInformation_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned int v5;
  int IsAvailable;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  id v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  uint64_t v21;
  const __CFString *v22;
  unsigned int v23;
  uint8_t buf[4];
  const __CFString *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "targetDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "paymentWebService:hasPassesOfType:", *(_QWORD *)(a1 + 32), 1);

  IsAvailable = PKDaemonIsAvailable();
  if (IsAvailable || v5)
  {
    if ((unint64_t)PKCurrentPassbookState() < 2)
    {
      v7 = 1;
      goto LABEL_9;
    }
    PKLogFacilityTypeGetObject(6uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Wallet has been deleted, disabling showWalletSettings", buf, 2u);
    }

  }
  v7 = 0;
LABEL_9:
  v9 = objc_msgSend(*(id *)(a1 + 48), "_isPaymentSetupSupportedForWebService:", *(_QWORD *)(a1 + 32));
  v10 = v9 | v5;
  PKLogFacilityTypeGetObject(6uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = IsAvailable;
    v13 = v3;
    if ((_DWORD)v7)
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    if (v12)
      v15 = CFSTR("YES");
    else
      v15 = CFSTR("NO");
    v22 = v15;
    v23 = v7;
    if (v5)
      v16 = CFSTR("YES");
    else
      v16 = CFSTR("NO");
    PKCurrentRegion();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    *(_DWORD *)buf = 138545154;
    if ((_DWORD)v10)
      v19 = CFSTR("YES");
    else
      v19 = CFSTR("NO");
    v25 = v14;
    v3 = v13;
    if (v9)
      v20 = CFSTR("YES");
    else
      v20 = CFSTR("NO");
    v26 = 2114;
    v27 = v22;
    v28 = 2114;
    v29 = v16;
    v30 = 2114;
    v31 = v17;
    v32 = 2114;
    v33 = v19;
    v34 = 2114;
    v35 = v16;
    v7 = v23;
    v36 = 2114;
    v37 = v20;
    v38 = 2112;
    v39 = v13;
    _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "shouldShowWalletInSettingsWithApplePaySupportInformation - settings should show returned: %{public}@ (daemonIsAvailable: %{public}@ or hasPaymentPasses: %{public}@) supported in current region (%{public}@) returned: %{public}@ (hasPaymentPasses: %{public}@ or canAddPaymentPasses: %{public}@) error: %@", buf, 0x52u);

  }
  v21 = *(_QWORD *)(a1 + 40);
  if (v21)
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v21 + 16))(v21, v7, v10, v3);

}

+ (void)shouldShowWalletInSettingsWithApplePaySupportInformation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __102__PKPaymentRegistrationUtilities_shouldShowWalletInSettingsWithApplePaySupportInformation_completion___block_invoke;
  v10[3] = &unk_1E2AC2788;
  v12 = v7;
  v13 = a1;
  v11 = v6;
  v8 = v7;
  v9 = v6;
  objc_msgSend(a1, "configureWebServiceIfNecessary:completion:", v9, v10);

}

+ (void)shouldShowWalletInBuddy:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, uint64_t, _QWORD);
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  PKLogFacilityTypeGetObject(6uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "shouldShowWalletInBuddy supported", v8, 2u);
  }

  if (v6)
    v6[2](v6, 1, 0);

}

+ (void)shouldShowWalletInSettings:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__PKPaymentRegistrationUtilities_shouldShowWalletInSettings_completion___block_invoke;
  v8[3] = &unk_1E2AC2760;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a1, "shouldShowWalletInSettingsWithApplePaySupportInformation:completion:", a3, v8);

}

uint64_t __72__PKPaymentRegistrationUtilities_shouldShowWalletInSettings_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)shouldShowWalletInDigitalSeparation:(id)a3 withDeviceSpecificCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __99__PKPaymentRegistrationUtilities_shouldShowWalletInDigitalSeparation_withDeviceSpecificCompletion___block_invoke;
    v9[3] = &unk_1E2ABEB88;
    v10 = v6;
    v11 = v7;
    objc_msgSend(a1, "configureWebServiceIfNecessary:completion:", v10, v9);

    v8 = v10;
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "+[PKPaymentRegistrationUtilities shouldShowWalletInDigitalSeparation:withDeviceSpecificCompletion:]";
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "%s called with no completion", buf, 0xCu);
    }
  }

}

void __99__PKPaymentRegistrationUtilities_shouldShowWalletInDigitalSeparation_withDeviceSpecificCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  char v6;
  uint64_t v7;
  id v8;
  SEL v9;
  void (*v10)(id, SEL, _QWORD *);
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD v17[4];
  NSObject *v18;
  _QWORD *v19;
  _QWORD v20[4];
  NSObject *v21;
  _QWORD *v22;
  _QWORD v23[3];
  char v24;
  _QWORD v25[3];
  char v26;

  v3 = a2;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  v4 = dispatch_group_create();
  objc_msgSend(*(id *)(a1 + 32), "targetDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();
  v7 = MEMORY[0x1E0C809B0];
  if ((v6 & 1) != 0)
  {
    dispatch_group_enter(v4);
    v20[0] = v7;
    v20[1] = 3221225472;
    v20[2] = __99__PKPaymentRegistrationUtilities_shouldShowWalletInDigitalSeparation_withDeviceSpecificCompletion___block_invoke_2;
    v20[3] = &unk_1E2AC27B0;
    v22 = v25;
    v21 = v4;
    objc_msgSend(v5, "hasActiveExternallySharedPasses:", v20);

  }
  v8 = objc_alloc_init((Class)getNPKCompanionAgentConnectionClass_0[0]());
  v9 = NSSelectorFromString(CFSTR("hasActiveExternallySharedPasses:"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    dispatch_group_enter(v4);
    v10 = (void (*)(id, SEL, _QWORD *))objc_msgSend(v8, "methodForSelector:", v9);
    v17[0] = v7;
    v17[1] = 3221225472;
    v17[2] = __99__PKPaymentRegistrationUtilities_shouldShowWalletInDigitalSeparation_withDeviceSpecificCompletion___block_invoke_3;
    v17[3] = &unk_1E2AC27B0;
    v19 = v23;
    v18 = v4;
    v10(v8, v9, v17);

  }
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __99__PKPaymentRegistrationUtilities_shouldShowWalletInDigitalSeparation_withDeviceSpecificCompletion___block_invoke_4;
  v12[3] = &unk_1E2AC27D8;
  v15 = v25;
  v16 = v23;
  v13 = v3;
  v14 = *(id *)(a1 + 40);
  v11 = v3;
  dispatch_group_notify(v4, MEMORY[0x1E0C80D38], v12);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);
}

void __99__PKPaymentRegistrationUtilities_shouldShowWalletInDigitalSeparation_withDeviceSpecificCompletion___block_invoke_2(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __99__PKPaymentRegistrationUtilities_shouldShowWalletInDigitalSeparation_withDeviceSpecificCompletion___block_invoke_3(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __99__PKPaymentRegistrationUtilities_shouldShowWalletInDigitalSeparation_withDeviceSpecificCompletion___block_invoke_4(_QWORD *a1)
{
  NSObject *v2;
  const __CFString *v3;
  const __CFString *v4;
  uint64_t v5;
  int v7;
  const __CFString *v8;
  __int16 v9;
  const __CFString *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
      v3 = CFSTR("YES");
    else
      v3 = CFSTR("NO");
    if (*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    v5 = a1[4];
    v7 = 138543874;
    v8 = v3;
    v9 = 2114;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "shouldShowWalletInDigitalSeparation - digital separation should show returned: sharesOnDevice (%{public}@), sharesOnCompanion (%{public}@) error: %@", (uint8_t *)&v7, 0x20u);
  }

  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

+ (void)shouldShowPasscodeAccessibilityOverride:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__PKPaymentRegistrationUtilities_shouldShowPasscodeAccessibilityOverride_completion___block_invoke;
  v10[3] = &unk_1E2ABEB88;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  objc_msgSend(a1, "configureWebServiceIfNecessary:completion:", v9, v10);

}

void __85__PKPaymentRegistrationUtilities_shouldShowPasscodeAccessibilityOverride_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  unsigned int v6;
  NSObject *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  uint64_t v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "registrationSetupSupportedInRegion");
  objc_msgSend(*(id *)(a1 + 32), "targetDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "paymentWebService:hasPassesOfType:", *(_QWORD *)(a1 + 32), 1);

  PKLogFacilityTypeGetObject(6uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v4 | v6)
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    PKCurrentRegion();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v14 = 138544386;
    if (v4)
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    v15 = v8;
    if (v6)
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    v16 = 2114;
    v17 = v9;
    v18 = 2114;
    v19 = v11;
    v20 = 2114;
    v21 = v12;
    v22 = 2112;
    v23 = v3;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "shouldShowPasscodeAccessibilityOverride shouldShow: %{public}@ in (%{public}@) region - registration supported: %{public}@, hasPaymentPasses:%{public}@ error: %@", (uint8_t *)&v14, 0x34u);

  }
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, v4 | v6, v3);

}

void __76__PKPaymentRegistrationUtilities_configureWebServiceIfNecessary_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = a3;
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __76__PKPaymentRegistrationUtilities_configureWebServiceIfNecessary_completion___block_invoke_2;
    v6[3] = &unk_1E2ABDA18;
    v8 = v5;
    v7 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

uint64_t __76__PKPaymentRegistrationUtilities_configureWebServiceIfNecessary_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (void)_shouldShowAddCardFlowForWebService:(id)a3 completion:(id)a4
{
  objc_msgSend(a1, "_shouldShowAddCardFlowForWebService:options:completion:", a3, 3, a4);
}

+ (void)_shouldShowAddCardFlowForWebService:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  PKPaymentService *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  _QWORD aBlock[4];
  NSObject *v18;
  uint8_t buf[16];

  v7 = a3;
  v8 = a5;
  v9 = v8;
  if (v8)
  {
    v10 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __89__PKPaymentRegistrationUtilities__shouldShowAddCardFlowForWebService_options_completion___block_invoke;
    aBlock[3] = &unk_1E2ABE518;
    v18 = v8;
    v11 = _Block_copy(aBlock);
    if (a4)
    {
      if ((a4 & 1) == 0
        || +[PKPaymentRegistrationUtilities _isPaymentSetupSupportedForWebService:](PKPaymentRegistrationUtilities, "_isPaymentSetupSupportedForWebService:", v7))
      {
        if ((a4 & 2) != 0)
        {
          v12 = objc_alloc_init(PKPaymentService);
          v15[0] = v10;
          v15[1] = 3221225472;
          v15[2] = __89__PKPaymentRegistrationUtilities__shouldShowAddCardFlowForWebService_options_completion___block_invoke_27;
          v15[3] = &unk_1E2ABE760;
          v16 = v11;
          -[PKPaymentService familyMembersWithCompletion:](v12, "familyMembersWithCompletion:", v15);

        }
        goto LABEL_13;
      }
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "_shouldShowAddCardFlowForWebService called with no options", buf, 2u);
      }

    }
    (*((void (**)(void *, _QWORD))v11 + 2))(v11, 0);
LABEL_13:

    v13 = v18;
    goto LABEL_14;
  }
  PKLogFacilityTypeGetObject(6uLL);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "_shouldShowAddCardFlowForWebService called with no completion", buf, 2u);
  }
LABEL_14:

}

void __89__PKPaymentRegistrationUtilities__shouldShowAddCardFlowForWebService_options_completion___block_invoke(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __89__PKPaymentRegistrationUtilities__shouldShowAddCardFlowForWebService_options_completion___block_invoke_2;
  v3[3] = &unk_1E2ABDCC0;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __89__PKPaymentRegistrationUtilities__shouldShowAddCardFlowForWebService_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __89__PKPaymentRegistrationUtilities__shouldShowAddCardFlowForWebService_options_completion___block_invoke_27(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
      if (objc_msgSend(v8, "isMe", (_QWORD)v9))
      {
        if (objc_msgSend(v8, "memberType") == 2)
          break;
      }
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)registrationIsSupportedInCurrentRegionWithWebService:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __98__PKPaymentRegistrationUtilities_registrationIsSupportedInCurrentRegionWithWebService_completion___block_invoke;
  v10[3] = &unk_1E2AC2788;
  v12 = v7;
  v13 = a1;
  v11 = v6;
  v8 = v7;
  v9 = v6;
  objc_msgSend(a1, "configureWebServiceIfNecessary:completion:", v9, v10);

}

void __98__PKPaymentRegistrationUtilities_registrationIsSupportedInCurrentRegionWithWebService_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __98__PKPaymentRegistrationUtilities_registrationIsSupportedInCurrentRegionWithWebService_completion___block_invoke_2;
  v7[3] = &unk_1E2ABDCE8;
  v8 = v3;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 48);
  v9 = *(id *)(a1 + 40);
  v6 = v3;
  objc_msgSend(v5, "_shouldShowAddCardFlowForWebService:completion:", v4, v7);

}

uint64_t __98__PKPaymentRegistrationUtilities_registrationIsSupportedInCurrentRegionWithWebService_completion___block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    PKCurrentRegion();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = CFSTR("NO");
    v7 = *(_QWORD *)(a1 + 32);
    v10 = 138543874;
    v11 = v5;
    if (a2)
      v6 = CFSTR("YES");
    v12 = 2114;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "shouldShowWalletInPreferences supported in current region (%{public}@) returned: %{public}@, error: %@", (uint8_t *)&v10, 0x20u);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
  {
    if (a2)
      v9 = 1;
    else
      v9 = 2;
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, v9, *(_QWORD *)(a1 + 32));
  }
  return result;
}

@end
