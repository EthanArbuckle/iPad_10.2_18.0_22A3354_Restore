@implementation SSVRefreshStoreQueueDownloadOperation

- (SSVRefreshStoreQueueDownloadOperation)initWithDownloadTransactionIdentifier:(id)a3 accountID:(id)a4
{
  id v6;
  id v7;
  SSVRefreshStoreQueueDownloadOperation *v8;
  uint64_t v9;
  NSString *downloadTransactionID;
  uint64_t v11;
  NSNumber *accountID;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SSVRefreshStoreQueueDownloadOperation;
  v8 = -[SSVLoadDownloadQueueOperation init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    downloadTransactionID = v8->_downloadTransactionID;
    v8->_downloadTransactionID = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    accountID = v8->_accountID;
    v8->_accountID = (NSNumber *)v11;

  }
  return v8;
}

- (id)isDownloadTransactionID
{
  return self->_downloadTransactionID;
}

- (NSNumber)accountID
{
  return self->_accountID;
}

- (void)main
{
  NSString *downloadTransactionID;
  NSNumber *accountID;
  _BOOL8 v5;
  id v6;
  id v7;

  downloadTransactionID = self->_downloadTransactionID;
  accountID = self->_accountID;
  v7 = 0;
  v5 = -[SSVRefreshStoreQueueDownloadOperation _refreshDownloadWithTransactionID:accountID:bagKey:error:](self, "_refreshDownloadWithTransactionID:accountID:bagKey:error:", downloadTransactionID, accountID, CFSTR("pendingApps"), &v7);
  v6 = v7;
  -[SSVOperation setError:](self, "setError:", v6);
  -[SSVOperation setSuccess:](self, "setSuccess:", v5);

}

- (BOOL)_refreshDownloadWithTransactionID:(id)a3 accountID:(id)a4 bagKey:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  BOOL v14;
  void *v15;
  SSMutableURLRequestProperties *v16;
  SSVLoadDownloadQueueOperation *v17;
  void *v18;
  int v19;
  int v20;
  NSObject *v21;
  int v22;
  void *v23;
  NSNumber *accountID;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  id *v36;
  int v37;
  void *v38;
  __int16 v39;
  NSNumber *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  v14 = 0;
  v15 = 0;
  if (v10 && v11 && v12)
  {
    v36 = a6;
    v16 = objc_alloc_init(SSMutableURLRequestProperties);
    -[SSMutableURLRequestProperties setURLBagKey:](v16, "setURLBagKey:", v13);
    -[SSMutableURLRequestProperties setValue:forRequestParameter:](v16, "setValue:forRequestParameter:", v10, CFSTR("endId"));
    -[SSMutableURLRequestProperties setValue:forRequestParameter:](v16, "setValue:forRequestParameter:", v10, CFSTR("startId"));
    v17 = -[SSVLoadDownloadQueueOperation initWithRequestProperties:]([SSVLoadDownloadQueueOperation alloc], "initWithRequestProperties:", v16);
    -[SSVLoadDownloadQueueOperation setAccountIdentifier:](v17, "setAccountIdentifier:", v11);
    -[SSVLoadDownloadQueueOperation setNeedsAuthentication:](v17, "setNeedsAuthentication:", 0);
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v19 = objc_msgSend(v18, "shouldLog");
    if (objc_msgSend(v18, "shouldLogToDisk"))
      v20 = v19 | 2;
    else
      v20 = v19;
    objc_msgSend(v18, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      v22 = v20;
    else
      v22 = v20 & 2;
    if (v22)
    {
      v23 = (void *)objc_opt_class();
      accountID = self->_accountID;
      v37 = 138412802;
      v38 = v23;
      v39 = 2112;
      v40 = accountID;
      v41 = 2112;
      v42 = v10;
      v25 = v23;
      LODWORD(v35) = 32;
      v26 = (void *)_os_log_send_and_compose_impl();

      if (v26)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v26, 4, &v37, v35);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        free(v26);
        SSFileLog(v18, CFSTR("%@"), v28, v29, v30, v31, v32, v33, (uint64_t)v27);

      }
    }
    else
    {

    }
    -[SSVOperation runChildOperation:](self, "runChildOperation:", v17);
    v14 = -[SSVOperation success](v17, "success");
    if (v14)
    {
      v15 = 0;
    }
    else
    {
      -[SSVOperation error](v17, "error");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    a6 = v36;

  }
  if (a6 && !v14)
    *a6 = objc_retainAutorelease(v15);

  return v14;
}

- (NSString)downloadTransactionID
{
  return (NSString *)objc_getProperty(self, a2, 424, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadTransactionID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_downloadTrasactionID, 0);
}

@end
