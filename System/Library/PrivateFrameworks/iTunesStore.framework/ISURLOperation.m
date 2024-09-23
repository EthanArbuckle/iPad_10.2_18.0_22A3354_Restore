@implementation ISURLOperation

- (ISURLOperation)init
{
  void *v3;
  ISURLOperation *v4;

  objc_msgSend(MEMORY[0x24BEB2010], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ISURLOperation initWithSessionManager:](self, "initWithSessionManager:", v3);

  return v4;
}

- (ISURLOperation)initWithSessionManager:(id)a3
{
  id v5;
  ISURLOperation *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *dataBufferAccessQueue;
  uint64_t v9;
  NSString *logKey;
  SSMutableURLRequestProperties *v11;
  SSMutableURLRequestProperties *requestProperties;
  objc_super v14;

  v5 = a3;
  __ISRecordSPIClassUsage(self);
  v14.receiver = self;
  v14.super_class = (Class)ISURLOperation;
  v6 = -[ISOperation init](&v14, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.iTunesStore.ISURLOperation", 0);
    dataBufferAccessQueue = v6->_dataBufferAccessQueue;
    v6->_dataBufferAccessQueue = (OS_dispatch_queue *)v7;

    SSGenerateLogCorrelationString();
    v9 = objc_claimAutoreleasedReturnValue();
    logKey = v6->_logKey;
    v6->_logKey = (NSString *)v9;

    v11 = (SSMutableURLRequestProperties *)objc_alloc_init(MEMORY[0x24BEB1F30]);
    requestProperties = v6->_requestProperties;
    v6->_requestProperties = v11;

    v6->_shouldSetCookies = 1;
    objc_storeStrong((id *)&v6->_urlSessionManager, a3);
    v6->_usesPrivateCookieStore = 1;
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[ISDataProvider setParentOperation:](self->_dataProvider, "setParentOperation:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ISURLOperation;
  -[ISURLOperation dealloc](&v3, sel_dealloc);
}

- (SSAuthenticationContext)authenticationContext
{
  SSAuthenticationContext *v3;

  -[ISOperation lock](self, "lock");
  v3 = self->_authenticationContext;
  -[ISOperation unlock](self, "unlock");
  return v3;
}

+ (id)copyUserAgent
{
  if (copyUserAgent_sUserAgentGuard != -1)
    dispatch_once(&copyUserAgent_sUserAgentGuard, &__block_literal_global_3);
  return (id)copyUserAgent_sUserAgent;
}

void __31__ISURLOperation_copyUserAgent__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userAgent");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)copyUserAgent_sUserAgent;
  copyUserAgent_sUserAgent = v0;

}

- (id)request
{
  ISURLRequest *v3;

  -[ISOperation lock](self, "lock");
  v3 = -[ISURLRequest initWithRequestProperties:]([ISURLRequest alloc], "initWithRequestProperties:", self->_requestProperties);
  -[ISOperation unlock](self, "unlock");
  return v3;
}

- (SSURLRequestProperties)requestProperties
{
  void *v3;

  -[ISOperation lock](self, "lock");
  v3 = (void *)-[SSMutableURLRequestProperties copy](self->_requestProperties, "copy");
  -[ISOperation unlock](self, "unlock");
  return (SSURLRequestProperties *)v3;
}

- (void)setAuthenticationContext:(id)a3
{
  void *v5;
  NSString *v6;
  NSString *logKey;
  id v8;

  v8 = a3;
  -[ISOperation lock](self, "lock");
  objc_storeStrong((id *)&self->_authenticationContext, a3);
  objc_msgSend(v8, "logUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v8, "logUUID");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    logKey = self->_logKey;
    self->_logKey = v6;

  }
  -[ISOperation unlock](self, "unlock");

}

- (void)setRequest:(id)a3
{
  id v4;
  void *v5;
  SSMutableURLRequestProperties *v6;
  SSMutableURLRequestProperties *requestProperties;

  v4 = a3;
  -[ISOperation lock](self, "lock");
  objc_msgSend(v4, "requestProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (SSMutableURLRequestProperties *)objc_msgSend(v5, "mutableCopy");
  requestProperties = self->_requestProperties;
  self->_requestProperties = v6;

  -[ISOperation unlock](self, "unlock");
}

- (void)setRequestProperties:(id)a3
{
  SSMutableURLRequestProperties *v4;
  SSMutableURLRequestProperties *requestProperties;
  SSMutableURLRequestProperties *v6;

  v6 = (SSMutableURLRequestProperties *)a3;
  -[ISOperation lock](self, "lock");
  if (self->_requestProperties != v6)
  {
    v4 = (SSMutableURLRequestProperties *)-[SSMutableURLRequestProperties mutableCopy](v6, "mutableCopy");
    requestProperties = self->_requestProperties;
    self->_requestProperties = v4;

  }
  -[ISOperation unlock](self, "unlock");

}

- (void)run
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  NSObject *v20;
  void *v21;
  int v22;
  id v23;
  void *v24;
  void *v25;
  int *v26;
  uint64_t v27;
  id v28;
  int v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v28 = -[ISURLOperation _copyAuthenticationContext](self, "_copyAuthenticationContext");
  -[ISURLOperation dataProvider](self, "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ISOperation copySerializationLocks](self, "copySerializationLocks");
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "makeObjectsPerformSelector:", sel_lock);
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7 = objc_msgSend(v6, "shouldLog");
    if (objc_msgSend(v6, "shouldLogToDisk"))
      v8 = v7 | 2;
    else
      v8 = v7;
    objc_msgSend(v6, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      v10 = v8;
    else
      v10 = v8 & 2;
    if (v10)
    {
      v11 = (void *)objc_opt_class();
      v12 = v11;
      -[ISOperation serializationLockIdentifiers](self, "serializationLockIdentifiers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138412546;
      v30 = v11;
      v31 = 2112;
      v32 = v13;
      LODWORD(v27) = 22;
      v26 = &v29;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (v14)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 4, &v29, v27);
        v15 = (int *)objc_claimAutoreleasedReturnValue();
        free(v14);
        v26 = v15;
        SSFileLog();

      }
    }
    else
    {

    }
    -[ISOperation sendDidTakeSerializationLocks](self, "sendDidTakeSerializationLocks");
  }
  +[ISNetworkObserver sharedInstance](ISNetworkObserver, "sharedInstance", v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "beginUsingNetwork");
  objc_msgSend(v3, "setAuthenticationContext:", v28);
  objc_msgSend(v3, "setParentOperation:", self);
  -[ISURLOperation _run](self, "_run");
  objc_msgSend(v3, "setParentOperation:", 0);
  if (-[ISURLOperation isCancelled](self, "isCancelled") && objc_msgSend(v3, "isStream"))
    objc_msgSend(v3, "streamCancelled");
  objc_msgSend(v16, "endUsingNetwork");
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v18 = objc_msgSend(v17, "shouldLog");
    v19 = objc_msgSend(v17, "shouldLogToDisk");
    objc_msgSend(v17, "OSLogObject");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v19)
      v18 |= 2u;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      v22 = v18;
    else
      v22 = v18 & 2;
    if (v22)
    {
      v23 = (id)objc_opt_class();
      -[ISOperation serializationLockIdentifiers](self, "serializationLockIdentifiers");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138412546;
      v30 = v23;
      v31 = 2112;
      v32 = v24;
      LODWORD(v27) = 22;
      v25 = (void *)_os_log_send_and_compose_impl();

      if (!v25)
      {
LABEL_30:

        objc_msgSend(v5, "makeObjectsPerformSelector:", sel_unlock);
        goto LABEL_31;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v25, 4, &v29, v27);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      free(v25);
      SSFileLog();
    }

    goto LABEL_30;
  }
LABEL_31:

}

- (BOOL)handleRedirectFromDataProvider:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  int v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSCountedSet *redirectURLs;
  NSCountedSet *v19;
  NSCountedSet *v20;
  void *v21;
  id v22;
  id v23;
  int *v25;
  uint64_t v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "redirectURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "schemeSwizzledURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = objc_msgSend(v7, "shouldLog");
  if (objc_msgSend(v7, "shouldLogToDisk"))
    v9 = v8 | 2;
  else
    v9 = v8;
  objc_msgSend(v7, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    v11 = v9;
  else
    v11 = v9 & 2;
  if (v11)
  {
    v12 = (void *)objc_opt_class();
    v13 = v12;
    -[ISURLOperation _activeURL](self, "_activeURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISURLOperation _sanitizedURLForURL:](self, "_sanitizedURLForURL:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISURLOperation _sanitizedURLForURL:](self, "_sanitizedURLForURL:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138412802;
    v28 = v12;
    v29 = 2112;
    v30 = v15;
    v31 = 2112;
    v32 = v16;
    LODWORD(v26) = 32;
    v25 = &v27;
    v17 = (void *)_os_log_send_and_compose_impl();

    if (!v17)
      goto LABEL_13;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v17, 4, &v27, v26);
    v10 = objc_claimAutoreleasedReturnValue();
    free(v17);
    v25 = (int *)v10;
    SSFileLog();
  }

LABEL_13:
  redirectURLs = self->_redirectURLs;
  if (!redirectURLs)
  {
    v19 = (NSCountedSet *)objc_alloc_init(MEMORY[0x24BDD14E0]);
    v20 = self->_redirectURLs;
    self->_redirectURLs = v19;

    redirectURLs = self->_redirectURLs;
  }
  -[NSCountedSet addObject:](redirectURLs, "addObject:", v6, v25);
  -[ISURLOperation _requestProperties](self, "_requestProperties");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[ISURLOperation _copyQueryStringDictionaryForRedirect:](self, "_copyQueryStringDictionaryForRedirect:", v6);
  objc_msgSend(v21, "setRequestParameters:", v22);
  v23 = -[ISURLOperation newRequestWithURL:](self, "newRequestWithURL:", v6);
  -[ISURLOperation _setActiveURLRequest:](self, "_setActiveURLRequest:", v23);

  return 1;
}

- (id)newRequestWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  _BOOL4 v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  int v67;
  NSObject *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  ISURLOperation *v82;
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  int v92;
  void *v93;
  __int16 v94;
  void *v95;
  __int16 v96;
  uint64_t v97;
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ISURLOperation _requestProperties](self, "_requestProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("data"));

  v82 = self;
  if (!v7)
  {
    v15 = objc_alloc(MEMORY[0x24BDD16B0]);
    objc_msgSend(v5, "timeoutInterval");
    v16 = (void *)objc_msgSend(v15, "initWithURL:cachePolicy:timeoutInterval:", v4, 1);
    goto LABEL_43;
  }
  objc_msgSend(v5, "HTTPBody");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "HTTPBodyStream");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "HTTPHeaders");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "HTTPMethod");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestParameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    if (!(v8 | v9))
    {
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("POST")))
      {
        ISDictionaryValueForCaseInsensitiveString(v79, CFSTR("Content-Type"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("application/json"));

        if (v13)
          objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v11, 0, 0);
        else
          objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v11, 100, 0, 0);
        v14 = objc_claimAutoreleasedReturnValue();
        v8 = 0;
        if (v14)
        {
          v17 = v11;
          v11 = 0;
          v8 = v14;
LABEL_14:

          goto LABEL_15;
        }
      }
      else
      {
        v8 = 0;
      }
    }
    if (v11)
    {
      objc_msgSend(v4, "urlBySettingQueryStringDictionary:", v11);
      v18 = objc_claimAutoreleasedReturnValue();
      v17 = v4;
      v4 = (id)v18;
      goto LABEL_14;
    }
  }
LABEL_15:
  objc_msgSend(v5, "timeoutInterval");
  v19 = 10.0;
  if (v20 > 10.0)
  {
    objc_msgSend(v5, "timeoutInterval");
    v19 = v21;
  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16B0]), "initWithURL:cachePolicy:timeoutInterval:", v4, objc_msgSend(v5, "cachePolicy"), v19);
  objc_msgSend(v16, "setHTTPShouldUsePipelining:", 1);
  objc_msgSend(v16, "setNetworkServiceType:", objc_msgSend(v5, "networkServiceType"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(objc_retainAutorelease(v16), "_CFURLRequest");
    CFURLRequestSetShouldStartSynchronously();
    if ((objc_msgSend(v5, "shouldDecodeResponse") & 1) == 0)
      _CFURLRequestSetProtocolProperty();
  }
  v22 = -[ISURLOperation _usesPrivateCookieStore](self, "_usesPrivateCookieStore");
  objc_msgSend(v16, "setHTTPShouldHandleCookies:", !v22);
  if (v8)
    objc_msgSend(v16, "setHTTPBody:", v8);
  if (v9)
    objc_msgSend(v16, "setHTTPBodyStream:", v9);
  v78 = (void *)v9;
  if (v10)
    objc_msgSend(v16, "setHTTPMethod:", v10);
  v76 = v11;
  v77 = v10;
  v80 = v4;
  if (v22)
  {
    -[ISURLOperation _requestProperties](self, "_requestProperties");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "URLBagType");
    v24 = SSAccountScopeForURLBagType();

    objc_msgSend(MEMORY[0x24BEB2020], "sharedStorage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISURLOperation _accountIdentifier](v82, "_accountIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "cookieHeadersForURL:userIdentifier:scope:", v4, v26, v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    v28 = v27;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v88, v99, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v89;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v89 != v31)
            objc_enumerationMutation(v28);
          v33 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * i);
          objc_msgSend(v28, "objectForKey:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (void *)objc_msgSend(v34, "copy");
          objc_msgSend(v16, "addValue:forHTTPHeaderField:", v35, v33);

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v88, v99, 16);
      }
      while (v30);
    }

  }
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v36 = v79;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v84, v98, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v85;
    do
    {
      for (j = 0; j != v38; ++j)
      {
        if (*(_QWORD *)v85 != v39)
          objc_enumerationMutation(v36);
        v41 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * j);
        objc_msgSend(v36, "objectForKey:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (void *)objc_msgSend(v42, "copy");
        objc_msgSend(v16, "setValue:forHTTPHeaderField:", v43, v41);

      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v84, v98, 16);
    }
    while (v38);
  }

  v4 = v80;
  self = v82;
LABEL_43:
  v44 = *MEMORY[0x24BEB2518];
  objc_msgSend(v16, "valueForHTTPHeaderField:", *MEMORY[0x24BEB2518]);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45
    || (+[ISClient currentClient](ISClient, "currentClient"),
        v46 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v46, "userAgent"),
        v45 = (void *)objc_claimAutoreleasedReturnValue(),
        v46,
        v45)
    || (v45 = (void *)objc_msgSend((id)objc_opt_class(), "copyUserAgent")) != 0)
  {
    objc_msgSend(v5, "userAgentComponents");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)objc_msgSend(v47, "mutableCopy");

    if (objc_msgSend(v48, "count"))
    {
      objc_msgSend(v48, "insertObject:atIndex:", v45, 0);
      objc_msgSend(v48, "componentsJoinedByString:", CFSTR(" "));
      v49 = objc_claimAutoreleasedReturnValue();

      v45 = (void *)v49;
    }
    v50 = (void *)objc_msgSend(v45, "copy");
    objc_msgSend(v16, "setValue:forHTTPHeaderField:", v50, v44);

  }
  if (MGGetBoolAnswer())
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "bundleIdentifier");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setValue:forHTTPHeaderField:", v52, CFSTR("X-Apple-Issuing-Process"));

    objc_msgSend(v5, "clientBundleIdentifier");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)objc_msgSend(v53, "copy");
    objc_msgSend(v16, "setValue:forHTTPHeaderField:", v54, CFSTR("X-Apple-Requesting-Process"));

    -[ISURLOperation _stringForCachePolicy:](self, "_stringForCachePolicy:", objc_msgSend(v5, "cachePolicy"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (void *)objc_msgSend(v55, "copy");
    objc_msgSend(v16, "setValue:forHTTPHeaderField:", v56, CFSTR("X-Apple-NSURLCachePolicy"));

  }
  objc_msgSend(MEMORY[0x24BEB2040], "currentAcceptLanguage");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (void *)objc_msgSend(v57, "copy");
  objc_msgSend(v16, "setValue:forHTTPHeaderField:", v58, CFSTR("Accept-Language"));

  objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v59, "secondsFromGMT");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "stringValue");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setValue:forHTTPHeaderField:", v62, CFSTR("X-Apple-Tz"));

  -[ISURLOperation dataProvider](self, "dataProvider");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v63, "isStream"))
  {
    objc_msgSend(v63, "setup");
    v64 = objc_msgSend(v63, "streamedBytes");
    if (v64 >= 1)
    {
      v65 = v64;
      objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v66)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v67 = objc_msgSend(v66, "shouldLog");
      if (objc_msgSend(v66, "shouldLogToDisk"))
        v67 |= 2u;
      objc_msgSend(v66, "OSLogObject");
      v68 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
        v67 &= 2u;
      if (v67)
      {
        v81 = v4;
        v69 = (void *)objc_opt_class();
        v83 = v69;
        v70 = (void *)objc_opt_class();
        v92 = 138412802;
        v93 = v69;
        v94 = 2112;
        v95 = v70;
        v96 = 2048;
        v97 = v65;
        v71 = v70;
        LODWORD(v75) = 32;
        v72 = (void *)_os_log_send_and_compose_impl();

        v4 = v81;
        if (!v72)
        {
LABEL_63:

          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("bytes=%lld-"), v65);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setValue:forHTTPHeaderField:", v73, CFSTR("Range"));

          goto LABEL_64;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v72, 4, &v92, v75);
        v68 = objc_claimAutoreleasedReturnValue();
        free(v72);
        SSFileLog();
      }

      goto LABEL_63;
    }
  }
