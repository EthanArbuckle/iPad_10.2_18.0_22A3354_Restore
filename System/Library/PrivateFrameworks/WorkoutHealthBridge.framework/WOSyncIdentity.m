@implementation WOSyncIdentity

- (WOSyncIdentity)initWithHardwareIdentifier:(id)a3 databaseIdentifier:(id)a4 instanceDiscriminator:(id)a5
{
  id v8;
  id v9;
  id v10;
  WOSyncIdentity *v11;
  uint64_t v12;
  NSUUID *hardwareIdentifier;
  uint64_t v14;
  NSUUID *databaseIdentifier;
  uint64_t v16;
  NSString *instanceDiscriminator;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)WOSyncIdentity;
  v11 = -[WOSyncIdentity init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    hardwareIdentifier = v11->_hardwareIdentifier;
    v11->_hardwareIdentifier = (NSUUID *)v12;

    v14 = objc_msgSend(v9, "copy");
    databaseIdentifier = v11->_databaseIdentifier;
    v11->_databaseIdentifier = (NSUUID *)v14;

    v16 = objc_msgSend(v10, "copy");
    instanceDiscriminator = v11->_instanceDiscriminator;
    v11->_instanceDiscriminator = (NSString *)v16;

  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  WOSyncIdentity *v4;
  NSUUID *hardwareIdentifier;
  void *v6;
  NSUUID *databaseIdentifier;
  void *v8;
  NSString *instanceDiscriminator;
  void *v10;
  char v11;

  v4 = (WOSyncIdentity *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      hardwareIdentifier = self->_hardwareIdentifier;
      -[WOSyncIdentity hardwareIdentifier](v4, "hardwareIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSUUID isEqual:](hardwareIdentifier, "isEqual:", v6))
      {
        databaseIdentifier = self->_databaseIdentifier;
        -[WOSyncIdentity databaseIdentifier](v4, "databaseIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSUUID isEqual:](databaseIdentifier, "isEqual:", v8))
        {
          instanceDiscriminator = self->_instanceDiscriminator;
          -[WOSyncIdentity instanceDiscriminator](v4, "instanceDiscriminator");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = -[NSString isEqual:](instanceDiscriminator, "isEqual:", v10);

        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *hardwareIdentifier;
  id v5;

  hardwareIdentifier = self->_hardwareIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", hardwareIdentifier, CFSTR("hwID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_databaseIdentifier, CFSTR("dbID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_instanceDiscriminator, CFSTR("instanceDisc"));

}

- (WOSyncIdentity)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  WOSyncIdentity *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hwID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dbID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("instanceDisc"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8 || v7 == 0)
  {
    v10 = 0;
  }
  else
  {
    self = -[WOSyncIdentity initWithHardwareIdentifier:databaseIdentifier:instanceDiscriminator:](self, "initWithHardwareIdentifier:databaseIdentifier:instanceDiscriminator:", v5, v6, v7);
    v10 = self;
  }

  return v10;
}

- (NSUUID)hardwareIdentifier
{
  return self->_hardwareIdentifier;
}

- (NSUUID)databaseIdentifier
{
  return self->_databaseIdentifier;
}

- (NSString)instanceDiscriminator
{
  return self->_instanceDiscriminator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceDiscriminator, 0);
  objc_storeStrong((id *)&self->_databaseIdentifier, 0);
  objc_storeStrong((id *)&self->_hardwareIdentifier, 0);
}

@end
