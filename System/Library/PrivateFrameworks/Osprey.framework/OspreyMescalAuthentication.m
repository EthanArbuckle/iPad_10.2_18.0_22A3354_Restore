@implementation OspreyMescalAuthentication

- (OspreyMescalAuthentication)initWithChannel:(id)a3 connectionPreferences:(id)a4
{
  id v7;
  id v8;
  OspreyMescalAuthentication *v9;
  OspreyAuthService *v10;
  OspreyAuthService *authService;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)OspreyMescalAuthentication;
  v9 = -[OspreyMescalAuthentication init](&v13, sel_init);
  if (v9)
  {
    v10 = -[OspreyAuthService initWithChannel:authStrategyVersion:]([OspreyAuthService alloc], "initWithChannel:authStrategyVersion:", v7, -[OspreyMescalAuthentication authenticationStrategyVersion](v9, "authenticationStrategyVersion"));
    authService = v9->_authService;
    v9->_authService = v10;

    objc_storeStrong((id *)&v9->_connectionPreferences, a4);
    objc_storeStrong((id *)&v9->_grpcChannel, a3);
  }

  return v9;
}

- (unint64_t)authenticationStrategyVersion
{
  return 1;
}

- (unint64_t)state
{
  return self->_state;
}

- (id)mescalSession
{
  OspreyMescalSession *mescalSession;
  OspreyMescalSession *v4;
  OspreyMescalSession *v5;

  mescalSession = self->_mescalSession;
  if (!mescalSession)
  {
    v4 = objc_alloc_init(OspreyMescalSession);
    v5 = self->_mescalSession;
    self->_mescalSession = v4;

    mescalSession = self->_mescalSession;
  }
  return mescalSession;
}

- (void)moveToState:(unint64_t)a3
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
  NSData *certificateData;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  OspreyMescalSession *mescalSession;
  NSDate *sessionExpiration;

  OspreyLoggingInit();
  v5 = OspreyLogContextDeviceAuth;
  if (os_log_type_enabled((os_log_t)OspreyLogContextDeviceAuth, OS_LOG_TYPE_DEBUG))
    -[OspreyMescalAuthentication moveToState:].cold.3((uint64_t)self, a3, v5);
  if (self->_state > a3)
  {
    if (a3 != 1)
    {
      if (a3)
        goto LABEL_12;
      OspreyLoggingInit();
      v6 = OspreyLogContextDeviceAuth;
      if (os_log_type_enabled((os_log_t)OspreyLogContextDeviceAuth, OS_LOG_TYPE_DEBUG))
        -[OspreyMescalAuthentication moveToState:].cold.2(v6, v7, v8, v9, v10, v11, v12, v13);
      -[OspreyConnectionPreferences deleteCertificateData](self->_connectionPreferences, "deleteCertificateData");
      certificateData = self->_certificateData;
      self->_certificateData = 0;

    }
    OspreyLoggingInit();
    v15 = OspreyLogContextDeviceAuth;
    if (os_log_type_enabled((os_log_t)OspreyLogContextDeviceAuth, OS_LOG_TYPE_DEBUG))
      -[OspreyMescalAuthentication moveToState:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
    mescalSession = self->_mescalSession;
    self->_mescalSession = 0;

    sessionExpiration = self->_sessionExpiration;
    self->_sessionExpiration = 0;

  }
LABEL_12:
  self->_state = a3;
}

- (BOOL)isSessionExpired
{
  NSDate *sessionExpiration;
  void *v3;

  sessionExpiration = self->_sessionExpiration;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(sessionExpiration) = -[NSDate compare:](sessionExpiration, "compare:", v3) == NSOrderedAscending;

  return (char)sessionExpiration;
}

- (void)signData:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  OspreyMescalAuthentication *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[OspreyMescalAuthentication mescalSession](self, "mescalSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __55__OspreyMescalAuthentication_signData_success_failure___block_invoke;
    v14[3] = &unk_1E7098610;
    v15 = v11;
    v16 = v8;
    v18 = v10;
    v19 = v9;
    v17 = self;
    -[OspreyMescalAuthentication _continuePreparationWithCompletion:](self, "_continuePreparationWithCompletion:", v14);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("OspreyMescalAuthentication"), 1, &unk_1E70A3798);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v13);

  }
}

void __55__OspreyMescalAuthentication_signData_success_failure___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  BOOL v9;
  id v10;

  v3 = a2;
  if (v3)
  {
    v4 = v3;
    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    v5 = (void *)a1[4];
    v6 = a1[5];
    v10 = 0;
    objc_msgSend(v5, "signData:error:", v6, &v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10;
    v4 = v8;
    if (v7)
      v9 = v8 == 0;
    else
      v9 = 0;
    if (v9)
      (*(void (**)(void))(a1[8] + 16))();
    else
      (*(void (**)(void))(a1[7] + 16))();

  }
}

