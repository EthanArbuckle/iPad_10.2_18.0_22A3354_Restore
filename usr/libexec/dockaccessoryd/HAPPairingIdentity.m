@implementation HAPPairingIdentity

- (HAPPairingIdentity)initWithIdentifier:(id)a3 publicKey:(id)a4 privateKey:(id)a5
{
  return -[HAPPairingIdentity initWithIdentifier:controllerKeyIdentifier:publicKey:privateKey:permissions:](self, "initWithIdentifier:controllerKeyIdentifier:publicKey:privateKey:permissions:", a3, 0, a4, a5, 0);
}

- (HAPPairingIdentity)initWithIdentifier:(id)a3 publicKey:(id)a4 privateKey:(id)a5 permissions:(unint64_t)a6
{
  HAPPairingIdentity *result;

  result = -[HAPPairingIdentity initWithIdentifier:controllerKeyIdentifier:publicKey:privateKey:permissions:](self, "initWithIdentifier:controllerKeyIdentifier:publicKey:privateKey:permissions:", a3, 0, a4, a5, a6);
  if (result)
    result->_permissions = a6;
  return result;
}

- (HAPPairingIdentity)initWithIdentifier:(id)a3 controllerKeyIdentifier:(id)a4 publicKey:(id)a5 privateKey:(id)a6 permissions:(unint64_t)a7
{
  id v13;
  HAPPairingIdentity *v14;
  HAPPairingIdentity *v15;
  objc_super v17;

  v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HAPPairingIdentity;
  v14 = -[HAPPairingIdentity initWithIdentifier:publicKey:privateKey:](&v17, "initWithIdentifier:publicKey:privateKey:", a3, a5, a6);
  v15 = v14;
  if (v14)
  {
    v14->_permissions = a7;
    objc_storeStrong((id *)&v14->_controllerKeyIdentifier, a4);
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPPairingIdentity *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HAPPairingIdentity *v9;

  v4 = +[HAPPairingIdentity allocWithZone:](HAPPairingIdentity, "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPPairingIdentity identifier](self, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPPairingIdentity controllerKeyIdentifier](self, "controllerKeyIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPPairingIdentity publicKey](self, "publicKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPPairingIdentity privateKey](self, "privateKey"));
  v9 = -[HAPPairingIdentity initWithIdentifier:controllerKeyIdentifier:publicKey:privateKey:permissions:](v4, "initWithIdentifier:controllerKeyIdentifier:publicKey:privateKey:permissions:", v5, v6, v7, v8, -[HAPPairingIdentity permissions](self, "permissions"));

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HAPPairingIdentity)initWithCoder:(id)a3
{
  id v4;
  HAPPairingIdentity *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  NSString *controllerKeyIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HAPPairingIdentity;
  v5 = -[HAPPairingIdentity initWithCoder:](&v11, "initWithCoder:", v4);
  if (v5)
  {
    v5->_permissions = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HAP.permissions"));
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v6), CFSTR("HAP.ctrlId"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    controllerKeyIdentifier = v5->_controllerKeyIdentifier;
    v5->_controllerKeyIdentifier = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HAPPairingIdentity;
  v4 = a3;
  -[HAPPairingIdentity encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[HAPPairingIdentity permissions](self, "permissions", v6.receiver, v6.super_class), CFSTR("HAP.permissions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPPairingIdentity controllerKeyIdentifier](self, "controllerKeyIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HAP.ctrlId"));

}

- (BOOL)isStrictlyEqual:(id)a3
{
  uint64_t v4;
  HAPPairingIdentity *v5;
  uint64_t v6;
  HAPPairingIdentity *v7;
  HAPPairingIdentity *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  objc_super v14;

  v5 = (HAPPairingIdentity *)a3;
  if (self == v5)
  {
    v12 = 1;
  }
  else
  {
    v6 = objc_opt_class(HAPPairingIdentity, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
      v7 = v5;
    else
      v7 = 0;
    v8 = v7;
    if (v8
      && (v14.receiver = self,
          v14.super_class = (Class)HAPPairingIdentity,
          -[HAPPairingIdentity isEqual:](&v14, "isEqual:", v5))
      && (v9 = -[HAPPairingIdentity permissions](self, "permissions"),
          v9 == (void *)-[HAPPairingIdentity permissions](self, "permissions")))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPPairingIdentity controllerKeyIdentifier](self, "controllerKeyIdentifier"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPPairingIdentity controllerKeyIdentifier](v8, "controllerKeyIdentifier"));
      v12 = HMFEqualObjects(v10, v11);

    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HAPPairingIdentity;
  v3 = -[HAPPairingIdentity attributeDescriptions](&v10, "attributeDescriptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = objc_alloc((Class)HMFAttributeDescription);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPPairingIdentity controllerKeyIdentifier](self, "controllerKeyIdentifier"));
  v8 = objc_msgSend(v6, "initWithName:value:", CFSTR("controllerKeyIdentifier"), v7);
  objc_msgSend(v5, "addObject:", v8);

  return v5;
}

- (unint64_t)permissions
{
  return self->_permissions;
}

- (NSString)controllerKeyIdentifier
{
  return self->_controllerKeyIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controllerKeyIdentifier, 0);
}

@end
