@implementation PKDAManager

- (PKDAManager)init
{
  PKDAManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *workQueue;
  PKDAPairingSessionManager *v5;
  PKDAPairingSessionManager *pairingSessionManager;
  PKDASessionManager *v7;
  PKDASessionManager *managementSessionManager;
  PKDASessionManager *v9;
  PKDASessionManager *sharingSessionManager;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKDAManager;
  v2 = -[PKDAManager init](&v12, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.passkit.damanager.work", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

    v5 = -[PKDAPairingSessionManager initWithQueue:sessionCreationBlock:]([PKDAPairingSessionManager alloc], "initWithQueue:sessionCreationBlock:", v2->_workQueue, &__block_literal_global_45);
    pairingSessionManager = v2->_pairingSessionManager;
    v2->_pairingSessionManager = v5;

    v7 = -[PKDASessionManager initWithQueue:sessionCreationBlock:]([PKDASessionManager alloc], "initWithQueue:sessionCreationBlock:", v2->_workQueue, &__block_literal_global_121);
    managementSessionManager = v2->_managementSessionManager;
    v2->_managementSessionManager = v7;

    v9 = -[PKDASessionManager initWithQueue:sessionCreationBlock:]([PKDASessionManager alloc], "initWithQueue:sessionCreationBlock:", v2->_workQueue, &__block_literal_global_123);
    sharingSessionManager = v2->_sharingSessionManager;
    v2->_sharingSessionManager = v9;

  }
  return v2;
}

id __19__PKDAManager_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PKAppletSubcredentialPairingSession createSessionWithDelegate:](PKAppletSubcredentialPairingSession, "createSessionWithDelegate:", a2);
}

id __19__PKDAManager_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[PKAppletSubcredentialManagementSession createSessionWithDelegate:](PKAppletSubcredentialManagementSession, "createSessionWithDelegate:", a2);
}

id __19__PKDAManager_init__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return +[PKAppletSubcredentialSharingSession createSessionWithDelegate:](PKAppletSubcredentialSharingSession, "createSessionWithDelegate:", a2);
}

+ (BOOL)isSupported
{
  return objc_msgSend(MEMORY[0x1E0D1D388], "isSupported");
}

+ (BOOL)isCarKeySupportedForManufacturerIdentifier:(id)a3 issuerIdentifier:(id)a4 productPlanIdentifier:(id)a5
{
  char v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v5 = objc_msgSend(MEMORY[0x1E0D1D388], "isCarKeySupportedForManufacturer:brand:ppid:error:", a3, a4, a5, &v9);
  v6 = v9;
  if (v6)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v6;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "PKDAManager: Failed to check isCarKeySupported: %@", buf, 0xCu);
    }

  }
  return v5;
}

- (void)listCredentialsWithCompletion:(id)a3
{
  id v4;
  PKDASessionManager *v5;
  PKDASessionManager *managementSessionManager;
  PKDASessionManager *v7;
  _QWORD v8[4];
  PKDASessionManager *v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v5 = self->_managementSessionManager;
    managementSessionManager = self->_managementSessionManager;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __45__PKDAManager_listCredentialsWithCompletion___block_invoke;
    v8[3] = &unk_1E2AC6BC0;
    v9 = v5;
    v10 = v4;
    v7 = v5;
    -[PKDASessionManager performBlockWithSession:](managementSessionManager, "performBlockWithSession:", v8);

  }
}

void __45__PKDAManager_listCredentialsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD aBlock[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__PKDAManager_listCredentialsWithCompletion___block_invoke_2;
  aBlock[3] = &unk_1E2AC6968;
  v11 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v13 = v6;
  v7 = v6;
  v8 = _Block_copy(aBlock);
  v9 = v8;
  if (v5)
    objc_msgSend(v5, "listCredentialsWithCompletion:", v8);
  else
    (*((void (**)(void *, _QWORD))v8 + 2))(v8, 0);

}

uint64_t __45__PKDAManager_listCredentialsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)listCredentialsWithSession:(id)a3 seid:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v7 = a4;
  v8 = a5;
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0D1D388];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__PKDAManager_listCredentialsWithSession_seid_completion___block_invoke;
    v10[3] = &unk_1E2ABE710;
    v11 = v7;
    v12 = v8;
    objc_msgSend(v9, "listKeysWithSession:seid:callback:", a3, v11, v10);

  }
}

void __58__PKDAManager_listCredentialsWithSession_seid_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  PKAppletSubcredential *v15;
  PKAppletSubcredential *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v27 = v20;
      v28 = 2112;
      v29 = v7;
      _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, "Failed to list keys on seid %@ with error: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          v15 = [PKAppletSubcredential alloc];
          v16 = -[PKAppletSubcredential initWithKeyInformation:](v15, "initWithKeyInformation:", v14, (_QWORD)v21);
          if (v16)
            objc_msgSend(v8, "addObject:", v16);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v11);
    }

    v17 = *(_QWORD *)(a1 + 40);
    v18 = (void *)objc_msgSend(v8, "copy");
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);

  }
}

- (void)listDACredentialsWithSession:(id)a3 seid:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v7 = a4;
  v8 = a5;
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0D1D388];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __60__PKDAManager_listDACredentialsWithSession_seid_completion___block_invoke;
    v10[3] = &unk_1E2ABE710;
    v11 = v7;
    v12 = v8;
    objc_msgSend(v9, "listKeysWithSession:seid:callback:", a3, v11, v10);

  }
}

void __60__PKDAManager_listDACredentialsWithSession_seid_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void (*v8)(void);
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138412546;
      v12 = v10;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Failed to list keys on seid %@ with error: %@", (uint8_t *)&v11, 0x16u);
    }

    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v8();

}

- (void)revokeSharedCredentials:(id)a3 onCredential:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKDASessionManager *v11;
  id v12;
  id v13;
  id v14;
  PKDASessionManager *v15;
  _QWORD v16[4];
  PKDASessionManager *v17;
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self->_managementSessionManager;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __67__PKDAManager_revokeSharedCredentials_onCredential_withCompletion___block_invoke;
  v16[3] = &unk_1E2AC69B8;
  v17 = v11;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  v15 = v11;
  -[PKDASessionManager performBlockWithSession:](v15, "performBlockWithSession:", v16);

}

void __67__PKDAManager_revokeSharedCredentials_onCredential_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void (**v8)(void *, _QWORD, void *);
  NSObject *v9;
  void *v10;
  uint8_t v11[8];
  _QWORD aBlock[4];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PKDAManager_revokeSharedCredentials_onCredential_withCompletion___block_invoke_2;
  aBlock[3] = &unk_1E2AC6990;
  v13 = *(id *)(a1 + 32);
  v7 = v6;
  v14 = v7;
  v15 = *(id *)(a1 + 56);
  v8 = (void (**)(void *, _QWORD, void *))_Block_copy(aBlock);
  if (v5)
  {
    objc_msgSend(v5, "revokeSharedCredentials:onCredential:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v8);
  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Unable to get session to revoke shared credentials with.", v11, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKSubcredentialProvisioningErrorDomain"), 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v10);

  }
}

void __67__PKDAManager_revokeSharedCredentials_onCredential_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(void))(v6 + 16))();
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);

}

- (void)revokeSharesWithGroupIdentifiers:(id)a3 shouldCascade:(BOOL)a4 credential:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  PKDASessionManager *v13;
  id v14;
  id v15;
  id v16;
  PKDASessionManager *v17;
  _QWORD v18[4];
  PKDASessionManager *v19;
  id v20;
  id v21;
  id v22;
  BOOL v23;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = self->_managementSessionManager;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __84__PKDAManager_revokeSharesWithGroupIdentifiers_shouldCascade_credential_completion___block_invoke;
  v18[3] = &unk_1E2AC69E0;
  v19 = v13;
  v20 = v10;
  v23 = a4;
  v21 = v11;
  v22 = v12;
  v14 = v11;
  v15 = v10;
  v16 = v12;
  v17 = v13;
  -[PKDASessionManager performBlockWithSession:](v17, "performBlockWithSession:", v18);

}

void __84__PKDAManager_revokeSharesWithGroupIdentifiers_shouldCascade_credential_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void (**v8)(void *, _QWORD, void *);
  NSObject *v9;
  void *v10;
  uint8_t v11[8];
  _QWORD aBlock[4];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__PKDAManager_revokeSharesWithGroupIdentifiers_shouldCascade_credential_completion___block_invoke_2;
  aBlock[3] = &unk_1E2AC6990;
  v13 = *(id *)(a1 + 32);
  v7 = v6;
  v14 = v7;
  v15 = *(id *)(a1 + 56);
  v8 = (void (**)(void *, _QWORD, void *))_Block_copy(aBlock);
  if (v5)
  {
    objc_msgSend(v5, "revokeSharesWithGroupIdentifiers:shouldCascade:credential:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), v8);
  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Unable to get session to revoke shared credentials with.", v11, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKSubcredentialProvisioningErrorDomain"), 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v10);

  }
}

void __84__PKDAManager_revokeSharesWithGroupIdentifiers_shouldCascade_credential_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(void))(v6 + 16))();
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);

}

- (void)rescindInvitations:(id)a3 onCredential:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKDASessionManager *v11;
  id v12;
  id v13;
  id v14;
  PKDASessionManager *v15;
  _QWORD v16[4];
  PKDASessionManager *v17;
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self->_managementSessionManager;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __62__PKDAManager_rescindInvitations_onCredential_withCompletion___block_invoke;
  v16[3] = &unk_1E2AC69B8;
  v17 = v11;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  v15 = v11;
  -[PKDASessionManager performBlockWithSession:](v15, "performBlockWithSession:", v16);

}

void __62__PKDAManager_rescindInvitations_onCredential_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void (**v8)(void *, void *);
  NSObject *v9;
  void *v10;
  uint8_t v11[8];
  _QWORD aBlock[4];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PKDAManager_rescindInvitations_onCredential_withCompletion___block_invoke_2;
  aBlock[3] = &unk_1E2AC6A08;
  v13 = *(id *)(a1 + 32);
  v14 = *(id *)(a1 + 56);
  v7 = v6;
  v15 = v7;
  v8 = (void (**)(void *, void *))_Block_copy(aBlock);
  if (v5)
  {
    objc_msgSend(v5, "rescindInvitations:onCredential:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v8);
  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Unable to get session to revoke shared credentials with.", v11, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKSubcredentialProvisioningErrorDomain"), 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v10);

  }
}

void __62__PKDAManager_rescindInvitations_onCredential_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    v3 = v6;
  }
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
    v3 = v6;
  }

}

