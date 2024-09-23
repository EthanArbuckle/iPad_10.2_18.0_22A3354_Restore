@implementation SXProxyAuthenticationCredentialFactory

- (SXProxyAuthenticationCredentialFactory)initWithKeyProvider:(id)a3
{
  id v5;
  SXProxyAuthenticationCredentialFactory *v6;
  SXProxyAuthenticationCredentialFactory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXProxyAuthenticationCredentialFactory;
  v6 = -[SXProxyAuthenticationCredentialFactory init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_keyProvider, a3);

  return v7;
}

- (void)createCredentialForResponse:(id)a3 date:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v9)
    {
      -[SXProxyAuthenticationCredentialFactory keyProvider](self, "keyProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __86__SXProxyAuthenticationCredentialFactory_createCredentialForResponse_date_completion___block_invoke;
      v12[3] = &unk_24D68D7B8;
      v15 = v10;
      v13 = v8;
      v14 = v9;
      objc_msgSend(v11, "requestAuthenticationKeyWithCompletion:", v12);

    }
    else
    {
      (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
    }
  }

}

void __86__SXProxyAuthenticationCredentialFactory_createCredentialForResponse_date_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  CCHmacContext ctx;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "length");
    if (v10 >= 0x63)
      v11 = 99;
    else
      v11 = v10;
    objc_msgSend(v9, "substringToIndex:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "timeIntervalSince1970");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", round(v13 * 1000.0));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = v12;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@;%@;%@"), v5, v15, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dataUsingEncoding:", 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "base64EncodedStringWithOptions:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "dataUsingEncoding:", 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dataUsingEncoding:", 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dataUsingEncoding:", 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    memset(&ctx, 0, sizeof(ctx));
    v21 = objc_retainAutorelease(v18);
    CCHmacInit(&ctx, 2u, (const void *)objc_msgSend(v21, "bytes"), objc_msgSend(v21, "length"));
    v22 = objc_retainAutorelease(v19);
    CCHmacUpdate(&ctx, (const void *)objc_msgSend(v22, "bytes"), objc_msgSend(v22, "length"));
    v23 = objc_retainAutorelease(v20);
    CCHmacUpdate(&ctx, (const void *)objc_msgSend(v23, "bytes"), objc_msgSend(v23, "length"));
    v24 = malloc_type_malloc(0x20uLL, 0x9EE66412uLL);
    CCHmacFinal(&ctx, v24);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v24, 32);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "base64EncodedStringWithOptions:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDB7480], "credentialWithUser:password:persistence:", v29, v26, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    v28 = SXProxyLog;
    if (os_log_type_enabled((os_log_t)SXProxyLog, OS_LOG_TYPE_ERROR))
      __86__SXProxyAuthenticationCredentialFactory_createCredentialForResponse_date_completion___block_invoke_cold_1(v28);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (SXProxyAuthenticationKeyProvider)keyProvider
{
  return self->_keyProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyProvider, 0);
}

void __86__SXProxyAuthenticationCredentialFactory_createCredentialForResponse_date_completion___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_217023000, log, OS_LOG_TYPE_ERROR, "Received nil key identifier and secret from key provider", v1, 2u);
}

@end
