@implementation AMSBiometricsTokenUpdateTaskShim

- (AMSBiometricsTokenUpdateTaskShim)initWithAccountIdentifier:(id)a3
{
  id v4;
  AMSBiometricsTokenUpdateTaskShim *v5;
  AMSBiometricsTokenUpdateTaskShim *v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v16;
  objc_super v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AMSBiometricsTokenUpdateTaskShim;
  v5 = -[AMSBiometricsTokenUpdateTaskShim init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    -[AMSBiometricsTokenUpdateTaskShim setAccountIdentifier:](v5, "setAccountIdentifier:", v4);
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedStoreServicesConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
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
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      v9 &= 2u;
    if (v9)
    {
      v11 = (void *)objc_opt_class();
      v12 = v11;
      AMSSetLogKeyIfNeeded();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v11;
      v20 = 2114;
      v21 = v13;
      v22 = 2114;
      v23 = v4;
      LODWORD(v16) = 32;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 4, &v18, v16);
      v10 = objc_claimAutoreleasedReturnValue();
      free(v14);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:

  return v6;
}

- (void)runUpdateWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD v20[5];
  id v21;
  id v22;
  int v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  AMSSetLogKeyIfNeeded();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedStoreServicesConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = objc_msgSend(v6, "shouldLog");
  if (objc_msgSend(v6, "shouldLogToDisk"))
    v8 = v7 | 2;
  else
    v8 = v7;
  objc_msgSend(v6, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    v8 &= 2u;
  if (v8)
  {
    v23 = 138543618;
    v24 = (id)objc_opt_class();
    v25 = 2114;
    v26 = v5;
    v10 = v24;
    LODWORD(v19) = 22;
    v11 = (void *)_os_log_send_and_compose_impl();

    if (!v11)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v11, 4, &v23, v19);
    v9 = objc_claimAutoreleasedReturnValue();
    free(v11);
    SSFileLog();
  }

LABEL_12:
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ams_iTunesAccountWithDSID:", self->_accountIdentifier);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "ams_activeiTunesAccount");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08090]), "initWithAccount:", v13);
  objc_msgSend(v15, "performUpdate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __65__AMSBiometricsTokenUpdateTaskShim_runUpdateWithCompletionBlock___block_invoke;
  v20[3] = &unk_24C43CE90;
  v20[4] = self;
  v21 = v5;
  v22 = v4;
  v17 = v4;
  v18 = v5;
  objc_msgSend(v16, "addFinishBlock:", v20);

}

void __65__AMSBiometricsTokenUpdateTaskShim_runUpdateWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedStoreServicesConfig");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if ((_DWORD)a2)
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
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      v9 &= 2u;
    if (!v9)
      goto LABEL_22;
    v11 = (void *)objc_opt_class();
    v12 = *(_QWORD *)(a1 + 40);
    v22 = 138543618;
    v23 = v11;
    v24 = 2114;
    v25 = v12;
    v13 = v11;
    LODWORD(v21) = 22;
    v14 = (void *)_os_log_send_and_compose_impl();

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
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      v16 &= 2u;
    if (!v16)
      goto LABEL_22;
    v17 = (void *)objc_opt_class();
    v18 = *(_QWORD *)(a1 + 40);
    v19 = v17;
    AMSHashIfNeeded();
    v22 = 138543874;
    v23 = v17;
    v24 = 2114;
    v25 = v18;
    v26 = 2114;
    v27 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v21) = 32;
    v14 = (void *)_os_log_send_and_compose_impl();

  }
  if (!v14)
    goto LABEL_23;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 4, &v22, v21);
  v10 = objc_claimAutoreleasedReturnValue();
  free(v14);
  SSFileLog();
LABEL_22:

LABEL_23:
  v20 = *(_QWORD *)(a1 + 48);
  if (v20)
    (*(void (**)(uint64_t, uint64_t, id))(v20 + 16))(v20, a2, v5);

}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accountIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
