@implementation PKSubcredentialProvisioningAccountAttestationOperation

- (PKSubcredentialProvisioningAccountAttestationOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  PKSubcredentialProvisioningAccountAttestationOperation *v10;
  uint64_t v11;
  PKAppletSubcredential *credential;
  NSObject *v13;
  uint64_t v14;
  PKAppletSubcredentialSharingInvitationMetadata *metadata;
  uint64_t v16;
  PKPaymentWebService *webService;
  PKPaymentWebService *v18;
  NSObject *v19;
  PKSubcredentialProvisioningAccountAttestationOperation *v20;
  NSObject *v21;
  void *v22;
  objc_super v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PKSubcredentialProvisioningAccountAttestationOperation;
  v10 = -[PKSubcredentialProvisioningSharingSessionOperation initWithConfiguration:context:delegate:](&v24, sel_initWithConfiguration_context_delegate_, v8, v9, a5);
  if (!v10)
    goto LABEL_8;
  objc_msgSend(v9, "addedCredential");
  v11 = objc_claimAutoreleasedReturnValue();
  credential = v10->_credential;
  v10->_credential = (PKAppletSubcredential *)v11;

  if (!v10->_credential)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Unable to get binding attestation with no credential", buf, 2u);
    }
    goto LABEL_22;
  }
  objc_msgSend(v8, "acceptInvitationConfiguration");
  v13 = objc_claimAutoreleasedReturnValue();
  -[NSObject metadata](v13, "metadata");
  v14 = objc_claimAutoreleasedReturnValue();
  metadata = v10->_metadata;
  v10->_metadata = (PKAppletSubcredentialSharingInvitationMetadata *)v14;

  -[NSObject webService](v13, "webService");
  v16 = objc_claimAutoreleasedReturnValue();
  webService = v10->_webService;
  v10->_webService = (PKPaymentWebService *)v16;

  v18 = v10->_webService;
  if (!v18)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, "Unable to get binding attestation with no credential", buf, 2u);
    }
    goto LABEL_21;
  }
  -[PKPaymentWebService targetDevice](v18, "targetDevice");
  v19 = objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v21, OS_LOG_TYPE_DEFAULT, "Missing target device", buf, 2u);
    }
    goto LABEL_20;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_paymentWebService_accountAttestationAnonymizationSaltWithCompletion_);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v22;
LABEL_19:
      _os_log_impl(&dword_18FC92000, v21, OS_LOG_TYPE_DEFAULT, "Target device doesn't support selector: %@", buf, 0xCu);

    }
LABEL_20:

LABEL_21:
LABEL_22:

    v20 = 0;
    goto LABEL_23;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_paymentWebService_setAccountAttestationAnonymizationSalt_withCompletion_);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v22;
      goto LABEL_19;
    }
    goto LABEL_20;
  }

LABEL_8:
  v20 = v10;
LABEL_23:

  return v20;
}

- (void)performOperation
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  NSObject *v6;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKSubcredentialProvisioningAccountAttestationOperation;
  -[PKSubcredentialProvisioningOperation performOperation](&v8, sel_performOperation);
  -[PKSubcredentialProvisioningSharingSessionOperation sharingSession](self, "sharingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state");
  switch(v4)
  {
    case 0:
      if ((objc_msgSend(v3, "startSession") & 1) != 0)
        break;
      v5 = CFSTR("Unable to start session");
LABEL_8:
      -[PKSubcredentialProvisioningOperation failWithErrorCode:description:](self, "failWithErrorCode:description:", 1, v5);
      break;
    case 3:
      v5 = CFSTR("Session was invalidated");
      goto LABEL_8;
    case 2:
      -[PKSubcredentialProvisioningAccountAttestationOperation performOperationWithSession:](self, "performOperationWithSession:", v3);
      break;
    default:
      PKLogFacilityTypeGetObject(0x16uLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Waiting for session to become active...", v7, 2u);
      }

      break;
  }

}

- (void)performOperationWithSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t v10[16];

  v4 = a3;
  -[PKSubcredentialProvisioningOperation configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "acceptInvitationConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "invitation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "type");
  if (v8 == 1)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Skipping binding attestation because this is a cross platform share", v10, 2u);
    }

    self->_operationCompleted = 1;
    objc_msgSend(v4, "endSession");
  }
  else if (!v8)
  {
    -[PKSubcredentialProvisioningAccountAttestationOperation _setAccountAttestationWithSession:](self, "_setAccountAttestationWithSession:", v4);
  }

}

