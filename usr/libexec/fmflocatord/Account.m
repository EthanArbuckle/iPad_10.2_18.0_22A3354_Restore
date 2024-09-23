@implementation Account

- (Account)init
{
  Account *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)Account;
  v2 = -[Account init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
    -[Account setUuid:](v2, "setUuid:", v4);

  }
  return v2;
}

- (BOOL)supportsMultipleActiveAccounts
{
  return 0;
}

- (NSString)uniqueId
{
  return 0;
}

- (BOOL)isValid
{
  return 1;
}

- (BOOL)hasSameRelevantInfoAs:(id)a3
{
  void *v3;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v6 = a3;
  if (v6 && objc_msgSend(v6, "isMemberOfClass:", objc_opt_class(self, v5)))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueId"));
    if (v7 || (v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueId"))) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueId"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[Account uniqueId](self, "uniqueId"));
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

      if (v7)
      {
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      v10 = 1;
    }

    goto LABEL_10;
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
