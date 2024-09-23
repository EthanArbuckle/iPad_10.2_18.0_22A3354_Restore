@implementation ISBiometricOptInOperation

- (ISBiometricOptInOperation)init
{
  ISBiometricOptInOperation *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *dispatchQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ISBiometricOptInOperation;
  v2 = -[ISOperation init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.itunesstored.ISBiometricOptInOperation", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (BOOL)promptUser
{
  BOOL promptUser;

  -[ISOperation lock](self, "lock");
  promptUser = self->_promptUser;
  -[ISOperation unlock](self, "unlock");
  return promptUser;
}

- (id)resultBlock
{
  void *v3;
  void *v4;

  -[ISOperation lock](self, "lock");
  v3 = (void *)objc_msgSend(self->_resultBlock, "copy");
  -[ISOperation unlock](self, "unlock");
  v4 = (void *)MEMORY[0x20BD37BD4](v3);

  return v4;
}

- (void)setPromptUser:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[ISOperation lock](self, "lock");
  if (self->_promptUser != v3)
    self->_promptUser = v3;
  -[ISOperation unlock](self, "unlock");
}

- (void)setResultBlock:(id)a3
{
  void *v4;
  id resultBlock;
  id v6;

  v6 = a3;
  -[ISOperation lock](self, "lock");
  if (self->_resultBlock != v6)
  {
    v4 = (void *)objc_msgSend(v6, "copy");
    resultBlock = self->_resultBlock;
    self->_resultBlock = v4;

  }
  -[ISOperation unlock](self, "unlock");

}

- (void)run
{
  _BOOL4 v3;
  id v4;
  void *v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  int v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  int v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (!-[ISBiometricOptInOperation promptUser](self, "promptUser"))
  {
    v5 = 0;
    goto LABEL_15;
  }
  v27 = 0;
  v3 = -[ISBiometricOptInOperation _performOptInDialogOperationWithError:](self, "_performOptInDialogOperationWithError:", &v27);
  v4 = v27;
  v5 = v4;
  if (v3)
  {
    v26 = v4;
    v6 = -[ISBiometricOptInOperation _performPasscodeDialogOperationWithError:](self, "_performPasscodeDialogOperationWithError:", &v26);
    v7 = v26;

    v5 = v7;
    if (v6)
    {
LABEL_15:
      objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "activeAccount");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[ISBiometricOptInOperation _updateTouchIDSettingsForAccount:](self, "_updateTouchIDSettingsForAccount:", v8);
        v16 = 1;
        goto LABEL_30;
      }
      objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v11 = objc_claimAutoreleasedReturnValue();
      }
      v17 = -[NSObject shouldLog](v11, "shouldLog");
      if (-[NSObject shouldLogToDisk](v11, "shouldLogToDisk"))
        v18 = v17 | 2;
      else
        v18 = v17;
      -[NSObject OSLogObject](v11, "OSLogObject");
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        v18 &= 2u;
      if (v18)
      {
        v20 = (void *)objc_opt_class();
        v28 = 138543362;
        v29 = v20;
        v21 = v20;
        LODWORD(v25) = 12;
        v22 = (void *)_os_log_send_and_compose_impl();

        if (!v22)
          goto LABEL_28;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v22, 4, &v28, v25);
        v19 = objc_claimAutoreleasedReturnValue();
        free(v22);
        SSFileLog();
      }

      goto LABEL_28;
    }
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = objc_msgSend(v8, "shouldLog");
  if (objc_msgSend(v8, "shouldLogToDisk"))
    v10 = v9 | 2;
  else
    v10 = v9;
  objc_msgSend(v8, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    v10 &= 2u;
  if (!v10)
    goto LABEL_28;
  v12 = (void *)objc_opt_class();
  v28 = 138543362;
  v29 = v12;
  v13 = v12;
  LODWORD(v25) = 12;
  v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 4, &v28, v25);
    v11 = objc_claimAutoreleasedReturnValue();
    free(v14);
    SSFileLog();
LABEL_28:

  }
  v16 = 0;
