@implementation PKAppletSubcredentialManagementSession

+ (id)createSessionWithDelegate:(id)a3
{
  id v4;
  PKAppletSubcredentialManagementSession *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  PKAppletSubcredentialManagementSession *v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PKDASession initWithDelegate:]([PKAppletSubcredentialManagementSession alloc], "initWithDelegate:", v4);

  objc_msgSend(MEMORY[0x1E0D1D388], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createManagementSessionWithDelegate:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PKDASession setSession:](v5, "setSession:", v7);
    PKLogFacilityTypeGetObject(6uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134217984;
      v13 = a1;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Starting management session: %p", (uint8_t *)&v12, 0xCu);
    }

    v9 = v5;
  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Failed to create management session!", (uint8_t *)&v12, 2u);
    }

    v9 = 0;
  }

  return v9;
}

- (void)listCredentialsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    if (-[PKDASession state](self, "state") == 2)
    {
      -[PKDASession session](self, "session");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __72__PKAppletSubcredentialManagementSession_listCredentialsWithCompletion___block_invoke;
      v7[3] = &unk_1E2ABE738;
      v8 = v4;
      objc_msgSend(v5, "listKeysWithHandler:", v7);

    }
    else
    {
      PKLogFacilityTypeGetObject(0x16uLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for enumeration operation", buf, 2u);
      }

      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
    }
  }

}

void __72__PKAppletSubcredentialManagementSession_listCredentialsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  PKAppletSubcredential *v16;
  PKAppletSubcredential *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = (uint64_t)v7;
      _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "Failed to list keys with error: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    PKLogFacilityTypeGetObject(0x16uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v27 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "list Credentials count: %lu", buf, 0xCu);
    }

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          v16 = [PKAppletSubcredential alloc];
          v17 = -[PKAppletSubcredential initWithKeyInformation:](v16, "initWithKeyInformation:", v15, (_QWORD)v21);
          if (v17)
            objc_msgSend(v8, "addObject:", v17);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v12);
    }

    v18 = *(_QWORD *)(a1 + 32);
    v19 = (void *)objc_msgSend(v8, "copy");
    (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);

  }
}

- (void)revokeSharedCredentials:(id)a3 onCredential:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[16];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[PKDASession state](self, "state") == 2)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v16), "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "safelyAddObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v14);
    }

    -[PKDASession session](self, "session");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __94__PKAppletSubcredentialManagementSession_revokeSharedCredentials_onCredential_withCompletion___block_invoke;
    v21[3] = &unk_1E2AD5AB8;
    v22 = v10;
    objc_msgSend(v18, "revokeKeysWithIdentifiers:sharedByOwnerKeyWithIdentifier:callback:", v11, v19, v21);

    goto LABEL_14;
  }
  PKLogFacilityTypeGetObject(0x16uLL);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for revoke operation", buf, 2u);
  }

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v11);
LABEL_14:

  }
}

void __94__PKAppletSubcredentialManagementSession_revokeSharedCredentials_onCredential_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  PKSubcredentialEncryptedContainer *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v7;
      v10 = "Failed to revoke credentials with error: %@";
      v11 = v9;
      v12 = 12;
      goto LABEL_8;
    }
  }
  else
  {
    v8 = -[PKSubcredentialEncryptedContainer initWithRequest:]([PKSubcredentialEncryptedContainer alloc], "initWithRequest:", v5);
    if (v8)
      goto LABEL_10;
    PKLogFacilityTypeGetObject(0x16uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      v10 = "Failed to parse attestation while revoking credentials";
      v11 = v9;
      v12 = 2;
LABEL_8:
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v12);
    }
  }

  v8 = 0;
LABEL_10:
  v13 = *(_QWORD *)(a1 + 32);
  if (v13)
    (*(void (**)(uint64_t, PKSubcredentialEncryptedContainer *, void *))(v13 + 16))(v13, v8, v7);

}

- (void)revokeSharesWithGroupIdentifiers:(id)a3 shouldCascade:(BOOL)a4 credential:(id)a5 completion:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[16];

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (-[PKDASession state](self, "state") == 2)
  {
    if (v8)
      v13 = 0;
    else
      v13 = v10;
    if (v8)
      v14 = v10;
    else
      v14 = 0;
    v15 = v14;
    v16 = v13;
    -[PKDASession session](self, "session");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __111__PKAppletSubcredentialManagementSession_revokeSharesWithGroupIdentifiers_shouldCascade_credential_completion___block_invoke;
    v21[3] = &unk_1E2AD5AB8;
    v22 = v12;
    objc_msgSend(v17, "revokeNodesWithGroupIdentifiers:treesWithGroupIdentifier:authorizedByKeyWithIdentifier:callback:", v16, v15, v18, v21);

    v19 = v22;
    goto LABEL_13;
  }
  PKLogFacilityTypeGetObject(0x16uLL);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for revoke operation", buf, 2u);
  }

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v19);
LABEL_13:

  }
}

