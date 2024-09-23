@implementation FindBaseAccount

- (NSString)authId
{
  return 0;
}

- (NSString)authToken
{
  return 0;
}

- (NSString)authTokenType
{
  return 0;
}

- (void)setApsEnvironment:(id)a3
{
  id v5;
  NSString **p_apsEnvironment;
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;
  NSObject *v11;
  int v12;
  void *v13;

  v5 = a3;
  p_apsEnvironment = &self->_apsEnvironment;
  objc_storeStrong((id *)p_apsEnvironment, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  v8 = objc_msgSend(v7, "isInternalBuild");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil stringForKey:inDomain:](FMPreferencesUtil, "stringForKey:inDomain:", CFSTR("ApsEnvOverride"), CFSTR("com.apple.icloud.fmflocatord.notbackedup")));
    if (v9)
    {
      v10 = sub_10001C4E8();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Overriding aps environment to %@", (uint8_t *)&v12, 0xCu);
      }

      objc_storeStrong((id *)p_apsEnvironment, v9);
    }

  }
}

- (NSString)apsEnvironmentConstant
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseAccount apsEnvironment](self, "apsEnvironment"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMAPSHandler constantForEnvironmentString:](FMAPSHandler, "constantForEnvironmentString:", v2));

  return (NSString *)v3;
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseAccount authId](self, "authId"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseAccount authToken](self, "authToken"));
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)hasSameRelevantInfoAs:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  int v45;
  int v46;
  objc_super v47;

  v7 = a3;
  v47.receiver = self;
  v47.super_class = (Class)FindBaseAccount;
  if (!-[Account hasSameRelevantInfoAs:](&v47, "hasSameRelevantInfoAs:", v7))
  {
    v10 = 0;
    goto LABEL_57;
  }
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "authId"));
  if (v9 || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseAccount authId](self, "authId"))) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "authId"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseAccount authId](self, "authId"));
    if ((objc_msgSend(v3, "isEqualToString:", v4) & 1) == 0)
    {

      v10 = 0;
      goto LABEL_54;
    }
    v46 = 1;
  }
  else
  {
    v46 = 0;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "authToken"));
  if (!v11)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseAccount authToken](self, "authToken"));
    if (!v44)
    {
      v44 = 0;
      v45 = 0;
      goto LABEL_19;
    }
  }
  v12 = v5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "authToken"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseAccount authToken](self, "authToken"));
  if ((objc_msgSend(v13, "isEqualToString:", v14) & 1) != 0)
  {
    v40 = v13;
    v45 = 1;
    v5 = v12;
    v39 = v14;
LABEL_19:
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serverHost"));
    if (v15
      || (v35 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseAccount serverHost](self, "serverHost"))) != 0)
    {
      v16 = v5;
      v17 = v11;
      v18 = v4;
      v19 = v3;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serverHost"));
      v41 = objc_claimAutoreleasedReturnValue(-[FindBaseAccount serverHost](self, "serverHost"));
      v42 = v20;
      if (!objc_msgSend(v20, "isEqualToString:"))
      {
        v10 = 0;
        v3 = v19;
        v4 = v18;
        v11 = v17;
        v5 = v16;
        v21 = (void *)v41;
        goto LABEL_45;
      }
      v38 = 1;
      v3 = v19;
      v4 = v18;
      v11 = v17;
      v5 = v16;
    }
    else
    {
      v35 = 0;
      v38 = 0;
    }
    v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serverProtocolScheme"));
    if (v43
      || (v31 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseAccount serverProtocolScheme](self, "serverProtocolScheme"))) != 0)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serverProtocolScheme"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseAccount serverProtocolScheme](self, "serverProtocolScheme"));
      v37 = v22;
      if (!objc_msgSend(v22, "isEqualToString:"))
      {
        v10 = 0;
LABEL_40:

        goto LABEL_41;
      }
      v34 = v15;
      v33 = 1;
    }
    else
    {
      v34 = v15;
      v31 = 0;
      v33 = 0;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "apsEnvironment"));
    if (v23
      || (v29 = objc_claimAutoreleasedReturnValue(-[FindBaseAccount apsEnvironment](self, "apsEnvironment"))) != 0)
    {
      v32 = v5;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "apsEnvironment", v29, v31));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseAccount apsEnvironment](self, "apsEnvironment"));
      v10 = objc_msgSend(v24, "isEqualToString:", v25);

      if (v23)
      {

        if (v33)
        {
          v5 = v32;
          v15 = v34;
          goto LABEL_40;
        }
        v5 = v32;
        v15 = v34;
LABEL_41:
        v27 = (void *)v43;
        if (!v43)
        {

          v27 = 0;
        }

        if (!v38)
        {
LABEL_46:
          if (!v15)

          if (v45)
          {

          }
          if (!v11)

          if (!v46)
            goto LABEL_54;
          goto LABEL_53;
        }
        v21 = (void *)v41;
LABEL_45:

        goto LABEL_46;
      }
      v5 = v32;
      v26 = v30;
    }
    else
    {
      v26 = 0;
      v10 = 1;
    }

    v15 = v34;
    if ((v33 & 1) != 0)
      goto LABEL_40;
    goto LABEL_41;
  }

  if (v11)
  else

  v10 = 0;
  v5 = v12;
  if ((v46 & 1) != 0)
  {
LABEL_53:

  }
LABEL_54:
  if (!v9)

LABEL_57:
  return v10;
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
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FindBaseAccount;
  -[Account copyInfoFromAccount:](&v13, "copyInfoFromAccount:", v4);
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "username"));
    -[FindBaseAccount setUsername:](self, "setUsername:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serverHost"));
    -[FindBaseAccount setServerHost:](self, "setServerHost:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serverProtocolScheme"));
    -[FindBaseAccount setServerProtocolScheme:](self, "setServerProtocolScheme:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "apsEnvironment"));
    -[FindBaseAccount setApsEnvironment:](self, "setApsEnvironment:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "versionHistory"));
    -[FindBaseAccount setVersionHistory:](self, "setVersionHistory:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accountAddTime"));
    -[FindBaseAccount setAccountAddTime:](self, "setAccountAddTime:", v12);

  }
}

- (NSString)username
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUsername:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)serverHost
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setServerHost:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)serverProtocolScheme
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setServerProtocolScheme:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)apsEnvironment
{
  return self->_apsEnvironment;
}

- (NSArray)versionHistory
{
  return self->_versionHistory;
}

- (void)setVersionHistory:(id)a3
{
  objc_storeStrong((id *)&self->_versionHistory, a3);
}

- (NSDate)accountAddTime
{
  return self->_accountAddTime;
}

- (void)setAccountAddTime:(id)a3
{
  objc_storeStrong((id *)&self->_accountAddTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountAddTime, 0);
  objc_storeStrong((id *)&self->_versionHistory, 0);
  objc_storeStrong((id *)&self->_apsEnvironment, 0);
  objc_storeStrong((id *)&self->_serverProtocolScheme, 0);
  objc_storeStrong((id *)&self->_serverHost, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

@end
