@implementation PKVPANPaymentSessionRequest

- (PKVPANPaymentSessionRequest)initWithDeviceIdentifier:(id)a3
{
  id v4;
  PKVPANPaymentSessionRequest *v5;
  uint64_t v6;
  NSString *deviceIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKVPANPaymentSessionRequest;
  v5 = -[PKOverlayableWebServiceRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v6;

  }
  return v5;
}

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  NSString *deviceIdentifier;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  NSString *v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  deviceIdentifier = self->_deviceIdentifier;
  v13 = CFSTR("devices");
  v14 = deviceIdentifier;
  v15 = CFSTR("virtualCardPaymentSession");
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", &v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:version:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:version:endpointComponents:queryParameters:appleAccountInformation:", v9, CFSTR("1"), v10, 0, v8, v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setHTTPMethod:", CFSTR("POST"));
  return v11;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end
