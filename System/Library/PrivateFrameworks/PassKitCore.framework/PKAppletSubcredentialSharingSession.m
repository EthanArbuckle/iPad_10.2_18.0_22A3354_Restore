@implementation PKAppletSubcredentialSharingSession

+ (id)createSessionWithDelegate:(id)a3
{
  id v3;
  PKAppletSubcredentialSharingSession *v4;
  PKAppletSubcredentialSharingSession *v5;
  PKAppletSubcredentialSharingSession *v6;

  v3 = a3;
  v4 = -[PKDASession initWithDelegate:]([PKAppletSubcredentialSharingSession alloc], "initWithDelegate:", v3);

  if (-[PKAppletSubcredentialSharingSession startSession](v4, "startSession"))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

+ (id)createPendingSessionWithDelegate:(id)a3
{
  id v3;
  PKAppletSubcredentialSharingSession *v4;

  v3 = a3;
  v4 = -[PKDASession initWithDelegate:]([PKAppletSubcredentialSharingSession alloc], "initWithDelegate:", v3);

  -[PKDASession setState:](v4, "setState:", 0);
  return v4;
}

- (BOOL)startSession
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  int v12;
  PKAppletSubcredentialSharingSession *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[PKDASession session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0D1D388], "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createSharingSessionWithDelegate:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v6 != 0;
    if (v6)
    {
      -[PKDASession setSession:](self, "setSession:", v6);
      PKLogFacilityTypeGetObject(6uLL);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 134217984;
        v13 = self;
        v8 = "Starting sharing session: %p";
        v9 = v7;
        v10 = 12;
LABEL_8:
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, v10);
      }
    }
    else
    {
      PKLogFacilityTypeGetObject(0x16uLL);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        v8 = "Failed to create sharing session!";
        v9 = v7;
        v10 = 2;
        goto LABEL_8;
      }
    }

    return v4;
  }
  return 0;
}

- (void)sendSharingInvitationWithRequest:(id)a3 auth:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  void (**v35)(id, _QWORD, void *);
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  const __CFString *v41;
  uint8_t buf[4];
  void *v43;
  _BYTE v44[128];
  uint64_t v45;
  _QWORD v46[3];

  v46[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  if (-[PKDASession state](self, "state") == 2)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend(v8, "invitations");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v37;
      v31 = v8;
LABEL_4:
      v16 = v9;
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v37 != v15)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v17);
        if (!objc_msgSend(v18, "canBeSent", v31))
          break;
        objc_msgSend(v18, "sharingConfigurationRepresentation");
        v19 = objc_claimAutoreleasedReturnValue();
        if (!v19)
          break;
        v20 = (void *)v19;
        objc_msgSend(v11, "addObject:", v19);

        if (v14 == ++v17)
        {
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          v9 = v16;
          v8 = v31;
          if (v14)
            goto LABEL_4;
          goto LABEL_11;
        }
      }
      PKLogFacilityTypeGetObject(0x16uLL);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v18;
        _os_log_impl(&dword_18FC92000, v28, OS_LOG_TYPE_DEFAULT, "Failed to create sharing configuration from invitation: %@", buf, 0xCu);
      }

      v9 = v16;
      if (v10)
      {
        v29 = (void *)MEMORY[0x1E0CB35C8];
        v40 = *MEMORY[0x1E0CB2938];
        v41 = CFSTR("Unable to create invitaiton config");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v25);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v10[2](v10, 0, v30);

        v8 = v31;
        goto LABEL_20;
      }
      v8 = v31;
    }
    else
    {
LABEL_11:

      objc_msgSend(v8, "credential");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKDASession session](self, "session");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "recipientIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __88__PKAppletSubcredentialSharingSession_sendSharingInvitationWithRequest_auth_completion___block_invoke;
      v32[3] = &unk_1E2AD5A18;
      v33 = v8;
      v34 = v22;
      v35 = v10;
      v12 = v22;
      objc_msgSend(v23, "sendSharingInvitationForKeyIdentifier:toIdsIdentifier:auth:config:completionHandler:", v12, v24, v9, v11, v32);

      v25 = v33;
