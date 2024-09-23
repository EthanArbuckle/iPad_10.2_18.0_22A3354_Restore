@implementation PKPaymentNonceRequest

- (id)_legacyGetURLRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PKPaymentAugmentBaseRequest pass](self, "pass");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "passTypeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "serialNumber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", CFSTR("devices"), v9, 0);

  if (!-[PKPaymentAugmentBaseRequest type](self, "type"))
  {
    objc_msgSend(v14, "addObject:", CFSTR("passes"));
    objc_msgSend(v14, "addObject:", v12);
    objc_msgSend(v14, "addObject:", v13);
  }
  -[PKPaymentNonceRequest endpointComponents](self, "endpointComponents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
    objc_msgSend(v14, "addObjectsFromArray:", v15);
  v16 = (void *)objc_msgSend(v14, "copy");
  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v10, v16, 0, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setHTTPMethod:", CFSTR("GET"));
  v18 = (void *)objc_msgSend(v17, "copy");

  return v18;
}

+ (id)nonceRequestWithBaseRequest:(id)a3
{
  id v3;
  PKPaymentNonceRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = objc_alloc_init(PKPaymentNonceRequest);
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
  objc_msgSend(v3, "addObject:", CFSTR("nOnce"));
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
  void *v8;
  objc_super v10;

  -[NSString dataUsingEncoding:](self->_merchantIdentifier, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "SHA256Hash");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hexEncoding");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v5, CFSTR("merchantId"));
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentNonceRequest;
  -[PKPaymentAugmentBaseRequest bodyDictionary](&v10, sel_bodyDictionary);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEntriesFromDictionary:", v7);

  v8 = (void *)objc_msgSend(v6, "copy");
  return v8;
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (BOOL)useLegacyGetAPI
{
  return self->_useLegacyGetAPI;
}

- (void)setUseLegacyGetAPI:(BOOL)a3
{
  self->_useLegacyGetAPI = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
}

@end
