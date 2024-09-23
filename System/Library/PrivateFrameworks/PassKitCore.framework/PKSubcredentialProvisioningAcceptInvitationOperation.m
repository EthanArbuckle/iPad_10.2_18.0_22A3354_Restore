@implementation PKSubcredentialProvisioningAcceptInvitationOperation

- (void)performOperation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  NSObject *v10;
  uint8_t v11[16];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKSubcredentialProvisioningAcceptInvitationOperation;
  -[PKSubcredentialProvisioningOperation performOperation](&v12, sel_performOperation);
  -[PKSubcredentialProvisioningOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "acceptInvitationConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "invitation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");
  if (v6 == 1)
  {
    -[PKSubcredentialProvisioningAcceptInvitationOperation acceptCrossPlatformInvitation](self, "acceptCrossPlatformInvitation");
  }
  else if (!v6)
  {
    -[PKSubcredentialProvisioningSharingSessionOperation sharingSession](self, "sharingSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "state");
    if (v8)
    {
      if (v8 != 3)
      {
        if (v8 == 2)
        {
          -[PKSubcredentialProvisioningAcceptInvitationOperation acceptIDSInvitation](self, "acceptIDSInvitation");
        }
        else
        {
          PKLogFacilityTypeGetObject(0x16uLL);
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v11 = 0;
            _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Waiting for session to become active...", v11, 2u);
          }

        }
        goto LABEL_15;
      }
      v9 = CFSTR("Session was invalidated");
    }
    else
    {
      if ((objc_msgSend(v7, "startSession") & 1) != 0)
      {
LABEL_15:

        goto LABEL_16;
      }
      v9 = CFSTR("Unable to start session");
    }
    -[PKSubcredentialProvisioningOperation failWithErrorCode:description:](self, "failWithErrorCode:description:", 1, v9);
    goto LABEL_15;
  }
LABEL_16:

}

- (void)acceptIDSInvitation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  PKAsyncUnaryOperationComposer *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[6];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD *v23;
  _QWORD *v24;
  __int128 *v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD *v31;
  __int128 *v32;
  _QWORD *v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD *v39;
  __int128 *p_buf;
  _QWORD v41[5];
  id v42;
  id location;
  __int128 buf;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  -[PKSubcredentialProvisioningOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "acceptInvitationConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invitation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(0x16uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Accepting IDS invitation: %@", (uint8_t *)&buf, 0xCu);
  }

  objc_initWeak(&location, self);
  v8 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__74;
  v47 = __Block_byref_object_dispose__74;
  v48 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__74;
  v41[4] = __Block_byref_object_dispose__74;
  v42 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __75__PKSubcredentialProvisioningAcceptInvitationOperation_acceptIDSInvitation__block_invoke;
  v36[3] = &unk_1E2AC9D10;
  v10 = v5;
  v37 = v10;
  v11 = v6;
  v38 = v11;
  v39 = v41;
  p_buf = &buf;
  -[PKAsyncUnaryOperationComposer addOperation:](v8, "addOperation:", v36);
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__74;
  v34[4] = __Block_byref_object_dispose__74;
  v35 = 0;
  v28[0] = v9;
  v28[1] = 3221225472;
  v28[2] = __75__PKSubcredentialProvisioningAcceptInvitationOperation_acceptIDSInvitation__block_invoke_16;
  v28[3] = &unk_1E2AD9D08;
  v31 = v41;
  v12 = v11;
  v29 = v12;
  v13 = v4;
  v30 = v13;
  v32 = &buf;
  v33 = v34;
  -[PKAsyncUnaryOperationComposer addOperation:](v8, "addOperation:", v28);
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__74;
  v26[4] = __Block_byref_object_dispose__74;
  v27 = 0;
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __75__PKSubcredentialProvisioningAcceptInvitationOperation_acceptIDSInvitation__block_invoke_21;
  v20[3] = &unk_1E2AD9D08;
  v14 = v10;
  v21 = v14;
  v15 = v12;
  v22 = v15;
  v23 = v34;
  v24 = v26;
  v25 = &buf;
  -[PKAsyncUnaryOperationComposer addOperation:](v8, "addOperation:", v20);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __75__PKSubcredentialProvisioningAcceptInvitationOperation_acceptIDSInvitation__block_invoke_25;
  v18[3] = &unk_1E2ABEB60;
  v18[4] = &buf;
  objc_copyWeak(&v19, &location);
  v18[5] = v26;
  v17 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v8, "evaluateWithInput:completion:", v16, v18);

  objc_destroyWeak(&v19);
  _Block_object_dispose(v26, 8);

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v41, 8);

  _Block_object_dispose(&buf, 8);
  objc_destroyWeak(&location);

}

