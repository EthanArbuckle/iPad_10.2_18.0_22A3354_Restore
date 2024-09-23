@implementation PKPaymentRegisterCredentialRequest

+ (id)requestMetadataFromRegistrationMetadata:(id)a3 withCredential:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    if (objc_msgSend(v6, "productType"))
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(a1, "requestMetadataFromCarKeyRegistrationMetadata:withCredential:", v6, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v9;
}

+ (id)requestMetadataFromCarKeyRegistrationMetadata:(id)a3 withCredential:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  PKPartnerIdentifierOverride();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "partnerIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138412546;
      v24 = v7;
      v25 = 2112;
      v26 = v8;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Overriding partner identifier with value %@ (was %@)", (uint8_t *)&v23, 0x16u);
    }

    v10 = v7;
    v8 = v10;
  }
  v11 = 0;
  if (v5 && v8)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("car"), CFSTR("category"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, CFSTR("partnerID"));
    objc_msgSend(v6, "brandIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("brand"));

    PKAppletSubcredentialCarKeyVehicleVersionToString(objc_msgSend(v6, "carKeyVehicleVersion"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("deviceVehicleServerVersion"));

    PKAppletSubcredentialCarKeyServerVersionToString(objc_msgSend(v6, "carKeyServerVersion"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("vehicleOwnerDeviceFrameworkVersion"));

    PKAppletSubcredentialKeyClassToString(objc_msgSend(v6, "keyClass"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("keyClass"));

    PKAppletSubcredentialCredentialAuthorityTypeToString(objc_msgSend(v6, "credentialAuthorityType"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("keyOrigin"));

    v18 = objc_msgSend(v5, "keyType");
    if (v18)
    {
      if (v18 != 1)
      {
LABEL_12:
        objc_msgSend(v5, "make");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, CFSTR("make"));

        objc_msgSend(v5, "model");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, CFSTR("model"));

        v11 = (void *)objc_msgSend(v12, "copy");
        goto LABEL_13;
      }
      v19 = CFSTR("SHARED");
    }
    else
    {
      v19 = CFSTR("OWNER");
    }
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, CFSTR("type"));
    goto LABEL_12;
  }
LABEL_13:

  return v11;
}

- (PKPaymentRegisterCredentialRequest)initWithCredential:(id)a3 metadata:(id)a4
{
  id v7;
  id v8;
  PKPaymentRegisterCredentialRequest *v9;
  PKPaymentRegisterCredentialRequest *v10;
  uint64_t v11;
  NSString *credentialIdentifier;
  uint64_t v13;
  NSDictionary *metadata;
  PKPaymentRegisterCredentialRequest *v15;
  NSObject *v16;
  void *v17;
  objc_super v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentRegisterCredentialRequest;
  v9 = -[PKOverlayableWebServiceRequest init](&v19, sel_init);
  v10 = v9;
  if (!v9)
    goto LABEL_4;
  objc_storeStrong((id *)&v9->_credential, a3);
  objc_msgSend(v7, "identifier");
  v11 = objc_claimAutoreleasedReturnValue();
  credentialIdentifier = v10->_credentialIdentifier;
  v10->_credentialIdentifier = (NSString *)v11;

  if (!v10->_credentialIdentifier)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v7;
      _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Missing credential identifier on register request: %@", buf, 0xCu);
    }
    goto LABEL_9;
  }
  objc_msgSend((id)objc_opt_class(), "requestMetadataFromRegistrationMetadata:withCredential:", v8, v7);
  v13 = objc_claimAutoreleasedReturnValue();
  metadata = v10->_metadata;
  v10->_metadata = (NSDictionary *)v13;

  if (!v10->_metadata)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "partnerIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v8;
      v22 = 2112;
      v23 = v17;
      _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Invalid metadata/partner identifier on register request: %@, %@", buf, 0x16u);

    }
LABEL_9:

    v15 = 0;
    goto LABEL_10;
  }
LABEL_4:
  v15 = v10;
LABEL_10:

  return v15;
}

- (id)requestBody
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PKPaymentRegisterCredentialRequest buildRequestBody:](self, "buildRequestBody:", v3);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (void)buildRequestBody:(id)a3
{
  NSString *credentialIdentifier;
  id v5;

  credentialIdentifier = self->_credentialIdentifier;
  v5 = a3;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", credentialIdentifier, CFSTR("keyID"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_metadata, CFSTR("keyMetadata"));

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
  v21 = CFSTR("registerKey");
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
  -[PKPaymentRegisterCredentialRequest requestBody](self, "requestBody");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_HTTPBodyWithDictionary:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHTTPBody:", v16);

  v17 = (void *)objc_msgSend(v13, "copy");
  return v17;
}

- (PKAppletSubcredential)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
  objc_storeStrong((id *)&self->_credential, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
}

@end
