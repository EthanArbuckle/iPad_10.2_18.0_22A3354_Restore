@implementation PKSubcredentialProvisioningAddPassOperation

- (PKSubcredentialProvisioningAddPassOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5
{
  id v8;
  PKSubcredentialProvisioningAddPassOperation *v9;
  uint64_t v10;
  PKPaymentPass *downloadedPass;
  uint64_t v12;
  PKAppletSubcredential *addedCredential;
  PKSubcredentialProvisioningAddPassOperation *v14;
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
  v21.super_class = (Class)PKSubcredentialProvisioningAddPassOperation;
  v9 = -[PKSubcredentialProvisioningOperation initWithConfiguration:context:delegate:](&v21, sel_initWithConfiguration_context_delegate_, a3, v8, a5);
  if (!v9)
    goto LABEL_4;
  objc_msgSend(v8, "downloadedPass");
  v10 = objc_claimAutoreleasedReturnValue();
  downloadedPass = v9->_downloadedPass;
  v9->_downloadedPass = (PKPaymentPass *)v10;

  objc_msgSend(v8, "addedCredential");
  v12 = objc_claimAutoreleasedReturnValue();
  addedCredential = v9->_addedCredential;
  v9->_addedCredential = (PKAppletSubcredential *)v12;

  if (!v9->_downloadedPass)
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
      v18 = "Missing downloaded pass in %@!";
LABEL_9:
      _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);

    }
LABEL_10:

    v14 = 0;
    goto LABEL_11;
  }
  if (!v9->_addedCredential)
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
      v18 = "Missing credential in %@!";
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
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKSubcredentialProvisioningAddPassOperation;
  -[PKSubcredentialProvisioningOperation performOperation](&v10, sel_performOperation);
  -[PKSubcredentialProvisioningOperation context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "operationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__PKSubcredentialProvisioningAddPassOperation_performOperation__block_invoke;
  v6[3] = &unk_1E2AC7578;
  v5 = v4;
  v7 = v5;
  objc_copyWeak(&v8, &location);
  -[PKSubcredentialProvisioningAddPassOperation performOperationWithCompletion:](self, "performOperationWithCompletion:", v6);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

void __63__PKSubcredentialProvisioningAddPassOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__PKSubcredentialProvisioningAddPassOperation_performOperation__block_invoke_2;
  v6[3] = &unk_1E2ABE7B0;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void __63__PKSubcredentialProvisioningAddPassOperation_performOperation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(WeakRetained, "failWithError:");
    }
    else
    {
      objc_msgSend(WeakRetained, "configuration");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "configurationType");

      if (v4 == 1)
        v5 = 4;
      else
        v5 = 16;
      objc_msgSend(v6, "advanceToState:", v5);
    }
    WeakRetained = v6;
  }

}

- (void)performOperationWithCompletion:(id)a3
{
  id v4;
  PKPaymentPass *v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  v5 = self->_downloadedPass;
  PKLogFacilityTypeGetObject(0x16uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[PKObject uniqueID](v5, "uniqueID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v7;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Adding pass to library %@...", buf, 0xCu);

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__PKSubcredentialProvisioningAddPassOperation_performOperationWithCompletion___block_invoke;
  v9[3] = &unk_1E2AC75C8;
  objc_copyWeak(&v11, &location);
  v8 = v4;
  v10 = v8;
  -[PKSubcredentialProvisioningAddPassOperation addPassToLibrary:withCompletion:](self, "addPassToLibrary:withCompletion:", v5, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __78__PKSubcredentialProvisioningAddPassOperation_performOperationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id WeakRetained;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PKLogFacilityTypeGetObject(0x16uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "uniqueID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v8;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Configuring pass %@...", buf, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    v10 = *(_QWORD *)(a1 + 32);
    if (!v10)
      goto LABEL_12;
    goto LABEL_11;
  }
  if (v5)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __78__PKSubcredentialProvisioningAddPassOperation_performOperationWithCompletion___block_invoke_11;
    v13[3] = &unk_1E2AC75A0;
    objc_copyWeak(&v16, (id *)(a1 + 40));
    v15 = *(id *)(a1 + 32);
    v14 = v5;
    objc_msgSend(WeakRetained, "updatePassMetadata:withCompletion:", v14, v13);

    objc_destroyWeak(&v16);
    goto LABEL_12;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "debugDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v11;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Error while adding pass: %@", buf, 0xCu);

  }
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKSubcredentialProvisioningErrorDomain"), 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v12);

  }
LABEL_12:

}

void __78__PKSubcredentialProvisioningAddPassOperation_performOperationWithCompletion___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      objc_msgSend(WeakRetained, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "operation:addedPass:", v5, v3);

      v7 = v3;
    }
    else
    {
      v7 = *(id *)(a1 + 32);
    }
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __78__PKSubcredentialProvisioningAddPassOperation_performOperationWithCompletion___block_invoke_2;
    v10[3] = &unk_1E2ABD9A0;
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v5, "configureExpressModeForPass:withCompletion:", v7, v10);

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKSubcredentialProvisioningErrorDomain"), 0, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

    }
  }

}

