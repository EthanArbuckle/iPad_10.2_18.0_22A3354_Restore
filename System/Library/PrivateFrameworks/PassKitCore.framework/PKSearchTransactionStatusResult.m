@implementation PKSearchTransactionStatusResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)tokenType
{
  return 5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_transactionStatus, CFSTR("transactionStatus"));
}

- (PKSearchTransactionStatusResult)initWithCoder:(id)a3
{
  id v4;
  PKSearchTransactionStatusResult *v5;

  v4 = a3;
  v5 = -[PKSearchTransactionStatusResult init](self, "init");
  if (v5)
    v5->_transactionStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transactionStatus"));

  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKSearchTransactionStatusResult;
  -[PKSearchTransactionStatusResult description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendFormat:", CFSTR("transactionStatus: '%lu'; "), self->_transactionStatus);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_transactionStatus == v4[1];

  return v5;
}

- (unint64_t)hash
{
  return self->_transactionStatus + 527;
}

- (int64_t)transactionStatus
{
  return self->_transactionStatus;
}

- (void)setTransactionStatus:(int64_t)a3
{
  self->_transactionStatus = a3;
}

@end
