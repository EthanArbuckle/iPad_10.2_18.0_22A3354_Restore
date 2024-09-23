@implementation PKSubcredentialProvisioningRegisteringCredentialOperation

- (PKSubcredentialProvisioningRegisteringCredentialOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5
{
  id v9;
  PKSubcredentialProvisioningRegisteringCredentialOperation *v10;
  PKSubcredentialProvisioningRegisteringCredentialOperation *v11;
  void *v12;
  uint64_t v13;
  PKAppletSubcredential *subcredential;
  PKSubcredentialProvisioningRegisteringCredentialOperation *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKSubcredentialProvisioningRegisteringCredentialOperation;
  v10 = -[PKSubcredentialProvisioningOperation initWithConfiguration:context:delegate:](&v20, sel_initWithConfiguration_context_delegate_, v9, a4, a5);
  v11 = v10;
  if (!v10)
    goto LABEL_3;
  -[PKSubcredentialProvisioningOperation context](v10, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addedCredential");
  v13 = objc_claimAutoreleasedReturnValue();
  subcredential = v11->_subcredential;
  v11->_subcredential = (PKAppletSubcredential *)v13;

  objc_storeStrong((id *)&v11->_configuration, a3);
  if (!v11->_subcredential)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v22 = v18;
      _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Missing subcredential in %@!", buf, 0xCu);

    }
    v15 = 0;
  }
  else
  {
LABEL_3:
    v15 = v11;
  }

  return v15;
}

- (BOOL)canBeRestarted
{
  return 1;
}

- (void)performOperation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKSubcredentialProvisioningRegisteringCredentialOperation;
  -[PKSubcredentialProvisioningOperation performOperation](&v3, sel_performOperation);
  if (-[PKSubcredentialProvisioningConfiguration configurationType](self->_configuration, "configurationType") == 1)
    -[PKSubcredentialProvisioningRegisteringCredentialOperation performOperationForFriendConfiguration](self, "performOperationForFriendConfiguration");
  else
    -[PKSubcredentialProvisioningRegisteringCredentialOperation performOperationWithSession:](self, "performOperationWithSession:", 0);
}

- (void)performOperationForFriendConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  NSObject *v8;
  uint8_t v9[16];

  -[PKSubcredentialProvisioningOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "acceptInvitationConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "state");
  switch(v6)
  {
    case 0:
      if ((objc_msgSend(v5, "startSession") & 1) != 0)
        break;
      v7 = CFSTR("Unable to start session");
LABEL_8:
      -[PKSubcredentialProvisioningOperation failWithErrorCode:description:](self, "failWithErrorCode:description:", 1, v7);
      break;
    case 3:
      v7 = CFSTR("Session was invalidated");
      goto LABEL_8;
    case 2:
      -[PKSubcredentialProvisioningRegisteringCredentialOperation performOperationWithSession:](self, "performOperationWithSession:", v5);
      break;
    default:
      PKLogFacilityTypeGetObject(0x16uLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Waiting for session to become active...", v9, 2u);
      }

      break;
  }

}

- (void)performOperationWithSession:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  NSObject *v7;
  PKAppletSubcredential *subcredential;
  const char *v9;
  PKAppletSubcredential *v10;
  int64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  NSObject *v29;
  id v30;
  PKAsyncUnaryOperationComposer *v31;
  _QWORD v32[4];
  id v33;
  uint8_t *v34;
  __int128 *v35;
  _BYTE *v36;
  id v37[2];
  BOOL v38;
  id location;
  _QWORD v40[4];
  id v41;
  PKSubcredentialProvisioningRegisteringCredentialOperation *v42;
  id v43;
  _BYTE *v44;
  uint8_t *v45;
  __int128 *v46;
  uint64_t v47;
  uint8_t v48[8];
  uint8_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  _QWORD v54[5];
  id v55;
  _BYTE *v56;
  __int128 *p_buf;
  _BYTE v58[24];
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  __int128 buf;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v4 = -[PKSubcredentialProvisioningRegisteringCredentialOperation credentialShouldHaveAttestation](self, "credentialShouldHaveAttestation");
  -[PKSubcredentialProvisioningOperation context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrationData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (v6)
      goto LABEL_10;
    PKLogFacilityTypeGetObject(0x16uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    subcredential = self->_subcredential;
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = subcredential;
    v9 = "Credential %@ is missing attestation";
    goto LABEL_8;
  }
  if (!v6)
    goto LABEL_10;
  PKLogFacilityTypeGetObject(0x16uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = self->_subcredential;
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v10;
    v9 = "Unexpected credential %@ with attestation";
LABEL_8:
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&buf, 0xCu);
  }
