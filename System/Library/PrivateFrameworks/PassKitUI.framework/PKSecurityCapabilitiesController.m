@implementation PKSecurityCapabilitiesController

+ (id)displayableErrorForErrorCode:(unint64_t)a3
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  switch(a3)
  {
    case 1uLL:
    case 2uLL:
      PKLocalizedPaymentString(CFSTR("HSA_ENROLLMENT_FAILED_TITLE"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = CFSTR("HSA_ENROLLMENT_FAILED_MESSAGE");
      goto LABEL_7;
    case 3uLL:
      PKLocalizedPaymentString(CFSTR("HSA_ENROLLMENT_CANCELED_TITLE"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = CFSTR("HSA_ENROLLMENT_CANCELED_MESSAGE");
      goto LABEL_7;
    case 4uLL:
      PKPrimaryAppleAccountFormattedUsername();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("HSA_ENROLLMENT_NOT_ELIGIBLE_MESSAGE"), CFSTR("%@"), v6);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      PKLocalizedPaymentString(CFSTR("HSA_ENROLLMENT_NOT_ELIGIBLE_TITLE"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 5uLL:
      PKLocalizedPaymentString(CFSTR("HSA_ENROLLMENT_MANATEE_UNAVAILABLE_TITLE"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = CFSTR("HSA_ENROLLMENT_MANATEE_UNAVAILABLE_MESSAGE");
LABEL_7:
      PKLocalizedPaymentString(&v4->isa);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      PKDisplayableErrorCustom();
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (PKSecurityCapabilitiesController)initWithRequirements:(unint64_t)a3 context:(int64_t)a4
{
  return -[PKSecurityCapabilitiesController initWithRequirements:feature:context:](self, "initWithRequirements:feature:context:", a3, 0, a4);
}

- (PKSecurityCapabilitiesController)initWithRequirements:(unint64_t)a3 feature:(unint64_t)a4 context:(int64_t)a5
{
  PKSecurityCapabilitiesController *v8;
  PKSecurityCapabilitiesController *v9;
  uint64_t v10;
  AKAppleIDAuthenticationContext *authContext;
  uint64_t v12;
  PKCloudStoreService *cloudService;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PKSecurityCapabilitiesController;
  v8 = -[PKSecurityCapabilitiesController init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_feature = a4;
    v8->_securityRequirements = a3;
    -[PKSecurityCapabilitiesController _createAuthContext](v8, "_createAuthContext");
    v10 = objc_claimAutoreleasedReturnValue();
    authContext = v9->_authContext;
    v9->_authContext = (AKAppleIDAuthenticationContext *)v10;

    v9->_context = a5;
    objc_msgSend(MEMORY[0x1E0D66C20], "sharedInstance");
    v12 = objc_claimAutoreleasedReturnValue();
    cloudService = v9->_cloudService;
    v9->_cloudService = (PKCloudStoreService *)v12;

  }
  return v9;
}

- (void)presentSecurityRepairFlowWithPresentingViewController:(id)a3 completion:(id)a4
{
  -[PKSecurityCapabilitiesController presentSecurityRepairFlowWithPresentingViewController:suppressHSA2Alert:completion:](self, "presentSecurityRepairFlowWithPresentingViewController:suppressHSA2Alert:completion:", a3, 0, a4);
}

- (void)presentSecurityRepairFlowWithPresentingViewController:(id)a3 suppressHSA2Alert:(BOOL)a4 completion:(id)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unint64_t securityRequirements;
  int IsSetupAssistant;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void (**v17)(_QWORD);
  void *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  _BOOL4 v24;
  id v25;
  _QWORD v26[4];
  void (**v27)(_QWORD);
  _QWORD *v28;
  _BYTE *v29;
  _QWORD v30[5];
  id v31;
  id v32;
  _QWORD *v33;
  _BYTE *v34;
  BOOL v35;
  char v36;
  _QWORD v37[5];
  id v38;
  id v39;
  _QWORD *v40;
  _BYTE *v41;
  _QWORD v42[5];
  id v43;
  _QWORD *v44;
  _BYTE *v45;
  _QWORD aBlock[4];
  id v47;
  _BYTE *v48;
  _QWORD *v49;
  _QWORD v50[4];
  uint8_t v51[4];
  uint64_t v52;
  __int16 v53;
  const __CFString *v54;
  _BYTE buf[24];
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;

  v24 = a4;
  v59 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v7 = a5;
  PKLogFacilityTypeGetObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    PKFeatureIdentifierToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PKSecurityCapabilitiesRequirementToString(self->_securityRequirements);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Presenting security capabilities flow for feature: %@, requirements: %@", buf, 0x16u);

  }
  securityRequirements = self->_securityRequirements;
  IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x2020000000;
  v50[3] = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v56 = __Block_byref_object_copy__11;
  v57 = __Block_byref_object_dispose__11;
  v58 = 0;
  if (IsSetupAssistant)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v51 = 0;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "The current context is setup assistant so dont present any repair flows.", v51, 2u);
    }

    if (v7)
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }
  else
  {
    v13 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke;
    aBlock[3] = &unk_1E3E637C8;
    v47 = v7;
    v48 = buf;
    v49 = v50;
    v42[0] = v13;
    v42[1] = 3221225472;
    v42[2] = __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_2;
    v42[3] = &unk_1E3E682D8;
    v44 = v50;
    v42[4] = self;
    v23 = _Block_copy(aBlock);
    v43 = v23;
    v45 = buf;
    v14 = _Block_copy(v42);
    v37[0] = v13;
    v37[1] = 3221225472;
    v37[2] = __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_60;
    v37[3] = &unk_1E3E68350;
    v40 = v50;
    v37[4] = self;
    v15 = v25;
    v38 = v15;
    v41 = buf;
    v16 = v14;
    v39 = v16;
    v17 = (void (**)(_QWORD))_Block_copy(v37);
    v18 = v17;
    v19 = securityRequirements & 2;
    if ((securityRequirements & 0xCC) != 0)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        PKSecurityCapabilitiesRequirementToString(0xCCuLL);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v20;
        v22 = &stru_1E3E7D690;
        if (v24)
          v22 = CFSTR(" with HSA2 alert suppressed.");
        *(_DWORD *)v51 = 138412546;
        v52 = v20;
        v53 = 2112;
        v54 = v22;
        _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Checking security eligibility for %@%@", v51, 0x16u);

      }
      v30[0] = v13;
      v30[1] = 3221225472;
      v30[2] = __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_68;
      v30[3] = &unk_1E3E683A0;
      v30[4] = self;
      v35 = v24;
      v31 = v15;
      v33 = v50;
      v34 = buf;
      v32 = v18;
      v36 = v19 >> 1;
      -[PKSecurityCapabilitiesController _isEnabledForSecurityRequirements:withCompletion:](self, "_isEnabledForSecurityRequirements:withCompletion:", 204, v30, v23);

    }
    else if ((securityRequirements & 2) != 0)
    {
      v26[0] = v13;
      v26[1] = 3221225472;
      v26[2] = __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_2_73;
      v26[3] = &unk_1E3E68300;
      v28 = v50;
      v29 = buf;
      v27 = v17;
      -[PKSecurityCapabilitiesController _presentPasswordPromptWithPresentingViewController:completion:](self, "_presentPasswordPromptWithPresentingViewController:completion:", v15, v26, v23);

    }
    else
    {
      v17[2](v17);
    }

  }
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v50, 8);
}

