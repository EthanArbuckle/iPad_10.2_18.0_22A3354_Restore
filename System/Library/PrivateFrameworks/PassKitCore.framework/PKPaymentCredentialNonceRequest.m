@implementation PKPaymentCredentialNonceRequest

- (PKPaymentCredentialNonceRequest)initWithPaymentPass:(id)a3 deviceIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PKPaymentCredentialNonceRequest *v10;
  PKPaymentCredentialNonceRequest *v11;
  uint64_t v12;
  NSString *deviceIdentifier;
  PKPaymentCredentialNonceRequest *v14;
  NSObject *v15;
  const char *v16;
  const char *v17;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7 && v8)
  {
    v19.receiver = self;
    v19.super_class = (Class)PKPaymentCredentialNonceRequest;
    v10 = -[PKOverlayableWebServiceRequest init](&v19, sel_init);
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_paymentPass, a3);
      v12 = objc_msgSend(v9, "copy");
      deviceIdentifier = v11->_deviceIdentifier;
      v11->_deviceIdentifier = (NSString *)v12;

    }
    self = v11;
    v14 = self;
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = "not nil";
      if (v7)
        v17 = "not nil";
      else
        v17 = "nil";
      if (!v9)
        v16 = "nil";
      *(_DWORD *)buf = 136315394;
      v21 = v17;
      v22 = 2080;
      v23 = v16;
      _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Couldn't make nonce request: Pass is %s. Device ID is %s", buf, 0x16u);
    }

    v14 = 0;
  }

  return v14;
}

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  NSString *deviceIdentifier;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  deviceIdentifier = self->_deviceIdentifier;
  v19[0] = CFSTR("devices");
  v19[1] = deviceIdentifier;
  v19[2] = CFSTR("nOnce");
  v19[3] = CFSTR("paymentCredential");
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", v19, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:version:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:version:endpointComponents:queryParameters:appleAccountInformation:", v9, CFSTR("1"), v10, 0, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setHTTPMethod:", CFSTR("POST"));
  v17[0] = CFSTR("passSerialNumber");
  -[PKPass serialNumber](self->_paymentPass, "serialNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = CFSTR("passTypeIdentifier");
  v18[0] = v12;
  -[PKPass passTypeIdentifier](self->_paymentPass, "passTypeIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHTTPBody:", v15);

  return v11;
}

- (PKSecureElementPass)paymentPass
{
  return self->_paymentPass;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
}

@end
