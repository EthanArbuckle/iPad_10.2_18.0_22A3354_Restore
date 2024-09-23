@implementation VUIMediaAPIClient

void __58__VUIMediaAPIClient_initializeWithAppleTVClientIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "initWithClientIdentifier:", *(_QWORD *)(a1 + 32));
  v2 = (void *)sharedInstance;
  sharedInstance = v1;

}

uint64_t __51__VUIMediaAPIClient_fetchContentForUrl_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __51__VUIMediaAPIClient_fetchContentForUrl_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "session");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataTaskPromiseWithRequest:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__VUIMediaAPIClient_fetchContentForUrl_completion___block_invoke_2;
    v10[3] = &unk_1E9FA0828;
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v7, "addFinishBlock:", v10);

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

}

- (AMSMediaTokenService)tokenService
{
  return self->_tokenService;
}

- (void)setTokenService:(id)a3
{
  objc_storeStrong((id *)&self->_tokenService, a3);
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void)setClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifier, a3);
}

- (AMSURLSession)session
{
  return self->_session;
}

- (VUIMediaAPIClient)initWithClientIdentifier:(id)a3
{
  id v4;
  VUIMediaAPIClient *v5;
  VUIMediaAPIClient *v6;
  id v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIMediaAPIClient;
  v5 = -[VUIMediaAPIClient init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[VUIMediaAPIClient setClientIdentifier:](v5, "setClientIdentifier:", v4);
    v7 = -[VUIMediaAPIClient _createSession](v6, "_createSession");
  }

  return v6;
}

- (void)fetchContentForUrl:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CFD9E8], "vui_defaultBag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__20;
  v24 = __Block_byref_object_dispose__20;
  v9 = objc_alloc(MEMORY[0x1E0CFDB38]);
  -[VUIMediaAPIClient tokenService](self, "tokenService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (id)objc_msgSend(v9, "initWithTokenService:bag:", v10, v8);

  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ams_activeiTunesAccount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)v21[5], "setAccount:", v12);
  objc_msgSend(v6, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Creating promise with request:%@"), v14);

  objc_msgSend((id)v21[5], "requestByEncodingRequest:parameters:", v6, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __51__VUIMediaAPIClient_fetchContentForUrl_completion___block_invoke;
  v17[3] = &unk_1E9FA0850;
  v16 = v7;
  v17[4] = self;
  v18 = v16;
  v19 = &v20;
  objc_msgSend(v15, "addFinishBlock:", v17);

  _Block_object_dispose(&v20, 8);
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (id)_createTokenServiceWithSession:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CFD9E8];
  v5 = a3;
  objc_msgSend(v4, "vui_defaultBag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0CFDB50]);
  -[VUIMediaAPIClient clientIdentifier](self, "clientIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithClientIdentifier:bag:", v8, v6);

  objc_msgSend(v9, "setSession:", v5);
  return v9;
}

- (id)_createSession
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDCA0]), "initWithConfiguration:", v3);
  -[VUIMediaAPIClient _createTokenServiceWithSession:](self, "_createTokenServiceWithSession:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDB30]), "initWithTokenService:", v5);
  objc_msgSend(v4, "setProtocolHandler:", v6);
  -[VUIMediaAPIClient setSession:](self, "setSession:", v4);
  -[VUIMediaAPIClient setTokenService:](self, "setTokenService:", v5);
  -[VUIMediaAPIClient session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (VUIMediaAPIClient)sharedInstance
{
  void *v2;

  v2 = (void *)sharedInstance;
  if (!sharedInstance)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("You must create with whitelisted clientID."));
    v2 = (void *)sharedInstance;
  }
  return (VUIMediaAPIClient *)v2;
}

+ (void)initializeWithAppleTVClientIdentifier
{
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;

  if (!sharedInstance)
  {
    objc_msgSend(a1, "getPlatformClientIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__VUIMediaAPIClient_initializeWithAppleTVClientIdentifier__block_invoke;
    block[3] = &unk_1E9F9BDA0;
    v7 = v3;
    v8 = a1;
    v4 = initializeWithAppleTVClientIdentifier_once;
    v5 = v3;
    if (v4 != -1)
      dispatch_once(&initializeWithAppleTVClientIdentifier_once, block);

  }
}

+ (id)getPlatformClientIdentifier
{
  return CFSTR("com.apple.ios.tv");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_tokenService, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