_QWORD *__119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = result[4];
  if (v1)
  {
    v2 = *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 40);
    if (v2)
    {
      v3 = *(_QWORD *)(result[6] + 8);
      if (!*(_QWORD *)(v3 + 24))
      {
        *(_QWORD *)(v3 + 24) = 2;
        v1 = result[4];
        v2 = *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 40);
      }
    }
    return (_QWORD *)(*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v1 + 16))(v1, *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 24), v2);
  }
  return result;
}

void __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  __int128 v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    && (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) & 0x20) != 0)
  {
    PKLogFacilityTypeGetObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      PKSecurityCapabilitiesRequirementToString(0x20uLL);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v10 = v3;
      _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Checking security eligibility for %@", buf, 0xCu);

    }
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_52;
    v5[3] = &unk_1E3E682B0;
    v4 = *(void **)(a1 + 40);
    v6 = *(id *)(a1 + 32);
    v7 = v4;
    v8 = *(_OWORD *)(a1 + 48);
    objc_msgSend(v6, "_isEnabledForSecurityRequirements:withCompletion:", 32, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_52(uint64_t a1, uint64_t a2, unint64_t a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  __int128 v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    PKSecurityCapabilitiesRequirementToString(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v6;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Missing security eligibility %@", buf, 0xCu);

  }
  if ((a3 & 0x20) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Trying to setup the apple pay container...", buf, 2u);
    }

    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    PKCurrentCloudStoreApplePayContainerName();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_53;
    v10[3] = &unk_1E3E68288;
    v9 = *(id *)(a1 + 40);
    v12 = *(_OWORD *)(a1 + 48);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v9;
    objc_msgSend(v7, "setupCloudDatabaseForContainerName:completion:", v8, v10);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_53(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    v11 = 138412546;
    v12 = v7;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Finished the apple pay container setup with success %@, error %@", (uint8_t *)&v11, 0x16u);
  }

  if ((a2 & 1) == 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 2;
    objc_msgSend(*(id *)(a1 + 32), "_genericDisplayableError");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_60(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  __int128 v8;
  _QWORD v9[4];
  id v10;
  id v11;
  __int128 v12;
  uint64_t v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
    && (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) & 0x10) != 0)
  {
    PKLogFacilityTypeGetObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      PKSecurityCapabilitiesRequirementToString(0x10uLL);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v3;
      _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Checking security eligibility for %@", buf, 0xCu);

    }
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_61;
    v9[3] = &unk_1E3E68328;
    v4 = *(void **)(a1 + 40);
    v10 = *(id *)(a1 + 32);
    v5 = v4;
    v6 = *(_QWORD *)(a1 + 64);
    v11 = v5;
    v13 = v6;
    v8 = *(_OWORD *)(a1 + 48);
    v7 = (id)v8;
    v12 = v8;
    objc_msgSend(v10, "_isEnabledForSecurityRequirements:withCompletion:", 16, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_61(uint64_t a1, uint64_t a2, unint64_t a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  __int128 v10;
  _QWORD v11[4];
  __int128 v12;
  uint64_t v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    PKSecurityCapabilitiesRequirementToString(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Missing security eligibility %@", buf, 0xCu);

  }
  if ((a3 & 0x10) != 0)
  {
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_62;
    v11[3] = &unk_1E3E68300;
    v13 = *(_QWORD *)(a1 + 64);
    v10 = *(_OWORD *)(a1 + 48);
    v9 = (id)v10;
    v12 = v10;
    objc_msgSend(v7, "_presentMissingTLKsAlertWithPresentingViewController:completion:", v8, v11);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_62(_QWORD *a1, uint64_t a2, id obj)
{
  id v5;

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), obj);
  v5 = obj;
  (*(void (**)(void))(a1[4] + 16))();

}

void __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_68(uint64_t a1, uint64_t a2, unint64_t a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  __int128 v27;
  uint64_t v28;
  _QWORD v29[5];
  __int128 v30;
  uint64_t v31;
  _QWORD v32[5];
  __int128 v33;
  uint64_t v34;
  _QWORD v35[5];
  __int128 v36;
  uint64_t v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    PKSecurityCapabilitiesRequirementToString(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v39 = v6;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Missing security eligibility %@", buf, 0xCu);

  }
  if ((a3 & 8) != 0)
  {
    v11 = *(void **)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(unsigned __int8 *)(a1 + 72);
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_69;
    v35[3] = &unk_1E3E68378;
    v23 = *(_OWORD *)(a1 + 48);
    v14 = *(void **)(a1 + 48);
    v37 = *(_QWORD *)(a1 + 64);
    v35[4] = v11;
    v15 = v14;
    v36 = v23;
    objc_msgSend(v11, "_presentManateeSecurityFlowWithPresentingViewController:suppressHSA2Alert:completion:", v12, v13, v35);
    v10 = (void *)v36;
  }
  else if ((a3 & 0x80) != 0)
  {
    v16 = *(void **)(a1 + 32);
    v17 = *(_QWORD *)(a1 + 40);
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_2_71;
    v32[3] = &unk_1E3E68378;
    v34 = *(_QWORD *)(a1 + 64);
    v32[4] = v16;
    v24 = *(_OWORD *)(a1 + 48);
    v18 = (id)v24;
    v33 = v24;
    objc_msgSend(v16, "_presentManateeTermsAlertViewController:completion:", v17, v32);
    v10 = (void *)v33;
  }
  else if ((a3 & 0x44) != 0)
  {
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_3;
    v29[3] = &unk_1E3E68378;
    v31 = *(_QWORD *)(a1 + 64);
    v29[4] = v7;
    v22 = *(_OWORD *)(a1 + 48);
    v9 = (id)v22;
    v30 = v22;
    objc_msgSend(v7, "_presentDeviceToDeviceEncryptionRepairFlow:completion:", v8, v29);
    v10 = (void *)v30;
  }
  else
  {
    if (!*(_BYTE *)(a1 + 73))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      return;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "The user is hsa2/manatee capable, but a password prompt is required.", buf, 2u);
    }

    v19 = *(void **)(a1 + 32);
    v20 = *(_QWORD *)(a1 + 40);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_72;
    v26[3] = &unk_1E3E68300;
    v28 = *(_QWORD *)(a1 + 64);
    v25 = *(_OWORD *)(a1 + 48);
    v21 = (id)v25;
    v27 = v25;
    objc_msgSend(v19, "_presentPasswordPromptWithPresentingViewController:completion:", v20, v26);
    v10 = (void *)v27;
  }

}

uint64_t __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_69(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a2;
  objc_msgSend((id)objc_opt_class(), "displayableErrorForErrorCode:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[7] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

uint64_t __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_2_71(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a2;
  objc_msgSend((id)objc_opt_class(), "displayableErrorForErrorCode:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[7] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

uint64_t __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_3(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a2;
  objc_msgSend((id)objc_opt_class(), "displayableErrorForErrorCode:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[7] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

void __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_72(_QWORD *a1, uint64_t a2, id obj)
{
  id v5;

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), obj);
  v5 = obj;
  (*(void (**)(void))(a1[4] + 16))();

}

void __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_2_73(_QWORD *a1, uint64_t a2, id obj)
{
  id v5;

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), obj);
  v5 = obj;
  (*(void (**)(void))(a1[4] + 16))();

}

- (void)isEnabledForSecuirtyRequirementsWithCompletion:(id)a3
{
  -[PKSecurityCapabilitiesController _isEnabledForSecurityRequirements:withCompletion:](self, "_isEnabledForSecurityRequirements:withCompletion:", self->_securityRequirements, a3);
}

- (BOOL)isHSA2Enabled
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDAuthenticationContext altDSID](self->_authContext, "altDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "authKitAccountWithAltDSID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v3, "securityLevelForAccount:", v5);
  if (v6 == 4)
    return 1;
  objc_msgSend(MEMORY[0x1E0D66A68], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appleAccountInformation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v8) = objc_msgSend(v9, "isManagedAppleAccount");
  return (char)v8;
}

- (void)_presentMissingTLKsAlertWithPresentingViewController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  PKSecurityCapabilitiesController *v21;
  id v22;
  _QWORD v23[5];
  id v24;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (v6)
    {
      -[PKSecurityCapabilitiesController _missingTLKsAlertController](self, "_missingTLKsAlertController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedPaymentString(CFSTR("TLKS_RESET_BUTTON"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = MEMORY[0x1E0C809B0];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __100__PKSecurityCapabilitiesController__presentMissingTLKsAlertWithPresentingViewController_completion___block_invoke;
      v23[3] = &unk_1E3E683C8;
      v23[4] = self;
      v12 = v7;
      v24 = v12;
      objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 0, v23);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAction:", v13);

      v14 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedPaymentString(CFSTR("TLKS_RESET_CANCEL_BUTTON"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v11;
      v18 = 3221225472;
      v19 = __100__PKSecurityCapabilitiesController__presentMissingTLKsAlertWithPresentingViewController_completion___block_invoke_3;
      v20 = &unk_1E3E683C8;
      v21 = self;
      v22 = v12;
      objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 1, &v17);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAction:", v16, v17, v18, v19, v20, v21);

      objc_msgSend(v6, "presentViewController:animated:completion:", v8, 1, 0);
    }
    else
    {
      -[PKSecurityCapabilitiesController _genericDisplayableError](self, "_genericDisplayableError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, uint64_t, void *))v7 + 2))(v7, 2, v8);
    }

  }
}

void __100__PKSecurityCapabilitiesController__presentMissingTLKsAlertWithPresentingViewController_completion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[3] == 1)
  {
    MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D683B0], 0);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __100__PKSecurityCapabilitiesController__presentMissingTLKsAlertWithPresentingViewController_completion___block_invoke_2;
  v4[3] = &unk_1E3E66918;
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "_resetApplyPayManateeViewWithCompletion:", v4);

}

