@implementation SUScriptAppleIdAuthenticationOperation

- (SUScriptAppleIdAuthenticationOperation)initWithUsername:(id)a3 password:(id)a4 viewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  SUScriptAppleIdAuthenticationOperation *v11;
  AKAppleIDAuthenticationInAppContext *v12;
  AKAppleIDAuthenticationInAppContext *authenticationContext;
  SUScriptAppleIdAuthenticationOperation *v14;
  void *v15;
  int v16;
  int v17;
  NSObject *v18;
  id v19;
  void *v20;
  uint64_t v22;
  objc_super v23;
  int v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "shouldLog");
    if (objc_msgSend(v15, "shouldLogToDisk"))
      v17 = v16 | 2;
    else
      v17 = v16;
    objc_msgSend(v15, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      v17 &= 2u;
    if (v17)
    {
      v24 = 138543362;
      v25 = (id)objc_opt_class();
      v19 = v25;
      LODWORD(v22) = 12;
      v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_14:

        v14 = 0;
        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v20, 4, &v24, v22);
      v18 = objc_claimAutoreleasedReturnValue();
      free(v20);
      SSFileLog();
    }

    goto LABEL_14;
  }
  v23.receiver = self;
  v23.super_class = (Class)SUScriptAppleIdAuthenticationOperation;
  v11 = -[SUScriptAppleIdAuthenticationOperation init](&v23, sel_init);
  if (v11)
  {
    v12 = (AKAppleIDAuthenticationInAppContext *)objc_alloc_init(getAKAppleIDAuthenticationInAppContextClass());
    authenticationContext = v11->_authenticationContext;
    v11->_authenticationContext = v12;

    -[AKAppleIDAuthenticationInAppContext setUsername:](v11->_authenticationContext, "setUsername:", v8);
    -[AKAppleIDAuthenticationInAppContext _setPassword:](v11->_authenticationContext, "_setPassword:", v9);
    -[AKAppleIDAuthenticationInAppContext setShouldForceInteractiveAuth:](v11->_authenticationContext, "setShouldForceInteractiveAuth:", 0);
    -[AKAppleIDAuthenticationInAppContext setIsUsernameEditable:](v11->_authenticationContext, "setIsUsernameEditable:", 1);
    -[AKAppleIDAuthenticationInAppContext setShouldUpdatePersistentServiceTokens:](v11->_authenticationContext, "setShouldUpdatePersistentServiceTokens:", 1);
    -[AKAppleIDAuthenticationInAppContext setPresentingViewController:](v11->_authenticationContext, "setPresentingViewController:", v10);
    -[AKAppleIDAuthenticationInAppContext setFirstTimeLogin:](v11->_authenticationContext, "setFirstTimeLogin:", 1);
    -[AKAppleIDAuthenticationInAppContext setIsUsernameEditable:](v11->_authenticationContext, "setIsUsernameEditable:", 0);
    objc_storeStrong((id *)&v11->_viewController, a5);
  }
  self = v11;
  v14 = self;
LABEL_15:

  return v14;
}

- (void)run
{
  id v3;
  dispatch_semaphore_t v4;
  AKAppleIDAuthenticationInAppContext *authenticationContext;
  NSObject *v6;
  dispatch_time_t v7;
  _QWORD v8[5];
  dispatch_semaphore_t v9;

  v3 = objc_alloc_init(getAKAppleIDAuthenticationControllerClass());
  v4 = dispatch_semaphore_create(0);
  authenticationContext = self->_authenticationContext;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__SUScriptAppleIdAuthenticationOperation_run__block_invoke;
  v8[3] = &unk_24DE7B168;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v3, "authenticateWithContext:completion:", authenticationContext, v8);
  v7 = dispatch_time(0, 60000000000);
  dispatch_semaphore_wait(v6, v7);

}

