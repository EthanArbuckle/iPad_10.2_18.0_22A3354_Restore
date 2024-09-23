@implementation WFCredentialsContext

- (WFCredentialsContext)initWithNetwork:(id)a3 profile:(id)a4 authTraits:(int64_t)a5
{
  id v9;
  id v10;
  WFCredentialsContext *v11;
  WFCredentialsContext *v12;
  _BOOL4 v13;
  NSObject *v14;
  os_log_type_t v15;
  void *v16;
  void *v17;
  NSObject *p_super;
  os_log_type_t v19;
  void *v20;
  os_log_type_t v21;
  NSObject *v22;
  uint64_t v23;
  NSArray *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  void *v28;
  os_log_type_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t requestedFields;
  uint64_t v33;
  WFHealthIssue *securityIssue;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v40;
  os_log_type_t v41;
  const char *v42;
  OSStatus v43;
  objc_super v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v44.receiver = self;
  v44.super_class = (Class)WFCredentialsContext;
  v11 = -[WFCredentialsContext init](&v44, sel_init);
  v12 = v11;
  if (!v11)
  {
    v38 = 0;
    goto LABEL_41;
  }
  if (!v9)
  {
    WFLogForCategory(0);
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v40 || !os_log_type_enabled(v40, v41))
      goto LABEL_52;
    *(_DWORD *)buf = 136315138;
    v46 = "-[WFCredentialsContext initWithNetwork:profile:authTraits:]";
    v42 = "%s: nil network";
    goto LABEL_51;
  }
  if (!v10)
  {
    WFLogForCategory(0);
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v40 || !os_log_type_enabled(v40, v41))
      goto LABEL_52;
    *(_DWORD *)buf = 136315138;
    v46 = "-[WFCredentialsContext initWithNetwork:profile:authTraits:]";
    v42 = "%s: nil profile";
LABEL_51:
    _os_log_impl(&dword_219FC8000, v40, v41, v42, buf, 0xCu);
