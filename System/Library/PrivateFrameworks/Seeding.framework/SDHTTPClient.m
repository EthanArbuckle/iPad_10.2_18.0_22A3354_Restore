@implementation SDHTTPClient

+ (SDHTTPClient)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_1);
  return (SDHTTPClient *)(id)sharedInstance_client;
}

void __30__SDHTTPClient_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_client;
  sharedInstance_client = v0;

}

- (SDHTTPClient)init
{
  SDHTTPClient *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSURLSession *urlSession;
  uint64_t v7;
  OS_os_log *log;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SDHTTPClient;
  v2 = -[SDHTTPClient init](&v10, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB39F0];
    objc_msgSend((id)objc_opt_class(), "_seedingSessionConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sessionWithConfiguration:delegate:delegateQueue:", v4, v2, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    urlSession = v2->_urlSession;
    v2->_urlSession = (NSURLSession *)v5;

    +[SDSeedingLogging httpHandle](SDSeedingLogging, "httpHandle");
    v7 = objc_claimAutoreleasedReturnValue();
    log = v2->_log;
    v2->_log = (OS_os_log *)v7;

  }
  return v2;
}

+ (id)_seedingSessionConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SDDevice deviceProductType](SDDevice, "deviceProductType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SDDevice marketingProductName](SDDevice, "marketingProductName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SDDevice productVersion](SDDevice, "productVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SDDevice osBuild](SDDevice, "osBuild");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (Seeding) (Model %@) (%@ %@) Version/%@"), v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = CFSTR("Seeding-Device-Id");
  +[SDAnalytics deviceIdentifier](SDAnalytics, "deviceIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = CFSTR("User-Agent");
  v16[0] = v12;
  v16[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHTTPAdditionalHeaders:", v13);

  return v2;
}

- (NSURL)baseURL
{
  void *v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[SDHTTPClient overrideServerURL](self, "overrideServerURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://bpapi.apple.com"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v2;
    _os_log_impl(&dword_1D4F89000, v3, OS_LOG_TYPE_INFO, "Attempting to use custom ServerURL: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SDHTTPClient baseURL].cold.1((uint64_t)v2, v5, v6);

    goto LABEL_8;
  }
LABEL_9:

  return (NSURL *)v4;
}

- (id)overrideServerURL
{
  return (id)(id)CFPreferencesCopyValue(CFSTR("ServerURL"), CFSTR("com.apple.seeding"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, uint64_t, _QWORD);
  NSObject *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t AppleSSLPinned;
  const void *v25;
  void *v26;
  __SecTrust *v27;
  void *v28;
  __CFError *v29;
  NSObject *v30;
  CFErrorRef error;
  uint8_t buf[2];
  __int16 v33;

  v7 = a4;
  v8 = (void (**)(id, uint64_t, _QWORD))a5;
  -[SDHTTPClient log](self, "log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[SDHTTPClient URLSession:didReceiveChallenge:completionHandler:].cold.2(v9);

  if (SDIsInternalInstall())
  {
    -[SDHTTPClient overrideServerURL](self, "overrideServerURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[SDHTTPClient log](self, "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v33 = 0;
        v12 = "Running with custom server URL; skipping pinning check.";
        v13 = (uint8_t *)&v33;
LABEL_15:
        _os_log_impl(&dword_1D4F89000, v11, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
  }
  objc_msgSend(v7, "protectionSpace");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "host");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SDHTTPClient baseURL](self, "baseURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "host");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v15, "isEqualToString:", v17);

  if ((v18 & 1) == 0)
  {
    -[SDHTTPClient log](self, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "Connecting to other server; skipping pinning check.";
      v13 = buf;
      goto LABEL_15;
    }
LABEL_16:

    goto LABEL_17;
  }
  objc_msgSend(v7, "protectionSpace");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "authenticationMethod");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0CB32C8]);

  if (!v21)
  {
LABEL_17:
    v8[2](v8, 1, 0);
    goto LABEL_18;
  }
  -[SDHTTPClient baseURL](self, "baseURL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "host");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  AppleSSLPinned = SecPolicyCreateAppleSSLPinned();
  if (AppleSSLPinned)
  {
    v25 = (const void *)AppleSSLPinned;
    objc_msgSend(v7, "protectionSpace");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (__SecTrust *)objc_msgSend(v26, "serverTrust");

    LODWORD(v26) = SecTrustSetPolicies(v27, v25);
    CFRelease(v25);
    if (!(_DWORD)v26)
    {
      error = 0;
      if (SecTrustEvaluateWithError(v27, &error))
      {
        objc_msgSend(MEMORY[0x1E0CB39A8], "credentialForTrust:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, uint64_t, void *))v8)[2](v8, 0, v28);

        goto LABEL_12;
      }
      if (error)
      {
        v29 = error;
        -[SDHTTPClient log](self, "log");
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          -[SDHTTPClient URLSession:didReceiveChallenge:completionHandler:].cold.1(v29, v30);

        CFRelease(error);
      }
    }
  }
  v8[2](v8, 2, 0);
LABEL_12:

LABEL_18:
}

- (NSURLSession)urlSession
{
  return self->_urlSession;
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
}

- (void)baseURL
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, a2, a3, "Invalid custom ServerURL: %@", (uint8_t *)&v3);
}

- (void)URLSession:(void *)a1 didReceiveChallenge:(NSObject *)a2 completionHandler:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, a2, v4, "Certificate failure. Error: %{public}@", (uint8_t *)&v5);

}

- (void)URLSession:(os_log_t)log didReceiveChallenge:completionHandler:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D4F89000, log, OS_LOG_TYPE_DEBUG, "URL Session did receive challenge", v1, 2u);
}

@end
