@implementation OspreyAbsintheAuthenticator

- (OspreyAbsintheAuthenticator)initWithChannel:(id)a3 connectionPreferences:(id)a4
{
  id v7;
  id v8;
  OspreyAbsintheAuthenticator *v9;
  OspreyAbsintheAuthenticator *v10;
  OspreyAuthService *v11;
  OspreyAuthService *authService;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)OspreyAbsintheAuthenticator;
  v9 = -[OspreyAbsintheAuthenticator init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_state = 0;
    objc_storeStrong((id *)&v9->_connectionPreferences, a4);
    objc_storeStrong((id *)&v10->_channel, a3);
    v11 = -[OspreyAuthService initWithChannel:authStrategyVersion:]([OspreyAuthService alloc], "initWithChannel:authStrategyVersion:", v10->_channel, -[OspreyAbsintheAuthenticator authenticationStrategyVersion](v10, "authenticationStrategyVersion"));
    authService = v10->_authService;
    v10->_authService = v11;

  }
  return v10;
}

- (unint64_t)authenticationStrategyVersion
{
  return 0;
}

- (void)dealloc
{
  NACContextOpaque_ *nacContext;
  objc_super v4;

  nacContext = self->_nacContext;
  if (nacContext)
    IW1PcFszqNK((uint64_t)nacContext);
  v4.receiver = self;
  v4.super_class = (Class)OspreyAbsintheAuthenticator;
  -[OspreyAbsintheAuthenticator dealloc](&v4, sel_dealloc);
}

- (void)setState:(int64_t)a3
{
  -[OspreyAbsintheAuthenticator willMoveToState:](self, "willMoveToState:");
  self->_state = a3;
  -[OspreyAbsintheAuthenticator didMoveToState:](self, "didMoveToState:", a3);
}

- (BOOL)_readyToSignClientData
{
  return self->_state == 6;
}

- (void)willMoveToState:(int64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NACContextOpaque_ *nacContext;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSData *sessionInfo;
  NSDate *sessionExpireOn;

  OspreyLoggingInit();
  v5 = OspreyLogContextAbsinthe;
  if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_DEBUG))
    -[OspreyAbsintheAuthenticator willMoveToState:].cold.4((uint64_t)self, a3, v5);
  if (self->_state > a3)
  {
    if (a3 > 1)
    {
      if ((unint64_t)a3 > 3)
      {
        if (a3 != 4)
          return;
        goto LABEL_14;
      }
    }
    else
    {
      OspreyLoggingInit();
      v6 = OspreyLogContextAbsinthe;
      if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_DEBUG))
        -[OspreyAbsintheAuthenticator willMoveToState:].cold.3(v6, v7, v8, v9, v10, v11, v12, v13);
      -[OspreyConnectionPreferences deleteCertificateData](self->_connectionPreferences, "deleteCertificateData");
    }
    OspreyLoggingInit();
    v14 = OspreyLogContextAbsinthe;
    if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_DEBUG))
      -[OspreyAbsintheAuthenticator willMoveToState:].cold.2(v14, v15, v16, v17, v18, v19, v20, v21);
    nacContext = self->_nacContext;
    if (nacContext)
      IW1PcFszqNK((uint64_t)nacContext);
    self->_nacContext = 0;
LABEL_14:
    OspreyLoggingInit();
    v23 = OspreyLogContextAbsinthe;
    if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_DEBUG))
      -[OspreyAbsintheAuthenticator willMoveToState:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);
    sessionInfo = self->_sessionInfo;
    self->_sessionInfo = 0;

    sessionExpireOn = self->_sessionExpireOn;
    self->_sessionExpireOn = 0;

  }
}

- (void)signData:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  OspreyLoggingInit();
  v11 = OspreyLogContextAbsinthe;
  if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[OspreyAbsintheAuthenticator signData:success:failure:]";
    _os_log_impl(&dword_1B97C2000, v11, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __56__OspreyAbsintheAuthenticator_signData_success_failure___block_invoke;
  v15[3] = &unk_1E7098068;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[OspreyAbsintheAuthenticator _ensureAuthenticatedWithCompletion:failure:](self, "_ensureAuthenticatedWithCompletion:failure:", v15, v12);

}

