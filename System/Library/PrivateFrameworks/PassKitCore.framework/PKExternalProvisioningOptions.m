@implementation PKExternalProvisioningOptions

- (PKExternalProvisioningOptions)init
{

  return 0;
}

- (PKExternalProvisioningOptions)initWithDictionary:(id)a3
{
  id v4;
  PKExternalProvisioningOptions *v5;
  PKExternalProvisioningPolicy *v6;
  void *v7;
  uint64_t v8;
  PKExternalProvisioningPolicy *policy;
  void *v10;
  void *v11;
  PKExternalProvisioningOptions *v12;
  void *v13;
  uint64_t v14;
  NSArray *devices;
  NSArray *v16;
  objc_super v18;

  v4 = a3;
  if (v4)
  {
    v18.receiver = self;
    v18.super_class = (Class)PKExternalProvisioningOptions;
    v5 = -[PKExternalProvisioningOptions init](&v18, sel_init);
    if (v5)
    {
      v6 = [PKExternalProvisioningPolicy alloc];
      objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("provisioningPolicy"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[PKExternalProvisioningPolicy initWithDictionary:](v6, "initWithDictionary:", v7);
      policy = v5->_policy;
      v5->_policy = (PKExternalProvisioningPolicy *)v8;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("authorizationType"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v4, "PKStringForKey:", CFSTR("authorizationType"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_authorizationType = PKExternalProvisioningAuthorizationTypeFromString(v11);

      }
      else
      {
        v5->_authorizationType = 1;
      }
      objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("devices"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_212);
      v14 = objc_claimAutoreleasedReturnValue();
      devices = v5->_devices;
      v5->_devices = (NSArray *)v14;

      v16 = v5->_devices;
      if (!v16 || !-[NSArray count](v16, "count"))
      {

        v5 = 0;
      }
    }
    self = v5;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

PKExternalDestinationDevice *__52__PKExternalProvisioningOptions_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKExternalDestinationDevice *v3;

  v2 = a2;
  v3 = -[PKExternalDestinationDevice initWithDictionary:]([PKExternalDestinationDevice alloc], "initWithDictionary:", v2);

  return v3;
}

+ (id)mockOptions
{
  return -[PKExternalProvisioningOptions initWithDictionary:]([PKExternalProvisioningOptions alloc], "initWithDictionary:", &unk_1E2C41638);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKExternalProvisioningOptions)initWithCoder:(id)a3
{
  id v4;
  PKExternalProvisioningOptions *v5;
  uint64_t v6;
  PKExternalProvisioningPolicy *policy;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSArray *devices;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKExternalProvisioningOptions;
  v5 = -[PKExternalProvisioningOptions init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("policy"));
    v6 = objc_claimAutoreleasedReturnValue();
    policy = v5->_policy;
    v5->_policy = (PKExternalProvisioningPolicy *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authorizationType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_authorizationType = PKExternalProvisioningAuthorizationTypeFromString(v8);

    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("devices"));
    v12 = objc_claimAutoreleasedReturnValue();
    devices = v5->_devices;
    v5->_devices = (NSArray *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKExternalProvisioningPolicy *policy;
  unint64_t authorizationType;
  const __CFString *v6;
  const __CFString *v7;
  id v8;

  policy = self->_policy;
  v8 = a3;
  objc_msgSend(v8, "encodeObject:forKey:", policy, CFSTR("policy"));
  authorizationType = self->_authorizationType;
  v6 = CFSTR("none");
  if (authorizationType != 1)
    v6 = 0;
  if (authorizationType == 2)
    v7 = CFSTR("dpan");
  else
    v7 = v6;
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("authorizationType"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_devices, CFSTR("devices"));

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

  objc_msgSend(v6, "appendFormat:", CFSTR("policy: '%@'; "), self->_policy);
  objc_msgSend(v6, "appendFormat:", CFSTR("devices: '%@'; "), self->_devices);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_policy);
  objc_msgSend(v3, "safelyAddObject:", self->_devices);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_authorizationType - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKExternalProvisioningOptions *v4;
  PKExternalProvisioningOptions *v5;
  BOOL v6;

  v4 = (PKExternalProvisioningOptions *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKExternalProvisioningOptions isEqualToExternalProvisioningOptions:](self, "isEqualToExternalProvisioningOptions:", v5);

  return v6;
}

- (BOOL)isEqualToExternalProvisioningOptions:(id)a3
{
  _QWORD *v4;
  PKExternalProvisioningPolicy *policy;
  PKExternalProvisioningPolicy *v6;
  BOOL v7;
  NSArray *devices;
  NSArray *v9;
  char v10;

  v4 = a3;
  if (!v4)
    goto LABEL_14;
  policy = self->_policy;
  v6 = (PKExternalProvisioningPolicy *)v4[1];
  if (policy)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    if (-[PKExternalProvisioningPolicy isEqual:](policy, "isEqual:"))
      goto LABEL_10;
LABEL_14:
    v10 = 0;
    goto LABEL_15;
  }
  if (policy != v6)
    goto LABEL_14;
LABEL_10:
  if (self->_authorizationType != v4[2])
    goto LABEL_14;
  devices = self->_devices;
  v9 = (NSArray *)v4[3];
  if (devices && v9)
    v10 = -[NSArray isEqual:](devices, "isEqual:");
  else
    v10 = devices == v9;
LABEL_15:

  return v10;
}

- (PKExternalProvisioningPolicy)policy
{
  return self->_policy;
}

- (void)setPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_policy, a3);
}

- (unint64_t)authorizationType
{
  return self->_authorizationType;
}

- (void)setAuthorizationType:(unint64_t)a3
{
  self->_authorizationType = a3;
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_storeStrong((id *)&self->_devices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_policy, 0);
}

@end