void __111__PKAppletSubcredentialManagementSession_revokeSharesWithGroupIdentifiers_shouldCascade_credential_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  PKSubcredentialEncryptedContainer *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v7;
      v10 = "Failed to revoke credentials with error: %@";
      v11 = v9;
      v12 = 12;
      goto LABEL_8;
    }
  }
  else
  {
    v8 = -[PKSubcredentialEncryptedContainer initWithRequest:]([PKSubcredentialEncryptedContainer alloc], "initWithRequest:", v5);
    if (v8)
      goto LABEL_10;
    PKLogFacilityTypeGetObject(0x16uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      v10 = "Failed to parse attestation while revoking credentials";
      v11 = v9;
      v12 = 2;
LABEL_8:
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v12);
    }
  }

  v8 = 0;
LABEL_10:
  v13 = *(_QWORD *)(a1 + 32);
  if (v13)
    (*(void (**)(uint64_t, PKSubcredentialEncryptedContainer *, void *))(v13 + 16))(v13, v8, v7);

}

- (void)rescindInvitations:(id)a3 onCredential:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[16];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[PKDASession state](self, "state") == 2)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v16), "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v14);
    }

    -[PKDASession session](self, "session");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __89__PKAppletSubcredentialManagementSession_rescindInvitations_onCredential_withCompletion___block_invoke;
    v21[3] = &unk_1E2ABD9C8;
    v22 = v10;
    objc_msgSend(v18, "cancelInvitationsWithIdentifiers:sentByOwnerKeyWithIdentifier:callback:", v11, v19, v21);

    goto LABEL_16;
  }
  PKLogFacilityTypeGetObject(0x16uLL);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for revoke operation", buf, 2u);
  }

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))v10 + 2))(v10, v11);
LABEL_16:

  }
}

void __89__PKAppletSubcredentialManagementSession_rescindInvitations_onCredential_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Failed to revoke invitations with error: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (id)trackSubcredential:(id)a3 encryptedContainer:(id)a4 withReceipt:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint8_t v17[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[PKDASession state](self, "state") == 2)
  {
    PKDAAlishaKeyEncryptedRequestFromSubcredentialEncryptedRequest(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDASession session](self, "session");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTrackingReceipt:vehicleMobilizationData:forKeyWithIdentifier:", v10, v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for track operation", v17, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)trackSubcredential:(id)a3 deviceData:(id)a4 attestation:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint8_t v16[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[PKDASession state](self, "state") == 2)
  {
    -[PKDASession session](self, "session");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTrackingReceipt:decryptedDeviceData:forKeyWithIdentifier:", v10, v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for track operation", v16, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (void)signData:(id)a3 auth:(id)a4 bundleIdentifier:(id)a5 nonce:(id)a6 credential:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (v19)
  {
    if (-[PKDASession state](self, "state") == 2)
    {
      objc_msgSend(v16, "dataUsingEncoding:", 4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "dataUsingEncoding:", 4);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      PKLogFacilityTypeGetObject(0x16uLL);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v21;
        _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "Requesting data signing for key identifier: %@", buf, 0xCu);
      }

      -[PKDASession session](self, "session");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __101__PKAppletSubcredentialManagementSession_signData_auth_bundleIdentifier_nonce_credential_completion___block_invoke;
      v26[3] = &unk_1E2ADA1D0;
      v27 = v19;
      objc_msgSend(v23, "signAppData:appBundleIdentifier:nonce:auth:keyIdentifier:callback:", v14, v20, v25, v15, v21, v26);

    }
    else
    {
      PKLogFacilityTypeGetObject(0x16uLL);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v24, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for signing operation", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v19 + 2))(v19, 0, 0, v20);
    }

  }
}

void __101__PKAppletSubcredentialManagementSession_signData_auth_bundleIdentifier_nonce_credential_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  PKLogFacilityTypeGetObject(0x16uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Signing response with error: %@", (uint8_t *)&v11, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)immobilizerTokensCountForCredential:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (-[PKDASession state](self, "state") == 2)
    {
      objc_msgSend(v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PKLogFacilityTypeGetObject(0x16uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v8;
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Requesting immo token count for credential: %@", buf, 0xCu);
      }

      -[PKDASession session](self, "session");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __89__PKAppletSubcredentialManagementSession_immobilizerTokensCountForCredential_completion___block_invoke;
      v13[3] = &unk_1E2ADA1F8;
      v14 = v8;
      v15 = v7;
      v11 = v8;
      objc_msgSend(v10, "countImmobilizerTokensForKeyWithIdentifier:callback:", v11, v13);

    }
    else
    {
      PKLogFacilityTypeGetObject(0x16uLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for token count operation", buf, 2u);
      }

      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    }
  }

}