- (void)_continuePreparationWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  unint64_t v5;
  NSData *v6;
  NSData *certificateData;
  uint64_t v8;
  OspreyAuthService *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  OspreyAuthService *authService;
  _QWORD v16[5];
  void (**v17)(id, _QWORD);
  _QWORD v18[5];
  void (**v19)(id, _QWORD);
  id v20;
  _QWORD v21[5];
  void (**v22)(id, _QWORD);
  _QWORD v23[5];
  void (**v24)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  v5 = -[OspreyMescalAuthentication state](self, "state");
  switch(v5)
  {
    case 2uLL:
      if (!-[OspreyMescalAuthentication isSessionExpired](self, "isSessionExpired"))
      {
        v4[2](v4, 0);
        break;
      }
      goto LABEL_7;
    case 1uLL:
      -[OspreyConnectionPreferences certificateData](self->_connectionPreferences, "certificateData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[OspreyMescalAuthentication mescalSession](self, "mescalSession");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      objc_msgSend(v11, "handshakeRequestWithCertificateData:error:", v10, &v20);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v20;

      if (v12)
      {
        v14 = MEMORY[0x1E0C809B0];
        authService = self->_authService;
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __65__OspreyMescalAuthentication__continuePreparationWithCompletion___block_invoke_3;
        v18[3] = &unk_1E7098638;
        v18[4] = self;
        v19 = v4;
        v16[0] = v14;
        v16[1] = 3221225472;
        v16[2] = __65__OspreyMescalAuthentication__continuePreparationWithCompletion___block_invoke_4;
        v16[3] = &unk_1E70980E0;
        v16[4] = self;
        v17 = v19;
        -[OspreyAuthService createClientSessionWithData:success:failure:](authService, "createClientSessionWithData:success:failure:", v12, v18, v16);

      }
      else
      {
        ((void (**)(id, id))v4)[2](v4, v13);
      }

      break;
    case 0uLL:
      -[OspreyConnectionPreferences certificateData](self->_connectionPreferences, "certificateData");
      v6 = (NSData *)objc_claimAutoreleasedReturnValue();
      certificateData = self->_certificateData;
      self->_certificateData = v6;

      if (!self->_certificateData)
      {
        v8 = MEMORY[0x1E0C809B0];
        v9 = self->_authService;
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __65__OspreyMescalAuthentication__continuePreparationWithCompletion___block_invoke;
        v23[3] = &unk_1E70980B8;
        v23[4] = self;
        v24 = v4;
        v21[0] = v8;
        v21[1] = 3221225472;
        v21[2] = __65__OspreyMescalAuthentication__continuePreparationWithCompletion___block_invoke_2;
        v21[3] = &unk_1E70980E0;
        v21[4] = self;
        v22 = v24;
        -[OspreyAuthService certificateDataWithSuccess:failure:](v9, "certificateDataWithSuccess:failure:", v23, v21);

        break;
      }
LABEL_7:
      -[OspreyMescalAuthentication moveToState:](self, "moveToState:", 1);
      -[OspreyMescalAuthentication _continuePreparationWithCompletion:](self, "_continuePreparationWithCompletion:", v4);
      break;
  }

}

void __65__OspreyMescalAuthentication__continuePreparationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setCertificateData:", v3);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 56) = v3;
  v6 = v3;

  objc_msgSend(*(id *)(a1 + 32), "moveToState:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_continuePreparationWithCompletion:", *(_QWORD *)(a1 + 40));

}

void __65__OspreyMescalAuthentication__continuePreparationWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "moveToState:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __65__OspreyMescalAuthentication__continuePreparationWithCompletion___block_invoke_3(uint64_t a1, void *a2, double a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  BOOL v14;
  id v15;

  v5 = (void *)MEMORY[0x1E0C99D68];
  v6 = a2;
  objc_msgSend(v5, "dateWithTimeIntervalSinceNow:", a3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 48);
  *(_QWORD *)(v8 + 48) = v7;

  objc_msgSend(*(id *)(a1 + 32), "mescalSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v11 = objc_msgSend(v10, "completeWithHandshakeResponse:error:", v6, &v15);

  v12 = v15;
  v13 = *(void **)(a1 + 32);
  if (v11)
    v14 = v12 == 0;
  else
    v14 = 0;
  if (v14)
  {
    objc_msgSend(v13, "moveToState:", 2);
    objc_msgSend(*(id *)(a1 + 32), "_continuePreparationWithCompletion:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v13, "moveToState:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __65__OspreyMescalAuthentication__continuePreparationWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "moveToState:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificateData, 0);
  objc_storeStrong((id *)&self->_sessionExpiration, 0);
  objc_storeStrong((id *)&self->_grpcChannel, 0);
  objc_storeStrong((id *)&self->_connectionPreferences, 0);
  objc_storeStrong((id *)&self->_authService, 0);
  objc_storeStrong((id *)&self->_mescalSession, 0);
}

- (void)moveToState:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2(&dword_1B97C2000, a1, a3, "%s Clearing session info", a5, a6, a7, a8, 2u);
}

- (void)moveToState:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2(&dword_1B97C2000, a1, a3, "%s Removing cached certificate data", a5, a6, a7, a8, 2u);
}

- (void)moveToState:(os_log_t)log .cold.3(uint64_t a1, uint64_t a2, os_log_t log)
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
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 136315650;
  v5 = "-[OspreyMescalAuthentication moveToState:]";
  v6 = 2048;
  v7 = v3;
  v8 = 2048;
  v9 = a2;
  _os_log_debug_impl(&dword_1B97C2000, log, OS_LOG_TYPE_DEBUG, "%s Moving from state %ld to %ld", (uint8_t *)&v4, 0x20u);
}

@end
