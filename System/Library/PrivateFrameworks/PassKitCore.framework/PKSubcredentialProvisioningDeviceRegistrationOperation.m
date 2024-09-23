@implementation PKSubcredentialProvisioningDeviceRegistrationOperation

- (PKSubcredentialProvisioningDeviceRegistrationOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5
{
  PKSubcredentialProvisioningDeviceRegistrationOperation *v5;
  PKSubcredentialProvisioningDeviceRegistrationOperation *v6;
  void *v7;
  void *v8;
  PKPaymentProvisioningController *v9;
  void *v10;
  uint64_t v11;
  PKPaymentProvisioningController *provisioningController;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKSubcredentialProvisioningDeviceRegistrationOperation;
  v5 = -[PKSubcredentialProvisioningOperation initWithConfiguration:context:delegate:](&v14, sel_initWithConfiguration_context_delegate_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[PKSubcredentialProvisioningOperation configuration](v5, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localDeviceConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = [PKPaymentProvisioningController alloc];
    objc_msgSend(v8, "webService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PKPaymentProvisioningController initWithWebService:](v9, "initWithWebService:", v10);
    provisioningController = v6->_provisioningController;
    v6->_provisioningController = (PKPaymentProvisioningController *)v11;

  }
  return v6;
}

- (void)performOperation
{
  NSObject *v3;
  PKPaymentProvisioningController *provisioningController;
  _QWORD v5[5];
  uint8_t buf[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKSubcredentialProvisioningDeviceRegistrationOperation;
  -[PKSubcredentialProvisioningOperation performOperation](&v7, sel_performOperation);
  PKLogFacilityTypeGetObject(0x16uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Performing device registration", buf, 2u);
  }

  provisioningController = self->_provisioningController;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__PKSubcredentialProvisioningDeviceRegistrationOperation_performOperation__block_invoke;
  v5[3] = &unk_1E2AC2F80;
  v5[4] = self;
  -[PKPaymentProvisioningController validatePreconditionsAndRegister:](provisioningController, "validatePreconditionsAndRegister:", v5);
}

void __74__PKSubcredentialProvisioningDeviceRegistrationOperation_performOperation__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD block[5];
  id v11;
  char v12;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "operationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PKSubcredentialProvisioningDeviceRegistrationOperation_performOperation__block_invoke_2;
  block[3] = &unk_1E2AC2F58;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = a2;
  block[4] = v8;
  v11 = v5;
  v9 = v5;
  dispatch_async(v7, block);

}

void __74__PKSubcredentialProvisioningDeviceRegistrationOperation_performOperation__block_invoke_2(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(_BYTE **)(a1 + 32);
  if (!v2[48])
  {
    if (!*(_BYTE *)(a1 + 48) || *(_QWORD *)(a1 + 40))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Registration failed with status: preconditionsVerified %d"), *(unsigned __int8 *)(a1 + 48));
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "failWithErrorCode:description:underlyingError:", 6, v6, *(_QWORD *)(a1 + 40));
LABEL_10:

      return;
    }
    objc_msgSend(v2, "configuration");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ownerConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = 5;
    }
    else
    {
      objc_msgSend(v6, "acceptInvitationConfiguration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
        goto LABEL_10;
      v4 = 3;
    }
    objc_msgSend(*(id *)(a1 + 32), "advanceToState:", v4);
    goto LABEL_10;
  }
}

- (BOOL)canCancelOperation
{
  return 1;
}

- (void)cancelOperation
{
  id v3;

  self->_operationCancelled = 1;
  -[PKSubcredentialProvisioningOperation delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "operationWasCanceled:", self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningController, 0);
}

@end
