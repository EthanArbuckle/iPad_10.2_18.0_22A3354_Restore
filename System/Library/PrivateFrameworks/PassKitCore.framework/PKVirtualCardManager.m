@implementation PKVirtualCardManager

- (PKVirtualCardManager)init
{
  PKVirtualCardManager *v2;
  PKInAppPaymentService *v3;
  PKInAppPaymentService *inAppPaymentService;
  uint64_t v5;
  PKAccountService *accountService;
  dispatch_queue_t v7;
  OS_dispatch_queue *virtualCardQueue;
  PKPaymentService *v9;
  PKPaymentService *paymentService;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKVirtualCardManager;
  v2 = -[PKVirtualCardManager init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PKInAppPaymentService);
    inAppPaymentService = v2->_inAppPaymentService;
    v2->_inAppPaymentService = v3;

    +[PKAccountService sharedInstance](PKAccountService, "sharedInstance");
    v5 = objc_claimAutoreleasedReturnValue();
    accountService = v2->_accountService;
    v2->_accountService = (PKAccountService *)v5;

    v7 = dispatch_queue_create("com.apple.PassKitCore.virtualcardmanager.activecardsqueue", 0);
    virtualCardQueue = v2->_virtualCardQueue;
    v2->_virtualCardQueue = (OS_dispatch_queue *)v7;

    v9 = objc_alloc_init(PKPaymentService);
    paymentService = v2->_paymentService;
    v2->_paymentService = v9;

  }
  return v2;
}

- (void)activeVirtualCardsWithOptions:(unint64_t)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *virtualCardQueue;
  NSObject *v12;
  _QWORD block[4];
  void (**v14)(id, _QWORD);
  _QWORD *v15;
  uint8_t *v16;
  _QWORD v17[4];
  NSObject *v18;
  _QWORD *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[4];
  NSObject *v23;
  uint8_t *v24;
  uint8_t buf[8];
  uint8_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = (void (**)(id, _QWORD))a4;
  if (v6)
  {
    if ((unint64_t)PKCurrentPassbookState() >= 2)
    {
      PKLogFacilityTypeGetObject(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "PKVirtualCardManager not returning active virtual cards because Wallet has been deleted.", buf, 2u);
      }

      v6[2](v6, 0);
    }
    else
    {
      v7 = dispatch_group_create();
      *(_QWORD *)buf = 0;
      v26 = buf;
      v27 = 0x3032000000;
      v28 = __Block_byref_object_copy__65;
      v29 = __Block_byref_object_dispose__65;
      v30 = 0;
      dispatch_group_enter(v7);
      v8 = MEMORY[0x1E0C809B0];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __65__PKVirtualCardManager_activeVirtualCardsWithOptions_completion___block_invoke;
      v22[3] = &unk_1E2AC46F8;
      v24 = buf;
      v9 = v7;
      v23 = v9;
      -[PKVirtualCardManager accountVirtualCardsWithOptions:completion:](self, "accountVirtualCardsWithOptions:completion:", a3, v22);
      dispatch_group_enter(v9);
      v20[0] = 0;
      v20[1] = v20;
      v20[2] = 0x3032000000;
      v20[3] = __Block_byref_object_copy__65;
      v20[4] = __Block_byref_object_dispose__65;
      v21 = 0;
      v17[0] = v8;
      v17[1] = 3221225472;
      v17[2] = __65__PKVirtualCardManager_activeVirtualCardsWithOptions_completion___block_invoke_2;
      v17[3] = &unk_1E2AC46F8;
      v19 = v20;
      v10 = v9;
      v18 = v10;
      -[PKVirtualCardManager vpanVirtualCardsWithOptions:completion:](self, "vpanVirtualCardsWithOptions:completion:", a3, v17);
      virtualCardQueue = self->_virtualCardQueue;
      block[0] = v8;
      block[1] = 3221225472;
      block[2] = __65__PKVirtualCardManager_activeVirtualCardsWithOptions_completion___block_invoke_3;
      block[3] = &unk_1E2AD7F58;
      v15 = v20;
      v16 = buf;
      v14 = v6;
      dispatch_group_notify(v10, virtualCardQueue, block);

      _Block_object_dispose(v20, 8);
      _Block_object_dispose(buf, 8);

    }
  }

}

