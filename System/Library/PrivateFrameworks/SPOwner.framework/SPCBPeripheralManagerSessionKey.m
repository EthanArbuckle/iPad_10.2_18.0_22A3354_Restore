@implementation SPCBPeripheralManagerSessionKey

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPCBPeripheralManagerSessionKey)initWithUserIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  SPCBPeripheralManagerSessionKey *v8;
  uint64_t v9;
  NSUUID *userIdentifier;
  uint64_t v11;
  NSString *bundleId;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SPCBPeripheralManagerSessionKey;
  v8 = -[SPCBPeripheralManagerSessionKey init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    userIdentifier = v8->_userIdentifier;
    v8->_userIdentifier = (NSUUID *)v9;

    v11 = objc_msgSend(v7, "copy");
    bundleId = v8->_bundleId;
    v8->_bundleId = (NSString *)v11;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  SPCBPeripheralManagerSessionKey *v4;
  SPCBPeripheralManagerSessionKey *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (SPCBPeripheralManagerSessionKey *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SPCBPeripheralManagerSessionKey userIdentifier](self, "userIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPCBPeripheralManagerSessionKey userIdentifier](v5, "userIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[SPCBPeripheralManagerSessionKey bundleId](self, "bundleId");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPCBPeripheralManagerSessionKey bundleId](v5, "bundleId");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToString:", v9);

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
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[SPCBPeripheralManagerSessionKey userIdentifier](self, "userIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SPCBPeripheralManagerSessionKey bundleId](self, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SPCBPeripheralManagerSessionKey userIdentifier](self, "userIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCBPeripheralManagerSessionKey bundleId](self, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SPCBPeripheralManagerSessionKey initWithUserIdentifier:bundleIdentifier:]([SPCBPeripheralManagerSessionKey alloc], "initWithUserIdentifier:bundleIdentifier:", self->_userIdentifier, self->_bundleId);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SPCBPeripheralManagerSessionKey userIdentifier](self, "userIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("userIdentifier"));

  -[SPCBPeripheralManagerSessionKey bundleId](self, "bundleId");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bundleId"));

}

- (SPCBPeripheralManagerSessionKey)initWithCoder:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *userIdentifier;
  NSString *v7;
  NSString *bundleId;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userIdentifier"));
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  userIdentifier = self->_userIdentifier;
  self->_userIdentifier = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleId"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  bundleId = self->_bundleId;
  self->_bundleId = v7;

  return self;
}

- (NSUUID)userIdentifier
{
  return self->_userIdentifier;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
}

@end
