@implementation PKNFCTagReaderSession

- (PKNFCTagReaderSession)initWithInternalSession:(id)a3 targetQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char isKindOfClass;
  PKNFCTagReaderSession *v10;
  PKNFCTagReaderSession *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "nfSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKGetClassNFReaderSession();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(v6, "endSession");

    v6 = 0;
  }
  v14.receiver = self;
  v14.super_class = (Class)PKNFCTagReaderSession;
  v10 = -[PKPaymentSession initWithInternalSession:targetQueue:](&v14, sel_initWithInternalSession_targetQueue_, v6, v7);
  v11 = v10;
  if (v6 && v10)
  {
    objc_msgSend(v6, "nfSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", v11);

  }
  return v11;
}

- (void)startPolling
{
  -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", &__block_literal_global_72);
}

void __37__PKNFCTagReaderSession_startPolling__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "nfSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v3 = objc_msgSend(v2, "startPollingWithError:", &v6);
  v4 = v6;

  if ((v3 & 1) == 0)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v4;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Failed to start Tag Reader polling. Error: %@", buf, 0xCu);
    }

  }
}

- (void)stopPolling
{
  -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", &__block_literal_global_60_1);
}

void __36__PKNFCTagReaderSession_stopPolling__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "nfSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v3 = objc_msgSend(v2, "stopPollingWithError:", &v6);
  v4 = v6;

  if ((v3 & 1) == 0)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v4;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Failed to stop Tag Reader polling. Error: %@", buf, 0xCu);
    }

  }
}

- (void)endSession
{
  -[PKPaymentSession invalidateSessionWithCompletion:](self, "invalidateSessionWithCompletion:", &__block_literal_global_62_0);
}

void __35__PKNFCTagReaderSession_endSession__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  PKLogFacilityTypeGetObject(0);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl(&dword_18FC92000, v0, OS_LOG_TYPE_ERROR, "Reader Session Invalidated", v1, 2u);
  }

}

- (void)readNDEFMessageFromTag:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a4;
  if (v6)
  {
    v7 = *((id *)a3 + 1);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __59__PKNFCTagReaderSession_readNDEFMessageFromTag_completion___block_invoke;
    v10[3] = &unk_1E2AC6140;
    v11 = v7;
    v12 = v6;
    v8 = v7;
    v9 = a3;
    -[PKPaymentSession performBlockAsyncOnInternalSession:](self, "performBlockAsyncOnInternalSession:", v10);

  }
}

void __59__PKNFCTagReaderSession_readNDEFMessageFromTag_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  id v6;
  int v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  char v19;
  id v20;

  objc_msgSend(a2, "nfSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v20 = 0;
  v5 = objc_msgSend(v3, "connectTag:error:", v4, &v20);
  v6 = v20;
  if (v5)
  {
    v19 = 0;
    v18 = 0;
    v7 = objc_msgSend(v3, "checkNdefSupportsRead:andWrite:error:", &v19, 0, &v18);
    v8 = v18;
    if (v7)
    {
      if (v19)
      {
        v17 = 0;
        objc_msgSend(v3, "ndefReadWithError:", &v17);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v17;
        objc_msgSend(v9, "decode");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = 0;
        v10 = 0;
      }
      v16 = 0;
      v12 = objc_msgSend(v3, "disconnectTagWithError:", &v16);
      v13 = v16;
      if (v12)
      {
        v14 = v11;
        v15 = 0;
      }
      else
      {
        v14 = 0;
        v15 = v13;
      }
      (*(void (**)(_QWORD, void *, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v14, v15);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)readerSession:(id)a3 didDetectTags:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__PKNFCTagReaderSession_readerSession_didDetectTags___block_invoke;
  v7[3] = &unk_1E2AC0EA0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[PKPaymentSession performBlockAsyncOnInternalSession:](self, "performBlockAsyncOnInternalSession:", v7);

}

void __53__PKNFCTagReaderSession_readerSession_didDetectTags___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __53__PKNFCTagReaderSession_readerSession_didDetectTags___block_invoke_2;
    v8[3] = &unk_1E2AC9B68;
    v9 = v4;
    v7 = v4;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);
    v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
    objc_msgSend(v6, "nfcTagReaderSession:didDetectTags:", *(_QWORD *)(a1 + 32), v7);

  }
}

void __53__PKNFCTagReaderSession_readerSession_didDetectTags___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  PKNFCTag *v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = -[PKNFCTag initWithNFTag:]([PKNFCTag alloc], "initWithNFTag:", v3);

  objc_msgSend(v2, "addObject:", v4);
}

- (void)readerSessionDidEndUnexpectedly:(id)a3 reason:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PKNFCTagReaderSession *v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__PKNFCTagReaderSession_readerSessionDidEndUnexpectedly_reason___block_invoke;
  v7[3] = &unk_1E2AC0EA0;
  v8 = v5;
  v9 = self;
  v6 = v5;
  -[PKPaymentSession performBlockAsyncOnInternalSession:](self, "performBlockAsyncOnInternalSession:", v7);

}

void __64__PKNFCTagReaderSession_readerSessionDidEndUnexpectedly_reason___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id WeakRetained;
  char v6;
  id v7;
  char v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", v3) & 1) != 0)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "code");

    if (v4 == 5)
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 32));
      v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) != 0)
      {
        v9 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 32));
        objc_msgSend(v9, "nfcTagReaderSessionDidTimeout:", *(_QWORD *)(a1 + 40));
        goto LABEL_8;
      }
    }
  }
  else
  {

  }
  v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 32));
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0)
    return;
  v9 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 32));
  objc_msgSend(v9, "nfcTagReaderSessionDidEndUnexpectedly:", *(_QWORD *)(a1 + 40));
LABEL_8:

}

- (PKNFCTagReaderSessionDelegate)delegate
{
  return (PKNFCTagReaderSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
