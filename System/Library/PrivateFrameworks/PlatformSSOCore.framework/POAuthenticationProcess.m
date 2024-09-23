@implementation POAuthenticationProcess

- (POAuthenticationProcess)init
{
  POAuthenticationProcess *v2;
  POAuthenticationProcess *v3;
  POWSTrustProcess *v4;
  POWSTrustProcess *wstrustProcess;
  NSOperationQueue *v6;
  NSOperationQueue *completionQueue;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSArray *kSupportedLoginResponseAlgorithms;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;
  _QWORD v24[15];

  v24[13] = *MEMORY[0x24BDAC8D0];
  v23.receiver = self;
  v23.super_class = (Class)POAuthenticationProcess;
  v2 = -[POAuthenticationProcess init](&v23, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_waitForConnectivity = 0;
    v4 = objc_alloc_init(POWSTrustProcess);
    wstrustProcess = v3->_wstrustProcess;
    v3->_wstrustProcess = v4;

    v6 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    completionQueue = v3->_completionQueue;
    v3->_completionQueue = v6;

    -[NSOperationQueue setName:](v3->_completionQueue, "setName:", CFSTR("com.apple.platformSSO.auth"));
    v24[0] = CFSTR("ECDH-ES,A256GCM");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dir,%@"), CFSTR("HPKE-Base-P256-SHA256-AES256GCM"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v22;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dir,%@"), CFSTR("HPKE-PSK-P256-SHA256-AES256GCM"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v21;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dir,%@"), CFSTR("HPKE-Auth-P256-SHA256-AES256GCM"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v20;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dir,%@"), CFSTR("HPKE-Auth_Psk-P256-SHA256-AES256GCM"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24[4] = v19;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dir,%@"), CFSTR("HPKE-Base-P384-SHA384-AES256GCM"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24[5] = v8;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dir,%@"), CFSTR("HPKE-PSK-P384-SHA384-AES256GCM"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24[6] = v9;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dir,%@"), CFSTR("HPKE-Auth-P384-SHA384-AES256GCM"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24[7] = v10;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dir,%@"), CFSTR("HPKE-Auth_Psk-P384-SHA384-AES256GCM"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[8] = v11;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dir,%@"), CFSTR("HPKE-Base-X25519-SHA256-ChaCha20Poly1305"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[9] = v12;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dir,%@"), CFSTR("HPKE-PSK-X25519-SHA256-ChaCha20Poly1305"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[10] = v13;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dir,%@"), CFSTR("HPKE-Auth-X25519-SHA256-ChaCha20Poly1305"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24[11] = v14;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dir,%@"), CFSTR("HPKE-Auth_Psk-X25519-SHA256-ChaCha20Poly1305"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[12] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 13);
    v16 = objc_claimAutoreleasedReturnValue();
    kSupportedLoginResponseAlgorithms = v3->_kSupportedLoginResponseAlgorithms;
    v3->_kSupportedLoginResponseAlgorithms = (NSArray *)v16;

  }
  return v3;
}

- (void)performPasswordLoginUsingContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  POAuthenticationProcess *v21;
  id v22;
  os_signpost_id_t v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  PO_LOG_PODiagnostics();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24440D000, v8, OS_LOG_TYPE_INFO, "Starting password authentication", buf, 2u);
  }

  PO_LOG_POAuthenticationProcess();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[POAuthenticationProcess performPasswordLoginUsingContext:completion:].cold.2(v6);

  PO_LOG_POAuthenticationProcess();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[POAuthenticationProcess performPasswordLoginUsingContext:completion:].cold.1(v6);

  objc_msgSend(v6, "setLoginType:", 1);
  -[POAuthenticationProcess createNonceRequestWithContext:](self, "createNonceRequestWithContext:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    PO_LOG_PODiagnostics();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "requestIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v13;
      _os_log_impl(&dword_24440D000, v12, OS_LOG_TYPE_DEFAULT, "Sending nonce request: %{public}@", buf, 0xCu);

    }
    PO_LOG_POAuthenticationProcess();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_signpost_id_make_with_pointer(v14, v6);

    PO_LOG_POAuthenticationProcess();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_24440D000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "PlatformSSO_NonceRequest", " enableTelemetry=YES ", buf, 2u);
    }

    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __71__POAuthenticationProcess_performPasswordLoginUsingContext_completion___block_invoke_20;
    v19[3] = &unk_2514FFDC0;
    v23 = v15;
    v20 = v6;
    v21 = self;
    v22 = v7;
    -[POAuthenticationProcess performNonceRequestWithContext:request:completion:](self, "performNonceRequestWithContext:request:completion:", v20, v11, v19);

  }
  else
  {
    v18 = __71__POAuthenticationProcess_performPasswordLoginUsingContext_completion___block_invoke();
    (*((void (**)(id, uint64_t, id, _QWORD))v7 + 2))(v7, 2, v6, 0);
  }

}

id __71__POAuthenticationProcess_performPasswordLoginUsingContext_completion___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to create nonce request"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

uint64_t __71__POAuthenticationProcess_performPasswordLoginUsingContext_completion___block_invoke_20(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  id v18;
  void *v19;
  void *v20;
  rsize_t v21;
  void *v22;
  uint64_t (*v23)(void);
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  rsize_t v29;
  void *v30;
  uint8_t v31[16];
  uint8_t buf[16];

  if (a2 != 1)
  {
    v14 = __71__POAuthenticationProcess_performPasswordLoginUsingContext_completion___block_invoke_2();
    PO_LOG_POAuthenticationProcess();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = *(_QWORD *)(a1 + 56);
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_24440D000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PlatformSSO_NonceRequest", "Failed", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "password");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = (void *)objc_msgSend(v18, "mutableBytes");
    objc_msgSend(*(id *)(a1 + 32), "password");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "length");
    objc_msgSend(*(id *)(a1 + 32), "password");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    memset_s(v19, v21, 0, objc_msgSend(v22, "length"));

    v23 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    return v23();
  }
  PO_LOG_POAuthenticationProcess();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 56);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)v31 = 0;
    _os_signpost_emit_with_name_impl(&dword_24440D000, v4, OS_SIGNPOST_INTERVAL_END, v5, "PlatformSSO_NonceRequest", "Success", v31, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "loginConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "federationType");

  if (v7 == 2)
    return objc_msgSend(*(id *)(a1 + 40), "_performDynamicWSTrustPasswordLoginWithContext:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  if (v7 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "setFederated:", 1);
    objc_msgSend(*(id *)(a1 + 32), "loginConfiguration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "federationMexURL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setWsTrustFederationMexURL:", v25);

    return objc_msgSend(*(id *)(a1 + 40), "_performWSTrustPasswordLoginWithContext:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "password");
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27 = (void *)objc_msgSend(v26, "mutableBytes");
    objc_msgSend(*(id *)(a1 + 32), "password");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "length");
    objc_msgSend(*(id *)(a1 + 32), "password");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    memset_s(v27, v29, 0, objc_msgSend(v30, "length"));

    v23 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    return v23();
  }
  objc_msgSend(*(id *)(a1 + 32), "loginConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "loginRequestEncryptionPublicKey");

  v11 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 48);
  if (v9)
    return objc_msgSend(v10, "_performEncryptedPasswordLoginUsingContext:completion:", v11, v12);
  else
    return objc_msgSend(v10, "_performPasswordLoginUsingContext:completion:", v11, v12);
}

id __71__POAuthenticationProcess_performPasswordLoginUsingContext_completion___block_invoke_2()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to retrieve nonce."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (void)performSmartCardLoginUsingContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "setLoginType:", 3);
  -[POAuthenticationProcess _performEmbeddedAssertionLoginUsingContext:completion:](self, "_performEmbeddedAssertionLoginUsingContext:completion:", v7, v6);

}

- (void)performSEPKeyLoginUsingContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "setLoginType:", 2);
  -[POAuthenticationProcess _performEmbeddedAssertionLoginUsingContext:completion:](self, "_performEmbeddedAssertionLoginUsingContext:completion:", v7, v6);

}

- (void)_performEmbeddedAssertionLoginUsingContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  POAuthenticationProcess *v21;
  id v22;
  os_signpost_id_t v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  PO_LOG_PODiagnostics();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24440D000, v8, OS_LOG_TYPE_INFO, "Starting embedded assertion authentication", buf, 2u);
  }

  PO_LOG_POAuthenticationProcess();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[POAuthenticationProcess performPasswordLoginUsingContext:completion:].cold.2(v6);

  PO_LOG_POAuthenticationProcess();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[POAuthenticationProcess performPasswordLoginUsingContext:completion:].cold.1(v6);

  -[POAuthenticationProcess createNonceRequestWithContext:](self, "createNonceRequestWithContext:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    PO_LOG_PODiagnostics();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "requestIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v13;
      _os_log_impl(&dword_24440D000, v12, OS_LOG_TYPE_DEFAULT, "Sending nonce request: %{public}@", buf, 0xCu);

    }
    PO_LOG_POAuthenticationProcess();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_signpost_id_make_with_pointer(v14, v6);

    PO_LOG_POAuthenticationProcess();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_24440D000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "PlatformSSO_NonceRequest", " enableTelemetry=YES ", buf, 2u);
    }

    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __81__POAuthenticationProcess__performEmbeddedAssertionLoginUsingContext_completion___block_invoke_28;
    v19[3] = &unk_2514FFDE8;
    v23 = v15;
    v22 = v7;
    v20 = v6;
    v21 = self;
    -[POAuthenticationProcess performNonceRequestWithContext:request:completion:](self, "performNonceRequestWithContext:request:completion:", v20, v11, v19);

  }
  else
  {
    v18 = __81__POAuthenticationProcess__performEmbeddedAssertionLoginUsingContext_completion___block_invoke();
    (*((void (**)(id, uint64_t, id, _QWORD))v7 + 2))(v7, 2, v6, 0);
  }

}

id __81__POAuthenticationProcess__performEmbeddedAssertionLoginUsingContext_completion___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to create nonce request."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

void __81__POAuthenticationProcess__performEmbeddedAssertionLoginUsingContext_completion___block_invoke_28(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  void (*v28)(void);
  id v29;
  id v30;
  uint8_t buf[16];

  if (a2 == 1)
  {
    PO_LOG_POAuthenticationProcess();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = *(_QWORD *)(a1 + 56);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_24440D000, v4, OS_SIGNPOST_INTERVAL_END, v5, "PlatformSSO_NonceRequest", "Success", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "createEmbeddedAssertionWithContext:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v18 = __81__POAuthenticationProcess__performEmbeddedAssertionLoginUsingContext_completion___block_invoke_30();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_28:

      return;
    }
    v7 = objc_msgSend(*(id *)(a1 + 32), "loginType");
    v8 = *(void **)(a1 + 32);
    if (v7 == 3)
    {
      objc_msgSend(*(id *)(a1 + 40), "findAlgorithmForKey:", objc_msgSend(v8, "embeddedAssertionSigningKey"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(*(id *)(a1 + 32), "embeddedAssertionSigningKey");
      v11 = objc_msgSend(*(id *)(a1 + 32), "embeddedAssertionCertificate");
      v30 = 0;
      +[POJWTSigning encodeAndSignJWT:algorithm:key:certificate:error:](POJWTSigning, "encodeAndSignJWT:algorithm:key:certificate:error:", v6, v9, v10, v11, &v30);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v30;
      if (v12)
      {

LABEL_15:
        objc_msgSend(*(id *)(a1 + 40), "createLoginJWTWithContext:embeddedAssertion:", *(_QWORD *)(a1 + 32), v12);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          objc_msgSend(*(id *)(a1 + 40), "performLoginWithContext:loginJWT:completion:", *(_QWORD *)(a1 + 32), v22, *(_QWORD *)(a1 + 48));
        }
        else
        {
          v23 = __81__POAuthenticationProcess__performEmbeddedAssertionLoginUsingContext_completion___block_invoke_43();
          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        }

        goto LABEL_27;
      }
      v24 = __81__POAuthenticationProcess__performEmbeddedAssertionLoginUsingContext_completion___block_invoke_35();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

LABEL_27:
      goto LABEL_28;
    }
    objc_msgSend(v8, "userSepSigningAlgorithm");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(*(id *)(a1 + 32), "embeddedAssertionSigningKey");
    v21 = objc_msgSend(*(id *)(a1 + 32), "embeddedAssertionCertificate");
    v29 = 0;
    +[POJWTSigning encodeAndSignJWT:signingAlgorithm:key:certificate:error:](POJWTSigning, "encodeAndSignJWT:signingAlgorithm:key:certificate:error:", v6, v19, v20, v21, &v29);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v29;

    if (v12)
      goto LABEL_15;
    v25 = __81__POAuthenticationProcess__performEmbeddedAssertionLoginUsingContext_completion___block_invoke_39();
    if (objc_msgSend(*(id *)(a1 + 32), "loginType") == 2)
    {
      objc_msgSend(*(id *)(a1 + 32), "deviceConfiguration");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v26, "sharedDeviceKeys") & 1) != 0)
      {
        v27 = objc_msgSend(v13, "code");

        if (v27 == -1010)
        {
          v28 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_26:
          v28();
          goto LABEL_27;
        }
      }
      else
      {

      }
    }
    v28 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_26;
  }
  v14 = __71__POAuthenticationProcess_performPasswordLoginUsingContext_completion___block_invoke_2();
  PO_LOG_POAuthenticationProcess();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  v17 = *(_QWORD *)(a1 + 56);
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_24440D000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PlatformSSO_NonceRequest", "Failed", buf, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

id __81__POAuthenticationProcess__performEmbeddedAssertionLoginUsingContext_completion___block_invoke_30()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to create embedded assertion JWT."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __81__POAuthenticationProcess__performEmbeddedAssertionLoginUsingContext_completion___block_invoke_35()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to sign embedded SmartCard assertion."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __81__POAuthenticationProcess__performEmbeddedAssertionLoginUsingContext_completion___block_invoke_39()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to sign embedded assertion."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __81__POAuthenticationProcess__performEmbeddedAssertionLoginUsingContext_completion___block_invoke_43()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to create login JWT."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (id)findAlgorithmForKey:(__SecKey *)a3
{
  CFDictionaryRef v4;
  void *v5;
  id v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  char v12;
  int v13;
  int v14;
  id v15;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v4 = SecKeyCopyAttributes(a3);
  -[__CFDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", *MEMORY[0x24BDE9028]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDE9038]))
  {
    -[__CFDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", *MEMORY[0x24BDE9050]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", *MEMORY[0x24BDE9048]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDE9058]) & 1) != 0)
      v10 = 1;
    else
      v10 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDE9060]);
    v11 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDE9080]);
    v12 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDE9070]);
    if (v10)
    {
      v13 = objc_msgSend(v9, "intValue");
      switch(v13)
      {
        case 521:
          if (SecKeyIsAlgorithmSupported(a3, kSecKeyOperationTypeSign, (SecKeyAlgorithm)*MEMORY[0x24BDE92C0]))
          {
            v7 = CFSTR("ES512");
            goto LABEL_22;
          }
          v17 = __47__POAuthenticationProcess_findAlgorithmForKey___block_invoke_62();
          goto LABEL_21;
        case 384:
          if (SecKeyIsAlgorithmSupported(a3, kSecKeyOperationTypeSign, (SecKeyAlgorithm)*MEMORY[0x24BDE92B8]))
          {
            v7 = CFSTR("ES384");
            goto LABEL_22;
          }
          v18 = __47__POAuthenticationProcess_findAlgorithmForKey___block_invoke_56();
          goto LABEL_21;
        case 256:
          if (SecKeyIsAlgorithmSupported(a3, kSecKeyOperationTypeSign, (SecKeyAlgorithm)*MEMORY[0x24BDE92B0]))
          {
            v7 = CFSTR("ES256");
LABEL_22:

            goto LABEL_23;
          }
          v19 = __47__POAuthenticationProcess_findAlgorithmForKey___block_invoke_50();
          goto LABEL_21;
      }
    }
    else if (v11)
    {
      v14 = objc_msgSend(v9, "intValue");
      switch(v14)
      {
        case 4096:
          if (SecKeyIsAlgorithmSupported(a3, kSecKeyOperationTypeSign, (SecKeyAlgorithm)*MEMORY[0x24BDE9348]))
          {
            v7 = CFSTR("RS512");
            goto LABEL_22;
          }
          v21 = __47__POAuthenticationProcess_findAlgorithmForKey___block_invoke_78();
          goto LABEL_21;
        case 3072:
          if (SecKeyIsAlgorithmSupported(a3, kSecKeyOperationTypeSign, (SecKeyAlgorithm)*MEMORY[0x24BDE9340]))
          {
            v7 = CFSTR("RS384");
            goto LABEL_22;
          }
          v22 = __47__POAuthenticationProcess_findAlgorithmForKey___block_invoke_72();
          goto LABEL_21;
        case 2048:
          if (SecKeyIsAlgorithmSupported(a3, kSecKeyOperationTypeSign, (SecKeyAlgorithm)*MEMORY[0x24BDE9338]))
          {
            v7 = CFSTR("RS256");
            goto LABEL_22;
          }
          v20 = __47__POAuthenticationProcess_findAlgorithmForKey___block_invoke_66();
LABEL_21:
          v7 = 0;
          goto LABEL_22;
      }
    }
    else if ((v12 & 1) != 0)
    {
      v7 = CFSTR("EdDSA");
      goto LABEL_22;
    }
    v15 = __47__POAuthenticationProcess_findAlgorithmForKey___block_invoke_84();
    goto LABEL_21;
  }
  v6 = __47__POAuthenticationProcess_findAlgorithmForKey___block_invoke();
  v7 = 0;
LABEL_23:

  return (id)v7;
}

id __47__POAuthenticationProcess_findAlgorithmForKey___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Invalid key for signing."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __47__POAuthenticationProcess_findAlgorithmForKey___block_invoke_50()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("256 bit key does not support signing."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __47__POAuthenticationProcess_findAlgorithmForKey___block_invoke_56()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("384 bit key does not support signing."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __47__POAuthenticationProcess_findAlgorithmForKey___block_invoke_62()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("521 bit key does not support signing."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __47__POAuthenticationProcess_findAlgorithmForKey___block_invoke_66()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Key does not support SHA256 signing."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __47__POAuthenticationProcess_findAlgorithmForKey___block_invoke_72()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Key does not support SHA384 signing."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __47__POAuthenticationProcess_findAlgorithmForKey___block_invoke_78()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Key does not support SHA512 signing."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __47__POAuthenticationProcess_findAlgorithmForKey___block_invoke_84()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("No supported algorithms for key"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (void)performTokenRefreshUsingContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  POAuthenticationProcess *v21;
  id v22;
  os_signpost_id_t v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  PO_LOG_PODiagnostics();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24440D000, v8, OS_LOG_TYPE_INFO, "Starting refresh", buf, 2u);
  }

  PO_LOG_POAuthenticationProcess();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[POAuthenticationProcess performPasswordLoginUsingContext:completion:].cold.2(v6);

  PO_LOG_POAuthenticationProcess();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[POAuthenticationProcess performPasswordLoginUsingContext:completion:].cold.1(v6);

  objc_msgSend(v6, "setLoginType:", 100);
  -[POAuthenticationProcess createNonceRequestWithContext:](self, "createNonceRequestWithContext:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    PO_LOG_PODiagnostics();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "requestIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v13;
      _os_log_impl(&dword_24440D000, v12, OS_LOG_TYPE_DEFAULT, "Sending nonce request: %{public}@", buf, 0xCu);

    }
    PO_LOG_POAuthenticationProcess();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_signpost_id_make_with_pointer(v14, v6);

    PO_LOG_POAuthenticationProcess();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_24440D000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "PlatformSSO_NonceRequest", " enableTelemetry=YES ", buf, 2u);
    }

    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __70__POAuthenticationProcess_performTokenRefreshUsingContext_completion___block_invoke_89;
    v19[3] = &unk_2514FFDC0;
    v23 = v15;
    v20 = v6;
    v21 = self;
    v22 = v7;
    -[POAuthenticationProcess performNonceRequestWithContext:request:completion:](self, "performNonceRequestWithContext:request:completion:", v20, v11, v19);

  }
  else
  {
    v18 = __71__POAuthenticationProcess_performPasswordLoginUsingContext_completion___block_invoke();
    (*((void (**)(id, uint64_t, id, _QWORD))v7 + 2))(v7, 2, v6, 0);
  }

}

void __70__POAuthenticationProcess_performTokenRefreshUsingContext_completion___block_invoke_89(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  id v11;
  void *v12;
  void *v13;
  rsize_t v14;
  void *v15;
  id v16;
  uint8_t v17[16];
  uint8_t buf[16];

  if (a2 == 1)
  {
    PO_LOG_POAuthenticationProcess();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = *(_QWORD *)(a1 + 56);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      *(_WORD *)v17 = 0;
      _os_signpost_emit_with_name_impl(&dword_24440D000, v4, OS_SIGNPOST_INTERVAL_END, v5, "PlatformSSO_NonceRequest", "Success", v17, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "createRefreshJWTWithContext:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 40), "performLoginWithContext:loginJWT:completion:", *(_QWORD *)(a1 + 32), v6, *(_QWORD *)(a1 + 48));
    }
    else
    {
      v16 = __70__POAuthenticationProcess_performTokenRefreshUsingContext_completion___block_invoke_93();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
  else
  {
    v7 = __70__POAuthenticationProcess_performTokenRefreshUsingContext_completion___block_invoke_2();
    PO_LOG_POAuthenticationProcess();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = *(_QWORD *)(a1 + 56);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_24440D000, v9, OS_SIGNPOST_INTERVAL_END, v10, "PlatformSSO_NonceRequest", "Failed", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "password");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (void *)objc_msgSend(v11, "mutableBytes");
    objc_msgSend(*(id *)(a1 + 32), "password");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");
    objc_msgSend(*(id *)(a1 + 32), "password");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    memset_s(v12, v14, 0, objc_msgSend(v15, "length"));

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

id __70__POAuthenticationProcess_performTokenRefreshUsingContext_completion___block_invoke_2()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to retrieve nonce"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __70__POAuthenticationProcess_performTokenRefreshUsingContext_completion___block_invoke_93()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to create refresh JWT."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (void)_performDynamicWSTrustPasswordLoginWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  rsize_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  POAuthenticationProcess *v23;
  id v24;
  os_signpost_id_t v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[POAuthenticationProcess createPreAuthenticationRequestWithContext:](self, "createPreAuthenticationRequestWithContext:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    PO_LOG_PODiagnostics();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "requestIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v10;
      _os_log_impl(&dword_24440D000, v9, OS_LOG_TYPE_DEFAULT, "Sending preauthentication request: %{public}@", buf, 0xCu);

    }
    PO_LOG_POAuthenticationProcess();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_signpost_id_make_with_pointer(v11, v6);

    PO_LOG_POAuthenticationProcess();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_24440D000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PlatformSSO_PreauthenticationRequest", " enableTelemetry=YES ", buf, 2u);
    }

    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __85__POAuthenticationProcess__performDynamicWSTrustPasswordLoginWithContext_completion___block_invoke_100;
    v21[3] = &unk_2514FFDC0;
    v25 = v12;
    v22 = v6;
    v23 = self;
    v24 = v7;
    -[POAuthenticationProcess performPreAuthenticationRequestWithContext:request:completion:](self, "performPreAuthenticationRequestWithContext:request:completion:", v22, v8, v21);

  }
  else
  {
    v15 = __85__POAuthenticationProcess__performDynamicWSTrustPasswordLoginWithContext_completion___block_invoke();
    objc_msgSend(v6, "password");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = (void *)objc_msgSend(v16, "mutableBytes");
    objc_msgSend(v6, "password");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "length");
    objc_msgSend(v6, "password");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    memset_s(v17, v19, 0, objc_msgSend(v20, "length"));

    (*((void (**)(id, uint64_t, id, _QWORD))v7 + 2))(v7, 2, v6, 0);
  }

}

id __85__POAuthenticationProcess__performDynamicWSTrustPasswordLoginWithContext_completion___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to create preauthentication request."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

uint64_t __85__POAuthenticationProcess__performDynamicWSTrustPasswordLoginWithContext_completion___block_invoke_100(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  id v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  id v14;
  void *v15;
  void *v16;
  rsize_t v17;
  void *v18;
  uint8_t v19[16];
  uint8_t v20[16];
  uint8_t buf[16];
  uint8_t v22[16];

  if (a2 == 1)
  {
    PO_LOG_POAuthenticationProcess();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = *(_QWORD *)(a1 + 56);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_24440D000, v4, OS_SIGNPOST_INTERVAL_END, v5, "PlatformSSO_PreauthenticationRequest", "Success", buf, 2u);
    }

    v6 = objc_msgSend(*(id *)(a1 + 32), "federated");
    PO_LOG_PODiagnostics();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (v6)
    {
      if (v8)
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_24440D000, v7, OS_LOG_TYPE_INFO, "User is federated", v20, 2u);
      }

      return objc_msgSend(*(id *)(a1 + 40), "_performWSTrustPasswordLoginWithContext:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    }
    else
    {
      if (v8)
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_24440D000, v7, OS_LOG_TYPE_INFO, "User is NOT federated", v19, 2u);
      }

      return objc_msgSend(*(id *)(a1 + 40), "_performPasswordLoginUsingContext:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    }
  }
  else
  {
    v10 = __85__POAuthenticationProcess__performDynamicWSTrustPasswordLoginWithContext_completion___block_invoke_2();
    PO_LOG_POAuthenticationProcess();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = *(_QWORD *)(a1 + 56);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)v22 = 0;
      _os_signpost_emit_with_name_impl(&dword_24440D000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PlatformSSO_PreauthenticationRequest", "Failed", v22, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "password");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = (void *)objc_msgSend(v14, "mutableBytes");
    objc_msgSend(*(id *)(a1 + 32), "password");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "length");
    objc_msgSend(*(id *)(a1 + 32), "password");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    memset_s(v15, v17, 0, objc_msgSend(v18, "length"));

    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

id __85__POAuthenticationProcess__performDynamicWSTrustPasswordLoginWithContext_completion___block_invoke_2()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to retrieve preauthentication data."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (void)_performWSTrustPasswordLoginWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  rsize_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  POAuthenticationProcess *v23;
  id v24;
  os_signpost_id_t v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[POAuthenticationProcess createWSTrustMexRequestWithContext:](self, "createWSTrustMexRequestWithContext:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    PO_LOG_PODiagnostics();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "requestIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v10;
      _os_log_impl(&dword_24440D000, v9, OS_LOG_TYPE_DEFAULT, "Sending mex request: %{public}@", buf, 0xCu);

    }
    PO_LOG_POAuthenticationProcess();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_signpost_id_make_with_pointer(v11, v6);

    PO_LOG_POAuthenticationProcess();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_24440D000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PlatformSSO_WSTrustMexRequest", " enableTelemetry=YES ", buf, 2u);
    }

    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __78__POAuthenticationProcess__performWSTrustPasswordLoginWithContext_completion___block_invoke_107;
    v21[3] = &unk_2514FFDC0;
    v25 = v12;
    v22 = v6;
    v23 = self;
    v24 = v7;
    -[POAuthenticationProcess performWSTrustMexRequestWithContext:request:completion:](self, "performWSTrustMexRequestWithContext:request:completion:", v22, v8, v21);

  }
  else
  {
    v15 = __78__POAuthenticationProcess__performWSTrustPasswordLoginWithContext_completion___block_invoke();
    objc_msgSend(v6, "password");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = (void *)objc_msgSend(v16, "mutableBytes");
    objc_msgSend(v6, "password");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "length");
    objc_msgSend(v6, "password");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    memset_s(v17, v19, 0, objc_msgSend(v20, "length"));

    (*((void (**)(id, uint64_t, id, _QWORD))v7 + 2))(v7, 2, v6, 0);
  }

}

