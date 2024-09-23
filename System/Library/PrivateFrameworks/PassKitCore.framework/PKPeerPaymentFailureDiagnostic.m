@implementation PKPeerPaymentFailureDiagnostic

- (PKPeerPaymentFailureDiagnostic)initWithCoder:(id)a3
{
  id v4;
  PKPeerPaymentFailureDiagnostic *v5;
  uint64_t v6;
  NSError *error;
  uint64_t v8;
  NSString *transactionIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPeerPaymentFailureDiagnostic;
  v5 = -[PKPeerPaymentFailureDiagnostic init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v6 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v6;

    v5->_flowType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("flowType"));
    v5->_reasonCode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("reasonCode"));
    v5->_role = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("role"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    transactionIdentifier = v5->_transactionIdentifier;
    v5->_transactionIdentifier = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSError *error;
  id v5;

  error = self->_error;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", error, CFSTR("error"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_flowType, CFSTR("flowType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_reasonCode, CFSTR("reasonCode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_role, CFSTR("role"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionIdentifier, CFSTR("transactionIdentifier"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (unint64_t)flowType
{
  return self->_flowType;
}

- (void)setFlowType:(unint64_t)a3
{
  self->_flowType = a3;
}

- (int64_t)reasonCode
{
  return self->_reasonCode;
}

- (void)setReasonCode:(int64_t)a3
{
  self->_reasonCode = a3;
}

- (unint64_t)role
{
  return self->_role;
}

- (void)setRole:(unint64_t)a3
{
  self->_role = a3;
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (void)setTransactionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_transactionIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