LABEL_52:

    v38 = v12;
    v12 = 0;
    goto LABEL_41;
  }
  objc_storeStrong((id *)&v11->_network, a3);
  v13 = -[WFNetworkScanRecord isEnterprise](v12->_network, "isEnterprise");
  v12->_enterprise = v13;
  v12->_availableAuthTraits = a5;
  if (v13)
  {
    v12->_requestedFields |= 2uLL;
    if (objc_msgSend(v10, "isManaged"))
    {
      WFLogForCategory(0);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v15))
      {
        *(_DWORD *)buf = 136315394;
        v46 = "-[WFCredentialsContext initWithNetwork:profile:authTraits:]";
        v47 = 2112;
        v48 = (uint64_t)v10;
        _os_log_impl(&dword_219FC8000, v14, v15, "%s: network (profile %@) is managed", buf, 0x16u);
      }

    }
    v43 = 0;
    WFAllIdentities(&v43);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v43 || !objc_msgSend(v16, "count"))
    {
      WFLogForCategory(0);
      p_super = objc_claimAutoreleasedReturnValue();
      v19 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && p_super && os_log_type_enabled(p_super, v19))
      {
        *(_DWORD *)buf = 136315394;
        v46 = "-[WFCredentialsContext initWithNetwork:profile:authTraits:]";
        v47 = 1024;
        LODWORD(v48) = v43;
        _os_log_impl(&dword_219FC8000, p_super, v19, "%s: error retrieving identities %d", buf, 0x12u);
      }
    }
    else
    {
      WFLogForCategory(0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v20)
      {
        v22 = v20;
        if (os_log_type_enabled(v22, v21))
        {
          v23 = objc_msgSend(v17, "count");
          *(_DWORD *)buf = 136315394;
          v46 = "-[WFCredentialsContext initWithNetwork:profile:authTraits:]";
          v47 = 2048;
          v48 = v23;
          _os_log_impl(&dword_219FC8000, v22, v21, "%s: available TLS identities %lu", buf, 0x16u);
        }

      }
      v24 = v17;
      p_super = &v12->_availableTLSIdentities->super;
      v12->_availableTLSIdentities = v24;
    }

    if (objc_msgSend(v10, "requiresTLSIdentityOnly"))
    {
      WFLogForCategory(0);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v25 && os_log_type_enabled(v25, v26))
      {
        *(_DWORD *)buf = 136315394;
        v46 = "-[WFCredentialsContext initWithNetwork:profile:authTraits:]";
        v47 = 2112;
        v48 = (uint64_t)v10;
        _os_log_impl(&dword_219FC8000, v25, v26, "%s: network (profile %@) is TLS identity only", buf, 0x16u);
      }

      v27 = v12->_requestedFields | 4;
    }
    else
    {
      if (v12->_availableTLSIdentities)
      {
        WFLogForCategory(0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = OSLogForWFLogLevel(4uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 4 && v28)
        {
          v30 = v28;
          if (os_log_type_enabled(v30, v29))
          {
            v31 = -[NSArray count](v12->_availableTLSIdentities, "count");
            *(_DWORD *)buf = 136315394;
            v46 = "-[WFCredentialsContext initWithNetwork:profile:authTraits:]";
            v47 = 2048;
            v48 = v31;
            _os_log_impl(&dword_219FC8000, v30, v29, "%s: available TLS identities %lu", buf, 0x16u);
          }

        }
        requestedFields = v12->_requestedFields | 0xC;
      }
      else
      {
        requestedFields = v12->_requestedFields;
      }
      v27 = requestedFields | 1;
    }
    v12->_requestedFields = v27;

  }
  else
  {
    v12->_requestedFields = 1;
  }
  objc_msgSend(v9, "securityIssue");
  v33 = objc_claimAutoreleasedReturnValue();
  securityIssue = v12->_securityIssue;
  v12->_securityIssue = (WFHealthIssue *)v33;

  objc_storeStrong((id *)&v12->_profile, a4);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addObserver:selector:name:object:", v12, sel_appWillResignActive_, *MEMORY[0x24BDF75D8], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addObserver:selector:name:object:", v12, sel_appDidBecomeActive_, *MEMORY[0x24BDF7510], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObserver:selector:name:object:", v12, sel_appWillEnterForeground_, *MEMORY[0x24BDF75D0], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addObserver:selector:name:object:", v12, sel_appDidEnterBackground_, *MEMORY[0x24BDF7528], 0);
LABEL_41:

  return v12;
}

- (WFCredentialsContext)initWithNetwork:(id)a3 profile:(id)a4
{
  return -[WFCredentialsContext initWithNetwork:profile:authTraits:](self, "initWithNetwork:profile:authTraits:", a3, a4, 0);
}

- (void)setProvider:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    v7 = 136315394;
    v8 = "-[WFCredentialsContext setProvider:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_219FC8000, v5, v6, "%s: provider %@", (uint8_t *)&v7, 0x16u);
  }

  objc_storeWeak((id *)&self->_provider, v4);
}

- (void)setPasswordSharingSupported:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  os_log_type_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  self->_passwordSharingSupported = a3;
  self->_shouldReactivatePasswordSharing = a3;
  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    v6 = 136315394;
    v7 = "-[WFCredentialsContext setPasswordSharingSupported:]";
    v8 = 1024;
    v9 = v3;
    _os_log_impl(&dword_219FC8000, v4, v5, "%s: supported %d", (uint8_t *)&v6, 0x12u);
  }

}

- (void)finishWithError:(id)a3 forNetwork:(id)a4 profile:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  WFCredentialsContext *v10;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__WFCredentialsContext_finishWithError_forNetwork_profile___block_invoke;
  v8[3] = &unk_24DC34BE8;
  v9 = v6;
  v10 = self;
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

