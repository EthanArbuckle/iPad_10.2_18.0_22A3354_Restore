@implementation NSURLResponse

- (BOOL)hasStatusCode:(int64_t)a3
{
  return -[NSURLResponse statusCode](self, "statusCode") == (id)a3;
}

- (BOOL)successful
{
  return -[NSURLResponse hasStatusCode:](self, "hasStatusCode:", 200);
}

- (BOOL)requiresAuthorization
{
  return -[NSURLResponse hasStatusCode:](self, "hasStatusCode:", 401);
}

- (id)metadata
{
  NSURLResponse *v2;
  NSURLResponse *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = self;
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLResponse allHeaderFields](v2, "allHeaderFields"));
    v5 = objc_msgSend(v4, "mutableCopy");

    if (!v5)
      v5 = objc_alloc_init((Class)NSMutableDictionary);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLResponse valueForHTTPHeaderField:](v3, "valueForHTTPHeaderField:", CFSTR("X-Apple-Server-Hint")));
    if (v6)
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, kTransparencyResponseMetadataKeyServerHint);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)responseValueForHeader:(id)a3
{
  if (self)
    self = (NSURLResponse *)objc_claimAutoreleasedReturnValue(-[NSURLResponse valueForHTTPHeaderField:](self, "valueForHTTPHeaderField:", a3));
  return self;
}

@end
