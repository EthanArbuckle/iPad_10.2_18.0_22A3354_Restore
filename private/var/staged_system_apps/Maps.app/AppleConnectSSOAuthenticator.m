@implementation AppleConnectSSOAuthenticator

- (id)queryItemsWithParameters:(id)a3
{
  id v3;
  id v4;
  id v5;
  void **v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  void *v10;
  id v11;
  Block_layout *v12;

  v3 = a3;
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_100945D04;
  v10 = &unk_1011DC730;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = &stru_1011DC708;
  v4 = v11;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", &v7);

  v5 = objc_msgSend(v4, "copy", v7, v8, v9, v10);
  return v5;
}

- (void)authenticate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSURLComponents *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AppleConnectSSOAuthenticator appIdentifier](self, "appIdentifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("applicationIdentifier"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AppleConnectSSOAuthenticator envIdentifier](self, "envIdentifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("environmentIdentifier"));

  v24 = CFSTR("DAWRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&__kCFBooleanTrue, "stringValue"));
  v25 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));

  v8 = objc_opt_new(NSURLComponents);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AppleConnectSSOAuthenticator queryItemsWithParameters:](self, "queryItemsWithParameters:", v7));
  -[NSURLComponents setQueryItems:](v8, "setQueryItems:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents percentEncodedQuery](v8, "percentEncodedQuery"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("otherParameters"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("https://sso.corp.apple.com/authenticate")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[ASAuthorizationSingleSignOnProvider authorizationProviderWithIdentityProviderURL:](ASAuthorizationSingleSignOnProvider, "authorizationProviderWithIdentityProviderURL:", v11));
  v13 = objc_msgSend(v12, "canPerformAuthorization");
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "url"));
  v15 = (void *)v14;
  if (v13)
  {
    NSLog(CFSTR("INFO: Will authenticate with provider URL: %@."), v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "createRequest"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[AppleConnectSSOAuthenticator queryItemsWithParameters:](self, "queryItemsWithParameters:", v3));
    objc_msgSend(v16, "setAuthorizationOptions:", v17);

    v18 = objc_alloc((Class)ASAuthorizationController);
    v23 = v16;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
    v20 = objc_msgSend(v18, "initWithAuthorizationRequests:", v19);
    -[AppleConnectSSOAuthenticator setAuthenticationController:](self, "setAuthenticationController:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[AppleConnectSSOAuthenticator authenticationController](self, "authenticationController"));
    objc_msgSend(v21, "setDelegate:", self);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[AppleConnectSSOAuthenticator authenticationController](self, "authenticationController"));
    objc_msgSend(v22, "performRequests");
  }
  else
  {
    NSLog(CFSTR("ERROR: Can't authenticate with provider URL: %@."), v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("AppleConnectErrorDomain"), -105, 0));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[AppleConnectSSOAuthenticator delegate](self, "delegate"));
    objc_msgSend(v22, "authenticator:didCompleteWithError:", self, v16);
  }

}

- (void)authorizationController:(id)a3 didCompleteWithAuthorization:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  AppleConnectSSOResult *v10;
  void *v11;
  AppleConnectSSOResult *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint8_t v17[16];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "credential"));
  v7 = objc_opt_class(ASAuthorizationSingleSignOnCredential);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "credential"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "authenticatedResponse"));

  }
  else
  {
    v9 = 0;
  }

  v10 = [AppleConnectSSOResult alloc];
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allHeaderFields"));
  v12 = -[AppleConnectSSOResult initWithResponse:](v10, "initWithResponse:", v11);

  if (v12)
  {
    v13 = GEOGetMapsProxyAuthLog();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Authentication did succeed.", v17, 2u);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[AppleConnectSSOAuthenticator delegate](self, "delegate"));
    objc_msgSend(v15, "authenticator:didCompleteWithResult:", self, v12);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("AppleConnectErrorDomain"), -99999, 0));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[AppleConnectSSOAuthenticator delegate](self, "delegate"));
    objc_msgSend(v16, "authenticator:didCompleteWithError:", self, v15);

  }
  -[AppleConnectSSOAuthenticator setAuthenticationController:](self, "setAuthenticationController:", 0);

}

- (void)authorizationController:(id)a3 didCompleteWithError:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;

  v5 = a4;
  v6 = GEOGetMapsProxyAuthLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Authentication did fail with error: %@.", (uint8_t *)&v9, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AppleConnectSSOAuthenticator delegate](self, "delegate"));
  objc_msgSend(v8, "authenticator:didCompleteWithError:", self, v5);

  -[AppleConnectSSOAuthenticator setAuthenticationController:](self, "setAuthenticationController:", 0);
}

- (AppleConnectSSOAuthenticatorDelegate)delegate
{
  return (AppleConnectSSOAuthenticatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
  objc_storeStrong((id *)&self->_envIdentifier, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
