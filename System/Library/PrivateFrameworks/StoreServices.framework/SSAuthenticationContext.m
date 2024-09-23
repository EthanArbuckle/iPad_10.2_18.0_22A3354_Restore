@implementation SSAuthenticationContext

- (id)_initSSAuthenticationContext
{
  SSAuthenticationContext *v2;
  SSAuthenticationContext *v3;
  uint64_t v4;
  NSString *logUUID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SSAuthenticationContext;
  v2 = -[SSAuthenticationContext init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_accountNameEditable = 1;
    v2->_allowsRetry = 1;
    v2->_allowsSilentAuthentication = +[SSDevice deviceIsAppleWatch](SSDevice, "deviceIsAppleWatch");
    v3->_canCreateNewAccount = -[SSAuthenticationContext _allowCreateAccount](v3, "_allowCreateAccount");
    v3->_canSetActiveAccount = 1;
    AMSSetLogKeyIfNeeded();
    v4 = objc_claimAutoreleasedReturnValue();
    logUUID = v3->_logUUID;
    v3->_logUUID = (NSString *)v4;

    v3->_shouldPersonalizeResponseActions = 1;
  }
  return v3;
}

- (SSAuthenticationContext)initWithAccount:(id)a3
{
  id v4;
  SSAuthenticationContext *v5;
  uint64_t v6;
  NSString *accountName;
  uint64_t v8;
  NSString *altDSID;
  BOOL canCreateNewAccount;
  uint64_t v11;
  NSNumber *requiredUniqueIdentifier;

  v4 = a3;
  v5 = -[SSAuthenticationContext _initSSAuthenticationContext](self, "_initSSAuthenticationContext");
  if (v5)
  {
    objc_msgSend(v4, "accountName");
    v6 = objc_claimAutoreleasedReturnValue();
    accountName = v5->_accountName;
    v5->_accountName = (NSString *)v6;

    v5->_accountNameEditable = -[NSString length](v5->_accountName, "length") == 0;
    v5->_accountScope = objc_msgSend(v4, "accountScope");
    objc_msgSend(v4, "altDSID");
    v8 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v8;

    canCreateNewAccount = v5->_canCreateNewAccount;
    if (canCreateNewAccount)
      canCreateNewAccount = v5->_accountNameEditable;
    v5->_canCreateNewAccount = canCreateNewAccount;
    objc_msgSend(v4, "uniqueIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    requiredUniqueIdentifier = v5->_requiredUniqueIdentifier;
    v5->_requiredUniqueIdentifier = (NSNumber *)v11;

  }
  return v5;
}

- (SSAuthenticationContext)initWithAccountIdentifier:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  SSAuthenticationContext *v9;
  SSAuthenticationContext *v10;
  BOOL v11;
  char v12;

  v5 = a3;
  +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && objc_msgSend(v5, "integerValue"))
  {
    objc_msgSend(v6, "accountWithUniqueIdentifier:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "activeAccount");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
  if (v7)
  {
    v9 = -[SSAuthenticationContext initWithAccount:](self, "initWithAccount:", v7);
  }
  else
  {
    v10 = -[SSAuthenticationContext _initSSAuthenticationContext](self, "_initSSAuthenticationContext");
    v9 = v10;
    if (v10)
    {
      v10->_accountNameEditable = 1;
      if (v5)
        v11 = 1;
      else
        v11 = !v10->_canCreateNewAccount;
      v12 = !v11;
      v10->_canCreateNewAccount = v12;
      objc_storeStrong((id *)&v10->_requiredUniqueIdentifier, a3);
    }
  }

  return v9;
}

+ (id)contextForSignIn
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init((Class)a1);
  v2[18] = 1;
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("signIn"), CFSTR("why"), 0);
  v4 = (void *)v2[20];
  v2[20] = v3;

  return v2;
}

