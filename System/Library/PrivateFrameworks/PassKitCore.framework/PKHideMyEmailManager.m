@implementation PKHideMyEmailManager

- (PKHideMyEmailManager)init
{
  PKHideMyEmailManager *v2;
  AKPrivateEmailController *v3;
  AKPrivateEmailController *controller;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKHideMyEmailManager;
  v2 = -[PKHideMyEmailManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (AKPrivateEmailController *)objc_alloc_init(MEMORY[0x1E0D00258]);
    controller = v2->_controller;
    v2->_controller = v3;

    v2->_isAvailable = 0;
  }
  return v2;
}

- (void)isAvailable:(id)a3
{
  void (**v4)(id, BOOL, _QWORD);
  unint64_t isAvailable;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  void (**v9)(id, BOOL, _QWORD);
  uint8_t buf[16];

  v4 = (void (**)(id, BOOL, _QWORD))a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "PaymentSheetHME feature flag not enabled!", buf, 2u);
    }

    isAvailable = 2;
    self->_isAvailable = 2;
    goto LABEL_7;
  }
  isAvailable = self->_isAvailable;
  if (isAvailable)
  {
LABEL_7:
    v4[2](v4, isAvailable == 1, 0);
    goto LABEL_8;
  }
  v6 = (void *)MEMORY[0x1E0D116A0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__PKHideMyEmailManager_isAvailable___block_invoke;
  v8[3] = &unk_1E2AC4908;
  v8[4] = self;
  v9 = v4;
  objc_msgSend(v6, "requestFeatureWithId:completion:", CFSTR("mail.hide-my-email.create"), v8);

LABEL_8:
}

void __36__PKHideMyEmailManager_isAvailable___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = objc_msgSend(v5, "canUse");
    v8 = 1;
    if (!v7)
      v8 = 2;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = v8;
    (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(v5, "canUse"), 0);
    if ((objc_msgSend(v5, "canUse") & 1) == 0)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Hide My Email feature not available!", (uint8_t *)&v11, 2u);
      }

    }
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Failed to check for HME feature. %@", (uint8_t *)&v11, 0xCu);
    }

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 2;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)createHideMyEmailAddressWithKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD block[4];
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  -[PKHideMyEmailManager _primaryAccountAltDSID](self, "_primaryAccountAltDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __67__PKHideMyEmailManager_createHideMyEmailAddressWithKey_completion___block_invoke;
    v15[3] = &unk_1E2AC4980;
    v15[4] = self;
    v16 = v8;
    v17 = v6;
    v18 = v7;
    v10 = v7;
    -[PKHideMyEmailManager findHideMyEmailAddressWithKey:completion:](self, "findHideMyEmailAddressWithKey:completion:", v17, v15);

    v11 = v16;
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__PKHideMyEmailManager_createHideMyEmailAddressWithKey_completion___block_invoke_32;
    block[3] = &unk_1E2ABD9A0;
    v14 = v7;
    v12 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v11 = v14;
  }

}

void __67__PKHideMyEmailManager_createHideMyEmailAddressWithKey_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__PKHideMyEmailManager_createHideMyEmailAddressWithKey_completion___block_invoke_2;
  v4[3] = &unk_1E2AC4958;
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v2, "fetchPrivateEmailForAltDSID:withKey:completion:", v1, v3, v4);

}

void __67__PKHideMyEmailManager_createHideMyEmailAddressWithKey_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PKHideMyEmailManager_createHideMyEmailAddressWithKey_completion___block_invoke_3;
  block[3] = &unk_1E2AC4930;
  v11 = v5;
  v7 = *(id *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __67__PKHideMyEmailManager_createHideMyEmailAddressWithKey_completion___block_invoke_3(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  if (v2)
  {
    v3 = a1[6];
    objc_msgSend(v2, "privateEmailAddress");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v3 + 16))(v3);

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = a1[5];
      *(_DWORD *)buf = 138412290;
      v8 = v5;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Create hide my email address failed with error: %@", buf, 0xCu);
    }

    (*(void (**)(void))(a1[6] + 16))();
  }
}