void __100__PKSecurityCapabilitiesController__presentMissingTLKsAlertWithPresentingViewController_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    v9 = v5;
    if (a2)
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v6 + 16))(v6, 0, 0);
    }
    else
    {
      v7 = *(_QWORD **)(a1 + 32);
      if (v7[3] == 1)
      {
        MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68520], 0);
        v7 = *(_QWORD **)(a1 + 32);
        v6 = *(_QWORD *)(a1 + 40);
      }
      objc_msgSend(v7, "_genericDisplayableError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, 2, v8);

    }
    v5 = v9;
  }

}

void __100__PKSecurityCapabilitiesController__presentMissingTLKsAlertWithPresentingViewController_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) == 1)
    MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D683A8], 0);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v3 + 16))(v3, 3, 0);

}

- (void)_resetApplyPayManateeViewWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "User wants to blow away apple pay manatee view and create new TLKs.", v6, 2u);
  }

  -[PKCloudStoreService resetApplePayManateeViewWithCompletion:](self->_cloudService, "resetApplePayManateeViewWithCompletion:", v4);
}

- (void)_presentDeviceToDeviceEncryptionRepairFlow:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    if (v6)
    {
      PKLogFacilityTypeGetObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Presenting CDPUIDeviceToDeviceEncryptionHelper", buf, 2u);
      }

      if (PKPaymentSetupContextIsBridge())
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v6, "presentedViewController");
          v10 = objc_claimAutoreleasedReturnValue();

          v6 = (id)v10;
        }
      }
      v11 = objc_alloc(MEMORY[0x1E0D157D0]);
      -[AKAppleIDAuthenticationContext altDSID](self->_authContext, "altDSID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithAltDSID:", v12);

      objc_msgSend(v13, "setPresentingViewController:", v6);
      objc_msgSend(v13, "setDeviceToDeviceEncryptionUpgradeType:", 0);
      objc_msgSend(v13, "setDeviceToDeviceEncryptionUpgradeUIStyle:", 3);
      objc_msgSend(v13, "setSecurityUpgradeContext:", *MEMORY[0x1E0D00090]);
      -[PKSecurityCapabilitiesController _authenticationReason](self, "_authenticationReason");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setFeatureName:", v14);

      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D157D8]), "initWithContext:", v13);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __90__PKSecurityCapabilitiesController__presentDeviceToDeviceEncryptionRepairFlow_completion___block_invoke;
      v16[3] = &unk_1E3E653D8;
      v17 = v8;
      objc_msgSend(v15, "performDeviceToDeviceEncryptionStateRepairWithCompletion:", v16);

    }
    else
    {
      (*((void (**)(id, uint64_t))v7 + 2))(v7, 2);
    }
  }

}