void __56__OspreyAbsintheAuthenticator_signData_success_failure___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "_readyToSignClientData")
    && (objc_msgSend(*(id *)(a1 + 32), "_signData:", *(_QWORD *)(a1 + 40)),
        (v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = (id)v2;
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setAbsintheTimestampForKey:", CFSTR("FinalSignedData"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("OspreyAbsintheAuthenticationErrorDomain"), 1, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (id)_signData:(id)a3
{
  id v4;
  void *v5;
  NACContextOpaque_ *nacContext;
  id v7;
  int v8;
  NSObject *v9;
  void *v10;
  uint64_t v12;

  v4 = a3;
  v5 = v4;
  v12 = 0;
  nacContext = self->_nacContext;
  if (!nacContext)
  {
    OspreyLoggingInit();
    v9 = OspreyLogContextAbsinthe;
    if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_ERROR))
      -[OspreyAbsintheAuthenticator _signData:].cold.1(v9);
    goto LABEL_7;
  }
  v7 = objc_retainAutorelease(v4);
  t1BoNctgaUu66((uint64_t)nacContext, objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"), (uint64_t)&v12);
  if (v8)
  {
    OspreyLoggingInit();
    if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_ERROR))
      -[OspreyAbsintheAuthenticator _signData:].cold.3();
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v12, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (Be81a395Bf0(v12))
  {
    OspreyLoggingInit();
    if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_ERROR))
      -[OspreyAbsintheAuthenticator _signData:].cold.2();
  }
LABEL_8:

  return v10;
}

- (BOOL)isSessionInfoExpired
{
  uint64_t *p_sessionExpireOn;
  NSObject *v3;
  void *v4;
  void *v5;
  BOOL v6;

  if (self->_state < 5)
    return 1;
  p_sessionExpireOn = (uint64_t *)&self->_sessionExpireOn;
  if (!self->_sessionExpireOn)
    return 1;
  OspreyLoggingInit();
  v3 = OspreyLogContextAbsinthe;
  if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_DEBUG))
    -[OspreyAbsintheAuthenticator isSessionInfoExpired].cold.1(p_sessionExpireOn, v3);
  v4 = (void *)*p_sessionExpireOn;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "compare:", v5) == -1;

  return v6;
}

- (void)_ensureAuthenticatedWithCompletion:(id)a3 failure:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  int64_t state;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  OspreyAbsintheAuthenticator *v21;
  uint64_t v22;
  int v23;
  void *v24;
  void *v25;
  OspreyAuthService *authService;
  NSObject *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[5];
  void (**v31)(_QWORD);
  id v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[5];
  void (**v36)(_QWORD);
  _QWORD v37[5];
  void (**v38)(_QWORD);
  id v39;
  uint8_t buf[4];
  const char *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a3;
  v7 = a4;
  state = self->_state;
  if (state != 5)
  {
    if (state == 2)
    {
      OspreyLoggingInit();
      v17 = OspreyLogContextAbsinthe;
      if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v41 = "-[OspreyAbsintheAuthenticator _ensureAuthenticatedWithCompletion:failure:]";
        _os_log_impl(&dword_1B97C2000, v17, OS_LOG_TYPE_INFO, "%s [Absinthe state] Certificate fetched state", buf, 0xCu);
      }
      -[OspreyGRPCChannel setAbsintheTimestampForKey:](self->_channel, "setAbsintheTimestampForKey:", CFSTR("CreateSessionStart"));
      -[OspreyConnectionPreferences certificateData](self->_connectionPreferences, "certificateData");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = MEMORY[0x1E0C809B0];
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __74__OspreyAbsintheAuthenticator__ensureAuthenticatedWithCompletion_failure___block_invoke_12;
      v30[3] = &unk_1E7098158;
      v30[4] = self;
      v31 = v6;
      v32 = v7;
      v28[0] = v19;
      v28[1] = 3221225472;
      v28[2] = __74__OspreyAbsintheAuthenticator__ensureAuthenticatedWithCompletion_failure___block_invoke_4;
      v28[3] = &unk_1E7098130;
      v29 = v32;
      -[OspreyAbsintheAuthenticator _initializeAbsintheClientWithCertificateData:success:fail:](self, "_initializeAbsintheClientWithCertificateData:success:fail:", v18, v30, v28);

      v20 = v31;
      goto LABEL_27;
    }
    if (!state)
    {
      OspreyLoggingInit();
      v9 = OspreyLogContextAbsinthe;
      if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v41 = "-[OspreyAbsintheAuthenticator _ensureAuthenticatedWithCompletion:failure:]";
        _os_log_impl(&dword_1B97C2000, v9, OS_LOG_TYPE_INFO, "%s [Absinthe state] Initial state", buf, 0xCu);
      }
      -[OspreyGRPCChannel setAbsintheTimestampForKey:](self->_channel, "setAbsintheTimestampForKey:", CFSTR("GetCertificateStart"));
      v10 = MEMORY[0x1E0C809B0];
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __74__OspreyAbsintheAuthenticator__ensureAuthenticatedWithCompletion_failure___block_invoke;
      v37[3] = &unk_1E7098090;
      v37[4] = self;
      v38 = v6;
      v11 = v7;
      v39 = v11;
      v12 = (void (**)(_QWORD))MEMORY[0x1BCCC5138](v37);
      -[OspreyAbsintheAuthenticator setState:](self, "setState:", 1);
      -[OspreyConnectionPreferences certificateData](self->_connectionPreferences, "certificateData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        OspreyLoggingInit();
        v14 = OspreyLogContextAbsinthe;
        if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v41 = "-[OspreyAbsintheAuthenticator _ensureAuthenticatedWithCompletion:failure:]";
          _os_log_impl(&dword_1B97C2000, v14, OS_LOG_TYPE_INFO, "%s Certificate found in cache!", buf, 0xCu);
        }
        v12[2](v12);
      }
      else
      {
        authService = self->_authService;
        v35[0] = v10;
        v35[1] = 3221225472;
        v35[2] = __74__OspreyAbsintheAuthenticator__ensureAuthenticatedWithCompletion_failure___block_invoke_9;
        v35[3] = &unk_1E70980B8;
        v35[4] = self;
        v36 = v12;
        v33[0] = v10;
        v33[1] = 3221225472;
        v33[2] = __74__OspreyAbsintheAuthenticator__ensureAuthenticatedWithCompletion_failure___block_invoke_2;
        v33[3] = &unk_1E70980E0;
        v33[4] = self;
        v34 = v11;
        -[OspreyAuthService certificateDataWithSuccess:failure:](authService, "certificateDataWithSuccess:failure:", v35, v33);

      }
      v20 = v38;
