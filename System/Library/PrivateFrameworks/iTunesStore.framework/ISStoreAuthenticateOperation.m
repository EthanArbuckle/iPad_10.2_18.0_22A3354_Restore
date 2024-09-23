@implementation ISStoreAuthenticateOperation

- (ISStoreAuthenticateOperation)initWithAuthenticationContext:(id)a3
{
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  ISStoreAuthenticateOperation *v11;
  SSMutableAuthenticationContext *v12;
  int *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(MEMORY[0x24BEB1DE8], "deviceIsInternalBuild"))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsAuthenticationConfig");
    if (!v5)
      v5 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v7 &= 2u;
    if (v7)
    {
      v16 = 138543874;
      v17 = objc_opt_class();
      v18 = 2114;
      v19 = AMSLogKey();
      v20 = 2114;
      v21 = objc_msgSend(MEMORY[0x24BEB1FE0], "generateSymbolicatedStackShot");
      LODWORD(v15) = 32;
      v14 = &v16;
      v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        v9 = (void *)v8;
        v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, &v16, v15);
        free(v9);
        v14 = (int *)v10;
        SSFileLog();
      }
    }
  }
  v11 = -[ISOperation init](self, "init", v14);
  if (v11)
  {
    v12 = (SSMutableAuthenticationContext *)objc_msgSend(a3, "mutableCopy");
    v11->_authenticationContext = v12;
    -[SSMutableAuthenticationContext setShouldSuppressDialogs:](v12, "setShouldSuppressDialogs:", 1);
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISStoreAuthenticateOperation;
  -[ISStoreAuthenticateOperation dealloc](&v3, sel_dealloc);
}

- (SSAuthenticateResponse)authenticateResponse
{
  SSAuthenticateResponse *v3;

  -[ISOperation lock](self, "lock");
  v3 = self->_authenticateResponse;
  -[ISOperation unlock](self, "unlock");
  return v3;
}

- (SSAuthenticationContext)authenticationContext
{
  void *v3;

  -[ISOperation lock](self, "lock");
  v3 = (void *)-[SSMutableAuthenticationContext copy](self->_authenticationContext, "copy");
  -[ISOperation unlock](self, "unlock");
  return (SSAuthenticationContext *)v3;
}

- (id)authenticatedAccountDSID
{
  id result;

  result = (id)objc_msgSend((id)-[SSAuthenticateResponse authenticatedAccount](-[ISStoreAuthenticateOperation authenticateResponse](self, "authenticateResponse"), "authenticatedAccount"), "uniqueIdentifier");
  if (!result)
    return (id)-[SSAuthenticationContext requiredUniqueIdentifier](-[ISStoreAuthenticateOperation authenticationContext](self, "authenticationContext"), "requiredUniqueIdentifier");
  return result;
}

- (void)run
{
  ISNetworkObserver *v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  SSMutableAuthenticationContext *authenticationContext;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD v16[6];
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  SSMutableAuthenticationContext *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = +[ISNetworkObserver sharedInstance](ISNetworkObserver, "sharedInstance");
  -[ISNetworkObserver beginUsingNetwork](v3, "beginUsingNetwork");
  v4 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsAuthenticationConfig");
  if (!v4)
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v5 = objc_msgSend(v4, "shouldLog");
  v6 = objc_msgSend(v4, "shouldLogToDisk");
  v7 = objc_msgSend(v4, "OSLogObject");
  if (v6)
    v5 |= 2u;
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    v5 &= 2u;
  if (v5)
  {
    v8 = objc_opt_class();
    v9 = AMSLogKey();
    authenticationContext = self->_authenticationContext;
    -[SSMutableAuthenticationContext accountName](authenticationContext, "accountName");
    v17 = 138544130;
    v18 = v8;
    v19 = 2114;
    v20 = v9;
    v21 = 2112;
    v22 = authenticationContext;
    v23 = 2114;
    v24 = SSHashIfNeeded();
    LODWORD(v15) = 42;
    v11 = _os_log_send_and_compose_impl();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v11, 4, &v17, v15);
      free(v12);
      SSFileLog();
    }
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1DB8]), "initWithAuthenticationContext:", self->_authenticationContext);
  if (-[ISStoreAuthenticateOperation parentViewController](self, "parentViewController"))
    objc_msgSend(v13, "set_parentViewController:", -[ISStoreAuthenticateOperation parentViewController](self, "parentViewController"));
  v14 = dispatch_semaphore_create(0);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __35__ISStoreAuthenticateOperation_run__block_invoke;
  v16[3] = &unk_24C43C8C8;
  v16[4] = self;
  v16[5] = v14;
  objc_msgSend(v13, "startWithAuthenticateResponseBlock:", v16);
  dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v14);

  -[ISNetworkObserver endUsingNetwork](v3, "endUsingNetwork");
}