void __90__PKSecurityCapabilitiesController__presentDeviceToDeviceEncryptionRepairFlow_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void (*v8)(void);
  void *v9;
  int v10;
  int v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    v11 = 138412546;
    v12 = v7;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Completed CDPUIDeviceToDeviceEncryptionHelper with didRepair %@, error %@", (uint8_t *)&v11, 0x16u);
  }

  if (a2)
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    objc_msgSend(v5, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D15750]);

    if (v10)
      objc_msgSend(v5, "code");
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v8();

}

- (void)_presentManateeSecurityFlowWithPresentingViewController:(id)a3 suppressHSA2Alert:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  unint64_t feature;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;

  v8 = a3;
  v9 = a5;
  feature = self->_feature;
  if (feature == 1)
  {
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_TWO_FACTOR_AUTH_REQUIRED_MESSAGE"));
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (feature == 2)
      PKLocalizedFeatureString();
    else
      PKLocalizedPaymentString(CFSTR("TWO_FACTOR_AUTH_REQUIRED_MESSAGE"));
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;
  if (a4 || -[PKSecurityCapabilitiesController isHSA2Enabled](self, "isHSA2Enabled"))
  {
    -[PKSecurityCapabilitiesController _presentDeviceToDeviceEncryptionRepairFlow:completion:](self, "_presentDeviceToDeviceEncryptionRepairFlow:completion:", v8, v9);
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0DC3450];
    PKLocalizedPaymentString(CFSTR("TWO_FACTOR_AUTH_REQUIRED_TITLE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "alertControllerWithTitle:message:preferredStyle:", v14, v12, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPaymentString(CFSTR("TWO_FACTOR_AUTH_REQUIRED_UPGRADE_BUTTON"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __121__PKSecurityCapabilitiesController__presentManateeSecurityFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke;
    v30[3] = &unk_1E3E683F0;
    v30[4] = self;
    v19 = v8;
    v31 = v19;
    v20 = v9;
    v32 = v20;
    objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 0, v30);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAction:", v21);

    v22 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPaymentString(CFSTR("TWO_FACTOR_AUTH_REQUIRED_CANCEL_BUTTON"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v18;
    v26 = 3221225472;
    v27 = __121__PKSecurityCapabilitiesController__presentManateeSecurityFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_2;
    v28 = &unk_1E3E61CA8;
    v29 = v20;
    objc_msgSend(v22, "actionWithTitle:style:handler:", v23, 1, &v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAction:", v24, v25, v26, v27, v28);

    objc_msgSend(v19, "presentViewController:animated:completion:", v15, 1, 0);
  }

}

uint64_t __121__PKSecurityCapabilitiesController__presentManateeSecurityFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentDeviceToDeviceEncryptionRepairFlow:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __121__PKSecurityCapabilitiesController__presentManateeSecurityFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 3);
  return result;
}

- (void)_presentManateeTermsAlertViewController:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0DC3450];
  v7 = a3;
  PKLocalizedPaymentString(CFSTR("MANATEE_TERMS_ACCEPT_PROMPT_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("MANATEE_TERMS_ACCEPT_PROMPT_MESSAGE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v8, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedPaymentString(CFSTR("MANATEE_TERMS_ACCEPT_PROMPT_SETUP_BUTTON"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __87__PKSecurityCapabilitiesController__presentManateeTermsAlertViewController_completion___block_invoke;
  v25[3] = &unk_1E3E61CA8;
  v14 = v5;
  v26 = v14;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v15);

  v16 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedPaymentString(CFSTR("TWO_FACTOR_AUTH_REQUIRED_CANCEL_BUTTON"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v13;
  v21 = 3221225472;
  v22 = __87__PKSecurityCapabilitiesController__presentManateeTermsAlertViewController_completion___block_invoke_2;
  v23 = &unk_1E3E61CA8;
  v24 = v14;
  v18 = v14;
  objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 1, &v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v19, v20, v21, v22, v23);

  objc_msgSend(v7, "presentViewController:animated:completion:", v10, 1, 0);
}

void __87__PKSecurityCapabilitiesController__presentManateeTermsAlertViewController_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE"));
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openSensitiveURL:withOptions:", v4, 0);

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 3);

}

uint64_t __87__PKSecurityCapabilitiesController__presentManateeTermsAlertViewController_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 3);
  return result;
}