void __65__PKVirtualCardManager_activeVirtualCardsWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __65__PKVirtualCardManager_activeVirtualCardsWithOptions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __65__PKVirtualCardManager_activeVirtualCardsWithOptions_completion___block_invoke_3(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) || *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5 = v2;
    if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
    {
      objc_msgSend(v2, "unionSet:");
      v2 = v5;
    }
    if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
    {
      objc_msgSend(v5, "unionSet:");
      v2 = v5;
    }
    v3 = a1[4];
    v4 = (void *)objc_msgSend(v2, "copy");
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
  else
  {
    (*(void (**)(void))(a1[4] + 16))();
  }
}

- (void)accountVirtualCardsWithOptions:(unint64_t)a3 completion:(id)a4
{
  char v4;
  id v6;
  NSObject *v7;
  PKInAppPaymentService *inAppPaymentService;
  void *v9;
  _BOOL4 v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[16];

  v4 = a3;
  v6 = a4;
  PKLogFacilityTypeGetObject(0xEuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Safari fetching active Apple Cards", buf, 2u);
  }

  if ((~v4 & 3) == 0)
  {
    inAppPaymentService = self->_inAppPaymentService;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __66__PKVirtualCardManager_accountVirtualCardsWithOptions_completion___block_invoke;
    v13[3] = &unk_1E2AD7F80;
    v13[4] = self;
    v14 = v6;
    -[PKInAppPaymentService paymentHardwareStatusWithType:completion:](inAppPaymentService, "paymentHardwareStatusWithType:completion:", 1, v13);
    v9 = v14;
LABEL_12:

    goto LABEL_13;
  }
  v10 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((v4 & 1) != 0)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "CVV not requested, querying keychain", buf, 2u);
    }

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __66__PKVirtualCardManager_accountVirtualCardsWithOptions_completion___block_invoke_20;
    v11[3] = &unk_1E2ACAB80;
    v12 = v6;
    -[PKVirtualCardManager queryKeychainForVirtualCard:](self, "queryKeychainForVirtualCard:", v11);
    v9 = v12;
    goto LABEL_12;
  }
  if (v10)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Invalid options when requesting virtual cards", buf, 2u);
  }

  (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
LABEL_13:

}

void __66__PKVirtualCardManager_accountVirtualCardsWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  id *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[16];

  v3 = objc_msgSend(a2, "canDecryptBAAEncryptedData");
  PKLogFacilityTypeGetObject(0xEuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Device supports CVV AutoFill, fetching credentials from database", buf, 2u);
    }

    v6 = *(void **)(a1 + 40);
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __66__PKVirtualCardManager_accountVirtualCardsWithOptions_completion___block_invoke_13;
    v13[3] = &unk_1E2AC3558;
    v8 = &v14;
    v9 = v6;
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = v9;
    objc_msgSend(v7, "accountsWithPassLocallyProvisionedWithCompletion:", v13);
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Device does not support CVV AutoFill, fallback to keychain", buf, 2u);
    }

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __66__PKVirtualCardManager_accountVirtualCardsWithOptions_completion___block_invoke_18;
    v11[3] = &unk_1E2ACAB80;
    v8 = &v12;
    v10 = *(void **)(a1 + 32);
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v10, "queryKeychainForVirtualCard:", v11);
  }

}

