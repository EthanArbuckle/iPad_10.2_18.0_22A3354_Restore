@implementation FMDURLSessionFactory

+ (id)sessionWithConfiguration:(id)a3
{
  return +[FMDURLSessionFactory sessionWithConfiguration:delegate:delegateQueue:](FMDURLSessionFactory, "sessionWithConfiguration:delegate:delegateQueue:", a3, 0, 0);
}

+ (id)sessionWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  unsigned int v11;
  unsigned int v12;
  id v13;
  id v14;
  _BOOL8 v15;
  double v16;
  void *v17;
  objc_class *v18;
  id v19;
  void *v20;
  FMDNSURLSession *v21;
  void *v22;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  v11 = objc_msgSend(v10, "isInternalBuild");

  if (v11
    && (v12 = +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("RedirectServerToFile"), kFMDNotBackedUpPrefDomain), v13 = +[FMPreferencesUtil integerForKey:inDomain:](FMPreferencesUtil, "integerForKey:inDomain:", CFSTR("RequestTimeoutSeconds"), kFMDNotBackedUpPrefDomain), v14 = +[FMPreferencesUtil integerForKey:inDomain:](FMPreferencesUtil, "integerForKey:inDomain:", CFSTR("UseSimpleFilePath"), kFMDNotBackedUpPrefDomain), v12))
  {
    v15 = v14 != 0;
    v16 = (double)(uint64_t)v13;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAutomationHelperFactory sharedFactory](FMDAutomationHelperFactory, "sharedFactory"));
    v18 = (objc_class *)objc_msgSend(v17, "automationHelperClassWithName:", CFSTR("FMDFileURLSession"));

    v19 = [v18 alloc];
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "underlyingQueue"));
    v21 = (FMDNSURLSession *)objc_msgSend(v19, "initWithConfiguration:delegate:delegateQueue:", v7, v8, v20);

    -[FMDNSURLSession setRequestTimeout:](v21, "setRequestTimeout:", v16);
    -[FMDNSURLSession setUseSimpleFilePath:](v21, "setUseSimpleFilePath:", v15);
  }
  else
  {
    v21 = objc_alloc_init(FMDNSURLSession);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", v7, v21, v9));
    -[FMDNSURLSession setSession:](v21, "setSession:", v22);
    -[FMDNSURLSession setDelegate:](v21, "setDelegate:", v8);

  }
  return v21;
}

@end
