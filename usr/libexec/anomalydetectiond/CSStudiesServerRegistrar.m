@implementation CSStudiesServerRegistrar

- (CSStudiesServerRegistrar)initWithEndpoint:(id)a3 authorization:(id)a4 cellularAccess:(BOOL)a5 timeoutInSeconds:(unint64_t)a6
{
  _BOOL8 v7;
  id v11;
  id v12;
  CSStudiesServerRegistrar *v13;
  uint64_t v14;
  NSURLSessionConfiguration *config;
  objc_super v17;

  v7 = a5;
  v11 = a3;
  v12 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CSStudiesServerRegistrar;
  v13 = -[CSStudiesServerRegistrar init](&v17, "init");
  if (v13)
  {
    v14 = objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration ephemeralSessionConfiguration](NSURLSessionConfiguration, "ephemeralSessionConfiguration"));
    config = v13->_config;
    v13->_config = (NSURLSessionConfiguration *)v14;

    -[NSURLSessionConfiguration setAllowsCellularAccess:](v13->_config, "setAllowsCellularAccess:", v7);
    -[NSURLSessionConfiguration setHTTPAdditionalHeaders:](v13->_config, "setHTTPAdditionalHeaders:", &off_10036DC58);
    -[NSURLSessionConfiguration setWaitsForConnectivity:](v13->_config, "setWaitsForConnectivity:", 0);
    -[NSURLSessionConfiguration setTimeoutIntervalForResource:](v13->_config, "setTimeoutIntervalForResource:", (double)a6);
    objc_storeStrong((id *)&v13->_authorization, a4);
    objc_storeStrong((id *)&v13->_endpoint, a3);
  }

  return v13;
}

- (void)registerWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerRegistrar endpoint](self, "endpoint"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](NSMutableURLRequest, "requestWithURL:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerRegistrar authorization](self, "authorization"));
  objc_msgSend(v6, "setValue:forHTTPHeaderField:", v7, CFSTR("Authorization"));

  objc_msgSend(v6, "setHTTPMethod:", CFSTR("POST"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerRegistrar config](self, "config"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:](NSURLSession, "sessionWithConfiguration:", v8));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100015860;
  v12[3] = &unk_100346DD0;
  v13 = v4;
  v10 = v4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dataTaskWithRequest:completionHandler:", v6, v12));
  objc_msgSend(v11, "resume");

}

- (NSURL)endpoint
{
  return self->_endpoint;
}

- (NSString)authorization
{
  return self->_authorization;
}

- (NSURLSessionConfiguration)config
{
  return self->_config;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_authorization, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end
