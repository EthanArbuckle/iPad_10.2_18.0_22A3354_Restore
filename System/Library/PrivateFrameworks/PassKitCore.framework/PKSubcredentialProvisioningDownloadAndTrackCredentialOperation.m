@implementation PKSubcredentialProvisioningDownloadAndTrackCredentialOperation

- (PKSubcredentialProvisioningDownloadAndTrackCredentialOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKSubcredentialProvisioningDownloadAndTrackCredentialOperation *v11;
  PKSubcredentialProvisioningDownloadPassOperation *v12;
  PKSubcredentialProvisioningDownloadPassOperation *downloadOperation;
  PKSubcredentialProvisioningTrackCredentialOperation *v14;
  PKSubcredentialProvisioningTrackCredentialOperation *trackOperation;
  PKSubcredentialProvisioningDownloadAndTrackCredentialOperation *v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  const char *v20;
  objc_class *v21;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)PKSubcredentialProvisioningDownloadAndTrackCredentialOperation;
  v11 = -[PKSubcredentialProvisioningPairingSessionOperation initWithConfiguration:context:delegate:](&v23, sel_initWithConfiguration_context_delegate_, v8, v9, v10);
  if (!v11)
    goto LABEL_4;
  v12 = -[PKSubcredentialProvisioningDownloadPassOperation initWithConfiguration:context:delegate:]([PKSubcredentialProvisioningDownloadPassOperation alloc], "initWithConfiguration:context:delegate:", v8, v9, v10);
  downloadOperation = v11->_downloadOperation;
  v11->_downloadOperation = v12;

  if (!v11->_downloadOperation)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v19;
      v20 = "Unable to create download operation in %@!";
LABEL_9:
      _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);

    }
LABEL_10:

    v16 = 0;
    goto LABEL_11;
  }
  v14 = -[PKSubcredentialProvisioningTrackCredentialOperation initWithConfiguration:context:delegate:]([PKSubcredentialProvisioningTrackCredentialOperation alloc], "initWithConfiguration:context:delegate:", v8, v9, v10);
  trackOperation = v11->_trackOperation;
  v11->_trackOperation = v14;

  if (!v11->_trackOperation)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v19;
      v20 = "Unable to create track operation in %@!";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
LABEL_4:
  v16 = v11;
LABEL_11:

  return v16;
}

- (void)performOperation
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  PKSubcredentialProvisioningDownloadPassOperation *downloadOperation;
  PKSubcredentialProvisioningTrackCredentialOperation *trackOperation;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  NSObject *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  NSObject *v20;
  id v21;
  id location;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PKSubcredentialProvisioningDownloadAndTrackCredentialOperation;
  -[PKSubcredentialProvisioningOperation performOperation](&v23, sel_performOperation);
  objc_initWeak(&location, self);
  -[PKSubcredentialProvisioningOperation context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "operationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = dispatch_group_create();
  v6 = v5;
  v7 = MEMORY[0x1E0C809B0];
  if (self->_downloadOperation)
  {
    dispatch_group_enter(v5);
    downloadOperation = self->_downloadOperation;
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __82__PKSubcredentialProvisioningDownloadAndTrackCredentialOperation_performOperation__block_invoke;
    v18[3] = &unk_1E2AC4A70;
    v19 = v4;
    objc_copyWeak(&v21, &location);
    v20 = v6;
    -[PKSubcredentialProvisioningDownloadPassOperation performOperationWithCompletion:](downloadOperation, "performOperationWithCompletion:", v18);

    objc_destroyWeak(&v21);
  }
  if (self->_trackOperation)
  {
    dispatch_group_enter(v6);
    trackOperation = self->_trackOperation;
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __82__PKSubcredentialProvisioningDownloadAndTrackCredentialOperation_performOperation__block_invoke_5;
    v14[3] = &unk_1E2AC4A70;
    v15 = v4;
    objc_copyWeak(&v17, &location);
    v16 = v6;
    -[PKSubcredentialProvisioningTrackCredentialOperation performOperationWithCompletion:](trackOperation, "performOperationWithCompletion:", v14);

    objc_destroyWeak(&v17);
  }
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __82__PKSubcredentialProvisioningDownloadAndTrackCredentialOperation_performOperation__block_invoke_7;
  block[3] = &unk_1E2ACA978;
  v12 = v4;
  v10 = v4;
  objc_copyWeak(&v13, &location);
  dispatch_group_notify(v6, v10, block);
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
}

