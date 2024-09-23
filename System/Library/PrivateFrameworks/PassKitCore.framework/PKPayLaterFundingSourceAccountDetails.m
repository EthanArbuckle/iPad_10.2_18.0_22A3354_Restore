@implementation PKPayLaterFundingSourceAccountDetails

- (PKPayLaterFundingSourceAccountDetails)initWithDictionary:(id)a3 type:(unint64_t)a4
{
  id v6;
  PKPayLaterFundingSourceAccountDetails *v7;
  PKPayLaterFundingSourceAccountDetails *v8;
  uint64_t v9;
  NSString *accountIdentifier;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPayLaterFundingSourceAccountDetails;
  v7 = -[PKPayLaterFundingSourceAccountDetails init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    -[PKPayLaterFundingSourceAccountDetails setType:](v7, "setType:", a4);
    objc_msgSend(v6, "PKStringForKey:", CFSTR("accountIdentifier"));
    v9 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v8->_accountIdentifier;
    v8->_accountIdentifier = (NSString *)v9;

  }
  return v8;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_accountIdentifier, CFSTR("accountIdentifier"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterFundingSourceAccountDetails *v4;
  PKPayLaterFundingSourceAccountDetails *v5;
  BOOL v6;

  v4 = (PKPayLaterFundingSourceAccountDetails *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPayLaterFundingSourceAccountDetails isEqualToDetails:](self, "isEqualToDetails:", v5);

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
  BOOL v11;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_10;
  v6 = (void *)v4[2];
  v7 = self->_accountIdentifier;
  v8 = v6;
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
    {

LABEL_10:
      v11 = 0;
      goto LABEL_11;
    }
    v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_10;
  }
  v11 = self->_type == v5[1];
LABEL_11:

  return v11;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_accountIdentifier);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;

  return v5;
}

- (NSString)description
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("accountIdentifier: '%@'; "), self->_accountIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterFundingSourceAccountDetails)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterFundingSourceAccountDetails *v5;
  uint64_t v6;
  NSString *accountIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterFundingSourceAccountDetails;
  v5 = -[PKPayLaterFundingSourceAccountDetails init](&v9, sel_init);
  if (v5)
  {
    -[PKPayLaterFundingSourceAccountDetails setType:](v5, "setType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v6;

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
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountIdentifier, CFSTR("accountIdentifier"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPayLaterFundingSourceAccountDetails *v5;
  uint64_t v6;
  NSString *accountIdentifier;

  v5 = -[PKPayLaterFundingSourceAccountDetails init](+[PKPayLaterFundingSourceAccountDetails allocWithZone:](PKPayLaterFundingSourceAccountDetails, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_accountIdentifier, "copyWithZone:", a3);
  accountIdentifier = v5->_accountIdentifier;
  v5->_accountIdentifier = (NSString *)v6;

  -[PKPayLaterFundingSourceAccountDetails setType:](v5, "setType:", self->_type);
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

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
