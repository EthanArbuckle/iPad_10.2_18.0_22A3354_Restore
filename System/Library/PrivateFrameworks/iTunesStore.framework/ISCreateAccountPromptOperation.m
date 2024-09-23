@implementation ISCreateAccountPromptOperation

- (ISCreateAccountPromptOperation)init
{
  return -[ISCreateAccountPromptOperation initWithReason:](self, "initWithReason:", 0);
}

- (ISCreateAccountPromptOperation)initWithReason:(id)a3
{
  id v5;
  ISCreateAccountPromptOperation *v6;
  ISCreateAccountPromptOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISCreateAccountPromptOperation;
  v6 = -[ISOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_reason, a3);

  return v7;
}

- (void)run
{
  Class v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  int v8;
  int v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  __objc2_class **v24;
  void *v25;
  void *v26;
  int64_t v27;
  void *v28;
  int v29;
  NSObject *v30;
  int v31;
  void *v32;
  void *v33;
  int v34;
  int v35;
  void *v36;
  id v37;
  void *v38;
  int v39;
  int v40;
  void *v41;
  void *v42;
  int *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  int v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v3 = ISWeakLinkedClassForString(CFSTR("MCProfileConnection"), (const void *)0x11);
  ISWeakLinkedStringConstantForString("MCFeatureAccountModificationAllowed", (const void *)0x11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class sharedConnection](v3, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "effectiveBoolValueForSetting:", v4);

  if (v6 != 2)
  {
    v7 = -[ISCreateAccountPromptOperation _newCreateAccountDialog](self, "_newCreateAccountDialog");
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = objc_msgSend(v14, "shouldLog");
    if (objc_msgSend(v14, "shouldLogToDisk"))
      v16 = v15 | 2;
    else
      v16 = v15;
    objc_msgSend(v14, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      v16 &= 2u;
    if (v16)
    {
      v50 = 138543362;
      v51 = (id)objc_opt_class();
      v18 = v51;
      LODWORD(v44) = 12;
      v19 = (void *)_os_log_send_and_compose_impl();

      if (!v19)
        goto LABEL_25;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v19, 4, &v50, v44);
      v17 = objc_claimAutoreleasedReturnValue();
      free(v19);
      SSFileLog();
    }

LABEL_25:
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.TestFlight"), CFSTR("com.apple.iTunesU"), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bundleIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v20, "containsObject:", v22);
    v24 = off_24C43ABD8;
    if (!v23)
      v24 = off_24C43AB00;
    -[__objc2_class operationWithDialog:](*v24, "operationWithDialog:", v7);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", CFSTR("com.apple.itunesstored.lock.createaccount"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setSerializationLockIdentifiers:", v26);

    v49 = 0;
    LODWORD(v26) = -[ISOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v25, &v49);
    v12 = v49;
    v13 = 0;
    if (!(_DWORD)v26)
      goto LABEL_65;
    v27 = -[ISCreateAccountPromptOperation _mapCorrectSelectedButtonWithDialog:](self, "_mapCorrectSelectedButtonWithDialog:", v25);
    v48 = v20;
    if (v27 == 1)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsConfig");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v28)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v34 = objc_msgSend(v28, "shouldLog");
      if (objc_msgSend(v28, "shouldLogToDisk"))
        v34 |= 2u;
      objc_msgSend(v28, "OSLogObject");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        v35 = v34;
      else
        v35 = v34 & 2;
      if (v35)
      {
        v36 = (void *)objc_opt_class();
        v50 = 138543362;
        v51 = v36;
        v37 = v36;
        LODWORD(v45) = 12;
        v43 = &v50;
        v38 = (void *)_os_log_send_and_compose_impl();

        if (!v38)
        {
          v13 = 3;
          goto LABEL_64;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v38, 4, &v50, v45);
        v30 = objc_claimAutoreleasedReturnValue();
        free(v38);
        v43 = (int *)v30;
        SSFileLog();
      }
      v13 = 3;
    }
    else if (v27)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsConfig");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v28)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v39 = objc_msgSend(v28, "shouldLog");
      if (objc_msgSend(v28, "shouldLogToDisk"))
        v39 |= 2u;
      objc_msgSend(v28, "OSLogObject");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        v40 = v39;
      else
        v40 = v39 & 2;
      if (v40)
      {
        v41 = (void *)objc_opt_class();
        v50 = 138543362;
        v51 = v41;
        v47 = v41;
        LODWORD(v45) = 12;
        v43 = &v50;
        v42 = (void *)_os_log_send_and_compose_impl();

        if (!v42)
        {
          v13 = 2;
          goto LABEL_64;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v42, 4, &v50, v45);
        v30 = objc_claimAutoreleasedReturnValue();
        free(v42);
        v43 = (int *)v30;
        SSFileLog();
      }
      v13 = 2;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsConfig");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v28)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v29 = objc_msgSend(v28, "shouldLog");
      if (objc_msgSend(v28, "shouldLogToDisk"))
        v29 |= 2u;
      objc_msgSend(v28, "OSLogObject");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        v31 = v29;
      else
        v31 = v29 & 2;
      if (v31)
      {
        v32 = (void *)objc_opt_class();
        v50 = 138543362;
        v51 = v32;
        v46 = v32;
        LODWORD(v45) = 12;
        v43 = &v50;
        v33 = (void *)_os_log_send_and_compose_impl();

        if (!v33)
        {
          v13 = 4;
          goto LABEL_64;
        }
        v13 = 4;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v33, 4, &v50, v45);
        v30 = objc_claimAutoreleasedReturnValue();
        free(v33);
        v43 = (int *)v30;
        SSFileLog();
      }
      else
      {
        v13 = 4;
      }
    }

