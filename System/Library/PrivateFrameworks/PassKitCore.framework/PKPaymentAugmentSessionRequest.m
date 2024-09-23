@implementation PKPaymentAugmentSessionRequest

+ (id)augmentSessionRequestWithBaseRequest:(id)a3
{
  id v3;
  PKPaymentAugmentSessionRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = objc_alloc_init(PKPaymentAugmentSessionRequest);
  -[PKPaymentAugmentBaseRequest setType:](v4, "setType:", objc_msgSend(v3, "type"));
  objc_msgSend(v3, "pass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAugmentBaseRequest setPass:](v4, "setPass:", v5);

  objc_msgSend(v3, "paymentApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAugmentBaseRequest setPaymentApplication:](v4, "setPaymentApplication:", v6);

  objc_msgSend(v3, "applet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAugmentBaseRequest setApplet:](v4, "setApplet:", v7);

  objc_msgSend(v3, "merchantCountryCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAugmentBaseRequest setMerchantCountryCode:](v4, "setMerchantCountryCode:", v8);

  objc_msgSend(v3, "currencyCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAugmentBaseRequest setCurrencyCode:](v4, "setCurrencyCode:", v9);

  objc_msgSend(v3, "boundInterfaceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKWebServiceRequest setBoundInterfaceIdentifier:](v4, "setBoundInterfaceIdentifier:", v10);
  return v4;
}

- (id)endpointComponents
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "addObject:", CFSTR("augmentSession"));
  if (-[PKPaymentAugmentBaseRequest type](self, "type") == 1)
    objc_msgSend(v3, "addObject:", CFSTR("payLater"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)bodyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentMerchantSession merchantIdentifier](self->_merchantSession, "merchantIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("merchantId"));

  -[PKPaymentMerchantSession merchantSessionIdentifier](self->_merchantSession, "merchantSessionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("merchantSessionId"));

  v9.receiver = self;
  v9.super_class = (Class)PKPaymentAugmentSessionRequest;
  -[PKPaymentAugmentBaseRequest bodyDictionary](&v9, sel_bodyDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v6);

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

- (PKPaymentMerchantSession)merchantSession
{
  return self->_merchantSession;
}

- (void)setMerchantSession:(id)a3
{
  objc_storeStrong((id *)&self->_merchantSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantSession, 0);
}

@end