- (id)accountStoreOptions
{
  void *v2;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
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
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;

  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SSAuthenticationContext allowsSilentAuthentication](self, "allowsSilentAuthentication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("SSAccountStoreAuthKitAllowSilentAuth"));

  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[SSAuthenticationContext password](self, "password");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = 1;
  }
  else
  {
    -[SSAuthenticationContext passwordEquivalentToken](self, "passwordEquivalentToken");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v2 != 0;
  }
  objc_msgSend(v6, "numberWithInt:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("SSAccountStoreAuthKitAllowPasswordReuse"));

  if (!v7)
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SSAuthenticationContext canCreateNewAccount](self, "canCreateNewAccount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("SSAccountStoreAuthKitCanCreateNewAccountKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SSAuthenticationContext canSetActiveAccount](self, "canSetActiveAccount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("SSAccountStoreAuthKitCanSetActiveAccountKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SSAuthenticationContext promptStyle](self, "promptStyle") == 1000);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("SSAccountStoreAuthKitPreventPrompt"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SSAuthenticationContext shouldSuppressDialogs](self, "shouldSuppressDialogs"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("SSAccountStoreAuthKitSuppressServerDialogs"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SSAuthenticationContext shouldIgnoreAccountConversion](self, "shouldIgnoreAccountConversion"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("SSAccountStoreIgnoreAccountConversionKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SSAuthenticationContext accountScope](self, "accountScope"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, SSVerifyCredentialsAccountScope);

  -[SSAuthenticationContext reasonDescription](self, "reasonDescription");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  if (v17)
  {
    -[SSAuthenticationContext reasonDescription](self, "reasonDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("SSAccountStoreAuthKitReasonKey"));

  }
  -[SSAuthenticationContext promptTitle](self, "promptTitle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "length");

  if (v20)
  {
    -[SSAuthenticationContext promptTitle](self, "promptTitle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("SSAccountStoreAuthKitPromptTitle"));

  }
  -[SSAuthenticationContext okButtonLabel](self, "okButtonLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "length");

  if (v23)
  {
    -[SSAuthenticationContext okButtonLabel](self, "okButtonLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("SSAccountStoreAuthKitOKButtonLabel"));

  }
  -[SSAuthenticationContext requiredUniqueIdentifier](self, "requiredUniqueIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[SSAuthenticationContext requiredUniqueIdentifier](self, "requiredUniqueIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("SSAccountStoreAuthKitCreateAccountDSIDKey"));

  }
  -[SSAuthenticationContext signupRequestParameters](self, "signupRequestParameters");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[SSAuthenticationContext signupRequestParameters](self, "signupRequestParameters");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v28, CFSTR("SSAccountStoreAuthKitCreateAccountQueryParamsKey"));

  }
  -[SSAuthenticationContext preferredITunesStoreClient](self, "preferredITunesStoreClient");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[SSAuthenticationContext preferredITunesStoreClient](self, "preferredITunesStoreClient");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v30, CFSTR("SSAccountStoreAuthKitCreateAccountTargetIdentifierKey"));

  }
  -[SSAuthenticationContext HTTPHeaders](self, "HTTPHeaders");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");

  if (v32)
  {
    -[SSAuthenticationContext HTTPHeaders](self, "HTTPHeaders");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v33, "mutableCopy");

    objc_msgSend(v34, "removeObjectForKey:", CFSTR("User-Agent"));
    v35 = (void *)objc_msgSend(v34, "copy");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v35, CFSTR("SSAccountStoreAuthKitHTTPHeadersKey"));

  }
  -[SSAuthenticationContext HTTPHeaders](self, "HTTPHeaders");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "count");

  if (v37)
  {
    -[SSAuthenticationContext HTTPHeaders](self, "HTTPHeaders");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v38, "mutableCopy");

    objc_msgSend(v39, "removeObjectForKey:", CFSTR("User-Agent"));
    v40 = (void *)objc_msgSend(v39, "copy");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v40, CFSTR("SSAccountStoreAuthKitHTTPHeadersKey"));

  }
  -[SSAuthenticationContext HTTPHeaders](self, "HTTPHeaders");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("User-Agent"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v42, "length"))
  {
    v43 = v42;
  }
  else
  {
    +[SSDevice currentDevice](SSDevice, "currentDevice");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "userAgent");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = v43;
    if (!objc_msgSend(v43, "length"))
      goto LABEL_26;
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v42, CFSTR("SSAccountStoreAuthKitUserAgentKey"));
LABEL_26:
  -[SSAuthenticationContext userAgentComponents](self, "userAgentComponents");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "count");

  if (v46)
  {
    -[SSAuthenticationContext userAgentComponents](self, "userAgentComponents");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v47, CFSTR("SSAccountStoreAuthKitUserAgentSuffixesKey"));

  }
  v48 = (void *)objc_msgSend(v4, "copy");

  return v48;
}

