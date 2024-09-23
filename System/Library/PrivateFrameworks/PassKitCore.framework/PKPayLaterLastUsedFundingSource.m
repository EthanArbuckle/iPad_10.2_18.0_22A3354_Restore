@implementation PKPayLaterLastUsedFundingSource

- (PKPayLaterLastUsedFundingSource)initWithDictionary:(id)a3
{
  id v4;
  PKPayLaterLastUsedFundingSource *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPayLaterLastUsedFundingSource;
  v5 = -[PKPayLaterLastUsedFundingSource init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
    {
      v13[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_type = PKPayLaterFundingSourcePaymentTypeFromStrings(v10);

    }
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterLastUsedFundingSource *v4;
  PKPayLaterLastUsedFundingSource *v5;
  BOOL v6;

  v4 = (PKPayLaterLastUsedFundingSource *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPayLaterLastUsedFundingSource isEqualToPayLaterLastUsedFundingSource:](self, "isEqualToPayLaterLastUsedFundingSource:", v5);

  return v6;
}

- (BOOL)isEqualToPayLaterLastUsedFundingSource:(id)a3
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
  v7 = self->_identifier;
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
  -[NSString hash](self->_identifier, "hash");
  return SipHash();
}

- (id)description
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  PKPayLaterFundingSourcePaymentTypeToStrings(self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *identifier;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", identifier, CFSTR("identifier"));
  PKPayLaterFundingSourcePaymentTypeToStrings(self->_type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("type"));

  v7 = (void *)objc_msgSend(v4, "copy");
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterLastUsedFundingSource)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterLastUsedFundingSource *v5;
  uint64_t v6;
  NSString *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterLastUsedFundingSource;
  v5 = -[PKPayLaterLastUsedFundingSource init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
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
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPayLaterLastUsedFundingSource *v5;
  uint64_t v6;
  NSString *identifier;

  v5 = -[PKPayLaterLastUsedFundingSource init](+[PKPayLaterLastUsedFundingSource allocWithZone:](PKPayLaterLastUsedFundingSource, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v5->_type = self->_type;
  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
