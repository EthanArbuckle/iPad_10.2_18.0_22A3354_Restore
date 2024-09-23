@implementation SUScriptAuthenticationOperation

- (SUScriptAuthenticationOperation)init
{
  return -[SUScriptAuthenticationOperation initWithAccountIdentifier:](self, "initWithAccountIdentifier:", 0);
}

- (SUScriptAuthenticationOperation)initWithAccountIdentifier:(id)a3
{
  id v4;
  SUScriptAuthenticationOperation *v5;
  uint64_t v6;
  SSMutableAuthenticationContext *authenticationContext;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUScriptAuthenticationOperation;
  v5 = -[SUScriptAuthenticationOperation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BEB1F28]), "initWithAccountIdentifier:", v4);
    authenticationContext = v5->_authenticationContext;
    v5->_authenticationContext = (SSMutableAuthenticationContext *)v6;

  }
  return v5;
}

- (void)run
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  SSMutableAuthenticationContext *authenticationContext;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  int *v25;
  uint64_t v26;
  id v27;
  int v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    v5 &= 2u;
  if (v5)
  {
    v7 = (void *)objc_opt_class();
    authenticationContext = self->_authenticationContext;
    v9 = v7;
    -[SSMutableAuthenticationContext requiredUniqueIdentifier](authenticationContext, "requiredUniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138412546;
    v29 = v7;
    v30 = 2112;
    v31 = v10;
    LODWORD(v26) = 22;
    v25 = &v28;
    v11 = (void *)_os_log_send_and_compose_impl();

    if (!v11)
      goto LABEL_10;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v11, 4, &v28, v26);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v11);
    v25 = (int *)v6;
    SSFileLog();
  }

LABEL_10:
  -[SSMutableAuthenticationContext setForceDaemonAuthentication:](self->_authenticationContext, "setForceDaemonAuthentication:", 1);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8C28]), "initWithAuthenticationContext:", self->_authenticationContext);
  -[SUScriptAuthenticationOperation presentingViewController](self, "presentingViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SUScriptAuthenticationOperation presentingViewController](self, "presentingViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setParentViewController:", v14);

  }
  v27 = 0;
  v15 = -[SUScriptAuthenticationOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v12, &v27, v25);
  v16 = v27;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "shouldLog");
    if (objc_msgSend(v18, "shouldLogToDisk"))
      v20 = v19 | 2;
    else
      v20 = v19;
    objc_msgSend(v18, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      v20 &= 2u;
    if (v20)
    {
      v22 = (void *)objc_opt_class();
      v28 = 138412546;
      v29 = v22;
      v30 = 2112;
      v31 = v16;
      v23 = v22;
      LODWORD(v26) = 22;
      v24 = (void *)_os_log_send_and_compose_impl();

      if (!v24)
      {
LABEL_23:

        -[SUScriptAuthenticationOperation setError:](self, "setError:", v16);
        goto LABEL_24;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v24, 4, &v28, v26);
      v21 = objc_claimAutoreleasedReturnValue();
      free(v24);
      SSFileLog();
    }

    goto LABEL_23;
  }
  objc_msgSend(v12, "authenticatedAccountDSID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUScriptAuthenticationOperation setAuthenticatedDSID:](self, "setAuthenticatedDSID:", v17);

  -[SUScriptAuthenticationOperation setSuccess:](self, "setSuccess:", 1);
LABEL_24:

}

- (void)sendCompletionCallback:(id)a3
{
  id v4;
  void *v5;
  char IsEqual;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  __CFString *v14;

  v4 = a3;
  -[SUScriptAuthenticationOperation error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  IsEqual = ISErrorIsEqual();

  if ((IsEqual & 1) != 0)
  {
    v7 = 0;
    v8 = CFSTR("cancel");
  }
  else if (-[SUScriptAuthenticationOperation success](self, "success"))
  {
    +[SUScriptAccountManager beginAccountManagerSessionForObject:](SUScriptAccountManager, "beginAccountManagerSessionForObject:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUScriptAuthenticationOperation authenticatedAccountDSID](self, "authenticatedAccountDSID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accountForDSID:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[SUScriptAccountManager endAccountManagerSessionForObject:](SUScriptAccountManager, "endAccountManagerSessionForObject:", self);
    v8 = CFSTR("success");
  }
  else
  {
    v7 = 0;
    v8 = CFSTR("fail");
  }
  v13 = v4;
  v14 = (__CFString *)v8;
  v11 = v7;
  v12 = v4;
  WebThreadRun();

}

void __58__SUScriptAuthenticationOperation_sendCompletionCallback___block_invoke(uint64_t *a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v2 = objc_alloc(MEMORY[0x24BDBCE30]);
  v3 = v2;
  v4 = a1[4];
  v5 = a1[5];
  if (a1[6])
  {
    v6 = objc_msgSend(v2, "initWithObjects:", v4, v5, a1[6], 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v3, "initWithObjects:", v4, v5, v7, 0);

    v6 = (uint64_t)v9;
  }
  v10 = (id)v6;
  v8 = (id)objc_msgSend((id)a1[4], "callWebScriptMethod:withArguments:", CFSTR("call"), v6);

}

- (void)setScriptOptions:(id)a3
{
  char isKindOfClass;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = v13;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v13, "safeValueForKey:", CFSTR("additionalQueryParameters"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v13, "safeValueForKey:", CFSTR("additionalQueryParamters"));
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(MEMORY[0x24BDBCF48], "copyDictionaryForQueryString:unescapedValues:", v6, 1);
      -[SSMutableAuthenticationContext setRequestParameters:](self->_authenticationContext, "setRequestParameters:", v8);

    }
    objc_msgSend(v13, "safeValueForKey:", CFSTR("forced"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v9, "BOOLValue"))
      -[SSMutableAuthenticationContext setPromptStyle:](self->_authenticationContext, "setPromptStyle:", 1);
    objc_msgSend(v13, "safeValueForKey:", CFSTR("reason"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SSMutableAuthenticationContext setReasonDescription:](self->_authenticationContext, "setReasonDescription:", v10);
    objc_msgSend(v13, "safeValueForKey:", CFSTR("username"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SSMutableAuthenticationContext setAccountName:](self->_authenticationContext, "setAccountName:", v11);
    objc_msgSend(v13, "safeValueForKey:", CFSTR("password"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SSMutableAuthenticationContext setPassword:](self->_authenticationContext, "setPassword:", v12);
      -[SSMutableAuthenticationContext setPromptStyle:](self->_authenticationContext, "setPromptStyle:", 1001);
      -[SSMutableAuthenticationContext setAllowsSilentAuthentication:](self->_authenticationContext, "setAllowsSilentAuthentication:", 1);
    }

    v5 = v13;
  }

}

- (NSNumber)authenticatedDSID
{
  return (NSNumber *)objc_getProperty(self, a2, 336, 1);
}

- (void)setAuthenticatedDSID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 352, 1);
}

- (void)setPresentingViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
  objc_storeStrong((id *)&self->_authenticatedDSID, 0);
}

@end