id __78__POAuthenticationProcess__performWSTrustPasswordLoginWithContext_completion___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to create mex request."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

void __78__POAuthenticationProcess__performWSTrustPasswordLoginWithContext_completion___block_invoke_107(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  id v12;
  void *v13;
  void *v14;
  rsize_t v15;
  void *v16;
  void (*v17)(void);
  id v18;
  id v19;
  void *v20;
  void *v21;
  rsize_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  rsize_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  os_signpost_id_t v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  id v38;
  id v39;
  _QWORD v40[5];
  id v41;
  os_signpost_id_t v42;
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  if (a2 != 1)
  {
    v8 = __78__POAuthenticationProcess__performWSTrustPasswordLoginWithContext_completion___block_invoke_2();
    PO_LOG_POAuthenticationProcess();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = *(_QWORD *)(a1 + 56);
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_24440D000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PlatformSSO_WSTrustMexRequest", "Failed", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "password");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (void *)objc_msgSend(v12, "mutableBytes");
    objc_msgSend(*(id *)(a1 + 32), "password");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length");
    objc_msgSend(*(id *)(a1 + 32), "password");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    memset_s(v13, v15, 0, objc_msgSend(v16, "length"));

    v17 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_25;
  }
  PO_LOG_POAuthenticationProcess();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 56);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_24440D000, v4, OS_SIGNPOST_INTERVAL_END, v5, "PlatformSSO_WSTrustMexRequest", "Success", buf, 2u);
  }

  v6 = objc_msgSend(*(id *)(a1 + 32), "wsTrustVersion");
  switch(v6)
  {
    case 0:
      v18 = __78__POAuthenticationProcess__performWSTrustPasswordLoginWithContext_completion___block_invoke_111();
      objc_msgSend(*(id *)(a1 + 32), "password");
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v20 = (void *)objc_msgSend(v19, "mutableBytes");
      objc_msgSend(*(id *)(a1 + 32), "password");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "length");
      objc_msgSend(*(id *)(a1 + 32), "password");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      memset_s(v20, v22, 0, objc_msgSend(v23, "length"));

      v17 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_25:
      v17();
      return;
    case 2:
      objc_msgSend(*(id *)(a1 + 40), "createWSTrust2005RequestWithContext:", *(_QWORD *)(a1 + 32));
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 1:
      objc_msgSend(*(id *)(a1 + 40), "createWSTrust13RequestWithContext:", *(_QWORD *)(a1 + 32));
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v24 = (void *)v7;
      goto LABEL_17;
  }
  v24 = 0;
LABEL_17:
  objc_msgSend(*(id *)(a1 + 32), "password");
  v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v26 = (void *)objc_msgSend(v25, "mutableBytes");
  objc_msgSend(*(id *)(a1 + 32), "password");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "length");
  objc_msgSend(*(id *)(a1 + 32), "password");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  memset_s(v26, v28, 0, objc_msgSend(v29, "length"));

  objc_msgSend(*(id *)(a1 + 32), "setPassword:", 0);
  if (!v24)
  {
    v39 = __78__POAuthenticationProcess__performWSTrustPasswordLoginWithContext_completion___block_invoke_115();
    v17 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_25;
  }
  PO_LOG_PODiagnostics();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "requestIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v44 = v31;
    _os_log_impl(&dword_24440D000, v30, OS_LOG_TYPE_DEFAULT, "Sending WSTrust request: %{public}@", buf, 0xCu);

  }
  PO_LOG_POAuthenticationProcess();
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = os_signpost_id_make_with_pointer(v32, *(const void **)(a1 + 32));

  PO_LOG_POAuthenticationProcess();
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_24440D000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v33, "PlatformSSO_WSTrustRequest", " enableTelemetry=YES ", buf, 2u);
  }

  v37 = *(_QWORD *)(a1 + 32);
  v36 = *(void **)(a1 + 40);
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = __78__POAuthenticationProcess__performWSTrustPasswordLoginWithContext_completion___block_invoke_119;
  v40[3] = &unk_2514FFE10;
  v42 = v33;
  v38 = *(id *)(a1 + 48);
  v40[4] = *(_QWORD *)(a1 + 40);
  v41 = v38;
  objc_msgSend(v36, "performWSTrustAuthenticationRequestWithContext:request:completion:", v37, v24, v40);

}

id __78__POAuthenticationProcess__performWSTrustPasswordLoginWithContext_completion___block_invoke_2()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to retrieve mex data"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __78__POAuthenticationProcess__performWSTrustPasswordLoginWithContext_completion___block_invoke_111()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("federated idp does not support WSTrust 1.3 or 2005."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __78__POAuthenticationProcess__performWSTrustPasswordLoginWithContext_completion___block_invoke_115()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to create WSTrust request."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

void __78__POAuthenticationProcess__performWSTrustPasswordLoginWithContext_completion___block_invoke_119(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  id v19;
  uint8_t v20[16];
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (a2 == 1 && objc_msgSend(v8, "length"))
  {
    PO_LOG_POAuthenticationProcess();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = *(_QWORD *)(a1 + 48);
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)v20 = 0;
      _os_signpost_emit_with_name_impl(&dword_24440D000, v11, OS_SIGNPOST_INTERVAL_END, v12, "PlatformSSO_WSTrustRequest", "Success", v20, 2u);
    }

    objc_msgSend(v9, "base64EncodedStringWithOptions:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "createLoginJWTWithContext:embeddedAssertion:", v7, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(*(id *)(a1 + 32), "performLoginWithContext:loginJWT:completion:", v7, v14, *(_QWORD *)(a1 + 40));
    }
    else
    {
      v19 = __81__POAuthenticationProcess__performEmbeddedAssertionLoginUsingContext_completion___block_invoke_43();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
  else
  {
    v15 = __78__POAuthenticationProcess__performWSTrustPasswordLoginWithContext_completion___block_invoke_2_120();
    PO_LOG_POAuthenticationProcess();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = *(_QWORD *)(a1 + 48);
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_24440D000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PlatformSSO_WSTrustRequest", "Failed", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

id __78__POAuthenticationProcess__performWSTrustPasswordLoginWithContext_completion___block_invoke_2_120()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to retrieve WSTrust response."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (void)_performEncryptedPasswordLoginUsingContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, id, _QWORD);
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  rsize_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  rsize_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  POAuthenticationProcess *v58;
  id v59;
  void *v60;
  void *v61;
  void (**v62)(id, uint64_t, id, _QWORD);
  void *v63;
  _QWORD v64[4];
  id v65;
  id v66;
  const __CFString *v67;
  void *v68;
  void *v69;
  _QWORD v70[3];

  v70[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, id, _QWORD))a4;
  objc_msgSend(v6, "loginConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "loginRequestEncryptionPublicKey");

  if (v9)
  {
    -[POAuthenticationProcess createEmbeddedPasswordAssertionWithContext:](self, "createEmbeddedPasswordAssertionWithContext:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v6, "password");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = (void *)objc_msgSend(v11, "mutableBytes");
      objc_msgSend(v6, "password");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length");
      objc_msgSend(v6, "password");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      memset_s(v12, v14, 0, objc_msgSend(v15, "length"));

      objc_msgSend(v6, "setPassword:", 0);
      objc_msgSend(v6, "loginConfiguration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "loginRequestEncryptionAlgorithm");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v13) = objc_msgSend(v17, "isEqualToNumber:", 0x251520F48);

      v62 = v7;
      v58 = self;
      if ((_DWORD)v13)
      {
        objc_msgSend(v6, "serverNonce");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "dataUsingEncoding:", 4);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "loginConfiguration");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "loginRequestEncryptionAPVPrefix");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "loginConfiguration");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[POAuthenticationProcess createPartyVInfoWithNonce:prefixData:apvPublicKey:](self, "createPartyVInfoWithNonce:prefixData:apvPublicKey:", v19, v21, objc_msgSend(v22, "loginRequestEncryptionPublicKey"));
        v23 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "header");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = (void *)v23;
        objc_msgSend(v24, "setApv:", v23);

      }
      else
      {
        objc_msgSend(v6, "loginConfiguration");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "serverNonceClaimName");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "length");

        objc_msgSend(v10, "header");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          objc_msgSend(v6, "loginConfiguration");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "serverNonceClaimName");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = v32;
          objc_msgSend(v6, "serverNonce");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v70[0] = v33;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v70, &v69, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addCustomClaims:", v34);

        }
        else
        {
          v67 = CFSTR("request_nonce");
          objc_msgSend(v6, "serverNonce");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = v31;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addCustomClaims:", v32);
        }

        objc_msgSend(v6, "serverNonce");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v35 = v10;
      objc_msgSend(v6, "loginConfiguration");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "loginRequestEncryptionAlgorithm");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "loginConfiguration");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "loginRequestEncryptionPublicKey");
      objc_msgSend(v6, "loginConfiguration");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "loginRequestHpkePsk");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "loginConfiguration");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "loginRequestHpkePsk_id");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = 0;
      +[POJWTEncryption encodeAndEncryptJWT:encryptionAlgorithm:publicKey:otherInfo:psk:psk_id:authPrivateKey:auth_kid:error:](POJWTEncryption, "encodeAndEncryptJWT:encryptionAlgorithm:publicKey:otherInfo:psk:psk_id:authPrivateKey:auth_kid:error:", v35, v36, v38, v63, v40, v42, 0, 0, &v66);
      v43 = objc_claimAutoreleasedReturnValue();
      v59 = v66;

      objc_msgSend(v35, "body");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "password");
      v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v46 = (void *)objc_msgSend(v45, "mutableBytes");
      objc_msgSend(v35, "body");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "password");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "length");
      v61 = v35;
      v50 = v35;
      v51 = (void *)v43;
      objc_msgSend(v50, "body");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "password");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      memset_s(v46, v49, 0, objc_msgSend(v53, "length"));

      if (v51)
      {
        v54 = v59;
        -[POAuthenticationProcess createLoginJWTWithContext:embeddedAssertion:](v58, "createLoginJWTWithContext:embeddedAssertion:", v6, v51);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v62;
        if (v55)
        {
          -[POAuthenticationProcess performLoginWithContext:loginJWT:completion:](v58, "performLoginWithContext:loginJWT:completion:", v6, v55, v62);
        }
        else
        {
          v57 = __81__POAuthenticationProcess__performEmbeddedAssertionLoginUsingContext_completion___block_invoke_43();
          v62[2](v62, 2, v6, 0);
        }
      }
      else
      {
        v64[0] = MEMORY[0x24BDAC760];
        v64[1] = 3221225472;
        v64[2] = __81__POAuthenticationProcess__performEncryptedPasswordLoginUsingContext_completion___block_invoke_138;
        v64[3] = &unk_2514FF9D0;
        v54 = v59;
        v65 = v59;
        v56 = __81__POAuthenticationProcess__performEncryptedPasswordLoginUsingContext_completion___block_invoke_138((uint64_t)v64);
        v7 = v62;
        v62[2](v62, 2, v6, 0);
        v55 = v65;
      }
      v10 = v61;

    }
    else
    {
      v26 = __81__POAuthenticationProcess__performEncryptedPasswordLoginUsingContext_completion___block_invoke_130();
      v7[2](v7, 2, v6, 0);
    }

  }
  else
  {
    v25 = __81__POAuthenticationProcess__performEncryptedPasswordLoginUsingContext_completion___block_invoke();
    v7[2](v7, 2, v6, 0);
  }

}

id __81__POAuthenticationProcess__performEncryptedPasswordLoginUsingContext_completion___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Missing encryption public key."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __81__POAuthenticationProcess__performEncryptedPasswordLoginUsingContext_completion___block_invoke_130()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to create embedded password assertion JWT."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __81__POAuthenticationProcess__performEncryptedPasswordLoginUsingContext_completion___block_invoke_138(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Failed to encrypt embedded assertion."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v1;
}

- (void)_performPasswordLoginUsingContext:(id)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t, id, _QWORD);
  void *v7;
  id v8;
  void *v9;
  void *v10;
  rsize_t v11;
  void *v12;
  id v13;
  id v14;

  v14 = a3;
  v6 = (void (**)(id, uint64_t, id, _QWORD))a4;
  -[POAuthenticationProcess createLoginJWTWithContext:embeddedAssertion:](self, "createLoginJWTWithContext:embeddedAssertion:", v14, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "password");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (void *)objc_msgSend(v8, "mutableBytes");
  objc_msgSend(v14, "password");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");
  objc_msgSend(v14, "password");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  memset_s(v9, v11, 0, objc_msgSend(v12, "length"));

  objc_msgSend(v14, "setPassword:", 0);
  if (v7)
  {
    -[POAuthenticationProcess performLoginWithContext:loginJWT:completion:](self, "performLoginWithContext:loginJWT:completion:", v14, v7, v6);
  }
  else
  {
    v13 = __81__POAuthenticationProcess__performEmbeddedAssertionLoginUsingContext_completion___block_invoke_43();
    v6[2](v6, 2, v14, 0);
  }

}

- (id)createPreAuthenticationRequestWithContext:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  int v28;
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BDD1808]);
  objc_msgSend(v3, "loginConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "federationUserPreauthenticationURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithURL:resolvingAgainstBaseURL:", v6, 0);

  v8 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend(v3, "userName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queryItemWithName:value:", CFSTR("user"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "loginConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "customFederationUserPreauthenticationRequestValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v3, "loginConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "customFederationUserPreauthenticationRequestValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v16;
  }
  objc_msgSend(v7, "queryItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v7, "queryItems");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "arrayByAddingObjectsFromArray:", v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setQueryItems:", v19);

  }
  else
  {
    objc_msgSend(v7, "setQueryItems:", v11);
  }
  v20 = objc_alloc(MEMORY[0x24BDD16B0]);
  objc_msgSend(v7, "URL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithURL:cachePolicy:timeoutInterval:", v21, 4, 30.0);

  objc_msgSend(v22, "setHTTPMethod:", CFSTR("GET"));
  objc_msgSend(v22, "addValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Accept"));
  objc_msgSend(v3, "requestIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addValue:forHTTPHeaderField:", v23, CFSTR("client-request-id"));

  PO_LOG_POAuthenticationProcess();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    -[POAuthenticationProcess createPreAuthenticationRequestWithContext:].cold.1();

  PO_LOG_POAuthenticationProcess();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "requestIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138543362;
    v29 = v26;
    _os_log_impl(&dword_24440D000, v25, OS_LOG_TYPE_INFO, "Preauthentication request: %{public}@", (uint8_t *)&v28, 0xCu);

  }
  return v22;
}

- (void)performPreAuthenticationRequestWithContext:(id)a3 request:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(id *, void *, void *, void *);
  void *v21;
  POAuthenticationProcess *v22;
  id v23;
  id v24;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "urlSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke;
  v21 = &unk_2514FFE60;
  v23 = v8;
  v24 = v9;
  v22 = self;
  v12 = v8;
  v13 = v9;
  objc_msgSend(v11, "dataTaskWithRequest:completionHandler:", v10, &v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v12, "requestIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("Preauthentication Request: %@"), v16, v18, v19, v20, v21, v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTaskDescription:", v17);

  objc_msgSend(v14, "resume");
}

void __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id *v38;
  uint64_t *v39;
  uint64_t v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t);
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t);
  void *v51;
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  uint64_t v60;
  uint64_t v61;
  id (*v62)();
  void *v63;
  id v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;
  _QWORD v69[4];
  id v70;
  id v71;
  uint8_t buf[16];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  PO_LOG_POAuthenticationProcess();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24440D000, v10, OS_LOG_TYPE_INFO, "Preauthentication response received", buf, 2u);
  }

  if (v9)
  {
    if (v7)
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v7, 4);
    else
      v11 = 0;
    v17 = MEMORY[0x24BDAC760];
    v69[0] = MEMORY[0x24BDAC760];
    v69[1] = 3221225472;
    v69[2] = __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_157;
    v69[3] = &unk_2514FFCB0;
    v70 = v9;
    v71 = v11;
    v12 = v11;
    v18 = __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_157((uint64_t)v69);
    objc_msgSend(a1[4], "completionQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = v17;
    v67[1] = 3221225472;
    v67[2] = __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_160;
    v67[3] = &unk_2514FFE38;
    v68 = a1[6];
    objc_msgSend(v19, "addOperationWithBlock:", v67);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v8;
      if (objc_msgSend(v12, "statusCode") >= 200 && objc_msgSend(v12, "statusCode") < 300)
      {
        PO_LOG_POAuthenticationProcess();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_cold_1();

        v57 = 0;
        objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 16, &v57);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v57;
        v16 = v24;
        if (!v23 || v24)
        {
          v40 = MEMORY[0x24BDAC760];
          v55[0] = MEMORY[0x24BDAC760];
          v55[1] = 3221225472;
          v55[2] = __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_173;
          v55[3] = &unk_2514FF9D0;
          v38 = &v56;
          v56 = v24;
          v41 = __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_173((uint64_t)v55);
          objc_msgSend(a1[4], "completionQueue");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v53[0] = v40;
          v53[1] = 3221225472;
          v53[2] = __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_176;
          v53[3] = &unk_2514FFE38;
          v54 = a1[6];
          objc_msgSend(v42, "addOperationWithBlock:", v53);

          v37 = v54;
        }
        else
        {
          v25 = (void *)MEMORY[0x24BDD1758];
          objc_msgSend(a1[5], "loginConfiguration");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "federationPredicate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "predicateWithFormat:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v29 = objc_msgSend(v28, "evaluateWithObject:", v23);
          objc_msgSend(a1[5], "setFederated:", v29);
          objc_msgSend(a1[5], "setWsTrustFederationMexURL:", 0);
          if (objc_msgSend(a1[5], "federated"))
          {
            objc_msgSend(a1[5], "loginConfiguration");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "federationMexURLKeypath");
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v31)
              goto LABEL_20;
            objc_msgSend(a1[5], "loginConfiguration");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "federationMexURLKeypath");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "valueForKeyPath:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v34)
            {
LABEL_20:
              objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("federation_metadata_url"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
            }
            if (objc_msgSend(v34, "length"))
            {
              objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1[5], "setWsTrustFederationMexURL:", v35);

            }
          }
          if (!objc_msgSend(a1[5], "federated")
            || objc_msgSend(a1[5], "federated")
            && (objc_msgSend(a1[5], "wsTrustFederationMexURL"),
                v36 = (void *)objc_claimAutoreleasedReturnValue(),
                v36,
                v36))
          {
            objc_msgSend(a1[4], "completionQueue");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = MEMORY[0x24BDAC760];
            v49 = 3221225472;
            v50 = __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_184;
            v51 = &unk_2514FFE38;
            v38 = &v52;
            v52 = a1[6];
            v39 = &v48;
          }
          else
          {
            objc_msgSend(a1[4], "completionQueue");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = MEMORY[0x24BDAC760];
            v44 = 3221225472;
            v45 = __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_185;
            v46 = &unk_2514FFE38;
            v38 = &v47;
            v47 = a1[6];
            v39 = &v43;
          }
          objc_msgSend(v37, "addOperationWithBlock:", v39, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52);
        }

      }
      else
      {
        v13 = MEMORY[0x24BDAC760];
        v60 = MEMORY[0x24BDAC760];
        v61 = 3221225472;
        v62 = __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_167;
        v63 = &unk_2514FF9D0;
        v64 = v12;
        v14 = __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_167();
        objc_msgSend(a1[4], "completionQueue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v58[0] = v13;
        v58[1] = 3221225472;
        v58[2] = __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_171;
        v58[3] = &unk_2514FFE38;
        v59 = a1[6];
        objc_msgSend(v15, "addOperationWithBlock:", v58);

        v16 = v64;
      }

    }
    else
    {
      v20 = __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2();
      objc_msgSend(a1[4], "completionQueue");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v65[0] = MEMORY[0x24BDAC760];
      v65[1] = 3221225472;
      v65[2] = __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_166;
      v65[3] = &unk_2514FFE38;
      v66 = a1[6];
      objc_msgSend(v21, "addOperationWithBlock:", v65);

      v12 = v66;
    }
  }

}

