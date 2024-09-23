@implementation NSError

+ (id)_cl_DurianErrorWithCode:(int64_t)a3
{
  NSDictionary *v4;
  NSErrorUserInfoKey v6;
  const __CFString *v7;

  v6 = NSLocalizedDescriptionKey;
  v7 = sub_101536DEC(a3);
  v4 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1);
  return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCLErrorDomainPrivate, a3, v4);
}

+ (id)_cl_DurianFeatureNotSupportedError
{
  return _objc_msgSend(a1, "_cl_DurianErrorWithCode:", 38);
}

@end
