@implementation FMFAccount

- (id)authTokenType
{
  return CFSTR("fmf-internal");
}

- (void)copyInfoFromAccount:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FMFAccount;
  -[FindBaseAccount copyInfoFromAccount:](&v14, "copyInfoFromAccount:", v4);
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dsid"));
    -[FMFAccount setDsid:](self, "setDsid:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appServerHost"));
    -[FMFAccount setAppServerHost:](self, "setAppServerHost:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appAuthToken"));
    -[FMFAccount setAppAuthToken:](self, "setAppAuthToken:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "internalAuthToken"));
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "internalAuthToken"));
      -[FMFAccount setInternalAuthToken:](self, "setInternalAuthToken:", v11);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "additionalInfo"));
    -[FMFAccount setAdditionalInfo:](self, "setAdditionalInfo:", v12);

    -[FMFAccount setAppAuthTokenStatus:](self, "setAppAuthTokenStatus:", objc_msgSend(v6, "appAuthTokenStatus"));
    -[FMFAccount setInternalAuthTokenStatus:](self, "setInternalAuthTokenStatus:", objc_msgSend(v6, "internalAuthTokenStatus"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastMessageDisplayedTimestamp"));
    -[FMFAccount setLastMessageDisplayedTimestamp:](self, "setLastMessageDisplayedTimestamp:", v13);

  }
}

- (id)description
{
  const __CFString *v3;
  int64_t v4;
  void *v5;
  const __CFString *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMFAccount dsid](self, "dsid"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseAccount username](self, "username"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMFAccount appAuthToken](self, "appAuthToken"));
  if (v18)
    v3 = CFSTR("(not-nil)");
  else
    v3 = CFSTR("(nil)");
  v15 = v3;
  v4 = -[FMFAccount appAuthTokenStatus](self, "appAuthTokenStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFAccount internalAuthToken](self, "internalAuthToken"));
  if (v5)
    v6 = CFSTR("(not-nil)");
  else
    v6 = CFSTR("(nil)");
  v7 = -[FMFAccount internalAuthTokenStatus](self, "internalAuthTokenStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseAccount serverHost](self, "serverHost"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMFAccount appServerHost](self, "appServerHost"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseAccount serverProtocolScheme](self, "serverProtocolScheme"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseAccount apsEnvironment](self, "apsEnvironment"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMFAccount additionalInfo](self, "additionalInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("FMFAccount(0x%lx) %@,%@,%@,%ld,%@,%ld,%@,%@,%@,%@,%@"), self, v17, v16, v15, v4, v6, v7, v8, v9, v10, v11, v12));

  return v13;
}

- (NSString)dsid
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDsid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)appServerHost
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAppServerHost:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)appAuthToken
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAppAuthToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)internalAuthToken
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInternalAuthToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSDictionary)additionalInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAdditionalInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSDate)lastMessageDisplayedTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLastMessageDisplayedTimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (int64_t)appAuthTokenStatus
{
  return self->_appAuthTokenStatus;
}

- (void)setAppAuthTokenStatus:(int64_t)a3
{
  self->_appAuthTokenStatus = a3;
}

- (int64_t)internalAuthTokenStatus
{
  return self->_internalAuthTokenStatus;
}

- (void)setInternalAuthTokenStatus:(int64_t)a3
{
  self->_internalAuthTokenStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastMessageDisplayedTimestamp, 0);
  objc_storeStrong((id *)&self->_additionalInfo, 0);
  objc_storeStrong((id *)&self->_internalAuthToken, 0);
  objc_storeStrong((id *)&self->_appAuthToken, 0);
  objc_storeStrong((id *)&self->_appServerHost, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
}

- (void)applyPropertiesFromACAccount:(id)a3 includingTokens:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a4;
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "fmfAccountInfoWithTokens:", a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("username")));
  -[FindBaseAccount setUsername:](self, "setUsername:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("dsid")));
  -[FMFAccount setDsid:](self, "setDsid:", v7);

  if (v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("appToken")));
    -[FMFAccount setAppAuthToken:](self, "setAppAuthToken:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("internalToken")));
    -[FMFAccount setInternalAuthToken:](self, "setInternalAuthToken:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("appHostname")));
  -[FMFAccount setAppServerHost:](self, "setAppServerHost:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("hostname")));
  -[FindBaseAccount setServerHost:](self, "setServerHost:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("scheme")));
  -[FindBaseAccount setServerProtocolScheme:](self, "setServerProtocolScheme:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("apsEnv")));
  -[FindBaseAccount setApsEnvironment:](self, "setApsEnvironment:", v13);

}

@end
