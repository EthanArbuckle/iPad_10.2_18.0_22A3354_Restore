@implementation NSError

+ (NSError)errorWithCode:(int64_t)a3 internalError:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  id v11;

  v5 = a4;
  v6 = v5;
  if (v5)
  {
    v10 = CFSTR("internalError");
    v11 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.MediaServiceRequest"), a3, v7));

  return (NSError *)v8;
}

+ (NSError)errorWithBatchParseErrors:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  id v8;

  v7 = CFSTR("internalErrors");
  v8 = a3;
  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.MediaServiceRequest"), 3009, v4));

  return (NSError *)v5;
}

- (id)internalErrors
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.ap.MediaServiceRequest"))
    && (id)-[NSError code](self, "code") == (id)3009)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));

    if (!v4)
    {
      v5 = 0;
      return v5;
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("internalErrors")));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
