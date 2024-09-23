@implementation APAppDownloaderDataAdaptor

+ (id)identifier
{
  return CFSTR("com.apple.ap.apps");
}

- (void)_run:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APAppDownloaderDataAdaptor downloadedApps](self, "downloadedApps"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("included")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("excluded")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v9));

  if (objc_msgSend(v7, "intersectsSet:", v4))
    v11 = objc_msgSend(v10, "intersectsSet:", v4) ^ 1;
  else
    v11 = 0;
  if (v13)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v11));
    (*((void (**)(id, void *, _QWORD, _QWORD))v13 + 2))(v13, v12, 0, 0);

  }
}

- (BOOL)_validateParameters:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)APAppDownloaderDataAdaptor;
  if (!-[APDataAdaptor _validateParameters:](&v11, "_validateParameters:"))
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("included")));
  if (-[APDataAdaptor _checkClassType:name:expectedClass:error:](self, "_checkClassType:name:expectedClass:error:", v6, CFSTR("included"), objc_opt_class(NSArray), a3))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("excluded")));
    v9 = -[APDataAdaptor _checkClassType:name:expectedClass:error:](self, "_checkClassType:name:expectedClass:error:", v8, CFSTR("excluded"), objc_opt_class(NSArray), a3);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)downloadedApps
{
  return 0;
}

@end
