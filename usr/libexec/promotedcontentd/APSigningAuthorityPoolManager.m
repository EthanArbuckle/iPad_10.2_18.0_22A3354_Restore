@implementation APSigningAuthorityPoolManager

+ (id)sharedInstance
{
  id v2;
  void *v3;
  id v4;
  void *v5;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[APUniversalSingleton sharedInstance](APUniversalSingleton, "sharedInstance"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "signingAuthorityPoolManager"));

  if (!v4)
  {
    v4 = objc_msgSend(objc_alloc((Class)APSigningAuthorityPoolManager), "initWithName:poolSize:numberToStash:setupCompletion:", CFSTR("pcd_default_pool"), 2, 2, &stru_10020E078);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[APUniversalSingleton sharedInstance](APUniversalSingleton, "sharedInstance"));
    objc_msgSend(v5, "setSigningAuthorityPoolManager:", v4);

  }
  objc_sync_exit(v2);

  return v4;
}

@end