void __67__PKHideMyEmailManager_createHideMyEmailAddressWithKey_completion___block_invoke_32(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v8 = *MEMORY[0x1E0CB2D50];
  v9[0] = CFSTR("DSID required to register new HME address");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  PKLogFacilityTypeGetObject(6uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Create hide my email address failed with error: %@", (uint8_t *)&v6, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)registerHideMyEmailAddressWithKey:(id)a3 originIdentifier:(id)a4 merchantIdentifier:(id)a5 isWebPayment:(BOOL)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  PKHideMyEmailManager *v27;
  id v28;
  BOOL v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  -[PKHideMyEmailManager _primaryAccountAltDSID](self, "_primaryAccountAltDSID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __118__PKHideMyEmailManager_registerHideMyEmailAddressWithKey_originIdentifier_merchantIdentifier_isWebPayment_completion___block_invoke;
    v22[3] = &unk_1E2AC49F8;
    v17 = &v28;
    v28 = v15;
    v23 = v12;
    v24 = v16;
    v29 = a6;
    v25 = v13;
    v26 = v14;
    v27 = self;
    v18 = v15;
    -[PKHideMyEmailManager findHideMyEmailAddressWithKey:completion:](self, "findHideMyEmailAddressWithKey:completion:", v23, v22);

  }
  else
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __118__PKHideMyEmailManager_registerHideMyEmailAddressWithKey_originIdentifier_merchantIdentifier_isWebPayment_completion___block_invoke_38;
    v20[3] = &unk_1E2ABD9A0;
    v17 = &v21;
    v21 = v15;
    v19 = v15;
    dispatch_async(MEMORY[0x1E0C80D38], v20);
  }

}

void __118__PKHideMyEmailManager_registerHideMyEmailAddressWithKey_originIdentifier_merchantIdentifier_isWebPayment_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;

  v3 = a2;
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __118__PKHideMyEmailManager_registerHideMyEmailAddressWithKey_originIdentifier_merchantIdentifier_isWebPayment_completion___block_invoke_2;
    block[3] = &unk_1E2ABDA18;
    v15 = *(id *)(a1 + 72);
    v14 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v4 = v15;
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0D00250]);
    if (*(_BYTE *)(a1 + 80))
      v6 = (_QWORD *)MEMORY[0x1E0D00050];
    else
      v6 = (_QWORD *)MEMORY[0x1E0D00048];
    v4 = (void *)objc_msgSend(v5, "initWithKey:altDSID:originType:originIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *v6, *(_QWORD *)(a1 + 48));
    objc_msgSend(v4, "setMetadataString:", *(_QWORD *)(a1 + 56));
    v7 = *(void **)(*(_QWORD *)(a1 + 64) + 8);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __118__PKHideMyEmailManager_registerHideMyEmailAddressWithKey_originIdentifier_merchantIdentifier_isWebPayment_completion___block_invoke_3;
    v8[3] = &unk_1E2AC49D0;
    v9 = *(id *)(a1 + 32);
    v10 = *(id *)(a1 + 48);
    v11 = *(id *)(a1 + 56);
    v12 = *(id *)(a1 + 72);
    objc_msgSend(v7, "registerPrivateEmailWithContext:completion:", v4, v8);

  }
}

uint64_t __118__PKHideMyEmailManager_registerHideMyEmailAddressWithKey_originIdentifier_merchantIdentifier_isWebPayment_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __118__PKHideMyEmailManager_registerHideMyEmailAddressWithKey_originIdentifier_merchantIdentifier_isWebPayment_completion___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __118__PKHideMyEmailManager_registerHideMyEmailAddressWithKey_originIdentifier_merchantIdentifier_isWebPayment_completion___block_invoke_4;
  v10[3] = &unk_1E2AC49A8;
  v11 = v5;
  v12 = a1[4];
  v13 = a1[5];
  v14 = a1[6];
  v7 = a1[7];
  v15 = v6;
  v16 = v7;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