LABEL_27:

      goto LABEL_28;
    }
    if (!-[OspreyAbsintheAuthenticator isSessionInfoExpired](self, "isSessionInfoExpired"))
    {
      v21 = self;
      v22 = 5;
      goto LABEL_24;
    }
LABEL_19:
    v21 = self;
    v22 = 2;
LABEL_24:
    -[OspreyAbsintheAuthenticator setState:](v21, "setState:", v22);
    -[OspreyAbsintheAuthenticator _ensureAuthenticatedWithCompletion:failure:](self, "_ensureAuthenticatedWithCompletion:failure:", v6, v7);
    goto LABEL_28;
  }
  OspreyLoggingInit();
  v15 = OspreyLogContextAbsinthe;
  if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v41 = "-[OspreyAbsintheAuthenticator _ensureAuthenticatedWithCompletion:failure:]";
    _os_log_impl(&dword_1B97C2000, v15, OS_LOG_TYPE_INFO, "%s [Absinthe state] Session Initialized state", buf, 0xCu);
  }
  -[OspreyGRPCChannel setAbsintheTimestampForKey:](self->_channel, "setAbsintheTimestampForKey:", CFSTR("SessionEstablishedStart"));
  if (-[OspreyAbsintheAuthenticator isSessionInfoExpired](self, "isSessionInfoExpired"))
  {
    OspreyLoggingInit();
    v16 = OspreyLogContextAbsinthe;
    if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v41 = "-[OspreyAbsintheAuthenticator _ensureAuthenticatedWithCompletion:failure:]";
      _os_log_impl(&dword_1B97C2000, v16, OS_LOG_TYPE_INFO, "%s Session info expired!", buf, 0xCu);
    }
    goto LABEL_19;
  }
  nDYmeMqvWb((uint64_t)self->_nacContext, (uint64_t)-[NSData bytes](self->_sessionInfo, "bytes"), -[NSData length](self->_sessionInfo, "length"));
  if (v23)
  {
    if (v7)
    {
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("OspreyAbsintheAuthenticationNACClientErrorDomain"), v23, 0);
      AbsintheErrorForState(3, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v7 + 2))(v7, v25);

    }
  }
  else
  {
    OspreyLoggingInit();
    v27 = OspreyLogContextAbsinthe;
    if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v41 = "-[OspreyAbsintheAuthenticator _ensureAuthenticatedWithCompletion:failure:]";
      _os_log_impl(&dword_1B97C2000, v27, OS_LOG_TYPE_INFO, "%s Session key established!", buf, 0xCu);
    }
    -[OspreyAbsintheAuthenticator setState:](self, "setState:", 6);
    -[OspreyGRPCChannel setAbsintheTimestampForKey:](self->_channel, "setAbsintheTimestampForKey:", CFSTR("SessionEstablishedEnd"));
    v6[2](v6);
  }
