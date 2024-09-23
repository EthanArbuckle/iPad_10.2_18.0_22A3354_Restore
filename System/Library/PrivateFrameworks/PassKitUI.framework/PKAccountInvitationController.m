@implementation PKAccountInvitationController

- (PKAccountInvitationController)initWithAccount:(id)a3 context:(int64_t)a4 familyMemberCollection:(id)a5
{
  id v9;
  id v10;
  PKAccountInvitationController *v11;
  PKAccountInvitationController *v12;
  uint64_t v13;
  PKAccountService *accountService;
  PKPaymentService *v15;
  PKPaymentService *paymentService;
  PKDeviceSharingCapabilitiesManager *v17;
  PKDeviceSharingCapabilitiesManager *deviceCapabiltiesManager;
  dispatch_queue_t v19;
  OS_dispatch_queue *replyQueue;
  uint64_t v21;
  NSHashTable *observers;
  void *v23;
  NSObject *v24;
  void *v25;
  PKApplyControllerConfiguration *v26;
  PKApplyController *v27;
  PKApplyController *applyController;
  PKApplyController *v29;
  void *v30;
  uint8_t v32[16];
  objc_super v33;

  v9 = a3;
  v10 = a5;
  v33.receiver = self;
  v33.super_class = (Class)PKAccountInvitationController;
  v11 = -[PKAccountInvitationController init](&v33, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_account, a3);
    v12->_context = a4;
    objc_storeStrong((id *)&v12->_familyMemberCollection, a5);
    v12->_feature = objc_msgSend(v9, "feature");
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v13 = objc_claimAutoreleasedReturnValue();
    accountService = v12->_accountService;
    v12->_accountService = (PKAccountService *)v13;

    v15 = (PKPaymentService *)objc_alloc_init(MEMORY[0x1E0D672B0]);
    paymentService = v12->_paymentService;
    v12->_paymentService = v15;

    -[PKPaymentService setDelegate:](v12->_paymentService, "setDelegate:", v12);
    v17 = (PKDeviceSharingCapabilitiesManager *)objc_alloc_init(MEMORY[0x1E0D66CC0]);
    deviceCapabiltiesManager = v12->_deviceCapabiltiesManager;
    v12->_deviceCapabiltiesManager = v17;

    v12->_lockObservers._os_unfair_lock_opaque = 0;
    v19 = dispatch_queue_create("com.apple.passkitui.PKAccountInvitationController.reply", 0);
    replyQueue = v12->_replyQueue;
    v12->_replyQueue = (OS_dispatch_queue *)v19;

    objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
    v21 = objc_claimAutoreleasedReturnValue();
    observers = v12->_observers;
    v12->_observers = (NSHashTable *)v21;

    -[PKAccount applyServiceURL](v12->_account, "applyServiceURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67230]), "initWithWebService:", v24);
      v26 = -[PKApplyControllerConfiguration initWithSetupDelegate:context:provisioningController:]([PKApplyControllerConfiguration alloc], "initWithSetupDelegate:context:provisioningController:", 0, a4, v25);
      -[PKApplyControllerConfiguration setFeature:](v26, "setFeature:", v12->_feature);
      -[PKApplyControllerConfiguration setAccount:](v26, "setAccount:", v9);
      -[PKApplyControllerConfiguration setApplicationType:](v26, "setApplicationType:", 2);
      v27 = -[PKApplyController initWithApplyConfiguration:]([PKApplyController alloc], "initWithApplyConfiguration:", v26);
      applyController = v12->_applyController;
      v12->_applyController = v27;

      -[PKApplyController setApplyServiceURL:](v12->_applyController, "setApplyServiceURL:", v23);
      v29 = v12->_applyController;
      objc_msgSend(MEMORY[0x1E0D66820], "analyticsAccountTypeForAccount:", v9);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKApplyController setAnalyticsExistingAccountType:](v29, "setAnalyticsExistingAccountType:", v30);

      if (v12->_familyMemberCollection)
        -[PKAccountInvitationController _fetchFamilyMemberDeviceCapabilties](v12, "_fetchFamilyMemberDeviceCapabilties");

    }
    else
    {
      PKLogFacilityTypeGetObject();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v32 = 0;
        _os_log_impl(&dword_19D178000, v24, OS_LOG_TYPE_DEFAULT, "Cannot create invitation controller without apply service URL", v32, 2u);
      }
    }

  }
  return v12;
}