LABEL_30:

  -[ISOperation setError:](self, "setError:", v5);
  -[ISOperation setSuccess:](self, "setSuccess:", v16);
  -[ISBiometricOptInOperation resultBlock](self, "resultBlock");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  if (v23)
    (*(void (**)(uint64_t, uint64_t, void *))(v23 + 16))(v23, v16, v5);

}

- (void)_loadURLBag
{
  ISLoadURLBagOperation *v3;
  _BOOL4 v4;
  id v5;
  void *v6;
  void *urlBag;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  ISURLBag *v15;
  uint64_t v16;
  id v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(ISLoadURLBagOperation);
  v17 = 0;
  v4 = -[ISOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v3, &v17);
  v5 = v17;
  v6 = v5;
  if (v4 && v5 == 0)
  {
    -[ISLoadURLBagOperation URLBag](v3, "URLBag");
    v15 = (ISURLBag *)objc_claimAutoreleasedReturnValue();
    urlBag = self->_urlBag;
    self->_urlBag = v15;
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  urlBag = (void *)objc_claimAutoreleasedReturnValue();
  if (!urlBag)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    urlBag = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = objc_msgSend(urlBag, "shouldLog");
  if (objc_msgSend(urlBag, "shouldLogToDisk"))
    v10 = v9 | 2;
  else
    v10 = v9;
  objc_msgSend(urlBag, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    v10 &= 2u;
  if (!v10)
    goto LABEL_15;
  v12 = (void *)objc_opt_class();
  v18 = 138543618;
  v19 = v12;
  v20 = 2114;
  v21 = v6;
  v13 = v12;
  LODWORD(v16) = 22;
  v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 4, &v18, v16);
    v11 = objc_claimAutoreleasedReturnValue();
    free(v14);
    SSFileLog();
LABEL_15:

  }
LABEL_17:

}

