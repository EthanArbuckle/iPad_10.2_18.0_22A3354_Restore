@implementation PKValueAddedServiceWebService

- (PKValueAddedServiceWebService)initWithValueAddedServiceTransaction:(id)a3
{
  id v5;
  PKValueAddedServiceWebService *v6;
  PKValueAddedServiceWebService *v7;
  void *v8;
  uint64_t v9;
  NSURLSession *urlSession;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKValueAddedServiceWebService;
  v6 = -[PKValueAddedServiceWebService init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_valueAddedTransaction, a3);
    objc_msgSend(MEMORY[0x1E0C92CA0], "defaultSessionConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setURLCache:", 0);
    objc_msgSend(MEMORY[0x1E0C92C98], "sessionWithConfiguration:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    urlSession = v7->_urlSession;
    v7->_urlSession = (NSURLSession *)v9;

  }
  return v7;
}

- (void)downloadMerchantPayloadWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSURLSession *urlSession;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *, void *);
  void *v14;
  PKValueAddedServiceWebService *v15;
  id v16;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E98];
  urlSession = self->_urlSession;
  -[PKValueAddedServiceTransaction merchantURL](self->_valueAddedTransaction, "merchantURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __71__PKValueAddedServiceWebService_downloadMerchantPayloadWithCompletion___block_invoke;
  v14 = &unk_1E2AC7650;
  v15 = self;
  v16 = v4;
  v9 = v4;
  -[NSURLSession dataTaskWithURL:completionHandler:](urlSession, "dataTaskWithURL:completionHandler:", v8, &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resume", v11, v12, v13, v14, v15);

}

void __71__PKValueAddedServiceWebService_downloadMerchantPayloadWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void (*v12)(void);
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (*(_QWORD *)(a1 + 40))
  {
    if (v9)
    {
      PKLogFacilityTypeGetObject(2uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138412290;
        v17 = v10;
        _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "VAS Merchant Payload download failed with error: %@", (uint8_t *)&v16, 0xCu);
      }

      v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(v14 + 24);
      *(_QWORD *)(v14 + 24) = v13;

      v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    v12();
  }

}

- (void)downloadPassWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  NSURLSession *urlSession;
  void *v14;
  uint8_t v15[16];
  _QWORD v16[5];
  id v17;

  v4 = a3;
  -[NSDictionary objectForKey:](self->_merchantPayload, "objectForKey:", CFSTR("URLs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("passDownload"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("https")) & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v7, "scheme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("http")))
      v9 = PKAllowHTTP();
    else
      v9 = 0;

  }
  if (v7)
    v11 = !v9;
  else
    v11 = 1;
  if (v11)
  {
    PKLogFacilityTypeGetObject(2uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "VAS Pass download failed: invalid passDownload URL", v15, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }
  else
  {
    urlSession = self->_urlSession;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __60__PKValueAddedServiceWebService_downloadPassWithCompletion___block_invoke;
    v16[3] = &unk_1E2AC7650;
    v16[4] = self;
    v17 = v4;
    -[NSURLSession dataTaskWithURL:completionHandler:](urlSession, "dataTaskWithURL:completionHandler:", v7, v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resume");

  }
}

void __60__PKValueAddedServiceWebService_downloadPassWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v8, "MIMEType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("application/vnd.apple.pkpass")))
    {
      v11 = objc_msgSend(v8, "expectedContentLength");

      if (v11 <= 15728640)
      {
        if (!v9)
        {
          v16 = +[PKObject createWithData:warnings:error:](PKPass, "createWithData:warnings:error:", v7, 0, 0);
          v17 = *(_QWORD *)(a1 + 32);
          v18 = *(void **)(v17 + 32);
          *(_QWORD *)(v17 + 32) = v16;

          (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) != 0);
          goto LABEL_12;
        }
        PKLogFacilityTypeGetObject(2uLL);
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          goto LABEL_11;
        v19 = 138412290;
        v20 = v9;
        v13 = "VAS Pass download failed with error: %@";
        v14 = v12;
        v15 = 12;
        goto LABEL_10;
      }
    }
    else
    {

    }
    PKLogFacilityTypeGetObject(2uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
LABEL_11:

      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
      goto LABEL_12;
    }
    LOWORD(v19) = 0;
    v13 = "VAS Pass download failed: invalid pass";
    v14 = v12;
    v15 = 2;
LABEL_10:
    _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v19, v15);
    goto LABEL_11;
  }
LABEL_12:

}

- (NSDictionary)merchantPayload
{
  return self->_merchantPayload;
}

- (PKPass)pass
{
  return self->_pass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_merchantPayload, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_valueAddedTransaction, 0);
}

@end
