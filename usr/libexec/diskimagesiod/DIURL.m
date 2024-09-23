@implementation DIURL

+ (id)newDIURLWithNSURL:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  DIURL *v6;
  DIURL *v7;
  void *v8;

  v3 = a3;
  v5 = objc_opt_class(DIURL, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    v6 = (DIURL *)objc_msgSend(v3, "copy");
  }
  else
  {
    v7 = [DIURL alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "absoluteString"));
    v6 = -[DIURL initWithString:](v7, "initWithString:", v8);

  }
  return v6;
}

+ (id)newDIURLWithPluginName:(id)a3 params:(id)a4
{
  id v5;
  id v6;
  DIURL *v7;

  v5 = a3;
  v6 = a4;
  v7 = -[DIURL initWithPluginName:params:]([DIURL alloc], "initWithPluginName:params:", v5, v6);

  return v7;
}

- (DIURL)initWithPluginName:(id)a3 params:(id)a4
{
  id v7;
  void *v8;
  DIURL *v9;
  objc_super v11;

  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin://%@/"), a3));
  v11.receiver = self;
  v11.super_class = (Class)DIURL;
  v9 = -[DIURL initWithString:](&v11, "initWithString:", v8);

  if (v9)
    objc_storeStrong((id *)&v9->_pluginParams, a4);

  return v9;
}

- (BOOL)isPlugin
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIURL scheme](self, "scheme"));
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("plugin"));

  return v3;
}

- (NSString)pluginName
{
  void *v3;

  if (-[DIURL isPlugin](self, "isPlugin"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[DIURL host](self, "host"));
  else
    v3 = 0;
  return (NSString *)v3;
}

- (id)path
{
  void *v3;
  id v4;
  objc_super v6;

  if (-[DIURL isPlugin](self, "isPlugin"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[DIURL description](self, "description"));
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)DIURL;
    v4 = -[DIURL path](&v6, "path");
    v3 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }
  return v3;
}

- (id)description
{
  uint64_t v3;
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *__p[2];
  char v16;

  if (-[DIURL isPlugin](self, "isPlugin"))
  {
    v3 = sub_100061A30();
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[DIURL pluginName](self, "pluginName")));
    sub_100005870(__p, (char *)objc_msgSend(v4, "UTF8String"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIURL pluginParams](self, "pluginParams"));
    v6 = (__CFString *)sub_1000630C4(v3, (uint64_t)__p, (uint64_t)v5);

    if (v16 < 0)
      operator delete(__p[0]);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "scheme"));

    if (!v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin://%@"), v6));
      v10 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v9));

      v7 = (void *)v10;
    }
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "absoluteString"));
  }
  else
  {
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:", self, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DIURL password](self, "password"));

    if (v12)
      -[__CFString setPassword:](v6, "setPassword:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString URL](v6, "URL"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "absoluteString"));
  }
  v13 = (void *)v11;

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIURL)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  DIURL *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSSet *v23;
  void *v24;
  uint64_t v25;
  NSDictionary *pluginParams;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)DIURL;
  v6 = -[DIURL initWithCoder:](&v30, "initWithCoder:", v4);
  if (v6)
  {
    v29 = objc_opt_class(NSDate, v5);
    v28 = objc_opt_class(NSArray, v7);
    v9 = objc_opt_class(NSString, v8);
    v11 = objc_opt_class(NSNull, v10);
    v13 = objc_opt_class(NSNumber, v12);
    v15 = objc_opt_class(NSData, v14);
    v17 = objc_opt_class(NSOrderedSet, v16);
    v19 = objc_opt_class(NSDictionary, v18);
    v21 = objc_opt_class(NSError, v20);
    v23 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v29, v28, v9, v11, v13, v15, v17, v19, v21, objc_opt_class(NSFileHandle, v22), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("pluginParams")));
    pluginParams = v6->_pluginParams;
    v6->_pluginParams = (NSDictionary *)v25;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)DIURL;
  -[DIURL encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIURL pluginParams](self, "pluginParams"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("pluginParams"));

}

- (NSDictionary)pluginParams
{
  return self->_pluginParams;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginParams, 0);
}

@end
