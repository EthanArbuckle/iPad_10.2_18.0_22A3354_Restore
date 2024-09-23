@implementation ISStoreURLOperation

- (ISStoreURLOperation)init
{
  ISStoreURLOperation *v3;
  SSBiometricAuthenticationContext *v4;
  SSBiometricAuthenticationContext *biometricAuthenticationContext;
  objc_super v7;

  __ISRecordSPIClassUsage(self);
  v7.receiver = self;
  v7.super_class = (Class)ISStoreURLOperation;
  v3 = -[ISURLOperation init](&v7, sel_init);
  if (v3)
  {
    v4 = (SSBiometricAuthenticationContext *)objc_alloc_init(MEMORY[0x24BEB1DD0]);
    biometricAuthenticationContext = v3->_biometricAuthenticationContext;
    v3->_biometricAuthenticationContext = v4;

    v3->_canSendGUIDParameter = 1;
    v3->_machineDataStyle = 2;
    v3->_needsURLBag = 1;
    v3->_shouldAppendAuthKitHeaders = 1;
    v3->_shouldAppendStorefrontToURL = 0;
    v3->_shouldCancelBiometricTokenUpdate = 0;
    v3->_shouldSuppressUserInfo = 0;
  }
  return v3;
}

+ (void)addITunesStoreHeadersToRequest:(id)a3 withAccountIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userAgent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forHTTPHeaderField:", v9, *MEMORY[0x24BEB2518]);

  +[ISURLBagCache sharedCache](ISURLBagCache, "sharedCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLBagForContext:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activeAccount");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "uniqueIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(a1, "_addiTunesStoreHeadersToRequest:withURLBag:accountIdentifier:appendAuthKitHeaders:appendStorefrontToURL:clientBundleIdentifier:", v14, v11, v6, 1, 0, 0);

}

+ (void)handleITunesStoreResponseHeaders:(id)a3 request:(id)a4 withAccountIdentifier:(id)a5 shouldRetry:(BOOL *)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v9 = (void *)MEMORY[0x24BEB1D88];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "defaultStore");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "accountWithUniqueIdentifier:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[ISStoreURLOperation _handleResponseHeaders:response:request:account:performsMachineDataActions:shouldRetry:](ISStoreURLOperation, "_handleResponseHeaders:response:request:account:performsMachineDataActions:shouldRetry:", 0, v12, v11, v13, 1, a6);
}

+ (id)itemPingOperationWithIdentifier:(unint64_t)a3 urlBagKey:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  v6 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v6, "setQueuePriority:", -8);
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  +[ISDevice sharedInstance](ISDevice, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "guid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("machine-id"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v10, CFSTR("songId"));

  v11 = objc_alloc_init(MEMORY[0x24BEB1F30]);
  objc_msgSend(v11, "setRequestParameters:", v7);
  objc_msgSend(v11, "setURLBagKey:", v5);

  objc_msgSend(v6, "setRequestProperties:", v11);
  return v6;
}

+ (id)pingOperationWithUrl:(id)a3
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
  int v13;
  uint64_t v14;
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
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  uint64_t v31;
  void *v32;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setQueuePriority:", -8);
  objc_msgSend(v4, "setUrlKnownToBeTrusted:", 1);
  objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ISURLBagCache sharedCache](ISURLBagCache, "sharedCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLBagForContext:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "valueForKey:", *MEMORY[0x24BEB2990]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("metricsUrl"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "host");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "host");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToString:", v12);

    if (v13)
    {
      objc_msgSend(v3, "path");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v10;
      v16 = (void *)v14;
      v32 = v15;
      objc_msgSend(v15, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(v3, "query");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v18, "copyDictionaryForQueryString:unescapedValues:", v19, 1);

      v21 = v16;
      if (objc_msgSend(v16, "hasPrefix:", v17))
      {
        v22 = v17;
        v23 = v21;
        objc_msgSend(v20, "objectForKey:", CFSTR("eventTime"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "timeIntervalSince1970");
          v27 = v26;

          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lld"), (uint64_t)(v27 * 1000.0));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKey:", v28, CFSTR("eventTime"));
          objc_msgSend(v3, "urlBySettingQueryStringDictionary:", v20);
          v31 = objc_claimAutoreleasedReturnValue();

          v3 = (id)v31;
        }
        v21 = v23;
        v17 = v22;
      }
      v10 = v32;

    }
  }
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F30]), "initWithURL:", v3);
  objc_msgSend(v29, "setAllowedRetryCount:", 0);
  objc_msgSend(v29, "setTimeoutInterval:", 20.0);
  objc_msgSend(v4, "setRequestProperties:", v29);

  return v4;
}

+ (id)propertyListOperationWithURLBagKey:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  +[ISDataProvider provider](ISProtocolDataProvider, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDataProvider:", v5);

  v6 = objc_alloc_init(MEMORY[0x24BEB1F30]);
  objc_msgSend(v6, "setURLBagKey:", v3);

  objc_msgSend(v4, "setRequestProperties:", v6);
  return v4;
}

- (BOOL)canSendGUIDParameter
{
  BOOL canSendGUIDParameter;

  -[ISOperation lock](self, "lock");
  canSendGUIDParameter = self->_canSendGUIDParameter;
  -[ISOperation unlock](self, "unlock");
  return canSendGUIDParameter;
}

- (id)logKey
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  -[ISURLOperation authenticationContext](self, "authenticationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ISURLOperation authenticationContext](self, "authenticationContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ISStoreURLOperation;
    -[ISURLOperation logKey](&v8, sel_logKey);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)ignorePreexistingSecureToken
{
  BOOL ignorePreexistingSecureToken;

  -[ISOperation lock](self, "lock");
  ignorePreexistingSecureToken = self->_ignorePreexistingSecureToken;
  -[ISOperation unlock](self, "unlock");
  return ignorePreexistingSecureToken;
}

- (BOOL)performsMachineDataActions
{
  BOOL v3;

  -[ISOperation lock](self, "lock");
  v3 = self->_machineDataStyle != 0;
  -[ISOperation unlock](self, "unlock");
  return v3;
}

- (SSVFairPlaySAPSession)SAPSession
{
  SSVFairPlaySAPSession *v3;

  -[ISOperation lock](self, "lock");
  v3 = self->_sapSession;
  -[ISOperation unlock](self, "unlock");
  return v3;
}

- (void)setCanSendGUIDParameter:(BOOL)a3
{
  -[ISOperation lock](self, "lock");
  self->_canSendGUIDParameter = a3;
  -[ISOperation unlock](self, "unlock");
}

- (void)setIgnorePreexistingSecureToken:(BOOL)a3
{
  -[ISOperation lock](self, "lock");
  self->_ignorePreexistingSecureToken = a3;
  -[ISOperation unlock](self, "unlock");
}

- (void)setPerformsMachineDataActions:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;

  v3 = a3;
  -[ISOperation lock](self, "lock");
  if (!v3)
  {
    v5 = 0;
    goto LABEL_5;
  }
  if (!self->_machineDataStyle)
  {
    v5 = 2;
LABEL_5:
    self->_machineDataStyle = v5;
  }
  -[ISOperation unlock](self, "unlock");
}

- (void)setSAPSession:(id)a3
{
  SSVFairPlaySAPSession *v5;

  v5 = (SSVFairPlaySAPSession *)a3;
  -[ISOperation lock](self, "lock");
  if (self->_sapSession != v5)
    objc_storeStrong((id *)&self->_sapSession, a3);
  -[ISOperation unlock](self, "unlock");

}

- (void)setShouldSendXTokenHeader:(BOOL)a3
{
  -[ISOperation lock](self, "lock");
  self->_shouldSendXTokenHeader = a3;
  -[ISOperation unlock](self, "unlock");
}

- (BOOL)shouldSendXTokenHeader
{
  BOOL shouldSendXTokenHeader;

  -[ISOperation lock](self, "lock");
  shouldSendXTokenHeader = self->_shouldSendXTokenHeader;
  -[ISOperation unlock](self, "unlock");
  return shouldSendXTokenHeader;
}

- (SSURLBagContext)URLBagContext
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x24BEB1FF8]);
  -[ISURLOperation _requestProperties](self, "_requestProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsBootstrapCellularData:", objc_msgSend(v4, "allowsBootstrapCellularData"));
  objc_msgSend(v3, "setBagType:", objc_msgSend(v4, "URLBagType"));
  objc_msgSend(v4, "clientAuditTokenData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClientAuditTokenData:", v5);

  objc_msgSend(v4, "HTTPHeaders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BEB2518];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BEB2518]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v3, "setValue:forHTTPHeaderField:", v8, v7);
  }
  else
  {
    objc_msgSend(v3, "valueForHTTPHeaderField:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "userAgent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forHTTPHeaderField:", v11, v7);

    }
  }
  if (-[ISStoreURLOperation needsAuthentication](self, "needsAuthentication")
    || -[ISStoreURLOperation useUserSpecificURLBag](self, "useUserSpecificURLBag"))
  {
    -[ISStoreURLOperation _account](self, "_account");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setUserIdentifier:", v13);

  }
  return (SSURLBagContext *)v3;
}

- (id)authenticatedAccountDSID
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[ISStoreURLOperation authenticatedDSID](self, "authenticatedDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ISStoreURLOperation;
    -[ISOperation authenticatedAccountDSID](&v8, sel_authenticatedAccountDSID);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)_copyAuthenticationContext
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ISStoreURLOperation;
  v3 = -[ISURLOperation _copyAuthenticationContext](&v14, sel__copyAuthenticationContext);
  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x24BEB1F28]);
    -[ISStoreURLOperation _account](self, "_account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v4, "initWithAccount:", v5);

    -[ISStoreURLOperation logKey](self, "logKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLogUUID:", v6);

    objc_msgSend(v3, "setCanSetActiveAccount:", 0);
  }
  -[ISURLOperation _requestProperties](self, "_requestProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLBagType");
  objc_msgSend(v3, "setAccountScope:", SSAccountScopeForURLBagType());
  objc_msgSend(v3, "setAllowsBootstrapCellularData:", objc_msgSend(v7, "allowsBootstrapCellularData"));
  objc_msgSend(v7, "clientIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClientIdentifierHeader:", v8);

  objc_msgSend(v7, "HTTPHeaders");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BEB2518];
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BEB2518]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v3, "setValue:forHTTPHeaderField:", v11, v10);
  objc_msgSend(v7, "userAgentComponents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v3, "setUserAgentComponents:", v12);
  -[ISOperation lock](self, "lock");
  if (self->_ignorePreexistingSecureToken)
    objc_msgSend(v3, "setPersistsPasswordFallback:", 1);
  -[ISOperation unlock](self, "unlock");

  return v3;
}

- (BOOL)handleRedirectFromDataProvider:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  NSObject *v25;
  int v26;
  void *v27;
  void *v28;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  objc_super v34;
  id v35;
  int v36;
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "authenticatedAccountDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[ISStoreURLOperation setAuthenticatedDSID:](self, "setAuthenticatedDSID:", v7);
    -[ISStoreURLOperation setNeedsAuthentication:](self, "setNeedsAuthentication:", 1);
  }
  objc_msgSend(v6, "redirectURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "schemeSwizzledURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[ISStoreURLOperation needsAuthentication](self, "needsAuthentication")
    && !-[ISStoreURLOperation _canSendTokenToURL:](self, "_canSendTokenToURL:", v9))
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v23 = objc_msgSend(v22, "shouldLog");
    if (objc_msgSend(v22, "shouldLogToDisk"))
      v24 = v23 | 2;
    else
      v24 = v23;
    objc_msgSend(v22, "OSLogObject");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      v26 = v24;
    else
      v26 = v24 & 2;
    if (v26)
    {
      v27 = (void *)objc_opt_class();
      v33 = v27;
      -[ISURLOperation _sanitizedURLForURL:](self, "_sanitizedURLForURL:", v9);
      v36 = 138412546;
      v37 = v27;
      v38 = 2112;
      v39 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v30) = 22;
      v28 = (void *)_os_log_send_and_compose_impl();

      if (!v28)
      {
LABEL_30:

        ISError();
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v12 = 0;
        goto LABEL_33;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v28, 4, &v36, v30);
      v25 = objc_claimAutoreleasedReturnValue();
      free(v28);
      SSFileLog();
    }

    goto LABEL_30;
  }
  -[ISStoreURLOperation URLBagContext](self, "URLBagContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISStoreURLOperation _urlBagForContext:](self, "_urlBagForContext:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "urlIsTrusted:", v9) & 1) != 0)
  {

    v34.receiver = self;
    v34.super_class = (Class)ISStoreURLOperation;
    v35 = 0;
    v12 = -[ISURLOperation handleRedirectFromDataProvider:error:](&v34, sel_handleRedirectFromDataProvider_error_, v6, &v35);
    v13 = v35;
  }
  else
  {
    v32 = v9;
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = objc_msgSend(v14, "shouldLog");
    if (objc_msgSend(v14, "shouldLogToDisk"))
      v16 = v15 | 2;
    else
      v16 = v15;
    objc_msgSend(v14, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      v18 = v16;
    else
      v18 = v16 & 2;
    if (v18)
    {
      v19 = (void *)objc_opt_class();
      v31 = v19;
      -[ISURLOperation _sanitizedURLForURL:](self, "_sanitizedURLForURL:", v32);
      v36 = 138412546;
      v37 = v19;
      v38 = 2112;
      v39 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v30) = 22;
      v20 = (void *)_os_log_send_and_compose_impl();

      if (v20)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v20, 4, &v36, v30);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        free(v20);
        SSFileLog();

      }
    }
    else
    {

    }
    ISError();
    v13 = (id)objc_claimAutoreleasedReturnValue();

    v12 = 0;
    v9 = v32;
  }
LABEL_33:
  if (a4 && !v12)
    *a4 = objc_retainAutorelease(v13);

  return v12;
}

- (void)handleResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = 0;
    -[ISURLOperation activeURLRequest](self, "activeURLRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISStoreURLOperation _account](self, "_account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[ISStoreURLOperation _handleResponseHeaders:response:request:account:performsMachineDataActions:shouldRetry:](ISStoreURLOperation, "_handleResponseHeaders:response:request:account:performsMachineDataActions:shouldRetry:", self, v4, v5, v6, 0, &v8);

    if (v8)
      -[ISURLOperation _retry](self, "_retry");
  }
  v7.receiver = self;
  v7.super_class = (Class)ISStoreURLOperation;
  -[ISURLOperation handleResponse:](&v7, sel_handleResponse_, v4);

}

- (id)newRequestWithURL:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  SSBag *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  _BOOL8 v20;
  void *v21;
  void *v22;
  _BOOL8 v23;
  _BOOL8 v24;
  void *v25;
  _BOOL8 v26;
  _BOOL8 v27;
  uint64_t v28;
  SSBag *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *i;
  void *v49;
  void *v50;
  _BOOL8 v51;
  _BOOL8 v52;
  void *v53;
  void *v54;
  SSBag *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  objc_super v61;
  objc_super v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[ISStoreURLOperation shouldSuppressUserInfo](self, "shouldSuppressUserInfo"))
  {
    -[ISURLOperation _setUsesPrivateCookieStore:](self, "_setUsesPrivateCookieStore:", 0);
    v62.receiver = self;
    v62.super_class = (Class)ISStoreURLOperation;
    v5 = -[ISURLOperation newRequestWithURL:](&v62, sel_newRequestWithURL_, v4);
    objc_msgSend(v5, "setHTTPShouldHandleCookies:", 0);
  }
  else
  {
    v61.receiver = self;
    v61.super_class = (Class)ISStoreURLOperation;
    v5 = -[ISURLOperation newRequestWithURL:](&v61, sel_newRequestWithURL_, v4);
  }
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_bag)
  {
    if (!-[ISStoreURLOperation isURLBagRequest](self, "isURLBagRequest"))
    {
      v9 = self->_bag;
      v7 = 0;
      goto LABEL_10;
    }
    v7 = 0;
  }
  else
  {
    -[ISStoreURLOperation URLBagContext](self, "URLBagContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISStoreURLOperation _urlBagForContext:](self, "_urlBagForContext:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v9 = 0;
LABEL_10:
  -[ISStoreURLOperation _applyAnalyticsCookiesToRequest:withBag:oldBag:](self, "_applyAnalyticsCookiesToRequest:withBag:oldBag:", v5, v9, v7);
  if (-[ISStoreURLOperation canSendGUIDParameter](self, "canSendGUIDParameter"))
  {
    objc_msgSend(v5, "HTTPMethod");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("POST"));

    if ((v11 & 1) == 0)
    {
      if (v9)
      {
        if (!-[ISStoreURLOperation _ssBag_shouldSendGUIDForURL:withBag:](self, "_ssBag_shouldSendGUIDForURL:withBag:", v6, v9))goto LABEL_19;
      }
      else if (!objc_msgSend(v7, "shouldSendGUIDForURL:", v6))
      {
        goto LABEL_19;
      }
      +[ISDevice sharedInstance](ISDevice, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "guid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v6, "URLByAppendingQueryParameter:value:", CFSTR("guid"), v13);
        v14 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "setURL:", v14);
        v6 = (void *)v14;
      }

    }
  }