+ (BOOL)canInviteAccountUserWithAccount:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "accountUserInvitationAllowed")
    && objc_msgSend(v3, "accessLevel") == 1
    && objc_msgSend(v3, "state") == 1;

  return v4;
}

+ (void)presentCreateAccountUserInvitationWithViewController:(id)a3 account:(id)a4 accountUserCollection:(id)a5 familyMemberCollection:(id)a6 context:(int64_t)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(_QWORD);
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  void (**v29)(_QWORD);
  uint64_t *v30;
  uint64_t *v31;
  uint64_t *v32;
  id v33[2];
  _QWORD v34[6];
  id v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[5];
  id v39;
  id location;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = (void (**)(_QWORD))a8;
  objc_msgSend(v15, "stateReason");
  if (PKAccountStateReasonIsInMerge())
  {
    PKLocalizedMadisonString(CFSTR("ACCOUNT_MERGE_INITIATED_ERROR_TITLE"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedMadisonString(CFSTR("ACCOUNT_MERGE_INITIATED_ERROR_MESSAGE"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PKDisplayableErrorCustom();
    v21 = (id)objc_claimAutoreleasedReturnValue();

    v22 = PKAlertForDisplayableErrorWithHandlers(v21, 0, 0, 0);
    objc_msgSend(v14, "presentViewController:animated:completion:", v22, 1, 0);
    if (v18)
      v18[2](v18);

  }
  else
  {
    v26 = (void *)a7;
    v21 = objc_alloc_init(MEMORY[0x1E0D66B90]);
    v53 = 0;
    v54 = &v53;
    v55 = 0x3032000000;
    v56 = __Block_byref_object_copy__32;
    v57 = __Block_byref_object_dispose__32;
    v58 = v15;
    v47 = 0;
    v48 = &v47;
    v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__32;
    v51 = __Block_byref_object_dispose__32;
    v52 = v17;
    v41 = 0;
    v42 = &v41;
    v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__32;
    v45 = __Block_byref_object_dispose__32;
    v46 = v16;
    objc_initWeak(&location, a1);
    v23 = MEMORY[0x1E0C809B0];
    if (!v54[5])
    {
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke;
      v38[3] = &unk_1E3E6C778;
      objc_copyWeak(&v39, &location);
      v38[4] = &v53;
      objc_msgSend(v21, "addOperation:", v38);
      objc_destroyWeak(&v39);
    }
    if (!v48[5])
    {
      v36[0] = v23;
      v36[1] = 3221225472;
      v36[2] = __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_4;
      v36[3] = &unk_1E3E6C778;
      objc_copyWeak(&v37, &location);
      v36[4] = &v47;
      objc_msgSend(v21, "addOperation:", v36);
      objc_destroyWeak(&v37);
    }
    if (!v42[5])
    {
      v34[0] = v23;
      v34[1] = 3221225472;
      v34[2] = __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_7;
      v34[3] = &unk_1E3E6FAF8;
      objc_copyWeak(&v35, &location);
      v34[4] = &v53;
      v34[5] = &v41;
      objc_msgSend(v21, "addOperation:", v34);
      objc_destroyWeak(&v35);
    }
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v23;
    v27[1] = 3221225472;
    v27[2] = __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_10;
    v27[3] = &unk_1E3E6FB48;
    objc_copyWeak(v33, &location);
    v29 = v18;
    v30 = &v41;
    v33[1] = v26;
    v31 = &v53;
    v32 = &v47;
    v28 = v14;
    v25 = (id)objc_msgSend(v21, "evaluateWithInput:completion:", v24, v27);

    objc_destroyWeak(v33);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v41, 8);

    _Block_object_dispose(&v47, 8);
    _Block_object_dispose(&v53, 8);

  }
}

void __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_2;
    v10[3] = &unk_1E3E635E8;
    v13 = *(_QWORD *)(a1 + 32);
    v12 = v7;
    v11 = v6;
    objc_msgSend(v9, "defaultAccountForFeature:completion:", 2, v10);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }

}

