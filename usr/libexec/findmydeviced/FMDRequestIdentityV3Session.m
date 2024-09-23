@implementation FMDRequestIdentityV3Session

- (FMDRequestIdentityV3Session)initWithProvider:(id)a3 activationLockRequestUUID:(id)a4 pscHelloMsg:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  FMDRequestIdentityV3Session *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "account"));
  v14.receiver = self;
  v14.super_class = (Class)FMDRequestIdentityV3Session;
  v12 = -[FMDRequest initWithAccount:](&v14, "initWithAccount:", v11);

  if (v12)
  {
    -[FMDRequestIdentityV3Session setActivationLockRequestUUID:](v12, "setActivationLockRequestUUID:", v9);
    -[FMDRequestIdentityV3Session setProvider:](v12, "setProvider:", v8);
    -[FMDRequestIdentityV3Session setPscHelloMsg:](v12, "setPscHelloMsg:", v10);
    -[FMDRequestIdentityV3Session setRequiresAuthentication:](v12, "setRequiresAuthentication:", 1);
  }

  return v12;
}

- (unint64_t)type
{
  if (-[FMDRequestIdentityV3Session requiresAuthentication](self, "requiresAuthentication"))
    return 1;
  else
    return 2;
}

- (id)requestUrl
{
  void *v3;
  RequestTemplateURL *v4;
  void *v5;
  void *v6;
  RequestTemplateURL *v7;
  void *v8;

  if (-[FMDRequestIdentityV3Session requiresAuthentication](self, "requiresAuthentication"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestIdentityV3Session provider](self, "provider"));
    v4 = (RequestTemplateURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "account"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceUDID"));

    v7 = objc_alloc_init(RequestTemplateURL);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RequestTemplateURL urlFromTemplate:account:udid:](v7, "urlFromTemplate:account:udid:", CFSTR("${scheme}://${hostname}/fmipservice/${service}/${dsid}/${udid}/identityV3Session"), v4, v6));

  }
  else
  {
    v4 = objc_alloc_init(RequestTemplateURL);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RequestTemplateURL unauthenticatedURLFromTemplate:](v4, "unauthenticatedURLFromTemplate:", CFSTR("${scheme}://${hostname}/${service}/provision/init")));
  }

  return v8;
}

- (id)requestHeaders
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FMDRequestIdentityV3Session;
  v3 = -[FMDRequest requestHeaders](&v8, "requestHeaders");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestIdentityV3Session activationLockRequestUUID](self, "activationLockRequestUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("X-Apple-AL-ID"), v6);

  return v4;
}

- (id)requestBody
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serialNumber"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("serialNumber"), v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "deviceUDID"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("udid"), v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "osVersion"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("osVersion"), v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "osBuildVersion"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("osBuildVersion"), v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "productType"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("productType"), v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAbsintheV3SigningInterface sharedInterface](FMDAbsintheV3SigningInterface, "sharedInterface"));
  v23 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "inFieldCollectionReceipt:", &v23));
  v16 = v23;
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("ifcReceipt"), v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fm_commaSeparatedString"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("collectionError"), v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  LODWORD(v15) = objc_msgSend(v18, "isInternalBuild");

  if ((_DWORD)v15)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "description"));
    objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("collectionErrorDetail"), v19);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestIdentityV3Session pscHelloMsg](self, "pscHelloMsg"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("message"), v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestIdentityV3Session cause](self, "cause"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("cause"), v21);

  return v3;
}

- (BOOL)canRequestBeRetriedNow
{
  return 0;
}

- (BOOL)canReplace:(id)a3
{
  return 0;
}

- (NSString)cause
{
  return self->_cause;
}

- (void)setCause:(id)a3
{
  objc_storeStrong((id *)&self->_cause, a3);
}

- (BOOL)requiresAuthentication
{
  return self->_requiresAuthentication;
}

- (void)setRequiresAuthentication:(BOOL)a3
{
  self->_requiresAuthentication = a3;
}

- (FMDServiceProvider)provider
{
  return (FMDServiceProvider *)objc_loadWeakRetained((id *)&self->_provider);
}

- (void)setProvider:(id)a3
{
  objc_storeWeak((id *)&self->_provider, a3);
}

- (NSString)pscHelloMsg
{
  return self->_pscHelloMsg;
}

- (void)setPscHelloMsg:(id)a3
{
  objc_storeStrong((id *)&self->_pscHelloMsg, a3);
}

- (NSUUID)activationLockRequestUUID
{
  return self->_activationLockRequestUUID;
}

- (void)setActivationLockRequestUUID:(id)a3
{
  objc_storeStrong((id *)&self->_activationLockRequestUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationLockRequestUUID, 0);
  objc_storeStrong((id *)&self->_pscHelloMsg, 0);
  objc_destroyWeak((id *)&self->_provider);
  objc_storeStrong((id *)&self->_cause, 0);
}

@end
