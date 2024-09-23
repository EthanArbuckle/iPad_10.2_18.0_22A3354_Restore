@implementation PKSubcredentialProvisioningDownloadPassOperation

- (PKSubcredentialProvisioningDownloadPassOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5
{
  id v8;
  PKSubcredentialProvisioningDownloadPassOperation *v9;
  uint64_t v10;
  NSURL *passURL;
  PKSubcredentialProvisioningDownloadPassOperation *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PKSubcredentialProvisioningDownloadPassOperation;
  v9 = -[PKSubcredentialProvisioningOperation initWithConfiguration:context:delegate:](&v17, sel_initWithConfiguration_context_delegate_, a3, v8, a5);
  if (v9
    && (objc_msgSend(v8, "passURL"),
        v10 = objc_claimAutoreleasedReturnValue(),
        passURL = v9->_passURL,
        v9->_passURL = (NSURL *)v10,
        passURL,
        !v9->_passURL))
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v15;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Missing pass url in %@!", buf, 0xCu);

    }
    v12 = 0;
  }
  else
  {
    v12 = v9;
  }

  return v12;
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
  v10.super_class = (Class)PKSubcredentialProvisioningDownloadPassOperation;
  -[PKSubcredentialProvisioningOperation performOperation](&v10, sel_performOperation);
  -[PKSubcredentialProvisioningOperation context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "operationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__PKSubcredentialProvisioningDownloadPassOperation_performOperation__block_invoke;
  v6[3] = &unk_1E2AC7578;
  v5 = v4;
  v7 = v5;
  objc_copyWeak(&v8, &location);
  -[PKSubcredentialProvisioningDownloadPassOperation performOperationWithCompletion:](self, "performOperationWithCompletion:", v6);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

void __68__PKSubcredentialProvisioningDownloadPassOperation_performOperation__block_invoke(uint64_t a1, void *a2)
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
  v6[2] = __68__PKSubcredentialProvisioningDownloadPassOperation_performOperation__block_invoke_2;
  v6[3] = &unk_1E2ABE7B0;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void __68__PKSubcredentialProvisioningDownloadPassOperation_performOperation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    if (*(_QWORD *)(a1 + 32))
      objc_msgSend(WeakRetained, "failWithError:");
    else
      objc_msgSend(WeakRetained, "advanceToState:", 12);
    WeakRetained = v3;
  }

}

- (void)performOperationWithCompletion:(id)a3
{
  id v4;
  NSURL *passURL;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  passURL = self->_passURL;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__PKSubcredentialProvisioningDownloadPassOperation_performOperationWithCompletion___block_invoke;
  v7[3] = &unk_1E2ADBE48;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v7[4] = self;
  v8 = v6;
  -[PKSubcredentialProvisioningDownloadPassOperation downloadPassAtURL:withCompletion:](self, "downloadPassAtURL:withCompletion:", passURL, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __83__PKSubcredentialProvisioningDownloadPassOperation_performOperationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    v12 = *(_QWORD *)(a1 + 40);
    if (!v12)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKSubcredentialProvisioningErrorDomain"), 0, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v13);
LABEL_11:

    goto LABEL_12;
  }
  if (!v5)
  {
    if (!*(_QWORD *)(a1 + 40))
      goto LABEL_12;
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v13, "setValue:forKey:", CFSTR("Failed to download pass"), *MEMORY[0x1E0CB2938]);
    objc_msgSend(v13, "setValue:forKey:", v6, *MEMORY[0x1E0CB3388]);
    v14 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKSubcredentialProvisioningErrorDomain"), 8, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

    goto LABEL_11;
  }
  PKLogFacilityTypeGetObject(0x16uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "uniqueID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412290;
    v17 = v9;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Downloaded pass %@", (uint8_t *)&v16, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDownloadedPass:", v5);

  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, _QWORD))(v11 + 16))(v11, 0);
LABEL_12:

}

- (void)downloadPassAtURL:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v6 = a4;
  v7 = a3;
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

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __85__PKSubcredentialProvisioningDownloadPassOperation_downloadPassAtURL_withCompletion___block_invoke;
  v16[3] = &unk_1E2ADBEC0;
  v17 = v10;
  v18 = v12;
  v19 = v6;
  v13 = v6;
  v14 = v12;
  v15 = v10;
  objc_msgSend(v15, "passAtURL:completion:", v7, v16);

}

void __85__PKSubcredentialProvisioningDownloadPassOperation_downloadPassAtURL_withCompletion___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a2 == 1 && v5)
  {
    objc_msgSend(a1[4], "targetDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "secureElementIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[PKDownloadRemoteAssetConfiguration configurationWithSEIDs:](PKDownloadRemoteAssetConfiguration, "configurationWithSEIDs:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __85__PKSubcredentialProvisioningDownloadPassOperation_downloadPassAtURL_withCompletion___block_invoke_2;
    v14[3] = &unk_1E2ADBE98;
    v15 = a1[5];
    v17 = a1[6];
    v16 = v6;
    objc_msgSend(v16, "downloadRemoteAssetsWithConfiguration:completion:", v9, v14);

  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v19 = a2;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Failed while downloading the pass with result: %ld", buf, 0xCu);
    }

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __85__PKSubcredentialProvisioningDownloadPassOperation_downloadPassAtURL_withCompletion___block_invoke_17;
    v12[3] = &unk_1E2ABD9A0;
    v11 = a1[5];
    v13 = a1[6];
    dispatch_async(v11, v12);
    v8 = v13;
  }

}

void __85__PKSubcredentialProvisioningDownloadPassOperation_downloadPassAtURL_withCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v6 = *(NSObject **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__PKSubcredentialProvisioningDownloadPassOperation_downloadPassAtURL_withCompletion___block_invoke_3;
  v8[3] = &unk_1E2ADBE70;
  v9 = v5;
  v11 = *(id *)(a1 + 48);
  v12 = a2;
  v10 = *(id *)(a1 + 40);
  v7 = v5;
  dispatch_async(v6, v8);

}

uint64_t __85__PKSubcredentialProvisioningDownloadPassOperation_downloadPassAtURL_withCompletion___block_invoke_3(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v1 = result;
  v6 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(result + 32);
  if (v2)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Failed while downloading the pass assets with error: %@", (uint8_t *)&v4, 0xCu);
    }

    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 48) + 16))();
  }
  else if (*(_BYTE *)(result + 56))
  {
    return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(result + 48) + 16))(*(_QWORD *)(result + 48), *(_QWORD *)(result + 40), 0);
  }
  return result;
}

uint64_t __85__PKSubcredentialProvisioningDownloadPassOperation_downloadPassAtURL_withCompletion___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addedCredential, 0);
  objc_storeStrong((id *)&self->_passURL, 0);
}

@end