id __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_157(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1009, *(_QWORD *)(a1 + 32), CFSTR("Failed to retrieve Preauthentication response."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_157_cold_1();

  return v1;
}

uint64_t __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_160(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1009, CFSTR("Not HTTP response for Preauthentication."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

uint64_t __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_166(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_167()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1009, CFSTR("Preauthentication request failed."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_167_cold_1();

  return v0;
}

uint64_t __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_171(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_173(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1008, *(_QWORD *)(a1 + 32), CFSTR("Failed to parse Preauthentication response."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v1;
}

uint64_t __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_176(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_178()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Exception when evaluating federationPredicate"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_178_cold_1();

  return v0;
}

uint64_t __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_184(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_185(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)createWSTrustMexRequestWithContext:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v3 = (objc_class *)MEMORY[0x24BDD16B0];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "wsTrustFederationMexURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithURL:cachePolicy:timeoutInterval:", v6, 4, 30.0);
  objc_msgSend(v7, "setHTTPMethod:", CFSTR("GET"));
  PO_LOG_POAuthenticationProcess();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[POAuthenticationProcess createWSTrustMexRequestWithContext:].cold.1();

  return v7;
}

- (void)performWSTrustMexRequestWithContext:(id)a3 request:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(id *, void *, void *, void *);
  void *v21;
  POAuthenticationProcess *v22;
  id v23;
  id v24;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "urlSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke;
  v21 = &unk_2514FFE60;
  v23 = v8;
  v24 = v9;
  v22 = self;
  v12 = v8;
  v13 = v9;
  objc_msgSend(v11, "dataTaskWithRequest:completionHandler:", v10, &v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v12, "requestIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("WSTrust Mex Request: %@"), v16, v18, v19, v20, v21, v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTaskDescription:", v17);

  objc_msgSend(v14, "resume");
}

void __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  uint64_t v30;
  id (*v31)();
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  uint8_t buf[16];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  PO_LOG_POAuthenticationProcess();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24440D000, v10, OS_LOG_TYPE_INFO, "WSTrust Mex response received", buf, 2u);
  }

  if (v9)
  {
    if (v7)
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v7, 4);
    else
      v11 = 0;
    v17 = MEMORY[0x24BDAC760];
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke_189;
    v38[3] = &unk_2514FFCB0;
    v39 = v9;
    v40 = v11;
    v12 = v11;
    v18 = __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke_189((uint64_t)v38);
    objc_msgSend(a1[4], "completionQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v17;
    v36[1] = 3221225472;
    v36[2] = __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke_192;
    v36[3] = &unk_2514FFE38;
    v37 = a1[6];
    objc_msgSend(v19, "addOperationWithBlock:", v36);

    v16 = v39;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v20 = __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke_2();
      objc_msgSend(a1[4], "completionQueue");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke_196;
      v34[3] = &unk_2514FFE38;
      v35 = a1[6];
      objc_msgSend(v21, "addOperationWithBlock:", v34);

      v12 = v35;
      goto LABEL_13;
    }
    v12 = v8;
    if (objc_msgSend(v12, "statusCode") >= 200 && objc_msgSend(v12, "statusCode") < 300)
    {
      PO_LOG_POAuthenticationProcess();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke_cold_1();

      objc_msgSend(a1[5], "setWsTrustVersion:", 0);
      if (!objc_msgSend(a1[4], "validateWSTrustMexResponseWithContext:response:", a1[5], v7)
        || !objc_msgSend(a1[5], "wsTrustVersion")
        || (objc_msgSend(a1[5], "wsTrustFederationURL"),
            v23 = (void *)objc_claimAutoreleasedReturnValue(),
            v23,
            !v23))
      {
        (*((void (**)(void))a1[6] + 2))();
        goto LABEL_13;
      }
      objc_msgSend(a1[4], "completionQueue");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke_201;
      v25[3] = &unk_2514FFE38;
      v26 = a1[6];
      objc_msgSend(v24, "addOperationWithBlock:", v25);

      v16 = v26;
    }
    else
    {
      v13 = MEMORY[0x24BDAC760];
      v29 = MEMORY[0x24BDAC760];
      v30 = 3221225472;
      v31 = __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke_2_197;
      v32 = &unk_2514FF9D0;
      v12 = v12;
      v33 = v12;
      v14 = __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke_2_197();
      objc_msgSend(a1[4], "completionQueue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v13;
      v27[1] = 3221225472;
      v27[2] = __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke_200;
      v27[3] = &unk_2514FFE38;
      v28 = a1[6];
      objc_msgSend(v15, "addOperationWithBlock:", v27);

      v16 = v33;
    }
  }

LABEL_13:
}

id __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke_189(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1009, *(_QWORD *)(a1 + 32), CFSTR("Failed to retrieve WSTrust Mex response."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_157_cold_1();

  return v1;
}

uint64_t __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke_192(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke_2()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1009, CFSTR("Not HTTP response for WSTrust Mex response."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

uint64_t __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke_196(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke_2_197()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1009, CFSTR("WSTrust Mex request failed."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_167_cold_1();

  return v0;
}

uint64_t __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke_200(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke_201(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)validateWSTrustMexResponseWithContext:(id)a3 response:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;

  v6 = a3;
  v7 = a4;
  -[POAuthenticationProcess wstrustProcess](self, "wstrustProcess");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "parseWSTrustMexResponse:version:", v7, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9
    || (-[POAuthenticationProcess wstrustProcess](self, "wstrustProcess"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "parseWSTrustMexResponse:version:", v7, 2),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v9))
  {
    objc_msgSend(v6, "setWsTrustVersion:", objc_msgSend(v9, "version"));
    v11 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v9, "endpointURLString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLWithString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWsTrustFederationURL:", v13);

    LOBYTE(v9) = 1;
  }
  else
  {
    v15 = __74__POAuthenticationProcess_validateWSTrustMexResponseWithContext_response___block_invoke();
  }

  return (char)v9;
}

id __74__POAuthenticationProcess_validateWSTrustMexResponseWithContext_response___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Failed to find valid WSTrust values in mex response."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (id)createWSTrust13RequestWithContext:(id)a3
{
  id v4;
  POWSTrustRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  v5 = objc_alloc_init(POWSTrustRequest);
  objc_msgSend(v4, "loginConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "federationRequestURN");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[POWSTrustRequest setEndpointURN:](v5, "setEndpointURN:", v7);

  objc_msgSend(v4, "wsTrustFederationNonce");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[POWSTrustRequest setNonce:](v5, "setNonce:", v8);

  objc_msgSend(v4, "wsTrustFederationURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[POWSTrustRequest setTo:](v5, "setTo:", v10);

  objc_msgSend(v4, "userName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[POWSTrustRequest setUserName:](v5, "setUserName:", v11);

  objc_msgSend(v4, "password");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[POWSTrustRequest setPassword:](v5, "setPassword:", v12);

  -[POAuthenticationProcess wstrustProcess](self, "wstrustProcess");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "createWSTrust13Request:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = objc_alloc(MEMORY[0x24BDD16B0]);
    objc_msgSend(v4, "wsTrustFederationURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithURL:cachePolicy:timeoutInterval:", v16, 4, 30.0);

    objc_msgSend(v17, "setHTTPMethod:", CFSTR("POST"));
    objc_msgSend(v17, "addValue:forHTTPHeaderField:", CFSTR("application/soap+xml; charset=utf-8"),
      CFSTR("Content-type"));
    objc_msgSend(v17, "addValue:forHTTPHeaderField:", CFSTR("http://docs.oasis-open.org/ws-sx/ws-trust/200512/RST/Issue"), CFSTR("SOAPAction"));
    objc_msgSend(v17, "setHTTPBody:", v14);
  }
  else
  {
    v18 = __61__POAuthenticationProcess_createWSTrust13RequestWithContext___block_invoke();
    v17 = 0;
  }

  return v17;
}

id __61__POAuthenticationProcess_createWSTrust13RequestWithContext___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to created WSTrust login request."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (id)createWSTrust2005RequestWithContext:(id)a3
{
  id v4;
  POWSTrustRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  v5 = objc_alloc_init(POWSTrustRequest);
  objc_msgSend(v4, "loginConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "federationRequestURN");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[POWSTrustRequest setEndpointURN:](v5, "setEndpointURN:", v7);

  objc_msgSend(v4, "wsTrustFederationNonce");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[POWSTrustRequest setNonce:](v5, "setNonce:", v8);

  objc_msgSend(v4, "wsTrustFederationURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[POWSTrustRequest setTo:](v5, "setTo:", v10);

  objc_msgSend(v4, "userName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[POWSTrustRequest setUserName:](v5, "setUserName:", v11);

  objc_msgSend(v4, "password");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[POWSTrustRequest setPassword:](v5, "setPassword:", v12);

  -[POAuthenticationProcess wstrustProcess](self, "wstrustProcess");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "createWSTrust2005Request:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = objc_alloc(MEMORY[0x24BDD16B0]);
    objc_msgSend(v4, "wsTrustFederationURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithURL:cachePolicy:timeoutInterval:", v16, 4, 30.0);

    objc_msgSend(v17, "setHTTPMethod:", CFSTR("POST"));
    objc_msgSend(v17, "addValue:forHTTPHeaderField:", CFSTR("application/soap+xml; charset=utf-8"),
      CFSTR("Content-type"));
    objc_msgSend(v17, "addValue:forHTTPHeaderField:", CFSTR("http://docs.oasis-open.org/ws-sx/ws-trust/200512/RST/Issue"), CFSTR("SOAPAction"));
    objc_msgSend(v17, "setHTTPBody:", v14);
  }
  else
  {
    v18 = __61__POAuthenticationProcess_createWSTrust13RequestWithContext___block_invoke();
    v17 = 0;
  }

  return v17;
}

- (void)performWSTrustAuthenticationRequestWithContext:(id)a3 request:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(id *, void *, void *, void *);
  void *v21;
  POAuthenticationProcess *v22;
  id v23;
  id v24;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "urlSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke;
  v21 = &unk_2514FFE60;
  v23 = v8;
  v24 = v9;
  v22 = self;
  v12 = v8;
  v13 = v9;
  objc_msgSend(v11, "dataTaskWithRequest:completionHandler:", v10, &v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v12, "requestIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("WSTrust Login Request: %@"), v16, v18, v19, v20, v21, v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTaskDescription:", v17);

  objc_msgSend(v14, "resume");
}

void __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  _BOOL4 v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  id (*v41)();
  void *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  uint8_t buf[16];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  PO_LOG_POAuthenticationProcess();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24440D000, v10, OS_LOG_TYPE_INFO, "WSTrust login response received", buf, 2u);
  }

  if (v9)
  {
    if (v7)
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v7, 4);
    else
      v11 = 0;
    v16 = MEMORY[0x24BDAC760];
    v50[0] = MEMORY[0x24BDAC760];
    v50[1] = 3221225472;
    v50[2] = __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_220;
    v50[3] = &unk_2514FFCB0;
    v51 = v9;
    v52 = v11;
    v12 = v11;
    v17 = __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_220((uint64_t)v50);
    objc_msgSend(a1[4], "completionQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v16;
    v47[1] = 3221225472;
    v47[2] = __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_223;
    v47[3] = &unk_2514FFE88;
    v49 = a1[6];
    v48 = a1[5];
    objc_msgSend(v18, "addOperationWithBlock:", v47);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v8;
      if (objc_msgSend(v12, "statusCode") == 200 || objc_msgSend(v12, "statusCode") == 500)
      {
        v13 = +[POCoreConfigurationUtil platformSSODevModeEnabled](POCoreConfigurationUtil, "platformSSODevModeEnabled");
        PO_LOG_POAuthenticationProcess();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
        if (v13)
        {
          if (v15)
            __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_cold_1();
        }
        else if (v15)
        {
          __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_cold_2();
        }

        v21 = a1[4];
        v22 = a1[5];
        v35 = 0;
        v23 = objc_msgSend(v21, "validateWSTrustAuthenticationResponseWithContext:response:returningAssertion:", v22, v7, &v35);
        v24 = v35;
        objc_msgSend(a1[4], "completionQueue");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = MEMORY[0x24BDAC760];
        v30[1] = 3221225472;
        v30[2] = __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_233;
        v30[3] = &unk_2514FFEB0;
        v33 = a1[6];
        v34 = v23;
        v31 = a1[5];
        v32 = v24;
        v26 = v24;
        objc_msgSend(v25, "addOperationWithBlock:", v30);

      }
      else
      {
        v27 = MEMORY[0x24BDAC760];
        v39 = MEMORY[0x24BDAC760];
        v40 = 3221225472;
        v41 = __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_2_228;
        v42 = &unk_2514FF9D0;
        v43 = v12;
        v28 = __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_2_228();
        objc_msgSend(a1[4], "completionQueue");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = v27;
        v36[1] = 3221225472;
        v36[2] = __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_231;
        v36[3] = &unk_2514FFE88;
        v38 = a1[6];
        v37 = a1[5];
        objc_msgSend(v29, "addOperationWithBlock:", v36);

        v26 = v43;
      }

    }
    else
    {
      v19 = __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_2();
      objc_msgSend(a1[4], "completionQueue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = MEMORY[0x24BDAC760];
      v44[1] = 3221225472;
      v44[2] = __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_227;
      v44[3] = &unk_2514FFE88;
      v46 = a1[6];
      v45 = a1[5];
      objc_msgSend(v20, "addOperationWithBlock:", v44);

      v12 = v46;
    }
  }

}

id __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_220(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1009, *(_QWORD *)(a1 + 32), CFSTR("Failed to retrieve WSTrust login response."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_157_cold_1();

  return v1;
}

uint64_t __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_223(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 5, *(_QWORD *)(a1 + 32), 0);
}

id __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_2()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1009, CFSTR("Not HTTP response for WSTrust login response."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

uint64_t __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_227(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 3, *(_QWORD *)(a1 + 32), 0);
}

id __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_2_228()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1009, CFSTR("WSTrust login request failed."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_167_cold_1();

  return v0;
}

uint64_t __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_231(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 3, *(_QWORD *)(a1 + 32), 0);
}

uint64_t __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_233(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[7], a1[4], a1[5]);
}

- (unint64_t)validateWSTrustAuthenticationResponseWithContext:(id)a3 response:(id)a4 returningAssertion:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  unint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  id v32;
  id v33;
  void *v35;
  double v36;
  double v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;

  v8 = a3;
  *a5 = 0;
  v9 = a4;
  -[POAuthenticationProcess wstrustProcess](self, "wstrustProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "parseWSTrustResponse:version:", v9, objc_msgSend(v8, "wsTrustVersion"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v22 = __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke();
    goto LABEL_17;
  }
  objc_msgSend(v11, "nonce");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "wsTrustFederationNonce");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqualToString:", v13);

  if ((v14 & 1) == 0)
  {
    v23 = __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_239();
    goto LABEL_17;
  }
  if (!objc_msgSend(v11, "isFault"))
  {
    objc_msgSend(v11, "nonce");
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v25 = (void *)v24;
      objc_msgSend(v11, "created");
      v26 = objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v27 = (void *)v26;
        objc_msgSend(v11, "expires");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          objc_msgSend(v11, "created");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "timeIntervalSinceNow");
          v31 = v30;

          if (v31 <= 120.0)
          {
            objc_msgSend(v11, "expires");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "timeIntervalSinceNow");
            v37 = v36;

            if (v37 >= -120.0)
            {
              objc_msgSend(v11, "tokenType");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = objc_msgSend(v39, "length");

              if (v40)
              {
                objc_msgSend(v11, "tokenType");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setTokenTypeNamespace:", v41);

                objc_msgSend(v11, "assertion");
                v42 = (void *)objc_claimAutoreleasedReturnValue();

                if (v42)
                {
                  objc_msgSend(v11, "assertion");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v43, "dataUsingEncoding:", 4);
                  *a5 = (id)objc_claimAutoreleasedReturnValue();

                  v21 = 1;
                  goto LABEL_18;
                }
                v45 = __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_262();
              }
              else
              {
                v44 = __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_258();
              }
            }
            else
            {
              v38 = __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_255();
            }
          }
          else
          {
            v32 = __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_252();
          }
          goto LABEL_17;
        }
      }
      else
      {

      }
    }
    v33 = __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_248();
LABEL_17:
    v21 = 3;
    goto LABEL_18;
  }
  v15 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v11, "faultSubCodeValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "faultReason");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("faultSubCode = %@, faultReason = %@"), v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = v18;
  v19 = v18;
  v20 = __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_245();
  if (objc_msgSend(v11, "isCredentialFault"))
    v21 = 4;
  else
    v21 = 3;

LABEL_18:
  return v21;
}

id __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Failed to parse WSTrust login response."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_239()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("WSTrust login response validation failed."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_245()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("WSTrust login failed"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_178_cold_1();

  return v0;
}

id __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_248()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("WSTrust login response validation missing required values."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_252()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Failed to verify created."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_252_cold_1();

  return v0;
}

id __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_255()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Failed to verify expires."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_252_cold_1();

  return v0;
}

id __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_258()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("WSTrust login response missing TokenType."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_262()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("WSTrust login response validation missing assertion."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (void)performLoginWithContext:(id)a3 loginJWT:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  os_signpost_id_t v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "deviceConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "signingAlgorithm");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "deviceSigningKey");
  objc_msgSend(v8, "deviceConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[POJWTSigning encodeAndSignJWT:signingAlgorithm:key:certificate:error:](POJWTSigning, "encodeAndSignJWT:signingAlgorithm:key:certificate:error:", v9, v12, v14, objc_msgSend(v15, "deviceSigningCertificate"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v9, "body");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "zeroPassword");

    -[POAuthenticationProcess createLoginRequestWithContext:jwt:](self, "createLoginRequestWithContext:jwt:", v8, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {

      PO_LOG_PODiagnostics();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "requestIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v31 = v20;
        _os_log_impl(&dword_24440D000, v19, OS_LOG_TYPE_DEFAULT, "Sending login request: %{public}@", buf, 0xCu);

      }
      PO_LOG_POAuthenticationProcess();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = os_signpost_id_make_with_pointer(v21, v8);

      PO_LOG_POAuthenticationProcess();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_24440D000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "PlatformSSO_LoginRequest", " enableTelemetry=YES ", buf, 2u);
      }

      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_273;
      v27[3] = &unk_2514FFE10;
      v29 = v22;
      v27[4] = self;
      v28 = v10;
      -[POAuthenticationProcess performLoginRequestWithContext:request:completion:](self, "performLoginRequestWithContext:request:completion:", v8, v18, v27);

      v9 = 0;
    }
    else
    {
      v26 = __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_269();
      (*((void (**)(id, uint64_t, id, _QWORD))v10 + 2))(v10, 2, v8, 0);
    }

  }
  else
  {
    v25 = __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke();
    (*((void (**)(id, uint64_t, id, _QWORD))v10 + 2))(v10, 2, v8, 0);
  }

}

id __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to sign login request."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_269()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to create login request."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

void __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_273(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  POLoginResponseTokenJWT *v13;
  void *v14;
  POLoginResponseTokenJWT *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  POLoginResponseTokenJWT *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  BOOL v42;
  id v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  SecKeyRef v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  NSObject *v53;
  void *v54;
  POIDTokenJWT *v55;
  void *v56;
  POIDTokenJWT *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  uint64_t v63;
  id v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  void *v78;
  void *v79;
  id v80;
  uint64_t v81;
  id v82;
  _QWORD *v83;
  POLoginResponseTokenJWT *v84;
  _QWORD v85[4];
  id v86;
  id v87;
  uint64_t v88;
  POIDTokenJWT *v89;
  POLoginResponseTokenJWT *v90;
  id v91;
  _QWORD v92[4];
  id v93;
  id v94[5];
  id v95;
  uint8_t buf[4];
  uint64_t v97;
  uint64_t v98;

  v98 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  PO_LOG_POAuthenticationProcess();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24440D000, v9, OS_LOG_TYPE_INFO, "Login response received", buf, 2u);
  }

  PO_LOG_POAuthenticationProcess();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 134217984;
    v97 = a2;
    _os_signpost_emit_with_name_impl(&dword_24440D000, v11, OS_SIGNPOST_INTERVAL_END, v12, "PlatformSSO_LoginRequest", "result=%lu", buf, 0xCu);
  }

  if (a2 == 1)
  {
    v13 = [POLoginResponseTokenJWT alloc];
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v8, 4);
    v15 = -[POLoginResponseTokenJWT initWithString:](v13, "initWithString:", v14);

    if (v15)
    {
      v82 = v8;
      v16 = *(void **)(a1[4] + 40);
      -[POJWT decodedHeader](v15, "decodedHeader");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "enc");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = a1;
      if (objc_msgSend(v16, "containsObject:", v18))
      {

        goto LABEL_13;
      }
      v21 = *(void **)(a1[4] + 40);
      v22 = (void *)MEMORY[0x24BDD17C8];
      -[POJWT decodedHeader](v15, "decodedHeader");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "alg");
      v24 = v15;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[POJWT decodedHeader](v24, "decodedHeader");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "enc");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("%@,%@"), v25, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v21) = objc_msgSend(v21, "containsObject:", v28);

      v15 = v24;
      if ((v21 & 1) != 0)
      {
LABEL_13:
        objc_msgSend(v7, "deviceConfiguration");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "encryptionAlgorithm");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = v15;
        if ((objc_msgSend(v30, "isEqualToNumber:") & 1) != 0)
          objc_msgSend(v7, "apv");
        else
          objc_msgSend(v7, "nonce");
        v81 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "deviceConfiguration");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "encryptionAlgorithm");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "deviceConfiguration");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "deviceEncryptionKey");
        objc_msgSend(v7, "loginConfiguration");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "hpkePsk");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "loginConfiguration");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "hpkePsk_id");
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = v7;
        v39 = (void *)v37;
        v78 = v38;
        objc_msgSend(v38, "loginConfiguration");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "hpkeAuthPublicKey");
        v94[0] = 0;
        v42 = +[POJWTEncryption decodeAndDecryptJWT:encryptionAlgorithm:privateKey:otherInfo:psk:psk_id:authPublicKey:error:](POJWTEncryption, "decodeAndDecryptJWT:encryptionAlgorithm:privateKey:otherInfo:psk:psk_id:authPublicKey:error:", v84, v31, v33, v81, v35, v39, v41, v94);
        v43 = v94[0];

        if (v42)
        {
          v80 = v43;
          v7 = v78;
          objc_msgSend(v78, "deviceConfiguration");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "encryptionAlgorithm");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "isEqualToNumber:", 0x251520F48);

          v8 = v82;
          v15 = v84;
          if (!v46)
          {
LABEL_22:
            v52 = (void *)v81;
            if (+[POCoreConfigurationUtil platformSSODevModeEnabled](POCoreConfigurationUtil, "platformSSODevModeEnabled"))
            {
              PO_LOG_POAuthenticationProcess();
              v53 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
                __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_273_cold_1();

            }
            -[POLoginResponseTokenJWT decodedBody](v84, "decodedBody");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = [POIDTokenJWT alloc];
            objc_msgSend(v54, "id_token");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = -[POIDTokenJWT initWithString:](v55, "initWithString:", v56);

            if (v57)
            {
              -[POJWT decodedHeader](v57, "decodedHeader");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "kid");
              v59 = (void *)objc_claimAutoreleasedReturnValue();

              v60 = v80;
              if (objc_msgSend(v59, "length"))
              {
                v61 = (void *)v83[4];
                v85[0] = MEMORY[0x24BDAC760];
                v85[1] = 3221225472;
                v85[2] = __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_310;
                v85[3] = &unk_2514FFED8;
                v86 = v59;
                v91 = (id)v83[5];
                v62 = v78;
                v63 = v83[4];
                v87 = v62;
                v88 = v63;
                v89 = v57;
                v90 = v84;
                v64 = v62;
                v52 = (void *)v81;
                objc_msgSend(v61, "retrieveSigningKeyWithContext:keyId:completion:", v64, v86, v85);

              }
              else
              {
                v76 = __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_306();
                (*(void (**)(void))(v83[5] + 16))();
              }

            }
            else
            {
              v75 = __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_302();
              (*(void (**)(void))(v83[5] + 16))();
              v60 = v80;
            }

            v8 = v82;
            goto LABEL_38;
          }
          if ((objc_msgSend((id)v83[4], "validatePartyUInfo:context:", v84, v78) & 1) != 0)
          {
            objc_msgSend(v78, "deviceConfiguration");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = SecKeyCopyPublicKey((SecKeyRef)objc_msgSend(v47, "deviceEncryptionKey"));

            v49 = (void *)v83[4];
            objc_msgSend(v78, "apv");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = objc_msgSend(v49, "validatePartyVInfo:context:publicKey:", v50, v78, v48);

            if (v48)
              CFRelease(v48);
            if ((v51 & 1) != 0)
              goto LABEL_22;
            v77 = __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_297();
          }
          else
          {
            v74 = __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_293();
          }
          (*(void (**)(void))(v83[5] + 16))();
          v60 = v43;
          v52 = (void *)v81;
        }
        else
        {
          v52 = (void *)v81;
          v92[0] = MEMORY[0x24BDAC760];
          v92[1] = 3221225472;
          v92[2] = __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_290;
          v92[3] = &unk_2514FF9D0;
          v93 = v43;
          v65 = __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_290((uint64_t)v92);
          v7 = v78;
          (*(void (**)(void))(v83[5] + 16))();

          v8 = v82;
          v15 = v84;
          v60 = v43;
        }
LABEL_38:

        goto LABEL_39;
      }
      v66 = (void *)MEMORY[0x24BDD17C8];
      -[POJWT decodedHeader](v24, "decodedHeader");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "alg");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[POJWT decodedHeader](v24, "decodedHeader");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "enc");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "stringWithFormat:", CFSTR("alg = %@, enc = %@"), v68, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      v94[1] = (id)MEMORY[0x24BDAC760];
      v94[2] = (id)3221225472;
      v94[3] = __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_287;
      v94[4] = &unk_2514FF9D0;
      v95 = v71;
      v72 = v71;
      v73 = __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_287();
      (*(void (**)(void))(v83[5] + 16))();

      v8 = v82;
    }
    else
    {
      v20 = __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_279();
      (*(void (**)(void))(a1[5] + 16))();
    }
LABEL_39:

    goto LABEL_40;
  }
  v19 = __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_274();
  (*(void (**)(void))(a1[5] + 16))();
LABEL_40:

}

id __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_274()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("login request failed."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_279()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Failed to parse login response."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_287()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("unsupported login response algorithm and encryption."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_178_cold_1();

  return v0;
}

id __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_290(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1008, *(_QWORD *)(a1 + 32), CFSTR("Failed to decrypt login response."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v1;
}

id __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_293()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Failed to validate apu."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_297()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Failed to validate apv."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_302()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("No id_token in login response."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_306()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("No kid in login response id_token."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

void __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_310(uint64_t a1, const void *a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint8_t buf[16];

  PO_LOG_POAuthenticationProcess();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24440D000, v4, OS_LOG_TYPE_INFO, "JWKS response received", buf, 2u);
  }

  if (a2)
  {
    if (objc_msgSend(*(id *)(a1 + 48), "validateIdToken:context:key:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), a2))
    {
      v5 = *(_QWORD *)(a1 + 72);
      v6 = *(_QWORD *)(a1 + 40);
      v7 = objc_alloc(MEMORY[0x24BDBCE50]);
      objc_msgSend(*(id *)(a1 + 64), "rawBody");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "psso_initWithBase64URLEncodedString:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v5 + 16))(v5, 1, v6, v9);

    }
    else
    {
      v11 = __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_315();
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    }
    CFRelease(a2);
  }
  else
  {
    v12 = *(id *)(a1 + 32);
    v10 = __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_311();
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

  }
}

id __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_311()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("No key available with identifier."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_178_cold_1();

  return v0;
}

id __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_315()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("id_token signature check failed."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (id)createAuthenticationContextUsingLoginConfiguration:(id)a3 deviceConfiguration:(id)a4 userName:(id)a5
{
  id v8;
  id v9;
  id v10;
  POAuthenticationContext *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  POAuthenticationContext *v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(POAuthenticationContext);
  -[POAuthenticationContext setLoginConfiguration:](v11, "setLoginConfiguration:", v8);
  -[POAuthenticationContext setDeviceConfiguration:](v11, "setDeviceConfiguration:", v9);
  -[POAuthenticationContext setUserName:](v11, "setUserName:", v10);

  objc_msgSend(MEMORY[0x24BDD1858], "ephemeralSessionConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "set_preventsAppSSO:", 1);
  if (-[POAuthenticationProcess waitForConnectivity](self, "waitForConnectivity"))
  {
    objc_msgSend(v12, "setWaitsForConnectivity:", 1);
    -[POAuthenticationProcess timeoutIntervalForResource](self, "timeoutIntervalForResource");
    if (v13 == 0.0)
      v13 = 180.0;
    objc_msgSend(v12, "setTimeoutIntervalForResource:", v13);
  }
  objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:delegate:delegateQueue:", v12, self, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[POAuthenticationContext setUrlSession:](v11, "setUrlSession:", v14);

  -[POAuthenticationContext setScope:](v11, "setScope:", CFSTR("openid offline_access"));
  objc_msgSend(v8, "additionalScopes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");

  if (v16)
  {
    objc_msgSend(v8, "additionalScopes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByTrimmingCharactersInSet:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x24BDD17C8];
    -[POAuthenticationContext scope](v11, "scope");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("%@ %@"), v21, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[POAuthenticationContext setScope:](v11, "setScope:", v22);

  }
  if (v9)
  {
    if (!objc_msgSend(v9, "deviceEncryptionKey"))
    {
      v27 = 0;
      goto LABEL_13;
    }
    objc_msgSend(v9, "encryptionAlgorithm");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isEqualToNumber:", 0x251520F48);

    if (v24)
    {
      -[POAuthenticationContext nonce](v11, "nonce");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[POAuthenticationProcess createPartyVInfoWithNonce:apvKey:](self, "createPartyVInfoWithNonce:apvKey:", v25, objc_msgSend(v9, "deviceEncryptionKey"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[POAuthenticationContext setApv:](v11, "setApv:", v26);

    }
  }
  v27 = v11;
LABEL_13:

  return v27;
}

- (id)createPartyVInfoWithNonce:(id)a3 apvKey:(__SecKey *)a4
{
  void *v6;
  void *v7;
  SecKeyRef v8;
  void *v9;

  objc_msgSend(a3, "dataUsingEncoding:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("Apple"), "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = SecKeyCopyPublicKey(a4);
  -[POAuthenticationProcess createPartyVInfoWithNonce:prefixData:apvPublicKey:](self, "createPartyVInfoWithNonce:prefixData:apvPublicKey:", v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    CFRelease(v8);

  return v9;
}

- (id)createPartyVInfoWithNonce:(id)a3 prefixData:(id)a4 apvPublicKey:(__SecKey *)a5
{
  id v7;
  id v8;
  CFDataRef v9;
  id v10;
  void *v11;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;

  v7 = a3;
  v8 = a4;
  if (a5 && objc_msgSend(v7, "length"))
  {
    v9 = SecKeyCopyExternalRepresentation(a5, 0);
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    v15 = bswap32(objc_msgSend(v8, "length"));
    objc_msgSend(v10, "appendBytes:length:", &v15, 4);
    objc_msgSend(v10, "appendData:", v8);
    v14 = bswap32(-[__CFData length](v9, "length"));
    objc_msgSend(v10, "appendBytes:length:", &v14, 4);
    objc_msgSend(v10, "appendData:", v9);
    v13 = bswap32(objc_msgSend(v7, "length"));
    objc_msgSend(v10, "appendBytes:length:", &v13, 4);
    objc_msgSend(v10, "appendData:", v7);
    objc_msgSend(v10, "psso_base64URLEncodedString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)createNonceRequestWithContext:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  int v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BDD16B0]);
  objc_msgSend(v3, "loginConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nonceEndpointURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithURL:cachePolicy:timeoutInterval:", v6, 4, 30.0);

  objc_msgSend(v7, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v7, "addValue:forHTTPHeaderField:", CFSTR("application/x-www-form-urlencoded"), CFSTR("Content-type"));
  objc_msgSend(v7, "addValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Accept"));
  objc_msgSend(v3, "requestIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addValue:forHTTPHeaderField:", v8, CFSTR("client-request-id"));

  v9 = objc_alloc_init(MEMORY[0x24BDD1808]);
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("grant_type"), CFSTR("srv_challenge"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "loginConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "customNonceRequestValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v3, "loginConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "customNonceRequestValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v16;
  }
  objc_msgSend(v9, "setQueryItems:", v11);
  objc_msgSend(v9, "percentEncodedQuery");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dataUsingEncoding:", 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHTTPBody:", v18);

  PO_LOG_POAuthenticationProcess();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    -[POAuthenticationProcess createNonceRequestWithContext:].cold.1();

  PO_LOG_POAuthenticationProcess();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "requestIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543362;
    v24 = v21;
    _os_log_impl(&dword_24440D000, v20, OS_LOG_TYPE_INFO, "server nonce request: %{public}@", (uint8_t *)&v23, 0xCu);

  }
  return v7;
}

- (void)performNonceRequestWithContext:(id)a3 request:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void *v18;
  id v19;
  POAuthenticationProcess *v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __77__POAuthenticationProcess_performNonceRequestWithContext_request_completion___block_invoke;
  v18 = &unk_2514FFF28;
  v19 = v8;
  v20 = self;
  v21 = v9;
  v22 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  v14 = (void *)MEMORY[0x24950F7C4](&v15);
  -[POAuthenticationProcess _performNonceRequestWithContext:request:completion:](self, "_performNonceRequestWithContext:request:completion:", v13, v12, v14, v15, v16, v17, v18);

}

void __77__POAuthenticationProcess_performNonceRequestWithContext_request_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (a2 == 5 && objc_msgSend(*(id *)(a1 + 32), "retriesRemaining") >= 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "setRetriesRemaining:", objc_msgSend(*(id *)(a1 + 32), "retriesRemaining") - 1);
    PO_LOG_POAuthenticationProcess();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "requestIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v11 = v5;
      _os_log_impl(&dword_24440D000, v4, OS_LOG_TYPE_INFO, "retrying server nonce request: %{public}@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD17F0], "sleepForTimeInterval:", (double)objc_msgSend(*(id *)(a1 + 32), "retryDelay"));
    objc_msgSend(*(id *)(a1 + 40), "performNonceRequestWithContext:request:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "completionQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __77__POAuthenticationProcess_performNonceRequestWithContext_request_completion___block_invoke_338;
    v7[3] = &unk_2514FFF00;
    v8 = *(id *)(a1 + 56);
    v9 = a2;
    objc_msgSend(v6, "addOperationWithBlock:", v7);

  }
}

uint64_t __77__POAuthenticationProcess_performNonceRequestWithContext_request_completion___block_invoke_338(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_performNonceRequestWithContext:(id)a3 request:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(id *, void *, void *, void *);
  void *v21;
  POAuthenticationProcess *v22;
  id v23;
  id v24;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "urlSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke;
  v21 = &unk_2514FFE60;
  v23 = v8;
  v24 = v9;
  v22 = self;
  v12 = v8;
  v13 = v9;
  objc_msgSend(v11, "dataTaskWithRequest:completionHandler:", v10, &v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v12, "requestIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("Server Nonce Request: %@"), v16, v18, v19, v20, v21, v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTaskDescription:", v17);

  objc_msgSend(v14, "resume");
}

void __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  _BOOL4 v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  uint64_t v51;
  uint64_t v52;
  id (*v53)();
  void *v54;
  id v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;
  id v62;
  uint8_t buf[16];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  PO_LOG_POAuthenticationProcess();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24440D000, v10, OS_LOG_TYPE_INFO, "Nonce response received", buf, 2u);
  }

  if (v9)
  {
    if (v7)
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v7, 4);
    else
      v11 = 0;
    v17 = MEMORY[0x24BDAC760];
    v60[0] = MEMORY[0x24BDAC760];
    v60[1] = 3221225472;
    v60[2] = __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_339;
    v60[3] = &unk_2514FFCB0;
    v61 = v9;
    v62 = v11;
    v12 = v11;
    v18 = __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_339((uint64_t)v60);
    objc_msgSend(a1[4], "completionQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v17;
    v58[1] = 3221225472;
    v58[2] = __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_342;
    v58[3] = &unk_2514FFE38;
    v59 = a1[6];
    objc_msgSend(v19, "addOperationWithBlock:", v58);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v8;
      if (objc_msgSend(v12, "statusCode") >= 200 && objc_msgSend(v12, "statusCode") < 300)
      {
        v22 = +[POCoreConfigurationUtil platformSSODevModeEnabled](POCoreConfigurationUtil, "platformSSODevModeEnabled");
        PO_LOG_POAuthenticationProcess();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
        if (v22)
        {
          if (v24)
            __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_cold_1();
        }
        else if (v24)
        {
          __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_cold_2();
        }

        v48 = 0;
        objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 16, &v48);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v48;
        v16 = v26;
        if (!v25 || v26)
        {
          v32 = MEMORY[0x24BDAC760];
          v46[0] = MEMORY[0x24BDAC760];
          v46[1] = 3221225472;
          v46[2] = __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_351;
          v46[3] = &unk_2514FF9D0;
          v33 = &v47;
          v47 = v26;
          v34 = __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_351((uint64_t)v46);
          objc_msgSend(a1[4], "completionQueue");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v44[0] = v32;
          v44[1] = 3221225472;
          v44[2] = __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_354;
          v44[3] = &unk_2514FFE38;
          v45 = a1[6];
          objc_msgSend(v35, "addOperationWithBlock:", v44);

          v36 = v45;
        }
        else
        {
          objc_msgSend(a1[5], "loginConfiguration");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "nonceResponseKeypath");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            objc_msgSend(a1[5], "loginConfiguration");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "nonceResponseKeypath");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "valueForKeyPath:", v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (v31)
            {
              objc_msgSend(a1[5], "setServerNonce:", v31);
            }
            else
            {
              objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("Nonce"));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1[5], "setServerNonce:", v39);

            }
          }
          else
          {
            objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("Nonce"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1[5], "setServerNonce:", v29);
          }

          objc_msgSend(a1[5], "serverNonce");
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(a1[4], "completionQueue");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (v37)
          {
            v42[0] = MEMORY[0x24BDAC760];
            v42[1] = 3221225472;
            v42[2] = __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_2_357;
            v42[3] = &unk_2514FFE38;
            v33 = &v43;
            v43 = a1[6];
            v38 = v42;
          }
          else
          {
            v40[0] = MEMORY[0x24BDAC760];
            v40[1] = 3221225472;
            v40[2] = __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_3;
            v40[3] = &unk_2514FFE38;
            v33 = &v41;
            v41 = a1[6];
            v38 = v40;
          }
          objc_msgSend(v36, "addOperationWithBlock:", v38);
        }

      }
      else
      {
        v13 = MEMORY[0x24BDAC760];
        v51 = MEMORY[0x24BDAC760];
        v52 = 3221225472;
        v53 = __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_2_347;
        v54 = &unk_2514FF9D0;
        v55 = v12;
        v14 = __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_2_347();
        objc_msgSend(a1[4], "completionQueue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v49[0] = v13;
        v49[1] = 3221225472;
        v49[2] = __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_350;
        v49[3] = &unk_2514FFE38;
        v50 = a1[6];
        objc_msgSend(v15, "addOperationWithBlock:", v49);

        v16 = v55;
      }

    }
    else
    {
      v20 = __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_2();
      objc_msgSend(a1[4], "completionQueue");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v56[0] = MEMORY[0x24BDAC760];
      v56[1] = 3221225472;
      v56[2] = __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_346;
      v56[3] = &unk_2514FFE38;
      v57 = a1[6];
      objc_msgSend(v21, "addOperationWithBlock:", v56);

      v12 = v57;
    }
  }

}

