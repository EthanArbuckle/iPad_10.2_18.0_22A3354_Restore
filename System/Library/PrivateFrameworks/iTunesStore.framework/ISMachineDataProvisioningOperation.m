@implementation ISMachineDataProvisioningOperation

- (ISMachineDataProvisioningOperation)initWithAccountIdentifier:(unint64_t)a3 provisioningData:(id)a4
{
  id v6;
  ISMachineDataProvisioningOperation *v7;
  ISMachineDataProvisioningOperation *v8;
  uint64_t v9;
  NSData *inputData;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ISMachineDataProvisioningOperation;
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
  uint64_t v4;
  int v5;
  uint64_t v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  id v11;
  void *v12;
  int *v13;
  int v14;
  int v15;
  NSObject *v16;
  int v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _BOOL4 v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  id v32;
  void *v33;
  int v34;
  int v35;
  NSObject *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  int v44;
  int v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  int *v51;
  uint64_t v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  id v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v58 = 0;
  v59 = 0;
  accountID = self->_accountID;
  if (-[ISMachineDataProvisioningOperation protocolVersion](self, "protocolVersion") == 1)
    v4 = -1;
  else
    v4 = accountID;
  v5 = SSVAnisetteProvisioningStart();
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedFairPlayAnisetteConfig");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v5)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v15 = v14 | 2;
    else
      v15 = v14;
    objc_msgSend(v7, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      v17 = v15;
    else
      v17 = v15 & 2;
    if (v17)
    {
      v18 = (void *)objc_opt_class();
      v19 = (void *)MEMORY[0x24BDD17C8];
      v20 = v18;
      objc_msgSend(v19, "stringWithFormat:", CFSTR("%llu"), v4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      SSHashIfNeeded();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = 138543874;
      v61 = v18;
      v62 = 2114;
      v63 = v22;
      v64 = 2048;
      v65 = v58;
      LODWORD(v52) = 32;
      v51 = &v60;
      v23 = (void *)_os_log_send_and_compose_impl();

      if (!v23)
        goto LABEL_27;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v23, 4, &v60, v52);
      v16 = objc_claimAutoreleasedReturnValue();
      free(v23);
      v51 = (int *)v16;
      SSFileLog();
    }

LABEL_27:
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", v59, HIDWORD(v58), 0);
    v25 = -[ISMachineDataProvisioningOperation _newFinishProvisioningOperationWithData:](self, "_newFinishProvisioningOperationWithData:", v24);
    v57 = 0;
    v26 = -[ISOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v25, &v57);
    v27 = v57;
    v28 = v27;
    v55 = v25;
    if (v26)
    {
      objc_msgSend(v25, "dataProvider");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "output");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v28;
      v31 = -[ISMachineDataProvisioningOperation _finishProvisioningWithResponse:sessionID:error:](self, "_finishProvisioningWithResponse:sessionID:error:", v30, v58, &v56);
      v32 = v56;

      if (v31)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedFairPlayAnisetteConfig");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v33)
        {
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v34 = objc_msgSend(v33, "shouldLog", v51);
        if (objc_msgSend(v33, "shouldLogToDisk"))
          v35 = v34 | 2;
        else
          v35 = v34;
        objc_msgSend(v33, "OSLogObject");
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          v37 = v35;
        else
          v37 = v35 & 2;
        if (v37)
        {
          v38 = (void *)objc_opt_class();
          v39 = (void *)MEMORY[0x24BDD17C8];
          v53 = v38;
          objc_msgSend(v39, "stringWithFormat:", CFSTR("%llu"), v4);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          SSHashIfNeeded();
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = 138543874;
          v61 = v38;
          v62 = 2114;
          v63 = v41;
          v64 = 2048;
          v65 = v58;
          LODWORD(v52) = 32;
          v51 = &v60;
          v42 = (void *)_os_log_send_and_compose_impl();

          if (!v42)
          {
            v43 = 1;
            v25 = v55;
            goto LABEL_58;
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v42, 4, &v60, v52);
          v36 = objc_claimAutoreleasedReturnValue();
          free(v42);
          v51 = (int *)v36;
          SSFileLog();
        }
        v43 = 1;
        goto LABEL_55;
      }
      v25 = v55;
    }
    else
    {
      v32 = v27;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedFairPlayAnisetteConfig", v51);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v33)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v44 = objc_msgSend(v33, "shouldLog");
    if (objc_msgSend(v33, "shouldLogToDisk"))
      v44 |= 2u;
    objc_msgSend(v33, "OSLogObject");
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      v45 = v44;
    else
      v45 = v44 & 2;
    if (!v45)
    {
      v43 = 0;
      goto LABEL_57;
    }
    v54 = v24;
    v46 = (void *)objc_opt_class();
    v47 = (void *)MEMORY[0x24BDD17C8];
    v48 = v46;
    objc_msgSend(v47, "stringWithFormat:", CFSTR("%llu"), v4);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    SSHashIfNeeded();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 138544130;
    v61 = v46;
    v62 = 2114;
    v63 = v50;
    v64 = 2048;
    v65 = v58;
    v66 = 2114;
    v67 = v32;
    LODWORD(v52) = 42;
    v51 = &v60;
    v43 = _os_log_send_and_compose_impl();

    if (!v43)
    {
      v24 = v54;
      v25 = v55;
      goto LABEL_58;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v43, 4, &v60, v52);
    v36 = objc_claimAutoreleasedReturnValue();
    free((void *)v43);
    v51 = (int *)v36;
    SSFileLog();
    v43 = 0;
    v24 = v54;
LABEL_55:
    v25 = v55;
LABEL_57:

LABEL_58:
    goto LABEL_59;
  }
  if (!v6)
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
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    v9 &= 2u;
  if (v9)
  {
    v60 = 138543618;
    v61 = (id)objc_opt_class();
    v62 = 2048;
    v63 = (void *)v5;
    v11 = v61;
    LODWORD(v52) = 22;
    v51 = &v60;
    v12 = (void *)_os_log_send_and_compose_impl();

    if (v12)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v12, 4, &v60, v52);
      v13 = (int *)objc_claimAutoreleasedReturnValue();
      free(v12);
      v51 = v13;
      SSFileLog();

    }
  }
  else
  {

  }
  SSError();
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v43 = 0;
LABEL_59:
  if (v59)
    MEMORY[0x20BD375E0]();
  if ((_DWORD)v58)
    MEMORY[0x20BD375C8]();
  -[ISOperation setError:](self, "setError:", v32, v51);
  -[ISOperation setSuccess:](self, "setSuccess:", v43);

}

