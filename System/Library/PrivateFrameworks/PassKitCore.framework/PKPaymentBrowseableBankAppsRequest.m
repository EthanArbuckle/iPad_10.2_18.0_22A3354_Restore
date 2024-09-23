@implementation PKPaymentBrowseableBankAppsRequest

- (PKPaymentBrowseableBankAppsRequest)initWithRegion:(id)a3
{
  id v4;
  PKPaymentBrowseableBankAppsRequest *v5;
  uint64_t v6;
  NSString *region;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentBrowseableBankAppsRequest;
  v5 = -[PKOverlayableWebServiceRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    region = v5->_region;
    v5->_region = (NSString *)v6;

  }
  return v5;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  NSString *region;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  region = self->_region;
  v19 = CFSTR("region");
  v20[0] = region;
  v9 = (void *)MEMORY[0x1E0C99D80];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = CFSTR("devices");
  v18[1] = v11;
  v18[2] = CFSTR("partners");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v12, v14, v13, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setHTTPMethod:", CFSTR("GET"));
  v16 = (void *)objc_msgSend(v15, "copy");

  return v16;
}

- (NSString)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_region, 0);
}

@end
