@implementation PKAMPCardInfoForMerchantRequest

- (PKAMPCardInfoForMerchantRequest)initWithMerchantIdentifier:(id)a3
{
  id v4;
  PKAMPCardInfoForMerchantRequest *v5;
  uint64_t v6;
  NSString *merchantIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAMPCardInfoForMerchantRequest;
  v5 = -[PKOverlayableWebServiceRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    merchantIdentifier = v5->_merchantIdentifier;
    v5->_merchantIdentifier = (NSString *)v6;

  }
  return v5;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  NSString *merchantIdentifier;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v17;
  id v18;
  const __CFString *v19;
  NSString *v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = CFSTR("devices");
  v18 = a4;
  merchantIdentifier = self->_merchantIdentifier;
  v19 = CFSTR("merchant");
  v20 = merchantIdentifier;
  v21 = CFSTR("cardInfo");
  v9 = (void *)MEMORY[0x1E0C99D20];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "arrayWithObjects:count:", &v17, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v12, v13, 0, v10, v17, v18, v19, v20, v21, v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setHTTPMethod:", CFSTR("GET"));
  objc_msgSend(v14, "setCachePolicy:", 1);
  v15 = (void *)objc_msgSend(v14, "copy");

  return v15;
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
}

@end