void __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  __int128 v6;
  _QWORD block[4];
  id v8;
  id v9;
  __int128 v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_3;
  block[3] = &unk_1E3E6C700;
  v8 = v3;
  v6 = *(_OWORD *)(a1 + 40);
  v4 = (id)v6;
  v10 = v6;
  v9 = *(id *)(a1 + 32);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_3(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0D672B0]);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_5;
    v10[3] = &unk_1E3E63688;
    v13 = *(_QWORD *)(a1 + 32);
    v12 = v7;
    v11 = v6;
    objc_msgSend(v9, "familyMembersWithCompletion:", v10);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }

}

void __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  __int128 v6;
  _QWORD block[4];
  id v8;
  id v9;
  __int128 v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_6;
  block[3] = &unk_1E3E6C700;
  v8 = v3;
  v6 = *(_OWORD *)(a1 + 40);
  v4 = (id)v6;
  v10 = v6;
  v9 = *(id *)(a1 + 32);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_6(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66D88]), "initWithFamilyMembers:", a1[4]);
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_7(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "accountIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_8;
    v11[3] = &unk_1E3E63660;
    v14 = *(_QWORD *)(a1 + 40);
    v13 = v7;
    v12 = v6;
    objc_msgSend(v9, "accountUsersForAccountWithIdentifier:completion:", v10, v11);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }

}

void __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  __int128 v6;
  _QWORD block[4];
  id v8;
  id v9;
  __int128 v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_9;
  block[3] = &unk_1E3E6C700;
  v8 = v3;
  v6 = *(_OWORD *)(a1 + 40);
  v4 = (id)v6;
  v10 = v6;
  v9 = *(id *)(a1 + 32);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_9(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66940]), "initWithAccountUsers:", a1[4]);
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_10(uint64_t a1)
{
  uint64_t v2;
  _QWORD block[4];
  id v4;
  id v5;
  __int128 v6;
  uint64_t v7;
  id v8[2];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_11;
  block[3] = &unk_1E3E6FB20;
  objc_copyWeak(v8, (id *)(a1 + 72));
  v5 = *(id *)(a1 + 40);
  v6 = *(_OWORD *)(a1 + 48);
  v2 = *(_QWORD *)(a1 + 64);
  v8[1] = *(id *)(a1 + 80);
  v7 = v2;
  v4 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v8);
}

void __158__PKAccountInvitationController_presentCreateAccountUserInvitationWithViewController_account_accountUserCollection_familyMemberCollection_context_completion___block_invoke_11(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  unint64_t v5;
  PKAccountUserLimitReachedViewController *v6;
  PKNavigationController *v7;
  PKNavigationController *v8;
  uint64_t v9;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "activeAccountUsersExcludingCurrentAccountUser");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "count");

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "accountUserInvitationAllowedFeatureDescriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "maximumAccountUsers");

    if (v3 >= v5)
    {
      v6 = -[PKAccountUserLimitReachedViewController initWithAccount:context:]([PKAccountUserLimitReachedViewController alloc], "initWithAccount:context:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 80));
      v7 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v6);
      objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v7, 1, 0);
    }
    else
    {
      v6 = -[PKAccountInvitationController initWithAccount:context:familyMemberCollection:]([PKAccountInvitationController alloc], "initWithAccount:context:familyMemberCollection:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 80), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
      v7 = -[PKAccountInvitationOnboardingViewController initWithController:]([PKAccountInvitationOnboardingViewController alloc], "initWithController:", v6);
      v8 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v7);
      objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v8, 1, 0);

    }
  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(void))(v9 + 16))();

}

- (void)setFamilyMember:(id)a3
{
  PKFamilyMember *v5;
  PKFamilyMember *v6;

  v5 = (PKFamilyMember *)a3;
  if (self->_familyMember != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_familyMember, a3);
    -[PKApplyController setFamilyMember:](self->_applyController, "setFamilyMember:", self->_familyMember);
    v5 = v6;
  }

}