- (void)updateTrackingAttestation:(id)a3 forCredential:(id)a4 encryptedContainer:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  PKDASessionManager *v18;
  PKDASessionManager *managementSessionManager;
  id v20;
  PKDASessionManager *v21;
  _QWORD v22[4];
  PKDASessionManager *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v12)
  {
    v16 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v12, "data");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rawEphemeralPublicKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDAManager decryptData:withCredential:ephemeralPublicKey:](self, "decryptData:withCredential:ephemeralPublicKey:", v14, v11, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
LABEL_7:
    v18 = self->_managementSessionManager;
    managementSessionManager = self->_managementSessionManager;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __85__PKDAManager_updateTrackingAttestation_forCredential_encryptedContainer_completion___block_invoke;
    v22[3] = &unk_1E2AC6A30;
    v23 = v18;
    v24 = v11;
    v25 = v16;
    v26 = v10;
    v27 = v13;
    v20 = v16;
    v21 = v18;
    -[PKDASessionManager performBlockWithSession:](managementSessionManager, "performBlockWithSession:", v22);

    goto LABEL_8;
  }
  PKLogFacilityTypeGetObject(0x16uLL);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v11;
    _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "Failed to decrypt data to track credential %@", buf, 0xCu);
  }

  (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
LABEL_8:

}

void __85__PKDAManager_updateTrackingAttestation_forCredential_encryptedContainer_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  _BOOL8 v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "trackSubcredential:deviceData:attestation:", a1[5], a1[6], a1[7]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 == 0;
    if (v7)
    {
      PKLogFacilityTypeGetObject(0x16uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = a1[5];
        v12 = 138412546;
        v13 = v10;
        v14 = 2112;
        v15 = v7;
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Failed to track credential %@: %@", (uint8_t *)&v12, 0x16u);
      }

    }
  }
  else
  {
    v8 = 0;
  }
  v11 = a1[8];
  if (v11)
    (*(void (**)(uint64_t, _BOOL8))(v11 + 16))(v11, v8);
  if (v6)
    v6[2](v6);

}

- (void)declineSharingInvitation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "identifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PKDAManager declineSharingInvitationWithIdentifier:completion:](self, "declineSharingInvitationWithIdentifier:completion:", v7, v6);

}

- (void)declineSharingInvitationWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PKDASessionManager *v8;
  PKDASessionManager *sharingSessionManager;
  PKDASessionManager *v10;
  _QWORD v11[4];
  PKDASessionManager *v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = self->_sharingSessionManager;
    sharingSessionManager = self->_sharingSessionManager;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __65__PKDAManager_declineSharingInvitationWithIdentifier_completion___block_invoke;
    v11[3] = &unk_1E2AC6EA0;
    v12 = v8;
    v13 = v6;
    v14 = v7;
    v10 = v8;
    -[PKDASessionManager performBlockWithSession:](sharingSessionManager, "performBlockWithSession:", v11);

  }
}

void __65__PKDAManager_declineSharingInvitationWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a2, "cancelSharingInvitationWithIdentifier:", *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    v5 = v6;
  }

}

- (void)sendSharingInvitationWithRequest:(id)a3 auth:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKDASessionManager *v11;
  PKDASessionManager *sharingSessionManager;
  id v13;
  id v14;
  id v15;
  PKDASessionManager *v16;
  _QWORD v17[4];
  PKDASessionManager *v18;
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self->_sharingSessionManager;
  sharingSessionManager = self->_sharingSessionManager;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__PKDAManager_sendSharingInvitationWithRequest_auth_completion___block_invoke;
  v17[3] = &unk_1E2AC6E50;
  v18 = v11;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v13 = v9;
  v14 = v8;
  v15 = v10;
  v16 = v11;
  -[PKDASessionManager performBlockWithSession:](sharingSessionManager, "performBlockWithSession:", v17);

}

void __64__PKDAManager_sendSharingInvitationWithRequest_auth_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void (**v8)(void *, _QWORD, void *);
  void *v9;
  _QWORD aBlock[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__PKDAManager_sendSharingInvitationWithRequest_auth_completion___block_invoke_2;
  aBlock[3] = &unk_1E2AC6A58;
  v11 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 56);
  v7 = v6;
  v13 = v7;
  v8 = (void (**)(void *, _QWORD, void *))_Block_copy(aBlock);
  if (v5)
  {
    objc_msgSend(v5, "sendSharingInvitationWithRequest:auth:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKSubcredentialProvisioningErrorDomain"), 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v9);

  }
}

void __64__PKDAManager_sendSharingInvitationWithRequest_auth_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v8, v5);
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    (*(void (**)(void))(v7 + 16))();

}

- (void)sendSharingInvitation:(id)a3 forInvitationRequest:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKDASessionManager *v11;
  PKDASessionManager *sharingSessionManager;
  id v13;
  id v14;
  id v15;
  PKDASessionManager *v16;
  _QWORD v17[4];
  PKDASessionManager *v18;
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self->_sharingSessionManager;
  sharingSessionManager = self->_sharingSessionManager;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __69__PKDAManager_sendSharingInvitation_forInvitationRequest_completion___block_invoke;
  v17[3] = &unk_1E2AC6E50;
  v18 = v11;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v13 = v9;
  v14 = v8;
  v15 = v10;
  v16 = v11;
  -[PKDASessionManager performBlockWithSession:](sharingSessionManager, "performBlockWithSession:", v17);

}

void __69__PKDAManager_sendSharingInvitation_forInvitationRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void (**v8)(void *, _QWORD, void *);
  void *v9;
  _QWORD aBlock[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PKDAManager_sendSharingInvitation_forInvitationRequest_completion___block_invoke_2;
  aBlock[3] = &unk_1E2AC6A80;
  v11 = *(id *)(a1 + 32);
  v7 = v6;
  v12 = v7;
  v13 = *(id *)(a1 + 56);
  v8 = (void (**)(void *, _QWORD, void *))_Block_copy(aBlock);
  if (v5)
  {
    objc_msgSend(v5, "sendSharingInvitation:forInvitationRequest:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKSubcredentialProvisioningErrorDomain"), 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v9);

  }
}

void __69__PKDAManager_sendSharingInvitation_forInvitationRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(void))(v6 + 16))();
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);

}

- (void)probeTerminalForPairingStatusWithCompletion:(id)a3
{
  id v4;
  PKDAPairingSessionManager *v5;
  PKDAPairingSessionManager *v6;
  _QWORD v7[4];
  PKDAPairingSessionManager *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v5 = self->_pairingSessionManager;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__PKDAManager_probeTerminalForPairingStatusWithCompletion___block_invoke;
    v7[3] = &unk_1E2AC6AD0;
    v8 = v5;
    v9 = v4;
    v6 = v5;
    -[PKDASessionManager performBlockWithSession:](v6, "performBlockWithSession:", v7);

  }
}

void __59__PKDAManager_probeTerminalForPairingStatusWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t v15[16];
  _QWORD aBlock[4];
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PKDAManager_probeTerminalForPairingStatusWithCompletion___block_invoke_2;
  aBlock[3] = &unk_1E2AC6AA8;
  v17 = *(id *)(a1 + 40);
  v7 = v6;
  v18 = v7;
  v8 = _Block_copy(aBlock);
  v9 = objc_msgSend(*(id *)(a1 + 32), "isProbingTerminalPairingStatus");
  PKLogFacilityTypeGetObject(0x16uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Already probing terminal", v15, 2u);
    }

  }
  else
  {
    if (v11)
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Probing terminal...", v15, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setProbingTerminalPairingStatus:", 1);
    if (!v5
      || (objc_msgSend(v5, "probeTerminalForPairingStatus"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v14,
          v14))
    {
      (*((void (**)(void *, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
      goto LABEL_11;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "probingCompletionBlocks");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = _Block_copy(v8);
  objc_msgSend(v12, "addObject:", v13);

LABEL_11:
}

uint64_t __59__PKDAManager_probeTerminalForPairingStatusWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)prewarmWithManufacturerIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PKDAPairingSessionManager *v8;
  id v9;
  id v10;
  PKDAPairingSessionManager *v11;
  _QWORD v12[4];
  PKDAPairingSessionManager *v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = self->_pairingSessionManager;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__PKDAManager_prewarmWithManufacturerIdentifier_completion___block_invoke;
  v12[3] = &unk_1E2AC6B20;
  v14 = v6;
  v15 = v7;
  v13 = v8;
  v9 = v6;
  v10 = v7;
  v11 = v8;
  -[PKDASessionManager performBlockWithSession:](v11, "performBlockWithSession:", v12);

}

void __60__PKDAManager_prewarmWithManufacturerIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void (**v8)(void *, void *);
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint8_t v14[16];
  _QWORD aBlock[4];
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PKDAManager_prewarmWithManufacturerIdentifier_completion___block_invoke_2;
  aBlock[3] = &unk_1E2AC6AF8;
  v16 = *(id *)(a1 + 48);
  v7 = v6;
  v17 = v7;
  v8 = (void (**)(void *, void *))_Block_copy(aBlock);
  if (!v5)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = 1;
LABEL_7:
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("PKSubcredentialProvisioningErrorDomain"), v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v13);
    goto LABEL_11;
  }
  objc_msgSend(*(id *)(a1 + 32), "prewarmCompletion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Outstanding prewarm operation in progress", v14, 2u);
    }

    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v5, "prewarmWithManufacturerIdentifier:", *(_QWORD *)(a1 + 40));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    v8[2](v8, v13);
  objc_msgSend(*(id *)(a1 + 32), "setPrewarmCompletion:", v8);
LABEL_11:

}

void __60__PKDAManager_prewarmWithManufacturerIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    v3 = v6;
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
    v3 = v6;
  }

}

- (id)decryptData:(id)a3 withCredential:(id)a4 ephemeralPublicKey:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v7, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SESEndPointPrivacyDecryption();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  v13 = v11;
  if (v12)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = v15;
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Failed to decrypt data for credential '%@' with error: %@", buf, 0x16u);

    }
    v13 = 0;
  }
  v16 = v13;

  return v16;
}

- (void)requestSharingInvitation:(id)a3 from:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKDASessionManager *v11;
  id v12;
  id v13;
  id v14;
  PKDASessionManager *v15;
  _QWORD v16[4];
  PKDASessionManager *v17;
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self->_sharingSessionManager;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __56__PKDAManager_requestSharingInvitation_from_completion___block_invoke;
  v16[3] = &unk_1E2AC6E50;
  v17 = v11;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  v15 = v11;
  -[PKDASessionManager performBlockWithSession:](v15, "performBlockWithSession:", v16);

}

