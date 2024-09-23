@implementation PKPaymentTapToProvisionConfigurationRequest

- (PKPaymentTapToProvisionConfigurationRequest)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentTapToProvisionConfigurationRequest;
  return -[PKOverlayableWebServiceRequest init](&v3, sel_init);
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v16;
  id v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v16 = CFSTR("devices");
  v17 = a4;
  v18 = CFSTR("tapToProvisionConfiguration");
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v16, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:version:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:version:endpointComponents:queryParameters:appleAccountInformation:", v11, CFSTR("4"), v12, 0, v9, v16, v17, v18, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setHTTPMethod:", CFSTR("GET"));
  v14 = (void *)objc_msgSend(v13, "copy");

  return v14;
}

@end
