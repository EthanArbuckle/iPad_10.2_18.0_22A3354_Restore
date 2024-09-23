@implementation PKPaymentRepopulateZonesRequest

- (PKPaymentRepopulateZonesRequest)initWithCloudStoreZoneNames:(id)a3
{
  id v5;
  PKPaymentRepopulateZonesRequest *v6;
  PKPaymentRepopulateZonesRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentRepopulateZonesRequest;
  v6 = -[PKOverlayableWebServiceRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_cloudStoreZoneNames, a3);

  return v7;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  const __CFString *v18;
  id v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v18 = CFSTR("devices");
  v19 = v8;
  v20 = CFSTR("repopulateZones");
  v9 = (void *)MEMORY[0x1E0C99D20];
  v10 = a5;
  v11 = a3;
  objc_msgSend(v9, "arrayWithObjects:count:", &v18, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v11, v12, 0, v10, v18, v19, v20, v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setHTTPMethod:", CFSTR("POST"));
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (-[NSArray count](self->_cloudStoreZoneNames, "count"))
    objc_msgSend(v14, "setObject:forKey:", self->_cloudStoreZoneNames, CFSTR("cloudStoreZoneNames"));
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHTTPBody:", v15);

  v16 = (void *)objc_msgSend(v13, "copy");
  return v16;
}

- (NSArray)cloudStoreZoneNames
{
  return self->_cloudStoreZoneNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudStoreZoneNames, 0);
}

@end
