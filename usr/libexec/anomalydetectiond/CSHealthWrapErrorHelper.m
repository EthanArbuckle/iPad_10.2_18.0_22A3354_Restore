@implementation CSHealthWrapErrorHelper

+ (void)assignError:(id *)a3 code:(int64_t)a4 description:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  NSErrorUserInfoKey v10;
  id v11;

  if (a3)
  {
    v10 = NSLocalizedDescriptionKey;
    v11 = a5;
    v7 = a5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coresafety.healthwrap"), a4, v8));

    *a3 = v9;
  }
}

+ (void)assignError:(id *)a3 code:(int)a4 format:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;

  v8 = a5;
  v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v8, &v10);

  objc_msgSend(a1, "assignError:code:description:", a3, a4, v9);
}

@end