void __59__WFCredentialsContext_finishWithError_forNetwork_profile___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  char v10;
  void *v11;
  os_log_type_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v2 && os_log_type_enabled(v2, v3))
  {
    v4 = *(void **)(a1 + 32);
    v19 = 136315394;
    v20 = "-[WFCredentialsContext finishWithError:forNetwork:profile:]_block_invoke";
    v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_219FC8000, v2, v3, "%s: error %@", (uint8_t *)&v19, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "providerCallback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    WFLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v6 && os_log_type_enabled(v6, v7))
    {
      v19 = 136315138;
      v20 = "-[WFCredentialsContext finishWithError:forNetwork:profile:]_block_invoke";
      _os_log_impl(&dword_219FC8000, v6, v7, "%s: calling provider callback", (uint8_t *)&v19, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "providerCallback");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, BOOL))v8)[2](v8, *(_QWORD *)(a1 + 32) == 0);

    objc_msgSend(*(id *)(a1 + 40), "setProviderCallback:", 0);
  }
  objc_msgSend(*(id *)(a1 + 40), "provider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    WFLogForCategory(0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v11)
    {
      v13 = v11;
      if (os_log_type_enabled(v13, v12))
      {
        objc_msgSend(*(id *)(a1 + 40), "provider");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 136315394;
        v20 = "-[WFCredentialsContext finishWithError:forNetwork:profile:]_block_invoke";
        v21 = 2112;
        v22 = v14;
        _os_log_impl(&dword_219FC8000, v13, v12, "%s: calling resetFirstResponder on provider %@", (uint8_t *)&v19, 0x16u);

      }
    }

    objc_msgSend(*(id *)(a1 + 40), "provider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "resetFirstResponder");

  }
  objc_msgSend(*(id *)(a1 + 40), "provider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "provider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setActivityString:", 0);

  }
}

- (void)finishWithError:(id)a3
{
  -[WFCredentialsContext finishWithError:forNetwork:profile:](self, "finishWithError:forNetwork:profile:", a3, 0, 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[WFCredentialsContext deactivatePasswordSharingWithReactivation:](self, "deactivatePasswordSharingWithReactivation:", 0);
  v4.receiver = self;
  v4.super_class = (Class)WFCredentialsContext;
  -[WFCredentialsContext dealloc](&v4, sel_dealloc);
}

- (BOOL)validateCredentials
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  void *v9;
  os_log_type_t v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  BOOL result;
  NSObject *v15;
  os_log_type_t v16;
  os_log_type_t v17;
  int v18;
  const char *v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[WFCredentialsContext provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "TLSIdentity");

  -[WFCredentialsContext provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  v8 = -[WFCredentialsContext validatePassword](self, "validatePassword");
  WFLogForCategory(0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v9)
  {
    v11 = v9;
    if (os_log_type_enabled(v11, v10))
    {
      -[WFCredentialsContext network](self, "network");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 136316162;
      v19 = "-[WFCredentialsContext validateCredentials]";
      v20 = 1024;
      v21 = v4 != 0;
      v22 = 1024;
      v23 = v7 != 0;
      v24 = 1024;
      v25 = v8;
      v26 = 2048;
      v27 = objc_msgSend(v12, "securityMode");
      _os_log_impl(&dword_219FC8000, v11, v10, "%s: identityValid %d usernameValid %d passwordValid %d (securityMode %ld)", (uint8_t *)&v18, 0x28u);

    }
  }

  if (!-[WFCredentialsContext isEnterprise](self, "isEnterprise"))
  {
    WFLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v15 && os_log_type_enabled(v15, v16))
    {
      v18 = 136315394;
      v19 = "-[WFCredentialsContext validateCredentials]";
      v20 = 1024;
      v21 = v8;
      _os_log_impl(&dword_219FC8000, v15, v16, "%s: passwordValid: %d", (uint8_t *)&v18, 0x12u);
    }
    goto LABEL_22;
  }
  if (v7)
    v13 = v8;
  else
    v13 = 0;
  result = 1;
  if (!v4 && !v13)
  {
    WFLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    v17 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v15 && os_log_type_enabled(v15, v17))
    {
      v18 = 136315906;
      v19 = "-[WFCredentialsContext validateCredentials]";
      v20 = 1024;
      v21 = v8;
      v22 = 1024;
      v23 = v7 != 0;
      v24 = 1024;
      v25 = v8;
      _os_log_impl(&dword_219FC8000, v15, v17, "%s: enterprise network - identityValid: %d userNameValid: %d passwordValid %d", (uint8_t *)&v18, 0x1Eu);
    }
    LOBYTE(v8) = 0;
LABEL_22:

    return v8;
  }
  return result;
}

