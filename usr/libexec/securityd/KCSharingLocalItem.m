@implementation KCSharingLocalItem

- (id)initPasskeyWithPrivateKeyDatabaseItem:(SecDbItem *)a3 error:(id *)a4
{
  KCSharingLocalItem *v6;
  KCSharingLocalItem *v7;
  KCSharingPrivateKeyCredential *v8;
  KCSharingPrivateKeyCredential *privateKey;
  KCSharingLocalFingerprint *v10;
  KCSharingLocalFingerprint *privateKeyFingerprint;
  KCSharingLocalItem *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)KCSharingLocalItem;
  v6 = -[KCSharingLocalItem init](&v14, "init");
  v7 = v6;
  if (!v6)
    goto LABEL_4;
  v6->_type = 1;
  v8 = -[KCSharingPrivateKeyCredential initWithDatabaseItem:error:]([KCSharingPrivateKeyCredential alloc], "initWithDatabaseItem:error:", a3, a4);
  privateKey = v7->_privateKey;
  v7->_privateKey = v8;

  if (!v7->_privateKey)
    goto LABEL_5;
  v10 = -[KCSharingLocalFingerprint initWithDatabaseItem:error:]([KCSharingLocalFingerprint alloc], "initWithDatabaseItem:error:", a3, a4);
  privateKeyFingerprint = v7->_privateKeyFingerprint;
  v7->_privateKeyFingerprint = v10;

  if (v7->_privateKeyFingerprint)
LABEL_4:
    v12 = v7;
  else
LABEL_5:
    v12 = 0;

  return v12;
}

- (id)initPasswordWithInternetPasswordDatabaseItem:(SecDbItem *)a3 error:(id *)a4
{
  KCSharingLocalItem *v6;
  KCSharingLocalItem *v7;
  KCSharingInternetPasswordCredential *v8;
  KCSharingInternetPasswordCredential *internetPassword;
  KCSharingLocalFingerprint *v10;
  KCSharingLocalFingerprint *internetPasswordFingerprint;
  KCSharingLocalItem *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)KCSharingLocalItem;
  v6 = -[KCSharingLocalItem init](&v14, "init");
  v7 = v6;
  if (!v6)
    goto LABEL_4;
  v6->_type = 2;
  v8 = -[KCSharingInternetPasswordCredential initWithDatabaseItem:error:]([KCSharingInternetPasswordCredential alloc], "initWithDatabaseItem:error:", a3, a4);
  internetPassword = v7->_internetPassword;
  v7->_internetPassword = v8;

  if (!v7->_internetPassword)
    goto LABEL_5;
  v10 = -[KCSharingLocalFingerprint initWithDatabaseItem:error:]([KCSharingLocalFingerprint alloc], "initWithDatabaseItem:error:", a3, a4);
  internetPasswordFingerprint = v7->_internetPasswordFingerprint;
  v7->_internetPasswordFingerprint = v10;

  if (v7->_internetPasswordFingerprint)
LABEL_4:
    v12 = v7;
  else
LABEL_5:
    v12 = 0;

  return v12;
}

- (unint64_t)hash
{
  unint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  result = self->_type;
  if (result == 1)
  {
    v4 = 24;
    v5 = 961;
    v6 = 16;
  }
  else
  {
    if (result != 2)
      return result;
    v4 = 40;
    v5 = 1922;
    v6 = 32;
  }
  v7 = objc_msgSend(*(id *)((char *)&self->super.isa + v6), "hash");
  return (unint64_t)objc_msgSend(*(id *)((char *)&self->super.isa + v4), "hash")
       + 32 * (_QWORD)v7
       + v5
       - (_QWORD)v7;
}

- (BOOL)isEqual:(id)a3
{
  KCSharingLocalItem *v4;
  KCSharingLocalItem *v5;
  id type;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unsigned __int8 v12;
  void *v13;

  v4 = (KCSharingLocalItem *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    if (-[KCSharingLocalItem isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class(self)))
    {
      v5 = v4;
      type = (id)self->_type;
      if (type == (id)-[KCSharingLocalItem type](v5, "type"))
      {
        v7 = self->_type;
        if (v7 == 2)
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingLocalItem internetPassword](self, "internetPassword"));
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingLocalItem internetPassword](v5, "internetPassword"));
          if (objc_msgSend(v8, "isEqual:", v9))
          {
            v10 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingLocalItem internetPasswordFingerprint](self, "internetPasswordFingerprint"));
            v11 = objc_claimAutoreleasedReturnValue(-[KCSharingLocalItem internetPasswordFingerprint](v5, "internetPasswordFingerprint"));
            goto LABEL_13;
          }
