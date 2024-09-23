@implementation PKSubcredentialProvisioningSendInvitationOperation

- (PKSubcredentialProvisioningSendInvitationOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5
{
  id v8;
  PKSubcredentialProvisioningSendInvitationOperation *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  PKAppletSubcredentialSharingRequest *sharingRequest;
  uint64_t v14;
  PKAppletSubcredentialSharingInvitation *invitation;
  uint64_t v16;
  PKAppletSubcredential *credential;
  uint64_t v18;
  PKPaymentWebService *localDeviceWebService;
  uint64_t v20;
  PKPaymentWebService *remoteDeviceWebService;
  PKSubcredentialProvisioningSendInvitationOperation *v22;
  NSObject *v23;
  uint8_t v25[16];
  objc_super v26;

  v8 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PKSubcredentialProvisioningSendInvitationOperation;
  v9 = -[PKSubcredentialProvisioningSharingSessionOperation initWithConfiguration:context:delegate:](&v26, sel_initWithConfiguration_context_delegate_, v8, a4, a5);
  if (!v9)
    goto LABEL_9;
  objc_msgSend(v8, "remoteDeviceConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "sharingRequest");
    v12 = objc_claimAutoreleasedReturnValue();
    sharingRequest = v9->_sharingRequest;
    v9->_sharingRequest = (PKAppletSubcredentialSharingRequest *)v12;

    objc_msgSend(v11, "invitation");
    v14 = objc_claimAutoreleasedReturnValue();
    invitation = v9->_invitation;
    v9->_invitation = (PKAppletSubcredentialSharingInvitation *)v14;

    -[PKAppletSubcredentialSharingRequest credential](v9->_sharingRequest, "credential");
    v16 = objc_claimAutoreleasedReturnValue();
    credential = v9->_credential;
    v9->_credential = (PKAppletSubcredential *)v16;

    objc_msgSend(v11, "localDeviceWebService");
    v18 = objc_claimAutoreleasedReturnValue();
    localDeviceWebService = v9->_localDeviceWebService;
    v9->_localDeviceWebService = (PKPaymentWebService *)v18;

    objc_msgSend(v11, "remoteDeviceWebService");
    v20 = objc_claimAutoreleasedReturnValue();
    remoteDeviceWebService = v9->_remoteDeviceWebService;
    v9->_remoteDeviceWebService = (PKPaymentWebService *)v20;

  }
  if (v9->_sharingRequest && v9->_invitation && v9->_credential && v9->_remoteDeviceWebService)
  {

LABEL_9:
    v22 = v9;
    goto LABEL_13;
  }
  PKLogFacilityTypeGetObject(0x16uLL);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v25 = 0;
    _os_log_impl(&dword_18FC92000, v23, OS_LOG_TYPE_DEFAULT, "No sharing request, invitation, credential, or webservice to use!", v25, 2u);
  }

  v22 = 0;
LABEL_13:

  return v22;
}

- (void)performOperation
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKSubcredentialProvisioningSendInvitationOperation;
  -[PKSubcredentialProvisioningOperation performOperation](&v8, sel_performOperation);
  -[PKPaymentWebService targetDevice](self->_remoteDeviceWebService, "targetDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[PKSubcredentialProvisioningAcceptRemoteInvitationOperation canDeviceAcceptInvitation:](PKSubcredentialProvisioningAcceptRemoteInvitationOperation, "canDeviceAcceptInvitation:", v3))
  {
    -[PKSubcredentialProvisioningSharingSessionOperation sharingSession](self, "sharingSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "state");
    if (v5 == 3)
    {
      -[PKSubcredentialProvisioningOperation failWithErrorCode:description:](self, "failWithErrorCode:description:", 1, CFSTR("Session was invalidated"));
    }
    else if (v5 == 2)
    {
      -[PKSubcredentialProvisioningSendInvitationOperation sendInvitation](self, "sendInvitation");
    }
    else
    {
      PKLogFacilityTypeGetObject(0x16uLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Waiting for session to become active...", v7, 2u);
      }

    }
  }
  else
  {
    -[PKSubcredentialProvisioningOperation failWithErrorCode:description:](self, "failWithErrorCode:description:", 21, CFSTR("Remote device can't accept invitations"));
  }

}

- (void)sendInvitation
{
  NSObject *v3;
  PKAppletSubcredentialSharingInvitation *invitation;
  _QWORD v5[4];
  id v6;
  id location;
  uint8_t buf[4];
  PKAppletSubcredentialSharingInvitation *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  PKLogFacilityTypeGetObject(0x16uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    invitation = self->_invitation;
    *(_DWORD *)buf = 138412290;
    v9 = invitation;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Checking if device can accept invitation: %@", buf, 0xCu);
  }

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__PKSubcredentialProvisioningSendInvitationOperation_sendInvitation__block_invoke;
  v5[3] = &unk_1E2AC7848;
  objc_copyWeak(&v6, &location);
  -[PKSubcredentialProvisioningSendInvitationOperation canAcceptInvitationWithCompletion:](self, "canAcceptInvitationWithCompletion:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __68__PKSubcredentialProvisioningSendInvitationOperation_sendInvitation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      objc_msgSend(WeakRetained, "failWithError:", v3);
    }
    else
    {
      PKLogFacilityTypeGetObject(0x16uLL);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Device can accept the invitation", buf, 2u);
      }

      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __68__PKSubcredentialProvisioningSendInvitationOperation_sendInvitation__block_invoke_13;
      v8[3] = &unk_1E2AC7848;
      objc_copyWeak(&v9, v4);
      objc_msgSend(v6, "initializeAccountAttestationIfNecessaryWithCompletion:", v8);
      objc_destroyWeak(&v9);
    }
  }

}