LABEL_28:

}

uint64_t __74__OspreyAbsintheAuthenticator__ensureAuthenticatedWithCompletion_failure___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setAbsintheTimestampForKey:", CFSTR("GetCertificateEnd"));
  objc_msgSend(*(id *)(a1 + 32), "setState:", 2);
  return objc_msgSend(*(id *)(a1 + 32), "_ensureAuthenticatedWithCompletion:failure:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __74__OspreyAbsintheAuthenticator__ensureAuthenticatedWithCompletion_failure___block_invoke_9(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setCertificateData:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __74__OspreyAbsintheAuthenticator__ensureAuthenticatedWithCompletion_failure___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setState:", 0);
  if (*(_QWORD *)(a1 + 40))
  {
    AbsintheErrorForState(0, v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void __74__OspreyAbsintheAuthenticator__ensureAuthenticatedWithCompletion_failure___block_invoke_12(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(v4 + 16);
  v10[2] = __74__OspreyAbsintheAuthenticator__ensureAuthenticatedWithCompletion_failure___block_invoke_2_13;
  v10[3] = &unk_1E7098108;
  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[4] = v4;
  v11 = v5;
  v12 = *(id *)(a1 + 48);
  v8[0] = v7;
  v8[1] = 3221225472;
  v8[2] = __74__OspreyAbsintheAuthenticator__ensureAuthenticatedWithCompletion_failure___block_invoke_3;
  v8[3] = &unk_1E7098130;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v6, "createClientSessionWithData:success:failure:", a2, v10, v8);

}

void __74__OspreyAbsintheAuthenticator__ensureAuthenticatedWithCompletion_failure___block_invoke_2_13(uint64_t a1, void *a2, double a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v6 = a2;
  objc_msgSend(v5, "setAbsintheTimestampForKey:", CFSTR("CreateSessionEnd"));
  objc_msgSend(*(id *)(a1 + 32), "setSessionInfo:", v6);

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 56);
  *(_QWORD *)(v8 + 56) = v7;
  v10 = v7;

  objc_msgSend(*(id *)(a1 + 32), "setState:", 5);
  objc_msgSend(*(id *)(a1 + 32), "_ensureAuthenticatedWithCompletion:failure:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __74__OspreyAbsintheAuthenticator__ensureAuthenticatedWithCompletion_failure___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  if (*(_QWORD *)(a1 + 32))
  {
    AbsintheErrorForState(2, a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __74__OspreyAbsintheAuthenticator__ensureAuthenticatedWithCompletion_failure___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  if (*(_QWORD *)(a1 + 32))
  {
    AbsintheErrorForState(1, a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (void)_initializeAbsintheClientWithCertificateData:(id)a3 success:(id)a4 fail:(id)a5
{
  void (**v8)(id, void *);
  void (**v9)(id, void *);
  id v10;
  id v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v8 = (void (**)(id, void *))a4;
  v9 = (void (**)(id, void *))a5;
  v10 = a3;
  -[OspreyAbsintheAuthenticator setState:](self, "setState:", 3);
  v11 = objc_retainAutorelease(v10);
  v12 = objc_msgSend(v11, "bytes");
  v13 = objc_msgSend(v11, "length");

  KxmB0CKvgWt(v12, v13);
  v15 = v14;
  if (v14 <= -44023)
  {
    if (v14 == -44302)
    {
      OspreyLoggingInit();
      v18 = OspreyLogContextAbsinthe;
      if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_ERROR))
        -[OspreyAbsintheAuthenticator _initializeAbsintheClientWithCertificateData:success:fail:].cold.3(v18, v19, v20, v21, v22, v23, v24, v25);
      goto LABEL_6;
    }
    if (v14 == -44204)
      goto LABEL_4;
    goto LABEL_17;
  }
  if ((v14 + 44022) <= 0x11 && ((1 << (v14 - 10)) & 0x30003) != 0)
  {
LABEL_4:
    -[OspreyConnectionPreferences deleteCertificateData](self->_connectionPreferences, "deleteCertificateData");
    OspreyLoggingInit();
    if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_ERROR))
      -[OspreyAbsintheAuthenticator _initializeAbsintheClientWithCertificateData:success:fail:].cold.4();
LABEL_6:
    -[OspreyAbsintheAuthenticator setState:](self, "setState:", 0);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("OspreyAbsintheAuthenticationNACClientErrorDomain"), v15, 0);
    v9[2](v9, v16);
    goto LABEL_7;
  }
  if (v14)
  {
LABEL_17:
    OspreyLoggingInit();
    if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_ERROR))
      -[OspreyAbsintheAuthenticator _initializeAbsintheClientWithCertificateData:success:fail:].cold.1();
    goto LABEL_6;
  }
  -[OspreyAbsintheAuthenticator setState:](self, "setState:", 4);
  OspreyLoggingInit();
  v17 = OspreyLogContextAbsinthe;
  if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_DEBUG))
    -[OspreyAbsintheAuthenticator _initializeAbsintheClientWithCertificateData:success:fail:].cold.2(v17);
  self->_nacContext = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  Be81a395Bf0(0);
  v8[2](v8, v16);
