@implementation ISMachineDataSyncOperation

- (ISMachineDataSyncOperation)initWithAccountIdentifier:(unint64_t)a3 syncData:(id)a4
{
  id v6;
  ISMachineDataSyncOperation *v7;
  ISMachineDataSyncOperation *v8;
  uint64_t v9;
  NSData *inputData;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ISMachineDataSyncOperation;
  v7 = -[ISOperation init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_accountID = a3;
    v9 = objc_msgSend(v6, "copy");
    inputData = v8->_inputData;
    v8->_inputData = (NSData *)v9;

  }
  return v8;
}

- (BOOL)allowsBootstrapCellularData
{
  BOOL allowsBootstrapCellularData;

  -[ISOperation lock](self, "lock");
  allowsBootstrapCellularData = self->_allowsBootstrapCellularData;
  -[ISOperation unlock](self, "unlock");
  return allowsBootstrapCellularData;
}

- (BOOL)hidesServerDrivenDialogs
{
  BOOL hidesServerDrivenDialogs;

  -[ISOperation lock](self, "lock");
  hidesServerDrivenDialogs = self->_hidesServerDrivenDialogs;
  -[ISOperation unlock](self, "unlock");
  return hidesServerDrivenDialogs;
}

- (int64_t)protocolVersion
{
  int64_t protocolVersion;

  -[ISOperation lock](self, "lock");
  protocolVersion = self->_protocolVersion;
  -[ISOperation unlock](self, "unlock");
  return protocolVersion;
}

- (void)setAllowsBootstrapCellularData:(BOOL)a3
{
  -[ISOperation lock](self, "lock");
  self->_allowsBootstrapCellularData = a3;
  -[ISOperation unlock](self, "unlock");
}

- (void)setHidesServerDrivenDialogs:(BOOL)a3
{
  -[ISOperation lock](self, "lock");
  self->_hidesServerDrivenDialogs = a3;
  -[ISOperation unlock](self, "unlock");
}

- (void)setProtocolVersion:(int64_t)a3
{
  -[ISOperation lock](self, "lock");
  self->_protocolVersion = a3;
  -[ISOperation unlock](self, "unlock");
}

- (void)setUserAgent:(id)a3
{
  NSString *v4;
  NSString *userAgent;
  NSString *v6;

  v6 = (NSString *)a3;
  -[ISOperation lock](self, "lock");
  if (self->_userAgent != v6)
  {
    v4 = (NSString *)-[NSString copy](v6, "copy");
    userAgent = self->_userAgent;
    self->_userAgent = v4;

  }
  -[ISOperation unlock](self, "unlock");

}

- (NSString)syncState
{
  NSString *v3;

  -[NSLock lock](self->super._lock, "lock");
  v3 = self->_syncState;
  -[NSLock unlock](self->super._lock, "unlock");
  return v3;
}

- (NSString)userAgent
{
  NSString *v3;

  -[ISOperation lock](self, "lock");
  v3 = self->_userAgent;
  -[ISOperation unlock](self, "unlock");
  return v3;
}

- (void)run
{
  unint64_t accountID;
  int v4;
  uint64_t v5;
  void *v6;
  int v7;
  NSObject *v8;
  int v9;
  id v10;
  void *v11;
  int *v12;
  int v13;
  int v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _BOOL8 v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  NSString *v26;
  NSString *syncState;
  int *v28;
  uint64_t v29;
  id v30;
  unsigned int v31;
  uint64_t v32;
  unsigned int v33;
  uint64_t v34;
  int v35;
  id v36;
  __int16 v37;
  unint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v34 = 0;
  v33 = 0;
  v32 = 0;
  v31 = 0;
  if (self->_protocolVersion == 1)
    accountID = -1;
  else
    accountID = self->_accountID;
  v4 = SSVAnisetteSynchronize();
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedDaemonConfig");
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
      v7 |= 2u;
    objc_msgSend(v6, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      v9 = v7;
    else
      v9 = v7 & 2;
    if (v9)
    {
      v35 = 138412546;
      v36 = (id)objc_opt_class();
      v37 = 2048;
      v38 = v4;
      v10 = v36;
      LODWORD(v29) = 22;
      v28 = &v35;
      v11 = (void *)_os_log_send_and_compose_impl();

      if (v11)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v11, 4, &v35, v29);
        v12 = (int *)objc_claimAutoreleasedReturnValue();
        free(v11);
        v28 = v12;
        SSFileLog();

      }
    }
    else
    {

    }
    SSError();
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    goto LABEL_35;
  }
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = objc_msgSend(v6, "shouldLog");
  if (objc_msgSend(v6, "shouldLogToDisk"))
    v14 = v13 | 2;
  else
    v14 = v13;
  objc_msgSend(v6, "OSLogObject");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    v14 &= 2u;
  if (!v14)
    goto LABEL_25;
  v35 = 138412546;
  v36 = (id)objc_opt_class();
  v37 = 2048;
  v38 = accountID;
  v16 = v36;
  LODWORD(v29) = 22;
  v28 = &v35;
  v17 = (void *)_os_log_send_and_compose_impl();

  if (v17)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v17, 4, &v35, v29);
    v15 = objc_claimAutoreleasedReturnValue();
    free(v17);
    v28 = (int *)v15;
    SSFileLog();