LABEL_64:
    v20 = v48;
LABEL_65:

    goto LABEL_66;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsConfig");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v7 = (id)objc_claimAutoreleasedReturnValue();
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
    goto LABEL_12;
  v50 = 138543362;
  v51 = (id)objc_opt_class();
  v11 = v51;
  LODWORD(v44) = 12;
  v43 = &v50;
  v12 = (id)_os_log_send_and_compose_impl();

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v12, 4, &v50, v44);
    v10 = objc_claimAutoreleasedReturnValue();
    free(v12);
    v43 = (int *)v10;
    SSFileLog();
LABEL_12:

    v12 = 0;
  }
  v13 = 8;
LABEL_66:

  -[ISOperation setError:](self, "setError:", v12);
  -[ISCreateAccountPromptOperation setResponseType:](self, "setResponseType:", v13);
  -[ISOperation setSuccess:](self, "setSuccess:", v13 != 0, v43);

}

- (id)_newCreateAccountDialog
{
  ISDialog *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  _QWORD v21[3];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(ISDialog);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("USE_EXISTING_ACCOUNT"), &stru_24C441158, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ISDialogButton buttonWithTitle:](ISDialogButton, "buttonWithTitle:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CREATE_NEW_ACCOUNT"), &stru_24C441158, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ISDialogButton buttonWithTitle:](ISDialogButton, "buttonWithTitle:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24C441158, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[ISDialogButton buttonWithTitle:](ISDialogButton, "buttonWithTitle:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[ISCreateAccountPromptOperation _hasActiveICloudAccount](self, "_hasActiveICloudAccount"))
  {
    v22[0] = v12;
    v22[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
  }
  else
  {
    v21[0] = v6;
    v21[1] = v12;
    v21[2] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 1;
  }
  -[ISDialog setButtons:](v3, "setButtons:", v13);
  -[ISDialog setDefaultButtonIndex:](v3, "setDefaultButtonIndex:", v14);
  -[ISDialog setExpectsResponse:](v3, "setExpectsResponse:", 1);
  -[ISDialog setOneButtonPerLine:](v3, "setOneButtonPerLine:", 1);
  -[ISCreateAccountPromptOperation reason](self, "reason");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "length"))
  {
    -[ISDialog setMessage:](v3, "setMessage:", v15);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = CFSTR("SIGN_IN_WITH_REASON");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = CFSTR("SIGN_IN");
  }
  objc_msgSend(v16, "localizedStringForKey:value:table:", v18, &stru_24C441158, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISDialog setTitle:](v3, "setTitle:", v19);

  return v3;
}

- (int64_t)_mapCorrectSelectedButtonWithDialog:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  uint64_t v10;
  int64_t v11;

  v4 = a3;
  objc_msgSend(v4, "selectedButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "dialog");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "buttons");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "indexOfObjectIdenticalTo:", v5);

  }
  else
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v9 = -[ISCreateAccountPromptOperation _hasActiveICloudAccount](self, "_hasActiveICloudAccount");
  v10 = 2 * (v8 == 1);
  if (v8 == 2)
    v10 = 1;
  if (v9)
    v11 = 2 * (v8 == 0);
  else
    v11 = v10;

  return v11;
}

- (BOOL)_hasActiveICloudAccount
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(getACAccountStoreClass());
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aa_personID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "length") != 0;
  return (char)v3;
}

- (int64_t)responseType
{
  return self->_responseType;
}

- (void)setResponseType:(int64_t)a3
{
  self->_responseType = a3;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
