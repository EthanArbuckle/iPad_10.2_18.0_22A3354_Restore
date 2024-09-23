@implementation SPBeaconDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPBeaconDescription)initWithStableIdentifier:(id)a3 name:(id)a4 model:(id)a5 systemVersion:(id)a6 vendorId:(int64_t)a7 productId:(int64_t)a8 role:(int64_t)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  SPBeaconDescription *v19;
  objc_super v22;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SPBeaconDescription;
  v19 = -[SPBeaconDescription init](&v22, sel_init);
  if (v19)
  {
    if (objc_msgSend(v15, "length"))
    {
      objc_storeStrong((id *)&v19->_stableIdentifier, a3);
      objc_storeStrong((id *)&v19->_name, a4);
      objc_storeStrong((id *)&v19->_model, a5);
      objc_storeStrong((id *)&v19->_systemVersion, a6);
      v19->_vendorId = a7;
      v19->_productId = a8;
      v19->_role = a9;
    }
    else
    {

      v19 = 0;
    }
  }

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPBeaconDescription *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SPBeaconDescription *v9;

  v4 = [SPBeaconDescription alloc];
  -[SPBeaconDescription stableIdentifier](self, "stableIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPBeaconDescription name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPBeaconDescription model](self, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPBeaconDescription systemVersion](self, "systemVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SPBeaconDescription initWithStableIdentifier:name:model:systemVersion:vendorId:productId:role:](v4, "initWithStableIdentifier:name:model:systemVersion:vendorId:productId:role:", v5, v6, v7, v8, -[SPBeaconDescription vendorId](self, "vendorId"), -[SPBeaconDescription productId](self, "productId"), -[SPBeaconDescription role](self, "role"));

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *stableIdentifier;
  id v5;

  stableIdentifier = self->_stableIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", stableIdentifier, CFSTR("stableIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_model, CFSTR("model"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_systemVersion, CFSTR("systemVersion"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_vendorId, CFSTR("vendorId"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_productId, CFSTR("productId"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_role, CFSTR("role"));

}

- (SPBeaconDescription)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *stableIdentifier;
  NSString *v7;
  NSString *name;
  NSString *v9;
  NSString *model;
  NSString *v11;
  NSString *systemVersion;
  int64_t v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stableIdentifier"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  stableIdentifier = self->_stableIdentifier;
  self->_stableIdentifier = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("model"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  model = self->_model;
  self->_model = v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemVersion"));
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  systemVersion = self->_systemVersion;
  self->_systemVersion = v11;

  self->_vendorId = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("vendorId"));
  self->_productId = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("productId"));
  v13 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("role"));

  self->_role = v13;
  return self;
}

- (NSString)stableIdentifier
{
  return self->_stableIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (void)setSystemVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)vendorId
{
  return self->_vendorId;
}

- (void)setVendorId:(int64_t)a3
{
  self->_vendorId = a3;
}

- (int64_t)productId
{
  return self->_productId;
}

- (void)setProductId:(int64_t)a3
{
  self->_productId = a3;
}

- (int64_t)role
{
  return self->_role;
}

- (void)setRole:(int64_t)a3
{
  self->_role = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_stableIdentifier, 0);
}

@end
