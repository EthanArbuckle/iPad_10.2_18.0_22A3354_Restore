@implementation FMDServerConfig

+ (id)sharedInstance
{
  if (qword_100306868 != -1)
    dispatch_once(&qword_100306868, &stru_1002C4650);
  return (id)qword_100306860;
}

- (FMDServerConfig)init
{
  FMDServerConfig *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
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
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v27;
  objc_super v28;
  uint8_t buf[4];
  void *v30;

  v28.receiver = self;
  v28.super_class = (Class)FMDServerConfig;
  v2 = -[FMDServerConfig init](&v28, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "productType"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "productName"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "productVersion"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "buildVersion"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleIdentifier"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/1"), v12));
    v27 = (void *)v6;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@> <%@;%@;%@> <%@/1 (%@)>"),
                      v4,
                      v6,
                      v8,
                      v10,
                      v12,
                      v13));
    -[FMDServerConfig setMmeClientInfo:](v2, "setMmeClientInfo:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("FMDClient/%@ %@/%@"), CFSTR("6.0"), v4, v10));
    -[FMDServerConfig setUserAgent:](v2, "setUserAgent:", v15);

    v16 = sub_1000031B8();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServerConfig mmeClientInfo](v2, "mmeClientInfo"));
      *(_DWORD *)buf = 138412290;
      v30 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "mmeClientInfo = %@", buf, 0xCu);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/FindMyDevice.framework")));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "pathForResource:ofType:", CFSTR("URLTemplates"), CFSTR("plist")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v20));
    -[FMDServerConfig setUrlTemplates:](v2, "setUrlTemplates:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServerConfig urlTemplates](v2, "urlTemplates"));
    v23 = objc_msgSend(v22, "count");

    if (!v23)
    {
      v24 = sub_1000031B8();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v20;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "No URL templates found at path: %@", buf, 0xCu);
      }

    }
  }
  return v2;
}

- (id)urlTemplateForRequestType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServerConfig urlTemplates](self, "urlTemplates"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  if (!v6)
  {
    v7 = sub_1000031B8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Could not find url template for request type: %@", (uint8_t *)&v10, 0xCu);
    }

  }
  return v6;
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
  objc_storeStrong((id *)&self->_userAgent, a3);
}

- (NSString)mmeClientInfo
{
  return self->_mmeClientInfo;
}

- (void)setMmeClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_mmeClientInfo, a3);
}

- (NSDictionary)urlTemplates
{
  return self->_urlTemplates;
}

- (void)setUrlTemplates:(id)a3
{
  objc_storeStrong((id *)&self->_urlTemplates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlTemplates, 0);
  objc_storeStrong((id *)&self->_mmeClientInfo, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
}

@end
