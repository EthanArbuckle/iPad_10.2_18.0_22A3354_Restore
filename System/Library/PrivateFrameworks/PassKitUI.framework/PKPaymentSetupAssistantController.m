@implementation PKPaymentSetupAssistantController

- (PKPaymentSetupAssistantController)initWithSetupAssistantContext:(id)a3
{
  id v5;
  PKPaymentSetupAssistantController *v6;
  PKPaymentSetupAssistantController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupAssistantController;
  v6 = -[PKPaymentSetupAssistantCoreController initWithSetupAssistantContext:](&v9, sel_initWithSetupAssistantContext_, v5);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_setupAssistantContext, a3);

  return v7;
}

- (PKPaymentSetupAssistantController)initWithSetupAssistant:(unint64_t)a3 setupAssistantContext:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  PKPaymentSetupAssistantController *v9;
  PKSetupAssistantContext *v10;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    if (a3 == 2)
      v8 = 2;
    else
      v8 = 1;
    if (objc_msgSend(v6, "setupAssistant") != v8)
      objc_msgSend(v7, "setSetupAssistant:", v8);
    v9 = -[PKPaymentSetupAssistantController initWithSetupAssistantContext:](self, "initWithSetupAssistantContext:", v7);
  }
  else
  {
    v10 = -[PKSetupAssistantContext initWithSetupAssistant:]([PKSetupAssistantContext alloc], "initWithSetupAssistant:", a3);
    v9 = -[PKPaymentSetupAssistantController initWithSetupAssistantContext:](self, "initWithSetupAssistantContext:", v10);

  }
  return v9;
}

- (BOOL)isFollowupNeededReturningRequirements:(unint64_t *)a3
{
  PKSetupAssistantContext *setupAssistantContext;
  char v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  setupAssistantContext = self->_setupAssistantContext;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__PKPaymentSetupAssistantController_isFollowupNeededReturningRequirements___block_invoke;
  v6[3] = &unk_1E3E6B638;
  v6[4] = self;
  v6[5] = &v7;
  v6[6] = a3;
  -[PKSetupAssistantContext prepareForFollowupQueryWithHandler:](setupAssistantContext, "prepareForFollowupQueryWithHandler:", v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __75__PKPaymentSetupAssistantController_isFollowupNeededReturningRequirements___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_setupAssistantNeedsToRunReturningRequirements:", *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)prepareForPresentationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __74__PKPaymentSetupAssistantController_prepareForPresentationWithCompletion___block_invoke;
    v7[3] = &unk_1E3E6B688;
    v7[4] = self;
    v8 = v4;
    -[PKPaymentSetupAssistantCoreController _extendedSetupAssistantNeedsToRunWithCompletion:](self, "_extendedSetupAssistantNeedsToRunWithCompletion:", v7);

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Error: No completion provided to prepareForPresentationWithCompletion:", buf, 2u);
    }

  }
}

void __74__PKPaymentSetupAssistantController_prepareForPresentationWithCompletion___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;
  char v7;

  if (a3 || !a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __74__PKPaymentSetupAssistantController_prepareForPresentationWithCompletion___block_invoke_2;
    v4[3] = &unk_1E3E6B660;
    v7 = 1;
    v3 = *(void **)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    v6 = 0;
    objc_msgSend(v3, "_setupAssistantViewControllerWithCompletion:", v4);

  }
}

uint64_t __74__PKPaymentSetupAssistantController_prepareForPresentationWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  uint64_t v4;

  if (a2)
    v3 = *(_BYTE *)(a1 + 48) == 0;
  else
    v3 = 1;
  v4 = !v3;
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v4, a2, *(_QWORD *)(a1 + 40));
}

- (BOOL)_isExpressSetupAssistant
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (void)_setupAssistantViewControllerWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  unint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  unint64_t v10;
  int v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    v5 = -[PKSetupAssistantContext setupAssistant](self->_setupAssistantContext, "setupAssistant");
    if (v5 == 2)
    {
      if (-[PKPaymentSetupAssistantController _isExpressSetupAssistant](self, "_isExpressSetupAssistant"))
        v8 = 6;
      else
        v8 = 5;
      -[PKPaymentSetupAssistantController _bridgeStartingViewControllerForPaymentSetupContext:completion:](self, "_bridgeStartingViewControllerForPaymentSetupContext:completion:", v8, v4);
    }
    else if (v5 == 1)
    {
      if (-[PKPaymentSetupAssistantController _isExpressSetupAssistant](self, "_isExpressSetupAssistant"))
        v6 = 2;
      else
        v6 = 1;
      -[PKPaymentSetupAssistantController _phoneStartingViewControllerForPaymentSetupContext:completion:](self, "_phoneStartingViewControllerForPaymentSetupContext:completion:", v6, v4);
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = -[PKSetupAssistantContext setupAssistant](self->_setupAssistantContext, "setupAssistant");
        v11 = 134217984;
        v12 = v10;
        _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Error: _setupAssistantViewControllerWithCompletion called with unsupported type %lu. File a radar!", (uint8_t *)&v11, 0xCu);
      }

      v4[2](v4, 0);
    }
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Error: No completion provided to setupAssistantStartingViewController", (uint8_t *)&v11, 2u);
    }

  }
}

