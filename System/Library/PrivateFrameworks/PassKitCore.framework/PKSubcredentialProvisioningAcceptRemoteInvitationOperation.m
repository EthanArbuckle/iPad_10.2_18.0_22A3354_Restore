@implementation PKSubcredentialProvisioningAcceptRemoteInvitationOperation

+ (BOOL)canDeviceAcceptInvitation:(id)a3
{
  id v3;
  BOOL v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    NSStringFromSelector(sel_paymentWebService_canAcceptInvitation_withCompletionV2_);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v6;
LABEL_18:
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Device doesn't support %@", (uint8_t *)&v9, 0xCu);
    goto LABEL_19;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    NSStringFromSelector(sel_deviceIDSIdentifier);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v6;
    goto LABEL_18;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_paymentWebService_acceptSubcredentialInvitationWithIdentifier_metadata_completion_);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_paymentWebService_acceptSubcredentialInvitation_completion_);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Device doesn't support %@ or %@", (uint8_t *)&v9, 0x16u);

LABEL_19:
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    NSStringFromSelector(sel_paymentWebService_matchingInvitationOnDevice_withTimeout_completion_);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v6;
    goto LABEL_18;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_paymentWebService_subcredentialInvitationsWithCompletion_);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v6;
      goto LABEL_18;
    }
LABEL_20:

    v4 = 0;
    goto LABEL_21;
  }
  v4 = 1;
LABEL_21:

  return v4;
}

- (PKSubcredentialProvisioningAcceptRemoteInvitationOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  PKSubcredentialProvisioningAcceptRemoteInvitationOperation *v10;
  void *v11;
  uint64_t v12;
  PKPaymentWebService *localDeviceWebService;
  uint64_t v14;
  PKPaymentWebService *remoteDeviceWebService;
  uint64_t v16;
  PKPaymentWebServiceTargetDeviceProtocol *remoteTargetDevice;
  uint64_t v18;
  PKPaymentWebServiceTargetDeviceProtocol *localTargetDevice;
  void *v20;
  void *v21;
  PKSubcredentialProvisioningAcceptRemoteInvitationOperation *v22;
  NSObject *v23;
  const char *v24;
  uint8_t v26[16];
  objc_super v27;

  v8 = a3;
  v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)PKSubcredentialProvisioningAcceptRemoteInvitationOperation;
  v10 = -[PKSubcredentialProvisioningOperation initWithConfiguration:context:delegate:](&v27, sel_initWithConfiguration_context_delegate_, v8, v9, a5);
  if (!v10)
    goto LABEL_10;
  objc_msgSend(v8, "remoteDeviceInvitation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localDeviceWebService");
  v12 = objc_claimAutoreleasedReturnValue();
  localDeviceWebService = v10->_localDeviceWebService;
  v10->_localDeviceWebService = (PKPaymentWebService *)v12;

  objc_msgSend(v11, "remoteDeviceWebService");
  v14 = objc_claimAutoreleasedReturnValue();
  remoteDeviceWebService = v10->_remoteDeviceWebService;
  v10->_remoteDeviceWebService = (PKPaymentWebService *)v14;

  -[PKPaymentWebService targetDevice](v10->_remoteDeviceWebService, "targetDevice");
  v16 = objc_claimAutoreleasedReturnValue();
  remoteTargetDevice = v10->_remoteTargetDevice;
  v10->_remoteTargetDevice = (PKPaymentWebServiceTargetDeviceProtocol *)v16;

  -[PKPaymentWebService targetDevice](v10->_localDeviceWebService, "targetDevice");
  v18 = objc_claimAutoreleasedReturnValue();
  localTargetDevice = v10->_localTargetDevice;
  v10->_localTargetDevice = (PKPaymentWebServiceTargetDeviceProtocol *)v18;

  objc_msgSend(v9, "sentInvitation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (!v20)
  {
    objc_msgSend(v11, "invitation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)&v10->_invitation, v21);
  if (!v20)

  if (!v10->_invitation)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    *(_WORD *)v26 = 0;
    v24 = "No invitation to accept";
LABEL_17:
    _os_log_impl(&dword_18FC92000, v23, OS_LOG_TYPE_DEFAULT, v24, v26, 2u);
    goto LABEL_18;
  }
  if (!v10->_localTargetDevice)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    *(_WORD *)v26 = 0;
    v24 = "Missing local target device";
    goto LABEL_17;
  }
  if (!v10->_remoteTargetDevice)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      v24 = "No remote target device to accept invitation on";
      goto LABEL_17;
    }