LABEL_20:

    }
    goto LABEL_22;
  }
  PKLogFacilityTypeGetObject(0x16uLL);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v26, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for send invitation operation", buf, 2u);
  }

  if (v10)
  {
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v45 = *MEMORY[0x1E0CB2938];
    v46[0] = CFSTR("Session not active");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v12);
LABEL_22:

  }
}

void __88__PKAppletSubcredentialSharingSession_sendSharingInvitationWithRequest_auth_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  PKPassShare *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  PKPassShare *v23;
  PKPassCredentialShare *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  PKPassSharedEntitlement *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  PKPassShare *v36;
  _BYTE v37[128];
  _QWORD v38[3];

  v38[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "count");
  v8 = 0;
  if (!v6 && v7)
  {
    v8 = objc_alloc_init(PKPassShare);
    -[PKPassShare setStatus:](v8, "setStatus:", 2);
    objc_msgSend(*(id *)(a1 + 32), "recipientName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassShare setRecipientNickname:](v8, "setRecipientNickname:", v9);

    objc_msgSend(*(id *)(a1 + 32), "recipientIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassShare setRecipientHandle:](v8, "setRecipientHandle:", v10);

    objc_msgSend(v5, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sharingSessionIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassShare setIdentifier:](v8, "setIdentifier:", v13);

    -[PKPassShare setSubcredentialIdentifier:](v8, "setSubcredentialIdentifier:", *(_QWORD *)(a1 + 40));
    -[PKPassShare setManageability:](v8, "setManageability:", 1);
    objc_msgSend(*(id *)(a1 + 32), "entitlement");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "value");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "unsignedIntegerValue");

    v29 = -[PKPassSharedEntitlement initWithCarKeyEntitlementValue:]([PKPassSharedEntitlement alloc], "initWithCarKeyEntitlementValue:", v16);
    v38[0] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassShare setSharedEntitlements:](v8, "setSharedEntitlements:", v17);

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v30 = v5;
    v18 = v5;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v32 != v21)
            objc_enumerationMutation(v18);
          v23 = *(PKPassShare **)(*((_QWORD *)&v31 + 1) + 8 * i);
          v24 = -[PKPassCredentialShare initWithInvitationData:]([PKPassCredentialShare alloc], "initWithInvitationData:", v23);
          if (v24)
          {
            objc_msgSend(*(id *)(a1 + 32), "recipientIdentifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKPassCredentialShare setChannelTransportIdentifier:](v24, "setChannelTransportIdentifier:", v25);

            if (objc_msgSend(*(id *)(a1 + 32), "isForLocalDevice"))
              -[PKPassCredentialShare setTargetDevice:](v24, "setTargetDevice:", 4);
            -[PKPassShare addCredentialShare:](v8, "addCredentialShare:", v24);
          }
          else
          {
            PKLogFacilityTypeGetObject(0x16uLL);
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v36 = v23;
              _os_log_impl(&dword_18FC92000, v26, OS_LOG_TYPE_DEFAULT, "Failed to create receipt from invitation data: %@", buf, 0xCu);
            }

          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v20);
    }

    PKLogFacilityTypeGetObject(0x16uLL);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v8;
      _os_log_impl(&dword_18FC92000, v27, OS_LOG_TYPE_DEFAULT, "Creating share: %@", buf, 0xCu);
    }

    v6 = 0;
    v5 = v30;
  }
  v28 = *(_QWORD *)(a1 + 48);
  if (v28)
    (*(void (**)(uint64_t, PKPassShare *, id))(v28 + 16))(v28, v8, v6);

}

