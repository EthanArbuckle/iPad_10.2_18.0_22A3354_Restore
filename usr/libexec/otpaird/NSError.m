@implementation NSError

+ (NSError)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5
{
  return +[NSError errorWithDomain:code:description:underlying:](NSError, "errorWithDomain:code:description:underlying:", a3, a4, a5, 0);
}

+ (NSError)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5 underlying:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v9 = a6;
  v10 = a5;
  v11 = a3;
  v12 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, NSLocalizedDescriptionKey);

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, NSUnderlyingErrorKey);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v11, a4, v12));

  return (NSError *)v13;
}

@end
