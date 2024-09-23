@implementation NSURLRequest

- (id)kt_requestId
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLRequest allHTTPHeaderFields](self, "allHTTPHeaderFields"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", off_1002A42C0));

  if (v3)
    v4 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v3);
  else
    v4 = 0;

  return v4;
}

@end
