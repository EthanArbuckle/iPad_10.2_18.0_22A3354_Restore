@implementation PKIdentityProvisioningSupplementalData

- (PKIdentityProvisioningSupplementalData)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKIdentityProvisioningSupplementalData;
  return -[PKIdentityProvisioningSupplementalData init](&v3, sel_init);
}

+ (id)createWithData:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3710];
  v4 = a3;
  objc_msgSend(v3, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dataRepresentation
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *passTypeIdentifier;
  id v5;

  passTypeIdentifier = self->_passTypeIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", passTypeIdentifier, CFSTR("passTypeIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_passSerialNumber, CFSTR("passSerialNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountKeyIdentifier, CFSTR("accountKeyIdentifier"));

}

- (PKIdentityProvisioningSupplementalData)initWithCoder:(id)a3
{
  id v4;
  PKIdentityProvisioningSupplementalData *v5;
  uint64_t v6;
  NSString *passTypeIdentifier;
  uint64_t v8;
  NSString *passSerialNumber;
  uint64_t v10;
  NSString *accountKeyIdentifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKIdentityProvisioningSupplementalData;
  v5 = -[PKIdentityProvisioningSupplementalData init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passTypeIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    passTypeIdentifier = v5->_passTypeIdentifier;
    v5->_passTypeIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passSerialNumber"));
    v8 = objc_claimAutoreleasedReturnValue();
    passSerialNumber = v5->_passSerialNumber;
    v5->_passSerialNumber = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountKeyIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    accountKeyIdentifier = v5->_accountKeyIdentifier;
    v5->_accountKeyIdentifier = (NSString *)v10;

  }
  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("passTypeIdentifier: '%@'; "), self->_passTypeIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR("passSerialNumber: '%@'; "), self->_passSerialNumber);
  objc_msgSend(v6, "appendFormat:", CFSTR("accountKeyIdentifier: '%@'; "), self->_accountKeyIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_passTypeIdentifier, a3);
}

- (NSString)passSerialNumber
{
  return self->_passSerialNumber;
}

- (void)setPassSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_passSerialNumber, a3);
}

- (NSString)accountKeyIdentifier
{
  return self->_accountKeyIdentifier;
}

- (void)setAccountKeyIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accountKeyIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_passSerialNumber, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
}

@end