- (NSString)username
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WFCredentialsContext profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "username");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFCredentialsContext profile](self, "profile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "username");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (BOOL)validatePassword
{
  int64_t v3;
  void *v4;
  void *v5;

  v3 = -[WFCredentialsContext securityMode](self, "securityMode");
  -[WFCredentialsContext provider](self, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "password");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = WFValidPasswordForSecurityMode(v3, v5);

  return v3;
}

- (void)gatherCredentials:(id)a3
{
  id v4;
  void *v5;
  os_log_type_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  os_log_type_t v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5)
  {
    v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      -[WFCredentialsContext provider](self, "provider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315650;
      v14 = "-[WFCredentialsContext gatherCredentials:]";
      v15 = 2112;
      v16 = v8;
      v17 = 1024;
      v18 = v4 == 0;
      _os_log_impl(&dword_219FC8000, v7, v6, "%s: gathering credentials for %@ shouldDismiss %d", (uint8_t *)&v13, 0x1Cu);

    }
  }

  -[WFCredentialsContext providerCallback](self, "providerCallback");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v9)
  {
    WFLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v10 && os_log_type_enabled((os_log_t)v10, v11))
    {
      v13 = 136315138;
      v14 = "-[WFCredentialsContext gatherCredentials:]";
      _os_log_impl(&dword_219FC8000, (os_log_t)v10, v11, "%s: Called gatherCredentials while credentials are already being gathered", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    -[WFCredentialsContext setProviderCallback:](self, "setProviderCallback:", v4);
    -[WFCredentialsContext completionHandler](self, "completionHandler");
    v10 = objc_claimAutoreleasedReturnValue();
    -[WFCredentialsContext provider](self, "provider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, BOOL))(v10 + 16))(v10, v12, v4 == 0);

  }
}

- (void)cancel
{
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  os_log_type_t v6;
  NSObject *v7;
  WFCredentialsContext *v8;
  void *v9;
  void (**v10)(void);
  int v11;
  const char *v12;
  __int16 v13;
  WFCredentialsContext *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    v11 = 136315394;
    v12 = "-[WFCredentialsContext cancel]";
    v13 = 2112;
    v14 = self;
    _os_log_impl(&dword_219FC8000, v3, v4, "%s: %@ credentials provider is nil", (uint8_t *)&v11, 0x16u);
  }

  WFLogForCategory(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5)
  {
    v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      -[WFCredentialsContext provider](self, "provider");
      v8 = (WFCredentialsContext *)objc_claimAutoreleasedReturnValue();
      v11 = 136315394;
      v12 = "-[WFCredentialsContext cancel]";
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_219FC8000, v7, v6, "%s: cancelled credential request for %@", (uint8_t *)&v11, 0x16u);

    }
  }

  -[WFCredentialsContext cancellationHandler](self, "cancellationHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[WFCredentialsContext cancellationHandler](self, "cancellationHandler");
    v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v10[2]();

  }
  -[WFCredentialsContext deactivatePasswordSharingWithReactivation:](self, "deactivatePasswordSharingWithReactivation:", 0);
}

- (BOOL)needsDismissal
{
  return 1;
}

