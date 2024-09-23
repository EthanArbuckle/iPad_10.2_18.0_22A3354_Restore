@implementation PKAppleAccountManager

+ (id)sharedInstance
{
  if (_MergedGlobals_224 != -1)
    dispatch_once(&_MergedGlobals_224, &__block_literal_global_85);
  return (id)qword_1ECF224E0;
}

- (PKAppleAccountInformation)appleAccountInformation
{
  PKAppleAccountInformation *v3;
  void *v4;
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
  void *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint8_t v21[16];

  v3 = objc_alloc_init(PKAppleAccountInformation);
  -[PKAppleAccountManager _aidaAccount](self, "_aidaAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAppleAccountManager _primaryAppleAccount](self, "_primaryAppleAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryAuthKitAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "altDSIDForAccount:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAppleAccountInformation setAidaAlternateDSID:](v3, "setAidaAlternateDSID:", v8);

  objc_msgSend(v4, "aida_tokenForService:", CFSTR("com.apple.gs.pb.auth"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAppleAccountInformation setAidaToken:](v3, "setAidaToken:", v9);

  objc_msgSend(v5, "username");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAppleAccountInformation setAppleID:](v3, "setAppleID:", v10);

  objc_msgSend(v5, "aa_personID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAppleAccountInformation setAaDSID:](v3, "setAaDSID:", v11);

  objc_msgSend(v5, "aa_altDSID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAppleAccountInformation setAaAlternateDSID:](v3, "setAaAlternateDSID:", v12);

  -[PKAppleAccountInformation setIsSandboxAccount:](v3, "setIsSandboxAccount:", objc_msgSend(v5, "aa_isSandboxAccount"));
  objc_msgSend(v5, "aa_firstName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAppleAccountInformation setFirstName:](v3, "setFirstName:", v13);

  objc_msgSend(v5, "aa_lastName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAppleAccountInformation setLastName:](v3, "setLastName:", v14);

  objc_msgSend(v5, "aa_primaryEmail");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAppleAccountInformation setPrimaryEmailAddress:](v3, "setPrimaryEmailAddress:", v15);

  objc_msgSend(v5, "creationDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAppleAccountInformation setCreationDate:](v3, "setCreationDate:", v16);

  -[PKAppleAccountInformation setIsManagedAppleAccount:](v3, "setIsManagedAppleAccount:", objc_msgSend(v5, "aa_isManagedAppleID"));
  -[PKAppleAccountInformation setIsWalletEnabledOnManagedAppleAccount:](v3, "setIsWalletEnabledOnManagedAppleAccount:", objc_msgSend(v5, "isEnabledForDataclass:", *MEMORY[0x1E0C8EF10]));
  v17 = objc_msgSend(v5, "aa_ageCategory");
  if (v17 > 9)
    v18 = 1;
  else
    v18 = qword_190455010[v17];
  -[PKAppleAccountInformation setAgeCategory:](v3, "setAgeCategory:", v18);
  if (PKSimulateIsManagedAccount())
  {
    PKLogFacilityTypeGetObject(6uLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, "Simulating Managed Account (MAID) because of debug preference", v21, 2u);
    }

    -[PKAppleAccountInformation setIsManagedAppleAccount:](v3, "setIsManagedAppleAccount:", 1);
    if (PKSimulateWalletDisabledForManagedAccount())
      -[PKAppleAccountInformation setIsWalletEnabledOnManagedAppleAccount:](v3, "setIsWalletEnabledOnManagedAppleAccount:", 0);
  }

  return v3;
}

- (id)_primaryAppleAccount
{
  void *v2;
  void *v3;

  -[PKAppleAccountManager accountStore](self, "accountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_aidaAccount
{
  void *v2;
  void *v3;

  -[PKAppleAccountManager accountStore](self, "accountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aida_accountForPrimaryiCloudAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ACAccountStore)accountStore
{
  ACAccountStore *accountStore;
  ACAccountStore *v4;
  ACAccountStore *v5;

  accountStore = self->_accountStore;
  if (!accountStore)
  {
    v4 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E0C8F2B8]);
    v5 = self->_accountStore;
    self->_accountStore = v4;

    accountStore = self->_accountStore;
  }
  return accountStore;
}

void __39__PKAppleAccountManager_sharedInstance__block_invoke()
{
  PKAppleAccountManager *v0;
  void *v1;

  v0 = objc_alloc_init(PKAppleAccountManager);
  v1 = (void *)qword_1ECF224E0;
  qword_1ECF224E0 = (uint64_t)v0;

}

- (void)renewAppleAccountWithCompletionHandler:(id)a3
{
  -[PKAppleAccountManager _renewAppleAccountSilently:completion:](self, "_renewAppleAccountSilently:completion:", 0, a3);
}

- (void)silentlyRenewAppleAccountWithCompletionHandler:(id)a3
{
  -[PKAppleAccountManager _renewAppleAccountSilently:completion:](self, "_renewAppleAccountSilently:completion:", 1, a3);
}

- (void)_renewAppleAccountSilently:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  void (**v9)(void *, uint64_t, _QWORD);
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v19[16];
  _QWORD aBlock[5];
  id v21;
  const __CFString *v22;
  _QWORD v23[3];
  _QWORD v24[4];

  v4 = a3;
  v24[3] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[PKAppleAccountManager _aidaAccount](self, "_aidaAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PKAppleAccountManager__renewAppleAccountSilently_completion___block_invoke;
  aBlock[3] = &unk_1E2ACB2F8;
  v8 = v6;
  aBlock[4] = self;
  v21 = v8;
  v9 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(aBlock);
  PKLogFacilityTypeGetObject(6uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v4)
    {
      if (v11)
      {
        *(_WORD *)v19 = 0;
        v12 = "Device has Grandslam account, silently asking accounts to renew the Wallet token";
LABEL_11:
        _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, v12, v19, 2u);
      }
    }
    else if (v11)
    {
      *(_WORD *)v19 = 0;
      v12 = "Device has Grandslam account, asking accounts to renew the Wallet token";
      goto LABEL_11;
    }

    v22 = CFSTR("com.apple.gs.pb.auth");
    v23[0] = CFSTR("Services");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v16;
    v23[1] = *MEMORY[0x1E0C8F330];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4 ^ 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v17;
    v23[2] = *MEMORY[0x1E0C8F320];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKAppleAccountManager accountStore](self, "accountStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "renewCredentialsForAccount:options:completion:", v7, v14, v9);
    goto LABEL_13;
  }
  if (v11)
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Device doesn't have a Grandslam account, renewing the Apple Account to create one", v19, 2u);
  }

  -[PKAppleAccountManager _primaryAppleAccount](self, "_primaryAppleAccount");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[PKAppleAccountManager accountStore](self, "accountStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "renewCredentialsForAccount:force:reason:completion:", v14, 1, 0, v9);
LABEL_13:

    goto LABEL_14;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Device doesn't have a primary Apple Account", v19, 2u);
  }

  v9[2](v9, 2, 0);
  v14 = 0;
LABEL_14:

}

void __63__PKAppleAccountManager__renewAppleAccountSilently_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "localizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Error renewing apple account credential: %@", (uint8_t *)&v10, 0xCu);

    }
  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "appleAccountInformation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, a2, v9);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
