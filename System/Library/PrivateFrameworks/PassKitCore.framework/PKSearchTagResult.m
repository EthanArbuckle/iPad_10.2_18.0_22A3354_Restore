@implementation PKSearchTagResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)tokenType
{
  return 9;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_tag, CFSTR("tag"));
}

- (PKSearchTagResult)initWithCoder:(id)a3
{
  id v4;
  PKSearchTagResult *v5;
  uint64_t v6;
  PKPaymentTransactionTag *tag;

  v4 = a3;
  v5 = -[PKSearchTagResult init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tag"));
    v6 = objc_claimAutoreleasedReturnValue();
    tag = v5->_tag;
    v5->_tag = (PKPaymentTransactionTag *)v6;

  }
  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKSearchTagResult;
  -[PKSearchTagResult description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendFormat:", CFSTR("tag: '%@'; "), self->_tag);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  PKPaymentTransactionTag *tag;
  PKPaymentTransactionTag *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    tag = self->_tag;
    v6 = (PKPaymentTransactionTag *)v4[1];
    if (tag && v6)
      v7 = -[PKPaymentTransactionTag isEqual:](tag, "isEqual:");
    else
      v7 = tag == v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = self->_tag;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PKCombinedHash(17, v2);

  return v3;
}

- (PKPaymentTransactionTag)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{
  objc_storeStrong((id *)&self->_tag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
}

@end
