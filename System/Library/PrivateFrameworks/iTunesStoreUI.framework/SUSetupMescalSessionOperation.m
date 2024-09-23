@implementation SUSetupMescalSessionOperation

- (SUSetupMescalSessionOperation)initWithURLRequestProperties:(id)a3
{
  SUSetupMescalSessionOperation *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUSetupMescalSessionOperation;
  v4 = -[SUSetupMescalSessionOperation init](&v6, sel_init);
  if (v4)
    v4->_requestProperties = (SSURLRequestProperties *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUSetupMescalSessionOperation;
  -[SUSetupMescalSessionOperation dealloc](&v3, sel_dealloc);
}

- (SUMescalSession)mescalSession
{
  SUMescalSession *v3;

  -[SUSetupMescalSessionOperation lock](self, "lock");
  v3 = self->_session;
  -[SUSetupMescalSessionOperation unlock](self, "unlock");
  return v3;
}

- (void)run
{
  SUMescalSession *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  int *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v24 = 0;
  if (-[SUSetupMescalSessionOperation _isMescalEnabled](self, "_isMescalEnabled"))
  {
    v3 = objc_alloc_init(SUMescalSession);
    v4 = -[SUSetupMescalSessionOperation _setupSAPCertificate:](self, "_setupSAPCertificate:", &v24);
    if (!v4)
      goto LABEL_8;
    v5 = -[SUMescalSession exchangeData:error:](v3, "exchangeData:error:", v4, &v24);
    if (v5)
    {
      -[SUMescalSession exchangeData:error:](v3, "exchangeData:error:", -[SUSetupMescalSessionOperation _setupSAPWithData:error:](self, "_setupSAPWithData:error:", v5, &v24), &v24);
    }
    else
    {
      v15 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v16 = objc_msgSend(v15, "shouldLog");
      if (objc_msgSend(v15, "shouldLogToDisk"))
        v17 = v16 | 2;
      else
        v17 = v16;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v15, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
        v17 &= 2u;
      if (v17)
      {
        v18 = objc_opt_class();
        v25 = 138412546;
        v26 = v18;
        v27 = 2112;
        v28 = v24;
        LODWORD(v23) = 22;
        v22 = &v25;
        v19 = _os_log_send_and_compose_impl();
        if (v19)
        {
          v20 = (void *)v19;
          v21 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v19, 4, &v25, v23);
          free(v20);
          v22 = (int *)v21;
          SSFileLog();
        }
      }
    }
    if (-[SUMescalSession isComplete](v3, "isComplete", v22))
    {
      -[SUSetupMescalSessionOperation lock](self, "lock");

      self->_session = v3;
      -[SUSetupMescalSessionOperation unlock](self, "unlock");
      v6 = 1;
    }
    else
    {
LABEL_8:
      v8 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v9 = objc_msgSend(v8, "shouldLog");
      if (objc_msgSend(v8, "shouldLogToDisk"))
        v10 = v9 | 2;
      else
        v10 = v9;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v8, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
        v10 &= 2u;
      if (v10)
      {
        v11 = objc_opt_class();
        v25 = 138412546;
        v26 = v11;
        v27 = 2112;
        v28 = v24;
        LODWORD(v23) = 22;
        v22 = &v25;
        v12 = _os_log_send_and_compose_impl();
        if (v12)
        {
          v13 = (void *)v12;
          v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v12, 4, &v25, v23);
          free(v13);
          v22 = (int *)v14;
          SSFileLog();
        }
      }
      v6 = 0;
    }

    v7 = v24;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  -[SUSetupMescalSessionOperation setError:](self, "setError:", v7, v22);
  -[SUSetupMescalSessionOperation setSuccess:](self, "setSuccess:", v6);
}