id __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_339(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1009, *(_QWORD *)(a1 + 32), CFSTR("Failed to retrieve server nonce."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_157_cold_1();

  return v1;
}

uint64_t __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_342(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_2()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1009, CFSTR("Not HTTP response for server nonce."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

uint64_t __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_346(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_2_347()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1009, CFSTR("server nonce request failed."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_167_cold_1();

  return v0;
}

uint64_t __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_350(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_351(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1008, *(_QWORD *)(a1 + 32), CFSTR("Failed to parse server nonce response."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v1;
}

uint64_t __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_354(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_2_357(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)createEmbeddedAssertionWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  POMutableAssertionJWTBody *v6;
  void *v7;
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
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  POMutableAssertionTokenJWT *v24;
  void *v25;
  POMutableJWTHeader *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "loginConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audience");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc_init(POMutableAssertionJWTBody);
    objc_msgSend(v3, "loginConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "customAssertionRequestBodyClaims");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[POMutableAssertionJWTBody addCustomClaims:](v6, "addCustomClaims:", v8);

    objc_msgSend(v3, "loginConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "audience");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[POMutableAssertionJWTBody setAud:](v6, "setAud:", v10);

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[POMutableAssertionJWTBody setIat:](v6, "setIat:", v11);

    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 300.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[POMutableAssertionJWTBody setExp:](v6, "setExp:", v12);

    objc_msgSend(v3, "userName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[POMutableAssertionJWTBody setIss:](v6, "setIss:", v13);

    objc_msgSend(v3, "userName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[POMutableAssertionJWTBody setSub:](v6, "setSub:", v14);

    objc_msgSend(v3, "nonce");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[POMutableAssertionJWTBody setNonce:](v6, "setNonce:", v15);

    objc_msgSend(v3, "loginConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "serverNonceClaimName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");

    if (v18)
    {
      objc_msgSend(v3, "loginConfiguration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "serverNonceClaimName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v20;
      objc_msgSend(v3, "serverNonce");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v21;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[POMutableAssertionJWTBody addCustomClaims:](v6, "addCustomClaims:", v22);

    }
    else
    {
      objc_msgSend(v3, "serverNonce");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[POMutableAssertionJWTBody setRequest_nonce:](v6, "setRequest_nonce:", v19);
    }

    objc_msgSend(v3, "scope");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[POMutableAssertionJWTBody setScope:](v6, "setScope:", v25);

    v26 = objc_alloc_init(POMutableJWTHeader);
    objc_msgSend(v3, "deviceConfiguration");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "sdkVersionString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "compare:", &unk_251521120);

    if (v29 == -1)
      v30 = CFSTR("JWT");
    else
      v30 = CFSTR("platformsso-login-assertion+jwt");
    -[POMutableJWTHeader setTyp:](v26, "setTyp:", v30);
    objc_msgSend(v3, "loginConfiguration");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "customAssertionRequestHeaderClaims");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[POMutableJWTHeader addCustomClaims:](v26, "addCustomClaims:", v32);

    v24 = objc_alloc_init(POMutableAssertionTokenJWT);
    -[POMutableAssertionTokenJWT setBody:](v24, "setBody:", v6);
    -[POMutableJWT setHeader:](v24, "setHeader:", v26);

  }
  else
  {
    v23 = __62__POAuthenticationProcess_createEmbeddedAssertionWithContext___block_invoke();
    v24 = 0;
  }

  return v24;
}

id __62__POAuthenticationProcess_createEmbeddedAssertionWithContext___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("audience missing from configuration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (id)createEmbeddedPasswordAssertionWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "password");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[POAuthenticationProcess createEmbeddedAssertionWithContext:](self, "createEmbeddedAssertionWithContext:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "password");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v6, "body");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPassword:", v8);

    objc_msgSend(v6, "header");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTyp:", CFSTR("platformsso-encrypted-login-assertion+jwt"));

  }
  else
  {
    v11 = __70__POAuthenticationProcess_createEmbeddedPasswordAssertionWithContext___block_invoke();
    v6 = 0;
  }

  return v6;
}

id __70__POAuthenticationProcess_createEmbeddedPasswordAssertionWithContext___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Missing password."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (id)createLoginJWTWithContext:(id)a3 embeddedAssertion:(id)a4
{
  id v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  POMutableLoginJWTBody *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  POMutableLoginTokenJWT *v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  const __CFString *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  _BOOL4 v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  POMutableJWTHeader *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  const __CFString *v91;
  void *v92;
  void *v93;
  void *v94;
  char v95;
  void *v96;
  int v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  int v104;
  void *v105;
  void *v106;
  void *v107;
  const __CFString *v108;
  uint64_t v109;
  const __CFString *v110;
  void *v111;
  const __CFString *v112;
  void *v113;
  const __CFString *v114;
  void *v115;
  void *v116;
  uint64_t v117;
  void *v118;
  _QWORD v119[3];

  v119[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (unint64_t)a4;
  objc_msgSend(v6, "password");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v7 | v8;

  if (!v9)
  {
    v12 = __71__POAuthenticationProcess_createLoginJWTWithContext_embeddedAssertion___block_invoke();
    goto LABEL_16;
  }
  objc_msgSend(v6, "password");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v10)
  {
    v11 = __71__POAuthenticationProcess_createLoginJWTWithContext_embeddedAssertion___block_invoke_379();
LABEL_16:
    v45 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v6, "loginConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clientID");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_14;
  v15 = (void *)v14;
  objc_msgSend(v6, "scope");
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
LABEL_13:

LABEL_14:
    goto LABEL_15;
  }
  v17 = (void *)v16;
  objc_msgSend(v6, "nonce");
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
  {

    goto LABEL_13;
  }
  v19 = (void *)v18;
  objc_msgSend(v6, "serverNonce");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
LABEL_15:
    v44 = __71__POAuthenticationProcess_createLoginJWTWithContext_embeddedAssertion___block_invoke_383();
    goto LABEL_16;
  }
  v21 = objc_alloc_init(POMutableLoginJWTBody);
  objc_msgSend(v6, "loginConfiguration");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "customLoginRequestBodyClaims");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMutableLoginJWTBody addCustomClaims:](v21, "addCustomClaims:", v23);

  objc_msgSend(v6, "loginConfiguration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "clientID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMutableLoginJWTBody setClient_id:](v21, "setClient_id:", v25);

  objc_msgSend(v6, "loginConfiguration");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "clientID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMutableLoginJWTBody setIss:](v21, "setIss:", v27);

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 300.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMutableLoginJWTBody setExp:](v21, "setExp:", v28);

  objc_msgSend(v6, "scope");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMutableLoginJWTBody setScope:](v21, "setScope:", v29);

  objc_msgSend(v6, "nonce");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMutableLoginJWTBody setNonce:](v21, "setNonce:", v30);

  v31 = (void *)MEMORY[0x24BDD1808];
  objc_msgSend(v6, "loginConfiguration");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "tokenEndpointURL");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "absoluteString");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "componentsWithString:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "setQuery:", 0);
  objc_msgSend(v35, "setQueryItems:", 0);
  objc_msgSend(v35, "setFragment:", 0);
  v105 = v35;
  objc_msgSend(v35, "URL");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "absoluteString");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMutableLoginJWTBody setAud:](v21, "setAud:", v37);

  objc_msgSend(v6, "loginConfiguration");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "serverNonceClaimName");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v39, "length");

  if (v40)
  {
    objc_msgSend(v6, "loginConfiguration");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "serverNonceClaimName");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = v42;
    objc_msgSend(v6, "serverNonce");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v119[0] = v40;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v119, &v118, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[POMutableLoginJWTBody addCustomClaims:](v21, "addCustomClaims:", v43);

  }
  else
  {
    objc_msgSend(v6, "serverNonce");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[POMutableLoginJWTBody setRequest_nonce:](v21, "setRequest_nonce:", v41);
  }

  objc_msgSend(v6, "userName");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMutableLoginJWTBody setUsername:](v21, "setUsername:", v47);

  objc_msgSend(v6, "userName");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMutableLoginJWTBody setSub:](v21, "setSub:", v48);

  objc_msgSend(v6, "password");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    objc_msgSend(v6, "password");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)objc_msgSend(v50, "mutableCopy");
    -[POMutableLoginJWTBody setPassword:](v21, "setPassword:", v51);

    -[POMutableLoginJWTBody setGrant_type:](v21, "setGrant_type:", CFSTR("password"));
  }
  if (v7)
  {
    if (objc_msgSend(v6, "loginType") == 2 || objc_msgSend(v6, "loginType") == 3)
    {
      -[POMutableLoginJWTBody setAssertion:](v21, "setAssertion:", v7);
LABEL_25:
      v52 = CFSTR("urn:ietf:params:oauth:grant-type:jwt-bearer");
LABEL_26:
      -[POMutableLoginJWTBody setGrant_type:](v21, "setGrant_type:", v52);
      goto LABEL_27;
    }
    if (objc_msgSend(v6, "loginType") == 1)
    {
      -[POMutableLoginJWTBody setAssertion:](v21, "setAssertion:", v7);
      if (!objc_msgSend(v6, "federated"))
        goto LABEL_25;
      objc_msgSend(v6, "tokenTypeNamespace");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = objc_msgSend(v94, "isEqualToString:", CFSTR("urn:oasis:names:tc:SAML:1.0:assertion"));

      if ((v95 & 1) != 0)
      {
        v52 = CFSTR("urn:ietf:params:oauth:grant-type:saml1_1-bearer");
        goto LABEL_26;
      }
      objc_msgSend(v6, "tokenTypeNamespace");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = objc_msgSend(v96, "isEqualToString:", CFSTR("urn:oasis:names:tc:SAML:2.0:assertion"));

      if (v97)
      {
        v52 = CFSTR("urn:ietf:params:oauth:grant-type:saml2-bearer");
        goto LABEL_26;
      }
    }
  }
LABEL_27:
  v53 = objc_msgSend(v6, "loginType");
  if (v53 == 1)
  {
    v54 = &unk_2515210C0;
    goto LABEL_34;
  }
  if (v53 == 3)
  {
    v54 = &unk_2515210F0;
    goto LABEL_34;
  }
  if (v53 == 2
    && +[POSecKeyHelper checkIfBiometricConstraintsForSigningForKey:](POSecKeyHelper, "checkIfBiometricConstraintsForSigningForKey:", objc_msgSend(v6, "embeddedAssertionSigningKey")))
  {
    v54 = &unk_2515210D8;
LABEL_34:
    -[POMutableLoginJWTBody setAmr:](v21, "setAmr:", v54);
  }
  objc_msgSend(v6, "deviceConfiguration");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "userAuthorizationMode");
  if (v56 == 3)
  {
    v104 = 0;
  }
  else
  {
    objc_msgSend(v6, "deviceConfiguration");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v40, "newUserAuthorizationMode") == 3)
    {
      v104 = 0;
    }
    else
    {
      objc_msgSend(v6, "deviceConfiguration");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v76, "supportsAuthorization"))
      {
LABEL_54:

        goto LABEL_55;
      }
      v101 = v76;
      v104 = 1;
    }
  }
  objc_msgSend(v6, "deviceConfiguration");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "administratorGroups");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v58, "count"))
  {

    v59 = 1;
    if (!v104)
      goto LABEL_42;
    goto LABEL_41;
  }
  v103 = v40;
  v100 = v55;
  objc_msgSend(v6, "deviceConfiguration");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "authorizationGroups");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v75, "count"))
  {
    v59 = 1;
  }
  else
  {
    objc_msgSend(v6, "deviceConfiguration");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "otherGroups");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v98, "count") != 0;

  }
  v55 = v100;
  v40 = v103;
  if ((v104 & 1) != 0)
LABEL_41:

LABEL_42:
  if (v56 != 3)
  {

    if (!v59)
      goto LABEL_55;
    goto LABEL_46;
  }

  if (v59)
  {
LABEL_46:
    v60 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v6, "deviceConfiguration");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "administratorGroups");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "addObjectsFromArray:", v62);

    objc_msgSend(v6, "deviceConfiguration");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "authorizationGroups");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "allValues");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "addObjectsFromArray:", v65);

    v55 = v60;
    objc_msgSend(v6, "deviceConfiguration");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "otherGroups");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "addObjectsFromArray:", v67);

    objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", v60);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "array");
    v68 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "loginConfiguration");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "groupRequestClaimName");
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    if (v70)
    {
      objc_msgSend(v6, "loginConfiguration");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "groupRequestClaimName");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v116 = v72;
      v117 = v68;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v117, &v116, 1);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[POMutableLoginJWTBody addCustomClaims:](v21, "addCustomClaims:", v73);
    }
    else
    {
      v114 = CFSTR("claims");
      v112 = CFSTR("id_token");
      v109 = v68;
      v110 = CFSTR("groups");
      v108 = CFSTR("values");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v109, &v108, 1);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = v71;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v111, &v110, 1);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = v72;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v113, &v112, 1);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = v73;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v115, &v114, 1);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[POMutableLoginJWTBody addCustomClaims:](v21, "addCustomClaims:", v77);

    }
    v76 = (void *)v68;
    v40 = v102;
    goto LABEL_54;
  }
LABEL_55:
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMutableLoginJWTBody setIat:](v21, "setIat:", v78);

  -[POAuthenticationProcess addCryptoHeadersToJWTBody:context:](self, "addCryptoHeadersToJWTBody:context:", v21, v6);
  objc_msgSend(v6, "loginConfiguration");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v79, "includePreviousRefreshTokenInLoginRequest"))
  {
LABEL_59:

    goto LABEL_60;
  }
  objc_msgSend(v6, "loginConfiguration");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "previousRefreshTokenClaimName");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v81, "length");

  if (v82)
  {
    objc_msgSend(v6, "refreshToken");
    v83 = (void *)objc_claimAutoreleasedReturnValue();

    if (v83)
    {
      objc_msgSend(v6, "loginConfiguration");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "previousRefreshTokenClaimName");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = v84;
      objc_msgSend(v6, "refreshToken");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v107 = v85;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v107, &v106, 1);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      -[POMutableLoginJWTBody addCustomClaims:](v21, "addCustomClaims:", v86);

      goto LABEL_59;
    }
  }
LABEL_60:
  v87 = objc_alloc_init(POMutableJWTHeader);
  objc_msgSend(v6, "deviceConfiguration");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "sdkVersionString");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = objc_msgSend(v89, "compare:", &unk_251521120);

  if (v90 == -1)
    v91 = CFSTR("JWT");
  else
    v91 = CFSTR("platformsso-login-request+jwt");
  -[POMutableJWTHeader setTyp:](v87, "setTyp:", v91);
  objc_msgSend(v6, "loginConfiguration");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "customLoginRequestHeaderClaims");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMutableJWTHeader addCustomClaims:](v87, "addCustomClaims:", v93);

  v45 = objc_alloc_init(POMutableLoginTokenJWT);
  -[POMutableLoginTokenJWT setBody:](v45, "setBody:", v21);
  -[POMutableJWT setHeader:](v45, "setHeader:", v87);

LABEL_17:
  return v45;
}

id __71__POAuthenticationProcess_createLoginJWTWithContext_embeddedAssertion___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Missing password or assertion."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __71__POAuthenticationProcess_createLoginJWTWithContext_embeddedAssertion___block_invoke_379()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("unable to use both password and assertion."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __71__POAuthenticationProcess_createLoginJWTWithContext_embeddedAssertion___block_invoke_383()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Missing required values."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (void)addCryptoHeadersToJWTBody:(id)a3 context:(id)a4
{
  void *v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[3];
  _QWORD v28[3];
  const __CFString *v29;
  void *v30;
  _QWORD v31[3];
  _QWORD v32[3];
  const __CFString *v33;
  _QWORD v34[3];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "deviceConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encryptionAlgorithm");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToNumber:", 0x251520F48);

  if (v10)
  {
    v33 = CFSTR("jwe_crypto");
    v31[0] = CFSTR("alg");
    v31[1] = CFSTR("enc");
    v32[0] = CFSTR("ECDH-ES");
    v32[1] = CFSTR("A256GCM");
    v31[2] = CFSTR("apv");
    objc_msgSend(v6, "apv");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addCustomClaims:", v13);
  }
  else
  {
    v25 = v7;
    objc_msgSend(v6, "deviceConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "encryptionAlgorithm");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[POJWTEncryption algorithmWithEncryptionAlgorithm:](POJWTEncryption, "algorithmWithEncryptionAlgorithm:", v15);
    v16 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "deviceConfiguration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = SecKeyCopyExternalRepresentation((SecKeyRef)objc_msgSend(v17, "deviceEncryptionPublicKey"), 0);

    objc_msgSend(v12, "psso_sha256Hash");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "base64EncodedStringWithOptions:", 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "loginConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "hpkePsk");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)v16;
    if (v19)
    {
      objc_msgSend(v6, "loginConfiguration");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hpkePsk_id");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v17 != 0;
    }
    else
    {
      v20 = 0;
    }
    objc_msgSend(v6, "loginConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "encValueForPsk:auth:", v20, objc_msgSend(v21, "hpkeAuthPublicKey") != 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {

    }
    v28[2] = v7;
    v29 = CFSTR("jwe_crypto");
    v27[0] = CFSTR("alg");
    v27[1] = CFSTR("enc");
    v28[0] = CFSTR("dir");
    v28[1] = v22;
    v27[2] = CFSTR("kid");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addCustomClaims:", v24);

    v11 = v26;
  }

}

- (id)createLoginRequestWithContext:(id)a3 jwt:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  __CFString *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  const __CFAllocator *v40;
  __CFString *v41;
  const __CFAllocator *v42;
  CFDataRef ExternalRepresentation;
  id v44;
  id v45;
  id v46;
  _QWORD v48[3];

  v48[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (objc_class *)MEMORY[0x24BDD16B0];
  v7 = a4;
  v8 = [v6 alloc];
  objc_msgSend(v5, "loginConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tokenEndpointURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithURL:cachePolicy:timeoutInterval:", v10, 4, 30.0);

  objc_msgSend(v11, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v11, "addValue:forHTTPHeaderField:", CFSTR("application/x-www-form-urlencoded"), CFSTR("Content-type"));
  objc_msgSend(v5, "deviceConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sdkVersionString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "compare:", &unk_251521120);

  if (v14 == -1)
    v15 = CFSTR("application/json");
  else
    v15 = CFSTR("application/platformsso-login-response+jwt");
  objc_msgSend(v11, "addValue:forHTTPHeaderField:", v15, CFSTR("Accept"));
  objc_msgSend(v5, "requestIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addValue:forHTTPHeaderField:", v16, CFSTR("client-request-id"));

  v17 = objc_alloc_init(MEMORY[0x24BDD1808]);
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("platform_sso_version"), CFSTR("1.0"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v18;
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("grant_type"), CFSTR("urn:ietf:params:oauth:grant-type:jwt-bearer"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "loginType") == 100
    && (objc_msgSend(v5, "loginConfiguration"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v21, "customRefreshRequestValues"),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v22,
        v21,
        v22))
  {
    objc_msgSend(v5, "loginConfiguration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "customRefreshRequestValues");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "loginConfiguration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "customLoginRequestValues");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
      goto LABEL_10;
    objc_msgSend(v5, "loginConfiguration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "customLoginRequestValues");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v24;
  objc_msgSend(v20, "arrayByAddingObjectsFromArray:", v24);
  v28 = objc_claimAutoreleasedReturnValue();

  v20 = (void *)v28;
LABEL_10:
  objc_msgSend(v17, "setQueryItems:", v20);
  objc_msgSend(v17, "percentEncodedQuery");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "dataUsingEncoding:", 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v30, "mutableCopy");

  objc_msgSend(v5, "deviceConfiguration");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "sdkVersionString");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "compare:", &unk_251521120);

  if (v34 == -1)
    v35 = CFSTR("request");
  else
    v35 = CFSTR("assertion");
  objc_msgSend(v5, "loginConfiguration");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "customRequestJWTParameterName");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "length");

  if (v38)
  {
    objc_msgSend(v5, "loginConfiguration");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "customRequestJWTParameterName");
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v40 = (const __CFAllocator *)SecCFAllocatorZeroize();
  v41 = (__CFString *)CFStringCreateWithFormat(v40, 0, CFSTR("&%@=%@"), v35, v7);

  if (v41)
  {
    v42 = (const __CFAllocator *)SecCFAllocatorZeroize();
    ExternalRepresentation = CFStringCreateExternalRepresentation(v42, v41, 0x8000100u, 0);
    if (ExternalRepresentation)
    {
      objc_msgSend(v31, "appendData:", ExternalRepresentation);
      objc_msgSend(v11, "setHTTPBody:", v31);
      v44 = v11;
    }
    else
    {
      v46 = __61__POAuthenticationProcess_createLoginRequestWithContext_jwt___block_invoke();
      v44 = 0;
    }

  }
  else
  {
    v45 = __61__POAuthenticationProcess_createLoginRequestWithContext_jwt___block_invoke();
    v44 = 0;
  }

  return v44;
}

id __61__POAuthenticationProcess_createLoginRequestWithContext_jwt___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to create request."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (void)performLoginRequestWithContext:(id)a3 request:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(id *, void *, void *, void *);
  void *v23;
  POAuthenticationProcess *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  PO_LOG_POAuthenticationProcess();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "requestIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v28 = v12;
    _os_log_impl(&dword_24440D000, v11, OS_LOG_TYPE_INFO, "Sending login request: %{public}@", buf, 0xCu);

  }
  objc_msgSend(v8, "urlSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke;
  v23 = &unk_2514FFE60;
  v25 = v8;
  v26 = v9;
  v24 = self;
  v14 = v8;
  v15 = v9;
  objc_msgSend(v13, "dataTaskWithRequest:completionHandler:", v10, &v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v14, "requestIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("Login Request: %@"), v18, v20, v21, v22, v23, v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTaskDescription:", v19);

  objc_msgSend(v16, "resume");
}

