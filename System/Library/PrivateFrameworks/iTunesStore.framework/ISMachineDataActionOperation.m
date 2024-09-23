@implementation ISMachineDataActionOperation

- (ISMachineDataActionOperation)initWithMachineDataRequest:(id)a3
{
  id v5;
  id v6;
  objc_super v8;

  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ISMachineDataActionOperation;
  v6 = -[ISOperation init](&v8, sel_init);
  if (v6)
  {
    *((_BYTE *)v6 + 331) = objc_msgSend(v5, "waitsForPurchaseOperations");
    objc_storeStrong((id *)v6 + 42, a3);
  }

  return (ISMachineDataActionOperation *)v6;
}

- (BOOL)blocksPurchaseRequests
{
  BOOL v3;

  -[ISOperation lock](self, "lock");
  v3 = *(&self->super._success + 1);
  -[ISOperation unlock](self, "unlock");
  return v3;
}

- (BOOL)hidesServerDrivenDialogs
{
  BOOL v3;

  -[ISOperation lock](self, "lock");
  v3 = *(&self->super._success + 2);
  -[ISOperation unlock](self, "unlock");
  return v3;
}

- (SSMachineDataRequest)machineDataRequest
{
  return (SSMachineDataRequest *)*(id *)&self->_blocksPurchaseRequests;
}

- (id)resultBlock
{
  void *v3;
  void *v4;

  -[ISOperation lock](self, "lock");
  v3 = (void *)-[SSMachineDataRequest copy](self->_request, "copy");
  -[ISOperation unlock](self, "unlock");
  v4 = (void *)MEMORY[0x20BD37BD4](v3);

  return v4;
}

- (void)setBlocksPurchaseRequests:(BOOL)a3
{
  -[ISOperation lock](self, "lock");
  *(&self->super._success + 1) = a3;
  -[ISOperation unlock](self, "unlock");
}

- (void)setHidesServerDrivenDialogs:(BOOL)a3
{
  -[ISOperation lock](self, "lock");
  *(&self->super._success + 2) = a3;
  -[ISOperation unlock](self, "unlock");
}

- (void)setResultBlock:(id)a3
{
  SSMachineDataRequest *v4;
  SSMachineDataRequest *request;
  SSMachineDataRequest *v6;

  v6 = (SSMachineDataRequest *)a3;
  -[ISOperation lock](self, "lock");
  if (self->_request != v6)
  {
    v4 = (SSMachineDataRequest *)-[SSMachineDataRequest copy](v6, "copy");
    request = self->_request;
    self->_request = v4;

  }
  -[ISOperation unlock](self, "unlock");

}

- (void)setUserAgent:(id)a3
{
  NSString *v4;
  NSString *syncState;
  NSString *v6;

  v6 = (NSString *)a3;
  -[ISOperation lock](self, "lock");
  if (self->_syncState != v6)
  {
    v4 = (NSString *)-[NSString copy](v6, "copy");
    syncState = self->_syncState;
    self->_syncState = v4;

  }
  -[ISOperation unlock](self, "unlock");

}

- (NSString)syncState
{
  id v3;

  -[NSLock lock](self->super._lock, "lock");
  v3 = self->_resultBlock;
  -[NSLock unlock](self->super._lock, "unlock");
  return (NSString *)v3;
}

- (NSString)userAgent
{
  NSString *v3;

  -[ISOperation lock](self, "lock");
  v3 = self->_syncState;
  -[ISOperation unlock](self, "unlock");
  return v3;
}

- (void)run
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _BOOL8 v13;
  void *v14;
  uint64_t v15;
  id v16;
  void (**v17)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v18;
  void *v19;
  int v20;
  int v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  int *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedFairPlayAnisetteConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
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
    v8 = *(void **)&self->_blocksPurchaseRequests;
    v30 = 138543618;
    v31 = v7;
    v32 = 2114;
    v33 = v8;
    v9 = v7;
    LODWORD(v27) = 22;
    v26 = &v30;
    v10 = (void *)_os_log_send_and_compose_impl();

    if (!v10)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, &v30, v27);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v10);
    v26 = (int *)v6;
    SSFileLog();
  }