- (void)sendSharingInvitation:(id)a3 forInvitationRequest:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[PKDASession state](self, "state");
  PKLogFacilityTypeGetObject(0x16uLL);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11 == 2)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138412290;
      v22 = v8;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Sending silent share for invitation: %@", buf, 0xCu);
    }

    objc_msgSend(v9, "credentialIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sharingConfigurationRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDASession session](self, "session");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sharingSessionIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __93__PKAppletSubcredentialSharingSession_sendSharingInvitation_forInvitationRequest_completion___block_invoke;
    v19[3] = &unk_1E2AD5A40;
    v20 = v10;
    objc_msgSend(v16, "sendSilentSharingInvitationWithKeyIdentifier:config:groupIdentifier:completionHandler:", v14, v15, v17, v19);

    goto LABEL_9;
  }
  if (v13)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for send invitation operation", buf, 2u);
  }

  if (v10)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2938];
    v24[0] = CFSTR("Session not active");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v15);
LABEL_9:

  }
}

void __93__PKAppletSubcredentialSharingSession_sendSharingInvitation_forInvitationRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  PKPassCredentialShare *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = 0;
  if (v8 && !v5)
  {
    v6 = objc_alloc_init(PKPassCredentialShare);
    -[PKPassCredentialShare setStatus:](v6, "setStatus:", 2);
    -[PKPassCredentialShare updateWithInvitationData:](v6, "updateWithInvitationData:", v8);
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, PKPassCredentialShare *, id))(v7 + 16))(v7, v6, v5);

}

- (BOOL)cancelSharingInvitationWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  BOOL v8;
  int v10;
  NSObject *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PKDASession state](self, "state") == 2)
  {
    -[PKDASession session](self, "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancelSharingInvitation:", v4);
    v6 = objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v8 = 1;
      goto LABEL_9;
    }
    PKLogFacilityTypeGetObject(0x16uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Failed to cancel sharing invite with error: %@", (uint8_t *)&v10, 0xCu);
    }

  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for cancel sharing operation", (uint8_t *)&v10, 2u);
    }
  }
  v8 = 0;
LABEL_9:

  return v8;
}

- (void)acceptSharingInvitation:(id)a3 encryptedProductPlanIdentifierContainer:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[PKDASession state](self, "state") == 2)
  {
    PKDAAlishaKeyEncryptedRequestFromSubcredentialEncryptedRequest(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDASession session](self, "session");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __114__PKAppletSubcredentialSharingSession_acceptSharingInvitation_encryptedProductPlanIdentifierContainer_completion___block_invoke;
    v16[3] = &unk_1E2AD5A68;
    v17 = v12;
    v18 = v8;
    v19 = v10;
    v14 = v12;
    objc_msgSend(v13, "acceptSharingInvitationWithIdentifier:passcode:productPlanIdentifier:completionHandler:", v14, 0, v11, v16);

  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for accepting sharing operation", buf, 2u);
    }

    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

void __114__PKAppletSubcredentialSharingSession_acceptSharingInvitation_encryptedProductPlanIdentifierContainer_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  PKAppletSubcredential *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v14 = 138412546;
      v15 = v12;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Failed to accept sharing invitation (%@) with error: %@", (uint8_t *)&v14, 0x16u);
    }

    v8 = 0;
  }
  else
  {
    v8 = -[PKAppletSubcredential initWithKeyInformation:]([PKAppletSubcredential alloc], "initWithKeyInformation:", v5);
    objc_msgSend(*(id *)(a1 + 40), "sharingSessionIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAppletSubcredential setSharingSessionIdentifier:](v8, "setSharingSessionIdentifier:", v9);

    objc_msgSend(*(id *)(a1 + 40), "originatorIDSHandle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAppletSubcredential setOriginatorIDSHandle:](v8, "setOriginatorIDSHandle:", v10);

  }
  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
    (*(void (**)(uint64_t, PKAppletSubcredential *))(v13 + 16))(v13, v8);

}

- (void)accountAttestionRequestForCredential:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[8];
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (-[PKDASession state](self, "state") == 2)
    {
      -[PKDASession session](self, "session");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __91__PKAppletSubcredentialSharingSession_accountAttestionRequestForCredential_withCompletion___block_invoke;
      v14[3] = &unk_1E2AD5A90;
      v15 = v6;
      v16 = v7;
      objc_msgSend(v8, "requestBindingAttestationDataForKeyWithIdentifier:callback:", v9, v14);

      v10 = v15;
    }
    else
    {
      PKLogFacilityTypeGetObject(0x16uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for accepting sharing operation", buf, 2u);
      }

      v12 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0CB2938];
      v19[0] = CFSTR("Session not active");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v13);

    }
  }

}