- (void)_presentPasswordPromptWithPresentingViewController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    PKLogFacilityTypeGetObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Presenting password prompt...", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D66A68], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appleAccountInformation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_alloc_init(MEMORY[0x1E0D002F8]);
    objc_msgSend(v12, "setPresentingViewController:", v6);
    objc_msgSend(v11, "appleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setUsername:", v13);

    objc_msgSend(v11, "aaAlternateDSID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAltDSID:", v14);

    objc_msgSend(v12, "setIsUsernameEditable:", 0);
    objc_msgSend(v12, "setShouldPromptForPasswordOnly:", 1);
    objc_msgSend(v12, "setAuthenticationType:", 2);
    -[PKSecurityCapabilitiesController _authenticationReason](self, "_authenticationReason");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setReason:", v15);

    v16 = objc_alloc_init(MEMORY[0x1E0D00130]);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __98__PKSecurityCapabilitiesController__presentPasswordPromptWithPresentingViewController_completion___block_invoke;
    v17[3] = &unk_1E3E68440;
    v19 = v8;
    v17[4] = self;
    v18 = v6;
    objc_msgSend(v16, "authenticateWithContext:completion:", v12, v17);

  }
}

void __98__PKSecurityCapabilitiesController__presentPasswordPromptWithPresentingViewController_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__PKSecurityCapabilitiesController__presentPasswordPromptWithPresentingViewController_completion___block_invoke_2;
  block[3] = &unk_1E3E66418;
  v13 = v5;
  v14 = v6;
  v7 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v17 = v7;
  v15 = v8;
  v16 = v9;
  v10 = v6;
  v11 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __98__PKSecurityCapabilitiesController__presentPasswordPromptWithPresentingViewController_completion___block_invoke_2(id *a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(void);
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(id, uint64_t, void *);
  void *v19;
  void (**v20)(id, uint64_t, void *);
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1[4], "allKeys");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = a1[5];
    *(_DWORD *)buf = 138412546;
    v28 = v3;
    v29 = 2112;
    v30 = v4;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Request for user authentication returned result with keys: %@ error: %@", buf, 0x16u);

  }
  v5 = a1[5];
  if (!v5)
  {
    v9 = (void (*)(void))*((_QWORD *)a1[8] + 2);
    goto LABEL_8;
  }
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CFFF10];
  if (objc_msgSend(v6, "isEqual:", *MEMORY[0x1E0CFFF10]))
  {
    v8 = objc_msgSend(a1[5], "code");

    if (v8 == -7003)
    {
      v9 = (void (*)(void))*((_QWORD *)a1[8] + 2);
LABEL_8:
      v9();
      return;
    }
  }
  else
  {

  }
  objc_msgSend(a1[5], "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "isEqual:", v7))
  {

    goto LABEL_15;
  }
  v11 = objc_msgSend(a1[5], "code");

  if (v11 != -7005)
  {
LABEL_15:
    v18 = (void (**)(id, uint64_t, void *))a1[8];
    objc_msgSend(a1[6], "_genericDisplayableError");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2](v18, 2, v19);

    goto LABEL_16;
  }
  PKLocalizedPaymentString(CFSTR("COULD_NOT_CONNECT_TITLE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("COULD_NOT_CONNECT_MESSAGE"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v12, v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __98__PKSecurityCapabilitiesController__presentPasswordPromptWithPresentingViewController_completion___block_invoke_116;
  v24 = &unk_1E3E68418;
  v26 = a1[8];
  v25 = a1[5];
  objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 1, &v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v17, v21, v22, v23, v24);

  if (!v14)
  {
LABEL_16:
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Error: Tried to present a user error for authentication request but could not generate one. Exiting", buf, 2u);
    }

    v20 = (void (**)(id, uint64_t, void *))a1[8];
    objc_msgSend(a1[6], "_genericDisplayableError");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2](v20, 2, v14);
    goto LABEL_19;
  }
  objc_msgSend(a1[7], "presentViewController:animated:completion:", v14, 1, 0);