void __68__PKSubcredentialProvisioningSendInvitationOperation_sendInvitation__block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[16];

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      objc_msgSend(WeakRetained, "failWithErrorCode:description:", 5, CFSTR("Unable to set account attestation"));
    }
    else
    {
      objc_msgSend(WeakRetained, "userAuthDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v6, "context");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "operationQueue");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        PKLogFacilityTypeGetObject(0x16uLL);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Requesting auth to send invitation", buf, 2u);
        }

        objc_msgSend(v6, "configuration");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __68__PKSubcredentialProvisioningSendInvitationOperation_sendInvitation__block_invoke_18;
        v13[3] = &unk_1E2ADBB28;
        v12 = v9;
        v14 = v12;
        objc_copyWeak(&v15, v4);
        objc_msgSend(v7, "subcredentialProvisioningConfiguration:requestUserAuthWithCompletion:", v11, v13);

        objc_destroyWeak(&v15);
      }
      else
      {
        objc_msgSend(v6, "failWithErrorCode:description:", 0, CFSTR("No auth delegate"));
      }

    }
  }

}

void __68__PKSubcredentialProvisioningSendInvitationOperation_sendInvitation__block_invoke_18(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(NSObject **)(a1 + 32);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__PKSubcredentialProvisioningSendInvitationOperation_sendInvitation__block_invoke_2;
  v14[3] = &unk_1E2ADA950;
  objc_copyWeak(&v18, (id *)(a1 + 40));
  v16 = v8;
  v17 = v9;
  v15 = v7;
  v11 = v8;
  v12 = v7;
  v13 = v9;
  dispatch_async(v10, v14);

  objc_destroyWeak(&v18);
}

void __68__PKSubcredentialProvisioningSendInvitationOperation_sendInvitation__block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[16];

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32) && !*(_QWORD *)(a1 + 40))
    {
      PKLogFacilityTypeGetObject(0x16uLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Got user auth for sharing", buf, 2u);
      }

      v7 = *(_QWORD *)(a1 + 32);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __68__PKSubcredentialProvisioningSendInvitationOperation_sendInvitation__block_invoke_19;
      v8[3] = &unk_1E2ADBB00;
      objc_copyWeak(&v10, v2);
      v9 = *(id *)(a1 + 48);
      objc_msgSend(WeakRetained, "sendInvitationWithAuth:completion:", v7, v8);

      objc_destroyWeak(&v10);
    }
    else
    {
      v4 = *(_QWORD *)(a1 + 48);
      if (v4)
        (*(void (**)(void))(v4 + 16))();
      objc_msgSend(WeakRetained, "failWithErrorCode:description:underlyingError:", 22, CFSTR("Unable to get auth"), *(_QWORD *)(a1 + 40));
    }
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
      (*(void (**)(void))(v5 + 16))();
  }

}

void __68__PKSubcredentialProvisioningSendInvitationOperation_sendInvitation__block_invoke_19(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(void))(v4 + 16))();
  if (v5)
    objc_msgSend(WeakRetained, "failWithError:", v5);
  else
    objc_msgSend(WeakRetained, "advanceToState:", 15);

}

- (void)canAcceptInvitationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PKPaymentWebService *remoteDeviceWebService;
  void *v8;
  _QWORD v9[4];
  id v10;
  PKSubcredentialProvisioningSendInvitationOperation *v11;
  id v12;

  v4 = a3;
  if (v4)
  {
    -[PKPaymentWebService targetDevice](self->_remoteDeviceWebService, "targetDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[PKAppletSubcredentialSharingInvitation addCarKeyPassConfiguration](self->_invitation, "addCarKeyPassConfiguration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      remoteDeviceWebService = self->_remoteDeviceWebService;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __88__PKSubcredentialProvisioningSendInvitationOperation_canAcceptInvitationWithCompletion___block_invoke;
      v9[3] = &unk_1E2AC8810;
      v12 = v4;
      v10 = v5;
      v11 = self;
      objc_msgSend(v10, "paymentWebService:canAddSecureElementPassWithConfiguration:completion:", remoteDeviceWebService, v6, v9);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKSubcredentialProvisioningErrorDomain"), 0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v4 + 2))(v4, v8);

    }
  }

}