void __91__PKAppletSubcredentialSharingSession_accountAttestionRequestForCredential_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  PKAppletSubcredentialAccountAttestationRequest *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
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
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v10;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Failed to get binding attestation request for credential (%@) with error: %@", (uint8_t *)&v11, 0x16u);

    }
    v8 = 0;
  }
  else
  {
    v8 = -[PKAppletSubcredentialAccountAttestationRequest initWithRequestData:]([PKAppletSubcredentialAccountAttestationRequest alloc], "initWithRequestData:", v5);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)setAccountAttestation:(id)a3 forCredential:(id)a4 withCompletion:(id)a5
{
  void (**v8)(id, void *);
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(id, void *);
  _QWORD v18[4];
  void (**v19)(id, void *);
  uint8_t buf[8];
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, void *))a5;
  v9 = a4;
  v10 = a3;
  if (-[PKDASession state](self, "state") != 2)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for accepting sharing operation", buf, 2u);
    }

    if (v8)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v21 = *MEMORY[0x1E0CB2938];
      v22[0] = CFSTR("Session not active");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v14);

    }
  }
  -[PKDASession session](self, "session");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __90__PKAppletSubcredentialSharingSession_setAccountAttestation_forCredential_withCompletion___block_invoke;
  v18[3] = &unk_1E2ABD9C8;
  v19 = v8;
  v17 = v8;
  objc_msgSend(v15, "setBindingAttestation:forKeyWithIdentifier:callback:", v10, v16, v18);

}

uint64_t __90__PKAppletSubcredentialSharingSession_setAccountAttestation_forCredential_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)requestSharingInvitation:(id)a3 from:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[8];
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if (-[PKDASession state](self, "state") == 2)
  {
    objc_msgSend(v7, "invitationRequestRepresentation");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      -[PKDASession session](self, "session");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __80__PKAppletSubcredentialSharingSession_requestSharingInvitation_from_completion___block_invoke;
      v17[3] = &unk_1E2ABD9C8;
      v18 = v8;
      objc_msgSend(v11, "requestInviteWithConfig:completionHandler:", v10, v17);

      v12 = v18;
    }
    else
    {
      if (!v8)
      {
        v10 = 0;
        goto LABEL_11;
      }
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0CB2938];
      v21 = CFSTR("Unable to create request from invitation");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v8 + 2))(v8, v16);

      v10 = 0;
    }
LABEL_10:

LABEL_11:
    goto LABEL_12;
  }
  PKLogFacilityTypeGetObject(0x16uLL);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for accepting sharing operation", buf, 2u);
  }

  if (v8)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2938];
    v23[0] = CFSTR("Session not active");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v8 + 2))(v8, v12);
    goto LABEL_10;
  }
LABEL_12:

}

void __80__PKAppletSubcredentialSharingSession_requestSharingInvitation_from_completion___block_invoke(uint64_t a1, void *a2)
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
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Failed to request invitation with error: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)routingInformationForInvitationWithIdentifier:(id)a3 fromMailboxIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  if (v10)
  {
    if (-[PKDASession state](self, "state") == 2)
    {
      -[PKDASession session](self, "session");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "readerInformationForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:", v8, v9, v10);

    }
    else
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v15 = *MEMORY[0x1E0CB2938];
      v16[0] = CFSTR("Session not active");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, 0, v14);

    }
  }

}