- (void)appWillEnterForeground:(id)a3
{
  NSObject *v4;
  os_log_type_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  WFCredentialsContext *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    v6 = 136315394;
    v7 = "-[WFCredentialsContext appWillEnterForeground:]";
    v8 = 2112;
    v9 = self;
    _os_log_impl(&dword_219FC8000, v4, v5, "%s: %@", (uint8_t *)&v6, 0x16u);
  }

  -[WFCredentialsContext activatePasswordSharing](self, "activatePasswordSharing");
}

- (void)appDidEnterBackground:(id)a3
{
  NSObject *v4;
  os_log_type_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  WFCredentialsContext *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    v6 = 136315394;
    v7 = "-[WFCredentialsContext appDidEnterBackground:]";
    v8 = 2112;
    v9 = self;
    _os_log_impl(&dword_219FC8000, v4, v5, "%s: %@", (uint8_t *)&v6, 0x16u);
  }

  -[WFCredentialsContext deactivatePasswordSharingWithReactivation:](self, "deactivatePasswordSharingWithReactivation:", 1);
}

- (void)appWillResignActive:(id)a3
{
  NSObject *v4;
  os_log_type_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  WFCredentialsContext *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    v6 = 136315394;
    v7 = "-[WFCredentialsContext appWillResignActive:]";
    v8 = 2112;
    v9 = self;
    _os_log_impl(&dword_219FC8000, v4, v5, "%s: %@", (uint8_t *)&v6, 0x16u);
  }

  -[WFCredentialsContext deactivatePasswordSharingWithReactivation:](self, "deactivatePasswordSharingWithReactivation:", 1);
}

- (void)appDidBecomeActive:(id)a3
{
  NSObject *v4;
  os_log_type_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  WFCredentialsContext *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    v6 = 136315394;
    v7 = "-[WFCredentialsContext appDidBecomeActive:]";
    v8 = 2112;
    v9 = self;
    _os_log_impl(&dword_219FC8000, v4, v5, "%s: %@", (uint8_t *)&v6, 0x16u);
  }

  -[WFCredentialsContext activatePasswordSharing](self, "activatePasswordSharing");
}

- (void)activatePasswordSharing
{
  void *v3;
  BOOL v4;
  NSObject *v5;
  os_log_type_t v6;
  BOOL v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  WFCredentialsContext *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (-[WFCredentialsContext isPasswordSharingSupported](self, "isPasswordSharingSupported"))
  {
    -[WFCredentialsContext passwordSharingService](self, "passwordSharingService");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v4 = -[WFCredentialsContext shouldReactivatePasswordSharing](self, "shouldReactivatePasswordSharing");
      WFLogForCategory(0);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel())
        v7 = v5 == 0;
      else
        v7 = 1;
      v8 = !v7;
      if (v4)
      {
        if (v8)
        {
          if (os_log_type_enabled(v5, v6))
          {
            v15 = 136315394;
            v16 = "-[WFCredentialsContext activatePasswordSharing]";
            v17 = 2112;
            v18 = self;
            _os_log_impl(&dword_219FC8000, v5, v6, "%s: %@", (uint8_t *)&v15, 0x16u);
          }
        }

        v9 = objc_alloc_init(MEMORY[0x24BE90178]);
        -[WFCredentialsContext setPasswordSharingService:](self, "setPasswordSharingService:", v9);

        -[WFCredentialsContext network](self, "network");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "ssid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFCredentialsContext passwordSharingService](self, "passwordSharingService");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setNetworkName:", v11);

        -[WFCredentialsContext passwordSharingService](self, "passwordSharingService");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setDelegate:", self);

        -[WFCredentialsContext passwordSharingService](self, "passwordSharingService");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "activate");

        -[WFCredentialsContext setShouldReactivatePasswordSharing:](self, "setShouldReactivatePasswordSharing:", 0);
      }
      else
      {
        if (v8 && os_log_type_enabled(v5, v6))
        {
          v15 = 136315138;
          v16 = "-[WFCredentialsContext activatePasswordSharing]";
          _os_log_impl(&dword_219FC8000, v5, v6, "%s: not reactivating password sharing", (uint8_t *)&v15, 0xCu);
        }

      }
    }
  }
}

