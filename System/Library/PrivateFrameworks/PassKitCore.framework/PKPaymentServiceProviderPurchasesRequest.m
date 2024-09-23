@implementation PKPaymentServiceProviderPurchasesRequest

- (PKPaymentServiceProviderPurchasesRequest)initWithPurchaseState:(id)a3 serviceProviderIdentifier:(id)a4 productIdentifier:(id)a5 actionIdentifier:(id)a6 serviceProviderCountryCode:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  PKPaymentServiceProviderPurchasesRequest *v17;
  uint64_t v18;
  NSString *purchaseState;
  uint64_t v20;
  NSString *serviceProviderIdentifier;
  uint64_t v22;
  NSString *productIdentifier;
  uint64_t v24;
  NSString *actionIdentifier;
  uint64_t v26;
  NSString *countryCode;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)PKPaymentServiceProviderPurchasesRequest;
  v17 = -[PKOverlayableWebServiceRequest init](&v29, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    purchaseState = v17->_purchaseState;
    v17->_purchaseState = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    serviceProviderIdentifier = v17->_serviceProviderIdentifier;
    v17->_serviceProviderIdentifier = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    productIdentifier = v17->_productIdentifier;
    v17->_productIdentifier = (NSString *)v22;

    v24 = objc_msgSend(v15, "copy");
    actionIdentifier = v17->_actionIdentifier;
    v17->_actionIdentifier = (NSString *)v24;

    v26 = objc_msgSend(v16, "copy");
    countryCode = v17->_countryCode;
    v17->_countryCode = (NSString *)v26;

  }
  return v17;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSString *purchaseState;
  NSString *serviceProviderIdentifier;
  NSString *productIdentifier;
  NSString *actionIdentifier;
  NSString *targetDeviceSerialNumber;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[3];
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0C99E08];
  v10 = a5;
  v11 = a3;
  objc_msgSend(v9, "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  purchaseState = self->_purchaseState;
  if (purchaseState)
    objc_msgSend(v12, "setObject:forKey:", purchaseState, CFSTR("state"));
  serviceProviderIdentifier = self->_serviceProviderIdentifier;
  if (serviceProviderIdentifier)
    objc_msgSend(v13, "setObject:forKey:", serviceProviderIdentifier, CFSTR("serviceProviderIdentifier"));
  productIdentifier = self->_productIdentifier;
  if (productIdentifier)
    objc_msgSend(v13, "setObject:forKey:", productIdentifier, CFSTR("productIdentifier"));
  actionIdentifier = self->_actionIdentifier;
  if (actionIdentifier)
    objc_msgSend(v13, "setObject:forKey:", actionIdentifier, CFSTR("actionIdentifier"));
  targetDeviceSerialNumber = self->_targetDeviceSerialNumber;
  if (targetDeviceSerialNumber)
  {
    v26 = CFSTR("targetDeviceSerialNumber");
    v27[0] = targetDeviceSerialNumber;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
  v25[0] = CFSTR("device");
  v25[1] = v8;
  v25[2] = CFSTR("purchases");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v11, v20, v13, v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setHTTPBody:", v22);

  objc_msgSend(v21, "setHTTPMethod:", CFSTR("POST"));
  v23 = (void *)objc_msgSend(v21, "copy");

  return v23;
}

- (NSString)purchaseState
{
  return self->_purchaseState;
}

- (void)setPurchaseState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)serviceProviderIdentifier
{
  return self->_serviceProviderIdentifier;
}

- (void)setServiceProviderIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setProductIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)setActionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)targetDeviceSerialNumber
{
  return self->_targetDeviceSerialNumber;
}

- (void)setTargetDeviceSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetDeviceSerialNumber, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_purchaseState, 0);
}

@end
