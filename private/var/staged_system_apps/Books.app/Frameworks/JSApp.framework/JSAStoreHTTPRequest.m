@implementation JSAStoreHTTPRequest

+ (void)prewarmOfflineCache
{
  id v2;

  v2 = +[_JSAStoreHTTPReqestOfflineCache sharedOfflineCache](_JSAStoreHTTPReqestOfflineCache, "sharedOfflineCache");
}

+ (void)incrementPostLaunchCacheCount
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[_JSAStoreHTTPReqestOfflineCache sharedOfflineCache](_JSAStoreHTTPReqestOfflineCache, "sharedOfflineCache"));
  objc_msgSend(v2, "incrementPostLaunchCacheCount");

}

- (void)send
{
  if (!self->_frozen)
  {
    self->_frozen = 1;
    sub_14A34(self);
  }
}

- (void)cancel
{
  NSURLSessionDataTask *dataTask;

  -[NSURLSessionDataTask cancel](self->_dataTask, "cancel");
  dataTask = self->_dataTask;
  self->_dataTask = 0;

}

- (void)setPriority:(float)a3
{
  NSURLSessionDataTask *dataTask;

  self->_priority = a3;
  dataTask = self->_dataTask;
  if (dataTask)
    -[NSURLSessionDataTask setPriority:](dataTask, "setPriority:");
}

- (JSAStoreHTTPRequest)init
{
  JSAStoreHTTPRequest *v2;
  JSAStoreHTTPRequest *v3;
  NSString *method;
  NSDictionary *v5;
  NSDictionary *queryItems;
  NSDictionary *v7;
  NSDictionary *headers;
  NSArray *lowercaseRestrictedHeaders;
  NSArray *v10;
  NSArray *cookiesToSuppress;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)JSAStoreHTTPRequest;
  v2 = -[JSAStoreHTTPRequest init](&v13, "init");
  v3 = v2;
  if (v2)
  {
    method = v2->_method;
    v2->_method = (NSString *)CFSTR("GET");

    v5 = objc_opt_new(NSDictionary);
    queryItems = v3->_queryItems;
    v3->_queryItems = v5;

    v7 = objc_opt_new(NSDictionary);
    headers = v3->_headers;
    v3->_headers = v7;

    v3->_timeout = 30.0;
    v3->_retryCount = 0;
    *(_DWORD *)&v3->_shouldSuppressResponseDialogs = 0x10000;
    v3->_frozen = 0;
    lowercaseRestrictedHeaders = v3->_lowercaseRestrictedHeaders;
    v3->_lowercaseRestrictedHeaders = (NSArray *)&off_A5C80;

    v10 = objc_opt_new(NSArray);
    cookiesToSuppress = v3->_cookiesToSuppress;
    v3->_cookiesToSuppress = v10;

  }
  return v3;
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(id, _QWORD, void *);
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  NSErrorUserInfoKey v21;
  void *v22;

  v8 = a6;
  v9 = a5;
  if (-[JSAStoreHTTPRequest shouldSuppressResponseDialogs](self, "shouldSuppressResponseDialogs"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[JSAStoreHTTPRequest url](self, "url"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "message"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[JSAStoreHTTPRequest] (%@) caller suppressed dialog of title '%@' and message '%@'"), v10, v11, v12));
    v14 = (void (**)(id, _QWORD, void *))objc_retainBlock(v8);

    if (v14)
    {
      v21 = NSLocalizedDescriptionKey;
      v22 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("JSAErrorDomain"), 970, v15));
      v14[2](v14, 0, v16);

    }
  }
  else
  {
    v17 = objc_alloc((Class)AMSUIAlertDialogTask);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIViewController jsa_topMostViewControllerForWindow:](UIViewController, "jsa_topMostViewControllerForWindow:", 0));
    v20 = objc_msgSend(v17, "initWithRequest:presentingViewController:", v9, v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "present"));
    objc_msgSend(v19, "addFinishBlock:", v8);

  }
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a6;
  v8 = a5;
  v9 = objc_alloc((Class)AMSUIAuthenticateTask);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIViewController jsa_topMostViewControllerForWindow:](UIViewController, "jsa_topMostViewControllerForWindow:", 0));
  v12 = objc_msgSend(v9, "initWithRequest:presentingViewController:", v8, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "performAuthentication"));
  objc_msgSend(v11, "addFinishBlock:", v7);

}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v7 = a6;
  v8 = a5;
  v13 = (id)objc_claimAutoreleasedReturnValue(+[BUBag defaultBag](BUBag, "defaultBag"));
  v9 = objc_alloc((Class)AMSUIEngagementTask);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIViewController jsa_topMostViewControllerForWindow:](UIViewController, "jsa_topMostViewControllerForWindow:", 0));
  v11 = objc_msgSend(v9, "initWithRequest:bag:presentingViewController:", v8, v13, v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "presentEngagement"));
  objc_msgSend(v12, "addFinishBlock:", v7);

}

- (void)setUrl:(id)a3
{
  id v4;
  NSURL *v5;
  NSURL *url;
  id v7;
  NSObject *v8;

  v4 = a3;
  if (!self->_frozen)
  {
    v5 = (NSURL *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v4));
    url = self->_url;
    self->_url = v5;

    if (!self->_url)
    {
      v7 = JSALog();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_723A8();

    }
  }

}