LABEL_18:

    v22 = 0;
    goto LABEL_19;
  }

LABEL_10:
  v22 = v10;
LABEL_19:

  return v22;
}

- (void)performOperation
{
  unint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKSubcredentialProvisioningAcceptRemoteInvitationOperation;
  -[PKSubcredentialProvisioningOperation performOperation](&v4, sel_performOperation);
  if ((objc_msgSend((id)objc_opt_class(), "canDeviceAcceptInvitation:", self->_remoteTargetDevice) & 1) != 0)
  {
    v3 = -[PKAppletSubcredentialSharingInvitation type](self->_invitation, "type");
    if (v3 == 1)
    {
      -[PKSubcredentialProvisioningAcceptRemoteInvitationOperation acceptCrossPlatformInvitation](self, "acceptCrossPlatformInvitation");
    }
    else if (!v3)
    {
      -[PKSubcredentialProvisioningAcceptRemoteInvitationOperation acceptIDSInvitation](self, "acceptIDSInvitation");
    }
  }
  else
  {
    -[PKSubcredentialProvisioningOperation failWithErrorCode:description:](self, "failWithErrorCode:description:", 21, CFSTR("Remote device not supported"));
  }
}

- (void)acceptIDSInvitation
{
  void *v3;
  void *v4;
  PKAppletSubcredentialSharingInvitation *invitation;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  -[PKSubcredentialProvisioningOperation context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "operationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  invitation = self->_invitation;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptIDSInvitation__block_invoke;
  v7[3] = &unk_1E2ABEA70;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  -[PKSubcredentialProvisioningAcceptRemoteInvitationOperation canAcceptInvitation:withCompletion:](self, "canAcceptInvitation:withCompletion:", invitation, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __81__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptIDSInvitation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (!v3)
    {
LABEL_8:
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __81__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptIDSInvitation__block_invoke_23;
      v12[3] = &unk_1E2ABEA48;
      objc_copyWeak(&v14, (id *)(a1 + 48));
      v13 = *(id *)(a1 + 40);
      objc_msgSend(WeakRetained, "metadataForInvitation:withCompletion:", v9, v12);

      objc_destroyWeak(&v14);
      goto LABEL_13;
    }
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("PKSubcredentialProvisioningErrorDomain")))
    {
      v6 = objc_msgSend(v3, "code");

      if (v6 == 15)
      {
        PKLogFacilityTypeGetObject(0x16uLL);
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
          *(_DWORD *)buf = 138412290;
          v16 = v8;
          _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "The remote device supports accepting invitations like %@, but no matching invite was found. We'll try to wait for a matching invite to arrive.", buf, 0xCu);
        }

        goto LABEL_8;
      }
    }
    else
    {

    }
    PKLogFacilityTypeGetObject(0x16uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
      *(_DWORD *)buf = 138412546;
      v16 = v11;
      v17 = 2112;
      v18 = v3;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Remote device does not support accepting invitation: %@. Error: %@", buf, 0x16u);
    }

    objc_msgSend(WeakRetained, "failWithError:", v3);
  }
LABEL_13:

}

void __81__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptIDSInvitation__block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      v6 = WeakRetained[9];
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __81__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptIDSInvitation__block_invoke_2;
      v7[3] = &unk_1E2ABEA20;
      objc_copyWeak(&v10, (id *)(a1 + 40));
      v8 = v3;
      v9 = *(id *)(a1 + 32);
      objc_msgSend(v5, "getMatchingInvitation:withCompletion:", v6, v7);

      objc_destroyWeak(&v10);
    }
    else
    {
      objc_msgSend(WeakRetained, "failWithErrorCode:description:", 12, CFSTR("Unable to get metadata for invitation"));
    }
  }

}

void __81__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptIDSInvitation__block_invoke_2(id *a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        *(_DWORD *)buf = 138412290;
        v15 = v3;
        _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Found matching invitation already on device: %@", buf, 0xCu);
      }

      objc_msgSend(WeakRetained, "acceptInvitation:withMetadata:", v3, a1[4]);
    }
    else
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "No invitation found on device, waiting to see if one comes in", buf, 2u);
      }

      v7 = (void *)WeakRetained[7];
      v8 = WeakRetained[5];
      v9 = WeakRetained[9];
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __81__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptIDSInvitation__block_invoke_24;
      v10[3] = &unk_1E2ABE9F8;
      v11 = a1[5];
      objc_copyWeak(&v13, a1 + 6);
      v12 = a1[4];
      objc_msgSend(v7, "paymentWebService:matchingInvitationOnDevice:withTimeout:completion:", v8, v9, 60, v10);

      objc_destroyWeak(&v13);
    }
  }

}

