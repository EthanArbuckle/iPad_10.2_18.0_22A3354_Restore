@implementation NSError

+ (id)dkErrorWithCode:(int64_t)a3
{
  return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), a3, 0);
}

+ (id)dkErrorWithCode:(int64_t)a3 userInfo:(id)a4
{
  return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), a3, a4);
}

+ (id)hapErrorWithcode:(int64_t)a3 description:(id)a4 reason:(id)a5 suggestion:(id)a6 underlyingError:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = v14;
  if (v11 || v12 || v13 || v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    if (v11)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", v11, &stru_10023F210, 0));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, NSLocalizedDescriptionKey);

    }
    if (v12)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", v12, &stru_10023F210, 0));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, NSLocalizedFailureReasonErrorKey);

    }
    if (v13)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", v13, &stru_10023F210, 0));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v22, NSLocalizedRecoverySuggestionErrorKey);

    }
    if (v15)
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, NSUnderlyingErrorKey);
  }
  else
  {
    v16 = 0;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), a3, v16));

  return v23;
}

+ (NSError)errorWithOSStatus:(int)a3
{
  uint64_t v3;
  id v4;
  NSString *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  NSErrorUserInfoKey v12;
  const __CFString *v13;

  if (!a3)
    return (NSError *)0;
  v3 = *(_QWORD *)&a3;
  v4 = objc_alloc((Class)NSError);
  v12 = NSLocalizedDescriptionKey;
  v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v3, 0, 0));
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)v6;
  v8 = CFSTR("?");
  if (v6)
    v8 = (const __CFString *)v6;
  v13 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
  v10 = objc_msgSend(v4, "initWithDomain:code:userInfo:", NSOSStatusErrorDomain, (int)v3, v9);

  return (NSError *)v10;
}

+ (id)hapErrorWithcode:(int64_t)a3
{
  return objc_msgSend((id)objc_opt_class(a1, a2), "hapErrorWithcode:description:reason:suggestion:underlyingError:", a3, 0, 0, 0, 0);
}

- (BOOL)isHAPError
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("HAPErrorDomain"));

  return v3;
}

+ (id)hapErrorWithCode:(int64_t)a3
{
  return objc_msgSend((id)objc_opt_class(a1, a2), "hapErrorWithcode:description:reason:suggestion:underlyingError:", a3, 0, 0, 0, 0);
}

@end
