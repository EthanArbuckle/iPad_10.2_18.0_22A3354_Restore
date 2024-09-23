@implementation WFProxyKeychainOperation

+ (id)removePasswordOperationForHost:(id)a3 port:(id)a4 username:(id)a5
{
  id v7;
  id v8;
  id v9;
  WFProxyKeychainOperation *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[WFProxyKeychainOperation initWithHost:port:username:password:type:]([WFProxyKeychainOperation alloc], "initWithHost:port:username:password:type:", v9, v8, v7, 0, 1);

  return v10;
}

+ (id)getPasswordOperationForHost:(id)a3 port:(id)a4 username:(id)a5
{
  id v7;
  id v8;
  id v9;
  WFProxyKeychainOperation *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[WFProxyKeychainOperation initWithHost:port:username:password:type:]([WFProxyKeychainOperation alloc], "initWithHost:port:username:password:type:", v9, v8, v7, 0, 0);

  return v10;
}

+ (id)savePassswordOperationForHost:(id)a3 port:(id)a4 username:(id)a5 password:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  WFProxyKeychainOperation *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[WFProxyKeychainOperation initWithHost:port:username:password:type:]([WFProxyKeychainOperation alloc], "initWithHost:port:username:password:type:", v12, v11, v10, v9, 1);

  return v13;
}

- (WFProxyKeychainOperation)initWithHost:(id)a3 port:(id)a4 username:(id)a5 password:(id)a6 type:(int64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  WFProxyKeychainOperation *v17;
  WFProxyKeychainOperation *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)WFProxyKeychainOperation;
  v17 = -[WFProxyKeychainOperation init](&v20, sel_init);
  v18 = v17;
  if (v17 && (objc_storeStrong((id *)&v17->_password, a6), v14) && v13 && v15)
  {
    objc_storeStrong((id *)&v18->_host, a3);
    objc_storeStrong((id *)&v18->_username, a5);
    objc_storeStrong((id *)&v18->_port, a4);
    v18->_type = a7;
  }
  else
  {

    v18 = 0;
  }

  return v18;
}

- (void)start
{
  void *v3;
  os_log_type_t v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  os_log_type_t v12;
  BOOL v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  os_log_type_t v42;
  const char *v43;
  void *v44;
  os_log_type_t v45;
  NSObject *v46;
  void *v47;
  os_log_type_t v48;
  const char *v49;
  NSObject *v50;
  os_log_type_t v51;
  void *v52;
  objc_super v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  int64_t v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v53.receiver = self;
  v53.super_class = (Class)WFProxyKeychainOperation;
  -[WFOperation start](&v53, sel_start);
  WFLogForCategory(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3)
  {
    v5 = v3;
    if (os_log_type_enabled(v5, v4))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[WFProxyKeychainOperation type](self, "type");
      *(_DWORD *)buf = 138412546;
      v55 = v7;
      v56 = 2048;
      v57 = v8;
      _os_log_impl(&dword_219FC8000, v5, v4, "Starting %@ with type %lu", buf, 0x16u);

    }
  }

  objc_msgSend(MEMORY[0x24BDB7488], "sharedCredentialStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    WFLogForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    v42 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v24 || !os_log_type_enabled(v24, v42))
      goto LABEL_78;
    *(_WORD *)buf = 0;
    v43 = "Failed to create NSURLCredentialStorage";
    goto LABEL_47;
  }
  if (!-[WFProxyKeychainOperation type](self, "type"))
  {
    v20 = objc_alloc(MEMORY[0x24BDB7490]);
    -[WFProxyKeychainOperation host](self, "host");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFProxyKeychainOperation port](self, "port");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "integerValue");
    v24 = objc_msgSend(v20, "initWithProxyHost:port:type:realm:authenticationMethod:", v21, v23, *MEMORY[0x24BDB7428], 0, *MEMORY[0x24BDB73E0]);

    if (v24)
    {
      objc_msgSend(v9, "credentialsForProtectionSpace:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFProxyKeychainOperation username](self, "username");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKey:", v26);
      v27 = objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        -[NSObject password](v27, "password");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFProxyKeychainOperation setPassword:](self, "setPassword:", v28);
