@implementation PKPaymentAuthorizationRewrapStateParam

+ (id)paramWithWrappedPayment:(id)a3 nonce:(id)a4 credential:(id)a5 cryptogramType:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(a1, "param");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWrappedPayment:", v12);

  objc_msgSend(v13, "setNonceData:", v11);
  objc_msgSend(v13, "setCredential:", v10);

  objc_msgSend(v13, "setCryptogramType:", a6);
  return v13;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  PKWrappedPayment *wrappedPayment;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  wrappedPayment = self->_wrappedPayment;
  -[NSData hexEncoding](self->_nonceData, "hexEncoding");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; wrappedPayment: %@; nonceData: %@>"),
    v4,
    self,
    wrappedPayment,
    v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (PKWrappedPayment)wrappedPayment
{
  return self->_wrappedPayment;
}

- (void)setWrappedPayment:(id)a3
{
  objc_storeStrong((id *)&self->_wrappedPayment, a3);
}

- (NSData)nonceData
{
  return self->_nonceData;
}

- (void)setNonceData:(id)a3
{
  objc_storeStrong((id *)&self->_nonceData, a3);
}

- (NSData)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
  objc_storeStrong((id *)&self->_credential, a3);
}

- (int64_t)cryptogramType
{
  return self->_cryptogramType;
}

- (void)setCryptogramType:(int64_t)a3
{
  self->_cryptogramType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_nonceData, 0);
  objc_storeStrong((id *)&self->_wrappedPayment, 0);
}

@end