LABEL_64:

  return v16;
}

- (BOOL)shouldFollowRedirectWithRequest:(id)a3 returningError:(id *)a4
{
  if (a4)
    *a4 = 0;
  return 1;
}

- (NSNumber)metricsLoadURLSessionDuration
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[ISOperation delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[ISOperation delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "metricsLoadURLSessionDuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSNumber *)v6;
}

- (NSNumber)metricsLoadURLSamplingPercentage
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[ISOperation delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[ISOperation delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "metricsLoadURLSamplingPercentage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSNumber *)v6;
}

- (NSNumber)metricsLoadURLSamplingPercentageCachedResponses
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[ISOperation delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[ISOperation delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "metricsLoadURLSamplingPercentageCachedResponses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSNumber *)v6;
}

- (NSData)rawResponseData
{
  return (NSData *)self->_dataBuffer;
}

- (BOOL)shouldDisableCellular
{
  void *v2;
  char v3;

  -[ISURLOperation _requestProperties](self, "_requestProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldDisableCellular");

  return v3;
}

- (BOOL)shouldRequireCellular
{
  void *v2;
  char v3;

  -[ISURLOperation _requestProperties](self, "_requestProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "requiresCellularDataNetwork");

  return v3;
}

- (BOOL)shouldSetCookies
{
  return self->_shouldSetCookies;
}

- (NSData)sourceAppAuditTokenData
{
  void *v2;
  void *v3;

  -[ISURLOperation _requestProperties](self, "_requestProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientAuditTokenData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (NSString)sourceAppBundleID
{
  void *v2;
  void *v3;

  -[ISURLOperation _requestProperties](self, "_requestProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientAuditBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSURLCache)URLCache
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD block[5];

  -[ISOperation delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[ISOperation delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[ISOperation delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "URLCache");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      return (NSURLCache *)v7;
    }
  }
  else
  {

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__ISURLOperation_URLCache__block_invoke;
  block[3] = &unk_24C43C128;
  block[4] = self;
  if (URLCache_onceToken != -1)
    dispatch_once(&URLCache_onceToken, block);
  v7 = (id)URLCache_sURLCache;
  return (NSURLCache *)v7;
}

void __26__ISURLOperation_URLCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  if (objc_msgSend((id)objc_opt_class(), "_sharedCacheStorageSession"))
  {
    v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1800]), "_initWithExistingCFURLCache:", objc_msgSend((id)objc_opt_class(), "sharedCFURLCache"));
    v1 = (void *)URLCache_sURLCache;
    URLCache_sURLCache = v0;

  }
}

- (NSString)URLCacheID
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD block[5];

  -[ISOperation delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[ISOperation delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLCacheID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      -[ISOperation delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "URLCacheID");
      v8 = (id)objc_claimAutoreleasedReturnValue();

      return (NSString *)v8;
    }
  }
  else
  {

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__ISURLOperation_URLCacheID__block_invoke;
  block[3] = &unk_24C43C128;
  block[4] = self;
  if (URLCacheID_onceToken != -1)
    dispatch_once(&URLCacheID_onceToken, block);
  v8 = (id)URLCacheID_sURLCacheID;
  return (NSString *)v8;
}

void __28__ISURLOperation_URLCacheID__block_invoke()
{
  uint64_t v0;
  void *v1;

  if (objc_msgSend((id)objc_opt_class(), "_sharedCacheStorageSession"))
  {
    v0 = _CFURLStorageSessionCopyIdentifier();
    v1 = (void *)URLCacheID_sURLCacheID;
    URLCacheID_sURLCacheID = v0;

  }
}

- (id)URLSession:(id)a3 task:(id)a4 decodedDataForResponseData:(id)a5
{
  return -[ISURLOperation _decodedDataForData:](self, "_decodedDataForData:", a5, a4);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithEvent:(id)a5 error:(id)a6
{
  id v8;
  id v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  NSObject *v24;
  void *v25;
  NSURLSessionTask *urlSessionTask;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  int v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a6;
  if ((objc_msgSend(v8, "isEqual:", self->_urlSessionTask) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v22 = objc_msgSend(v21, "shouldLog");
    if (objc_msgSend(v21, "shouldLogToDisk"))
      v23 = v22 | 2;
    else
      v23 = v22;
    objc_msgSend(v21, "OSLogObject");
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      v23 &= 2u;
    if (v23)
    {
      v25 = (void *)objc_opt_class();
      urlSessionTask = self->_urlSessionTask;
      v31 = 138413058;
      v32 = v25;
      v33 = 2114;
      v34 = v8;
      v35 = 2114;
      v36 = urlSessionTask;
      v37 = 2114;
      v38 = v9;
      v27 = v25;
      LODWORD(v29) = 42;
      v28 = (void *)_os_log_send_and_compose_impl();

      if (!v28)
      {
LABEL_27:

        goto LABEL_29;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v28, 4, &v31, v29);
      v24 = objc_claimAutoreleasedReturnValue();
      free(v28);
      SSFileLog();
    }

    goto LABEL_27;
  }
  if (!v9)
  {
    -[ISURLOperation _handleFinishedLoading](self, "_handleFinishedLoading");
    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = objc_msgSend(v10, "shouldLog");
  if (objc_msgSend(v10, "shouldLogToDisk"))
    v12 = v11 | 2;
  else
    v12 = v11;
  objc_msgSend(v10, "OSLogObject");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    v14 = v12;
  else
    v14 = v12 & 2;
  if (!v14)
    goto LABEL_14;
  v15 = (void *)objc_opt_class();
  v30 = v15;
  -[ISURLOperation _sanitizedDescriptionForObject:](self, "_sanitizedDescriptionForObject:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISURLOperation _activeURL](self, "_activeURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISURLOperation _sanitizedURLForURL:](self, "_sanitizedURLForURL:", v17);
  v31 = 138412802;
  v32 = v15;
  v33 = 2112;
  v34 = v16;
  v35 = 2112;
  v36 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v29) = 32;
  v18 = (void *)_os_log_send_and_compose_impl();

  if (v18)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v18, 4, &v31, v29);
    v13 = objc_claimAutoreleasedReturnValue();
    free(v18);
    SSFileLog();
LABEL_14:

  }
  ISErrorWithExternalError(v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISURLOperation _errorWithDefaultStringsForError:](self, "_errorWithDefaultStringsForError:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISOperation setError:](self, "setError:", v20);

  -[ISURLOperation _stopConnection](self, "_stopConnection");
LABEL_29:

}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCreatingHTTPArchive:(id)a5
{
  SSHTTPArchive *v6;
  SSHTTPArchive *httpArchive;

  v6 = (SSHTTPArchive *)a5;
  -[ISOperation lock](self, "lock");
  httpArchive = self->_httpArchive;
  self->_httpArchive = v6;

  -[ISOperation unlock](self, "unlock");
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v8;
  void (**v9)(id, uint64_t, void *);
  id WeakRetained;
  id v11;
  char v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  ISAuthenticationChallengeOperation *v21;
  void *v22;
  int v23;
  NSObject *v24;
  int v25;
  void *v26;
  ISAuthenticationChallengeOperation *v27;
  BOOL v28;
  id v29;
  void *v30;
  void *v31;
  int v32;
  NSObject *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  int *v38;
  uint64_t v39;
  id v40;
  id v41;
  ISURLAuthenticationChallenge *v42;
  ISAuthenticationChallengeOperation *v43;
  id v44;
  int v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = (void (**)(id, uint64_t, void *))a6;
  -[ISOperation lock](self, "lock");
  WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {

  }
  else
  {
    v11 = objc_loadWeakRetained((id *)&self->super._delegate);
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) == 0)
    {
      -[ISOperation unlock](self, "unlock");
      v13 = 0;
      goto LABEL_9;
    }
  }
  v13 = objc_loadWeakRetained((id *)&self->super._delegate);
  -[ISOperation unlock](self, "unlock");
  if (!v13 || (objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_9:
    objc_msgSend(v8, "protectionSpace");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "authenticationMethod");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x24BDD12D0]))
    {
      v15 = -[ISURLOperation _defaultAuthChallengeDispositionForChallenge:](self, "_defaultAuthChallengeDispositionForChallenge:", v8);
      v18 = 0;
LABEL_48:

      goto LABEL_49;
    }
    -[ISURLOperation _requestProperties](self, "_requestProperties");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "isITunesStoreRequest") & 1) != 0)
    {

LABEL_14:
      if ((objc_msgSend(MEMORY[0x24BE08100], "QAMode") & 1) != 0
        || (objc_msgSend(MEMORY[0x24BE08100], "ignoreServerTrustEvaluation") & 1) != 0
        || SSDebugShouldIgnoreExtendedValidation())
      {
        objc_msgSend(MEMORY[0x24BDD1818], "credentialForTrust:", objc_msgSend(v16, "serverTrust"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0;
      }
      else
      {
        v18 = 0;
        v15 = 1;
      }
      goto LABEL_48;
    }
    v20 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x24BDD12F8]);

    if ((v20 & 1) != 0)
      goto LABEL_14;
    v21 = objc_alloc_init(ISAuthenticationChallengeOperation);
    v42 = -[ISURLAuthenticationChallenge initWithAuthenticationChallenge:]([ISURLAuthenticationChallenge alloc], "initWithAuthenticationChallenge:", v8);
    v43 = v21;
    -[ISAuthenticationChallengeOperation setChallenge:](v21, "setChallenge:");
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v23 = objc_msgSend(v22, "shouldLog");
    if (objc_msgSend(v22, "shouldLogToDisk"))
      v23 |= 2u;
    objc_msgSend(v22, "OSLogObject");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      v25 = v23;
    else
      v25 = v23 & 2;
    if (v25)
    {
      v45 = 138412290;
      v46 = (id)objc_opt_class();
      v40 = v46;
      LODWORD(v39) = 12;
      v38 = &v45;
      v26 = (void *)_os_log_send_and_compose_impl();

      if (!v26)
        goto LABEL_29;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v26, 4, &v45, v39);
      v24 = objc_claimAutoreleasedReturnValue();
      free(v26);
      v38 = (int *)v24;
      SSFileLog();
    }

LABEL_29:
    v44 = 0;
    v27 = v43;
    v28 = -[ISOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v43, &v44);
    v29 = v44;
    v30 = v29;
    if (v28)
    {
      -[ISAuthenticationChallengeOperation credential](v43, "credential");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 2 * (v18 == 0);
LABEL_44:

      goto LABEL_48;
    }
    v41 = v29;
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v31)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v32 = objc_msgSend(v31, "shouldLog", v38);
    if (objc_msgSend(v31, "shouldLogToDisk"))
      v32 |= 2u;
    objc_msgSend(v31, "OSLogObject");
    v33 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      v32 &= 2u;
    if (v32)
    {
      v34 = (void *)objc_opt_class();
      v45 = 138412290;
      v46 = v34;
      v35 = v34;
      LODWORD(v39) = 12;
      v36 = (void *)_os_log_send_and_compose_impl();

      v27 = v43;
      if (!v36)
      {
LABEL_43:

        v30 = v41;
        -[ISURLOperation _errorWithDefaultStringsForError:](self, "_errorWithDefaultStringsForError:", v41);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[ISOperation setError:](self, "setError:", v37);

        v15 = -[ISURLOperation _defaultAuthChallengeDispositionForChallenge:](self, "_defaultAuthChallengeDispositionForChallenge:", v8);
        v18 = 0;
        goto LABEL_44;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v36, 4, &v45, v39);
      v33 = objc_claimAutoreleasedReturnValue();
      free(v36);
      SSFileLog();
    }

    goto LABEL_43;
  }
  v14 = objc_msgSend(v13, "operation:dispositionForAuthenticationChallenge:", self, v8);
  if (v14)
  {
    v15 = v14;
LABEL_46:
    v18 = 0;
    goto LABEL_49;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v15 = 0;
    goto LABEL_46;
  }
  objc_msgSend(v13, "operation:credentialForAuthenticationChallenge:", self, v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
LABEL_49:
  v9[2](v9, v15, v18);

}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  SSOperationProgress *progress;
  SSOperationProgress *v12;
  SSOperationProgress *v13;
  _BOOL4 v14;
  void *v15;
  int v16;
  int v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _BYTE v23[24];
  int64_t v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (-[ISURLOperation isUploadProgressRequested](self, "isUploadProgressRequested", a3, a4))
  {
    -[ISOperation lock](self, "lock");
    progress = self->super._progress;
    if (!progress)
    {
      v12 = (SSOperationProgress *)objc_alloc_init(MEMORY[0x24BEB1F40]);
      v13 = self->super._progress;
      self->super._progress = v12;

      progress = self->super._progress;
    }
    v14 = -[SSOperationProgress operationType](progress, "operationType") != 3
       || -[SSOperationProgress maxValue](self->super._progress, "maxValue") != a7;
    -[SSOperationProgress setCanPause:](self->super._progress, "setCanPause:", 0);
    -[SSOperationProgress resetSnapshots](self->super._progress, "resetSnapshots");
    -[SSOperationProgress setMaxValue:](self->super._progress, "setMaxValue:", a7);
    -[SSOperationProgress setCurrentValue:](self->super._progress, "setCurrentValue:", a6);
    -[SSOperationProgress setOperationType:](self->super._progress, "setOperationType:", 3);
    -[SSOperationProgress setUnits:](self->super._progress, "setUnits:", 1);
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
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      v17 &= 2u;
    if (v17)
    {
      *(_DWORD *)v23 = 138413058;
      *(_QWORD *)&v23[4] = objc_opt_class();
      *(_WORD *)&v23[12] = 2048;
      *(_QWORD *)&v23[14] = a5;
      *(_WORD *)&v23[22] = 2048;
      v24 = a6;
      LOWORD(v25) = 2048;
      *(_QWORD *)((char *)&v25 + 2) = a7;
      v19 = *(id *)&v23[4];
      LODWORD(v22) = 42;
      v20 = (void *)_os_log_send_and_compose_impl();

      if (v20)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v20, 4, v23, v22, *(_OWORD *)v23, *(_QWORD *)&v23[16], v24, v25);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        free(v20);
        SSFileLog();

      }
    }
    else
    {

    }
    -[ISOperation unlock](self, "unlock");
    if (v14)
      -[ISURLOperation _updateProgress](self, "_updateProgress");
  }
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  id v7;
  void (**v8)(id, void *);
  id WeakRetained;
  char v10;
  unint64_t v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  int v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  NSObject *v28;
  int v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  int v36;
  int v37;
  NSObject *v38;
  void *v39;
  id v40;
  void *v41;
  int *v42;
  uint64_t v43;
  id v44;
  int v45;
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (void (**)(id, void *))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
  v10 = objc_opt_respondsToSelector();

  v11 = 0x24BEB1000uLL;
  if ((v10 & 1) == 0 || (v12 = objc_loadWeakRetained((id *)&self->super._delegate)) == 0)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v26 = objc_msgSend(v25, "shouldLog");
    if (objc_msgSend(v25, "shouldLogToDisk"))
      v27 = v26 | 2;
    else
      v27 = v26;
    objc_msgSend(v25, "OSLogObject");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      v29 = v27;
    else
      v29 = v27 & 2;
    if (v29)
    {
      v30 = (void *)objc_opt_class();
      v31 = v30;
      v32 = objc_loadWeakRetained((id *)&self->super._delegate);
      v45 = 138412546;
      v46 = v30;
      v47 = 2112;
      v48 = (id)objc_opt_class();
      v33 = v48;
      LODWORD(v43) = 22;
      v42 = &v45;
      v34 = (void *)_os_log_send_and_compose_impl();

      v11 = 0x24BEB1000uLL;
      if (!v34)
      {
LABEL_29:

        v13 = 0;
        goto LABEL_30;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v34, 4, &v45, v43);
      v28 = objc_claimAutoreleasedReturnValue();
      free(v34);
      v42 = (int *)v28;
      SSFileLog();
    }

    goto LABEL_29;
  }
  v13 = v12;
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
    v44 = v19;
    v20 = objc_loadWeakRetained((id *)&self->super._delegate);
    v45 = 138412546;
    v46 = v19;
    v47 = 2112;
    v48 = (id)objc_opt_class();
    v21 = v48;
    LODWORD(v43) = 22;
    v42 = &v45;
    v22 = (void *)_os_log_send_and_compose_impl();

    v11 = 0x24BEB1000;
    if (!v22)
      goto LABEL_15;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v22, 4, &v45, v43);
    v17 = objc_claimAutoreleasedReturnValue();
    free(v22);
    v42 = (int *)v17;
    SSFileLog();
  }