- (void)setAccessLevel:(unint64_t)a3
{
  if (self->_accessLevel != a3)
  {
    self->_accessLevel = a3;
    -[PKApplyController setAccessLevel:](self->_applyController, "setAccessLevel:");
  }
}

- (void)didUpdateFamilyMembers:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PKFamilyMemberCollection familyMembers](self->_familyMemberCollection, "familyMembers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Family members did update from existing members %@ to new members %@", buf, 0x16u);

  }
  if (v4)
  {
    -[PKFamilyMemberCollection familyMembers](self->_familyMemberCollection, "familyMembers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = PKEqualObjects();

    if ((v8 & 1) == 0)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __56__PKAccountInvitationController_didUpdateFamilyMembers___block_invoke;
      v9[3] = &unk_1E3E61388;
      v9[4] = self;
      v10 = v4;
      dispatch_async(MEMORY[0x1E0C80D38], v9);

    }
  }

}

void __56__PKAccountInvitationController_didUpdateFamilyMembers___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "altDSID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v3 = *(id *)(a1 + 40);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v17 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v8, "altDSID", (_QWORD)v16);
          v9 = (id)objc_claimAutoreleasedReturnValue();
          v10 = v2;
          v11 = v10;
          if (v9 == v10)
          {

LABEL_16:
            objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), v8);
            goto LABEL_17;
          }
          if (v9)
          {
            v12 = objc_msgSend(v9, "isEqualToString:", v10);

            if (v12)
              goto LABEL_16;
          }
          else
          {

          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_17:

  }
  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66D88]), "initWithFamilyMembers:", *(_QWORD *)(a1 + 40));
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 88);
  *(_QWORD *)(v14 + 88) = v13;

  objc_msgSend(*(id *)(a1 + 32), "_fetchFamilyMemberDeviceCapabilties");
  objc_msgSend(*(id *)(a1 + 32), "_informObserversOfFamilyMemberChange");

}

- (void)nextViewControllerWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  id v5;
  PKApplyController *applyController;
  __objc2_class *v7;
  void *v8;
  void (**v9)(id, void *, _QWORD);

  v4 = (void (**)(id, void *, _QWORD))a3;
  v9 = v4;
  if (!self->_familyMember)
  {
    v7 = PKAccountInvitationChooseMemberViewController;
LABEL_7:
    v8 = (void *)objc_msgSend([v7 alloc], "initWithController:", self);
    v9[2](v9, v8, 0);

    goto LABEL_9;
  }
  if (!self->_accessLevel)
  {
    v7 = PKAccountInvitationAccessLevelViewController;
    goto LABEL_7;
  }
  v5 = v4;
  applyController = self->_applyController;
  if (applyController)
    -[PKApplyController nextViewControllerWithCompletion:](applyController, "nextViewControllerWithCompletion:", v9);
  else
    (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, 0, 0);
LABEL_9:

}

- (BOOL)isCurrentFamilyMemberAnOrganizer
{
  void *v2;
  char v3;

  -[PKFamilyMemberCollection currentUser](self->_familyMemberCollection, "currentUser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOrganizer");

  return v3;
}

