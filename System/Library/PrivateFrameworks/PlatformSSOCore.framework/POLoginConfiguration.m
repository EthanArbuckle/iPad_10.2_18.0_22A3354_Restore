@implementation POLoginConfiguration

- (POLoginConfiguration)initWithClientID:(id)a3 issuer:(id)a4 tokenEndpointURL:(id)a5 jwksEndpointURL:(id)a6 audience:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  POLoginConfiguration *v17;
  id v18;
  id v19;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!objc_msgSend(v12, "length"))
  {
    v18 = __90__POLoginConfiguration_initWithClientID_issuer_tokenEndpointURL_jwksEndpointURL_audience___block_invoke();
LABEL_6:
    v17 = 0;
    goto LABEL_7;
  }
  if (!objc_msgSend(v13, "length"))
  {
    v19 = __90__POLoginConfiguration_initWithClientID_issuer_tokenEndpointURL_jwksEndpointURL_audience___block_invoke_54();
    goto LABEL_6;
  }
  self = (POLoginConfiguration *)-[POLoginConfiguration _initWithClientId:issuer:tokenEndpointURL:jwksEndpointURL:audience:](self, "_initWithClientId:issuer:tokenEndpointURL:jwksEndpointURL:audience:", v12, v13, v14, v15, v16);
  v17 = self;
LABEL_7:

  return v17;
}

id __90__POLoginConfiguration_initWithClientID_issuer_tokenEndpointURL_jwksEndpointURL_audience___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Client ID is missing"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginConfiguration();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __90__POLoginConfiguration_initWithClientID_issuer_tokenEndpointURL_jwksEndpointURL_audience___block_invoke_54()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Issuer is missing"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginConfiguration();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (id)_initWithClientId:(id)a3 issuer:(id)a4 tokenEndpointURL:(id)a5 jwksEndpointURL:(id)a6 audience:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  POLoginConfiguration *v17;
  POLoginConfiguration *v18;
  POLoginConfiguration *v19;
  NSString *additionalScopes;
  NSString *uniqueIdentifierClaimName;
  id v23;
  id v24;
  objc_super v25;

  v13 = a3;
  v14 = a4;
  v24 = a5;
  v15 = a6;
  v16 = a7;
  v17 = 0;
  if (v13 && v14 && v24 && v15)
  {
    v23 = v16;
    v25.receiver = self;
    v25.super_class = (Class)POLoginConfiguration;
    v18 = -[POLoginConfiguration init](&v25, sel_init);
    v19 = v18;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_clientID, a3);
      objc_storeStrong((id *)&v19->_issuer, a4);
      objc_storeStrong((id *)&v19->_tokenEndpointURL, a5);
      objc_storeStrong((id *)&v19->_jwksEndpointURL, a6);
      objc_storeStrong((id *)&v19->_audience, a7);
      additionalScopes = v19->_additionalScopes;
      v19->_additionalScopes = (NSString *)CFSTR("urn:apple:platformsso");

      uniqueIdentifierClaimName = v19->_uniqueIdentifierClaimName;
      v19->_uniqueIdentifierClaimName = (NSString *)CFSTR("sub");

    }
    self = v19;
    v17 = self;
    v16 = v23;
  }

  return v17;
}

+ (POLoginConfiguration)configurationWithOpenIdConfigurationURL:(id)a3 clientID:(id)a4 issuer:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  POLoginConfiguration *result;
  id v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v13, "URLByAppendingPathComponent:", CFSTR("/.well-known/openid-configuration"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "configurationWithOpenIdConfigurationURL:identityProviderURL:clientId:issuer:completion:", v15, v13, v12, v11, v10);

  return result;
}

+ (POLoginConfiguration)configurationWithOpenIdConfigurationURL:(id)a3 identityProviderURL:(id)a4 clientId:(id)a5 issuer:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  POLoginConfiguration *result;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(_QWORD *, void *, void *, void *);
  void *v27;
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  POSessionDelegate *v37;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(MEMORY[0x24BDD1858], "ephemeralSessionConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__3;
  v36 = __Block_byref_object_dispose__3;
  v37 = objc_alloc_init(POSessionDelegate);
  objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:delegate:delegateQueue:", v16, v33[5], 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16B0]), "initWithURL:cachePolicy:timeoutInterval:", v11, 4, 60.0);
  objc_msgSend(v18, "setHTTPMethod:", CFSTR("GET"));
  objc_msgSend(v18, "addValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Accept"));
  v24 = MEMORY[0x24BDAC760];
  v25 = 3221225472;
  v26 = __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke;
  v27 = &unk_251500990;
  v31 = &v32;
  v19 = v15;
  v30 = v19;
  v20 = v13;
  v28 = v20;
  v21 = v14;
  v29 = v21;
  objc_msgSend(v17, "dataTaskWithRequest:completionHandler:", v18, &v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "resume", v24, v25, v26, v27);

  _Block_object_dispose(&v32, 8);
  return result;
}

void __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  POLoginConfiguration *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  POLoginConfiguration *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  POLoginConfiguration *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1[7] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

  if (v9)
  {
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke_2;
    v41[3] = &unk_2514FF9D0;
    v42 = v9;
    __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke_2((uint64_t)v41);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(a1[6] + 16))();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v8;
      if (objc_msgSend(v13, "statusCode") >= 200 && objc_msgSend(v13, "statusCode") < 300)
      {
        PO_LOG_POLoginConfiguration();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke_cold_1();

        v38 = 0;
        objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 16, &v38);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v38;
        v15 = v18;
        if (!v17 || v18)
        {
          v36[0] = MEMORY[0x24BDAC760];
          v36[1] = 3221225472;
          v36[2] = __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke_88;
          v36[3] = &unk_2514FF9D0;
          v37 = v18;
          __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke_88((uint64_t)v36);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(void))(a1[6] + 16))();

          v28 = v37;
        }
        else
        {
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("token_endpoint"));
          v19 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("jwks_uri"));
          v20 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("issuer"));
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = [POLoginConfiguration alloc];
          v34 = a1[4];
          v35 = v22;
          v23 = a1[5];
          v30 = (void *)v21;
          if (!v23)
            v23 = v21;
          v32 = (void *)v19;
          v33 = v23;
          objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v19);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (void *)v20;
          objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v20);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[POLoginConfiguration initWithClientID:issuer:tokenEndpointURL:jwksEndpointURL:audience:](v35, "initWithClientID:issuer:tokenEndpointURL:jwksEndpointURL:audience:", v34, v33, v24, v25, 0);

          if (v26)
          {
            (*(void (**)(void))(a1[6] + 16))();
          }
          else
          {
            __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke_99();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(void))(a1[6] + 16))();

          }
          v28 = v32;

        }
      }
      else
      {
        v39[0] = MEMORY[0x24BDAC760];
        v39[1] = 3221225472;
        v39[2] = __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke_82;
        v39[3] = &unk_2514FF9D0;
        v40 = v13;
        __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke_82((uint64_t)v39);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(a1[6] + 16))();

        v15 = v40;
      }

    }
    else
    {
      __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke_78();
      v13 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(a1[6] + 16))();
    }

  }
}

id __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1009, *(_QWORD *)(a1 + 32), CFSTR("failed to retrieve openid-configuration."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginConfiguration();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v1;
}

id __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke_78()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1009, CFSTR("Not a HTTP response when retrieving openid-configuration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginConfiguration();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke_82(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1009, CFSTR("Not a HTTP success response when retrieving openid-configuration."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginConfiguration();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke_82_cold_1((uint64_t)v2, a1, v3);

  return v2;
}

id __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke_88(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1008, *(_QWORD *)(a1 + 32), CFSTR("Failed to parse openid-configuration response."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginConfiguration();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v1;
}

id __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke_99()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Failed to create login configuration when retrieving openid-configuration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginConfiguration();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (NSURL)nonceEndpointURL
{
  NSURL *nonceEndpointURL;

  nonceEndpointURL = self->_nonceEndpointURL;
  if (!nonceEndpointURL)
    nonceEndpointURL = self->_tokenEndpointURL;
  return nonceEndpointURL;
}

- (BOOL)setCustomAssertionRequestHeaderClaims:(id)a3 returningError:(id *)a4
{
  id v6;
  int v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v6);
  if (v7)
  {
    v8 = (id)objc_msgSend(v6, "copy");
    -[POLoginConfiguration setCustomAssertionRequestHeaderClaims:](self, "setCustomAssertionRequestHeaderClaims:", v8);
  }
  else
  {
    __77__POLoginConfiguration_setCustomAssertionRequestHeaderClaims_returningError___block_invoke();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9;
    if (a4)
    {
      v8 = objc_retainAutorelease(v9);
      *a4 = v8;
    }
  }

  return v7;
}

id __77__POLoginConfiguration_setCustomAssertionRequestHeaderClaims_returningError___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Assertion request header claims are not valid JSON."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginConfiguration();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (BOOL)setCustomAssertionRequestBodyClaims:(id)a3 returningError:(id *)a4
{
  id v6;
  int v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v6);
  if (v7)
  {
    v8 = (id)objc_msgSend(v6, "copy");
    -[POLoginConfiguration setCustomAssertionRequestBodyClaims:](self, "setCustomAssertionRequestBodyClaims:", v8);
  }
  else
  {
    __75__POLoginConfiguration_setCustomAssertionRequestBodyClaims_returningError___block_invoke();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9;
    if (a4)
    {
      v8 = objc_retainAutorelease(v9);
      *a4 = v8;
    }
  }

  return v7;
}

id __75__POLoginConfiguration_setCustomAssertionRequestBodyClaims_returningError___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Assertion request body claims are not valid JSON."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginConfiguration();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (BOOL)setCustomLoginRequestHeaderClaims:(id)a3 returningError:(id *)a4
{
  id v6;
  int v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v6);
  if (v7)
  {
    v8 = (id)objc_msgSend(v6, "copy");
    -[POLoginConfiguration setCustomLoginRequestHeaderClaims:](self, "setCustomLoginRequestHeaderClaims:", v8);
  }
  else
  {
    __73__POLoginConfiguration_setCustomLoginRequestHeaderClaims_returningError___block_invoke();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9;
    if (a4)
    {
      v8 = objc_retainAutorelease(v9);
      *a4 = v8;
    }
  }

  return v7;
}

