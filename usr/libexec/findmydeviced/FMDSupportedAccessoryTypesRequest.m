@implementation FMDSupportedAccessoryTypesRequest

- (FMDSupportedAccessoryTypesRequest)initWithAccount:(id)a3 registry:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  FMDSupportedAccessoryTypesRequest *v9;
  uint64_t v10;
  uint64_t v11;
  NSString *baseURL;
  FMDSupportedAccessoryTypesRequest *v13;
  id v14;
  NSObject *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)FMDSupportedAccessoryTypesRequest;
  v9 = -[FMDRequest initWithAccount:](&v17, "initWithAccount:", v6);
  if (!v9)
    goto LABEL_4;
  v10 = objc_opt_class(FMDFMIPAccount, v8);
  if ((objc_opt_isKindOfClass(v6, v10) & 1) != 0)
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "extAccessoryConfigURL"));
    baseURL = v9->_baseURL;
    v9->_baseURL = (NSString *)v11;

    objc_storeStrong((id *)&v9->_registry, a4);
LABEL_4:
    v13 = v9;
    goto LABEL_8;
  }
  v14 = sub_1000530AC();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    sub_100225E38((uint64_t)v6, v15);

  v13 = 0;
LABEL_8:

  return v13;
}

- (id)requestHeaders
{
  NSMutableDictionary *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FMDSupportedAccessoryTypesRequest;
  v2 = -[FMDRequest requestHeaders](&v7, "requestHeaders");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServerConfig sharedInstance](FMDServerConfig, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mmeClientInfo"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("X-MMe-Client-Info"), v5);

  return v3;
}

- (id)requestUrl
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessoryTypesRequest baseURL](self, "baseURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/supportedAccessoryTypes"), v2));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v3));
  return v4;
}

- (id)requestBody
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FMDSupportedAccessoryTypesRequest;
  v3 = -[FMDRequest requestBody](&v8, "requestBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessoryTypesRequest registry](self, "registry"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "version"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("cachedVersion"), v6);

  return v4;
}

- (unint64_t)type
{
  return 1;
}

- (BOOL)canReplace:(id)a3
{
  return 0;
}

- (FMDExtConfigurationRegistry)registry
{
  return self->_registry;
}

- (void)setRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_registry, a3);
}

- (NSString)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_registry, 0);
}

@end