- (void)deactivatePasswordSharingWithReactivation:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  WFCredentialsContext *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  if (-[WFCredentialsContext isPasswordSharingSupported](self, "isPasswordSharingSupported"))
  {
    -[WFCredentialsContext passwordSharingService](self, "passwordSharingService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      WFLogForCategory(0);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
      {
        v10 = 136315394;
        v11 = "-[WFCredentialsContext deactivatePasswordSharingWithReactivation:]";
        v12 = 2112;
        v13 = self;
        _os_log_impl(&dword_219FC8000, v6, v7, "%s: %@", (uint8_t *)&v10, 0x16u);
      }

      -[WFCredentialsContext passwordSharingService](self, "passwordSharingService");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setDelegate:", 0);

      -[WFCredentialsContext passwordSharingService](self, "passwordSharingService");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "invalidate");

      -[WFCredentialsContext setPasswordSharingService:](self, "setPasswordSharingService:", 0);
      if (v3)
        -[WFCredentialsContext setShouldReactivatePasswordSharing:](self, "setShouldReactivatePasswordSharing:", 1);
    }
  }
}

- (int64_t)securityMode
{
  void *v2;
  int64_t v3;

  -[WFCredentialsContext network](self, "network");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "securityMode");

  return v3;
}

- (void)launchSettings
{
  void *v3;
  os_log_type_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  WFCredentialsContext *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3)
  {
    v5 = v3;
    if (os_log_type_enabled(v5, v4))
    {
      -[WFCredentialsContext network](self, "network");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 136315650;
      v9 = "-[WFCredentialsContext launchSettings]";
      v10 = 2112;
      v11 = v6;
      v12 = 2112;
      v13 = self;
      _os_log_impl(&dword_219FC8000, v5, v4, "%s: opening settings for %@ (context: %@)", (uint8_t *)&v8, 0x20u);

    }
  }

  -[WFCredentialsContext network](self, "network");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WFScanRecordArchiveToEnterprisePath(v7);

  WFOpenSettingsURLWithType(2uLL);
  -[WFCredentialsContext cancel](self, "cancel");
}

- (void)service:(id)a3 receivedNetworkInfo:(id)a4
{
  id v5;
  void *v6;
  os_log_type_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  os_log_type_t v18;
  void *v19;
  os_log_type_t v20;
  void *v21;
  void *v22;
  os_log_type_t v23;
  int v24;
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  WFLogForCategory(0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v6)
  {
    v8 = v6;
    if (os_log_type_enabled(v8, v7))
    {
      objc_msgSend(v5, "networkName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 136315394;
      v25 = "-[WFCredentialsContext service:receivedNetworkInfo:]";
      v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_219FC8000, v8, v7, "%s: received network info for network='%@'", (uint8_t *)&v24, 0x16u);

    }
  }

  -[WFCredentialsContext network](self, "network");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCredentialsContext provider](self, "provider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) == 0)
  {
    WFLogForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    v18 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v16)
      goto LABEL_12;
    v16 = v16;
    if (os_log_type_enabled(v16, v18))
    {
      -[WFCredentialsContext provider](self, "provider");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 136315394;
      v25 = "-[WFCredentialsContext service:receivedNetworkInfo:]";
      v26 = 2112;
      v27 = v19;
      _os_log_impl(&dword_219FC8000, v16, v18, "%s: provider (%@) doesn't support password sharing callback", (uint8_t *)&v24, 0x16u);

    }
LABEL_21:

    goto LABEL_12;
  }
  objc_msgSend(v5, "networkName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ssid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqualToString:", v14);

  if ((v15 & 1) == 0)
  {
    WFLogForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    v20 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v16)
      goto LABEL_12;
    v16 = v16;
    if (os_log_type_enabled(v16, v20))
    {
      objc_msgSend(v10, "ssid");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "networkName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 136315650;
      v25 = "-[WFCredentialsContext service:receivedNetworkInfo:]";
      v26 = 2112;
      v27 = v21;
      v28 = 2112;
      v29 = v22;
      _os_log_impl(&dword_219FC8000, v16, v20, "%s: ssid mismatch, expected %@ received %@", (uint8_t *)&v24, 0x20u);

    }
    goto LABEL_21;
  }
  if (objc_msgSend(v10, "securityMode") == 4
    || objc_msgSend(v10, "securityMode") == 8
    || objc_msgSend(v10, "securityMode") == 512)
  {
    -[WFCredentialsContext setPasswordReceivedFromPasswordSharing:](self, "setPasswordReceivedFromPasswordSharing:", 1);
    -[WFCredentialsContext provider](self, "provider");
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "psk");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject receiveSharedPassword:](v16, "receiveSharedPassword:", v17);

  }
  else
  {
    WFLogForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    v23 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v16 && os_log_type_enabled(v16, v23))
    {
      v24 = 136315394;
      v25 = "-[WFCredentialsContext service:receivedNetworkInfo:]";
      v26 = 2112;
      v27 = v10;
      _os_log_impl(&dword_219FC8000, v16, v23, "%s: Invalid security type for network %@", (uint8_t *)&v24, 0x16u);
    }
  }