- (void)_bridgeStartingViewControllerForPaymentSetupContext:(int64_t)a3 completion:(id)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  PKSetupAssistantContext *setupAssistantContext;
  uint64_t v11;
  id v12;
  void (**v13)(void *, void *);
  PKSetupAssistantContext *v14;
  id v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PKSetupAssistantPeerPaymentAddAssociatedAccountViewController *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int64_t v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  PKPaymentSetupAssistantController *v36;
  id v37;
  void (**v38)(void *, void *);
  SEL v39;
  int64_t v40;
  _QWORD aBlock[4];
  id v42;
  SEL v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  PKSetupAssistantContext *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  PKLogFacilityTypeGetObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    setupAssistantContext = self->_setupAssistantContext;
    *(_DWORD *)buf = 138543618;
    v45 = v9;
    v46 = 2112;
    v47 = setupAssistantContext;
    _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ with context: %@", buf, 0x16u);

  }
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __100__PKPaymentSetupAssistantController__bridgeStartingViewControllerForPaymentSetupContext_completion___block_invoke;
  aBlock[3] = &unk_1E3E6B6B0;
  v43 = a2;
  v12 = v7;
  v42 = v12;
  v13 = (void (**)(void *, void *))_Block_copy(aBlock);
  if (self->_setupAssistantContext)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = self->_setupAssistantContext;
      -[PKSetupAssistantContext parentFamilyMember](v14, "parentFamilyMember");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      -[PKSetupAssistantContext pairingFamilyMember](v14, "pairingFamilyMember");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
        v17 = v15 == 0;
      else
        v17 = 1;
      if (!v17)
      {
        v32 = a3;
        -[objc_class watchPeerPaymentWebService](getNPKCompanionAgentConnectionClass_2(), "watchPeerPaymentWebService");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v18;
        objc_msgSend(v18, "targetDevice");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "account");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = v19;
        objc_msgSend(v19, "targetDevice");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "account");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        buf[0] = 0;
        -[PKPaymentSetupAssistantCoreController _shouldRunAppleCashFlow:shouldRunPaymentSetupFlow:pairingFamilyMember:pairingPeerPaymentAccount:parentFamilyMember:parentPeerPaymentAccount:](self, "_shouldRunAppleCashFlow:shouldRunPaymentSetupFlow:pairingFamilyMember:pairingPeerPaymentAccount:parentFamilyMember:parentPeerPaymentAccount:", buf, 0, v16, v29, v15, v22);
        if (buf[0])
        {
          v23 = [PKSetupAssistantPeerPaymentAddAssociatedAccountViewController alloc];
          -[PKSetupAssistantContext dataProvider](v14, "dataProvider");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKSetupAssistantContext peerPaymentDelegate](v14, "peerPaymentDelegate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[PKSetupAssistantPeerPaymentAddAssociatedAccountViewController initWithPairingFamilyMember:parentFamilyMember:webService:passLibraryDataProvider:delegate:context:](v23, "initWithPairingFamilyMember:parentFamilyMember:webService:passLibraryDataProvider:delegate:context:", v16, v15, v31, v24, v25, v32);
          v33 = v22;
          v27 = (void *)v26;

          v13[2](v13, v27);
          goto LABEL_18;
        }

        a3 = v32;
      }

      v11 = MEMORY[0x1E0C809B0];
    }
  }
  -[objc_class watchPaymentWebService](getNPKCompanionAgentConnectionClass_2(), "watchPaymentWebService");
  v14 = (PKSetupAssistantContext *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupAssistantCoreController _provisioningControllerWithWebService:](self, "_provisioningControllerWithWebService:", v14);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (PKIsAltAccountPairedOrPairing())
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Configuring provisoning controller for alt account", buf, 2u);
    }

    objc_msgSend(v28, "setIsProvisioningForAltAccount:", 1);
  }
  v34[0] = v11;
  v34[1] = 3221225472;
  v34[2] = __100__PKPaymentSetupAssistantController__bridgeStartingViewControllerForPaymentSetupContext_completion___block_invoke_42;
  v34[3] = &unk_1E3E6B728;
  v37 = v12;
  v35 = v28;
  v39 = a2;
  v38 = v13;
  v36 = self;
  v40 = a3;
  v15 = v28;
  -[PKPaymentSetupAssistantCoreController _preflightPaymentSetupProvisioningController:completion:](self, "_preflightPaymentSetupProvisioningController:completion:", v15, v34);

  v16 = v37;