- (void)getProductPlanIdentifierRequestForInvitationWithIdentifier:(id)a3 fromMailboxIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (-[PKDASession state](self, "state") == 2)
    {
      -[PKDASession session](self, "session");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __131__PKAppletSubcredentialSharingSession_getProductPlanIdentifierRequestForInvitationWithIdentifier_fromMailboxIdentifier_completion___block_invoke;
      v15[3] = &unk_1E2AD5AB8;
      v16 = v10;
      objc_msgSend(v11, "ppidRequestForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:", v8, v9, v15);

      v12 = v16;
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0CB2938];
      v18[0] = CFSTR("Session not active");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v14);

    }
  }

}

void __131__PKAppletSubcredentialSharingSession_getProductPlanIdentifierRequestForInvitationWithIdentifier_fromMailboxIdentifier_completion___block_invoke(uint64_t a1, PKSubcredentialEncryptedContainer *a2, void *a3)
{
  PKSubcredentialEncryptedContainer *v5;
  id v6;

  v6 = a3;
  if (a2)
  {
    v5 = a2;
    a2 = -[PKSubcredentialEncryptedContainer initWithRequest:]([PKSubcredentialEncryptedContainer alloc], "initWithRequest:", v5);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getPretrackRequestForKeyWithIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (-[PKDASession state](self, "state") == 2)
    {
      -[PKDASession session](self, "session");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __93__PKAppletSubcredentialSharingSession_getPretrackRequestForKeyWithIdentifier_withCompletion___block_invoke;
      v12[3] = &unk_1E2AD5AB8;
      v13 = v7;
      objc_msgSend(v8, "getPreTrackRequestForKeyWithIdentifier:callback:", v6, v12);

      v9 = v13;
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0CB2938];
      v15[0] = CFSTR("Session not active");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

    }
  }

}

void __93__PKAppletSubcredentialSharingSession_getPretrackRequestForKeyWithIdentifier_withCompletion___block_invoke(uint64_t a1, PKSubcredentialEncryptedContainer *a2, void *a3)
{
  PKSubcredentialEncryptedContainer *v5;
  id v6;

  v6 = a3;
  if (a2)
  {
    v5 = a2;
    a2 = -[PKSubcredentialEncryptedContainer initWithRequest:]([PKSubcredentialEncryptedContainer alloc], "initWithRequest:", v5);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)createInviteForShare:(id)a3 forCredential:(id)a4 authorization:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void (**v15)(id, _QWORD, void *);
  void *v16;
  void *v17;
  void *v18;
  char v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  NSObject *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  uint64_t v42;
  id v43;
  __CFString *v44;
  const __CFString *v45;
  uint64_t v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *oslog;
  PKAppletSubcredentialSharingSession *v53;
  void *v54;
  void *v55;
  void *v56;
  void (**v57)(id, _QWORD, void *);
  id v58;
  void *v59;
  id obj;
  uint64_t v61;
  uint64_t v62;
  unsigned int v63;
  void *v64;
  void *v65;
  _QWORD v66[4];
  void (**v67)(id, _QWORD, void *);
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t v72[128];
  uint8_t buf[4];
  _BYTE v74[10];
  _BYTE v75[10];
  uint64_t v76;
  _QWORD v77[4];

  v77[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v10;
  v14 = v12;
  v15 = (void (**)(id, _QWORD, void *))a6;
  if (v15)
  {
    v65 = v13;
    if (-[PKDASession state](self, "state") != 2)
    {
      PKLogFacilityTypeGetObject(0x16uLL);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for setting transport channel", buf, 2u);
      }

      v23 = (void *)MEMORY[0x1E0CB35C8];
      v76 = *MEMORY[0x1E0CB2938];
      v77[0] = CFSTR("Session not active");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, &v76, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v15[2](v15, 0, v17);
      goto LABEL_46;
    }
    objc_msgSend(v13, "sharedEntitlements");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "count") != 1)
    {
      PKLogFacilityTypeGetObject(0x16uLL);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v24, OS_LOG_TYPE_DEFAULT, "Error: Car key shares should only have a single entitlement", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v15[2](v15, 0, v25);
      goto LABEL_45;
    }
    v53 = self;
    v62 = objc_msgSend(v17, "carKeyEntitlementValue");
    objc_msgSend(v13, "activationOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "containsVehicleEnteredPin");
    v20 = objc_msgSend(v18, "containsOptionOfType:", 3);
    if ((v19 & 1) == 0)
    {
      v26 = v20;
      objc_msgSend(v18, "activationCode");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (v64)
      {
        PKLogFacilityTypeGetObject(0x16uLL);
        v21 = objc_claimAutoreleasedReturnValue();
        v63 = 0;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          *(_QWORD *)v74 = v64;
          _os_log_impl(&dword_18FC92000, v21, OS_LOG_TYPE_DEFAULT, "Creating car key share with activation code %{private}@", buf, 0xCu);
          v63 = 0;
        }
        goto LABEL_17;
      }
      if (!v26)
      {
        v63 = 0;
        v64 = 0;
        goto LABEL_18;
      }
    }
    PKLogFacilityTypeGetObject(0x16uLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v21, OS_LOG_TYPE_DEFAULT, "Creating car key share with vehicle authenticated option", buf, 2u);
    }
    v64 = 0;
    v63 = 1;
