@implementation PKPaymentAugmentBaseRequest

- (PKPaymentAugmentBaseRequest)initWithPaymentPass:(id)a3
{
  id v5;
  PKPaymentAugmentBaseRequest *v6;
  PKPaymentAugmentBaseRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentAugmentBaseRequest;
  v6 = -[PKOverlayableWebServiceRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_pass, a3);

  return v7;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
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
  void *v19;
  void *v20;
  void *v21;

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

  if (!self->_type)
  {
    objc_msgSend(v14, "addObject:", CFSTR("passes"));
    objc_msgSend(v14, "addObject:", v12);
    objc_msgSend(v14, "addObject:", v13);
  }
  -[PKPaymentAugmentBaseRequest endpointComponents](self, "endpointComponents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
    objc_msgSend(v14, "addObjectsFromArray:", v15);
  v16 = (void *)objc_msgSend(v14, "copy");
  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v10, v16, 0, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setHTTPMethod:", CFSTR("POST"));
  v18 = (void *)objc_opt_class();
  -[PKPaymentAugmentBaseRequest bodyDictionary](self, "bodyDictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_HTTPBodyWithDictionary:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setHTTPBody:", v20);

  v21 = (void *)objc_msgSend(v17, "copy");
  return v21;
}

- (id)endpointComponents
{
  return 0;
}

- (id)bodyDictionary
{
  id v3;
  void *v4;
  NSString *merchantCountryCode;
  PKPaymentPass *pass;
  void *v7;
  NSString *currencyCode;
  PKSecureElementApplet *applet;
  void *v10;
  PKPaymentApplication *paymentApplication;
  void *v12;
  PKPaymentPass *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  merchantCountryCode = self->_merchantCountryCode;
  if (merchantCountryCode)
    objc_msgSend(v3, "setObject:forKey:", merchantCountryCode, CFSTR("merchantCountryCode"));
  pass = self->_pass;
  if (pass)
  {
    -[PKSecureElementPass issuerCountryCode](pass, "issuerCountryCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("issuerCountryCode"));

  }
  currencyCode = self->_currencyCode;
  if (currencyCode)
    objc_msgSend(v4, "setObject:forKey:", currencyCode, CFSTR("currencyCode"));
  applet = self->_applet;
  if (applet)
  {
    -[PKSecureElementApplet jsonDictionaryRepresentation](applet, "jsonDictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("appletInfo"));

  }
  paymentApplication = self->_paymentApplication;
  if (paymentApplication)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PKPaymentApplication paymentNetworkIdentifier](paymentApplication, "paymentNetworkIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("paymentNetworkIdentifier"));

  }
  if (self->_type == 1)
  {
    v13 = self->_pass;
    if (v13)
    {
      -[PKPass serialNumber](v13, "serialNumber");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("passSerialNumber"));

      -[PKPass passTypeIdentifier](self->_pass, "passTypeIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("passTypeIdentifier"));

    }
  }
  v16 = (void *)objc_msgSend(v4, "copy");

  return v16;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
  objc_storeStrong((id *)&self->_pass, a3);
}

- (PKPaymentApplication)paymentApplication
{
  return self->_paymentApplication;
}

- (void)setPaymentApplication:(id)a3
{
  objc_storeStrong((id *)&self->_paymentApplication, a3);
}

- (PKSecureElementApplet)applet
{
  return self->_applet;
}

- (void)setApplet:(id)a3
{
  objc_storeStrong((id *)&self->_applet, a3);
}

- (NSString)merchantCountryCode
{
  return self->_merchantCountryCode;
}

- (void)setMerchantCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_merchantCountryCode, 0);
  objc_storeStrong((id *)&self->_applet, 0);
  objc_storeStrong((id *)&self->_paymentApplication, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