LABEL_15:
  objc_msgSend(v7, "currentRequest");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "operation:needNewBodyStream:", self, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
LABEL_30:
    objc_msgSend(*(id *)(v11 + 3736), "sharediTunesStoreConfig", v42);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v35)
    {
      objc_msgSend(*(id *)(v11 + 3736), "sharedConfig");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v36 = objc_msgSend(v35, "shouldLog");
    if (objc_msgSend(v35, "shouldLogToDisk"))
      v37 = v36 | 2;
    else
      v37 = v36;
    objc_msgSend(v35, "OSLogObject");
    v38 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      v37 &= 2u;
    if (v37)
    {
      v39 = (void *)objc_opt_class();
      v45 = 138412290;
      v46 = v39;
      v40 = v39;
      LODWORD(v43) = 12;
      v41 = (void *)_os_log_send_and_compose_impl();

      if (!v41)
      {
LABEL_41:

        objc_msgSend(v7, "cancel");
        v24 = 0;
        goto LABEL_42;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v41, 4, &v45, v43);
      v38 = objc_claimAutoreleasedReturnValue();
      free(v41);
      SSFileLog();
    }

    goto LABEL_41;
  }
LABEL_42:
  v8[2](v8, v24);

}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v10;
  id v11;
  void (**v12)(id, id);
  id v13;
  int v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  int v19;
  int v20;
  NSObject *v21;
  int v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  int *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  NSObject *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  id v42;
  void *v43;
  void (**v44)(id, id);
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  int v51;
  NSObject *v52;
  int v53;
  void *v54;
  void (**v55)(id, id);
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int *v60;
  uint64_t v61;
  id v62;
  void (**v63)(id, id);
  void *v64;
  id v65;
  id v66;
  id v67;
  void *v68;
  void *v69;
  id v70;
  int v71;
  void *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  void *v80;
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  v12 = (void (**)(id, id))a7;
  if (v10)
  {
    v13 = v10;
    v14 = objc_msgSend(v13, "statusCode");
    if ((SSIsInternalBuild() & 1) != 0 || SSIsSeedBuild())
    {
      objc_msgSend(v13, "allHeaderFields");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BEB2560]);
      v69 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v69 = 0;
    }
    v66 = v10;
    objc_msgSend(v13, "allHeaderFields");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", CFSTR("X-Apple-Application-Site"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0x24BEB1000uLL;
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
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      v22 = v20;
    else
      v22 = v20 & 2;
    v67 = v13;
    if (v22)
    {
      v23 = (void *)objc_opt_class();
      v24 = v23;
      -[ISURLOperation logKey](self, "logKey");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = 138544386;
      v72 = v23;
      v73 = 2114;
      v74 = v25;
      v75 = 2048;
      v76 = (void *)v14;
      v77 = 2114;
      v78 = v69;
      v79 = 2114;
      v13 = v67;
      v80 = v68;
      LODWORD(v61) = 52;
      v60 = &v71;
      v26 = (void *)_os_log_send_and_compose_impl();

      v17 = 0x24BEB1000;
      if (v26)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v26, 4, &v71, v61);
        v27 = (int *)objc_claimAutoreleasedReturnValue();
        free(v26);
        v60 = v27;
        SSFileLog();

      }
    }
    else
    {

    }
    if (!SSIsInternalBuild())
    {
LABEL_31:
      v70 = 0;
      v41 = -[ISURLOperation _shouldFollowRedirectWithRequest:error:](self, "_shouldFollowRedirectWithRequest:error:", v11, &v70, v60);
      v42 = v70;
      if (v41)
      {
        if (-[ISURLOperation _shouldSetCookies](self, "_shouldSetCookies")
          && -[ISURLOperation _usesPrivateCookieStore](self, "_usesPrivateCookieStore"))
        {
          -[ISURLOperation _requestProperties](self, "_requestProperties");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "URLBagType");
          v44 = v12;
          v45 = SSAccountScopeForURLBagType();

          objc_msgSend(MEMORY[0x24BEB2020], "sharedStorage");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[ISURLOperation _accountIdentifier](self, "_accountIdentifier");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v45;
          v12 = v44;
          objc_msgSend(v46, "setCookiesForHTTPResponse:userIdentifier:scope:", v13, v47, v48);

        }
        -[ISURLOperation _handleRedirectRequest:response:](self, "_handleRedirectRequest:response:", v11, v13);
        v49 = objc_claimAutoreleasedReturnValue();
        goto LABEL_48;
      }
      objc_msgSend(*(id *)(v17 + 3736), "sharediTunesStoreConfig");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v50)
      {
        objc_msgSend(*(id *)(v17 + 3736), "sharedConfig");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v51 = objc_msgSend(v50, "shouldLog");
      if (objc_msgSend(v50, "shouldLogToDisk"))
        v51 |= 2u;
      objc_msgSend(v50, "OSLogObject");
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        v53 = v51;
      else
        v53 = v51 & 2;
      if (v53)
      {
        v54 = (void *)objc_opt_class();
        v65 = v54;
        -[ISURLOperation logKey](self, "logKey");
        v55 = v12;
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[ISURLOperation _sanitizedDescriptionForObject:](self, "_sanitizedDescriptionForObject:", v42);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = 138543874;
        v72 = v54;
        v73 = 2114;
        v74 = v56;
        v75 = 2112;
        v76 = v57;
        LODWORD(v61) = 32;
        v58 = (void *)_os_log_send_and_compose_impl();

        v12 = v55;
        if (!v58)
        {
LABEL_47:

          -[ISURLOperation _errorWithDefaultStringsForError:](self, "_errorWithDefaultStringsForError:", v42);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          -[ISOperation setError:](self, "setError:", v59);

          -[ISOperation cancel](self, "cancel");
          v49 = 0;
          v13 = v67;
LABEL_48:

          v11 = (id)v49;
          v10 = v66;
          goto LABEL_49;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v58, 4, &v71, v61);
        v52 = objc_claimAutoreleasedReturnValue();
        free(v58);
        SSFileLog();
      }

      goto LABEL_47;
    }
    objc_msgSend(v13, "allHeaderFields");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "description");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(v17 + 3736), "sharediTunesStoreConfigOversize");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v30)
    {
      objc_msgSend(*(id *)(v17 + 3736), "sharedConfig");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v31 = objc_msgSend(v30, "shouldLog", v60);
    if (objc_msgSend(v30, "shouldLogToDisk"))
      v31 |= 2u;
    objc_msgSend(v30, "OSLogObject");
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      v33 = v31;
    else
      v33 = v31 & 2;
    if (v33)
    {
      v34 = (void *)objc_opt_class();
      v62 = v34;
      -[ISURLOperation logKey](self, "logKey");
      v64 = v11;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "URL");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISURLOperation _sanitizedURLForURL:](self, "_sanitizedURLForURL:", v36);
      v37 = v29;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISURLOperation _sanitizedStringForString:](self, "_sanitizedStringForString:", v37);
      v63 = v12;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = 138544130;
      v72 = v34;
      v73 = 2114;
      v74 = v35;
      v75 = 2114;
      v76 = v38;
      v77 = 2114;
      v78 = v39;
      LODWORD(v61) = 42;
      v60 = &v71;
      v40 = (void *)_os_log_send_and_compose_impl();

      v17 = 0x24BEB1000uLL;
      v12 = v63;

      v29 = v37;
      v11 = v64;
      v13 = v67;

      if (!v40)
      {
LABEL_30:

        goto LABEL_31;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v40, 4, &v71, v61);
      v32 = objc_claimAutoreleasedReturnValue();
      free(v40);
      v60 = (int *)v32;
      SSFileLog();
    }

    goto LABEL_30;
  }
LABEL_49:
  v12[2](v12, v11);

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  -[ISURLOperation _handleReceivedData:](self, "_handleReceivedData:", a5);
  -[ISURLOperation dataProvider](self, "dataProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isStream");

  if (v10)
  {
    -[ISURLOperation dataProvider](self, "dataProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isStreamComplete");

    if (v12)
    {
      objc_msgSend(v8, "cancel");
      v13 = (void *)MEMORY[0x24BEB2010];
      objc_msgSend(v8, "_timingData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "eventFromTimingData:delegate:session:task:error:", v14, self, v16, v8, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[ISURLOperation URLSession:task:didCompleteWithEvent:error:](self, "URLSession:task:didCompleteWithEvent:error:", v16, v8, v15, 0);
    }
  }

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  void (**v8)(id, uint64_t);

  v8 = (void (**)(id, uint64_t))a6;
  -[ISURLOperation _handleReceivedResponse:](self, "_handleReceivedResponse:", a5);
  v8[2](v8, 1);

}

+ (_CFURLCache)sharedCFURLCache
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__ISURLOperation_sharedCFURLCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCFURLCache_sOnce != -1)
    dispatch_once(&sharedCFURLCache_sOnce, block);
  return (_CFURLCache *)sharedCFURLCache__shared;
}

uint64_t __34__ISURLOperation_sharedCFURLCache__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  if (objc_msgSend(*(id *)(a1 + 32), "_sharedCacheStorageSession"))
  {
    result = _CFURLStorageSessionCopyCache();
    if (!result)
      return result;
    v2 = result;
    CFURLCacheSetDiskCapacity();
    result = CFURLCacheSetMemoryCapacity();
  }
  else
  {
    result = CFURLCacheCopySharedURLCache();
    v2 = result;
  }
  sharedCFURLCache__shared = v2;
  return result;
}

- (SSHTTPArchive)HTTPArchive
{
  SSHTTPArchive *v3;

  -[ISOperation lock](self, "lock");
  v3 = self->_httpArchive;
  -[ISOperation unlock](self, "unlock");
  return v3;
}

- (ISURLRequestPerformance)performanceMetrics
{
  ISURLRequestPerformance *v3;

  -[ISOperation lock](self, "lock");
  v3 = self->_performanceMetrics;
  -[ISOperation unlock](self, "unlock");
  return v3;
}

- (void)setTracksPerformanceMetrics:(BOOL)a3
{
  _BOOL4 v3;
  ISURLRequestPerformance *performanceMetrics;
  ISURLRequestPerformance *v6;

  v3 = a3;
  -[ISOperation lock](self, "lock");
  performanceMetrics = self->_performanceMetrics;
  if (!v3)
  {
    v6 = 0;
    goto LABEL_5;
  }
  if (!performanceMetrics)
  {
    v6 = objc_alloc_init(ISURLRequestPerformance);
    performanceMetrics = self->_performanceMetrics;
LABEL_5:
    self->_performanceMetrics = v6;

  }
  -[ISOperation unlock](self, "unlock");
}

- (BOOL)tracksPerformanceMetrics
{
  BOOL v3;

  -[ISOperation lock](self, "lock");
  v3 = self->_performanceMetrics != 0;
  -[ISOperation unlock](self, "unlock");
  return v3;
}

- (id)_accountIdentifier
{
  void *v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  void *v20;
  int v21;
  int v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  int v40;
  NSObject *v41;
  int v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  int v55;
  void *v56;
  int v57;
  int v58;
  NSObject *v60;
  uint64_t v61;
  _BYTE v62[24];
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  -[ISURLOperation logKey](self, "logKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsConfig");
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
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    v8 = v6;
  else
    v8 = v6 & 2;
  if (!v8)
    goto LABEL_12;
  v9 = (void *)objc_opt_class();
  v10 = v9;
  -[ISURLOperation requestProperties](self, "requestProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v62 = 138543874;
  *(_QWORD *)&v62[4] = v9;
  *(_WORD *)&v62[12] = 2114;
  *(_QWORD *)&v62[14] = v3;
  *(_WORD *)&v62[22] = 2114;
  v63 = v12;
  LODWORD(v61) = 32;
  v60 = v62;
  v13 = (void *)_os_log_send_and_compose_impl();

  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v13, 4, v62, v61);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v13);
    v60 = v7;
    SSFileLog();
LABEL_12:

  }
  -[ISURLOperation _accountDSIDOverride](self, "_accountDSIDOverride");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14
    || (v15 = (void *)v14,
        -[ISURLOperation _accountDSIDOverride](self, "_accountDSIDOverride"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v16, "isEqualToNumber:", &unk_24C453178),
        v16,
        v15,
        (v17 & 1) != 0))
  {
    -[ISOperation authenticatedAccountDSID](self, "authenticatedAccountDSID", v60);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18 && objc_msgSend(v18, "unsignedLongLongValue"))
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
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        v22 &= 2u;
      if (!v22)
        goto LABEL_39;
      goto LABEL_25;
    }
    -[ISURLOperation authenticationContext](self, "authenticationContext");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "requiredUniqueIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30 && objc_msgSend(v30, "unsignedLongLongValue"))
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v31 = objc_msgSend(v20, "shouldLog");
      if (objc_msgSend(v20, "shouldLogToDisk"))
        v31 |= 2u;
      objc_msgSend(v20, "OSLogObject");
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        v31 &= 2u;
      if (v31)
      {
        v32 = (void *)objc_opt_class();
        v33 = v32;
        objc_msgSend(v30, "stringValue");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        SSHashIfNeeded();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v62 = 138543874;
        *(_QWORD *)&v62[4] = v32;
        *(_WORD *)&v62[12] = 2114;
        *(_QWORD *)&v62[14] = v3;
        *(_WORD *)&v62[22] = 2114;
        v63 = v35;
        LODWORD(v61) = 32;
        v36 = (void *)_os_log_send_and_compose_impl();

        if (!v36)
        {
          v19 = v30;
          goto LABEL_40;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v36, 4, v62, v61);
        v23 = objc_claimAutoreleasedReturnValue();
        free(v36);
        SSFileLog();
      }
      v19 = v30;
      goto LABEL_39;
    }
    -[ISURLOperation _requestProperties](self, "_requestProperties");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "URLBagType");
    v50 = SSAccountScopeForURLBagType();

    objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v51;
    if (v50 == 1)
    {
      objc_msgSend(v51, "activeSandboxAccount");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "uniqueIdentifier");
      v19 = (id)objc_claimAutoreleasedReturnValue();

      if (v19 && objc_msgSend(v19, "unsignedLongLongValue"))
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsConfig");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v20)
        {
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v54 = objc_msgSend(v20, "shouldLog");
        if (objc_msgSend(v20, "shouldLogToDisk"))
          v55 = v54 | 2;
        else
          v55 = v54;
        objc_msgSend(v20, "OSLogObject");
        v23 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          v55 &= 2u;
        if (!v55)
          goto LABEL_39;
        goto LABEL_25;
      }
    }
    else
    {
      objc_msgSend(v51, "activeAccount");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "uniqueIdentifier");
      v19 = (id)objc_claimAutoreleasedReturnValue();

      if (v19 && objc_msgSend(v19, "unsignedLongLongValue"))
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsConfig");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v20)
        {
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v57 = objc_msgSend(v20, "shouldLog");
        if (objc_msgSend(v20, "shouldLogToDisk"))
          v58 = v57 | 2;
        else
          v58 = v57;
        objc_msgSend(v20, "OSLogObject");
        v23 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          v58 &= 2u;
        if (!v58)
          goto LABEL_39;
LABEL_25:
        v24 = (void *)objc_opt_class();
        v25 = v24;
        objc_msgSend(v19, "stringValue");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        SSHashIfNeeded();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v62 = 138543874;
        *(_QWORD *)&v62[4] = v24;
        *(_WORD *)&v62[12] = 2114;
        *(_QWORD *)&v62[14] = v3;
        *(_WORD *)&v62[22] = 2114;
        v63 = v27;
        LODWORD(v61) = 32;
        v28 = (void *)_os_log_send_and_compose_impl();

        if (!v28)
        {
LABEL_40:

          v19 = v19;
          v37 = v19;
LABEL_78:

          goto LABEL_79;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v28, 4, v62, v61, *(_OWORD *)v62, *(_QWORD *)&v62[16], v63);
        v23 = objc_claimAutoreleasedReturnValue();
        free(v28);
        SSFileLog();
LABEL_39:

        goto LABEL_40;
      }
    }
    v37 = 0;
    goto LABEL_78;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsConfig");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v38)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v39 = objc_msgSend(v38, "shouldLog", v60);
  if (objc_msgSend(v38, "shouldLogToDisk"))
    v40 = v39 | 2;
  else
    v40 = v39;
  objc_msgSend(v38, "OSLogObject");
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    v42 = v40;
  else
    v42 = v40 & 2;
  if (!v42)
    goto LABEL_52;
  v43 = (void *)objc_opt_class();
  v44 = v43;
  -[ISURLOperation _accountDSIDOverride](self, "_accountDSIDOverride");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "stringValue");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  SSHashIfNeeded();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v62 = 138543874;
  *(_QWORD *)&v62[4] = v43;
  *(_WORD *)&v62[12] = 2114;
  *(_QWORD *)&v62[14] = v3;
  *(_WORD *)&v62[22] = 2114;
  v63 = v47;
  LODWORD(v61) = 32;
  v48 = (void *)_os_log_send_and_compose_impl();

  if (v48)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v48, 4, v62, v61);
    v41 = objc_claimAutoreleasedReturnValue();
    free(v48);
    SSFileLog();