LABEL_19:
  -[ISStoreURLOperation _account](self, "_account");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v9;
  if (v9)
  {
    v16 = v7;
    v17 = v6;
    if (v15)
    {
      v18 = (void *)objc_opt_class();
      v19 = -[ISStoreURLOperation shouldAppendAuthKitHeaders](self, "shouldAppendAuthKitHeaders");
      v20 = -[ISStoreURLOperation shouldAppendStorefrontToURL](self, "shouldAppendStorefrontToURL");
      objc_msgSend(0, "clientBundleIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_addiTunesStoreHeadersToRequest:withSSBag:account:appendAuthKitHeaders:appendStorefrontToURL:clientBundleIdentifier:", v5, v9, v15, v19, v20, v21);
    }
    else
    {
      -[ISURLOperation _accountIdentifier](self, "_accountIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_opt_class();
      v26 = -[ISStoreURLOperation shouldAppendAuthKitHeaders](self, "shouldAppendAuthKitHeaders");
      v27 = -[ISStoreURLOperation shouldAppendStorefrontToURL](self, "shouldAppendStorefrontToURL");
      objc_msgSend(0, "clientBundleIdentifier");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = v9;
      v30 = (void *)v28;
      objc_msgSend(v25, "_addiTunesStoreHeadersToRequest:withSSBag:accountIdentifier:appendAuthKitHeaders:appendStorefrontToURL:clientBundleIdentifier:", v5, v29, v21, v26, v27, v28);

    }
    v6 = v17;
    v7 = v16;
  }
  else if (v15)
  {
    v22 = (void *)objc_opt_class();
    v23 = -[ISStoreURLOperation shouldAppendAuthKitHeaders](self, "shouldAppendAuthKitHeaders");
    v24 = -[ISStoreURLOperation shouldAppendStorefrontToURL](self, "shouldAppendStorefrontToURL");
    objc_msgSend(0, "clientBundleIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_addiTunesStoreHeadersToRequest:withURLBag:account:appendAuthKitHeaders:appendStorefrontToURL:clientBundleIdentifier:", v5, v7, v15, v23, v24, v21);
  }
  else
  {
    -[ISURLOperation _accountIdentifier](self, "_accountIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)objc_opt_class();
    v51 = -[ISStoreURLOperation shouldAppendAuthKitHeaders](self, "shouldAppendAuthKitHeaders");
    v52 = -[ISStoreURLOperation shouldAppendStorefrontToURL](self, "shouldAppendStorefrontToURL");
    objc_msgSend(0, "clientBundleIdentifier");
    v53 = v6;
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "_addiTunesStoreHeadersToRequest:withURLBag:accountIdentifier:appendAuthKitHeaders:appendStorefrontToURL:clientBundleIdentifier:", v5, v7, v21, v51, v52, v54);

    v6 = v53;
  }

  if (-[ISStoreURLOperation shouldSuppressUserInfo](self, "shouldSuppressUserInfo"))
  {
    objc_msgSend(v5, "setValue:forHTTPHeaderField:", 0, *MEMORY[0x24BEB2550]);
    objc_msgSend(v5, "setValue:forHTTPHeaderField:", 0, *MEMORY[0x24BEB2510]);
  }
  -[ISURLOperation _requestProperties](self, "_requestProperties");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "clientIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    v33 = (void *)objc_msgSend(v32, "copy");
    objc_msgSend(v5, "setValue:forHTTPHeaderField:", v33, *MEMORY[0x24BEB2548]);

  }
  if (-[ISStoreURLOperation needsAuthentication](self, "needsAuthentication")
    || -[ISStoreURLOperation shouldSendXTokenHeader](self, "shouldSendXTokenHeader"))
  {
    -[ISOperation lock](self, "lock");
    if (-[ISStoreURLOperation needsAuthentication](self, "needsAuthentication"))
    {
      -[ISStoreURLOperation authenticatedDSID](self, "authenticatedDSID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34 != 0;

    }
    else
    {
      v35 = 1;
    }
    -[ISStoreURLOperation biometricAuthenticationContext](self, "biometricAuthenticationContext");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "didFallbackToPassword");

    LODWORD(v36) = self->_ignorePreexistingSecureToken;
    -[ISOperation unlock](self, "unlock");
    if (!(_DWORD)v36 || (v37 & v35) != 0)
    {
      objc_msgSend(v15, "secureToken");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if ((SSIsDaemon() & 1) == 0 && !v38)
      {
        -[ISURLOperation _requestProperties](self, "_requestProperties");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "URLBagKey");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "isEqualToString:", CFSTR("buyProduct"));

        if (v41)
        {
          objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "accounts");
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          v59 = 0u;
          v60 = 0u;
          v57 = 0u;
          v58 = 0u;
          v44 = v43;
          v38 = (void *)objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
          if (v38)
          {
            v45 = v7;
            v46 = v6;
            v47 = *(_QWORD *)v58;
            while (2)
            {
              for (i = 0; i != v38; i = (char *)i + 1)
              {
                if (*(_QWORD *)v58 != v47)
                  objc_enumerationMutation(v44);
                v49 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
                if (objc_msgSend(v15, "isEqual:", v49))
                {
                  objc_msgSend(v49, "secureToken");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  goto LABEL_52;
                }
              }
              v38 = (void *)objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
              if (v38)
                continue;
              break;
            }
LABEL_52:
            v6 = v46;
            v7 = v45;
          }

        }
        else
        {
          v38 = 0;
        }
      }
      objc_msgSend(v5, "setValue:forHTTPHeaderField:", v38, *MEMORY[0x24BEB25E0]);

    }
  }

  return v5;
}

- (BOOL)_processResponseData:(id)a3 error:(id *)a4
{
  id v6;
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
  int v17;
  id v18;
  BOOL v19;
  id v21;

  v6 = a3;
  -[ISStoreURLOperation SAPSession](self, "SAPSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v18 = 0;
    goto LABEL_8;
  }
  -[ISURLOperation activeURLRequest](self, "activeURLRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISURLOperation _requestProperties](self, "_requestProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISStoreURLOperation _loadURLBagInterpreterWithRequest:requestProperties:](self, "_loadURLBagInterpreterWithRequest:requestProperties:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ISURLOperation response](self, "response");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mescalSignaturePolicyForResponseURL:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 && objc_msgSend(v13, "policyType"))
  {
    objc_msgSend(v11, "allHeaderFields");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ISDictionaryValueForCaseInsensitiveString(v14, (void *)*MEMORY[0x24BEB2540]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v15, 0);
      v21 = 0;
      v17 = objc_msgSend(v7, "verifyData:withSignature:error:", v6, v16, &v21);
      v18 = v21;

LABEL_13:
      goto LABEL_14;
    }
    SSError();
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)(objc_msgSend(v11, "statusCode") - 400) > 0x257
      || !-[ISURLOperation _loadsHTTPFailures](self, "_loadsHTTPFailures"))
    {
      v17 = 0;
      goto LABEL_13;
    }

LABEL_8:
    v19 = 1;
    goto LABEL_17;
  }
  v18 = 0;
  v17 = 1;
LABEL_14:

  v19 = v17 != 0;
  if (a4 && !v17)
  {
    v18 = objc_retainAutorelease(v18);
    v19 = 0;
    *a4 = v18;
  }
LABEL_17:

  return v19;
}

- (void)run
{
  SSVFairPlaySAPSession *v3;
  SSVFairPlaySAPSession *sapSession;
  int64_t machineDataStyle;
  unint64_t v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  BOOL v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  id v24;
  int v25;
  char v26;
  void *v27;
  uint64_t v28;
  void *v29;
  int v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  int v41;
  BOOL v42;
  void *v43;
  int v44;
  NSObject *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _BOOL4 v61;
  void *v62;
  NSObject *v63;
  char v64;
  id v65;
  void *v66;
  void *v67;
  char v68;
  int v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  int v81;
  NSObject *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  int v100;
  NSObject *v101;
  void *v102;
  id v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  int v108;
  NSObject *v109;
  void *v110;
  id v111;
  void *v112;
  void *v113;
  int *v114;
  int *v115;
  int *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  unsigned int v120;
  void *v121;
  void *v122;
  id v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  id v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  id v144;
  id v145;
  int v146;
  void *v147;
  __int16 v148;
  void *v149;
  __int16 v150;
  void *v151;
  uint64_t v152;

  v152 = *MEMORY[0x24BDAC8D0];
  -[ISOperation lock](self, "lock");
  if (self->_isURLBagRequest)
    goto LABEL_8;
  if (!self->_sapSession)
  {
    if (SSIsDaemon())
      objc_msgSend(MEMORY[0x24BEB2028], "sharedDefaultSession");
    else
      objc_msgSend(MEMORY[0x24BEB2028], "sharedPrimeSession");
    v3 = (SSVFairPlaySAPSession *)objc_claimAutoreleasedReturnValue();
    sapSession = self->_sapSession;
    self->_sapSession = v3;

  }
  if (self->_isURLBagRequest)
LABEL_8:
    machineDataStyle = 0;
  else
    machineDataStyle = self->_machineDataStyle;
  self->_activeMachineDataStyle = machineDataStyle;
  -[ISOperation unlock](self, "unlock");
  if (-[ISStoreURLOperation needsAuthentication](self, "needsAuthentication"))
    LODWORD(v132) = !-[ISStoreURLOperation ignorePreexistingSecureToken](self, "ignorePreexistingSecureToken");
  else
    LOBYTE(v132) = 0;
  v133 = 0;
  v134 = 0;
  v6 = 0x24BEB1000uLL;
  v124 = *MEMORY[0x24BEB2530];
  v125 = *MEMORY[0x24BEB2528];
  v126 = *MEMORY[0x24BEB2488];
  while (1)
  {
    v7 = (void *)MEMORY[0x20BD37A0C]();
    if (v134 < 1)
      goto LABEL_25;
    objc_msgSend(*(id *)(v6 + 3736), "sharedAccountsAuthenticationConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(*(id *)(v6 + 3736), "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v8, "shouldLog", v114);
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v9 |= 2u;
    objc_msgSend(v8, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      v9 &= 2u;
    if (!v9)
      goto LABEL_23;
    v11 = (void *)objc_opt_class();
    v12 = v7;
    v13 = v11;
    -[ISURLOperation requestProperties](self, "requestProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v146 = 138543618;
    v147 = v11;
    v148 = 2114;
    v149 = v15;
    LODWORD(v117) = 22;
    v114 = &v146;
    v16 = (void *)_os_log_send_and_compose_impl();

    v7 = v12;
    if (v16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v16, 4, &v146, v117);
      v10 = objc_claimAutoreleasedReturnValue();
      free(v16);
      v114 = (int *)v10;
      SSFileLog();
LABEL_23:

    }
LABEL_25:
    v17 = -[ISStoreURLOperation _copyAuthenticationContextForAttemptNumber:](self, "_copyAuthenticationContextForAttemptNumber:", v133, v114);
    v143 = v17;
    if ((v132 & 1) != 0)
    {
      v145 = 0;
      v18 = -[ISStoreURLOperation _authenticateWithContext:error:](self, "_authenticateWithContext:error:", v17, &v145);
      v19 = v145;
      if (!v18)
      {
        v97 = v7;
        objc_msgSend(*(id *)(v6 + 3736), "sharediTunesStoreConfig");
        v98 = objc_claimAutoreleasedReturnValue();
        v99 = (void *)v98;
        if (!v98)
        {
          objc_msgSend(*(id *)(v6 + 3736), "sharedConfig");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v100 = objc_msgSend(v99, "shouldLog");
        if (objc_msgSend(v99, "shouldLogToDisk"))
          v100 |= 2u;
        objc_msgSend(v99, "OSLogObject");
        v101 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
          v100 &= 2u;
        if (v100)
        {
          v102 = (void *)objc_opt_class();
          v103 = v102;
          -[ISURLOperation _sanitizedDescriptionForObject:](self, "_sanitizedDescriptionForObject:", v19);
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          v146 = 138412546;
          v147 = v102;
          v148 = 2112;
          v149 = v104;
          LODWORD(v117) = 22;
          v105 = (void *)_os_log_send_and_compose_impl();

          if (!v105)
          {
LABEL_148:

            -[ISOperation setError:](self, "setError:", v19);
            v27 = v19;
            v7 = v97;
            goto LABEL_160;
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v105, 4, &v146, v117);
          v101 = objc_claimAutoreleasedReturnValue();
          free(v105);
          SSFileLog();
        }

        goto LABEL_148;
      }
    }
    else
    {
      v19 = 0;
    }
    if (!-[ISStoreURLOperation needsTermsAndConditionsAcceptance](self, "needsTermsAndConditionsAcceptance"))
    {
      v27 = v19;
      goto LABEL_50;
    }
    v20 = objc_alloc(NSClassFromString(CFSTR("AcceptTermsAndConditionsOperation")));
    -[ISStoreURLOperation _account](self, "_account");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithAccount:", v21);

    if (!v22)
      break;
    v135 = v7;
    v144 = v19;
    v23 = -[ISOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v22, &v144);
    v24 = v144;

    if (v23)
    {
      v25 = objc_msgSend(v22, "isUserAccepted");
      if (v25)
      {
        v26 = v25;
        if (!v24)
        {

          v27 = 0;
          v7 = v135;
          goto LABEL_50;
        }
      }
      else
      {
        ISError();
        v28 = objc_claimAutoreleasedReturnValue();

        if (!v28)
        {
          v27 = v22;
          v7 = v135;
          goto LABEL_160;
        }
        v26 = 0;
        v24 = (id)v28;
      }
    }
    else
    {
      v26 = 0;
    }
    objc_msgSend(*(id *)(v6 + 3736), "sharediTunesStoreConfig");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      objc_msgSend(*(id *)(v6 + 3736), "sharedConfig");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v30 = objc_msgSend(v29, "shouldLog");
    if (objc_msgSend(v29, "shouldLogToDisk"))
      v30 |= 2u;
    objc_msgSend(v29, "OSLogObject");
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      v30 &= 2u;
    if (v30)
    {
      v32 = (void *)objc_opt_class();
      v33 = v32;
      -[ISURLOperation _sanitizedDescriptionForObject:](self, "_sanitizedDescriptionForObject:", v24);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v146 = 138412546;
      v147 = v32;
      v148 = 2112;
      v149 = v34;
      LODWORD(v117) = 22;
      v115 = &v146;
      v35 = (void *)_os_log_send_and_compose_impl();

      v6 = 0x24BEB1000uLL;
      if (!v35)
        goto LABEL_49;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v35, 4, &v146, v117);
      v31 = objc_claimAutoreleasedReturnValue();
      free(v35);
      v115 = (int *)v31;
      SSFileLog();
    }

LABEL_49:
    v27 = v24;
    -[ISOperation setError:](self, "setError:", v24);

    v7 = v135;
    if ((v26 & 1) == 0)
      goto LABEL_160;
LABEL_50:
    -[ISStoreURLOperation _runURLOperation](self, "_runURLOperation", v115);
    -[ISOperation error](self, "error");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISURLOperation response](self, "response");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v37 || !-[ISStoreURLOperation machineDataStyle](self, "machineDataStyle"))
    {
      v41 = 0;
      goto LABEL_84;
    }
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1EB8]), "initWithURLResponse:", v37);
    if (v38)
    {
      v140 = v37;
      if (!-[ISStoreURLOperation _performMachineDataRequest:](self, "_performMachineDataRequest:", v38))
        goto LABEL_59;
      objc_msgSend(v38, "actionName");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("RP"));

      if ((v40 & 1) != 0)
      {
        v134 = 0;
        goto LABEL_68;
      }
      v42 = v134++ <= 0;
      if (v42)
      {
LABEL_68:
        objc_msgSend(*(id *)(v6 + 3736), "sharedAccountsAuthenticationConfig");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v43)
        {
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v52 = objc_msgSend(v43, "shouldLog");
        if (objc_msgSend(v43, "shouldLogToDisk"))
          v52 |= 2u;
        objc_msgSend(v43, "OSLogObject");
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          v53 = v52;
        else
          v53 = v52 & 2;
        if (v53)
        {
          v118 = v27;
          v137 = v7;
          v54 = (void *)objc_opt_class();
          v128 = v54;
          -[ISURLOperation requestProperties](self, "requestProperties");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "URL");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          -[ISStoreURLOperation _account](self, "_account");
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v119, "accountName");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          SSHashIfNeeded();
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v146 = 138543874;
          v147 = v54;
          v148 = 2114;
          v149 = v55;
          v150 = 2114;
          v151 = v57;
          LODWORD(v117) = 32;
          v116 = &v146;
          v58 = (void *)_os_log_send_and_compose_impl();

          if (!v58)
          {
            v41 = 1;
            v7 = v137;
            v27 = v118;
            goto LABEL_82;
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v58, 4, &v146, v117);
          v45 = objc_claimAutoreleasedReturnValue();
          free(v58);
          v116 = (int *)v45;
          SSFileLog();
          v41 = 1;
          v7 = v137;
          v27 = v118;
        }
        else
        {
          v41 = 1;
        }
      }
      else
      {
LABEL_59:
        objc_msgSend(*(id *)(v6 + 3736), "sharedAccountsAuthenticationConfig");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v43)
        {
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v44 = objc_msgSend(v43, "shouldLog");
        if (objc_msgSend(v43, "shouldLogToDisk"))
          v44 |= 2u;
        objc_msgSend(v43, "OSLogObject");
        v45 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          v44 &= 2u;
        if (v44)
        {
          v127 = v36;
          v46 = v27;
          v136 = v7;
          v47 = (void *)objc_opt_class();
          v48 = v47;
          -[ISURLOperation requestProperties](self, "requestProperties");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "URL");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v146 = 138543618;
          v147 = v47;
          v148 = 2114;
          v149 = v50;
          LODWORD(v117) = 22;
          v116 = &v146;
          v51 = (void *)_os_log_send_and_compose_impl();

          if (v51)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v51, 4, &v146, v117);
            v45 = objc_claimAutoreleasedReturnValue();
            free(v51);
            v116 = (int *)v45;
            SSFileLog();
            v41 = 0;
            v7 = v136;
            v27 = v46;
            v36 = v127;
            goto LABEL_81;
          }
          v41 = 0;
          v7 = v136;
          v27 = v46;
          v36 = v127;
