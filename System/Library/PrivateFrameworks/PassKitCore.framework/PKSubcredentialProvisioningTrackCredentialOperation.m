@implementation PKSubcredentialProvisioningTrackCredentialOperation

- (PKSubcredentialProvisioningTrackCredentialOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5
{
  id v8;
  PKSubcredentialProvisioningTrackCredentialOperation *v9;
  uint64_t v10;
  NSData *trackingAttestation;
  uint64_t v12;
  PKAppletSubcredential *subcredential;
  PKSubcredentialProvisioningTrackCredentialOperation *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  const char *v18;
  objc_class *v19;
  objc_super v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PKSubcredentialProvisioningTrackCredentialOperation;
  v9 = -[PKSubcredentialProvisioningPairingSessionOperation initWithConfiguration:context:delegate:](&v21, sel_initWithConfiguration_context_delegate_, a3, v8, a5);
  if (!v9)
    goto LABEL_4;
  objc_msgSend(v8, "trackingAttestation");
  v10 = objc_claimAutoreleasedReturnValue();
  trackingAttestation = v9->_trackingAttestation;
  v9->_trackingAttestation = (NSData *)v10;

  if (!v9->_trackingAttestation)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v17;
      v18 = "Missing tracking attestation in %@!";
LABEL_9:
      _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);

    }
LABEL_10:

    v14 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v8, "addedCredential");
  v12 = objc_claimAutoreleasedReturnValue();
  subcredential = v9->_subcredential;
  v9->_subcredential = (PKAppletSubcredential *)v12;

  if (!v9->_subcredential)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v17;
      v18 = "Missing subcredential in %@!";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
LABEL_4:
  v14 = v9;
LABEL_11:

  return v14;
}

- (void)performOperation
{
  _QWORD v3[4];
  id v4;
  id location;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKSubcredentialProvisioningTrackCredentialOperation;
  -[PKSubcredentialProvisioningOperation performOperation](&v6, sel_performOperation);
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __71__PKSubcredentialProvisioningTrackCredentialOperation_performOperation__block_invoke;
  v3[3] = &unk_1E2AC7848;
  objc_copyWeak(&v4, &location);
  -[PKSubcredentialProvisioningTrackCredentialOperation performOperationWithCompletion:](self, "performOperationWithCompletion:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __71__PKSubcredentialProvisioningTrackCredentialOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (v5)
    objc_msgSend(WeakRetained, "failWithError:", v5);
  else
    objc_msgSend(WeakRetained, "advanceToState:", 16);

}

- (void)performOperationWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  uint64_t v7;
  void *v8;
  id completionHandler;
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint8_t v16[8];
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))v4;
  if (!self->_performingOperation)
  {
    self->_performingOperation = 1;
    -[PKSubcredentialProvisioningPairingSessionOperation pairingSession](self, "pairingSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "state");
    v8 = _Block_copy(v5);
    completionHandler = self->_completionHandler;
    self->_completionHandler = v8;

    if (v7 == 3)
    {
      v10 = (void (**)(id, void *))self->_completionHandler;
      if (v10)
      {
        v11 = (void *)MEMORY[0x1E0CB35C8];
        v17 = *MEMORY[0x1E0CB2938];
        v18[0] = CFSTR("Session was invalidated");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("PKSubcredentialProvisioningErrorDomain"), 1, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v10[2](v10, v13);

        v14 = self->_completionHandler;
      }
      else
      {
        v14 = 0;
      }
      self->_completionHandler = 0;

    }
    else if (v7 == 2)
    {
      -[PKSubcredentialProvisioningTrackCredentialOperation trackCredentialWithAttestation](self, "trackCredentialWithAttestation");
    }
    else
    {
      PKLogFacilityTypeGetObject(0x16uLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Waiting for session to become active...", v16, 2u);
      }

    }
    goto LABEL_14;
  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKSubcredentialProvisioningErrorDomain"), 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v6);
LABEL_14:

  }
}

- (void)trackCredentialWithAttestation
{
  void *v3;
  void *v4;
  PKAppletSubcredential *subcredential;
  void *v6;
  void *v7;
  NSObject *v8;
  PKAppletSubcredential *v9;
  void (**completionHandler)(id, void *);
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[2];
  _QWORD v17[2];
  uint8_t buf[4];
  PKAppletSubcredential *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[PKSubcredentialProvisioningOperation context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSubcredentialProvisioningPairingSessionOperation pairingSession](self, "pairingSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  subcredential = self->_subcredential;
  objc_msgSend(v3, "vehicleMobilizationEncryptedContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trackSubcredential:encryptedContainer:withReceipt:", subcredential, v6, self->_trackingAttestation);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_subcredential;
      *(_DWORD *)buf = 138412546;
      v19 = v9;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Pairing session failed to track credential %@: %@", buf, 0x16u);
    }

    completionHandler = (void (**)(id, void *))self->_completionHandler;
    if (completionHandler)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0CB3388];
      v16[0] = *MEMORY[0x1E0CB2938];
      v16[1] = v12;
      v17[0] = CFSTR("Failed to track the credential");
      v17[1] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("PKSubcredentialProvisioningErrorDomain"), 9, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      completionHandler[2](completionHandler, v14);

      v15 = self->_completionHandler;
    }
    else
    {
      v15 = 0;
    }
    self->_completionHandler = 0;

  }
  else
  {
    self->_hasTrackedCredential = 1;
  }

}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  id v6;
  void (**completionHandler)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self->_performingOperation)
  {
    if (a4 == 2)
    {
      -[PKSubcredentialProvisioningTrackCredentialOperation trackCredentialWithAttestation](self, "trackCredentialWithAttestation");
    }
    else if (a4 == 3 && !self->_firstTransactionCompleted)
    {
      completionHandler = (void (**)(id, void *))self->_completionHandler;
      if (completionHandler)
      {
        v8 = (void *)MEMORY[0x1E0CB35C8];
        v12 = *MEMORY[0x1E0CB2938];
        v13[0] = CFSTR("Session was invalidated unexpectedly");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("PKSubcredentialProvisioningErrorDomain"), 1, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        completionHandler[2](completionHandler, v10);

        v11 = self->_completionHandler;
      }
      else
      {
        v11 = 0;
      }
      self->_completionHandler = 0;

    }
  }

}

- (void)appletSubcredentialPairingSessionDidFirstTransaction:(id)a3 withError:(id)a4
{
  id v6;
  PKAppletSubcredential *v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  PKAppletSubcredential *subcredential;
  void (**completionHandler)(id, _QWORD);
  id v15;
  int v16;
  PKAppletSubcredential *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (PKAppletSubcredential *)a4;
  self->_firstTransactionCompleted = 1;
  if (self->_hasTrackedCredential)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v9)
        goto LABEL_11;
      v16 = 138412290;
      v17 = v7;
      v10 = "First transaction failed with error: %@";
    }
    else
    {
      if (!v9)
        goto LABEL_11;
      subcredential = self->_subcredential;
      v16 = 138412290;
      v17 = subcredential;
      v10 = "First transaction completed with credential %@";
    }
    v11 = v8;
    v12 = 12;
  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    LOWORD(v16) = 0;
    v10 = "First transaction completed without tracking the credential";
    v11 = v8;
    v12 = 2;
  }
  _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v16, v12);
LABEL_11:

  objc_msgSend(v6, "endSession");
  completionHandler = (void (**)(id, _QWORD))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, 0);
    v15 = self->_completionHandler;
  }
  else
  {
    v15 = 0;
  }
  self->_completionHandler = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_trackingAttestation, 0);
  objc_storeStrong((id *)&self->_subcredential, 0);
}

@end
