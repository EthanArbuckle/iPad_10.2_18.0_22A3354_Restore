@implementation ISDataProvider

- (ISDataProvider)init
{
  objc_super v4;

  __ISRecordSPIClassUsage(self);
  v4.receiver = self;
  v4.super_class = (Class)ISDataProvider;
  return -[ISDataProvider init](&v4, sel_init);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[4] = -[ISDataProvider contentLength](self, "contentLength");
  -[ISDataProvider contentType](self, "contentType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  v8 = (void *)v5[5];
  v5[5] = v7;

  return v5;
}

+ (id)provider
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (BOOL)canStreamContentLength:(int64_t)a3 error:(id *)a4
{
  if (a4)
    *a4 = 0;
  return 1;
}

- (id)closeStream
{
  return 0;
}

- (void)configureFromProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "authenticationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISDataProvider setAuthenticationContext:](self, "setAuthenticationContext:", v5);

  -[ISDataProvider bagContext](self, "bagContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISDataProvider setBagContext:](self, "setBagContext:", v6);

  objc_msgSend(v4, "contentType");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[ISDataProvider setContentType:](self, "setContentType:", v7);
}

- (BOOL)isStream
{
  return 0;
}

- (BOOL)isStreamComplete
{
  return 0;
}

- (void)migrateOutputFromSubProvider:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "authenticatedAccountDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISDataProvider setAuthenticatedAccountDSID:](self, "setAuthenticatedAccountDSID:", v5);

  objc_msgSend(v4, "redirectURL");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[ISDataProvider setRedirectURL:](self, "setRedirectURL:", v6);
}

- (int64_t)streamedBytes
{
  return 0;
}

- (BOOL)parseData:(id)a3 returningError:(id *)a4
{
  -[ISDataProvider setOutput:](self, "setOutput:", a3);
  if (a4)
    *a4 = 0;
  return 1;
}

- (void)setup
{
  -[ISDataProvider setOutput:](self, "setOutput:", 0);
  -[ISDataProvider setRedirectURL:](self, "setRedirectURL:", 0);
}

- (BOOL)runAuthorizationDialog:(id)a3 error:(id *)a4
{
  id v6;
  ISServerAuthenticationOperation *v7;
  void *v8;
  id v9;
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
  BOOL v21;
  id v22;
  void *v23;
  uint64_t v25;
  id v26;
  id v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_alloc_init(ISServerAuthenticationOperation);
  -[ISServerAuthenticationOperation setDialog:](v7, "setDialog:", v6);
  objc_msgSend(v6, "authenticationContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (id)objc_msgSend(v8, "mutableCopy");
  if (!v9)
  {
    -[ISDataProvider authenticationContext](self, "authenticationContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v10, "mutableCopy");

    if (!v9)
      v9 = objc_alloc_init(MEMORY[0x24BEB1F28]);
  }
  -[ISServerAuthenticationOperation setAuthenticationContext:](v7, "setAuthenticationContext:", v9);
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsAuthenticationConfig");
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
    v16 = (void *)objc_opt_class();
    v26 = v16;
    AMSSetLogKeyIfNeeded();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accountName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    SSHashIfNeeded();
    v28 = 138544130;
    v29 = v16;
    v30 = 2114;
    v31 = v17;
    v32 = 2112;
    v33 = v9;
    v34 = 2114;
    v35 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = 42;
    v19 = (void *)_os_log_send_and_compose_impl();

    if (v19)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v19, 4, &v28, v25);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      free(v19);
      SSFileLog();

    }
  }
  else
  {

  }
  v27 = 0;
  v21 = -[ISDataProvider _runServerAuthenticationOperation:error:](self, "_runServerAuthenticationOperation:error:", v7, &v27);
  v22 = v27;
  v23 = v22;
  if (a4 && !v21)
    *a4 = objc_retainAutorelease(v22);

  return v21;
}