LABEL_82:

          v6 = 0x24BEB1000uLL;
          v37 = v140;
          goto LABEL_83;
        }
        v41 = 0;
      }
LABEL_81:

      goto LABEL_82;
    }
    v41 = 0;
LABEL_83:

LABEL_84:
    -[ISStoreURLOperation biometricAuthenticationContext](self, "biometricAuthenticationContext", v116);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "challenge");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (v60)
    {
      v61 = -[ISStoreURLOperation _shouldRetryForTouchIDChallengeWithError:](self, "_shouldRetryForTouchIDChallengeWithError:", v36);
      if (((v41 | -[ISStoreURLOperation _shouldRetryForAbsintheWithResponse:](self, "_shouldRetryForAbsintheWithResponse:", v37)) & 1) != 0)goto LABEL_99;
      if (v61)
      {
        -[ISStoreURLOperation _continueTouchIDSession](self, "_continueTouchIDSession");
        if (-[SSBiometricAuthenticationContext didBuyParamsChange](self->_biometricAuthenticationContext, "didBuyParamsChange"))
        {
          -[ISStoreURLOperation biometricSessionDelegate](self, "biometricSessionDelegate");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v62, "sender:didFallbackToPassword:", self, -[SSBiometricAuthenticationContext didFallbackToPassword](self->_biometricAuthenticationContext, "didFallbackToPassword"));
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v62, "sender:shouldContinueTouchIDSession:", self, 1);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v141 = v37;
            -[SSBiometricAuthenticationContext challenge](self->_biometricAuthenticationContext, "challenge");
            v63 = objc_claimAutoreleasedReturnValue();
            -[SSBiometricAuthenticationContext signature](self->_biometricAuthenticationContext, "signature");
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            -[SSBiometricAuthenticationContext paymentTokenData](self->_biometricAuthenticationContext, "paymentTokenData");
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            -[SSBiometricAuthenticationContext fpanID](self->_biometricAuthenticationContext, "fpanID");
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            v120 = -[SSBiometricAuthenticationContext isExtendedAction](self->_biometricAuthenticationContext, "isExtendedAction");
            v64 = -[SSBiometricAuthenticationContext isPayment](self->_biometricAuthenticationContext, "isPayment");
            v65 = objc_alloc_init(MEMORY[0x24BDBCED8]);
            -[SSBiometricAuthenticationContext xAppleAMDHeader](self->_biometricAuthenticationContext, "xAppleAMDHeader");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            if (v66)
              objc_msgSend(v65, "setObject:forKeyedSubscript:", v66, v125);
            -[SSBiometricAuthenticationContext xAppleAMDMHeader](self->_biometricAuthenticationContext, "xAppleAMDMHeader");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            if (v67)
              objc_msgSend(v65, "setObject:forKeyedSubscript:", v67, v124);
            LOBYTE(v114) = v64;
            objc_msgSend(v62, "sender:willSendChallenge:andSignature:andPaymentTokenData:andFpanID:isExtendedAction:isPayment:additionalHeaders:", self, v63, v138, v129, v122, v120, v114, v65);

            v68 = 0;
LABEL_108:
            v37 = v141;
LABEL_114:

            v6 = 0x24BEB1000;
          }
          else
          {
            v68 = 0;
          }
          goto LABEL_134;
        }
LABEL_99:
        objc_msgSend(*(id *)(v6 + 3736), "sharedAccountsAuthenticationConfig");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v62)
        {
          objc_msgSend(*(id *)(v6 + 3736), "sharedConfig");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v69 = objc_msgSend(v62, "shouldLog");
        if (objc_msgSend(v62, "shouldLogToDisk"))
          v69 |= 2u;
        objc_msgSend(v62, "OSLogObject");
        v63 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
          v69 &= 2u;
        if (!v69)
        {
          v68 = 1;
          goto LABEL_114;
        }
        v141 = v37;
        v130 = v36;
        v70 = v27;
        v71 = v7;
        v72 = (void *)objc_opt_class();
        v73 = v72;
        -[ISOperation error](self, "error");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        -[ISURLOperation _sanitizedDescriptionForObject:](self, "_sanitizedDescriptionForObject:", v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v146 = 138543618;
        v147 = v72;
        v148 = 2112;
        v149 = v75;
        LODWORD(v117) = 22;
        v114 = &v146;
        v76 = (void *)_os_log_send_and_compose_impl();

        if (v76)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v76, 4, &v146, v117);
          v63 = objc_claimAutoreleasedReturnValue();
          free(v76);
          v114 = (int *)v63;
          SSFileLog();
          v68 = 1;
          v7 = v71;
          v27 = v70;
          v36 = v130;
          goto LABEL_108;
        }
        v68 = 1;
        v7 = v71;
        v6 = 0x24BEB1000;
        v27 = v70;
        v36 = v130;
        v37 = v141;
LABEL_134:

        goto LABEL_135;
      }
    }
    else if (((v41 | -[ISStoreURLOperation _shouldRetryForAbsintheWithResponse:](self, "_shouldRetryForAbsintheWithResponse:", v37)) & 1) != 0)
    {
      goto LABEL_99;
    }
    if (!-[ISOperation success](self, "success"))
    {
      if (-[ISStoreURLOperation _isErrorTokenError:](self, "_isErrorTokenError:", v36))
      {
        -[ISURLOperation authenticationContext](self, "authenticationContext");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend(v77, "promptStyle");

        if (v78 != 1000)
        {
          v142 = v37;
          -[ISStoreURLOperation _account](self, "_account");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v6 + 3736), "sharedAccountsAuthenticationConfig");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v80)
          {
            objc_msgSend(*(id *)(v6 + 3736), "sharedConfig");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v81 = objc_msgSend(v80, "shouldLog");
          if (objc_msgSend(v80, "shouldLogToDisk"))
            v81 |= 2u;
          objc_msgSend(v80, "OSLogObject");
          v82 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
            v81 &= 2u;
          v132 = v79;
          if (v81)
          {
            v83 = (void *)objc_opt_class();
            v123 = v83;
            -[ISURLOperation requestProperties](self, "requestProperties");
            v139 = v7;
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "URL");
            v131 = v36;
            v85 = v27;
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "accountName");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            SSHashIfNeeded();
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            v146 = 138543874;
            v147 = v83;
            v148 = 2114;
            v149 = v86;
            v150 = 2114;
            v151 = v88;
            LODWORD(v117) = 32;
            v114 = &v146;
            v89 = (void *)_os_log_send_and_compose_impl();

            v79 = v132;
            v7 = v139;

            v27 = v85;
            v36 = v131;

            if (v89)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v89, 4, &v146, v117);
              v82 = objc_claimAutoreleasedReturnValue();
              free(v89);
              v114 = (int *)v82;
              SSFileLog();
              goto LABEL_125;
            }
          }
          else
          {
LABEL_125:

          }
          objc_msgSend(v79, "setAuthenticated:", 0);
          objc_msgSend(v79, "setSecureToken:", 0);
          objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "saveAccount:verifyCredentials:error:", v79, 0, 0);

          -[ISStoreURLOperation setNeedsAuthentication:](self, "setNeedsAuthentication:", 1);
          objc_msgSend(v36, "userInfo");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "objectForKey:", v126);
          v92 = (void *)objc_claimAutoreleasedReturnValue();

          if (v92)
          {
            if ((objc_msgSend(v92, "BOOLValue") & 1) == 0)
            {
              -[ISURLOperation authenticationContext](self, "authenticationContext");
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              v94 = objc_msgSend(v93, "promptStyle");

              if (v94 != 1)
                -[ISStoreURLOperation setIgnorePreexistingSecureToken:](self, "setIgnorePreexistingSecureToken:", 0);
            }
          }
          -[ISURLOperation HTTPArchive](self, "HTTPArchive", v114);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = 0x24BEB1000uLL;
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsAuthenticationConfig");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "writeToDiskWithLogConfig:compressed:error:", v96, 0, 0);

          v68 = 0;
          LOBYTE(v132) = 1;
          v42 = v133++ <= 0;
          v37 = v142;
          if (!v42)
            goto LABEL_135;
          goto LABEL_99;
        }
      }
    }
    v68 = 0;
LABEL_135:

    objc_autoreleasePoolPop(v7);
    if ((v68 & 1) == 0)
      return;
  }
  v106 = v7;
  objc_msgSend(*(id *)(v6 + 3736), "sharediTunesStoreConfig");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v107)
  {
    objc_msgSend(*(id *)(v6 + 3736), "sharedConfig");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v108 = objc_msgSend(v107, "shouldLog");
  if (objc_msgSend(v107, "shouldLogToDisk"))
    v108 |= 2u;
  objc_msgSend(v107, "OSLogObject");
  v109 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
    v108 &= 2u;
  if (v108)
  {
    v110 = (void *)objc_opt_class();
    v146 = 138412290;
    v147 = v110;
    v111 = v110;
    LODWORD(v117) = 12;
    v112 = (void *)_os_log_send_and_compose_impl();

    if (v112)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v112, 4, &v146, v117);
      v109 = objc_claimAutoreleasedReturnValue();
      free(v112);
      SSFileLog();
      goto LABEL_158;
    }
  }
  else
  {
LABEL_158:

  }
  ISError();
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISOperation setError:](self, "setError:", v113);

  v27 = v19;
  v7 = v106;
LABEL_160:

  objc_autoreleasePoolPop(v7);
}

- (BOOL)shouldFollowRedirectWithRequest:(id)a3 returningError:(id *)a4
{
  id v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  id v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (-[ISStoreURLOperation urlKnownToBeTrusted](self, "urlKnownToBeTrusted"))
  {
    v7 = 1;
  }
  else
  {
    -[ISStoreURLOperation URLBagContext](self, "URLBagContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISOperation loadedURLBagWithContext:returningError:](self, "loadedURLBagWithContext:returningError:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "urlIsTrusted:", v10);

    if ((v7 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v12 = objc_msgSend(v11, "shouldLog");
      if (objc_msgSend(v11, "shouldLogToDisk"))
        v13 = v12 | 2;
      else
        v13 = v12;
      objc_msgSend(v11, "OSLogObject");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        v15 = v13;
      else
        v15 = v13 & 2;
      if (v15)
      {
        v24 = v9;
        v16 = v8;
        v17 = (void *)objc_opt_class();
        v23 = v17;
        objc_msgSend(v6, "URL");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[ISURLOperation _sanitizedURLForURL:](self, "_sanitizedURLForURL:", v18);
        v25 = 138412546;
        v26 = v17;
        v8 = v16;
        v9 = v24;
        v27 = 2112;
        v28 = (id)objc_claimAutoreleasedReturnValue();
        LODWORD(v22) = 22;
        v19 = (void *)_os_log_send_and_compose_impl();

        if (v19)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v19, 4, &v25, v22);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          free(v19);
          SSFileLog();

        }
      }
      else
      {

      }
      if (a4)
      {
        ISError();
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

  }
  return v7;
}

- (void)_willSendRequest:(id)a3
{
  id v4;
  void *v5;
  int64_t activeMachineDataStyle;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
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
  _BOOL4 v23;
  void *v24;
  int v25;
  int v26;
  int v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  unsigned int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[4];
  id v53;
  int v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ISURLOperation _requestProperties](self, "_requestProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  activeMachineDataStyle = self->_activeMachineDataStyle;
  if (activeMachineDataStyle == 3)
  {
    SSVAnisetteAddHeadersToURLRequest();
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  if (activeMachineDataStyle != 2)
  {
    if (activeMachineDataStyle == 1)
    {
      -[ISStoreURLOperation _account](self, "_account");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "uniqueIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "unsignedLongLongValue");
        SSVAnisetteAddHeadersToURLRequest();

      }
    }
    goto LABEL_8;
  }
  -[ISStoreURLOperation _loadURLBagInterpreterWithRequest:requestProperties:](self, "_loadURLBagInterpreterWithRequest:requestProperties:", v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v10, "shouldSendAnonymousMachineIdentifierForURL:", v24);

  if (v25)
    SSVAnisetteAddHeadersToURLRequest();
LABEL_9:
  -[ISStoreURLOperation _absintheHeaders](self, "_absintheHeaders");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3221225472;
  v52[2] = __40__ISStoreURLOperation__willSendRequest___block_invoke;
  v52[3] = &unk_24C43C4E8;
  v12 = v4;
  v53 = v12;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v52);
  -[ISStoreURLOperation SAPSession](self, "SAPSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (!v10)
    {
      -[ISStoreURLOperation _loadURLBagInterpreterWithRequest:requestProperties:](self, "_loadURLBagInterpreterWithRequest:requestProperties:", v12, v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "URL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mescalSignaturePolicyForRequestURL:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 && objc_msgSend(v15, "policyType"))
    {
      objc_msgSend(v15, "dataToSignWithURLRequest:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISStoreURLOperation SAPSession](self, "SAPSession");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "signatureWithData:error:", v16, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(v18, "base64EncodedStringWithOptions:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setValue:forHTTPHeaderField:", v19, *MEMORY[0x24BEB2540]);

      }
    }

  }
  if (-[ISStoreURLOperation shouldSendAKClientInfoHeaders](self, "shouldSendAKClientInfoHeaders"))
    objc_msgSend(v12, "ak_addClientInfoHeader");
  if (-[ISStoreURLOperation shouldSendAKPRKRequestHeader](self, "shouldSendAKPRKRequestHeader"))
    objc_msgSend(v12, "ak_addPRKRequestHeader");
  if ((SSIsDaemon() & 1) == 0 && !ISBiometricsHasEntitlement(CFSTR("adi-client")))
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v26 = objc_msgSend(v20, "shouldLog");
    if (objc_msgSend(v20, "shouldLogToDisk"))
      v27 = v26 | 2;
    else
      v27 = v26;
    objc_msgSend(v20, "OSLogObject");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      v27 &= 2u;
    if (v27)
    {
      v29 = (void *)objc_opt_class();
      v54 = 138412290;
      v55 = v29;
      v30 = v29;
      LODWORD(v41) = 12;
      v31 = (void *)_os_log_send_and_compose_impl();

      if (!v31)
        goto LABEL_49;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v31, 4, &v54, v41);
      v28 = objc_claimAutoreleasedReturnValue();
      free(v31);
      SSFileLog();
    }

    goto LABEL_49;
  }
  -[ISStoreURLOperation biometricAuthenticationContext](self, "biometricAuthenticationContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISURLOperation _accountIdentifier](self, "_accountIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_msgSend(v20, "signature");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22 != 0;

    ISBiometricsAddHeadersForTouchIDRequestToURLRequest(v12, v21, v23, objc_msgSend(v20, "isExtendedAction"), 0);
    if (objc_msgSend(v20, "shouldSendFallbackHeader"))
    {
      objc_msgSend(v12, "setValue:forHTTPHeaderField:", CFSTR("FB"), *MEMORY[0x24BEB25A0]);
    }
    else
    {
      objc_msgSend(v20, "signature");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        v44 = v13;
        v48 = v5;
        objc_msgSend(v20, "challenge");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "signature");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "paymentTokenData");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "fpanID");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v20, "isExtendedAction");
        v42 = objc_msgSend(v20, "isPayment");
        -[ISStoreURLOperation biometricSessionDelegate](self, "biometricSessionDelegate");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        objc_msgSend(v12, "allHTTPHeaderFields");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = *MEMORY[0x24BEB2528];
        objc_msgSend(v34, "objectForKeyedSubscript:", *MEMORY[0x24BEB2528]);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          objc_msgSend(v20, "setXAppleAMDHeader:", v36);
          objc_msgSend(v33, "setObject:forKeyedSubscript:", v36, v35);
        }
        v51 = v33;
        objc_msgSend(v12, "allHTTPHeaderFields");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = *MEMORY[0x24BEB2530];
        objc_msgSend(v37, "objectForKeyedSubscript:", *MEMORY[0x24BEB2530]);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
        {
          objc_msgSend(v20, "setXAppleAMDMHeader:", v39);
          objc_msgSend(v51, "setObject:forKeyedSubscript:", v39, v38);
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          LOBYTE(v40) = v42;
          objc_msgSend(v45, "sender:willSendChallenge:andSignature:andPaymentTokenData:andFpanID:isExtendedAction:isPayment:additionalHeaders:", self, v47, v46, v50, v49, v43, v40, v51);
        }
        ISBiometricsAddHeadersForTouchIDSignatureToURLRequest(v12, (uint64_t)v47, v46);
        objc_msgSend(v20, "setChallenge:", 0);
        objc_msgSend(v20, "setSignature:", 0);

        v5 = v48;
        v13 = v44;
      }
    }
  }

