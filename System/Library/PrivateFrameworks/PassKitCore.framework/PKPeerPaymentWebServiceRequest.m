@implementation PKPeerPaymentWebServiceRequest

- (id)_murlRequestWithServiceURL:(id)a3 endpointComponents:(id)a4 queryParameters:(id)a5 appleAccountInformation:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  objc_super v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("v4"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)PKPeerPaymentWebServiceRequest;
  -[PKWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](&v16, sel__murlRequestWithServiceURL_endpointComponents_queryParameters_appleAccountInformation_, v13, v12, v11, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  return 0;
}

- (id)_murlRequestWithURL:(id)a3
{
  void *v4;
  PKPeerPaymentWebServiceTargetDeviceProtocol *targetDevice;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKPeerPaymentWebServiceRequest;
  -[PKWebServiceRequest _murlRequestWithURL:](&v12, sel__murlRequestWithURL_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  targetDevice = self->_targetDevice;
  if (!targetDevice
    || (-[PKPeerPaymentWebServiceTargetDeviceProtocol bridgedClientInfo](targetDevice, "bridgedClientInfo"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "setValue:forHTTPHeaderField:", v6, CFSTR("X-Apple-Bridged-Client-Info")),
        v6,
        -[PKPeerPaymentWebServiceTargetDeviceProtocol secureElementIdentifiers](self->_targetDevice, "secureElementIdentifiers"), (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    +[PKSecureElement secureElementIdentifiers](PKSecureElement, "secureElementIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(","));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", v8, CFSTR("x-apple-seid"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PKPeerPaymentWebServiceTargetDeviceProtocol deviceRegion](self->_targetDevice, "deviceRegion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forHTTPHeaderField:", v9, CFSTR("X-Apple-Device-Region"));

  }
  PKRequestFireWireIDHeaderValue();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
    objc_msgSend(v4, "setValue:forHTTPHeaderField:", v10, CFSTR("x-firewire-id"));

  return v4;
}

- (PKPeerPaymentWebServiceTargetDeviceProtocol)targetDevice
{
  return self->_targetDevice;
}

- (void)setTargetDevice:(id)a3
{
  objc_storeStrong((id *)&self->_targetDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetDevice, 0);
}

@end
