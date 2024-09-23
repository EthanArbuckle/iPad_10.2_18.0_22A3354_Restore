@implementation CKKSCurrentItemData

- (CKKSCurrentItemData)initWithUUID:(id)a3
{
  id v4;
  CKKSCurrentItemData *v5;
  CKKSCurrentItemData *v6;
  CKKSCurrentItemData *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKKSCurrentItemData;
  v5 = -[CKKSCurrentItemData init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    -[CKKSCurrentItemData setUuid:](v5, "setUuid:", v4);
    v7 = v6;
  }

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentItemData uuid](self, "uuid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentItemData modificationDate](self, "modificationDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CKKSCurrentItemData(%@, mtime: %@)"), v3, v4));

  return v5;
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDate)modificationDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setModificationDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