LABEL_52:

  }
  -[ISURLOperation _accountDSIDOverride](self, "_accountDSIDOverride");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_79:

  return v37;
}

- (NSURLRequest)_activeURLRequest
{
  return self->_activeURLRequest;
}

- (id)_copyAuthenticationContext
{
  void *v2;
  void *v3;

  -[ISURLOperation authenticationContext](self, "authenticationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  return v3;
}

- (BOOL)_processResponseData:(id)a3 error:(id *)a4
{
  if (a4)
    *a4 = 0;
  return 1;
}

- (id)_requestProperties
{
  SSMutableURLRequestProperties *v3;

  -[ISOperation lock](self, "lock");
  v3 = self->_requestProperties;
  -[ISOperation unlock](self, "unlock");
  return v3;
}

- (id)_sanitizedDescriptionForObject:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISURLOperation _sanitizedStringForString:](self, "_sanitizedStringForString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_sanitizedStringForString:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  void *v7;
  id v8;

  v4 = a3;
  -[ISOperation lock](self, "lock");
  WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
  v6 = objc_opt_respondsToSelector();

  v7 = v4;
  if ((v6 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->super._delegate);
    objc_msgSend(v8, "operation:sanitizedStringForString:", self, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[ISOperation unlock](self, "unlock");

  return v7;
}

- (id)_sanitizedURLForURL:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  -[ISOperation lock](self, "lock");
  WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
  v6 = objc_opt_respondsToSelector();

  v7 = v4;
  if ((v6 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->super._delegate);
    objc_msgSend(v4, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "operation:sanitizedStringForString:", self, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[ISOperation unlock](self, "unlock");

  return v7;
}

- (void)_handleFinishedLoading
{
  CFAbsoluteTime Current;
  ISURLRequestPerformance *v4;
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int *v19;
  int v20;
  int v21;
  int v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void *v28;
  NSObject *dataBufferAccessQueue;
  id v30;
  BOOL v31;
  void *v32;
  _BOOL4 v33;
  NSCountedSet *redirectURLs;
  void *v35;
  void *v36;
  int v37;
  int v38;
  NSObject *v39;
  void *v40;
  int v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  int v48;
  NSObject *v49;
  void *v50;
  int v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  int *v59;
  uint64_t v60;
  id obj;
  _QWORD block[4];
  id v63;
  ISURLOperation *v64;
  _BYTE *v65;
  uint64_t *v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  int v78;
  id v79;
  __int16 v80;
  void *v81;
  _BYTE v82[24];
  uint64_t (*v83)(uint64_t, uint64_t);
  _BYTE v84[20];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  -[ISOperation lock](self, "lock");
  if (self->_performanceMetrics)
  {
    Current = CFAbsoluteTimeGetCurrent();
    -[ISURLRequestPerformance setFinishTime:](self->_performanceMetrics, "setFinishTime:");
    v4 = self->_performanceMetrics;
  }
  else
  {
    v4 = 0;
    Current = 0.0;
  }
  -[ISOperation unlock](self, "unlock");
  if ((-[ISURLOperation isCancelled](self, "isCancelled") & 1) != 0)
    goto LABEL_71;
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7 = objc_msgSend(v6, "shouldLog");
    if (objc_msgSend(v6, "shouldLogToDisk"))
      v8 = v7 | 2;
    else
      v8 = v7;
    objc_msgSend(v6, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      v10 = v8;
    else
      v10 = v8 & 2;
    if (v10)
    {
      v11 = (void *)objc_opt_class();
      v12 = v11;
      -[ISURLOperation logKey](self, "logKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISURLRequestPerformance finishInterval](v4, "finishInterval");
      v15 = v14;
      -[ISURLOperation _activeURL](self, "_activeURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISURLOperation _sanitizedURLForURL:](self, "_sanitizedURLForURL:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v82 = 138544386;
      *(_QWORD *)&v82[4] = v11;
      *(_WORD *)&v82[12] = 2114;
      *(_QWORD *)&v82[14] = v13;
      *(_WORD *)&v82[22] = 2048;
      v83 = *(uint64_t (**)(uint64_t, uint64_t))&Current;
      *(_WORD *)v84 = 2048;
      *(_QWORD *)&v84[2] = v15;
      *(_WORD *)&v84[10] = 2112;
      *(_QWORD *)&v84[12] = v17;
      LODWORD(v60) = 52;
      v59 = (int *)v82;
      v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18)
        goto LABEL_29;
      goto LABEL_16;
    }
    goto LABEL_28;
  }
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = objc_msgSend(v6, "shouldLog");
  if (objc_msgSend(v6, "shouldLogToDisk"))
    v21 = v20 | 2;
  else
    v21 = v20;
  objc_msgSend(v6, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    v22 = v21;
  else
    v22 = v21 & 2;
  if (!v22)
  {
LABEL_28:

    goto LABEL_29;
  }
  v23 = (void *)objc_opt_class();
  v24 = v23;
  -[ISURLOperation logKey](self, "logKey");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISURLOperation _activeURL](self, "_activeURL");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISURLOperation _sanitizedURLForURL:](self, "_sanitizedURLForURL:", v26);
  v27 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v82 = 138543874;
  *(_QWORD *)&v82[4] = v23;
  *(_WORD *)&v82[12] = 2114;
  *(_QWORD *)&v82[14] = v25;
  *(_WORD *)&v82[22] = 2112;
  v83 = v27;
  LODWORD(v60) = 32;
  v59 = (int *)v82;
  v18 = (void *)_os_log_send_and_compose_impl();

  if (v18)
  {
LABEL_16:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v18, 4, v82, v60);
    v19 = (int *)objc_claimAutoreleasedReturnValue();
    free(v18);
    v59 = v19;
    SSFileLog();

  }
LABEL_29:

  -[ISURLOperation dataProvider](self, "dataProvider");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)v82 = 0;
  *(_QWORD *)&v82[8] = v82;
  *(_QWORD *)&v82[16] = 0x3032000000;
  v83 = __Block_byref_object_copy__2;
  *(_QWORD *)v84 = __Block_byref_object_dispose__2;
  *(_QWORD *)&v84[8] = 0;
  v72 = 0;
  v73 = &v72;
  v74 = 0x3032000000;
  v75 = __Block_byref_object_copy__2;
  v76 = __Block_byref_object_dispose__2;
  v77 = 0;
  v68 = 0;
  v69 = &v68;
  v70 = 0x2020000000;
  dataBufferAccessQueue = self->_dataBufferAccessQueue;
  v71 = 1;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__ISURLOperation__handleFinishedLoading__block_invoke;
  block[3] = &unk_24C43C2C8;
  v65 = v82;
  v30 = v28;
  v63 = v30;
  v64 = self;
  v66 = &v68;
  v67 = &v72;
  dispatch_sync(dataBufferAccessQueue, block);
  v31 = *((_BYTE *)v69 + 24) == 0;
  if (!*((_BYTE *)v69 + 24))
  {
    if (objc_msgSend(v30, "errorHandlerResponseType") == 2)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v46)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v47 = objc_msgSend(v46, "shouldLog", v59);
      v48 = objc_msgSend(v46, "shouldLogToDisk");
      objc_msgSend(v46, "OSLogObject");
      v49 = objc_claimAutoreleasedReturnValue();
      v50 = v49;
      if (v48)
        v47 |= 2u;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        v51 = v47;
      else
        v51 = v47 & 2;
      if (v51)
      {
        v52 = (id)objc_opt_class();
        -[ISURLOperation _sanitizedDescriptionForObject:](self, "_sanitizedDescriptionForObject:", *(_QWORD *)(*(_QWORD *)&v82[8] + 40));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = 138412546;
        v79 = v52;
        v80 = 2112;
        v81 = v53;
        LODWORD(v60) = 22;
        v59 = &v78;
        v54 = (void *)_os_log_send_and_compose_impl();

        if (!v54)
          goto LABEL_56;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v54, 4, &v78, v60);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        free(v54);
        v59 = (int *)v50;
        SSFileLog();
      }

      goto LABEL_56;
    }
    if (SSDebugShouldLogResponseBodies())
    {
      -[ISURLOperation response](self, "response");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISURLOperation _logResponseBody:](self, "_logResponseBody:", v57);

    }
    -[ISOperation setError:](self, "setError:", *(_QWORD *)(*(_QWORD *)&v82[8] + 40), v59);
    goto LABEL_68;
  }
  objc_msgSend(v30, "redirectURL");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32 == 0;

  if (v33)
  {
    if (v30)
    {
      objc_msgSend(v30, "output");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISURLOperation _sendOutputToDelegate:](self, "_sendOutputToDelegate:", v55);

    }
    else
    {
      -[ISURLOperation _sendOutputToDelegate:](self, "_sendOutputToDelegate:", v73[5]);
    }
    if (SSDebugShouldLogResponseBodies() && (objc_msgSend(v30, "isStream") & 1) == 0)
    {
      -[ISURLOperation response](self, "response");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISURLOperation _logResponseBody:](self, "_logResponseBody:", v58);

    }
    -[ISOperation setSuccess:](self, "setSuccess:", 1, v59);
LABEL_68:
    v31 = 0;
    goto LABEL_69;
  }
  redirectURLs = self->_redirectURLs;
  objc_msgSend(v30, "redirectURL");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(redirectURLs) = -[NSCountedSet countForObject:](redirectURLs, "countForObject:", v35) > 4;

  if ((_DWORD)redirectURLs)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v36)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v37 = objc_msgSend(v36, "shouldLog", v59);
    v38 = objc_msgSend(v36, "shouldLogToDisk");
    objc_msgSend(v36, "OSLogObject");
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (v38)
      v37 |= 2u;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      v41 = v37;
    else
      v41 = v37 & 2;
    if (v41)
    {
      v42 = (id)objc_opt_class();
      objc_msgSend(v30, "redirectURL");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISURLOperation _sanitizedURLForURL:](self, "_sanitizedURLForURL:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = 138412546;
      v79 = v42;
      v80 = 2112;
      v81 = v44;
      LODWORD(v60) = 22;
      v59 = &v78;
      v45 = (void *)_os_log_send_and_compose_impl();

      if (!v45)
      {
LABEL_43:

        -[ISURLOperation _errorWithDomain:code:](self, "_errorWithDomain:code:", *MEMORY[0x24BEB24A0], 109);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[ISOperation setError:](self, "setError:", v46);
LABEL_56:

        goto LABEL_69;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v45, 4, &v78, v60);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      free(v45);
      v59 = (int *)v40;
      SSFileLog();
    }

    goto LABEL_43;
  }
  v56 = *(_QWORD *)&v82[8];
  obj = *(id *)(*(_QWORD *)&v82[8] + 40);
  v31 = -[ISURLOperation handleRedirectFromDataProvider:error:](self, "handleRedirectFromDataProvider:error:", v30, &obj);
  objc_storeStrong((id *)(v56 + 40), obj);
  -[ISOperation setError:](self, "setError:", *(_QWORD *)(*(_QWORD *)&v82[8] + 40));
LABEL_69:

  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v72, 8);

  _Block_object_dispose(v82, 8);
  if (!v31)
  {
LABEL_71:
    -[ISOperation stopRunLoop](self, "stopRunLoop", v59);
    goto LABEL_72;
  }
  -[ISURLOperation _retry](self, "_retry");
LABEL_72:

}

void __40__ISURLOperation__handleFinishedLoading__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  id WeakRetained;
  char v15;
  id *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "closeStream");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 40), "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v9 = *(void **)(a1 + 32);
    if (v9)
    {
      if ((objc_msgSend(v9, "isStream") & 1) == 0)
      {
        v10 = *(_QWORD **)(a1 + 40);
        v11 = v10[43];
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        obj = *(id *)(v12 + 40);
        v13 = objc_msgSend(v10, "_processResponseData:error:", v11, &obj);
        objc_storeStrong((id *)(v12 + 40), obj);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v13;
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        {
          objc_msgSend(*(id *)(a1 + 40), "lock");
          WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 248));
          v15 = objc_opt_respondsToSelector();

          v16 = *(id **)(a1 + 40);
          if ((v15 & 1) != 0)
          {
            v17 = objc_loadWeakRetained(v16 + 31);
            objc_msgSend(*(id *)(a1 + 40), "unlock");
            if (v17)
            {
              v18 = *(_QWORD *)(a1 + 40);
              v19 = *(_QWORD *)(v18 + 344);
              v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
              v31 = *(id *)(v20 + 40);
              v21 = objc_msgSend(v17, "operation:processData:error:", v18, v19, &v31);
              objc_storeStrong((id *)(v20 + 40), v31);
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v21;

            }
          }
          else
          {
            objc_msgSend(v16, "unlock");
          }
          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
          {
            objc_msgSend(*(id *)(a1 + 40), "_decodedDataForData:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 344));
            v22 = objc_claimAutoreleasedReturnValue();
            v23 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            v24 = *(void **)(v23 + 40);
            *(_QWORD *)(v23 + 40) = v22;

            v25 = *(void **)(a1 + 32);
            objc_msgSend(*(id *)(a1 + 40), "response");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setResponse:", v26);

            v27 = *(void **)(a1 + 32);
            v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
            v29 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
            v30 = *(id *)(v29 + 40);
            LOBYTE(v26) = objc_msgSend(v27, "parseData:returningError:", v28, &v30);
            objc_storeStrong((id *)(v29 + 40), v30);
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (_BYTE)v26;
          }
        }
      }
    }
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 344), "copy");
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

- (void)_handleReceivedData:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  NSObject *dataBufferAccessQueue;
  id v10;
  _QWORD block[4];
  id v12;
  ISURLOperation *v13;

  v4 = a3;
  if ((-[ISURLOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[ISURLOperation dataProvider](self, "dataProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isStream") & 1) != 0)
    {
      v10 = 0;
      v6 = objc_msgSend(v5, "parseData:returningError:", v4, &v10);
      v7 = v10;
      if ((v6 & 1) == 0)
      {
        -[ISURLOperation _errorWithDefaultStringsForError:](self, "_errorWithDefaultStringsForError:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[ISOperation setError:](self, "setError:", v8);

        -[ISURLOperation _stopConnection](self, "_stopConnection");
      }

    }
    else
    {
      dataBufferAccessQueue = self->_dataBufferAccessQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __38__ISURLOperation__handleReceivedData___block_invoke;
      block[3] = &unk_24C43C178;
      v12 = v4;
      v13 = self;
      dispatch_sync(dataBufferAccessQueue, block);

    }
  }

}

uint64_t __38__ISURLOperation__handleReceivedData___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 40) + 344), "appendData:");
  return result;
}

