@implementation ISLogoutOperation

- (ISLogoutOperation)initWithAccount:(id)a3 logKey:(id)a4
{
  id v7;
  id v8;
  ISLogoutOperation *v9;
  ISLogoutOperation *v10;
  void **p_logKey;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ISLogoutOperation;
  v9 = -[ISOperation init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    p_logKey = (void **)&v10->_logKey;
    objc_storeStrong((id *)&v10->_logKey, a4);
    if (!v10->_logKey)
    {
      SSGenerateLogCorrelationString();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *p_logKey;
      *p_logKey = (void *)v12;

    }
  }

  return v10;
}

- (void)run
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsLogoutConfig");
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
  if (!v5)
    goto LABEL_11;
  v7 = (void *)objc_opt_class();
  v8 = v7;
  -[ISLogoutOperation logKey](self, "logKey");
  v11 = 138543618;
  v12 = v7;
  v13 = 2114;
  v14 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = 22;
  v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, &v11, v10);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v9);
    SSFileLog();
LABEL_11:

  }
  -[ISLogoutOperation _disableAutomaticDownloadKinds](self, "_disableAutomaticDownloadKinds");
  -[ISLogoutOperation _disableBookkeeper](self, "_disableBookkeeper");
  -[ISLogoutOperation _sendLogoutRequest](self, "_sendLogoutRequest");
  -[ISOperation setSuccess:](self, "setSuccess:", 1);
}

- (id)_copyAuthenticationContext
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BEB1F28]);
  -[ISLogoutOperation account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithAccount:", v4);

  objc_msgSend(v5, "setPromptStyle:", 1000);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

- (id)_createDisableBookkeeperRequestPropertiesWithURL:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x24BEB1F30];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v5, "setURL:", v4);

  objc_msgSend(v5, "setValue:forHTTPHeaderField:", CFSTR("application/x-apple-plist"), CFSTR("Content-Type"));
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  +[ISDevice sharedInstance](ISDevice, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "guid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("guid"));
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("0"), CFSTR("bookkeeperDomain:com.apple.upp"), 0);
  objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("put-parameters"));
  objc_msgSend(v6, "setObject:forKey:", CFSTR("mzbookkeeper"), CFSTR("notification-type"));
  objc_msgSend(v5, "setRequestParameters:", v6);

  return v5;
}

- (id)_createLogoutRequestProperties
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x24BEB1F30]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  +[ISDevice sharedInstance](ISDevice, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "guid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("guid"));
  -[ISLogoutOperation _sbsyncData](self, "_sbsyncData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("sbsync"));
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v4, 100, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHTTPBody:", v8);
    objc_msgSend(v3, "setHTTPMethod:", CFSTR("POST"));
    objc_msgSend(v3, "setValue:forHTTPHeaderField:", CFSTR("application/x-apple-plist"), CFSTR("Content-Type"));

  }
  objc_msgSend(v3, "setURLBagKey:", CFSTR("logout"));

  return v3;
}

- (void)_disableAutomaticDownloadKinds
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  int *v21;
  uint64_t v22;
  _QWORD v23[5];
  int v24;
  const char *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedStoreServicesConfig");
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
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      v7 = v5;
    else
      v7 = v5 & 2;
    if (v7)
    {
      v24 = 136446210;
      v25 = "-[ISLogoutOperation _disableAutomaticDownloadKinds]";
      LODWORD(v22) = 12;
      v21 = &v24;
      v8 = (void *)_os_log_send_and_compose_impl();

      if (!v8)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, &v24, v22);
      v6 = objc_claimAutoreleasedReturnValue();
      free(v8);
      v21 = (int *)v6;
      SSFileLog();
    }

    goto LABEL_15;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsLogoutConfig", v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = objc_msgSend(v9, "shouldLog");
  if (objc_msgSend(v9, "shouldLogToDisk"))
    v11 = v10 | 2;
  else
    v11 = v10;
  objc_msgSend(v9, "OSLogObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    v11 &= 2u;
  if (!v11)
    goto LABEL_26;
  v13 = (void *)objc_opt_class();
  v14 = v13;
  -[ISLogoutOperation logKey](self, "logKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 138543618;
  v25 = (const char *)v13;
  v26 = 2114;
  v27 = v15;
  LODWORD(v22) = 22;
  v16 = (void *)_os_log_send_and_compose_impl();

  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v16, 4, &v24, v22);
    v12 = objc_claimAutoreleasedReturnValue();
    free(v16);
    SSFileLog();
LABEL_26:

  }
  v17 = (void *)SSXPCCreateMessageDictionary();
  v18 = -[ISLogoutOperation _copyAuthenticationContext](self, "_copyAuthenticationContext");
  SSXPCDictionarySetCFObject();

  v19 = objc_alloc(MEMORY[0x24BEB20D8]);
  v20 = (void *)objc_msgSend(v19, "initWithServiceName:", *MEMORY[0x24BEB2C28]);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __51__ISLogoutOperation__disableAutomaticDownloadKinds__block_invoke;
  v23[3] = &unk_24C43D010;
  v23[4] = self;
  objc_msgSend(v20, "sendMessage:withReply:", v17, v23);

}