- (int64_t)familyCircleCount
{
  void *v2;
  int64_t v3;

  -[PKFamilyMemberCollection familyMembers](self->_familyMemberCollection, "familyMembers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)didAddAccountPendingFamilyMembers:(id)a3
{
  -[PKAccountService didAddAccountPendingFamilyMembers:](self->_accountService, "didAddAccountPendingFamilyMembers:", a3);
}

- (void)familyMembersForceReload:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD v19[6];
  _QWORD v20[5];
  id v21;
  _QWORD v22[7];
  _QWORD v23[5];
  id v24;
  _QWORD v25[8];
  _QWORD v26[5];
  id v27;
  _QWORD v28[6];
  _QWORD v29[5];
  id v30;
  _QWORD v31[6];
  _QWORD v32[5];
  id v33;
  _QWORD v34[6];
  BOOL v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[5];
  BOOL v39;

  v4 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D66B90]);
    v8 = v7;
    if (self->_familyMemberCollection)
      v9 = !v4;
    else
      v9 = 0;
    v10 = MEMORY[0x1E0C809B0];
    if (!v9)
    {
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke;
      v38[3] = &unk_1E3E6FB70;
      v38[4] = self;
      v39 = v4;
      objc_msgSend(v7, "addOperation:", v38);
    }
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x3032000000;
    v36[3] = __Block_byref_object_copy__32;
    v36[4] = __Block_byref_object_dispose__32;
    v37 = 0;
    v34[0] = v10;
    v34[1] = 3221225472;
    v34[2] = __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_4;
    v34[3] = &unk_1E3E6FB98;
    v35 = v4;
    v34[4] = self;
    v34[5] = v36;
    objc_msgSend(v8, "addOperation:", v34);
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3032000000;
    v32[3] = __Block_byref_object_copy__32;
    v32[4] = __Block_byref_object_dispose__32;
    v33 = 0;
    v31[0] = v10;
    v31[1] = 3221225472;
    v31[2] = __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_7;
    v31[3] = &unk_1E3E64F70;
    v31[4] = self;
    v31[5] = v32;
    objc_msgSend(v8, "addOperation:", v31);
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = __Block_byref_object_copy__32;
    v29[4] = __Block_byref_object_dispose__32;
    v30 = 0;
    v28[0] = v10;
    v28[1] = 3221225472;
    v28[2] = __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_10;
    v28[3] = &unk_1E3E64F70;
    v28[4] = self;
    v28[5] = v29;
    objc_msgSend(v8, "addOperation:", v28);
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x3032000000;
    v26[3] = __Block_byref_object_copy__32;
    v26[4] = __Block_byref_object_dispose__32;
    v27 = 0;
    v25[0] = v10;
    v25[1] = 3221225472;
    v25[2] = __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_13;
    v25[3] = &unk_1E3E6FC50;
    v25[4] = self;
    v25[5] = v26;
    v25[6] = v32;
    v25[7] = v29;
    objc_msgSend(v8, "addOperation:", v25);
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x3032000000;
    v23[3] = __Block_byref_object_copy__32;
    v23[4] = __Block_byref_object_dispose__32;
    v24 = 0;
    v22[0] = v10;
    v22[1] = 3221225472;
    v22[2] = __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_15;
    v22[3] = &unk_1E3E6FD08;
    v22[4] = self;
    v22[5] = v26;
    v22[6] = v23;
    objc_msgSend(v8, "addOperation:", v22);
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x3032000000;
    v20[3] = __Block_byref_object_copy__32;
    v20[4] = __Block_byref_object_dispose__32;
    v21 = 0;
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_19;
    v19[3] = &unk_1E3E67E68;
    v19[4] = v36;
    v19[5] = v20;
    objc_msgSend(v8, "addOperation:", v19);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_20;
    v13[3] = &unk_1E3E6FD30;
    v14 = v6;
    v15 = v26;
    v16 = v36;
    v17 = v23;
    v18 = v20;
    v12 = (id)objc_msgSend(v8, "evaluateWithInput:completion:", v11, v13);

    _Block_object_dispose(v20, 8);
    _Block_object_dispose(v23, 8);

    _Block_object_dispose(v26, 8);
    _Block_object_dispose(v29, 8);

    _Block_object_dispose(v32, 8);
    _Block_object_dispose(v36, 8);

  }
}

void __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 8);
  v10 = *(unsigned __int8 *)(a1 + 40);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_2;
  v13[3] = &unk_1E3E65FE0;
  v14 = v6;
  v15 = v7;
  v13[4] = v8;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v9, "familyMembersIgnoringCache:completion:", v10, v13);

}

void __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_3;
  v5[3] = &unk_1E3E65E08;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v8 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 40);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66D88]), "initWithFamilyMembers:", a1[5]);
  v3 = a1[4];
  v4 = *(void **)(v3 + 88);
  *(_QWORD *)(v3 + 88) = v2;

  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

void __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(unsigned __int8 *)(a1 + 48);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_5;
  v13[3] = &unk_1E3E63688;
  v15 = v7;
  v16 = v8;
  v14 = v6;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v9, "pendingFamilyMembersIgnoringCache:completion:", v10, v13);

}

