@implementation JSAAssetRequest

+ (void)get:(id)a3 :(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[2];

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundlePath"));

  if (objc_msgSend(v8, "containsString:", v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v12 = objc_msgSend(v11, "fileExistsAtPath:", v8);

    v13 = v8;
    if ((v12 & 1) == 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v8));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastPathComponent"));

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathComponent:", v15));
    }
    v25 = 0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithContentsOfFile:encoding:error:](NSString, "stringWithContentsOfFile:encoding:error:", v13, 4, &v25));
    v17 = v25;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
    v19 = v16;
    if (!v16)
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v26[0] = v19;
    if (v17)
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedDescription"));
    else
      v20 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v21 = (void *)v20;
    v26[1] = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 2));
    objc_msgSend(v18, "enqueueValueCall:arguments:file:line:", v7, v22, CFSTR("JSAAssetRequest.m"), 36);

    if (!v16)
  }
  else
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_6FD0;
    v23[3] = &unk_9DE40;
    v24 = v7;
    objc_msgSend(a1, "get:completion:", v8, v23);
    v17 = v24;
    v13 = v8;
  }

}

+ (void)get:(id)a3 completion:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_718C;
  v7[3] = &unk_9DE68;
  v8 = a4;
  v6 = v8;
  objc_msgSend(a1, "requestWithURL:completionHandler:", a3, v7);

}

+ (void)requestWithURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", a3));
  v7 = objc_msgSend(objc_alloc((Class)NSURLRequest), "initWithURL:cachePolicy:timeoutInterval:", v6, 0, 30.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration defaultSessionConfiguration](NSURLSessionConfiguration, "defaultSessionConfiguration"));
  objc_msgSend(v8, "setHTTPShouldUsePipelining:", 1);
  objc_msgSend(v8, "setRequestCachePolicy:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLCache sharedURLCache](NSURLCache, "sharedURLCache"));
  objc_msgSend(v8, "setURLCache:", v9);

  objc_msgSend(v8, "setAllowsCellularAccess:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:](NSURLSession, "sessionWithConfiguration:", v8));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_73CC;
  v13[3] = &unk_9DE90;
  v14 = v5;
  v11 = v5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dataTaskWithRequest:completionHandler:", v7, v13));
  objc_msgSend(v12, "resume");

}

@end
