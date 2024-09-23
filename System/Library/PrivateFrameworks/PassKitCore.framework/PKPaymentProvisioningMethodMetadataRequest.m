@implementation PKPaymentProvisioningMethodMetadataRequest

- (PKPaymentProvisioningMethodMetadataRequest)initWithProductIdentifier:(id)a3 provisioningMethod:(id)a4
{
  id v6;
  id v7;
  PKPaymentProvisioningMethodMetadataRequest *v8;
  uint64_t v9;
  NSString *productIdentifier;
  uint64_t v11;
  NSString *provisioningMethod;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentProvisioningMethodMetadataRequest;
  v8 = -[PKOverlayableWebServiceRequest init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    productIdentifier = v8->_productIdentifier;
    v8->_productIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    provisioningMethod = v8->_provisioningMethod;
    v8->_provisioningMethod = (NSString *)v11;

  }
  return v8;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  NSString *productIdentifier;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[7];

  v17[6] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("devices");
  v17[1] = a4;
  productIdentifier = self->_productIdentifier;
  v17[2] = CFSTR("products");
  v17[3] = productIdentifier;
  v17[4] = self->_provisioningMethod;
  v17[5] = CFSTR("provisioningMethod");
  v9 = (void *)MEMORY[0x1E0C99D20];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "arrayWithObjects:count:", v17, 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v12, v13, 0, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setHTTPMethod:", CFSTR("GET"));
  v15 = (void *)objc_msgSend(v14, "copy");

  return v15;
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setProductIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)provisioningMethod
{
  return self->_provisioningMethod;
}

- (void)setProvisioningMethod:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningMethod, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
}

@end