LABEL_9:

LABEL_10:
  v31 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__24;
  v65 = __Block_byref_object_dispose__24;
  v66 = 0;
  v11 = -[PKSubcredentialProvisioningConfiguration configurationType](self->_configuration, "configurationType");
  v12 = v11 != 0;
  if (v11)
  {
    if (v6)
    {
      v12 = 0;
      v13 = 2;
      goto LABEL_23;
    }
    if (v11 != 1)
    {
      v12 = 0;
      v13 = 1;
LABEL_23:
      PKLogFacilityTypeGetObject(0x16uLL);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v58 = 134217984;
        *(_QWORD *)&v58[4] = v13;
        _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, "Registration type is %ld", v58, 0xCu);
      }

      *(_QWORD *)v58 = 0;
      *(_QWORD *)&v58[8] = v58;
      *(_QWORD *)&v58[16] = 0x3032000000;
      v59 = __Block_byref_object_copy__24;
      v60 = __Block_byref_object_dispose__24;
      v61 = 0;
      v20 = MEMORY[0x1E0C809B0];
      if (v12)
      {
        if (!v30)
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v48 = 0;
            _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, "Session is nil", v48, 2u);
          }

          -[PKSubcredentialProvisioningOperation failWithErrorCode:description:](self, "failWithErrorCode:description:", 7, CFSTR("Session is nil"));
          goto LABEL_29;
        }
        v54[0] = MEMORY[0x1E0C809B0];
        v54[1] = 3221225472;
        v54[2] = __89__PKSubcredentialProvisioningRegisteringCredentialOperation_performOperationWithSession___block_invoke;
        v54[3] = &unk_1E2AC9D10;
        v54[4] = self;
        v55 = v30;
        v56 = v58;
        p_buf = &buf;
        -[PKAsyncUnaryOperationComposer addOperation:](v31, "addOperation:", v54);

      }
      *(_QWORD *)v48 = 0;
      v49 = v48;
      v50 = 0x3032000000;
      v51 = __Block_byref_object_copy__24;
      v52 = __Block_byref_object_dispose__24;
      v53 = 0;
      -[PKSubcredentialProvisioningOperation configuration](self, "configuration");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localDeviceConfiguration");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v40[0] = v20;
      v40[1] = 3221225472;
      v40[2] = __89__PKSubcredentialProvisioningRegisteringCredentialOperation_performOperationWithSession___block_invoke_24;
      v40[3] = &unk_1E2AC9D60;
      v44 = v58;
      v47 = v13;
      v23 = v22;
      v41 = v23;
      v42 = self;
      v43 = v6;
      v45 = v48;
      v46 = &buf;
      -[PKAsyncUnaryOperationComposer addOperation:](v31, "addOperation:", v40);
      -[PKSubcredentialProvisioningOperation context](self, "context");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "operationQueue");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v20;
      v32[1] = 3221225472;
      v32[2] = __89__PKSubcredentialProvisioningRegisteringCredentialOperation_performOperationWithSession___block_invoke_30;
      v32[3] = &unk_1E2AC9DB0;
      v27 = v25;
      v33 = v27;
      objc_copyWeak(v37, &location);
      v34 = v48;
      v35 = &buf;
      v38 = v6 != 0;
      v37[1] = (id)v13;
      v36 = v58;
      v28 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v31, "evaluateWithInput:completion:", v26, v32);

      objc_destroyWeak(v37);
      objc_destroyWeak(&location);

      _Block_object_dispose(v48, 8);
LABEL_29:
      _Block_object_dispose(v58, 8);

      goto LABEL_30;
    }
    -[PKSubcredentialProvisioningOperation configuration](self, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "acceptInvitationConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "invitation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v13 = 0;
      goto LABEL_18;
    }
    PKLogFacilityTypeGetObject(0x16uLL);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v58 = 138412290;
      *(_QWORD *)&v58[4] = v14;
      _os_log_impl(&dword_18FC92000, v29, OS_LOG_TYPE_DEFAULT, "Invitation for configuration (%@) is nil", v58, 0xCu);
    }

    -[PKSubcredentialProvisioningOperation failWithErrorCode:description:](self, "failWithErrorCode:description:", 7, CFSTR("Invitation is nil"));
  }
  else
  {
    -[PKAppletSubcredential brandIdentifier](self->_subcredential, "brandIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSubcredentialProvisioningConfiguration ownerConfiguration](self->_configuration, "ownerConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "issuerIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v14, "isEqualToString:", v16) & 1) != 0)
    {
      v13 = 2;
LABEL_18:

      goto LABEL_23;
    }
    PKLogFacilityTypeGetObject(0x16uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v58 = 138412546;
      *(_QWORD *)&v58[4] = v14;
      *(_WORD *)&v58[12] = 2112;
      *(_QWORD *)&v58[14] = v16;
      _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "Credential brand: %@ does not match requested issuerIdentifier: %@", v58, 0x16u);
    }

    -[PKSubcredentialProvisioningOperation failWithErrorCode:description:](self, "failWithErrorCode:description:", 25, CFSTR("Credential brand doesn't match issuerIdentifier"));
  }