- (void)_performOptInDialogMetricsWithResult:(BOOL)a3 error:(id)a4
{
  _BOOL4 v4;
  id v6;
  ISURLBag *urlBag;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  NSObject *v14;
  int v15;
  int v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  NSObject *v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  int v36;
  int v37;
  id v38;
  void *v39;
  int *v40;
  uint64_t v41;
  _QWORD v42[5];
  _QWORD v43[5];
  int v44;
  id v45;
  uint64_t v46;

  v4 = a3;
  v46 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  urlBag = self->_urlBag;
  if (urlBag || (-[ISBiometricOptInOperation _loadURLBag](self, "_loadURLBag"), (urlBag = self->_urlBag) != 0))
  {
    -[ISURLBag valueForKey:](urlBag, "valueForKey:", *MEMORY[0x24BEB2990]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      +[ISDevice sharedInstance](ISDevice, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "deviceBiometricStyle");

      if (v10 == 3)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        v13 = CFSTR("BIO_OPT_IN_FACE_EXPLANATION");
        goto LABEL_19;
      }
      if (v10 == 2)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        v13 = CFSTR("BIO_OPT_IN_EXPLANATION");
LABEL_19:
        objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_24C441158, CFSTR("Mesa"));
        v14 = objc_claimAutoreleasedReturnValue();

LABEL_32:
        v26 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        objc_msgSend(v26, "setObject:forKey:", *MEMORY[0x24BEB2908], *MEMORY[0x24BEB2130]);
        objc_msgSend(v26, "setObject:forKey:", &unk_24C4531D8, *MEMORY[0x24BEB2140]);
        if (v4)
          v27 = MEMORY[0x24BDBD1C8];
        else
          v27 = MEMORY[0x24BDBD1C0];
        objc_msgSend(v26, "setObject:forKey:", v27, *MEMORY[0x24BEB2150], v40);
        if (v6)
          objc_msgSend(v26, "setObject:forKey:", v6, *MEMORY[0x24BEB2138]);
        if (v14)
          objc_msgSend(v26, "setObject:forKey:", v14, *MEMORY[0x24BEB2148]);
        -[ISBiometricOptInOperation topicName](self, "topicName");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          -[ISBiometricOptInOperation topicName](self, "topicName");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKey:", v29, *MEMORY[0x24BEB2158]);

        }
        -[ISBiometricOptInOperation userAgent](self, "userAgent");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          -[ISBiometricOptInOperation userAgent](self, "userAgent");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKey:", v31, *MEMORY[0x24BEB2160]);

        }
        objc_msgSend(MEMORY[0x24BEB1DC8], "authorizationDialogEventForParameters:", v26);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1ED0]), "initWithGlobalConfiguration:", v8);
        v34 = objc_alloc_init(MEMORY[0x24BEB1ED8]);
        objc_msgSend(v34, "setGlobalConfiguration:", v33);
        v35 = MEMORY[0x24BDAC760];
        v43[0] = MEMORY[0x24BDAC760];
        v43[1] = 3221225472;
        v43[2] = __72__ISBiometricOptInOperation__performOptInDialogMetricsWithResult_error___block_invoke;
        v43[3] = &unk_24C43C918;
        v43[4] = self;
        objc_msgSend(v34, "insertEvent:withCompletionHandler:", v32, v43);
        v42[0] = v35;
        v42[1] = 3221225472;
        v42[2] = __72__ISBiometricOptInOperation__performOptInDialogMetricsWithResult_error___block_invoke_22;
        v42[3] = &unk_24C43C918;
        v42[4] = self;
        objc_msgSend(v34, "flushUnreportedEventsWithCompletionHandler:", v42);

        goto LABEL_44;
      }
      objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v21 = objc_msgSend(v20, "shouldLog");
      if (objc_msgSend(v20, "shouldLogToDisk"))
        v22 = v21 | 2;
      else
        v22 = v21;
      objc_msgSend(v20, "OSLogObject");
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        v22 &= 2u;
      if (v22)
      {
        v44 = 138543362;
        v45 = (id)objc_opt_class();
        v24 = v45;
        LODWORD(v41) = 12;
        v40 = &v44;
        v25 = (void *)_os_log_send_and_compose_impl();

        if (!v25)
        {
LABEL_31:

          v14 = 0;
          goto LABEL_32;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v25, 4, &v44, v41);
        v23 = objc_claimAutoreleasedReturnValue();
        free(v25);
        v40 = (int *)v23;
        SSFileLog();
      }

      goto LABEL_31;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v15 = -[NSObject shouldLog](v14, "shouldLog");
    if (-[NSObject shouldLogToDisk](v14, "shouldLogToDisk"))
      v16 = v15 | 2;
    else
      v16 = v15;
    -[NSObject OSLogObject](v14, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      v16 &= 2u;
    if (!v16)
      goto LABEL_17;
    v44 = 138543362;
    v45 = (id)objc_opt_class();
    v18 = v45;
    LODWORD(v41) = 12;
    v19 = (void *)_os_log_send_and_compose_impl();

    if (v19)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v19, 4, &v44, v41);
      v17 = objc_claimAutoreleasedReturnValue();
      free(v19);
      SSFileLog();
LABEL_17:

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v36 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v37 = v36 | 2;
    else
      v37 = v36;
    objc_msgSend(v8, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      v37 &= 2u;
    if (v37)
    {
      v44 = 138543362;
      v45 = (id)objc_opt_class();
      v38 = v45;
      LODWORD(v41) = 12;
      v39 = (void *)_os_log_send_and_compose_impl();

      if (!v39)
        goto LABEL_45;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v39, 4, &v44, v41);
      v14 = objc_claimAutoreleasedReturnValue();
      free(v39);
      SSFileLog();
    }
  }
LABEL_44:

LABEL_45:
}

void __72__ISBiometricOptInOperation__performOptInDialogMetricsWithResult_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  _BYTE v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
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
      *(_DWORD *)v10 = 138543618;
      *(_QWORD *)&v10[4] = objc_opt_class();
      *(_WORD *)&v10[12] = 2114;
      *(_QWORD *)&v10[14] = v2;
      v7 = *(id *)&v10[4];
      LODWORD(v9) = 22;
      v8 = (void *)_os_log_send_and_compose_impl();

      if (!v8)
      {
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, v10, v9, *(_OWORD *)v10, *(_QWORD *)&v10[16], v11);
      v6 = objc_claimAutoreleasedReturnValue();
      free(v8);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:

}