LABEL_17:

LABEL_18:
    v56 = v16;
    v57 = v15;
    objc_msgSend(v17, "recipientCapabilityRole");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v65;
    if (v27)
    {
      objc_msgSend(v17, "recipientCapabilityRole");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v28, "unsignedIntValue");

    }
    else
    {
      v30 = objc_msgSend(v17, "recipientShareability");
      v31 = objc_msgSend(v17, "recipientVisibility");
      v32 = objc_msgSend(v17, "recipientManageability");
      v33 = objc_msgSend(v17, "intraAccountSharingEnabled");
      v34 = v31;
      v13 = v65;
      v29 = (void *)PKPassEntitlementCapabilityRoleValueFrom(v30, v34, v32, v33);
    }
    v54 = v18;
    v58 = v14;
    v59 = v11;
    PKLogFacilityTypeGetObject(0x16uLL);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v74 = (unsigned __int16)v29;
      *(_WORD *)&v74[4] = 1024;
      *(_DWORD *)&v74[6] = (unsigned __int16)v29;
      *(_WORD *)v75 = 2112;
      *(_QWORD *)&v75[2] = v17;
      _os_log_impl(&dword_18FC92000, v35, OS_LOG_TYPE_DEFAULT, "Created role '0x%04x' / '%hu' from: %@", buf, 0x18u);
    }
    v55 = v17;
    oslog = v35;

    v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    objc_msgSend(v13, "credentialShares");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
    if (v37)
    {
      v38 = v37;
      v61 = *(_QWORD *)v69;
      v39 = (unsigned __int16)v29;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          v41 = v36;
          if (*(_QWORD *)v69 != v61)
            objc_enumerationMutation(obj);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * i), "isForWatch"))
            v42 = 2;
          else
            v42 = 1;
          v43 = objc_alloc(MEMORY[0x1E0D1D380]);
          objc_msgSend(v13, "recipientNickname");
          v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v45 = v44;
          if (!v44)
          {
            objc_msgSend(v13, "recipientHandle");
            v46 = objc_claimAutoreleasedReturnValue();
            v29 = (void *)v46;
            if (v46)
              v45 = (const __CFString *)v46;
            else
              v45 = CFSTR("unknown");
          }
          v47 = objc_alloc_init(MEMORY[0x1E0C99D50]);
          v48 = (void *)objc_msgSend(v43, "initWithProfile:displayName:metaData:targetDeviceType:enableVehiclePasscode:maxRetriesForDevicePasscode:deviceEnteredPasscode:proprietaryEntitlements:", v62, v45, v47, v42, v63, 5, v64, 0);

          if (!v44)
          objc_msgSend(v48, "setKeyRole:", v39);
          v36 = v41;
          objc_msgSend(v41, "safelyAddObject:", v48);

          v13 = v65;
        }
        v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
      }
      while (v38);
    }

    if (objc_msgSend(v36, "count"))
    {
      -[PKDASession session](v53, "session");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v59;
      objc_msgSend(v59, "identifier");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v66[0] = MEMORY[0x1E0C809B0];
      v66[1] = 3221225472;
      v66[2] = __99__PKAppletSubcredentialSharingSession_createInviteForShare_forCredential_authorization_completion___block_invoke;
      v66[3] = &unk_1E2ABE738;
      v15 = v57;
      v67 = v57;
      v14 = v58;
      objc_msgSend(v49, "createSharingInvitationsForKeyIdentifier:friendIdentifier:auth:config:completionHandler:", v50, 0, v58, v36, v66);

      v13 = v65;
      v51 = v67;
      v17 = v55;
      v16 = v56;
      v25 = v54;
    }
    else
    {
      v14 = v58;
      v11 = v59;
      v16 = v56;
      v15 = v57;
      v25 = v54;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v74 = v13;
        *(_WORD *)&v74[8] = 2112;
        *(_QWORD *)v75 = v59;
        _os_log_impl(&dword_18FC92000, oslog, OS_LOG_TYPE_DEFAULT, "Error: Unable to create DAKeySharingConfiguration from %@ for %@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v57[2](v57, 0, v51);
      v17 = v55;
    }

LABEL_45:
LABEL_46:

  }
}