LABEL_35:

        goto LABEL_36;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifikit.error"), 0, 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFOperation setError:](self, "setError:", v44);

      WFLogForCategory(0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v28)
      {
        v46 = v28;
        if (os_log_type_enabled(v46, v45))
        {
          -[WFProxyKeychainOperation username](self, "username");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v55 = v47;
          v56 = 2112;
          v57 = (int64_t)v25;
          _os_log_impl(&dword_219FC8000, v46, v45, "Unable to find credentials mapping for username %@ in mapping %@", buf, 0x16u);

        }
      }
LABEL_76:

      goto LABEL_77;
    }
    WFLogForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    v42 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v24 || !os_log_type_enabled(v24, v42))
      goto LABEL_78;
    *(_WORD *)buf = 0;
    v43 = "Failed to create HTTP NSURLProtectionSpace";
LABEL_47:
    _os_log_impl(&dword_219FC8000, v24, v42, v43, buf, 2u);
LABEL_78:

    -[WFOperation error](self, "error");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
      goto LABEL_38;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifikit.error"), 1, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    -[WFOperation setError:](self, "setError:", v24);
    goto LABEL_37;
  }
  if (-[WFProxyKeychainOperation type](self, "type") == 1)
  {
    -[WFProxyKeychainOperation password](self, "password");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    WFLogForCategory(0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel())
      v13 = v11 == 0;
    else
      v13 = 1;
    v14 = !v13;
    if (v10)
    {
      if (!v14)
        goto LABEL_27;
      v15 = v11;
      if (!os_log_type_enabled(v15, v12))
        goto LABEL_26;
      -[WFProxyKeychainOperation host](self, "host");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFProxyKeychainOperation port](self, "port");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFProxyKeychainOperation username](self, "username");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v55 = v16;
      v56 = 2112;
      v57 = (int64_t)v17;
      v58 = 2112;
      v59 = v18;
      v19 = "Updating password for host: %@ port: %@ username: %@";
    }
    else
    {
      if (!v14)
        goto LABEL_27;
      v15 = v11;
      if (!os_log_type_enabled(v15, v12))
      {
LABEL_26:

LABEL_27:
        v29 = objc_alloc(MEMORY[0x24BDB7490]);
        -[WFProxyKeychainOperation host](self, "host");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFProxyKeychainOperation port](self, "port");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "integerValue");
        v33 = *MEMORY[0x24BDB73E0];
        v24 = objc_msgSend(v29, "initWithProxyHost:port:type:realm:authenticationMethod:", v30, v32, *MEMORY[0x24BDB7428], 0, *MEMORY[0x24BDB73E0]);

        v34 = objc_alloc(MEMORY[0x24BDB7490]);
        -[WFProxyKeychainOperation host](self, "host");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFProxyKeychainOperation port](self, "port");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "integerValue");
        v25 = (void *)objc_msgSend(v34, "initWithProxyHost:port:type:realm:authenticationMethod:", v35, v37, *MEMORY[0x24BDB7430], 0, v33);

        if (!v24)
        {
          WFLogForCategory(0);
          v27 = objc_claimAutoreleasedReturnValue();
          v48 = OSLogForWFLogLevel(1uLL);
          if (!WFCurrentLogLevel() || !v27 || !os_log_type_enabled(v27, v48))
            goto LABEL_77;
          *(_WORD *)buf = 0;
          v49 = "Failed to create HTTP NSURLProtectionSpace";
          goto LABEL_65;
        }
        if (!v25)
        {
          WFLogForCategory(0);
          v27 = objc_claimAutoreleasedReturnValue();
          v48 = OSLogForWFLogLevel(1uLL);
          if (!WFCurrentLogLevel() || !v27 || !os_log_type_enabled(v27, v48))
            goto LABEL_77;
          *(_WORD *)buf = 0;
          v49 = "Failed to create HTTPS NSURLProtectionSpace";
          goto LABEL_65;
        }
        if (v10)
        {
          v38 = (void *)MEMORY[0x24BDB7480];
          -[WFProxyKeychainOperation username](self, "username");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFProxyKeychainOperation password](self, "password");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "credentialWithUser:password:persistence:", v39, v40, 2);
          v27 = objc_claimAutoreleasedReturnValue();

          if (v27)
          {
            objc_msgSend(v9, "setCredential:forProtectionSpace:", v27, v24);
            objc_msgSend(v9, "setCredential:forProtectionSpace:", v27, v25);
LABEL_36:

LABEL_37:
            goto LABEL_38;
          }
          WFLogForCategory(0);
          v27 = objc_claimAutoreleasedReturnValue();
          v48 = OSLogForWFLogLevel(1uLL);
          if (!WFCurrentLogLevel() || !v27 || !os_log_type_enabled(v27, v48))
            goto LABEL_77;
          *(_WORD *)buf = 0;
          v49 = "Failed to create HSURLCredentials for proxy";