uint64_t __78__PKSubcredentialProvisioningAddPassOperation_performOperationWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)addPassToLibrary:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  -[PKSubcredentialProvisioningOperation configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localDeviceConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "webService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSubcredentialProvisioningOperation context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "operationQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  objc_msgSend(v10, "targetDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __79__PKSubcredentialProvisioningAddPassOperation_addPassToLibrary_withCompletion___block_invoke;
  v17[3] = &unk_1E2AC75F0;
  objc_copyWeak(&v21, &location);
  v14 = v7;
  v20 = v14;
  v15 = v6;
  v18 = v15;
  v16 = v12;
  v19 = v16;
  objc_msgSend(v13, "paymentWebService:addPaymentPass:withCompletionHandlerV2:", v10, v15, v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __79__PKSubcredentialProvisioningAddPassOperation_addPassToLibrary_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (!WeakRetained)
  {
    v8 = *(_QWORD *)(a1 + 48);
    if (!v8)
      goto LABEL_10;
    goto LABEL_9;
  }
  if (!v3)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Failed to add downloaded pass to library", buf, 2u);
    }

    v8 = *(_QWORD *)(a1 + 48);
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKSubcredentialProvisioningErrorDomain"), 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v10);

    goto LABEL_10;
  }
  objc_msgSend(WeakRetained, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "operation:addedPass:", v5, *(_QWORD *)(a1 + 32));

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__PKSubcredentialProvisioningAddPassOperation_addPassToLibrary_withCompletion___block_invoke_14;
  v11[3] = &unk_1E2ABDA18;
  v7 = *(NSObject **)(a1 + 40);
  v13 = *(id *)(a1 + 48);
  v12 = v3;
  dispatch_async(v7, v11);

LABEL_10:
}

uint64_t __79__PKSubcredentialProvisioningAddPassOperation_addPassToLibrary_withCompletion___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)configureExpressModeForPass:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  void (**v16)(_QWORD);
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[PKSubcredentialProvisioningOperation configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localDeviceConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "webService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "targetDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (PKTargetDeviceSupportsExpress(v11))
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __90__PKSubcredentialProvisioningAddPassOperation_configureExpressModeForPass_withCompletion___block_invoke;
    v14[3] = &unk_1E2ABDD60;
    v15 = v6;
    v16 = v7;
    objc_msgSend(v11, "paymentWebService:handlePotentialExpressPass:withCompletionHandler:", v10, v15, v14);

  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "uniqueID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = v13;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Newly provisioned pass (%@) was not set as express as target device (%@) does not support express", buf, 0x16u);

    }
    v7[2](v7);
  }

}

uint64_t __90__PKSubcredentialProvisioningAddPassOperation_configureExpressModeForPass_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  int v11;
  void *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
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
    v11 = 138412546;
    v12 = v7;
    v13 = 2080;
    v14 = v9;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Newly provisioned pass (%@) was %sset as express", (uint8_t *)&v11, 0x16u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)updatePassMetadata:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  char v20;
  PKAppletSubcredential *addedCredential;
  void *v22;
  PKAppletSubcredential *v23;
  void *v24;
  PKAppletSubcredential *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  void (**v34)(id, _QWORD);
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  -[PKSubcredentialProvisioningOperation context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "operationQueue");
  v29 = objc_claimAutoreleasedReturnValue();

  -[PKSubcredentialProvisioningOperation configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localDeviceConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "webService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "targetDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "devicePrimaryPaymentApplication");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "subcredentials");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "anyObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKAppletSubcredential identifier](self->_addedCredential, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v16)
    v19 = v17 == 0;
  else
    v19 = 1;
  if (v19)
  {

    if (v16 == v18)
      goto LABEL_9;
LABEL_7:
    -[PKSubcredentialProvisioningOperation failWithErrorCode:description:](self, "failWithErrorCode:description:", 8, CFSTR("Found unknown credential on downloaded pass"), v29);
LABEL_14:
    v26 = v30;
    goto LABEL_15;
  }
  v20 = objc_msgSend(v16, "isEqual:", v17);

  if ((v20 & 1) == 0)
    goto LABEL_7;
LABEL_9:
  -[PKAppletSubcredential setState:](self->_addedCredential, "setState:", objc_msgSend(v15, "state", v29));
  addedCredential = self->_addedCredential;
  objc_msgSend(v15, "entitlement");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAppletSubcredential setEntitlement:](addedCredential, "setEntitlement:", v22);

  v23 = self->_addedCredential;
  objc_msgSend(v15, "sharingConfiguration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAppletSubcredential setSharingConfiguration:](v23, "setSharingConfiguration:", v24);

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "uniqueID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v36 = v28;
      _os_log_impl(&dword_18FC92000, v27, OS_LOG_TYPE_DEFAULT, "Unable to update credential metadata on pass: %@", buf, 0xCu);

    }
    v7[2](v7, 0);
    goto LABEL_14;
  }
  v25 = self->_addedCredential;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __81__PKSubcredentialProvisioningAddPassOperation_updatePassMetadata_withCompletion___block_invoke;
  v31[3] = &unk_1E2AC7618;
  v32 = v6;
  v26 = v30;
  v33 = v30;
  v34 = v7;
  objc_msgSend(v12, "paymentWebService:updateMetadataOnPass:withCredential:completion:", v11, v32, v25, v31);

LABEL_15:
}

void __81__PKSubcredentialProvisioningAddPassOperation_updatePassMetadata_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  const char *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(0x16uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      objc_msgSend(v3, "uniqueID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      v7 = "Updated metadata on pass: %@";
LABEL_6:
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, v7, buf, 0xCu);

    }
  }
  else if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    v7 = "Failed to update metadata on pass: %@";
    goto LABEL_6;
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__PKSubcredentialProvisioningAddPassOperation_updatePassMetadata_withCompletion___block_invoke_22;
  v11[3] = &unk_1E2ABDA18;
  v8 = *(NSObject **)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v12 = v3;
  v13 = v9;
  v10 = v3;
  dispatch_async(v8, v11);

}

uint64_t __81__PKSubcredentialProvisioningAddPassOperation_updatePassMetadata_withCompletion___block_invoke_22(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addedCredential, 0);
  objc_storeStrong((id *)&self->_downloadedPass, 0);
}

@end