void __72__ISBiometricOptInOperation__performOptInDialogMetricsWithResult_error___block_invoke_22(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  _BYTE v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
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
      *(_DWORD *)v10 = 138543618;
      *(_QWORD *)&v10[4] = objc_opt_class();
      *(_WORD *)&v10[12] = 2114;
      *(_QWORD *)&v10[14] = v2;
      v7 = *(id *)&v10[4];
      LODWORD(v9) = 22;
      v8 = (void *)_os_log_send_and_compose_impl();

      if (!v8)
      {
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, v10, v9, *(_OWORD *)v10, *(_QWORD *)&v10[16], v11);
      v6 = objc_claimAutoreleasedReturnValue();
      free(v8);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:

}

- (BOOL)_performPasscodeDialogOperationWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  BOOL v21;
  int *v23;
  uint64_t v24;
  _QWORD v26[7];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__13;
  v35 = __Block_byref_object_dispose__13;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 1;
  if (SSIsDaemon())
  {
    +[ISDevice sharedInstance](ISDevice, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "deviceBiometricStyle");

    if (v5 == 2)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PASSCODE_TITLE"), &stru_24C441158, CFSTR("Mesa"));
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    if (v5 == 3)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PASSCODE_TITLE_FACE"), &stru_24C441158, CFSTR("Mesa"));
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v8 = (__CFString *)v7;
LABEL_19:

      if (*((_BYTE *)v28 + 24))
      {
        do
        {
          v17 = -[ISBiometricOptInOperation _newSourceByStartingTimeoutTimer](self, "_newSourceByStartingTimeoutTimer", v23);
          v18 = (void *)objc_msgSend(objc_alloc(NSClassFromString(CFSTR("DevicePasscodePromptOperation"))), "initWithTitle:message:", v8, 0);
          v26[0] = MEMORY[0x24BDAC760];
          v26[1] = 3221225472;
          v26[2] = __70__ISBiometricOptInOperation__performPasscodeDialogOperationWithError___block_invoke;
          v26[3] = &unk_24C43CE18;
          v26[4] = &v37;
          v26[5] = &v27;
          v26[6] = &v31;
          objc_msgSend(v18, "setTokenBlock:", v26);
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("PASSCODE_INCORRECT"), &stru_24C441158, CFSTR("Mesa"));
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

          -[ISOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v18, 0);
          dispatch_source_cancel(v17);

          v8 = v20;
        }
        while (*((_BYTE *)v28 + 24));
      }
      else
      {
        v20 = v8;
      }

      goto LABEL_24;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v6, "shouldLog");
    v10 = objc_msgSend(v6, "shouldLogToDisk");
    objc_msgSend(v6, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
      v9 |= 2u;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      v13 = v9;
    else
      v13 = v9 & 2;
    if (v13)
    {
      v14 = (void *)objc_opt_class();
      v41 = 138543362;
      v42 = v14;
      v15 = v14;
      LODWORD(v24) = 12;
      v23 = &v41;
      v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_18:
        v8 = &stru_24C441158;
        goto LABEL_19;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v16, 4, &v41, v24);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      free(v16);
      v23 = (int *)v12;
      SSFileLog();
    }

    goto LABEL_18;
  }
LABEL_24:
  if (a3)
    *a3 = objc_retainAutorelease((id)v32[5]);
  v21 = v38[3] == 1;
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  return v21;
}

