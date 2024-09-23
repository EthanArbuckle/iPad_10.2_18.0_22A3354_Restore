@implementation TPPolicyVersion

- (TPPolicyVersion)initWithVersion:(unint64_t)a3 hash:(id)a4
{
  id v6;
  TPPolicyVersion *v7;
  TPPolicyVersion *v8;
  void *v9;
  uint64_t v10;
  NSString *policyHash;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TPPolicyVersion;
  v7 = -[TPPolicyVersion init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_versionNumber = a3;
    +[TPStringTable defaultTable](TPStringTable, "defaultTable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithString:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
    policyHash = v8->_policyHash;
    v8->_policyHash = (NSString *)v10;

  }
  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[TPPolicyVersion policyHash](self, "policyHash");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[TPPolicyVersion versionNumber](self, "versionNumber");
  -[TPPolicyVersion policyHash](self, "policyHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<TPPolicyVersion: %llu, %@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "versionNumber");
    if (v6 == -[TPPolicyVersion versionNumber](self, "versionNumber"))
    {
      objc_msgSend(v5, "policyHash");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPPolicyVersion policyHash](self, "policyHash");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TPPolicyVersion *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  TPPolicyVersion *v8;

  v4 = [TPPolicyVersion alloc];
  v5 = -[TPPolicyVersion versionNumber](self, "versionNumber");
  -[TPPolicyVersion policyHash](self, "policyHash");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  v8 = -[TPPolicyVersion initWithVersion:hash:](v4, "initWithVersion:hash:", v5, v7);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[TPPolicyVersion policyHash](self, "policyHash");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("policyHash"));

  objc_msgSend(v5, "encodeInt64:forKey:", -[TPPolicyVersion versionNumber](self, "versionNumber"), CFSTR("policyVersion"));
}

- (TPPolicyVersion)initWithCoder:(id)a3
{
  id v4;
  TPPolicyVersion *v5;
  uint64_t v6;
  NSString *policyHash;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPPolicyVersion;
  v5 = -[TPPolicyVersion init](&v9, sel_init);
  if (v5)
  {
    v5->_versionNumber = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("policyVersion"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("policyHash"));
    v6 = objc_claimAutoreleasedReturnValue();
    policyHash = v5->_policyHash;
    v5->_policyHash = (NSString *)v6;

  }
  return v5;
}

- (unint64_t)versionNumber
{
  return self->_versionNumber;
}

- (NSString)policyHash
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyHash, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