- (void)_handleReceivedResponse:(id)a3
{
  id v4;
  void *v5;
  id v6;
  ISURLRequestPerformance *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  NSObject *v15;
  int v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int *v23;
  int v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  int *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  int v37;
  NSObject *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  NSObject *dataBufferAccessQueue;
  uint64_t v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  NSObject *v60;
  int v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  NSObject *v68;
  int v69;
  void *v70;
  ISURLRequestPerformance *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  int v76;
  void *v77;
  int *v78;
  int *v79;
  uint64_t v80;
  id v81;
  void *v82;
  uint64_t v83;
  id v84;
  id v85;
  id v86;
  ISURLRequestPerformance *v87;
  ISURLRequestPerformance *v88;
  void *v89;
  void *v90;
  id v91;
  id v92;
  id v93;
  _QWORD block[5];
  int v95;
  void *v96;
  __int16 v97;
  _BYTE v98[18];
  __int16 v99;
  uint64_t v100;
  __int16 v101;
  void *v102;
  __int16 v103;
  void *v104;
  uint64_t v105;

  v105 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  -[ISOperation lock](self, "lock");
  -[ISURLRequestPerformance setReceivedResponseTime:](self->_performanceMetrics, "setReceivedResponseTime:", CFAbsoluteTimeGetCurrent());
  -[ISURLRequestPerformance setURLResponse:](self->_performanceMetrics, "setURLResponse:", v4);
  v7 = self->_performanceMetrics;
  -[ISOperation unlock](self, "unlock");
  if (!v6)
  {
    v8 = 200;
    goto LABEL_52;
  }
  v8 = objc_msgSend(v6, "statusCode");
  if ((SSIsInternalBuild() & 1) != 0 || SSIsSeedBuild())
  {
    objc_msgSend(v4, "itunes_allHeaderFields");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BEB2560]);
    v90 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v90 = 0;
  }
  objc_msgSend(v6, "allHeaderFields");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("X-Apple-Application-Site"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0x24BEB1000uLL;
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v87 = v7;
  if (v7)
  {
    if (!v12)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = objc_msgSend(v13, "shouldLog");
    if (objc_msgSend(v13, "shouldLogToDisk"))
      v14 |= 2u;
    objc_msgSend(v13, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      v16 = v14;
    else
      v16 = v14 & 2;
    if (v16)
    {
      v17 = (void *)objc_opt_class();
      v18 = v17;
      -[ISURLOperation logKey](self, "logKey");
      v19 = v8;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISURLRequestPerformance receivedResponseInterval](v87, "receivedResponseInterval");
      v95 = 138544642;
      v96 = v17;
      v97 = 2114;
      *(_QWORD *)v98 = v20;
      *(_WORD *)&v98[8] = 2048;
      *(_QWORD *)&v98[10] = v21;
      v99 = 2048;
      v100 = v19;
      v101 = 2114;
      v102 = v90;
      v103 = 2114;
      v104 = v89;
      LODWORD(v80) = 62;
      v78 = &v95;
      v22 = (void *)_os_log_send_and_compose_impl();

      if (v22)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v22, 4, &v95, v80);
        v23 = (int *)objc_claimAutoreleasedReturnValue();
        free(v22);
        v78 = v23;
        SSFileLog();

      }
      v8 = v19;
LABEL_32:
      v11 = 0x24BEB1000;
      goto LABEL_34;
    }
  }
  else
  {
    if (!v12)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v24 = objc_msgSend(v13, "shouldLog");
    if (objc_msgSend(v13, "shouldLogToDisk"))
      v24 |= 2u;
    objc_msgSend(v13, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      v24 &= 2u;
    if (v24)
    {
      v25 = (void *)objc_opt_class();
      v26 = v25;
      -[ISURLOperation logKey](self, "logKey");
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = v8;
      v29 = (void *)v27;
      v95 = 138544386;
      v96 = v25;
      v97 = 2114;
      *(_QWORD *)v98 = v27;
      *(_WORD *)&v98[8] = 2048;
      v30 = v28;
      *(_QWORD *)&v98[10] = v28;
      v99 = 2114;
      v100 = (uint64_t)v90;
      v101 = 2114;
      v102 = v89;
      LODWORD(v80) = 52;
      v78 = &v95;
      v31 = (void *)_os_log_send_and_compose_impl();

      if (v31)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v31, 4, &v95, v80);
        v32 = (int *)objc_claimAutoreleasedReturnValue();
        free(v31);
        v78 = v32;
        SSFileLog();

      }
      v8 = v30;
      goto LABEL_32;
    }
  }

LABEL_34:
  if (!SSIsInternalBuild())
    goto LABEL_48;
  v83 = v8;
  objc_msgSend(v6, "allHeaderFields");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "description");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(v11 + 3736), "sharediTunesStoreConfig");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v35)
  {
    objc_msgSend(*(id *)(v11 + 3736), "sharedConfig");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v36 = objc_msgSend(v35, "shouldLog", v78);
  if (objc_msgSend(v35, "shouldLogToDisk"))
    v37 = v36 | 2;
  else
    v37 = v36;
  objc_msgSend(v35, "OSLogObject");
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    v39 = v37;
  else
    v39 = v37 & 2;
  if (!v39)
    goto LABEL_46;
  v40 = (void *)objc_opt_class();
  v81 = v40;
  -[ISURLOperation logKey](self, "logKey");
  v82 = v34;
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISURLOperation _sanitizedURLForURL:](self, "_sanitizedURLForURL:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISURLOperation _sanitizedStringForString:](self, "_sanitizedStringForString:", v82);
  v84 = v6;
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = 138544130;
  v96 = v40;
  v97 = 2114;
  *(_QWORD *)v98 = v41;
  *(_WORD *)&v98[8] = 2112;
  *(_QWORD *)&v98[10] = v43;
  v99 = 2112;
  v100 = (uint64_t)v44;
  LODWORD(v80) = 42;
  v78 = &v95;
  v45 = (void *)_os_log_send_and_compose_impl();

  v6 = v84;
  v34 = v82;

  if (v45)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v45, 4, &v95, v80);
    v38 = objc_claimAutoreleasedReturnValue();
    free(v45);
    v78 = (int *)v38;
    SSFileLog();
LABEL_46:

  }
  v8 = v83;
LABEL_48:
  v7 = v87;
  if (-[ISURLOperation _shouldSetCookies](self, "_shouldSetCookies", v78)
    && -[ISURLOperation _usesPrivateCookieStore](self, "_usesPrivateCookieStore"))
  {
    -[ISURLOperation _requestProperties](self, "_requestProperties");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "URLBagType");
    v47 = SSAccountScopeForURLBagType();

    objc_msgSend(MEMORY[0x24BEB2020], "sharedStorage");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISURLOperation _accountIdentifier](self, "_accountIdentifier");
    v49 = v6;
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setCookiesForHTTPResponse:userIdentifier:scope:", v49, v50, v47);

    v6 = v49;
  }

LABEL_52:
  -[ISURLOperation setResponse:](self, "setResponse:", v4);
  dataBufferAccessQueue = self->_dataBufferAccessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__ISURLOperation__handleReceivedResponse___block_invoke;
  block[3] = &unk_24C43C128;
  block[4] = self;
  dispatch_sync(dataBufferAccessQueue, block);
  -[ISURLOperation handleResponse:](self, "handleResponse:", v4);
  -[ISURLOperation _sendResponseToDelegate:](self, "_sendResponseToDelegate:", v4);
  if (!-[ISURLOperation _isPassThroughStatus:](self, "_isPassThroughStatus:", v8)
    && v8 != 416
    && (unint64_t)(v8 - 1000) >= 0xFFFFFFFFFFFFFDA8
    && !-[ISURLOperation _loadsHTTPFailures](self, "_loadsHTTPFailures"))
  {
    -[ISURLOperation _errorWithDomain:code:](self, "_errorWithDomain:code:", *MEMORY[0x24BEB24A0], 109);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v8);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    SSErrorBySettingUserInfoValue();
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISOperation setError:](self, "setError:", v57);

    -[ISURLOperation _stopConnection](self, "_stopConnection");
LABEL_95:

    goto LABEL_96;
  }
  if ((-[ISURLOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v52 = objc_msgSend(v4, "itunes_maxExpectedContentLength");
    -[ISURLOperation dataProvider](self, "dataProvider");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setContentLength:", v52);
    objc_msgSend(v4, "MIMEType");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setContentType:", v54);

    objc_msgSend(v53, "setup");
    if (v8 == 416)
    {
      v52 = objc_msgSend(v53, "streamedBytes");
LABEL_59:
      v55 = 1;
      goto LABEL_78;
    }
    if (objc_msgSend(v53, "isStream") && v52 > 0 && objc_msgSend(v53, "streamedBytes") == v52)
      goto LABEL_59;
    v55 = 0;
    if (objc_msgSend(v53, "streamedBytes") < 1 || v8 == 206)
    {
LABEL_78:
      -[ISURLOperation _sendContentLengthToDelegate:](self, "_sendContentLengthToDelegate:", v52, v78);
      -[SSOperationProgress setCanPause:](self->super._progress, "setCanPause:", 1);
      -[SSOperationProgress resetSnapshots](self->super._progress, "resetSnapshots");
      -[SSOperationProgress setMaxValue:](self->super._progress, "setMaxValue:", v52);
      -[SSOperationProgress setOperationType:](self->super._progress, "setOperationType:", 2);
      -[SSOperationProgress setUnits:](self->super._progress, "setUnits:", 1);
      -[ISURLOperation _updateProgress](self, "_updateProgress");
      if (!v55)
      {
        v93 = 0;
        v76 = -[ISURLOperation _validateContentLength:error:](self, "_validateContentLength:error:", v52, &v93);
        v75 = v93;
        if ((v76 & 1) != 0)
        {
LABEL_94:

          goto LABEL_95;
        }
        -[ISURLOperation _errorWithDefaultStringsForError:](self, "_errorWithDefaultStringsForError:", v75);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        -[ISOperation setError:](self, "setError:", v77);

LABEL_93:
        -[ISURLOperation _stopConnection](self, "_stopConnection", v79);
        goto LABEL_94;
      }
      v86 = v6;
      objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v66)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v67 = objc_msgSend(v66, "shouldLog");
      if (objc_msgSend(v66, "shouldLogToDisk"))
        v67 |= 2u;
      objc_msgSend(v66, "OSLogObject");
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
        v69 = v67;
      else
        v69 = v67 & 2;
      if (v69)
      {
        v70 = (void *)objc_opt_class();
        v92 = v70;
        objc_msgSend(v4, "URL");
        v71 = v7;
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        -[ISURLOperation _sanitizedURLForURL:](self, "_sanitizedURLForURL:", v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = 138412546;
        v96 = v70;
        v97 = 2112;
        *(_QWORD *)v98 = v73;
        LODWORD(v80) = 22;
        v79 = &v95;
        v74 = (void *)_os_log_send_and_compose_impl();

        v7 = v71;
        if (!v74)
        {
LABEL_90:

          -[ISOperation setSuccess:](self, "setSuccess:", 1);
          v75 = 0;
          v6 = v86;
          goto LABEL_93;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v74, 4, &v95, v80);
        v68 = objc_claimAutoreleasedReturnValue();
        free(v74);
        v79 = (int *)v68;
        SSFileLog();
      }

      goto LABEL_90;
    }
    v85 = v6;
    v88 = v7;
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v58)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v59 = objc_msgSend(v58, "shouldLog");
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
      v62 = (void *)objc_opt_class();
      v91 = v62;
      objc_msgSend(v4, "URL");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISURLOperation _sanitizedURLForURL:](self, "_sanitizedURLForURL:", v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = 138412802;
      v96 = v62;
      v97 = 1024;
      *(_DWORD *)v98 = 206;
      *(_WORD *)&v98[4] = 2112;
      *(_QWORD *)&v98[6] = v64;
      LODWORD(v80) = 28;
      v78 = &v95;
      v65 = (void *)_os_log_send_and_compose_impl();

      if (!v65)
      {
LABEL_77:

        objc_msgSend(v53, "resetStream");
        v55 = 0;
        v6 = v85;
        v7 = v88;
        goto LABEL_78;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v65, 4, &v95, v80);
      v60 = objc_claimAutoreleasedReturnValue();
      free(v65);
      v78 = (int *)v60;
      SSFileLog();
    }

    goto LABEL_77;
  }
LABEL_96:

}

void __42__ISURLOperation__handleReceivedResponse___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 344);
  *(_QWORD *)(v3 + 344) = v2;

}

- (id)_handleRedirectRequest:(id)a3 response:(id)a4
{
  id v6;
  id v7;
  NSURLRequest *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  uint64_t j;
  id v32;
  NSURLRequest *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _QWORD v40[5];

  v40[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = self->_activeURLRequest;
  v9 = (void *)objc_msgSend(v6, "mutableCopy");
  v10 = -[ISURLOperation _usesPrivateCookieStore](self, "_usesPrivateCookieStore");
  objc_msgSend(v9, "setHTTPShouldHandleCookies:", !v10);
  -[NSURLRequest HTTPBody](v8, "HTTPBody");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v9, "setHTTPBody:", v11);
  v34 = v7;
  -[NSURLRequest HTTPMethod](v8, "HTTPMethod");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v9, "setHTTPMethod:", v12);
  v33 = v8;
  -[NSURLRequest allHTTPHeaderFields](v8, "allHTTPHeaderFields");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = CFSTR("Content-Type");
  v14 = 0;
  v40[1] = (id)*MEMORY[0x24BEB2540];
  v40[2] = CFSTR("X-Apple-Client-Address");
  do
  {
    v15 = v12;
    v16 = (void *)v40[v14];
    ISDictionaryValueForCaseInsensitiveString(v13, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      objc_msgSend(v9, "setValue:forHTTPHeaderField:", v12, v16);
    ++v14;
  }
  while (v14 != 3);
  if (v10)
  {
    -[ISURLOperation _requestProperties](self, "_requestProperties");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "URLBagType");
    v18 = SSAccountScopeForURLBagType();

    objc_msgSend(MEMORY[0x24BEB2020], "sharedStorage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v6;
    objc_msgSend(v6, "URL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISURLOperation _accountIdentifier](self, "_accountIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "cookieHeadersForURL:userIdentifier:scope:", v20, v21, v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v23 = v22;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v36 != v26)
            objc_enumerationMutation(v23);
          v28 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v23, "objectForKey:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setValue:forHTTPHeaderField:", v29, v28);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v25);
    }

    v6 = v32;
  }
  -[ISURLOperation _willSendRequest:](self, "_willSendRequest:", v9);
  -[ISURLOperation _setActiveURLRequest:](self, "_setActiveURLRequest:", v9);
  -[ISURLOperation setResponse:](self, "setResponse:", v34);
  for (j = 2; j != -1; --j)

  return v9;
}

- (id)_activeURL
{
  return -[NSURLRequest URL](self->_activeURLRequest, "URL");
}

- (id)_copyConnectionPropertiesWithDataConnectionServiceType:(__CFString *)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;

  v5 = objc_alloc(MEMORY[0x24BDBCE70]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0x40000);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDB7840];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithObjectsAndKeys:", v6, v7, v8, *MEMORY[0x24BDB7830], 0);

  -[ISURLOperation _requestProperties](self, "_requestProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "shouldDisableCellular");
  v12 = (_QWORD *)MEMORY[0x24BDBD270];
  if ((v11 & 1) != 0)
  {
    v13 = (_QWORD *)MEMORY[0x24BDB7788];
    v14 = (_QWORD *)MEMORY[0x24BDBD270];
  }
  else
  {
    if (!objc_msgSend(v10, "shouldDisableCellularFallback"))
    {
      if ((objc_msgSend(v10, "isLargeDownload") & 1) == 0)
      {
        if (!a3)
        {
          v15 = 0;
          goto LABEL_17;
        }
        goto LABEL_15;
      }
LABEL_9:
      v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      goto LABEL_10;
    }
    v13 = (_QWORD *)MEMORY[0x24BDB7700];
    v14 = (_QWORD *)MEMORY[0x24BDBD268];
  }
  v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjectsAndKeys:", *v14, *v13, 0);
  if ((objc_msgSend(v10, "isLargeDownload") & 1) == 0)
    goto LABEL_11;
  if (!v15)
    goto LABEL_9;
LABEL_10:
  objc_msgSend(v15, "setObject:forKey:", *v12, *MEMORY[0x24BDB7620]);
LABEL_11:
  if (a3)
  {
    if (v15)
    {
LABEL_16:
      objc_msgSend(v15, "setObject:forKey:", a3, *MEMORY[0x24BDB7720]);
      objc_msgSend(v15, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDB7728]);
      goto LABEL_17;
    }
LABEL_15:
    v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    goto LABEL_16;
  }
