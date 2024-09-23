@implementation PKSearchTransactionGroupResult

- (unint64_t)tokenType
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_group, CFSTR("group"));
}

- (PKSearchTransactionGroupResult)initWithCoder:(id)a3
{
  id v4;
  PKSearchTransactionGroupResult *v5;
  uint64_t v6;
  PKPaymentTransactionGroup *group;

  v4 = a3;
  v5 = -[PKSearchTransactionGroupResult init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("group"));
    v6 = objc_claimAutoreleasedReturnValue();
    group = v5->_group;
    v5->_group = (PKPaymentTransactionGroup *)v6;

  }
  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKSearchTransactionGroupResult;
  -[PKSearchTransactionGroupResult description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendFormat:", CFSTR("group: '%@'; "), self->_group);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  PKPaymentTransactionGroup *group;
  PKPaymentTransactionGroup *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    group = self->_group;
    v6 = (PKPaymentTransactionGroup *)v4[1];
    if (group && v6)
      v7 = -[PKPaymentTransactionGroup isEqual:](group, "isEqual:");
    else
      v7 = group == v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_group);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (PKPaymentTransactionGroup)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
}

@end