void __88__PKSubcredentialProvisioningSendInvitationOperation_canAcceptInvitationWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  _QWORD aBlock[4];
  id v16;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__PKSubcredentialProvisioningSendInvitationOperation_canAcceptInvitationWithCompletion___block_invoke_2;
  aBlock[3] = &unk_1E2ABD9C8;
  v16 = *(id *)(a1 + 48);
  v7 = _Block_copy(aBlock);
  v8 = v7;
  if (a2)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = *(void **)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v11 = *(_QWORD *)(v9 + 72);
      v12 = *(_QWORD *)(v9 + 48);
      v13[0] = v6;
      v13[1] = 3221225472;
      v13[2] = __88__PKSubcredentialProvisioningSendInvitationOperation_canAcceptInvitationWithCompletion___block_invoke_3;
      v13[3] = &unk_1E2ABD9C8;
      v14 = v8;
      objc_msgSend(v10, "paymentWebService:canAcceptInvitation:withCompletionV2:", v11, v12, v13);

    }
  }
  else
  {
    (*((void (**)(void *, id))v7 + 2))(v7, v5);
  }

}

void __88__PKSubcredentialProvisioningSendInvitationOperation_canAcceptInvitationWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("PKSubcredentialProvisioningErrorDomain"));

    if ((v6 & 1) == 0)
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = *MEMORY[0x1E0CB3388];
      v11[0] = *MEMORY[0x1E0CB2938];
      v11[1] = v8;
      v12[0] = CFSTR("Device can't accept invite");
      v12[1] = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("PKSubcredentialProvisioningErrorDomain"), 0, v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v10;
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __88__PKSubcredentialProvisioningSendInvitationOperation_canAcceptInvitationWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sendInvitationWithAuth:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  PKAppletSubcredentialSharingInvitation *invitation;
  PKAppletSubcredential *credential;
  PKAppletSubcredentialSharingRequest *sharingRequest;
  _QWORD v16[4];
  id v17;
  PKSubcredentialProvisioningSendInvitationOperation *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  PKAppletSubcredentialSharingInvitation *v22;
  __int16 v23;
  PKAppletSubcredential *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PKPaymentWebService targetDevice](self->_localDeviceWebService, "targetDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSubcredentialProvisioningSharingSessionOperation sharingSession](self, "sharingSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSubcredentialProvisioningOperation context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "operationQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      invitation = self->_invitation;
      credential = self->_credential;
      *(_DWORD *)buf = 138412546;
      v22 = invitation;
      v23 = 2112;
      v24 = credential;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Sending invitation (%@) for credential: %@", buf, 0x16u);
    }

    sharingRequest = self->_sharingRequest;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __88__PKSubcredentialProvisioningSendInvitationOperation_sendInvitationWithAuth_completion___block_invoke;
    v16[3] = &unk_1E2ADBB78;
    v17 = v11;
    v18 = self;
    v19 = v8;
    v20 = v7;
    objc_msgSend(v9, "sendSharingInvitationWithRequest:auth:completion:", sharingRequest, v6, v16);

  }
  else
  {
    -[PKSubcredentialProvisioningOperation failWithErrorCode:description:](self, "failWithErrorCode:description:", 0, CFSTR("No sharing session"));
  }

}

void __88__PKSubcredentialProvisioningSendInvitationOperation_sendInvitationWithAuth_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __88__PKSubcredentialProvisioningSendInvitationOperation_sendInvitationWithAuth_completion___block_invoke_2;
  v10[3] = &unk_1E2ABE238;
  v11 = v5;
  v12 = v6;
  v7 = *(NSObject **)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 40);
  v14 = *(id *)(a1 + 48);
  v15 = *(id *)(a1 + 32);
  v16 = *(id *)(a1 + 56);
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

