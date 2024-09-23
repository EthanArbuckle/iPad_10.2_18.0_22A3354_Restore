@implementation FMDAccessoryInfoRequest

- (FMDAccessoryInfoRequest)initWithAccount:(id)a3 registry:(id)a4 accessoryTypes:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  FMDAccessoryInfoRequest *v12;
  uint64_t v13;
  uint64_t v14;
  NSString *baseURL;
  FMDAccessoryInfoRequest *v16;
  id v17;
  NSObject *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)FMDAccessoryInfoRequest;
  v12 = -[FMDRequest initWithAccount:](&v20, "initWithAccount:", v8);
  if (!v12)
    goto LABEL_4;
  v13 = objc_opt_class(FMDFMIPAccount, v11);
  if ((objc_opt_isKindOfClass(v8, v13) & 1) != 0)
  {
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "extAccessoryConfigURL"));
    baseURL = v12->_baseURL;
    v12->_baseURL = (NSString *)v14;

    objc_storeStrong((id *)&v12->_registry, a4);
    objc_storeStrong((id *)&v12->_accessoryTypes, a5);
LABEL_4:
    v16 = v12;
    goto LABEL_8;
  }
  v17 = sub_1000530AC();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    sub_100225E38((uint64_t)v8, v18);

  v16 = 0;
LABEL_8:

  return v16;
}

- (id)requestUrl
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint8_t buf[4];
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryInfoRequest baseURL](self, "baseURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/accessoryInfo"), v2));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v3));
  v5 = sub_1000530AC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMDAccessoryInfoRequest requestURL = %@", buf, 0xCu);
  }

  return v4;
}

- (id)requestHeaders
{
  NSMutableDictionary *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FMDAccessoryInfoRequest;
  v2 = -[FMDRequest requestHeaders](&v7, "requestHeaders");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServerConfig sharedInstance](FMDServerConfig, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mmeClientInfo"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("X-MMe-Client-Info"), v5);

  return v3;
}

- (id)requestBody
{
  NSMutableDictionary *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  id v18;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];

  v26.receiver = self;
  v26.super_class = (Class)FMDAccessoryInfoRequest;
  v3 = -[FMDRequest requestBody](&v26, "requestBody");
  v20 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v4 = objc_alloc((Class)NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryInfoRequest accessoryTypes](self, "accessoryTypes"));
  v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[FMDAccessoryInfoRequest accessoryTypes](self, "accessoryTypes"));
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryInfoRequest registry](self, "registry", v20));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "configForAccessoryType:", v11));
        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "version"));
        v15 = (void *)v14;
        v16 = &stru_1002CD590;
        if (v14)
          v16 = (__CFString *)v14;
        v17 = v16;

        v18 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 2);
        objc_msgSend(v18, "fm_safeSetObject:forKey:", v11, CFSTR("type"));
        objc_msgSend(v18, "fm_safeSetObject:forKey:", v17, CFSTR("cachedVersion"));

        objc_msgSend(v6, "addObject:", v18);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v8);
  }

  objc_msgSend(v20, "fm_safeSetObject:forKey:", v6, CFSTR("accessoryTypes"));
  return v20;
}

- (unint64_t)type
{
  return 1;
}

- (BOOL)canReplace:(id)a3
{
  return 0;
}

- (NSArray)accessoryTypes
{
  return self->_accessoryTypes;
}

- (void)setAccessoryTypes:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryTypes, a3);
}

- (NSString)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (FMDExtConfigurationRegistry)registry
{
  return self->_registry;
}

- (void)setRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_registry, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registry, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accessoryTypes, 0);
}

@end
