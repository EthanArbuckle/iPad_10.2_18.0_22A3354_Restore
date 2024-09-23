@implementation PKSearchTransactionTypeResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)tokenType
{
  return 4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_transactionType, CFSTR("transactionType"));
}

- (PKSearchTransactionTypeResult)initWithCoder:(id)a3
{
  id v4;
  PKSearchTransactionTypeResult *v5;

  v4 = a3;
  v5 = -[PKSearchTransactionTypeResult init](self, "init");
  if (v5)
    v5->_transactionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transactionType"));

  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKSearchTransactionTypeResult;
  -[PKSearchTransactionTypeResult description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendFormat:", CFSTR("transactionType: '%lu'; "), self->_transactionType);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_transactionType == v4[1];

  return v5;
}

- (unint64_t)hash
{
  return self->_transactionType + 527;
}

- (int64_t)transactionType
{
  return self->_transactionType;
}

- (void)setTransactionType:(int64_t)a3
{
  self->_transactionType = a3;
}

@end