void __56__PKDAManager_requestSharingInvitation_from_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void (**v8)(void *, void *);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __56__PKDAManager_requestSharingInvitation_from_completion___block_invoke_2;
  v13 = &unk_1E2AC6AF8;
  v14 = *(id *)(a1 + 56);
  v7 = v6;
  v15 = v7;
  v8 = (void (**)(void *, void *))_Block_copy(&v10);
  if (v5)
  {
    objc_msgSend(v5, "requestSharingInvitation:from:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v8, v10, v11, v12, v13, v14);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKSubcredentialProvisioningErrorDomain"), 1, 0, v10, v11, v12, v13, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v9);

  }
}

void __56__PKDAManager_requestSharingInvitation_from_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    v3 = v6;
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
    v3 = v6;
  }

}

- (void)signData:(id)a3 auth:(id)a4 bundleIdentifier:(id)a5 nonce:(id)a6 credential:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  PKDASessionManager *managementSessionManager;
  PKDASessionManager *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (v19)
  {
    managementSessionManager = self->_managementSessionManager;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __74__PKDAManager_signData_auth_bundleIdentifier_nonce_credential_completion___block_invoke;
    v22[3] = &unk_1E2AC6B70;
    v23 = v14;
    v24 = v15;
    v25 = v16;
    v26 = v17;
    v27 = v18;
    v28 = v19;
    v21 = managementSessionManager;
    -[PKDASessionManager performBlockWithSession:](v21, "performBlockWithSession:", v22);

  }
}

void __74__PKDAManager_signData_auth_bundleIdentifier_nonce_credential_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(_QWORD);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t v13[16];
  _QWORD v14[4];
  id v15;
  void (**v16)(_QWORD);

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __74__PKDAManager_signData_auth_bundleIdentifier_nonce_credential_completion___block_invoke_2;
    v14[3] = &unk_1E2AC6B48;
    v11 = *(_QWORD *)(a1 + 64);
    v15 = *(id *)(a1 + 72);
    v16 = v6;
    objc_msgSend(v5, "signData:auth:bundleIdentifier:nonce:credential:completion:", v7, v8, v9, v10, v11, v14);

  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Failed to get session to sign with", v13, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    if (v6)
      v6[2](v6);
  }

}

uint64_t __74__PKDAManager_signData_auth_bundleIdentifier_nonce_credential_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)immobilizerTokensCountForCredential:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PKDASessionManager *managementSessionManager;
  PKDASessionManager *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    managementSessionManager = self->_managementSessionManager;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __62__PKDAManager_immobilizerTokensCountForCredential_completion___block_invoke;
    v11[3] = &unk_1E2AC6BC0;
    v13 = v7;
    v12 = v6;
    v10 = managementSessionManager;
    -[PKDASessionManager performBlockWithSession:](v10, "performBlockWithSession:", v11);

  }
}

void __62__PKDAManager_immobilizerTokensCountForCredential_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[4];
  void (**v11)(_QWORD);
  id v12;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __62__PKDAManager_immobilizerTokensCountForCredential_completion___block_invoke_139;
    v10[3] = &unk_1E2AC6B98;
    v11 = v6;
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v5, "immobilizerTokensCountForCredential:completion:", v8, v10);

  }
  else
  {
    if (v6)
      v6[2](v6);
    PKLogFacilityTypeGetObject(0x16uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Failed to get session to count immo tokens with", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __62__PKDAManager_immobilizerTokensCountForCredential_completion___block_invoke_139(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)removeSharedCredentialsWithIdentifiers:(id)a3 credential:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKDASessionManager *managementSessionManager;
  id v12;
  id v13;
  id v14;
  PKDASessionManager *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  managementSessionManager = self->_managementSessionManager;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __76__PKDAManager_removeSharedCredentialsWithIdentifiers_credential_completion___block_invoke;
  v16[3] = &unk_1E2AC6D60;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  v15 = managementSessionManager;
  -[PKDASessionManager performBlockWithSession:](v15, "performBlockWithSession:", v16);

}

void __76__PKDAManager_removeSharedCredentialsWithIdentifiers_credential_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(_QWORD);
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint8_t v12[16];
  _QWORD v13[4];
  id v14;
  void (**v15)(_QWORD);

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __76__PKDAManager_removeSharedCredentialsWithIdentifiers_credential_completion___block_invoke_2;
    v13[3] = &unk_1E2AC6AF8;
    v14 = *(id *)(a1 + 48);
    v15 = v6;
    objc_msgSend(v5, "removeSharedCredentialsWithIdentifiers:credential:completion:", v7, v8, v13);

  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Failed to get session to count immo tokens with", v12, 2u);
    }

    v10 = *(_QWORD *)(a1 + 48);
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKSubcredentialProvisioningErrorDomain"), 1, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

    }
    if (v6)
      v6[2](v6);
  }

}

void __76__PKDAManager_removeSharedCredentialsWithIdentifiers_credential_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    v3 = v6;
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
    v3 = v6;
  }

}

- (void)statusForSentSharingInvitationWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PKDASessionManager *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD *v14;
  _QWORD v15[4];

  v6 = a3;
  v7 = a4;
  v8 = self->_managementSessionManager;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__PKDAManager_statusForSentSharingInvitationWithIdentifier_completion___block_invoke;
  v11[3] = &unk_1E2AC6C60;
  v9 = v7;
  v13 = v9;
  v10 = v6;
  v12 = v10;
  v14 = v15;
  -[PKDASessionManager performBlockWithSession:](v8, "performBlockWithSession:", v11);

  _Block_object_dispose(v15, 8);
}

void __71__PKDAManager_statusForSentSharingInvitationWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t v13[16];
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  _QWORD aBlock[4];
  id v20;
  id v21;

  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__PKDAManager_statusForSentSharingInvitationWithIdentifier_completion___block_invoke_2;
  aBlock[3] = &unk_1E2AC6BE8;
  v20 = *(id *)(a1 + 40);
  v8 = v6;
  v21 = v8;
  v9 = _Block_copy(aBlock);
  if (v5)
  {
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __71__PKDAManager_statusForSentSharingInvitationWithIdentifier_completion___block_invoke_3;
    v14[3] = &unk_1E2AC6C38;
    v15 = *(id *)(a1 + 32);
    v10 = v5;
    v11 = *(_QWORD *)(a1 + 48);
    v16 = v10;
    v18 = v11;
    v17 = v9;
    objc_msgSend(v10, "listCredentialsWithCompletion:", v14);

  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Failed to get session to obtain sent sharing invitation status", v13, 2u);
    }

    (*((void (**)(void *, _QWORD))v9 + 2))(v9, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  }

}

uint64_t __71__PKDAManager_statusForSentSharingInvitationWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __71__PKDAManager_statusForSentSharingInvitationWithIdentifier_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *oslog;
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(0x16uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v27 = v5;
    v28 = 2048;
    v29 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "status for sent invitationIdentifier: %@, credentials count: %lu", buf, 0x16u);
  }
  oslog = v4;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
LABEL_5:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v10);
      if ((objc_msgSend(v11, "isSharedCredential", oslog) & 1) == 0)
      {
        v12 = *(void **)(a1 + 40);
        objc_msgSend(v11, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __71__PKDAManager_statusForSentSharingInvitationWithIdentifier_completion___block_invoke_142;
        v18[3] = &unk_1E2AC6C10;
        v18[4] = v11;
        v14 = *(id *)(a1 + 32);
        v15 = *(_QWORD *)(a1 + 56);
        v19 = v14;
        v20 = v15;
        objc_msgSend(v12, "listSharingInvitationsForKeyIdentifier:withCompletion:", v13, v18);

      }
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v8)
          goto LABEL_5;
        break;
      }
    }
  }

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v27 = v16;
      _os_log_impl(&dword_18FC92000, oslog, OS_LOG_TYPE_DEFAULT, "status for sent invitation identifier not found: %@", buf, 0xCu);
    }

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 8;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __71__PKDAManager_statusForSentSharingInvitationWithIdentifier_completion___block_invoke_142(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint8_t v29[128];
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(0x16uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    *(_DWORD *)buf = 138412546;
    v31 = v5;
    v32 = 2112;
    v33 = v3;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Checking status for credential: %@ \n shares: %@", buf, 0x16u);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v3;
  v19 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v19)
  {
    v7 = *(_QWORD *)v25;
    v18 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v6);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        objc_msgSend(v9, "credentialShares", v18);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v21;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v21 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
              objc_msgSend(v15, "identifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "isEqualToString:", a1[5]);

              if (v17)
              {
                *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v15, "status");

                goto LABEL_20;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            if (v12)
              continue;
            break;
          }
        }

        v7 = v18;
      }
      v19 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v19);
  }
LABEL_20:

}

- (void)outstandingInvitesForCredential:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PKDASessionManager *managementSessionManager;
  id v9;
  id v10;
  PKDASessionManager *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  managementSessionManager = self->_managementSessionManager;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__PKDAManager_outstandingInvitesForCredential_completion___block_invoke;
  v12[3] = &unk_1E2AC6BC0;
  v13 = v6;
  v14 = v7;
  v9 = v6;
  v10 = v7;
  v11 = managementSessionManager;
  -[PKDASessionManager performBlockWithSession:](v11, "performBlockWithSession:", v12);

}

void __58__PKDAManager_outstandingInvitesForCredential_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD aBlock[4];
  id v15;
  id v16;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__PKDAManager_outstandingInvitesForCredential_completion___block_invoke_2;
  aBlock[3] = &unk_1E2AC6C88;
  v15 = *(id *)(a1 + 40);
  v16 = v5;
  v7 = v5;
  v8 = a2;
  v9 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __58__PKDAManager_outstandingInvitesForCredential_completion___block_invoke_3;
  v12[3] = &unk_1E2ABE760;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v8, "listSharingInvitationsForKeyIdentifier:withCompletion:", v10, v12);

}

void __58__PKDAManager_outstandingInvitesForCredential_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    v3 = v6;
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
    v3 = v6;
  }

}

uint64_t __58__PKDAManager_outstandingInvitesForCredential_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)statusForReceivedSharingInvitationWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PKDASessionManager *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD *v14;
  _QWORD v15[4];

  v6 = a3;
  v7 = a4;
  v8 = self->_managementSessionManager;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__PKDAManager_statusForReceivedSharingInvitationWithIdentifier_completion___block_invoke;
  v11[3] = &unk_1E2AC6C60;
  v9 = v7;
  v13 = v9;
  v10 = v6;
  v12 = v10;
  v14 = v15;
  -[PKDASessionManager performBlockWithSession:](v8, "performBlockWithSession:", v11);

  _Block_object_dispose(v15, 8);
}

