@implementation APLegacyInterfaceError

+ (id)createErrorWithDomain:(id)a3 code:(int)a4 reason:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSErrorUserInfoKey v13;
  void *v14;

  v7 = a3;
  v8 = a5;
  v9 = v8;
  if (v8 && objc_msgSend(v8, "length"))
  {
    v13 = NSLocalizedDescriptionKey;
    v14 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  }
  else
  {
    v10 = 0;
  }
  v11 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", v7, a4, v10);

  return v11;
}

+ (id)validationErrorWithCode:(int64_t)a3 andReason:(id)a4
{
  return +[APLegacyInterfaceError createErrorWithDomain:code:reason:](APLegacyInterfaceError, "createErrorWithDomain:code:reason:", CFSTR("com.apple.ap.AdValidationErrorDomain"), a3, a4);
}

+ (id)discardedErrorWithCode:(int64_t)a3 andReason:(id)a4
{
  return +[APLegacyInterfaceError createErrorWithDomain:code:reason:](APLegacyInterfaceError, "createErrorWithDomain:code:reason:", CFSTR("com.apple.ap.DaemonDiscardedErrorDomain"), a3, a4);
}

+ (id)invalidRequestErrorWithCode:(int64_t)a3 reason:(id)a4
{
  return +[APLegacyInterfaceError createErrorWithDomain:code:reason:](APLegacyInterfaceError, "createErrorWithDomain:code:reason:", CFSTR("com.apple.ap.InvalidRequestErrorDomain"), a3, a4);
}

@end