LABEL_49:
}

uint64_t __40__ISStoreURLOperation__willSendRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", a3, a2);
}

- (void)sender:(id)a3 didFallbackToPassword:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[ISStoreURLOperation biometricSessionDelegate](self, "biometricSessionDelegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sender:didFallbackToPassword:", self, v4);

}

- (id)_ssBag_copyGUIDSchemesFromBag:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "dictionaryForKey:error:", CFSTR("guid-urls"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("schemes"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = objc_alloc_init(MEMORY[0x24BDBCE30]);
    v6 = v5;

    if (!v6)
      goto LABEL_8;
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", CFSTR("https"), 0);
    if (!v6)
    {
LABEL_8:
      v7 = 0;
      goto LABEL_9;
    }
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v6);
LABEL_9:

  return v7;
}

- (id)_ssBag_copyGUIDPatternsFromBag:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v20 = 0;
  objc_msgSend(v3, "dictionaryForKey:error:", CFSTR("guid-urls"), &v20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v20;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || v6)
  {
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", CFSTR("/WebObjects/MZ(Buy|Finance|FastFinance)[.]woa/"), 1, 0);
    if (v7)
      objc_msgSend(v4, "addObject:", v7);
  }
  else
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("regex"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v7 = v7;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v17;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v17 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
            v13 = objc_alloc(MEMORY[0x24BDD1798]);
            v14 = (void *)objc_msgSend(v13, "initWithPattern:options:error:", v12, 1, 0, (_QWORD)v16);
            if (v14)
              objc_msgSend(v4, "addObject:", v14);

            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        }
        while (v9);
      }

    }
  }

  return v4;
}

- (BOOL)_ssBag_shouldSendGUIDForURL:(id)a3 withBag:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if ((SSDebugAlwaysSendGUID() & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    -[ISStoreURLOperation _ssBag_copyGUIDPatternsFromBag:](self, "_ssBag_copyGUIDPatternsFromBag:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISStoreURLOperation _ssBag_copyGUIDSchemesFromBag:](self, "_ssBag_copyGUIDSchemesFromBag:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scheme");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "containsObject:", v11);

    if (v12)
    {
      if (objc_msgSend(v9, "count"))
      {
        objc_msgSend(v6, "absoluteString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "length");
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v15 = v9;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v16)
        {
          v17 = v16;
          v21 = v9;
          v18 = *(_QWORD *)v23;
          while (2)
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v23 != v18)
                objc_enumerationMutation(v15);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "rangeOfFirstMatchInString:options:range:", v13, 0, 0, v14) != 0x7FFFFFFFFFFFFFFFLL)
              {
                v8 = 1;
                goto LABEL_16;
              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
            if (v17)
              continue;
            break;
          }
          v8 = 0;
LABEL_16:
          v9 = v21;
        }
        else
        {
          v8 = 0;
        }

      }
      else
      {
        v8 = 1;
      }
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

+ (id)_ssBag_copyHeaderPatternsFromBag:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "arrayForKey:error:", CFSTR("send-content-restrictions-header"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
          v13 = objc_alloc(MEMORY[0x24BDD1798]);
          v14 = (void *)objc_msgSend(v13, "initWithPattern:options:error:", v12, 1, 0, (_QWORD)v16);
          if (v14)
            objc_msgSend(v6, "addObject:", v14);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    if (objc_msgSend(v6, "count"))
      objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("X-Apple-Restrictions"));

  }
  if (!objc_msgSend(v4, "count"))
  {

    v4 = 0;
  }

  return v4;
}

+ (id)_ssBag_copyExtraHeadersForURL:(id)a3 bag:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(a1, "_ssBag_copyHeaderPatternsFromBag:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v20 = v6;
    objc_msgSend(v6, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");
    v21 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v10 = v7;
    v23 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v23)
    {
      v22 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v29 != v22)
            objc_enumerationMutation(v10);
          v12 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v10, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v14 = v13;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v25;
            while (2)
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v25 != v17)
                  objc_enumerationMutation(v14);
                if (objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "rangeOfFirstMatchInString:options:range:", v8, 0, 0, v9) != 0x7FFFFFFFFFFFFFFFLL)
                {
                  objc_msgSend(v21, "addObject:", v12);
                  goto LABEL_17;
                }
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
              if (v16)
                continue;
              break;
            }
          }
LABEL_17:

        }
        v23 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v23);
    }

    v6 = v20;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (void)_addiTunesStoreHeadersToRequest:(id)a3 withSSBag:(id)a4 accountIdentifier:(id)a5 appendAuthKitHeaders:(BOOL)a6 appendStorefrontToURL:(BOOL)a7 clientBundleIdentifier:(id)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;

  v9 = a7;
  v10 = a6;
  v23 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a8;
  if (!v15)
  {
LABEL_5:
    v18 = 0;
    v19 = v23;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "accountWithUniqueIdentifier:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v23;
  if (!v18)
  {
    v20 = *MEMORY[0x24BEB2550];
    objc_msgSend(v23, "valueForHTTPHeaderField:", *MEMORY[0x24BEB2550]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      objc_msgSend(v15, "stringValue");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setValue:forHTTPHeaderField:", v22, v20);

    }
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(a1, "_addiTunesStoreHeadersToRequest:withSSBag:account:appendAuthKitHeaders:appendStorefrontToURL:clientBundleIdentifier:", v19, v14, v18, v10, v9, v16);

}

+ (void)_addiTunesStoreHeadersToRequest:(id)a3 withSSBag:(id)a4 account:(id)a5 appendAuthKitHeaders:(BOOL)a6 appendStorefrontToURL:(BOOL)a7 clientBundleIdentifier:(id)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;

  v8 = a7;
  v9 = a6;
  v14 = a8;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  objc_msgSend(v17, "URL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_ssBag_copyExtraHeadersForURL:bag:", v18, v16);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "stringForKey:error:", CFSTR("storefront-header-suffix"), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_addiTunesStoreHeadersToRequest:withAccount:appendAuthKitHeaders:appendStorefrontToURL:clientBundleIdentifier:extraHeaders:storefrontSuffix:", v17, v15, v9, v8, v14, v20, v19);
}

+ (void)_addiTunesStoreHeadersToRequest:(id)a3 withURLBag:(id)a4 accountIdentifier:(id)a5 appendAuthKitHeaders:(BOOL)a6 appendStorefrontToURL:(BOOL)a7 clientBundleIdentifier:(id)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;

  v9 = a7;
  v10 = a6;
  v23 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a8;
  if (!v15)
  {
LABEL_5:
    v18 = 0;
    v19 = v23;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "accountWithUniqueIdentifier:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v23;
  if (!v18)
  {
    v20 = *MEMORY[0x24BEB2550];
    objc_msgSend(v23, "valueForHTTPHeaderField:", *MEMORY[0x24BEB2550]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      objc_msgSend(v15, "stringValue");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setValue:forHTTPHeaderField:", v22, v20);

    }
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(a1, "_addiTunesStoreHeadersToRequest:withURLBag:account:appendAuthKitHeaders:appendStorefrontToURL:clientBundleIdentifier:", v19, v14, v18, v10, v9, v16);

}

- (void)_setStoreFrontIdentifier:(id)a3 isTransient:(BOOL)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BEB1DE8];
  v6 = a3;
  objc_msgSend(v5, "currentDevice");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ISStoreURLOperation _account](self, "_account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setStoreFrontIdentifier:account:", v6, v7);

}

- (id)_absintheHeaders
{
  void *v3;
  id v4;
  void *v5;
  ISAMSBagShim *v6;
  void *v7;
  ISAMSBagShim *v8;
  void *v9;
  ISAMSBagShim *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  int v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v26;
  id v27;
  int v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  -[ISStoreURLOperation logKey](self, "logKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)AMSSetLogKey();

  -[ISStoreURLOperation bag](self, "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = [ISAMSBagShim alloc];
    -[ISStoreURLOperation bag](self, "bag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[ISAMSBagShim initWithBag:](v6, "initWithBag:", v7);
  }
  else
  {
    -[ISStoreURLOperation URLBagContext](self, "URLBagContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISStoreURLOperation _urlBagForContext:](self, "_urlBagForContext:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[ISAMSBagShim initWithURLBag:]([ISAMSBagShim alloc], "initWithURLBag:", v7);
  }
  v10 = v8;

  -[ISStoreURLOperation _buyParams](self, "_buyParams");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08098]), "initWithString:", v11);
  else
    v12 = 0;
  v13 = (void *)MEMORY[0x24BE07FF0];
  -[ISURLOperation activeURLRequest](self, "activeURLRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "headersForRequest:buyParams:bag:", v14, v12, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v15, "resultWithError:", &v27);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v27;

  if (v17)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v19 = objc_msgSend(v18, "shouldLog");
    if (objc_msgSend(v18, "shouldLogToDisk"))
      v20 = v19 | 2;
    else
      v20 = v19;
    objc_msgSend(v18, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      v20 &= 2u;
    if (v20)
    {
      v22 = objc_opt_class();
      AMSLogKey();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543874;
      v29 = v22;
      v30 = 2114;
      v31 = v23;
      v32 = 2114;
      v33 = v17;
      LODWORD(v26) = 32;
      v24 = (void *)_os_log_send_and_compose_impl();

      if (!v24)
      {
LABEL_19:

        goto LABEL_20;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v24, 4, &v28, v26);
      v21 = objc_claimAutoreleasedReturnValue();
      free(v24);
      SSFileLog();
    }

    goto LABEL_19;
  }
LABEL_20:

  return v16;
}

+ (void)_addAccountDSID:(id)a3 toRequest:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = a4;
  v6 = *MEMORY[0x24BEB2550];
  objc_msgSend(v5, "valueForHTTPHeaderField:", *MEMORY[0x24BEB2550]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v11, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && objc_msgSend(v8, "unsignedLongLongValue"))
    {
      objc_msgSend(v9, "stringValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forHTTPHeaderField:", v10, v6);

    }
  }

}

+ (void)_addiTunesStoreHeadersToRequest:(id)a3 withAccount:(id)a4 appendAuthKitHeaders:(BOOL)a5 appendStorefrontToURL:(BOOL)a6 clientBundleIdentifier:(id)a7 extraHeaders:(id)a8 storefrontSuffix:(id)a9
{
  _BOOL4 v11;
  id v14;
  id v15;
  void *v16;
  unint64_t v17;
  void *v18;
  int v19;
  int v20;
  NSObject *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  int v33;
  NSObject *v34;
  int v35;
  void *v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  int v47;
  NSObject *v48;
  int v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t i;
  uint64_t v72;
  void *v73;
  void *v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t j;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t k;
  uint64_t v89;
  void *v90;
  void *v91;
  int *v92;
  uint64_t v93;
  id v94;
  void *v95;
  id v96;
  _BOOL4 v97;
  _BOOL4 v98;
  id v99;
  void *v100;
  id v101;
  id v102;
  void *v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  int v119;
  void *v120;
  __int16 v121;
  void *v122;
  __int16 v123;
  void *v124;
  __int16 v125;
  void *v126;
  uint64_t v127;

  v11 = a6;
  v97 = a5;
  v127 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v101 = a7;
  v96 = a8;
  v102 = a9;
  objc_msgSend(a1, "_addAccountDSID:toRequest:", v15, v14);
  objc_msgSend(a1, "_addPrimaryiCloudDSIDToRequest:", v14);
  v103 = v15;
  +[ISStoreURLOperation _storeFrontIdentifierForAccount:](ISStoreURLOperation, "_storeFrontIdentifierForAccount:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0x24BEB1000uLL;
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsStorefrontConfig");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = objc_msgSend(v18, "shouldLog");
  if (objc_msgSend(v18, "shouldLogToDisk"))
    v20 = v19 | 2;
  else
    v20 = v19;
  objc_msgSend(v18, "OSLogObject");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    v22 = v20;
  else
    v22 = v20 & 2;
  if (v22)
  {
    v23 = (void *)objc_opt_class();
    v94 = v23;
    objc_msgSend(v14, "URL");
    v98 = v11;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    SSHashIfNeeded();
    v25 = v16;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "hashedDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = 138544130;
    v120 = v23;
    v121 = 2114;
    v122 = v24;
    v123 = 2114;
    v124 = v26;
    v125 = 2114;
    v126 = v27;
    LODWORD(v93) = 42;
    v92 = &v119;
    v28 = (void *)_os_log_send_and_compose_impl();

    v16 = v25;
    v17 = 0x24BEB1000;

    v11 = v98;
    if (v28)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v28, 4, &v119, v93);
      v29 = (int *)objc_claimAutoreleasedReturnValue();
      free(v28);
      v92 = v29;
      SSFileLog();

    }
  }
  else
  {

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = *MEMORY[0x24BEB2598];
    objc_msgSend(v14, "valueForHTTPHeaderField:", *MEMORY[0x24BEB2598]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v31)
    {
      if (objc_msgSend(v102, "length"))
      {
        v41 = v102;
      }
      else
      {
        v42 = v101;
        if (!v101)
        {
          objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "bundleIdentifier");
          v44 = objc_claimAutoreleasedReturnValue();

          v42 = (id)v44;
        }
        v101 = v42;
        +[ISLoadURLBagOperation storeFrontHeaderSuffixForBundleIdentifier:](ISLoadURLBagOperation, "storeFrontHeaderSuffixForBundleIdentifier:", v92);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v102 = v41;
      if (objc_msgSend(v41, "length", v92))
      {
        objc_msgSend(v16, "stringByAppendingString:", v41);
        v45 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v45;
      }
      v40 = v16;
      v16 = (void *)objc_msgSend(v16, "copy");
      objc_msgSend(v14, "setValue:forHTTPHeaderField:", v16, v30);
      goto LABEL_35;
    }
    objc_msgSend(*(id *)(v17 + 3736), "sharedAccountsStorefrontConfig");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v32)
    {
      objc_msgSend(*(id *)(v17 + 3736), "sharedConfig");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v33 = objc_msgSend(v32, "shouldLog", v92);
    if (objc_msgSend(v32, "shouldLogToDisk"))
      v33 |= 2u;
    objc_msgSend(v32, "OSLogObject");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      v35 = v33;
    else
      v35 = v33 & 2;
    if (v35)
    {
      v36 = (void *)objc_opt_class();
      v99 = v36;
      SSHashIfNeeded();
      v37 = v11;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = 138543618;
      v120 = v36;
      v121 = 2114;
      v122 = v38;
      LODWORD(v93) = 22;
      v92 = &v119;
      v39 = (void *)_os_log_send_and_compose_impl();

      v11 = v37;
      if (!v39)
      {
LABEL_26:

        v40 = v31;
        v17 = 0x24BEB1000;
LABEL_35:

        v16 = v40;
        goto LABEL_36;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v39, 4, &v119, v93);
      v34 = objc_claimAutoreleasedReturnValue();
      free(v39);
      v92 = (int *)v34;
      SSFileLog();
    }

    goto LABEL_26;
  }
LABEL_36:
  if (!v11)
    goto LABEL_49;
  objc_msgSend(*(id *)(v17 + 3736), "sharedAccountsStorefrontConfig");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v46)
  {
    objc_msgSend(*(id *)(v17 + 3736), "sharedConfig");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v47 = objc_msgSend(v46, "shouldLog", v92);
  if (objc_msgSend(v46, "shouldLogToDisk"))
    v47 |= 2u;
  objc_msgSend(v46, "OSLogObject");
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
    v49 = v47;
  else
    v49 = v47 & 2;
  if (!v49)
    goto LABEL_47;
  v50 = (void *)objc_opt_class();
  v119 = 138543362;
  v120 = v50;
  v51 = v50;
  LODWORD(v93) = 12;
  v92 = &v119;
  v52 = (void *)_os_log_send_and_compose_impl();

  if (v52)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v52, 4, &v119, v93);
    v48 = objc_claimAutoreleasedReturnValue();
    free(v52);
    v92 = (int *)v48;
    SSFileLog();
LABEL_47:

  }
  objc_msgSend(a1, "_appendStorefront:toRequestURL:", v16, v14);