id __73__POLoginConfiguration_setCustomLoginRequestHeaderClaims_returningError___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Login request header claims are not valid JSON."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginConfiguration();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (BOOL)setCustomLoginRequestBodyClaims:(id)a3 returningError:(id *)a4
{
  id v6;
  int v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v6);
  if (v7)
  {
    v8 = (id)objc_msgSend(v6, "copy");
    -[POLoginConfiguration setCustomLoginRequestBodyClaims:](self, "setCustomLoginRequestBodyClaims:", v8);
  }
  else
  {
    __71__POLoginConfiguration_setCustomLoginRequestBodyClaims_returningError___block_invoke();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9;
    if (a4)
    {
      v8 = objc_retainAutorelease(v9);
      *a4 = v8;
    }
  }

  return v7;
}

id __71__POLoginConfiguration_setCustomLoginRequestBodyClaims_returningError___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Login request body claims are not valid JSON."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginConfiguration();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (NSString)uniqueIdentifierClaimName
{
  __CFString *uniqueIdentifierClaimName;

  if (-[NSString length](self->_uniqueIdentifierClaimName, "length"))
    uniqueIdentifierClaimName = (__CFString *)self->_uniqueIdentifierClaimName;
  else
    uniqueIdentifierClaimName = CFSTR("sub");
  return (NSString *)uniqueIdentifierClaimName;
}

- (NSURL)refreshEndpointURL
{
  return self->_refreshEndpointURL;
}

- (BOOL)setCustomRefreshRequestHeaderClaims:(id)a3 returningError:(id *)a4
{
  id v6;
  int v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v6);
  if (v7)
  {
    v8 = (id)objc_msgSend(v6, "copy");
    -[POLoginConfiguration setCustomRefreshRequestHeaderClaims:](self, "setCustomRefreshRequestHeaderClaims:", v8);
  }
  else
  {
    __75__POLoginConfiguration_setCustomRefreshRequestHeaderClaims_returningError___block_invoke();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9;
    if (a4)
    {
      v8 = objc_retainAutorelease(v9);
      *a4 = v8;
    }
  }

  return v7;
}

id __75__POLoginConfiguration_setCustomRefreshRequestHeaderClaims_returningError___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Refresh request header claims are not valid JSON."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginConfiguration();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (BOOL)setCustomRefreshRequestBodyClaims:(id)a3 returningError:(id *)a4
{
  id v6;
  int v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v6);
  if (v7)
  {
    v8 = (id)objc_msgSend(v6, "copy");
    -[POLoginConfiguration setCustomRefreshRequestBodyClaims:](self, "setCustomRefreshRequestBodyClaims:", v8);
  }
  else
  {
    __73__POLoginConfiguration_setCustomRefreshRequestBodyClaims_returningError___block_invoke();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9;
    if (a4)
    {
      v8 = objc_retainAutorelease(v9);
      *a4 = v8;
    }
  }

  return v7;
}

id __73__POLoginConfiguration_setCustomRefreshRequestBodyClaims_returningError___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Refresh request body header claims are not valid JSON."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginConfiguration();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (__SecKey)loginRequestEncryptionPublicKey
{
  if (self->__loginRequestEncryptionPublicKeyData)
    return +[POSecKeyHelper ephemeralPublicKeyForData:](POSecKeyHelper, "ephemeralPublicKeyForData:");
  else
    return 0;
}

- (void)setLoginRequestEncryptionPublicKey:(__SecKey *)a3
{
  NSData *v4;
  NSData *loginRequestEncryptionPublicKeyData;

  if (a3)
  {
    +[POSecKeyHelper dataForEphemeralKey:](POSecKeyHelper, "dataForEphemeralKey:");
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    loginRequestEncryptionPublicKeyData = self->__loginRequestEncryptionPublicKeyData;
    self->__loginRequestEncryptionPublicKeyData = v4;
  }
  else
  {
    loginRequestEncryptionPublicKeyData = self->__loginRequestEncryptionPublicKeyData;
    self->__loginRequestEncryptionPublicKeyData = 0;
  }

}

- (NSURL)keyEndpointURL
{
  NSURL *keyEndpointURL;

  keyEndpointURL = self->_keyEndpointURL;
  if (!keyEndpointURL)
    keyEndpointURL = self->_tokenEndpointURL;
  return keyEndpointURL;
}

- (BOOL)setCustomKeyExchangeRequestHeaderClaims:(id)a3 returningError:(id *)a4
{
  id v6;
  int v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v6);
  if (v7)
  {
    v8 = (id)objc_msgSend(v6, "copy");
    -[POLoginConfiguration setCustomKeyExchangeRequestHeaderClaims:](self, "setCustomKeyExchangeRequestHeaderClaims:", v8);
  }
  else
  {
    __79__POLoginConfiguration_setCustomKeyExchangeRequestHeaderClaims_returningError___block_invoke();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9;
    if (a4)
    {
      v8 = objc_retainAutorelease(v9);
      *a4 = v8;
    }
  }

  return v7;
}

id __79__POLoginConfiguration_setCustomKeyExchangeRequestHeaderClaims_returningError___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Key exchange request header claims are not valid JSON."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginConfiguration();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (BOOL)setCustomKeyExchangeRequestBodyClaims:(id)a3 returningError:(id *)a4
{
  id v6;
  int v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v6);
  if (v7)
  {
    v8 = (id)objc_msgSend(v6, "copy");
    -[POLoginConfiguration setCustomKeyExchangeRequestBodyClaims:](self, "setCustomKeyExchangeRequestBodyClaims:", v8);
  }
  else
  {
    __77__POLoginConfiguration_setCustomKeyExchangeRequestBodyClaims_returningError___block_invoke();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9;
    if (a4)
    {
      v8 = objc_retainAutorelease(v9);
      *a4 = v8;
    }
  }

  return v7;
}

id __77__POLoginConfiguration_setCustomKeyExchangeRequestBodyClaims_returningError___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Key exchange request body claims are not valid JSON."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginConfiguration();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (BOOL)setCustomKeyRequestHeaderClaims:(id)a3 returningError:(id *)a4
{
  id v6;
  int v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v6);
  if (v7)
  {
    v8 = (id)objc_msgSend(v6, "copy");
    -[POLoginConfiguration setCustomKeyRequestHeaderClaims:](self, "setCustomKeyRequestHeaderClaims:", v8);
  }
  else
  {
    __71__POLoginConfiguration_setCustomKeyRequestHeaderClaims_returningError___block_invoke();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9;
    if (a4)
    {
      v8 = objc_retainAutorelease(v9);
      *a4 = v8;
    }
  }

  return v7;
}

id __71__POLoginConfiguration_setCustomKeyRequestHeaderClaims_returningError___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Key request header claims are not valid JSON."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginConfiguration();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (BOOL)setCustomKeyRequestBodyClaims:(id)a3 returningError:(id *)a4
{
  id v6;
  int v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v6);
  if (v7)
  {
    v8 = (id)objc_msgSend(v6, "copy");
    -[POLoginConfiguration setCustomKeyRequestBodyClaims:](self, "setCustomKeyRequestBodyClaims:", v8);
  }
  else
  {
    __69__POLoginConfiguration_setCustomKeyRequestBodyClaims_returningError___block_invoke();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9;
    if (a4)
    {
      v8 = objc_retainAutorelease(v9);
      *a4 = v8;
    }
  }

  return v7;
}

id __69__POLoginConfiguration_setCustomKeyRequestBodyClaims_returningError___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Key request body claims are not valid JSON."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginConfiguration();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (BOOL)setCustomDecryptionRequestBodyClaims:(id)a3 returningError:(id *)a4
{
  return 0;
}

- (BOOL)setCustomDecryptionRequestHeaderClaims:(id)a3 returningError:(id *)a4
{
  return 0;
}

- (__SecKey)hpkeAuthPublicKey
{
  __SecKey *result;
  unint64_t v4;
  NSData *hpkeAuthPublicKeyData;

  result = (__SecKey *)self->__hpkeAuthPublicKeyData;
  if (result)
  {
    v4 = -[__SecKey length](result, "length");
    hpkeAuthPublicKeyData = self->__hpkeAuthPublicKeyData;
    if (v4 > 0x40)
      return +[POSecKeyHelper ephemeralPublicKeyForData:](POSecKeyHelper, "ephemeralPublicKeyForData:", hpkeAuthPublicKeyData);
    else
      return +[POSecKeyHelper ephemeralX25529PublicKeyForData:](POSecKeyHelper, "ephemeralX25529PublicKeyForData:", hpkeAuthPublicKeyData);
  }
  return result;
}

- (void)setHpkeAuthPublicKey:(__SecKey *)a3
{
  NSData *v4;
  NSData *hpkeAuthPublicKeyData;

  if (a3)
  {
    +[POSecKeyHelper dataForEphemeralKey:](POSecKeyHelper, "dataForEphemeralKey:");
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    hpkeAuthPublicKeyData = self->__hpkeAuthPublicKeyData;
    self->__hpkeAuthPublicKeyData = v4;
  }
  else
  {
    hpkeAuthPublicKeyData = self->__hpkeAuthPublicKeyData;
    self->__hpkeAuthPublicKeyData = 0;
  }

}

- (id)dataRepresentation
{
  return -[POLoginConfiguration dataRepresentationForDisplay:](self, "dataRepresentationForDisplay:", 0);
}

