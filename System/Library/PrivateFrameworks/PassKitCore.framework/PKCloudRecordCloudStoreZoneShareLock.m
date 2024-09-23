@implementation PKCloudRecordCloudStoreZoneShareLock

- (id)item
{
  return self->_cloudStoreZoneShareLock;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudRecordCloudStoreZoneShareLock)initWithCoder:(id)a3
{
  id v4;
  PKCloudRecordCloudStoreZoneShareLock *v5;
  uint64_t v6;
  PKCloudStoreZoneShareLock *cloudStoreZoneShareLock;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKCloudRecordCloudStoreZoneShareLock;
  v5 = -[PKCloudRecordObject initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cloudStoreZoneShareLock"));
    v6 = objc_claimAutoreleasedReturnValue();
    cloudStoreZoneShareLock = v5->_cloudStoreZoneShareLock;
    v5->_cloudStoreZoneShareLock = (PKCloudStoreZoneShareLock *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKCloudRecordCloudStoreZoneShareLock;
  v4 = a3;
  -[PKCloudRecordObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_cloudStoreZoneShareLock, CFSTR("cloudStoreZoneShareLock"), v5.receiver, v5.super_class);

}

- (int64_t)compare:(id)a3
{
  PKCloudStoreZoneShareLock *cloudStoreZoneShareLock;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  cloudStoreZoneShareLock = self->_cloudStoreZoneShareLock;
  v4 = a3;
  -[PKCloudStoreZoneShareLock originDeviceIdentifier](cloudStoreZoneShareLock, "originDeviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudStoreZoneShareLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "originDeviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "compare:", v7);

  return v8;
}

- (id)descriptionWithItem:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = a3;
  -[PKCloudRecordCloudStoreZoneShareLock _descriptionWithIncludeItem:](self, "_descriptionWithIncludeItem:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)PKCloudRecordCloudStoreZoneShareLock;
  -[PKCloudRecordObject descriptionWithItem:](&v8, sel_descriptionWithItem_, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n%@"), v6);

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  -[PKCloudRecordCloudStoreZoneShareLock _descriptionWithIncludeItem:](self, "_descriptionWithIncludeItem:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)PKCloudRecordCloudStoreZoneShareLock;
  -[PKCloudRecordObject description](&v6, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n%@"), v4);

  return v3;
}

- (id)_descriptionWithIncludeItem:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_cloudStoreZoneShareLock)
  {
    if (v3)
      objc_msgSend(v5, "appendFormat:", CFSTR("cloudStoreZoneShareLock: %@\n"), self->_cloudStoreZoneShareLock);
  }
  else
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("No associated cloudStoreZoneShareLock in database\n"), v8);
  }
  return v6;
}

- (void)applyCloudRecordObject:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  PKCloudStoreZoneShareLock *v8;
  PKCloudStoreZoneShareLock *cloudStoreZoneShareLock;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)PKCloudRecordCloudStoreZoneShareLock;
    -[PKCloudRecordObject applyCloudRecordObject:](&v10, sel_applyCloudRecordObject_, v4);
    v5 = v4;
    v6 = v5;
    if (!self->_cloudStoreZoneShareLock)
    {
      objc_msgSend(v5, "cloudStoreZoneShareLock");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v6, "cloudStoreZoneShareLock");
        v8 = (PKCloudStoreZoneShareLock *)objc_claimAutoreleasedReturnValue();
        cloudStoreZoneShareLock = self->_cloudStoreZoneShareLock;
        self->_cloudStoreZoneShareLock = v8;

      }
    }

  }
}

- (PKCloudStoreZoneShareLock)cloudStoreZoneShareLock
{
  return self->_cloudStoreZoneShareLock;
}

- (void)setCloudStoreZoneShareLock:(id)a3
{
  objc_storeStrong((id *)&self->_cloudStoreZoneShareLock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudStoreZoneShareLock, 0);
}

@end