- (BOOL)_isMescalEnabled
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  int v18;
  uint64_t v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  uint64_t v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", -[SSURLRequestProperties URLBagType](self->_requestProperties, "URLBagType"));
  if (self->_requestProperties)
  {
    v4 = v3;
    v5 = -[SUSetupMescalSessionOperation loadURLBagWithContext:returningError:](self, "loadURLBagWithContext:returningError:", v3, 0);
    if (v5)
    {
      v6 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8C48], "sharedCache"), "URLBagForContext:", v4);
      v7 = (void *)-[SSURLRequestProperties URL](self->_requestProperties, "URL");
      if (!v7)
      {
        v8 = -[SSURLRequestProperties URLBagURLBlock](self->_requestProperties, "URLBagURLBlock");
        if (v8)
        {
          v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 16))(v8, v4);
        }
        else
        {
          v10 = -[SSURLRequestProperties URLBagKey](self->_requestProperties, "URLBagKey");
          if (!v10)
            goto LABEL_21;
          v9 = objc_msgSend(v6, "urlForKey:", v10);
        }
        v7 = (void *)v9;
        if (!v9)
          goto LABEL_21;
      }
      v11 = objc_msgSend(v6, "valueForKey:", CFSTR("account-flow-url-patterns"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", v11, 1, 0);
        if (v12)
        {
          v13 = (void *)v12;
          v14 = (void *)objc_msgSend(v7, "absoluteString");
          v15 = objc_msgSend(v13, "rangeOfFirstMatchInString:options:range:", v14, 0, 0, objc_msgSend(v14, "length"));

          if (v15 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v22 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
            v23 = objc_msgSend(v22, "shouldLog");
            if (objc_msgSend(v22, "shouldLogToDisk"))
              v24 = v23 | 2;
            else
              v24 = v23;
            if (!os_log_type_enabled((os_log_t)objc_msgSend(v22, "OSLogObject"), OS_LOG_TYPE_DEBUG))
              v24 &= 2u;
            if (!v24)
            {
              v20 = 1;
              goto LABEL_22;
            }
            v27 = 138412546;
            v28 = objc_opt_class();
            v29 = 2112;
            v30 = v7;
            LODWORD(v26) = 22;
            v19 = _os_log_send_and_compose_impl();
            v20 = 1;
            if (!v19)
              goto LABEL_22;
            goto LABEL_20;
          }
        }
      }
      v16 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v17 = objc_msgSend(v16, "shouldLog");
      if (objc_msgSend(v16, "shouldLogToDisk"))
        v18 = v17 | 2;
      else
        v18 = v17;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v16, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
        v18 &= 2u;
      if (v18)
      {
        v27 = 138412546;
        v28 = objc_opt_class();
        v29 = 2112;
        v30 = v7;
        LODWORD(v26) = 22;
        v19 = _os_log_send_and_compose_impl();
        v20 = 0;
        if (!v19)
        {
LABEL_22:
          LOBYTE(v5) = v20 != 0;
          return v5;
        }
LABEL_20:
        v21 = (void *)v19;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v19, 4, &v27, v26);
        free(v21);
        SSFileLog();
        goto LABEL_22;
      }