void __66__PKVirtualCardManager_accountVirtualCardsWithOptions_completion___block_invoke_13(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[4];
  id v42;
  uint8_t buf[16];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(v5, "count");
  if (a3 || !v6)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v32, OS_LOG_TYPE_DEFAULT, "Device does not have account with pass provisioned locally, fallback to keychain", buf, 2u);
    }

    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __66__PKVirtualCardManager_accountVirtualCardsWithOptions_completion___block_invoke_16;
    v41[3] = &unk_1E2ACAB80;
    v33 = *(void **)(a1 + 32);
    v42 = *(id *)(a1 + 40);
    objc_msgSend(v33, "queryKeychainForVirtualCard:", v41);
    v7 = v42;
  }
  else
  {
    v35 = a1;
    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v36 = v5;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v49;
      v37 = *(_QWORD *)v49;
      v38 = v8;
      do
      {
        v12 = 0;
        v39 = v10;
        do
        {
          if (*(_QWORD *)v49 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v12);
          if (objc_msgSend(v13, "type") == 1
            && objc_msgSend(v13, "state") == 1
            && objc_msgSend(v13, "supportsShowVirtualCard"))
          {
            v40 = v12;
            v46 = 0u;
            v47 = 0u;
            v44 = 0u;
            v45 = 0u;
            objc_msgSend(v13, "creditDetails");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "virtualCards");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v45;
              do
              {
                for (i = 0; i != v17; ++i)
                {
                  if (*(_QWORD *)v45 != v18)
                    objc_enumerationMutation(v15);
                  v20 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
                  if (objc_msgSend(v20, "state") == 1)
                  {
                    objc_msgSend(v20, "keychainVirtualCard");
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v21, "keychainCardCredentials");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "setKeychainCardCredentials:", v22);

                    v23 = objc_msgSend(v13, "feature");
                    PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_DISPLAY_NAME"), v23, 0, v24, v25, v26, v27, v28, v34);
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "setDisplayName:", v29);

                    objc_msgSend(v20, "setRequiresAuthentication:", 1);
                    objc_msgSend(v7, "addObject:", v20);
                  }
                }
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
              }
              while (v17);
            }

            v11 = v37;
            v8 = v38;
            v10 = v39;
            v12 = v40;
          }
          ++v12;
        }
        while (v12 != v10);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      }
      while (v10);
    }

    v30 = *(_QWORD *)(v35 + 40);
    v31 = (void *)objc_msgSend(v7, "copy");
    (*(void (**)(uint64_t, void *))(v30 + 16))(v30, v31);

    v5 = v36;
  }

}

void __66__PKVirtualCardManager_accountVirtualCardsWithOptions_completion___block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "count"))
    v3 = v4;
  else
    v3 = 0;
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v3);

}

void __66__PKVirtualCardManager_accountVirtualCardsWithOptions_completion___block_invoke_18(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "count"))
    v3 = v4;
  else
    v3 = 0;
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v3);

}

uint64_t __66__PKVirtualCardManager_accountVirtualCardsWithOptions_completion___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)credentialsForVirtualCard:(id)a3 authorization:(id)a4 options:(unint64_t)a5 completion:(id)a6
{
  -[PKVirtualCardManager credentialsForVirtualCard:authorization:options:merchantHost:completion:](self, "credentialsForVirtualCard:authorization:options:merchantHost:completion:", a3, a4, a5, 0, a6);
}

- (void)credentialsForVirtualCard:(id)a3 authorization:(id)a4 options:(unint64_t)a5 merchantHost:(id)a6 completion:(id)a7
{
  char v9;
  id v12;
  id v13;
  id v14;
  void (**v15)(id, void *, _QWORD);
  NSObject *v16;
  PKInAppPaymentService *inAppPaymentService;
  void *v18;
  _QWORD v19[4];
  id v20;
  PKVirtualCardManager *v21;
  id v22;
  id v23;
  void (**v24)(id, void *, _QWORD);
  uint8_t buf[16];

  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (void (**)(id, void *, _QWORD))a7;
  PKLogFacilityTypeGetObject(0xEuLL);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Safari fetching virtual card credentials", buf, 2u);
  }

  if (v15)
  {
    if (!v13 || (v9 & 3) == 1)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Fetching keychain card credentials", buf, 2u);
      }

      objc_msgSend(v12, "keychainCardCredentials");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v15[2](v15, v18, 0);

    }
    else if ((v9 & 3) == 3)
    {
      inAppPaymentService = self->_inAppPaymentService;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __96__PKVirtualCardManager_credentialsForVirtualCard_authorization_options_merchantHost_completion___block_invoke;
      v19[3] = &unk_1E2AD7FD0;
      v20 = v12;
      v21 = self;
      v22 = v13;
      v24 = v15;
      v23 = v14;
      -[PKInAppPaymentService paymentHardwareStatusWithType:completion:](inAppPaymentService, "paymentHardwareStatusWithType:completion:", 1, v19);

    }
    else
    {
      v15[2](v15, 0, 0);
    }
  }

}

void __96__PKVirtualCardManager_credentialsForVirtualCard_authorization_options_merchantHost_completion___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  _BOOL4 v15;
  int64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  dispatch_time_t v21;
  _QWORD v22[4];
  id v23;
  _QWORD block[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[16];

  if (!objc_msgSend(a2, "canDecryptBAAEncryptedData"))
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "type");
    if (v9 < 2)
    {
      PKLogFacilityTypeGetObject(0xEuLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Hardware does not support decrypting virtual card, fallback to Keychain", buf, 2u);
      }

      v11 = *(_QWORD *)(a1 + 64);
      objc_msgSend(*(id *)(a1 + 32), "keychainCardCredentials");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v11 + 16))(v11, v12, 0);

      return;
    }
    if (v9 != 2)
      return;
    PKLogFacilityTypeGetObject(0xEuLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = "Error: Hardware does not support decrypting virtual card.";
LABEL_17:
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
    }
