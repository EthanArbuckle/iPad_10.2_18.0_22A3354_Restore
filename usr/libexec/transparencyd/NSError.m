@implementation NSError

+ (NSError)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5
{
  return +[NSError errorWithDomain:code:description:underlying:](NSError, "errorWithDomain:code:description:underlying:", a3, a4, a5, 0);
}

+ (NSError)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5 underlying:(id)a6
{
  return (NSError *)objc_msgSend(a1, "errorWithDomain:code:userInfo:description:underlying:", a3, a4, 0, a5, a6);
}

+ (NSError)errorWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5 description:(id)a6 underlying:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v11 = a7;
  v12 = a6;
  v13 = a3;
  if (a5)
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", a5));
  else
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v15 = v14;
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, NSLocalizedDescriptionKey);

  objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, NSUnderlyingErrorKey);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v13, a4, v15));

  return (NSError *)v16;
}

@end
