@implementation PKPaymentAuthorizationClientCallbackStateParam

+ (PKPaymentAuthorizationClientCallbackStateParam)paramWithCallbackKind:(int64_t)a3 object:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a1, "param");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setKind:", a3);
  objc_msgSend(v7, "setObject:", v6);

  return (PKPaymentAuthorizationClientCallbackStateParam *)v7;
}

- (NSString)couponCode
{
  return (NSString *)self->_object;
}

- (CNContact)shippingContact
{
  return (CNContact *)self->_object;
}

- (PKPaymentMethod)paymentMethod
{
  return (PKPaymentMethod *)self->_object;
}

- (PKShippingMethod)shippingMethod
{
  return (PKShippingMethod *)self->_object;
}

- (PKPayment)payment
{
  return (PKPayment *)self->_object;
}

- (PKServiceProviderPurchase)purchase
{
  return (PKServiceProviderPurchase *)self->_object;
}

- (PKAuthorizedPeerPaymentQuote)authorizedPeerPaymentQuote
{
  return (PKAuthorizedPeerPaymentQuote *)self->_object;
}

- (PKApplePayTrustSignature)applePayTrustSignature
{
  return (PKApplePayTrustSignature *)self->_object;
}

- (PKAccountServicePaymentMethod)accountServicePaymentMethod
{
  return (PKAccountServicePaymentMethod *)self->_object;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t kind;
  const __CFString *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  kind = self->_kind;
  if (kind > 0xA)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E2AD6C50[kind];
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; kind: %@; object: %@>"), v4, self, v6, self->_object);
}

- (int64_t)kind
{
  return self->_kind;
}

- (void)setKind:(int64_t)a3
{
  self->_kind = a3;
}

- (id)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
  objc_storeStrong(&self->_object, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_object, 0);
}

@end
