@implementation FMFURLSessionFactory

+ (id)sessionWithConfiguration:(id)a3
{
  return +[FMFURLSessionFactory sessionWithConfiguration:delegate:delegateQueue:](FMFURLSessionFactory, "sessionWithConfiguration:delegate:delegateQueue:", a3, 0, 0);
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
  double v14;
  void *v15;
  objc_class *v16;
  id v17;
  void *v18;
  FMFNSURLSession *v19;
  void *v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  v11 = objc_msgSend(v10, "isInternalBuild");

  if (v11
    && (v12 = +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("RedirectServerToFile"), CFSTR("com.apple.icloud.fmflocatord.notbackedup")), v13 = +[FMPreferencesUtil integerForKey:inDomain:](FMPreferencesUtil, "integerForKey:inDomain:", CFSTR("RequestTimeoutSeconds"), CFSTR("com.apple.icloud.fmflocatord.notbackedup")), v12))
  {
    v14 = (double)(uint64_t)v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAutomationHelperFactory sharedFactory](FMFAutomationHelperFactory, "sharedFactory"));
    v16 = (objc_class *)objc_msgSend(v15, "automationHelperClassWithName:", CFSTR("FMDFileURLSession"));

    v17 = [v16 alloc];
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "underlyingQueue"));
    v19 = (FMFNSURLSession *)objc_msgSend(v17, "initWithConfiguration:delegate:delegateQueue:", v7, v8, v18);

    -[FMFNSURLSession setRequestTimeout:](v19, "setRequestTimeout:", v14);
  }
  else
  {
    v19 = objc_alloc_init(FMFNSURLSession);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", v7, 0, v9));
    -[FMFNSURLSession setSession:](v19, "setSession:", v20);
    -[FMFNSURLSession setDelegate:](v19, "setDelegate:", v8);

  }
  return v19;
}

@end