- (id)dataRepresentationForDisplay:(BOOL)a3
{
  id v4;
  NSString *clientID;
  void *v6;
  NSString *issuer;
  void *v8;
  NSString *audience;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *accountDisplayName;
  void *v16;
  NSString *invalidCredentialPredicate;
  void *v18;
  id v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  NSData *deviceContext;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSString *nonceResponseKeypath;
  void *v36;
  NSString *serverNonceClaimName;
  void *v38;
  NSArray *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSDictionary *customAssertionRequestHeaderClaims;
  void *v49;
  NSDictionary *customAssertionRequestBodyClaims;
  void *v51;
  NSString *additionalScopes;
  void *v53;
  NSString *additionalAuthorizationScopes;
  void *v55;
  void *v56;
  void *v57;
  NSString *previousRefreshTokenClaimName;
  void *v59;
  NSString *customRequestJWTParameterName;
  void *v61;
  NSArray *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t k;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  NSDictionary *customLoginRequestHeaderClaims;
  void *v72;
  NSDictionary *customLoginRequestBodyClaims;
  void *v74;
  NSString *uniqueIdentifierClaimName;
  void *v76;
  NSString *groupRequestClaimName;
  void *v78;
  NSString *groupResponseClaimName;
  void *v80;
  void *v81;
  void *v82;
  NSArray *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t m;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  NSDictionary *customRefreshRequestHeaderClaims;
  void *v93;
  NSDictionary *customRefreshRequestBodyClaims;
  void *v95;
  id v96;
  NSArray *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t n;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  NSString *federationRequestURN;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  NSString *federationMexURLKeypath;
  void *v113;
  NSString *federationPredicate;
  void *v115;
  id v116;
  NSArray *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t ii;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  NSData *loginRequestEncryptionPublicKeyData;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  id v139;
  NSArray *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t jj;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  NSDictionary *customKeyExchangeRequestHeaderClaims;
  void *v150;
  NSDictionary *customKeyExchangeRequestBodyClaims;
  void *v152;
  id v153;
  NSArray *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t kk;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  NSDictionary *customKeyRequestHeaderClaims;
  void *v164;
  NSDictionary *customKeyRequestBodyClaims;
  void *v166;
  NSData *hpkePsk;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  id v174;
  void *v175;
  void *v176;
  void *v177;
  id v178;
  void *v179;
  id v180;
  id v181;
  NSObject *v182;
  void *v184;
  _BOOL4 v185;
  POLoginConfiguration *v186;
  void *v187;
  id v188;
  id v189;
  id v190;
  _QWORD v191[4];
  id v192;
  id v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  _BYTE v226[128];
  _BYTE v227[128];
  _BYTE v228[128];
  _BYTE v229[128];
  _BYTE v230[128];
  _BYTE v231[128];
  _BYTE v232[128];
  _BYTE v233[128];
  uint64_t v234;

  v185 = a3;
  v234 = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  clientID = self->_clientID;
  NSStringFromSelector(sel_clientID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", clientID, v6);

  issuer = self->_issuer;
  NSStringFromSelector(sel_issuer);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", issuer, v8);

  audience = self->_audience;
  NSStringFromSelector(sel_audience);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", audience, v10);

  -[NSURL absoluteString](self->_tokenEndpointURL, "absoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_tokenEndpointURL);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v12);

  -[NSURL absoluteString](self->_jwksEndpointURL, "absoluteString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_jwksEndpointURL);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v14);

  accountDisplayName = self->_accountDisplayName;
  NSStringFromSelector(sel_accountDisplayName);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", accountDisplayName, v16);

  invalidCredentialPredicate = self->_invalidCredentialPredicate;
  NSStringFromSelector(sel_invalidCredentialPredicate);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v187 = v4;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", invalidCredentialPredicate, v18);

  v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v222 = 0u;
  v223 = 0u;
  v224 = 0u;
  v225 = 0u;
  v20 = self->_jwksTrustedRootCertificates;
  v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v222, v233, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v223;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v223 != v23)
          objc_enumerationMutation(v20);
        +[POSecKeyHelper dataForCertificate:](POSecKeyHelper, "dataForCertificate:", *(id *)(*((_QWORD *)&v222 + 1) + 8 * i));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "psso_base64URLEncodedString");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v26);

      }
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v222, v233, 16);
    }
    while (v22);
  }

  if (objc_msgSend(v19, "count"))
  {
    NSStringFromSelector(sel_jwksTrustedRootCertificates);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v187, "setObject:forKeyedSubscript:", v19, v27);

  }
  deviceContext = self->_deviceContext;
  if (v185)
    -[NSData psso_sha256HashString](deviceContext, "psso_sha256HashString");
  else
    -[NSData psso_base64URLEncodedString](deviceContext, "psso_base64URLEncodedString");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_deviceContext);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", v29, v30);

  v184 = v19;
  if (v185)
    +[POConstantCoreUtil stringForSEPBiometricPolicy:](POConstantCoreUtil, "stringForSEPBiometricPolicy:", self->_userSEPKeyBiometricPolicy);
  else
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_userSEPKeyBiometricPolicy);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_userSEPKeyBiometricPolicy);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", v31, v32);

  -[NSURL absoluteString](self->_nonceEndpointURL, "absoluteString");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_nonceEndpointURL);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", v33, v34);

  nonceResponseKeypath = self->_nonceResponseKeypath;
  NSStringFromSelector(sel_nonceResponseKeypath);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", nonceResponseKeypath, v36);

  serverNonceClaimName = self->_serverNonceClaimName;
  NSStringFromSelector(sel_serverNonceClaimName);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", serverNonceClaimName, v38);

  v190 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v218 = 0u;
  v219 = 0u;
  v220 = 0u;
  v221 = 0u;
  v39 = self->_customNonceRequestValues;
  v40 = -[NSArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v218, v232, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v219;
    do
    {
      for (j = 0; j != v41; ++j)
      {
        if (*(_QWORD *)v219 != v42)
          objc_enumerationMutation(v39);
        v44 = *(void **)(*((_QWORD *)&v218 + 1) + 8 * j);
        objc_msgSend(v44, "value");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "name");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v190, "setObject:forKeyedSubscript:", v45, v46);

      }
      v41 = -[NSArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v218, v232, 16);
    }
    while (v41);
  }

  if (objc_msgSend(v190, "count"))
  {
    NSStringFromSelector(sel_customNonceRequestValues);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v187, "setObject:forKeyedSubscript:", v190, v47);

  }
  customAssertionRequestHeaderClaims = self->_customAssertionRequestHeaderClaims;
  NSStringFromSelector(sel_customAssertionRequestHeaderClaims);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", customAssertionRequestHeaderClaims, v49);

  customAssertionRequestBodyClaims = self->_customAssertionRequestBodyClaims;
  NSStringFromSelector(sel_customAssertionRequestBodyClaims);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", customAssertionRequestBodyClaims, v51);

  additionalScopes = self->_additionalScopes;
  NSStringFromSelector(sel_additionalScopes);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", additionalScopes, v53);

  additionalAuthorizationScopes = self->_additionalAuthorizationScopes;
  NSStringFromSelector(sel_additionalAuthorizationScopes);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", additionalAuthorizationScopes, v55);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_includePreviousRefreshTokenInLoginRequest);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_includePreviousRefreshTokenInLoginRequest);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", v56, v57);

  previousRefreshTokenClaimName = self->_previousRefreshTokenClaimName;
  NSStringFromSelector(sel_previousRefreshTokenClaimName);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", previousRefreshTokenClaimName, v59);

  customRequestJWTParameterName = self->_customRequestJWTParameterName;
  NSStringFromSelector(sel_customRequestJWTParameterName);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", customRequestJWTParameterName, v61);

  v189 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v214 = 0u;
  v215 = 0u;
  v216 = 0u;
  v217 = 0u;
  v62 = self->_customLoginRequestValues;
  v63 = -[NSArray countByEnumeratingWithState:objects:count:](v62, "countByEnumeratingWithState:objects:count:", &v214, v231, 16);
  if (v63)
  {
    v64 = v63;
    v65 = *(_QWORD *)v215;
    do
    {
      for (k = 0; k != v64; ++k)
      {
        if (*(_QWORD *)v215 != v65)
          objc_enumerationMutation(v62);
        v67 = *(void **)(*((_QWORD *)&v214 + 1) + 8 * k);
        objc_msgSend(v67, "value");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "name");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v189, "setObject:forKeyedSubscript:", v68, v69);

      }
      v64 = -[NSArray countByEnumeratingWithState:objects:count:](v62, "countByEnumeratingWithState:objects:count:", &v214, v231, 16);
    }
    while (v64);
  }

  if (objc_msgSend(v189, "count"))
  {
    NSStringFromSelector(sel_customLoginRequestValues);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v187, "setObject:forKeyedSubscript:", v189, v70);

  }
  customLoginRequestHeaderClaims = self->_customLoginRequestHeaderClaims;
  NSStringFromSelector(sel_customLoginRequestHeaderClaims);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", customLoginRequestHeaderClaims, v72);

  customLoginRequestBodyClaims = self->_customLoginRequestBodyClaims;
  NSStringFromSelector(sel_customLoginRequestBodyClaims);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", customLoginRequestBodyClaims, v74);

  uniqueIdentifierClaimName = self->_uniqueIdentifierClaimName;
  NSStringFromSelector(sel_uniqueIdentifierClaimName);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", uniqueIdentifierClaimName, v76);

  groupRequestClaimName = self->_groupRequestClaimName;
  NSStringFromSelector(sel_groupRequestClaimName);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", groupRequestClaimName, v78);

  groupResponseClaimName = self->_groupResponseClaimName;
  NSStringFromSelector(sel_groupResponseClaimName);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", groupResponseClaimName, v80);

  -[NSURL absoluteString](self->_refreshEndpointURL, "absoluteString");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_refreshEndpointURL);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", v81, v82);

  v188 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v210 = 0u;
  v211 = 0u;
  v212 = 0u;
  v213 = 0u;
  v186 = self;
  v83 = self->_customRefreshRequestValues;
  v84 = -[NSArray countByEnumeratingWithState:objects:count:](v83, "countByEnumeratingWithState:objects:count:", &v210, v230, 16);
  if (v84)
  {
    v85 = v84;
    v86 = *(_QWORD *)v211;
    do
    {
      for (m = 0; m != v85; ++m)
      {
        if (*(_QWORD *)v211 != v86)
          objc_enumerationMutation(v83);
        v88 = *(void **)(*((_QWORD *)&v210 + 1) + 8 * m);
        objc_msgSend(v88, "value");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "name");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v188, "setObject:forKeyedSubscript:", v89, v90);

      }
      v85 = -[NSArray countByEnumeratingWithState:objects:count:](v83, "countByEnumeratingWithState:objects:count:", &v210, v230, 16);
    }
    while (v85);
  }

  if (objc_msgSend(v188, "count"))
  {
    NSStringFromSelector(sel_customRefreshRequestValues);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v187, "setObject:forKeyedSubscript:", v188, v91);

  }
  customRefreshRequestHeaderClaims = v186->_customRefreshRequestHeaderClaims;
  NSStringFromSelector(sel_customRefreshRequestHeaderClaims);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", customRefreshRequestHeaderClaims, v93);

  customRefreshRequestBodyClaims = v186->_customRefreshRequestBodyClaims;
  NSStringFromSelector(sel_customRefreshRequestBodyClaims);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", customRefreshRequestBodyClaims, v95);

  v96 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v206 = 0u;
  v207 = 0u;
  v208 = 0u;
  v209 = 0u;
  v97 = v186->_kerberosTicketMappings;
  v98 = -[NSArray countByEnumeratingWithState:objects:count:](v97, "countByEnumeratingWithState:objects:count:", &v206, v229, 16);
  if (v98)
  {
    v99 = v98;
    v100 = *(_QWORD *)v207;
    do
    {
      for (n = 0; n != v99; ++n)
      {
        if (*(_QWORD *)v207 != v100)
          objc_enumerationMutation(v97);
        objc_msgSend(*(id *)(*((_QWORD *)&v206 + 1) + 8 * n), "dictionaryRepresentation");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "addObject:", v102);

      }
      v99 = -[NSArray countByEnumeratingWithState:objects:count:](v97, "countByEnumeratingWithState:objects:count:", &v206, v229, 16);
    }
    while (v99);
  }

  if (objc_msgSend(v96, "count"))
  {
    NSStringFromSelector(sel_kerberosTicketMappings);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v187, "setObject:forKeyedSubscript:", v96, v103);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v186->_federationType);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_federationType);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", v104, v105);

  federationRequestURN = v186->_federationRequestURN;
  NSStringFromSelector(sel_federationRequestURN);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", federationRequestURN, v107);

  -[NSURL absoluteString](v186->_federationMexURL, "absoluteString");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_federationMexURL);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", v108, v109);

  -[NSURL absoluteString](v186->_federationUserPreauthenticationURL, "absoluteString");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_federationUserPreauthenticationURL);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", v110, v111);

  federationMexURLKeypath = v186->_federationMexURLKeypath;
  NSStringFromSelector(sel_federationMexURLKeypath);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", federationMexURLKeypath, v113);

  federationPredicate = v186->_federationPredicate;
  NSStringFromSelector(sel_federationPredicate);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", federationPredicate, v115);

  v116 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v202 = 0u;
  v203 = 0u;
  v204 = 0u;
  v205 = 0u;
  v117 = v186->_customFederationUserPreauthenticationRequestValues;
  v118 = -[NSArray countByEnumeratingWithState:objects:count:](v117, "countByEnumeratingWithState:objects:count:", &v202, v228, 16);
  if (v118)
  {
    v119 = v118;
    v120 = *(_QWORD *)v203;
    do
    {
      for (ii = 0; ii != v119; ++ii)
      {
        if (*(_QWORD *)v203 != v120)
          objc_enumerationMutation(v117);
        v122 = *(void **)(*((_QWORD *)&v202 + 1) + 8 * ii);
        objc_msgSend(v122, "value");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v122, "name");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "setObject:forKeyedSubscript:", v123, v124);

      }
      v119 = -[NSArray countByEnumeratingWithState:objects:count:](v117, "countByEnumeratingWithState:objects:count:", &v202, v228, 16);
    }
    while (v119);
  }

  if (objc_msgSend(v116, "count"))
  {
    NSStringFromSelector(sel_customFederationUserPreauthenticationRequestValues);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v187, "setObject:forKeyedSubscript:", v116, v125);

  }
  loginRequestEncryptionPublicKeyData = v186->__loginRequestEncryptionPublicKeyData;
  if (v185)
    -[NSData psso_sha256HashString](loginRequestEncryptionPublicKeyData, "psso_sha256HashString");
  else
    -[NSData psso_base64URLEncodedString](loginRequestEncryptionPublicKeyData, "psso_base64URLEncodedString");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_loginRequestEncryptionPublicKey);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", v127, v128);

  -[POLoginConfiguration loginRequestEncryptionAlgorithm](v186, "loginRequestEncryptionAlgorithm");
  if (v185)
  {
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    +[POConstantCoreUtil stringForEncryptionAlgorithm:](POConstantCoreUtil, "stringForEncryptionAlgorithm:", v127);
  }
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_loginRequestEncryptionAlgorithm);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", v129, v130);

  if (v185)
  {

    -[NSData psso_sha256HashString](v186->_loginRequestHpkePsk, "psso_sha256HashString");
  }
  else
  {
    -[NSData psso_base64URLEncodedString](v186->_loginRequestHpkePsk, "psso_base64URLEncodedString");
  }
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_loginRequestHpkePsk);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", v131, v132);

  -[NSData psso_base64URLEncodedString](v186->_loginRequestHpkePsk_id, "psso_base64URLEncodedString");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_loginRequestHpkePsk_id);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", v133, v134);

  -[NSData psso_base64URLEncodedString](v186->_loginRequestEncryptionAPVPrefix, "psso_base64URLEncodedString");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_loginRequestEncryptionAPVPrefix);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", v135, v136);

  -[NSURL absoluteString](v186->_keyEndpointURL, "absoluteString");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_keyEndpointURL);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", v137, v138);

  v139 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v198 = 0u;
  v199 = 0u;
  v200 = 0u;
  v201 = 0u;
  v140 = v186->_customKeyExchangeRequestValues;
  v141 = -[NSArray countByEnumeratingWithState:objects:count:](v140, "countByEnumeratingWithState:objects:count:", &v198, v227, 16);
  if (v141)
  {
    v142 = v141;
    v143 = *(_QWORD *)v199;
    do
    {
      for (jj = 0; jj != v142; ++jj)
      {
        if (*(_QWORD *)v199 != v143)
          objc_enumerationMutation(v140);
        v145 = *(void **)(*((_QWORD *)&v198 + 1) + 8 * jj);
        objc_msgSend(v145, "value");
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v145, "name");
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v139, "setObject:forKeyedSubscript:", v146, v147);

      }
      v142 = -[NSArray countByEnumeratingWithState:objects:count:](v140, "countByEnumeratingWithState:objects:count:", &v198, v227, 16);
    }
    while (v142);
  }

  if (objc_msgSend(v139, "count"))
  {
    NSStringFromSelector(sel_customKeyExchangeRequestValues);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v187, "setObject:forKeyedSubscript:", v139, v148);

  }
  customKeyExchangeRequestHeaderClaims = v186->_customKeyExchangeRequestHeaderClaims;
  NSStringFromSelector(sel_customKeyExchangeRequestHeaderClaims);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", customKeyExchangeRequestHeaderClaims, v150);

  customKeyExchangeRequestBodyClaims = v186->_customKeyExchangeRequestBodyClaims;
  NSStringFromSelector(sel_customKeyExchangeRequestBodyClaims);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", customKeyExchangeRequestBodyClaims, v152);

  v153 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v194 = 0u;
  v195 = 0u;
  v196 = 0u;
  v197 = 0u;
  v154 = v186->_customKeyRequestValues;
  v155 = -[NSArray countByEnumeratingWithState:objects:count:](v154, "countByEnumeratingWithState:objects:count:", &v194, v226, 16);
  if (v155)
  {
    v156 = v155;
    v157 = *(_QWORD *)v195;
    do
    {
      for (kk = 0; kk != v156; ++kk)
      {
        if (*(_QWORD *)v195 != v157)
          objc_enumerationMutation(v154);
        v159 = *(void **)(*((_QWORD *)&v194 + 1) + 8 * kk);
        objc_msgSend(v159, "value");
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v159, "name");
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v153, "setObject:forKeyedSubscript:", v160, v161);

      }
      v156 = -[NSArray countByEnumeratingWithState:objects:count:](v154, "countByEnumeratingWithState:objects:count:", &v194, v226, 16);
    }
    while (v156);
  }

  if (objc_msgSend(v153, "count"))
  {
    NSStringFromSelector(sel_customKeyRequestValues);
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v187, "setObject:forKeyedSubscript:", v153, v162);

  }
  customKeyRequestHeaderClaims = v186->_customKeyRequestHeaderClaims;
  NSStringFromSelector(sel_customKeyRequestHeaderClaims);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", customKeyRequestHeaderClaims, v164);

  customKeyRequestBodyClaims = v186->_customKeyRequestBodyClaims;
  NSStringFromSelector(sel_customKeyRequestBodyClaims);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", customKeyRequestBodyClaims, v166);

  hpkePsk = v186->_hpkePsk;
  if (v185)
    -[NSData psso_sha256HashString](hpkePsk, "psso_sha256HashString");
  else
    -[NSData psso_base64URLEncodedString](hpkePsk, "psso_base64URLEncodedString");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_hpkePsk);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", v168, v169);

  -[NSData psso_base64URLEncodedString](v186->_hpkePsk_id, "psso_base64URLEncodedString");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_hpkePsk_id);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", v170, v171);

  if (v185)
    -[NSData psso_sha256HashString](v186->__hpkeAuthPublicKeyData, "psso_sha256HashString");
  else
    -[NSData psso_base64URLEncodedString](v186->__hpkeAuthPublicKeyData, "psso_base64URLEncodedString");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_hpkeAuthPublicKey);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", v172, v173);

  v174 = objc_alloc_init(MEMORY[0x24BDD15D0]);
  objc_msgSend(v174, "setFormatOptions:", 1907);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v174, "stringFromDate:", v175);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setObject:forKeyedSubscript:", v176, CFSTR("created"));

  v193 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v187, 11, &v193);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v178 = v193;
  v179 = v178;
  if (v178)
  {
    v191[0] = MEMORY[0x24BDAC760];
    v191[1] = 3221225472;
    v191[2] = __53__POLoginConfiguration_dataRepresentationForDisplay___block_invoke;
    v191[3] = &unk_2514FF9D0;
    v192 = v178;
    v180 = __53__POLoginConfiguration_dataRepresentationForDisplay___block_invoke((uint64_t)v191);

    v181 = 0;
  }
  else
  {
    PO_LOG_POLoginConfiguration();
    v182 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v182, OS_LOG_TYPE_DEBUG))
      -[POLoginConfiguration dataRepresentationForDisplay:].cold.1();

    v181 = v177;
  }

  return v181;
}