uint64_t __99__PKAppletSubcredentialSharingSession_createInviteForShare_forCredential_authorization_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setTransportChannelIdentifier:(id)a3 forCredential:(id)a4 forCredentialShare:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *);
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t v21[8];
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  if (v13)
  {
    if (-[PKDASession state](self, "state") == 2)
    {
      -[PKDASession session](self, "session");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setMailboxIdentifier:forOwnerKeyIdentifier:forInvitationIdentifier:completionHandler:", v10, v15, v16, v13);

    }
    else
    {
      PKLogFacilityTypeGetObject(0x16uLL);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for setting transport channel", v21, 2u);
      }

      v18 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0CB2938];
      v23[0] = CFSTR("Session not active");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, v20);

    }
  }

}

- (void)startShareAcceptanceFlowWithInvitation:(id)a3 fromMailboxIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t v16[8];
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if (v10)
  {
    if (-[PKDASession state](self, "state") == 2)
    {
      -[PKDASession session](self, "session");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "startShareAcceptanceFlowWithInvitation:fromMailboxIdentifier:completionHandler:", v8, v9, v10);

    }
    else
    {
      PKLogFacilityTypeGetObject(0x16uLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for setting transport channel", v16, 2u);
      }

      v13 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0CB2938];
      v18[0] = CFSTR("Session not active");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, v15);

    }
  }

}

- (void)acceptCrossPlatformInvitationWithIdentifier:(id)a3 transportChannelIdentifier:(id)a4 activationCode:(id)a5 encryptedProductPlanIdentifierContainer:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[8];
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v16)
  {
    if (-[PKDASession state](self, "state") == 2)
    {
      PKDAAlishaKeyEncryptedRequestFromSubcredentialEncryptedRequest(v15);
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = (void *)v17;
        -[PKDASession session](self, "session");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __176__PKAppletSubcredentialSharingSession_acceptCrossPlatformInvitationWithIdentifier_transportChannelIdentifier_activationCode_encryptedProductPlanIdentifierContainer_completion___block_invoke;
        v25[3] = &unk_1E2AC6FE0;
        v26 = v16;
        objc_msgSend(v19, "acceptCrossPlatformInvitationWithIdentifier:passcode:productPlanIdentifier:completionHandler:", v12, v14, v18, v25);

        v20 = v26;
      }
      else
      {
        PKLogFacilityTypeGetObject(0x16uLL);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "Missing daEncryptedProductPlanIdentifierContainer", buf, 2u);
        }

        v23 = (void *)MEMORY[0x1E0CB35C8];
        v28 = *MEMORY[0x1E0CB2938];
        v29 = CFSTR("Missing daEncryptedProductPlanIdentifierContainer");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v20);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, _QWORD, void *))v16 + 2))(v16, 0, 0, v24);

        v18 = 0;
      }
    }
    else
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v30 = *MEMORY[0x1E0CB2938];
      v31[0] = CFSTR("Session not active");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v16 + 2))(v16, 0, 0, v20);
    }

  }
}

