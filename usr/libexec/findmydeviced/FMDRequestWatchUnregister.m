@implementation FMDRequestWatchUnregister

- (FMDRequestWatchUnregister)initWithDeviceUDID:(id)a3 unregisterToken:(id)a4
{
  id v6;
  id v7;
  FMDRequestWatchUnregister *v8;
  FMDRequestWatchUnregister *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FMDRequestWatchUnregister;
  v8 = -[FMDRequest initWithAccount:](&v11, "initWithAccount:", 0);
  v9 = v8;
  if (v8)
  {
    -[FMDRequestWatchUnregister setUdid:](v8, "setUdid:", v6);
    -[FMDRequestWatchUnregister setToken:](v9, "setToken:", v7);
  }

  return v9;
}

- (id)requestHeaders
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FMDRequestWatchUnregister;
  v3 = -[FMDRequest requestHeaders](&v7, "requestHeaders");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestWatchUnregister token](self, "token"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("X-Apple-Migration-Unregister-Token"), v5);

  return v4;
}

- (id)authToken
{
  return 0;
}

- (id)requestUrl
{
  RequestTemplateURL *v2;
  void *v3;

  v2 = objc_alloc_init(RequestTemplateURL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RequestTemplateURL unauthenticatedURLFromTemplate:](v2, "unauthenticatedURLFromTemplate:", CFSTR("${scheme}://${hostname}/${service}/token/migrationUnregister")));

  return v3;
}

- (id)requestBody
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FMDRequestWatchUnregister;
  v3 = -[FMDRequest requestBody](&v7, "requestBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestWatchUnregister udid](self, "udid"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("udid"), v5);

  return v4;
}

- (BOOL)canRequestBeRetriedNow
{
  return 0;
}

- (unint64_t)type
{
  return 2;
}

- (BOOL)canReplace:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = a3;
  v6 = objc_opt_class(FMDRequestWatchUnregister, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "udid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestWatchUnregister udid](self, "udid"));
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)showAuthFailedMessage
{
  return 0;
}

- (NSString)udid
{
  return self->_udid;
}

- (void)setUdid:(id)a3
{
  objc_storeStrong((id *)&self->_udid, a3);
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_udid, 0);
}

@end
