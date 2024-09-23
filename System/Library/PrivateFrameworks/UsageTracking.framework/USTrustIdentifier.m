@implementation USTrustIdentifier

+ (id)identifierWithIdentifier:(id)a3 trusted:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:trusted:", v6, v4);

  return v7;
}

- (USTrustIdentifier)initWithIdentifier:(id)a3 trusted:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  USTrustIdentifier *v6;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)USTrustIdentifier;
  v5 = a3;
  v6 = -[USTrustIdentifier init](&v8, sel_init);
  -[USTrustIdentifier _USTrustIdentifierCommonInitWithIdentifier:trusted:](v6, "_USTrustIdentifierCommonInitWithIdentifier:trusted:", v5, v4, v8.receiver, v8.super_class);

  return v6;
}

- (USTrustIdentifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  int v6;
  BOOL v7;
  char v8;
  USTrustIdentifier *v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsValueForKey:", CFSTR("Trusted"));
  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = v6;

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      -[USTrustIdentifier initWithCoder:].cold.1((uint64_t)v5, v8);
    v9 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)USTrustIdentifier;
    v9 = -[USTrustIdentifier init](&v11, sel_init);
    -[USTrustIdentifier _USTrustIdentifierCommonInitWithIdentifier:trusted:](v9, "_USTrustIdentifierCommonInitWithIdentifier:trusted:", v5, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Trusted")));
  }

  return v9;
}

- (void)_USTrustIdentifierCommonInitWithIdentifier:(id)a3 trusted:(BOOL)a4
{
  NSString *v6;
  NSString *identifier;

  v6 = (NSString *)objc_msgSend(a3, "copy");
  identifier = self->_identifier;
  self->_identifier = v6;

  self->_trusted = a4;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("Identifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_trusted, CFSTR("Trusted"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)USTrustIdentifier;
  -[USTrustIdentifier description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[USTrustIdentifier identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, Identifier: %@, Trusted: %d"), v4, v5, -[USTrustIdentifier trusted](self, "trusted"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
    -[USTrustIdentifier identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      v8 = -[USTrustIdentifier trusted](self, "trusted");
      v9 = v8 ^ objc_msgSend(v5, "trusted") ^ 1;
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

  -[USTrustIdentifier identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = v4 ^ -[USTrustIdentifier trusted](self, "trusted");

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  USTrustIdentifier *v3;

  v3 = self;
  return -[USTrustIdentifier initWithIdentifier:trusted:](v3, "initWithIdentifier:trusted:", v3->_identifier, v3->_trusted);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)trusted
{
  return self->_trusted;
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

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138543618;
  v3 = a1;
  v4 = 1026;
  v5 = a2 & 1;
  _os_log_fault_impl(&dword_20D894000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Failed to decode USTrustIdentifier with identifier: %{public}@, hasTrustedKey: %{public}d", (uint8_t *)&v2, 0x12u);
}

@end
