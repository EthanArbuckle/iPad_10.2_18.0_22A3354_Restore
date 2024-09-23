@implementation PKBankAccountInformation

- (PKBankAccountInformation)init
{
  uint64_t v3;
  PKBankAccountInformation *v4;
  PKBankAccountInformation *v5;
  objc_super v7;

  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    v4 = -[PKBankAccountInformation initWithType:](self, "initWithType:", 0);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PKBankAccountInformation;
    v4 = -[PKBankAccountInformation init](&v7, sel_init);
  }
  v5 = v4;

  return v5;
}

- (PKBankAccountInformation)initWithType:(int64_t)a3
{
  PKBankAccountInformation *v4;

  v4 = (PKBankAccountInformation *)objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "_classForType:", a3));

  return v4;
}

+ (Class)_classForType:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return (Class)0;
  else
    return (Class)(id)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKBankAccountInformation)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  PKBankAccountInformation *v6;
  uint64_t v7;
  NSString *bankName;
  void *v9;
  uint64_t v10;
  NSString *accountNumber;
  void *v12;
  uint64_t v13;
  NSString *routingNumber;
  uint64_t v15;
  NSString *identifier;
  uint64_t v17;
  objc_super v19;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("type")))
      v17 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    else
      v17 = 0;
    v6 = (PKBankAccountInformation *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_classForType:", v17)), "initWithCoder:", v4);

  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)PKBankAccountInformation;
    v6 = -[PKBankAccountInformation init](&v19, sel_init);
    if (v6)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bankName"));
      v7 = objc_claimAutoreleasedReturnValue();
      bankName = v6->_bankName;
      v6->_bankName = (NSString *)v7;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountNumber"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pk_zString");
      v10 = objc_claimAutoreleasedReturnValue();
      accountNumber = v6->_accountNumber;
      v6->_accountNumber = (NSString *)v10;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("routingNumber"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pk_zString");
      v13 = objc_claimAutoreleasedReturnValue();
      routingNumber = v6->_routingNumber;
      v6->_routingNumber = (NSString *)v13;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
      v15 = objc_claimAutoreleasedReturnValue();
      identifier = v6->_identifier;
      v6->_identifier = (NSString *)v15;

      v6->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bankName;
  void *v5;
  id v6;

  bankName = self->_bankName;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", bankName, CFSTR("bankName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_routingNumber, CFSTR("routingNumber"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_accountNumber, CFSTR("accountNumber"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PKBankAccountInformation type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("type"));

  objc_msgSend(v6, "encodeInteger:forKey:", self->_status, CFSTR("status"));
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

- (void)_commonDeleteAllBankInformation
{
  NSString *bankName;
  NSString *accountNumber;
  NSString *routingNumber;
  NSString *identifier;

  bankName = self->_bankName;
  self->_bankName = 0;

  accountNumber = self->_accountNumber;
  self->_accountNumber = 0;

  routingNumber = self->_routingNumber;
  self->_routingNumber = 0;

  identifier = self->_identifier;
  self->_identifier = 0;

  self->_status = 0;
}

- (BOOL)isValid
{
  BOOL v2;
  int64_t type;
  uint64_t v5;

  type = self->_type;
  if (type == 2)
  {
LABEL_4:
    if (-[NSString length](self->_bankName, "length") && -[NSString length](self->_accountNumber, "length"))
    {
      v5 = 16;
      return objc_msgSend(*(id *)((char *)&self->super.isa + v5), "length") != 0;
    }
    return 0;
  }
  if (type != 1)
  {
    if (type)
      return v2;
    goto LABEL_4;
  }
  if (!-[NSString length](self->_bankName, "length")
    || !-[NSString length](self->_accountNumber, "length")
    || !-[NSString length](self->_routingNumber, "length"))
  {
    v5 = 32;
    return objc_msgSend(*(id *)((char *)&self->super.isa + v5), "length") != 0;
  }
  return 1;
}

- (id)accountSuffix
{
  NSString *v3;
  void *v4;
  uint64_t v5;

  v3 = self->_accountNumber;
  v4 = v3;
  if (v3 && -[NSString length](v3, "length") >= 5)
  {
    -[NSString length](self->_accountNumber, "length");
    objc_msgSend(v4, "substringWithRange:");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  return v4;
}

- (id)maskedAccountNumber
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  PKPANMask();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKBankAccountInformation accountSuffix](self, "accountSuffix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(%@ %@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)type
{
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("bankName: '%@'; "), self->_bankName);
  objc_msgSend(v3, "appendFormat:", CFSTR("accountNumber: '%@'; "), self->_accountNumber);
  objc_msgSend(v3, "appendFormat:", CFSTR("routingNumber: '%@'; "), self->_routingNumber);
  PKAccountPaymentFundingSourceStatusToString(self->_status);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("status: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[NSString copyWithZone:](self->_bankName, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_accountNumber, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  v12 = -[NSString copyWithZone:](self->_routingNumber, "copyWithZone:", a3);
  v13 = (void *)v5[2];
  v5[2] = v12;

  v5[5] = self->_status;
  return v5;
}

- (NSString)accountNumber
{
  return self->_accountNumber;
}

- (NSString)routingNumber
{
  return self->_routingNumber;
}

- (NSString)bankName
{
  return self->_bankName;
}

- (void)setBankName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bankName, 0);
  objc_storeStrong((id *)&self->_routingNumber, 0);
  objc_storeStrong((id *)&self->_accountNumber, 0);
}

@end
