@implementation PKPaymentTransactionTag

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  _QWORD *v7;
  NSDecimalNumber *rank;
  NSDecimalNumber *v9;
  NSString *localeIdentifier;
  NSString *v11;
  NSString *localizedTitle;
  NSString *v13;
  char v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (!v6 || self->_type != v6[1])
    goto LABEL_18;
  rank = self->_rank;
  v9 = (NSDecimalNumber *)v7[4];
  if (rank && v9)
  {
    if ((-[NSDecimalNumber isEqual:](rank, "isEqual:") & 1) == 0)
      goto LABEL_18;
  }
  else if (rank != v9)
  {
    goto LABEL_18;
  }
  localeIdentifier = self->_localeIdentifier;
  v11 = (NSString *)v7[3];
  if (!localeIdentifier || !v11)
  {
    if (localeIdentifier == v11)
      goto LABEL_14;
LABEL_18:
    v14 = 0;
    goto LABEL_19;
  }
  if ((-[NSString isEqual:](localeIdentifier, "isEqual:") & 1) == 0)
    goto LABEL_18;
LABEL_14:
  localizedTitle = self->_localizedTitle;
  v13 = (NSString *)v7[2];
  if (localizedTitle && v13)
    v14 = -[NSString isEqual:](localizedTitle, "isEqual:");
  else
    v14 = localizedTitle == v13;
LABEL_19:

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_rank);
  objc_msgSend(v3, "safelyAddObject:", self->_localeIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_localizedTitle);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentTransactionTag)initWithCoder:(id)a3
{
  id v4;
  PKPaymentTransactionTag *v5;
  uint64_t v6;
  NSString *localizedTitle;
  uint64_t v8;
  NSString *localeIdentifier;
  uint64_t v10;
  NSDecimalNumber *rank;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentTransactionTag;
  v5 = -[PKPaymentTransactionTag init](&v13, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedTitle"));
    v6 = objc_claimAutoreleasedReturnValue();
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localeIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    localeIdentifier = v5->_localeIdentifier;
    v5->_localeIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rank"));
    v10 = objc_claimAutoreleasedReturnValue();
    rank = v5->_rank;
    v5->_rank = (NSDecimalNumber *)v10;

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
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedTitle, CFSTR("localizedTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localeIdentifier, CFSTR("localeIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rank, CFSTR("rank"));

}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_storeStrong((id *)&self->_localizedTitle, a3);
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_localeIdentifier, a3);
}

- (NSDecimalNumber)rank
{
  return self->_rank;
}

- (void)setRank:(id)a3
{
  objc_storeStrong((id *)&self->_rank, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rank, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end