LABEL_49:
  +[ISClient currentClient](ISClient, "currentClient", v92);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "partnerHeader");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v55 = (void *)objc_msgSend(v54, "copy");
    objc_msgSend(v14, "setValue:forHTTPHeaderField:", v55, CFSTR("X-Apple-Partner"));

  }
  +[ISNetworkObserver sharedInstance](ISNetworkObserver, "sharedInstance");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "connectionTypeHeader");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v57, "length"))
  {
    v58 = (void *)objc_msgSend(v57, "copy");
    objc_msgSend(v14, "setValue:forHTTPHeaderField:", v58, CFSTR("X-Apple-Connection-Type"));

  }
  if ((SSIsAppStoreDaemon() & 1) != 0)
  {
    v59 = v57;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "softwareLibraryIdentifier");
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v61 = (void *)objc_msgSend(v59, "copy");
      objc_msgSend(v14, "setValue:forHTTPHeaderField:", v61, *MEMORY[0x24BEB2590]);

    }
  }
  objc_msgSend(v53, "appleClientApplication");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    v63 = (void *)objc_msgSend(v62, "copy");
    objc_msgSend(v14, "setValue:forHTTPHeaderField:", v63, *MEMORY[0x24BEB2548]);

  }
  objc_msgSend(v53, "appleClientVersions");
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v64, "length"))
  {
    v65 = (void *)objc_msgSend(v64, "copy");
    objc_msgSend(v14, "setValue:forHTTPHeaderField:", v65, CFSTR("X-Apple-Client-Versions"));

  }
  v100 = v16;
  v95 = v53;
  objc_msgSend(v53, "clientProvidedHeaders");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v114 = 0u;
    v115 = 0u;
    v112 = 0u;
    v113 = 0u;
    objc_msgSend(v66, "allKeys");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v112, v118, 16);
    if (v68)
    {
      v69 = v68;
      v70 = *(_QWORD *)v113;
      do
      {
        for (i = 0; i != v69; ++i)
        {
          if (*(_QWORD *)v113 != v70)
            objc_enumerationMutation(v67);
          v72 = *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * i);
          objc_msgSend(v66, "objectForKeyedSubscript:", v72);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = (void *)objc_msgSend(v73, "copy");
          objc_msgSend(v14, "setValue:forHTTPHeaderField:", v74, v72);

        }
        v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v112, v118, 16);
      }
      while (v69);
    }

  }
  v110 = 0u;
  v111 = 0u;
  v108 = 0u;
  v109 = 0u;
  v75 = v96;
  v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v108, v117, 16);
  if (v76)
  {
    v77 = v76;
    v78 = *(_QWORD *)v109;
    do
    {
      for (j = 0; j != v77; ++j)
      {
        if (*(_QWORD *)v109 != v78)
          objc_enumerationMutation(v75);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v108 + 1) + 8 * j), "isEqualToString:", CFSTR("X-Apple-Restrictions")))
        {
          objc_msgSend(a1, "_restrictionsHeaderValue");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v80, "length"))
          {
            v81 = (void *)objc_msgSend(v80, "copy");
            objc_msgSend(v14, "setValue:forHTTPHeaderField:", v81, CFSTR("X-Apple-Restrictions"));

          }
        }
      }
      v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v108, v117, 16);
    }
    while (v77);
  }

  if (v97)
  {
    +[ISStoreURLOperation _authKitSession](ISStoreURLOperation, "_authKitSession");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "appleIDHeadersForRequest:", v14);
    v83 = (void *)objc_claimAutoreleasedReturnValue();

    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    v84 = v83;
    v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v104, v116, 16);
    if (v85)
    {
      v86 = v85;
      v87 = *(_QWORD *)v105;
      do
      {
        for (k = 0; k != v86; ++k)
        {
          if (*(_QWORD *)v105 != v87)
            objc_enumerationMutation(v84);
          v89 = *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * k);
          objc_msgSend(v84, "objectForKeyedSubscript:", v89);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = (void *)objc_msgSend(v90, "copy");
          objc_msgSend(v14, "setValue:forHTTPHeaderField:", v91, v89);

        }
        v86 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v104, v116, 16);
      }
      while (v86);
    }

  }
}

+ (void)_addiTunesStoreHeadersToRequest:(id)a3 withURLBag:(id)a4 account:(id)a5 appendAuthKitHeaders:(BOOL)a6 appendStorefrontToURL:(BOOL)a7 clientBundleIdentifier:(id)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;

  v8 = a7;
  v9 = a6;
  v14 = a8;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  objc_msgSend(v17, "URL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v16, "copyExtraHeadersForURL:", v18);

  objc_msgSend(v16, "valueForKey:", CFSTR("storefront-header-suffix"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_addiTunesStoreHeadersToRequest:withAccount:appendAuthKitHeaders:appendStorefrontToURL:clientBundleIdentifier:extraHeaders:storefrontSuffix:", v17, v15, v9, v8, v14, v20, v19);
}

+ (void)_addPrimaryiCloudDSIDToRequest:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x24BEB2018], "sharedAccountStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryAppleAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "aa_personID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v7, "setValue:forHTTPHeaderField:", v6, *MEMORY[0x24BEB2510]);

  }
}

+ (void)_appendStorefront:(id)a3 toRequestURL:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v5 = a4;
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "_ss_hasQueryParameter:", CFSTR("storefront")))
  {
    objc_msgSend(v6, "_ss_URLByRemovingQueryParameter:", CFSTR("storefront"));
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(v6, "URLByAppendingQueryParameter:value:", CFSTR("storefront"), v9);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  objc_msgSend(v5, "setURL:", v6);

}

- (void)_applyAnalyticsCookiesToRequest:(id)a3 withBag:(id)a4 oldBag:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  int v22;
  NSObject *v23;
  int v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  int v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  uint64_t v58;
  id v59;
  id v60;
  id v61;
  id v62;
  uint64_t v63;
  id v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  id v74;
  id v75;
  _BYTE v76[128];
  int v77;
  void *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  id v82;
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v9)
  {
    v12 = *MEMORY[0x24BEB2990];
    v75 = 0;
    objc_msgSend(v9, "dictionaryForKey:error:", v12, &v75);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = v75;
    v74 = v14;
    objc_msgSend(v9, "arrayForKey:error:", CFSTR("clientIDDomains"), &v74);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = v74;

  }
  else
  {
    if (v10)
    {
      objc_msgSend(v10, "valueForKey:", *MEMORY[0x24BEB2990]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v17;
      else
        v13 = 0;

      objc_msgSend(v11, "valueForKey:", CFSTR("clientIDDomains"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v18;
      else
        v15 = 0;

    }
    else
    {
      v13 = 0;
      v15 = 0;
    }
    v16 = 0;
  }
  objc_msgSend(v13, "objectForKey:", CFSTR("metricsUrl"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = v19;
  else
    v20 = 0;

  v69 = v20;
  if (v20)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v20);
    v63 = objc_claimAutoreleasedReturnValue();
    if (v63)
    {
      v64 = v15;
      if (!v16 && objc_msgSend(v15, "count"))
      {
        v61 = v13;
        v68 = v11;
        v59 = v9;
        -[ISURLOperation _requestProperties](self, "_requestProperties");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "URLBagType");
        v41 = SSAccountScopeForURLBagType();

        objc_msgSend(MEMORY[0x24BEB2020], "sharedStorage");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[ISURLOperation _accountIdentifier](self, "_accountIdentifier");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "cookieHeadersForURL:userIdentifier:scope:", v63, v43, v41);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        v72 = 0u;
        v73 = 0u;
        v70 = 0u;
        v71 = 0u;
        v21 = v44;
        v45 = -[NSObject countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
        if (v45)
        {
          v46 = v45;
          v47 = *(_QWORD *)v71;
          do
          {
            for (i = 0; i != v46; ++i)
            {
              if (*(_QWORD *)v71 != v47)
                objc_enumerationMutation(v21);
              v49 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
              objc_msgSend(v49, "lowercaseString");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = objc_msgSend(v50, "isEqualToString:", CFSTR("cookie"));

              if (v51)
              {
                objc_msgSend(v8, "valueForHTTPHeaderField:", v49);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v53 = (void *)objc_msgSend(v52, "mutableCopy");
                v54 = v53;
                if (v53)
                  v55 = v53;
                else
                  v55 = objc_alloc_init(MEMORY[0x24BDD16A8]);
                v56 = v55;

                if (objc_msgSend(v56, "length"))
                  objc_msgSend(v56, "appendString:", CFSTR("; "));
                -[NSObject objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", v49);
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "appendString:", v57);

                objc_msgSend(v8, "setValue:forHTTPHeaderField:", v56, v49);
              }
            }
            v46 = -[NSObject countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
          }
          while (v46);
        }

        v9 = v59;
        v13 = v61;
        v15 = v64;
        v11 = v68;
        goto LABEL_59;
      }
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v21 = objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v21 = objc_claimAutoreleasedReturnValue();
      }
      v22 = -[NSObject shouldLog](v21, "shouldLog");
      if (-[NSObject shouldLogToDisk](v21, "shouldLogToDisk"))
        v22 |= 2u;
      -[NSObject OSLogObject](v21, "OSLogObject");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        v24 = v22;
      else
        v24 = v22 & 2;
      if (v24)
      {
        v60 = v13;
        v66 = v11;
        v25 = (void *)objc_opt_class();
        v26 = v25;
        -[ISStoreURLOperation logKey](self, "logKey");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = 138543874;
        v78 = v25;
        v79 = 2114;
        v80 = v27;
        v81 = 2114;
        v82 = v16;
        LODWORD(v58) = 32;
        v28 = (void *)_os_log_send_and_compose_impl();

        if (!v28)
        {
          v15 = v64;
          v11 = v66;
          v13 = v60;
          goto LABEL_59;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v28, 4, &v77, v58);
        v23 = objc_claimAutoreleasedReturnValue();
        free(v28);
        SSFileLog();
        v11 = v66;
        v13 = v60;
      }
      v15 = v64;

LABEL_59:
      v39 = v69;
      v38 = (void *)v63;
      goto LABEL_60;
    }
  }
  v67 = v11;
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v29)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30 = objc_msgSend(v29, "shouldLog");
  if (objc_msgSend(v29, "shouldLogToDisk"))
    v30 |= 2u;
  v31 = v29;
  objc_msgSend(v29, "OSLogObject");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    v32 = v30;
  else
    v32 = v30 & 2;
  if (!v32)
  {
    v38 = v31;
    v11 = v67;
    v39 = v69;
    goto LABEL_60;
  }
  v62 = v16;
  v65 = v15;
  v33 = v13;
  v34 = (void *)objc_opt_class();
  v35 = v34;
  -[ISStoreURLOperation logKey](self, "logKey");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = 138543618;
  v78 = v34;
  v79 = 2114;
  v80 = v36;
  LODWORD(v58) = 22;
  v37 = (void *)_os_log_send_and_compose_impl();

  if (v37)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v37, 4, &v77, v58);
    v21 = objc_claimAutoreleasedReturnValue();
    free(v37);
    v38 = v31;
    SSFileLog();
    v13 = v33;
    v15 = v65;
    v11 = v67;
    v16 = v62;
    v39 = v69;
LABEL_60:

    goto LABEL_61;
  }
  v13 = v33;
  v16 = v62;
  v39 = v69;
  v38 = v31;
  v15 = v65;
  v11 = v67;
LABEL_61:

}

+ (id)_restrictionsHeaderValue
{
  id v2;
  int AppBooleanValue;
  _BOOL4 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  const __CFString *v17;
  void *v18;
  int v19;
  int v20;
  void *v21;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  CFPreferencesAppSynchronize(CFSTR("com.apple.springboard"));
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("SBParentalControlsEnabled"), CFSTR("com.apple.springboard"), 0);
  v4 = AppBooleanValue != 0;
  SSRestrictionsCopyRankForMediaType();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (AppBooleanValue)
    {
      v4 = 1;
    }
    else
    {
      v7 = objc_msgSend(v5, "integerValue");
      v4 = v7 != *MEMORY[0x24BEB2A30];
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("apps=%ld"), objc_msgSend(v6, "longValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v8);

  }
  SSRestrictionsCopyRankForMediaType();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (v4)
    {
      v4 = 1;
    }
    else
    {
      v10 = objc_msgSend(v9, "integerValue");
      v4 = v10 != *MEMORY[0x24BEB2A30];
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("movies=%ld"), objc_msgSend(v9, "longValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v11);

  }
  SSRestrictionsCopyRankForMediaType();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (v4)
    {
      v4 = 1;
    }
    else
    {
      v13 = objc_msgSend(v12, "integerValue");
      v4 = v13 != *MEMORY[0x24BEB2A30];
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("tv=%ld"), objc_msgSend(v12, "longValue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v14);

  }
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "effectiveRestrictedBoolValueForSetting:", *MEMORY[0x24BE63918]);

  if (v16 == 2)
    v17 = CFSTR("explicit=off");
  else
    v17 = CFSTR("explicit=on");
  objc_msgSend(v2, "addObject:", v17);
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "effectiveRestrictedBoolValueForSetting:", *MEMORY[0x24BE63988]);

  if (v19 == 2)
  {
    objc_msgSend(v2, "addObject:", CFSTR("in-app=off"));
  }
  else
  {
    v20 = v16 == 2 || v4;
    objc_msgSend(v2, "addObject:", CFSTR("in-app=on"));
    if (v20 != 1)
    {
      v21 = 0;
      goto LABEL_27;
    }
  }
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR(";"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:

  return v21;
}

- (id)_account
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISURLOperation _accountIdentifier](self, "_accountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISURLOperation _requestProperties](self, "_requestProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLBagType");
  v6 = SSAccountScopeForURLBagType();

  if (v6 != 1)
  {
    if (v4
      || (objc_msgSend(v3, "activeAccount"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v9, "uniqueIdentifier"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v9,
          v4))
    {
      objc_msgSend(v3, "accountWithUniqueIdentifier:", v4);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_10:
    v10 = 0;
    goto LABEL_9;
  }
  if (!v4)
  {
    objc_msgSend(v3, "activeSandboxAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      goto LABEL_10;
  }
  objc_msgSend(v3, "accountWithUniqueIdentifier:scope:", v4, 1);
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v10 = (void *)v8;
LABEL_9:

  return v10;
}

- (void)_addStandardQueryParametersForURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[ISURLOperation _requestProperties](self, "_requestProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (SSDebugShouldSendCacheBuster())
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("buster"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "UUIDString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v11, "setObject:forKey:", v9, CFSTR("buster"));

      }
    }
  }
  if (objc_msgSend(v11, "count"))
  {
    v10 = (id)objc_msgSend(v5, "mutableCopy");
    if (!v10)
      v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v10, "addEntriesFromDictionary:", v11);
    objc_msgSend(v4, "setRequestParameters:", v10);

  }
}

+ (id)_authKitSession
{
  if (_authKitSession_sOnce != -1)
    dispatch_once(&_authKitSession_sOnce, &__block_literal_global_7);
  return (id)_authKitSession__authKitSession;
}

void __38__ISStoreURLOperation__authKitSession__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BE0ACD8]);
  v1 = (void *)_authKitSession__authKitSession;
  _authKitSession__authKitSession = (uint64_t)v0;

}

- (BOOL)_authenticateWithContext:(id)a3 error:(id *)a4
{
  void *v4;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  dispatch_semaphore_t v15;
  NSObject *v16;
  void *v17;
  int v18;
  int v19;
  NSObject *v20;
  void *v21;
  int v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id *v30;
  _BOOL4 v31;
  id v32;
  int v33;
  BOOL v34;
  int *v36;
  uint64_t v37;
  id v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  ISStoreURLOperation *v43;
  uint64_t *v44;
  id v45;
  id obj;
  _QWORD v47[5];
  NSObject *v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  char v65;
  int v66;
  id v67;
  __int16 v68;
  id v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v39 = a3;
  v62 = 0;
  v63 = &v62;
  v64 = 0x2020000000;
  v65 = 0;
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__3;
  v60 = __Block_byref_object_dispose__3;
  v61 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 1;
  -[ISOperation delegate](self, "delegate");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7 = objc_msgSend(v6, "shouldLog");
    v8 = objc_msgSend(v6, "shouldLogToDisk");
    objc_msgSend(v6, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
      v7 |= 2u;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      v11 = v7;
    else
      v11 = v7 & 2;
    if (v11)
    {
      v12 = (id)objc_opt_class();
      -[ISStoreURLOperation logKey](self, "logKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = 138543618;
      v67 = v12;
      v68 = 2114;
      v69 = v13;
      LODWORD(v37) = 22;
      v36 = &v66;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_13:

        v15 = dispatch_semaphore_create(0);
        v47[0] = MEMORY[0x24BDAC760];
        v47[1] = 3221225472;
        v47[2] = __54__ISStoreURLOperation__authenticateWithContext_error___block_invoke;
        v47[3] = &unk_24C43C510;
        v47[4] = self;
        v49 = &v62;
        v50 = &v56;
        v51 = &v52;
        v16 = v15;
        v48 = v16;
        objc_msgSend(v40, "operation:shouldAuthenticateWithContext:responseHandler:", self, v39, v47);
        dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 4, &v66, v37);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      free(v14);
      v36 = (int *)v10;
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
  if (!*((_BYTE *)v53 + 24))
  {
    v32 = 0;
    if (!*((_BYTE *)v63 + 24))
      goto LABEL_35;
    goto LABEL_33;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsAuthenticationConfig");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = objc_msgSend(v17, "shouldLog", v36);
  v19 = objc_msgSend(v17, "shouldLogToDisk");
  objc_msgSend(v17, "OSLogObject");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v19)
    v18 |= 2u;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    v22 = v18;
  else
    v22 = v18 & 2;
  if (!v22)
    goto LABEL_29;
  v23 = (id)objc_opt_class();
  -[ISStoreURLOperation logKey](self, "logKey");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  -[ISURLOperation requestProperties](self, "requestProperties");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "URL");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (!v26)
  {
    -[ISURLOperation requestProperties](self, "requestProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLBagKey");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v66 = 138543874;
  v67 = v23;
  v68 = 2114;
  v69 = v24;
  v70 = 2114;
  v71 = v27;
  LODWORD(v37) = 32;
  v36 = &v66;
  v28 = (void *)_os_log_send_and_compose_impl();
  if (!v26)
  {

  }
  if (v28)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v28, 4, &v66, v37);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    free(v28);
    v36 = (int *)v21;
    SSFileLog();
LABEL_29:

  }
  v30 = (id *)(v57 + 5);
  v29 = (void *)v57[5];
  v45 = 0;
  obj = v29;
  v31 = -[ISOperation copyAccountID:credentialSource:byAuthenticatingWithContext:returningError:](self, "copyAccountID:credentialSource:byAuthenticatingWithContext:returningError:", &obj, 0, v39, &v45);
  objc_storeStrong(v30, obj);
  v32 = v45;
  *((_BYTE *)v63 + 24) = v31;
  if (!v31)
    goto LABEL_35;
LABEL_33:
  -[ISStoreURLOperation setAuthenticatedDSID:](self, "setAuthenticatedDSID:", v57[5], v36);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __54__ISStoreURLOperation__authenticateWithContext_error___block_invoke_139;
    v41[3] = &unk_24C43C418;
    v42 = v40;
    v43 = self;
    v44 = &v56;
    -[ISOperation delegateDispatch:](self, "delegateDispatch:", v41);

  }