void __81__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptIDSInvitation__block_invoke_24(uint64_t a1, void *a2, void *a3)
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
  v10[2] = __81__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptIDSInvitation__block_invoke_2_25;
  v10[3] = &unk_1E2ABE9D0;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_copyWeak(&v14, (id *)(a1 + 48));
  v13 = *(id *)(a1 + 40);
  dispatch_async(v7, v10);

  objc_destroyWeak(&v14);
}

void __81__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptIDSInvitation__block_invoke_2_25(uint64_t a1)
{
  id WeakRetained;

  if (*(_QWORD *)(a1 + 32) && !*(_QWORD *)(a1 + 40))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "acceptInvitation:withMetadata:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "failWithErrorCode:description:", 15, CFSTR("No matching invitation found"));
  }

}

- (void)acceptCrossPlatformInvitation
{
  PKAsyncUnaryOperationComposer *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[6];
  id v8;
  _QWORD v9[6];
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[6];
  id v14;
  _QWORD v15[7];
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__0;
  v18[4] = __Block_byref_object_dispose__0;
  v19 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__0;
  v16[4] = __Block_byref_object_dispose__0;
  v17 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptCrossPlatformInvitation__block_invoke;
  v15[3] = &unk_1E2ABEAC0;
  v15[4] = self;
  v15[5] = v16;
  v15[6] = v18;
  -[PKAsyncUnaryOperationComposer addOperation:](v3, "addOperation:", v15);
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __91__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptCrossPlatformInvitation__block_invoke_37;
  v13[3] = &unk_1E2ABEB10;
  objc_copyWeak(&v14, &location);
  v13[4] = v16;
  v13[5] = v18;
  -[PKAsyncUnaryOperationComposer addOperation:](v3, "addOperation:", v13);
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__0;
  v11[4] = __Block_byref_object_dispose__0;
  v12 = 0;
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __91__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptCrossPlatformInvitation__block_invoke_3;
  v9[3] = &unk_1E2ABEB10;
  objc_copyWeak(&v10, &location);
  v9[4] = v11;
  v9[5] = v18;
  -[PKAsyncUnaryOperationComposer addOperation:](v3, "addOperation:", v9);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __91__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptCrossPlatformInvitation__block_invoke_5;
  v7[3] = &unk_1E2ABEB60;
  v7[4] = v18;
  objc_copyWeak(&v8, &location);
  v7[5] = v11;
  v6 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v3, "evaluateWithInput:completion:", v5, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  _Block_object_dispose(v11, 8);

  objc_destroyWeak(&v14);
  _Block_object_dispose(v16, 8);

  _Block_object_dispose(v18, 8);
  objc_destroyWeak(&location);
}

void __91__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptCrossPlatformInvitation__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
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
  __int128 v16;

  v6 = a3;
  v7 = a4;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 64);
  v10 = *(_QWORD *)(v8 + 48);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __91__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptCrossPlatformInvitation__block_invoke_2;
  v13[3] = &unk_1E2ABEA98;
  v16 = *(_OWORD *)(a1 + 40);
  v14 = v6;
  v15 = v7;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v9, "paymentWebService:accountAttestationAnonymizationSaltWithCompletion:", v10, v13);

}

void __91__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptCrossPlatformInvitation__block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 0;
  if (!v8)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v7;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Missing anonymization salt: %@", (uint8_t *)&v16, 0xCu);
    }

  }
  v10 = *(_QWORD *)(a1[6] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;
  v12 = v5;

  v13 = *(_QWORD *)(a1[7] + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v7;
  v15 = v7;

  (*(void (**)(void))(a1[5] + 16))();
}

void __91__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptCrossPlatformInvitation__block_invoke_37(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t *WeakRetained;
  uint64_t *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 48));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = (void *)WeakRetained[7];
    v11 = WeakRetained[5];
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __91__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptCrossPlatformInvitation__block_invoke_2_38;
    v14[3] = &unk_1E2ABEAE8;
    v17 = v12;
    v16 = v7;
    v15 = v6;
    objc_msgSend(v10, "paymentWebService:setAccountAttestationAnonymizationSalt:withCompletion:", v11, v13, v14);

  }
}

