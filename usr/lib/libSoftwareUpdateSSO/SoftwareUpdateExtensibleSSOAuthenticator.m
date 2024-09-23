@implementation SoftwareUpdateExtensibleSSOAuthenticator

- (id)copyQueryItemsWithParameters:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);
  void *v12;
  id v13;
  id v14;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __73__SoftwareUpdateExtensibleSSOAuthenticator_copyQueryItemsWithParameters___block_invoke_2;
  v12 = &unk_24DDD7998;
  v13 = v5;
  v14 = &__block_literal_global;
  v6 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v9);

  v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12);
  return v7;
}

void __73__SoftwareUpdateExtensibleSSOAuthenticator_copyQueryItemsWithParameters___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v9, "addObject:", v8);

  }
}

uint64_t __73__SoftwareUpdateExtensibleSSOAuthenticator_copyQueryItemsWithParameters___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2, a3);
}

- (void)authenticate
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  void *v28;
  int v29;
  NSObject *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  uint8_t buf[4];
  NSObject *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  SoftwareUpdateSSOlogInfo();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AC5E000, v3, OS_LOG_TYPE_DEFAULT, "Authenticating with AuthenticationServices.\n", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SoftwareUpdateExtensibleSSOAuthenticator appIdentifier](self, "appIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("applicationIdentifier"));

  -[SoftwareUpdateExtensibleSSOAuthenticator envIdentifier](self, "envIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("environmentIdentifier"));

  -[SoftwareUpdateExtensibleSSOAuthenticator username](self, "username");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("username"));

  -[SoftwareUpdateExtensibleSSOAuthenticator interactivity](self, "interactivity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("interactivity"));

  -[SoftwareUpdateExtensibleSSOAuthenticator otherParameters](self, "otherParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x24BDD1808]);
    -[SoftwareUpdateExtensibleSSOAuthenticator otherParameters](self, "otherParameters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SoftwareUpdateExtensibleSSOAuthenticator copyQueryItemsWithParameters:](self, "copyQueryItemsWithParameters:", v11);
    objc_msgSend(v10, "setQueryItems:", v12);

    objc_msgSend(v10, "query");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v10, "query");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("otherParameters"));

    }
  }
  SoftwareUpdateSSOlogInfo();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    -[SoftwareUpdateExtensibleSSOAuthenticator appIdentifier](self, "appIdentifier");
    v16 = objc_claimAutoreleasedReturnValue();
    -[SoftwareUpdateExtensibleSSOAuthenticator envIdentifier](self, "envIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SoftwareUpdateExtensibleSSOAuthenticator interactivity](self, "interactivity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v40 = v16;
    v41 = 2112;
    v42 = v17;
    v43 = 2112;
    v44 = v18;
    _os_log_impl(&dword_21AC5E000, v15, OS_LOG_TYPE_DEFAULT, "Parameters passed to authenticate function are AppIdentifier: %@ EnvIdentifier: %@ Interactivity: %@ \n", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://sso.corp.apple.com/authenticate"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB70C8], "authorizationProviderWithIdentityProviderURL:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "canPerformAuthorization"))
  {
    objc_msgSend(v20, "createRequest");
    v21 = objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      SoftwareUpdateSSOlogError();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v25 = "Unable to create request object\n";
LABEL_30:
        v26 = v24;
        v27 = 2;
        goto LABEL_31;
      }
LABEL_32:

      goto LABEL_33;
    }
    v22 = -[SoftwareUpdateExtensibleSSOAuthenticator copyQueryItemsWithParameters:](self, "copyQueryItemsWithParameters:", v4);
    -[NSObject setAuthorizationOptions:](v21, "setAuthorizationOptions:", v22);

    -[SoftwareUpdateExtensibleSSOAuthenticator interactivity](self, "interactivity");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "isEqualToString:", CFSTR("0")))
    {

    }
    else
    {
      -[SoftwareUpdateExtensibleSSOAuthenticator interactivity](self, "interactivity");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("2"));

      if (!v29)
      {
        SoftwareUpdateSSOlogInfo();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21AC5E000, v30, OS_LOG_TYPE_DEFAULT, "Setting userInterfaceEnabled to NO\n", buf, 2u);
        }
        v31 = 0;
