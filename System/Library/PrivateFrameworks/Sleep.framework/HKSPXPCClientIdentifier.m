@implementation HKSPXPCClientIdentifier

- (NSString)loggingIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HKSPXPCClientIdentifier uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("uniqueIdentifier"));

  -[HKSPXPCClientIdentifier loggingIdentifier](self, "loggingIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("loggingIdentifier"));

}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)isEqual:(id)a3
{
  HKSPXPCClientIdentifier *v4;
  HKSPXPCClientIdentifier *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (HKSPXPCClientIdentifier *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HKSPXPCClientIdentifier uniqueIdentifier](self, "uniqueIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKSPXPCClientIdentifier uniqueIdentifier](v5, "uniqueIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (HKSPXPCClientIdentifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HKSPXPCClientIdentifier *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("loggingIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HKSPXPCClientIdentifier initWithUniqueIdentifier:loggingIdentifier:](self, "initWithUniqueIdentifier:loggingIdentifier:", v5, v6);
  return v7;
}

- (HKSPXPCClientIdentifier)initWithUniqueIdentifier:(id)a3 loggingIdentifier:(id)a4
{
  id v6;
  id v7;
  HKSPXPCClientIdentifier *v8;
  uint64_t v9;
  NSUUID *uniqueIdentifier;
  uint64_t v11;
  NSString *loggingIdentifier;
  HKSPXPCClientIdentifier *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HKSPXPCClientIdentifier;
  v8 = -[HKSPXPCClientIdentifier init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    uniqueIdentifier = v8->_uniqueIdentifier;
    v8->_uniqueIdentifier = (NSUUID *)v9;

    v11 = objc_msgSend(v7, "copy");
    loggingIdentifier = v8->_loggingIdentifier;
    v8->_loggingIdentifier = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (NSString)description
{
  return (NSString *)-[HKSPXPCClientIdentifier descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[HKSPXPCClientIdentifier succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPXPCClientIdentifier uniqueIdentifier](self, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v4, CFSTR("uuid"), 1);

  -[HKSPXPCClientIdentifier loggingIdentifier](self, "loggingIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v6, CFSTR("id"), 1);

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[HKSPXPCClientIdentifier descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
