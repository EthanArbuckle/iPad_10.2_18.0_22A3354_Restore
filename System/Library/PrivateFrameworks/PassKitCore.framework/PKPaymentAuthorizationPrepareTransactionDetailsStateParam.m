@implementation PKPaymentAuthorizationPrepareTransactionDetailsStateParam

+ (id)paramWithMerchantSession:(id)a3 secureElementIdentifier:(id)a4 transactionAmount:(id)a5 currencyCode:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(a1, "param");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setMerchantSession:", v13);

  objc_msgSend(v14, "setSecureElementIdentifier:", v12);
  objc_msgSend(v14, "setTransactionAmount:", v11);

  objc_msgSend(v14, "setCurrencyCode:", v10);
  return v14;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; merchantSession: %@; secureElementIdentifier: %@; transactionAmount: %@, currencyCode: %@;>"),
    v5,
    self,
    self->_merchantSession,
    self->_secureElementIdentifier,
    CFSTR("<redacted>"),
    self->_currencyCode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PKPaymentMerchantSession)merchantSession
{
  return self->_merchantSession;
}

- (void)setMerchantSession:(id)a3
{
  objc_storeStrong((id *)&self->_merchantSession, a3);
}

- (NSString)secureElementIdentifier
{
  return self->_secureElementIdentifier;
}

- (void)setSecureElementIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDecimalNumber)transactionAmount
{
  return self->_transactionAmount;
}

- (void)setTransactionAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_transactionAmount, 0);
  objc_storeStrong((id *)&self->_secureElementIdentifier, 0);
  objc_storeStrong((id *)&self->_merchantSession, 0);
}

@end