uint64_t __89__PKAppletSubcredentialManagementSession_immobilizerTokensCountForCredential_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0x16uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v9 = 138412802;
    v10 = v7;
    v11 = 2048;
    v12 = a3;
    v13 = 2048;
    v14 = a2;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Got immo token count / depth for credential (%@): %lu / %lu", (uint8_t *)&v9, 0x20u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)removeSharedCredentialsWithIdentifiers:(id)a3 credential:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[PKDASession state](self, "state") == 2)
  {
    objc_msgSend(v9, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(0x16uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v11;
      v22 = 2112;
      v23 = v8;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Removing shared credentials from KML (%@): %@", buf, 0x16u);
    }

    -[PKDASession session](self, "session");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __103__PKAppletSubcredentialManagementSession_removeSharedCredentialsWithIdentifiers_credential_completion___block_invoke;
    v17[3] = &unk_1E2ABEB88;
    v18 = v11;
    v19 = v10;
    v15 = v11;
    objc_msgSend(v13, "removeSharedKeysWithIdentifiers:ownerKeyWithIdentifier:callback:", v14, v15, v17);

    goto LABEL_9;
  }
  PKLogFacilityTypeGetObject(0x16uLL);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for token count operation", buf, 2u);
  }

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))v10 + 2))(v10, v15);
LABEL_9:

  }
}

void __103__PKAppletSubcredentialManagementSession_removeSharedCredentialsWithIdentifiers_credential_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(0x16uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Removed shared credentials from KML (%@): %@", (uint8_t *)&v7, 0x16u);
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

- (void)listSharingInvitationsForKeyIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[PKDASession session](self, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __96__PKAppletSubcredentialManagementSession_listSharingInvitationsForKeyIdentifier_withCompletion___block_invoke;
  v10[3] = &unk_1E2ABE738;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "listSharingInvitationsForKeyIdentifier:callback:", v7, v10);

}

void __96__PKAppletSubcredentialManagementSession_listSharingInvitationsForKeyIdentifier_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  PKPassCredentialShare *v16;
  void *v17;
  void *v18;
  PKPassShare *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = (uint64_t)v7;
      _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "Failed to list sharing invitations with error: %@", buf, 0xCu);
    }

    v23 = *(_QWORD *)(a1 + 32);
    if (v23)
      (*(void (**)(uint64_t, _QWORD))(v23 + 16))(v23, 0);
  }
  else
  {
    v24 = a1;
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    PKLogFacilityTypeGetObject(0x16uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v32 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "list sharing invitations found %lu invites", buf, 0xCu);
    }

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v25 = v5;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v16 = -[PKPassCredentialShare initWithInvitationData:]([PKPassCredentialShare alloc], "initWithInvitationData:", v15);
          objc_msgSend(v15, "sharingSessionIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "UUIDString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "objectForKeyedSubscript:", v18);
          v19 = (PKPassShare *)objc_claimAutoreleasedReturnValue();
          if (!v19)
          {
            v19 = objc_alloc_init(PKPassShare);
            -[PKPassShare setIdentifier:](v19, "setIdentifier:", v18);
            -[PKPassShare setRecipientNickname:](v19, "setRecipientNickname:", CFSTR("[Name]"));
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, v18);
          }
          -[PKPassShare addCredentialShare:](v19, "addCredentialShare:", v16);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v12);
    }

    v20 = *(_QWORD *)(v24 + 32);
    if (v20)
    {
      objc_msgSend(v8, "allValues");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v21);

    }
    v7 = 0;
    v5 = v25;
  }

}

- (void)listReceivedSharingInvitationsWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[PKDASession session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __87__PKAppletSubcredentialManagementSession_listReceivedSharingInvitationsWithCompletion___block_invoke;
  v9[3] = &unk_1E2AC3558;
  v10 = v5;
  v11 = v4;
  v7 = v5;
  v8 = v4;
  objc_msgSend(v6, "listReceivedSharingInvitationsWithCallback:", v9);

}