LABEL_12:
  objc_msgSend(*(id *)&self->_blocksPurchaseRequests, "actionName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("SP")))
  {
    v12 = *(_QWORD *)&self->_blocksPurchaseRequests;
    v29 = 0;
    v13 = -[ISMachineDataActionOperation _provisionWithRequest:error:](self, "_provisionWithRequest:error:", v12, &v29);
    v14 = v29;
LABEL_16:
    v16 = v14;
    goto LABEL_17;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("SM")))
  {
    v15 = *(_QWORD *)&self->_blocksPurchaseRequests;
    v28 = 0;
    v13 = -[ISMachineDataActionOperation _syncMachineWithRequest:error:](self, "_syncMachineWithRequest:error:", v15, &v28);
    v14 = v28;
    goto LABEL_16;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("RP")))
  {
    v13 = -[ISMachineDataActionOperation _eraseProvisioning](self, "_eraseProvisioning");
    v16 = 0;
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedFairPlayAnisetteConfig");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = objc_msgSend(v19, "shouldLog", v26);
  if (objc_msgSend(v19, "shouldLogToDisk"))
    v21 = v20 | 2;
  else
    v21 = v20;
  objc_msgSend(v19, "OSLogObject");
  v22 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    v21 &= 2u;
  if (!v21)
    goto LABEL_32;
  v23 = (void *)objc_opt_class();
  v30 = 138543618;
  v31 = v23;
  v32 = 2114;
  v33 = v11;
  v24 = v23;
  LODWORD(v27) = 22;
  v26 = &v30;
  v25 = (void *)_os_log_send_and_compose_impl();

  if (v25)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v25, 4, &v30, v27);
    v22 = objc_claimAutoreleasedReturnValue();
    free(v25);
    v26 = (int *)v22;
    SSFileLog();
LABEL_32:

  }
  SSError();
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v13 = 0;
LABEL_17:
  -[ISOperation setError:](self, "setError:", v16, v26);
  -[ISOperation setSuccess:](self, "setSuccess:", v13);
  -[ISMachineDataActionOperation resultBlock](self, "resultBlock");
  v17 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    -[ISMachineDataActionOperation syncState](self, "syncState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _BOOL8, id, void *))v17)[2](v17, v13, v16, v18);

    -[ISMachineDataActionOperation setResultBlock:](self, "setResultBlock:", 0);
  }

}

- (id)uniqueKey
{
  if (-[ISMachineDataActionOperation blocksPurchaseRequests](self, "blocksPurchaseRequests"))
    return CFSTR("com.apple.itunesstored.PurchaseOperation");
  else
    return 0;
}

- (BOOL)_eraseProvisioning
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _BYTE v22[22];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)&self->_blocksPurchaseRequests, "protocolVersion") == 1)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedFairPlayAnisetteConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v4 = objc_msgSend(v3, "shouldLog");
    if (objc_msgSend(v3, "shouldLogToDisk"))
      v5 = v4 | 2;
    else
      v5 = v4;
    objc_msgSend(v3, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      v5 &= 2u;
    if (v5)
    {
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = objc_opt_class();
      v7 = *(id *)&v22[4];
      LODWORD(v21) = 12;
      v8 = (void *)_os_log_send_and_compose_impl();

      if (!v8)
      {
LABEL_13:
        v9 = -1;
        goto LABEL_25;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, v22, v21, *(_OWORD *)v22);
      v6 = objc_claimAutoreleasedReturnValue();
      free(v8);
      SSFileLog();
    }

    goto LABEL_13;
  }
  objc_msgSend(*(id *)&self->_blocksPurchaseRequests, "accountIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v10, "unsignedLongLongValue");

  objc_msgSend(MEMORY[0x24BEB1E98], "sharedFairPlayAnisetteConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v12 = v11 | 2;
  else
    v12 = v11;
  objc_msgSend(v3, "OSLogObject");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    v12 &= 2u;
  if (v12)
  {
    v14 = (void *)objc_opt_class();
    v15 = (void *)MEMORY[0x24BDD17C8];
    v16 = v14;
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%llu"), v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    SSHashIfNeeded();
    *(_DWORD *)v22 = 138543618;
    *(_QWORD *)&v22[4] = v14;
    *(_WORD *)&v22[12] = 2114;
    *(_QWORD *)&v22[14] = objc_claimAutoreleasedReturnValue();
    LODWORD(v21) = 22;
    v18 = (void *)_os_log_send_and_compose_impl();

    if (v18)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v18, 4, v22, v21);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      free(v18);
      SSFileLog();

    }
  }
  else
  {

  }
