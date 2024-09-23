@implementation PKAppleAccountState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAppleAccountState)initWithAccount:(id)a3
{
  id v4;
  PKAppleAccountState *v5;
  uint64_t v6;
  NSString *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAppleAccountState;
  v5 = -[PKAppleAccountState init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_isWalletDataclassEnabled = objc_msgSend(v4, "isEnabledForDataclass:", *MEMORY[0x1E0C8EF10]);
    v5->_isUbiquityDataclassEnabled = objc_msgSend(v4, "isEnabledForDataclass:", *MEMORY[0x1E0C8EF28]);
    v5->_isManaged = objc_msgSend(v4, "aa_isManagedAppleID");
    v5->_isPrimary = objc_msgSend(v4, "aa_isAccountClass:", *MEMORY[0x1E0CFAAE8]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isWalletDataclassEnabled, CFSTR("isWalletDataclassEnabled"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isUbiquityDataclassEnabled, CFSTR("isUbiquityDataclassEnabled"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isManaged, CFSTR("isManaged"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isPrimary, CFSTR("isPrimary"));

}

- (PKAppleAccountState)initWithCoder:(id)a3
{
  id v4;
  PKAppleAccountState *v5;
  uint64_t v6;
  NSString *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAppleAccountState;
  v5 = -[PKAppleAccountState init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_isWalletDataclassEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isWalletDataclassEnabled"));
    v5->_isUbiquityDataclassEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isUbiquityDataclassEnabled"));
    v5->_isManaged = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isManaged"));
    v5->_isPrimary = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPrimary"));
  }

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("identifier: %@, walletEnabled: %i, ubiquityEnabled: %i, isManaged: %i, isPrimary: %i"), self->_identifier, self->_isWalletDataclassEnabled, self->_isUbiquityDataclassEnabled, self->_isManaged, self->_isPrimary);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isWalletDataclassEnabled
{
  return self->_isWalletDataclassEnabled;
}

- (BOOL)isUbiquityDataclassEnabled
{
  return self->_isUbiquityDataclassEnabled;
}

- (BOOL)isManaged
{
  return self->_isManaged;
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
