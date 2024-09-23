@implementation PKPaymentServiceProviderPurchaseRequest

- (PKPaymentServiceProviderPurchaseRequest)initWithPurchaseIdentifier:(id)a3
{
  id v4;
  PKPaymentServiceProviderPurchaseRequest *v5;
  uint64_t v6;
  NSString *purchaseIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentServiceProviderPurchaseRequest;
  v5 = -[PKOverlayableWebServiceRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    purchaseIdentifier = v5->_purchaseIdentifier;
    v5->_purchaseIdentifier = (NSString *)v6;

  }
  return v5;
}

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  NSString *purchaseIdentifier;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  purchaseIdentifier = self->_purchaseIdentifier;
  v14[0] = CFSTR("purchase");
  v14[1] = purchaseIdentifier;
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v9, v10, 0, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setHTTPMethod:", CFSTR("POST"));
  v12 = (void *)objc_msgSend(v11, "copy");

  return v12;
}

- (NSString)purchaseIdentifier
{
  return self->_purchaseIdentifier;
}

- (void)setPurchaseIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseIdentifier, 0);
}

@end