LABEL_18:

}

void __100__PKPaymentSetupAssistantController__bridgeStartingViewControllerForPaymentSetupContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ returning: %@", (uint8_t *)&v8, 0x16u);

  }
  MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68488], 0);
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

void __100__PKPaymentSetupAssistantController__bridgeStartingViewControllerForPaymentSetupContext_completion___block_invoke_42(uint64_t a1, char a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  PKPaymentSetupAssistantDelegateProxy *v7;
  void *v8;
  PKPaymentSetupAssistantDelegateProxy *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  PKPaymentSetupAssistantDelegateProxy *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[4];
  PKPaymentSetupAssistantDelegateProxy *v18;
  id v19;
  __int128 *v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v26;
  char v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) != 0)
  {
    if (!PKIsAltAccountPairedOrPairing())
    {
LABEL_5:
      v7 = [PKPaymentSetupAssistantDelegateProxy alloc];
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[PKPaymentSetupAssistantDelegateProxy initWithDelegate:provisioningController:](v7, "initWithDelegate:provisioningController:", v8, *(_QWORD *)(a1 + 32));

      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67540]), "initWithEnvironment:provisioningController:groupsController:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), 0);
      objc_msgSend(v10, "setIsFollowupSetupAssistant:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "isFollowupAction"));
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v26 = 0x2020000000;
      v27 = 0;
      v11 = MEMORY[0x1E0C809B0];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __100__PKPaymentSetupAssistantController__bridgeStartingViewControllerForPaymentSetupContext_completion___block_invoke_46;
      v22[3] = &unk_1E3E6B6D8;
      v23 = *(id *)(a1 + 56);
      p_buf = &buf;
      v17[0] = v11;
      v17[1] = 3221225472;
      v17[2] = __100__PKPaymentSetupAssistantController__bridgeStartingViewControllerForPaymentSetupContext_completion___block_invoke_2;
      v17[3] = &unk_1E3E6B700;
      v13 = *(void **)(a1 + 56);
      v12 = *(_QWORD *)(a1 + 64);
      v20 = &buf;
      v21 = v12;
      v19 = v13;
      v14 = v9;
      v18 = v14;
      +[PKProvisioningFlowBridge startSetupAssistantFlowWithContext:allowManualEntry:onFirstViewControllerShown:completion:](PKProvisioningFlowBridge, "startSetupAssistantFlowWithContext:allowManualEntry:onFirstViewControllerShown:completion:", v10, a3, v22, v17);

      _Block_object_dispose(&buf, 8);
      return;
    }
    objc_msgSend(*(id *)(a1 + 32), "associatedCredentials");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      a3 = 0;
      goto LABEL_5;
    }
    PKLogFacilityTypeGetObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v16;
      _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ not appearing in buddy as alt account with 0 parked cards", (uint8_t *)&buf, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0);
  }
}

uint64_t __100__PKPaymentSetupAssistantController__bridgeStartingViewControllerForPaymentSetupContext_completion___block_invoke_46(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

uint64_t __100__PKPaymentSetupAssistantController__bridgeStartingViewControllerForPaymentSetupContext_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    return objc_msgSend(*(id *)(a1 + 32), "viewControllerDidTerminateSetupFlow:", 0);
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ no initial view controller found", (uint8_t *)&v5, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_phoneStartingViewControllerForPaymentSetupContext:(int64_t)a3 completion:(id)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  PKSetupAssistantContext *setupAssistantContext;
  uint64_t v11;
  id v12;
  void (**v13)(void *, id, uint64_t, uint64_t);
  id v14;
  void *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  _QWORD v21[4];
  id v22;
  void (**v23)(void *, id, uint64_t, uint64_t);
  _QWORD aBlock[5];
  id v25;
  SEL v26;
  int64_t v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  PKLogFacilityTypeGetObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    setupAssistantContext = self->_setupAssistantContext;
    *(_DWORD *)buf = 138543618;
    v29 = (uint64_t)v9;
    v30 = 2112;
    v31 = setupAssistantContext;
    _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ with context: %@", buf, 0x16u);

  }
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __99__PKPaymentSetupAssistantController__phoneStartingViewControllerForPaymentSetupContext_completion___block_invoke;
  aBlock[3] = &unk_1E3E6B750;
  v26 = a2;
  v12 = v7;
  aBlock[4] = self;
  v25 = v12;
  v27 = a3;
  v13 = (void (**)(void *, id, uint64_t, uint64_t))_Block_copy(aBlock);
  -[PKPaymentSetupAssistantCoreController provisioningController](self, "provisioningController");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v14 && (-[PKPaymentSetupAssistantCoreController preflightState](self, "preflightState") & 2) != 0)
  {
    v17 = -[PKPaymentSetupAssistantCoreController preflightState](self, "preflightState");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      v20 = CFSTR("NO");
      if ((v17 & 4) != 0)
        v20 = CFSTR("YES");
      *(_DWORD *)buf = 138543618;
      v29 = v18;
      v30 = 2112;
      v31 = (void *)v20;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Preflight already completed, using result with allowsManualEntry: %@", buf, 0x16u);

    }
    v13[2](v13, v14, 1, (v17 >> 2) & 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupAssistantCoreController _provisioningControllerWithWebService:](self, "_provisioningControllerWithWebService:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v21[0] = v11;
    v21[1] = 3221225472;
    v21[2] = __99__PKPaymentSetupAssistantController__phoneStartingViewControllerForPaymentSetupContext_completion___block_invoke_56;
    v21[3] = &unk_1E3E6B778;
    v23 = v13;
    v14 = v16;
    v22 = v14;
    -[PKPaymentSetupAssistantCoreController _preflightPaymentSetupProvisioningController:completion:](self, "_preflightPaymentSetupProvisioningController:completion:", v14, v21);

  }
}