LABEL_18:

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    return;
  }
  PKLogFacilityTypeGetObject(0xEuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Decrypting virtual card for Safari", buf, 2u);
  }

  v4 = objc_msgSend(*(id *)(a1 + 32), "type");
  switch(v4)
  {
    case 0:
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v13 = "Cannot retrieve credentials for PKVirtualCard with unknown type";
        goto LABEL_17;
      }
      goto LABEL_18;
    case 2:
      +[PKPaymentWebService sharedService](PKPaymentWebService, "sharedService");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = PKVirtualCardEnabledWithWebService(v14);

      if (!v15)
        return;
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Card is of VPAN type: Using Payment Service", buf, 2u);
      }

      if (os_variant_has_internal_ui() && PKVirtualCardFakeCredentialsEnabled())
      {
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "PKVirtualCardFakeCredentialsEnabled is true: Providing demo credentials to Safari", buf, 2u);
        }

        if (PKVirtualCardFakeCredentialsWithDelayEnabled())
          v16 = 1000000000 * (int)(arc4random_uniform(4u) + 3);
        else
          v16 = 0;
        v21 = dispatch_time(0, v16);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __96__PKVirtualCardManager_credentialsForVirtualCard_authorization_options_merchantHost_completion___block_invoke_24;
        block[3] = &unk_1E2ABE058;
        v25 = *(id *)(a1 + 32);
        v26 = *(id *)(a1 + 64);
        dispatch_after(v21, MEMORY[0x1E0C80D38], block);

        v8 = v25;
      }
      else
      {
        v17 = *(_QWORD *)(a1 + 32);
        v18 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
        v19 = *(_QWORD *)(a1 + 48);
        v20 = *(_QWORD *)(a1 + 56);
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __96__PKVirtualCardManager_credentialsForVirtualCard_authorization_options_merchantHost_completion___block_invoke_2;
        v22[3] = &unk_1E2AD7FA8;
        v23 = *(id *)(a1 + 64);
        objc_msgSend(v18, "vpanCardCredentialsForVirtualCard:authorization:merchantHost:completion:", v17, v19, v20, v22);
        v8 = v23;
      }
      break;
    case 1:
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
      v7 = *(_QWORD *)(a1 + 48);
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __96__PKVirtualCardManager_credentialsForVirtualCard_authorization_options_merchantHost_completion___block_invoke_21;
      v27[3] = &unk_1E2AD7FA8;
      v28 = *(id *)(a1 + 64);
      objc_msgSend(v6, "cardCredentialsForVirtualCard:authorization:action:completion:", v5, v7, 2, v27);
      v8 = v28;
      break;
    default:
      return;
  }

}