id __53__POLoginConfiguration_dataRepresentationForDisplay___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Error serializing login config."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginConfiguration();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v1;
}

- (POLoginConfiguration)initWithData:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  POLoginConfiguration *v8;
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
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  uint64_t v41;
  id v42;
  void *v43;
  __SecCertificate *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  uint64_t v70;
  id v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  id v118;
  void *v119;
  void *v120;
  id v121;
  void *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  uint64_t v126;
  void *v127;
  id v128;
  void *v129;
  void *v130;
  id v131;
  void *v132;
  void *v133;
  void *v134;
  uint64_t v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  uint64_t v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  uint64_t v149;
  void *v150;
  void *v151;
  uint64_t v152;
  void *v153;
  void *v154;
  uint64_t v155;
  void *v156;
  id v157;
  void *v158;
  void *v159;
  id v160;
  void *v161;
  void *v162;
  id v163;
  void *v164;
  void *v165;
  uint64_t v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  uint64_t v171;
  void *v172;
  id v173;
  void *v174;
  void *v175;
  id v176;
  void *v177;
  void *v178;
  uint64_t v179;
  void *v180;
  void *v181;
  void *v182;
  id v183;
  void *v184;
  void *v185;
  uint64_t v186;
  void *v187;
  void *v188;
  void *v189;
  id v190;
  void *v191;
  void *v192;
  uint64_t v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  uint64_t v200;
  void *v201;
  id v202;
  void *v203;
  void *v204;
  id v205;
  void *v206;
  uint64_t v207;
  void *v208;
  void *v209;
  uint64_t v210;
  void *v211;
  id v212;
  void *v213;
  void *v214;
  id v215;
  void *v216;
  uint64_t v217;
  void *v218;
  void *v219;
  uint64_t v220;
  void *v221;
  void *v222;
  void *v223;
  id v224;
  void *v225;
  void *v226;
  uint64_t v227;
  void *v228;
  void *v229;
  void *v230;
  id v231;
  void *v232;
  void *v233;
  uint64_t v234;
  void *v235;
  void *v236;
  void *v237;
  id v238;
  void *v239;
  void *v240;
  uint64_t v241;
  void *v242;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  _QWORD v256[4];
  id v257;
  _QWORD v258[4];
  id v259;
  _QWORD v260[4];
  id v261;
  _QWORD v262[4];
  id v263;
  _QWORD v264[4];
  id v265;
  _QWORD v266[4];
  id v267;
  _QWORD v268[4];
  id v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  _QWORD v274[4];
  id v275;
  id v276;
  _BYTE v277[128];
  uint64_t v278;

  v278 = *MEMORY[0x24BDAC8D0];
  v276 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 16, &v276);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v276;
  v6 = v5;
  if (v5)
  {
    v274[0] = MEMORY[0x24BDAC760];
    v274[1] = 3221225472;
    v274[2] = __37__POLoginConfiguration_initWithData___block_invoke;
    v274[3] = &unk_2514FF9D0;
    v275 = v5;
    v7 = __37__POLoginConfiguration_initWithData___block_invoke((uint64_t)v274);
    v8 = 0;
    v9 = v275;
  }
  else
  {
    NSStringFromSelector(sel_clientID);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    NSStringFromSelector(sel_issuer);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    NSStringFromSelector(sel_tokenEndpointURL);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = (void *)MEMORY[0x24BDBCF48];
      NSStringFromSelector(sel_tokenEndpointURL);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "URLWithString:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = 0;
    }
    NSStringFromSelector(sel_jwksEndpointURL);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = (void *)MEMORY[0x24BDBCF48];
      NSStringFromSelector(sel_jwksEndpointURL);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "URLWithString:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v24 = 0;
    }
    NSStringFromSelector(sel_audience);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = -[POLoginConfiguration _initWithClientId:issuer:tokenEndpointURL:jwksEndpointURL:audience:](self, "_initWithClientId:issuer:tokenEndpointURL:jwksEndpointURL:audience:", v9, v12, v18, v24, v26);
    if (v27)
    {
      v250 = v26;
      v251 = v24;
      v252 = v18;
      v253 = v12;
      v254 = v9;
      NSStringFromSelector(sel_accountDisplayName);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v28);
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = (void *)*((_QWORD *)v27 + 3);
      *((_QWORD *)v27 + 3) = v29;

      NSStringFromSelector(sel_invalidCredentialPredicate);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v31);
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = (void *)*((_QWORD *)v27 + 2);
      *((_QWORD *)v27 + 2) = v32;

      v34 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v270 = 0u;
      v271 = 0u;
      v272 = 0u;
      v273 = 0u;
      NSStringFromSelector(sel_jwksTrustedRootCertificates);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v255 = v4;
      objc_msgSend(v4, "objectForKeyedSubscript:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v270, v277, 16);
      if (v37)
      {
        v38 = v37;
        v39 = *(_QWORD *)v271;
        do
        {
          for (i = 0; i != v38; ++i)
          {
            if (*(_QWORD *)v271 != v39)
              objc_enumerationMutation(v36);
            v41 = *(_QWORD *)(*((_QWORD *)&v270 + 1) + 8 * i);
            v42 = objc_alloc(MEMORY[0x24BDBCE50]);
            objc_msgSend(v42, "psso_initWithBase64URLEncodedString:", v41);
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            if (v43)
            {
              v44 = +[POSecKeyHelper certificateForData:](POSecKeyHelper, "certificateForData:", v43);
              objc_msgSend(v34, "addObject:", v44);

            }
          }
          v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v270, v277, 16);
        }
        while (v38);
      }

      if (objc_msgSend(v34, "count"))
        objc_storeStrong((id *)v27 + 9, v34);
      NSStringFromSelector(sel_deviceContext);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (v46)
      {
        v47 = objc_alloc(MEMORY[0x24BDBCE50]);
        NSStringFromSelector(sel_deviceContext);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v255, "objectForKeyedSubscript:", v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "psso_initWithBase64URLEncodedString:", v49);
        v50 = objc_claimAutoreleasedReturnValue();

        v51 = (void *)*((_QWORD *)v27 + 10);
        *((_QWORD *)v27 + 10) = v50;

      }
      NSStringFromSelector(sel_userSEPKeyBiometricPolicy);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *((_QWORD *)v27 + 11) = (int)objc_msgSend(v53, "intValue");

      NSStringFromSelector(sel_nonceEndpointURL);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (v55)
      {
        v56 = (void *)MEMORY[0x24BDBCF48];
        NSStringFromSelector(sel_nonceEndpointURL);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v255, "objectForKeyedSubscript:", v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "URLWithString:", v58);
        v59 = objc_claimAutoreleasedReturnValue();
        v60 = (void *)*((_QWORD *)v27 + 12);
        *((_QWORD *)v27 + 12) = v59;

      }
      NSStringFromSelector(sel_nonceResponseKeypath);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v61);
      v62 = objc_claimAutoreleasedReturnValue();
      v63 = (void *)*((_QWORD *)v27 + 13);
      *((_QWORD *)v27 + 13) = v62;

      NSStringFromSelector(sel_serverNonceClaimName);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v64);
      v65 = objc_claimAutoreleasedReturnValue();
      v66 = (void *)*((_QWORD *)v27 + 14);
      *((_QWORD *)v27 + 14) = v65;

      v67 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      NSStringFromSelector(sel_customNonceRequestValues);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      v70 = MEMORY[0x24BDAC760];
      v268[0] = MEMORY[0x24BDAC760];
      v268[1] = 3221225472;
      v268[2] = __37__POLoginConfiguration_initWithData___block_invoke_255;
      v268[3] = &unk_2515009B8;
      v71 = v67;
      v269 = v71;
      v249 = v69;
      objc_msgSend(v69, "enumerateKeysAndObjectsUsingBlock:", v268);
      if (objc_msgSend(v71, "count"))
        objc_storeStrong((id *)v27 + 15, v67);
      NSStringFromSelector(sel_customAssertionRequestHeaderClaims);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v72);
      v73 = objc_claimAutoreleasedReturnValue();
      v74 = (void *)*((_QWORD *)v27 + 45);
      *((_QWORD *)v27 + 45) = v73;

      NSStringFromSelector(sel_customAssertionRequestBodyClaims);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v75);
      v76 = objc_claimAutoreleasedReturnValue();
      v77 = (void *)*((_QWORD *)v27 + 46);
      *((_QWORD *)v27 + 46) = v76;

      NSStringFromSelector(sel_additionalScopes);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v78);
      v79 = objc_claimAutoreleasedReturnValue();
      v80 = (void *)*((_QWORD *)v27 + 16);
      *((_QWORD *)v27 + 16) = v79;

      NSStringFromSelector(sel_additionalAuthorizationScopes);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v81);
      v82 = objc_claimAutoreleasedReturnValue();
      v83 = (void *)*((_QWORD *)v27 + 17);
      *((_QWORD *)v27 + 17) = v82;

      NSStringFromSelector(sel_includePreviousRefreshTokenInLoginRequest);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v27 + 8) = objc_msgSend(v85, "BOOLValue");

      NSStringFromSelector(sel_previousRefreshTokenClaimName);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v86);
      v87 = objc_claimAutoreleasedReturnValue();
      v88 = (void *)*((_QWORD *)v27 + 18);
      *((_QWORD *)v27 + 18) = v87;

      NSStringFromSelector(sel_customRequestJWTParameterName);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v89);
      v90 = objc_claimAutoreleasedReturnValue();
      v91 = (void *)*((_QWORD *)v27 + 19);
      *((_QWORD *)v27 + 19) = v90;

      v92 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      NSStringFromSelector(sel_customLoginRequestValues);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v93);
      v94 = (void *)objc_claimAutoreleasedReturnValue();

      v266[0] = v70;
      v266[1] = 3221225472;
      v266[2] = __37__POLoginConfiguration_initWithData___block_invoke_2;
      v266[3] = &unk_2515009B8;
      v95 = v92;
      v267 = v95;
      v248 = v94;
      objc_msgSend(v94, "enumerateKeysAndObjectsUsingBlock:", v266);
      if (objc_msgSend(v95, "count"))
        objc_storeStrong((id *)v27 + 20, v92);
      NSStringFromSelector(sel_customLoginRequestHeaderClaims);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v96);
      v97 = objc_claimAutoreleasedReturnValue();
      v98 = (void *)*((_QWORD *)v27 + 47);
      *((_QWORD *)v27 + 47) = v97;

      NSStringFromSelector(sel_customLoginRequestBodyClaims);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v99);
      v100 = objc_claimAutoreleasedReturnValue();
      v101 = (void *)*((_QWORD *)v27 + 48);
      *((_QWORD *)v27 + 48) = v100;

      NSStringFromSelector(sel_uniqueIdentifierClaimName);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v102);
      v103 = objc_claimAutoreleasedReturnValue();
      v104 = (void *)*((_QWORD *)v27 + 21);
      *((_QWORD *)v27 + 21) = v103;

      NSStringFromSelector(sel_groupRequestClaimName);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v105);
      v106 = objc_claimAutoreleasedReturnValue();
      v107 = (void *)*((_QWORD *)v27 + 22);
      *((_QWORD *)v27 + 22) = v106;

      NSStringFromSelector(sel_groupResponseClaimName);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v108);
      v109 = objc_claimAutoreleasedReturnValue();
      v110 = (void *)*((_QWORD *)v27 + 23);
      *((_QWORD *)v27 + 23) = v109;

      NSStringFromSelector(sel_refreshEndpointURL);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v111);
      v112 = (void *)objc_claimAutoreleasedReturnValue();

      if (v112)
      {
        v113 = (void *)MEMORY[0x24BDBCF48];
        NSStringFromSelector(sel_refreshEndpointURL);
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v255, "objectForKeyedSubscript:", v114);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "URLWithString:", v115);
        v116 = objc_claimAutoreleasedReturnValue();
        v117 = (void *)*((_QWORD *)v27 + 24);
        *((_QWORD *)v27 + 24) = v116;

      }
      v118 = objc_alloc_init(MEMORY[0x24BDBCEB8]);

      NSStringFromSelector(sel_customRefreshRequestValues);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v119);
      v120 = (void *)objc_claimAutoreleasedReturnValue();

      v264[0] = v70;
      v264[1] = 3221225472;
      v264[2] = __37__POLoginConfiguration_initWithData___block_invoke_3;
      v264[3] = &unk_2515009B8;
      v121 = v118;
      v265 = v121;
      v247 = v120;
      objc_msgSend(v120, "enumerateKeysAndObjectsUsingBlock:", v264);
      if (objc_msgSend(v121, "count"))
        objc_storeStrong((id *)v27 + 25, v118);
      NSStringFromSelector(sel_customRefreshRequestHeaderClaims);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v122);
      v123 = objc_claimAutoreleasedReturnValue();
      v124 = (void *)*((_QWORD *)v27 + 49);
      *((_QWORD *)v27 + 49) = v123;

      NSStringFromSelector(sel_customRefreshRequestBodyClaims);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v125);
      v126 = objc_claimAutoreleasedReturnValue();
      v127 = (void *)*((_QWORD *)v27 + 50);
      *((_QWORD *)v27 + 50) = v126;

      v128 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      NSStringFromSelector(sel_kerberosTicketMappings);
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v129);
      v130 = (void *)objc_claimAutoreleasedReturnValue();

      v262[0] = v70;
      v262[1] = 3221225472;
      v262[2] = __37__POLoginConfiguration_initWithData___block_invoke_4;
      v262[3] = &unk_2514FFB88;
      v131 = v128;
      v263 = v131;
      v246 = v130;
      objc_msgSend(v130, "enumerateObjectsUsingBlock:", v262);
      if (objc_msgSend(v131, "count"))
        objc_storeStrong((id *)v27 + 26, v128);
      NSStringFromSelector(sel_federationType);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v132);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      *((_QWORD *)v27 + 27) = (int)objc_msgSend(v133, "intValue");

      NSStringFromSelector(sel_federationRequestURN);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v134);
      v135 = objc_claimAutoreleasedReturnValue();
      v136 = (void *)*((_QWORD *)v27 + 28);
      *((_QWORD *)v27 + 28) = v135;

      NSStringFromSelector(sel_federationMexURL);
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v137);
      v138 = (void *)objc_claimAutoreleasedReturnValue();

      if (v138)
      {
        v139 = (void *)MEMORY[0x24BDBCF48];
        NSStringFromSelector(sel_federationMexURL);
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v255, "objectForKeyedSubscript:", v140);
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v139, "URLWithString:", v141);
        v142 = objc_claimAutoreleasedReturnValue();
        v143 = (void *)*((_QWORD *)v27 + 29);
        *((_QWORD *)v27 + 29) = v142;

      }
      NSStringFromSelector(sel_federationUserPreauthenticationURL);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v144);
      v145 = (void *)objc_claimAutoreleasedReturnValue();

      if (v145)
      {
        v146 = (void *)MEMORY[0x24BDBCF48];
        NSStringFromSelector(sel_federationUserPreauthenticationURL);
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v255, "objectForKeyedSubscript:", v147);
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v146, "URLWithString:", v148);
        v149 = objc_claimAutoreleasedReturnValue();
        v150 = (void *)*((_QWORD *)v27 + 30);
        *((_QWORD *)v27 + 30) = v149;

      }
      NSStringFromSelector(sel_federationMexURLKeypath);
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v151);
      v152 = objc_claimAutoreleasedReturnValue();
      v153 = (void *)*((_QWORD *)v27 + 31);
      *((_QWORD *)v27 + 31) = v152;

      NSStringFromSelector(sel_federationPredicate);
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v154);
      v155 = objc_claimAutoreleasedReturnValue();
      v156 = (void *)*((_QWORD *)v27 + 32);
      *((_QWORD *)v27 + 32) = v155;

      v157 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      NSStringFromSelector(sel_customFederationUserPreauthenticationRequestValues);
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v158);
      v159 = (void *)objc_claimAutoreleasedReturnValue();

      v260[0] = v70;
      v260[1] = 3221225472;
      v260[2] = __37__POLoginConfiguration_initWithData___block_invoke_5;
      v260[3] = &unk_2515009B8;
      v160 = v157;
      v261 = v160;
      v245 = v159;
      objc_msgSend(v159, "enumerateKeysAndObjectsUsingBlock:", v260);
      if (objc_msgSend(v160, "count"))
        objc_storeStrong((id *)v27 + 33, v157);
      NSStringFromSelector(sel_loginRequestEncryptionPublicKey);
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v161);
      v162 = (void *)objc_claimAutoreleasedReturnValue();

      if (v162)
      {
        v163 = objc_alloc(MEMORY[0x24BDBCE50]);
        NSStringFromSelector(sel_loginRequestEncryptionPublicKey);
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v255, "objectForKeyedSubscript:", v164);
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v163, "psso_initWithBase64URLEncodedString:", v165);
        v166 = objc_claimAutoreleasedReturnValue();

        v167 = (void *)*((_QWORD *)v27 + 55);
        *((_QWORD *)v27 + 55) = v166;

      }
      NSStringFromSelector(sel_loginRequestEncryptionAlgorithm);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v168);
      v169 = (void *)objc_claimAutoreleasedReturnValue();

      if (v169)
      {
        NSStringFromSelector(sel_loginRequestEncryptionAlgorithm);
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v255, "objectForKeyedSubscript:", v170);
        v171 = objc_claimAutoreleasedReturnValue();

        v172 = (void *)*((_QWORD *)v27 + 34);
        *((_QWORD *)v27 + 34) = v171;
      }
      else
      {
        v173 = &unk_251520F48;
        v172 = (void *)*((_QWORD *)v27 + 34);
        *((_QWORD *)v27 + 34) = v173;
      }

      NSStringFromSelector(sel_loginRequestHpkePsk_id);
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v174);
      v175 = (void *)objc_claimAutoreleasedReturnValue();

      if (v175)
      {
        v176 = objc_alloc(MEMORY[0x24BDBCE50]);
        NSStringFromSelector(sel_loginRequestHpkePsk_id);
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v255, "objectForKeyedSubscript:", v177);
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v176, "psso_initWithBase64URLEncodedString:", v178);
        v179 = objc_claimAutoreleasedReturnValue();

        v180 = (void *)*((_QWORD *)v27 + 36);
        *((_QWORD *)v27 + 36) = v179;

      }
      NSStringFromSelector(sel_loginRequestHpkePsk);
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v181);
      v182 = (void *)objc_claimAutoreleasedReturnValue();

      if (v182)
      {
        v183 = objc_alloc(MEMORY[0x24BDBCE50]);
        NSStringFromSelector(sel_loginRequestHpkePsk);
        v184 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v255, "objectForKeyedSubscript:", v184);
        v185 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v183, "psso_initWithBase64URLEncodedString:", v185);
        v186 = objc_claimAutoreleasedReturnValue();

        v187 = (void *)*((_QWORD *)v27 + 35);
        *((_QWORD *)v27 + 35) = v186;

      }
      NSStringFromSelector(sel_loginRequestEncryptionAPVPrefix);
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v188);
      v189 = (void *)objc_claimAutoreleasedReturnValue();

      if (v189)
      {
        v190 = objc_alloc(MEMORY[0x24BDBCE50]);
        NSStringFromSelector(sel_loginRequestEncryptionAPVPrefix);
        v191 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v255, "objectForKeyedSubscript:", v191);
        v192 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v190, "psso_initWithBase64URLEncodedString:", v192);
        v193 = objc_claimAutoreleasedReturnValue();

        v194 = (void *)*((_QWORD *)v27 + 37);
        *((_QWORD *)v27 + 37) = v193;

      }
      NSStringFromSelector(sel_keyEndpointURL);
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v195);
      v196 = (void *)objc_claimAutoreleasedReturnValue();

      if (v196)
      {
        v197 = (void *)MEMORY[0x24BDBCF48];
        NSStringFromSelector(sel_keyEndpointURL);
        v198 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v255, "objectForKeyedSubscript:", v198);
        v199 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v197, "URLWithString:", v199);
        v200 = objc_claimAutoreleasedReturnValue();
        v201 = (void *)*((_QWORD *)v27 + 38);
        *((_QWORD *)v27 + 38) = v200;

      }
      v202 = objc_alloc_init(MEMORY[0x24BDBCEB8]);

      NSStringFromSelector(sel_customKeyExchangeRequestValues);
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v203);
      v204 = (void *)objc_claimAutoreleasedReturnValue();

      v258[0] = v70;
      v258[1] = 3221225472;
      v258[2] = __37__POLoginConfiguration_initWithData___block_invoke_6;
      v258[3] = &unk_2515009B8;
      v205 = v202;
      v259 = v205;
      v244 = v204;
      objc_msgSend(v204, "enumerateKeysAndObjectsUsingBlock:", v258);
      if (objc_msgSend(v205, "count"))
        objc_storeStrong((id *)v27 + 39, v202);
      NSStringFromSelector(sel_customKeyExchangeRequestHeaderClaims);
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v206);
      v207 = objc_claimAutoreleasedReturnValue();
      v208 = (void *)*((_QWORD *)v27 + 53);
      *((_QWORD *)v27 + 53) = v207;

      NSStringFromSelector(sel_customKeyExchangeRequestBodyClaims);
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v209);
      v210 = objc_claimAutoreleasedReturnValue();
      v211 = (void *)*((_QWORD *)v27 + 54);
      *((_QWORD *)v27 + 54) = v210;

      v212 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      NSStringFromSelector(sel_customKeyRequestValues);
      v213 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v213);
      v214 = (void *)objc_claimAutoreleasedReturnValue();

      v256[0] = v70;
      v256[1] = 3221225472;
      v256[2] = __37__POLoginConfiguration_initWithData___block_invoke_7;
      v256[3] = &unk_2515009B8;
      v215 = v212;
      v257 = v215;
      objc_msgSend(v214, "enumerateKeysAndObjectsUsingBlock:", v256);
      if (objc_msgSend(v215, "count"))
        objc_storeStrong((id *)v27 + 40, v212);
      NSStringFromSelector(sel_customKeyRequestHeaderClaims);
      v216 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v216);
      v217 = objc_claimAutoreleasedReturnValue();
      v218 = (void *)*((_QWORD *)v27 + 51);
      *((_QWORD *)v27 + 51) = v217;

      NSStringFromSelector(sel_customKeyRequestBodyClaims);
      v219 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v219);
      v220 = objc_claimAutoreleasedReturnValue();
      v221 = (void *)*((_QWORD *)v27 + 52);
      *((_QWORD *)v27 + 52) = v220;

      NSStringFromSelector(sel_hpkeAuthPublicKey);
      v222 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v222);
      v223 = (void *)objc_claimAutoreleasedReturnValue();

      if (v223)
      {
        v224 = objc_alloc(MEMORY[0x24BDBCE50]);
        NSStringFromSelector(sel_hpkeAuthPublicKey);
        v225 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v255, "objectForKeyedSubscript:", v225);
        v226 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v224, "psso_initWithBase64URLEncodedString:", v226);
        v227 = objc_claimAutoreleasedReturnValue();

        v228 = (void *)*((_QWORD *)v27 + 56);
        *((_QWORD *)v27 + 56) = v227;

      }
      NSStringFromSelector(sel_hpkePsk_id);
      v229 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v229);
      v230 = (void *)objc_claimAutoreleasedReturnValue();

      if (v230)
      {
        v231 = objc_alloc(MEMORY[0x24BDBCE50]);
        NSStringFromSelector(sel_hpkePsk_id);
        v232 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v255, "objectForKeyedSubscript:", v232);
        v233 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v231, "psso_initWithBase64URLEncodedString:", v233);
        v234 = objc_claimAutoreleasedReturnValue();

        v235 = (void *)*((_QWORD *)v27 + 44);
        *((_QWORD *)v27 + 44) = v234;

      }
      NSStringFromSelector(sel_hpkePsk);
      v236 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", v236);
      v237 = (void *)objc_claimAutoreleasedReturnValue();

      if (v237)
      {
        v238 = objc_alloc(MEMORY[0x24BDBCE50]);
        NSStringFromSelector(sel_hpkePsk);
        v239 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v255, "objectForKeyedSubscript:", v239);
        v240 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v238, "psso_initWithBase64URLEncodedString:", v240);
        v241 = objc_claimAutoreleasedReturnValue();

        v242 = (void *)*((_QWORD *)v27 + 43);
        *((_QWORD *)v27 + 43) = v241;

      }
      v4 = v255;
      v9 = v254;
      v18 = v252;
      v12 = v253;
      v26 = v250;
      v24 = v251;
    }
    self = (POLoginConfiguration *)v27;

    v8 = self;
  }

  return v8;
}