void __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  _BOOL4 v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void **v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  id *v37;
  id *v38;
  _QWORD *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  id (*v62)();
  void *v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  _QWORD v68[4];
  id v69;
  id v70;
  _QWORD v71[4];
  id v72;
  id v73;
  uint8_t buf[16];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  PO_LOG_POAuthenticationProcess();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24440D000, v10, OS_LOG_TYPE_INFO, "Login response received", buf, 2u);
  }

  if (v9)
  {
    if (v7)
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v7, 4);
    else
      v11 = 0;
    v15 = MEMORY[0x24BDAC760];
    v71[0] = MEMORY[0x24BDAC760];
    v71[1] = 3221225472;
    v71[2] = __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_451;
    v71[3] = &unk_2514FFCB0;
    v72 = v9;
    v73 = v11;
    v16 = v11;
    v17 = __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_451((uint64_t)v71);
    objc_msgSend(a1[4], "completionQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = v15;
    v68[1] = 3221225472;
    v68[2] = __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_454;
    v68[3] = &unk_2514FFE88;
    v70 = a1[6];
    v69 = a1[5];
    objc_msgSend(v18, "addOperationWithBlock:", v68);

    v19 = v72;
    goto LABEL_36;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = +[POCoreConfigurationUtil platformSSODevModeEnabled](POCoreConfigurationUtil, "platformSSODevModeEnabled");
    PO_LOG_POAuthenticationProcess();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
    if (v12)
    {
      if (v14)
        __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_cold_1();
    }
    else if (v14)
    {
      __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_cold_2();
    }

    v16 = v8;
    if (objc_msgSend(v16, "statusCode") >= 200 && objc_msgSend(v16, "statusCode") < 300)
    {
      objc_msgSend(a1[4], "completionQueue");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = MEMORY[0x24BDAC760];
      v43[1] = 3221225472;
      v43[2] = __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_4;
      v43[3] = &unk_2514FFF50;
      v22 = &v46;
      v46 = a1[6];
      v44 = a1[5];
      v45 = v7;
      objc_msgSend(v40, "addOperationWithBlock:", v43);

      v30 = v44;
    }
    else
    {
      v60 = MEMORY[0x24BDAC760];
      v61 = 3221225472;
      v62 = __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_459;
      v63 = &unk_2514FF9D0;
      v22 = &v64;
      v23 = v16;
      v64 = v23;
      v24 = __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_459();
      if (objc_msgSend(v23, "statusCode") == 401
        && (objc_msgSend(a1[5], "loginConfiguration"),
            v25 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v25, "invalidCredentialPredicate"),
            v26 = (void *)objc_claimAutoreleasedReturnValue(),
            v26,
            v25,
            !v26))
      {
        objc_msgSend(a1[4], "completionQueue");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v57[0] = MEMORY[0x24BDAC760];
        v57[1] = 3221225472;
        v57[2] = __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_462;
        v57[3] = &unk_2514FFE88;
        v59 = a1[6];
        v58 = a1[5];
        objc_msgSend(v41, "addOperationWithBlock:", v57);

        v30 = v59;
      }
      else
      {
        if (objc_msgSend(v23, "statusCode") == 400 || objc_msgSend(v23, "statusCode") == 401)
        {
          objc_msgSend(a1[5], "loginConfiguration");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "invalidCredentialPredicate");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v7)
          {
            if (v28)
            {
              v56 = 0;
              objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 16, &v56);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = v56;
              v31 = (void *)MEMORY[0x24BDD1758];
              objc_msgSend(a1[5], "loginConfiguration");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "invalidCredentialPredicate");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "predicateWithFormat:", v33);
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              LODWORD(v32) = objc_msgSend(v34, "evaluateWithObject:", v29);
              if ((_DWORD)v32)
              {
                PO_LOG_POAuthenticationProcess();
                v35 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_24440D000, v35, OS_LOG_TYPE_INFO, "Credentials are not correct", buf, 2u);
                }

                if (objc_msgSend(a1[5], "loginType") == 2 || objc_msgSend(a1[5], "loginType") == 3)
                {
                  objc_msgSend(a1[4], "completionQueue");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v53[0] = MEMORY[0x24BDAC760];
                  v53[1] = 3221225472;
                  v53[2] = __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_466;
                  v53[3] = &unk_2514FFE88;
                  v37 = &v55;
                  v55 = a1[6];
                  v38 = &v54;
                  v54 = a1[5];
                  v39 = v53;
                }
                else
                {
                  objc_msgSend(a1[4], "completionQueue");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v50[0] = MEMORY[0x24BDAC760];
                  v50[1] = 3221225472;
                  v50[2] = __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_2_467;
                  v50[3] = &unk_2514FFE88;
                  v37 = &v52;
                  v52 = a1[6];
                  v38 = &v51;
                  v51 = a1[5];
                  v39 = v50;
                }
                objc_msgSend(v36, "addOperationWithBlock:", v39);

                v22 = &v64;
                goto LABEL_35;
              }

              v22 = &v64;
            }
          }
        }
        objc_msgSend(a1[4], "completionQueue");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v47[0] = MEMORY[0x24BDAC760];
        v47[1] = 3221225472;
        v47[2] = __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_3;
        v47[3] = &unk_2514FFE88;
        v49 = a1[6];
        v48 = a1[5];
        objc_msgSend(v42, "addOperationWithBlock:", v47);

        v30 = v49;
      }
    }
LABEL_35:

    v19 = *v22;
LABEL_36:

    goto LABEL_37;
  }
  v20 = __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_2();
  objc_msgSend(a1[4], "completionQueue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = MEMORY[0x24BDAC760];
  v65[1] = 3221225472;
  v65[2] = __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_458;
  v65[3] = &unk_2514FFE88;
  v67 = a1[6];
  v66 = a1[5];
  objc_msgSend(v21, "addOperationWithBlock:", v65);

  v16 = v67;
LABEL_37:

}

id __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_451(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1009, *(_QWORD *)(a1 + 32), CFSTR("Failed to login."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_157_cold_1();

  return v1;
}

uint64_t __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_454(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 5, *(_QWORD *)(a1 + 32), 0);
}

id __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_2()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1009, CFSTR("Not HTTP response for login."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

uint64_t __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_458(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 3, *(_QWORD *)(a1 + 32), 0);
}

id __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_459()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1009, CFSTR("Login request failed."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_167_cold_1();

  return v0;
}

uint64_t __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_462(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 4, *(_QWORD *)(a1 + 32), 0);
}

id __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_2_463()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Exception when evaluating invalidCredentialPredicate: %{public}@"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_178_cold_1();

  return v0;
}

uint64_t __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_466(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 2, *(_QWORD *)(a1 + 32), 0);
}

uint64_t __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_2_467(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 4, *(_QWORD *)(a1 + 32), 0);
}

uint64_t __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 3, *(_QWORD *)(a1 + 32), 0);
}

uint64_t __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(a1[6] + 16))(a1[6], 1, a1[4], a1[5]);
}

- (void)retrieveSigningKeyWithContext:(id)a3 keyId:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __SecKey *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, void *, void *, void *);
  void *v38;
  POAuthenticationProcess *v39;
  id v40;
  id v41;
  id v42;
  os_signpost_id_t v43;
  uint8_t buf[16];
  _QWORD v45[4];
  id v46;
  __SecKey *v47;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "jwksStorageProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "extensionIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "jwksCacheForExtensionIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14
    && (objc_msgSend(v8, "loginConfiguration"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v15, "jwksTrustedRootCertificates"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = -[POAuthenticationProcess findKey:inJWKSData:rootCertificates:](self, "findKey:inJWKSData:rootCertificates:", v9, v14, v16), v16, v15, v17))
  {
    PO_LOG_POAuthenticationProcess();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[POAuthenticationProcess retrieveSigningKeyWithContext:keyId:completion:].cold.1();

    -[POAuthenticationProcess completionQueue](self, "completionQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke;
    v45[3] = &unk_2514FFF00;
    v46 = v10;
    v47 = v17;
    v20 = v10;
    objc_msgSend(v19, "addOperationWithBlock:", v45);

    v21 = v46;
  }
  else
  {
    PO_LOG_POAuthenticationProcess();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_signpost_id_make_with_pointer(v22, v8);

    PO_LOG_POAuthenticationProcess();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_24440D000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v23, "PlatformSSO_JWKSRequest", " enableTelemetry=YES ", buf, 2u);
    }

    objc_msgSend(v8, "urlSession");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loginConfiguration");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "jwksEndpointURL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = MEMORY[0x24BDAC760];
    v36 = 3221225472;
    v37 = __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_470;
    v38 = &unk_2514FFFA0;
    v42 = v10;
    v43 = v23;
    v39 = self;
    v29 = v8;
    v40 = v29;
    v41 = v9;
    v30 = v10;
    objc_msgSend(v26, "dataTaskWithURL:completionHandler:", v28, &v35);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v29, "requestIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringWithFormat:", CFSTR("JWKS Request: %@"), v33, v35, v36, v37, v38, v39);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setTaskDescription:", v34);

    objc_msgSend(v31, "resume");
    v21 = v42;
  }

}

uint64_t __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_470(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void **v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  os_signpost_id_t v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  os_signpost_id_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  _QWORD v43[5];
  id v44;
  id v45;
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  uint64_t v50;
  uint64_t v51;
  id (*v52)();
  void *v53;
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  id v61;
  uint8_t buf[16];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  PO_LOG_POAuthenticationProcess();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24440D000, v10, OS_LOG_TYPE_INFO, "JWKS network response received", buf, 2u);
  }

  if (v9)
  {
    if (v7)
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v7, 4);
    else
      v11 = 0;
    v21 = MEMORY[0x24BDAC760];
    v59[0] = MEMORY[0x24BDAC760];
    v59[1] = 3221225472;
    v59[2] = __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_471;
    v59[3] = &unk_2514FFCB0;
    v60 = v9;
    v61 = v11;
    v12 = v11;
    v22 = __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_471((uint64_t)v59);
    PO_LOG_POAuthenticationProcess();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v25 = *(_QWORD *)(a1 + 64);
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_24440D000, v24, OS_SIGNPOST_INTERVAL_END, v25, "PlatformSSO_JWKSRequest", "error", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "completionQueue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v21;
    v57[1] = 3221225472;
    v57[2] = __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_474;
    v57[3] = &unk_2514FFE38;
    v58 = *(id *)(a1 + 56);
    objc_msgSend(v26, "addOperationWithBlock:", v57);

    v27 = v60;
LABEL_29:

    goto LABEL_30;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v8;
    if (objc_msgSend(v12, "statusCode") >= 200 && objc_msgSend(v12, "statusCode") < 300)
    {
      PO_LOG_POAuthenticationProcess();
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = v33;
      v35 = *(_QWORD *)(a1 + 64);
      if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_24440D000, v34, OS_SIGNPOST_INTERVAL_END, v35, "PlatformSSO_JWKSRequest", "success", buf, 2u);
      }

      PO_LOG_POAuthenticationProcess();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_470_cold_1();

      objc_msgSend(*(id *)(a1 + 40), "jwksStorageProvider");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "deviceConfiguration");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "extensionIdentifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setJwksCache:forExtensionIdentifier:", v7, v39);

      objc_msgSend(*(id *)(a1 + 32), "completionQueue");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = MEMORY[0x24BDAC760];
      v43[1] = 3221225472;
      v43[2] = __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_483;
      v43[3] = &unk_2514FFF78;
      v14 = &v47;
      v41 = *(id *)(a1 + 56);
      v42 = *(_QWORD *)(a1 + 32);
      v47 = v41;
      v43[4] = v42;
      v44 = *(id *)(a1 + 48);
      v45 = v7;
      v46 = *(id *)(a1 + 40);
      objc_msgSend(v40, "addOperationWithBlock:", v43);

      v20 = v44;
    }
    else
    {
      v13 = MEMORY[0x24BDAC760];
      v50 = MEMORY[0x24BDAC760];
      v51 = 3221225472;
      v52 = __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_2_479;
      v53 = &unk_2514FF9D0;
      v14 = &v54;
      v54 = v12;
      v15 = __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_2_479();
      PO_LOG_POAuthenticationProcess();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v18 = *(_QWORD *)(a1 + 64);
      if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_24440D000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PlatformSSO_JWKSRequest", "Failed", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "completionQueue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = v13;
      v48[1] = 3221225472;
      v48[2] = __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_482;
      v48[3] = &unk_2514FFE38;
      v49 = *(id *)(a1 + 56);
      objc_msgSend(v19, "addOperationWithBlock:", v48);

      v20 = v49;
    }

    v27 = *v14;
    goto LABEL_29;
  }
  v28 = __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_2();
  PO_LOG_POAuthenticationProcess();
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = v29;
  v31 = *(_QWORD *)(a1 + 64);
  if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_24440D000, v30, OS_SIGNPOST_INTERVAL_END, v31, "PlatformSSO_JWKSRequest", "Failed", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "completionQueue");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = MEMORY[0x24BDAC760];
  v55[1] = 3221225472;
  v55[2] = __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_478;
  v55[3] = &unk_2514FFE38;
  v56 = *(id *)(a1 + 56);
  objc_msgSend(v32, "addOperationWithBlock:", v55);

  v12 = v56;
LABEL_30:

}

id __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_471(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1009, *(_QWORD *)(a1 + 32), CFSTR("Failed to retrieve JWKS."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_157_cold_1();

  return v1;
}

uint64_t __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_474(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_2()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1009, CFSTR("Not HTTP response for JWKS."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

uint64_t __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_478(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_2_479()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1009, CFSTR("JWKS request failed."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_167_cold_1();

  return v0;
}

uint64_t __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_482(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_483(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 56), "loginConfiguration");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "jwksTrustedRootCertificates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, objc_msgSend(v1, "findKey:inJWKSData:rootCertificates:", v2, v3, v5));

}

- (__SecKey)findKey:(id)a3 inJWKSData:(id)a4 rootCertificates:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  id v13;
  __SecKey *RSAPublicKey;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  void *v33;
  __SecCertificate *v34;
  __SecCertificate *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  const __CFData *v39;
  __SecCertificate *v40;
  __SecCertificate *v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  uint64_t v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const __CFDictionary *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  id v83;
  _QWORD v84[4];
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  id (*v89)();
  void *v90;
  id v91;
  CFErrorRef error[8];
  id v93;
  _QWORD v94[4];
  id v95;
  CFErrorRef v96;
  int v97;
  uint64_t v98;
  uint64_t v99;
  id (*v100)();
  void *v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  id (*v105)();
  void *v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  id (*v110)();
  void *v111;
  id v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  uint64_t v117;
  uint64_t v118;
  id (*v119)();
  void *v120;
  id v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  _QWORD v126[4];
  id v127;
  id v128;
  _QWORD v129[2];
  _QWORD v130[2];
  _BYTE v131[128];
  _BYTE v132[128];
  uint64_t v133;

  v133 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v128 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a4, 16, &v128);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v128;
  v11 = v10;
  if (v9)
    v12 = v10 == 0;
  else
    v12 = 0;
  if (!v12)
  {
    v126[0] = MEMORY[0x24BDAC760];
    v126[1] = 3221225472;
    v126[2] = __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke;
    v126[3] = &unk_2514FF9D0;
    v127 = v10;
    v13 = __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke((uint64_t)v126);
    RSAPublicKey = 0;
    v15 = v127;
    goto LABEL_63;
  }
  v82 = v10;
  v80 = v9;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("keys"));
  v122 = 0u;
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v122, v132, 16);
  v81 = v16;
  if (!v17)
    goto LABEL_14;
  v18 = v17;
  v19 = *(_QWORD *)v123;
  while (2)
  {
    for (i = 0; i != v18; ++i)
    {
      if (*(_QWORD *)v123 != v19)
        objc_enumerationMutation(v16);
      v21 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * i);
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("kid"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v22, "isEqualToString:", v7) & 1) != 0)
      {
        v23 = v21;

        if (!v23)
          goto LABEL_36;
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("kty"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("x5c"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v11 = v82;
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v25, "count"))
        {
          v75 = v7;
          if (!objc_msgSend(v8, "count"))
          {
LABEL_33:
            objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("x5c"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "firstObject");
            v38 = objc_claimAutoreleasedReturnValue();

            v36 = (void *)v38;
            v39 = (const __CFData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v38, 1);
            if (v39)
            {
              v40 = SecCertificateCreateWithData(0, v39);
              v9 = v80;
              if (v40)
              {
                v41 = v40;
                RSAPublicKey = SecCertificateCopyKey(v40);
                CFRelease(v41);
              }
              else
              {
                RSAPublicKey = 0;
              }
              v36 = (void *)v38;
              v7 = v75;
            }
            else
            {
              v103 = MEMORY[0x24BDAC760];
              v104 = 3221225472;
              v105 = __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_500;
              v106 = &unk_2514FF9D0;
              v7 = v75;
              v107 = v75;
              v69 = __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_500();

              RSAPublicKey = 0;
              v9 = v80;
            }

            goto LABEL_61;
          }
          v77 = v24;
          v74 = v8;
          v26 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          v113 = 0u;
          v114 = 0u;
          v115 = 0u;
          v116 = 0u;
          v79 = v25;
          v27 = v25;
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v113, v131, 16);
          if (v28)
          {
            v29 = v28;
            v30 = *(_QWORD *)v114;
            do
            {
              for (j = 0; j != v29; ++j)
              {
                if (*(_QWORD *)v114 != v30)
                  objc_enumerationMutation(v27);
                v32 = *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v32, 1);
                  if (v33)
                  {
                    v34 = +[POSecKeyHelper certificateForData:](POSecKeyHelper, "certificateForData:", v33);
                    if (v34)
                    {
                      v35 = v34;
                      objc_msgSend(v26, "addObject:", v34);

                    }
                  }

                }
              }
              v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v113, v131, 16);
            }
            while (v29);
          }

          v36 = v26;
          v8 = v74;
          if (+[POSecKeyHelper evaluateTrustForCertificates:rootCertificates:](POSecKeyHelper, "evaluateTrustForCertificates:rootCertificates:", v26, v74))
          {

            v11 = v82;
            v24 = v77;
            v25 = v79;
            goto LABEL_33;
          }
          v108 = MEMORY[0x24BDAC760];
          v109 = 3221225472;
          v110 = __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_497;
          v111 = &unk_2514FF9D0;
          v7 = v75;
          v112 = v75;
          v68 = __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_497();

          RSAPublicKey = 0;
          v9 = v80;
          v11 = v82;
          goto LABEL_51;
        }
        if (objc_msgSend(v8, "count"))
        {
          v98 = MEMORY[0x24BDAC760];
          v99 = 3221225472;
          v100 = __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_503;
          v101 = &unk_2514FF9D0;
          v102 = v7;
          v43 = __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_503();
          RSAPublicKey = 0;
          v36 = v102;
          v9 = v80;
LABEL_61:

          goto LABEL_62;
        }
        if (objc_msgSend(v24, "isEqualToString:", CFSTR("EC")))
        {
          v77 = v24;
          v79 = v25;
          v44 = objc_alloc(MEMORY[0x24BDBCE50]);
          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("x"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "psso_initWithBase64URLEncodedString:", v45);
          v46 = v7;
          v47 = objc_claimAutoreleasedReturnValue();

          v48 = objc_alloc(MEMORY[0x24BDBCE50]);
          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("y"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "psso_initWithBase64URLEncodedString:", v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          v36 = (void *)v47;
          v7 = v46;
          v51 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
          v97 = 4;
          objc_msgSend(v51, "appendBytes:length:", &v97, 1);
          objc_msgSend(v51, "appendData:", v36);
          objc_msgSend(v51, "appendData:", v50);
          v52 = *MEMORY[0x24BDE9060];
          v53 = *MEMORY[0x24BDE9028];
          v129[0] = *MEMORY[0x24BDE9050];
          v129[1] = v53;
          v54 = *MEMORY[0x24BDE9038];
          v130[0] = v52;
          v130[1] = v54;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v130, v129, 2);
          v55 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          error[0] = 0;
          RSAPublicKey = SecKeyCreateWithData((CFDataRef)v51, v55, error);
          v9 = v80;
          if (!RSAPublicKey)
          {
            v94[0] = MEMORY[0x24BDAC760];
            v94[1] = 3221225472;
            v94[2] = __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_512;
            v94[3] = &unk_2514FFFC8;
            v96 = error[0];
            v95 = v7;
            v56 = __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_512((uint64_t)v94);

          }
LABEL_51:
          v24 = v77;
          v25 = v79;
          goto LABEL_61;
        }
        v9 = v80;
        if (!objc_msgSend(v24, "isEqualToString:", CFSTR("RSA")))
        {
          v83 = v7;
          v70 = __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_530();
          RSAPublicKey = 0;
          v36 = v83;
          goto LABEL_61;
        }
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("n"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("e"));
        v57 = objc_claimAutoreleasedReturnValue();
        v78 = (void *)v57;
        if (v36 && (v58 = v57) != 0)
        {
          v59 = objc_alloc(MEMORY[0x24BDBCE50]);
          v60 = v36;
          v61 = v59;
          v76 = v60;
          objc_msgSend(v59, "psso_initWithBase64URLEncodedString:");
          v62 = (void *)objc_claimAutoreleasedReturnValue();

          v63 = objc_alloc(MEMORY[0x24BDBCE50]);
          objc_msgSend(v63, "psso_initWithBase64URLEncodedString:", v58);
          v64 = (void *)objc_claimAutoreleasedReturnValue();

          if (v62 && v64)
          {
            v65 = objc_retainAutorelease(v62);
            error[0] = (CFErrorRef)objc_msgSend(v65, "bytes");
            error[1] = (CFErrorRef)objc_msgSend(v65, "length");
            v66 = objc_retainAutorelease(v64);
            error[2] = (CFErrorRef)objc_msgSend(v66, "bytes");
            error[3] = (CFErrorRef)objc_msgSend(v66, "length");
            RSAPublicKey = (__SecKey *)SecKeyCreateRSAPublicKey();

            v36 = v76;
            if (RSAPublicKey)
            {
LABEL_60:

              goto LABEL_61;
            }
            v84[0] = MEMORY[0x24BDAC760];
            v84[1] = 3221225472;
            v84[2] = __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_527;
            v84[3] = &unk_2514FFFC8;
            v86 = 0;
            v85 = v7;
            v67 = __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_527((uint64_t)v84);
            v62 = v85;
          }
          else
          {
            error[4] = (CFErrorRef)MEMORY[0x24BDAC760];
            error[5] = (CFErrorRef)3221225472;
            error[6] = (CFErrorRef)__63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_521;
            error[7] = (CFErrorRef)&unk_2514FF9D0;
            v93 = v7;
            v72 = __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_521();

            v36 = v76;
          }
        }
        else
        {
          v87 = MEMORY[0x24BDAC760];
          v88 = 3221225472;
          v89 = __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_524;
          v90 = &unk_2514FF9D0;
          v91 = v7;
          v71 = __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_524();
          v62 = v91;
        }

        RSAPublicKey = 0;
        goto LABEL_60;
      }

    }
    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v122, v132, 16);
    if (v18)
      continue;
    break;
  }
LABEL_14:

LABEL_36:
  v117 = MEMORY[0x24BDAC760];
  v118 = 3221225472;
  v119 = __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_490;
  v120 = &unk_2514FF9D0;
  v121 = v7;
  v42 = __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_490();
  RSAPublicKey = 0;
  v23 = v121;
  v9 = v80;
  v11 = v82;
LABEL_62:

  v15 = v81;
LABEL_63:

  return RSAPublicKey;
}

id __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1008, *(_QWORD *)(a1 + 32), CFSTR("Failed to parse jwks response."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v1;
}

id __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_490()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Failed to find key"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_178_cold_1();

  return v0;
}

id __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_497()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Trust evaluation failed for kid."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_178_cold_1();

  return v0;
}

id __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_500()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to create key."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_178_cold_1();

  return v0;
}

id __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_503()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("required certificates missing from jwks for kid."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_178_cold_1();

  return v0;
}

id __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_512(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 40);
  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1008, v1, CFSTR("Failed to create EC key."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POAuthenticationProcess();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_178_cold_1();

  return v2;
}

id __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_521()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Failed to create RSA key."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_178_cold_1();

  return v0;
}

id __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_524()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to create RSA key, Modulus or exponent missing."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_178_cold_1();

  return v0;
}

id __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_527(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 40);
  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, v1, CFSTR("Failed to create key"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POAuthenticationProcess();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_178_cold_1();

  return v2;
}

id __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_530()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Failed to load key."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_178_cold_1();

  return v0;
}

- (BOOL)validateIdToken:(id)a3 context:(id)a4 key:(__SecKey *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  id v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  char v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  double v72;
  double v73;
  void *v74;
  id v75;
  id v76;
  id v77;
  id v78;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  PO_LOG_PODiagnostics();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24440D000, v9, OS_LOG_TYPE_INFO, "Verifying id_token", buf, 2u);
  }

  PO_LOG_POAuthenticationProcess();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[POAuthenticationProcess validateIdToken:context:key:].cold.1();

  objc_msgSend(v7, "decodedHeader");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "alg");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(&unk_251521108, "containsObject:", v12);

  if ((v13 & 1) == 0)
  {
    v78 = v7;
    v24 = __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke();

    goto LABEL_11;
  }
  objc_msgSend(v7, "decodedHeader");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "alg");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = +[POJWTSigning verifyJWTSignature:algorithm:key:](POJWTSigning, "verifyJWTSignature:algorithm:key:", v7, v15, a5);

  if ((_DWORD)a5)
  {
    objc_msgSend(v7, "decodedBody");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "nonce");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      objc_msgSend(v7, "decodedBody");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "nonce");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "nonce");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "isEqualToString:", v21);

      if ((v22 & 1) == 0)
      {
        v23 = __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_537();
LABEL_11:
        LOBYTE(a5) = 0;
        goto LABEL_12;
      }
    }
    else
    {

    }
    objc_msgSend(v7, "decodedBody");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "iss");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loginConfiguration");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "issuer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v27, "isEqualToString:", v29);

    if ((v30 & 1) == 0)
    {
      v42 = __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_541();
      goto LABEL_11;
    }
    objc_msgSend(v7, "decodedBody");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "audArray");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "decodedBody");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v32)
    {
      objc_msgSend(v33, "audArray");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "loginConfiguration");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "clientID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v35, "containsObject:", v37);

      if ((v38 & 1) == 0)
      {
        v56 = __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_545();
        goto LABEL_11;
      }
      objc_msgSend(v7, "decodedBody");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "azp");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v40)
      {
        v41 = __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_549();
        goto LABEL_11;
      }
    }
    else
    {
      objc_msgSend(v33, "aud");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "loginConfiguration");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "clientID");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v43, "isEqualToString:", v45);

      if ((v46 & 1) == 0)
      {
        v57 = __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_553();
        goto LABEL_11;
      }
    }
    objc_msgSend(v7, "decodedBody");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "azp");
    v48 = objc_claimAutoreleasedReturnValue();
    if (v48)
    {
      v49 = (void *)v48;
      objc_msgSend(v7, "decodedBody");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "azp");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "loginConfiguration");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "clientID");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v51, "isEqualToString:", v53);

      if ((v54 & 1) == 0)
      {
        v55 = __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_557();
        goto LABEL_11;
      }
    }
    else
    {

    }
    objc_msgSend(v7, "decodedBody");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "iat");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "timeIntervalSinceNow");
    v61 = v60;

    objc_msgSend(v7, "decodedBody");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "iat");
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v63 || v61 > 120.0)
    {
      v76 = __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_561();
      goto LABEL_11;
    }
    objc_msgSend(v7, "decodedBody");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "exp");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "timeIntervalSinceNow");
    v67 = v66;

    objc_msgSend(v7, "decodedBody");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "exp");
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v69 || v67 < -120.0)
    {
      v77 = __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_564();
      goto LABEL_11;
    }
    objc_msgSend(v7, "decodedBody");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "nbf");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "timeIntervalSinceNow");
    v73 = v72;

    objc_msgSend(v7, "decodedBody");
    a5 = (__SecKey *)objc_claimAutoreleasedReturnValue();
    -[__SecKey nbf](a5, "nbf");
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(a5) = 1;
    if (v74 && v73 > 120.0)
    {
      v75 = __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_567();
      goto LABEL_11;
    }
  }