LABEL_7:

}

- (int64_t)state
{
  return self->_state;
}

- (NSData)sessionInfo
{
  return self->_sessionInfo;
}

- (void)setSessionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_sessionInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionExpireOn, 0);
  objc_storeStrong((id *)&self->_sessionInfo, 0);
  objc_storeStrong((id *)&self->_connectionPreferences, 0);
  objc_storeStrong((id *)&self->_authService, 0);
  objc_storeStrong((id *)&self->_channel, 0);
}

- (void)willMoveToState:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2(&dword_1B97C2000, a1, a3, "%s Clearing session info", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)willMoveToState:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2(&dword_1B97C2000, a1, a3, "%s Destroying NACContext", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)willMoveToState:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2(&dword_1B97C2000, a1, a3, "%s Removing cached certificate data", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)willMoveToState:(os_log_t)log .cold.4(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 136315650;
  v5 = "-[OspreyAbsintheAuthenticator willMoveToState:]";
  v6 = 2048;
  v7 = v3;
  v8 = 2048;
  v9 = a2;
  _os_log_debug_impl(&dword_1B97C2000, log, OS_LOG_TYPE_DEBUG, "%s Moving from state %ld to %ld", (uint8_t *)&v4, 0x20u);
}

- (void)_signData:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[OspreyAbsintheAuthenticator _signData:]";
  _os_log_error_impl(&dword_1B97C2000, log, OS_LOG_TYPE_ERROR, "%s NacContext is null!", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)_signData:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_1B97C2000, v0, v1, "%s Error disposing validation data %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_signData:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_1B97C2000, v0, v1, "%s Error signing data with NACSign: %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)isSessionInfoExpired
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 136315394;
  v4 = "-[OspreyAbsintheAuthenticator isSessionInfoExpired]";
  v5 = 2112;
  v6 = v2;
  _os_log_debug_impl(&dword_1B97C2000, a2, OS_LOG_TYPE_DEBUG, "%s SessionExpireOn: %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)_initializeAbsintheClientWithCertificateData:success:fail:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_1B97C2000, v0, v1, "%s NAC status: %d -- Error!", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_initializeAbsintheClientWithCertificateData:(os_log_t)log success:fail:.cold.2(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 136315394;
  v2 = "-[OspreyAbsintheAuthenticator _initializeAbsintheClientWithCertificateData:success:fail:]";
  v3 = 1024;
  v4 = 0;
  _os_log_debug_impl(&dword_1B97C2000, log, OS_LOG_TYPE_DEBUG, "%s NAC status: %d -- successful!", (uint8_t *)&v1, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)_initializeAbsintheClientWithCertificateData:(uint64_t)a3 success:(uint64_t)a4 fail:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B97C2000, a1, a3, "%s NAC status: %d -- Error: entitlement missing for 'abs-client'.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_initializeAbsintheClientWithCertificateData:success:fail:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_1B97C2000, v0, v1, "%s NAC status: %d -- Error: certificate data outdated.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

@end