void __176__PKAppletSubcredentialSharingSession_acceptCrossPlatformInvitationWithIdentifier_transportChannelIdentifier_activationCode_encryptedProductPlanIdentifierContainer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PKAppletSubcredential *v8;
  id v9;

  v3 = a2;
  v9 = v3;
  if (v3)
  {
    objc_msgSend(v3, "genericData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "friendKeyIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "additionalData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sharingSessionUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[PKAppletSubcredential initWithIdentifier:]([PKAppletSubcredential alloc], "initWithIdentifier:", v5);
    -[PKAppletSubcredential setSharingSessionIdentifier:](v8, "setSharingSessionIdentifier:", v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)retryActivationCodeForCredentialIdentifier:(id)a3 activationCode:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (-[PKDASession state](self, "state") == 2)
    {
      -[PKDASession session](self, "session");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __108__PKAppletSubcredentialSharingSession_retryActivationCodeForCredentialIdentifier_activationCode_completion___block_invoke;
      v15[3] = &unk_1E2ABD9C8;
      v16 = v10;
      objc_msgSend(v11, "retryPasscode:forKeyIdentifier:completionHandler:", v9, v8, v15);

      v12 = v16;
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0CB2938];
      v18[0] = CFSTR("Session not active");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v10 + 2))(v10, v14);

    }
  }

}

uint64_t __108__PKAppletSubcredentialSharingSession_retryActivationCodeForCredentialIdentifier_activationCode_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)acceptInvitationWithIdentifier:(id)a3 activationCode:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  if (v9)
  {
    if (-[PKDASession state](self, "state") == 2)
    {
      -[PKDASession session](self, "session");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "acceptInvitationWithIdentifier:passcode:completionHandler:", v11, v8, v9);

    }
    else
    {
      v9[2](v9, 0);
    }
  }

}

- (void)retryActivationCode:(id)a3 forInvitationIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  if (v9)
  {
    if (-[PKDASession state](self, "state") == 2)
    {
      -[PKDASession session](self, "session");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "retryPasscode:forInvitationIdentifier:completionHandler:", v11, v8, v9);

    }
    else
    {
      v9[2](v9, 0);
    }
  }

}

- (void)handleRecipientMessage:(id)a3 forInvitationIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  if (v9)
  {
    if (-[PKDASession state](self, "state") == 2)
    {
      -[PKDASession session](self, "session");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleRecipientMessage:forInvitationIdentifier:completionHandler:", v11, v8, v9);

    }
    else
    {
      v9[2](v9, 0);
    }
  }

}

- (void)retryActivationCodeWithInvitationIdentifier:(id)a3 activationCode:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  if (v9)
  {
    if (-[PKDASession state](self, "state") == 2)
    {
      -[PKDASession session](self, "session");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "retryPasscode:forInvitationIdentifier:completionHandler:", v8, v11, v9);

    }
    else
    {
      v9[2](v9, 0);
    }
  }

}

- (void)setEncryptedProductPlanIdentifierContainer:(id)a3 forInvitationIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  if (v9)
  {
    if (-[PKDASession state](self, "state") == 2)
    {
      PKDAAlishaKeyEncryptedRequestFromSubcredentialEncryptedRequest(v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDASession session](self, "session");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setProductPlanIdentifier:forInvitationIdentifier:completion:", v10, v8, v9);

    }
    else
    {
      v9[2](v9, 0);
    }
  }

}

- (void)createSilentInviteForSharingSessionIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v6)
  {
    if (-[PKDASession state](self, "state") == 2)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v9);
      -[PKDASession session](self, "session");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "createSilentSharingInvitationWithGroupIdentifier:completionHandler:", v7, v6);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
    }
  }

}

@end