LABEL_12:

  return (char)a5;
}

id __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("unsupported id_token algorithm."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_cold_1();

  return v0;
}

id __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_537()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Failed to match nonce."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_541()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Failed to match issuer."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_545()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("audience does not contain client id."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_549()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("azp claim missing."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_553()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Failed to match audience."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_557()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Failed to match azp."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_561()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Failed to verify iat."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_252_cold_1();

  return v0;
}

id __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_564()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Failed to verify exp."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_252_cold_1();

  return v0;
}

id __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_567()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Failed to verify nbf."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_252_cold_1();

  return v0;
}

- (BOOL)validatePartyUInfo:(id)a3 context:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  __SecKey *v7;
  CFDataRef v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  char v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  void *v26;
  id v27;
  unsigned int v28;
  unsigned int v29;
  _QWORD v30[5];
  CFErrorRef error;

  v4 = a3;
  objc_msgSend(v4, "decodedHeader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "apu");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (__SecKey *)objc_msgSend(v4, "decodeEphemeralPublicKey");
    if (v7)
    {
      error = 0;
      v8 = SecKeyCopyExternalRepresentation(v7, &error);
      if (!v8)
      {
        v30[0] = MEMORY[0x24BDAC760];
        v30[1] = 3221225472;
        v30[2] = __54__POAuthenticationProcess_validatePartyUInfo_context___block_invoke_577;
        v30[3] = &__block_descriptor_40_e14___NSError_8__0l;
        v30[4] = error;
        v17 = __54__POAuthenticationProcess_validatePartyUInfo_context___block_invoke_577((uint64_t)v30);
        v16 = 0;
LABEL_19:

        goto LABEL_20;
      }
      v9 = objc_alloc(MEMORY[0x24BDBCE50]);
      objc_msgSend(v4, "decodedHeader");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "apu");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "psso_initWithBase64URLEncodedString:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v29 = 0;
        if ((unint64_t)objc_msgSend(v12, "length") > 3)
        {
          objc_msgSend(v12, "getBytes:range:", &v29, 0, 4);
          v19 = bswap32(v29);
          v28 = 0;
          v29 = v19;
          v20 = v19 + 8;
          if (objc_msgSend(v12, "length") >= (unint64_t)(v19 + 8))
          {
            objc_msgSend(v12, "getBytes:range:", &v28, v19 + 4, 4);
            v22 = bswap32(v28);
            v28 = v22;
            if (-[__CFData length](v8, "length") == v22)
            {
              v23 = objc_msgSend(v12, "length");
              if (v23 >= v20 + (unint64_t)v28)
              {
                objc_msgSend(v12, "subdataWithRange:", v20);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = -[__CFData isEqualToData:](v8, "isEqualToData:", v26);
                if ((v16 & 1) == 0)
                  v27 = __54__POAuthenticationProcess_validatePartyUInfo_context___block_invoke_596();

                goto LABEL_18;
              }
            }
            v24 = __54__POAuthenticationProcess_validatePartyUInfo_context___block_invoke_592();
          }
          else
          {
            v21 = __54__POAuthenticationProcess_validatePartyUInfo_context___block_invoke_588();
          }
        }
        else
        {
          v13 = __54__POAuthenticationProcess_validatePartyUInfo_context___block_invoke_584();
        }
      }
      else
      {
        v18 = __54__POAuthenticationProcess_validatePartyUInfo_context___block_invoke_580();
      }
      v16 = 0;
LABEL_18:

      goto LABEL_19;
    }
    v15 = __54__POAuthenticationProcess_validatePartyUInfo_context___block_invoke_573();
  }
  else
  {
    v14 = __54__POAuthenticationProcess_validatePartyUInfo_context___block_invoke();
  }
  v16 = 0;
LABEL_20:

  return v16;
}

id __54__POAuthenticationProcess_validatePartyUInfo_context___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("response missing apu."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __54__POAuthenticationProcess_validatePartyUInfo_context___block_invoke_573()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("response missing epk."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __54__POAuthenticationProcess_validatePartyUInfo_context___block_invoke_577(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 32);
  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1008, v1, CFSTR("error with SecKeyCopyExternalRepresentation for epk."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POAuthenticationProcess();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v2;
}

id __54__POAuthenticationProcess_validatePartyUInfo_context___block_invoke_580()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("error decoding apu."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __54__POAuthenticationProcess_validatePartyUInfo_context___block_invoke_584()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("failed to validate apu length."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __54__POAuthenticationProcess_validatePartyUInfo_context___block_invoke_588()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("failed to validate apu size."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __54__POAuthenticationProcess_validatePartyUInfo_context___block_invoke_592()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("failed to validate apu epk size."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __54__POAuthenticationProcess_validatePartyUInfo_context___block_invoke_596()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("failed to validate apu epk."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (BOOL)validatePartyVInfo:(id)a3 context:(id)a4 publicKey:(__SecKey *)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  CFDataRef v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  char v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  unint64_t v23;
  id v24;
  void *v25;
  id v26;
  unsigned int v28;
  unsigned int v29;
  _QWORD v30[5];
  CFErrorRef error;
  unsigned int v32;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v32 = 0;
    v9 = objc_alloc(MEMORY[0x24BDBCE50]);
    objc_msgSend(v9, "psso_initWithBase64URLEncodedString:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v17 = __64__POAuthenticationProcess_validatePartyVInfo_context_publicKey___block_invoke_603();
      v16 = 0;
LABEL_20:

      goto LABEL_21;
    }
    error = 0;
    v11 = SecKeyCopyExternalRepresentation(a5, &error);
    if (!v11)
    {
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __64__POAuthenticationProcess_validatePartyVInfo_context_publicKey___block_invoke_607;
      v30[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v30[4] = error;
      v18 = __64__POAuthenticationProcess_validatePartyVInfo_context_publicKey___block_invoke_607((uint64_t)v30);
      v16 = 0;
LABEL_19:

      goto LABEL_20;
    }
    objc_msgSend(v8, "nonce");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dataUsingEncoding:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v32 = 0;
      if ((unint64_t)objc_msgSend(v10, "length") > 3)
      {
        objc_msgSend(v10, "getBytes:range:", &v32, 0, 4);
        v20 = bswap32(v32);
        v32 = v20;
        v21 = v20 + 4;
        v22 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
        v29 = bswap32(-[__CFData length](v11, "length"));
        objc_msgSend(v22, "appendBytes:length:", &v29, 4);
        objc_msgSend(v22, "appendData:", v11);
        v28 = bswap32(objc_msgSend(v13, "length"));
        objc_msgSend(v22, "appendBytes:length:", &v28, 4);
        objc_msgSend(v22, "appendData:", v13);
        v23 = objc_msgSend(v10, "length");
        if (v23 >= objc_msgSend(v22, "length") + v21)
        {
          objc_msgSend(v10, "subdataWithRange:", v21, objc_msgSend(v22, "length"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v22, "isEqualToData:", v25);
          if ((v16 & 1) == 0)
            v26 = __64__POAuthenticationProcess_validatePartyVInfo_context_publicKey___block_invoke_622();

        }
        else
        {
          v24 = __64__POAuthenticationProcess_validatePartyVInfo_context_publicKey___block_invoke_618();
          v16 = 0;
        }

        goto LABEL_18;
      }
      v14 = __64__POAuthenticationProcess_validatePartyVInfo_context_publicKey___block_invoke_614();
    }
    else
    {
      v19 = __64__POAuthenticationProcess_validatePartyVInfo_context_publicKey___block_invoke_610();
    }
    v16 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v15 = __64__POAuthenticationProcess_validatePartyVInfo_context_publicKey___block_invoke();
  v16 = 0;
LABEL_21:

  return v16;
}

id __64__POAuthenticationProcess_validatePartyVInfo_context_publicKey___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Missing apv."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __64__POAuthenticationProcess_validatePartyVInfo_context_publicKey___block_invoke_603()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("error decoding apv."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __64__POAuthenticationProcess_validatePartyVInfo_context_publicKey___block_invoke_607(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 32);
  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1008, v1, CFSTR("error with SecKeyCopyExternalRepresentation."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POAuthenticationProcess();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v2;
}

id __64__POAuthenticationProcess_validatePartyVInfo_context_publicKey___block_invoke_610()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("error with nonce data"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __64__POAuthenticationProcess_validatePartyVInfo_context_publicKey___block_invoke_614()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Failed to validate apv size"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __64__POAuthenticationProcess_validatePartyVInfo_context_publicKey___block_invoke_618()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("failed to validate apv data size"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __64__POAuthenticationProcess_validatePartyVInfo_context_publicKey___block_invoke_622()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("failed to validate apv data"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (id)createRefreshJWTWithContext:(id)a3
{
  id v4;
  void *v5;
  POMutableLoginJWTBody *v6;
  void *v7;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  POMutableLoginTokenJWT *v31;
  void *v32;
  void *v33;
  POMutableJWTHeader *v34;
  void *v35;
  void *v36;
  void *v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "refreshToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc_init(POMutableLoginJWTBody);
    objc_msgSend(v4, "loginConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "customRefreshRequestBodyClaims");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[POMutableLoginJWTBody addCustomClaims:](v6, "addCustomClaims:", v8);

    objc_msgSend(v4, "loginConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clientID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[POMutableLoginJWTBody setClient_id:](v6, "setClient_id:", v10);

    objc_msgSend(v4, "scope");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[POMutableLoginJWTBody setScope:](v6, "setScope:", v11);

    objc_msgSend(v4, "nonce");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[POMutableLoginJWTBody setNonce:](v6, "setNonce:", v12);

    objc_msgSend(v4, "loginConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "clientID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[POMutableLoginJWTBody setIss:](v6, "setIss:", v14);

    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 300.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[POMutableLoginJWTBody setExp:](v6, "setExp:", v15);

    v16 = (void *)MEMORY[0x24BDD1808];
    objc_msgSend(v4, "loginConfiguration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "refreshEndpointURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "absoluteString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "componentsWithString:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "setQuery:", 0);
    objc_msgSend(v20, "setQueryItems:", 0);
    objc_msgSend(v20, "setFragment:", 0);
    objc_msgSend(v20, "URL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "absoluteString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[POMutableLoginJWTBody setAud:](v6, "setAud:", v22);

    objc_msgSend(v4, "loginConfiguration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "serverNonceClaimName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "length");

    if (v25)
    {
      objc_msgSend(v4, "loginConfiguration");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "serverNonceClaimName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v27;
      objc_msgSend(v4, "serverNonce");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v28;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[POMutableLoginJWTBody addCustomClaims:](v6, "addCustomClaims:", v29);

    }
    else
    {
      objc_msgSend(v4, "serverNonce");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[POMutableLoginJWTBody setRequest_nonce:](v6, "setRequest_nonce:", v26);
    }

    objc_msgSend(v4, "refreshToken");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[POMutableLoginJWTBody setRefresh_token:](v6, "setRefresh_token:", v32);

    -[POMutableLoginJWTBody setGrant_type:](v6, "setGrant_type:", CFSTR("refresh_token"));
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[POMutableLoginJWTBody setIat:](v6, "setIat:", v33);

    -[POAuthenticationProcess addCryptoHeadersToJWTBody:context:](self, "addCryptoHeadersToJWTBody:context:", v6, v4);
    v34 = objc_alloc_init(POMutableJWTHeader);
    -[POMutableJWTHeader setTyp:](v34, "setTyp:", CFSTR("platformsso-refresh-request+jwt"));
    objc_msgSend(v4, "loginConfiguration");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "customRefreshRequestHeaderClaims");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[POMutableJWTHeader addCustomClaims:](v34, "addCustomClaims:", v36);

    v31 = objc_alloc_init(POMutableLoginTokenJWT);
    -[POMutableLoginTokenJWT setBody:](v31, "setBody:", v6);
    -[POMutableJWT setHeader:](v31, "setHeader:", v34);

  }
  else
  {
    v30 = __55__POAuthenticationProcess_createRefreshJWTWithContext___block_invoke();
    v31 = 0;
  }

  return v31;
}

id __55__POAuthenticationProcess_createRefreshJWTWithContext___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Missing refresh token"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (void)performKeyRequestUsingContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  POAuthenticationProcess *v20;
  id v21;
  os_signpost_id_t v22;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  PO_LOG_PODiagnostics();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24440D000, v8, OS_LOG_TYPE_INFO, "Starting key request", buf, 2u);
  }

  PO_LOG_POAuthenticationProcess();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[POAuthenticationProcess performPasswordLoginUsingContext:completion:].cold.2(v6);

  PO_LOG_POAuthenticationProcess();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[POAuthenticationProcess performPasswordLoginUsingContext:completion:].cold.1(v6);

  -[POAuthenticationProcess createNonceRequestWithContext:](self, "createNonceRequestWithContext:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    PO_LOG_POAuthenticationProcess();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24440D000, v12, OS_LOG_TYPE_INFO, "Sending nonce request", buf, 2u);
    }

    PO_LOG_POAuthenticationProcess();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_signpost_id_make_with_pointer(v13, v6);

    PO_LOG_POAuthenticationProcess();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_24440D000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PlatformSSO_NonceRequest", " enableTelemetry=YES ", buf, 2u);
    }

    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_634;
    v18[3] = &unk_2514FFDE8;
    v22 = v14;
    v21 = v7;
    v19 = v6;
    v20 = self;
    -[POAuthenticationProcess performNonceRequestWithContext:request:completion:](self, "performNonceRequestWithContext:request:completion:", v19, v11, v18);

  }
  else
  {
    v17 = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke();
    (*((void (**)(id, uint64_t, id, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, 2, v6, 0, 0, 0);
  }

}

id __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to create nonce request."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

void __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_634(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  os_signpost_id_t v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (a2 == 1)
  {
    PO_LOG_POAuthenticationProcess();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = *(_QWORD *)(a1 + 56);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_24440D000, v4, OS_SIGNPOST_INTERVAL_END, v5, "PlatformSSO_NonceRequest", "Success", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "createKeyRequestJWTWithContext:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "deviceConfiguration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "signingAlgorithm");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "deviceConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "deviceSigningKey");
      objc_msgSend(*(id *)(a1 + 32), "deviceConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[POJWTSigning encodeAndSignJWT:signingAlgorithm:key:certificate:error:](POJWTSigning, "encodeAndSignJWT:signingAlgorithm:key:certificate:error:", v6, v8, v10, objc_msgSend(v11, "deviceSigningCertificate"), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(*(id *)(a1 + 40), "createKeyRequestWithContext:jwt:", *(_QWORD *)(a1 + 32), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          PO_LOG_PODiagnostics();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(*(id *)(a1 + 32), "requestIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v34 = v15;
            _os_log_impl(&dword_24440D000, v14, OS_LOG_TYPE_INFO, "Sending key request: %{public}@", buf, 0xCu);

          }
          PO_LOG_POAuthenticationProcess();
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = os_signpost_id_make_with_pointer(v16, *(const void **)(a1 + 32));

          PO_LOG_POAuthenticationProcess();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_24440D000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "PlatformSSO_KeyRequest", " enableTelemetry=YES ", buf, 2u);
          }

          v21 = *(_QWORD *)(a1 + 32);
          v20 = *(void **)(a1 + 40);
          v30[0] = MEMORY[0x24BDAC760];
          v30[1] = 3221225472;
          v30[2] = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_648;
          v30[3] = &unk_2514FFE10;
          v32 = v17;
          v22 = *(id *)(a1 + 48);
          v30[4] = *(_QWORD *)(a1 + 40);
          v31 = v22;
          objc_msgSend(v20, "performKeyRequestWithContext:request:completion:", v21, v13, v30);

        }
        else
        {
          v29 = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_644();
          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        }

      }
      else
      {
        v28 = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_640();
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }

    }
    else
    {
      v27 = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_636();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
  else
  {
    v23 = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_2();
    PO_LOG_POAuthenticationProcess();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    v26 = *(_QWORD *)(a1 + 56);
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_24440D000, v25, OS_SIGNPOST_INTERVAL_END, v26, "PlatformSSO_NonceRequest", "Failed", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

id __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_2()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to retrieve nonce"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_636()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to create key JWT"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_640()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to sign key request"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_644()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to create key request"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

void __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_648(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  POKeyResponseJWT *v12;
  void *v13;
  POKeyResponseJWT *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  POKeyResponseJWT *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  BOOL v41;
  NSObject *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  SecKeyRef v47;
  void *v48;
  void *v49;
  char v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  __SecCertificate *v57;
  __SecKey *v58;
  __SecKey *v59;
  CFDictionaryRef v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  void *v97;
  uint64_t v98;
  _QWORD *v99;
  id v100;
  POKeyResponseJWT *v101;
  id v102;
  _QWORD v103[4];
  id v104;
  id v105[5];
  id v106;
  uint8_t buf[4];
  uint64_t v108;
  uint64_t v109;

  v109 = *MEMORY[0x24BDAC8D0];
  v102 = a3;
  v7 = a4;
  PO_LOG_POAuthenticationProcess();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24440D000, v8, OS_LOG_TYPE_INFO, "Key response received", buf, 2u);
  }

  PO_LOG_POAuthenticationProcess();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = a1[6];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 134217984;
    v108 = a2;
    _os_signpost_emit_with_name_impl(&dword_24440D000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PlatformSSO_KeyRequest", "result=%lu", buf, 0xCu);
  }

  if (a2 == 1)
  {
    v12 = [POKeyResponseJWT alloc];
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v7, 4);
    v14 = -[POKeyResponseJWT initWithString:](v12, "initWithString:", v13);

    if (v14)
    {
      v100 = v7;
      v15 = *(void **)(a1[4] + 40);
      -[POJWT decodedHeader](v14, "decodedHeader");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "alg");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "containsObject:", v17))
      {

        goto LABEL_13;
      }
      v20 = *(void **)(a1[4] + 40);
      v21 = (void *)MEMORY[0x24BDD17C8];
      -[POJWT decodedHeader](v14, "decodedHeader");
      v22 = v14;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "alg");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[POJWT decodedHeader](v22, "decodedHeader");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "enc");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("%@,%@"), v24, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v20) = objc_msgSend(v20, "containsObject:", v27);

      v14 = v22;
      if ((v20 & 1) != 0)
      {
LABEL_13:
        objc_msgSend(v102, "deviceConfiguration");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "encryptionAlgorithm");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = v14;
        v99 = a1;
        if ((objc_msgSend(v29, "isEqualToNumber:") & 1) != 0)
          objc_msgSend(v102, "apv");
        else
          objc_msgSend(v102, "nonce");
        v98 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v102, "deviceConfiguration");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "encryptionAlgorithm");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "deviceConfiguration");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "deviceEncryptionKey");
        objc_msgSend(v102, "loginConfiguration");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "hpkePsk");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "loginConfiguration");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "hpkePsk_id");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "loginConfiguration");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "hpkeAuthPublicKey");
        v105[0] = 0;
        v39 = v32;
        v40 = (void *)v98;
        v41 = +[POJWTEncryption decodeAndDecryptJWT:encryptionAlgorithm:privateKey:otherInfo:psk:psk_id:authPublicKey:error:](POJWTEncryption, "decodeAndDecryptJWT:encryptionAlgorithm:privateKey:otherInfo:psk:psk_id:authPublicKey:error:", v101, v30, v39, v98, v34, v36, v38, v105);
        v96 = v105[0];

        if (v41)
        {
          v14 = v101;
          if (+[POCoreConfigurationUtil platformSSODevModeEnabled](POCoreConfigurationUtil, "platformSSODevModeEnabled"))
          {
            PO_LOG_POAuthenticationProcess();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
              __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_648_cold_1();

          }
          objc_msgSend(v102, "deviceConfiguration");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "encryptionAlgorithm");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "isEqualToNumber:", 0x251520F48);

          if (!v45)
          {
LABEL_26:
            -[POKeyResponseJWT decodedBody](v101, "decodedBody");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "certificate");
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            if (v52)
            {
              v53 = objc_alloc(MEMORY[0x24BDBCE50]);
              -[POKeyResponseJWT decodedBody](v101, "decodedBody");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "certificate");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "psso_initWithBase64URLEncodedString:", v55);
              v56 = (void *)objc_claimAutoreleasedReturnValue();

              v57 = +[POSecKeyHelper certificateForData:](POSecKeyHelper, "certificateForData:", v56);
              if (v57)
              {
                v58 = SecCertificateCopyKey(v57);
                v7 = v100;
                if (v58)
                {
                  v59 = v58;
                  v60 = SecKeyCopyAttributes(v58);
                  CFRelease(v59);
                  v61 = (void *)SecCertificateCopyPublicKeySHA1Digest();
                  -[__CFDictionary objectForKeyedSubscript:](v60, "objectForKeyedSubscript:", *MEMORY[0x24BDE9050]);
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  -[__CFDictionary objectForKeyedSubscript:](v60, "objectForKeyedSubscript:", *MEMORY[0x24BDE9048]);
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  if (((objc_msgSend(v62, "isEqualToString:", *MEMORY[0x24BDE9058]) & 1) != 0
                     || objc_msgSend(v62, "isEqualToString:", *MEMORY[0x24BDE9060]))
                    && objc_msgSend(v63, "intValue") == 256)
                  {

                    v14 = v101;
                    -[POKeyResponseJWT decodedBody](v101, "decodedBody");
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v64, "iat");
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v65, "timeIntervalSinceNow");
                    v67 = v66;

                    -[POKeyResponseJWT decodedBody](v101, "decodedBody");
                    v68 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v68, "iat");
                    v69 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v69 && v67 <= 120.0)
                    {
                      -[POKeyResponseJWT decodedBody](v101, "decodedBody");
                      v70 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v70, "exp");
                      v71 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v71, "timeIntervalSinceNow");
                      v73 = v72;

                      -[POKeyResponseJWT decodedBody](v101, "decodedBody");
                      v74 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v74, "exp");
                      v75 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v75 && v73 >= -120.0)
                      {
                        v76 = v99[5];
                        -[POKeyResponseJWT decodedBody](v101, "decodedBody");
                        v77 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v77, "key_context");
                        v78 = (void *)objc_claimAutoreleasedReturnValue();
                        (*(void (**)(uint64_t, uint64_t, id, void *, void *, void *))(v76 + 16))(v76, 1, v102, v61, v56, v78);

LABEL_49:
                        v7 = v100;
                        goto LABEL_50;
                      }
                      v95 = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_681();
                    }
                    else
                    {
                      v94 = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_680();
                    }
                    (*(void (**)(void))(v99[5] + 16))();
                    goto LABEL_49;
                  }
                  v92 = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_672();
                  (*(void (**)(void))(v99[5] + 16))();

                  v14 = v101;
                }
                else
                {
                  v93 = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_676();
                  (*(void (**)(void))(v99[5] + 16))();
                }
LABEL_50:
                v40 = (void *)v98;
                v79 = v96;
                goto LABEL_51;
              }
            }
            else
            {
              v56 = 0;
            }
            v7 = v100;
            v40 = (void *)v98;
            v79 = v96;
            v90 = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_668();
            (*(void (**)(void))(v99[5] + 16))();
LABEL_51:

            goto LABEL_52;
          }
          if ((objc_msgSend((id)v99[4], "validatePartyUInfo:context:", v101, v102) & 1) != 0)
          {
            objc_msgSend(v102, "deviceConfiguration");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = SecKeyCopyPublicKey((SecKeyRef)objc_msgSend(v46, "deviceEncryptionKey"));

            v48 = (void *)v99[4];
            objc_msgSend(v102, "apv");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v48, "validatePartyVInfo:context:publicKey:", v49, v102, v47);

            if (v47)
              CFRelease(v47);
            if ((v50 & 1) != 0)
              goto LABEL_26;
            v91 = __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_297();
          }
          else
          {
            v89 = __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_293();
          }
          (*(void (**)(void))(v99[5] + 16))();
          v7 = v100;
          v40 = (void *)v98;
          v79 = v96;
        }
        else
        {
          v103[0] = MEMORY[0x24BDAC760];
          v103[1] = 3221225472;
          v103[2] = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_661;
          v103[3] = &unk_2514FF9D0;
          v79 = v96;
          v104 = v96;
          v80 = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_661((uint64_t)v103);
          (*(void (**)(void))(v99[5] + 16))();

          v7 = v100;
          v14 = v101;
        }
LABEL_52:

        goto LABEL_53;
      }
      v81 = (void *)MEMORY[0x24BDD17C8];
      -[POJWT decodedHeader](v22, "decodedHeader");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "alg");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      -[POJWT decodedHeader](v22, "decodedHeader");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "enc");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "stringWithFormat:", CFSTR("alg = %@, enc = %@"), v83, v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();

      v105[1] = (id)MEMORY[0x24BDAC760];
      v105[2] = (id)3221225472;
      v105[3] = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_658;
      v105[4] = &unk_2514FF9D0;
      v106 = v86;
      v87 = v86;
      v88 = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_658();
      (*(void (**)(void))(a1[5] + 16))();

      v7 = v100;
    }
    else
    {
      v19 = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_654();
      (*(void (**)(void))(a1[5] + 16))();
    }
LABEL_53:

    goto LABEL_54;
  }
  v18 = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_649();
  (*(void (**)(void))(a1[5] + 16))();
LABEL_54:

}

id __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_649()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Key request failed"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_654()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Failed to parse key response."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_658()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("unsupported key response algorithm and encryption."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_178_cold_1();

  return v0;
}

id __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_661(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1008, *(_QWORD *)(a1 + 32), CFSTR("Failed to decrypt key response."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v1;
}

id __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_668()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Missing or invalid certificate."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_672()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Certificate contains incorrect key size."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_676()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Certificate is missing key."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_680()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Failed to verify iat."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_252_cold_1();

  return v0;
}

id __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_681()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Failed to verify exp."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_252_cold_1();

  return v0;
}

