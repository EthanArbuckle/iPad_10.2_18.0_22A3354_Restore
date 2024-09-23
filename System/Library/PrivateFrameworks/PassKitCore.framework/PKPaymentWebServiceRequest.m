@implementation PKPaymentWebServiceRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_signRequest:(id)a3 webService:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "HTTPBody");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "SHA256Hash");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceRequest _signRequestData:forRequest:webService:completion:](self, "_signRequestData:forRequest:webService:completion:", v11, v10, v9, v8);

}

- (void)_signRequestData:(id)a3 forRequest:(id)a4 webService:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  PKLogFacilityTypeGetObject(6uLL);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v10 && v11)
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Signing request", buf, 2u);
    }

    objc_msgSend(v11, "targetDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __80__PKPaymentWebServiceRequest__signRequestData_forRequest_webService_completion___block_invoke;
    v16[3] = &unk_1E2ABDB80;
    v17 = v10;
    v18 = v12;
    objc_msgSend(v15, "paymentWebService:signData:signatureEntanglementMode:withCompletionHandler:", v11, v9, 1, v16);

  }
  else
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Error: No webservice or nil request. Could not sign request", buf, 2u);
    }

    if (v12)
      (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);
  }

}

void __80__PKPaymentWebServiceRequest__signRequestData_forRequest_webService_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void (*v12)(void);
  NSObject *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    PKLogFacilityTypeGetObject(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v14 = 138543362;
      v15 = v9;
      _os_log_error_impl(&dword_18FC92000, v10, OS_LOG_TYPE_ERROR, "Error: Error signing request :%{public}@", (uint8_t *)&v14, 0xCu);
    }

  }
  PKUpdateURLRequestWithSignatureDataAndInfo(*(void **)(a1 + 32), v7, v8);
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
  {
    if (v7)
    {
      v12 = *(void (**)(void))(v11 + 16);
    }
    else
    {
      PKLogFacilityTypeGetObject(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v14) = 0;
        _os_log_error_impl(&dword_18FC92000, v13, OS_LOG_TYPE_ERROR, "Error: Could not set x-apple-signature header no value", (uint8_t *)&v14, 2u);
      }

      v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    v12();
  }

}

- (id)_murlRequestWithURL:(id)a3
{
  void *v4;
  PKPaymentWebServiceTargetDeviceProtocol *targetDevice;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKPaymentWebServiceRequest;
  -[PKWebServiceRequest _murlRequestWithURL:](&v12, sel__murlRequestWithURL_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  targetDevice = self->_targetDevice;
  if (targetDevice)
  {
    -[PKPaymentWebServiceTargetDeviceProtocol secureElementIdentifiers](targetDevice, "secureElementIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebServiceTargetDeviceProtocol bridgedClientInfo](self->_targetDevice, "bridgedClientInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forHTTPHeaderField:", v7, CFSTR("X-Apple-Bridged-Client-Info"));

    -[PKPaymentWebServiceTargetDeviceProtocol deviceRegion](self->_targetDevice, "deviceRegion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forHTTPHeaderField:", v8, CFSTR("X-Apple-Device-Region"));

  }
  else
  {
    PKCurrentRegion();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forHTTPHeaderField:", v9, CFSTR("X-Apple-Device-Region"));

    +[PKSecureElement secureElementIdentifiers](PKSecureElement, "secureElementIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", v10, CFSTR("x-apple-seid"));

  return v4;
}

- (id)_murlRequestWithServiceURL:(id)a3 endpointComponents:(id)a4 queryParameters:(id)a5 appleAccountInformation:(id)a6
{
  return -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:version:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:version:endpointComponents:queryParameters:appleAccountInformation:", a3, CFSTR("4"), a4, a5, a6);
}

- (id)_murlRequestWithServiceURL:(id)a3 version:(id)a4 endpointComponents:(id)a5 queryParameters:(id)a6 appleAccountInformation:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v12 = (void *)MEMORY[0x1E0CB3940];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a3;
  objc_msgSend(v12, "stringWithFormat:", CFSTR("v%@"), a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URLByAppendingPathComponent:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v21.receiver = self;
  v21.super_class = (Class)PKPaymentWebServiceRequest;
  -[PKWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](&v21, sel__murlRequestWithServiceURL_endpointComponents_queryParameters_appleAccountInformation_, v18, v15, v14, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (PKPaymentWebServiceTargetDeviceProtocol)targetDevice
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
