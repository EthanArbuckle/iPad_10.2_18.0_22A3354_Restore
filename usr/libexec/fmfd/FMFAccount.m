@implementation FMFAccount

- (NSString)dsid
{
  return self->_dsid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apsEnvironment, 0);
  objc_storeStrong((id *)&self->_fmfHostName, 0);
  objc_storeStrong((id *)&self->_fmfAppHostName, 0);
  objc_storeStrong((id *)&self->_fmfToken, 0);
  objc_storeStrong((id *)&self->_fmfAppToken, 0);
  objc_storeStrong((id *)&self->_authToken, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_serverProtocolScheme, 0);
  objc_storeStrong((id *)&self->_serverHost, 0);
  objc_storeStrong((id *)&self->_iCloudId, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class(self));
  objc_msgSend(v4, "setICloudId:", self->_iCloudId);
  objc_msgSend(v4, "setServerHost:", self->_serverHost);
  objc_msgSend(v4, "setServerProtocolScheme:", self->_serverProtocolScheme);
  objc_msgSend(v4, "setDsid:", self->_dsid);
  objc_msgSend(v4, "setAuthToken:", self->_authToken);
  objc_msgSend(v4, "setAuthTokenStatus:", self->_authTokenStatus);
  objc_msgSend(v4, "setFmfAppToken:", self->_fmfAppToken);
  objc_msgSend(v4, "setFmfToken:", self->_fmfToken);
  objc_msgSend(v4, "setFmfAppHostName:", self->_fmfAppHostName);
  objc_msgSend(v4, "setFmfHostName:", self->_fmfHostName);
  objc_msgSend(v4, "setApsEnvironment:", self->_apsEnvironment);
  return v4;
}

- (void)setServerProtocolScheme:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setServerHost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setICloudId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setFmfToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setFmfHostName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setFmfAppToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setFmfAppHostName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setDsid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setAuthTokenStatus:(int64_t)a3
{
  self->_authTokenStatus = a3;
}

- (void)setAuthToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setApsEnvironment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)iCloudId
{
  return self->_iCloudId;
}

- (NSString)fmfAppToken
{
  return self->_fmfAppToken;
}

- (NSString)fmfAppHostName
{
  return self->_fmfAppHostName;
}

- (NSString)apsEnvironment
{
  return self->_apsEnvironment;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFAccount iCloudId](self, "iCloudId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMFAccount dsid](self, "dsid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("FMFAccount(0x%lX,%@,%@)"), self, v3, v4));

  return v5;
}

- (NSString)authToken
{
  NSString *authToken;
  NSString *v3;
  void *v4;

  authToken = self->_authToken;
  if (authToken)
  {
    v3 = authToken;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
    v3 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "authTokenFromKeychain"));

  }
  return v3;
}

- (NSString)serverHost
{
  return self->_serverHost;
}

- (NSString)serverProtocolScheme
{
  return self->_serverProtocolScheme;
}

- (int64_t)authTokenStatus
{
  return self->_authTokenStatus;
}

- (NSString)fmfToken
{
  return self->_fmfToken;
}

- (NSString)fmfHostName
{
  return self->_fmfHostName;
}

@end