void __118__PKHideMyEmailManager_registerHideMyEmailAddressWithKey_originIdentifier_merchantIdentifier_isWebPayment_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  PKLogFacilityTypeGetObject(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(_QWORD *)(a1 + 48);
      v7 = *(_QWORD *)(a1 + 56);
      v14 = 138412802;
      v15 = v5;
      v16 = 2112;
      v17 = v6;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Register hide my email address succeeded for key: %@, originId: %@, merchantId: %@", (uint8_t *)&v14, 0x20u);
    }

    v8 = *(_QWORD *)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 32), "privateEmailAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, *(_QWORD *)(a1 + 64));

  }
  else
  {
    if (v4)
    {
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(_QWORD *)(a1 + 48);
      v12 = *(_QWORD *)(a1 + 56);
      v13 = *(_QWORD *)(a1 + 64);
      v14 = 138413058;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      v20 = 2112;
      v21 = v13;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Register hide my email address failed with key: %@, originId: %@, merchantId: %@, and error: %@", (uint8_t *)&v14, 0x2Au);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
}

void __118__PKHideMyEmailManager_registerHideMyEmailAddressWithKey_originIdentifier_merchantIdentifier_isWebPayment_completion___block_invoke_38(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v8 = *MEMORY[0x1E0CB2D50];
  v9[0] = CFSTR("DSID required to register new HME address");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  PKLogFacilityTypeGetObject(6uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Register hide my email address failed with error: %@", (uint8_t *)&v6, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)findHideMyEmailAddressWithKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  AKPrivateEmailController *controller;
  id v11;
  _QWORD block[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[PKHideMyEmailManager _primaryAccountAltDSID](self, "_primaryAccountAltDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D00250]), "initWithKey:altDSID:", v6, v8);
    controller = self->_controller;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __65__PKHideMyEmailManager_findHideMyEmailAddressWithKey_completion___block_invoke;
    v14[3] = &unk_1E2AC4A48;
    v15 = v6;
    v16 = v7;
    v11 = v7;
    -[AKPrivateEmailController lookupPrivateEmailWithContext:completion:](controller, "lookupPrivateEmailWithContext:completion:", v9, v14);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__PKHideMyEmailManager_findHideMyEmailAddressWithKey_completion___block_invoke_39;
    block[3] = &unk_1E2ABD9A0;
    v13 = v7;
    v9 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v11 = v13;
  }

}

void __65__PKHideMyEmailManager_findHideMyEmailAddressWithKey_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__PKHideMyEmailManager_findHideMyEmailAddressWithKey_completion___block_invoke_2;
  v10[3] = &unk_1E2AC4A20;
  v11 = v5;
  v12 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v7;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

void __65__PKHideMyEmailManager_findHideMyEmailAddressWithKey_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  PKLogFacilityTypeGetObject(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 40);
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Look up hide my email address succeeded for key: %@", (uint8_t *)&v10, 0xCu);
    }

    v6 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "privateEmailAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v7, *(_QWORD *)(a1 + 48));

  }
  else
  {
    if (v4)
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 48);
      v10 = 138412546;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Look up hide my email address miss with key: %@, error: %@", (uint8_t *)&v10, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void __65__PKHideMyEmailManager_findHideMyEmailAddressWithKey_completion___block_invoke_39(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v8 = *MEMORY[0x1E0CB2D50];
  v9[0] = CFSTR("DSID required to register new HME address");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  PKLogFacilityTypeGetObject(6uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Find hide my email address failed with error: %@", (uint8_t *)&v6, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)bestDomainForAppIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  Class (__cdecl *v6)();
  id v7;
  Class v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v6 = (Class (__cdecl *)())getSFSafariCredentialStoreClass[0];
  v7 = a3;
  v8 = v6();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__PKHideMyEmailManager_bestDomainForAppIdentifier_completion___block_invoke;
  v10[3] = &unk_1E2ABE390;
  v11 = v5;
  v9 = v5;
  -[objc_class bestDomainForAppID:completionHandler:](v8, "bestDomainForAppID:completionHandler:", v7, v10);

}

void __62__PKHideMyEmailManager_bestDomainForAppIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  if (!v3)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Could not find associated domain for bundleId:", v5, 2u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)_isHSA2Enabled
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[PKHideMyEmailManager _primaryAccount](self, "_primaryAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "aa_isManagedAppleID") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKHideMyEmailManager _primaryAccount](self, "_primaryAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (unint64_t)objc_msgSend(v5, "securityLevelForAccount:", v6) > 3;

  }
  return v4;
}

- (id)_primaryAccount
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryAuthKitAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_primaryAccountAltDSID
{
  void *v2;
  void *v3;

  -[PKHideMyEmailManager _primaryAccount](self, "_primaryAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountPropertyForKey:", CFSTR("altDSID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)forwardingEmailForPrimaryAccount
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKHideMyEmailManager _primaryAccount](self, "_primaryAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "forwardingEmailForAccount:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
