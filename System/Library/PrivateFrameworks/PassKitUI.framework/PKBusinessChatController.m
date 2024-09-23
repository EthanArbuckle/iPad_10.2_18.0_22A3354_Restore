@implementation PKBusinessChatController

+ (BOOL)deviceSupportsBusinessChat
{
  return 1;
}

- (PKBusinessChatController)init
{
  PKBusinessChatController *v2;
  ACAccountStore *v3;
  ACAccountStore *accountStore;
  AKAnisetteProvisioningController *v5;
  AKAnisetteProvisioningController *provisioningController;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKBusinessChatController;
  v2 = -[PKBusinessChatController init](&v8, sel_init);
  if (v2)
  {
    v3 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E0C8F2B8]);
    accountStore = v2->_accountStore;
    v2->_accountStore = v3;

    v5 = (AKAnisetteProvisioningController *)objc_alloc_init(MEMORY[0x1E0D00120]);
    provisioningController = v2->_provisioningController;
    v2->_provisioningController = v5;

  }
  return v2;
}

- (void)openBusinessChatWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD aBlock[4];
  NSObject *v18;
  id v19;
  id v20;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "businessIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__PKBusinessChatController_openBusinessChatWithContext_completion___block_invoke;
    aBlock[3] = &unk_1E3E63CB8;
    v10 = v6;
    v18 = v10;
    v19 = v8;
    v11 = v7;
    v20 = v11;
    v12 = _Block_copy(aBlock);
    if ((objc_opt_respondsToSelector() & 1) != 0
      && -[NSObject requiresAuthorization](v10, "requiresAuthorization"))
    {
      v14[0] = v9;
      v14[1] = 3221225472;
      v14[2] = __67__PKBusinessChatController_openBusinessChatWithContext_completion___block_invoke_441;
      v14[3] = &unk_1E3E63CE0;
      v15 = v12;
      v16 = v11;
      -[PKBusinessChatController _generateAuthBagWithCompletion:](self, "_generateAuthBagWithCompletion:", v14);

    }
    else
    {
      (*((void (**)(void *, _QWORD))v12 + 2))(v12, 0);
    }

    v13 = v18;
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "No business identifier for business chat", buf, 2u);
    }
  }

}

void __67__PKBusinessChatController_openBusinessChatWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  Class v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "intentParameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addEntriesFromDictionary:", v6);

  }
  if (v3)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v3, CFSTR("authBag"));
  v24 = v3;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v5, 0, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v23, 4);
  _MergedGlobals_655();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, v8);

  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "groupParameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addEntriesFromDictionary:", v10);

  }
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v9, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v11, 4);
  off_1ED06C458();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, v13);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "bodyText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      off_1ED06C460();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v14, v15);

    }
  }
  PKLogFacilityTypeGetObject();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "description");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v26 = v17;
    v27 = 2112;
    v28 = v18;
    _os_log_impl(&dword_19D178000, v16, OS_LOG_TYPE_DEFAULT, "Opening business chat, businessIdentifier: %@, parameters: %@", buf, 0x16u);

  }
  v19 = off_1ED06C468();
  v20 = *(_QWORD *)(a1 + 40);
  v21 = (void *)objc_msgSend(v4, "copy");
  -[objc_class openTranscript:intentParameters:](v19, "openTranscript:intentParameters:", v20, v21);

  v22 = *(_QWORD *)(a1 + 48);
  if (v22)
    (*(void (**)(uint64_t, _QWORD))(v22 + 16))(v22, 0);

}

void __67__PKBusinessChatController_openBusinessChatWithContext_completion___block_invoke_441(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (*v6)(void);
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v8)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_5:
    v6();
    goto LABEL_6;
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    v6 = *(void (**)(void))(v7 + 16);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_generateAuthBagWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  AKAnisetteProvisioningController *provisioningController;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "primaryAuthKitAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "altDSIDForAccount:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "aida_accountForPrimaryiCloudAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "aida_tokenForService:", CFSTR("com.apple.gs.global.auth"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AppleToken %@:%@"), v7, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    provisioningController = self->_provisioningController;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __59__PKBusinessChatController__generateAuthBagWithCompletion___block_invoke;
    v14[3] = &unk_1E3E63D08;
    v15 = v11;
    v16 = v4;
    v13 = v11;
    -[AKAnisetteProvisioningController anisetteDataWithCompletion:](provisioningController, "anisetteDataWithCompletion:", v14);

  }
}

void __59__PKBusinessChatController__generateAuthBagWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a2;
  v15 = objc_alloc_init(v3);
  objc_msgSend(v4, "oneTimePassword");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v5, CFSTR("X-Apple-I-MD"));

  objc_msgSend(v4, "machineID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v6, CFSTR("X-Apple-I-MD-M"));

  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v4, "routingInfo");

  objc_msgSend(v7, "numberWithUnsignedLongLong:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v10, CFSTR("X-Apple-I-MD-RINFO"));

  objc_msgSend(MEMORY[0x1E0D67108], "clientInfoHTTPHeader");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, CFSTR("X-Apple-Client-Info"));

  objc_msgSend(v15, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("Authorization"));
  PKSerialNumber();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, CFSTR("X-Apple-Serial-Number"));

  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v15, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v13, 4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