void __70__ISBiometricOptInOperation__performPasscodeDialogOperationWithError___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a2 == 2;
  v5 = objc_msgSend(a4, "copy");
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (BOOL)_performOptInDialogOperationWithError:(id *)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  id v13;
  void *v14;
  ISDialog *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  ISBiometricOptInOperation *v24;
  NSObject *v25;
  void *v26;
  _BOOL4 v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  BOOL v33;
  NSObject *dispatchQueue;
  id v35;
  int *v37;
  uint64_t v38;
  void *v39;
  _QWORD block[5];
  id v43;
  BOOL v44;
  id v45;
  _QWORD v46[2];
  int v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  +[ISDevice sharedInstance](ISDevice, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "deviceBiometricStyle");

  if (v4 == 3)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("BIO_OPT_IN_FACE_EXPLANATION");
    goto LABEL_5;
  }
  if (v4 != 2)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
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
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      v11 &= 2u;
    if (v11)
    {
      v47 = 138543362;
      v48 = (id)objc_opt_class();
      v13 = v48;
      LODWORD(v38) = 12;
      v37 = &v47;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_17:

        v8 = 0;
        goto LABEL_18;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 4, &v47, v38);
      v12 = objc_claimAutoreleasedReturnValue();
      free(v14);
      v37 = (int *)v12;
      SSFileLog();
    }

    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = CFSTR("BIO_OPT_IN_EXPLANATION");
LABEL_5:
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24C441158, CFSTR("Mesa"));
  v8 = objc_claimAutoreleasedReturnValue();

LABEL_18:
  v39 = (void *)v8;
  v15 = -[ISDialog initWithTitle:message:]([ISDialog alloc], "initWithTitle:message:", v8, 0);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("BIO_OPT_IN_NOT_NOW"), &stru_24C441158, CFSTR("Mesa"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ISDialogButton buttonWithTitle:](ISDialogButton, "buttonWithTitle:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("BIO_OPT_IN_OK"), &stru_24C441158, CFSTR("Mesa"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[ISDialogButton buttonWithTitle:](ISDialogButton, "buttonWithTitle:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v46[0] = v18;
  v46[1] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISDialog setButtons:](v15, "setButtons:", v22);

  -[ISDialog setDefaultButtonIndex:](v15, "setDefaultButtonIndex:", 1);
  v23 = (void *)objc_opt_new();
  v24 = self;
  v25 = -[ISBiometricOptInOperation _newSourceByStartingTimeoutTimer](self, "_newSourceByStartingTimeoutTimer");
  +[ISDialogOperation operationWithDialog:](ISDialogOperation, "operationWithDialog:", v15);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  v27 = -[ISOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v26, &v45);
  v28 = v45;
  if (v27 && (objc_msgSend(v26, "selectedButton"), (v29 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v30 = (void *)v29;
    -[ISDialog buttons](v15, "buttons");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "indexOfObjectIdenticalTo:", v30);

    v24 = self;
    dispatch_source_cancel(v25);
    if (v32 == 1)
    {
      v33 = 1;
      goto LABEL_24;
    }
  }
  else
  {
    dispatch_source_cancel(v25);
  }
  objc_msgSend(v23, "setBiometricState:", 1, v37);
  v33 = 0;
LABEL_24:
  dispatchQueue = v24->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__ISBiometricOptInOperation__performOptInDialogOperationWithError___block_invoke;
  block[3] = &unk_24C43CE40;
  block[4] = v24;
  v44 = v33;
  v35 = v28;
  v43 = v35;
  dispatch_async(dispatchQueue, block);
  if (a3)
    *a3 = objc_retainAutorelease(v35);

  return v33;
}