void __87__PKAppletSubcredentialManagementSession_listReceivedSharingInvitationsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  PKPassCredentialShare *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PKLogFacilityTypeGetObject(0x16uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (!v5 || v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v26 = (uint64_t)v6;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Failed to list received sharing invitations with error: %@", buf, 0xCu);
    }

    v19 = *(_QWORD *)(a1 + 40);
    if (v19)
      (*(void (**)(uint64_t, _QWORD))(v19 + 16))(v19, 0);
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 134217984;
      v26 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "list received invitations: %lu", buf, 0xCu);
    }

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          v15 = -[PKPassCredentialShare initWithInvitationData:]([PKPassCredentialShare alloc], "initWithInvitationData:", v14);
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            v16 = objc_msgSend(v14, "invitationState");
            *(_DWORD *)buf = 134217984;
            v26 = v16;
            _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "list received DAKeySharingInvitationData state: %ld", buf, 0xCu);
          }

          if (v15)
            objc_msgSend(*(id *)(a1 + 32), "addObject:", v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

    v17 = *(_QWORD *)(a1 + 40);
    v6 = 0;
    if (v17)
    {
      v18 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
      (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);

    }
  }

}

- (void)deleteCredential:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  v6 = a3;
  v7 = a4;
  if (-[PKDASession state](self, "state") == 2)
  {
    -[PKDASession session](self, "session");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteKey:completionHandler:", v6, v7);

  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for revoke operation", v10, 2u);
    }

    if (v7)
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

- (void)accountAttestationRequestForManufacturer:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[8];
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (-[PKDASession state](self, "state") == 2)
    {
      -[PKDASession session](self, "session");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __94__PKAppletSubcredentialManagementSession_accountAttestationRequestForManufacturer_completion___block_invoke;
      v13[3] = &unk_1E2ADA220;
      v15 = v7;
      v13[4] = self;
      v14 = v6;
      objc_msgSend(v8, "preWarmForManufacturer:callback:", v14, v13);

      v9 = v15;
    }
    else
    {
      PKLogFacilityTypeGetObject(0x16uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for accepting sharing operation", buf, 2u);
      }

      v11 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0CB2938];
      v18[0] = CFSTR("Session not active");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v12);

    }
  }

}

void __94__PKAppletSubcredentialManagementSession_accountAttestationRequestForManufacturer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v3;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Failed to prewarm for binding attestation request data error: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 40);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __94__PKAppletSubcredentialManagementSession_accountAttestationRequestForManufacturer_completion___block_invoke_26;
    v7[3] = &unk_1E2AD5A90;
    v8 = v6;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v5, "requestBindingAttestationDataForManufacturer:callback:", v8, v7);

  }
}

void __94__PKAppletSubcredentialManagementSession_accountAttestationRequestForManufacturer_completion___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  PKAppletSubcredentialAccountAttestationRequest *v8;
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
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Failed to get binding attestation request for manufacturer (%@) with error: %@", (uint8_t *)&v11, 0x16u);
    }

    v8 = 0;
  }
  else
  {
    v8 = -[PKAppletSubcredentialAccountAttestationRequest initWithRequestData:]([PKAppletSubcredentialAccountAttestationRequest alloc], "initWithRequestData:", v5);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)preWarmForManufacturer:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[8];
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (-[PKDASession state](self, "state") == 2)
    {
      -[PKDASession session](self, "session");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __76__PKAppletSubcredentialManagementSession_preWarmForManufacturer_completion___block_invoke;
      v13[3] = &unk_1E2ABEB88;
      v14 = v6;
      v15 = v7;
      objc_msgSend(v8, "preWarmForManufacturer:callback:", v14, v13);

      v9 = v14;
    }
    else
    {
      PKLogFacilityTypeGetObject(0x16uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for accepting sharing operation", buf, 2u);
      }

      v11 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0CB2938];
      v18[0] = CFSTR("Session not active");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v7 + 2))(v7, v12);

    }
  }

}

void __76__PKAppletSubcredentialManagementSession_preWarmForManufacturer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412546;
      v7 = v5;
      v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Failed to get binding attestation request for manufacturer (%@) with error: %@", (uint8_t *)&v6, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)credentialDidActivateWithCredential:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (-[PKDASession state](self, "state") == 2)
  {
    -[PKDASession session](self, "session");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __89__PKAppletSubcredentialManagementSession_credentialDidActivateWithCredential_completion___block_invoke;
    v13[3] = &unk_1E2ABEB88;
    v14 = v7;
    v15 = v8;
    objc_msgSend(v9, "handleActivationForKeyWithIdentifier:callback:", v10, v13);

  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v12;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for %@", buf, 0xCu);

    }
    if (v8)
      (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

void __89__PKAppletSubcredentialManagementSession_credentialDidActivateWithCredential_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v5;
      v9 = 2112;
      v10 = v3;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Failed to notify KML that credential %@ activated with error: %@", (uint8_t *)&v7, 0x16u);

    }
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

