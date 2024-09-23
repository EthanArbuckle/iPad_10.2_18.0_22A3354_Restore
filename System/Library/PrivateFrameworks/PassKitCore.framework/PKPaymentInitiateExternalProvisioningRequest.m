@implementation PKPaymentInitiateExternalProvisioningRequest

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  NSString *cardIdentifier;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v20;
  id v21;
  const __CFString *v22;
  NSString *v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20 = CFSTR("devices");
  v21 = a4;
  cardIdentifier = self->_cardIdentifier;
  v22 = CFSTR("cards");
  v23 = cardIdentifier;
  v24 = CFSTR("initiateExternalProvisioning");
  v9 = (void *)MEMORY[0x1E0C99D20];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "arrayWithObjects:count:", &v20, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:version:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:version:endpointComponents:queryParameters:appleAccountInformation:", v12, CFSTR("2"), v13, 0, v10, v20, v21, v22, v23, v24, v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v14, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v15, "setObject:forKeyedSubscript:", self->_externalDestinationDevices, CFSTR("deviceSerialNumbers"));
  -[PKPaymentInitiateExternalProvisioningRequestDPANAuthorization dictionaryRepresentation](self->_authorization, "dictionaryRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("authorization"));
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHTTPBody:", v17);

  v18 = (void *)objc_msgSend(v14, "copy");
  return v18;
}

- (NSString)cardIdentifier
{
  return self->_cardIdentifier;
}

- (void)setCardIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)externalDestinationDevices
{
  return self->_externalDestinationDevices;
}

- (void)setExternalDestinationDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
  objc_storeStrong((id *)&self->_region, a3);
}

- (PKPaymentInitiateExternalProvisioningRequestDPANAuthorization)authorization
{
  return self->_authorization;
}

- (void)setAuthorization:(id)a3
{
  objc_storeStrong((id *)&self->_authorization, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorization, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_externalDestinationDevices, 0);
  objc_storeStrong((id *)&self->_cardIdentifier, 0);
}

@end