LABEL_17:
  objc_msgSend(v10, "clientAuditBundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientAuditTokenData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v16 || objc_msgSend(v17, "length") == 32)
  {
    if (v15)
      v19 = (void *)objc_msgSend(v15, "mutableCopy");
    else
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 1);
    v20 = v19;
    if (v16)
    {
      v21 = *MEMORY[0x24BDB77C0];
      v22 = v16;
    }
    else
    {
      v21 = *MEMORY[0x24BDB77B8];
      v22 = v18;
    }
    objc_msgSend(v19, "setObject:forKey:", v22, v21);

  }
  else
  {
    v20 = v15;
  }
  v23 = objc_alloc(MEMORY[0x24BDBCE70]);
  v24 = (void *)objc_msgSend(v23, "initWithObjectsAndKeys:", v9, *MEMORY[0x24BDB7848], v20, *MEMORY[0x24BDB7838], 0);

  return v24;
}

- (id)_copyQueryStringDictionaryForRedirect:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ISURLOperation _requestProperties](self, "_requestProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if (objc_msgSend(v7, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = (id)objc_msgSend(v4, "copyQueryStringDictionaryWithUnescapedValues:", 0);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v7, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12++), (_QWORD)v14);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
  return v7;
}

- (id)_decodedDataForData:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v4 = a3;
  -[ISURLOperation _requestProperties](self, "_requestProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldDecodeResponse");

  v7 = v4;
  if ((v6 & 1) == 0)
  {
    -[ISURLOperation response](self, "response");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_iTunesStore_valueForHTTPHeader:", CFSTR("Content-Encoding"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v7 = v4;
    if (v9)
    {
      v7 = v4;
      if (!objc_msgSend(v9, "caseInsensitiveCompare:", CFSTR("gzip")))
      {
        v11 = ISCopyDecompressedGZipDataForData();
        v12 = v11;
        v7 = v4;
        if (v11)
        {
          v7 = v11;

        }
      }
    }

  }
  return v7;
}

- (int64_t)_defaultAuthChallengeDispositionForChallenge:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  int64_t v15;
  int v16;
  int v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint64_t v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "sender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if ((v6 & 1) == 0)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v16 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v17 = v16 | 2;
    else
      v17 = v16;
    objc_msgSend(v8, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      v17 &= 2u;
    if (v17)
    {
      v19 = (void *)objc_opt_class();
      v20 = v19;
      -[ISURLOperation _sanitizedDescriptionForObject:](self, "_sanitizedDescriptionForObject:", v4);
      v23 = 138412546;
      v24 = v19;
      v25 = 2112;
      v26 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v22) = 22;
      v15 = _os_log_send_and_compose_impl();

      if (!v15)
        goto LABEL_25;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v15, 4, &v23, v22);
      v18 = objc_claimAutoreleasedReturnValue();
      free((void *)v15);
      SSFileLog();
    }

    v15 = 0;
    goto LABEL_25;
  }
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = objc_msgSend(v8, "shouldLog");
  if (objc_msgSend(v8, "shouldLogToDisk"))
    v10 = v9 | 2;
  else
    v10 = v9;
  objc_msgSend(v8, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    v10 &= 2u;
  if (!v10)
    goto LABEL_12;
  v12 = (void *)objc_opt_class();
  v13 = v12;
  -[ISURLOperation _sanitizedDescriptionForObject:](self, "_sanitizedDescriptionForObject:", v4);
  v23 = 138412546;
  v24 = v12;
  v25 = 2112;
  v26 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = 22;
  v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 4, &v23, v22);
    v11 = objc_claimAutoreleasedReturnValue();
    free(v14);
    SSFileLog();
LABEL_12:

  }
  v15 = 1;
LABEL_25:

  return v15;
}

- (id)_errorWithDefaultStringsForError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  SSError();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    objc_msgSend(v4, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISURLOperation _errorWithDomain:code:](self, "_errorWithDomain:code:", v9, objc_msgSend(v4, "code"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "localizedDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SSErrorBySettingUserInfoValue();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v10;
  }
  else
  {
    v12 = v4;
  }

  return v12;
}

- (id)_errorWithDomain:(id)a3 code:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  -[ISURLOperation _requestProperties](self, "_requestProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isITunesStoreRequest"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DEFAULT_ERROR_TITLE"), &stru_24C441158, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ISURLOperation _activeURL](self, "_activeURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "host");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v7, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CANNOT_CONNECT"), &stru_24C441158, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      SSError();
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v10 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CANNOT_CONNECT_TO_HOST_%@"), &stru_24C441158, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v10, "initWithFormat:", v12, v7);

  }
  SSError();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v13;
}

- (BOOL)_isExternalURL:(id)a3
{
  id v4;
  ISURLResolverOperation *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFAllocator *v10;
  BOOL v11;
  uint64_t v12;
  const __SCNetworkReachability *v13;
  const __SCNetworkReachability *v14;
  BOOL v15;
  SCNetworkReachabilityFlags flags;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[ISURLResolverOperation initWithURL:]([ISURLResolverOperation alloc], "initWithURL:", v4);
  -[ISOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v5, 0);
  if (-[ISOperation success](v5, "success"))
  {
    -[ISURLResolverOperation resolvedAddresses](v5, "resolvedAddresses");
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v11 = 1;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v13 = SCNetworkReachabilityCreateWithAddress(v10, (const sockaddr *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12)), "bytes"));
        if (v13)
        {
          v14 = v13;
          flags = 0;
          SCNetworkReachabilityGetFlags(v13, &flags);
          v11 = (flags & 0x10000) == 0;
          CFRelease(v14);
        }
        if (!v11)
          break;
        if (v8 == ++v12)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v8)
            goto LABEL_4;
          break;
        }
      }
    }
    else
    {
      v11 = 1;
    }

    v15 = v11;
  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (BOOL)_isPassThroughStatus:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[ISURLOperation passThroughErrors](self, "passThroughErrors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISURLOperation passThroughErrors](self, "passThroughErrors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v6);

  return v8;
}

- (void)_logRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  int v11;
  void *v12;
  ISURLOperation *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int *v32;
  uint64_t v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((SSDebugShouldLogOutgoingHeaders() & 1) != 0 || SSDebugShouldLogResponseBodies())
  {
    objc_msgSend(v4, "allHTTPHeaderFields");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (SSIsInternalBuild() && objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfigOversize");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v8 = objc_msgSend(v7, "shouldLog");
      if (objc_msgSend(v7, "shouldLogToDisk"))
        v9 = v8 | 2;
      else
        v9 = v8;
      objc_msgSend(v7, "OSLogObject");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        v11 = v9;
      else
        v11 = v9 & 2;
      if (v11)
      {
        v12 = (void *)objc_opt_class();
        v34 = v12;
        -[ISURLOperation logKey](self, "logKey");
        v38 = v5;
        v13 = self;
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "URL");
        v36 = v6;
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[ISURLOperation _sanitizedURLForURL:](v13, "_sanitizedURLForURL:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[ISURLOperation _sanitizedStringForString:](v13, "_sanitizedStringForString:", v36);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 138544130;
        v41 = v12;
        v42 = 2114;
        v43 = v14;
        v44 = 2112;
        v45 = v16;
        v46 = 2112;
        v47 = v17;
        LODWORD(v33) = 42;
        v32 = &v40;
        v18 = (void *)_os_log_send_and_compose_impl();

        v6 = v36;
        self = v13;
        v5 = v38;

        if (v18)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v18, 4, &v40, v33);
          v19 = (int *)objc_claimAutoreleasedReturnValue();
          free(v18);
          v32 = v19;
          SSFileLog();

        }
      }
      else
      {

      }
    }
    if (!SSDebugShouldLogResponseBodies())
      goto LABEL_33;
    objc_msgSend(v4, "HTTPBody");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v20, "length"))
    {
LABEL_32:

LABEL_33:
      goto LABEL_34;
    }
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v20, 4);
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfigOversize");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v23 = objc_msgSend(v22, "shouldLog", v32);
    if (objc_msgSend(v22, "shouldLogToDisk"))
      v23 |= 2u;
    objc_msgSend(v22, "OSLogObject");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      v25 = v23;
    else
      v25 = v23 & 2;
    if (v25)
    {
      v26 = (void *)objc_opt_class();
      v35 = v26;
      objc_msgSend(v4, "URL");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISURLOperation _sanitizedURLForURL:](self, "_sanitizedURLForURL:", v27);
      v37 = v20;
      v28 = v21;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISURLOperation _sanitizedStringForString:](self, "_sanitizedStringForString:", v28);
      v39 = v5;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 138412802;
      v41 = v26;
      v42 = 2112;
      v43 = v29;
      v44 = 2112;
      v45 = v30;
      LODWORD(v33) = 32;
      v31 = (void *)_os_log_send_and_compose_impl();

      v5 = v39;
      v21 = v28;
      v20 = v37;

      if (!v31)
      {
LABEL_31:

        goto LABEL_32;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v31, 4, &v40, v33);
      v24 = objc_claimAutoreleasedReturnValue();
      free(v31);
      SSFileLog();
    }

    goto LABEL_31;
  }
LABEL_34:

}

- (void)_logResponseBody:(id)a3
{
  id v4;
  void *v5;
  NSObject *dataBufferAccessQueue;
  id v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD block[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  int v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "MIMEType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "rangeOfString:options:", CFSTR("text"), 1) != 0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(v5, "rangeOfString:options:", CFSTR("plist"), 1) != 0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(v5, "rangeOfString:options:", CFSTR("json"), 1) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__2;
    v26 = __Block_byref_object_dispose__2;
    v27 = 0;
    dataBufferAccessQueue = self->_dataBufferAccessQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __35__ISURLOperation__logResponseBody___block_invoke;
    block[3] = &unk_24C43C1D0;
    block[4] = self;
    block[5] = &v22;
    dispatch_sync(dataBufferAccessQueue, block);
    v7 = objc_alloc(MEMORY[0x24BDD17C8]);
    v20 = (void *)objc_msgSend(v7, "initWithData:encoding:", v23[5], 4);
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfigOversize");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v8, "shouldLog");
    v10 = objc_msgSend(v8, "shouldLogToDisk");
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
      v9 |= 2u;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      v13 = v9;
    else
      v13 = v9 & 2;
    if (v13)
    {
      v14 = (id)objc_opt_class();
      objc_msgSend(v4, "URL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISURLOperation _sanitizedURLForURL:](self, "_sanitizedURLForURL:", v15);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      -[ISURLOperation _sanitizedStringForString:](self, "_sanitizedStringForString:", v20);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138412802;
      v29 = v14;
      v30 = 2112;
      v31 = v16;
      v32 = 2112;
      v33 = v17;
      LODWORD(v19) = 32;
      v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18)
      {
LABEL_15:

        _Block_object_dispose(&v22, 8);
        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v18, 4, &v28, v19);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      free(v18);
      SSFileLog();
    }

    goto LABEL_15;
  }
LABEL_16:

}

void __35__ISURLOperation__logResponseBody___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_performDefaultHandlingForAuthenticationChallenge:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "sender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if ((v6 & 1) == 0)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v16 = v15 | 2;
    else
      v16 = v15;
    objc_msgSend(v8, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      v16 &= 2u;
    if (v16)
    {
      v18 = (void *)objc_opt_class();
      v19 = v18;
      -[ISURLOperation _sanitizedDescriptionForObject:](self, "_sanitizedDescriptionForObject:", v4);
      v22 = 138412546;
      v23 = v18;
      v24 = 2112;
      v25 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v21) = 22;
      v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_25:

        objc_msgSend(v5, "continueWithoutCredentialForAuthenticationChallenge:", v4);
        goto LABEL_26;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v20, 4, &v22, v21);
      v17 = objc_claimAutoreleasedReturnValue();
      free(v20);
      SSFileLog();
    }

    goto LABEL_25;
  }
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = objc_msgSend(v8, "shouldLog");
  if (objc_msgSend(v8, "shouldLogToDisk"))
    v10 = v9 | 2;
  else
    v10 = v9;
  objc_msgSend(v8, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    v10 &= 2u;
  if (!v10)
    goto LABEL_12;
  v12 = (void *)objc_opt_class();
  v13 = v12;
  -[ISURLOperation _sanitizedDescriptionForObject:](self, "_sanitizedDescriptionForObject:", v4);
  v22 = 138412546;
  v23 = v12;
  v24 = 2112;
  v25 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = 22;
  v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 4, &v22, v21);
    v11 = objc_claimAutoreleasedReturnValue();
    free(v14);
    SSFileLog();
LABEL_12:

  }
  objc_msgSend(v5, "performDefaultHandlingForAuthenticationChallenge:", v4);
LABEL_26:

}

- (void)_retry
{
  NSURLSessionTask *urlSessionTask;
  void *v4;
  NSURLSessionTask *v5;
  NSURLSessionTask *v6;
  NSURLSessionTask *v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  NSObject *v21;
  int v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  -[NSURLSessionTask cancel](self->_urlSessionTask, "cancel");
  urlSessionTask = self->_urlSessionTask;
  self->_urlSessionTask = 0;

  v4 = (void *)-[NSURLRequest mutableCopy](self->_activeURLRequest, "mutableCopy");
  if (v4)
  {
    -[ISURLOperation _setActiveURLRequest:](self, "_setActiveURLRequest:", v4);
    -[ISURLOperation _sendRequestToDelegate:](self, "_sendRequestToDelegate:", v4);
    -[SSURLSessionManager dataTaskWithRequest:delegate:](self->_urlSessionManager, "dataTaskWithRequest:delegate:", v4, self);
    v5 = (NSURLSessionTask *)objc_claimAutoreleasedReturnValue();
    v6 = self->_urlSessionTask;
    self->_urlSessionTask = v5;

    -[NSURLSessionTask resume](self->_urlSessionTask, "resume");
  }
  v7 = self->_urlSessionTask;
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (!v7)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v19 = objc_msgSend(v9, "shouldLog");
    if (objc_msgSend(v9, "shouldLogToDisk"))
      v20 = v19 | 2;
    else
      v20 = v19;
    objc_msgSend(v9, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      v22 = v20;
    else
      v22 = v20 & 2;
    if (v22)
    {
      v23 = (void *)objc_opt_class();
      v24 = v23;
      -[ISURLOperation logKey](self, "logKey");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISURLOperation _activeURL](self, "_activeURL");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISURLOperation _sanitizedURLForURL:](self, "_sanitizedURLForURL:", v26);
      v30 = 138543874;
      v31 = v23;
      v32 = 2114;
      v33 = v25;
      v34 = 2112;
      v35 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v29) = 32;
      v27 = (void *)_os_log_send_and_compose_impl();

      if (!v27)
      {
LABEL_29:

        -[ISURLOperation _errorWithDomain:code:](self, "_errorWithDomain:code:", *MEMORY[0x24BEB24A0], 109);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[ISOperation setError:](self, "setError:", v28);

        -[ISOperation stopRunLoop](self, "stopRunLoop");
        goto LABEL_30;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v27, 4, &v30, v29);
      v21 = objc_claimAutoreleasedReturnValue();
      free(v27);
      SSFileLog();
    }

    goto LABEL_29;
  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = objc_msgSend(v9, "shouldLog");
  if (objc_msgSend(v9, "shouldLogToDisk"))
    v11 = v10 | 2;
  else
    v11 = v10;
  objc_msgSend(v9, "OSLogObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    v13 = v11;
  else
    v13 = v11 & 2;
  if (!v13)
    goto LABEL_15;
  v14 = (void *)objc_opt_class();
  v15 = v14;
  -[ISURLOperation logKey](self, "logKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISURLOperation _activeURL](self, "_activeURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISURLOperation _sanitizedURLForURL:](self, "_sanitizedURLForURL:", v17);
  v30 = 138543874;
  v31 = v14;
  v32 = 2114;
  v33 = v16;
  v34 = 2112;
  v35 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v29) = 32;
  v18 = (void *)_os_log_send_and_compose_impl();

  if (v18)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v18, 4, &v30, v29);
    v12 = objc_claimAutoreleasedReturnValue();
    free(v18);
    SSFileLog();
LABEL_15:

  }
  -[ISURLOperation _logRequest:](self, "_logRequest:", v4);
LABEL_30:

}