- (BOOL)runSubOperation:(id)a3 error:(id *)a4
{
  id v6;
  ISOperation *v7;
  BOOL v8;
  id v9;
  void *v10;
  id v12;

  v6 = a3;
  -[ISDataProvider parentOperation](self, "parentOperation");
  v7 = (ISOperation *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = objc_alloc_init(ISOperation);
  v12 = 0;
  v8 = -[ISOperation runSubOperation:returningError:](v7, "runSubOperation:returningError:", v6, &v12);
  v9 = v12;
  v10 = v9;
  if (a4 && !v8)
    *a4 = objc_retainAutorelease(v9);

  return v8;
}

- (BOOL)runTouchIDAuthorizationDialog:(id)a3 fallbackDialog:(id)a4 error:(id *)a5
{
  return -[ISDataProvider runTouchIDAuthorizationDialog:fallbackDialog:metricsDictionary:error:](self, "runTouchIDAuthorizationDialog:fallbackDialog:metricsDictionary:error:", a3, a4, 0, a5);
}

- (BOOL)runTouchIDAuthorizationDialog:(id)a3 fallbackDialog:(id)a4 metricsDictionary:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  SSBiometricAuthenticationContext *biometricAuthenticationContext;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  ISBiometricAuthorizationDialogOperation *v19;
  int v20;
  int v21;
  NSObject *v22;
  int v23;
  int v24;
  int v25;
  int v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  int v37;
  NSObject *v38;
  int v39;
  id v40;
  void *v41;
  SSBiometricAuthenticationContext *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  _BOOL4 v47;
  void *v48;
  id *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v55;
  id v56;
  void *v57;
  id v58;
  id *v59;
  void *v60;
  id v61;
  int v62;
  id v63;
  __int16 v64;
  SSBiometricAuthenticationContext *v65;
  __int16 v66;
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v60 = v10;
  objc_msgSend(v10, "paymentSheet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    biometricAuthenticationContext = self->_biometricAuthenticationContext;
    objc_msgSend(v10, "paymentSheet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSBiometricAuthenticationContext setPaymentSheet:](biometricAuthenticationContext, "setPaymentSheet:", v15);

  }
  -[SSBiometricAuthenticationContext challenge](self->_biometricAuthenticationContext, "challenge");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsAuthenticationConfig");
    v19 = (ISBiometricAuthorizationDialogOperation *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v19 = (ISBiometricAuthorizationDialogOperation *)objc_claimAutoreleasedReturnValue();
    }
    v24 = -[ISBiometricAuthorizationDialogOperation shouldLog](v19, "shouldLog");
    if (-[ISBiometricAuthorizationDialogOperation shouldLogToDisk](v19, "shouldLogToDisk"))
      v25 = v24 | 2;
    else
      v25 = v24;
    -[ISBiometricAuthorizationDialogOperation OSLogObject](v19, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      v26 = v25;
    else
      v26 = v25 & 2;
    if (v26)
      goto LABEL_24;
    goto LABEL_41;
  }
  -[ISDataProvider authenticationContext](self, "authenticationContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "shouldSuppressDialogs");

  if (v18)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsAuthenticationConfig");
    v19 = (ISBiometricAuthorizationDialogOperation *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v19 = (ISBiometricAuthorizationDialogOperation *)objc_claimAutoreleasedReturnValue();
    }
    v20 = -[ISBiometricAuthorizationDialogOperation shouldLog](v19, "shouldLog");
    if (-[ISBiometricAuthorizationDialogOperation shouldLogToDisk](v19, "shouldLogToDisk"))
      v21 = v20 | 2;
    else
      v21 = v20;
    -[ISBiometricAuthorizationDialogOperation OSLogObject](v19, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      v23 = v21;
    else
      v23 = v21 & 2;
    if (v23)
    {
LABEL_24:
      v62 = 138543362;
      v63 = (id)objc_opt_class();
      v27 = v63;
      LODWORD(v55) = 12;
      v28 = (void *)_os_log_send_and_compose_impl();

      if (v28)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v28, 4, &v62, v55);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        free(v28);
        SSFileLog();

      }
      goto LABEL_42;
    }
LABEL_41:

LABEL_42:
    v46 = 0;
    LOBYTE(v47) = 0;
    goto LABEL_47;
  }
  v19 = -[ISBiometricAuthorizationDialogOperation initWithTouchIDDialog:fallbackDialog:]([ISBiometricAuthorizationDialogOperation alloc], "initWithTouchIDDialog:fallbackDialog:", v10, v11);
  -[ISBiometricAuthorizationDialogOperation setBiometricAuthenticationContext:](v19, "setBiometricAuthenticationContext:", self->_biometricAuthenticationContext);
  -[ISBiometricAuthorizationDialogOperation setMetricsDictionary:](v19, "setMetricsDictionary:", v12);
  -[SSAuthenticationContext signupRequestParameters](self->_authenticationContext, "signupRequestParameters");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKey:", CFSTR("product"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = (void *)objc_msgSend(MEMORY[0x24BDBCF48], "copyDictionaryForQueryString:unescapedValues:", v31, 1);
    -[ISBiometricAuthorizationDialogOperation setBuyParams:](v19, "setBuyParams:", v32);

  }
  -[SSAuthenticationContext HTTPHeaders](self->_authenticationContext, "HTTPHeaders");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectForKey:", *MEMORY[0x24BEB2518]);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[ISBiometricAuthorizationDialogOperation setUserAgent:](v19, "setUserAgent:", v34);
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsAuthenticationConfig");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v35)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v36 = objc_msgSend(v35, "shouldLog");
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
  if (v39)
  {
    v58 = v12;
    v59 = a6;
    v40 = v11;
    v41 = (void *)objc_opt_class();
    v42 = self->_biometricAuthenticationContext;
    v56 = v41;
    -[SSBiometricAuthenticationContext accountName](v42, "accountName");
    v57 = v34;
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    SSHashIfNeeded();
    v62 = 138543874;
    v63 = v41;
    v11 = v40;
    v64 = 2112;
    v65 = v42;
    v12 = v58;
    a6 = v59;
    v66 = 2114;
    v67 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v55) = 32;
    v44 = (void *)_os_log_send_and_compose_impl();

    v34 = v57;
    if (v44)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v44, 4, &v62, v55);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      free(v44);
      SSFileLog();

    }
  }
  else
  {

  }
  v61 = 0;
  v47 = -[ISDataProvider runSubOperation:error:](self, "runSubOperation:error:", v19, &v61);
  v46 = v61;
  if (v47)
  {
    -[ISBiometricAuthorizationDialogOperation selectedButton](v19, "selectedButton");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISBiometricAuthorizationDialogOperation dialog](v19, "dialog");
    v49 = a6;
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISDataProvider _performActionsForButton:withDialog:](self, "_performActionsForButton:withDialog:", v48, v50);

    -[ISBiometricAuthorizationDialogOperation biometricAuthenticationContext](v19, "biometricAuthenticationContext");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "accountIdentifier");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISDataProvider setAuthenticatedAccountDSID:](self, "setAuthenticatedAccountDSID:", v52);

    a6 = v49;
    -[ISBiometricAuthorizationDialogOperation redirectURL](v19, "redirectURL");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISDataProvider setRedirectURL:](self, "setRedirectURL:", v53);

  }