LABEL_25:

  }
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", v32, v31, 0);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", v34, v33, 0);
  v20 = -[ISMachineDataSyncOperation _newSyncOperationWithClientData:machineIDData:](self, "_newSyncOperationWithClientData:machineIDData:", v18, v19);
  v30 = 0;
  v21 = -[ISOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v20, &v30);
  v22 = v30;
  if (v21)
  {
    objc_msgSend(v20, "dataProvider");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "output");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v24, "objectForKey:", CFSTR("syncState"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[NSLock lock](self->super._lock, "lock");
        v26 = (NSString *)objc_msgSend(v25, "copy");
        syncState = self->_syncState;
        self->_syncState = v26;

        -[NSLock unlock](self->super._lock, "unlock");
      }

    }
  }

LABEL_35:
  if (v34)
    MEMORY[0x20BD375E0]();
  if (v32)
    MEMORY[0x20BD375E0]();
  -[ISOperation setError:](self, "setError:", v22, v28);
  -[ISOperation setSuccess:](self, "setSuccess:", v21);

}

- (id)_newSyncOperationWithClientData:(id)a3 machineIDData:(id)a4
{
  id v6;
  id v7;
  ISStoreURLOperation *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  int64_t v20;
  void *v21;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(ISStoreURLOperation);
  -[ISStoreURLOperation setUseUserSpecificURLBag:](v8, "setUseUserSpecificURLBag:", 1);
  v9 = -[ISMachineDataSyncOperation hidesServerDrivenDialogs](self, "hidesServerDrivenDialogs");
  -[ISMachineDataSyncOperation userAgent](self, "userAgent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[ISDataProvider provider](ISProtocolDataProvider, "provider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = !v9;
  objc_msgSend(v11, "setShouldProcessAuthenticationDialogs:", !v9);
  objc_msgSend(v11, "setShouldProcessDialogs:", !v9);
  -[ISURLOperation setDataProvider:](v8, "setDataProvider:", v11);
  v13 = objc_alloc(MEMORY[0x24BEB1F28]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_accountID);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithAccountIdentifier:", v14);

  if (!v12)
  {
    objc_msgSend(v15, "setPromptStyle:", 1000);
    objc_msgSend(v15, "setShouldSuppressDialogs:", 1);
  }
  objc_msgSend(v15, "setAllowsBootstrapCellularData:", -[ISMachineDataSyncOperation allowsBootstrapCellularData](self, "allowsBootstrapCellularData"));
  v16 = *MEMORY[0x24BEB2518];
  objc_msgSend(v15, "setValue:forHTTPHeaderField:", v10, *MEMORY[0x24BEB2518]);
  -[ISURLOperation setAuthenticationContext:](v8, "setAuthenticationContext:", v15);
  v17 = objc_alloc_init(MEMORY[0x24BEB1F30]);
  objc_msgSend(v17, "setAllowedRetryCount:", 0);
  objc_msgSend(v17, "setAllowsBootstrapCellularData:", -[ISMachineDataSyncOperation allowsBootstrapCellularData](self, "allowsBootstrapCellularData"));
  objc_msgSend(v17, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v17, "setValue:forHTTPHeaderField:", CFSTR("application/x-apple-plist"), CFSTR("Content-Type"));
  objc_msgSend(v17, "setValue:forHTTPHeaderField:", v10, v16);
  objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setValue:forRequestParameter:", v18, CFSTR("clientData"));
  objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setValue:forRequestParameter:", v19, CFSTR("machineId"));
  v20 = -[ISMachineDataSyncOperation protocolVersion](self, "protocolVersion");
  if (v20 == 1)
  {
    objc_msgSend(v17, "setURLBagKey:", CFSTR("amd-sync-machine"));
  }
  else if (!v20)
  {
    objc_msgSend(v17, "setURLBagKey:", CFSTR("md-sync-machine"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_accountID);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setValue:forRequestParameter:", v21, CFSTR("dsId"));

  }
  -[ISURLOperation setRequestProperties:](v8, "setRequestProperties:", v17);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_syncState, 0);
  objc_storeStrong((id *)&self->_inputData, 0);
}

@end
