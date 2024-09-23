@implementation NIServerKeychainItem

- (NIServerKeychainItem)initWithService:(id)a3 account:(id)a4 data:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NIServerKeychainItem *v13;
  NIServerKeychainItem *v14;
  const char *v16;
  int v17;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v9)
  {
    v16 = "service";
    v17 = 734;
    goto LABEL_10;
  }
  if (!v10)
  {
    v16 = "account";
    v17 = 735;
    goto LABEL_10;
  }
  if (!v11)
  {
    v16 = "data";
    v17 = 736;
LABEL_10:
    __assert_rtn("-[NIServerKeychainItem initWithService:account:data:]", "NIServerKeychainManager.mm", v17, v16);
  }
  v18.receiver = self;
  v18.super_class = (Class)NIServerKeychainItem;
  v13 = -[NIServerKeychainItem init](&v18, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_service, a3);
    objc_storeStrong((id *)&v14->_account, a4);
    objc_storeStrong((id *)&v14->_data, a5);
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NIServerKeychainItem initWithService:account:data:]([NIServerKeychainItem alloc], "initWithService:account:data:", self->_service, self->_account, self->_data);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NIServerKeychainItem *v7;
  NIServerKeychainItem *v8;
  NSString *service;
  NSString *v10;
  unsigned int v11;
  int v12;
  unint64_t account;
  NSString *v14;
  unsigned int v15;
  int v16;
  unint64_t data;
  _BOOL4 v18;
  unsigned int v19;
  BOOL v20;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (NIServerKeychainItem *)v4;
    v8 = v7;
    if (v7 == self)
    {
      v20 = 1;
    }
    else
    {
      service = v7->_service;
      v10 = self->_service;
      v11 = -[NSString isEqualToString:](service, "isEqualToString:", v10);
      if ((unint64_t)service | (unint64_t)v10)
        v12 = v11;
      else
        v12 = 1;
      account = (unint64_t)v8->_account;
      v14 = self->_account;
      v15 = objc_msgSend((id)account, "isEqualToString:", v14);
      if (account | (unint64_t)v14)
        v16 = v15;
      else
        v16 = 1;
      data = (unint64_t)v8->_data;
      v18 = (data | (unint64_t)self->_data) == 0;
      v19 = v16 & (v18 | objc_msgSend((id)data, "isEqualToData:"));
      if (v12)
        v20 = v19;
      else
        v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_service, "hash");
  v4 = -[NSString hash](self->_account, "hash") ^ v3;
  return v4 ^ (unint64_t)-[NSData hash](self->_data, "hash");
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
    v3 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), self->_data));
  else
    v3 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{length = %d}"), -[NSData length](self->_data, "length")));
  v4 = (void *)v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ -- %@ : %@>"), self->_service, self->_account, v3));

  return v5;
}

- (NSString)service
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)account
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