LABEL_47:

  if (a6 && !v47)
    *a6 = objc_retainAutorelease(v46);

  return v47;
}

- (void)_performActionsForButton:(id)a3 withDialog:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  if (objc_msgSend(v6, "actionType") == 4)
    objc_msgSend(v6, "performDefaultActionForDialog:", v5);

}

- (BOOL)_runServerAuthenticationOperation:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v19;
  id v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v20 = 0;
  v7 = -[ISDataProvider runSubOperation:error:](self, "runSubOperation:error:", v6, &v20);
  v8 = v20;
  if (v7)
  {
    -[ISDataProvider setAuthenticatedAccountCredentialSource:](self, "setAuthenticatedAccountCredentialSource:", objc_msgSend(v6, "authenticatedAccountCredentialSource"));
    objc_msgSend(v6, "authenticatedAccountDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISDataProvider setAuthenticatedAccountDSID:](self, "setAuthenticatedAccountDSID:", v9);

    objc_msgSend(v6, "redirectURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISDataProvider setRedirectURL:](self, "setRedirectURL:", v10);

    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsAuthenticationConfig");
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
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    v13 &= 2u;
  if (v13)
  {
    v15 = (void *)objc_opt_class();
    v21 = 138543618;
    v22 = v15;
    v23 = 2112;
    v24 = v8;
    v16 = v15;
    LODWORD(v19) = 22;
    v17 = (void *)_os_log_send_and_compose_impl();

    if (!v17)
      goto LABEL_14;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v17, 4, &v21, v19);
    v14 = objc_claimAutoreleasedReturnValue();
    free(v17);
    SSFileLog();
  }

LABEL_14:
  if (a4)
    *a4 = objc_retainAutorelease(v8);
LABEL_16:

  return v7;
}

- (SSAuthenticationContext)authenticationContext
{
  return (SSAuthenticationContext *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAuthenticationContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
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
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAuthenticatedAccountDSID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (SSURLBagContext)bagContext
{
  return (SSURLBagContext *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBagContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (int64_t)contentLength
{
  return self->_contentLength;
}

- (void)setContentLength:(int64_t)a3
{
  self->_contentLength = a3;
}

- (NSString)contentType
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setContentType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (int64_t)errorHandlerResponseType
{
  return self->_errorHandlerResponseType;
}

- (void)setErrorHandlerResponseType:(int64_t)a3
{
  self->_errorHandlerResponseType = a3;
}

- (id)output
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setOutput:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (ISOperation)parentOperation
{
  return (ISOperation *)objc_loadWeakRetained((id *)&self->_parentOperation);
}

- (void)setParentOperation:(id)a3
{
  objc_storeWeak((id *)&self->_parentOperation, a3);
}

- (NSURLResponse)response
{
  return (NSURLResponse *)objc_getProperty(self, a2, 96, 1);
}

- (void)setResponse:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSURL)redirectURL
{
  return (NSURL *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRedirectURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (SSBiometricAuthenticationContext)biometricAuthenticationContext
{
  return (SSBiometricAuthenticationContext *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBiometricAuthenticationContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (ISBiometricSessionDelegate)biometricSessionDelegate
{
  return self->_biometricSessionDelegate;
}

- (void)setBiometricSessionDelegate:(id)a3
{
  self->_biometricSessionDelegate = (ISBiometricSessionDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_biometricAuthenticationContext, 0);
  objc_storeStrong((id *)&self->_redirectURL, 0);
  objc_destroyWeak((id *)&self->_parentOperation);
  objc_storeStrong(&self->_output, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_bagContext, 0);
  objc_storeStrong((id *)&self->_authenticatedAccountDSID, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
}

@end