void __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  __int128 v6;
  _QWORD block[4];
  id v8;
  id v9;
  __int128 v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_6;
  block[3] = &unk_1E3E6C700;
  v8 = v3;
  v6 = *(_OWORD *)(a1 + 40);
  v4 = (id)v6;
  v10 = v6;
  v9 = *(id *)(a1 + 32);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_6(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_7(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 16);
  objc_msgSend(*(id *)(v8 + 48), "accountIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_8;
  v14[3] = &unk_1E3E6FBC0;
  v11 = *(_QWORD *)(a1 + 40);
  v16 = v7;
  v17 = v11;
  v15 = v6;
  v12 = v6;
  v13 = v7;
  objc_msgSend(v9, "updateAccountUsersForAccountWithIdentifier:completion:", v10, v14);

}

void __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  __int128 v6;
  _QWORD block[4];
  id v8;
  id v9;
  __int128 v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_9;
  block[3] = &unk_1E3E6C700;
  v8 = v3;
  v6 = *(_OWORD *)(a1 + 40);
  v4 = (id)v6;
  v10 = v6;
  v9 = *(id *)(a1 + 32);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_9(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_10(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 8);
  objc_msgSend(*(id *)(v8 + 48), "accountIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_11;
  v14[3] = &unk_1E3E6FBE8;
  v11 = *(_QWORD *)(a1 + 40);
  v16 = v7;
  v17 = v11;
  v15 = v6;
  v12 = v6;
  v13 = v7;
  objc_msgSend(v9, "updateFeatureApplicationsForAccountIdentifier:completion:", v10, v14);

}

void __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  __int128 v6;
  _QWORD block[4];
  id v8;
  id v9;
  __int128 v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_12;
  block[3] = &unk_1E3E6C700;
  v8 = v3;
  v6 = *(_OWORD *)(a1 + 40);
  v4 = (id)v6;
  v10 = v6;
  v9 = *(id *)(a1 + 32);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_12(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_13(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  _QWORD *v6;
  void *v7;
  void (**v8)(id, id, _QWORD);
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v6 = (_QWORD *)a1[4];
  v7 = (void *)v6[11];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "familyMembers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_filteredFamilyMembersFromFamilyMembers:accountUsers:invitations:", v10, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1[5] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "pk_arrayByApplyingBlock:", &__block_literal_global_125);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[4] + 80), "fetchDeviceCapabilitesForAppleIDs:associatedFamilyMembers:", v14, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));
  v8[2](v8, v9, 0);

}

uint64_t __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_14(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appleID");
}

void __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_15(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  __int128 v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "pk_arrayByApplyingBlock:", &__block_literal_global_74);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_17;
  v12[3] = &unk_1E3E6FCE0;
  v15 = *(_OWORD *)(a1 + 40);
  v13 = v6;
  v14 = v7;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v9, "photosForFamilyMembersWithDSIDs:completion:", v8, v12);

}

uint64_t __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_16(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dsid");
}

void __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD block[4];
  id v9;
  id v10;
  __int128 v11;
  uint64_t v12;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_18;
  block[3] = &unk_1E3E6FCB8;
  v4 = *(_QWORD *)(a1 + 56);
  v9 = v3;
  v12 = v4;
  v7 = *(_OWORD *)(a1 + 40);
  v5 = (id)v7;
  v11 = v7;
  v10 = *(id *)(a1 + 32);
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_18(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v8, "dsid", (_QWORD)v16);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "altDSID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithData:", v11);
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, v10);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  v13 = objc_msgSend(v2, "copy");
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_19(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  Class FAProfilePictureStoreClass;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void (**v23)(id, id, _QWORD);
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v23 = a4;
  v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v22 = a1;
  v6 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v11, "inviteEmail", v22);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          FAProfilePictureStoreClass = getFAProfilePictureStoreClass();
          objc_msgSend(v11, "contact");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "firstName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "lastName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[objc_class profilePictureForContact:serverImageData:firstName:lastName:diameter:](FAProfilePictureStoreClass, "profilePictureForContact:serverImageData:firstName:lastName:diameter:", v14, 0, v15, v16, 80.0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithData:", v17);
            objc_msgSend(v25, "setObject:forKeyedSubscript:", v18, v12);

          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v8);
  }

  v19 = objc_msgSend(v25, "copy");
  v20 = *(_QWORD *)(*(_QWORD *)(v22 + 40) + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v19;

  v23[2](v23, v24, 0);
}