void __88__PKSubcredentialProvisioningSendInvitationOperation_sendInvitationWithAuth_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  BOOL v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
    v3 = *(_QWORD *)(a1 + 40) == 0;
  else
    v3 = 0;
  if (v3)
  {
    objc_msgSend(v2, "credentialShares");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    PKLogFacilityTypeGetObject(0x16uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48);
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v26 = v9;
      v27 = 2112;
      v28 = v10;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Sent invitation (%@) with new share: %@", buf, 0x16u);
    }

    v11 = *(_QWORD *)(a1 + 48);
    v12 = *(void **)(a1 + 56);
    v13 = *(_QWORD *)(v11 + 64);
    v14 = *(_QWORD *)(v11 + 56);
    v15 = *(_QWORD *)(a1 + 32);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __88__PKSubcredentialProvisioningSendInvitationOperation_sendInvitationWithAuth_completion___block_invoke_34;
    v20[3] = &unk_1E2ADBB50;
    v16 = *(id *)(a1 + 64);
    v17 = *(_QWORD *)(a1 + 48);
    v21 = v16;
    v22 = v17;
    v23 = v7;
    v24 = *(id *)(a1 + 72);
    v18 = v7;
    objc_msgSend(v12, "paymentWebService:addPassShare:onCredential:withCompletion:", v13, v15, v14, v20);

  }
  else
  {
    PKConvertDAErrorToSubcredentialProvisioningErrorDomain(*(void **)(a1 + 40), CFSTR("Failed to send invitation"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 72);
    if (v5)
    {
      v19 = v4;
      (*(void (**)(void))(v5 + 16))();
      v4 = v19;
    }

  }
}

void __88__PKSubcredentialProvisioningSendInvitationOperation_sendInvitationWithAuth_completion___block_invoke_34(uint64_t a1, char a2)
{
  NSObject *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  char v7;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __88__PKSubcredentialProvisioningSendInvitationOperation_sendInvitationWithAuth_completion___block_invoke_2_35;
  v4[3] = &unk_1E2ABE210;
  v7 = a2;
  v3 = *(NSObject **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  dispatch_async(v3, v4);

}

void __88__PKSubcredentialProvisioningSendInvitationOperation_sendInvitationWithAuth_completion___block_invoke_2_35(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0x16uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(a1 + 56))
      v3 = "";
    else
      v3 = "un";
    v8 = 136315138;
    v9 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Invitation receipt added %ssuccessfully", (uint8_t *)&v8, 0xCu);
  }

  v4 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v5);

  objc_msgSend(*(id *)(a1 + 32), "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSentInvitation:", v4);

  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);

}

- (void)initializeAccountAttestationIfNecessaryWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  PKPaymentWebService *localDeviceWebService;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint8_t buf[8];
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[PKPaymentWebService targetDevice](self->_localDeviceWebService, "targetDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(0x16uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Checking if anonymization salt has been set...", buf, 2u);
  }

  localDeviceWebService = self->_localDeviceWebService;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __108__PKSubcredentialProvisioningSendInvitationOperation_initializeAccountAttestationIfNecessaryWithCompletion___block_invoke;
  v10[3] = &unk_1E2AC4B88;
  objc_copyWeak(&v13, &location);
  v8 = v4;
  v12 = v8;
  v9 = v5;
  v11 = v9;
  objc_msgSend(v9, "paymentWebService:accountAttestationAnonymizationSaltWithCompletion:", localDeviceWebService, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __108__PKSubcredentialProvisioningSendInvitationOperation_initializeAccountAttestationIfNecessaryWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
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
      v13 = WeakRetained[8];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __108__PKSubcredentialProvisioningSendInvitationOperation_initializeAccountAttestationIfNecessaryWithCompletion___block_invoke_43;
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

void __108__PKSubcredentialProvisioningSendInvitationOperation_initializeAccountAttestationIfNecessaryWithCompletion___block_invoke_43(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(0x16uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v8 = 138412290;
      v9 = v3;
      v6 = "Failed to set default salt: %@";
LABEL_6:
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0xCu);
    }
  }
  else if (v5)
  {
    v7 = *(void **)(a1 + 32);
    v8 = 138412290;
    v9 = v7;
    v6 = "Setting default salt to: %@";
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3);
}

- (id)userAuthDelegate
{
  void *v2;
  void *v3;
  void *v4;

  -[PKSubcredentialProvisioningOperation configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteDeviceConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "userAuthDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  id v6;
  _BOOL4 v7;
  id v8;

  v6 = a3;
  if (a4 == 2)
  {
    v8 = v6;
    v7 = -[PKSubcredentialProvisioningOperation isInProgress](self, "isInProgress");
    v6 = v8;
    if (v7)
    {
      -[PKSubcredentialProvisioningSendInvitationOperation sendInvitation](self, "sendInvitation");
      goto LABEL_7;
    }
  }
  else if (a4 == 3 && !self->_hasFinished)
  {
    v8 = v6;
    -[PKSubcredentialProvisioningOperation failWithErrorCode:description:](self, "failWithErrorCode:description:", 1, CFSTR("Session was invalidated unexpectedly"));
LABEL_7:
    v6 = v8;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationReceipt, 0);
  objc_storeStrong((id *)&self->_remoteDeviceWebService, 0);
  objc_storeStrong((id *)&self->_localDeviceWebService, 0);
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_storeStrong((id *)&self->_sharingRequest, 0);
}

@end