void __91__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptCrossPlatformInvitation__block_invoke_2_38(_QWORD *a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  v4 = a2;
  (*(void (**)(_QWORD, _QWORD, BOOL))(a1[5] + 16))(a1[5], a1[4], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) != 0);

}

void __91__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptCrossPlatformInvitation__block_invoke_3(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  __int128 v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)WeakRetained[7];
    v5 = v3[5];
    v6 = v3[9];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __91__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptCrossPlatformInvitation__block_invoke_4;
    v7[3] = &unk_1E2ABEB38;
    v8 = *(_OWORD *)(a1 + 32);
    objc_msgSend(v4, "paymentWebService:acceptSubcredentialInvitation:completion:", v5, v6, v7);
  }

}

void __91__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptCrossPlatformInvitation__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __91__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptCrossPlatformInvitation__block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id WeakRetained;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v8)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v8;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Failed to accept cross platform invitation with error: %@", (uint8_t *)&v11, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleAcceptInviteResponseWithPass:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

}

- (void)canAcceptInvitation:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  PKPaymentWebServiceTargetDeviceProtocol *remoteTargetDevice;
  PKPaymentWebService *remoteDeviceWebService;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[PKSubcredentialProvisioningOperation context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "operationQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    PKLogFacilityTypeGetObject(0x16uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Checking whether remote device can accept invitation: %@", buf, 0xCu);
    }

    remoteTargetDevice = self->_remoteTargetDevice;
    remoteDeviceWebService = self->_remoteDeviceWebService;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __97__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_canAcceptInvitation_withCompletion___block_invoke;
    v14[3] = &unk_1E2ABEB88;
    v15 = v9;
    v16 = v7;
    v13 = v9;
    -[PKPaymentWebServiceTargetDeviceProtocol paymentWebService:canAcceptInvitation:withCompletionV2:](remoteTargetDevice, "paymentWebService:canAcceptInvitation:withCompletionV2:", remoteDeviceWebService, v6, v14);

  }
}

void __97__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_canAcceptInvitation_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __97__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_canAcceptInvitation_withCompletion___block_invoke_2;
  v7[3] = &unk_1E2ABDA18;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __97__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_canAcceptInvitation_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)getMatchingInvitation:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  PKPaymentWebServiceTargetDeviceProtocol *remoteTargetDevice;
  PKPaymentWebService *remoteDeviceWebService;
  id v13;
  _QWORD v14[4];
  id v15;
  PKSubcredentialProvisioningAcceptRemoteInvitationOperation *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[PKSubcredentialProvisioningOperation context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "operationQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    PKLogFacilityTypeGetObject(0x16uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v6;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Examining invitations already on device for one matching: %@", buf, 0xCu);
    }

    remoteTargetDevice = self->_remoteTargetDevice;
    remoteDeviceWebService = self->_remoteDeviceWebService;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __99__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_getMatchingInvitation_withCompletion___block_invoke;
    v14[3] = &unk_1E2ABE698;
    v15 = v9;
    v16 = self;
    v17 = v7;
    v13 = v9;
    -[PKPaymentWebServiceTargetDeviceProtocol paymentWebService:subcredentialInvitationsWithCompletion:](remoteTargetDevice, "paymentWebService:subcredentialInvitationsWithCompletion:", remoteDeviceWebService, v14);

  }
}

void __99__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_getMatchingInvitation_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_getMatchingInvitation_withCompletion___block_invoke_2;
  block[3] = &unk_1E2ABE030;
  v5 = *(NSObject **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = *(id *)(a1 + 48);
  v6 = v3;
  dispatch_async(v5, block);

}

