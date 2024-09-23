@implementation NSError

+ (id)observerErrorWithUnderlyingErrors:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  NSErrorUserInfoKey v8;
  id v9;

  v8 = NSMultipleUnderlyingErrorsKey;
  v9 = a3;
  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
  v5 = objc_alloc((Class)NSError);

  v6 = objc_msgSend(v5, "initWithDomain:code:userInfo:", CFSTR("com.apple.DocumentManager.SourceObserver"), 1, v4);
  return v6;
}

@end