void __45__SUScriptAppleIdAuthenticationOperation_run__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  dispatch_time_t v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  int v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v13 = objc_alloc_init(MEMORY[0x24BDB4398]);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE060E0]), "initWithAccountStore:", v13);
    v15 = objc_alloc_init(MEMORY[0x24BE060D0]);
    objc_msgSend(v15, "setAuthenticationResults:", v5);
    objc_msgSend(v15, "setViewController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 344));
    v16 = *MEMORY[0x24BE06080];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __45__SUScriptAppleIdAuthenticationOperation_run__block_invoke_23;
    v21[3] = &unk_24DE7BF30;
    v17 = *(void **)(a1 + 40);
    v21[4] = *(_QWORD *)(a1 + 32);
    v22 = v17;
    objc_msgSend(v14, "signInService:withContext:completion:", v16, v15, v21);
    v18 = *(NSObject **)(a1 + 40);
    v19 = dispatch_time(0, 60000000000);
    dispatch_semaphore_wait(v18, v19);

    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldLog");
  if (objc_msgSend(v7, "shouldLogToDisk"))
    v9 = v8 | 2;
  else
    v9 = v8;
  objc_msgSend(v7, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    v9 &= 2u;
  if (!v9)
    goto LABEL_10;
  v23 = 138412546;
  v24 = (id)objc_opt_class();
  v25 = 2112;
  v26 = v6;
  v11 = v24;
  LODWORD(v20) = 22;
  v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v12, 4, &v23, v20);
    v10 = objc_claimAutoreleasedReturnValue();
    free(v12);
    SSFileLog();
LABEL_10:

  }
  objc_msgSend(*(id *)(a1 + 32), "setError:", v6);
  objc_msgSend(*(id *)(a1 + 32), "setSuccess:", 0);
LABEL_13:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __45__SUScriptAppleIdAuthenticationOperation_run__block_invoke_23(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  _BYTE v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "shouldLog");
    if (objc_msgSend(v6, "shouldLogToDisk"))
      v8 = v7 | 2;
    else
      v8 = v7;
    objc_msgSend(v6, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      v8 &= 2u;
    if (v8)
    {
      *(_DWORD *)v14 = 138412546;
      *(_QWORD *)&v14[4] = objc_opt_class();
      *(_WORD *)&v14[12] = 2112;
      *(_QWORD *)&v14[14] = v5;
      v10 = *(id *)&v14[4];
      LODWORD(v13) = 22;
      v12 = v14;
      v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_11:

        objc_msgSend(*(id *)(a1 + 32), "setError:", v5);
        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v11, 4, v14, v13, *(_OWORD *)v14, *(_QWORD *)&v14[16], v15);
      v9 = objc_claimAutoreleasedReturnValue();
      free(v11);
      v12 = v9;
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(*(id *)(a1 + 32), "setSuccess:", a2, v12);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)sendCompletionCallback:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSString *status;
  __CFString *v8;
  char v9;
  id v10;

  v4 = a3;
  -[SUScriptAppleIdAuthenticationOperation error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "code");

  if (v6 == -7064)
  {
    status = self->_status;
    v8 = CFSTR("cancel");
  }
  else
  {
    v9 = -[SUScriptAppleIdAuthenticationOperation success](self, "success");
    status = self->_status;
    if ((v9 & 1) != 0)
      v8 = CFSTR("success");
    else
      v8 = CFSTR("fail");
  }
  self->_status = &v8->isa;

  v10 = v4;
  WebThreadRun();

}

void __65__SUScriptAppleIdAuthenticationOperation_sendCompletionCallback___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  SUScriptFunction *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldLog");
  if (objc_msgSend(v2, "shouldLogToDisk"))
    v4 = v3 | 2;
  else
    v4 = v3;
  objc_msgSend(v2, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    v4 &= 2u;
  if (!v4)
    goto LABEL_9;
  v6 = (void *)objc_opt_class();
  v7 = *(void **)(a1 + 32);
  v8 = v6;
  objc_msgSend(v7, "status");
  v15 = 138412546;
  v16 = v6;
  v17 = 2112;
  v18 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = 22;
  v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, &v15, v13);
    v5 = objc_claimAutoreleasedReturnValue();
    free(v9);
    SSFileLog();
LABEL_9:

  }
  v10 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", *(_QWORD *)(a1 + 40));
  -[SUScriptFunction setThisObject:](v10, "setThisObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "status");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUScriptFunction callWithArguments:](v10, "callWithArguments:", v12);

  -[SUScriptFunction setThisObject:](v10, "setThisObject:", 0);
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
}

@end
