@implementation OspreyDeviceAuthentication

- (OspreyDeviceAuthentication)initWithChannel:(id)a3 connectionPreferences:(id)a4 allPreferences:(id)a5
{
  id v8;
  id v9;
  id v10;
  OspreyDeviceAuthentication *v11;
  OspreyDeviceAuthentication *v12;
  void *v13;
  NSDictionary *v14;
  void (**v15)(_QWORD, _QWORD);
  OspreyMescalAuthentication *v16;
  OspreyAbsintheAuthenticator *v17;
  NSDictionary *strategies;
  NSDictionary *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v24[4];
  NSDictionary *v25;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)OspreyDeviceAuthentication;
  v11 = -[OspreyDeviceAuthentication init](&v26, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_allPreferences, a5);
    objc_storeStrong((id *)&v12->_connectionPreferences, a4);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __83__OspreyDeviceAuthentication_initWithChannel_connectionPreferences_allPreferences___block_invoke;
    v24[3] = &unk_1E70986F8;
    v14 = v13;
    v25 = v14;
    v15 = (void (**)(_QWORD, _QWORD))MEMORY[0x1BCCC5138](v24);
    v16 = -[OspreyMescalAuthentication initWithChannel:connectionPreferences:]([OspreyMescalAuthentication alloc], "initWithChannel:connectionPreferences:", v8, v9);
    ((void (**)(_QWORD, OspreyMescalAuthentication *))v15)[2](v15, v16);
    v17 = -[OspreyAbsintheAuthenticator initWithChannel:connectionPreferences:]([OspreyAbsintheAuthenticator alloc], "initWithChannel:connectionPreferences:", v8, v9);
    ((void (**)(_QWORD, OspreyAbsintheAuthenticator *))v15)[2](v15, v17);
    strategies = v12->_strategies;
    v12->_strategies = v14;
    v19 = v14;

    objc_msgSend(v9, "deviceAuthenticationVersion");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
      v22 = objc_msgSend(v20, "integerValue");
    else
      v22 = 1;
    -[OspreyDeviceAuthentication setCurrentStrategyVersion:](v12, "setCurrentStrategyVersion:", v22);

  }
  return v12;
}

void __83__OspreyDeviceAuthentication_initWithChannel_connectionPreferences_allPreferences___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a2;
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "authenticationStrategyVersion"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v4, v5);

}

- (void)setCurrentStrategyVersion:(unint64_t)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;

  -[NSDictionary allKeys](self->_strategies, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  OspreyLoggingInit();
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)OspreyLogContextDeviceAuth, OS_LOG_TYPE_DEBUG))
      -[OspreyDeviceAuthentication setCurrentStrategyVersion:].cold.2();
    self->_currentStrategyVersion = a3;
    self->_hasCurrentStrategyVersion = 1;
    -[OspreyConnectionPreferences deviceAttestionVersion](self->_connectionPreferences, "deviceAttestionVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

    if (v9 != self->_currentStrategyVersion)
    {
      OspreyLoggingInit();
      v10 = OspreyLogContextDeviceAuth;
      if (os_log_type_enabled((os_log_t)OspreyLogContextDeviceAuth, OS_LOG_TYPE_DEBUG))
        -[OspreyDeviceAuthentication setCurrentStrategyVersion:].cold.1((uint64_t *)&self->_currentStrategyVersion, v9, v10);
      -[OspreyConnectionPreferences resetCachedDeviceAttestation](self->_connectionPreferences, "resetCachedDeviceAttestation");
      -[OspreyPreferences setConnectionPreferences:](self->_allPreferences, "setConnectionPreferences:", self->_connectionPreferences);
      -[OspreyPreferences synchronize](self->_allPreferences, "synchronize");
    }
  }
  else if (os_log_type_enabled((os_log_t)OspreyLogContextDeviceAuth, OS_LOG_TYPE_ERROR))
  {
    -[OspreyDeviceAuthentication setCurrentStrategyVersion:].cold.3();
  }
}

- (unint64_t)authenticationStrategyVersion
{
  return self->_currentStrategyVersion;
}

- (id)_currentStrategy
{
  NSDictionary *strategies;
  void *v3;
  void *v4;

  if (self->_hasCurrentStrategyVersion)
  {
    strategies = self->_strategies;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_currentStrategyVersion);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](strategies, "objectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)signData:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  -[OspreyDeviceAuthentication _currentStrategy](self, "_currentStrategy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[OspreyDeviceAuthentication _currentStrategy](self, "_currentStrategy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "signData:success:failure:", v12, v8, v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("OspreyDeviceAuthentication"), 1, &unk_1E70A37C0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v11);
  }

}

- (unint64_t)currentStrategyVersion
{
  return self->_currentStrategyVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strategies, 0);
  objc_storeStrong((id *)&self->_allPreferences, 0);
  objc_storeStrong((id *)&self->_connectionPreferences, 0);
}

- (void)setCurrentStrategyVersion:(os_log_t)log .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
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
  v3 = *a1;
  v4 = 136315650;
  v5 = "-[OspreyDeviceAuthentication setCurrentStrategyVersion:]";
  v6 = 2048;
  v7 = a2;
  v8 = 2048;
  v9 = v3;
  _os_log_debug_impl(&dword_1B97C2000, log, OS_LOG_TYPE_DEBUG, "%s Purging cache device attestation data due to version mismatch [cached: %lu, current: %lu]", (uint8_t *)&v4, 0x20u);
}

- (void)setCurrentStrategyVersion:.cold.2()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_3();
  _os_log_debug_impl(&dword_1B97C2000, v0, OS_LOG_TYPE_DEBUG, "%s Configuring with device auth version: %lu", (uint8_t *)v1, 0x16u);
}

- (void)setCurrentStrategyVersion:.cold.3()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_3();
  _os_log_error_impl(&dword_1B97C2000, v0, OS_LOG_TYPE_ERROR, "%s Attempted to use unknown device auth version: %lu", (uint8_t *)v1, 0x16u);
}

@end
