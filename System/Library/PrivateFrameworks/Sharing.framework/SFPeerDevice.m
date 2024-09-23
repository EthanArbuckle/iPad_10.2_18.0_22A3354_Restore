@implementation SFPeerDevice

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, uniqueID:%@, modelIdentifier:%@, name:%@>"), v5, self, self->_uniqueID, self->_modelIdentifier, self->_name);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *uniqueID;
  void *v7;
  NSString *modelIdentifier;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    uniqueID = self->_uniqueID;
    objc_msgSend(v5, "uniqueID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqual:](uniqueID, "isEqual:", v7))
    {
      modelIdentifier = self->_modelIdentifier;
      objc_msgSend(v5, "modelIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NSString isEqual:](modelIdentifier, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_uniqueID, "hash");
  return -[NSString hash](self->_modelIdentifier, "hash") ^ v3;
}

- (SFPeerDevice)initWithCoder:(id)a3
{
  id v4;
  SFPeerDevice *v5;
  void *v6;
  uint64_t v7;
  NSString *uniqueID;
  void *v9;
  uint64_t v10;
  NSString *modelIdentifier;
  void *v12;
  uint64_t v13;
  NSString *productName;
  void *v15;
  uint64_t v16;
  NSString *productVersion;
  void *v18;
  uint64_t v19;
  NSString *productBuildVersion;
  void *v21;
  uint64_t v22;
  NSString *name;
  void *v24;
  uint64_t v25;
  NSString *deviceColor;
  void *v27;
  uint64_t v28;
  NSString *enclosureColor;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SFPeerDevice;
  v5 = -[SFPeerDevice init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modelIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    modelIdentifier = v5->_modelIdentifier;
    v5->_modelIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    productName = v5->_productName;
    v5->_productName = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productVersion"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    productVersion = v5->_productVersion;
    v5->_productVersion = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productBuildVersion"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    productBuildVersion = v5->_productBuildVersion;
    v5->_productBuildVersion = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceColor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    deviceColor = v5->_deviceColor;
    v5->_deviceColor = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enclosureColor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "copy");
    enclosureColor = v5->_enclosureColor;
    v5->_enclosureColor = (NSString *)v28;

    v5->_defaultPairedDevice = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("defaultPairedDevice"));
    v5->_validKey = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("keyValid"));
    v5->_keyCounter = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("keyCounter"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *uniqueID;
  id v5;

  uniqueID = self->_uniqueID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uniqueID, CFSTR("uniqueID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modelIdentifier, CFSTR("modelIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_productName, CFSTR("productName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_productVersion, CFSTR("productVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_productBuildVersion, CFSTR("productBuildVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceColor, CFSTR("deviceColor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_enclosureColor, CFSTR("enclosureColor"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_defaultPairedDevice, CFSTR("defaultPairedDevice"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_validKey, CFSTR("keyValid"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_keyCounter, CFSTR("keyCounter"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)uniqueID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUniqueID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)modelIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setModelIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)productName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProductName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSString)productVersion
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setProductVersion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSString)productBuildVersion
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProductBuildVersion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSString)deviceColor
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDeviceColor:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSString)enclosureColor
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setEnclosureColor:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (BOOL)isDefaultPairedDevice
{
  return self->_defaultPairedDevice;
}

- (void)setDefaultPairedDevice:(BOOL)a3
{
  self->_defaultPairedDevice = a3;
}

- (BOOL)validKey
{
  return self->_validKey;
}

- (void)setValidKey:(BOOL)a3
{
  self->_validKey = a3;
}

- (int64_t)keyCounter
{
  return self->_keyCounter;
}

- (void)setKeyCounter:(int64_t)a3
{
  self->_keyCounter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enclosureColor, 0);
  objc_storeStrong((id *)&self->_deviceColor, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_productBuildVersion, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
}

@end