intptr_t __35__ISStoreAuthenticateOperation_run__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  int *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsAuthenticationConfig");
  v7 = (void *)v6;
  if (a2)
  {
    if (!v6)
      v7 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_INFO))
      v9 &= 2u;
    if (v9)
    {
      v10 = objc_opt_class();
      objc_msgSend((id)objc_msgSend(a2, "authenticatedAccount"), "accountName");
      v22 = 138544386;
      v23 = v10;
      v24 = 2114;
      v25 = SSHashIfNeeded();
      v26 = 2048;
      v27 = objc_msgSend(a2, "authenticateResponseType");
      v28 = 2112;
      v29 = objc_msgSend(a2, "error");
      v30 = 2112;
      v31 = objc_msgSend(a2, "responseDictionary");
      LODWORD(v21) = 52;
      v20 = &v22;
      v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        v12 = (void *)v11;
        v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v11, 4, &v22, v21);
        free(v12);
        v20 = (int *)v13;
        SSFileLog();
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_handleAuthenticateResponse:", a2, v20);
  }
  else
  {
    if (!v6)
      v7 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v14 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v15 = v14 | 2;
    else
      v15 = v14;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_ERROR))
      v15 &= 2u;
    if (v15)
    {
      v22 = 138543618;
      v23 = objc_opt_class();
      v24 = 2112;
      v25 = a3;
      LODWORD(v21) = 22;
      v20 = &v22;
      v16 = _os_log_send_and_compose_impl();
      if (v16)
      {
        v17 = (void *)v16;
        v18 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v16, 4, &v22, v21);
        free(v17);
        v20 = (int *)v18;
        SSFileLog();
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "setError:", a3, v20);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)uniqueKey
{
  void *v2;
  void *v3;
  const __CFString *v4;

  v2 = (void *)-[SSAuthenticationContext requiredUniqueIdentifier](-[ISStoreAuthenticateOperation authenticationContext](self, "authenticationContext"), "requiredUniqueIdentifier");
  v3 = (void *)MEMORY[0x24BDD17C8];
  if (v2)
    v4 = (const __CFString *)objc_msgSend(v2, "stringValue");
  else
    v4 = CFSTR("0");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("com.apple.iTunesStore.auth.%@"), v4);
}

- (void)_handleAuthenticateResponse:(id)a3
{
  uint64_t v5;
  ISProcessPropertyListOperation *v6;
  ISPropertyListProvider *v7;
  uint64_t v8;

  v5 = objc_msgSend(a3, "responseDictionary");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = -[ISProcessPropertyListOperation initWithPropertyList:]([ISProcessPropertyListOperation alloc], "initWithPropertyList:", v5);
    v7 = objc_alloc_init(ISPropertyListProvider);
    -[ISProtocolDataProvider setShouldProcessAccount:](v7, "setShouldProcessAccount:", 0);
    -[ISProcessPropertyListOperation setDataProvider:](v6, "setDataProvider:", v7);

    -[ISOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v6, 0);
  }
  v8 = 0;
  if (objc_msgSend((id)objc_opt_class(), "_copyErrorForAuthenticateResponse:error:", a3, &v8))
    -[ISOperation setSuccess:](self, "setSuccess:", 1);
  else
    -[ISOperation setError:](self, "setError:", v8);
  -[ISOperation lock](self, "lock");

  self->_authenticateResponse = (SSAuthenticateResponse *)a3;
  -[ISOperation unlock](self, "unlock");
}