LABEL_35:
  v33 = *((unsigned __int8 *)v63 + 24);
  if (a4 && !*((_BYTE *)v63 + 24))
  {
    *a4 = objc_retainAutorelease(v32);
    v33 = *((unsigned __int8 *)v63 + 24);
  }
  v34 = v33 != 0;

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);

  _Block_object_dispose(&v62, 8);
  return v34;
}

void __54__ISStoreURLOperation__authenticateWithContext_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  void *v8;
  int v9;
  NSObject *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int *v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  char v30;
  uint64_t v31;
  void *v32;
  int v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  int *v43;
  uint64_t v44;
  void *v45;
  id v46;
  id v47;
  id obj;
  int v49;
  id v50;
  __int16 v51;
  id v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = 0x24BEB1000uLL;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsAuthenticationConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v9 |= 2u;
    objc_msgSend(v8, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      v11 = v9;
    else
      v11 = v9 & 2;
    if (v11)
    {
      v46 = v5;
      v12 = (id)objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "logKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "requestProperties");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "URL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (!v15)
      {
        objc_msgSend(*(id *)(a1 + 32), "requestProperties");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "URLBagKey");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v49 = 138543874;
      v50 = v12;
      v51 = 2114;
      v52 = v13;
      v53 = 2114;
      v54 = v16;
      LODWORD(v44) = 32;
      v43 = &v49;
      v17 = (void *)_os_log_send_and_compose_impl();
      if (!v15)
      {

      }
      v5 = v46;
      v7 = 0x24BEB1000;
      if (v17)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v17, 4, &v49, v44);
        v18 = (int *)objc_claimAutoreleasedReturnValue();
        free(v17);
        v43 = v18;
        SSFileLog();

      }
    }
    else
    {

    }
    v27 = *(void **)(a1 + 32);
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v29 = *(void **)(v28 + 40);
    v47 = v6;
    obj = v29;
    v30 = objc_msgSend(v27, "copyAccountID:credentialSource:byHandlingAuthenticateResponse:returningError:", &obj, 0, v5, &v47);
    objc_storeStrong((id *)(v28 + 40), obj);
    v26 = v47;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v30;
    LODWORD(v28) = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    objc_msgSend(*(id *)(v7 + 3736), "sharediTunesStoreConfig");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v31;
    if ((_DWORD)v28)
    {
      if (!v31)
      {
        objc_msgSend(*(id *)(v7 + 3736), "sharedConfig");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v33 = objc_msgSend(v32, "shouldLog", v43);
      if (objc_msgSend(v32, "shouldLogToDisk"))
        v33 |= 2u;
      objc_msgSend(v32, "OSLogObject");
      v34 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        v33 &= 2u;
      if (!v33)
        goto LABEL_47;
      v35 = (void *)objc_opt_class();
      v36 = *(void **)(a1 + 32);
      v37 = v35;
      objc_msgSend(v36, "logKey");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = 138543618;
      v50 = v35;
      v51 = 2114;
      v52 = v38;
      LODWORD(v44) = 22;
    }
    else
    {
      if (!v31)
      {
        objc_msgSend(*(id *)(v7 + 3736), "sharedConfig");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v39 = objc_msgSend(v32, "shouldLog", v43);
      if (objc_msgSend(v32, "shouldLogToDisk"))
        v39 |= 2u;
      objc_msgSend(v32, "OSLogObject");
      v34 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        v39 &= 2u;
      if (!v39)
        goto LABEL_47;
      v40 = (void *)objc_opt_class();
      v41 = *(void **)(a1 + 32);
      v37 = v40;
      objc_msgSend(v41, "logKey");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = 138543874;
      v50 = v40;
      v51 = 2114;
      v52 = v38;
      v53 = 2114;
      v54 = v26;
      LODWORD(v44) = 32;
    }
    v42 = (void *)_os_log_send_and_compose_impl();

    if (!v42)
    {
LABEL_48:

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      goto LABEL_49;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v42, 4, &v49, v44);
    v34 = objc_claimAutoreleasedReturnValue();
    free(v42);
    SSFileLog();
LABEL_47:

    goto LABEL_48;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = objc_msgSend(v19, "shouldLog");
  if (objc_msgSend(v19, "shouldLogToDisk"))
    v20 |= 2u;
  objc_msgSend(v19, "OSLogObject");
  v21 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    v20 &= 2u;
  if (!v20)
    goto LABEL_25;
  v22 = (void *)objc_opt_class();
  v23 = *(void **)(a1 + 32);
  v24 = v22;
  objc_msgSend(v23, "logKey");
  v49 = 138543874;
  v50 = v22;
  v51 = 2114;
  v52 = (id)objc_claimAutoreleasedReturnValue();
  v53 = 2114;
  v54 = v6;
  LODWORD(v44) = 32;
  v25 = (void *)_os_log_send_and_compose_impl();

  if (v25)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v25, 4, &v49, v44);
    v21 = objc_claimAutoreleasedReturnValue();
    free(v25);
    SSFileLog();
LABEL_25:

  }
  v26 = v6;
LABEL_49:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

uint64_t __54__ISStoreURLOperation__authenticateWithContext_error___block_invoke_139(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "operation:didAuthenticateWithDSID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

- (BOOL)_canSendTokenToURL:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("https"));

  return v4;
}

- (id)_buyParams
{
  void *v2;
  void *v3;
  void *v4;

  -[ISURLOperation authenticationContext](self, "authenticationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "signupRequestParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("product"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_continueTouchIDSession
{
  void *v3;
  void *v4;
  void *v5;
  ISDialog *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  ISStoreURLOperation *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[ISURLOperation dataProvider](self, "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "output");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("dialog"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = -[ISDialog initWithDialogDictionary:]([ISDialog alloc], "initWithDialogDictionary:", v5);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[ISDialog buttons](v6, "buttons");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v14 = self;
      v10 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "dictionary");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", CFSTR("tidContinue"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v13, "BOOLValue"))
          {

            -[ISStoreURLOperation biometricSessionDelegate](v14, "biometricSessionDelegate");
            v6 = (ISDialog *)objc_claimAutoreleasedReturnValue();
            if ((objc_opt_respondsToSelector() & 1) != 0)
              -[ISDialog sender:shouldContinueTouchIDSession:](v6, "sender:shouldContinueTouchIDSession:", v14, 1);
            goto LABEL_14;
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v9)
          continue;
        break;
      }
    }

LABEL_14:
  }

}

- (id)_copyAuthenticationContextForAttemptNumber:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = -[ISStoreURLOperation _copyAuthenticationContext](self, "_copyAuthenticationContext");
  v6 = v5;
  if (a3 >= 1)
    objc_msgSend(v5, "setPromptStyle:", 1);
  -[ISURLOperation response](self, "response");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x24BEB1D88];
    -[ISURLOperation response](self, "response");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsSilentAuthentication:", objc_msgSend(v8, "URLResponseAllowsSilentAuthentication:", v9));

  }
  return v6;
}

- (BOOL)_isErrorTokenError:(id)a3
{
  id v3;
  uint64_t v4;
  char IsEqual;

  v3 = a3;
  if ((ISErrorIsEqual(v3, (uint64_t)CFSTR("SSErrorDomain"), 18) & 1) != 0
    || (v4 = *MEMORY[0x24BEB2A58], (ISErrorIsEqual(v3, *MEMORY[0x24BEB2A58], 1001) & 1) != 0)
    || (ISErrorIsEqual(v3, v4, 1003) & 1) != 0)
  {
    IsEqual = 1;
  }
  else
  {
    IsEqual = ISErrorIsEqual(v3, v4, 1004);
  }

  return IsEqual;
}

- (id)_loadURLBagInterpreterWithRequest:(id)a3 requestProperties:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  id v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t i;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[ISStoreURLOperation SAPSession](self, "SAPSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "useSharedBagInterpreter") & 1) != 0)
  {
    -[ISStoreURLOperation SAPSession](self, "SAPSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "urlBagInterpreter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[ISStoreURLOperation SAPSession](self, "SAPSession");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "urlBagInterpreter");
      v12 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    }
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", objc_msgSend(v7, "URLBagType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAllowsBootstrapCellularData:", objc_msgSend(v7, "allowsBootstrapCellularData"));
  v14 = 1;
  objc_msgSend(v13, "setAllowsExpiredBags:", 1);
  v27[0] = (id)*MEMORY[0x24BEB2518];
  v15 = (id)*MEMORY[0x24BEB2598];
  v16 = 0;
  v27[1] = v15;
  do
  {
    v17 = v14;
    v18 = v27[v16];
    objc_msgSend(v6, "valueForHTTPHeaderField:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      objc_msgSend(v13, "setValue:forHTTPHeaderField:", v19, v18);

    v14 = 0;
    v16 = 1;
  }
  while ((v17 & 1) != 0);
  -[ISURLOperation _accountIdentifier](self, "_accountIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISOperation loadedURLBagWithContext:accountDSID:returningError:](self, "loadedURLBagWithContext:accountDSID:returningError:", v13, v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = objc_alloc(MEMORY[0x24BEB2098]);
    objc_msgSend(v21, "URLBagDictionary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithURLBagDictionary:", v23);

  }
  else
  {
    v24 = 0;
  }
  v12 = v24;

  for (i = 1; i != -1; --i)
LABEL_15:

  return v12;
}

- (BOOL)_performMachineDataRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  dispatch_semaphore_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int64_t v11;
  BOOL v12;
  uint64_t v14;
  uint64_t v15;
  intptr_t (*v16)(uint64_t, char);
  void *v17;
  NSObject *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  -[ISStoreURLOperation _account](self, "_account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccountIdentifier:", v6);

  objc_msgSend(v4, "setWaitsForPurchaseOperations:", +[ISStoreURLOperation _operationWaitsForPurchases:](ISStoreURLOperation, "_operationWaitsForPurchases:", self));
  v7 = dispatch_semaphore_create(0);
  -[ISURLOperation _requestProperties](self, "_requestProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __50__ISStoreURLOperation__performMachineDataRequest___block_invoke;
  v17 = &unk_24C43C538;
  v19 = &v20;
  v9 = v7;
  v18 = v9;
  +[ISStoreURLOperation _performMachineDataRequest:requestProperties:completion:](ISStoreURLOperation, "_performMachineDataRequest:requestProperties:completion:", v4, v8, &v14);

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  if (*((_BYTE *)v21 + 24))
  {
    -[ISOperation lock](self, "lock", v14, v15, v16, v17);
    v10 = objc_msgSend(v4, "protocolVersion");
    if (v10)
    {
      if (v10 != 1)
      {
LABEL_8:
        -[ISOperation unlock](self, "unlock");
        v12 = *((_BYTE *)v21 + 24) != 0;
        goto LABEL_9;
      }
      v11 = 3;
    }
    else
    {
      v11 = 1;
    }
    self->_activeMachineDataStyle = v11;
    goto LABEL_8;
  }
  v12 = 0;
LABEL_9:

  _Block_object_dispose(&v20, 8);
  return v12;
}

intptr_t __50__ISStoreURLOperation__performMachineDataRequest___block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_resolvedURLInBagContext:(id)a3 bagTrusted:(BOOL *)a4
{
  id v6;
  ISLoadURLBagOperation *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  id v15;

  v6 = a3;
  v7 = -[ISLoadURLBagOperation initWithBagContext:]([ISLoadURLBagOperation alloc], "initWithBagContext:", v6);
  if (!-[ISOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v7, 0))
  {
    v13 = 0;
    v9 = 0;
    v10 = 0;
    if (!a4)
      goto LABEL_14;
    goto LABEL_13;
  }
  -[ISURLOperation _requestProperties](self, "_requestProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISLoadURLBagOperation URLBag](v7, "URLBag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v8, "URLBagURLBlock");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
    {
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v8, "URLBagKey");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v9, "urlForKey:", v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }

    }
  }
  v13 = objc_msgSend(v9, "urlIsTrusted:", v10);

  if (a4)
LABEL_13:
    *a4 = v13;
LABEL_14:
  v15 = v10;

  return v15;
}

- (void)_runURLOperation
{
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  int v17;
  NSObject *v18;
  int v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  int v28;
  int v29;
  NSObject *v30;
  int v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  int v44;
  NSObject *v45;
  int v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  NSObject *v53;
  int v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  NSObject *v61;
  int v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  int v70;
  NSObject *v71;
  int v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  int *v79;
  uint64_t v80;
  id v81;
  BOOL v82;
  void *v83;
  objc_super v84;
  id v85;
  char v86;
  void *v87;
  int v88;
  void *v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  void *v93;
  uint64_t v94;

  v94 = *MEMORY[0x24BDAC8D0];
  -[ISStoreURLOperation URLBagContext](self, "URLBagContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ISStoreURLOperation urlKnownToBeTrusted](self, "urlKnownToBeTrusted");
  v86 = 0;
  if (!-[ISStoreURLOperation needsURLBag](self, "needsURLBag"))
  {
    -[ISURLOperation _requestProperties](self, "_requestProperties");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      goto LABEL_40;
    -[ISStoreURLOperation bag](self, "bag");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      -[ISStoreURLOperation bag](self, "bag");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v11, "URLIsTrusted:", v13);
    }
    else
    {
      -[ISOperation loadedURLBagWithContext:returningError:](self, "loadedURLBagWithContext:returningError:", v3, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v11, "urlIsTrusted:", v13);
    }
    v86 = v26;
    goto LABEL_39;
  }
  -[ISStoreURLOperation bag](self, "bag");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_24:
    -[ISStoreURLOperation _resolvedURLInBagContext:bagTrusted:](self, "_resolvedURLInBagContext:bagTrusted:", v3, &v86);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISStoreURLOperation bag](self, "bag");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
      goto LABEL_40;
    v82 = v4;
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v28 = objc_msgSend(v11, "shouldLog");
    if (objc_msgSend(v11, "shouldLogToDisk"))
      v29 = v28 | 2;
    else
      v29 = v28;
    objc_msgSend(v11, "OSLogObject");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      v31 = v29;
    else
      v31 = v29 & 2;
    if (v31)
    {
      v32 = (void *)objc_opt_class();
      v33 = v32;
      -[ISURLOperation requestProperties](self, "requestProperties");
      v34 = v3;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "URLBagKey");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = 138412802;
      v89 = v32;
      v90 = 2112;
      v91 = v36;
      v92 = 2112;
      v93 = v13;
      LODWORD(v80) = 32;
      v79 = &v88;
      v37 = (void *)_os_log_send_and_compose_impl();

      v3 = v34;
      v4 = v82;
      if (!v37)
        goto LABEL_39;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v37, 4, &v88, v80);
      v30 = objc_claimAutoreleasedReturnValue();
      free(v37);
      v79 = (int *)v30;
      SSFileLog();
    }

    goto LABEL_39;
  }
  v6 = (void *)v5;
  -[ISStoreURLOperation bag](self, "bag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "canHandleTrustedDomains") & 1) == 0)
  {

    goto LABEL_24;
  }
  -[ISURLOperation requestProperties](self, "requestProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLBagURLBlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    goto LABEL_24;
  -[ISURLOperation requestProperties](self, "requestProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLBagKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[ISStoreURLOperation bag](self, "bag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = 0;
    objc_msgSend(v12, "URLForKey:error:", v11, &v85);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v85;

    if (!v14)
      goto LABEL_88;
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v16 = objc_msgSend(v15, "shouldLog");
    if (objc_msgSend(v15, "shouldLogToDisk"))
      v17 = v16 | 2;
    else
      v17 = v16;
    objc_msgSend(v15, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      v19 = v17;
    else
      v19 = v17 & 2;
    if (v19)
    {
      v20 = (void *)objc_opt_class();
      v88 = 138412546;
      v89 = v20;
      v90 = 2114;
      v91 = v11;
      v21 = v3;
      v22 = v20;
      LODWORD(v80) = 22;
      v79 = &v88;
      v23 = (void *)_os_log_send_and_compose_impl();

      v3 = v21;
      if (!v23)
      {
LABEL_19:

        goto LABEL_88;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v23, 4, &v88, v80);
      v18 = objc_claimAutoreleasedReturnValue();
      free(v23);
      v79 = (int *)v18;
      SSFileLog();
    }

    goto LABEL_19;
  }
  -[ISURLOperation requestProperties](self, "requestProperties");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_88:

  if (v13)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v68)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v83 = v11;
    v69 = objc_msgSend(v68, "shouldLog", v79);
    if (objc_msgSend(v68, "shouldLogToDisk"))
      v70 = v69 | 2;
    else
      v70 = v69;
    objc_msgSend(v68, "OSLogObject");
    v71 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      v72 = v70;
    else
      v72 = v70 & 2;
    if (v72)
    {
      v73 = v3;
      v74 = (void *)objc_opt_class();
      v81 = v74;
      -[ISURLOperation _requestProperties](self, "_requestProperties");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "URL");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = 138412802;
      v89 = v74;
      v3 = v73;
      v90 = 2112;
      v91 = v83;
      v92 = 2112;
      v93 = v76;
      LODWORD(v80) = 32;
      v79 = &v88;
      v77 = (void *)_os_log_send_and_compose_impl();

      if (!v77)
      {
LABEL_101:

        -[ISStoreURLOperation bag](self, "bag");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = objc_msgSend(v78, "URLIsTrusted:", v13);

        v11 = v83;
        goto LABEL_39;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v77, 4, &v88, v80);
      v71 = objc_claimAutoreleasedReturnValue();
      free(v77);
      v79 = (int *)v71;
      SSFileLog();
    }

    goto LABEL_101;
  }