void __51__ISLogoutOperation__disableAutomaticDownloadKinds__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  _BYTE v23[24];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3 != (id)MEMORY[0x24BDACF30] && v3 && MEMORY[0x20BD37E20](v3) == MEMORY[0x24BDACFA0])
  {
    v20 = objc_alloc(MEMORY[0x24BDD1540]);
    xpc_dictionary_get_value(v4, "0");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v20, "initWithXPCEncoding:", v21);

  }
  else
  {
    SSError();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsLogoutConfig");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
  {
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
    if (!v9)
      goto LABEL_26;
    v11 = (void *)objc_opt_class();
    v12 = *(void **)(a1 + 32);
    v13 = v11;
    objc_msgSend(v12, "logKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v23 = 138543874;
    *(_QWORD *)&v23[4] = v11;
    *(_WORD *)&v23[12] = 2114;
    *(_QWORD *)&v23[14] = v14;
    *(_WORD *)&v23[22] = 2114;
    v24 = v5;
    LODWORD(v22) = 32;
  }
  else
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v16 = v15 | 2;
    else
      v16 = v15;
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      v16 &= 2u;
    if (!v16)
      goto LABEL_26;
    v17 = (void *)objc_opt_class();
    v18 = *(void **)(a1 + 32);
    v13 = v17;
    objc_msgSend(v18, "logKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v23 = 138543618;
    *(_QWORD *)&v23[4] = v17;
    *(_WORD *)&v23[12] = 2114;
    *(_QWORD *)&v23[14] = v14;
    LODWORD(v22) = 22;
  }
  v19 = (void *)_os_log_send_and_compose_impl();

  if (v19)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v19, 4, v23, v22, *(_OWORD *)v23, *(_QWORD *)&v23[16]);
    v10 = objc_claimAutoreleasedReturnValue();
    free(v19);
    SSFileLog();
LABEL_26:

  }
}

- (void)_disableBookkeeper
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  ISStoreURLOperation *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  int v25;
  NSObject *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  int v32;
  int v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  int v39;
  int v40;
  int v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  int v46;
  int v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  int *v52;
  uint64_t v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  int v60;
  void *v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  NSObject *v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsLogoutConfig");
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
    v7 = (void *)objc_opt_class();
    v8 = v7;
    -[ISLogoutOperation logKey](self, "logKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 138543618;
    v61 = v7;
    v62 = 2114;
    v63 = (uint64_t)v9;
    LODWORD(v53) = 22;
    v52 = &v60;
    v10 = (void *)_os_log_send_and_compose_impl();

    if (!v10)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, &v60, v53);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v10);
    v52 = (int *)v6;
    SSFileLog();
  }