void __75__PKDAManager_statusForReceivedSharingInvitationWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t v13[16];
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  _QWORD aBlock[4];
  id v20;
  id v21;

  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PKDAManager_statusForReceivedSharingInvitationWithIdentifier_completion___block_invoke_2;
  aBlock[3] = &unk_1E2AC6BE8;
  v20 = *(id *)(a1 + 40);
  v8 = v6;
  v21 = v8;
  v9 = _Block_copy(aBlock);
  if (v5)
  {
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __75__PKDAManager_statusForReceivedSharingInvitationWithIdentifier_completion___block_invoke_3;
    v14[3] = &unk_1E2AC6CD8;
    v10 = *(id *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 48);
    v15 = v10;
    v18 = v11;
    v16 = v5;
    v17 = v9;
    objc_msgSend(v16, "listReceivedSharingInvitationsWithCompletion:", v14);

  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Failed to get session to obtain received sharing invitation status", v13, 2u);
    }

    (*((void (**)(void *, _QWORD))v9 + 2))(v9, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  }

}

uint64_t __75__PKDAManager_statusForReceivedSharingInvitationWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __75__PKDAManager_statusForReceivedSharingInvitationWithIdentifier_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(0x16uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v28 = v5;
    v29 = 2048;
    v30 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "status for received invitationIdentifier: %@, count: %lu", buf, 0x16u);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v28 = v11;
          _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "status for received invitation receipt: %@", buf, 0xCu);
        }

        v12 = *(void **)(a1 + 32);
        objc_msgSend(v11, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v12) = objc_msgSend(v12, "isEqualToString:", v13);

        if ((_DWORD)v12)
        {
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          {
            v14 = *(void **)(a1 + 32);
            *(_DWORD *)buf = 138412290;
            v28 = v14;
            _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "status for received matched: %@", buf, 0xCu);
          }

          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v11, "status");
          goto LABEL_17;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_17:

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __75__PKDAManager_statusForReceivedSharingInvitationWithIdentifier_completion___block_invoke_143;
    v19[3] = &unk_1E2AC6CB0;
    v15 = *(void **)(a1 + 40);
    v16 = *(id *)(a1 + 32);
    v17 = *(_QWORD *)(a1 + 56);
    v20 = v16;
    v21 = v17;
    objc_msgSend(v15, "listCredentialsWithCompletion:", v19);

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v28 = v18;
        _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "status for received invitation identifier not found: %@", buf, 0xCu);
      }

      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 8;
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __75__PKDAManager_statusForReceivedSharingInvitationWithIdentifier_completion___block_invoke_143(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  id v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(0x16uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v19 = v3;
    v20 = 2048;
    v21 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "status for received listCredentials: %@, count: %lu", buf, 0x16u);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v19 = v10;
          _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "status for received credential: %@", buf, 0xCu);
        }

        v11 = *(void **)(a1 + 32);
        objc_msgSend(v10, "invitationIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v11) = objc_msgSend(v11, "isEqualToString:", v12);

        if ((_DWORD)v11)
        {
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "status for received credential matched", buf, 2u);
          }

          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
          goto LABEL_17;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_17:

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p; management: %@; sharing: %@ >"),
               objc_opt_class(),
               self,
               self->_managementSessionManager,
               self->_sharingSessionManager);
}

- (void)generateTransactionKeyWithSession:(id)a3 seid:(id)a4 readerIdentifier:(id)a5 readerPublicKey:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(id, void *, id);
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(id, void *, id))a7;
  if (v13 && v14)
  {
    v20 = 0;
    objc_msgSend(MEMORY[0x1E0D1D388], "createHomeKey:seid:readerIdentifier:readerPublicKey:outError:", v11, v12, v13, v14, &v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v20;
    PKLogFacilityTypeGetObject(0x16uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138478083;
      v22 = v16;
      v23 = 2112;
      v24 = v17;
      _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "PKDAManager GenerateTransactionKeyWithReaderIdentifier returned %{private}@ error: %@", buf, 0x16u);
    }

    v15[2](v15, v16, v17);
  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, "PKDAManager GenerateTransactionKeyWithReaderIdentifier missing readerIdentifier or readerPublicKey", buf, 2u);
    }

    v15[2](v15, 0, 0);
  }

}

- (void)createAliroHomeKey:(id)a3 seid:(id)a4 readerIdentifier:(id)a5 readerPublicKey:(id)a6 homeIdentifier:(id)a7 withCompletion:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(id, void *, id);
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = (void (**)(id, void *, id))a8;
  if (v15 && v16)
  {
    v23 = 0;
    objc_msgSend(MEMORY[0x1E0D1D388], "createAliroHomeKey:seid:readerIdentifier:readerPublicKey:homeUUID:outError:", v13, v14, v15, v16, v17, &v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v23;
    PKLogFacilityTypeGetObject(0x16uLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138478083;
      v25 = v19;
      v26 = 2112;
      v27 = v20;
      _os_log_impl(&dword_18FC92000, v21, OS_LOG_TYPE_DEFAULT, "PKDAManager createAliroHomeKey returned %{private}@ error: %@", buf, 0x16u);
    }

    v18[2](v18, v19, v20);
  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "PKDAManager createAliroHomeKey missing readerIdentifier or readerPublicKey", buf, 2u);
    }

    v18[2](v18, 0, 0);
  }

}

- (void)generateTransactionKeyWithParameters:(id)a3 withCompletion:(id)a4
{
  id v5;
  void (**v6)(id, void *, id);
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *, id))a4;
  if (v5)
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0D1D388], "createHydraKey:seid:serverParameters:outError:", 0, 0, v5, &v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;
    PKLogFacilityTypeGetObject(0x16uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138478083;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "PKDAManager GenerateTransactionKeyWithParameters returned %{private}@ error: %@", buf, 0x16u);
    }

    v6[2](v6, v7, v8);
  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "PKDAManager GenerateTransactionKeyWithParameters missing parameters", buf, 2u);
    }

    v6[2](v6, 0, 0);
  }

}

- (void)createAliroHydraKey:(id)a3 seid:(id)a4 serverParameters:(id)a5 withCompletion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void (**v12)(id, void *, id);
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, void *, id))a6;
  if (v10 && v11)
  {
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0D1D388], "createAliroHydraKey:seid:serverParameters:outError:", v9, v10, v11, &v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v17;
    PKLogFacilityTypeGetObject(0x16uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138478083;
      v19 = v13;
      v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "PKDAManager createAliroHydraKey returned %{private}@ error: %@", buf, 0x16u);
    }

    v12[2](v12, v13, v14);
  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "PKDAManager createAliroHomeKey missing seid or serverParameters", buf, 2u);
    }

    v12[2](v12, 0, 0);
  }

}

- (void)generateSEEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD, id);
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, _QWORD, id))a4;
  if (v6)
  {
    if (v5)
    {
      v12 = 0;
      objc_msgSend(MEMORY[0x1E0D1D388], "getHydraEncryptionCert:session:seid:outError:", v5, 0, 0, &v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v12;
      PKLogFacilityTypeGetObject(0x16uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v8;
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "PKDAManager GenerateTransactionKeyWithParameters returned error: %@", buf, 0xCu);
      }

      if (v8)
        v10 = 0;
      else
        v10 = v7;
      ((void (**)(id, void *, id))v6)[2](v6, v10, v8);

    }
    else
    {
      PKLogFacilityTypeGetObject(0x16uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "PKDAManager GenerateSEEncryptionCertificateForSubCredentialId missing parameters", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKSubcredentialProvisioningErrorDomain"), 1, 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v6[2](v6, 0, v8);
    }

  }
}

- (id)storeSEBlobForSubcredentialIdentifier:(id)a3 seBlob:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  NSObject *v10;
  const __CFString *v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  const __CFString *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    v14 = 0;
    v8 = objc_msgSend(MEMORY[0x1E0D1D388], "updateHydraKey:session:seid:encryptedSEData:outError:", v5, 0, 0, v6, &v14);
    v9 = v14;
    PKLogFacilityTypeGetObject(0x16uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = CFSTR("N");
      if (v8)
        v11 = CFSTR("Y");
      *(_DWORD *)buf = 138412546;
      v16 = v11;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "PKDAManager StoreSEBlobForSubcredentialIdentifier success: %@ error: %@", buf, 0x16u);
    }

  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "PKDAManager StoreSEBlobForSubcredentialIdentifier missing parameters", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKSubcredentialProvisioningErrorDomain"), 1, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)privacyKeysForGroupIdentifier:(id)a3 privacyKeyIdentifier:(id)a4 outError:(id *)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0D89668];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v10, "privacyKeysForGroupIdentifier:privacyKeyIdentifier:outError:", v9, v8, &v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v17;
  if (v12)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v12;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Failed to get privacy keys: %@", buf, 0xCu);
    }

    v14 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v12);
  }
  else
  {
    objc_msgSend(v11, "pk_arrayByApplyingBlock:", &__block_literal_global_153);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sortedArrayUsingComparator:", &__block_literal_global_156);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

PKLongTermPrivacyKey *__75__PKDAManager_privacyKeysForGroupIdentifier_privacyKeyIdentifier_outError___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKLongTermPrivacyKey *v3;

  v2 = a2;
  v3 = -[PKLongTermPrivacyKey initWithSESPrivacyKey:]([PKLongTermPrivacyKey alloc], "initWithSESPrivacyKey:", v2);

  return v3;
}

uint64_t __75__PKDAManager_privacyKeysForGroupIdentifier_privacyKeyIdentifier_outError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)createPrivacyKeyForGroupIdentifier:(id)a3 outError:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  PKLongTermPrivacyKey *v9;

  v5 = (void *)MEMORY[0x1E0D89668];
  v6 = a3;
  objc_msgSend(v5, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "createPrivacyKeyForGroupIdentifier:withOptions:outError:", v6, 0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PKLongTermPrivacyKey initWithSESPrivacyKey:]([PKLongTermPrivacyKey alloc], "initWithSESPrivacyKey:", v8);
  return v9;
}