void __75__PKSubcredentialProvisioningAcceptInvitationOperation_acceptIDSInvitation__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  __int128 v16;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject(0x16uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Fetching PPID request from KML", buf, 2u);
  }

  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__PKSubcredentialProvisioningAcceptInvitationOperation_acceptIDSInvitation__block_invoke_11;
  v13[3] = &unk_1E2AC9CE8;
  v16 = *(_OWORD *)(a1 + 48);
  v14 = v6;
  v15 = v7;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v9, "getProductPlanIdentifierRequestForInvitationWithIdentifier:fromMailboxIdentifier:completion:", v10, 0, v13);

}

void __75__PKSubcredentialProvisioningAcceptInvitationOperation_acceptIDSInvitation__block_invoke_11(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  if (PKSharingForceErrorAfterKMLReturnsPPIDRequest())
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "PKSharingForceErrorAfterKMLReturnsPPIDRequest enabled", (uint8_t *)&v21, 2u);
    }

    PKSubcredentialProvisioningError(CFSTR("Forcing error"), v11, v12, v13, v14, v15, v16, v17, v21);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1[7] + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a3);
  }
  (*(void (**)(_QWORD, _QWORD, BOOL))(a1[5] + 16))(a1[5], a1[4], *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) != 0);

}

void __75__PKSubcredentialProvisioningAcceptInvitationOperation_acceptIDSInvitation__block_invoke_16(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  PKPaymentVehicleManufacturerRequest *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  __int128 v18;
  uint8_t buf[16];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  PKLogFacilityTypeGetObject(0x16uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Fetching PPID from broker", buf, 2u);
    }

    v13 = -[PKPaymentVehicleManufacturerRequest initWithInvitation:encryptedVehicleDataRequest:]([PKPaymentVehicleManufacturerRequest alloc], "initWithInvitation:encryptedVehicleDataRequest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    objc_msgSend(*(id *)(a1 + 40), "webService");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __75__PKSubcredentialProvisioningAcceptInvitationOperation_acceptIDSInvitation__block_invoke_18;
    v15[3] = &unk_1E2AD9CB8;
    v18 = *(_OWORD *)(a1 + 56);
    v17 = v9;
    v16 = v8;
    objc_msgSend(v14, "vehicleManufacturerWithRequest:withCompletion:", v13, v15);

  }
  else
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "No PPID request; skipping PPID fetch.", buf, 2u);
    }

    (*((void (**)(id, id, _QWORD))v9 + 2))(v9, v8, 0);
  }

}

