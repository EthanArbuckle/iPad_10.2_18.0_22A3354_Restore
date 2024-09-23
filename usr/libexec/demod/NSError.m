@implementation NSError

+ (id)errorDomainMSDWithCode:(int64_t)a3 message:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomainMSDCode:message:", a3, v5);

  return v6;
}

+ (id)errorDomainMSDWithCode:(int64_t)a3 message:(id)a4 reason:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  v9 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomainMSDCode:message:reason:", a3, v8, v7);

  return v9;
}

+ (id)masterServerErrorWithCode:(int64_t)a3 mesage:(id)a4 reason:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v10 = v9;
  if (v7)
    objc_msgSend(v9, "setObject:forKey:", v7, NSLocalizedDescriptionKey);
  if (v8)
    objc_msgSend(v10, "setObject:forKey:", v8, NSLocalizedFailureReasonErrorKey);
  v11 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("MSDMasterServerErrorDomain"), a3, v10);

  return v11;
}

+ (id)masterServerErrorRetryAfter:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("RetryAfter"));

  v5 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("MSDMasterServerErrorDomain"), 202, v4);
  return v5;
}

- (NSError)initWithDomainMSDCode:(int64_t)a3 message:(id)a4
{
  void *v6;
  NSError *v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", a4, NSLocalizedDescriptionKey));
  v7 = -[NSError initWithDomain:code:userInfo:](self, "initWithDomain:code:userInfo:", CFSTR("MSDDemodErrorDomain"), a3, v6);

  return v7;
}

- (NSError)initWithDomainMSDCode:(int64_t)a3 message:(id)a4 reason:(id)a5
{
  void *v7;
  NSError *v8;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", a4, NSLocalizedDescriptionKey, a5, NSLocalizedFailureReasonErrorKey, 0));
  v8 = -[NSError initWithDomain:code:userInfo:](self, "initWithDomain:code:userInfo:", CFSTR("MSDDemodErrorDomain"), a3, v7);

  return v8;
}

@end