- (void)_run
{
  void *v3;
  CFAbsoluteTime Current;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  uint64_t v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  CFAbsoluteTime v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  -[ISURLOperation _requestProperties](self, "_requestProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISOperation lock](self, "lock");
  if (self->_performanceMetrics)
  {
    Current = CFAbsoluteTimeGetCurrent();
    -[ISURLRequestPerformance setStartTime:](self->_performanceMetrics, "setStartTime:");
    -[ISOperation unlock](self, "unlock");
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    objc_msgSend(v5, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      v9 = v7;
    else
      v9 = v7 & 2;
    if (v9)
    {
      v10 = (void *)objc_opt_class();
      v22 = v10;
      -[ISURLOperation logKey](self, "logKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "URL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISURLOperation _sanitizedURLForURL:](self, "_sanitizedURLForURL:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138544130;
      v29 = v10;
      v30 = 2114;
      v31 = v11;
      v32 = 2048;
      v33 = Current;
      v34 = 2112;
      v35 = v13;
      LODWORD(v21) = 42;
      v20 = &v28;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_14:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 4, &v28, v21);
      v8 = objc_claimAutoreleasedReturnValue();
      free(v14);
      v20 = (int *)v8;
      SSFileLog();
    }

    goto LABEL_14;
  }
  -[ISOperation unlock](self, "unlock");
LABEL_16:
  objc_msgSend(v3, "URLs", v20);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
LABEL_18:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v18)
        objc_enumerationMutation(v15);
      if (-[ISURLOperation _runRequestWithURL:dataConnectionServiceType:](self, "_runRequestWithURL:dataConnectionServiceType:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v19), 0))
      {
        break;
      }
      if (v17 == ++v19)
      {
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v17)
          goto LABEL_18;
        break;
      }
    }
  }

}

- (BOOL)_runRequestWithURL:(id)a3 dataConnectionServiceType:(__CFString *)a4
{
  unint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  int v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  ISURLOperation *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  int v26;
  int v27;
  NSObject *v28;
  int v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  NSURLSessionTask *v36;
  NSURLSessionTask *urlSessionTask;
  void *v38;
  int v39;
  NSObject *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  int v49;
  NSObject *v50;
  int v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *dataBufferAccessQueue;
  NSURLSessionTask *v58;
  NSCountedSet *redirectURLs;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  double Current;
  double v65;
  void *v66;
  int v67;
  int v68;
  NSObject *v69;
  int v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  int64_t networkRetryCount;
  uint64_t v80;
  void *v81;
  int v82;
  int v83;
  NSObject *v84;
  int v85;
  void *v86;
  void *v87;
  void *v88;
  int64_t v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  int v95;
  NSObject *v96;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  int v104;
  NSObject *v105;
  void *v106;
  id v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  unint64_t v113;
  void *v114;
  int v115;
  NSObject *v116;
  void *v117;
  id v118;
  void *v119;
  void *v120;
  uint64_t v121;
  unint64_t v122;
  int v123;
  void *v124;
  void *v125;
  BOOL v126;
  int *v128;
  int *v129;
  uint64_t v130;
  const __CFString *mode;
  uint64_t v132;
  id v133;
  id v134;
  id v135;
  id v136;
  void *v137;
  id v138;
  void *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  ISURLOperation *v143;
  id v144;
  void *v145;
  void *v146;
  id v147;
  void *v148;
  _QWORD block[5];
  int v150;
  void *v151;
  __int16 v152;
  int64_t v153;
  __int16 v154;
  uint64_t v155;
  __int16 v156;
  void *v157;
  uint64_t v158;

  v158 = *MEMORY[0x24BDAC8D0];
  v147 = a3;
  -[ISURLOperation _requestProperties](self, "_requestProperties");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = objc_msgSend(v148, "allowedRetryCount");
  self->_networkRetryCount = 0;
  v141 = *MEMORY[0x24BEB24A0];
  mode = (const __CFString *)*MEMORY[0x24BDBD5A0];
  v5 = 0x24BEB1000uLL;
  v142 = *MEMORY[0x24BDD1308];
  v143 = self;
  while (1)
  {
    v6 = (void *)MEMORY[0x20BD37A0C]();
    v7 = -[ISURLOperation newRequestWithURL:](self, "newRequestWithURL:", v147);
    if (!v7)
    {
      v22 = self;
      v23 = v141;
      v24 = 109;
LABEL_57:
      -[ISURLOperation _errorWithDomain:code:](v22, "_errorWithDomain:code:", v23, v24, v128);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISOperation setError:](self, "setError:", v55);

      goto LABEL_64;
    }
    if (objc_msgSend(v148, "requiresExternal")
      && !-[ISURLOperation _isExternalURL:](self, "_isExternalURL:", v147))
    {
      objc_msgSend(*(id *)(v5 + 3736), "sharediTunesStoreConfig");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v47)
      {
        objc_msgSend(*(id *)(v5 + 3736), "sharedConfig");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v48 = objc_msgSend(v47, "shouldLog");
      if (objc_msgSend(v47, "shouldLogToDisk"))
        v49 = v48 | 2;
      else
        v49 = v48;
      objc_msgSend(v47, "OSLogObject");
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        v51 = v49;
      else
        v51 = v49 & 2;
      if (v51)
      {
        v52 = (void *)objc_opt_class();
        v150 = 138412290;
        v151 = v52;
        v53 = v52;
        LODWORD(v130) = 12;
        v128 = &v150;
        v54 = (void *)_os_log_send_and_compose_impl();

        if (!v54)
        {
LABEL_56:

          v22 = self;
          v23 = v141;
          v24 = 107;
          goto LABEL_57;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v54, 4, &v150, v130);
        v50 = objc_claimAutoreleasedReturnValue();
        free(v54);
        v128 = (int *)v50;
        SSFileLog();
      }

      goto LABEL_56;
    }
    if (!objc_msgSend(v148, "requiresHTTPS")
      || (objc_msgSend(v7, "URL"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v8, "scheme"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "caseInsensitiveCompare:", CFSTR("https")),
          v9,
          v8,
          !v10))
    {
      -[ISURLOperation _setActiveURLRequest:](self, "_setActiveURLRequest:", v7);
      -[ISURLOperation _sendRequestToDelegate:](self, "_sendRequestToDelegate:", v7);
      objc_msgSend(*(id *)(v5 + 3736), "sharedConfig");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v25)
      {
        objc_msgSend(*(id *)(v5 + 3736), "sharedConfig");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v137 = v6;
      v26 = objc_msgSend(v25, "shouldLog");
      if (objc_msgSend(v25, "shouldLogToDisk"))
        v27 = v26 | 2;
      else
        v27 = v26;
      objc_msgSend(v25, "OSLogObject");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        v29 = v27;
      else
        v29 = v27 & 2;
      if (v29)
      {
        v30 = (void *)objc_opt_class();
        v31 = v30;
        -[ISURLOperation logKey](self, "logKey");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "URL");
        v33 = v7;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v150 = 138543874;
        v151 = v30;
        v152 = 2114;
        v153 = (int64_t)v32;
        v154 = 2112;
        v155 = (uint64_t)v34;
        LODWORD(v130) = 32;
        v128 = &v150;
        v35 = (void *)_os_log_send_and_compose_impl();

        v7 = v33;
        if (!v35)
          goto LABEL_33;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v35, 4, &v150, v130);
        v28 = objc_claimAutoreleasedReturnValue();
        free(v35);
        v128 = (int *)v28;
        SSFileLog();
      }

LABEL_33:
      -[SSURLSessionManager dataTaskWithRequest:delegate:](self->_urlSessionManager, "dataTaskWithRequest:delegate:", v7, self);
      v36 = (NSURLSessionTask *)objc_claimAutoreleasedReturnValue();
      urlSessionTask = self->_urlSessionTask;
      self->_urlSessionTask = v36;

      if (!self->_urlSessionTask)
      {
        -[ISURLOperation _errorWithDomain:code:](self, "_errorWithDomain:code:", v141, 109);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[ISOperation setError:](self, "setError:", v56);

LABEL_63:
        v6 = v137;
        goto LABEL_64;
      }
      objc_msgSend(*(id *)(v5 + 3736), "sharediTunesStoreConfig");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v38)
      {
        objc_msgSend(*(id *)(v5 + 3736), "sharedConfig");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v39 = objc_msgSend(v38, "shouldLog", v128);
      if (objc_msgSend(v38, "shouldLogToDisk"))
        v39 |= 2u;
      objc_msgSend(v38, "OSLogObject");
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        v41 = v39;
      else
        v41 = v39 & 2;
      if (v41)
      {
        v42 = (void *)objc_opt_class();
        v135 = v42;
        objc_msgSend(v7, "HTTPMethod");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v132 = objc_msgSend(v7, "networkServiceType");
        objc_msgSend(v7, "URL");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[ISURLOperation _sanitizedURLForURL:](self, "_sanitizedURLForURL:", v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v150 = 138413058;
        v151 = v42;
        v152 = 2112;
        v153 = (int64_t)v43;
        v154 = 2048;
        v155 = v132;
        v156 = 2112;
        v157 = v45;
        LODWORD(v130) = 42;
        v129 = &v150;
        v46 = (void *)_os_log_send_and_compose_impl();

        if (!v46)
        {
LABEL_60:

          -[ISURLOperation _logRequest:](self, "_logRequest:", v7);
          -[ISURLOperation performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__stopIfCancelled, 0, 0.0);
          -[NSURLSessionTask resume](self->_urlSessionTask, "resume");
          -[ISOperation runRunLoopUntilStopped](self, "runRunLoopUntilStopped");
          if (-[ISURLOperation isCancelled](self, "isCancelled"))
          {
            -[NSURLSessionTask cancel](self->_urlSessionTask, "cancel");
            CFRunLoopRunInMode(mode, 0.0, 1u);
          }
          objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__stopIfCancelled, 0, v129);
          v5 = 0x24BEB1000uLL;
          goto LABEL_63;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v46, 4, &v150, v130);
        v40 = objc_claimAutoreleasedReturnValue();
        free(v46);
        v129 = (int *)v40;
        SSFileLog();
      }

      goto LABEL_60;
    }
    objc_msgSend(*(id *)(v5 + 3736), "sharediTunesStoreConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(*(id *)(v5 + 3736), "sharedConfig");
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
    v133 = v7;
    if (!v15)
      goto LABEL_18;
    v16 = (void *)objc_opt_class();
    v17 = v16;
    objc_msgSend(v7, "URL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "scheme");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v150 = 138412546;
    v151 = v16;
    v152 = 2112;
    v153 = (int64_t)v19;
    LODWORD(v130) = 22;
    v128 = &v150;
    v20 = (void *)_os_log_send_and_compose_impl();

    if (v20)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v20, 4, &v150, v130);
      v14 = objc_claimAutoreleasedReturnValue();
      free(v20);
      v128 = (int *)v14;
      SSFileLog();
LABEL_18:

    }
    -[ISURLOperation _errorWithDomain:code:](self, "_errorWithDomain:code:", v141, 128);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISOperation setError:](self, "setError:", v21);

    v7 = v133;
LABEL_64:
    objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__updateProgress, 0, v128);
    -[ISURLOperation _setActiveURLRequest:](self, "_setActiveURLRequest:", 0);
    dataBufferAccessQueue = self->_dataBufferAccessQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__ISURLOperation__runRequestWithURL_dataConnectionServiceType___block_invoke;
    block[3] = &unk_24C43C128;
    block[4] = self;
    dispatch_sync(dataBufferAccessQueue, block);
    -[NSURLSessionTask cancel](self->_urlSessionTask, "cancel");
    v58 = self->_urlSessionTask;
    self->_urlSessionTask = 0;

    redirectURLs = self->_redirectURLs;
    self->_redirectURLs = 0;

    if (-[ISOperation success](self, "success") || (-[ISURLOperation isCancelled](self, "isCancelled") & 1) != 0)
      goto LABEL_122;
    -[ISOperation error](self, "error");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    +[ISNetworkObserver sharedInstance](ISNetworkObserver, "sharedInstance");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "domain");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "isEqualToString:", v142);

    if (!v63)
      goto LABEL_82;
    if (!objc_msgSend(v61, "networkType"))
    {
      objc_msgSend(*(id *)(v5 + 3736), "sharediTunesStoreConfig");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v103)
      {
        objc_msgSend(*(id *)(v5 + 3736), "sharedConfig");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v104 = objc_msgSend(v103, "shouldLog");
      if (objc_msgSend(v103, "shouldLogToDisk"))
        v104 |= 2u;
      objc_msgSend(v103, "OSLogObject");
      v105 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
        v104 &= 2u;
      if (v104)
      {
        v106 = (void *)objc_opt_class();
        v144 = v106;
        objc_msgSend(v148, "URL");
        v146 = v61;
        v107 = v7;
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        -[ISURLOperation _sanitizedURLForURL:](self, "_sanitizedURLForURL:", v108);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        v150 = 138412546;
        v151 = v106;
        v152 = 2112;
        v153 = (int64_t)v109;
        LODWORD(v130) = 22;
        v128 = &v150;
        v110 = (void *)_os_log_send_and_compose_impl();

        v7 = v107;
        v61 = v146;

        if (v110)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v110, 4, &v150, v130);
          v105 = objc_claimAutoreleasedReturnValue();
          free(v110);
          v128 = (int *)v105;
          SSFileLog();
          goto LABEL_117;
        }
      }
      else
      {
LABEL_117:

      }
      -[ISURLOperation _errorWithDomain:code:](self, "_errorWithDomain:code:", v141, 110);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      SSErrorBySettingUserInfoValue();
      v96 = objc_claimAutoreleasedReturnValue();
      -[ISOperation setError:](self, "setError:", v96);
      v5 = 0x24BEB1000uLL;
      goto LABEL_119;
    }
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(v61, "lastNetworkTypeChangeTime");
    if (Current - v65 < 5.0)
    {
      objc_msgSend(*(id *)(v5 + 3736), "sharediTunesStoreConfig");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v66)
      {
        objc_msgSend(*(id *)(v5 + 3736), "sharedConfig");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v67 = objc_msgSend(v66, "shouldLog");
      if (objc_msgSend(v66, "shouldLogToDisk"))
        v68 = v67 | 2;
      else
        v68 = v67;
      objc_msgSend(v66, "OSLogObject");
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        v70 = v68;
      else
        v70 = v68 & 2;
      if (v70)
      {
        v71 = (void *)objc_opt_class();
        v138 = v71;
        objc_msgSend(v148, "URL");
        v72 = v60;
        v73 = v7;
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        -[ISURLOperation _sanitizedURLForURL:](v143, "_sanitizedURLForURL:", v74);
        v75 = v61;
        v76 = v6;
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v150 = 138412546;
        v151 = v71;
        v152 = 2112;
        v153 = (int64_t)v77;
        LODWORD(v130) = 22;
        v128 = &v150;
        v78 = (void *)_os_log_send_and_compose_impl();

        v7 = v73;
        v60 = v72;
        self = v143;

        v6 = v76;
        v61 = v75;

        v5 = 0x24BEB1000;
        if (!v78)
        {
LABEL_81:

          self->_networkRetryCount = 0;
          goto LABEL_97;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v78, 4, &v150, v130);
        v69 = objc_claimAutoreleasedReturnValue();
        free(v78);
        v128 = (int *)v69;
        SSFileLog();
      }

      goto LABEL_81;
    }
LABEL_82:
    if (!ISErrorIndicatesSlowNetwork(v60))
      goto LABEL_121;
    networkRetryCount = self->_networkRetryCount;
    self->_networkRetryCount = networkRetryCount + 1;
    objc_msgSend(*(id *)(v5 + 3736), "sharediTunesStoreConfig");
    v80 = objc_claimAutoreleasedReturnValue();
    v81 = (void *)v80;
    if (networkRetryCount >= v140)
      break;
    if (!v80)
    {
      objc_msgSend(*(id *)(v5 + 3736), "sharedConfig");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v82 = objc_msgSend(v81, "shouldLog");
    if (objc_msgSend(v81, "shouldLogToDisk"))
      v83 = v82 | 2;
    else
      v83 = v82;
    objc_msgSend(v81, "OSLogObject");
    v84 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
      v85 = v83;
    else
      v85 = v83 & 2;
    if (!v85)
      goto LABEL_95;
    v86 = (void *)objc_opt_class();
    v87 = v6;
    v88 = v61;
    v89 = self->_networkRetryCount;
    v136 = v86;
    objc_msgSend(v148, "URL");
    v139 = v60;
    v90 = v87;
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISURLOperation _sanitizedURLForURL:](v143, "_sanitizedURLForURL:", v91);
    v92 = v7;
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v150 = 138412802;
    v151 = v86;
    v152 = 2048;
    v153 = v89;
    v61 = v88;
    v154 = 2112;
    v155 = (uint64_t)v93;
    LODWORD(v130) = 32;
    v128 = &v150;
    v94 = (void *)_os_log_send_and_compose_impl();

    v6 = v90;
    v60 = v139;
    self = v143;

    v7 = v92;
    v5 = 0x24BEB1000;

    if (v94)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v94, 4, &v150, v130);
      v84 = objc_claimAutoreleasedReturnValue();
      free(v94);
      v128 = (int *)v84;
      SSFileLog();