void __99__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_getMatchingInvitation_withCompletion___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
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
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "isSameInvitationAsInvitation:", v6, (_QWORD)v7))
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)metadataForInvitation:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  PKAppletSubcredentialSharingInvitationMetadata *v11;
  void *v12;
  void *v13;
  PKPaymentWebServiceTargetDeviceProtocol *localTargetDevice;
  PKPaymentWebService *localDeviceWebService;
  PKAppletSubcredentialSharingInvitationMetadata *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  PKAppletSubcredentialSharingInvitationMetadata *v20;
  id v21;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Creating invitation metadata...", buf, 2u);
    }

    -[PKSubcredentialProvisioningOperation context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "operationQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc_init(PKAppletSubcredentialSharingInvitationMetadata);
    -[PKSubcredentialProvisioningOperation configuration](self, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "remoteDeviceInvitation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAppletSubcredentialSharingInvitationMetadata setShouldRequestInvitation:](v11, "setShouldRequestInvitation:", objc_msgSend(v13, "canRequestInvitation"));

    localTargetDevice = self->_localTargetDevice;
    localDeviceWebService = self->_localDeviceWebService;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __99__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_metadataForInvitation_withCompletion___block_invoke;
    v18[3] = &unk_1E2ABEBB0;
    v19 = v10;
    v20 = v11;
    v21 = v7;
    v16 = v11;
    v17 = v10;
    -[PKPaymentWebServiceTargetDeviceProtocol paymentWebService:accountAttestationAnonymizationSaltWithCompletion:](localTargetDevice, "paymentWebService:accountAttestationAnonymizationSaltWithCompletion:", localDeviceWebService, v18);

  }
}

void __99__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_metadataForInvitation_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
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
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __99__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_metadataForInvitation_withCompletion___block_invoke_2;
  v10[3] = &unk_1E2ABE1E8;
  v11 = v5;
  v12 = v6;
  v7 = *(NSObject **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v14 = *(id *)(a1 + 48);
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

uint64_t __99__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_metadataForInvitation_withCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32) && !*(_QWORD *)(a1 + 40))
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Got anonymization salt", (uint8_t *)&v6, 2u);
    }

    objc_msgSend(*(id *)(a1 + 48), "setAnonymizationSalt:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 40);
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Missing anonymization salt: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)acceptInvitation:(id)a3 withMetadata:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  PKPaymentWebServiceTargetDeviceProtocol *remoteTargetDevice;
  PKPaymentWebService *remoteDeviceWebService;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject(0x16uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Accepting invitation: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  remoteTargetDevice = self->_remoteTargetDevice;
  remoteDeviceWebService = self->_remoteDeviceWebService;
  objc_msgSend(v6, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __92__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptInvitation_withMetadata___block_invoke;
  v12[3] = &unk_1E2ABEBD8;
  objc_copyWeak(&v13, (id *)buf);
  -[PKPaymentWebServiceTargetDeviceProtocol paymentWebService:acceptSubcredentialInvitationWithIdentifier:metadata:completion:](remoteTargetDevice, "paymentWebService:acceptSubcredentialInvitationWithIdentifier:metadata:completion:", remoteDeviceWebService, v11, v7, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);

}

void __92__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptInvitation_withMetadata___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_handleAcceptInviteResponseWithPass:error:", v6, v5);

}

- (void)_handleAcceptInviteResponseWithPass:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[PKSubcredentialProvisioningOperation context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "operationQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__PKSubcredentialProvisioningAcceptRemoteInvitationOperation__handleAcceptInviteResponseWithPass_error___block_invoke;
  block[3] = &unk_1E2ABE0F8;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

uint64_t __104__PKSubcredentialProvisioningAcceptRemoteInvitationOperation__handleAcceptInviteResponseWithPass_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHasAcceptedInvitation:", 1);

  v4 = *(void **)(a1 + 40);
  v3 = *(void **)(a1 + 48);
  if (v4)
    v5 = v3 == 0;
  else
    v5 = 0;
  if (v5)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "uniqueID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v11;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Invitation accepted successfully adding pass %@", (uint8_t *)&v13, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "operation:addedPass:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    return objc_msgSend(*(id *)(a1 + 32), "advanceToState:", 16);
  }
  else
  {
    objc_msgSend(v3, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("PKSubcredentialProvisioningErrorDomain"));

    v8 = *(void **)(a1 + 32);
    if (v7)
      return objc_msgSend(v8, "failWithError:", *(_QWORD *)(a1 + 48));
    else
      return objc_msgSend(v8, "failWithErrorCode:description:underlyingError:", 16, CFSTR("Failed to accept invitation"), *(_QWORD *)(a1 + 48));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_storeStrong((id *)&self->_localTargetDevice, 0);
  objc_storeStrong((id *)&self->_remoteTargetDevice, 0);
  objc_storeStrong((id *)&self->_localDeviceWebService, 0);
  objc_storeStrong((id *)&self->_remoteDeviceWebService, 0);
}

@end
