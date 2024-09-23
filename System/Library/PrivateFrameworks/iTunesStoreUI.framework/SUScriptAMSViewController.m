@implementation SUScriptAMSViewController

- (SUScriptAMSViewController)initWithPrimaryAccount:(id)a3
{
  id v5;
  SUScriptAMSViewController *v6;
  SUScriptAMSViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUScriptAMSViewController;
  v6 = -[SUScriptObject init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_primaryAccount, a3);

  return v7;
}

- (id)newNativeViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *DSID;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  NSObject *v19;
  void *v20;
  NSString *v21;
  id v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  NSObject *v27;
  void *v28;
  NSString *URL;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v36;
  uint64_t v37;
  _BYTE v38[24];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  -[SUScriptObject lock](self, "lock");
  -[objc_class bagSubProfile](getAMSUIWebViewControllerClass(), "bagSubProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class bagSubProfileVersion](getAMSUIWebViewControllerClass(), "bagSubProfileVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BE08060];
  -[objc_class bagKeySet](getAMSUIWebViewControllerClass(), "bagKeySet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerBagKeySet:forProfile:profileVersion:", v6, v3, v4);

  objc_msgSend(MEMORY[0x24BE08050], "bagForProfile:profileVersion:", v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  DSID = self->_DSID;
  if (!DSID)
    goto LABEL_31;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[NSString integerValue](DSID, "integerValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ams_iTunesAccountWithDSID:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_31:
    -[SUScriptAMSViewController primaryAccount](self, "primaryAccount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "account");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14
      || (objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v15, "ams_iTunesAccountWithDSID:", v14),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v15,
          v14,
          !v11))
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v17 = objc_msgSend(v16, "shouldLog");
      if (objc_msgSend(v16, "shouldLogToDisk"))
        v18 = v17 | 2;
      else
        v18 = v17;
      objc_msgSend(v16, "OSLogObject");
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        v18 &= 2u;
      if (v18)
      {
        v20 = (void *)objc_opt_class();
        v21 = self->_DSID;
        *(_DWORD *)v38 = 138543618;
        *(_QWORD *)&v38[4] = v20;
        *(_WORD *)&v38[12] = 2112;
        *(_QWORD *)&v38[14] = v21;
        v22 = v20;
        LODWORD(v37) = 22;
        v36 = v38;
        v23 = (void *)_os_log_send_and_compose_impl();

        if (!v23)
        {
LABEL_16:

          v11 = 0;
          goto LABEL_17;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v23, 4, v38, v37, *(_OWORD *)v38, *(_QWORD *)&v38[16]);
        v19 = objc_claimAutoreleasedReturnValue();
        free(v23);
        v36 = v19;
        SSFileLog();
      }

      goto LABEL_16;
    }
  }
LABEL_17:
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig", v36);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25 = objc_msgSend(v24, "shouldLog");
  if (objc_msgSend(v24, "shouldLogToDisk"))
    v26 = v25 | 2;
  else
    v26 = v25;
  objc_msgSend(v24, "OSLogObject");
  v27 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    v26 &= 2u;
  if (!v26)
    goto LABEL_27;
  v28 = (void *)objc_opt_class();
  URL = self->_URL;
  *(_DWORD *)v38 = 138543874;
  *(_QWORD *)&v38[4] = v28;
  *(_WORD *)&v38[12] = 2112;
  *(_QWORD *)&v38[14] = URL;
  *(_WORD *)&v38[22] = 2112;
  v39 = v11;
  v30 = v28;
  LODWORD(v37) = 32;
  v31 = (void *)_os_log_send_and_compose_impl();

  if (v31)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v31, 4, v38, v37);
    v27 = objc_claimAutoreleasedReturnValue();
    free(v31);
    SSFileLog();
LABEL_27:

  }
  v32 = (void *)objc_msgSend(objc_alloc(getAMSUIWebViewControllerClass()), "initWithBag:account:clientInfo:", v7, v11, 0);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", self->_URL);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (id)objc_msgSend(v32, "loadURL:", v33);

  -[SUScriptObject unlock](self, "unlock");
  return v32;
}

- (id)_className
{
  return CFSTR("iTunesAMSViewController");
}

- (NSString)DSID
{
  NSString *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_DSID;
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (void)setDSID:(id)a3
{
  NSString *v4;
  NSString *DSID;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v6 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SUScriptObject lock](self, "lock");
    v4 = (NSString *)objc_msgSend(v6, "copy");
    DSID = self->_DSID;
    self->_DSID = v4;

    -[SUScriptObject unlock](self, "unlock");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }

}

- (void)setURL:(id)a3
{
  NSString *v4;
  NSString *URL;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v6 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SUScriptObject lock](self, "lock");
    v4 = (NSString *)objc_msgSend(v6, "copy");
    URL = self->_URL;
    self->_URL = v4;

    -[SUScriptObject unlock](self, "unlock");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }

}

- (NSString)URL
{
  NSString *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_URL;
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  objc_msgSend((id)__KeyMapping_81, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptAMSViewController;
    objc_msgSendSuper2(&v7, sel_webScriptNameForKeyName_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  void *v5;
  objc_super v7;

  SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_61, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptAMSViewController;
    objc_msgSendSuper2(&v7, sel_webScriptNameForSelector_, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)scriptAttributeKeys
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUScriptAMSViewController;
  -[SUScriptViewController scriptAttributeKeys](&v5, sel_scriptAttributeKeys);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__KeyMapping_81, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  return v2;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("DSID"), CFSTR("URL"), CFSTR("URL"), 0);
    v3 = (void *)__KeyMapping_81;
    __KeyMapping_81 = v2;

  }
}

- (SUScriptAccount)primaryAccount
{
  return self->_primaryAccount;
}

- (void)setPrimaryAccount:(id)a3
{
  objc_storeStrong((id *)&self->_primaryAccount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryAccount, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_DSID, 0);
}

@end