void __75__PKSubcredentialProvisioningAcceptInvitationOperation_acceptIDSInvitation__block_invoke_18(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  PKSubcredentialEncryptedContainer *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void (*v27)(void);
  NSObject *v28;
  _BOOL4 v29;
  _BYTE v30[24];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (PKSharingForceErrorAfterBrokerReturnsVehicleManufacturerResponse())
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "PKSharingForceErrorAfterBrokerReturnsVehicleManufacturerResponse enabled", v30, 2u);
    }

    PKSubcredentialProvisioningError(CFSTR("Forcing error"), v8, v9, v10, v11, v12, v13, v14, *(uint64_t *)v30);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1[6] + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
  }
  v18 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  if (!v5 || v18)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v29)
      {
        *(_DWORD *)v30 = 138412290;
        *(_QWORD *)&v30[4] = v18;
        _os_log_impl(&dword_18FC92000, v28, OS_LOG_TYPE_DEFAULT, "Failed to fetch PPID from broker: %@", v30, 0xCu);
      }
    }
    else if (v29)
    {
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_18FC92000, v28, OS_LOG_TYPE_DEFAULT, "Broker returned empty PPID", v30, 2u);
    }

    v27 = *(void (**)(void))(a1[5] + 16);
  }
  else
  {
    v19 = [PKSubcredentialEncryptedContainer alloc];
    objc_msgSend(v5, "encryptionScheme");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ephemeralPublicKey");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "publicKeyHash");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "encryptedData");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[PKSubcredentialEncryptedContainer initWithEncryptionScheme:ephemeralPublicKey:publicKeyHash:data:](v19, "initWithEncryptionScheme:ephemeralPublicKey:publicKeyHash:data:", v20, v21, v22, v23);
    v25 = *(_QWORD *)(a1[7] + 8);
    v26 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = v24;

    v27 = *(void (**)(void))(a1[5] + 16);
  }
  v27();

}

void __75__PKSubcredentialProvisioningAcceptInvitationOperation_acceptIDSInvitation__block_invoke_21(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  __int128 v17;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject(0x16uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Accepting share", buf, 2u);
  }

  v9 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75__PKSubcredentialProvisioningAcceptInvitationOperation_acceptIDSInvitation__block_invoke_22;
  v14[3] = &unk_1E2AD9CE0;
  v17 = *(_OWORD *)(a1 + 56);
  v15 = v6;
  v16 = v7;
  v12 = v6;
  v13 = v7;
  objc_msgSend(v9, "acceptSharingInvitation:encryptedProductPlanIdentifierContainer:completion:", v10, v11, v14);

}

void __75__PKSubcredentialProvisioningAcceptInvitationOperation_acceptIDSInvitation__block_invoke_22(_QWORD *a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void (*v16)(void);
  NSObject *v17;
  uint64_t v18;
  uint8_t buf[16];

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  if (PKSharingForceErrorAfterKMLAcceptShare())
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "PKSharingForceErrorAfterKMLAcceptShare enabled", buf, 2u);
    }

    PKSubcredentialProvisioningError(CFSTR("Forcing error"), v6, v7, v8, v9, v10, v11, v12, v18);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1[7] + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    goto LABEL_6;
  }
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
LABEL_6:
    v16 = *(void (**)(void))(a1[5] + 16);
    goto LABEL_7;
  }
  PKLogFacilityTypeGetObject(0x16uLL);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "KML accept share failed with missing credential", (uint8_t *)&v18, 2u);
  }

  v16 = *(void (**)(void))(a1[5] + 16);
LABEL_7:
  v16();

}

void __75__PKSubcredentialProvisioningAcceptInvitationOperation_acceptIDSInvitation__block_invoke_25(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = v6;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) || (objc_msgSend(v6, "isCanceled") & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v9 = WeakRetained;
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v11 = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v9 = WeakRetained;
    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  objc_msgSend(WeakRetained, "_handleShareAcceptResultCredential:pass:error:", v11, 0, v10);

}

