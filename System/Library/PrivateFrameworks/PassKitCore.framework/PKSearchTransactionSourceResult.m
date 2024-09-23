@implementation PKSearchTransactionSourceResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)tokenType
{
  return 6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_transactionSource, CFSTR("transactionSource"));
}

- (PKSearchTransactionSourceResult)initWithCoder:(id)a3
{
  id v4;
  PKSearchTransactionSourceResult *v5;

  v4 = a3;
  v5 = -[PKSearchTransactionSourceResult init](self, "init");
  if (v5)
    v5->_transactionSource = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transactionSource"));

  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKSearchTransactionSourceResult;
  -[PKSearchTransactionSourceResult description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendFormat:", CFSTR("transactionSource: '%lu'; "), self->_transactionSource);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_transactionSource == v4[1];

  return v5;
}

- (unint64_t)hash
{
  return self->_transactionSource + 527;
}

- (unint64_t)transactionSource
{
  return self->_transactionSource;
}

- (void)setTransactionSource:(unint64_t)a3
{
  self->_transactionSource = a3;
}

@end