uint64_t __96__PKVirtualCardManager_credentialsForVirtualCard_authorization_options_merchantHost_completion___block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __96__PKVirtualCardManager_credentialsForVirtualCard_authorization_options_merchantHost_completion___block_invoke_24(uint64_t a1)
{
  id v2;

  +[PKVirtualCardCredentials demoVPANCredentials](PKVirtualCardCredentials, "demoVPANCredentials");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCardType:", objc_msgSend(*(id *)(a1 + 32), "credentialType"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __96__PKVirtualCardManager_credentialsForVirtualCard_authorization_options_merchantHost_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)urlToPassDetailsForVirtualCard:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  if (+[PKWalletVisibility isWalletVisible](PKWalletVisibility, "isWalletVisible"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    objc_msgSend(v4, "setScheme:", CFSTR("wallet"));
    objc_msgSend(v4, "setHost:", CFSTR("virtualCard"));
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(CFSTR("/"), "stringByAppendingFormat:", CFSTR("%@/%@"), v5, CFSTR("details"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPath:", v6);

    objc_msgSend(v4, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("prefs:root=PASSBOOK&path="));
    objc_msgSend(v4, "appendString:", CFSTR("virtualCard"));
    objc_msgSend(v4, "appendString:", CFSTR("/"));
    objc_msgSend(v3, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "appendString:", v8);
    objc_msgSend(v4, "appendString:", CFSTR("/"));
    objc_msgSend(v4, "appendString:", CFSTR("details"));
    v9 = (void *)MEMORY[0x1E0C99E98];
    v10 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v9, "URLWithString:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (void)isVPANAutoFillSupported:(id)a3
{
  void *v3;
  _BOOL8 v4;
  void (**v5)(id, _BOOL8);

  if (a3)
  {
    v5 = (void (**)(id, _BOOL8))a3;
    +[PKPaymentWebService sharedService](PKPaymentWebService, "sharedService");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = PKVirtualCardEnabledWithWebService(v3) && PKSecureElementIsAvailable() != 0;

    v5[2](v5, v4);
  }
}

- (void)vpanVirtualCardsWithOptions:(unint64_t)a3 completion:(id)a4
{
  char v4;
  void (**v6)(id, _QWORD);
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  PKInAppPaymentService *inAppPaymentService;
  _QWORD v12[5];
  void (**v13)(id, _QWORD);
  uint8_t buf[16];

  v4 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  +[PKPaymentWebService sharedService](PKPaymentWebService, "sharedService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = PKVirtualCardEnabledWithWebService(v7);

  if (!v8)
  {
LABEL_8:
    v6[2](v6, 0);
    goto LABEL_9;
  }
  PKLogFacilityTypeGetObject(0xEuLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Safari fetching active VPAN virtual cards", buf, 2u);
  }

  if ((v4 & 1) == 0)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Invalid options for VPAN virtual card request: Need to request PrimaryAccountNumber", buf, 2u);
    }

    goto LABEL_8;
  }
  if (os_variant_has_internal_ui() && PKVirtualCardFakeVirtualCardsEnabled())
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "PKVirtualCardFakeVirtualCardsEnabled is true: Providing demo virtual cards to Safari", buf, 2u);
    }

    +[PKVirtualCard demoVPANVirtualCards](PKVirtualCard, "demoVPANVirtualCards");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v6)[2](v6, v10);

  }
  else
  {
    inAppPaymentService = self->_inAppPaymentService;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__PKVirtualCardManager_vpanVirtualCardsWithOptions_completion___block_invoke;
    v12[3] = &unk_1E2AD7F80;
    v12[4] = self;
    v13 = v6;
    -[PKInAppPaymentService paymentHardwareStatusWithType:completion:](inAppPaymentService, "paymentHardwareStatusWithType:completion:", 1, v12);

  }
LABEL_9:

}

void __63__PKVirtualCardManager_vpanVirtualCardsWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[8];
  _QWORD v7[4];
  id v8;

  if (objc_msgSend(a2, "canDecryptBAAEncryptedData"))
  {
    v3 = *(void **)(a1 + 40);
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __63__PKVirtualCardManager_vpanVirtualCardsWithOptions_completion___block_invoke_2;
    v7[3] = &unk_1E2AD7FF8;
    v8 = v3;
    objc_msgSend(v4, "virtualCardsWithActiveVPAN:", v7);

  }
  else
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Error: Hardware does not support VPAN virtual cards.", v6, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __63__PKVirtualCardManager_vpanVirtualCardsWithOptions_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void (*v8)(void);
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Failed to get VPAN virtual cards %@", (uint8_t *)&v9, 0xCu);
    }

    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v8();

}

- (void)queryKeychainForVirtualCard:(id)a3
{
  id v4;
  PKAccountService *accountService;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  accountService = self->_accountService;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__PKVirtualCardManager_queryKeychainForVirtualCard___block_invoke;
  v7[3] = &unk_1E2ACAB80;
  v8 = v4;
  v6 = v4;
  -[PKAccountService virtualCardsInKeychainWithCompletion:](accountService, "virtualCardsInKeychainWithCompletion:", v7);

}

void __52__PKVirtualCardManager_queryKeychainForVirtualCard___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint8_t v14[16];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v10, "isValidFromKeychain") && objc_msgSend(v10, "state") == 1)
            objc_msgSend(v4, "addObject:", v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

    v11 = *(_QWORD *)(a1 + 32);
    v12 = (void *)objc_msgSend(v4, "copy");
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

  }
  else
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Virtual card does not have credentials stored in Keychain", v14, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (OS_dispatch_queue)virtualCardQueue
{
  return self->_virtualCardQueue;
}

- (void)setVirtualCardQueue:(id)a3
{
  objc_storeStrong((id *)&self->_virtualCardQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualCardQueue, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_inAppPaymentService, 0);
}

@end