- (void)acceptCrossPlatformInvitation
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[PKSubcredentialProvisioningOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "acceptInvitationConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "invitation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(0x16uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v5;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Accepting cross platform invitation: %@", buf, 0xCu);
  }

  objc_msgSend(v4, "webService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "targetDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  objc_msgSend(v5, "originalInvitationMessage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activationCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __85__PKSubcredentialProvisioningAcceptInvitationOperation_acceptCrossPlatformInvitation__block_invoke;
  v13[3] = &unk_1E2AD9D58;
  v11 = v8;
  v14 = v11;
  v12 = v7;
  v15 = v12;
  objc_copyWeak(&v16, (id *)buf);
  objc_msgSend(v11, "acceptCarKeyShareForMessage:activationCode:completion:", v9, v10, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);

}

void __85__PKSubcredentialProvisioningAcceptInvitationOperation_acceptCrossPlatformInvitation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id WeakRetained;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "passUniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "paymentWebService:passWithUniqueID:", *(_QWORD *)(a1 + 40), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "secureElementPass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  v10 = PKTargetDeviceSupportsExpress(*(void **)(a1 + 32));
  if (v9 && v10)
  {
    v11 = *(void **)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v9, "paymentPass");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __85__PKSubcredentialProvisioningAcceptInvitationOperation_acceptCrossPlatformInvitation__block_invoke_2;
    v19[3] = &unk_1E2AD9D30;
    v20 = v9;
    objc_copyWeak(&v23, (id *)(a1 + 48));
    v21 = v5;
    v22 = v6;
    objc_msgSend(v11, "paymentWebService:handlePotentialExpressPass:withCompletionHandler:", v12, v13, v19);

    objc_destroyWeak(&v23);
    WeakRetained = v20;
  }
  else
  {
    if ((v10 & 1) == 0)
    {
      PKLogFacilityTypeGetObject(0x16uLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "uniqueID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v25 = v16;
        v26 = 2112;
        v27 = v17;
        _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Newly provisioned pass (%@) was not set as express as target device (%@) does not support express.", buf, 0x16u);

      }
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v5, "subcredential");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_handleShareAcceptResultCredential:pass:error:", v18, v9, v6);

  }
}

void __85__PKSubcredentialProvisioningAcceptInvitationOperation_acceptCrossPlatformInvitation__block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  id WeakRetained;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0x16uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    v6 = a2;
    objc_msgSend(v5, "uniqueID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "count");

    v9 = "";
    if (!v8)
      v9 = "not ";
    v12 = 138412546;
    v13 = v7;
    v14 = 2080;
    v15 = v9;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Newly provisioned pass (%@) was %sset as express", (uint8_t *)&v12, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "subcredential");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_handleShareAcceptResultCredential:pass:error:", v11, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

- (void)_handleShareAcceptResultCredential:(id)a3 pass:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  PKSubcredentialProvisioningAcceptInvitationOperation *v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PKSubcredentialProvisioningOperation context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "operationQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __102__PKSubcredentialProvisioningAcceptInvitationOperation__handleShareAcceptResultCredential_pass_error___block_invoke;
  v16[3] = &unk_1E2AC0F90;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v20 = self;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  dispatch_async(v12, v16);

}

void __102__PKSubcredentialProvisioningAcceptInvitationOperation__handleShareAcceptResultCredential_pass_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0x16uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "uniqueID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 48);
    v19 = 138412802;
    v20 = v3;
    v21 = 2112;
    v22 = v4;
    v23 = 2112;
    v24 = v5;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Invitation was accepted: %@ pass: %@, %@", (uint8_t *)&v19, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 56), "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "acceptInvitationConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "invitation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHasAcceptedInvitation:", 1);

  v10 = *(void **)(a1 + 56);
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v10, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAddedCredential:", *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 56), "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "operation:addedCredential:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));

    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 56), "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 40), "paymentPass");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "operation:addedPass:", v14, v15);

    }
    objc_msgSend(v7, "webService");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "targetDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "paymentWebService:removeSharingInvitation:withCompletion:", v16, v8, 0);

    if (*(_QWORD *)(a1 + 40))
      v18 = 16;
    else
      v18 = 9;
    objc_msgSend(*(id *)(a1 + 56), "advanceToState:", v18);

  }
  else
  {
    objc_msgSend(v10, "failWithErrorCode:description:underlyingError:", 16, CFSTR("Invitation didn't produce a credential"), *(_QWORD *)(a1 + 48));
  }

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
      -[PKSubcredentialProvisioningAcceptInvitationOperation acceptIDSInvitation](self, "acceptIDSInvitation");
      goto LABEL_6;
    }
  }
  else if (a4 == 3)
  {
    v8 = v6;
    -[PKSubcredentialProvisioningOperation failWithErrorCode:description:](self, "failWithErrorCode:description:", 1, CFSTR("Session was invalidated unexpectedly"));
LABEL_6:
    v6 = v8;
  }

}

@end
