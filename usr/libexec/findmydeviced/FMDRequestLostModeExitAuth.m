@implementation FMDRequestLostModeExitAuth

- (FMDRequestLostModeExitAuth)initWithProvider:(id)a3 lostModeExitAuthToken:(id)a4
{
  id v6;
  id v7;
  void *v8;
  FMDRequestLostModeExitAuth *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "account"));
  v11.receiver = self;
  v11.super_class = (Class)FMDRequestLostModeExitAuth;
  v9 = -[FMDRequest initWithAccount:](&v11, "initWithAccount:", v8);

  if (v9)
  {
    objc_storeWeak((id *)&v9->_provider, v6);
    objc_storeStrong((id *)&v9->_lostModeExitAuthToken, a4);
  }

  return v9;
}

- (id)requestUrl
{
  void *v3;
  void *v4;
  RequestTemplateURL *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deviceUDID"));

  v5 = objc_alloc_init(RequestTemplateURL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestLostModeExitAuth provider](self, "provider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "account"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RequestTemplateURL urlFromTemplate:account:udid:](v5, "urlFromTemplate:account:udid:", CFSTR("${scheme}://${hostname}/fmipservice/${service}/${dsid}/${udid}/authAfterLostMode"), v7, v4));

  return v8;
}

- (id)requestBody
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  FMDActingRequestDecorator *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FMDRequestLostModeExitAuth;
  v3 = -[FMDRequest requestBody](&v12, "requestBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestLostModeExitAuth provider](self, "provider"));
  if (v5)
  {
    v6 = objc_alloc_init(FMDActingRequestDecorator);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDActingRequestDecorator standardDeviceContext](v6, "standardDeviceContext"));

    objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("deviceContext"), v7);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deviceUDID"));
  objc_msgSend(v8, "fm_safelyMapKey:toObject:", CFSTR("udid"), v10);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("deviceInfo"));
  return v4;
}

- (id)authToken
{
  return -[FMDRequestLostModeExitAuth lostModeExitAuthToken](self, "lostModeExitAuthToken");
}

- (BOOL)showAuthFailedMessage
{
  return 0;
}

- (BOOL)canRequestBeRetriedNow
{
  return 0;
}

- (BOOL)canReplace:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  LOBYTE(self) = objc_opt_isKindOfClass(v4, v6);

  return self & 1;
}

- (FMDServiceProvider)provider
{
  return (FMDServiceProvider *)objc_loadWeakRetained((id *)&self->_provider);
}

- (void)setProvider:(id)a3
{
  objc_storeWeak((id *)&self->_provider, a3);
}

- (NSString)lostModeExitAuthToken
{
  return self->_lostModeExitAuthToken;
}

- (void)setLostModeExitAuthToken:(id)a3
{
  objc_storeStrong((id *)&self->_lostModeExitAuthToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lostModeExitAuthToken, 0);
  objc_destroyWeak((id *)&self->_provider);
}

@end