LABEL_39:

LABEL_40:
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v43)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v44 = objc_msgSend(v43, "shouldLog", v79);
    if (objc_msgSend(v43, "shouldLogToDisk"))
      v44 |= 2u;
    objc_msgSend(v43, "OSLogObject");
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      v46 = v44;
    else
      v46 = v44 & 2;
    if (v46)
    {
      v47 = (void *)objc_opt_class();
      v88 = 138412290;
      v89 = v47;
      v48 = v47;
      LODWORD(v80) = 12;
      v49 = (void *)_os_log_send_and_compose_impl();

      if (!v49)
      {
LABEL_61:

        SSError();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[ISOperation setError:](self, "setError:", v38);
        goto LABEL_74;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v49, 4, &v88, v80);
      v45 = objc_claimAutoreleasedReturnValue();
      free(v49);
      SSFileLog();
    }

    goto LABEL_61;
  }
  -[ISURLOperation _requestProperties](self, "_requestProperties");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "URL");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v39)
  {
    v87 = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v87, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setURLs:", v40);

  }
  if (v86)
    v41 = 1;
  else
    v41 = v4;
  if ((v41 & 1) == 0)
  {
    SSError();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISOperation setError:](self, "setError:", v50);

    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v51)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v52 = objc_msgSend(v51, "shouldLog", v79);
    if (objc_msgSend(v51, "shouldLogToDisk"))
      v52 |= 2u;
    objc_msgSend(v51, "OSLogObject");
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      v54 = v52;
    else
      v54 = v52 & 2;
    if (v54)
    {
      v55 = (void *)objc_opt_class();
      v56 = v55;
      -[ISURLOperation _sanitizedURLForURL:](self, "_sanitizedURLForURL:", v13);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = 138412546;
      v89 = v55;
      v90 = 2112;
      v91 = v57;
      LODWORD(v80) = 22;
      v58 = (void *)_os_log_send_and_compose_impl();

      if (!v58)
      {
LABEL_73:

        goto LABEL_74;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v58, 4, &v88, v80);
      v53 = objc_claimAutoreleasedReturnValue();
      free(v58);
      SSFileLog();
    }

    goto LABEL_73;
  }
  if (-[ISStoreURLOperation needsAuthentication](self, "needsAuthentication")
    && !-[ISStoreURLOperation _canSendTokenToURL:](self, "_canSendTokenToURL:", v13))
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v59)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v60 = objc_msgSend(v59, "shouldLog", v79);
    if (objc_msgSend(v59, "shouldLogToDisk"))
      v60 |= 2u;
    objc_msgSend(v59, "OSLogObject");
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      v62 = v60;
    else
      v62 = v60 & 2;
    if (v62)
    {
      v63 = (void *)objc_opt_class();
      v64 = v63;
      -[ISURLOperation _sanitizedURLForURL:](self, "_sanitizedURLForURL:", v13);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = 138412546;
      v89 = v63;
      v90 = 2112;
      v91 = v65;
      LODWORD(v80) = 22;
      v66 = (void *)_os_log_send_and_compose_impl();

      if (!v66)
      {
LABEL_86:

        SSError();
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[ISOperation setError:](self, "setError:", v67);

        goto LABEL_74;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v66, 4, &v88, v80);
      v61 = objc_claimAutoreleasedReturnValue();
      free(v66);
      SSFileLog();
    }

    goto LABEL_86;
  }
  -[ISStoreURLOperation _addStandardQueryParametersForURL:](self, "_addStandardQueryParametersForURL:", v13, v79);
  -[ISURLOperation dataProvider](self, "dataProvider");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setBagContext:", v3);

  objc_msgSend(v38, "setITunesStoreRequest:", 1);
  v84.receiver = self;
  v84.super_class = (Class)ISStoreURLOperation;
  -[ISURLOperation run](&v84, "run");
LABEL_74:

}

- (BOOL)_shouldRetryForAbsintheWithResponse:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  ISAMSBagShim *v8;
  void *v9;
  ISAMSBagShim *v10;
  void *v11;
  ISAMSBagShim *v12;
  void *v13;
  BOOL v14;

  v4 = a3;
  -[ISStoreURLOperation logKey](self, "logKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)AMSSetLogKey();

  -[ISStoreURLOperation bag](self, "bag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = [ISAMSBagShim alloc];
    -[ISStoreURLOperation bag](self, "bag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[ISAMSBagShim initWithBag:](v8, "initWithBag:", v9);
  }
  else
  {
    -[ISStoreURLOperation URLBagContext](self, "URLBagContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISStoreURLOperation _urlBagForContext:](self, "_urlBagForContext:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[ISAMSBagShim initWithURLBag:]([ISAMSBagShim alloc], "initWithURLBag:", v9);
  }
  v12 = v10;

  objc_msgSend(MEMORY[0x24BE07FF0], "handleResponse:bag:", v4, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "actionType") == 2;
  return v14;
}

- (BOOL)_shouldRetryForTouchIDChallengeWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  ISStoreURLOperation *v17;
  id v18;

  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BEB24A0]))
  {

    goto LABEL_12;
  }
  v6 = objc_msgSend(v4, "code");

  if (v6 != 22)
    goto LABEL_12;
  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BEB2490]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_13;
  v9 = objc_msgSend(v8, "integerValue");

  if (v9 != 2074)
  {
LABEL_12:
    LOBYTE(v8) = 0;
    goto LABEL_13;
  }
  -[ISURLOperation dataProvider](self, "dataProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "biometricAuthenticationContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v11, "didAuthenticate");
  if ((_DWORD)v8 && objc_msgSend(v11, "didFallbackToPassword"))
  {
    objc_msgSend(v11, "accountIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISStoreURLOperation setAuthenticatedDSID:](self, "setAuthenticatedDSID:", v12);
    -[ISOperation delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __64__ISStoreURLOperation__shouldRetryForTouchIDChallengeWithError___block_invoke;
      v15[3] = &unk_24C43C1A0;
      v16 = v13;
      v17 = self;
      v18 = v12;
      -[ISOperation delegateDispatch:](self, "delegateDispatch:", v15);

    }
    objc_msgSend(v11, "setChallenge:", 0);
    objc_msgSend(v11, "setSignature:", 0);

  }
  -[ISStoreURLOperation setBiometricAuthenticationContext:](self, "setBiometricAuthenticationContext:", v11);

LABEL_13:
  return (char)v8;
}

uint64_t __64__ISStoreURLOperation__shouldRetryForTouchIDChallengeWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "operation:didAuthenticateWithDSID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)_urlBagForContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ISLoadURLBagOperation *v7;

  v4 = a3;
  +[ISURLBagCache sharedCache](ISURLBagCache, "sharedCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLBagForContext:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (-[ISStoreURLOperation isURLBagRequest](self, "isURLBagRequest"))
    {
      v6 = 0;
    }
    else
    {
      v7 = -[ISLoadURLBagOperation initWithBagContext:]([ISLoadURLBagOperation alloc], "initWithBagContext:", v4);
      v6 = 0;
      if (-[ISOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v7, 0))
      {
        -[ISLoadURLBagOperation URLBag](v7, "URLBag");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
  }

  return v6;
}

+ (void)_handleResponseHeaders:(id)a3 response:(id)a4 request:(id)a5 account:(id)a6 performsMachineDataActions:(BOOL)a7 shouldRetry:(BOOL *)a8
{
  _BOOL4 v9;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  NSObject *v23;
  int v24;
  BOOL *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  NSObject *v39;
  int v40;
  id v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  char isKindOfClass;
  char v49;
  uint64_t v50;
  void *v51;
  int v52;
  ISBiometricUpdateTouchIDSettingsOperation *v53;
  int v54;
  __CFString *v55;
  __CFString *v56;
  void *v57;
  void *v58;
  int v59;
  NSObject *v60;
  int v61;
  __CFString *v62;
  __CFString *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  NSObject *v72;
  int v73;
  __CFString *v74;
  __CFString *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  void *v97;
  int v98;
  NSObject *v99;
  int v100;
  __CFString *v101;
  __CFString *v102;
  void *v103;
  BOOL v104;
  void *v105;
  void *v106;
  id v107;
  void *v108;
  void *v109;
  int *v110;
  int *v111;
  uint64_t v112;
  void *v113;
  __CFString *v114;
  _BOOL4 v115;
  id v116;
  void *v117;
  void *v118;
  id v119;
  void *v120;
  _QWORD block[4];
  id v122;
  int v123;
  const __CFString *v124;
  __int16 v125;
  uint64_t v126;
  __int16 v127;
  void *v128;
  __int16 v129;
  void *v130;
  uint64_t v131;

  v9 = a7;
  v131 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v119 = a6;
  v120 = v14;
  objc_msgSend(v14, "allHeaderFields");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  ISDictionaryValueForCaseInsensitiveString(v16, (void *)*MEMORY[0x24BEB25D8]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0x24BDD1000;
  v117 = v13;
  v118 = v16;
  if (v17)
  {
    objc_msgSend(v13, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0
      || objc_msgSend(v19, "operation:shouldSetStoreFrontID:", v13, v17))
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v21 = objc_msgSend(v20, "shouldLog");
      if (objc_msgSend(v20, "shouldLogToDisk"))
        v22 = v21 | 2;
      else
        v22 = v21;
      objc_msgSend(v20, "OSLogObject");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        v24 = v22;
      else
        v24 = v22 & 2;
      if (v24)
      {
        v113 = v19;
        v25 = a8;
        v26 = (__CFString *)objc_opt_class();
        v114 = v26;
        objc_msgSend(v120, "URL");
        v116 = v15;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "accountName");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        SSHashIfNeeded();
        v115 = v9;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        SSHashIfNeeded();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v123 = 138544130;
        v124 = v26;
        a8 = v25;
        v19 = v113;
        v125 = 2114;
        v126 = (uint64_t)v27;
        v127 = 2114;
        v128 = v29;
        v129 = 2114;
        v130 = v30;
        LODWORD(v112) = 42;
        v110 = &v123;
        v31 = (void *)_os_log_send_and_compose_impl();

        v9 = v115;
        v15 = v116;

        v18 = 0x24BDD1000uLL;
        if (v31)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v31, 4, &v123, v112);
          v32 = (int *)objc_claimAutoreleasedReturnValue();
          free(v31);
          v110 = v32;
          SSFileLog();

        }
      }
      else
      {

        v18 = 0x24BDD1000;
      }

      objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setStoreFrontIdentifier:forRequest:response:account:", v17, v15, v120, v119);

      v13 = v117;
      v16 = v118;
    }

  }
  ISDictionaryValueForCaseInsensitiveString(v16, CFSTR("X-Apple-Partner"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    +[ISClient currentClient](ISClient, "currentClient");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPartnerHeader:", v34);

  }
  if (v9)
  {
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1EB8]), "initWithURLResponse:", v120);
    if (!v36)
    {
LABEL_37:

      goto LABEL_38;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v37)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v38 = objc_msgSend(v37, "shouldLog", v110);
    if (objc_msgSend(v37, "shouldLogToDisk"))
      v38 |= 2u;
    objc_msgSend(v37, "OSLogObject");
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      v40 = v38;
    else
      v40 = v38 & 2;
    if (v40)
    {
      v41 = v15;
      if (v13)
        v42 = (const __CFString *)objc_opt_class();
      else
        v42 = CFSTR("ISStoreURLOperation");
      objc_msgSend(v36, "actionName");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v123 = 138412546;
      v124 = v42;
      v125 = 2112;
      v126 = (uint64_t)v43;
      LODWORD(v112) = 22;
      v110 = &v123;
      v44 = (void *)_os_log_send_and_compose_impl();

      v15 = v41;
      if (!v44)
        goto LABEL_36;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v44, 4, &v123, v112);
      v39 = objc_claimAutoreleasedReturnValue();
      free(v44);
      v110 = (int *)v39;
      SSFileLog();
    }

LABEL_36:
    objc_msgSend(v119, "uniqueIdentifier");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setAccountIdentifier:", v45);

    objc_msgSend(v36, "setWaitsForPurchaseOperations:", +[ISStoreURLOperation _operationWaitsForPurchases:](ISStoreURLOperation, "_operationWaitsForPurchases:", v13));
    objc_msgSend(v13, "_requestProperties");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    +[ISStoreURLOperation _performMachineDataRequest:requestProperties:completion:](ISStoreURLOperation, "_performMachineDataRequest:requestProperties:completion:", v36, v46, 0);

    v16 = v118;
    v18 = 0x24BDD1000uLL;
    goto LABEL_37;
  }
LABEL_38:
  ISDictionaryValueForCaseInsensitiveString(v16, (void *)*MEMORY[0x24BEB25A0]);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
    goto LABEL_84;
  if (!objc_msgSend(v47, "isEqualToString:", CFSTR("RP")))
  {
    if (!objc_msgSend(v47, "isEqualToString:", CFSTR("EP")))
      goto LABEL_84;
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v58)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v59 = objc_msgSend(v58, "shouldLog", v110);
    if (objc_msgSend(v58, "shouldLogToDisk"))
      v59 |= 2u;
    objc_msgSend(v58, "OSLogObject");
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      v61 = v59;
    else
      v61 = v59 & 2;
    if (v61)
    {
      v62 = (__CFString *)objc_opt_class();
      v123 = 138412290;
      v124 = v62;
      v63 = v62;
      LODWORD(v112) = 12;
      v111 = &v123;
      v64 = (void *)_os_log_send_and_compose_impl();

      if (!v64)
      {
LABEL_63:

        v51 = (void *)objc_opt_new();
        objc_msgSend(v51, "setPromptUser:", 1);
        objc_msgSend(v13, "_buyParams");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v66 = v15;
          v67 = (void *)objc_msgSend(MEMORY[0x24BDBCF48], "copyDictionaryForQueryString:unescapedValues:", v65, 1);
          objc_msgSend(v67, "objectForKey:", CFSTR("mtTopic"));
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          if (v68)
            objc_msgSend(v51, "setTopicName:", v68);

          v15 = v66;
        }
        objc_msgSend(v13, "authenticationContext", v111);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "HTTPHeaders");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "objectForKey:", *MEMORY[0x24BEB2518]);
        v53 = (ISBiometricUpdateTouchIDSettingsOperation *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v51, "setUserAgent:", v53);
        objc_msgSend(v13, "runSubOperation:returningError:", v51, 0);
        goto LABEL_82;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v64, 4, &v123, v112);
      v60 = objc_claimAutoreleasedReturnValue();
      free(v64);
      v111 = (int *)v60;
      SSFileLog();
    }

    goto LABEL_63;
  }
  v49 = objc_msgSend(v13, "shouldCancelBiometricTokenUpdate");
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v50 = objc_claimAutoreleasedReturnValue();
  v51 = (void *)v50;
  if ((v49 & 1) == 0)
  {
    if (!v50)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v71 = objc_msgSend(v51, "shouldLog", v110);
    if (objc_msgSend(v51, "shouldLogToDisk"))
      v71 |= 2u;
    objc_msgSend(v51, "OSLogObject");
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      v73 = v71;
    else
      v73 = v71 & 2;
    if (v73)
    {
      v74 = (__CFString *)objc_opt_class();
      v123 = 138412290;
      v124 = v74;
      v75 = v74;
      LODWORD(v112) = 12;
      v110 = &v123;
      v76 = (void *)_os_log_send_and_compose_impl();

      if (!v76)
      {
LABEL_81:

        objc_msgSend(v13, "authenticatedAccountDSID");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = -[ISBiometricUpdateTouchIDSettingsOperation initWithAccountIdentifier:]([ISBiometricUpdateTouchIDSettingsOperation alloc], "initWithAccountIdentifier:", v51);
        +[ISOperationQueue mainQueue](ISOperationQueue, "mainQueue");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "addOperation:", v53);

        goto LABEL_82;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v76, 4, &v123, v112);
      v72 = objc_claimAutoreleasedReturnValue();
      free(v76);
      v110 = (int *)v72;
      SSFileLog();
    }

    goto LABEL_81;
  }
  if (!v50)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v52 = objc_msgSend(v51, "shouldLog", v110);
  if (objc_msgSend(v51, "shouldLogToDisk"))
    v52 |= 2u;
  objc_msgSend(v51, "OSLogObject");
  v53 = (ISBiometricUpdateTouchIDSettingsOperation *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v53->super.super.super, OS_LOG_TYPE_DEFAULT))
    v54 = v52;
  else
    v54 = v52 & 2;
  if (!v54)
    goto LABEL_82;
  v55 = (__CFString *)objc_opt_class();
  v123 = 138543362;
  v124 = v55;
  v56 = v55;
  LODWORD(v112) = 12;
  v110 = &v123;
  v57 = (void *)_os_log_send_and_compose_impl();

  if (v57)
  {
    objc_msgSend(*(id *)(v18 + 1992), "stringWithCString:encoding:", v57, 4, &v123, v112);
    v53 = (ISBiometricUpdateTouchIDSettingsOperation *)objc_claimAutoreleasedReturnValue();
    free(v57);
    v110 = (int *)v53;
    SSFileLog();
LABEL_82:

  }
  v16 = v118;