LABEL_24:

        -[NSObject setUserInterfaceEnabled:](v21, "setUserInterfaceEnabled:", v31);
        v32 = objc_alloc(MEMORY[0x24BDB7090]);
        v38 = v21;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v38, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)objc_msgSend(v32, "initWithAuthorizationRequests:", v33);
        -[SoftwareUpdateExtensibleSSOAuthenticator setAuthenticationController:](self, "setAuthenticationController:", v34);

        -[SoftwareUpdateExtensibleSSOAuthenticator authenticationController](self, "authenticationController");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          -[SoftwareUpdateExtensibleSSOAuthenticator authenticationController](self, "authenticationController");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setDelegate:", self);

          SoftwareUpdateSSOlogDebug();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21AC5E000, v37, OS_LOG_TYPE_DEFAULT, "Calling performRequests on authenticationController\n", buf, 2u);
          }

          -[SoftwareUpdateExtensibleSSOAuthenticator authenticationController](self, "authenticationController");
          v24 = objc_claimAutoreleasedReturnValue();
          -[NSObject performRequests](v24, "performRequests");
          goto LABEL_32;
        }
        SoftwareUpdateSSOlogError();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v25 = "Unable to allocate AuthenticationController object\n";
          goto LABEL_30;
        }
        goto LABEL_32;
      }
    }
    SoftwareUpdateSSOlogInfo();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AC5E000, v30, OS_LOG_TYPE_DEFAULT, "Setting userInterfaceEnabled to YES\n", buf, 2u);
    }
    v31 = 1;
    goto LABEL_24;
  }
  SoftwareUpdateSSOlogError();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v20, "url");
    v24 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v40 = v24;
    v25 = "Can't authenticate with provider URL: %@\n";
    v26 = v21;
    v27 = 12;
LABEL_31:
    _os_log_impl(&dword_21AC5E000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
    goto LABEL_32;
  }
LABEL_33:

}

- (BOOL)authenticationSupported
{
  void *v2;
  void *v3;
  char v4;
  NSObject *v6;
  uint8_t v7[16];

  if (objc_opt_class())
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://sso.corp.apple.com/authenticate"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDB70C8], "authorizationProviderWithIdentityProviderURL:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "canPerformAuthorization");

    return v4;
  }
  else
  {
    SoftwareUpdateSSOlogError();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21AC5E000, v6, OS_LOG_TYPE_DEFAULT, "Environment does not support AuthenticationServices\n", v7, 2u);
    }

    return 0;
  }
}

- (void)authorizationController:(id)a3 didCompleteWithAuthorization:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v5 = a4;
  SoftwareUpdateSSOlogInfo();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_21AC5E000, v6, OS_LOG_TYPE_DEFAULT, "INFO: ExtensibleSSOAuthenticator: Authentication completed successfully\n", v12, 2u);
  }

  objc_msgSend(v5, "credential");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "credential");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "authenticatedResponse");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  -[SoftwareUpdateExtensibleSSOAuthenticator delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allHeaderFields");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "authenticator:didCompleteWithResult:", self, v11);

  -[SoftwareUpdateExtensibleSSOAuthenticator setAuthenticationController:](self, "setAuthenticationController:", 0);
}

- (void)authorizationController:(id)a3 didCompleteWithError:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  SoftwareUpdateSSOlogError();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_21AC5E000, v6, OS_LOG_TYPE_DEFAULT, "ExtensibleSSOAuthenticator : Authentication completed with error: %@\n", (uint8_t *)&v8, 0xCu);
  }

  -[SoftwareUpdateExtensibleSSOAuthenticator delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "authenticator:didCompleteWithError:", self, v5);

  -[SoftwareUpdateExtensibleSSOAuthenticator setAuthenticationController:](self, "setAuthenticationController:", 0);
}

- (SoftwareUpdateExtensibleSSOAuthenticatorDelegate)delegate
{
  return (SoftwareUpdateExtensibleSSOAuthenticatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_appIdentifier, a3);
}

- (NSString)envIdentifier
{
  return self->_envIdentifier;
}

- (void)setEnvIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_envIdentifier, a3);
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_storeStrong((id *)&self->_username, a3);
}

- (NSString)interactivity
{
  return self->_interactivity;
}

- (void)setInteractivity:(id)a3
{
  objc_storeStrong((id *)&self->_interactivity, a3);
}

- (NSDictionary)otherParameters
{
  return self->_otherParameters;
}

- (void)setOtherParameters:(id)a3
{
  objc_storeStrong((id *)&self->_otherParameters, a3);
}

- (ASAuthorizationController)authenticationController
{
  return self->_authenticationController;
}

- (void)setAuthenticationController:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationController, 0);
  objc_storeStrong((id *)&self->_otherParameters, 0);
  objc_storeStrong((id *)&self->_interactivity, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_envIdentifier, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