void __82__PKSubcredentialProvisioningDownloadAndTrackCredentialOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__PKSubcredentialProvisioningDownloadAndTrackCredentialOperation_performOperation__block_invoke_2;
  block[3] = &unk_1E2AC7820;
  v7 = v3;
  v5 = v3;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  v8 = *(id *)(a1 + 40);
  dispatch_async(v4, block);

  objc_destroyWeak(&v9);
}

void __82__PKSubcredentialProvisioningDownloadAndTrackCredentialOperation_performOperation__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  id *WeakRetained;
  id *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  PKLogFacilityTypeGetObject(0x16uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (!v4)
      goto LABEL_7;
    v10 = 138412290;
    v11 = v2;
    v5 = "Download operation completed with an error: %@";
    v6 = v3;
    v7 = 12;
  }
  else
  {
    if (!v4)
      goto LABEL_7;
    LOWORD(v10) = 0;
    v5 = "Download operation completed successfully";
    v6 = v3;
    v7 = 2;
  }
  _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v10, v7);
LABEL_7:

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v9 = WeakRetained;
  if (WeakRetained)
    objc_storeStrong(WeakRetained + 7, *(id *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __82__PKSubcredentialProvisioningDownloadAndTrackCredentialOperation_performOperation__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__PKSubcredentialProvisioningDownloadAndTrackCredentialOperation_performOperation__block_invoke_2_6;
  block[3] = &unk_1E2AC7820;
  v7 = v3;
  v5 = v3;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  v8 = *(id *)(a1 + 40);
  dispatch_async(v4, block);

  objc_destroyWeak(&v9);
}

void __82__PKSubcredentialProvisioningDownloadAndTrackCredentialOperation_performOperation__block_invoke_2_6(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  id *WeakRetained;
  id *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  PKLogFacilityTypeGetObject(0x16uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (!v4)
      goto LABEL_7;
    v10 = 138412290;
    v11 = v2;
    v5 = "Track operation completed with an error: %@";
    v6 = v3;
    v7 = 12;
  }
  else
  {
    if (!v4)
      goto LABEL_7;
    LOWORD(v10) = 0;
    v5 = "Track operation completed successfully";
    v6 = v3;
    v7 = 2;
  }
  _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v10, v7);
LABEL_7:

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v9 = WeakRetained;
  if (WeakRetained)
    objc_storeStrong(WeakRetained + 8, *(id *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __82__PKSubcredentialProvisioningDownloadAndTrackCredentialOperation_performOperation__block_invoke_7(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__PKSubcredentialProvisioningDownloadAndTrackCredentialOperation_performOperation__block_invoke_2_8;
  block[3] = &unk_1E2AC3648;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __82__PKSubcredentialProvisioningDownloadAndTrackCredentialOperation_performOperation__block_invoke_2_8(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    if (WeakRetained[7] || WeakRetained[8])
    {
      objc_msgSend(WeakRetained, "failWithError:");
    }
    else
    {
      objc_msgSend(WeakRetained[5], "context");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "downloadedPass");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "context");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setDownloadedPass:", v3);

      objc_msgSend(v5, "advanceToState:", 12);
    }
    WeakRetained = v5;
  }

}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  -[PKSubcredentialProvisioningTrackCredentialOperation session:didChangeState:](self->_trackOperation, "session:didChangeState:", a3, a4);
}

- (void)appletSubcredentialPairingSessionDidFirstTransaction:(id)a3 withError:(id)a4
{
  -[PKSubcredentialProvisioningTrackCredentialOperation appletSubcredentialPairingSessionDidFirstTransaction:withError:](self->_trackOperation, "appletSubcredentialPairingSessionDidFirstTransaction:withError:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackOperationError, 0);
  objc_storeStrong((id *)&self->_downloadOperationError, 0);
  objc_storeStrong((id *)&self->_trackOperation, 0);
  objc_storeStrong((id *)&self->_downloadOperation, 0);
}

@end
