@implementation UPModelIdentifier

- (UPModelIdentifier)initWithAppBundleId:(id)a3
{
  id v5;
  UPModelIdentifier *v6;
  uint64_t v7;
  NSUUID *uuid;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UPModelIdentifier;
  v6 = -[UPModelIdentifier init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = objc_claimAutoreleasedReturnValue();
    uuid = v6->_uuid;
    v6->_uuid = (NSUUID *)v7;

    objc_storeStrong((id *)&v6->_appBundleId, a3);
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  UPModelIdentifier *v5;
  uint64_t v6;
  NSUUID *uuid;
  uint64_t v8;
  NSString *appBundleId;

  v5 = -[UPModelIdentifier init](+[UPModelIdentifier allocWithZone:](UPModelIdentifier, "allocWithZone:"), "init");
  v6 = -[NSUUID copyWithZone:](self->_uuid, "copyWithZone:", a3);
  uuid = v5->_uuid;
  v5->_uuid = (NSUUID *)v6;

  v8 = -[NSString copyWithZone:](self->_appBundleId, "copyWithZone:", a3);
  appBundleId = v5->_appBundleId;
  v5->_appBundleId = (NSString *)v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", self->_uuid))
  {
    objc_msgSend(v4, "appBundleId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", self->_appBundleId);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSUUID hash](self->_uuid, "hash");
  return -[NSString hash](self->_appBundleId, "hash") ^ v3;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)appBundleId
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