LABEL_95:

    }
LABEL_97:
    objc_msgSend(MEMORY[0x24BDD17F0], "sleepForTimeInterval:", 5.0, v128);
    if ((-[ISURLOperation isCancelled](self, "isCancelled") & 1) != 0)
      goto LABEL_121;
    -[ISOperation setError:](self, "setError:", 0);

    objc_autoreleasePoolPop(v6);
  }
  if (!v80)
  {
    objc_msgSend(*(id *)(v5 + 3736), "sharedConfig");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v95 = objc_msgSend(v81, "shouldLog");
  if (objc_msgSend(v81, "shouldLogToDisk"))
    v95 |= 2u;
  objc_msgSend(v81, "OSLogObject");
  v96 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
    v95 &= 2u;
  if (!v95)
    goto LABEL_119;
  v145 = v61;
  v134 = v7;
  v97 = v6;
  v98 = (void *)objc_opt_class();
  v99 = v98;
  objc_msgSend(v148, "URL");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISURLOperation _sanitizedURLForURL:](self, "_sanitizedURLForURL:", v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = 138412546;
  v151 = v98;
  v152 = 2112;
  v153 = (int64_t)v101;
  LODWORD(v130) = 22;
  v128 = &v150;
  v102 = (void *)_os_log_send_and_compose_impl();

  if (v102)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v102, 4, &v150, v130);
    v96 = objc_claimAutoreleasedReturnValue();
    free(v102);
    v128 = (int *)v96;
    SSFileLog();
    v5 = 0x24BEB1000;
    v6 = v97;
    v7 = v134;
    v61 = v145;
LABEL_119:

    goto LABEL_120;
  }
  v5 = 0x24BEB1000;
  v6 = v97;
  v7 = v134;
  v61 = v145;
LABEL_120:

LABEL_121:
LABEL_122:

  objc_autoreleasePoolPop(v6);
  -[ISOperation error](self, "error");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  if (v111)
  {

    goto LABEL_133;
  }
  if (-[ISOperation success](self, "success"))
  {
    objc_msgSend(*(id *)(v5 + 3736), "sharedConfig");
    v112 = objc_claimAutoreleasedReturnValue();
    v113 = v5;
    v114 = (void *)v112;
    if (!v112)
    {
      objc_msgSend(*(id *)(v113 + 3736), "sharedConfig");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v115 = objc_msgSend(v114, "shouldLog", v128);
    if (objc_msgSend(v114, "shouldLogToDisk"))
      v115 |= 2u;
    objc_msgSend(v114, "OSLogObject");
    v116 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
      v115 &= 2u;
    if (v115)
    {
      v117 = (void *)objc_opt_class();
      v118 = v117;
      -[ISURLOperation logKey](self, "logKey");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v150 = 138543618;
      v151 = v117;
      v152 = 2114;
      v153 = (int64_t)v119;
      LODWORD(v130) = 22;
      v120 = (void *)_os_log_send_and_compose_impl();
      goto LABEL_141;
    }
LABEL_143:

  }
  else
  {
LABEL_133:
    objc_msgSend(*(id *)(v5 + 3736), "sharedConfig", v128);
    v121 = objc_claimAutoreleasedReturnValue();
    v122 = v5;
    v114 = (void *)v121;
    if (!v121)
    {
      objc_msgSend(*(id *)(v122 + 3736), "sharedConfig");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v123 = objc_msgSend(v114, "shouldLog");
    if (objc_msgSend(v114, "shouldLogToDisk"))
      v123 |= 2u;
    objc_msgSend(v114, "OSLogObject");
    v116 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
      v123 &= 2u;
    if (!v123)
      goto LABEL_143;
    v124 = (void *)objc_opt_class();
    v118 = v124;
    -[ISURLOperation logKey](self, "logKey");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISOperation error](self, "error");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v150 = 138543874;
    v151 = v124;
    v152 = 2114;
    v153 = (int64_t)v119;
    v154 = 2114;
    v155 = (uint64_t)v125;
    LODWORD(v130) = 32;
    v120 = (void *)_os_log_send_and_compose_impl();

LABEL_141:
    if (v120)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v120, 4, &v150, v130);
      v116 = objc_claimAutoreleasedReturnValue();
      free(v120);
      SSFileLog();
      goto LABEL_143;
    }
  }

  v126 = -[ISOperation success](self, "success");
  return v126;
}

void __63__ISURLOperation__runRequestWithURL_dataConnectionServiceType___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 344);
  *(_QWORD *)(v1 + 344) = 0;

}

- (void)_sendContentLengthToDelegate:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  ISURLOperation *v10;
  id v11;

  -[ISOperation delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", a3);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __47__ISURLOperation__sendContentLengthToDelegate___block_invoke;
    v8[3] = &unk_24C43C1A0;
    v9 = v5;
    v10 = self;
    v11 = v6;
    v7 = v6;
    -[ISOperation delegateDispatch:](self, "delegateDispatch:", v8);

  }
}

uint64_t __47__ISURLOperation__sendContentLengthToDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "operation:didDiscoverContentLength:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_sendOutputToDelegate:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  ISURLOperation *v8;
  id v9;

  v4 = a3;
  -[ISOperation delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __40__ISURLOperation__sendOutputToDelegate___block_invoke;
    v6[3] = &unk_24C43C1A0;
    v7 = v5;
    v8 = self;
    v9 = v4;
    -[ISOperation delegateDispatch:](self, "delegateDispatch:", v6);

  }
}

uint64_t __40__ISURLOperation__sendOutputToDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "operation:finishedWithOutput:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_sendRequestToDelegate:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  ISURLOperation *v8;
  id v9;

  v4 = a3;
  -[ISOperation delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __41__ISURLOperation__sendRequestToDelegate___block_invoke;
    v6[3] = &unk_24C43C1A0;
    v7 = v5;
    v8 = self;
    v9 = v4;
    -[ISOperation delegateDispatch:](self, "delegateDispatch:", v6);

  }
  -[ISURLOperation _willSendRequest:](self, "_willSendRequest:", v4);

}

uint64_t __41__ISURLOperation__sendRequestToDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "operation:willSendRequest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_sendResponseToDelegate:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  ISURLOperation *v8;
  id v9;

  v4 = a3;
  -[ISOperation delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __42__ISURLOperation__sendResponseToDelegate___block_invoke;
    v6[3] = &unk_24C43C1A0;
    v7 = v5;
    v8 = self;
    v9 = v4;
    -[ISOperation delegateDispatch:](self, "delegateDispatch:", v6);

  }
}

uint64_t __42__ISURLOperation__sendResponseToDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "operation:didReceiveResponse:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_setActiveURLRequest:(id)a3
{
  NSURLRequest *v4;
  NSURLRequest *activeURLRequest;

  if (self->_activeURLRequest != a3)
  {
    v4 = (NSURLRequest *)objc_msgSend(a3, "copy");
    activeURLRequest = self->_activeURLRequest;
    self->_activeURLRequest = v4;

  }
}

+ (__CFURLStorageSession)_sharedCacheStorageSession
{
  if (_sharedCacheStorageSession_sOnce != -1)
    dispatch_once(&_sharedCacheStorageSession_sOnce, &__block_literal_global_131);
  return (__CFURLStorageSession *)_sharedCacheStorageSession_storageSession;
}

void __44__ISURLOperation__sharedCacheStorageSession__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  __CFDictionary *Mutable;
  const void *v6;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x20BD37A0C]();
  if (MGGetSInt32Answer() != 4)
  {
    v1 = (void *)MEMORY[0x24BDD17C8];
    v7[0] = CPSharedResourcesDirectory();
    v7[1] = CFSTR("Library");
    v7[2] = CFSTR("Caches");
    v7[3] = CFSTR("sharedCaches");
    v7[4] = CFSTR("com.apple.iTunesStore.NSURLCache");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 5);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "pathWithComponents:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, 0);

    if (SSFileIsLocalWritable())
    {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      v6 = (const void *)*MEMORY[0x24BDBD270];
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDB7678], (const void *)*MEMORY[0x24BDBD270]);
      CFDictionarySetValue(Mutable, CFSTR("kCFURLStorageSessionEnableVaryHeaderSupport"), v6);
      _sharedCacheStorageSession_storageSession = _CFURLStorageSessionCreate();
      CFRelease(Mutable);
    }

  }
  objc_autoreleasePoolPop(v0);
}

- (BOOL)_shouldFollowRedirectWithRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  BOOL v18;
  BOOL v19;
  uint64_t v21;
  id v22;
  int v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ISURLOperation _requestProperties](self, "_requestProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "requiresHTTPS"))
  {
    v10 = objc_msgSend(v8, "caseInsensitiveCompare:", CFSTR("https"));

    if (v10)
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
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        v13 &= 2u;
      if (v13)
      {
        v23 = 138412546;
        v24 = (id)objc_opt_class();
        v25 = 2112;
        v26 = v8;
        v15 = v24;
        LODWORD(v21) = 22;
        v16 = (void *)_os_log_send_and_compose_impl();

        if (!v16)
        {
LABEL_14:

          -[ISURLOperation _errorWithDomain:code:](self, "_errorWithDomain:code:", *MEMORY[0x24BEB24A0], 128);
          v17 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_18;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v16, 4, &v23, v21);
        v14 = objc_claimAutoreleasedReturnValue();
        free(v16);
        SSFileLog();
      }

      goto LABEL_14;
    }
  }
  else
  {

  }
  v22 = 0;
  v18 = -[ISURLOperation shouldFollowRedirectWithRequest:returningError:](self, "shouldFollowRedirectWithRequest:returningError:", v6, &v22);
  v17 = v22;
  if (v18)
  {
    v19 = 1;
    goto LABEL_21;
  }
LABEL_18:
  if (*a4)
  {
    v17 = objc_retainAutorelease(v17);
    v19 = 0;
    *a4 = v17;
  }
  else
  {
    v19 = 0;
  }
LABEL_21:

  return v19;
}

- (void)_stopConnection
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[ISURLOperation dataProvider](self, "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isStream");

  if (v4)
  {
    -[ISOperation error](self, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[ISURLOperation dataProvider](self, "dataProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      -[ISOperation error](self, "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "streamDidFailWithError:", v8);

    }
    else
    {
      v9 = (id)objc_msgSend(v6, "closeStream");
    }

  }
  -[NSURLSessionTask cancel](self->_urlSessionTask, "cancel");
  -[ISOperation stopRunLoop](self, "stopRunLoop");
}

- (void)_stopIfCancelled
{
  if (-[ISURLOperation isCancelled](self, "isCancelled"))
    -[ISOperation stopRunLoop](self, "stopRunLoop");
}

- (id)_stringForCachePolicy:(unint64_t)a3
{
  if (a3 > 5)
    return CFSTR("Unknown");
  else
    return off_24C43C330[a3];
}

- (void)_updateProgress
{
  SSOperationProgress *progress;
  void *v5;
  uint64_t v6;
  NSObject *dataBufferAccessQueue;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, a2, 0);
  progress = self->super._progress;
  if (progress)
  {
    if (-[SSOperationProgress operationType](progress, "operationType") == 2)
    {
      v9 = 0;
      v10 = &v9;
      v11 = 0x2020000000;
      v12 = 0;
      -[ISURLOperation dataProvider](self, "dataProvider");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isStream"))
      {
        v6 = objc_msgSend(v5, "streamedBytes");
        v10[3] = v6;
      }
      else
      {
        dataBufferAccessQueue = self->_dataBufferAccessQueue;
        v8[0] = MEMORY[0x24BDAC760];
        v8[1] = 3221225472;
        v8[2] = __33__ISURLOperation__updateProgress__block_invoke;
        v8[3] = &unk_24C43C310;
        v8[4] = self;
        v8[5] = &v9;
        dispatch_sync(dataBufferAccessQueue, v8);
        v6 = v10[3];
      }
      -[SSOperationProgress setCurrentValue:](self->super._progress, "setCurrentValue:", v6);

      _Block_object_dispose(&v9, 8);
    }
    -[SSOperationProgress snapshot](self->super._progress, "snapshot");
    -[ISOperation sendProgressToDelegate](self, "sendProgressToDelegate");
    -[ISURLOperation performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", a2, 0, *MEMORY[0x24BEB2C80]);
  }
}

void *__33__ISURLOperation__updateProgress__block_invoke(uint64_t a1)
{
  void *result;

  result = *(void **)(*(_QWORD *)(a1 + 32) + 344);
  if (result)
  {
    result = (void *)objc_msgSend(result, "length");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (BOOL)_validateContentLength:(int64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  BOOL v17;
  uint64_t v19;
  id v20;
  int v21;
  void *v22;
  __int16 v23;
  int64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[ISURLOperation dataProvider](self, "dataProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "isStream"))
  {
    v20 = 0;
    v8 = objc_msgSend(v7, "canStreamContentLength:error:", a3, &v20);
    v9 = v20;
    if ((v8 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v11 = objc_msgSend(v10, "shouldLog");
      if (objc_msgSend(v10, "shouldLogToDisk"))
        v12 = v11 | 2;
      else
        v12 = v11;
      objc_msgSend(v10, "OSLogObject");
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        v12 &= 2u;
      if (v12)
      {
        v14 = (void *)objc_opt_class();
        v21 = 138412546;
        v22 = v14;
        v23 = 2048;
        v24 = a3;
        v15 = v14;
        LODWORD(v19) = 22;
        v16 = (void *)_os_log_send_and_compose_impl();

        if (!v16)
          goto LABEL_15;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v16, 4, &v21, v19);
        v13 = objc_claimAutoreleasedReturnValue();
        free(v16);
        SSFileLog();
      }

LABEL_15:
      v17 = 0;
      if (!a4)
        goto LABEL_20;
      goto LABEL_19;
    }
  }
  else
  {
    v9 = 0;
  }
  v17 = 1;
  if (a4)
LABEL_19:
    *a4 = objc_retainAutorelease(v9);
LABEL_20:

  return v17;
}

- (NSURLRequest)activeURLRequest
{
  return (NSURLRequest *)objc_getProperty(self, a2, 424, 1);
}

- (ISDataProvider)dataProvider
{
  return (ISDataProvider *)objc_getProperty(self, a2, 352, 1);
}

- (void)setDataProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (BOOL)_loadsHTTPFailures
{
  return self->_loadsHTTPFailures;
}

- (void)_setLoadsHTTPFailures:(BOOL)a3
{
  self->_loadsHTTPFailures = a3;
}

- (NSURLResponse)response
{
  return (NSURLResponse *)objc_getProperty(self, a2, 384, 1);
}

- (void)setResponse:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 384);
}

- (BOOL)_shouldSetCookies
{
  return self->_shouldSetCookies;
}

- (void)_setShouldSetCookies:(BOOL)a3
{
  self->_shouldSetCookies = a3;
}

- (BOOL)_usesPrivateCookieStore
{
  return self->_usesPrivateCookieStore;
}

- (void)_setUsesPrivateCookieStore:(BOOL)a3
{
  self->_usesPrivateCookieStore = a3;
}

- (BOOL)isUploadProgressRequested
{
  return self->_uploadProgressRequested;
}

- (void)setUploadProgressRequested:(BOOL)a3
{
  self->_uploadProgressRequested = a3;
}

- (NSString)logKey
{
  return (NSString *)objc_getProperty(self, a2, 464, 1);
}

- (void)setLogKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 464);
}

- (NSArray)passThroughErrors
{
  return self->_passThroughErrors;
}

- (void)setPassThroughErrors:(id)a3
{
  objc_storeStrong((id *)&self->_passThroughErrors, a3);
}

- (NSNumber)_accountDSIDOverride
{
  return self->__accountDSIDOverride;
}

- (void)_setAccountDSIDOverride:(id)a3
{
  objc_storeStrong((id *)&self->__accountDSIDOverride, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__accountDSIDOverride, 0);
  objc_storeStrong((id *)&self->_passThroughErrors, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_performanceMetrics, 0);
  objc_storeStrong((id *)&self->_httpArchive, 0);
  objc_storeStrong((id *)&self->_dataBufferAccessQueue, 0);
  objc_storeStrong((id *)&self->_activeURLRequest, 0);
  objc_storeStrong((id *)&self->_urlSessionTask, 0);
  objc_storeStrong((id *)&self->_urlSessionManager, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_requestProperties, 0);
  objc_storeStrong((id *)&self->_redirectURLs, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_dataBuffer, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
}

@end