- (BOOL)hasLongTermPrivacyKeyForGroupIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  BOOL v9;
  uint64_t v11;

  v3 = (void *)MEMORY[0x1E0D89668];
  v4 = a3;
  objc_msgSend(v3, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v5, "privacyKeysForGroupIdentifier:privacyKeyIdentifier:outError:", v4, 0, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v11;
  if (objc_msgSend(v6, "count"))
    v8 = v7 == 0;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

- (BOOL)deletePrivacyKey:(id)a3 outError:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0D89668], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "groupIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v6, "privacyKeysForGroupIdentifier:privacyKeyIdentifier:outError:", v7, v8, &v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v19;

  if (v10)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    PKLogFacilityTypeGetObject(0x16uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "keyIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v12;
      v22 = 2112;
      v23 = v10;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Failed to find privacy key with identifier %@: %@", buf, 0x16u);

    }
    v13 = 0;
  }
  else
  {
    objc_msgSend(v9, "firstObject");
    v11 = objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v13 = objc_msgSend(v6, "deletePrivacyKey:outError:", v11, &v18);
    v14 = v18;
    v10 = v14;
    if (a4 || (v13 & 1) == 0)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v14);
      PKLogFacilityTypeGetObject(0x16uLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "keyIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v21 = v16;
        v22 = 2112;
        v23 = v10;
        _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Failed to delete privacy key with identifier %@: %@", buf, 0x16u);

      }
    }
    else
    {
      v13 = 1;
    }
  }

  return v13;
}

- (id)decryptPayload:(id)a3 groupIdentifier:(id)a4 outError:(id *)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = (void *)MEMORY[0x1E0D89668];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "decryptPayload:withGroupIdentifier:outError:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)credentialDidActivateWithCredential:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PKDASessionManager *managementSessionManager;
  id v9;
  id v10;
  PKDASessionManager *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  managementSessionManager = self->_managementSessionManager;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__PKDAManager_credentialDidActivateWithCredential_completion___block_invoke;
  v12[3] = &unk_1E2AC6BC0;
  v13 = v6;
  v14 = v7;
  v9 = v6;
  v10 = v7;
  v11 = managementSessionManager;
  -[PKDASessionManager performBlockWithSession:](v11, "performBlockWithSession:", v12);

}

void __62__PKDAManager_credentialDidActivateWithCredential_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __62__PKDAManager_credentialDidActivateWithCredential_completion___block_invoke_2;
    v10[3] = &unk_1E2AC6AF8;
    v11 = v5;
    v12 = *(id *)(a1 + 40);
    objc_msgSend(a2, "credentialDidActivateWithCredential:completion:", v7, v10);

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKSubcredentialProvisioningErrorDomain"), 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  }
}

void __62__PKDAManager_credentialDidActivateWithCredential_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (void)updateCredentialConfigurationForCredential:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKDASessionManager *managementSessionManager;
  id v12;
  id v13;
  id v14;
  PKDASessionManager *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  managementSessionManager = self->_managementSessionManager;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __83__PKDAManager_updateCredentialConfigurationForCredential_configuration_completion___block_invoke;
  v16[3] = &unk_1E2AC6D60;
  v18 = v9;
  v19 = v10;
  v17 = v8;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  v15 = managementSessionManager;
  -[PKDASessionManager performBlockWithSession:](v15, "performBlockWithSession:", v16);

}

void __83__PKDAManager_updateCredentialConfigurationForCredential_configuration_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __83__PKDAManager_updateCredentialConfigurationForCredential_configuration_completion___block_invoke_2;
    v11[3] = &unk_1E2AC6AF8;
    v12 = v5;
    v13 = *(id *)(a1 + 48);
    objc_msgSend(a2, "updateCredentialConfigurationForCredential:configuration:completion:", v7, v8, v11);

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKSubcredentialProvisioningErrorDomain"), 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  }
}

void __83__PKDAManager_updateCredentialConfigurationForCredential_configuration_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (void)deleteCredentials:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_msgSend(a3, "pk_createArrayByApplyingBlock:", &__block_literal_global_158);
  -[PKDAManager deleteCredentialsForIdentifiers:completion:](self, "deleteCredentialsForIdentifiers:completion:", v7, v6);

}

uint64_t __44__PKDAManager_deleteCredentials_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (void)deleteCredentialsForIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PKDASessionManager *managementSessionManager;
  id v9;
  id v10;
  PKDASessionManager *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  managementSessionManager = self->_managementSessionManager;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__PKDAManager_deleteCredentialsForIdentifiers_completion___block_invoke;
  v12[3] = &unk_1E2AC6BC0;
  v13 = v6;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  v11 = managementSessionManager;
  -[PKDASessionManager performBlockWithSession:](v11, "performBlockWithSession:", v12);

}

void __58__PKDAManager_deleteCredentialsForIdentifiers_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(_QWORD);
  void (**v7)(_QWORD);
  PKAsyncUnaryOperationComposer *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  void (**v23)(_QWORD);
  void *v24;
  uint8_t buf[16];
  _QWORD v26[4];
  id v27;
  id v28;
  void (**v29)(_QWORD);
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  v24 = v5;
  if (v5)
  {
    v23 = v6;
    v8 = objc_alloc_init(PKAsyncUnaryOperationComposer);
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v10 = *(id *)(a1 + 32);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    v12 = MEMORY[0x1E0C809B0];
    if (v11)
    {
      v13 = v11;
      v14 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v35 != v14)
            objc_enumerationMutation(v10);
          v16 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          v30[0] = v12;
          v30[1] = 3221225472;
          v30[2] = __58__PKDAManager_deleteCredentialsForIdentifiers_completion___block_invoke_2;
          v30[3] = &unk_1E2AC6DB0;
          v31 = v24;
          v32 = v16;
          v33 = v9;
          -[PKAsyncUnaryOperationComposer addOperation:](v8, "addOperation:", v30);

        }
        v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v13);
    }

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v12;
    v26[1] = 3221225472;
    v26[2] = __58__PKDAManager_deleteCredentialsForIdentifiers_completion___block_invoke_163;
    v26[3] = &unk_1E2AC6DD8;
    v18 = *(id *)(a1 + 40);
    v27 = v9;
    v28 = v18;
    v7 = v23;
    v29 = v23;
    v19 = v9;
    v20 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v8, "evaluateWithInput:completion:", v17, v26);

  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v21, OS_LOG_TYPE_DEFAULT, "Failed to get session to delete credentials", buf, 2u);
    }

    v22 = *(_QWORD *)(a1 + 40);
    if (v22)
      (*(void (**)(uint64_t, _QWORD))(v22 + 16))(v22, 0);
    v7[2](v7);
  }

}

void __58__PKDAManager_deleteCredentialsForIdentifiers_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__PKDAManager_deleteCredentialsForIdentifiers_completion___block_invoke_3;
  v13[3] = &unk_1E2AC6D88;
  v13[4] = v9;
  v10 = *(id *)(a1 + 48);
  v15 = v6;
  v16 = v7;
  v14 = v10;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v8, "deleteCredential:completionHandler:", v9, v13);

}

void __58__PKDAManager_deleteCredentialsForIdentifiers_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412546;
      v10 = v8;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "PKDAManager error deleting credential %@, error: %@", (uint8_t *)&v9, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

uint64_t __58__PKDAManager_deleteCredentialsForIdentifiers_completion___block_invoke_163(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "count"))
      v3 = *(_QWORD *)(a1 + 32);
    else
      v3 = 0;
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)deleteCredential:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PKDASessionManager *managementSessionManager;
  id v9;
  id v10;
  PKDASessionManager *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  managementSessionManager = self->_managementSessionManager;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __43__PKDAManager_deleteCredential_completion___block_invoke;
  v12[3] = &unk_1E2AC6BC0;
  v13 = v6;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  v11 = managementSessionManager;
  -[PKDASessionManager performBlockWithSession:](v11, "performBlockWithSession:", v12);

}

void __43__PKDAManager_deleteCredential_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint8_t v10[16];
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __43__PKDAManager_deleteCredential_completion___block_invoke_2;
    v11[3] = &unk_1E2AC6E00;
    v12 = v7;
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v5, "deleteCredential:completionHandler:", v12, v11);

  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Failed to get session to delete credentials", v10, 2u);
    }

    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
      (*(void (**)(uint64_t, _QWORD))(v9 + 16))(v9, 0);
  }
  v6[2](v6);

}

void __43__PKDAManager_deleteCredential_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PKLogFacilityTypeGetObject(0x16uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "PKDAManager deleted credential %@, error: %@", (uint8_t *)&v10, 0x16u);
  }

  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v6);

}

- (void)createInviteForShare:(id)a3 forCredential:(id)a4 authorization:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  PKDASessionManager *sharingSessionManager;
  PKDASessionManager *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (v13)
  {
    sharingSessionManager = self->_sharingSessionManager;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __75__PKDAManager_createInviteForShare_forCredential_authorization_completion___block_invoke;
    v17[3] = &unk_1E2AC6E50;
    v21 = v13;
    v18 = v10;
    v19 = v11;
    v20 = v12;
    v16 = sharingSessionManager;
    -[PKDASessionManager performBlockWithSession:](v16, "performBlockWithSession:", v17);

  }
}

void __75__PKDAManager_createInviteForShare_forCredential_authorization_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __75__PKDAManager_createInviteForShare_forCredential_authorization_completion___block_invoke_2;
    v10[3] = &unk_1E2AC6E28;
    v11 = v5;
    v12 = *(id *)(a1 + 56);
    objc_msgSend(a2, "createInviteForShare:forCredential:authorization:completion:", v7, v8, v9, v10);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __75__PKDAManager_createInviteForShare_forCredential_authorization_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t);
  id v7;
  id v8;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void (**)(uint64_t))(v5 + 16);
  v7 = a3;
  v8 = a2;
  v6(v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)setTransportChannelIdentifier:(id)a3 forCredential:(id)a4 forCredentialShare:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  PKDASessionManager *sharingSessionManager;
  PKDASessionManager *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (v13)
  {
    sharingSessionManager = self->_sharingSessionManager;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __89__PKDAManager_setTransportChannelIdentifier_forCredential_forCredentialShare_completion___block_invoke;
    v17[3] = &unk_1E2AC6E50;
    v21 = v13;
    v18 = v10;
    v19 = v11;
    v20 = v12;
    v16 = sharingSessionManager;
    -[PKDASessionManager performBlockWithSession:](v16, "performBlockWithSession:", v17);

  }
}