LABEL_25:

  return MEMORY[0x20BD375BC](v9) == 0;
}

- (BOOL)_provisionWithRequest:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;
  id v10;
  uint64_t v11;
  ISMachineDataProvisioningOperation *v12;
  void *v13;
  BOOL v14;
  char v15;
  id v18;

  v5 = a3;
  objc_msgSend(v5, "accountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedLongLongValue");

  objc_msgSend(v5, "actionData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ISMachineDataActionOperation hidesServerDrivenDialogs](self, "hidesServerDrivenDialogs");
  v10 = 0;
  v11 = 5;
  while (1)
  {
    v12 = -[ISMachineDataProvisioningOperation initWithAccountIdentifier:provisioningData:]([ISMachineDataProvisioningOperation alloc], "initWithAccountIdentifier:provisioningData:", v7, v8);
    -[ISMachineDataProvisioningOperation setAllowsBootstrapCellularData:](v12, "setAllowsBootstrapCellularData:", objc_msgSend(v5, "allowsBootstrapCellularData"));
    -[ISMachineDataProvisioningOperation setHidesServerDrivenDialogs:](v12, "setHidesServerDrivenDialogs:", v9);
    -[ISMachineDataProvisioningOperation setProtocolVersion:](v12, "setProtocolVersion:", objc_msgSend(v5, "protocolVersion"));
    -[ISMachineDataActionOperation userAgent](self, "userAgent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISMachineDataProvisioningOperation setUserAgent:](v12, "setUserAgent:", v13);

    v18 = 0;
    v14 = -[ISOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v12, &v18);
    v10 = v18;
    if (v14 || !-[ISMachineDataActionOperation _shouldRetryAfterError:](self, "_shouldRetryAfterError:", v10))
      break;

    if (!--v11)
      goto LABEL_7;
  }

LABEL_7:
  if (a4)
    v15 = v14;
  else
    v15 = 1;
  if ((v15 & 1) == 0)
    *a4 = objc_retainAutorelease(v10);

  return v14;
}

- (BOOL)_shouldRetryAfterError:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD1308]) & 1) != 0)
  {
    v5 = 1;
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEB24A0]))
  {
    v5 = objc_msgSend(v3, "code") == 109;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_syncMachineWithRequest:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;
  id v10;
  uint64_t v11;
  ISMachineDataSyncOperation *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  id resultBlock;
  char v17;
  id v20;

  v5 = a3;
  objc_msgSend(v5, "accountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedLongLongValue");

  objc_msgSend(v5, "actionData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ISMachineDataActionOperation hidesServerDrivenDialogs](self, "hidesServerDrivenDialogs");
  v10 = 0;
  v11 = 5;
  while (1)
  {
    v12 = -[ISMachineDataSyncOperation initWithAccountIdentifier:syncData:]([ISMachineDataSyncOperation alloc], "initWithAccountIdentifier:syncData:", v7, v8);
    -[ISMachineDataSyncOperation setHidesServerDrivenDialogs:](v12, "setHidesServerDrivenDialogs:", v9);
    -[ISMachineDataSyncOperation setProtocolVersion:](v12, "setProtocolVersion:", objc_msgSend(v5, "protocolVersion"));
    -[ISMachineDataActionOperation userAgent](self, "userAgent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISMachineDataSyncOperation setUserAgent:](v12, "setUserAgent:", v13);

    v20 = 0;
    v14 = -[ISOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v12, &v20);
    v10 = v20;
    if (v14)
      break;
    if (!-[ISMachineDataActionOperation _shouldRetryAfterError:](self, "_shouldRetryAfterError:", v10))
      goto LABEL_7;

    if (!--v11)
      goto LABEL_8;
  }
  -[NSLock lock](self->super._lock, "lock");
  -[ISMachineDataSyncOperation syncState](v12, "syncState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  resultBlock = self->_resultBlock;
  self->_resultBlock = v15;

  -[NSLock unlock](self->super._lock, "unlock");
LABEL_7:

LABEL_8:
  if (a4)
    v17 = v14;
  else
    v17 = 1;
  if ((v17 & 1) == 0)
    *a4 = objc_retainAutorelease(v10);

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncState, 0);
  objc_storeStrong(&self->_resultBlock, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_blocksPurchaseRequests, 0);
}

@end
