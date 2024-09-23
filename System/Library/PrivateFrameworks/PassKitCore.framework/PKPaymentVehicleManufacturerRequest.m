@implementation PKPaymentVehicleManufacturerRequest

+ (id)requestMetadataWithPartnerIdentifier:(id)a3 brandIdentifier:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  PKPartnerIdentifierOverride();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = v5;
  v10 = v9;
  if (objc_msgSend(v8, "length"))
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = v8;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Overriding partner identifier with value %@ (was %@)", (uint8_t *)&v15, 0x16u);
    }

  }
  v12 = 0;
  if (v6 && v10)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, CFSTR("partnerID"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v6, CFSTR("brand"));
    v12 = (void *)objc_msgSend(v13, "copy");

  }
  return v12;
}

- (PKPaymentVehicleManufacturerRequest)initWithInvitation:(id)a3 encryptedVehicleDataRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  PKPaymentVehicleManufacturerRequest *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "partnerIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "brandIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentVehicleManufacturerRequest initWithPartnerIdentifier:brandIdentifier:encryptedVehicleDataRequest:](self, "initWithPartnerIdentifier:brandIdentifier:encryptedVehicleDataRequest:", v8, v9, v6);
  return v10;
}

- (PKPaymentVehicleManufacturerRequest)initWithPartnerIdentifier:(id)a3 brandIdentifier:(id)a4 encryptedVehicleDataRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKPaymentVehicleManufacturerRequest *v11;
  uint64_t v12;
  NSDictionary *encryptedVehicleDataRequest;
  uint64_t v14;
  NSDictionary *metadata;
  PKPaymentVehicleManufacturerRequest *v16;
  NSObject *v17;
  const char *v18;
  uint8_t v20[16];
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentVehicleManufacturerRequest;
  v11 = -[PKOverlayableWebServiceRequest init](&v21, sel_init);
  if (!v11)
    goto LABEL_4;
  dictionaryFromSubcredentialEncryptedRequest(v10);
  v12 = objc_claimAutoreleasedReturnValue();
  encryptedVehicleDataRequest = v11->_encryptedVehicleDataRequest;
  v11->_encryptedVehicleDataRequest = (NSDictionary *)v12;

  if (!v11->_encryptedVehicleDataRequest)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      v18 = "Missing encryptedVehicleDataRequest on vehicle manufacturer request";
LABEL_9:
      _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, v18, v20, 2u);
    }
LABEL_10:

    v16 = 0;
    goto LABEL_11;
  }
  objc_msgSend((id)objc_opt_class(), "requestMetadataWithPartnerIdentifier:brandIdentifier:", v8, v9);
  v14 = objc_claimAutoreleasedReturnValue();
  metadata = v11->_metadata;
  v11->_metadata = (NSDictionary *)v14;

  if (!v11->_metadata)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      v18 = "Missing metadata on vehicle manufacturer request";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
LABEL_4:
  v16 = v11;
LABEL_11:

  return v16;
}

- (id)requestBody
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_encryptedVehicleDataRequest, CFSTR("vehicleData"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_metadata, CFSTR("metadata"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
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
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v19;
  id v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v19 = CFSTR("devices");
  v20 = a4;
  v21 = CFSTR("vehicleManufacturerData");
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v19, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v11, v12, 0, v9, v19, v20, v21, v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setHTTPMethod:", CFSTR("POST"));
  v14 = (void *)objc_opt_class();
  -[PKPaymentVehicleManufacturerRequest requestBody](self, "requestBody");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_HTTPBodyWithDictionary:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHTTPBody:", v16);

  v17 = (void *)objc_msgSend(v13, "copy");
  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_encryptedVehicleDataRequest, 0);
}

@end