- (void)performKeyExchangeRequestUsingContext:(id)a3 otherPartyPublicKeyData:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  POAuthenticationProcess *v23;
  id v24;
  id v25;
  os_signpost_id_t v26;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  PO_LOG_PODiagnostics();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24440D000, v11, OS_LOG_TYPE_INFO, "Starting Key Exchange request", buf, 2u);
  }

  PO_LOG_POAuthenticationProcess();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[POAuthenticationProcess performPasswordLoginUsingContext:completion:].cold.2(v8);

  PO_LOG_POAuthenticationProcess();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[POAuthenticationProcess performPasswordLoginUsingContext:completion:].cold.1(v8);

  -[POAuthenticationProcess createNonceRequestWithContext:](self, "createNonceRequestWithContext:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    PO_LOG_POAuthenticationProcess();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24440D000, v15, OS_LOG_TYPE_INFO, "Sending nonce request", buf, 2u);
    }

    PO_LOG_POAuthenticationProcess();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_signpost_id_make_with_pointer(v16, v8);

    PO_LOG_POAuthenticationProcess();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_24440D000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "PlatformSSO_NonceRequest", " enableTelemetry=YES ", buf, 2u);
    }

    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_683;
    v21[3] = &unk_2514FFFF0;
    v26 = v17;
    v25 = v10;
    v22 = v8;
    v23 = self;
    v24 = v9;
    -[POAuthenticationProcess performNonceRequestWithContext:request:completion:](self, "performNonceRequestWithContext:request:completion:", v22, v14, v21);

  }
  else
  {
    v20 = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke();
    (*((void (**)(id, uint64_t, id, _QWORD, _QWORD))v10 + 2))(v10, 2, v8, 0, 0);
  }

}

void __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_683(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  os_signpost_id_t v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (a2 == 1)
  {
    PO_LOG_POAuthenticationProcess();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = *(_QWORD *)(a1 + 64);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_24440D000, v4, OS_SIGNPOST_INTERVAL_END, v5, "PlatformSSO_NonceRequest", "Success", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "createKeyExchangeRequestJWTWithContext:otherPartyPublicKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "deviceConfiguration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "signingAlgorithm");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "deviceConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "deviceSigningKey");
      objc_msgSend(*(id *)(a1 + 32), "deviceConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[POJWTSigning encodeAndSignJWT:signingAlgorithm:key:certificate:error:](POJWTSigning, "encodeAndSignJWT:signingAlgorithm:key:certificate:error:", v6, v8, v10, objc_msgSend(v11, "deviceSigningCertificate"), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(*(id *)(a1 + 40), "createKeyExchangeRequestWithContext:jwt:", *(_QWORD *)(a1 + 32), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          PO_LOG_PODiagnostics();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(*(id *)(a1 + 32), "requestIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v34 = v15;
            _os_log_impl(&dword_24440D000, v14, OS_LOG_TYPE_INFO, "Sending Key Exchange request: %{public}@", buf, 0xCu);

          }
          PO_LOG_POAuthenticationProcess();
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = os_signpost_id_make_with_pointer(v16, *(const void **)(a1 + 32));

          PO_LOG_POAuthenticationProcess();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_24440D000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "PlatformSSO_KeyExchangeRequest", " enableTelemetry=YES ", buf, 2u);
          }

          v21 = *(_QWORD *)(a1 + 32);
          v20 = *(void **)(a1 + 40);
          v30[0] = MEMORY[0x24BDAC760];
          v30[1] = 3221225472;
          v30[2] = __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_697;
          v30[3] = &unk_2514FFE10;
          v32 = v17;
          v22 = *(id *)(a1 + 56);
          v30[4] = *(_QWORD *)(a1 + 40);
          v31 = v22;
          objc_msgSend(v20, "performKeyExchangeRequestWithContext:request:completion:", v21, v13, v30);

        }
        else
        {
          v29 = __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_693();
          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
        }

      }
      else
      {
        v28 = __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_689();
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      }

    }
    else
    {
      v27 = __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_685();
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
  else
  {
    v23 = __71__POAuthenticationProcess_performPasswordLoginUsingContext_completion___block_invoke_2();
    PO_LOG_POAuthenticationProcess();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    v26 = *(_QWORD *)(a1 + 64);
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_24440D000, v25, OS_SIGNPOST_INTERVAL_END, v26, "PlatformSSO_NonceRequest", "Failed", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

id __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_685()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to create Key Exchange JWT."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_689()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to sign Key Exchange request."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_693()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to create Key Exchange request."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

void __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_697(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  POKeyExchangeResponseJWT *v13;
  void *v14;
  POKeyExchangeResponseJWT *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  POKeyExchangeResponseJWT *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  BOOL v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  SecKeyRef v50;
  void *v51;
  void *v52;
  char v53;
  void *v54;
  void *v55;
  const __CFAllocator *Default;
  const __CFAllocator *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  void *v78;
  uint64_t v79;
  id v80;
  _QWORD *v81;
  POKeyExchangeResponseJWT *v82;
  _QWORD v83[4];
  id v84;
  id v85[5];
  id v86;
  uint8_t buf[4];
  uint64_t v88;
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  PO_LOG_POAuthenticationProcess();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24440D000, v9, OS_LOG_TYPE_INFO, "Key Exchange response received", buf, 2u);
  }

  PO_LOG_POAuthenticationProcess();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 134217984;
    v88 = a2;
    _os_signpost_emit_with_name_impl(&dword_24440D000, v11, OS_SIGNPOST_INTERVAL_END, v12, "PlatformSSO_KeyExchangeRequest", "result=%lu", buf, 0xCu);
  }

  if (a2 == 1)
  {
    v13 = [POKeyExchangeResponseJWT alloc];
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v8, 4);
    v15 = -[POKeyExchangeResponseJWT initWithString:](v13, "initWithString:", v14);

    if (!v15)
    {
      v20 = __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_703();
      (*(void (**)(void))(a1[5] + 16))();
LABEL_38:

      goto LABEL_39;
    }
    v80 = v8;
    v16 = *(void **)(a1[4] + 40);
    -[POJWT decodedHeader](v15, "decodedHeader");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "alg");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = a1;
    if (objc_msgSend(v16, "containsObject:", v18))
    {

    }
    else
    {
      v21 = *(void **)(a1[4] + 40);
      v22 = (void *)MEMORY[0x24BDD17C8];
      -[POJWT decodedHeader](v15, "decodedHeader");
      v23 = v15;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "alg");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[POJWT decodedHeader](v23, "decodedHeader");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "enc");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("%@,%@"), v25, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v21) = objc_msgSend(v21, "containsObject:", v28);

      v15 = v23;
      if ((v21 & 1) == 0)
      {
        v66 = (void *)MEMORY[0x24BDD17C8];
        -[POJWT decodedHeader](v23, "decodedHeader");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "alg");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        -[POJWT decodedHeader](v23, "decodedHeader");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "enc");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "stringWithFormat:", CFSTR("alg = %@, enc = %@"), v68, v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();

        v85[1] = (id)MEMORY[0x24BDAC760];
        v85[2] = (id)3221225472;
        v85[3] = __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_707;
        v85[4] = &unk_2514FF9D0;
        v86 = v71;
        v72 = v71;
        v73 = __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_707();
        (*(void (**)(void))(v81[5] + 16))();

LABEL_37:
        v8 = v80;
        goto LABEL_38;
      }
    }
    objc_msgSend(v7, "deviceConfiguration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "encryptionAlgorithm");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v15;
    if ((objc_msgSend(v30, "isEqualToNumber:") & 1) != 0)
      objc_msgSend(v7, "apv");
    else
      objc_msgSend(v7, "nonce");
    v79 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "deviceConfiguration");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "encryptionAlgorithm");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deviceConfiguration");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "deviceEncryptionKey");
    objc_msgSend(v7, "loginConfiguration");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "hpkePsk");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loginConfiguration");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "hpkePsk_id");
    v37 = v7;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "loginConfiguration");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "hpkeAuthPublicKey");
    v85[0] = 0;
    v41 = v33;
    v42 = (void *)v79;
    v43 = +[POJWTEncryption decodeAndDecryptJWT:encryptionAlgorithm:privateKey:otherInfo:psk:psk_id:authPublicKey:error:](POJWTEncryption, "decodeAndDecryptJWT:encryptionAlgorithm:privateKey:otherInfo:psk:psk_id:authPublicKey:error:", v82, v31, v41, v79, v35, v38, v40, v85);
    v77 = v85[0];

    if (!v43)
    {
      v83[0] = MEMORY[0x24BDAC760];
      v83[1] = 3221225472;
      v83[2] = __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_710;
      v83[3] = &unk_2514FF9D0;
      v44 = v77;
      v84 = v77;
      v65 = __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_710((uint64_t)v83);
      (*(void (**)(void))(v81[5] + 16))();

      v7 = v37;
      v15 = v82;
LABEL_36:

      goto LABEL_37;
    }
    v7 = v37;
    v15 = v82;
    v44 = v77;
    if (+[POCoreConfigurationUtil platformSSODevModeEnabled](POCoreConfigurationUtil, "platformSSODevModeEnabled"))
    {
      PO_LOG_POAuthenticationProcess();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_697_cold_1();

    }
    objc_msgSend(v37, "deviceConfiguration");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "encryptionAlgorithm");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "isEqualToNumber:", 0x251520F48);

    if (v48)
    {
      if ((objc_msgSend((id)v81[4], "validatePartyUInfo:context:", v82, v37) & 1) == 0)
      {
        v75 = __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_713();
        goto LABEL_34;
      }
      objc_msgSend(v37, "deviceConfiguration");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = SecKeyCopyPublicKey((SecKeyRef)objc_msgSend(v49, "deviceEncryptionKey"));

      v51 = (void *)v81[4];
      objc_msgSend(v37, "apv");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v51, "validatePartyVInfo:context:publicKey:", v52, v37, v50);

      if (v50)
        CFRelease(v50);
      if ((v53 & 1) == 0)
      {
        v76 = __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_715();
        goto LABEL_34;
      }
    }
    -[POKeyExchangeResponseJWT decodedBody](v82, "decodedBody");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "key");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (v55)
    {
      Default = CFAllocatorGetDefault();
      v57 = (const __CFAllocator *)SecCFAllocatorZeroize();
      CFAllocatorSetDefault(v57);
      v58 = objc_alloc(MEMORY[0x24BDBCEC8]);
      -[POKeyExchangeResponseJWT decodedBody](v82, "decodedBody");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "key");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = (void *)objc_msgSend(v58, "initWithBase64EncodedString:options:", v60, 0);

      v7 = v37;
      CFAllocatorSetDefault(Default);
      if (v61)
      {
        v62 = v81[5];
        -[POKeyExchangeResponseJWT decodedBody](v82, "decodedBody");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "key_context");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, uint64_t, void *, void *, void *))(v62 + 16))(v62, 1, v37, v61, v64);

LABEL_35:
        v42 = (void *)v79;
        goto LABEL_36;
      }
    }
    v74 = __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_717();
LABEL_34:
    (*(void (**)(void))(v81[5] + 16))();
    goto LABEL_35;
  }
  v19 = __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_698();
  (*(void (**)(void))(a1[5] + 16))();
LABEL_39:

}

id __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_698()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Key Exchange request failed."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_703()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Failed to parse Key Exchange response."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_707()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Unsupported Key Exchange response algorithm and encryption."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_178_cold_1();

  return v0;
}

id __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_710(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Failed to decrypt Key Exchange response."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v1;
}

id __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_713()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to validate apu."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_715()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to validate apv."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_717()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Missing or malformed exchanged key."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (id)createKeyRequestJWTWithContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  POMutableKeyRequestJWTBody *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  POMutableKeyRequestJWT *v29;
  POMutableJWTHeader *v30;
  void *v31;
  void *v32;
  void *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "refreshToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v28 = __58__POAuthenticationProcess_createKeyRequestJWTWithContext___block_invoke();
    goto LABEL_8;
  }
  objc_msgSend(v4, "nonce");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v7 = (void *)v6,
        objc_msgSend(v4, "serverNonce"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
    v27 = __71__POAuthenticationProcess_createLoginJWTWithContext_embeddedAssertion___block_invoke_383();
LABEL_8:
    v29 = 0;
    goto LABEL_11;
  }
  v9 = objc_alloc_init(POMutableKeyRequestJWTBody);
  objc_msgSend(v4, "loginConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "customKeyRequestBodyClaims");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMutableKeyRequestJWTBody addCustomClaims:](v9, "addCustomClaims:", v11);

  -[POMutableKeyRequestJWTBody setRequest_type:](v9, "setRequest_type:", CFSTR("key_request"));
  -[POMutableKeyRequestJWTBody setVersion:](v9, "setVersion:", CFSTR("1.0"));
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMutableKeyRequestJWTBody setIat:](v9, "setIat:", v12);

  objc_msgSend(v4, "loginConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clientID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMutableKeyRequestJWTBody setIss:](v9, "setIss:", v14);

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 300.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMutableKeyRequestJWTBody setExp:](v9, "setExp:", v15);

  objc_msgSend(v4, "nonce");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMutableKeyRequestJWTBody setNonce:](v9, "setNonce:", v16);

  objc_msgSend(v4, "refreshToken");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMutableKeyRequestJWTBody setRefresh_token:](v9, "setRefresh_token:", v17);

  objc_msgSend(v4, "userName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMutableKeyRequestJWTBody setUsername:](v9, "setUsername:", v18);

  objc_msgSend(v4, "userName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMutableKeyRequestJWTBody setSub:](v9, "setSub:", v19);

  -[POMutableKeyRequestJWTBody setKey_purpose:](v9, "setKey_purpose:", CFSTR("user_unlock"));
  objc_msgSend(v4, "loginConfiguration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "serverNonceClaimName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "length");

  if (v22)
  {
    objc_msgSend(v4, "loginConfiguration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "serverNonceClaimName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v24;
    objc_msgSend(v4, "serverNonce");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v25;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[POMutableKeyRequestJWTBody addCustomClaims:](v9, "addCustomClaims:", v26);

  }
  else
  {
    objc_msgSend(v4, "serverNonce");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[POMutableKeyRequestJWTBody setRequest_nonce:](v9, "setRequest_nonce:", v23);
  }

  -[POAuthenticationProcess addCryptoHeadersToJWTBody:context:](self, "addCryptoHeadersToJWTBody:context:", v9, v4);
  v30 = objc_alloc_init(POMutableJWTHeader);
  -[POMutableJWTHeader setTyp:](v30, "setTyp:", CFSTR("platformsso-key-request+jwt"));
  objc_msgSend(v4, "loginConfiguration");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "customKeyRequestHeaderClaims");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMutableJWTHeader addCustomClaims:](v30, "addCustomClaims:", v32);

  v29 = objc_alloc_init(POMutableKeyRequestJWT);
  -[POMutableKeyRequestJWT setBody:](v29, "setBody:", v9);
  -[POMutableJWT setHeader:](v29, "setHeader:", v30);

LABEL_11:
  return v29;
}

id __58__POAuthenticationProcess_createKeyRequestJWTWithContext___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Missing refresh token."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (id)createKeyRequestWithContext:(id)a3 jwt:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  __CFString *v29;
  const __CFAllocator *v30;
  __CFString *v31;
  const __CFAllocator *v32;
  CFDataRef ExternalRepresentation;
  id v34;
  id v35;
  id v36;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (objc_class *)MEMORY[0x24BDD16B0];
  v7 = a4;
  v8 = [v6 alloc];
  objc_msgSend(v5, "loginConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "keyEndpointURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithURL:cachePolicy:timeoutInterval:", v10, 4, 30.0);

  objc_msgSend(v11, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v11, "addValue:forHTTPHeaderField:", CFSTR("application/x-www-form-urlencoded"), CFSTR("Content-type"));
  objc_msgSend(v11, "addValue:forHTTPHeaderField:", CFSTR("application/platformsso-key-response+jwt"), CFSTR("Accept"));
  objc_msgSend(v5, "requestIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addValue:forHTTPHeaderField:", v12, CFSTR("client-request-id"));

  v13 = objc_alloc_init(MEMORY[0x24BDD1808]);
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("platform_sso_version"), CFSTR("2.0"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v14;
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("grant_type"), CFSTR("urn:ietf:params:oauth:grant-type:jwt-bearer"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "loginConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "customKeyRequestValues");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v5, "loginConfiguration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "customKeyRequestValues");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v20);
    v21 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v21;
  }
  objc_msgSend(v13, "setQueryItems:", v16);
  objc_msgSend(v13, "percentEncodedQuery");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dataUsingEncoding:", 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "mutableCopy");

  objc_msgSend(v5, "loginConfiguration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "customRequestJWTParameterName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "length");

  if (v27)
  {
    objc_msgSend(v5, "loginConfiguration");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "customRequestJWTParameterName");
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = CFSTR("assertion");
  }
  v30 = (const __CFAllocator *)SecCFAllocatorZeroize();
  v31 = (__CFString *)CFStringCreateWithFormat(v30, 0, CFSTR("&%@=%@"), v29, v7);

  if (v31)
  {
    v32 = (const __CFAllocator *)SecCFAllocatorZeroize();
    ExternalRepresentation = CFStringCreateExternalRepresentation(v32, v31, 0x8000100u, 0);
    if (ExternalRepresentation)
    {
      objc_msgSend(v24, "appendData:", ExternalRepresentation);
      objc_msgSend(v11, "setHTTPBody:", v24);
      v34 = v11;
    }
    else
    {
      v36 = __61__POAuthenticationProcess_createLoginRequestWithContext_jwt___block_invoke();
      v34 = 0;
    }

  }
  else
  {
    v35 = __61__POAuthenticationProcess_createLoginRequestWithContext_jwt___block_invoke();
    v34 = 0;
  }

  return v34;
}

- (void)performKeyRequestWithContext:(id)a3 request:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(id *, void *, void *, void *);
  void *v21;
  POAuthenticationProcess *v22;
  id v23;
  id v24;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "urlSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke;
  v21 = &unk_2514FFE60;
  v23 = v8;
  v24 = v9;
  v22 = self;
  v12 = v8;
  v13 = v9;
  objc_msgSend(v11, "dataTaskWithRequest:completionHandler:", v10, &v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v12, "requestIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("Key Request: %@"), v16, v18, v19, v20, v21, v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTaskDescription:", v17);

  objc_msgSend(v14, "resume");
}

void __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void **v14;
  id v15;
  void *v16;
  id *v17;
  id *v18;
  uint64_t *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  _BOOL4 v26;
  NSObject *v27;
  _BOOL4 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(_QWORD *);
  void *v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  uint8_t buf[16];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  PO_LOG_POAuthenticationProcess();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24440D000, v10, OS_LOG_TYPE_INFO, "Key response received", buf, 2u);
  }

  if (v9)
  {
    if (v7)
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v7, 4);
    else
      v11 = 0;
    v20 = MEMORY[0x24BDAC760];
    v46[0] = MEMORY[0x24BDAC760];
    v46[1] = 3221225472;
    v46[2] = __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_739;
    v46[3] = &unk_2514FFCB0;
    v47 = v9;
    v48 = v11;
    v12 = v11;
    v21 = __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_739((uint64_t)v46);
    objc_msgSend(a1[4], "completionQueue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v20;
    v43[1] = 3221225472;
    v43[2] = __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_742;
    v43[3] = &unk_2514FFE88;
    v45 = a1[6];
    v44 = a1[5];
    objc_msgSend(v22, "addOperationWithBlock:", v43);

    v23 = v47;
LABEL_20:

    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v8;
    if (objc_msgSend(v12, "statusCode") >= 200 && objc_msgSend(v12, "statusCode") < 300)
    {
      v26 = +[POCoreConfigurationUtil platformSSODevModeEnabled](POCoreConfigurationUtil, "platformSSODevModeEnabled");
      PO_LOG_POAuthenticationProcess();
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG);
      if (v26)
      {
        if (v28)
          __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_cold_1();
      }
      else if (v28)
      {
        __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_cold_2();
      }

      objc_msgSend(a1[4], "completionQueue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = MEMORY[0x24BDAC760];
      v30 = 3221225472;
      v31 = __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_751;
      v32 = &unk_2514FFF50;
      v14 = &v35;
      v35 = a1[6];
      v17 = &v33;
      v33 = a1[5];
      v18 = &v34;
      v34 = v7;
      v19 = &v29;
    }
    else
    {
      v13 = MEMORY[0x24BDAC760];
      v38[1] = MEMORY[0x24BDAC760];
      v38[2] = 3221225472;
      v38[3] = __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_2_747;
      v38[4] = &unk_2514FF9D0;
      v14 = &v39;
      v39 = v12;
      v15 = __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_2_747();
      objc_msgSend(a1[4], "completionQueue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v13;
      v36[1] = 3221225472;
      v36[2] = __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_750;
      v36[3] = &unk_2514FFE88;
      v17 = (id *)v38;
      v38[0] = a1[6];
      v18 = &v37;
      v37 = a1[5];
      v19 = v36;
    }
    objc_msgSend(v16, "addOperationWithBlock:", v19, v29, v30, v31, v32);

    v23 = *v14;
    goto LABEL_20;
  }
  v24 = __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_2();
  objc_msgSend(a1[4], "completionQueue");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_746;
  v40[3] = &unk_2514FFE88;
  v42 = a1[6];
  v41 = a1[5];
  objc_msgSend(v25, "addOperationWithBlock:", v40);

  v12 = v42;
LABEL_21:

}

id __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_739(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1009, *(_QWORD *)(a1 + 32), CFSTR("Failed to retrieve key."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_157_cold_1();

  return v1;
}

uint64_t __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_742(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 5, *(_QWORD *)(a1 + 32), 0);
}

id __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_2()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1009, CFSTR("Not HTTP response for key."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

uint64_t __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_746(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 3, *(_QWORD *)(a1 + 32), 0);
}

id __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_2_747()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1009, CFSTR("Key request failed."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_167_cold_1();

  return v0;
}

uint64_t __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_750(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 3, *(_QWORD *)(a1 + 32), 0);
}

uint64_t __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_751(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(a1[6] + 16))(a1[6], 1, a1[4], a1[5]);
}

- (id)createKeyExchangeRequestJWTWithContext:(id)a3 otherPartyPublicKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  POMutableKeyExchangeRequestJWTBody *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  POMutableKeyExchangeRequestJWT *v32;
  void *v34;
  void *v35;
  POMutableJWTHeader *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "refreshToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v31 = __58__POAuthenticationProcess_createKeyRequestJWTWithContext___block_invoke();
    goto LABEL_9;
  }
  objc_msgSend(v6, "nonce");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9
    || (v10 = (void *)v9,
        objc_msgSend(v6, "serverNonce"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        !v7)
    || !v11)
  {
    v30 = __86__POAuthenticationProcess_createKeyExchangeRequestJWTWithContext_otherPartyPublicKey___block_invoke_755();
LABEL_9:
    v32 = 0;
    goto LABEL_10;
  }
  v12 = objc_alloc_init(POMutableKeyExchangeRequestJWTBody);
  objc_msgSend(v6, "loginConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "customKeyExchangeRequestBodyClaims");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMutableKeyExchangeRequestJWTBody addCustomClaims:](v12, "addCustomClaims:", v14);

  -[POMutableKeyExchangeRequestJWTBody setRequest_type:](v12, "setRequest_type:", CFSTR("key_exchange"));
  -[POMutableKeyExchangeRequestJWTBody setVersion:](v12, "setVersion:", CFSTR("1.0"));
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMutableKeyExchangeRequestJWTBody setIat:](v12, "setIat:", v15);

  objc_msgSend(v6, "loginConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "clientID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMutableKeyExchangeRequestJWTBody setIss:](v12, "setIss:", v17);

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 300.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMutableKeyExchangeRequestJWTBody setExp:](v12, "setExp:", v18);

  objc_msgSend(v6, "nonce");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMutableKeyExchangeRequestJWTBody setNonce:](v12, "setNonce:", v19);

  objc_msgSend(v6, "refreshToken");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMutableKeyExchangeRequestJWTBody setRefresh_token:](v12, "setRefresh_token:", v20);

  objc_msgSend(v6, "userName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMutableKeyExchangeRequestJWTBody setUsername:](v12, "setUsername:", v21);

  objc_msgSend(v6, "userName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMutableKeyExchangeRequestJWTBody setSub:](v12, "setSub:", v22);

  -[POMutableKeyExchangeRequestJWTBody setKey_purpose:](v12, "setKey_purpose:", CFSTR("user_unlock"));
  objc_msgSend(v6, "loginConfiguration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "serverNonceClaimName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "length");

  if (v25)
  {
    objc_msgSend(v6, "loginConfiguration");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "serverNonceClaimName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v27;
    objc_msgSend(v6, "serverNonce");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v28;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[POMutableKeyExchangeRequestJWTBody addCustomClaims:](v12, "addCustomClaims:", v29);

  }
  else
  {
    objc_msgSend(v6, "serverNonce");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[POMutableKeyExchangeRequestJWTBody setRequest_nonce:](v12, "setRequest_nonce:", v26);
  }

  objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMutableKeyExchangeRequestJWTBody setOther_publickey:](v12, "setOther_publickey:", v34);

  objc_msgSend(v6, "encryptionContext");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMutableKeyExchangeRequestJWTBody setKey_context:](v12, "setKey_context:", v35);

  -[POAuthenticationProcess addCryptoHeadersToJWTBody:context:](self, "addCryptoHeadersToJWTBody:context:", v12, v6);
  v36 = objc_alloc_init(POMutableJWTHeader);
  -[POMutableJWTHeader setTyp:](v36, "setTyp:", CFSTR("platformsso-key-request+jwt"));
  objc_msgSend(v6, "loginConfiguration");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "customKeyExchangeRequestHeaderClaims");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMutableJWTHeader addCustomClaims:](v36, "addCustomClaims:", v38);

  v32 = objc_alloc_init(POMutableKeyExchangeRequestJWT);
  -[POMutableKeyExchangeRequestJWT setBody:](v32, "setBody:", v12);
  -[POMutableJWT setHeader:](v32, "setHeader:", v36);

LABEL_10:
  return v32;
}

id __86__POAuthenticationProcess_createKeyExchangeRequestJWTWithContext_otherPartyPublicKey___block_invoke_755()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Missing required values."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (id)createKeyExchangeRequestWithContext:(id)a3 jwt:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  __CFString *v29;
  const __CFAllocator *v30;
  __CFString *v31;
  const __CFAllocator *v32;
  CFDataRef ExternalRepresentation;
  id v34;
  id v35;
  id v36;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (objc_class *)MEMORY[0x24BDD16B0];
  v7 = a4;
  v8 = [v6 alloc];
  objc_msgSend(v5, "loginConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "keyEndpointURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithURL:cachePolicy:timeoutInterval:", v10, 4, 30.0);

  objc_msgSend(v11, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v11, "addValue:forHTTPHeaderField:", CFSTR("application/x-www-form-urlencoded"), CFSTR("Content-type"));
  objc_msgSend(v11, "addValue:forHTTPHeaderField:", CFSTR("application/platformsso-key-response+jwt"), CFSTR("Accept"));
  objc_msgSend(v5, "requestIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addValue:forHTTPHeaderField:", v12, CFSTR("client-request-id"));

  v13 = objc_alloc_init(MEMORY[0x24BDD1808]);
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("platform_sso_version"), CFSTR("2.0"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v14;
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("grant_type"), CFSTR("urn:ietf:params:oauth:grant-type:jwt-bearer"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "loginConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "customKeyExchangeRequestValues");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v5, "loginConfiguration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "customKeyExchangeRequestValues");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v20);
    v21 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v21;
  }
  objc_msgSend(v13, "setQueryItems:", v16);
  objc_msgSend(v13, "percentEncodedQuery");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dataUsingEncoding:", 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "mutableCopy");

  objc_msgSend(v5, "loginConfiguration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "customRequestJWTParameterName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "length");

  if (v27)
  {
    objc_msgSend(v5, "loginConfiguration");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "customRequestJWTParameterName");
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = CFSTR("assertion");
  }
  v30 = (const __CFAllocator *)SecCFAllocatorZeroize();
  v31 = (__CFString *)CFStringCreateWithFormat(v30, 0, CFSTR("&%@=%@"), v29, v7);

  if (v31)
  {
    v32 = (const __CFAllocator *)SecCFAllocatorZeroize();
    ExternalRepresentation = CFStringCreateExternalRepresentation(v32, v31, 0x8000100u, 0);
    if (ExternalRepresentation)
    {
      objc_msgSend(v24, "appendData:", ExternalRepresentation);
      objc_msgSend(v11, "setHTTPBody:", v24);
      v34 = v11;
    }
    else
    {
      v36 = __61__POAuthenticationProcess_createLoginRequestWithContext_jwt___block_invoke();
      v34 = 0;
    }

  }
  else
  {
    v35 = __61__POAuthenticationProcess_createLoginRequestWithContext_jwt___block_invoke();
    v34 = 0;
  }

  return v34;
}