uint64_t __67__ISBiometricOptInOperation__performOptInDialogOperationWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performOptInDialogMetricsWithResult:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_updateTouchIDSettingsForAccount:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  ISBiometricUpdateTouchIDSettingsOperation *v7;
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
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a3;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ISBiometricUpdateTouchIDSettingsOperation initWithAccountIdentifier:]([ISBiometricUpdateTouchIDSettingsOperation alloc], "initWithAccountIdentifier:", v6);
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __62__ISBiometricOptInOperation__updateTouchIDSettingsForAccount___block_invoke;
  v19[3] = &unk_24C43CE68;
  v8 = v5;
  v20 = v8;
  -[ISBiometricUpdateTouchIDSettingsOperation setResultBlock:](v7, "setResultBlock:", v19);
  +[ISOperationQueue mainQueue](ISOperationQueue, "mainQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addOperation:", v7);

  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setBiometricState:", 2);
  objc_msgSend(v10, "saveIdentityMapForAccountIdentifier:", v6);
  objc_msgSend(v10, "registerAccountIdentifier:", v6);
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
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
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    v13 &= 2u;
  if (!v13)
    goto LABEL_11;
  v15 = (void *)objc_opt_class();
  v21 = 138543618;
  v22 = v15;
  v23 = 2112;
  v24 = v6;
  v16 = v15;
  LODWORD(v18) = 22;
  v17 = (void *)_os_log_send_and_compose_impl();

  if (v17)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v17, 4, &v21, v18);
    v14 = objc_claimAutoreleasedReturnValue();
    free(v17);
    SSFileLog();
LABEL_11:

  }
}

void __62__ISBiometricOptInOperation__updateTouchIDSettingsForAccount___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (a2)
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
    {

      goto LABEL_24;
    }
    v11 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2);
    v18 = 138543874;
    v19 = v11;
    v20 = 2114;
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v22 = 2114;
    v23 = v5;
    LODWORD(v17) = 32;
    v12 = (void *)_os_log_send_and_compose_impl();

    if (!v12)
      goto LABEL_24;
    goto LABEL_21;
  }
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = objc_msgSend(v7, "shouldLog");
  if (objc_msgSend(v7, "shouldLogToDisk"))
    v14 = v13 | 2;
  else
    v14 = v13;
  objc_msgSend(v7, "OSLogObject");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    v14 &= 2u;
  if (!v14)
    goto LABEL_22;
  v16 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
  v18 = 138543618;
  v19 = v16;
  v20 = 2114;
  v21 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = 22;
  v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
LABEL_21:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v12, 4, &v18, v17);
    v15 = objc_claimAutoreleasedReturnValue();
    free(v12);
    SSFileLog();
LABEL_22:

  }
LABEL_24:

}

- (id)_newSourceByStartingTimeoutTimer
{
  NSObject *v3;
  NSObject *v4;
  dispatch_time_t v5;
  void *v6;
  id v7;
  _QWORD handler[4];
  id v10;

  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v3);

  v5 = dispatch_time(0, 180000000000);
  dispatch_source_set_timer(v4, v5, 0, 0);
  objc_msgSend(MEMORY[0x24BEB20C0], "weakReferenceWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __61__ISBiometricOptInOperation__newSourceByStartingTimeoutTimer__block_invoke;
  handler[3] = &unk_24C43C128;
  v10 = v6;
  v7 = v6;
  dispatch_source_set_event_handler(v4, handler);
  dispatch_resume(v4);

  return v4;
}

void __61__ISBiometricOptInOperation__newSourceByStartingTimeoutTimer__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v3 = objc_msgSend(v2, "shouldLog");
  if (objc_msgSend(v2, "shouldLogToDisk"))
    v4 = v3 | 2;
  else
    v4 = v3;
  objc_msgSend(v2, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    v4 &= 2u;
  if (!v4)
    goto LABEL_11;
  LODWORD(v9) = 138543362;
  *(_QWORD *)((char *)&v9 + 4) = objc_opt_class();
  v6 = *(id *)((char *)&v9 + 4);
  LODWORD(v8) = 12;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 4, &v9, v8, v9);
    v5 = objc_claimAutoreleasedReturnValue();
    free(v7);
    SSFileLog();
LABEL_11:

  }
  objc_msgSend(v1, "cancel");

}

- (NSString)topicName
{
  return (NSString *)objc_getProperty(self, a2, 368, 1);
}

- (void)setTopicName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 368);
}

- (NSString)userAgent
{
  return (NSString *)objc_getProperty(self, a2, 376, 1);
}

- (void)setUserAgent:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 376);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_topicName, 0);
  objc_storeStrong((id *)&self->_urlBag, 0);
  objc_storeStrong(&self->_resultBlock, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
