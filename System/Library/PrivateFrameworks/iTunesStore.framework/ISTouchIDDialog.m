@implementation ISTouchIDDialog

- (ISTouchIDDialog)initWithDialogDictionary:(id)a3
{
  id v4;
  ISTouchIDDialog *v5;
  ISTouchIDDialog *v6;
  objc_super v8;

  v4 = a3;
  __ISRecordSPIClassUsage(self);
  v8.receiver = self;
  v8.super_class = (Class)ISTouchIDDialog;
  v5 = -[ISDialog init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[ISTouchIDDialog _init](v5, "_init");
    -[ISTouchIDDialog _parseDialogDictionary:](v6, "_parseDialogDictionary:", v4);
  }

  return v6;
}

- (void)_init
{
  NSLock *v3;
  NSLock *lock;

  self->_isDualAction = 0;
  v3 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
  lock = self->_lock;
  self->_lock = v3;

}

- (NSString)fallbackExplanation
{
  void *v3;

  -[NSLock lock](self->_lock, "lock");
  -[SSPaymentSheet explanation](self->_paymentSheet, "explanation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (NSString)fallbackMessage
{
  void *v3;

  -[NSLock lock](self->_lock, "lock");
  -[SSPaymentSheet message](self->_paymentSheet, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (void)setFallbackExplanation:(id)a3
{
  NSLock *lock;
  id v5;

  lock = self->_lock;
  v5 = a3;
  -[NSLock lock](lock, "lock");
  -[SSPaymentSheet setExplanation:](self->_paymentSheet, "setExplanation:", v5);

  -[NSLock unlock](self->_lock, "unlock");
}

- (void)setFallbackMessage:(id)a3
{
  NSLock *lock;
  id v5;

  lock = self->_lock;
  v5 = a3;
  -[NSLock lock](lock, "lock");
  -[SSPaymentSheet setMessage:](self->_paymentSheet, "setMessage:", v5);

  -[NSLock unlock](self->_lock, "unlock");
}

- (id)buttonForButtonType:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ISDialog buttons](self, "buttons", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "buttonType") == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)_parseDialogDictionary:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  ISTouchIDDialogButton *v14;
  void *v15;
  void *v16;
  ISTouchIDDialogButton *v17;
  void *v18;
  id v19;
  ISTouchIDDialogButton *v20;
  SSPaymentSheet *v21;
  void *paymentSheet;
  void *v23;
  SSPaymentSheet *v24;
  SSPaymentSheet *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  int v32;
  NSObject *v33;
  int v34;
  void *v35;
  id v36;
  SSPaymentSheet *v37;
  int v38;
  int v39;
  int v40;
  int v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  id v47;
  int v48;
  void *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)MEMORY[0x24BEB1F70];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithDictionary:", v5);

  objc_msgSend(v6, "dictionaryByEvaluatingConditions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("explanation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[ISTouchIDDialog setBody:](self, "setBody:", v8);
  objc_msgSend(v7, "objectForKey:", CFSTR("isFree"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ISTouchIDDialog setIsFree:](self, "setIsFree:", objc_msgSend(v9, "BOOLValue"));
  objc_msgSend(v7, "objectForKey:", CFSTR("message"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[ISDialog setTitle:](self, "setTitle:", v10);
  objc_msgSend(v7, "objectForKey:", CFSTR("username"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[ISTouchIDDialog setUsername:](self, "setUsername:", v11);
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v7, "objectForKey:", CFSTR("cancelButtonString"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = objc_alloc_init(ISTouchIDDialogButton);
    -[ISTouchIDDialogButton setButtonType:](v14, "setButtonType:", 0);
    -[ISDialogButton setTitle:](v14, "setTitle:", v13);
    objc_msgSend(v7, "objectForKey:", CFSTR("cancelButtonAction"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ISDialogButton loadFromDictionary:](v14, "loadFromDictionary:", v15);
    objc_msgSend(v12, "addObject:", v14);

  }
  else
  {
    v15 = v13;
  }
  objc_msgSend(v7, "objectForKey:", CFSTR("passwordButtonString"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = objc_alloc_init(ISTouchIDDialogButton);
    -[ISTouchIDDialogButton setButtonType:](v17, "setButtonType:", 1);
    -[ISDialogButton setTitle:](v17, "setTitle:", v16);
    objc_msgSend(v7, "objectForKey:", CFSTR("passwordButtonAction"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ISDialogButton loadFromDictionary:](v17, "loadFromDictionary:", v18);
    objc_msgSend(v12, "addObject:", v17);

  }
  else
  {
    v18 = v16;
  }
  objc_msgSend(v7, "objectForKey:", CFSTR("touchIDButtonAction"));
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = objc_alloc_init(ISTouchIDDialogButton);
    -[ISTouchIDDialogButton setButtonType:](v20, "setButtonType:", 2);
    -[ISDialogButton loadFromDictionary:](v20, "loadFromDictionary:", v19);
    objc_msgSend(v12, "addObject:", v20);

  }
  -[ISDialog setButtons:](self, "setButtons:", v12);
  if (SSDebugShouldUseFileBasedPaymentSheetProxy())
  {
    +[ISBiometricStore diskBasedPaymentSheet](ISBiometricStore, "diskBasedPaymentSheet");
    v21 = (SSPaymentSheet *)objc_claimAutoreleasedReturnValue();
    paymentSheet = self->_paymentSheet;
    self->_paymentSheet = v21;
  }
  else
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("paymentSheetInfo"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_26;
    v19 = v23;
    -[ISDialog buyParams](self, "buyParams");
    paymentSheet = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (SSPaymentSheet *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F48]), "initWithServerResponse:buyParams:", v19, paymentSheet);

    v25 = self->_paymentSheet;
    self->_paymentSheet = v24;

  }
  v23 = v19;
LABEL_26:
  objc_msgSend(v7, "objectForKey:", CFSTR("applePayPaymentSession"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v26, 0);
    v47 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v27, 1, &v47);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v47;
    if (v46)
    {
      v45 = v27;
      v29 = v6;
      objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v30)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v31 = objc_msgSend(v30, "shouldLog");
      if (objc_msgSend(v30, "shouldLogToDisk"))
        v32 = v31 | 2;
      else
        v32 = v31;
      objc_msgSend(v30, "OSLogObject");
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        v34 = v32;
      else
        v34 = v32 & 2;
      if (!v34)
        goto LABEL_61;
      v35 = (void *)objc_opt_class();
      v48 = 138543618;
      v49 = v35;
      v50 = 2114;
      v51 = v46;
      v36 = v35;
      LODWORD(v44) = 22;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v37 = self->_paymentSheet;
        if (v37)
        {
          -[SSPaymentSheet setMerchantSession:](v37, "setMerchantSession:", v28);
          self->_isDualAction = 1;
LABEL_63:

          goto LABEL_64;
        }
        v45 = v27;
        v29 = v6;
        objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v30)
        {
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v40 = objc_msgSend(v30, "shouldLog");
        if (objc_msgSend(v30, "shouldLogToDisk"))
          v40 |= 2u;
        objc_msgSend(v30, "OSLogObject");
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          v41 = v40;
        else
          v41 = v40 & 2;
        if (!v41)
          goto LABEL_61;
      }
      else
      {
        v45 = v27;
        v29 = v6;
        objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v30)
        {
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v38 = objc_msgSend(v30, "shouldLog");
        if (objc_msgSend(v30, "shouldLogToDisk"))
          v38 |= 2u;
        objc_msgSend(v30, "OSLogObject");
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          v39 = v38;
        else
          v39 = v38 & 2;
        if (!v39)
          goto LABEL_61;
      }
      v42 = (void *)objc_opt_class();
      v48 = 138543362;
      v49 = v42;
      v36 = v42;
      LODWORD(v44) = 12;
    }
    v43 = (void *)_os_log_send_and_compose_impl();

    if (!v43)
    {
LABEL_62:

      v6 = v29;
      v27 = v45;
      goto LABEL_63;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v43, 4, &v48, v44);
    v33 = objc_claimAutoreleasedReturnValue();
    free(v43);
    SSFileLog();
LABEL_61:

    goto LABEL_62;
  }
LABEL_64:

}

- (id)paymentSheet
{
  return objc_getProperty(self, a2, 184, 1);
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (BOOL)isDualAction
{
  return self->_isDualAction;
}

- (BOOL)isFree
{
  return self->_isFree;
}

- (void)setIsFree:(BOOL)a3
{
  self->_isFree = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_paymentSheet, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