LABEL_30:
  _Block_object_dispose(&buf, 8);

}

void __89__PKSubcredentialProvisioningRegisteringCredentialOperation_performOperationWithSession___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  __int128 v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(0x16uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v8;
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Fetching pretrack request for key identifier: %@", buf, 0xCu);
  }

  v10 = *(void **)(a1 + 40);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __89__PKSubcredentialProvisioningRegisteringCredentialOperation_performOperationWithSession___block_invoke_19;
  v13[3] = &unk_1E2AC9CE8;
  v16 = *(_OWORD *)(a1 + 48);
  v14 = v6;
  v15 = v7;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v10, "getPretrackRequestForKeyWithIdentifier:withCompletion:", v8, v13);

}

void __89__PKSubcredentialProvisioningRegisteringCredentialOperation_performOperationWithSession___block_invoke_19(_QWORD *a1, void *a2, void *a3)
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
  _BOOL8 v21;
  uint64_t v22;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  if (PKSharingForceErrorAfterKMLReturnsPreTrackRequest())
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "PKSharingForceErrorAfterKMLReturnsPreTrackRequest enabled", (uint8_t *)&v22, 2u);
    }

    PKSubcredentialProvisioningError(CFSTR("Forcing error"), v11, v12, v13, v14, v15, v16, v17, v22);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1[7] + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a3);
  }
  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
    v21 = 1;
  else
    v21 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) == 0;
  (*(void (**)(_QWORD, _QWORD, _BOOL8))(a1[5] + 16))(a1[5], a1[4], v21);

}

void __89__PKSubcredentialProvisioningRegisteringCredentialOperation_performOperationWithSession___block_invoke_24(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void (**v9)(id, id, uint64_t);
  void *v10;
  NSObject *v11;
  void *v12;
  PKPaymentRegisterPreTrackCredentialRequest *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  PKPaymentRegisterPreTrackCredentialRequest *v18;
  uint64_t v19;
  PKPaymentRegisterTrackCredentialRequest *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  _QWORD v24[4];
  id v25;
  void (**v26)(id, id, uint64_t);
  __int128 v27;
  uint8_t buf[16];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) || *(_QWORD *)(a1 + 80))
  {
    objc_msgSend(*(id *)(a1 + 32), "webService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    switch(*(_QWORD *)(a1 + 80))
    {
      case 0xFFFFFFFFFFFFFFFFLL:
        PKLogFacilityTypeGetObject(0x16uLL);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Missing Register Credential Request Type", buf, 2u);
        }

        v9[2](v9, v8, 1);
        goto LABEL_13;
      case 0:
        v13 = [PKPaymentRegisterPreTrackCredentialRequest alloc];
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40);
        v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        objc_msgSend(*(id *)(a1 + 32), "registrationMetadata");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[PKPaymentRegisterPreTrackCredentialRequest initWithCredential:encryptedVehicleDataRequest:metadata:](v13, "initWithCredential:encryptedVehicleDataRequest:metadata:", v14, v15, v16);
        goto LABEL_11;
      case 1:
        v18 = [PKPaymentRegisterPreTrackCredentialRequest alloc];
        v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40);
        objc_msgSend(*(id *)(a1 + 32), "registrationMetadata");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[PKPaymentRegisterPreTrackCredentialRequest initWithCredential:metadata:](v18, "initWithCredential:metadata:", v19, v16);
        goto LABEL_11;
      case 2:
        v20 = [PKPaymentRegisterTrackCredentialRequest alloc];
        v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40);
        v22 = *(_QWORD *)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 32), "registrationMetadata");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[PKPaymentRegisterTrackCredentialRequest initWithCredential:registrationData:metadata:](v20, "initWithCredential:registrationData:metadata:", v21, v22, v16);
LABEL_11:
        v12 = (void *)v17;

        break;
      default:
        v12 = 0;
        break;
    }
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __89__PKSubcredentialProvisioningRegisteringCredentialOperation_performOperationWithSession___block_invoke_27;
    v24[3] = &unk_1E2AC9D38;
    v27 = *(_OWORD *)(a1 + 64);
    v26 = v9;
    v25 = v8;
    objc_msgSend(v10, "registerCredentialWithRequest:withCompletion:", v12, v24);