- (SSURLBagContext)URLBagContext
{
  void *v3;
  void *v4;
  void *v5;

  +[SSURLBagContext contextWithBagType:](SSURLBagContext, "contextWithBagType:", SSURLBagTypeForAccountScope(-[SSAuthenticationContext accountScope](self, "accountScope")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsBootstrapCellularData:", -[SSAuthenticationContext allowsBootstrapCellularData](self, "allowsBootstrapCellularData"));
  -[SSAuthenticationContext HTTPHeaders](self, "HTTPHeaders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("User-Agent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "setValue:forHTTPHeaderField:", v5, CFSTR("User-Agent"));

  return (SSURLBagContext *)v3;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetObject(v3, "0", self->_accountName);
  xpc_dictionary_set_BOOL(v3, "1", self->_accountNameEditable);
  xpc_dictionary_set_int64(v3, "2", self->_accountScope);
  xpc_dictionary_set_BOOL(v3, "21", self->_allowsBioAuthentication);
  xpc_dictionary_set_BOOL(v3, "23", self->_allowsBootstrapCellularData);
  xpc_dictionary_set_BOOL(v3, "19", self->_allowsRetry);
  xpc_dictionary_set_BOOL(v3, "30", self->_allowsSilentAuthentication);
  SSXPCDictionarySetObject(v3, "26", self->_altDSID);
  SSXPCDictionarySetObject(v3, "27", self->_cancelButtonLabel);
  xpc_dictionary_set_BOOL(v3, "3", self->_canCreateNewAccount);
  xpc_dictionary_set_BOOL(v3, "4", self->_canSetActiveAccount);
  SSXPCDictionarySetObject(v3, "5", self->_clientIdentifierHeader);
  xpc_dictionary_set_BOOL(v3, "25", self->_displaysOnLockScreen);
  xpc_dictionary_set_BOOL(v3, "33", self->_forceDaemonAuthentication);
  SSXPCDictionarySetObject(v3, "7", self->_httpHeaders);
  SSXPCDictionarySetObject(v3, "34", self->_logUUID);
  SSXPCDictionarySetObject(v3, "28", self->_okButtonLabel);
  SSXPCDictionarySetObject(v3, "18", self->_password);
  SSXPCDictionarySetObject(v3, "31", self->_passwordEquivalentToken);
  xpc_dictionary_set_BOOL(v3, "20", self->_persistsAcrossDeviceLock);
  SSXPCDictionarySetObject(v3, "8", self->_preferredITunesStoreClient);
  xpc_dictionary_set_int64(v3, "9", self->_promptStyle);
  SSXPCDictionarySetObject(v3, "29", self->_promptTitle);
  xpc_dictionary_set_BOOL(v3, "22", self->_persistsPasswordFallback);
  SSXPCDictionarySetObject(v3, "24", self->_reasonDescription);
  SSXPCDictionarySetObject(v3, "10", self->_requestParameters);
  SSXPCDictionarySetObject(v3, "11", self->_requiredUniqueIdentifier);
  xpc_dictionary_set_BOOL(v3, "19", self->_shouldCreateNewSession);
  xpc_dictionary_set_BOOL(v3, "12", self->_shouldFollowAccountButtons);
  xpc_dictionary_set_BOOL(v3, "16", self->_shouldIgnoreProtocol);
  xpc_dictionary_set_BOOL(v3, "35", self->_shouldPersonalizeResponseActions);
  xpc_dictionary_set_BOOL(v3, "17", self->_shouldSuppressDialogs);
  SSXPCDictionarySetObject(v3, "13", self->_signupRequestParameters);
  xpc_dictionary_set_int64(v3, "14", self->_tokenType);
  SSXPCDictionarySetObject(v3, "32", self->_touchIDContinueToken);
  SSXPCDictionarySetObject(v3, "15", self->_userAgentComponents);
  xpc_dictionary_set_BOOL(v3, "36", self->_shouldIgnoreAccountConversion);
  return v3;
}

- (SSAuthenticationContext)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSAuthenticationContext *v6;
  uint64_t v8;
  uint64_t v9;
  NSString *accountName;
  uint64_t v11;
  uint64_t v12;
  NSString *altDSID;
  uint64_t v14;
  uint64_t v15;
  NSString *cancelButtonLabel;
  uint64_t v17;
  uint64_t v18;
  NSString *clientIdentifierHeader;
  uint64_t v20;
  uint64_t v21;
  NSDictionary *httpHeaders;
  uint64_t v23;
  uint64_t v24;
  NSString *logUUID;
  uint64_t v26;
  uint64_t v27;
  NSString *okButtonLabel;
  uint64_t v29;
  uint64_t v30;
  NSString *password;
  uint64_t v32;
  uint64_t v33;
  NSString *passwordEquivalentToken;
  uint64_t v35;
  uint64_t v36;
  NSString *preferredITunesStoreClient;
  uint64_t v38;
  uint64_t v39;
  NSString *promptTitle;
  uint64_t v41;
  uint64_t v42;
  NSString *reasonDescription;
  uint64_t v44;
  uint64_t v45;
  NSDictionary *requestParameters;
  uint64_t v47;
  uint64_t v48;
  NSNumber *requiredUniqueIdentifier;
  uint64_t v50;
  uint64_t v51;
  NSDictionary *signupRequestParameters;
  uint64_t v53;
  uint64_t v54;
  NSString *touchIDContinueToken;
  uint64_t v56;
  uint64_t v57;
  NSArray *userAgentComponents;
  objc_super v59;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v59.receiver = self;
    v59.super_class = (Class)SSAuthenticationContext;
    v6 = -[SSAuthenticationContext init](&v59, sel_init);
    if (v6)
    {
      v8 = objc_opt_class();
      v9 = SSXPCDictionaryCopyObjectWithClass(v5, "0", v8);
      accountName = v6->_accountName;
      v6->_accountName = (NSString *)v9;

      v6->_accountNameEditable = xpc_dictionary_get_BOOL(v5, "1");
      v6->_accountScope = xpc_dictionary_get_BOOL(v5, "2");
      v6->_allowsBioAuthentication = xpc_dictionary_get_BOOL(v5, "21");
      v6->_allowsBootstrapCellularData = xpc_dictionary_get_BOOL(v5, "23");
      v6->_allowsRetry = xpc_dictionary_get_BOOL(v5, "19");
      v6->_allowsSilentAuthentication = xpc_dictionary_get_BOOL(v5, "30");
      v11 = objc_opt_class();
      v12 = SSXPCDictionaryCopyObjectWithClass(v5, "26", v11);
      altDSID = v6->_altDSID;
      v6->_altDSID = (NSString *)v12;

      v14 = objc_opt_class();
      v15 = SSXPCDictionaryCopyObjectWithClass(v5, "27", v14);
      cancelButtonLabel = v6->_cancelButtonLabel;
      v6->_cancelButtonLabel = (NSString *)v15;

      v6->_canCreateNewAccount = xpc_dictionary_get_BOOL(v5, "3");
      v6->_canSetActiveAccount = xpc_dictionary_get_BOOL(v5, "4");
      v17 = objc_opt_class();
      v18 = SSXPCDictionaryCopyObjectWithClass(v5, "5", v17);
      clientIdentifierHeader = v6->_clientIdentifierHeader;
      v6->_clientIdentifierHeader = (NSString *)v18;

      v6->_displaysOnLockScreen = xpc_dictionary_get_BOOL(v5, "25");
      v20 = objc_opt_class();
      v21 = SSXPCDictionaryCopyObjectWithClass(v5, "7", v20);
      httpHeaders = v6->_httpHeaders;
      v6->_httpHeaders = (NSDictionary *)v21;

      v23 = objc_opt_class();
      v24 = SSXPCDictionaryCopyObjectWithClass(v5, "34", v23);
      logUUID = v6->_logUUID;
      v6->_logUUID = (NSString *)v24;

      v26 = objc_opt_class();
      v27 = SSXPCDictionaryCopyObjectWithClass(v5, "28", v26);
      okButtonLabel = v6->_okButtonLabel;
      v6->_okButtonLabel = (NSString *)v27;

      v29 = objc_opt_class();
      v30 = SSXPCDictionaryCopyObjectWithClass(v5, "18", v29);
      password = v6->_password;
      v6->_password = (NSString *)v30;

      v32 = objc_opt_class();
      v33 = SSXPCDictionaryCopyObjectWithClass(v5, "31", v32);
      passwordEquivalentToken = v6->_passwordEquivalentToken;
      v6->_passwordEquivalentToken = (NSString *)v33;

      v6->_persistsAcrossDeviceLock = xpc_dictionary_get_BOOL(v5, "20");
      v35 = objc_opt_class();
      v36 = SSXPCDictionaryCopyObjectWithClass(v5, "8", v35);
      preferredITunesStoreClient = v6->_preferredITunesStoreClient;
      v6->_preferredITunesStoreClient = (NSString *)v36;

      v6->_promptStyle = xpc_dictionary_get_int64(v5, "9");
      v38 = objc_opt_class();
      v39 = SSXPCDictionaryCopyObjectWithClass(v5, "29", v38);
      promptTitle = v6->_promptTitle;
      v6->_promptTitle = (NSString *)v39;

      v6->_persistsPasswordFallback = xpc_dictionary_get_BOOL(v5, "22");
      v41 = objc_opt_class();
      v42 = SSXPCDictionaryCopyObjectWithClass(v5, "24", v41);
      reasonDescription = v6->_reasonDescription;
      v6->_reasonDescription = (NSString *)v42;

      v44 = objc_opt_class();
      v45 = SSXPCDictionaryCopyObjectWithClass(v5, "10", v44);
      requestParameters = v6->_requestParameters;
      v6->_requestParameters = (NSDictionary *)v45;

      v47 = objc_opt_class();
      v48 = SSXPCDictionaryCopyObjectWithClass(v5, "11", v47);
      requiredUniqueIdentifier = v6->_requiredUniqueIdentifier;
      v6->_requiredUniqueIdentifier = (NSNumber *)v48;

      v6->_shouldCreateNewSession = xpc_dictionary_get_BOOL(v5, "19");
      v6->_shouldFollowAccountButtons = xpc_dictionary_get_BOOL(v5, "12");
      v6->_shouldIgnoreAccountConversion = xpc_dictionary_get_BOOL(v5, "36");
      v6->_shouldIgnoreProtocol = xpc_dictionary_get_BOOL(v5, "16");
      v6->_shouldPersonalizeResponseActions = xpc_dictionary_get_BOOL(v5, "35");
      v6->_shouldSuppressDialogs = xpc_dictionary_get_BOOL(v5, "17");
      v50 = objc_opt_class();
      v51 = SSXPCDictionaryCopyObjectWithClass(v5, "13", v50);
      signupRequestParameters = v6->_signupRequestParameters;
      v6->_signupRequestParameters = (NSDictionary *)v51;

      v6->_tokenType = xpc_dictionary_get_BOOL(v5, "14");
      v53 = objc_opt_class();
      v54 = SSXPCDictionaryCopyObjectWithClass(v5, "32", v53);
      touchIDContinueToken = v6->_touchIDContinueToken;
      v6->_touchIDContinueToken = (NSString *)v54;

      v56 = objc_opt_class();
      v57 = SSXPCDictionaryCopyObjectWithClass(v5, "15", v56);
      userAgentComponents = v6->_userAgentComponents;
      v6->_userAgentComponents = (NSArray *)v57;

    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;

  v5 = -[SSAuthenticationContext _initSSAuthenticationContext](+[SSAuthenticationContext allocWithZone:](SSAuthenticationContext, "allocWithZone:"), "_initSSAuthenticationContext");
  -[SSAuthenticationContext _copyIvarsToCopy:withZone:](self, "_copyIvarsToCopy:withZone:", v5, a3);
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v5;

  v5 = -[SSAuthenticationContext _initSSAuthenticationContext](+[SSMutableAuthenticationContext allocWithZone:](SSMutableAuthenticationContext, "allocWithZone:"), "_initSSAuthenticationContext");
  -[SSAuthenticationContext _copyIvarsToCopy:withZone:](self, "_copyIvarsToCopy:withZone:", v5, a3);
  return v5;
}

- (NSString)description
{
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22.receiver = self;
  v22.super_class = (Class)SSAuthenticationContext;
  -[SSAuthenticationContext description](&v22, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@:\n"), v4);

  -[SSAuthenticationContext accountName](self, "accountName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  accountName = %@\n"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("  accountScope = %ld\n"), -[SSAuthenticationContext accountScope](self, "accountScope"));
  objc_msgSend(v3, "appendFormat:", CFSTR("  allowsBootstrapCellularData = %d\n"), -[SSAuthenticationContext allowsBootstrapCellularData](self, "allowsBootstrapCellularData"));
  objc_msgSend(v3, "appendFormat:", CFSTR("  allowsRetry = %d\n"), -[SSAuthenticationContext allowsRetry](self, "allowsRetry"));
  objc_msgSend(v3, "appendFormat:", CFSTR("  allowsSilentAuthentication = %d\n"), -[SSAuthenticationContext allowsSilentAuthentication](self, "allowsSilentAuthentication"));
  -[SSAuthenticationContext altDSID](self, "altDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  altDSID = %@\n"), v6);

  -[SSAuthenticationContext cancelButtonLabel](self, "cancelButtonLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  cancelButtonLabel = %@\n"), v7);

  objc_msgSend(v3, "appendFormat:", CFSTR("  canCreateNewAccount = %d\n"), -[SSAuthenticationContext canCreateNewAccount](self, "canCreateNewAccount"));
  objc_msgSend(v3, "appendFormat:", CFSTR("  canSetActiveAccount = %d\n"), -[SSAuthenticationContext canSetActiveAccount](self, "canSetActiveAccount"));
  -[SSAuthenticationContext clientIdentifierHeader](self, "clientIdentifierHeader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  clientIdentifierHeader = %@\n"), v8);

  objc_msgSend(v3, "appendFormat:", CFSTR("  displaysOnLockScreen = %d\n"), -[SSAuthenticationContext displaysOnLockScreen](self, "displaysOnLockScreen"));
  -[SSAuthenticationContext HTTPHeaders](self, "HTTPHeaders");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  HTTPHeaders = %@\n"), v9);

  objc_msgSend(v3, "appendFormat:", CFSTR("  isAccountNameEditable = %d\n"), -[SSAuthenticationContext isAccountNameEditable](self, "isAccountNameEditable"));
  -[SSAuthenticationContext logUUID](self, "logUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  logUUID = %@\n"), v10);

  -[SSAuthenticationContext okButtonLabel](self, "okButtonLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  okButtonLabel = %@\n"), v11);

  objc_msgSend(v3, "appendFormat:", CFSTR("  persistsAcrossDeviceLock = %d\n"), -[SSAuthenticationContext persistsAcrossDeviceLock](self, "persistsAcrossDeviceLock"));
  objc_msgSend(v3, "appendFormat:", CFSTR("  persistsPasswordFallback = %d\n"), -[SSAuthenticationContext persistsPasswordFallback](self, "persistsPasswordFallback"));
  -[SSAuthenticationContext preferredITunesStoreClient](self, "preferredITunesStoreClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  preferrediTunesStoreClient = %@\n"), v12);

  objc_msgSend(v3, "appendFormat:", CFSTR("  promptStyle = %ld\n"), -[SSAuthenticationContext promptStyle](self, "promptStyle"));
  -[SSAuthenticationContext promptTitle](self, "promptTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  promptTitle = %@\n"), v13);

  -[SSAuthenticationContext reasonDescription](self, "reasonDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  reasonDescription = %@\n"), v14);

  -[SSAuthenticationContext requestParameters](self, "requestParameters");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  requestParameters = %@\n"), v15);

  -[SSAuthenticationContext requiredUniqueIdentifier](self, "requiredUniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  requiredUniqueIdentifier = %@\n"), v16);

  objc_msgSend(v3, "appendFormat:", CFSTR("  shouldCreateNewSession = %d\n"), -[SSAuthenticationContext shouldCreateNewSession](self, "shouldCreateNewSession"));
  objc_msgSend(v3, "appendFormat:", CFSTR("  shouldFollowAccountButtons = %d\n"), -[SSAuthenticationContext shouldFollowAccountButtons](self, "shouldFollowAccountButtons"));
  objc_msgSend(v3, "appendFormat:", CFSTR("  shouldIgnoreAccountConversion = %d\n"), -[SSAuthenticationContext shouldIgnoreAccountConversion](self, "shouldIgnoreAccountConversion"));
  objc_msgSend(v3, "appendFormat:", CFSTR("  shouldIgnoreProtocol = %d\n"), -[SSAuthenticationContext shouldIgnoreProtocol](self, "shouldIgnoreProtocol"));
  objc_msgSend(v3, "appendFormat:", CFSTR("  shouldSuppressDialogs = %d\n"), -[SSAuthenticationContext shouldSuppressDialogs](self, "shouldSuppressDialogs"));
  -[SSAuthenticationContext signupRequestParameters](self, "signupRequestParameters");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  signupRequestParameters = %@\n"), v17);

  objc_msgSend(v3, "appendFormat:", CFSTR("  tokenType = %ld\n"), -[SSAuthenticationContext tokenType](self, "tokenType"));
  -[SSAuthenticationContext touchIDContinueToken](self, "touchIDContinueToken");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  touchIDContinueToken = %@\n"), v18);

  -[SSAuthenticationContext URLBagContext](self, "URLBagContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  URLBagContext = %@\n"), v19);

  -[SSAuthenticationContext userAgentComponents](self, "userAgentComponents");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  userAgentComponents = %@"), v20);

  return (NSString *)v3;
}