void __89__PKDAManager_setTransportChannelIdentifier_forCredential_forCredentialShare_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __89__PKDAManager_setTransportChannelIdentifier_forCredential_forCredentialShare_completion___block_invoke_2;
    v10[3] = &unk_1E2AC6AF8;
    v11 = v5;
    v12 = *(id *)(a1 + 56);
    objc_msgSend(a2, "setTransportChannelIdentifier:forCredential:forCredentialShare:completion:", v7, v8, v9, v10);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __89__PKDAManager_setTransportChannelIdentifier_forCredential_forCredentialShare_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void (**)(uint64_t))(v3 + 16);
  v5 = a2;
  v4(v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)handleOutstandingMessage:(id)a3 subcredentialIdentifier:(id)a4 credentialShareIdentifier:(id)a5 transportIdentifier:(id)a6 completion:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[16];

  v10 = a5;
  v11 = a6;
  v12 = a7;
  if (v12)
  {
    PKDACarKeySharingMessageFromMessage(a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)MEMORY[0x1E0D1D388];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __121__PKDAManager_handleOutstandingMessage_subcredentialIdentifier_credentialShareIdentifier_transportIdentifier_completion___block_invoke;
      v16[3] = &unk_1E2ABD9C8;
      v17 = v12;
      objc_msgSend(v14, "handleSharingMessage:forInvitationIdentifier:fromMailboxIdentifier:completionHandler:", v13, v10, v11, v16);

    }
    else
    {
      PKLogFacilityTypeGetObject(0x1BuLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "PKDAManager: Error: unable to create DACarKeySharingMessage", buf, 2u);
      }

      (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);
    }

  }
}

uint64_t __121__PKDAManager_handleOutstandingMessage_subcredentialIdentifier_credentialShareIdentifier_transportIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)routingInformationForInvitationWithIdentifier:(id)a3 fromMailboxIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  PKDASessionManager *sharingSessionManager;
  PKDASessionManager *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    sharingSessionManager = self->_sharingSessionManager;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __101__PKDAManager_routingInformationForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke;
    v14[3] = &unk_1E2AC6EA0;
    v17 = v10;
    v15 = v8;
    v16 = v9;
    v13 = sharingSessionManager;
    -[PKDASessionManager performBlockWithSession:](v13, "performBlockWithSession:", v14);

  }
}

void __101__PKDAManager_routingInformationForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __101__PKDAManager_routingInformationForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke_2;
    v9[3] = &unk_1E2AC6E78;
    v10 = v5;
    v11 = *(id *)(a1 + 48);
    objc_msgSend(a2, "routingInformationForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:", v7, v8, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __101__PKDAManager_routingInformationForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t);
  id v7;
  id v8;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void (**)(uint64_t))(v5 + 16);
  v7 = a3;
  v8 = a2;
  v6(v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)getProductPlanIdentifierRequestForInvitationWithIdentifier:(id)a3 fromMailboxIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  PKDASessionManager *sharingSessionManager;
  PKDASessionManager *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    sharingSessionManager = self->_sharingSessionManager;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __107__PKDAManager_getProductPlanIdentifierRequestForInvitationWithIdentifier_fromMailboxIdentifier_completion___block_invoke;
    v14[3] = &unk_1E2AC6EA0;
    v17 = v10;
    v15 = v8;
    v16 = v9;
    v13 = sharingSessionManager;
    -[PKDASessionManager performBlockWithSession:](v13, "performBlockWithSession:", v14);

  }
}

void __107__PKDAManager_getProductPlanIdentifierRequestForInvitationWithIdentifier_fromMailboxIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __107__PKDAManager_getProductPlanIdentifierRequestForInvitationWithIdentifier_fromMailboxIdentifier_completion___block_invoke_2;
    v9[3] = &unk_1E2AC6EC8;
    v10 = v5;
    v11 = *(id *)(a1 + 48);
    objc_msgSend(a2, "getProductPlanIdentifierRequestForInvitationWithIdentifier:fromMailboxIdentifier:completion:", v7, v8, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __107__PKDAManager_getProductPlanIdentifierRequestForInvitationWithIdentifier_fromMailboxIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t);
  id v7;
  id v8;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void (**)(uint64_t))(v5 + 16);
  v7 = a3;
  v8 = a2;
  v6(v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)getPretrackRequestForKeyWithIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PKDASessionManager *sharingSessionManager;
  PKDASessionManager *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    sharingSessionManager = self->_sharingSessionManager;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __69__PKDAManager_getPretrackRequestForKeyWithIdentifier_withCompletion___block_invoke;
    v11[3] = &unk_1E2AC6EF0;
    v13 = v7;
    v12 = v6;
    v10 = sharingSessionManager;
    -[PKDASessionManager performBlockWithSession:](v10, "performBlockWithSession:", v11);

  }
}

void __69__PKDAManager_getPretrackRequestForKeyWithIdentifier_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __69__PKDAManager_getPretrackRequestForKeyWithIdentifier_withCompletion___block_invoke_2;
    v8[3] = &unk_1E2AC6EC8;
    v9 = v5;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(a2, "getPretrackRequestForKeyWithIdentifier:withCompletion:", v7, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __69__PKDAManager_getPretrackRequestForKeyWithIdentifier_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t);
  id v7;
  id v8;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void (**)(uint64_t))(v5 + 16);
  v7 = a3;
  v8 = a2;
  v6(v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)startShareAcceptanceFlowWithInvitation:(id)a3 fromMailboxIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  PKDASessionManager *sharingSessionManager;
  PKDASessionManager *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    sharingSessionManager = self->_sharingSessionManager;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __87__PKDAManager_startShareAcceptanceFlowWithInvitation_fromMailboxIdentifier_completion___block_invoke;
    v14[3] = &unk_1E2AC6EA0;
    v17 = v10;
    v15 = v8;
    v16 = v9;
    v13 = sharingSessionManager;
    -[PKDASessionManager performBlockWithSession:](v13, "performBlockWithSession:", v14);

  }
}

void __87__PKDAManager_startShareAcceptanceFlowWithInvitation_fromMailboxIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    PKDACarKeySharingMessageFromMessage(*(void **)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 40);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __87__PKDAManager_startShareAcceptanceFlowWithInvitation_fromMailboxIdentifier_completion___block_invoke_166;
      v10[3] = &unk_1E2AC6AF8;
      v11 = v6;
      v12 = *(id *)(a1 + 48);
      objc_msgSend(v5, "startShareAcceptanceFlowWithInvitation:fromMailboxIdentifier:completion:", v7, v8, v10);

    }
    else
    {
      PKLogFacilityTypeGetObject(0x1BuLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "PKDAManager: Error: unable to create DACarKeySharingMessage", buf, 2u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __87__PKDAManager_startShareAcceptanceFlowWithInvitation_fromMailboxIdentifier_completion___block_invoke_166(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void (**)(uint64_t))(v3 + 16);
  v5 = a2;
  v4(v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)acceptCrossPlatformInvitationWithIdentifier:(id)a3 transportChannelIdentifier:(id)a4 activationCode:(id)a5 encryptedProductPlanIdentifierContainer:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  PKDASessionManager *sharingSessionManager;
  PKDASessionManager *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  PKDAManager *v25;
  id v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = v16;
  if (v16)
  {
    sharingSessionManager = self->_sharingSessionManager;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __152__PKDAManager_acceptCrossPlatformInvitationWithIdentifier_transportChannelIdentifier_activationCode_encryptedProductPlanIdentifierContainer_completion___block_invoke;
    v20[3] = &unk_1E2AC6F68;
    v26 = v16;
    v21 = v12;
    v22 = v13;
    v23 = v14;
    v24 = v15;
    v25 = self;
    v19 = sharingSessionManager;
    -[PKDASessionManager performBlockWithSession:](v19, "performBlockWithSession:", v20);

  }
}

void __152__PKDAManager_acceptCrossPlatformInvitationWithIdentifier_transportChannelIdentifier_activationCode_encryptedProductPlanIdentifierContainer_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __152__PKDAManager_acceptCrossPlatformInvitationWithIdentifier_transportChannelIdentifier_activationCode_encryptedProductPlanIdentifierContainer_completion___block_invoke_2;
    v13[3] = &unk_1E2AC6F40;
    v14 = v5;
    v11 = *(id *)(a1 + 72);
    v12 = *(_QWORD *)(a1 + 64);
    v15 = v11;
    v13[4] = v12;
    objc_msgSend(a2, "acceptCrossPlatformInvitationWithIdentifier:transportChannelIdentifier:activationCode:encryptedProductPlanIdentifierContainer:completion:", v7, v8, v9, v10, v13);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

void __152__PKDAManager_acceptCrossPlatformInvitationWithIdentifier_transportChannelIdentifier_activationCode_encryptedProductPlanIdentifierContainer_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v7 = a4;
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void (**)(uint64_t))(v8 + 16);
  v10 = a3;
  v11 = a2;
  v9(v8);
  PKCarKeyMessageFromDACarKeySharingMessage(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v13 = *(void **)(a1 + 32);
    objc_msgSend(v10, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __152__PKDAManager_acceptCrossPlatformInvitationWithIdentifier_transportChannelIdentifier_activationCode_encryptedProductPlanIdentifierContainer_completion___block_invoke_3;
    v15[3] = &unk_1E2AC6F18;
    v18 = *(id *)(a1 + 48);
    v16 = v12;
    v17 = 0;
    objc_msgSend(v13, "deviceCredentialForIdentifier:completion:", v14, v15);

    v10 = v18;
  }

}

uint64_t __152__PKDAManager_acceptCrossPlatformInvitationWithIdentifier_transportChannelIdentifier_activationCode_encryptedProductPlanIdentifierContainer_completion___block_invoke_3(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD))(a1[6] + 16))(a1[6], a1[4], a2, a1[5]);
}

- (void)deviceCredentialForIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PKDASessionManager *managementSessionManager;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  managementSessionManager = self->_managementSessionManager;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__PKDAManager_deviceCredentialForIdentifier_completion___block_invoke;
  v11[3] = &unk_1E2AC6BC0;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[PKDASessionManager performBlockWithSession:](managementSessionManager, "performBlockWithSession:", v11);

}

void __56__PKDAManager_deviceCredentialForIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__PKDAManager_deviceCredentialForIdentifier_completion___block_invoke_2;
  v7[3] = &unk_1E2AC6F90;
  v9 = v5;
  v8 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v6 = v5;
  objc_msgSend(a2, "listCredentialsWithCompletion:", v7);

}

