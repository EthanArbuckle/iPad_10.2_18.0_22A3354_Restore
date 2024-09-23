@implementation PKAccountPaymentFundingDetailsBankAccount

- (PKAccountPaymentFundingDetailsBankAccount)initWithDictionary:(id)a3
{
  id v4;
  PKAccountPaymentFundingDetailsBankAccount *v5;
  uint64_t v6;
  NSString *accountIdentifier;
  void *v8;
  uint64_t v9;
  NSString *accountNumber;
  void *v11;
  uint64_t v12;
  NSString *routingNumber;
  uint64_t v14;
  NSString *name;
  void *v16;
  void *v17;
  PKAccountFundingSourceVerification *v18;
  PKAccountFundingSourceVerification *verificationDetails;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKAccountPaymentFundingDetailsBankAccount;
  v5 = -[PKAccountPaymentFundingDetails initWithDictionary:](&v21, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("accountId"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("accountNumber"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pk_zString");
    v9 = objc_claimAutoreleasedReturnValue();
    accountNumber = v5->_accountNumber;
    v5->_accountNumber = (NSString *)v9;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("routingNumber"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pk_zString");
    v12 = objc_claimAutoreleasedReturnValue();
    routingNumber = v5->_routingNumber;
    v5->_routingNumber = (NSString *)v12;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("name"));
    v14 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v14;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("status"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_status = PKAccountPaymentFundingSourceStatusFromString(v16);

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("verification"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "count"))
    {
      v18 = -[PKAccountFundingSourceVerification initWithDictionary:]([PKAccountFundingSourceVerification alloc], "initWithDictionary:", v17);
      verificationDetails = v5->_verificationDetails;
      v5->_verificationDetails = v18;

    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKAccountPaymentFundingDetailsBankAccount *v5;
  uint64_t v6;
  NSString *accountIdentifier;
  uint64_t v8;
  NSString *accountNumber;
  uint64_t v10;
  NSString *routingNumber;
  uint64_t v12;
  NSString *name;
  PKAccountFundingSourceVerification *v14;
  PKAccountFundingSourceVerification *verificationDetails;

  v5 = -[PKAccountPaymentFundingDetailsBankAccount init](+[PKAccountPaymentFundingDetailsBankAccount allocWithZone:](PKAccountPaymentFundingDetailsBankAccount, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_accountIdentifier, "copyWithZone:", a3);
  accountIdentifier = v5->_accountIdentifier;
  v5->_accountIdentifier = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_accountNumber, "copyWithZone:", a3);
  accountNumber = v5->_accountNumber;
  v5->_accountNumber = (NSString *)v8;

  v10 = -[NSString copyWithZone:](self->_routingNumber, "copyWithZone:", a3);
  routingNumber = v5->_routingNumber;
  v5->_routingNumber = (NSString *)v10;

  v12 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  name = v5->_name;
  v5->_name = (NSString *)v12;

  v5->_status = self->_status;
  v14 = -[PKAccountFundingSourceVerification copyWithZone:](self->_verificationDetails, "copyWithZone:", a3);
  verificationDetails = v5->_verificationDetails;
  v5->_verificationDetails = v14;

  return v5;
}

- (id)fundingDetailsUnencryptedDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_accountIdentifier, CFSTR("accountId"));
  -[NSString pk_zString](self->_accountNumber, "pk_zString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("accountNumber"));

  -[NSString pk_zString](self->_routingNumber, "pk_zString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("routingNumber"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_name, CFSTR("name"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_status);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("status"));

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountPaymentFundingDetailsBankAccount)initWithCoder:(id)a3
{
  id v4;
  PKAccountPaymentFundingDetailsBankAccount *v5;
  uint64_t v6;
  NSString *accountIdentifier;
  void *v8;
  uint64_t v9;
  NSString *accountNumber;
  void *v11;
  uint64_t v12;
  NSString *routingNumber;
  uint64_t v14;
  NSString *name;
  uint64_t v16;
  PKAccountFundingSourceVerification *verificationDetails;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKAccountPaymentFundingDetailsBankAccount;
  v5 = -[PKAccountPaymentFundingDetails initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountId"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountNumber"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pk_zString");
    v9 = objc_claimAutoreleasedReturnValue();
    accountNumber = v5->_accountNumber;
    v5->_accountNumber = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("routingNumber"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pk_zString");
    v12 = objc_claimAutoreleasedReturnValue();
    routingNumber = v5->_routingNumber;
    v5->_routingNumber = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v14 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v14;

    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("verification"));
    v16 = objc_claimAutoreleasedReturnValue();
    verificationDetails = v5->_verificationDetails;
    v5->_verificationDetails = (PKAccountFundingSourceVerification *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKAccountPaymentFundingDetailsBankAccount;
  v4 = a3;
  -[PKAccountPaymentFundingDetails encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_accountIdentifier, CFSTR("accountId"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_accountNumber, CFSTR("accountNumber"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_routingNumber, CFSTR("routingNumber"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_status, CFSTR("status"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_verificationDetails, CFSTR("verification"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *accountIdentifier;
  NSString *v6;
  BOOL v7;
  PKAccountFundingSourceVerification *verificationDetails;
  PKAccountFundingSourceVerification *v9;
  BOOL v10;
  char v11;
  NSString *name;
  NSString *v14;
  objc_super v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_17;
  v15.receiver = self;
  v15.super_class = (Class)PKAccountPaymentFundingDetailsBankAccount;
  if (!-[PKAccountPaymentFundingDetails isEqual:](&v15, sel_isEqual_, v4))
    goto LABEL_17;
  accountIdentifier = self->_accountIdentifier;
  v6 = (NSString *)v4[3];
  if (accountIdentifier)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (accountIdentifier != v6)
      goto LABEL_17;
  }
  else if ((-[NSString isEqual:](accountIdentifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_17;
  }
  verificationDetails = self->_verificationDetails;
  v9 = (PKAccountFundingSourceVerification *)v4[8];
  if (verificationDetails)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    if (-[PKAccountFundingSourceVerification isEqual:](verificationDetails, "isEqual:"))
      goto LABEL_20;
LABEL_17:
    v11 = 0;
    goto LABEL_18;
  }
  if (verificationDetails != v9)
    goto LABEL_17;
LABEL_20:
  name = self->_name;
  v14 = (NSString *)v4[6];
  if (name && v14)
    v11 = -[NSString isEqual:](name, "isEqual:");
  else
    v11 = name == v14;
LABEL_18:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  unint64_t v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_accountIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_name);
  v7.receiver = self;
  v7.super_class = (Class)PKAccountPaymentFundingDetailsBankAccount;
  v4 = -[PKAccountPaymentFundingDetailsBankAccount hash](&v7, sel_hash);
  v5 = PKCombinedHash((uint64_t)v4, v3);

  return v5;
}

- (id)description
{
  void *v3;
  unint64_t status;
  __CFString *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("accountIdentifier: '%@'; "), self->_accountIdentifier);
  if (self->_accountNumber)
    objc_msgSend(v3, "appendFormat:", CFSTR("accountNumber: %@; "), CFSTR("<redacted>"));
  if (self->_routingNumber)
    objc_msgSend(v3, "appendFormat:", CFSTR("routingNumber: %@; "), CFSTR("<redacted>"));
  objc_msgSend(v3, "appendFormat:", CFSTR("name: '%@'; "), self->_name);
  status = self->_status;
  if (status > 2)
    v5 = 0;
  else
    v5 = off_1E2AD7B38[status];
  objc_msgSend(v3, "appendFormat:", CFSTR("status: '%@'; "), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("verificationDetails: %@; "), self->_verificationDetails);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (void)setAccountNumber:(id)a3
{
  NSString *v4;
  NSString *accountNumber;

  objc_msgSend(a3, "pk_zString");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  accountNumber = self->_accountNumber;
  self->_accountNumber = v4;

}

- (void)setRoutingNumber:(id)a3
{
  NSString *v4;
  NSString *routingNumber;

  objc_msgSend(a3, "pk_zString");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  routingNumber = self->_routingNumber;
  self->_routingNumber = v4;

}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)accountNumber
{
  return self->_accountNumber;
}

- (NSString)routingNumber
{
  return self->_routingNumber;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (PKAccountFundingSourceVerification)verificationDetails
{
  return self->_verificationDetails;
}

- (void)setVerificationDetails:(id)a3
{
  objc_storeStrong((id *)&self->_verificationDetails, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationDetails, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_routingNumber, 0);
  objc_storeStrong((id *)&self->_accountNumber, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