- (void)_setAccountAttestationWithSession:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  PKAppletSubcredential *credential;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id buf[2];

  v4 = a3;
  PKLogFacilityTypeGetObject(0x16uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Getting binding attestation request...", (uint8_t *)buf, 2u);
  }

  -[PKSubcredentialProvisioningOperation context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "operationQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(buf, self);
  credential = self->_credential;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __92__PKSubcredentialProvisioningAccountAttestationOperation__setAccountAttestationWithSession___block_invoke;
  v11[3] = &unk_1E2AC4B60;
  v9 = v7;
  v12 = v9;
  objc_copyWeak(&v14, buf);
  v10 = v4;
  v13 = v10;
  objc_msgSend(v10, "accountAttestionRequestForCredential:withCompletion:", credential, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(buf);

}

void __92__PKSubcredentialProvisioningAccountAttestationOperation__setAccountAttestationWithSession___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = a1[4];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__PKSubcredentialProvisioningAccountAttestationOperation__setAccountAttestationWithSession___block_invoke_2;
  block[3] = &unk_1E2AC4B38;
  objc_copyWeak(&v15, a1 + 6);
  v11 = v5;
  v12 = v6;
  v13 = a1[4];
  v14 = a1[5];
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, block);

  objc_destroyWeak(&v15);
}

void __92__PKSubcredentialProvisioningAccountAttestationOperation__setAccountAttestationWithSession___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  BOOL v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  uint8_t buf[16];

  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32))
      v5 = *(_QWORD *)(a1 + 40) == 0;
    else
      v5 = 0;
    if (v5)
    {
      PKLogFacilityTypeGetObject(0x16uLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Got binding attestation request, getting anonymization salt...", buf, 2u);
      }

      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __92__PKSubcredentialProvisioningAccountAttestationOperation__setAccountAttestationWithSession___block_invoke_17;
      v7[3] = &unk_1E2AC4B10;
      v8 = *(id *)(a1 + 48);
      objc_copyWeak(&v11, v2);
      v9 = *(id *)(a1 + 32);
      v10 = *(id *)(a1 + 56);
      objc_msgSend(v4, "accountAttesatationAnonymizationSaltWithCompletion:", v7);

      objc_destroyWeak(&v11);
    }
    else
    {
      objc_msgSend(WeakRetained, "failWithErrorCode:description:underlyingError:", 5, CFSTR("Failed to get the account attestation request"));
    }
  }

}

void __92__PKSubcredentialProvisioningAccountAttestationOperation__setAccountAttestationWithSession___block_invoke_17(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
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
  v7 = a1[4];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __92__PKSubcredentialProvisioningAccountAttestationOperation__setAccountAttestationWithSession___block_invoke_2_18;
  v10[3] = &unk_1E2AC4AE8;
  objc_copyWeak(&v16, a1 + 7);
  v11 = v5;
  v12 = v6;
  v13 = a1[5];
  v14 = a1[4];
  v15 = a1[6];
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

  objc_destroyWeak(&v16);
}

void __92__PKSubcredentialProvisioningAccountAttestationOperation__setAccountAttestationWithSession___block_invoke_2_18(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  _QWORD *v4;
  BOOL v5;
  PKPaymentCredentialAccountAttestationRequest *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v2 = (id *)(a1 + 72);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32))
      v5 = *(_QWORD *)(a1 + 40) == 0;
    else
      v5 = 0;
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 48), "setAnonymizationSalt:");
      v6 = -[PKPaymentCredentialAccountAttestationRequest initWithAttestationRequest:]([PKPaymentCredentialAccountAttestationRequest alloc], "initWithAttestationRequest:", *(_QWORD *)(a1 + 48));
      v7 = (void *)v4[6];
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __92__PKSubcredentialProvisioningAccountAttestationOperation__setAccountAttestationWithSession___block_invoke_3;
      v8[3] = &unk_1E2AC4AC0;
      v9 = *(id *)(a1 + 56);
      objc_copyWeak(&v11, v2);
      v10 = *(id *)(a1 + 64);
      objc_msgSend(v7, "credentialAccountAttesationWithRequest:completion:", v6, v8);

      objc_destroyWeak(&v11);
    }
    else
    {
      objc_msgSend(WeakRetained, "failWithErrorCode:description:underlyingError:", 5, CFSTR("Failed to get the anonymization salt"));
    }
  }

}

void __92__PKSubcredentialProvisioningAccountAttestationOperation__setAccountAttestationWithSession___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __92__PKSubcredentialProvisioningAccountAttestationOperation__setAccountAttestationWithSession___block_invoke_4;
  v10[3] = &unk_1E2AC4A98;
  objc_copyWeak(&v14, (id *)(a1 + 48));
  v11 = v6;
  v12 = v5;
  v13 = *(id *)(a1 + 40);
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, v10);

  objc_destroyWeak(&v14);
}

