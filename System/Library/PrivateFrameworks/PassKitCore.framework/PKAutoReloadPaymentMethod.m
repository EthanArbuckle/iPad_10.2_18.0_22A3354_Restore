@implementation PKAutoReloadPaymentMethod

- (PKAutoReloadPaymentMethod)initWithDictionary:(id)a3
{
  id v4;
  PKAutoReloadPaymentMethod *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *suffix;
  uint64_t v10;
  NSString *fpanIdentifier;
  uint64_t v12;
  NSString *merchantTokenIdentifier;
  uint64_t v14;
  NSString *imageName;
  uint64_t v16;
  NSURL *managementURL;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKAutoReloadPaymentMethod;
  v5 = -[PKAutoReloadPaymentMethod init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("suffix"));
    v8 = objc_claimAutoreleasedReturnValue();
    suffix = v5->_suffix;
    v5->_suffix = (NSString *)v8;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("fpanIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    fpanIdentifier = v5->_fpanIdentifier;
    v5->_fpanIdentifier = (NSString *)v10;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("merchantTokenIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    merchantTokenIdentifier = v5->_merchantTokenIdentifier;
    v5->_merchantTokenIdentifier = (NSString *)v12;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("imageName"));
    v14 = objc_claimAutoreleasedReturnValue();
    imageName = v5->_imageName;
    v5->_imageName = (NSString *)v14;

    objc_msgSend(v4, "PKURLForKey:", CFSTR("managementURL"));
    v16 = objc_claimAutoreleasedReturnValue();
    managementURL = v5->_managementURL;
    v5->_managementURL = (NSURL *)v16;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "isEqualToString:", CFSTR("pre_paid")))
      v5->_type = 0;

  }
  return v5;
}

- (PKAutoReloadPaymentMethod)initWithCoder:(id)a3
{
  id v4;
  PKAutoReloadPaymentMethod *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *suffix;
  uint64_t v10;
  NSString *fpanIdentifier;
  uint64_t v12;
  NSString *merchantTokenIdentifier;
  uint64_t v14;
  NSString *imageName;
  uint64_t v16;
  NSURL *managementURL;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKAutoReloadPaymentMethod;
  v5 = -[PKAutoReloadPaymentMethod init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suffix"));
    v8 = objc_claimAutoreleasedReturnValue();
    suffix = v5->_suffix;
    v5->_suffix = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fpanIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    fpanIdentifier = v5->_fpanIdentifier;
    v5->_fpanIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantTokenIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    merchantTokenIdentifier = v5->_merchantTokenIdentifier;
    v5->_merchantTokenIdentifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageName"));
    v14 = objc_claimAutoreleasedReturnValue();
    imageName = v5->_imageName;
    v5->_imageName = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("managementURL"));
    v16 = objc_claimAutoreleasedReturnValue();
    managementURL = v5->_managementURL;
    v5->_managementURL = (NSURL *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v18, "unsignedIntegerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;
  id v6;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_suffix, CFSTR("suffix"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fpanIdentifier, CFSTR("fpanIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_merchantTokenIdentifier, CFSTR("merchantTokenIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageName, CFSTR("imageName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_managementURL, CFSTR("managementURL"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_type);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("type"));

}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("name: %@; "), self->_name);
  objc_msgSend(v3, "appendFormat:", CFSTR("suffix: %@; "), self->_suffix);
  objc_msgSend(v3, "appendFormat:", CFSTR("fpanIdentifier: %@; "), self->_fpanIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("merchantTokenIdentifier: %@; "), self->_merchantTokenIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("imageName: %@; "), self->_imageName);
  objc_msgSend(v3, "appendFormat:", CFSTR("managementURL: %@; "), self->_managementURL);
  objc_msgSend(v3, "appendFormat:", CFSTR("type: %lu; "), self->_type);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)suffix
{
  return self->_suffix;
}

- (void)setSuffix:(id)a3
{
  objc_storeStrong((id *)&self->_suffix, a3);
}

- (NSString)fpanIdentifier
{
  return self->_fpanIdentifier;
}

- (void)setFpanIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_fpanIdentifier, a3);
}

- (NSString)merchantTokenIdentifier
{
  return self->_merchantTokenIdentifier;
}

- (void)setMerchantTokenIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_merchantTokenIdentifier, a3);
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
  objc_storeStrong((id *)&self->_imageName, a3);
}

- (NSURL)managementURL
{
  return self->_managementURL;
}

- (void)setManagementURL:(id)a3
{
  objc_storeStrong((id *)&self->_managementURL, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managementURL, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_merchantTokenIdentifier, 0);
  objc_storeStrong((id *)&self->_fpanIdentifier, 0);
  objc_storeStrong((id *)&self->_suffix, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