id __37__POLoginConfiguration_initWithData___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Error deserializing login config."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginConfiguration();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v1;
}

void __37__POLoginConfiguration_initWithData___block_invoke_255(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

void __37__POLoginConfiguration_initWithData___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

void __37__POLoginConfiguration_initWithData___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

void __37__POLoginConfiguration_initWithData___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  POKerberosMapping *v4;
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    v4 = -[POKerberosMapping initWithDictionary:]([POKerberosMapping alloc], "initWithDictionary:", v5);
    objc_msgSend(v3, "addObject:", v4);

  }
}

void __37__POLoginConfiguration_initWithData___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

void __37__POLoginConfiguration_initWithData___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

void __37__POLoginConfiguration_initWithData___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[POLoginConfiguration dataRepresentationForDisplay:](self, "dataRepresentationForDisplay:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithData:encoding:", v4, 4);

  return v5;
}

- (id)mergedConfigurationWithUserLoginConfiguration:(id)a3
{
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a3;
  v5 = (void *)-[POLoginConfiguration copy](self, "copy");
  objc_msgSend(v5, "customAssertionRequestHeaderClaims");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = (void *)MEMORY[0x24BDBD1B8];
  if (!v6)
    v6 = (void *)MEMORY[0x24BDBD1B8];
  v9 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v4, "customAssertionRequestHeaderClaims");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addEntriesFromDictionary:", v10);

  objc_msgSend(v5, "setCustomAssertionRequestHeaderClaims:", v9);
  objc_msgSend(v5, "customAssertionRequestBodyClaims");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
    v11 = v8;
  v13 = (void *)objc_msgSend(v11, "mutableCopy");

  objc_msgSend(v4, "customAssertionRequestBodyClaims");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addEntriesFromDictionary:", v14);

  objc_msgSend(v5, "setCustomAssertionRequestBodyClaims:", v13);
  objc_msgSend(v5, "customLoginRequestHeaderClaims");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
    v15 = v8;
  v17 = (void *)objc_msgSend(v15, "mutableCopy");

  objc_msgSend(v4, "customLoginRequestHeaderClaims");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addEntriesFromDictionary:", v18);

  objc_msgSend(v5, "setCustomLoginRequestHeaderClaims:", v17);
  objc_msgSend(v5, "customLoginRequestBodyClaims");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (!v19)
    v19 = v8;
  v21 = (void *)objc_msgSend(v19, "mutableCopy");

  objc_msgSend(v4, "customLoginRequestBodyClaims");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "addEntriesFromDictionary:", v22);
  objc_msgSend(v5, "setCustomLoginRequestBodyClaims:", v21);

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  POLoginConfiguration *v4;
  void *v5;
  POLoginConfiguration *v6;

  v4 = [POLoginConfiguration alloc];
  -[POLoginConfiguration dataRepresentation](self, "dataRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[POLoginConfiguration initWithData:](v4, "initWithData:", v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (POLoginConfiguration)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  POLoginConfiguration *v8;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_dataRepresentation);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[POLoginConfiguration initWithData:](self, "initWithData:", v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[POLoginConfiguration dataRepresentation](self, "dataRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_dataRepresentation);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, v5);

}

