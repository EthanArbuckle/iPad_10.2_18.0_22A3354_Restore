@implementation PKCarShareAcceptanceResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCarShareAcceptanceResponse)initWithCoder:(id)a3
{
  id v4;
  PKCarShareAcceptanceResponse *v5;
  uint64_t v6;
  PKAppletSubcredential *subcredential;
  uint64_t v8;
  NSString *passUniqueIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKCarShareAcceptanceResponse;
  v5 = -[PKCarShareAcceptanceResponse init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subcredential"));
    v6 = objc_claimAutoreleasedReturnValue();
    subcredential = v5->_subcredential;
    v5->_subcredential = (PKAppletSubcredential *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passUniqueIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    passUniqueIdentifier = v5->_passUniqueIdentifier;
    v5->_passUniqueIdentifier = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKAppletSubcredential *subcredential;
  id v5;

  subcredential = self->_subcredential;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", subcredential, CFSTR("subcredential"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_passUniqueIdentifier, CFSTR("passUniqueIdentifier"));

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

  objc_msgSend(v6, "appendFormat:", CFSTR("subcredential: '%@'; "), self->_subcredential);
  objc_msgSend(v6, "appendFormat:", CFSTR("passUniqueIdentifier: '%@'; "), self->_passUniqueIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_subcredential);
  objc_msgSend(v3, "safelyAddObject:", self->_passUniqueIdentifier);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKCarShareAcceptanceResponse *v4;
  PKCarShareAcceptanceResponse *v5;
  BOOL v6;

  v4 = (PKCarShareAcceptanceResponse *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKCarShareAcceptanceResponse isEqualToCarShareAcceptanceResponse:](self, "isEqualToCarShareAcceptanceResponse:", v5);

  return v6;
}

- (BOOL)isEqualToCarShareAcceptanceResponse:(id)a3
{
  _QWORD *v4;
  PKAppletSubcredential *subcredential;
  PKAppletSubcredential *v6;
  BOOL v7;
  char v8;
  NSString *passUniqueIdentifier;
  NSString *v11;

  v4 = a3;
  if (!v4)
    goto LABEL_8;
  subcredential = self->_subcredential;
  v6 = (PKAppletSubcredential *)v4[1];
  if (subcredential)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    if (-[PKAppletSubcredential isEqual:](subcredential, "isEqual:"))
      goto LABEL_11;
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  if (subcredential != v6)
    goto LABEL_8;
LABEL_11:
  passUniqueIdentifier = self->_passUniqueIdentifier;
  v11 = (NSString *)v4[2];
  if (passUniqueIdentifier && v11)
    v8 = -[NSString isEqual:](passUniqueIdentifier, "isEqual:");
  else
    v8 = passUniqueIdentifier == v11;
LABEL_9:

  return v8;
}

- (PKAppletSubcredential)subcredential
{
  return self->_subcredential;
}

- (void)setSubcredential:(id)a3
{
  objc_storeStrong((id *)&self->_subcredential, a3);
}

- (NSString)passUniqueIdentifier
{
  return self->_passUniqueIdentifier;
}

- (void)setPassUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_passUniqueIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_subcredential, 0);
}

@end