void __99__PKPaymentSetupAssistantController__phoneStartingViewControllerForPaymentSetupContext_completion___block_invoke(uint64_t a1, void *a2, char a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  PKPaymentSetupAssistantDelegateProxy *v12;
  void *v13;
  PKPaymentSetupAssistantDelegateProxy *v14;
  void *v15;
  PKPaymentSetupAssistantDelegateProxy *v16;
  __int128 v17;
  _QWORD v18[4];
  PKPaymentSetupAssistantDelegateProxy *v19;
  id v20;
  _QWORD *v21;
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  _QWORD v25[3];
  char v26;
  _QWORD aBlock[4];
  __int128 v28;

  v7 = a2;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __99__PKPaymentSetupAssistantController__phoneStartingViewControllerForPaymentSetupContext_completion___block_invoke_2;
  aBlock[3] = &unk_1E3E6B6B0;
  v17 = *(_OWORD *)(a1 + 40);
  v9 = (id)v17;
  v28 = v17;
  v10 = _Block_copy(aBlock);
  v11 = v10;
  if ((a3 & 1) != 0)
  {
    v12 = [PKPaymentSetupAssistantDelegateProxy alloc];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PKPaymentSetupAssistantDelegateProxy initWithDelegate:provisioningController:](v12, "initWithDelegate:provisioningController:", v13, v7);

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67540]), "initWithEnvironment:provisioningController:groupsController:", *(_QWORD *)(a1 + 56), v7, 0);
    objc_msgSend(v15, "setIsFollowupSetupAssistant:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "isFollowupAction"));
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    v26 = 0;
    v22[0] = v8;
    v22[1] = 3221225472;
    v22[2] = __99__PKPaymentSetupAssistantController__phoneStartingViewControllerForPaymentSetupContext_completion___block_invoke_48;
    v22[3] = &unk_1E3E6B6D8;
    v23 = *(id *)(a1 + 40);
    v24 = v25;
    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = __99__PKPaymentSetupAssistantController__phoneStartingViewControllerForPaymentSetupContext_completion___block_invoke_2_49;
    v18[3] = &unk_1E3E68D90;
    v21 = v25;
    v20 = *(id *)(a1 + 40);
    v16 = v14;
    v19 = v16;
    +[PKProvisioningFlowBridge startSetupAssistantFlowWithContext:allowManualEntry:onFirstViewControllerShown:completion:](PKProvisioningFlowBridge, "startSetupAssistantFlowWithContext:allowManualEntry:onFirstViewControllerShown:completion:", v15, a4, v22, v18);

    _Block_object_dispose(v25, 8);
  }
  else
  {
    (*((void (**)(void *, _QWORD))v10 + 2))(v10, 0);
  }

}

void __99__PKPaymentSetupAssistantController__phoneStartingViewControllerForPaymentSetupContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ returning: %@", (uint8_t *)&v8, 0x16u);

  }
  MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68488], 0);
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

uint64_t __99__PKPaymentSetupAssistantController__phoneStartingViewControllerForPaymentSetupContext_completion___block_invoke_48(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

uint64_t __99__PKPaymentSetupAssistantController__phoneStartingViewControllerForPaymentSetupContext_completion___block_invoke_2_49(uint64_t a1)
{
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    return objc_msgSend(*(id *)(a1 + 32), "viewControllerDidTerminateSetupFlow:", 0);
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __99__PKPaymentSetupAssistantController__phoneStartingViewControllerForPaymentSetupContext_completion___block_invoke_56(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2, a3);
}

- (PKSetupAssistantContext)setupAssistantContext
{
  return self->_setupAssistantContext;
}

- (void)setSetupAssistantContext:(id)a3
{
  objc_storeStrong((id *)&self->_setupAssistantContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupAssistantContext, 0);
}

@end
