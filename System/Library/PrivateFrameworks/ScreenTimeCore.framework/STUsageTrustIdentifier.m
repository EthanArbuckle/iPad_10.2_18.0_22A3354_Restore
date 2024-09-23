@implementation STUsageTrustIdentifier

- (STUsageTrustIdentifier)initWithIdentifier:(id)a3 usageTrusted:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  STUsageTrustIdentifier *v6;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)STUsageTrustIdentifier;
  v5 = a3;
  v6 = -[STUsageTrustIdentifier init](&v8, sel_init);
  -[STUsageTrustIdentifier _stUsageTrustIdentifierCommonInitWithIdentifier:usageTrusted:](v6, "_stUsageTrustIdentifierCommonInitWithIdentifier:usageTrusted:", v5, v4, v8.receiver, v8.super_class);

  return v6;
}

- (STUsageTrustIdentifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  int v6;
  BOOL v7;
  char v8;
  STUsageTrustIdentifier *v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsValueForKey:", CFSTR("UsageTrusted"));
  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = v6;

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      -[STUsageTrustIdentifier initWithCoder:].cold.1((uint64_t)v5, v8);
    v9 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)STUsageTrustIdentifier;
    v9 = -[STUsageTrustIdentifier init](&v11, sel_init);
    -[STUsageTrustIdentifier _stUsageTrustIdentifierCommonInitWithIdentifier:usageTrusted:](v9, "_stUsageTrustIdentifierCommonInitWithIdentifier:usageTrusted:", v5, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UsageTrusted")));
  }

  return v9;
}

- (void)_stUsageTrustIdentifierCommonInitWithIdentifier:(id)a3 usageTrusted:(BOOL)a4
{
  NSString *v6;
  NSString *identifier;

  v6 = (NSString *)objc_msgSend(a3, "copy");
  identifier = self->_identifier;
  self->_identifier = v6;

  self->_usageTrusted = a4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("Identifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_usageTrusted, CFSTR("UsageTrusted"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  int v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[STUsageTrustIdentifier identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      v8 = -[STUsageTrustIdentifier usageTrusted](self, "usageTrusted");
      v9 = v8 ^ objc_msgSend(v5, "usageTrusted") ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[STUsageTrustIdentifier identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = v4 ^ -[STUsageTrustIdentifier usageTrusted](self, "usageTrusted");

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[STUsageTrustIdentifier initWithIdentifier:usageTrusted:](+[STUsageTrustIdentifier allocWithZone:](STUsageTrustIdentifier, "allocWithZone:", a3), "initWithIdentifier:usageTrusted:", self->_identifier, self->_usageTrusted);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)usageTrusted
{
  return self->_usageTrusted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, char a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 138543618;
  v3 = a1;
  v4 = 1024;
  v5 = a2 & 1;
  _os_log_fault_impl(&dword_1D22E7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Failed to decode STUsageTrustIdentifier with identifier: %{public}@, hasUsageTrustedKey: %d", (uint8_t *)&v2, 0x12u);
}

@end