- (BOOL)_finishProvisioningWithResponse:(id)a3 sessionID:(unsigned int)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  int v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  NSObject *v24;
  id v25;
  int v26;
  int v27;
  void *v28;
  void *v29;
  void *v31;
  int v32;
  int v33;
  NSObject *v34;
  id v35;
  void *v36;
  int v37;
  int v38;
  NSObject *v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  int v45;
  id v46;
  __int16 v47;
  unint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend(v7, "objectForKey:", CFSTR("transportKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("keybag"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("settingInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedFairPlayAnisetteConfig");
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
    if (!v23)
      goto LABEL_36;
    v45 = 138543618;
    v46 = (id)objc_opt_class();
    v47 = 2114;
    v48 = (unint64_t)v10;
    v25 = v46;
    LODWORD(v42) = 22;
    goto LABEL_34;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedFairPlayAnisetteConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v26 = objc_msgSend(v21, "shouldLog");
    if (objc_msgSend(v21, "shouldLogToDisk"))
      v27 = v26 | 2;
    else
      v27 = v26;
    objc_msgSend(v21, "OSLogObject");
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      v27 &= 2u;
    if (!v27)
      goto LABEL_36;
    v45 = 138543618;
    v46 = (id)objc_opt_class();
    v47 = 2114;
    v48 = (unint64_t)v8;
    v25 = v46;
    LODWORD(v42) = 22;
LABEL_34:
    v28 = (void *)_os_log_send_and_compose_impl();

    if (!v28)
    {
LABEL_37:

      v29 = 0;
      goto LABEL_38;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v28, 4, &v45, v42);
    v24 = objc_claimAutoreleasedReturnValue();
    free(v28);
    SSFileLog();
LABEL_36:

    goto LABEL_37;
  }
  if (objc_msgSend(v9, "length") && (SSVFairPlayImportKeybagData() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedFairPlayAnisetteConfig");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v31)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v32 = objc_msgSend(v31, "shouldLog");
    if (objc_msgSend(v31, "shouldLogToDisk"))
      v33 = v32 | 2;
    else
      v33 = v32;
    objc_msgSend(v31, "OSLogObject");
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      v33 &= 2u;
    if (v33)
    {
      v45 = 138543362;
      v46 = (id)objc_opt_class();
      v35 = v46;
      LODWORD(v42) = 12;
      v36 = (void *)_os_log_send_and_compose_impl();

      if (!v36)
      {
LABEL_53:

        SSError();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_38:
        v13 = 0;
        if (!a5)
          goto LABEL_41;
        goto LABEL_39;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v36, 4, &v45, v42);
      v34 = objc_claimAutoreleasedReturnValue();
      free(v36);
      SSFileLog();
    }

    goto LABEL_53;
  }
  v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v10, 0);
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v8, 0);
  v44 = (void *)v11;
  v12 = SSVAnisetteProvisioningEnd();
  v13 = v12 == 0;
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedFairPlayAnisetteConfig");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (!v12)
  {
    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v37 = objc_msgSend(v15, "shouldLog");
    if (objc_msgSend(v15, "shouldLogToDisk"))
      v38 = v37 | 2;
    else
      v38 = v37;
    objc_msgSend(v15, "OSLogObject");
    v39 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      v38 &= 2u;
    if (v38)
    {
      v45 = 138543618;
      v46 = (id)objc_opt_class();
      v47 = 2048;
      v48 = a4;
      v40 = v46;
      LODWORD(v42) = 22;
      v41 = (void *)_os_log_send_and_compose_impl();

      if (!v41)
      {
LABEL_65:

        v29 = 0;
        goto LABEL_68;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v41, 4, &v45, v42);
      v39 = objc_claimAutoreleasedReturnValue();
      free(v41);
      SSFileLog();
    }

    goto LABEL_65;
  }
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = objc_msgSend(v15, "shouldLog");
  if (objc_msgSend(v15, "shouldLogToDisk"))
    v16 |= 2u;
  objc_msgSend(v15, "OSLogObject");
  v17 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    v16 &= 2u;
  if (v16)
  {
    v45 = 138543618;
    v46 = (id)objc_opt_class();
    v47 = 2048;
    v48 = v12;
    v18 = v46;
    LODWORD(v42) = 22;
    v19 = (void *)_os_log_send_and_compose_impl();

    if (v19)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v19, 4, &v45, v42);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      free(v19);
      SSFileLog();

    }
  }
  else
  {

  }
  SSError();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_68:

  if (!a5)
    goto LABEL_41;