LABEL_14:
          v12 = 0;
          goto LABEL_15;
        }
        if (v7 == 1)
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingLocalItem privateKey](self, "privateKey"));
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingLocalItem privateKey](v5, "privateKey"));
          if (objc_msgSend(v8, "isEqual:", v9))
          {
            v10 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingLocalItem privateKeyFingerprint](self, "privateKeyFingerprint"));
            v11 = objc_claimAutoreleasedReturnValue(-[KCSharingLocalItem privateKeyFingerprint](v5, "privateKeyFingerprint"));
LABEL_13:
            v13 = (void *)v11;
            v12 = objc_msgSend(v10, "isEqual:", v11);

LABEL_15:
            goto LABEL_16;
          }
          goto LABEL_14;
        }
      }
      v12 = 0;
LABEL_16:

      goto LABEL_17;
    }
    v12 = 0;
  }
LABEL_17:

  return v12;
}

- (NSString)description
{
  void *v2;
  int64_t v4;
  void *v5;
  void *v6;
  NSString *v7;

  v4 = -[KCSharingLocalItem type](self, "type");
  if (v4 == 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingLocalItem internetPassword](self, "internetPassword"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingLocalItem internetPasswordFingerprint](self, "internetPasswordFingerprint"));
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("KCSharingLocalItem(password:%@ passwordFingerprint:%@)"), v5, v6);
    goto LABEL_5;
  }
  if (v4 == 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingLocalItem privateKey](self, "privateKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingLocalItem privateKeyFingerprint](self, "privateKeyFingerprint"));
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("KCSharingLocalItem(privateKey:%@ privateKeyFingerprint:%@)"), v5, v6);
LABEL_5:
    v2 = (void *)objc_claimAutoreleasedReturnValue(v7);

  }
  return (NSString *)v2;
}

- (KCSharingPrivateKeyCredential)privateKey
{
  void *v5;

  if (self->_type != 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("KCSharingLocalItem.m"), 96, CFSTR("Can't get private key for local item of type %ld"), self->_type);

  }
  return self->_privateKey;
}

- (KCSharingLocalFingerprint)privateKeyFingerprint
{
  void *v5;

  if (self->_type != 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("KCSharingLocalItem.m"), 101, CFSTR("Can't get private key fingerprint for local item of type %ld"), self->_type);

  }
  return self->_privateKeyFingerprint;
}

- (KCSharingInternetPasswordCredential)internetPassword
{
  void *v5;

  if (self->_type != 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("KCSharingLocalItem.m"), 106, CFSTR("Can't get Internet password for local item of type %ld"), self->_type);

  }
  return self->_internetPassword;
}

- (KCSharingLocalFingerprint)internetPasswordFingerprint
{
  void *v5;

  if (self->_type != 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("KCSharingLocalItem.m"), 111, CFSTR("Can't get Internet password fingerprint for local item of type %ld"), self->_type);

  }
  return self->_internetPasswordFingerprint;
}

- (NSDate)modificationDate
{
  void *v2;
  int64_t type;
  void *v4;
  void *v5;

  type = self->_type;
  if (type == 2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingLocalItem internetPassword](self, "internetPassword"));
    goto LABEL_5;
  }
  if (type == 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingLocalItem privateKey](self, "privateKey"));
LABEL_5:
    v5 = v4;
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "modificationDate"));

  }
  return (NSDate *)v2;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internetPasswordFingerprint, 0);
  objc_storeStrong((id *)&self->_internetPassword, 0);
  objc_storeStrong((id *)&self->_privateKeyFingerprint, 0);
  objc_storeStrong((id *)&self->_privateKey, 0);
}

@end