LABEL_84:
  ISDictionaryValueForCaseInsensitiveString(v16, (void *)*MEMORY[0x24BEB25A8]);
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if (isKindOfClass & 1 | ((objc_opt_isKindOfClass() & 1) == 0))
    goto LABEL_95;
  objc_msgSend(v13, "_account");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "accountName");
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "biometricAuthenticationContext");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "authenticationContext");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "requiredUniqueIdentifier");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setAccountIdentifier:", v83);

  objc_msgSend(v81, "setAccountName:", v80);
  objc_msgSend(v81, "setChallenge:", v78);
  objc_msgSend(v81, "setSignature:", 0);
  ISDictionaryValueForCaseInsensitiveString(v16, (void *)*MEMORY[0x24BEB25B8]);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v85 = v15;
    objc_msgSend(v84, "uppercaseString");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v86, "isEqualToString:", CFSTR("EXT")) & 1) != 0)
LABEL_87:
      objc_msgSend(v81, "setIsExtendedAction:", 1, v110);
  }
  else
  {
    v85 = v15;
    ISDictionaryValueForCaseInsensitiveString(v16, (void *)*MEMORY[0x24BEB25D0]);
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_92;
    objc_msgSend(v87, "uppercaseString");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = v87;
    if (objc_msgSend(v86, "isEqualToString:", CFSTR("PK")))
      goto LABEL_87;
  }

  v87 = v84;
LABEL_92:
  objc_msgSend(v13, "setBiometricAuthenticationContext:", v81, v110);
  ISError();
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  SSErrorBySettingUserInfoValue();
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setError:", v89);
  objc_msgSend(v13, "dataProvider");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v13, "biometricAuthenticationContext");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setBiometricAuthenticationContext:", v91);

  }
  v15 = v85;
  v16 = v118;
LABEL_95:
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __110__ISStoreURLOperation__handleResponseHeaders_response_request_account_performsMachineDataActions_shouldRetry___block_invoke;
  block[3] = &unk_24C43C128;
  v92 = v120;
  v122 = v92;
  if (_handleResponseHeaders_response_request_account_performsMachineDataActions_shouldRetry__sEnvironmentOnce != -1)
    dispatch_once(&_handleResponseHeaders_response_request_account_performsMachineDataActions_shouldRetry__sEnvironmentOnce, block);
  +[ISStoreURLOperation _authKitSession](ISStoreURLOperation, "_authKitSession", v110);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "handleResponse:forRequest:shouldRetry:", v92, v15, a8);

  v94 = *MEMORY[0x24BEB2538];
  ISDictionaryValueForCaseInsensitiveString(v16, (void *)*MEMORY[0x24BEB2538]);
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  if (a8 && !*a8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v96 = objc_msgSend(v95, "integerValue");
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedStoreServicesConfig");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v97)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v98 = objc_msgSend(v97, "shouldLog");
    if (objc_msgSend(v97, "shouldLogToDisk"))
      v98 |= 2u;
    objc_msgSend(v97, "OSLogObject");
    v99 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
      v100 = v98;
    else
      v100 = v98 & 2;
    if (v100)
    {
      v101 = (__CFString *)objc_opt_class();
      v123 = 138543618;
      v124 = v101;
      v125 = 2048;
      v126 = v96;
      v102 = v101;
      LODWORD(v112) = 22;
      v103 = (void *)_os_log_send_and_compose_impl();

      if (!v103)
        goto LABEL_111;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v103, 4, &v123, v112);
      v99 = objc_claimAutoreleasedReturnValue();
      free(v103);
      SSFileLog();
    }

LABEL_111:
    v104 = v96 == 1001;
    v16 = v118;
    if (v104)
    {
      objc_msgSend(v117, "_requestProperties");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "setShouldDisableReversePush:", 1);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), 1);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "setValue:forHTTPHeaderField:", v106, v94);
      objc_msgSend(v117, "_activeURLRequest");
      v107 = v15;
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = (void *)objc_msgSend(v108, "mutableCopy");

      v15 = v107;
      objc_msgSend(v109, "setValue:forHTTPHeaderField:", v106, v94);
      v16 = v118;
      objc_msgSend(v117, "_setActiveURLRequest:", v109);
      *a8 = 1;

    }
  }

}

void __110__ISStoreURLOperation__handleResponseHeaders_response_request_account_performsMachineDataActions_shouldRetry___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_iTunesStore_valueForHTTPHeader:", CFSTR("X-Apple-Application-Site"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v3 = objc_msgSend(v2, "shouldLog");
    if (objc_msgSend(v2, "shouldLogToDisk"))
      v4 = v3 | 2;
    else
      v4 = v3;
    objc_msgSend(v2, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      v6 = v4;
    else
      v6 = v4 & 2;
    if (v6)
    {
      v9 = 138412290;
      v10 = v1;
      LODWORD(v8) = 12;
      v7 = (void *)_os_log_send_and_compose_impl();

      if (!v7)
      {
LABEL_14:

        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 4, &v9, v8);
      v5 = objc_claimAutoreleasedReturnValue();
      free(v7);
      SSFileLog();
    }

    goto LABEL_14;
  }
LABEL_15:

}

+ (BOOL)_operationWaitsForPurchases:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  char v8;

  if (!a3)
    return 1;
  objc_msgSend(a3, "parentOperation");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 1;
  v4 = (void *)v3;
  do
  {
    objc_msgSend(v4, "uniqueKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.itunesstored.PurchaseOperation"));

    if ((v6 & 1) != 0)
      break;
    objc_msgSend(v4, "parentOperation");
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  while (v7);
  v8 = v6 ^ 1;

  return v8;
}

+ (void)_performMachineDataRequest:(id)a3 requestProperties:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "setAllowsBootstrapCellularData:", objc_msgSend(v8, "allowsBootstrapCellularData"));
  if ((SSIsDaemon() & 1) != 0)
  {
    v10 = (void *)objc_msgSend(objc_alloc(NSClassFromString(CFSTR("ISMachineDataActionOperation"))), "initWithMachineDataRequest:", v7);
    objc_msgSend(v8, "HTTPHeaders");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BEB2518]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUserAgent:", v12);

    if (v9)
    {
      v14 = MEMORY[0x24BDAC760];
      v15 = 3221225472;
      v16 = __79__ISStoreURLOperation__performMachineDataRequest_requestProperties_completion___block_invoke_2;
      v17 = &unk_24C43C588;
      v18 = v9;
      objc_msgSend(v10, "setResultBlock:", &v14);

    }
    +[ISOperationQueue mainQueue](ISOperationQueue, "mainQueue", v14, v15, v16, v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addOperation:", v10);

  }
  else
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __79__ISStoreURLOperation__performMachineDataRequest_requestProperties_completion___block_invoke;
    v19[3] = &unk_24C43C560;
    v20 = v9;
    objc_msgSend(v7, "startWithCompletionBlock:", v19);
    v10 = v20;
  }

}

uint64_t __79__ISStoreURLOperation__performMachineDataRequest_requestProperties_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a2 == 0, a2);
  return result;
}

uint64_t __79__ISStoreURLOperation__performMachineDataRequest_requestProperties_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)_storeFrontIdentifierForAccount:(id)a3
{
  id v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  NSObject *v19;
  int v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  int v31;
  int v32;
  NSObject *v33;
  int v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  int v40;
  int v41;
  NSObject *v42;
  int v43;
  void *v44;
  id v45;
  void *v46;
  int *v48;
  uint64_t v49;
  void *v50;
  int v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  SSGenerateLogCorrelationString();
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsStorefrontConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    v8 = v6;
  else
    v8 = v6 & 2;
  if (v8)
  {
    v9 = (void *)objc_opt_class();
    v10 = v9;
    objc_msgSend(v3, "accountName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SSHashIfNeeded();
    v12 = v3;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 138543874;
    v52 = v9;
    v53 = 2114;
    v54 = v50;
    v55 = 2114;
    v56 = v13;
    LODWORD(v49) = 32;
    v48 = &v51;
    v14 = (void *)_os_log_send_and_compose_impl();

    v3 = v12;
    if (!v14)
      goto LABEL_13;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 4, &v51, v49);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v14);
    v48 = (int *)v7;
    SSFileLog();
  }

LABEL_13:
  objc_msgSend(v3, "storeFrontIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "length"))
  {
    objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "storeFrontIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = objc_msgSend(v27, "length");
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsStorefrontConfig");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v29;
    if (v28)
    {
      if (!v29)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v31 = objc_msgSend(v30, "shouldLog", v48);
      if (objc_msgSend(v30, "shouldLogToDisk"))
        v32 = v31 | 2;
      else
        v32 = v31;
      objc_msgSend(v30, "OSLogObject");
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        v34 = v32;
      else
        v34 = v32 & 2;
      if (v34)
      {
        v35 = (void *)objc_opt_class();
        v36 = v35;
        SSHashIfNeeded();
        v37 = v3;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = 138543874;
        v52 = v35;
        v53 = 2114;
        v54 = v50;
        v55 = 2114;
        v56 = v38;
        LODWORD(v49) = 32;
        v39 = (void *)_os_log_send_and_compose_impl();

        v3 = v37;
        if (!v39)
        {
LABEL_40:

          v25 = v27;
LABEL_54:

          goto LABEL_55;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v39, 4, &v51, v49);
        v33 = objc_claimAutoreleasedReturnValue();
        free(v39);
        SSFileLog();
      }

      goto LABEL_40;
    }
    if (!v29)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v40 = objc_msgSend(v30, "shouldLog", v48);
    if (objc_msgSend(v30, "shouldLogToDisk"))
      v41 = v40 | 2;
    else
      v41 = v40;
    objc_msgSend(v30, "OSLogObject");
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      v43 = v41;
    else
      v43 = v41 & 2;
    if (v43)
    {
      v44 = (void *)objc_opt_class();
      v51 = 138543618;
      v52 = v44;
      v53 = 2114;
      v54 = v50;
      v45 = v44;
      LODWORD(v49) = 22;
      v46 = (void *)_os_log_send_and_compose_impl();

      if (!v46)
      {
LABEL_53:

        v25 = 0;
        goto LABEL_54;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v46, 4, &v51, v49);
      v42 = objc_claimAutoreleasedReturnValue();
      free(v46);
      SSFileLog();
    }

    goto LABEL_53;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsStorefrontConfig");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = objc_msgSend(v16, "shouldLog", v48);
  if (objc_msgSend(v16, "shouldLogToDisk"))
    v18 = v17 | 2;
  else
    v18 = v17;
  objc_msgSend(v16, "OSLogObject");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    v20 = v18;
  else
    v20 = v18 & 2;
  if (!v20)
    goto LABEL_25;
  v21 = (void *)objc_opt_class();
  v22 = v21;
  SSHashIfNeeded();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 138543874;
  v52 = v21;
  v53 = 2114;
  v54 = v50;
  v55 = 2114;
  v56 = v23;
  LODWORD(v49) = 32;
  v24 = (void *)_os_log_send_and_compose_impl();

  if (v24)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v24, 4, &v51, v49);
    v19 = objc_claimAutoreleasedReturnValue();
    free(v24);
    SSFileLog();
LABEL_25:

  }
  v25 = v15;
LABEL_55:

  return v25;
}

- (NSNumber)authenticatedDSID
{
  return (NSNumber *)objc_getProperty(self, a2, 496, 1);
}

- (void)setAuthenticatedDSID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 496);
}

- (SSBiometricAuthenticationContext)biometricAuthenticationContext
{
  return (SSBiometricAuthenticationContext *)objc_getProperty(self, a2, 552, 1);
}

- (void)setBiometricAuthenticationContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 552);
}

- (BOOL)needsAuthentication
{
  return self->_needsAuthentication;
}

- (void)setNeedsAuthentication:(BOOL)a3
{
  self->_needsAuthentication = a3;
}

- (BOOL)needsTermsAndConditionsAcceptance
{
  return self->_needsTermsAndConditionsAcceptance;
}

- (void)setNeedsTermsAndConditionsAcceptance:(BOOL)a3
{
  self->_needsTermsAndConditionsAcceptance = a3;
}

- (BOOL)needsURLBag
{
  return self->_needsURLBag;
}

- (void)setNeedsURLBag:(BOOL)a3
{
  self->_needsURLBag = a3;
}

- (BOOL)shouldAppendAuthKitHeaders
{
  return self->_shouldAppendAuthKitHeaders;
}

- (void)setShouldAppendAuthKitHeaders:(BOOL)a3
{
  self->_shouldAppendAuthKitHeaders = a3;
}

- (BOOL)shouldAppendStorefrontToURL
{
  return self->_shouldAppendStorefrontToURL;
}

- (void)setShouldAppendStorefrontToURL:(BOOL)a3
{
  self->_shouldAppendStorefrontToURL = a3;
}

- (BOOL)shouldCancelBiometricTokenUpdate
{
  return self->_shouldCancelBiometricTokenUpdate;
}

- (void)setShouldCancelBiometricTokenUpdate:(BOOL)a3
{
  self->_shouldCancelBiometricTokenUpdate = a3;
}

- (BOOL)isURLBagRequest
{
  return self->_isURLBagRequest;
}

- (void)setURLBagRequest:(BOOL)a3
{
  self->_isURLBagRequest = a3;
}

- (BOOL)urlKnownToBeTrusted
{
  return self->_urlKnownToBeTrusted;
}

- (void)setUrlKnownToBeTrusted:(BOOL)a3
{
  self->_urlKnownToBeTrusted = a3;
}

- (BOOL)useUserSpecificURLBag
{
  return self->_useUserSpecificURLBag;
}

- (void)setUseUserSpecificURLBag:(BOOL)a3
{
  self->_useUserSpecificURLBag = a3;
}

- (ISBiometricSessionDelegate)biometricSessionDelegate
{
  return (ISBiometricSessionDelegate *)objc_loadWeakRetained((id *)&self->_biometricSessionDelegate);
}

- (void)setBiometricSessionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_biometricSessionDelegate, a3);
}

- (int64_t)machineDataStyle
{
  return self->_machineDataStyle;
}

- (void)setMachineDataStyle:(int64_t)a3
{
  self->_machineDataStyle = a3;
}

- (BOOL)shouldSuppressUserInfo
{
  return self->_shouldSuppressUserInfo;
}

- (void)setShouldSuppressUserInfo:(BOOL)a3
{
  self->_shouldSuppressUserInfo = a3;
}

- (BOOL)shouldSendAKClientInfoHeaders
{
  return self->_shouldSendAKClientInfoHeaders;
}

- (void)setShouldSendAKClientInfoHeaders:(BOOL)a3
{
  self->_shouldSendAKClientInfoHeaders = a3;
}

- (BOOL)shouldSendAKPRKRequestHeader
{
  return self->_shouldSendAKPRKRequestHeader;
}

- (void)setShouldSendAKPRKRequestHeader:(BOOL)a3
{
  self->_shouldSendAKPRKRequestHeader = a3;
}

- (BOOL)shouldSendDSIDHeader
{
  return self->_shouldSendDSIDHeader;
}

- (void)setShouldSendDSIDHeader:(BOOL)a3
{
  self->_shouldSendDSIDHeader = a3;
}

- (SSBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);
  objc_destroyWeak((id *)&self->_biometricSessionDelegate);
  objc_storeStrong((id *)&self->_biometricAuthenticationContext, 0);
  objc_storeStrong((id *)&self->_sapSession, 0);
  objc_storeStrong((id *)&self->_authenticatedDSID, 0);
}

@end