+ (BOOL)_copyErrorForAuthenticateResponse:(id)a3 error:(id *)a4
{
  void *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  int v18;
  int v19;
  BOOL v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  uint64_t v27;
  _BYTE v28[22];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  switch(objc_msgSend(a3, "authenticateResponseType"))
  {
    case 0:
    case 1:
      v10 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsAuthenticationConfig");
      if (!v10)
        v10 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v11 = objc_msgSend(v10, "shouldLog");
      if (objc_msgSend(v10, "shouldLogToDisk"))
        v12 = v11 | 2;
      else
        v12 = v11;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v10, "OSLogObject"), OS_LOG_TYPE_ERROR))
        v12 &= 2u;
      if (!v12)
        goto LABEL_53;
      goto LABEL_51;
    case 2:
      v14 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsAuthenticationConfig");
      if (!v14)
        v14 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v15 = objc_msgSend(v14, "shouldLog");
      if (objc_msgSend(v14, "shouldLogToDisk"))
        v16 = v15 | 2;
      else
        v16 = v15;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v14, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
        v16 &= 2u;
      if (!v16)
        goto LABEL_53;
      *(_DWORD *)v28 = 138412290;
      *(_QWORD *)&v28[4] = objc_opt_class();
      LODWORD(v27) = 12;
      v9 = (void *)_os_log_send_and_compose_impl();
      if (!v9)
        goto LABEL_53;
      goto LABEL_52;
    case 3:
    case 6:
    case 7:
    case 8:
      v6 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsAuthenticationConfig");
      if (!v6)
        v6 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v7 = objc_msgSend(v6, "shouldLog");
      if (objc_msgSend(v6, "shouldLogToDisk"))
        v8 = v7 | 2;
      else
        v8 = v7;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v6, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
        v8 &= 2u;
      if (!v8)
        goto LABEL_53;
      *(_DWORD *)v28 = 138412546;
      *(_QWORD *)&v28[4] = objc_opt_class();
      *(_WORD *)&v28[12] = 2048;
      *(_QWORD *)&v28[14] = objc_msgSend(a3, "authenticateResponseType");
      LODWORD(v27) = 22;
      v9 = (void *)_os_log_send_and_compose_impl();
      if (!v9)
        goto LABEL_53;
      goto LABEL_52;
    case 4:
      v17 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsAuthenticationConfig");
      if (!v17)
        v17 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v18 = objc_msgSend(v17, "shouldLog");
      if (objc_msgSend(v17, "shouldLogToDisk"))
        v19 = v18 | 2;
      else
        v19 = v18;
      v20 = 1;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v17, "OSLogObject"), OS_LOG_TYPE_INFO))
        v19 &= 2u;
      if (v19)
      {
        *(_DWORD *)v28 = 138412290;
        *(_QWORD *)&v28[4] = objc_opt_class();
        LODWORD(v27) = 12;
        v21 = _os_log_send_and_compose_impl();
        if (v21)
        {
          v22 = (void *)v21;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v21, 4, v28, v27);
          free(v22);
          SSFileLog();
          return 1;
        }
      }
      return v20;
    case 5:
      v23 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsAuthenticationConfig");
      if (!v23)
        v23 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v24 = objc_msgSend(v23, "shouldLog");
      if (objc_msgSend(v23, "shouldLogToDisk"))
        v25 = v24 | 2;
      else
        v25 = v24;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v23, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
        v25 &= 2u;
      if (!v25)
        goto LABEL_53;
LABEL_51:
      *(_DWORD *)v28 = 138412290;
      *(_QWORD *)&v28[4] = objc_opt_class();
      LODWORD(v27) = 12;
      v9 = (void *)_os_log_send_and_compose_impl();
      if (v9)
      {
LABEL_52:
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, v28, v27, *(_OWORD *)v28);
        free(v9);
        SSFileLog();
      }
LABEL_53:
      v13 = (void *)ISError();
LABEL_54:
      v20 = 0;
      if (a4)
        *a4 = v13;
      return v20;
    default:
      v13 = 0;
      goto LABEL_54;
  }
}

- (id)parentViewController
{
  return objc_getProperty(self, a2, 352, 1);
}

- (void)setParentViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

@end