uint64_t __69__PKAccountInvitationController_familyMembersForceReload_completion___block_invoke_20(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40));
}

- (void)accessLevelOptionsWithCompletion:(id)a3
{
  id v4;
  PKPaymentService *paymentService;
  void *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    paymentService = self->_paymentService;
    -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __66__PKAccountInvitationController_accessLevelOptionsWithCompletion___block_invoke;
    v7[3] = &unk_1E3E61878;
    v7[4] = self;
    v8 = v4;
    -[PKPaymentService featureApplicationsForAccountIdentifier:completion:](paymentService, "featureApplicationsForAccountIdentifier:completion:", v6, v7);

  }
}

void __66__PKAccountInvitationController_accessLevelOptionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  objc_msgSend(a2, "pk_objectsPassingTest:", &__block_literal_global_79_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PKAccountInvitationController_accessLevelOptionsWithCompletion___block_invoke_3;
  block[3] = &unk_1E3E65388;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __66__PKAccountInvitationController_accessLevelOptionsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "invitationDetails");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "originatorAltDSID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = PKAltDSIDIsCurrentUser();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __66__PKAccountInvitationController_accessLevelOptionsWithCompletion___block_invoke_3(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  id v5;
  void *v6;
  PKAccountInvitationAccessLevelOption *v7;
  void *v8;
  void *v9;
  void *v10;
  PKAccountInvitationAccessLevelOption *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "accountUserInvitationAllowedFeatureDescriptor");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v17, "minimumParticipantAge");
  v3 = objc_msgSend(v17, "minimumOwnerAge");
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "age");
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(*(id *)(a1 + 40), "pk_firstObjectPassingTest:", &__block_literal_global_82);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "isCoOwner") & 1) == 0 && !v6 && v4 >= v3)
  {
    v7 = -[PKAccountInvitationAccessLevelOption initWithAccessLevel:]([PKAccountInvitationAccessLevelOption alloc], "initWithAccessLevel:", 1);
    PKLocalizedMadisonString(CFSTR("SHARING_TYPE_COOWN_TITLE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountInvitationAccessLevelOption setTitle:](v7, "setTitle:", v8);

    PKLocalizedMadisonString(CFSTR("SHARING_TYPE_COOWN_BODY"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountInvitationAccessLevelOption setSubtitle:](v7, "setSubtitle:", v9);

    PKUIImageNamed(CFSTR("MadisonJointOwner"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountInvitationAccessLevelOption setImage:](v7, "setImage:", v10);

    objc_msgSend(v5, "addObject:", v7);
  }
  if (v4 >= v2)
  {
    v11 = -[PKAccountInvitationAccessLevelOption initWithAccessLevel:]([PKAccountInvitationAccessLevelOption alloc], "initWithAccessLevel:", 2);
    PKLocalizedMadisonString(CFSTR("SHARING_TYPE_PARTICIPANT_TITLE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountInvitationAccessLevelOption setTitle:](v11, "setTitle:", v12);

    PKLocalizedMadisonString(CFSTR("SHARING_TYPE_PARTICIPANT_BODY"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountInvitationAccessLevelOption setSubtitle:](v11, "setSubtitle:", v13);

    PKUIImageNamed(CFSTR("MadisonParticipant"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountInvitationAccessLevelOption setImage:](v11, "setImage:", v14);

    objc_msgSend(v5, "addObject:", v11);
  }
  v15 = *(_QWORD *)(a1 + 48);
  v16 = (void *)objc_msgSend(v5, "copy");
  (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);

}

uint64_t __66__PKAccountInvitationController_accessLevelOptionsWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t IsPendingInvitation;

  v2 = a2;
  objc_msgSend(v2, "invitationDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "accountUserAccessLevel") == 1)
  {
    objc_msgSend(v2, "applicationState");
    IsPendingInvitation = PKFeatureApplicationStateIsPendingInvitation();
  }
  else
  {
    IsPendingInvitation = 0;
  }

  return IsPendingInvitation;
}

- (id)_filteredFamilyMembersFromFamilyMembers:(id)a3 accountUsers:(id)a4 invitations:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v36 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v16, "accountState");
        objc_msgSend(v16, "altDSID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17 && (PKAccountStateIsTerminal() & 1) == 0)
          objc_msgSend(v10, "addObject:", v17);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v13);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v18 = v9;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v32 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
        objc_msgSend(v23, "invitationDetails");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "accountUserAltDSID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          objc_msgSend(v23, "applicationState");
          if (PKFeatureApplicationStateIsPendingInvitation())
            objc_msgSend(v10, "addObject:", v25);
        }

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v20);
  }

  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __98__PKAccountInvitationController__filteredFamilyMembersFromFamilyMembers_accountUsers_invitations___block_invoke;
  v29[3] = &unk_1E3E6FDB8;
  v30 = v10;
  v26 = v10;
  objc_msgSend(v7, "pk_objectsPassingTest:", v29);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

uint64_t __98__PKAccountInvitationController__filteredFamilyMembersFromFamilyMembers_accountUsers_invitations___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a2;
  if ((objc_msgSend(v3, "isMe") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "altDSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "containsObject:", v6) ^ 1;

  }
  return v4;
}

- (void)_fetchFamilyMemberDeviceCapabilties
{
  void *v3;
  void *v4;
  id v5;

  -[PKFamilyMemberCollection familyMembers](self->_familyMemberCollection, "familyMembers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountInvitationController _filteredFamilyMembersFromFamilyMembers:accountUsers:invitations:](self, "_filteredFamilyMembersFromFamilyMembers:accountUsers:invitations:", v3, 0, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "pk_arrayByApplyingBlock:", &__block_literal_global_98_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDeviceSharingCapabilitiesManager fetchDeviceCapabilitesForAppleIDs:associatedFamilyMembers:](self->_deviceCapabiltiesManager, "fetchDeviceCapabilitesForAppleIDs:associatedFamilyMembers:", v4, v5);

}

uint64_t __68__PKAccountInvitationController__fetchFamilyMemberDeviceCapabilties__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appleID");
}

- (void)registerObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    -[NSHashTable addObject:](self->_observers, "addObject:", v4);
    os_unfair_lock_unlock(&self->_lockObservers);
  }

}

- (void)unregisterObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);
    os_unfair_lock_unlock(&self->_lockObservers);
  }

}

