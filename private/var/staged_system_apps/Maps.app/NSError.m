@implementation NSError

+ (id)_maps_cancellationError
{
  return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 3072, 0);
}

- (BOOL)_maps_isCancellation
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  if (objc_msgSend(v3, "isEqualToString:", NSCocoaErrorDomain))
    v4 = (id)-[NSError code](self, "code") == (id)3072;
  else
    v4 = 0;

  return v4;
}

- (BOOL)_maps_isErrorOfDomain:(id)a3 code:(int64_t)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  BOOL v9;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  v8 = objc_msgSend(v7, "isEqualToString:", v6);

  if (v8)
    v9 = -[NSError code](self, "code") == a4;
  else
    v9 = 0;

  return v9;
}

+ (id)searchErrorWithUserInfo:(id)a3
{
  return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("RoutingAppsStoreSuggestions.Search"), 100, a3);
}

+ (id)storePlatformErrorWithUserInfo:(id)a3
{
  return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("RoutingAppsStoreSuggestions.StorePlatform"), 100, a3);
}

@end
