@implementation PKSearchTransactionPeerPaymentSubTypeResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)tokenType
{
  return 7;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_subType, CFSTR("subType"));
}

- (PKSearchTransactionPeerPaymentSubTypeResult)initWithCoder:(id)a3
{
  id v4;
  PKSearchTransactionPeerPaymentSubTypeResult *v5;

  v4 = a3;
  v5 = -[PKSearchTransactionPeerPaymentSubTypeResult init](self, "init");
  if (v5)
    v5->_subType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("subType"));

  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKSearchTransactionPeerPaymentSubTypeResult;
  -[PKSearchTransactionPeerPaymentSubTypeResult description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendFormat:", CFSTR("subType: '%lu'; "), self->_subType);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_subType == v4[1];

  return v5;
}

- (unint64_t)hash
{
  return self->_subType + 527;
}

- (int64_t)subType
{
  return self->_subType;
}

- (void)setSubType:(int64_t)a3
{
  self->_subType = a3;
}

@end