LABEL_12:

}

- (BOOL)service:(id)a3 shouldPromptForNetwork:(id)a4
{
  return 0;
}

- (WFNetworkView)provider
{
  return (WFNetworkView *)objc_loadWeakRetained((id *)&self->_provider);
}

- (BOOL)isEnterprise
{
  return self->_enterprise;
}

- (void)setEnterprise:(BOOL)a3
{
  self->_enterprise = a3;
}

- (int64_t)availableAuthTraits
{
  return self->_availableAuthTraits;
}

- (void)setAvailableAuthTraits:(int64_t)a3
{
  self->_availableAuthTraits = a3;
}

- (BOOL)isPasswordSharingSupported
{
  return self->_passwordSharingSupported;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)cancellationHandler
{
  return self->_cancellationHandler;
}

- (void)setCancellationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (WFNetworkProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (WFNetworkScanRecord)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
  objc_storeStrong((id *)&self->_network, a3);
}

- (int64_t)requestedFields
{
  return self->_requestedFields;
}

- (void)setRequestedFields:(int64_t)a3
{
  self->_requestedFields = a3;
}

- (id)providerCallback
{
  return self->_providerCallback;
}

- (void)setProviderCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)availableTLSIdentities
{
  return self->_availableTLSIdentities;
}

- (void)setAvailableTLSIdentities:(id)a3
{
  objc_storeStrong((id *)&self->_availableTLSIdentities, a3);
}

- (SFPasswordSharingService)passwordSharingService
{
  return self->_passwordSharingService;
}

- (void)setPasswordSharingService:(id)a3
{
  objc_storeStrong((id *)&self->_passwordSharingService, a3);
}

- (BOOL)shouldReactivatePasswordSharing
{
  return self->_shouldReactivatePasswordSharing;
}

- (void)setShouldReactivatePasswordSharing:(BOOL)a3
{
  self->_shouldReactivatePasswordSharing = a3;
}

- (WFHealthIssue)securityIssue
{
  return self->_securityIssue;
}

- (void)setSecurityIssue:(id)a3
{
  objc_storeStrong((id *)&self->_securityIssue, a3);
}

- (BOOL)passwordReceivedFromPasswordSharing
{
  return self->_passwordReceivedFromPasswordSharing;
}

- (void)setPasswordReceivedFromPasswordSharing:(BOOL)a3
{
  self->_passwordReceivedFromPasswordSharing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_securityIssue, 0);
  objc_storeStrong((id *)&self->_passwordSharingService, 0);
  objc_storeStrong((id *)&self->_availableTLSIdentities, 0);
  objc_storeStrong(&self->_providerCallback, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong(&self->_cancellationHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_provider);
}

@end