- (void)_accessObserversWithHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *replyQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    -[NSHashTable allObjects](self->_observers, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_lockObservers);
    replyQueue = self->_replyQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __61__PKAccountInvitationController__accessObserversWithHandler___block_invoke;
    v8[3] = &unk_1E3E61850;
    v9 = v5;
    v10 = v4;
    v7 = v5;
    dispatch_async(replyQueue, v8);

  }
}

void __61__PKAccountInvitationController__accessObserversWithHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_informObserversOfFamilyMemberChange
{
  -[PKAccountInvitationController _accessObserversWithHandler:](self, "_accessObserversWithHandler:", &__block_literal_global_100);
}

void __69__PKAccountInvitationController__informObserversOfFamilyMemberChange__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "didUpdateInvitationControllerFamilyCircle");

}

- (PKAccount)account
{
  return self->_account;
}

- (unint64_t)feature
{
  return self->_feature;
}

- (int64_t)context
{
  return self->_context;
}

- (PKApplyController)applyController
{
  return self->_applyController;
}

- (PKDeviceSharingCapabilitiesManager)deviceCapabiltiesManager
{
  return self->_deviceCapabiltiesManager;
}

- (PKFamilyMemberCollection)familyMemberCollection
{
  return self->_familyMemberCollection;
}

- (PKFamilyMember)familyMember
{
  return self->_familyMember;
}

- (unint64_t)accessLevel
{
  return self->_accessLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_familyMemberCollection, 0);
  objc_storeStrong((id *)&self->_deviceCapabiltiesManager, 0);
  objc_storeStrong((id *)&self->_applyController, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
}

@end