- (NSString)url
{
  return -[NSURL absoluteString](self->_url, "absoluteString");
}

- (void)setMethod:(id)a3
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;

  v5 = a3;
  v6 = v5;
  if (!self->_frozen)
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("GET")) & 1) != 0
      || (objc_msgSend(v6, "isEqualToString:", CFSTR("HEAD")) & 1) != 0
      || (objc_msgSend(v6, "isEqualToString:", CFSTR("POST")) & 1) != 0
      || (objc_msgSend(v6, "isEqualToString:", CFSTR("PUT")) & 1) != 0
      || (objc_msgSend(v6, "isEqualToString:", CFSTR("PATCH")) & 1) != 0
      || objc_msgSend(v6, "isEqualToString:", CFSTR("DELETE")))
    {
      objc_storeStrong((id *)&self->_method, a3);
    }
    else
    {
      v7 = JSALog();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_72418();

    }
  }

}

- (NSString)method
{
  return self->_method;
}

- (void)setBody:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (!self->_frozen)
  {
    v6 = v5;
    objc_storeStrong(&self->_body, a3);
    v5 = v6;
  }

}

- (id)body
{
  return self->_body;
}

- (void)setQueryItems:(id)a3
{
  NSDictionary *v4;
  NSDictionary *queryItems;

  if (!self->_frozen)
  {
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "jsa_stringDictionaryForRequestHeaderOrURLParam"));
    queryItems = self->_queryItems;
    self->_queryItems = v4;

  }
}

- (NSDictionary)queryItems
{
  return self->_queryItems;
}

- (void)setHeaders:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  NSDictionary *v9;
  NSDictionary *headers;
  _QWORD v11[4];
  NSMutableDictionary *v12;
  id v13;
  id location;

  v4 = a3;
  v5 = v4;
  if (!self->_frozen)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "jsa_stringDictionaryForRequestHeaderOrURLParam"));
    v7 = objc_opt_new(NSMutableDictionary);
    objc_initWeak(&location, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_16400;
    v11[3] = &unk_9E7D0;
    objc_copyWeak(&v13, &location);
    v8 = v7;
    v12 = v8;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v11);
    v9 = (NSDictionary *)-[NSMutableDictionary copy](v8, "copy");
    headers = self->_headers;
    self->_headers = v9;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

  }
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (void)setTimeout:(id)a3
{
  double v4;

  if (!self->_frozen)
  {
    objc_msgSend(a3, "doubleValue");
    self->_timeout = v4;
  }
}

- (NSNumber)timeout
{
  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timeout);
}

- (void)setRetryCount:(id)a3
{
  if (!self->_frozen)
    self->_retryCount = (int64_t)objc_msgSend(a3, "integerValue");
}

- (NSNumber)retryCount
{
  return +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_retryCount);
}

- (void)setShouldSuppressResponseDialogs:(BOOL)a3
{
  if (!self->_frozen)
    self->_shouldSuppressResponseDialogs = a3;
}

- (BOOL)shouldSuppressResponseDialogs
{
  return self->_shouldSuppressResponseDialogs;
}

- (void)setShouldSuppressMetrics:(BOOL)a3
{
  if (!self->_frozen)
    self->_shouldSuppressMetrics = a3;
}

- (BOOL)shouldSuppressMetrics
{
  return self->_shouldSuppressMetrics;
}

- (void)setPersonalized:(BOOL)a3
{
  if (!self->_frozen)
    self->_personalized = a3;
}

- (BOOL)personalized
{
  return self->_personalized;
}

- (void)setCookiesToSuppress:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (!self->_frozen)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_cookiesToSuppress, a3);
    v5 = v6;
  }

}

- (NSArray)cookiesToSuppress
{
  return self->_cookiesToSuppress;
}

- (void)setDisableATS:(BOOL)a3
{
  if (!self->_frozen)
    self->_disableATS = a3;
}

- (BOOL)disableATS
{
  return self->_disableATS;
}

- (void)setOnResponse:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (!self->_frozen)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_onResponse, a3);
    v5 = v6;
  }

}

- (JSValue)onResponse
{
  return self->_onResponse;
}

- (void)setCompletion:(id)a3
{
  id v4;
  id completion;

  if (!self->_frozen)
  {
    v4 = objc_retainBlock(a3);
    completion = self->_completion;
    self->_completion = v4;

  }
}

- (float)priority
{
  return self->_priority;
}

- (id)completion
{
  return self->_completion;
}

- (BOOL)frozen
{
  return self->_frozen;
}

- (void)setFrozen:(BOOL)a3
{
  self->_frozen = a3;
}

- (NSArray)lowercaseRestrictedHeaders
{
  return self->_lowercaseRestrictedHeaders;
}

- (void)setLowercaseRestrictedHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_lowercaseRestrictedHeaders, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowercaseRestrictedHeaders, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_cookiesToSuppress, 0);
  objc_storeStrong((id *)&self->_onResponse, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_queryItems, 0);
  objc_storeStrong(&self->_body, 0);
  objc_storeStrong((id *)&self->_method, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