LABEL_12:
  objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISLogoutOperation account](self, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUserIdentifier:", v13);

  -[ISOperation loadedURLBagWithContext:returningError:](self, "loadedURLBagWithContext:returningError:", v11, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "valueForKey:", CFSTR("push-notification-types"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v15, "objectForKey:", CFSTR("add-push-notification-type-url"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = objc_alloc_init(ISStoreURLOperation);
      v18 = -[ISLogoutOperation _copyAuthenticationContext](self, "_copyAuthenticationContext");
      -[ISURLOperation setAuthenticationContext:](v17, "setAuthenticationContext:", v18);

      +[ISDataProvider provider](ISProtocolDataProvider, "provider");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISURLOperation setDataProvider:](v17, "setDataProvider:", v19);

      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISLogoutOperation _createDisableBookkeeperRequestPropertiesWithURL:](self, "_createDisableBookkeeperRequestPropertiesWithURL:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISURLOperation setRequestProperties:](v17, "setRequestProperties:", v21);

      v59 = 0;
      -[ISOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v17, &v59);
      v22 = v59;
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsLogoutConfig");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v23;
      v57 = v15;
      if (v22)
      {
        if (!v23)
        {
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v25 = objc_msgSend(v24, "shouldLog", v52);
        if (objc_msgSend(v24, "shouldLogToDisk"))
          v25 |= 2u;
        objc_msgSend(v24, "OSLogObject");
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          v27 = v25;
        else
          v27 = v25 & 2;
        if (!v27)
          goto LABEL_58;
        v55 = v14;
        v28 = (void *)objc_opt_class();
        v54 = v28;
        -[ISLogoutOperation logKey](self, "logKey");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = 138543874;
        v61 = v28;
        v62 = 2114;
        v63 = (uint64_t)v29;
        v64 = 2114;
        v65 = v22;
        LODWORD(v53) = 32;
        v30 = (void *)_os_log_send_and_compose_impl();

        if (v30)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v30, 4, &v60, v53);
          v26 = objc_claimAutoreleasedReturnValue();
          free(v30);
          SSFileLog();
          v14 = v55;
LABEL_58:
          v15 = v57;

LABEL_62:
          goto LABEL_63;
        }
        v14 = v55;
      }
      else
      {
        if (!v23)
        {
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v46 = objc_msgSend(v24, "shouldLog", v52);
        if (objc_msgSend(v24, "shouldLogToDisk"))
          v46 |= 2u;
        objc_msgSend(v24, "OSLogObject");
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          v47 = v46;
        else
          v47 = v46 & 2;
        if (!v47)
          goto LABEL_58;
        v48 = (void *)objc_opt_class();
        v56 = v48;
        -[ISLogoutOperation logKey](self, "logKey");
        v49 = objc_claimAutoreleasedReturnValue();
        v60 = 138543618;
        v61 = v48;
        v62 = 2114;
        v63 = v49;
        v50 = (void *)v49;
        LODWORD(v53) = 22;
        v51 = (void *)_os_log_send_and_compose_impl();

        if (v51)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v51, 4, &v60, v53);
          v26 = objc_claimAutoreleasedReturnValue();
          free(v51);
          SSFileLog();
          goto LABEL_58;
        }
      }
      v15 = v57;
      goto LABEL_62;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsLogoutConfig");
    v17 = (ISStoreURLOperation *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v17 = (ISStoreURLOperation *)objc_claimAutoreleasedReturnValue();
    }
    v39 = -[ISStoreURLOperation shouldLog](v17, "shouldLog", v52);
    if (-[ISStoreURLOperation shouldLogToDisk](v17, "shouldLogToDisk"))
      v40 = v39 | 2;
    else
      v40 = v39;
    -[ISStoreURLOperation OSLogObject](v17, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      v41 = v40;
    else
      v41 = v40 & 2;
    if (!v41)
      goto LABEL_63;
    v58 = v15;
    v42 = (void *)objc_opt_class();
    v43 = v42;
    -[ISLogoutOperation logKey](self, "logKey");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 138543618;
    v61 = v42;
    v62 = 2114;
    v63 = (uint64_t)v44;
    LODWORD(v53) = 22;
    v45 = (void *)_os_log_send_and_compose_impl();

    if (v45)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v45, 4, &v60, v53);
      v22 = objc_claimAutoreleasedReturnValue();
      free(v45);
      SSFileLog();
      v15 = v58;
LABEL_63:

      goto LABEL_64;
    }
    v15 = v58;
LABEL_64:

    goto LABEL_65;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsLogoutConfig");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31 = objc_msgSend(v16, "shouldLog", v52);
  if (objc_msgSend(v16, "shouldLogToDisk"))
    v32 = v31 | 2;
  else
    v32 = v31;
  objc_msgSend(v16, "OSLogObject");
  v17 = (ISStoreURLOperation *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v17->super.super.super.super, OS_LOG_TYPE_ERROR))
    v33 = v32;
  else
    v33 = v32 & 2;
  if (!v33)
    goto LABEL_64;
  v34 = v15;
  v35 = (void *)objc_opt_class();
  v36 = v35;
  -[ISLogoutOperation logKey](self, "logKey");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 138543618;
  v61 = v35;
  v62 = 2114;
  v63 = (uint64_t)v37;
  LODWORD(v53) = 22;
  v38 = (void *)_os_log_send_and_compose_impl();

  if (v38)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v38, 4, &v60, v53);
    v17 = (ISStoreURLOperation *)objc_claimAutoreleasedReturnValue();
    free(v38);
    SSFileLog();
    v15 = v34;
    goto LABEL_64;
  }
  v15 = v34;