- (void)updateCredentialConfigurationForCredential:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (-[PKDASession state](self, "state") == 2)
  {
    -[PKDASession session](self, "session");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __110__PKAppletSubcredentialManagementSession_updateCredentialConfigurationForCredential_configuration_completion___block_invoke;
    v16[3] = &unk_1E2ABEB88;
    v17 = v9;
    v18 = v11;
    objc_msgSend(v12, "updateConfiguration:forKeyWithIdentifier:completionHandler:", v10, v13, v16);

  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v15;
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for %@", buf, 0xCu);

    }
    if (v11)
      (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
  }

}

void __110__PKAppletSubcredentialManagementSession_updateCredentialConfigurationForCredential_configuration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v5;
      v9 = 2112;
      v10 = v3;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Failed to notify KML that credential %@ activated with error: %@", (uint8_t *)&v7, 0x16u);

    }
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

- (void)hasUpgradeAvailableForKeyWithCredential:(id)a3 versionType:(unint64_t)a4 versions:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (-[PKDASession state](self, "state") == 2)
  {
    -[PKDASession session](self, "session");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __114__PKAppletSubcredentialManagementSession_hasUpgradeAvailableForKeyWithCredential_versionType_versions_completion___block_invoke;
    v18[3] = &unk_1E2ADA248;
    v19 = v13;
    objc_msgSend(v14, "hasUpgradeAvailableForKeyWithIdentifier:versionType:versions:completionHandler:", v15, 2 * (a4 != 1), v12, v18);

  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v22 = v17;
      _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for %@", buf, 0xCu);

    }
    if (v13)
    {
      v20[0] = a4;
      memset(&v20[1], 0, 24);
      (*((void (**)(id, _QWORD *, _QWORD))v13 + 2))(v13, v20, 0);
    }
  }

}

void __114__PKAppletSubcredentialManagementSession_hasUpgradeAvailableForKeyWithCredential_versionType_versions_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  unint64_t v4;
  char v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  char v10;
  __int128 v11;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  v8 = *(_OWORD *)(a2 + 16);
  v6 = a3;
  if (v4 > 2)
    v7 = 0;
  else
    v7 = qword_1904561D8[v4];
  v9 = v7;
  v10 = v5;
  v11 = v8;
  (*(void (**)(uint64_t, uint64_t *, id))(v3 + 16))(v3, &v9, v6);

}

- (void)upgradeKeyWithCredential:(id)a3 versionType:(unint64_t)a4 version:(unint64_t)a5 upgradeInformation:(id)a6 completion:(id)a7
{
  id v13;
  id v14;
  void (**v15)(id, _QWORD);
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a6;
  v15 = (void (**)(id, _QWORD))a7;
  if (-[PKDASession state](self, "state") == 2)
  {
    -[PKDASession session](self, "session");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "upgradeKeyWithIdentifier:versionType:version:upgradeInformation:completionHandler:", v17, 2 * (a4 != 1), a5, v14, v15);

  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412290;
      v21 = v19;
      _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for %@", (uint8_t *)&v20, 0xCu);

    }
    if (v15)
      v15[2](v15, 0);
  }

}

- (void)commitUpgradeForKeyWithCredential:(id)a3 versionType:(unint64_t)a4 version:(unint64_t)a5 completion:(id)a6
{
  id v11;
  void (**v12)(id, _QWORD);
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = (void (**)(id, _QWORD))a6;
  if (-[PKDASession state](self, "state") == 2)
  {
    -[PKDASession session](self, "session");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "commitUpgradeForKeyWithIdentifier:versionType:version:completionHandler:", v14, 2 * (a4 != 1), a5, v12);

  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v16;
      _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for %@", (uint8_t *)&v17, 0xCu);

    }
    if (v12)
      v12[2](v12, 0);
  }

}

- (void)revertUpgradeForKeyWithCredential:(id)a3 versionType:(unint64_t)a4 version:(unint64_t)a5 completion:(id)a6
{
  id v11;
  void (**v12)(id, _QWORD);
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = (void (**)(id, _QWORD))a6;
  if (-[PKDASession state](self, "state") == 2)
  {
    -[PKDASession session](self, "session");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "revertUpgradeForKeyWithIdentifier:versionType:version:completionHandler:", v14, 2 * (a4 != 1), a5, v12);

  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v16;
      _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for %@", (uint8_t *)&v17, 0xCu);

    }
    if (v12)
      v12[2](v12, 0);
  }

}

@end
