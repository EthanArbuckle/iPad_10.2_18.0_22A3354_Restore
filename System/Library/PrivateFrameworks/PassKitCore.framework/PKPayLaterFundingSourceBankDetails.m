@implementation PKPayLaterFundingSourceBankDetails

- (PKPayLaterFundingSourceBankDetails)initWithAccountFundingSource:(id)a3
{
  id v4;
  PKPayLaterFundingSourceBankDetails *v5;
  PKPayLaterFundingSourceBankDetails *v6;
  void *v7;
  uint64_t v8;
  NSString *bankName;
  uint64_t v10;
  NSString *identifier;
  uint64_t v12;
  NSString *accountNumberSuffix;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPayLaterFundingSourceBankDetails;
  v5 = -[PKPayLaterFundingSourceBankDetails init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_type = 2;
    objc_msgSend(v4, "bankAccountRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bankName");
    v8 = objc_claimAutoreleasedReturnValue();
    bankName = v6->_bankName;
    v6->_bankName = (NSString *)v8;

    objc_msgSend(v7, "identifier");
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v10;

    objc_msgSend(v7, "accountSuffix");
    v12 = objc_claimAutoreleasedReturnValue();
    accountNumberSuffix = v6->_accountNumberSuffix;
    v6->_accountNumberSuffix = (NSString *)v12;

  }
  return v6;
}

- (PKPayLaterFundingSourceBankDetails)initWithDictionary:(id)a3 type:(unint64_t)a4
{
  id v6;
  PKPayLaterFundingSourceBankDetails *v7;
  PKPayLaterFundingSourceBankDetails *v8;
  uint64_t v9;
  NSString *accountNumberSuffix;
  uint64_t v11;
  NSString *bankName;
  uint64_t v13;
  NSString *identifier;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPayLaterFundingSourceBankDetails;
  v7 = -[PKPayLaterFundingSourceBankDetails init](&v16, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_type = a4;
    objc_msgSend(v6, "PKStringForKey:", CFSTR("accountNumberSuffix"));
    v9 = objc_claimAutoreleasedReturnValue();
    accountNumberSuffix = v8->_accountNumberSuffix;
    v8->_accountNumberSuffix = (NSString *)v9;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("bankName"));
    v11 = objc_claimAutoreleasedReturnValue();
    bankName = v8->_bankName;
    v8->_bankName = (NSString *)v11;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("identifier"));
    v13 = objc_claimAutoreleasedReturnValue();
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v13;

  }
  return v8;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_accountNumberSuffix, CFSTR("accountNumberSuffix"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_bankName, CFSTR("bankName"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("identifier"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterFundingSourceBankDetails *v4;
  PKPayLaterFundingSourceBankDetails *v5;
  BOOL v6;

  v4 = (PKPayLaterFundingSourceBankDetails *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPayLaterFundingSourceBankDetails isEqualToDetails:](self, "isEqualToDetails:", v5);

  return v6;
}

- (BOOL)isEqualToDetails:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  void *v11;
  NSString *v12;
  _BOOL4 v13;
  void *v14;
  NSString *v15;
  _BOOL4 v16;
  BOOL v17;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_20;
  v6 = (void *)v4[2];
  v7 = self->_accountNumberSuffix;
  v8 = v6;
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
      goto LABEL_19;
    v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_20;
  }
  v11 = (void *)v5[3];
  v7 = self->_bankName;
  v12 = v11;
  if (v7 == v12)
  {

    goto LABEL_14;
  }
  v9 = v12;
  if (!v7 || !v12)
  {
LABEL_19:

    goto LABEL_20;
  }
  v13 = -[NSString isEqualToString:](v7, "isEqualToString:", v12);

  if (!v13)
    goto LABEL_20;
LABEL_14:
  v14 = (void *)v5[4];
  v7 = self->_identifier;
  v15 = v14;
  if (v7 == v15)
  {

LABEL_23:
    v17 = self->_type == v5[1];
    goto LABEL_21;
  }
  v9 = v15;
  if (!v7 || !v15)
    goto LABEL_19;
  v16 = -[NSString isEqualToString:](v7, "isEqualToString:", v15);

  if (v16)
    goto LABEL_23;
LABEL_20:
  v17 = 0;
LABEL_21:

  return v17;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_accountNumberSuffix);
  objc_msgSend(v3, "safelyAddObject:", self->_bankName);
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;

  return v5;
}

- (NSString)description
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("accountNumberSuffix: '%@'; "), self->_accountNumberSuffix);
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterFundingSourceBankDetails)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterFundingSourceBankDetails *v5;
  uint64_t v6;
  NSString *accountNumberSuffix;
  uint64_t v8;
  NSString *bankName;
  uint64_t v10;
  NSString *identifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPayLaterFundingSourceBankDetails;
  v5 = -[PKPayLaterFundingSourceBankDetails init](&v13, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountNumberSuffix"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountNumberSuffix = v5->_accountNumberSuffix;
    v5->_accountNumberSuffix = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bankName"));
    v8 = objc_claimAutoreleasedReturnValue();
    bankName = v5->_bankName;
    v5->_bankName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountNumberSuffix, CFSTR("accountNumberSuffix"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bankName, CFSTR("bankName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPayLaterFundingSourceBankDetails *v5;
  uint64_t v6;
  NSString *accountNumberSuffix;
  uint64_t v8;
  NSString *bankName;
  uint64_t v10;
  NSString *identifier;

  v5 = -[PKPayLaterFundingSourceBankDetails init](+[PKPayLaterFundingSourceBankDetails allocWithZone:](PKPayLaterFundingSourceBankDetails, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_accountNumberSuffix, "copyWithZone:", a3);
  accountNumberSuffix = v5->_accountNumberSuffix;
  v5->_accountNumberSuffix = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_bankName, "copyWithZone:", a3);
  bankName = v5->_bankName;
  v5->_bankName = (NSString *)v8;

  v10 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v10;

  v5->_type = self->_type;
  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)accountNumberSuffix
{
  return self->_accountNumberSuffix;
}

- (void)setAccountNumberSuffix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bankName, 0);
  objc_storeStrong((id *)&self->_accountNumberSuffix, 0);
}

@end