LABEL_39:
  if (!v13)
    *a5 = objc_retainAutorelease(v29);
LABEL_41:

  return v13;
}

- (id)_newFinishProvisioningOperationWithData:(id)a3
{
  id v4;
  ISStoreURLOperation *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  BOOL v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  int64_t v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a3;
  v5 = objc_alloc_init(ISStoreURLOperation);
  -[ISStoreURLOperation setShouldSendXTokenHeader:](v5, "setShouldSendXTokenHeader:", 1);
  -[ISStoreURLOperation setUseUserSpecificURLBag:](v5, "setUseUserSpecificURLBag:", 1);
  v6 = -[ISMachineDataProvisioningOperation hidesServerDrivenDialogs](self, "hidesServerDrivenDialogs");
  -[ISMachineDataProvisioningOperation userAgent](self, "userAgent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ISDataProvider provider](ISProtocolDataProvider, "provider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = !v6;
  objc_msgSend(v8, "setShouldProcessAuthenticationDialogs:", !v6);
  objc_msgSend(v8, "setShouldProcessDialogs:", !v6);
  -[ISURLOperation setDataProvider:](v5, "setDataProvider:", v8);
  v10 = objc_alloc(MEMORY[0x24BEB1F28]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_accountID);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithAccountIdentifier:", v11);

  if (!v9)
  {
    objc_msgSend(v12, "setPromptStyle:", 1000);
    objc_msgSend(v12, "setShouldSuppressDialogs:", 1);
  }
  objc_msgSend(v12, "setAllowsBootstrapCellularData:", -[ISMachineDataProvisioningOperation allowsBootstrapCellularData](self, "allowsBootstrapCellularData"));
  v13 = *MEMORY[0x24BEB2518];
  objc_msgSend(v12, "setValue:forHTTPHeaderField:", v7, *MEMORY[0x24BEB2518]);
  -[ISURLOperation setAuthenticationContext:](v5, "setAuthenticationContext:", v12);
  v14 = objc_alloc_init(MEMORY[0x24BEB1F30]);
  objc_msgSend(v14, "setAllowedRetryCount:", 0);
  objc_msgSend(v14, "setAllowsBootstrapCellularData:", -[ISMachineDataProvisioningOperation allowsBootstrapCellularData](self, "allowsBootstrapCellularData"));
  objc_msgSend(v14, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v14, "setValue:forHTTPHeaderField:", CFSTR("application/x-apple-plist"), CFSTR("Content-Type"));
  objc_msgSend(v14, "setValue:forHTTPHeaderField:", v7, v13);
  v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setObject:forKey:", v16, CFSTR("clientData"));
  +[ISDevice sharedInstance](ISDevice, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "guid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    objc_msgSend(v15, "setObject:forKey:", v18, CFSTR("guid"));
  v19 = -[ISMachineDataProvisioningOperation protocolVersion](self, "protocolVersion");
  if (v19 == 1)
  {
    objc_msgSend(v14, "setURLBagKey:", CFSTR("amd-finish-provisioning"));
  }
  else if (!v19)
  {
    v20 = (void *)SSVFairPlayCopyKeyBagSyncData();
    if (v20)
      objc_msgSend(v15, "setObject:forKey:", v20, CFSTR("kbsync"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_accountID);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v21, CFSTR("dsId"));

    objc_msgSend(v14, "setURLBagKey:", CFSTR("md-finish-provisioning"));
  }
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v15, 100, 0, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHTTPBody:", v22);

  -[ISURLOperation setRequestProperties:](v5, "setRequestProperties:", v14);
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_inputData, 0);
}

@end