LABEL_21:
      v20 = 0;
      goto LABEL_22;
    }
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (id)_setupSAPCertificate:(id *)a3
{
  id v5;
  id v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int *v21;
  uint64_t v22;
  void *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v23 = 0;
  v5 = objc_alloc_init(MEMORY[0x24BEC8C30]);
  objc_msgSend(v5, "setDataProvider:", objc_msgSend(MEMORY[0x24BEC8C08], "provider"));
  v6 = objc_alloc_init(MEMORY[0x24BEB1F30]);
  objc_msgSend(v6, "setAllowedRetryCount:", 0);
  objc_msgSend(v6, "setURLBagKey:", CFSTR("sign-sap-setup-cert"));
  objc_msgSend(v5, "setRequestProperties:", v6);

  v7 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v8 = objc_msgSend(v7, "shouldLog");
  if (objc_msgSend(v7, "shouldLogToDisk"))
    v9 = v8 | 2;
  else
    v9 = v8;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_DEBUG))
    v9 &= 2u;
  if (v9)
  {
    v24 = 138412290;
    v25 = objc_opt_class();
    LODWORD(v22) = 12;
    v21 = &v24;
    v10 = _os_log_send_and_compose_impl();
    if (v10)
    {
      v11 = (void *)v10;
      v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, &v24, v22);
      free(v11);
      v21 = (int *)v12;
      SSFileLog();
    }
  }
  if (-[SUSetupMescalSessionOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v5, &v23, v21))
  {
    v13 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "dataProvider"), "output"), "objectForKey:", CFSTR("sign-sap-setup-cert"));
    if (!v13)
    {
      v14 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v15 = objc_msgSend(v14, "shouldLog");
      if (objc_msgSend(v14, "shouldLogToDisk"))
        v16 = v15 | 2;
      else
        v16 = v15;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v14, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
        v16 &= 2u;
      if (v16)
      {
        v17 = objc_opt_class();
        v24 = 138412290;
        v25 = v17;
        LODWORD(v22) = 12;
        v18 = _os_log_send_and_compose_impl();
        if (v18)
        {
          v19 = (void *)v18;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v18, 4, &v24, v22);
          free(v19);
          SSFileLog();
        }
      }
      v13 = 0;
      v23 = (void *)SSError();
    }
  }
  else
  {
    v13 = 0;
  }

  if (a3 && !v13)
    *a3 = v23;
  return v13;
}

- (id)_setupSAPWithData:(id)a3 error:(id *)a4
{
  id v7;
  id v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int *v23;
  uint64_t v24;
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v25 = 0;
  v7 = objc_alloc_init(MEMORY[0x24BEC8C30]);
  objc_msgSend(v7, "setDataProvider:", objc_msgSend(MEMORY[0x24BEC8C08], "provider"));
  v8 = objc_alloc_init(MEMORY[0x24BEB1F30]);
  objc_msgSend(v8, "setAllowedRetryCount:", 0);
  objc_msgSend(v8, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v8, "setURLBagKey:", CFSTR("sign-sap-setup"));
  objc_msgSend(v8, "setValue:forRequestParameter:", a3, CFSTR("sign-sap-setup-buffer"));
  objc_msgSend(v7, "setRequestProperties:", v8);

  v9 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v10 = objc_msgSend(v9, "shouldLog");
  if (objc_msgSend(v9, "shouldLogToDisk"))
    v11 = v10 | 2;
  else
    v11 = v10;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v9, "OSLogObject"), OS_LOG_TYPE_DEBUG))
    v11 &= 2u;
  if (v11)
  {
    v26 = 138412290;
    v27 = objc_opt_class();
    LODWORD(v24) = 12;
    v23 = &v26;
    v12 = _os_log_send_and_compose_impl();
    if (v12)
    {
      v13 = (void *)v12;
      v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v12, 4, &v26, v24);
      free(v13);
      v23 = (int *)v14;
      SSFileLog();
    }
  }
  if (-[SUSetupMescalSessionOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v7, &v25, v23))
  {
    v15 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "dataProvider"), "output"), "objectForKey:", CFSTR("sign-sap-setup-buffer"));
    if (!v15)
    {
      v16 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v17 = objc_msgSend(v16, "shouldLog");
      if (objc_msgSend(v16, "shouldLogToDisk"))
        v18 = v17 | 2;
      else
        v18 = v17;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v16, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
        v18 &= 2u;
      if (v18)
      {
        v19 = objc_opt_class();
        v26 = 138412290;
        v27 = v19;
        LODWORD(v24) = 12;
        v20 = _os_log_send_and_compose_impl();
        if (v20)
        {
          v21 = (void *)v20;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v20, 4, &v26, v24);
          free(v21);
          SSFileLog();
        }
      }
      v15 = 0;
      v25 = (void *)SSError();
    }
  }
  else
  {
    v15 = 0;
  }

  if (a4 && !v15)
    *a4 = v25;
  return v15;
}

@end
