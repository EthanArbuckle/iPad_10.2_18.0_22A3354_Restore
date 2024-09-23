@implementation PKPaymentIssuerProvisioningCertificatesRequest

- (PKPaymentIssuerProvisioningCertificatesRequest)init
{

  return 0;
}

- (PKPaymentIssuerProvisioningCertificatesRequest)initWithEncryptionScheme:(id)a3
{
  id v4;
  PKPaymentIssuerProvisioningCertificatesRequest *v5;
  uint64_t v6;
  NSString *encryptionScheme;
  objc_super v9;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v9.receiver = self;
    v9.super_class = (Class)PKPaymentIssuerProvisioningCertificatesRequest;
    v5 = -[PKOverlayableWebServiceRequest init](&v9, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      encryptionScheme = v5->_encryptionScheme;
      v5->_encryptionScheme = (NSString *)v6;

    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  NSString *encryptionScheme;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v18;
  NSString *v19;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v20[0] = CFSTR("devices");
  v20[1] = a4;
  v20[2] = CFSTR("issuerProvisioningCertificates");
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", v20, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  encryptionScheme = self->_encryptionScheme;
  v18 = CFSTR("encryptionVersion");
  v19 = encryptionScheme;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v11, v12, v14, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setHTTPMethod:", CFSTR("GET"));
  objc_msgSend(v15, "setCachePolicy:", 1);
  v16 = (void *)objc_msgSend(v15, "copy");

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionScheme, 0);
}

@end