LABEL_13:
  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v23, OS_LOG_TYPE_DEFAULT, "Missing required pre-track request", buf, 2u);
    }

    v9[2](v9, v8, 1);
  }

}

void __89__PKSubcredentialProvisioningRegisteringCredentialOperation_performOperationWithSession___block_invoke_27(_QWORD *a1, void *a2, void *a3)
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
  _BOOL8 v21;
  uint64_t v22;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  if (PKSharingForceErrorAfterBrokerReturnsRegisterCredentialResponse())
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "PKSharingForceErrorAfterBrokerReturnsRegisterCredentialResponse enabled", (uint8_t *)&v22, 2u);
    }

    PKSubcredentialProvisioningError(CFSTR("Forcing error"), v11, v12, v13, v14, v15, v16, v17, v22);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1[7] + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a3);
  }
  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
    v21 = 1;
  else
    v21 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) == 0;
  (*(void (**)(_QWORD, _QWORD, _BOOL8))(a1[5] + 16))(a1[5], a1[4], v21);

}

void __89__PKSubcredentialProvisioningRegisteringCredentialOperation_performOperationWithSession___block_invoke_30(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD block[4];
  id v11;
  __int128 v12;
  uint64_t v13;
  id v14[2];
  char v15;

  v5 = a4;
  v6 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__PKSubcredentialProvisioningRegisteringCredentialOperation_performOperationWithSession___block_invoke_2;
  block[3] = &unk_1E2AC9D88;
  objc_copyWeak(v14, (id *)(a1 + 64));
  v12 = *(_OWORD *)(a1 + 40);
  v11 = v5;
  v7 = *(void **)(a1 + 72);
  v15 = *(_BYTE *)(a1 + 80);
  v8 = *(_QWORD *)(a1 + 56);
  v14[1] = v7;
  v13 = v8;
  v9 = v5;
  dispatch_async(v6, block);

  objc_destroyWeak(v14);
}

void __89__PKSubcredentialProvisioningRegisteringCredentialOperation_performOperationWithSession___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint8_t v11[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained)
    goto LABEL_8;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
    && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
    && (objc_msgSend(*(id *)(a1 + 32), "isCanceled") & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "passURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (PKSharingForceNilPassURLInPreTrackResponse())
    {
      PKLogFacilityTypeGetObject(0x16uLL);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "PKSharingForceNilPassURLInPreTrackResponse enabled", v11, 2u);
      }

      if (*(_QWORD *)(a1 + 72) <= 1uLL)
      {

        v3 = 0;
      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "credentialAttestation");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v3)
    {
      if (!*(_BYTE *)(a1 + 80) || v5)
      {
        objc_msgSend(WeakRetained, "context");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setPassURL:", v3);
        objc_msgSend(v8, "setTrackingAttestation:", v6);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "vehicleMobilizationEncryptedContainer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setVehicleMobilizationEncryptedContainer:", v9);

        if (v6)
          v10 = 11;
        else
          v10 = 10;
        objc_msgSend(WeakRetained, "advanceToState:", v10);

        goto LABEL_25;
      }
      v7 = CFSTR("Missing attestation in register response!");
    }
    else
    {
      v7 = CFSTR("Missing pass url!");
    }
    objc_msgSend(WeakRetained, "failWithErrorCode:description:", 7, v7);
LABEL_25:

    goto LABEL_8;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) || *(_QWORD *)(a1 + 72))
    objc_msgSend(WeakRetained, "failWithErrorCode:description:underlyingError:", 7, CFSTR("Credential registration request failed"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  else
    objc_msgSend(WeakRetained, "failWithErrorCode:description:", 1, CFSTR("KML did not return a pretrack request when one was required"));
LABEL_8:

}

- (BOOL)credentialShouldHaveAttestation
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PKSubcredentialProvisioningOperation configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "acceptInvitationConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[PKSubcredentialProvisioningOperation isInProgress](self, "isInProgress"))
  {
    if (a4 == 2)
    {
      -[PKSubcredentialProvisioningRegisteringCredentialOperation performOperationWithSession:](self, "performOperationWithSession:", v6);
    }
    else if (a4 == 3)
    {
      -[PKSubcredentialProvisioningOperation failWithErrorCode:description:](self, "failWithErrorCode:description:", 1, CFSTR("Session was invalidated unexpectedly"));
    }
  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412546;
      v9 = v6;
      v10 = 2048;
      v11 = a4;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Session %@ state did change but we're not in progress: %lu", (uint8_t *)&v8, 0x16u);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_subcredential, 0);
}

@end
