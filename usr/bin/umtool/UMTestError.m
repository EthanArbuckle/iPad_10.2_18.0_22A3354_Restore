@implementation UMTestError

+ (id)errorWithMessage:(id)a3
{
  id v3;
  id v4;
  void *v5;
  NSErrorUserInfoKey v7;
  id v8;

  if (a3)
  {
    v7 = NSLocalizedDescriptionKey;
    v8 = a3;
    v3 = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("UMTestDomain"), -1, v4));

  }
  else
  {
    v4 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("UMTestDomain"), -1, 0));
  }

  return v5;
}

@end