LABEL_19:

}

uint64_t __98__PKSecurityCapabilitiesController__presentPasswordPromptWithPresentingViewController_completion___block_invoke_116(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 2, *(_QWORD *)(a1 + 32));
}

- (void)_isEnabledForSecurityRequirements:(unint64_t)a3 withCompletion:(id)a4
{
  id v6;
  int IsBridge;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  BOOL v14;
  int v15;
  BOOL v16;
  char v17;
  id v18;
  _QWORD block[4];
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  unint64_t v23;
  _QWORD v24[4];
  NSObject *v25;
  uint64_t *v26;
  uint64_t *v27;
  _QWORD v28[4];
  NSObject *v29;
  uint64_t *v30;
  uint64_t *v31;
  BOOL v32;
  BOOL v33;
  BOOL v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint8_t buf[4];
  _BYTE v44[14];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 1;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  IsBridge = PKPaymentSetupContextIsBridge();
  v8 = dispatch_group_create();
  PKLogFacilityTypeGetObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    PKSecurityCapabilitiesRequirementToString(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v44 = v10;
    _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Checking security requirements: %@", buf, 0xCu);

  }
  v11 = MEMORY[0x1E0C809B0];
  if (IsBridge && PKPassbookIsCurrentlyDeletedByUser())
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      PKSecurityCapabilitiesRequirementToString(a3 & 0x38);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v44 = 1;
      *(_WORD *)&v44[4] = 2112;
      *(_QWORD *)&v44[6] = v12;
      _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Is Bridge: %d, Skipping requirement checks: %@", buf, 0x12u);

    }
    goto LABEL_11;
  }
  if ((a3 & 0xA8) != 0)
  {
    dispatch_group_enter(v8);
    v28[0] = v11;
    v28[1] = 3221225472;
    v28[2] = __85__PKSecurityCapabilitiesController__isEnabledForSecurityRequirements_withCompletion___block_invoke;
    v28[3] = &unk_1E3E68490;
    v32 = (a3 & 8) != 0;
    v30 = &v39;
    v31 = &v35;
    v33 = (a3 & 0x20) != 0;
    v34 = (a3 & 0x80) != 0;
    v29 = v8;
    -[PKSecurityCapabilitiesController _isManateeCapableWithCompletion:](self, "_isManateeCapableWithCompletion:", v28);

  }
  if ((a3 & 0x10) != 0)
  {
    dispatch_group_enter(v8);
    v24[0] = v11;
    v24[1] = 3221225472;
    v24[2] = __85__PKSecurityCapabilitiesController__isEnabledForSecurityRequirements_withCompletion___block_invoke_3;
    v24[3] = &unk_1E3E66148;
    v26 = &v39;
    v27 = &v35;
    v25 = v8;
    -[PKSecurityCapabilitiesController _isMissingTLKsWithCompletion:](self, "_isMissingTLKsWithCompletion:", v24);
    v9 = v25;
LABEL_11:

  }
  if ((a3 & 4) != 0)
  {
    v13 = -[PKSecurityCapabilitiesController isHSA2Enabled](self, "isHSA2Enabled");
    v14 = *((_BYTE *)v40 + 24) && v13;
    *((_BYTE *)v40 + 24) = v14;
    if (!v13)
      v36[3] |= 4uLL;
  }
  if ((a3 & 0x40) != 0)
  {
    v15 = PKPasscodeEnabled();
    if (v15)
      v16 = *((_BYTE *)v40 + 24) == 0;
    else
      v16 = 1;
    v17 = !v16;
    *((_BYTE *)v40 + 24) = v17;
    if (!v15)
      v36[3] |= 0x40uLL;
  }
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __85__PKSecurityCapabilitiesController__isEnabledForSecurityRequirements_withCompletion___block_invoke_5;
  block[3] = &unk_1E3E684E0;
  v22 = &v35;
  v23 = a3;
  v20 = v6;
  v21 = &v39;
  v18 = v6;
  dispatch_group_notify(v8, MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);
}

