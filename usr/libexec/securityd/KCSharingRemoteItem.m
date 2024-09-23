@implementation KCSharingRemoteItem

- (KCSharingRemoteItem)initWithLocalItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  KCSharingRemoteItem *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  if (v5 == (id)2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "internetPassword"));
    v7 = -[KCSharingRemoteItem initPasswordWithInternetPassword:](self, "initPasswordWithInternetPassword:", v6);
  }
  else
  {
    if (v5 != (id)1)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "privateKey"));
    v7 = -[KCSharingRemoteItem initPasskeyWithPrivateKey:](self, "initPasskeyWithPrivateKey:", v6);
  }
  self = (KCSharingRemoteItem *)v7;

  v8 = self;
LABEL_7:

  return v8;
}

- (id)initPasskeyWithPrivateKey:(id)a3
{
  id v5;
  KCSharingRemoteItem *v6;
  KCSharingRemoteItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KCSharingRemoteItem;
  v6 = -[KCSharingRemoteItem init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    v6->_type = 1;
    objc_storeStrong((id *)&v6->_privateKey, a3);
  }

  return v7;
}

- (id)initPasswordWithInternetPassword:(id)a3
{
  id v5;
  KCSharingRemoteItem *v6;
  KCSharingRemoteItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KCSharingRemoteItem;
  v6 = -[KCSharingRemoteItem init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    v6->_type = 2;
    objc_storeStrong((id *)&v6->_internetPassword, a3);
  }

  return v7;
}

- (id)initPasskeyWithProto:(id)a3 sharingGroup:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  KCSharingPrivateKeyCredential *v10;
  void *v11;
  KCSharingPrivateKeyCredential *v12;
  KCSharingRemoteItem *v13;

  v8 = a4;
  v9 = a3;
  v10 = [KCSharingPrivateKeyCredential alloc];
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "privateKey"));

  v12 = -[KCSharingPrivateKeyCredential initWithProto:sharingGroup:error:](v10, "initWithProto:sharingGroup:error:", v11, v8, a5);
  if (v12)
  {
    self = (KCSharingRemoteItem *)-[KCSharingRemoteItem initPasskeyWithPrivateKey:](self, "initPasskeyWithPrivateKey:", v12);
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)initPasswordWithProto:(id)a3 sharingGroup:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  KCSharingInternetPasswordCredential *v10;
  void *v11;
  KCSharingInternetPasswordCredential *v12;
  KCSharingRemoteItem *v13;

  v8 = a4;
  v9 = a3;
  v10 = [KCSharingInternetPasswordCredential alloc];
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "internetPassword"));

  v12 = -[KCSharingInternetPasswordCredential initWithProto:sharingGroup:error:](v10, "initWithProto:sharingGroup:error:", v11, v8, a5);
  if (v12)
  {
    self = (KCSharingRemoteItem *)-[KCSharingRemoteItem initPasswordWithInternetPassword:](self, "initPasswordWithInternetPassword:", v12);
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  unint64_t type;
  uint64_t v3;
  uint64_t v4;

  type = self->_type;
  if (type == 1)
  {
    v3 = 31;
    v4 = 16;
    return (unint64_t)objc_msgSend(*(id *)((char *)&self->super.isa + v4), "hash") + v3;
  }
  if (type == 2)
  {
    v3 = 62;
    v4 = 24;
    return (unint64_t)objc_msgSend(*(id *)((char *)&self->super.isa + v4), "hash") + v3;
  }
  return type;
}

- (BOOL)isEqual:(id)a3
{
  KCSharingRemoteItem *v4;
  KCSharingRemoteItem *v5;
  id type;
  int64_t v7;
  void *v8;
  uint64_t v9;
  unsigned __int8 v10;
  void *v11;

  v4 = (KCSharingRemoteItem *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    if (-[KCSharingRemoteItem isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class(self)))
    {
      v5 = v4;
      type = (id)self->_type;
      if (type == (id)-[KCSharingRemoteItem type](v5, "type"))
      {
        v7 = self->_type;
        if (v7 == 2)
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingRemoteItem internetPassword](self, "internetPassword"));
          v9 = objc_claimAutoreleasedReturnValue(-[KCSharingRemoteItem internetPassword](v5, "internetPassword"));
          goto LABEL_11;
        }
        if (v7 == 1)
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingRemoteItem privateKey](self, "privateKey"));
          v9 = objc_claimAutoreleasedReturnValue(-[KCSharingRemoteItem privateKey](v5, "privateKey"));
LABEL_11:
          v11 = (void *)v9;
          v10 = objc_msgSend(v8, "isEqual:", v9);

          goto LABEL_12;
        }
      }
      v10 = 0;
LABEL_12:

      goto LABEL_13;
    }
    v10 = 0;
  }
LABEL_13:

  return v10;
}

- (NSString)description
{
  void *v2;
  int64_t v4;
  void *v5;
  NSString *v6;

  v4 = -[KCSharingRemoteItem type](self, "type");
  if (v4 == 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingRemoteItem internetPassword](self, "internetPassword"));
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("KCSharingRemoteItem(password:%@)"), v5);
    goto LABEL_5;
  }
  if (v4 == 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingRemoteItem privateKey](self, "privateKey"));
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("KCSharingRemoteItem(privateKey:%@)"), v5);
LABEL_5:
    v2 = (void *)objc_claimAutoreleasedReturnValue(v6);

  }
  return (NSString *)v2;
}

- (KCSharingPrivateKeyCredential)privateKey
{
  void *v5;

  if (self->_type != 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("KCSharingRemoteItem.m"), 110, CFSTR("Can't get private key for remote item of type %ld"), self->_type);

  }
  return self->_privateKey;
}

- (KCSharingInternetPasswordCredential)internetPassword
{
  void *v5;

  if (self->_type != 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("KCSharingRemoteItem.m"), 115, CFSTR("Can't get Internet password for remote item of type %ld"), self->_type);

  }
  return self->_internetPassword;
}

- (id)proto
{
  int64_t type;
  KCSharingPBRemoteItem *v4;
  void *v5;

  type = self->_type;
  if (type == 2)
  {
    v4 = objc_opt_new(KCSharingPBRemoteItem);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingInternetPasswordCredential proto](self->_internetPassword, "proto"));
    -[KCSharingPBRemoteItem setInternetPassword:](v4, "setInternetPassword:", v5);
  }
  else
  {
    if (type != 1)
    {
      v4 = 0;
      return v4;
    }
    v4 = objc_opt_new(KCSharingPBRemoteItem);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential proto](self->_privateKey, "proto"));
    -[KCSharingPBRemoteItem setPrivateKey:](v4, "setPrivateKey:", v5);
  }

  return v4;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internetPassword, 0);
  objc_storeStrong((id *)&self->_privateKey, 0);
}

@end