LABEL_65:
          _os_log_impl(&dword_219FC8000, v27, v48, v49, buf, 2u);
LABEL_77:

          goto LABEL_78;
        }
        -[WFProxyKeychainOperation _credentialsForProtectionSpace:](self, "_credentialsForProtectionSpace:", v24);
        v27 = objc_claimAutoreleasedReturnValue();
        -[WFProxyKeychainOperation _credentialsForProtectionSpace:](self, "_credentialsForProtectionSpace:", v25);
        v41 = objc_claimAutoreleasedReturnValue();
        v28 = (void *)v41;
        if (v27)
        {
          if (v41)
          {
            objc_msgSend(v9, "removeCredential:forProtectionSpace:", v27, v24);
            objc_msgSend(v9, "removeCredential:forProtectionSpace:", v28, v25);
            goto LABEL_35;
          }
          WFLogForCategory(0);
          v50 = objc_claimAutoreleasedReturnValue();
          v51 = OSLogForWFLogLevel(1uLL);
          if (!WFCurrentLogLevel() || !v50 || !os_log_type_enabled(v50, v51))
            goto LABEL_75;
          *(_WORD *)buf = 0;
        }
        else
        {
          WFLogForCategory(0);
          v50 = objc_claimAutoreleasedReturnValue();
          v51 = OSLogForWFLogLevel(1uLL);
          if (!WFCurrentLogLevel() || !v50 || !os_log_type_enabled(v50, v51))
            goto LABEL_75;
          *(_WORD *)buf = 0;
        }
        _os_log_impl(&dword_219FC8000, v50, v51, "Failed to create HSURLCredentials for proxy", buf, 2u);
LABEL_75:

        goto LABEL_76;
      }
      -[WFProxyKeychainOperation host](self, "host");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFProxyKeychainOperation port](self, "port");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFProxyKeychainOperation username](self, "username");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v55 = v16;
      v56 = 2112;
      v57 = (int64_t)v17;
      v58 = 2112;
      v59 = v18;
      v19 = "Removing password for host: %@ port: %@ username: %@";
    }
    _os_log_impl(&dword_219FC8000, v15, v12, v19, buf, 0x20u);

    goto LABEL_26;
  }
LABEL_38:
  -[WFOperation finish](self, "finish");

}

- (id)_credentialsForProtectionSpace:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x24BDB7488];
  v5 = a3;
  objc_msgSend(v4, "sharedCredentialStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "credentialsForProtectionSpace:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFProxyKeychainOperation username](self, "username");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSString)port
{
  return self->_port;
}

- (void)setPort:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_password, 0);
}

@end