void __56__PKDAManager_deviceCredentialForIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t))(v3 + 16);
  v5 = a2;
  v4(v3);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__PKDAManager_deviceCredentialForIdentifier_completion___block_invoke_3;
  v7[3] = &unk_1E2AC10E0;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v5, "pk_firstObjectPassingTest:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __56__PKDAManager_deviceCredentialForIdentifier_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  BOOL v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  v5 = v3;
  v6 = v5;
  if (v4 == v5)
  {
    v8 = 1;
  }
  else
  {
    if (v4)
      v7 = v5 == 0;
    else
      v7 = 1;
    if (v7)
      v8 = 0;
    else
      v8 = objc_msgSend(v4, "isEqualToString:", v5);
  }

  return v8;
}

- (void)accountAttestionRequestForCredential:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  PKDASessionManager *sharingSessionManager;
  id v9;
  id v10;
  PKDASessionManager *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  sharingSessionManager = self->_sharingSessionManager;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__PKDAManager_accountAttestionRequestForCredential_withCompletion___block_invoke;
  v12[3] = &unk_1E2AC6EF0;
  v13 = v6;
  v14 = v7;
  v9 = v6;
  v10 = v7;
  v11 = sharingSessionManager;
  -[PKDASessionManager performBlockWithSession:](v11, "performBlockWithSession:", v12);

}

void __67__PKDAManager_accountAttestionRequestForCredential_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __67__PKDAManager_accountAttestionRequestForCredential_withCompletion___block_invoke_2;
    v8[3] = &unk_1E2AC6FB8;
    v9 = v5;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(a2, "accountAttestionRequestForCredential:withCompletion:", v7, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __67__PKDAManager_accountAttestionRequestForCredential_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t);
  id v7;
  id v8;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void (**)(uint64_t))(v5 + 16);
  v7 = a3;
  v8 = a2;
  v6(v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)setAccountAttestation:(id)a3 forCredential:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKDASessionManager *sharingSessionManager;
  id v12;
  id v13;
  id v14;
  PKDASessionManager *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  sharingSessionManager = self->_sharingSessionManager;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __66__PKDAManager_setAccountAttestation_forCredential_withCompletion___block_invoke;
  v16[3] = &unk_1E2AC6EA0;
  v18 = v9;
  v19 = v10;
  v17 = v8;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  v15 = sharingSessionManager;
  -[PKDASessionManager performBlockWithSession:](v15, "performBlockWithSession:", v16);

}

void __66__PKDAManager_setAccountAttestation_forCredential_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__PKDAManager_setAccountAttestation_forCredential_withCompletion___block_invoke_2;
    v9[3] = &unk_1E2AC6AF8;
    v10 = v5;
    v11 = *(id *)(a1 + 48);
    objc_msgSend(a2, "setAccountAttestation:forCredential:withCompletion:", v7, v8, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __66__PKDAManager_setAccountAttestation_forCredential_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void (**)(uint64_t))(v3 + 16);
  v5 = a2;
  v4(v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)retryActivationCodeForCredentialIdentifier:(id)a3 activationCode:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKDASessionManager *sharingSessionManager;
  id v12;
  id v13;
  id v14;
  PKDASessionManager *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  sharingSessionManager = self->_sharingSessionManager;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __84__PKDAManager_retryActivationCodeForCredentialIdentifier_activationCode_completion___block_invoke;
  v16[3] = &unk_1E2AC6EA0;
  v18 = v9;
  v19 = v10;
  v17 = v8;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  v15 = sharingSessionManager;
  -[PKDASessionManager performBlockWithSession:](v15, "performBlockWithSession:", v16);

}

void __84__PKDAManager_retryActivationCodeForCredentialIdentifier_activationCode_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __84__PKDAManager_retryActivationCodeForCredentialIdentifier_activationCode_completion___block_invoke_2;
    v9[3] = &unk_1E2AC6AF8;
    v10 = v5;
    v11 = *(id *)(a1 + 48);
    objc_msgSend(a2, "retryActivationCodeForCredentialIdentifier:activationCode:completion:", v7, v8, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __84__PKDAManager_retryActivationCodeForCredentialIdentifier_activationCode_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  void (*v12)(void);
  uint8_t v13[16];

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0D1D360];
  v6 = v4;
  v7 = v5;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    if (!v6 || !v7)
    {

LABEL_12:
      goto LABEL_13;
    }
    v9 = objc_msgSend(v6, "isEqualToString:", v7);

    if (!v9)
      goto LABEL_12;
  }
  v10 = objc_msgSend(v3, "code");

  if (v10 != 116)
  {
LABEL_13:
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_14;
  }
  PKLogFacilityTypeGetObject(0x20uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "KML returned 'friend not ready for passcode' error. Ignoring error so that call and KML both think they are waiting on the sender.", v13, 2u);
  }

  v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_14:
  v12();

}

- (void)rejectInvitation:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  PKDACarKeySharingMessageFromMessage(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D1D388];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__PKDAManager_rejectInvitation_completion___block_invoke;
  v9[3] = &unk_1E2AC6FE0;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "rejectSharingInvitation:completionHandler:", v6, v9);

}

void __43__PKDAManager_rejectInvitation_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    PKCarKeyMessageFromDACarKeySharingMessage(a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, 0);

  }
  else
  {
    (*(void (**)(_QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32));
  }
}

- (void)acceptInvitationWithIdentifier:(id)a3 activationCode:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  PKDASessionManager *sharingSessionManager;
  PKDASessionManager *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    sharingSessionManager = self->_sharingSessionManager;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __72__PKDAManager_acceptInvitationWithIdentifier_activationCode_completion___block_invoke;
    v14[3] = &unk_1E2AC6EA0;
    v17 = v10;
    v15 = v8;
    v16 = v9;
    v13 = sharingSessionManager;
    -[PKDASessionManager performBlockWithSession:](v13, "performBlockWithSession:", v14);

  }
}

void __72__PKDAManager_acceptInvitationWithIdentifier_activationCode_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __72__PKDAManager_acceptInvitationWithIdentifier_activationCode_completion___block_invoke_2;
    v9[3] = &unk_1E2AC7008;
    v10 = v5;
    v11 = *(id *)(a1 + 48);
    objc_msgSend(a2, "acceptInvitationWithIdentifier:activationCode:completion:", v7, v8, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __72__PKDAManager_acceptInvitationWithIdentifier_activationCode_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void (**)(uint64_t))(v3 + 16);
  v5 = a2;
  v4(v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)retryActivationCode:(id)a3 forInvitationIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  PKDASessionManager *sharingSessionManager;
  PKDASessionManager *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    sharingSessionManager = self->_sharingSessionManager;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __70__PKDAManager_retryActivationCode_forInvitationIdentifier_completion___block_invoke;
    v14[3] = &unk_1E2AC6EA0;
    v17 = v10;
    v15 = v8;
    v16 = v9;
    v13 = sharingSessionManager;
    -[PKDASessionManager performBlockWithSession:](v13, "performBlockWithSession:", v14);

  }
}

void __70__PKDAManager_retryActivationCode_forInvitationIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __70__PKDAManager_retryActivationCode_forInvitationIdentifier_completion___block_invoke_2;
    v9[3] = &unk_1E2AC7008;
    v10 = v5;
    v11 = *(id *)(a1 + 48);
    objc_msgSend(a2, "retryActivationCode:forInvitationIdentifier:completion:", v7, v8, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __70__PKDAManager_retryActivationCode_forInvitationIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void (**)(uint64_t))(v3 + 16);
  v5 = a2;
  v4(v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)handleRecipientMessage:(id)a3 forInvitationIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  PKDASessionManager *sharingSessionManager;
  PKDASessionManager *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    sharingSessionManager = self->_sharingSessionManager;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __73__PKDAManager_handleRecipientMessage_forInvitationIdentifier_completion___block_invoke;
    v14[3] = &unk_1E2AC6EA0;
    v17 = v10;
    v15 = v8;
    v16 = v9;
    v13 = sharingSessionManager;
    -[PKDASessionManager performBlockWithSession:](v13, "performBlockWithSession:", v14);

  }
}

void __73__PKDAManager_handleRecipientMessage_forInvitationIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    PKDACarKeySharingMessageFromMessage(*(void **)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 40);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __73__PKDAManager_handleRecipientMessage_forInvitationIdentifier_completion___block_invoke_173;
      v10[3] = &unk_1E2AC7008;
      v11 = v6;
      v12 = *(id *)(a1 + 48);
      objc_msgSend(v5, "handleRecipientMessage:forInvitationIdentifier:completion:", v7, v8, v10);

    }
    else
    {
      PKLogFacilityTypeGetObject(0x1BuLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "PKDAManager: Error: unable to create DACarKeySharingMessage", buf, 2u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __73__PKDAManager_handleRecipientMessage_forInvitationIdentifier_completion___block_invoke_173(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void (**)(uint64_t))(v3 + 16);
  v5 = a2;
  v4(v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)retryActivationCodeWithInvitationIdentifier:(id)a3 activationCode:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  PKDASessionManager *sharingSessionManager;
  PKDASessionManager *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    sharingSessionManager = self->_sharingSessionManager;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __85__PKDAManager_retryActivationCodeWithInvitationIdentifier_activationCode_completion___block_invoke;
    v14[3] = &unk_1E2AC6EA0;
    v17 = v10;
    v15 = v9;
    v16 = v8;
    v13 = sharingSessionManager;
    -[PKDASessionManager performBlockWithSession:](v13, "performBlockWithSession:", v14);

  }
}

void __85__PKDAManager_retryActivationCodeWithInvitationIdentifier_activationCode_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __85__PKDAManager_retryActivationCodeWithInvitationIdentifier_activationCode_completion___block_invoke_2;
    v9[3] = &unk_1E2AC7008;
    v10 = v5;
    v11 = *(id *)(a1 + 48);
    objc_msgSend(a2, "retryActivationCode:forInvitationIdentifier:completion:", v7, v8, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __85__PKDAManager_retryActivationCodeWithInvitationIdentifier_activationCode_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void (**)(uint64_t))(v3 + 16);
  v5 = a2;
  v4(v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)setEncryptedProductPlanIdentifierContainer:(id)a3 forInvitationIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  PKDASessionManager *sharingSessionManager;
  PKDASessionManager *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    sharingSessionManager = self->_sharingSessionManager;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __93__PKDAManager_setEncryptedProductPlanIdentifierContainer_forInvitationIdentifier_completion___block_invoke;
    v14[3] = &unk_1E2AC6EA0;
    v17 = v10;
    v15 = v8;
    v16 = v9;
    v13 = sharingSessionManager;
    -[PKDASessionManager performBlockWithSession:](v13, "performBlockWithSession:", v14);

  }
}