- (NSString)invalidCredentialPredicate
{
  return self->_invalidCredentialPredicate;
}

- (void)setInvalidCredentialPredicate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)accountDisplayName
{
  return self->_accountDisplayName;
}

- (void)setAccountDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)clientID
{
  return self->_clientID;
}

- (NSString)issuer
{
  return self->_issuer;
}

- (NSString)audience
{
  return self->_audience;
}

- (void)setAudience:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSURL)tokenEndpointURL
{
  return self->_tokenEndpointURL;
}

- (void)setTokenEndpointURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSURL)jwksEndpointURL
{
  return self->_jwksEndpointURL;
}

- (void)setJwksEndpointURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)jwksTrustedRootCertificates
{
  return self->_jwksTrustedRootCertificates;
}

- (void)setJwksTrustedRootCertificates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSData)deviceContext
{
  return self->_deviceContext;
}

- (void)setDeviceContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (unint64_t)userSEPKeyBiometricPolicy
{
  return self->_userSEPKeyBiometricPolicy;
}

- (void)setUserSEPKeyBiometricPolicy:(unint64_t)a3
{
  self->_userSEPKeyBiometricPolicy = a3;
}

- (void)setNonceEndpointURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)nonceResponseKeypath
{
  return self->_nonceResponseKeypath;
}

