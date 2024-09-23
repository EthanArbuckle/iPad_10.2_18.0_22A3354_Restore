@implementation ISServerAuthenticationOperation

- (ISServerAuthenticationOperation)init
{
  ISServerAuthenticationOperation *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISServerAuthenticationOperation;
  result = -[ISOperation init](&v3, sel_init);
  if (result)
    result->_performsButtonAction = 1;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISServerAuthenticationOperation;
  -[ISServerAuthenticationOperation dealloc](&v3, sel_dealloc);
}

- (void)run
{
  objc_class *v3;
  void *v4;
  BOOL v5;
  ISDialog *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  int *v20;
  uint64_t v21;
  _QWORD v22[9];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  uint64_t v32;
  int v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v27 = 0;
  v28 = &v27;
  v29 = 0x3052000000;
  v30 = __Block_byref_object_copy__11;
  v31 = __Block_byref_object_dispose__11;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v3 = NSClassFromString(CFSTR("ServerAuthenticationOperation"));
  if (v3)
  {
    v4 = (void *)objc_msgSend([v3 alloc], "initWithDialog:", -[ISServerAuthenticationOperation dialog](self, "dialog"));
    objc_msgSend(v4, "setAuthenticationContext:", -[ISServerAuthenticationOperation authenticationContext](self, "authenticationContext"));
    objc_msgSend(v4, "setPerformsButtonAction:", -[ISServerAuthenticationOperation performsButtonAction](self, "performsButtonAction"));
    v5 = -[ISOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v4, v28 + 5);
    *((_BYTE *)v24 + 24) = v5;
    -[ISServerAuthenticationOperation setAuthenticatedAccountCredentialSource:](self, "setAuthenticatedAccountCredentialSource:", objc_msgSend(v4, "authenticatedAccountCredentialSource"));
    -[ISServerAuthenticationOperation setAuthenticatedAccountDSID:](self, "setAuthenticatedAccountDSID:", objc_msgSend(v4, "authenticatedAccountDSID"));
    -[ISServerAuthenticationOperation setPerformedButton:](self, "setPerformedButton:", objc_msgSend(v4, "performedButton"));
    -[ISServerAuthenticationOperation setRedirectURL:](self, "setRedirectURL:", objc_msgSend(v4, "redirectURL"));
    -[ISServerAuthenticationOperation setSelectedButton:](self, "setSelectedButton:", objc_msgSend(v4, "selectedButton"));

  }
  else
  {
    v6 = -[ISServerAuthenticationOperation dialog](self, "dialog");
    v7 = -[ISDialog copyXPCEncoding](v6, "copyXPCEncoding");
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2078]), "initWithEncodedDialog:", v7);
    objc_msgSend(v8, "setAuthenticationContext:", -[ISServerAuthenticationOperation authenticationContext](self, "authenticationContext"));
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsAuthenticationConfig");
    if (!v9)
      v9 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v10 = objc_msgSend(v9, "shouldLog");
    v11 = objc_msgSend(v9, "shouldLogToDisk");
    v12 = objc_msgSend(v9, "OSLogObject");
    if (v11)
      v10 |= 2u;
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      v10 &= 2u;
    if (v10)
    {
      v13 = objc_opt_class();
      objc_msgSend((id)objc_msgSend(v8, "authenticationContext"), "accountName");
      v14 = SSHashIfNeeded();
      v33 = 138543874;
      v34 = v13;
      v35 = 2112;
      v36 = v8;
      v37 = 2114;
      v38 = v14;
      LODWORD(v21) = 32;
      v20 = &v33;
      v15 = _os_log_send_and_compose_impl();
      if (v15)
      {
        v16 = (void *)v15;
        v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v15, 4, &v33, v21);
        free(v16);
        v20 = (int *)v17;
        SSFileLog();
      }
    }
    v18 = dispatch_semaphore_create(0);
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __38__ISServerAuthenticationOperation_run__block_invoke;
    v22[3] = &unk_24C43CD10;
    v22[8] = &v23;
    v22[4] = self;
    v22[5] = v6;
    v22[6] = v18;
    v22[7] = &v27;
    objc_msgSend(v8, "startWithAuthenticateResponse:", v22);
    dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v18);
    if (*((_BYTE *)v24 + 24) && -[ISServerAuthenticationOperation performsButtonAction](self, "performsButtonAction"))
      -[ISDialogButton performDefaultActionForDialog:](-[ISServerAuthenticationOperation performedButton](self, "performedButton"), "performDefaultActionForDialog:", v6);
    v19 = (id)v28[5];

    xpc_release(v7);
  }
  -[ISOperation setError:](self, "setError:", v28[5], v20);
  -[ISOperation setSuccess:](self, "setSuccess:", *((unsigned __int8 *)v24 + 24));
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
}

intptr_t __38__ISServerAuthenticationOperation_run__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  unint64_t v6;
  unint64_t v7;

  if (a3)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setAuthenticatedAccountDSID:", objc_msgSend(a2, "authenticatedAccountIdentifier"));
    objc_msgSend(*(id *)(a1 + 32), "setRedirectURL:", objc_msgSend(a2, "redirectURL"));
    v5 = (void *)objc_msgSend(*(id *)(a1 + 40), "buttons");
    v6 = objc_msgSend(a2, "performedButtonIndex");
    if (v6 < objc_msgSend(v5, "count"))
      objc_msgSend(*(id *)(a1 + 32), "setPerformedButton:", objc_msgSend(v5, "objectAtIndex:", v6));
    v7 = objc_msgSend(a2, "selectedButtonIndex");
    if (v7 < objc_msgSend(v5, "count"))
      objc_msgSend(*(id *)(a1 + 32), "setSelectedButton:", objc_msgSend(v5, "objectAtIndex:", v7));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (SSAuthenticationContext)authenticationContext
{
  return (SSAuthenticationContext *)objc_getProperty(self, a2, 352, 1);
}

- (void)setAuthenticationContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (unint64_t)authenticatedAccountCredentialSource
{
  return self->_authenticatedAccountCredentialSource;
}

- (void)setAuthenticatedAccountCredentialSource:(unint64_t)a3
{
  self->_authenticatedAccountCredentialSource = a3;
}

- (NSNumber)authenticatedAccountDSID
{
  return (NSNumber *)objc_getProperty(self, a2, 344, 1);
}

- (void)setAuthenticatedAccountDSID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (ISDialog)dialog
{
  return (ISDialog *)objc_getProperty(self, a2, 360, 1);
}

- (void)setDialog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 360);
}

- (ISDialogButton)performedButton
{
  return (ISDialogButton *)objc_getProperty(self, a2, 376, 1);
}

- (void)setPerformedButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 376);
}

- (BOOL)performsButtonAction
{
  return self->_performsButtonAction;
}

- (void)setPerformsButtonAction:(BOOL)a3
{
  self->_performsButtonAction = a3;
}

- (NSURL)redirectURL
{
  return (NSURL *)objc_getProperty(self, a2, 384, 1);
}

- (void)setRedirectURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 384);
}

- (ISDialogButton)selectedButton
{
  return (ISDialogButton *)objc_getProperty(self, a2, 392, 1);
}

- (void)setSelectedButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 392);
}

@end
