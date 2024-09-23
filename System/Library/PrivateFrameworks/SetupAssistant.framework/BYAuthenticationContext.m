@implementation BYAuthenticationContext

- (BYAuthenticationContext)initWithSecret:(id)a3
{
  id v5;
  BYAuthenticationContext *v6;
  BYAuthenticationContext *v7;
  LAContext *v8;
  LAContext *underlyingContext;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BYAuthenticationContext;
  v6 = -[BYAuthenticationContext init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_secret, a3);
    v8 = (LAContext *)objc_alloc_init(MEMORY[0x1E0CC12A0]);
    underlyingContext = v7->_underlyingContext;
    v7->_underlyingContext = v8;

    -[LAContext setUiDelegate:](v7->_underlyingContext, "setUiDelegate:", v7);
  }

  return v7;
}

+ (void)createContextWithSecret:(id)a3 policy:(int64_t)a4 options:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  BYAuthenticationContext *v12;
  void *v13;
  BYAuthenticationContext *v14;
  id v15;
  _QWORD v16[4];
  BYAuthenticationContext *v17;
  id v18;

  v9 = a6;
  v10 = a5;
  v11 = a3;
  v12 = -[BYAuthenticationContext initWithSecret:]([BYAuthenticationContext alloc], "initWithSecret:", v11);

  -[BYAuthenticationContext underlyingContext](v12, "underlyingContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __77__BYAuthenticationContext_createContextWithSecret_policy_options_completion___block_invoke;
  v16[3] = &unk_1E4E26AE0;
  v17 = v12;
  v18 = v9;
  v14 = v12;
  v15 = v9;
  objc_msgSend(v13, "evaluatePolicy:options:reply:", a4, v10, v16);

}

void __77__BYAuthenticationContext_createContextWithSecret_policy_options_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = a3;
  objc_msgSend(v4, "underlyingContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);

}

- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5
{
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(a4, "objectForKeyedSubscript:", &unk_1E4E34368);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a3 == 2 && objc_msgSend(v7, "BOOLValue"))
  {
    _BYLoggingFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[BYAuthenticationContext event:params:reply:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

    -[BYAuthenticationContext secret](self, "secret");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dataUsingEncoding:", 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[BYAuthenticationContext setSecret:](self, "setSecret:", 0);
    -[BYAuthenticationContext underlyingContext](self, "underlyingContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCredential:forProcessedEvent:credentialType:reply:", v18, 2, -1, &__block_literal_global_2);

  }
}

void __46__BYAuthenticationContext_event_params_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _BYLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __46__BYAuthenticationContext_event_params_reply___block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    if ((_BYIsInternalInstall() & 1) != 0)
    {
      v14 = 0;
      v15 = v4;
    }
    else if (v4)
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "domain");
      a2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), a2, objc_msgSend(v4, "code"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 1;
    }
    else
    {
      v14 = 0;
      v15 = 0;
    }
    *(_DWORD *)buf = 138543362;
    v18 = v15;
    _os_log_error_impl(&dword_1A4E92000, v6, OS_LOG_TYPE_ERROR, "Failed to set credentials for context: %{public}@", buf, 0xCu);
    if (v14)
    {

    }
  }

}

- (NSString)secret
{
  return self->_secret;
}

- (void)setSecret:(id)a3
{
  objc_storeStrong((id *)&self->_secret, a3);
}

- (LAContext)underlyingContext
{
  return self->_underlyingContext;
}

- (void)setUnderlyingContext:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingContext, 0);
  objc_storeStrong((id *)&self->_secret, 0);
}

- (void)event:(uint64_t)a3 params:(uint64_t)a4 reply:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A4E92000, a1, a3, "Setting credentials on context", a5, a6, a7, a8, 0);
}

void __46__BYAuthenticationContext_event_params_reply___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A4E92000, a1, a3, "Credentials set successful on context", a5, a6, a7, a8, 0);
}

@end