- (BOOL)isAccountNameEditable
{
  return self->_accountNameEditable || -[NSString length](self->_accountName, "length") == 0;
}

- (BOOL)_allowCreateAccount
{
  return !SSDeviceIsAppleTV();
}

- (void)_copyIvarsToCopy:(id)a3 withZone:(_NSZone *)a4
{
  NSString *accountName;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;

  accountName = self->_accountName;
  v7 = a3;
  v8 = -[NSString copyWithZone:](accountName, "copyWithZone:", a4);
  v9 = (void *)*((_QWORD *)v7 + 1);
  *((_QWORD *)v7 + 1) = v8;

  *((_BYTE *)v7 + 16) = self->_accountNameEditable;
  *((_QWORD *)v7 + 3) = self->_accountScope;
  *((_BYTE *)v7 + 32) = self->_allowsBioAuthentication;
  *((_BYTE *)v7 + 33) = self->_allowsBootstrapCellularData;
  *((_BYTE *)v7 + 34) = self->_allowsRetry;
  *((_BYTE *)v7 + 35) = self->_allowsSilentAuthentication;
  v10 = -[NSString copyWithZone:](self->_altDSID, "copyWithZone:", a4);
  v11 = (void *)*((_QWORD *)v7 + 5);
  *((_QWORD *)v7 + 5) = v10;

  v12 = -[NSString copyWithZone:](self->_cancelButtonLabel, "copyWithZone:", a4);
  v13 = (void *)*((_QWORD *)v7 + 6);
  *((_QWORD *)v7 + 6) = v12;

  *((_BYTE *)v7 + 56) = self->_canCreateNewAccount;
  *((_BYTE *)v7 + 57) = self->_canSetActiveAccount;
  v14 = -[NSString copyWithZone:](self->_clientIdentifierHeader, "copyWithZone:", a4);
  v15 = (void *)*((_QWORD *)v7 + 8);
  *((_QWORD *)v7 + 8) = v14;

  *((_BYTE *)v7 + 72) = self->_displaysOnLockScreen;
  *((_BYTE *)v7 + 73) = self->_forceDaemonAuthentication;
  v16 = -[NSDictionary copyWithZone:](self->_httpHeaders, "copyWithZone:", a4);
  v17 = (void *)*((_QWORD *)v7 + 10);
  *((_QWORD *)v7 + 10) = v16;

  v18 = -[NSString copyWithZone:](self->_okButtonLabel, "copyWithZone:", a4);
  v19 = (void *)*((_QWORD *)v7 + 14);
  *((_QWORD *)v7 + 14) = v18;

  v20 = -[NSString copyWithZone:](self->_logUUID, "copyWithZone:", a4);
  v21 = (void *)*((_QWORD *)v7 + 11);
  *((_QWORD *)v7 + 11) = v20;

  v22 = -[NSString copyWithZone:](self->_password, "copyWithZone:", a4);
  v23 = (void *)*((_QWORD *)v7 + 12);
  *((_QWORD *)v7 + 12) = v22;

  v24 = -[NSString copyWithZone:](self->_passwordEquivalentToken, "copyWithZone:", a4);
  v25 = (void *)*((_QWORD *)v7 + 13);
  *((_QWORD *)v7 + 13) = v24;

  *((_BYTE *)v7 + 120) = self->_persistsAcrossDeviceLock;
  v26 = -[NSString copyWithZone:](self->_preferredITunesStoreClient, "copyWithZone:", a4);
  v27 = (void *)*((_QWORD *)v7 + 16);
  *((_QWORD *)v7 + 16) = v26;

  *((_QWORD *)v7 + 18) = self->_promptStyle;
  objc_storeStrong((id *)v7 + 17, self->_promptTitle);
  *((_BYTE *)v7 + 121) = self->_persistsPasswordFallback;
  v28 = -[NSString copyWithZone:](self->_reasonDescription, "copyWithZone:", a4);
  v29 = (void *)*((_QWORD *)v7 + 19);
  *((_QWORD *)v7 + 19) = v28;

  v30 = -[NSDictionary copyWithZone:](self->_requestParameters, "copyWithZone:", a4);
  v31 = (void *)*((_QWORD *)v7 + 20);
  *((_QWORD *)v7 + 20) = v30;

  v32 = -[NSNumber copyWithZone:](self->_requiredUniqueIdentifier, "copyWithZone:", a4);
  v33 = (void *)*((_QWORD *)v7 + 21);
  *((_QWORD *)v7 + 21) = v32;

  *((_BYTE *)v7 + 176) = self->_shouldCreateNewSession;
  *((_BYTE *)v7 + 177) = self->_shouldFollowAccountButtons;
  *((_BYTE *)v7 + 178) = self->_shouldIgnoreAccountConversion;
  *((_BYTE *)v7 + 179) = self->_shouldIgnoreProtocol;
  *((_BYTE *)v7 + 180) = self->_shouldPersonalizeResponseActions;
  *((_BYTE *)v7 + 181) = self->_shouldSuppressDialogs;
  v34 = -[NSDictionary copyWithZone:](self->_signupRequestParameters, "copyWithZone:", a4);
  v35 = (void *)*((_QWORD *)v7 + 23);
  *((_QWORD *)v7 + 23) = v34;

  *((_QWORD *)v7 + 24) = self->_tokenType;
  v36 = -[NSString copyWithZone:](self->_touchIDContinueToken, "copyWithZone:", a4);
  v37 = (void *)*((_QWORD *)v7 + 25);
  *((_QWORD *)v7 + 25) = v36;

  v38 = -[NSArray copyWithZone:](self->_userAgentComponents, "copyWithZone:", a4);
  v39 = (id)*((_QWORD *)v7 + 26);
  *((_QWORD *)v7 + 26) = v38;

}

