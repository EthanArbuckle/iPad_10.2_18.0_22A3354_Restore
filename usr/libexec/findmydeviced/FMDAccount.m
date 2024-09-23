@implementation FMDAccount

- (NSString)authId
{
  return 0;
}

- (NSString)authToken
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
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil stringForKey:inDomain:](FMPreferencesUtil, "stringForKey:inDomain:", CFSTR("ApsEnvOverride"), kFMDNotBackedUpPrefDomain));
    if (v9)
    {
      v10 = sub_1000031B8();
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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccount apsEnvironment](self, "apsEnvironment"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMAPSHandler constantForEnvironmentString:](FMAPSHandler, "constantForEnvironmentString:", v2));

  return (NSString *)v3;
}

- (void)copyInfoFromAccount:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (objc_msgSend(v11, "isMemberOfClass:", objc_opt_class(self, v4)))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "username"));
    -[FMDAccount setUsername:](self, "setUsername:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "serverHost"));
    -[FMDAccount setServerHost:](self, "setServerHost:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "serverProtocolScheme"));
    -[FMDAccount setServerProtocolScheme:](self, "setServerProtocolScheme:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "apsEnvironment"));
    -[FMDAccount setApsEnvironment:](self, "setApsEnvironment:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "versionHistory"));
    -[FMDAccount setVersionHistory:](self, "setVersionHistory:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accountAddTime"));
    -[FMDAccount setAccountAddTime:](self, "setAccountAddTime:", v10);

  }
}

- (NSString)oneTimeRemoveAuthToken
{
  return self->_oneTimeRemoveAuthToken;
}

- (void)setOneTimeRemoveAuthToken:(id)a3
{
  objc_storeStrong((id *)&self->_oneTimeRemoveAuthToken, a3);
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

- (unint64_t)unregisterState
{
  return self->_unregisterState;
}

- (void)setUnregisterState:(unint64_t)a3
{
  self->_unregisterState = a3;
}

- (NSDate)lastUnregisterFailedTime
{
  return self->_lastUnregisterFailedTime;
}

- (void)setLastUnregisterFailedTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastUnregisterFailedTime, a3);
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

- (unsigned)activityState
{
  return self->_activityState;
}

- (void)setActivityState:(unsigned __int8)a3
{
  self->_activityState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountAddTime, 0);
  objc_storeStrong((id *)&self->_versionHistory, 0);
  objc_storeStrong((id *)&self->_lastUnregisterFailedTime, 0);
  objc_storeStrong((id *)&self->_apsEnvironment, 0);
  objc_storeStrong((id *)&self->_serverProtocolScheme, 0);
  objc_storeStrong((id *)&self->_serverHost, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_oneTimeRemoveAuthToken, 0);
}

@end
