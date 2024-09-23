@implementation STSCredential

+ (STSCredential)credentialWithType:(unsigned __int8)a3 identifier:(id)a4 subIdentifier:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  STSCredential *v9;

  v6 = a3;
  v7 = a5;
  v8 = a4;
  v9 = -[STSCredential initWithType:identifier:subIdentifier:]([STSCredential alloc], "initWithType:identifier:subIdentifier:", v6, v8, v7);

  return v9;
}

+ (id)unifiedAccessCredentialWithAID:(id)a3 publicKeyIdentifier:(id)a4
{
  id v5;
  id v6;
  STSCredential *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[STSCredential initWithType:identifier:subIdentifier:]([STSCredential alloc], "initWithType:identifier:subIdentifier:", 3, v6, v5);

  return v7;
}

+ (id)unifiedAccessCredentialWithAIDs:(id)a3 primaryPublicKeyIdentifier:(id)a4 secondaryAid:(id)a5 secondaryPublicKeyIdentifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  STSCredential *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[STSCredential initWithType:identifier:subIdentifier:secondaryIdentifier:secondarySubIdentifier:]([STSCredential alloc], "initWithType:identifier:subIdentifier:secondaryIdentifier:secondarySubIdentifier:", 3, v12, v11, v10, v9);

  return v13;
}

- (STSCredential)initWithType:(unsigned __int8)a3 identifier:(id)a4 subIdentifier:(id)a5 secondaryIdentifier:(id)a6 secondarySubIdentifier:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  STSCredential *v17;
  STSCredential *v18;
  objc_super v20;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)STSCredential;
  v17 = -[STSCredential init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_type = a3;
    objc_storeStrong((id *)&v17->_identifier, a4);
    objc_storeStrong((id *)&v18->_subIdentifier, a5);
    objc_storeStrong((id *)&v18->_secondaryIdentifier, a6);
    objc_storeStrong((id *)&v18->_secondarySubIdentifier, a7);
  }

  return v18;
}

- (STSCredential)initWithType:(unsigned __int8)a3 identifier:(id)a4 subIdentifier:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  STSCredential *v10;

  v6 = a3;
  v8 = a5;
  v9 = a4;
  v10 = -[STSCredential initWithType:identifier:subIdentifier:secondaryIdentifier:secondarySubIdentifier:]([STSCredential alloc], "initWithType:identifier:subIdentifier:secondaryIdentifier:secondarySubIdentifier:", v6, v9, v8, 0, 0);

  return v10;
}

- (STSCredential)initWithCoder:(id)a3
{
  id v4;
  STSCredential *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *subIdentifier;
  uint64_t v10;
  NSString *secondaryIdentifier;
  uint64_t v12;
  NSString *secondarySubIdentifier;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)STSCredential;
  v5 = -[STSCredential init](&v15, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntForKey:", CFSTR("STSCredentialType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("STSCredentialIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("STSCredentialSubIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    subIdentifier = v5->_subIdentifier;
    v5->_subIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("STSCredentialSecondaryIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    secondaryIdentifier = v5->_secondaryIdentifier;
    v5->_secondaryIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("STSCredentialSecondarySubIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    secondarySubIdentifier = v5->_secondarySubIdentifier;
    v5->_secondarySubIdentifier = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInt:forKey:", type, CFSTR("STSCredentialType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("STSCredentialIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subIdentifier, CFSTR("STSCredentialSubIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secondaryIdentifier, CFSTR("STSCredentialSecondaryIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secondarySubIdentifier, CFSTR("STSCredentialSecondarySubIdentifier"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  unint64_t type;
  const __CFString *v3;
  NSString *subIdentifier;
  uint64_t v6;
  uint64_t v7;

  type = (char)self->_type;
  if (type > 5)
    v3 = CFSTR("Unknown");
  else
    v3 = off_24D3A7620[type];
  subIdentifier = self->_subIdentifier;
  if (self->_secondaryIdentifier)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Credential { Type=%@ primary identifier=%@ primary subIdentifier=%@ secondary Identifier=%@, secondary subIdentifier = %@}"), v3, self->_identifier, subIdentifier, self->_secondaryIdentifier, self->_secondarySubIdentifier);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Credential { Type=%@ identifier=%@ subIdentifier=%@}"), v3, self->_identifier, subIdentifier, v6, v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)subIdentifier
{
  return self->_subIdentifier;
}

- (NSString)secondaryIdentifier
{
  return self->_secondaryIdentifier;
}

- (NSString)secondarySubIdentifier
{
  return self->_secondarySubIdentifier;
}

- (unsigned)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondarySubIdentifier, 0);
  objc_storeStrong((id *)&self->_secondaryIdentifier, 0);
  objc_storeStrong((id *)&self->_subIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
