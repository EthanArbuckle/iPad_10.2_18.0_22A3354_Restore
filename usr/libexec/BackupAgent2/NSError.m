@implementation NSError

- (NSError)excludingNotFound
{
  void *v3;
  unsigned __int8 v4;
  NSError *v5;

  if ((id)-[NSError code](self, "code") == (id)12
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain")),
        v4 = objc_msgSend(v3, "isEqualToString:", PQLSqliteErrorDomain),
        v3,
        (v4 & 1) != 0))
  {
    v5 = 0;
  }
  else
  {
    v5 = self;
  }
  return v5;
}

- (id)_errorWithSQL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSError *v9;
  void *v10;
  id v11;
  void *v12;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
    v6 = objc_msgSend(v5, "mutableCopy");
    v7 = v6;
    if (v6)
      v8 = v6;
    else
      v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v10 = v8;

    objc_msgSend(v10, "setObject:forKeyedSubscript:", v4, CFSTR("ExpandedSQL"));
    v11 = objc_alloc((Class)NSError);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
    v9 = (NSError *)objc_msgSend(v11, "initWithDomain:code:userInfo:", v12, -[NSError code](self, "code"), v10);

  }
  else
  {
    v9 = self;
  }
  return v9;
}

@end