LABEL_65:

}

- (id)_sbsyncData
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v14 = 0;
  v15 = 0;
  v13 = 0;
  qi864985u0(-1, (uint64_t)&v15, (uint64_t)&v13 + 4, (uint64_t)&v14, (uint64_t)&v13);
  v3 = 0;
  if (!v4)
  {
    -[ISLogoutOperation account](self, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedLongLongValue");

    v8 = objc_alloc_init(MEMORY[0x24BEB2030]);
    v9 = objc_alloc(MEMORY[0x24BDBCE50]);
    v10 = (void *)objc_msgSend(v9, "initWithBytesNoCopy:length:freeWhenDone:", v15, HIDWORD(v13), 0);
    v12 = 0;
    objc_msgSend(v8, "generateSubscriptionBagRequestWithAccountUniqueIdentifier:transactionType:machineIDData:returningSubscriptionBagData:error:", v7, 303, v10, &v12, 0);
    v3 = v12;

  }
  if (v15)
    jk24uiwqrg(v15);
  if (v14)
    jk24uiwqrg(v14);
  return v3;
}

- (void)_sendLogoutRequest
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  ISStoreURLOperation *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  int v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  int *v28;
  uint64_t v29;
  id v30;
  int v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsLogoutConfig");
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
    v7 = (void *)objc_opt_class();
    v8 = v7;
    -[ISLogoutOperation logKey](self, "logKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138543618;
    v32 = v7;
    v33 = 2114;
    v34 = v9;
    LODWORD(v29) = 22;
    v28 = &v31;
    v10 = (void *)_os_log_send_and_compose_impl();

    if (!v10)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, &v31, v29);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v10);
    v28 = (int *)v6;
    SSFileLog();
  }

LABEL_12:
  v11 = objc_alloc_init(ISStoreURLOperation);
  v12 = -[ISLogoutOperation _copyAuthenticationContext](self, "_copyAuthenticationContext");
  -[ISURLOperation setAuthenticationContext:](v11, "setAuthenticationContext:", v12);

  +[ISDataProvider provider](ISProtocolDataProvider, "provider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISURLOperation setDataProvider:](v11, "setDataProvider:", v13);

  -[ISLogoutOperation _createLogoutRequestProperties](self, "_createLogoutRequestProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISURLOperation setRequestProperties:](v11, "setRequestProperties:", v14);

  -[ISStoreURLOperation setUseUserSpecificURLBag:](v11, "setUseUserSpecificURLBag:", 1);
  v30 = 0;
  -[ISOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v11, &v30);
  v15 = v30;
  if (!v15)
    goto LABEL_25;
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsLogoutConfig");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = objc_msgSend(v16, "shouldLog", v28);
  if (objc_msgSend(v16, "shouldLogToDisk"))
    v18 = v17 | 2;
  else
    v18 = v17;
  objc_msgSend(v16, "OSLogObject");
  v19 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    v18 &= 2u;
  if (!v18)
    goto LABEL_23;
  v20 = (void *)objc_opt_class();
  v21 = v20;
  -[ISLogoutOperation logKey](self, "logKey");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 138543874;
  v32 = v20;
  v33 = 2114;
  v34 = v22;
  v35 = 2114;
  v36 = v15;
  LODWORD(v29) = 32;
  v28 = &v31;
  v23 = (void *)_os_log_send_and_compose_impl();

  if (v23)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v23, 4, &v31, v29);
    v19 = objc_claimAutoreleasedReturnValue();
    free(v23);
    v28 = (int *)v19;
    SSFileLog();
LABEL_23:

  }
LABEL_25:
  -[ISURLOperation dataProvider](v11, "dataProvider", v28);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "output");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    SSVSubscriptionBagForDictionary();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v27 = objc_alloc_init(MEMORY[0x24BEB2030]);
      objc_msgSend(v27, "importSubscriptionKeyBagData:returningError:", v26, 0);

    }
  }

}

- (SSAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
  objc_storeStrong((id *)&self->_logKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