- (NSString)accountName
{
  return self->_accountName;
}

- (int64_t)accountScope
{
  return self->_accountScope;
}

- (BOOL)allowsBioAuthentication
{
  return self->_allowsBioAuthentication;
}

- (BOOL)allowsBootstrapCellularData
{
  return self->_allowsBootstrapCellularData;
}

- (BOOL)allowsRetry
{
  return self->_allowsRetry;
}

- (BOOL)allowsSilentAuthentication
{
  return self->_allowsSilentAuthentication;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (NSString)cancelButtonLabel
{
  return self->_cancelButtonLabel;
}

- (BOOL)canCreateNewAccount
{
  return self->_canCreateNewAccount;
}

- (BOOL)canSetActiveAccount
{
  return self->_canSetActiveAccount;
}

- (NSString)clientIdentifierHeader
{
  return self->_clientIdentifierHeader;
}

- (BOOL)displaysOnLockScreen
{
  return self->_displaysOnLockScreen;
}

- (BOOL)forceDaemonAuthentication
{
  return self->_forceDaemonAuthentication;
}

- (NSDictionary)HTTPHeaders
{
  return self->_httpHeaders;
}

- (NSString)logUUID
{
  return self->_logUUID;
}

- (NSString)password
{
  return self->_password;
}

- (NSString)passwordEquivalentToken
{
  return self->_passwordEquivalentToken;
}

- (NSString)okButtonLabel
{
  return self->_okButtonLabel;
}

- (BOOL)persistsAcrossDeviceLock
{
  return self->_persistsAcrossDeviceLock;
}

- (BOOL)persistsPasswordFallback
{
  return self->_persistsPasswordFallback;
}

- (NSString)preferredITunesStoreClient
{
  return self->_preferredITunesStoreClient;
}

- (int64_t)promptStyle
{
  return self->_promptStyle;
}

- (NSString)promptTitle
{
  return self->_promptTitle;
}

- (NSString)reasonDescription
{
  return self->_reasonDescription;
}

- (NSDictionary)requestParameters
{
  return self->_requestParameters;
}

- (NSNumber)requiredUniqueIdentifier
{
  return self->_requiredUniqueIdentifier;
}

- (BOOL)shouldCreateNewSession
{
  return self->_shouldCreateNewSession;
}

- (BOOL)shouldFollowAccountButtons
{
  return self->_shouldFollowAccountButtons;
}

- (BOOL)shouldIgnoreAccountConversion
{
  return self->_shouldIgnoreAccountConversion;
}

- (BOOL)shouldIgnoreProtocol
{
  return self->_shouldIgnoreProtocol;
}

- (BOOL)shouldPersonalizeResponseActions
{
  return self->_shouldPersonalizeResponseActions;
}

- (BOOL)shouldSuppressDialogs
{
  return self->_shouldSuppressDialogs;
}

- (NSDictionary)signupRequestParameters
{
  return self->_signupRequestParameters;
}

- (int64_t)tokenType
{
  return self->_tokenType;
}

- (NSString)touchIDContinueToken
{
  return self->_touchIDContinueToken;
}

- (NSArray)userAgentComponents
{
  return self->_userAgentComponents;
}

- (BOOL)isDemoAccount
{
  return self->_demoAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgentComponents, 0);
  objc_storeStrong((id *)&self->_touchIDContinueToken, 0);
  objc_storeStrong((id *)&self->_signupRequestParameters, 0);
  objc_storeStrong((id *)&self->_requiredUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_requestParameters, 0);
  objc_storeStrong((id *)&self->_reasonDescription, 0);
  objc_storeStrong((id *)&self->_promptTitle, 0);
  objc_storeStrong((id *)&self->_preferredITunesStoreClient, 0);
  objc_storeStrong((id *)&self->_okButtonLabel, 0);
  objc_storeStrong((id *)&self->_passwordEquivalentToken, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_logUUID, 0);
  objc_storeStrong((id *)&self->_httpHeaders, 0);
  objc_storeStrong((id *)&self->_clientIdentifierHeader, 0);
  objc_storeStrong((id *)&self->_cancelButtonLabel, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_accountName, 0);
}

@end