- (void)setNonceResponseKeypath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)serverNonceClaimName
{
  return self->_serverNonceClaimName;
}

- (void)setServerNonceClaimName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)customNonceRequestValues
{
  return self->_customNonceRequestValues;
}

- (void)setCustomNonceRequestValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)additionalScopes
{
  return self->_additionalScopes;
}

- (void)setAdditionalScopes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)additionalAuthorizationScopes
{
  return self->_additionalAuthorizationScopes;
}

- (void)setAdditionalAuthorizationScopes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)includePreviousRefreshTokenInLoginRequest
{
  return self->_includePreviousRefreshTokenInLoginRequest;
}

- (void)setIncludePreviousRefreshTokenInLoginRequest:(BOOL)a3
{
  self->_includePreviousRefreshTokenInLoginRequest = a3;
}

- (NSString)previousRefreshTokenClaimName
{
  return self->_previousRefreshTokenClaimName;
}

- (void)setPreviousRefreshTokenClaimName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)customRequestJWTParameterName
{
  return self->_customRequestJWTParameterName;
}

- (void)setCustomRequestJWTParameterName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSArray)customLoginRequestValues
{
  return self->_customLoginRequestValues;
}

- (void)setCustomLoginRequestValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void)setUniqueIdentifierClaimName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)groupRequestClaimName
{
  return self->_groupRequestClaimName;
}

- (void)setGroupRequestClaimName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)groupResponseClaimName
{
  return self->_groupResponseClaimName;
}

- (void)setGroupResponseClaimName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void)setRefreshEndpointURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSArray)customRefreshRequestValues
{
  return self->_customRefreshRequestValues;
}

- (void)setCustomRefreshRequestValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSArray)kerberosTicketMappings
{
  return self->_kerberosTicketMappings;
}

