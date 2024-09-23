@implementation SXProxyAuthenticationHandler

- (SXProxyAuthenticationHandler)initWithCredentialFactory:(id)a3 proxyConfiguration:(id)a4 retryCount:(unint64_t)a5
{
  id v9;
  id v10;
  SXProxyAuthenticationHandler *v11;
  SXProxyAuthenticationHandler *v12;
  unint64_t v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SXProxyAuthenticationHandler;
  v11 = -[SXProxyAuthenticationHandler init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_credentialFactory, a3);
    objc_storeStrong((id *)&v12->_proxyConfiguration, a4);
    v13 = SXProxyAuthenticationHandlerDefaultRetryCount;
    if (SXProxyAuthenticationHandlerDefaultRetryCount <= a5)
      v13 = a5;
    v12->_retryCount = v13;
  }

  return v12;
}

- (void)handleAuthenticationChallenge:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "protectionSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "failureResponse");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "previousFailureCount") <= self->_retryCount)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v9, "statusCode") == 407)
      {
        if ((objc_msgSend(v8, "isProxy") & 1) != 0)
        {
          -[SXProxyConfiguration proxyHost](self->_proxyConfiguration, "proxyHost");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v8, "host");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[SXProxyConfiguration proxyHost](self->_proxyConfiguration, "proxyHost");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v13, "isEqualToString:", v14);

            if ((v15 & 1) != 0)
            {
              objc_msgSend(v8, "proxyType");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BDB7430]);

              if ((v17 & 1) != 0)
              {
                objc_msgSend(v8, "authenticationMethod");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x24BDB73F0]);

                if ((v19 & 1) != 0)
                {
                  -[SXProxyAuthenticationHandler credentialFactory](self, "credentialFactory");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDBCE60], "date");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  v25[0] = MEMORY[0x24BDAC760];
                  v25[1] = 3221225472;
                  v25[2] = __73__SXProxyAuthenticationHandler_handleAuthenticationChallenge_completion___block_invoke;
                  v25[3] = &unk_24D68A2D0;
                  v26 = v7;
                  objc_msgSend(v20, "createCredentialForResponse:date:completion:", v9, v21, v25);

                  goto LABEL_27;
                }
                if (os_log_type_enabled((os_log_t)SXProxyLog, OS_LOG_TYPE_ERROR))
                  -[SXProxyAuthenticationHandler handleAuthenticationChallenge:completion:].cold.2();
              }
              else if (os_log_type_enabled((os_log_t)SXProxyLog, OS_LOG_TYPE_ERROR))
              {
                -[SXProxyAuthenticationHandler handleAuthenticationChallenge:completion:].cold.3();
              }
            }
            else
            {
              v24 = (void *)SXProxyLog;
              if (os_log_type_enabled((os_log_t)SXProxyLog, OS_LOG_TYPE_ERROR))
                -[SXProxyAuthenticationHandler handleAuthenticationChallenge:completion:].cold.4(v24, v8);
            }
          }
          else if (os_log_type_enabled((os_log_t)SXProxyLog, OS_LOG_TYPE_ERROR))
          {
            -[SXProxyAuthenticationHandler handleAuthenticationChallenge:completion:].cold.1();
          }
        }
        else
        {
          v23 = SXProxyLog;
          if (os_log_type_enabled((os_log_t)SXProxyLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_217023000, v23, OS_LOG_TYPE_DEFAULT, "Rejecting authentication challenge; protection space is not a proxy",
              buf,
              2u);
          }
        }
        (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, 3, 0);
        goto LABEL_27;
      }
      v22 = SXProxyLog;
      if (os_log_type_enabled((os_log_t)SXProxyLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217023000, v22, OS_LOG_TYPE_DEFAULT, "Performing default handling due to non-407 authentication challenge", buf, 2u);
      }
    }
    (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, 1, 0);
    goto LABEL_27;
  }
  v10 = (void *)SXProxyLog;
  if (os_log_type_enabled((os_log_t)SXProxyLog, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    *(_DWORD *)buf = 134217984;
    v28 = objc_msgSend(v6, "previousFailureCount");
    _os_log_impl(&dword_217023000, v11, OS_LOG_TYPE_DEFAULT, "Cancelling authentication challenge due to failure count: %li", buf, 0xCu);

  }
  (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, 2, 0);
LABEL_27:

}

void __73__SXProxyAuthenticationHandler_handleAuthenticationChallenge_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void (*v5)(void);
  uint8_t v6[16];

  v3 = a2;
  v4 = SXProxyLog;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)SXProxyLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_217023000, v4, OS_LOG_TYPE_DEFAULT, "Using generated credentials for authentication handling", v6, 2u);
    }
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)SXProxyLog, OS_LOG_TYPE_ERROR))
      __73__SXProxyAuthenticationHandler_handleAuthenticationChallenge_completion___block_invoke_cold_1();
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v5();

}

- (SXProxyAuthenticationCredentialFactory)credentialFactory
{
  return self->_credentialFactory;
}

- (SXProxyConfiguration)proxyConfiguration
{
  return self->_proxyConfiguration;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyConfiguration, 0);
  objc_storeStrong((id *)&self->_credentialFactory, 0);
}

- (void)handleAuthenticationChallenge:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_217023000, v0, v1, "Rejecting authentication challenge; missing proxy host configuration",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)handleAuthenticationChallenge:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_217023000, v0, v1, "Rejecting authentication challenge; only basic proxies are supported",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)handleAuthenticationChallenge:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_217023000, v0, v1, "Rejecting authentication challenge; only HTTPS proxies are supported",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)handleAuthenticationChallenge:(void *)a1 completion:(void *)a2 .cold.4(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_217023000, v3, OS_LOG_TYPE_ERROR, "Rejecting authentication challenge; unexpected proxy host %@",
    (uint8_t *)&v5,
    0xCu);

}

void __73__SXProxyAuthenticationHandler_handleAuthenticationChallenge_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_217023000, v0, v1, "Cancelling authentication challenge due to missing credentials", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
