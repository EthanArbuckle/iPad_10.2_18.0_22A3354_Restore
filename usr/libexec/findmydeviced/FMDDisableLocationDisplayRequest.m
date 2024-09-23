@implementation FMDDisableLocationDisplayRequest

- (FMDDisableLocationDisplayRequest)initWithAccount:(id)a3
{
  id v5;
  FMDDisableLocationDisplayRequest *v6;
  FMDDisableLocationDisplayRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMDDisableLocationDisplayRequest;
  v6 = -[FMDRequest initWithAccount:](&v9, "initWithAccount:", v5);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_account, a3);

  return v7;
}

- (id)requestHeaders
{
  NSMutableDictionary *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FMDDisableLocationDisplayRequest;
  v2 = -[FMDRequest requestHeaders](&v4, "requestHeaders");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (id)requestUrl
{
  void *v3;
  void *v4;
  RequestTemplateURL *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deviceUDID"));

  v5 = objc_alloc_init(RequestTemplateURL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDisableLocationDisplayRequest account](self, "account"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RequestTemplateURL urlFromTemplate:account:udid:](v5, "urlFromTemplate:account:udid:", CFSTR("${scheme}://${hostname}/fmipservice/${service}/disableLocations"), v6, v4));

  return v7;
}

- (id)requestBody
{
  NSMutableDictionary *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FMDDisableLocationDisplayRequest;
  v2 = -[FMDRequest requestBody](&v4, "requestBody");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (unint64_t)type
{
  return 1;
}

- (BOOL)canReplace:(id)a3
{
  return 0;
}

- (BOOL)canRequestBeRetriedNow
{
  return 0;
}

- (FMDAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

@end