- (void)performKeyExchangeRequestWithContext:(id)a3 request:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(id *, void *, void *, void *);
  void *v21;
  POAuthenticationProcess *v22;
  id v23;
  id v24;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "urlSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke;
  v21 = &unk_2514FFE60;
  v23 = v8;
  v24 = v9;
  v22 = self;
  v12 = v8;
  v13 = v9;
  objc_msgSend(v11, "dataTaskWithRequest:completionHandler:", v10, &v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v12, "requestIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("Key Exchange Request: %@"), v16, v18, v19, v20, v21, v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTaskDescription:", v17);

  objc_msgSend(v14, "resume");
}

void __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void **v14;
  id v15;
  void *v16;
  id *v17;
  id *v18;
  uint64_t *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  _BOOL4 v26;
  NSObject *v27;
  _BOOL4 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(_QWORD *);
  void *v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  uint8_t buf[16];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  PO_LOG_POAuthenticationProcess();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24440D000, v10, OS_LOG_TYPE_INFO, "Key Exchange response received", buf, 2u);
  }

  if (v9)
  {
    if (v7)
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v7, 4);
    else
      v11 = 0;
    v20 = MEMORY[0x24BDAC760];
    v46[0] = MEMORY[0x24BDAC760];
    v46[1] = 3221225472;
    v46[2] = __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_764;
    v46[3] = &unk_2514FFCB0;
    v47 = v9;
    v48 = v11;
    v12 = v11;
    v21 = __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_764((uint64_t)v46);
    objc_msgSend(a1[4], "completionQueue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v20;
    v43[1] = 3221225472;
    v43[2] = __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_767;
    v43[3] = &unk_2514FFE88;
    v45 = a1[6];
    v44 = a1[5];
    objc_msgSend(v22, "addOperationWithBlock:", v43);

    v23 = v47;
LABEL_20:

    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v8;
    if (objc_msgSend(v12, "statusCode") >= 200 && objc_msgSend(v12, "statusCode") < 300)
    {
      v26 = +[POCoreConfigurationUtil platformSSODevModeEnabled](POCoreConfigurationUtil, "platformSSODevModeEnabled");
      PO_LOG_POAuthenticationProcess();
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG);
      if (v26)
      {
        if (v28)
          __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_cold_1();
      }
      else if (v28)
      {
        __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_cold_2();
      }

      objc_msgSend(a1[4], "completionQueue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = MEMORY[0x24BDAC760];
      v30 = 3221225472;
      v31 = __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_776;
      v32 = &unk_2514FFF50;
      v14 = &v35;
      v35 = a1[6];
      v17 = &v33;
      v33 = a1[5];
      v18 = &v34;
      v34 = v7;
      v19 = &v29;
    }
    else
    {
      v13 = MEMORY[0x24BDAC760];
      v38[1] = MEMORY[0x24BDAC760];
      v38[2] = 3221225472;
      v38[3] = __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_2_772;
      v38[4] = &unk_2514FF9D0;
      v14 = &v39;
      v39 = v12;
      v15 = __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_2_772();
      objc_msgSend(a1[4], "completionQueue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v13;
      v36[1] = 3221225472;
      v36[2] = __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_775;
      v36[3] = &unk_2514FFE88;
      v17 = (id *)v38;
      v38[0] = a1[6];
      v18 = &v37;
      v37 = a1[5];
      v19 = v36;
    }
    objc_msgSend(v16, "addOperationWithBlock:", v19, v29, v30, v31, v32);

    v23 = *v14;
    goto LABEL_20;
  }
  v24 = __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_2();
  objc_msgSend(a1[4], "completionQueue");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_771;
  v40[3] = &unk_2514FFE88;
  v42 = a1[6];
  v41 = a1[5];
  objc_msgSend(v25, "addOperationWithBlock:", v40);

  v12 = v42;
LABEL_21:

}

id __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_764(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1009, *(_QWORD *)(a1 + 32), CFSTR("Failed to exchange."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_157_cold_1();

  return v1;
}

uint64_t __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_767(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 5, *(_QWORD *)(a1 + 32), 0);
}

id __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_2()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1009, CFSTR("Not HTTP response for exchange."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

uint64_t __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_771(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 3, *(_QWORD *)(a1 + 32), 0);
}

id __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_2_772()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1009, CFSTR("Exchange request failed."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_167_cold_1();

  return v0;
}

uint64_t __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_775(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 3, *(_QWORD *)(a1 + 32), 0);
}

uint64_t __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_776(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(a1[6] + 16))(a1[6], 1, a1[4], a1[5]);
}

- (void)extractGroupsAndSubUsingAuthorizationWithContext:(id)a3 tokens:(id)a4 returningGroups:(id *)a5 identifier:(id *)a6 refreshToken:(id *)a7
{
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  POIDTokenJWT *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char isKindOfClass;
  POIDTokenJWT *v21;
  void *v22;
  POIDTokenJWT *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  POIDTokenJWT *v38;
  _QWORD v39[4];
  POIDTokenJWT *v40;
  id v41;

  v11 = a3;
  *a5 = 0;
  *a6 = 0;
  v41 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a4, 16, &v41);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v41;
  v14 = v13;
  if (v13)
  {
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __123__POAuthenticationProcess_extractGroupsAndSubUsingAuthorizationWithContext_tokens_returningGroups_identifier_refreshToken___block_invoke;
    v39[3] = &unk_2514FF9D0;
    v40 = (POIDTokenJWT *)v13;
    v15 = __123__POAuthenticationProcess_extractGroupsAndSubUsingAuthorizationWithContext_tokens_returningGroups_identifier_refreshToken___block_invoke((uint64_t)v39);
    v16 = v40;
  }
  else
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("id_token"));
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17
      || (v18 = (void *)v17,
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("id_token")),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v19,
          v18,
          (isKindOfClass & 1) == 0))
    {
      v31 = __123__POAuthenticationProcess_extractGroupsAndSubUsingAuthorizationWithContext_tokens_returningGroups_identifier_refreshToken___block_invoke_781();
      goto LABEL_9;
    }
    v21 = [POIDTokenJWT alloc];
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("id_token"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[POIDTokenJWT initWithString:](v21, "initWithString:", v22);

    objc_msgSend(v11, "loginConfiguration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "groupResponseClaimName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = v23;
    -[POIDTokenJWT decodedBody](v23, "decodedBody");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v25)
    {
      objc_msgSend(v26, "allData");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "loginConfiguration");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "groupResponseClaimName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKeyedSubscript:", v30);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v26, "groups");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    -[POIDTokenJWT decodedBody](v38, "decodedBody");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "allData");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "loginConfiguration");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "uniqueIdentifierClaimName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKeyedSubscript:", v35);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    if (a7)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("refresh_token"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v37 = objc_opt_isKindOfClass();

      if ((v37 & 1) != 0)
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("refresh_token"));
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    v16 = v38;
  }

LABEL_9:
}

id __123__POAuthenticationProcess_extractGroupsAndSubUsingAuthorizationWithContext_tokens_returningGroups_identifier_refreshToken___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1008, *(_QWORD *)(a1 + 32), CFSTR("Error deserializing tokens for groups."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v1;
}

id __123__POAuthenticationProcess_extractGroupsAndSubUsingAuthorizationWithContext_tokens_returningGroups_identifier_refreshToken___block_invoke_781()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Invalid or missing id_token."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  __SecTrust *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD v19[5];
  CFErrorRef error;

  v6 = a4;
  v7 = (void (**)(id, uint64_t, _QWORD))a5;
  objc_msgSend(v6, "protectionSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "authenticationMethod");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDD12F8]);

  if (v10)
  {
    PO_LOG_PODiagnostics();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[POAuthenticationProcess URLSession:didReceiveChallenge:completionHandler:].cold.6();

    objc_msgSend(v6, "protectionSpace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (__SecTrust *)objc_msgSend(v12, "serverTrust");

    if (+[POCoreConfigurationUtil platformSSODevModeEnabled](POCoreConfigurationUtil, "platformSSODevModeEnabled")|| !+[POPreferences requireRootCAInSystemTrustStore](POPreferences, "requireRootCAInSystemTrustStore"))
    {
      PO_LOG_POAuthenticationProcess();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[POAuthenticationProcess URLSession:didReceiveChallenge:completionHandler:].cold.1();
    }
    else
    {
      error = 0;
      if (!SecTrustEvaluateWithError(v13, &error))
      {
        v19[0] = MEMORY[0x24BDAC760];
        v19[1] = 3221225472;
        v19[2] = __76__POAuthenticationProcess_URLSession_didReceiveChallenge_completionHandler___block_invoke;
        v19[3] = &__block_descriptor_40_e14___NSError_8__0l;
        v19[4] = error;
        __76__POAuthenticationProcess_URLSession_didReceiveChallenge_completionHandler___block_invoke((uint64_t)v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        PO_LOG_PODiagnostics();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          __24__POJWT_initWithString___block_invoke_cold_1();

        v7[2](v7, 2, 0);
        goto LABEL_16;
      }
      if (!+[POCoreConfigurationUtil platformSSODevModeEnabled](POCoreConfigurationUtil, "platformSSODevModeEnabled")&& +[POPreferences requireRootCAInSystemTrustStore](POPreferences, "requireRootCAInSystemTrustStore"))
      {
        v14 = SecTrustCopyCertificateChain(v13);
        if (objc_msgSend(v14, "lastObject"))
        {
          SecTrustStoreForDomain();
          if (SecTrustStoreContains())
          {
            v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1818]), "initWithTrust:", v13);
            ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v15);
LABEL_28:

            goto LABEL_16;
          }
          __76__POAuthenticationProcess_URLSession_didReceiveChallenge_completionHandler___block_invoke_793();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          PO_LOG_PODiagnostics();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            goto LABEL_26;
        }
        else
        {
          __76__POAuthenticationProcess_URLSession_didReceiveChallenge_completionHandler___block_invoke_789();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          PO_LOG_PODiagnostics();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
LABEL_26:
            __24__POJWT_initWithString___block_invoke_cold_1();
        }

        v7[2](v7, 2, 0);
        goto LABEL_28;
      }
      PO_LOG_POAuthenticationProcess();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[POAuthenticationProcess URLSession:didReceiveChallenge:completionHandler:].cold.1();
    }

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1818]), "initWithTrust:", v13);
    ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v14);
LABEL_16:

    goto LABEL_17;
  }
  v7[2](v7, 1, 0);
LABEL_17:

}

id __76__POAuthenticationProcess_URLSession_didReceiveChallenge_completionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 32);
  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1008, v1, CFSTR("trustEvaluation failed"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POAuthenticationProcess();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v2;
}

id __76__POAuthenticationProcess_URLSession_didReceiveChallenge_completionHandler___block_invoke_789()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("No root certificate"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __76__POAuthenticationProcess_URLSession_didReceiveChallenge_completionHandler___block_invoke_793()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Root certificate is not in the system trust"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v8;
  void (**v9)(id, _QWORD);
  NSObject *v10;

  v8 = a6;
  v9 = (void (**)(id, _QWORD))a7;
  PO_LOG_PODiagnostics();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[POAuthenticationProcess URLSession:task:willPerformHTTPRedirection:newRequest:completionHandler:].cold.1(v8);

  v9[2](v9, 0);
}

- (void)URLSession:(id)a3 taskIsWaitingForConnectivity:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = a4;
  PO_LOG_PODiagnostics();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POAuthenticationProcess URLSession:taskIsWaitingForConnectivity:].cold.1(v4);

}

- (id)createTestMessagesForLoginConfiguration:(id)a3 certificate:(__SecCertificate *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  SecKeyRef RandomKey;
  PODeviceConfiguration *v11;
  void *v12;
  POUserConfiguration *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  POLoginTokenJWT *v40;
  void *v41;
  void *v42;
  void *v43;
  POKeyRequestJWT *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  POKeyExchangeRequestJWT *v49;
  void *v50;
  void *v51;
  __CFString *v52;
  POAssertionTokenJWT *v54;
  POLoginTokenJWT *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  POUserConfiguration *v64;
  void *v65;
  PODeviceConfiguration *v66;
  const __CFDictionary *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint8_t buf[8];
  _QWORD v77[2];
  _QWORD v78[4];

  v78[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  PO_LOG_POAuthenticationProcess();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24440D000, v7, OS_LOG_TYPE_INFO, "Creating sample messages", buf, 2u);
  }

  if (v6)
  {
    *(_QWORD *)buf = 0;
    v8 = *MEMORY[0x24BDE9060];
    v9 = *MEMORY[0x24BDE9048];
    v77[0] = *MEMORY[0x24BDE9050];
    v77[1] = v9;
    v78[0] = v8;
    v78[1] = &unk_251520F18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v78, v77, 2);
    v67 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    RandomKey = SecKeyCreateRandomKey(v67, (CFErrorRef *)buf);
    v11 = objc_alloc_init(PODeviceConfiguration);
    -[PODeviceConfiguration setDeviceEncryptionKey:](v11, "setDeviceEncryptionKey:", RandomKey);
    -[PODeviceConfiguration setExtensionIdentifier:](v11, "setExtensionIdentifier:", CFSTR("com.apple.testMessages"));
    -[POAuthenticationProcess createAuthenticationContextUsingLoginConfiguration:deviceConfiguration:userName:](self, "createAuthenticationContextUsingLoginConfiguration:deviceConfiguration:userName:", v6, v11, CFSTR("foo@example.com"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLoginType:", 1);
    objc_msgSend(v12, "setRefreshToken:", CFSTR("This is the previous refresh token"));
    v66 = v11;
    objc_msgSend(v12, "setDeviceConfiguration:", v11);
    v68 = v6;
    objc_msgSend(v12, "setLoginConfiguration:", v6);
    objc_msgSend(v12, "setEmbeddedAssertionSigningKey:", CFRetain(RandomKey));
    -[POAuthenticationProcess createNonceRequestWithContext:](self, "createNonceRequestWithContext:", v12);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "psso_DisplayRequest");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setServerNonce:", CFSTR("This is a fake server nonce"));
    v13 = objc_alloc_init(POUserConfiguration);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v13;
    -[POUserConfiguration setUniqueIdentifier:](v13, "setUniqueIdentifier:", v15);

    objc_msgSend(CFSTR("password"), "dataUsingEncoding:", 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "mutableCopy");

    v63 = (void *)v17;
    objc_msgSend(v12, "setPassword:", v17);
    -[POAuthenticationProcess createLoginJWTWithContext:embeddedAssertion:](self, "createLoginJWTWithContext:embeddedAssertion:", v12, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deviceConfiguration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "signingAlgorithm");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = (void *)v18;
    +[POJWTSigning encodeAndSignJWT:signingAlgorithm:key:certificate:](POJWTSigning, "encodeAndSignJWT:signingAlgorithm:key:certificate:", v18, v20, RandomKey, a4);
    v21 = objc_claimAutoreleasedReturnValue();

    -[POAuthenticationProcess createLoginRequestWithContext:jwt:](self, "createLoginRequestWithContext:jwt:", v12, v21);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLoginType:", 2);
    -[POAuthenticationProcess createEmbeddedAssertionWithContext:](self, "createEmbeddedAssertionWithContext:", v12);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    +[POJWTSigning encodeAndSignJWT:algorithm:key:certificate:](POJWTSigning, "encodeAndSignJWT:algorithm:key:certificate:");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[POAuthenticationProcess createLoginJWTWithContext:embeddedAssertion:](self, "createLoginJWTWithContext:embeddedAssertion:", v12, v73);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    +[POJWTSigning encodeAndSignJWT:algorithm:key:certificate:](POJWTSigning, "encodeAndSignJWT:algorithm:key:certificate:");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[POAuthenticationProcess createLoginRequestWithContext:jwt:](self, "createLoginRequestWithContext:jwt:", v12, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[POAuthenticationProcess createKeyRequestJWTWithContext:](self, "createKeyRequestJWTWithContext:", v12);
    v22 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deviceConfiguration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "signingAlgorithm");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (void *)v22;
    +[POJWTSigning encodeAndSignJWT:signingAlgorithm:key:certificate:](POJWTSigning, "encodeAndSignJWT:signingAlgorithm:key:certificate:", v22, v24, RandomKey, a4);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    -[POAuthenticationProcess createKeyRequestWithContext:jwt:](self, "createKeyRequestWithContext:jwt:", v12, v70);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("This is an encrypted context"), "dataUsingEncoding:", 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "base64EncodedStringWithOptions:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setEncryptionContext:", v26);

    objc_msgSend(CFSTR("secret tokens"), "dataUsingEncoding:", 4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[POAuthenticationProcess createKeyExchangeRequestJWTWithContext:otherPartyPublicKey:](self, "createKeyExchangeRequestJWTWithContext:otherPartyPublicKey:", v12, v27);
    v28 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "deviceConfiguration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "signingAlgorithm");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)v28;
    +[POJWTSigning encodeAndSignJWT:signingAlgorithm:key:certificate:](POJWTSigning, "encodeAndSignJWT:signingAlgorithm:key:certificate:", v28, v30, RandomKey, a4);
    v31 = objc_claimAutoreleasedReturnValue();

    -[POAuthenticationProcess createKeyExchangeRequestWithContext:jwt:](self, "createKeyExchangeRequestWithContext:jwt:", v12, v31);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Platform SSO Test Messages\n\n"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[POSecKeyHelper printKey:](POSecKeyHelper, "printKey:", RandomKey);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringByAppendingFormat:", CFSTR("----------\nKey Generated for Signing All Test Messages: \n%@\n\n"), v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v34, "stringByAppendingFormat:", CFSTR("----------\nNonce Request: \n%@\n\n"), v75);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v61 = (void *)v21;
    v55 = -[POLoginTokenJWT initWithString:]([POLoginTokenJWT alloc], "initWithString:", v21);
    objc_msgSend(v35, "stringByAppendingFormat:", CFSTR("----------\nPassword Login JWT: \n%@\n\n"), v55);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v74, "psso_DisplayRequest");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "stringByAppendingFormat:", CFSTR("----------\nPassword Login Request: \n%@\n\n"), v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = -[POAssertionTokenJWT initWithString:]([POAssertionTokenJWT alloc], "initWithString:", v73);
    objc_msgSend(v38, "stringByAppendingFormat:", CFSTR("----------\nEmbedded Assertion: \n%@\n\n"), v54);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = -[POLoginTokenJWT initWithString:]([POLoginTokenJWT alloc], "initWithString:", v71);
    objc_msgSend(v39, "stringByAppendingFormat:", CFSTR("----------\nEmbedded Login JWT: \n%@\n\n"), v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v72, "psso_DisplayRequest");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "stringByAppendingFormat:", CFSTR("----------\nEmbedded Login Request: \n%@\n\n"), v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = -[POKeyRequestJWT initWithString:]([POKeyRequestJWT alloc], "initWithString:", v70);
    objc_msgSend(v43, "stringByAppendingFormat:", CFSTR("----------\nKey Request JWT: \n%@\n\n"), v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v69, "psso_DisplayRequest");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "stringByAppendingFormat:", CFSTR("----------\nKey Request: \n%@\n\n"), v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = (void *)v31;
    v49 = -[POKeyExchangeRequestJWT initWithString:]([POKeyExchangeRequestJWT alloc], "initWithString:", v31);
    objc_msgSend(v47, "stringByAppendingFormat:", CFSTR("----------\nKey Exchange Request JWT: \n%@\n\n"), v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v56, "psso_DisplayRequest");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "stringByAppendingFormat:", CFSTR("----------\nKey Exchange Request: \n%@\n\n"), v51);
    v52 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (RandomKey)
      CFRelease(RandomKey);

    v6 = v68;
  }
  else
  {
    v52 = CFSTR("No login configuration");
  }

  return v52;
}

- (BOOL)waitForConnectivity
{
  return self->_waitForConnectivity;
}

- (void)setWaitForConnectivity:(BOOL)a3
{
  self->_waitForConnectivity = a3;
}

- (double)timeoutIntervalForResource
{
  return self->_timeoutIntervalForResource;
}

- (void)setTimeoutIntervalForResource:(double)a3
{
  self->_timeoutIntervalForResource = a3;
}

- (POWSTrustProcess)wstrustProcess
{
  return self->_wstrustProcess;
}

- (void)setWstrustProcess:(id)a3
{
  objc_storeStrong((id *)&self->_wstrustProcess, a3);
}

- (NSOperationQueue)completionQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)kSupportedLoginResponseAlgorithms
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kSupportedLoginResponseAlgorithms, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_wstrustProcess, 0);
}

- (void)performPasswordLoginUsingContext:(void *)a1 completion:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "deviceConfiguration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_1(&dword_24440D000, v2, v3, "Device Configuration: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_10();
}

- (void)performPasswordLoginUsingContext:(void *)a1 completion:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "loginConfiguration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_1(&dword_24440D000, v2, v3, "Login Configuration: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_10();
}

- (void)createPreAuthenticationRequestWithContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8(&dword_24440D000, v0, v1, "Preauthentication request: %{private}@", v2);
  OUTLINED_FUNCTION_1();
}

void __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_cold_1()
{
  id v0;
  const char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_20();
  v0 = objc_alloc(MEMORY[0x24BDD17C8]);
  v2 = (void *)OUTLINED_FUNCTION_13(v0, v1);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_1(&dword_24440D000, v3, v4, "Preauthentication response received: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_10();
}

void __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_157_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_19(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_2(&dword_24440D000, v0, v1, "%{public}@, %{public}@");
  OUTLINED_FUNCTION_1();
}

void __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_167_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  OUTLINED_FUNCTION_6();
  v6 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_16(v1, v2);
  objc_msgSend((id)OUTLINED_FUNCTION_18(), "numberWithInteger:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_24440D000, v0, v4, "%{public}@, %{public}@", v5);

  OUTLINED_FUNCTION_3();
}

void __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_178_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_14(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_2(&dword_24440D000, v0, v1, "%{public}@, %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)createWSTrustMexRequestWithContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8(&dword_24440D000, v0, v1, "WSTrust Mex Request request: %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

void __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke_cold_1()
{
  id v0;
  const char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_20();
  v0 = objc_alloc(MEMORY[0x24BDD17C8]);
  v2 = (void *)OUTLINED_FUNCTION_13(v0, v1);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_1(&dword_24440D000, v3, v4, "WSTrust Mex response received: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_10();
}

void __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_cold_1()
{
  id v0;
  const char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_20();
  v0 = objc_alloc(MEMORY[0x24BDD17C8]);
  v2 = (void *)OUTLINED_FUNCTION_13(v0, v1);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_1(&dword_24440D000, v3, v4, "WSTrust login response received: %{private}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_10();
}

void __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0(&dword_24440D000, v0, v1, "WSTrust login response received", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_252_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_6();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(v1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_24440D000, v0, v3, "%{public}@, %{public}@", v4);

  OUTLINED_FUNCTION_3();
}

void __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_273_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8(&dword_24440D000, v0, v1, "login response received: %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)createNonceRequestWithContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8(&dword_24440D000, v0, v1, "server nonce request: %{private}@", v2);
  OUTLINED_FUNCTION_1();
}

void __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_cold_1()
{
  id v0;
  const char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_20();
  v0 = objc_alloc(MEMORY[0x24BDD17C8]);
  v2 = (void *)OUTLINED_FUNCTION_13(v0, v1);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_1(&dword_24440D000, v3, v4, "server nonce response received: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_10();
}

void __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0(&dword_24440D000, v0, v1, "server nonce response received", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_cold_1()
{
  id v0;
  const char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_20();
  v0 = objc_alloc(MEMORY[0x24BDD17C8]);
  v2 = (void *)OUTLINED_FUNCTION_13(v0, v1);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_1(&dword_24440D000, v3, v4, "login response received: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_10();
}

void __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0(&dword_24440D000, v0, v1, "login response received", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)retrieveSigningKeyWithContext:keyId:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8(&dword_24440D000, v0, v1, "using cached jwks: %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

void __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_470_cold_1()
{
  id v0;
  const char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_20();
  v0 = objc_alloc(MEMORY[0x24BDD17C8]);
  v2 = (void *)OUTLINED_FUNCTION_13(v0, v1);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_1(&dword_24440D000, v3, v4, "jwks response received: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_10();
}

- (void)validateIdToken:context:key:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8(&dword_24440D000, v0, v1, "validating id_token: %{private}@", v2);
  OUTLINED_FUNCTION_1();
}

void __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  OUTLINED_FUNCTION_6();
  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(v1 + 32), "decodedHeader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alg");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_24440D000, v0, v4, "%{public}@, %{public}@", v5);

  OUTLINED_FUNCTION_3();
}

void __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_648_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8(&dword_24440D000, v0, v1, "Key response received: %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

void __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_697_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8(&dword_24440D000, v0, v1, "Key exchange response received: %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

void __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_cold_1()
{
  id v0;
  const char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_20();
  v0 = objc_alloc(MEMORY[0x24BDD17C8]);
  v2 = (void *)OUTLINED_FUNCTION_13(v0, v1);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_1(&dword_24440D000, v3, v4, "Key response received: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_10();
}

void __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0(&dword_24440D000, v0, v1, "Key response received", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_cold_1()
{
  id v0;
  const char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_20();
  v0 = objc_alloc(MEMORY[0x24BDD17C8]);
  v2 = (void *)OUTLINED_FUNCTION_13(v0, v1);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_1(&dword_24440D000, v3, v4, "Key Exchange response received: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_10();
}

void __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0(&dword_24440D000, v0, v1, "Key Exchange response received", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)URLSession:didReceiveChallenge:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0(&dword_24440D000, v0, v1, "Platform SSO test mode enabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)URLSession:didReceiveChallenge:completionHandler:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0(&dword_24440D000, v0, v1, "Evaluating server trust", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)URLSession:(void *)a1 task:willPerformHTTPRedirection:newRequest:completionHandler:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "URL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_1(&dword_24440D000, v2, v3, "HTTP Redirect received to %{public}@, canceling", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_10();
}

- (void)URLSession:(void *)a1 taskIsWaitingForConnectivity:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "taskDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_1(&dword_24440D000, v2, v3, "%{public}@, is waiting for connectivity", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_10();
}

@end