void __85__PKSecurityCapabilitiesController__isEnabledForSecurityRequirements_withCompletion___block_invoke(uint64_t a1, char a2, char a3, char a4)
{
  id v4;
  __int128 v5;
  _QWORD block[4];
  __int128 v7;
  uint64_t v8;
  char v9;
  __int16 v10;
  char v11;
  char v12;
  char v13;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__PKSecurityCapabilitiesController__isEnabledForSecurityRequirements_withCompletion___block_invoke_2;
  block[3] = &unk_1E3E68468;
  v9 = a2;
  v10 = *(_WORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 48);
  v11 = a3;
  v12 = *(_BYTE *)(a1 + 58);
  v5 = *(_OWORD *)(a1 + 32);
  v13 = a4;
  v4 = (id)v5;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __85__PKSecurityCapabilitiesController__isEnabledForSecurityRequirements_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  char v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v2 = *(_BYTE *)(v1 + 24);
  if (v2)
    v2 = *(_BYTE *)(a1 + 56) != 0;
  *(_BYTE *)(v1 + 24) = v2;
  if (*(_BYTE *)(a1 + 57) && !*(_BYTE *)(a1 + 56))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= 8uLL;
  if (*(_BYTE *)(a1 + 58) && !*(_BYTE *)(a1 + 59))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= 0x20uLL;
  if (*(_BYTE *)(a1 + 60) && *(_BYTE *)(a1 + 61))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= 0x80uLL;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __85__PKSecurityCapabilitiesController__isEnabledForSecurityRequirements_withCompletion___block_invoke_3(uint64_t a1, char a2)
{
  id v2;
  __int128 v3;
  _QWORD block[4];
  __int128 v5;
  uint64_t v6;
  char v7;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__PKSecurityCapabilitiesController__isEnabledForSecurityRequirements_withCompletion___block_invoke_4;
  block[3] = &unk_1E3E684B8;
  v7 = a2;
  v6 = *(_QWORD *)(a1 + 48);
  v3 = *(_OWORD *)(a1 + 32);
  v2 = (id)v3;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __85__PKSecurityCapabilitiesController__isEnabledForSecurityRequirements_withCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  char v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v2 = *(_BYTE *)(v1 + 24);
  if (v2)
    v2 = *(_BYTE *)(a1 + 56) == 0;
  *(_BYTE *)(v1 + 24) = v2;
  if (*(_BYTE *)(a1 + 56))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= 0x10uLL;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __85__PKSecurityCapabilitiesController__isEnabledForSecurityRequirements_withCompletion___block_invoke_5(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  const __CFString *v4;
  void *v5;
  uint64_t result;
  int v7;
  void *v8;
  __int16 v9;
  const __CFString *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    PKSecurityCapabilitiesRequirementToString(a1[7]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    PKSecurityCapabilitiesRequirementToString(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Finished checking security requirements for %@. isEnabled %@, missing requirements: %@", (uint8_t *)&v7, 0x20u);

  }
  result = a1[4];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
  return result;
}

- (id)_missingTLKsAlertController
{
  unint64_t feature;
  void *v3;
  void *v4;
  void *v5;

  feature = self->_feature;
  if (feature > 5)
  {
    v4 = 0;
    v3 = 0;
  }
  else
  {
    if (((1 << feature) & 0x39) != 0)
    {
      PKLocalizedPaymentString(CFSTR("TLKS_RESET_FAILED_TITLE"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("TLKS_RESET_FAILED_MESSAGE"));
    }
    else
    {
      PKLocalizedFeatureString();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_genericDisplayableError
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = 0;
  v3 = 0;
  switch(self->_feature)
  {
    case 0uLL:
    case 5uLL:
      PKLocalizedPaymentString(CFSTR("GENERIC_ERROR_TITLE"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("GENERIC_ERROR_MESSAGE"));
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 1uLL:
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SETUP_GENERIC_ERROR_TITLE"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SETUP_GENERIC_ERROR_MESSAGE"));
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 2uLL:
      PKLocalizedFeatureString();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_5:
      v3 = (void *)v4;
      break;
    case 3uLL:
    case 4uLL:
      break;
    default:
      v3 = 0;
      break;
  }
  PKDisplayableErrorCustom();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_createAuthContext
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
  objc_msgSend(v3, "aa_primaryAppleAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "altDSIDForAccount:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x1E0D00128]);
  objc_msgSend(v7, "setAltDSID:", v6);
  objc_msgSend(v7, "setSecurityUpgradeContext:", *MEMORY[0x1E0D00090]);
  -[PKSecurityCapabilitiesController _authenticationReason](self, "_authenticationReason");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setReason:", v8);

  return v7;
}

- (void)_isManateeCapableWithCompletion:(id)a3
{
  id v4;
  PKCloudStoreService *cloudService;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if (v4)
  {
    cloudService = self->_cloudService;
    PKCurrentCloudStoreApplePayContainerName();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __68__PKSecurityCapabilitiesController__isManateeCapableWithCompletion___block_invoke;
    v7[3] = &unk_1E3E68508;
    v8 = v4;
    -[PKCloudStoreService cloudStoreStatusForContainer:completion:](cloudService, "cloudStoreStatusForContainer:completion:", v6, v7);

  }
}

uint64_t __68__PKSecurityCapabilitiesController__isManateeCapableWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  v6 = objc_msgSend(v5, "supportsDeviceToDeviceEncryption");
  v7 = objc_msgSend(v5, "needsToVerifyTerms");

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v6, a3, v7);
}

- (void)_isMissingTLKsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  PKCloudStoreService *cloudService;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    cloudService = self->_cloudService;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __65__PKSecurityCapabilitiesController__isMissingTLKsWithCompletion___block_invoke;
    v7[3] = &unk_1E3E653D8;
    v8 = v4;
    -[PKCloudStoreService checkTLKsMissingWithCompletion:](cloudService, "checkTLKsMissingWithCompletion:", v7);

  }
}

uint64_t __65__PKSecurityCapabilitiesController__isMissingTLKsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_authenticationReason
{
  void *v3;
  void *v4;
  int IsBridge;
  void *v6;
  void *v7;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D66A68], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appleAccountInformation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_feature - 1 > 1)
  {
    v7 = 0;
  }
  else
  {
    IsBridge = PKPaymentSetupContextIsBridge();
    PKDeviceSpecificLocalizedStringKeyForKey(CFSTR("ACCOUNT_PROVISION_PASS_AUTHENTICATION_REASON_FORMAT"), IsBridge);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (unint64_t)feature
{
  return self->_feature;
}

- (unint64_t)securityRequirements
{
  return self->_securityRequirements;
}

- (int64_t)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudService, 0);
  objc_storeStrong((id *)&self->_authContext, 0);
}

@end
