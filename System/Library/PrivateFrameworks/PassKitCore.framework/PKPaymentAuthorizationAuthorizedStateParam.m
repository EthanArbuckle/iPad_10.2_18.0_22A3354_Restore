@implementation PKPaymentAuthorizationAuthorizedStateParam

+ (id)paramWithPaymentToken:(id)a3 rewrapResponse:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "param");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPaymentToken:", v7);

  objc_msgSend(v8, "setRewrapResponse:", v6);
  return v8;
}

+ (id)paramWithPayment:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "param");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPayment:", v4);

  return v5;
}

+ (id)paramWithPurchase:(id)a3 purchaseTransactionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "param");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPurchase:", v7);

  objc_msgSend(v8, "setPurchaseTransactionIdentifier:", v6);
  return v8;
}

+ (id)paramWithAuthorizedPeerPaymentQuote:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "param");
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5[6];
  v5[6] = v4;

  return v5;
}

+ (id)paramWithApplePayTrustSignature:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "param");
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5[7];
  v5[7] = v4;

  return v5;
}

+ (id)paramWithInstallmentAuthorizationToken:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "param");
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5[8];
  v5[8] = v4;

  return v5;
}

- (id)description
{
  PKServiceProviderPurchase *purchase;
  void *v4;
  uint64_t v5;

  if (self->_payment)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; payment: %@>"),
      objc_opt_class(),
      self,
      self->_payment);
  }
  else
  {
    purchase = self->_purchase;
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = objc_opt_class();
    if (purchase)
      objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; purchase: %@>"), v5, self, self->_purchase);
    else
      objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; paymentToken: %@>"), v5, self, self->_paymentToken);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (PKPaymentToken)paymentToken
{
  return self->_paymentToken;
}

- (void)setPaymentToken:(id)a3
{
  objc_storeStrong((id *)&self->_paymentToken, a3);
}

- (PKPayment)payment
{
  return self->_payment;
}

- (void)setPayment:(id)a3
{
  objc_storeStrong((id *)&self->_payment, a3);
}

- (PKPaymentRewrapResponseBase)rewrapResponse
{
  return self->_rewrapResponse;
}

- (void)setRewrapResponse:(id)a3
{
  objc_storeStrong((id *)&self->_rewrapResponse, a3);
}

- (PKServiceProviderPurchase)purchase
{
  return self->_purchase;
}

- (void)setPurchase:(id)a3
{
  objc_storeStrong((id *)&self->_purchase, a3);
}

- (NSString)purchaseTransactionIdentifier
{
  return self->_purchaseTransactionIdentifier;
}

- (void)setPurchaseTransactionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (PKAuthorizedPeerPaymentQuote)authorizedPeerPaymentQuote
{
  return self->_authorizedPeerPaymentQuote;
}

- (PKApplePayTrustSignature)applePayTrustSignature
{
  return self->_applePayTrustSignature;
}

- (NSString)installmentAuthorizationToken
{
  return self->_installmentAuthorizationToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installmentAuthorizationToken, 0);
  objc_storeStrong((id *)&self->_applePayTrustSignature, 0);
  objc_storeStrong((id *)&self->_authorizedPeerPaymentQuote, 0);
  objc_storeStrong((id *)&self->_purchaseTransactionIdentifier, 0);
  objc_storeStrong((id *)&self->_purchase, 0);
  objc_storeStrong((id *)&self->_rewrapResponse, 0);
  objc_storeStrong((id *)&self->_payment, 0);
  objc_storeStrong((id *)&self->_paymentToken, 0);
}

@end