void __92__PKSubcredentialProvisioningAccountAttestationOperation__setAccountAttestationWithSession___block_invoke_4(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v3;
  void *v4;
  BOOL v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id buf[2];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = *(id *)(a1 + 32);
    v4 = v3;
    if (*(_QWORD *)(a1 + 40))
      v5 = v3 == 0;
    else
      v5 = 0;
    if (v5)
    {
      PKLogFacilityTypeGetObject(0x16uLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Got account attestation, setting the attesation...", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, *(id *)(a1 + 48));
      v8 = *(_QWORD *)(a1 + 40);
      v7 = *(void **)(a1 + 48);
      v9 = WeakRetained[5];
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __92__PKSubcredentialProvisioningAccountAttestationOperation__setAccountAttestationWithSession___block_invoke_19;
      v10[3] = &unk_1E2AC4A70;
      v10[4] = WeakRetained;
      objc_copyWeak(&v12, buf);
      v11 = 0;
      objc_msgSend(v7, "setAccountAttestation:forCredential:withCompletion:", v8, v9, v10);

      objc_destroyWeak(&v12);
      objc_destroyWeak(buf);
    }
    else
    {
      objc_msgSend(WeakRetained, "failWithErrorCode:description:underlyingError:", 5, CFSTR("Failed to get the account attestation"), v3);
    }

  }
}

void __92__PKSubcredentialProvisioningAccountAttestationOperation__setAccountAttestationWithSession___block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  id WeakRetained;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(0x16uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Failed to set binding attestation. Underlying error: %@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "failWithErrorCode:description:underlyingError:", 5, CFSTR("Failed to set the account attestation"), *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (v5)
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Set the account attesation successfully", (uint8_t *)&v7, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 1;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "endSession");

  }
}

- (void)accountAttesatationAnonymizationSaltWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  PKPaymentWebService *webService;
  id v10;
  _QWORD v11[4];
  id v12;
  void (**v13)(id, void *, _QWORD);
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _QWORD))a3;
  if (v4)
  {
    -[PKAppletSubcredentialSharingInvitationMetadata anonymizationSalt](self->_metadata, "anonymizationSalt");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(0x16uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        *(_DWORD *)buf = 138412290;
        v16 = v5;
        _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Using salt from metadata: %@", buf, 0xCu);
      }

      v4[2](v4, v5, 0);
    }
    else
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Fetching anonymization salt...", buf, 2u);
      }

      objc_initWeak((id *)buf, self);
      -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      webService = self->_webService;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __109__PKSubcredentialProvisioningAccountAttestationOperation_accountAttesatationAnonymizationSaltWithCompletion___block_invoke;
      v11[3] = &unk_1E2AC4B88;
      objc_copyWeak(&v14, (id *)buf);
      v13 = v4;
      v10 = v8;
      v12 = v10;
      objc_msgSend(v10, "paymentWebService:accountAttestationAnonymizationSaltWithCompletion:", webService, v11);

      objc_destroyWeak(&v14);
      objc_destroyWeak((id *)buf);
    }

  }
}

void __109__PKSubcredentialProvisioningAccountAttestationOperation_accountAttesatationAnonymizationSaltWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      if (v6)
      {
        PKLogFacilityTypeGetObject(0x16uLL);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v6;
          _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Failed to get anonymization salt: %@", buf, 0xCu);
        }

      }
      +[PKAccountAttestationRequest createAnonymizationSalt](PKAccountAttestationRequest, "createAnonymizationSalt");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      PKLogFacilityTypeGetObject(0x16uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "No salt found, setting default salt", buf, 2u);
      }

      v12 = *(void **)(a1 + 32);
      v13 = WeakRetained[6];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __109__PKSubcredentialProvisioningAccountAttestationOperation_accountAttesatationAnonymizationSaltWithCompletion___block_invoke_34;
      v14[3] = &unk_1E2ABEB88;
      v5 = v10;
      v15 = v5;
      v16 = *(id *)(a1 + 40);
      objc_msgSend(v12, "paymentWebService:setAccountAttestationAnonymizationSalt:withCompletion:", v13, v5, v14);

    }
    else
    {
      PKLogFacilityTypeGetObject(0x16uLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v5;
        _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Found already defined anonymization salt: %@", buf, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }

}

void __109__PKSubcredentialProvisioningAccountAttestationOperation_accountAttesatationAnonymizationSaltWithCompletion___block_invoke_34(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(0x16uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Failed to set default salt: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (v5)
  {
    v6 = *(void **)(a1 + 32);
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Setting default salt to: %@", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;
  id v9;

  v6 = a3;
  v7 = v6;
  if (a4 == 2)
  {
    v9 = v6;
    v8 = -[PKSubcredentialProvisioningOperation isInProgress](self, "isInProgress");
    v7 = v9;
    if (v8)
    {
      -[PKSubcredentialProvisioningAccountAttestationOperation performOperationWithSession:](self, "performOperationWithSession:", v9);
LABEL_8:
      v7 = v9;
    }
  }
  else if (a4 == 3)
  {
    v9 = v6;
    if (self->_operationCompleted)
      -[PKSubcredentialProvisioningOperation advanceToState:](self, "advanceToState:", 16);
    else
      -[PKSubcredentialProvisioningOperation failWithErrorCode:description:](self, "failWithErrorCode:description:", 1, CFSTR("Session was invalidated unexpectedly"));
    goto LABEL_8;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_credential, 0);
}

@end