void __93__PKDAManager_setEncryptedProductPlanIdentifierContainer_forInvitationIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __93__PKDAManager_setEncryptedProductPlanIdentifierContainer_forInvitationIdentifier_completion___block_invoke_2;
    v9[3] = &unk_1E2AC6AF8;
    v10 = v5;
    v11 = *(id *)(a1 + 48);
    objc_msgSend(a2, "setEncryptedProductPlanIdentifierContainer:forInvitationIdentifier:completion:", v7, v8, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __93__PKDAManager_setEncryptedProductPlanIdentifierContainer_forInvitationIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void (**)(uint64_t))(v3 + 16);
  v5 = a2;
  v4(v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)createSilentInviteForSharingSessionIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PKDASessionManager *sharingSessionManager;
  PKDASessionManager *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    sharingSessionManager = self->_sharingSessionManager;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__PKDAManager_createSilentInviteForSharingSessionIdentifier_completion___block_invoke;
    v11[3] = &unk_1E2AC6EF0;
    v13 = v7;
    v12 = v6;
    v10 = sharingSessionManager;
    -[PKDASessionManager performBlockWithSession:](v10, "performBlockWithSession:", v11);

  }
}

void __72__PKDAManager_createSilentInviteForSharingSessionIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __72__PKDAManager_createSilentInviteForSharingSessionIdentifier_completion___block_invoke_2;
    v8[3] = &unk_1E2AC7030;
    v9 = v5;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(a2, "createSilentInviteForSharingSessionIdentifier:completion:", v7, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __72__PKDAManager_createSilentInviteForSharingSessionIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v7 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, 0);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v6);
  }

}

- (void)accountAttestationRequestForManufacturer:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PKDASessionManager *managementSessionManager;
  PKDASessionManager *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    managementSessionManager = self->_managementSessionManager;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67__PKDAManager_accountAttestationRequestForManufacturer_completion___block_invoke;
    v11[3] = &unk_1E2AC6BC0;
    v13 = v7;
    v12 = v6;
    v10 = managementSessionManager;
    -[PKDASessionManager performBlockWithSession:](v10, "performBlockWithSession:", v11);

  }
}

void __67__PKDAManager_accountAttestationRequestForManufacturer_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __67__PKDAManager_accountAttestationRequestForManufacturer_completion___block_invoke_2;
    v10[3] = &unk_1E2AC6FB8;
    v11 = v5;
    v12 = *(id *)(a1 + 40);
    objc_msgSend(a2, "accountAttestationRequestForManufacturer:completion:", v7, v10);

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKSubcredentialProvisioningErrorDomain"), 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);

  }
}

void __67__PKDAManager_accountAttestationRequestForManufacturer_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t);
  id v7;
  id v8;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void (**)(uint64_t))(v5 + 16);
  v7 = a3;
  v8 = a2;
  v6(v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)preWarmForManufacturer:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PKDASessionManager *managementSessionManager;
  PKDASessionManager *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    managementSessionManager = self->_managementSessionManager;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __49__PKDAManager_preWarmForManufacturer_completion___block_invoke;
    v11[3] = &unk_1E2AC6BC0;
    v13 = v7;
    v12 = v6;
    v10 = managementSessionManager;
    -[PKDASessionManager performBlockWithSession:](v10, "performBlockWithSession:", v11);

  }
}

void __49__PKDAManager_preWarmForManufacturer_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __49__PKDAManager_preWarmForManufacturer_completion___block_invoke_2;
    v10[3] = &unk_1E2AC6AF8;
    v11 = v5;
    v12 = *(id *)(a1 + 40);
    objc_msgSend(a2, "preWarmForManufacturer:completion:", v7, v10);

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKSubcredentialProvisioningErrorDomain"), 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  }
}

void __49__PKDAManager_preWarmForManufacturer_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void (**)(uint64_t))(v3 + 16);
  v5 = a2;
  v4(v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)hasUpgradeAvailableForKeyWithCredential:(id)a3 versionType:(unint64_t)a4 versions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  PKDASessionManager *managementSessionManager;
  PKDASessionManager *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  unint64_t v20;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (v12)
  {
    managementSessionManager = self->_managementSessionManager;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __87__PKDAManager_hasUpgradeAvailableForKeyWithCredential_versionType_versions_completion___block_invoke;
    v16[3] = &unk_1E2AC7080;
    v19 = v12;
    v20 = a4;
    v17 = v10;
    v18 = v11;
    v15 = managementSessionManager;
    -[PKDASessionManager performBlockWithSession:](v15, "performBlockWithSession:", v16);

  }
}

void __87__PKDAManager_hasUpgradeAvailableForKeyWithCredential_versionType_versions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __87__PKDAManager_hasUpgradeAvailableForKeyWithCredential_versionType_versions_completion___block_invoke_2;
    v12[3] = &unk_1E2AC7058;
    v13 = v5;
    v14 = *(id *)(a1 + 48);
    objc_msgSend(a2, "hasUpgradeAvailableForKeyWithCredential:versionType:versions:completion:", v8, v7, v9, v12);

    v10 = v13;
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 48);
    v15[0] = *(_QWORD *)(a1 + 56);
    memset(&v15[1], 0, 24);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKSubcredentialProvisioningErrorDomain"), 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD *, void *))(v11 + 16))(v11, v15, v10);
  }

}

void __87__PKDAManager_hasUpgradeAvailableForKeyWithCredential_versionType_versions_completion___block_invoke_2(uint64_t a1, _OWORD *a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t);
  id v7;
  uint64_t v8;
  void (*v9)(uint64_t, _OWORD *, id, uint64_t);
  __int128 v10;
  uint64_t v11;
  _OWORD v12[2];

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void (**)(uint64_t))(v5 + 16);
  v7 = a3;
  v6(v5);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void (**)(uint64_t, _OWORD *, id, uint64_t))(v8 + 16);
  v10 = a2[1];
  v12[0] = *a2;
  v12[1] = v10;
  v9(v8, v12, v7, v11);

}

- (void)upgradeKeyWithCredential:(id)a3 versionType:(unint64_t)a4 version:(unint64_t)a5 upgradeInformation:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  PKDASessionManager *managementSessionManager;
  id v16;
  id v17;
  id v18;
  PKDASessionManager *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  unint64_t v24;
  unint64_t v25;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  managementSessionManager = self->_managementSessionManager;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __90__PKDAManager_upgradeKeyWithCredential_versionType_version_upgradeInformation_completion___block_invoke;
  v20[3] = &unk_1E2AC70A8;
  v23 = v14;
  v24 = a4;
  v25 = a5;
  v21 = v12;
  v22 = v13;
  v16 = v13;
  v17 = v12;
  v18 = v14;
  v19 = managementSessionManager;
  -[PKDASessionManager performBlockWithSession:](v19, "performBlockWithSession:", v20);

}

void __90__PKDAManager_upgradeKeyWithCredential_versionType_version_upgradeInformation_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(a1 + 64);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __90__PKDAManager_upgradeKeyWithCredential_versionType_version_upgradeInformation_completion___block_invoke_2;
    v14[3] = &unk_1E2AC6AF8;
    v15 = v6;
    v16 = *(id *)(a1 + 48);
    objc_msgSend(v5, "upgradeKeyWithCredential:versionType:version:upgradeInformation:completion:", v10, v8, v9, v11, v14);

  }
  else
  {
    v12 = *(_QWORD *)(a1 + 48);
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKSubcredentialProvisioningErrorDomain"), 1, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);

    }
  }

}

void __90__PKDAManager_upgradeKeyWithCredential_versionType_version_upgradeInformation_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (void)commitUpgradeForKeyWithCredential:(id)a3 versionType:(unint64_t)a4 version:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  PKDASessionManager *managementSessionManager;
  id v13;
  id v14;
  PKDASessionManager *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  unint64_t v19;
  unint64_t v20;

  v10 = a3;
  v11 = a6;
  managementSessionManager = self->_managementSessionManager;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __80__PKDAManager_commitUpgradeForKeyWithCredential_versionType_version_completion___block_invoke;
  v16[3] = &unk_1E2AC70D0;
  v17 = v10;
  v18 = v11;
  v19 = a4;
  v20 = a5;
  v13 = v10;
  v14 = v11;
  v15 = managementSessionManager;
  -[PKDASessionManager performBlockWithSession:](v15, "performBlockWithSession:", v16);

}

void __80__PKDAManager_commitUpgradeForKeyWithCredential_versionType_version_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __80__PKDAManager_commitUpgradeForKeyWithCredential_versionType_version_completion___block_invoke_2;
    v13[3] = &unk_1E2AC6AF8;
    v14 = v6;
    v15 = *(id *)(a1 + 40);
    objc_msgSend(v5, "commitUpgradeForKeyWithCredential:versionType:version:completion:", v8, v9, v10, v13);

  }
  else
  {
    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKSubcredentialProvisioningErrorDomain"), 1, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

    }
  }

}

void __80__PKDAManager_commitUpgradeForKeyWithCredential_versionType_version_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (void)revertUpgradeForKeyWithCredential:(id)a3 versionType:(unint64_t)a4 version:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  PKDASessionManager *managementSessionManager;
  id v13;
  id v14;
  PKDASessionManager *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  unint64_t v19;
  unint64_t v20;

  v10 = a3;
  v11 = a6;
  managementSessionManager = self->_managementSessionManager;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __80__PKDAManager_revertUpgradeForKeyWithCredential_versionType_version_completion___block_invoke;
  v16[3] = &unk_1E2AC70D0;
  v17 = v10;
  v18 = v11;
  v19 = a4;
  v20 = a5;
  v13 = v10;
  v14 = v11;
  v15 = managementSessionManager;
  -[PKDASessionManager performBlockWithSession:](v15, "performBlockWithSession:", v16);

}

void __80__PKDAManager_revertUpgradeForKeyWithCredential_versionType_version_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __80__PKDAManager_revertUpgradeForKeyWithCredential_versionType_version_completion___block_invoke_2;
    v13[3] = &unk_1E2AC6AF8;
    v14 = v6;
    v15 = *(id *)(a1 + 40);
    objc_msgSend(v5, "revertUpgradeForKeyWithCredential:versionType:version:completion:", v8, v9, v10, v13);

  }
  else
  {
    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKSubcredentialProvisioningErrorDomain"), 1, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

    }
  }

}

void __80__PKDAManager_revertUpgradeForKeyWithCredential_versionType_version_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingSessionManager, 0);
  objc_storeStrong((id *)&self->_managementSessionManager, 0);
  objc_storeStrong((id *)&self->_pairingSessionManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
