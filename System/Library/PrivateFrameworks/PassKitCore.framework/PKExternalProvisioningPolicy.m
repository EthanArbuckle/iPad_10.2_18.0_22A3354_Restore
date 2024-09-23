@implementation PKExternalProvisioningPolicy

- (PKExternalProvisioningPolicy)init
{

  return 0;
}

- (PKExternalProvisioningPolicy)initWithDictionary:(id)a3
{
  id v4;
  PKExternalProvisioningPolicy *v5;
  uint64_t v6;
  NSString *type;
  uint64_t v8;
  uint64_t v9;
  NSDictionary *deviceLimits;
  PKExternalProvisioningPolicy *v11;
  objc_super v13;

  v4 = a3;
  if (v4)
  {
    v13.receiver = self;
    v13.super_class = (Class)PKExternalProvisioningPolicy;
    v5 = -[PKExternalProvisioningPolicy init](&v13, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
      v6 = objc_claimAutoreleasedReturnValue();
      type = v5->_type;
      v5->_type = (NSString *)v6;

      v8 = objc_opt_class();
      objc_msgSend(v4, "PKDictionaryOfKeyClass:valueClass:ForKey:", v8, objc_opt_class(), CFSTR("deviceLimits"));
      v9 = objc_claimAutoreleasedReturnValue();
      deviceLimits = v5->_deviceLimits;
      v5->_deviceLimits = (NSDictionary *)v9;

    }
    self = v5;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKExternalProvisioningPolicy)initWithCoder:(id)a3
{
  id v4;
  PKExternalProvisioningPolicy *v5;
  uint64_t v6;
  NSString *type;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSDictionary *deviceLimits;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKExternalProvisioningPolicy;
  v5 = -[PKExternalProvisioningPolicy init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v6 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("deviceLimits"));
    v11 = objc_claimAutoreleasedReturnValue();
    deviceLimits = v5->_deviceLimits;
    v5->_deviceLimits = (NSDictionary *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceLimits, CFSTR("deviceLimits"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("type: '%@'; "), self->_type);
  objc_msgSend(v6, "appendFormat:", CFSTR("deviceLimits: '%@'; "), self->_deviceLimits);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_type);
  objc_msgSend(v3, "safelyAddObject:", self->_deviceLimits);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKExternalProvisioningPolicy *v4;
  PKExternalProvisioningPolicy *v5;
  BOOL v6;

  v4 = (PKExternalProvisioningPolicy *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKExternalProvisioningPolicy isEqualToExternalProvisioningPolicy:](self, "isEqualToExternalProvisioningPolicy:", v5);

  return v6;
}

- (BOOL)isEqualToExternalProvisioningPolicy:(id)a3
{
  _QWORD *v4;
  NSString *type;
  NSString *v6;
  BOOL v7;
  char v8;
  NSDictionary *deviceLimits;
  NSDictionary *v11;

  v4 = a3;
  if (!v4)
    goto LABEL_8;
  type = self->_type;
  v6 = (NSString *)v4[1];
  if (type)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    if ((-[NSString isEqual:](type, "isEqual:") & 1) != 0)
      goto LABEL_11;
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  if (type != v6)
    goto LABEL_8;
LABEL_11:
  deviceLimits = self->_deviceLimits;
  v11 = (NSDictionary *)v4[2];
  if (deviceLimits && v11)
    v8 = -[NSDictionary isEqual:](deviceLimits, "isEqual:");
  else
    v8 = deviceLimits == v11;
LABEL_9:

  return v8;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NSDictionary)deviceLimits
{
  return self->_deviceLimits;
}

- (void)setDeviceLimits:(id)a3
{
  objc_storeStrong((id *)&self->_deviceLimits, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceLimits, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