- (void)setKerberosTicketMappings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (unint64_t)federationType
{
  return self->_federationType;
}

- (void)setFederationType:(unint64_t)a3
{
  self->_federationType = a3;
}

- (NSString)federationRequestURN
{
  return self->_federationRequestURN;
}

- (void)setFederationRequestURN:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSURL)federationMexURL
{
  return self->_federationMexURL;
}

- (void)setFederationMexURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSURL)federationUserPreauthenticationURL
{
  return self->_federationUserPreauthenticationURL;
}

- (void)setFederationUserPreauthenticationURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSString)federationMexURLKeypath
{
  return self->_federationMexURLKeypath;
}

- (void)setFederationMexURLKeypath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSString)federationPredicate
{
  return self->_federationPredicate;
}

- (void)setFederationPredicate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSArray)customFederationUserPreauthenticationRequestValues
{
  return self->_customFederationUserPreauthenticationRequestValues;
}

- (void)setCustomFederationUserPreauthenticationRequestValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSNumber)loginRequestEncryptionAlgorithm
{
  return self->_loginRequestEncryptionAlgorithm;
}

- (void)setLoginRequestEncryptionAlgorithm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSData)loginRequestHpkePsk
{
  return self->_loginRequestHpkePsk;
}

- (void)setLoginRequestHpkePsk:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSData)loginRequestHpkePsk_id
{
  return self->_loginRequestHpkePsk_id;
}

- (void)setLoginRequestHpkePsk_id:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSData)loginRequestEncryptionAPVPrefix
{
  return self->_loginRequestEncryptionAPVPrefix;
}

- (void)setLoginRequestEncryptionAPVPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_loginRequestEncryptionAPVPrefix, a3);
}

- (void)setKeyEndpointURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (NSArray)customKeyExchangeRequestValues
{
  return self->_customKeyExchangeRequestValues;
}

- (void)setCustomKeyExchangeRequestValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSArray)customKeyRequestValues
{
  return self->_customKeyRequestValues;
}

- (void)setCustomKeyRequestValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (NSArray)customDecryptionRequestValues
{
  return self->_customDecryptionRequestValues;
}

- (void)setCustomDecryptionRequestValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (NSURL)decryptionEndpointURL
{
  return self->_decryptionEndpointURL;
}

- (void)setDecryptionEndpointURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (NSData)hpkePsk
{
  return self->_hpkePsk;
}

- (void)setHpkePsk:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (NSData)hpkePsk_id
{
  return self->_hpkePsk_id;
}

- (void)setHpkePsk_id:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (NSDictionary)customAssertionRequestHeaderClaims
{
  return (NSDictionary *)objc_getProperty(self, a2, 360, 1);
}

- (void)setCustomAssertionRequestHeaderClaims:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 360);
}

- (NSDictionary)customAssertionRequestBodyClaims
{
  return (NSDictionary *)objc_getProperty(self, a2, 368, 1);
}

- (void)setCustomAssertionRequestBodyClaims:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 368);
}

- (NSDictionary)customLoginRequestHeaderClaims
{
  return (NSDictionary *)objc_getProperty(self, a2, 376, 1);
}

- (void)setCustomLoginRequestHeaderClaims:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 376);
}

- (NSDictionary)customLoginRequestBodyClaims
{
  return (NSDictionary *)objc_getProperty(self, a2, 384, 1);
}

- (void)setCustomLoginRequestBodyClaims:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 384);
}

- (NSDictionary)customRefreshRequestHeaderClaims
{
  return (NSDictionary *)objc_getProperty(self, a2, 392, 1);
}

- (void)setCustomRefreshRequestHeaderClaims:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 392);
}

- (NSDictionary)customRefreshRequestBodyClaims
{
  return (NSDictionary *)objc_getProperty(self, a2, 400, 1);
}

- (void)setCustomRefreshRequestBodyClaims:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 400);
}

- (NSDictionary)customKeyRequestHeaderClaims
{
  return (NSDictionary *)objc_getProperty(self, a2, 408, 1);
}

- (void)setCustomKeyRequestHeaderClaims:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 408);
}

- (NSDictionary)customKeyRequestBodyClaims
{
  return (NSDictionary *)objc_getProperty(self, a2, 416, 1);
}

- (void)setCustomKeyRequestBodyClaims:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 416);
}

- (NSDictionary)customKeyExchangeRequestHeaderClaims
{
  return (NSDictionary *)objc_getProperty(self, a2, 424, 1);
}

- (void)setCustomKeyExchangeRequestHeaderClaims:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 424);
}

- (NSDictionary)customKeyExchangeRequestBodyClaims
{
  return (NSDictionary *)objc_getProperty(self, a2, 432, 1);
}

- (void)setCustomKeyExchangeRequestBodyClaims:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (NSData)_loginRequestEncryptionPublicKeyData
{
  return self->__loginRequestEncryptionPublicKeyData;
}

- (void)set_loginRequestEncryptionPublicKeyData:(id)a3
{
  objc_storeStrong((id *)&self->__loginRequestEncryptionPublicKeyData, a3);
}

- (NSData)_hpkeAuthPublicKeyData
{
  return self->__hpkeAuthPublicKeyData;
}

- (void)set_hpkeAuthPublicKeyData:(id)a3
{
  objc_storeStrong((id *)&self->__hpkeAuthPublicKeyData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__hpkeAuthPublicKeyData, 0);
  objc_storeStrong((id *)&self->__loginRequestEncryptionPublicKeyData, 0);
  objc_storeStrong((id *)&self->_customKeyExchangeRequestBodyClaims, 0);
  objc_storeStrong((id *)&self->_customKeyExchangeRequestHeaderClaims, 0);
  objc_storeStrong((id *)&self->_customKeyRequestBodyClaims, 0);
  objc_storeStrong((id *)&self->_customKeyRequestHeaderClaims, 0);
  objc_storeStrong((id *)&self->_customRefreshRequestBodyClaims, 0);
  objc_storeStrong((id *)&self->_customRefreshRequestHeaderClaims, 0);
  objc_storeStrong((id *)&self->_customLoginRequestBodyClaims, 0);
  objc_storeStrong((id *)&self->_customLoginRequestHeaderClaims, 0);
  objc_storeStrong((id *)&self->_customAssertionRequestBodyClaims, 0);
  objc_storeStrong((id *)&self->_customAssertionRequestHeaderClaims, 0);
  objc_storeStrong((id *)&self->_hpkePsk_id, 0);
  objc_storeStrong((id *)&self->_hpkePsk, 0);
  objc_storeStrong((id *)&self->_decryptionEndpointURL, 0);
  objc_storeStrong((id *)&self->_customDecryptionRequestValues, 0);
  objc_storeStrong((id *)&self->_customKeyRequestValues, 0);
  objc_storeStrong((id *)&self->_customKeyExchangeRequestValues, 0);
  objc_storeStrong((id *)&self->_keyEndpointURL, 0);
  objc_storeStrong((id *)&self->_loginRequestEncryptionAPVPrefix, 0);
  objc_storeStrong((id *)&self->_loginRequestHpkePsk_id, 0);
  objc_storeStrong((id *)&self->_loginRequestHpkePsk, 0);
  objc_storeStrong((id *)&self->_loginRequestEncryptionAlgorithm, 0);
  objc_storeStrong((id *)&self->_customFederationUserPreauthenticationRequestValues, 0);
  objc_storeStrong((id *)&self->_federationPredicate, 0);
  objc_storeStrong((id *)&self->_federationMexURLKeypath, 0);
  objc_storeStrong((id *)&self->_federationUserPreauthenticationURL, 0);
  objc_storeStrong((id *)&self->_federationMexURL, 0);
  objc_storeStrong((id *)&self->_federationRequestURN, 0);
  objc_storeStrong((id *)&self->_kerberosTicketMappings, 0);
  objc_storeStrong((id *)&self->_customRefreshRequestValues, 0);
  objc_storeStrong((id *)&self->_refreshEndpointURL, 0);
  objc_storeStrong((id *)&self->_groupResponseClaimName, 0);
  objc_storeStrong((id *)&self->_groupRequestClaimName, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifierClaimName, 0);
  objc_storeStrong((id *)&self->_customLoginRequestValues, 0);
  objc_storeStrong((id *)&self->_customRequestJWTParameterName, 0);
  objc_storeStrong((id *)&self->_previousRefreshTokenClaimName, 0);
  objc_storeStrong((id *)&self->_additionalAuthorizationScopes, 0);
  objc_storeStrong((id *)&self->_additionalScopes, 0);
  objc_storeStrong((id *)&self->_customNonceRequestValues, 0);
  objc_storeStrong((id *)&self->_serverNonceClaimName, 0);
  objc_storeStrong((id *)&self->_nonceResponseKeypath, 0);
  objc_storeStrong((id *)&self->_nonceEndpointURL, 0);
  objc_storeStrong((id *)&self->_deviceContext, 0);
  objc_storeStrong((id *)&self->_jwksTrustedRootCertificates, 0);
  objc_storeStrong((id *)&self->_jwksEndpointURL, 0);
  objc_storeStrong((id *)&self->_tokenEndpointURL, 0);
  objc_storeStrong((id *)&self->_audience, 0);
  objc_storeStrong((id *)&self->_issuer, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_accountDisplayName, 0);
  objc_storeStrong((id *)&self->_invalidCredentialPredicate, 0);
}

void __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke_cold_1()
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

  v0 = objc_alloc(MEMORY[0x24BDD17C8]);
  v2 = (void *)OUTLINED_FUNCTION_13(v0, v1);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_1(&dword_24440D000, v3, v4, "open id response received: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_10();
}

void __111__POLoginConfiguration_configurationWithOpenIdConfigurationURL_identityProviderURL_clientId_issuer_completion___block_invoke_82_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a2 + 32), "statusCode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_24440D000, a3, OS_LOG_TYPE_ERROR, "%{public}@, %{public}@", (uint8_t *)&v6, 0x16u);

}

- (void)dataRepresentationForDisplay:.cold.1()
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

  v0 = objc_alloc(MEMORY[0x24BDD17C8]);
  v2 = (void *)OUTLINED_FUNCTION_13(v0, v1);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_1(&dword_24440D000, v3, v4, "serialized configuration: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_10();
}

@end
